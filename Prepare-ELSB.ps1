#requires -Version 5.1
<#
.SYNOPSIS
Find and verify local ELSB payloads, then optionally assemble the installer ZIP.
.DESCRIPTION
Reads game and source folders without changing them. Only verified, missing
files are copied into this checkout. Existing mismatched files are not replaced.
Game detection uses Steam, GOG and Epic installation records. Also searches
nearby installer ZIPs and Downloads. Use -SourcePath for other folders or ZIPs.
With no arguments, confirms the detected game folder and prompts for missing
sources and optional ZIP assembly. Complete Nexus packages do not need this step.
.EXAMPLE
.\Prepare-ELSB.ps1 -Plan
.EXAMPLE
.\Prepare-ELSB.ps1 -GamePath 'D:\Games\The Blood of Dawnwalker' -SourcePath 'D:\Downloads\ELSB.zip' -Build
#>
[CmdletBinding()]
param([string]$GamePath, [string[]]$SourcePath=@(), [switch]$Plan, [switch]$Build,
      [switch]$Interactive, [switch]$NonInteractive)
$interactiveMode = -not $NonInteractive -and ($Interactive -or $PSBoundParameters.Count -eq 0)
$ErrorActionPreference='Stop'
Add-Type -AssemblyName System.IO.Compression.FileSystem
Add-Type -AssemblyName System.IO.Compression
$root=[IO.Path]::GetFullPath($PSScriptRoot).TrimEnd('\')

function Get-GameRoot([string]$Path) {
    if (-not $Path) { return }
    $p=[IO.Path]::GetFullPath($Path)
    if (Test-Path -LiteralPath $p -PathType Leaf) { $p=Split-Path -Parent $p }
    while ($p) {
        if (Test-Path -LiteralPath (Join-Path $p 'Dawnwalker/Binaries/Win64/Dawnwalker.exe') -PathType Leaf) { return $p }
        $p=Split-Path -Parent $p
    }
}
function Find-Games {
    $steam=@("${env:ProgramFiles(x86)}\Steam")
    foreach ($key in 'HKCU:\Software\Valve\Steam','HKLM:\SOFTWARE\WOW6432Node\Valve\Steam','HKLM:\SOFTWARE\Valve\Steam') {
        $item=Get-ItemProperty -LiteralPath $key -ErrorAction SilentlyContinue
        foreach ($name in 'SteamPath','InstallPath') { if ($item.$name) { $steam += $item.$name } }
    }
    $bases=@()
    foreach ($path in ($steam | Select-Object -Unique)) {
        $libraries=@($path)
        $vdf=Join-Path $path 'steamapps/libraryfolders.vdf'
        if (Test-Path -LiteralPath $vdf) {
            foreach ($match in [regex]::Matches([IO.File]::ReadAllText($vdf),'"path"\s+"([^"]+)"')) { $libraries += $match.Groups[1].Value.Replace('\\','\') }
        }
        foreach ($library in $libraries) { $bases += Join-Path $library 'steamapps/common/The Blood of Dawnwalker' }
    }
    foreach ($key in 'HKLM:\SOFTWARE\WOW6432Node\GOG.com\Games','HKLM:\SOFTWARE\GOG.com\Games') {
        foreach ($item in (Get-ChildItem -LiteralPath $key -ErrorAction SilentlyContinue)) {
            $p=(Get-ItemProperty -LiteralPath $item.PSPath -ErrorAction SilentlyContinue).path
            if ($p) { $bases += $p }
        }
    }
    if ($env:ProgramData) {
        $epic=Join-Path $env:ProgramData 'Epic/EpicGamesLauncher/Data/Manifests'
        foreach ($file in (Get-ChildItem -LiteralPath $epic -Filter '*.item' -File -ErrorAction SilentlyContinue)) {
            try { $p=(Get-Content -LiteralPath $file.FullName -Raw | ConvertFrom-Json).InstallLocation; if ($p) { $bases += $p } } catch { }
        }
    }
    foreach ($base in ($bases | Select-Object -Unique)) { Get-GameRoot $base }
}
function Get-SafeTarget([string]$Relative) {
    if ($Relative -match '(^/|\\|:|(^|/)\.\.?(/|$))') { throw "Unsafe package path: $Relative" }
    $p=[IO.Path]::GetFullPath((Join-Path $root $Relative))
    if (-not $p.StartsWith($root+'\',[StringComparison]::OrdinalIgnoreCase)) { throw "Path outside checkout: $Relative" }
    $check=$p
    while ($check) {
        if (Test-Path -LiteralPath $check) {
            if ((Get-Item -LiteralPath $check -Force).Attributes -band [IO.FileAttributes]::ReparsePoint) { throw "Linked destination: $Relative" }
        }
        $check=Split-Path -Parent $check
    }
    return $p
}
function Get-StreamHash($Stream) {
    $sha=[Security.Cryptography.SHA256]::Create()
    try { return ([BitConverter]::ToString($sha.ComputeHash($Stream))).Replace('-','').ToLowerInvariant() } finally { $sha.Dispose() }
}
function Get-FileHashValue([string]$Path) {
    $stream=[IO.File]::OpenRead($Path)
    try { Get-StreamHash $stream } finally { $stream.Dispose() }
}
function Get-SourceFiles([string]$Path) {
    $item=Get-Item -LiteralPath $Path -Force -ErrorAction SilentlyContinue
    if (-not $item -or ($item.Attributes -band [IO.FileAttributes]::ReparsePoint)) { return }
    if (-not $item.PSIsContainer) { $item; return }
    $queue=New-Object 'Collections.Generic.Queue[string]'
    $queue.Enqueue($item.FullName)
    while ($queue.Count) {
        foreach ($child in (Get-ChildItem -LiteralPath $queue.Dequeue() -Force -ErrorAction SilentlyContinue)) {
            if ($child.Attributes -band [IO.FileAttributes]::ReparsePoint) { continue }
            if ($child.PSIsContainer) {
                if ($child.Name -notin '.git','.local','node_modules') { $queue.Enqueue($child.FullName) }
            } else { $child }
        }
    }
}
function Read-PreparationAnswer([string]$Prompt) {
    if ([Console]::IsInputRedirected) {
        Write-Host ($Prompt+': ') -NoNewline
        $answer=[Console]::ReadLine()
        if ($null -eq $answer) { throw 'Input ended. Preparation cancelled; use -NonInteractive for automation.' }
        return $answer.Trim()
    }
    return (Read-Host $Prompt).Trim()
}
function Select-PreparationGame([string[]]$Candidates) {
    $current=if ($Candidates.Count) { $Candidates[0] } else { '' }
    while ($true) {
        if ($current) {
            Write-Host ('Game folder: '+$current)
            $answer=Read-PreparationAnswer 'Enter = accept, C = change, S = use archives only, Q = quit'
            if ($answer -eq '' -or $answer -ieq 'Y') { return $current }
            if ($answer -ieq 'Q') { throw 'Preparation cancelled.' }
            if ($answer -ieq 'S') { return '' }
            if ($answer -ine 'C') { Write-Host 'Choose Enter, C, S or Q.'; continue }
        } else { Write-Host 'Choose a game folder, or use archives only.' }
        $current=''
        $path=Read-PreparationAnswer 'Paste the game folder path, S to use archives only, or Q to quit'
        if ($path -ieq 'Q') { throw 'Preparation cancelled.' }
        if ($path -ieq 'S') { return '' }
        $resolved=$null
        try { $resolved=Get-GameRoot ($path.Trim('"')) } catch { }
        if ($resolved) { $current=$resolved }
        else { Write-Host 'That folder does not contain Dawnwalker/Binaries/Win64/Dawnwalker.exe. Try again.' }
    }
}

try {
    if ($Interactive -and $NonInteractive) { throw 'Use -Interactive or -NonInteractive separately.' }
    if ($Plan -and $Build) { throw 'Use -Plan or -Build separately. Plan never writes files.' }
    $games=@(Find-Games | Select-Object -Unique)
    if ($GamePath) {
        $explicit=Get-GameRoot $GamePath
        if (-not $explicit) { throw 'GamePath must identify a Dawnwalker installation containing Dawnwalker/Binaries/Win64/Dawnwalker.exe.' }
        $games=@($explicit)+$games | Select-Object -Unique
    }
    if (Get-GameRoot $root) { throw 'Extract this source checkout outside the game before preparing it.' }
    if ($interactiveMode) {
        Write-Host 'ELSB preparation - Nexus users with the complete package can skip this step.'
        $selectedGame=Select-PreparationGame $games
        $games=@(); if ($selectedGame) { $games=@($selectedGame) }
    }
    Write-Host ('Detected game installations: '+$games.Count)
    foreach ($game in $games) { Write-Host ('  '+$game) }
    $manifest=Get-Content -LiteralPath (Join-Path $root 'Provenance/package-assets.json') -Raw | ConvertFrom-Json
    if ($manifest.schemaVersion -ne 1) { throw 'Unsupported asset manifest.' }
    $assets=@($manifest.assets); $seen=@{}; $needed=@{}; $available=@{}; $missing=@(); $conflicts=@()
    foreach ($asset in $assets) {
        if ($asset.path -notmatch '^(Payload/.*\.(pak|ucas|utoc)|fomod/images/.+\.jpg|assets/[^/]+\.(jpg|png))$' -or $asset.sha256 -notmatch '^[a-f0-9]{64}$' -or $asset.bytes -lt 0) { throw 'Invalid asset manifest entry.' }
        if ($seen.ContainsKey($asset.path)) { throw ('Duplicate asset path: '+$asset.path) }; $seen[$asset.path]=$true
        $target=Get-SafeTarget $asset.path
        if (Test-Path -LiteralPath $target) {
            $file=Get-Item -LiteralPath $target
            if ($file.PSIsContainer -or $file.Length -ne $asset.bytes -or (Get-FileHashValue $target) -ne $asset.sha256) { $conflicts += $asset.path }
            else { $available[$asset.sha256]=@{file=$target;entry=$null} }
        } else { $missing += $asset; $needed[$asset.sha256]=$asset }
    }
    if ($conflicts.Count) { throw ('Existing files differ from the manifest; preserve or move them before retrying: '+($conflicts -join ', ')) }
    $sizes=@{}; foreach ($asset in $missing) { $sizes[[string]$asset.bytes]=$true }
    $sources=@($games)+@($SourcePath)
    foreach ($path in $SourcePath) { if (-not (Test-Path -LiteralPath $path)) { throw "SourcePath does not exist: $path" } }
    $nearby=@($root,(Split-Path -Parent $root))
    $nearby += Join-Path (Split-Path -Parent $root) '[Mods] Latest Archives'
    if ($env:USERPROFILE) { $nearby += Join-Path $env:USERPROFILE 'Downloads' }
    foreach ($directory in $nearby) {
        $sources += @(Get-ChildItem -LiteralPath $directory -Filter '*ELSB*.zip' -File -ErrorAction SilentlyContinue | ForEach-Object { $_.FullName })
    }
    $scanned=@{}
    while ($true) {
    foreach ($source in ($sources | Select-Object -Unique)) {
        if (@($needed.Keys | Where-Object { -not $available.ContainsKey($_) }).Count -eq 0) { break }
        Write-Host ('Searching '+$source)
        foreach ($file in (Get-SourceFiles $source)) {
            if ($scanned.ContainsKey($file.FullName)) { continue }; $scanned[$file.FullName]=$true
            if ($file.Extension -ieq '.zip') {
                $zip=$null
                try {
                    $zip=[IO.Compression.ZipFile]::OpenRead($file.FullName)
                    foreach ($entry in $zip.Entries) {
                        if (-not $sizes.ContainsKey([string]$entry.Length) -or $entry.Name -notmatch '\.(pak|ucas|utoc|jpg|png)$') { continue }
                        $stream=$entry.Open(); try { $hash=Get-StreamHash $stream } finally { $stream.Dispose() }
                        if ($needed.ContainsKey($hash) -and -not $available.ContainsKey($hash)) { $available[$hash]=@{file=$file.FullName;entry=$entry.FullName} }
                    }
                } catch { Write-Warning ('Could not read ZIP '+$file.FullName+': '+$_.Exception.Message) }
                finally { if ($zip) { $zip.Dispose() } }
            } elseif ($sizes.ContainsKey([string]$file.Length) -and $file.Extension -match '^\.(pak|ucas|utoc|jpg|png)$') {
                $hash=Get-FileHashValue $file.FullName
                if ($needed.ContainsKey($hash) -and -not $available.ContainsKey($hash)) { $available[$hash]=@{file=$file.FullName;entry=$null} }
            }
        }
    }
    $unavailable=@($missing | Where-Object { -not $available.ContainsKey($_.sha256) })
    if (-not $unavailable.Count -or -not $interactiveMode) { break }
    Write-Host ($unavailable.Count.ToString()+' required files are still missing. The game alone does not contain every mod alternative.')
    Write-Host 'Provide a matching complete ELSB ZIP or extracted folder. No files have been copied yet.'
    $additional=(Read-PreparationAnswer 'Paste a ZIP or folder path, or Q to quit').Trim('"')
    if ($additional -eq '' -or $additional -ieq 'Q') { throw 'Preparation cancelled; no files copied.' }
    if (-not (Test-Path -LiteralPath $additional)) { Write-Host 'That path does not exist. Try again.'; $sources=@(); continue }
    $sources=@($additional); $scanned=@{}
    }
    if ($unavailable.Count) {
        Write-Host 'Missing exact payloads (no files have been copied):'
        $unavailable | ForEach-Object { Write-Host ('  '+$_.path) }
        throw ('Missing '+$unavailable.Count+' files. Provide a matching complete ELSB ZIP or extracted payload with -SourcePath. The game alone does not contain all mod alternatives. No assets are generated or modified by this script.')
    }
    if ($Plan) { Write-Output ('Verified plan: '+($assets.Count-$missing.Count)+' files present; '+$missing.Count+' files available to copy. No files written.'); return }
    $stage=Join-Path $root ('.prepare-'+[guid]::NewGuid().ToString('N'))
    $installed=@()
    try {
        if ($missing.Count) { [IO.Directory]::CreateDirectory($stage) | Out-Null }
        $index=0
        foreach ($asset in $missing) {
            $origin=$available[$asset.sha256]; $temp=Join-Path $stage ([string]$index); $index++
            if ($null -ne $origin.entry) {
                $zip=[IO.Compression.ZipFile]::OpenRead($origin.file)
                try {
                    $entry=$zip.GetEntry($origin.entry); if (-not $entry) { throw 'Source ZIP changed during preparation.' }
                    $inStream=$entry.Open(); $outStream=[IO.File]::Create($temp)
                    try { $inStream.CopyTo($outStream) } finally { $inStream.Dispose(); $outStream.Dispose() }
                } finally { $zip.Dispose() }
            } else { [IO.File]::Copy($origin.file,$temp,$false) }
            if ((Get-Item -LiteralPath $temp).Length -ne $asset.bytes -or (Get-FileHashValue $temp) -ne $asset.sha256) { throw ('Source changed during preparation: '+$asset.path) }
        }
        $index=0
        foreach ($asset in $missing) {
            $target=Get-SafeTarget $asset.path
            [IO.Directory]::CreateDirectory((Split-Path -Parent $target)) | Out-Null
            [IO.File]::Move((Join-Path $stage ([string]$index)),$target); $index++; $installed += $target
        }
    } catch {
        foreach ($path in $installed) { [IO.File]::Delete($path) }
        throw
    } finally {
        if (Test-Path -LiteralPath $stage) { [IO.Directory]::Delete($stage,$true) }
    }
    Write-Host ('Verified '+$assets.Count+' assets; copied '+$missing.Count+' files into this checkout.')
    if ($interactiveMode -and -not $Build) {
        while ($true) {
            $answer=Read-PreparationAnswer 'Build the complete installer ZIP now? Y = build, Enter = finish'
            if ($answer -ieq 'Y') { $Build=$true; break }
            if ($answer -eq '' -or $answer -ieq 'N') { break }
            Write-Host 'Choose Y or press Enter.'
        }
    }
    if ($Build) {
        $paths=Get-Content -LiteralPath (Join-Path $root 'Provenance/package-files.json') -Raw | ConvertFrom-Json
        $unique=@{}
        foreach ($path in $paths) {
            if ($unique.ContainsKey($path) -or $path -match '(^|/)(\.git|\.local|modules|Reports)(/|$)|\.ini($|\.)') { throw "Invalid package member: $path" }
            $unique[$path]=$true; $file=Get-SafeTarget $path
            if (-not (Test-Path -LiteralPath $file -PathType Leaf)) { throw "Missing package member: $path" }
        }
        $output=Get-SafeTarget 'ELSB - Vortex Installer.zip'; $temp=$output+'.tmp-'+[guid]::NewGuid().ToString('N')
        try {
            $zip=[IO.Compression.ZipFile]::Open($temp,[IO.Compression.ZipArchiveMode]::Create)
            try {
                foreach ($path in ($paths | Sort-Object)) {
                    $entry=$zip.CreateEntry($path,[IO.Compression.CompressionLevel]::Optimal)
                    $entry.LastWriteTime=[DateTimeOffset]::new(2000,1,1,0,0,0,[TimeSpan]::Zero)
                    $inStream=[IO.File]::OpenRead((Get-SafeTarget $path)); $outStream=$entry.Open()
                    try { $inStream.CopyTo($outStream) } finally { $inStream.Dispose(); $outStream.Dispose() }
                }
            } finally { $zip.Dispose() }
            $zip=[IO.Compression.ZipFile]::OpenRead($temp)
            try {
                if ($zip.Entries.Count -ne $paths.Count) { throw 'Archive member count mismatch.' }
                foreach ($entry in $zip.Entries) {
                    $stream=$entry.Open(); try { $hash=Get-StreamHash $stream } finally { $stream.Dispose() }
                    if ($hash -ne (Get-FileHashValue (Get-SafeTarget $entry.FullName))) { throw ('Archive verification failed: '+$entry.FullName) }
                }
            } finally { $zip.Dispose() }
            if (Test-Path -LiteralPath $output) { [IO.File]::Replace($temp,$output,$output+'.previous-'+[guid]::NewGuid().ToString('N')+'.zip') }
            else { [IO.File]::Move($temp,$output) }
            Write-Output ('Built '+$output+' SHA256 '+(Get-FileHashValue $output))
        } finally { if (Test-Path -LiteralPath $temp) { [IO.File]::Delete($temp) } }
    }
} catch { Write-Error $_; exit 1 }
