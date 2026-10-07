# Shared predefined choices are read from the same XML that Vortex installs.
$script:PackageRoot = $PSScriptRoot
$script:LegacyFunctions = @{}
foreach ($n in @('Get-Options','Get-OptionList','Option-Name','First-Label','Preview-Path','Get-Installed','Read-Ini')) {
    $script:LegacyFunctions[$n] = (Get-Command $n -CommandType Function).ScriptBlock
}
$script:SharedXml = New-Object System.Xml.XmlDocument
$script:SharedXml.XmlResolver = $null
$script:SharedXml.Load((Join-Path $script:PackageRoot 'fomod/ModuleConfig.xml'))
# Stop if future installer rules exceed the subset implemented here.
if ($script:SharedXml.SelectNodes('//folder | //plugin/files/* | //installStep/visible | /config/moduleDependencies').Count) {
    throw 'This installer configuration needs a newer manual toolkit.'
}
foreach ($f in $script:SharedXml.SelectNodes('/config/requiredInstallFiles/*')) {
    if ($f.Name -ne 'file' -or $f.GetAttribute('source').Replace('\','/') -cne 'Data/ELSB-Vortex-Installed.txt' -or $f.GetAttribute('destination').Replace('\','/') -cne 'ELSB-Vortex/Installed.txt') {
        throw 'Unsupported required installer file.'
    }
}
$script:SharedGroups = [ordered]@{}
$script:SharedOptions = @{}
$script:SharedHashCache = @{}
$oldKinds = @{}; foreach ($k in $KINDS) { $oldKinds[$k.key] = $k }
$KINDS = @()
foreach ($step in $script:SharedXml.SelectNodes('/config/installSteps/installStep')) {
    foreach ($group in $step.SelectNodes('./optionalFileGroups/group')) {
        if ($group.GetAttribute('type') -ne 'SelectExactlyOne') { throw 'Unsupported installer group type.' }
        $plugins = @($group.SelectNodes('./plugins/plugin'))
        $key = $plugins[0].SelectSingleNode('./conditionFlags/flag').GetAttribute('name')
        if ($script:SharedGroups.Contains($key)) { throw "Duplicate installer group: $key" }
        $script:SharedGroups[$key] = $group
        $script:SharedOptions[$key] = [ordered]@{}
        foreach ($p in $plugins) {
            $flags = @($p.SelectNodes('./conditionFlags/flag'))
            if ($flags.Count -ne 1 -or $flags[0].GetAttribute('name') -ne $key) { throw "Ambiguous option flags: $key" }
            $id = $flags[0].InnerText
            if ($script:SharedOptions[$key].Contains($id)) { throw "Duplicate option: $key/$id" }
            $script:SharedOptions[$key][$id] = $p
        }
        if (-not $script:SharedOptions[$key].Contains('vanilla')) { throw "Missing vanilla option: $key" }
        $kind = if ($oldKinds.ContainsKey($key)) { @{} + $oldKinds[$key] } else { @{ key=$key; dir=$key; box=('ELSB_' + $key + '_P'); anyExt=$true; overlay=$true } }
        $kind.tab = ($step.GetAttribute('name').Split(' ')[0]).ToLowerInvariant()
        $kind.sec = if ($step.GetAttribute('name') -like '*Body*') { 'body' } else { 'head' }
        $kind.hideEmpty = $false
        $KINDS += $kind
        $UI.en[$key] = $group.GetAttribute('name')
        if (-not $UI.ja.ContainsKey($key)) { $UI.ja[$key] = $group.GetAttribute('name') }
    }
}
$KIND_BY_KEY = @{}; foreach ($k in $KINDS) { $KIND_BY_KEY[$k.key] = $k }
$TOOL_VER = 'v' + ([xml](Get-Content -LiteralPath (Join-Path $script:PackageRoot 'fomod/info.xml') -Raw)).fomod.Version

function Get-SharedOption($key, $value) {
    if (-not $value) { $value = 'vanilla' }
    if ($script:SharedOptions.ContainsKey([string]$key) -and $script:SharedOptions[$key].Contains([string]$value)) { return $script:SharedOptions[$key][$value] }
    return $null
}
function Convert-SharedSelection($selection, [switch]$AllowUnknown) {
    $out = @{}; foreach ($k in $script:SharedGroups.Keys) { $out[$k] = '' }
    foreach ($k in $selection.Keys) { if ($out.ContainsKey($k)) { $out[$k] = [string]$selection[$k] } }
    if ($out.anca_body -eq 'booty_pussywalker') { $out.anca_body = 'pussywalker' }
    if ($out.lacra_body -eq 'fitness_pussywalker') { $out.lacra_body = 'pussywalker' }
    if ($out.marat_genitals -eq 'part:coen_nude/marat') { $out.marat_genitals = 'compat_coen_nude_marat' }
    if ($out.lacra_skin -and $out.lacra_skin -ne 'vanilla' -and $script:SharedOptions.lacra_body.Contains($out.lacra_skin)) { $out.lacra_body = $out.lacra_skin; $out.lacra_skin = '' }
    foreach ($who in @('coen','anca','lacra')) {
        $skin = if ($who -eq 'coen') { 'skin' } else { $who + '_skin' }
        $face = $who + '_face'
        if ($out[$skin] -and $out[$skin] -ne 'vanilla' -and $script:SharedOptions[$face].Contains($out[$skin])) { $out[$face] = $out[$skin]; $out[$skin] = '' }
    }
    foreach ($k in @($out.Keys)) {
        if ($out[$k] -eq 'vanilla' -or $out[$k] -eq 'none') { $out[$k] = '' }
        if ($out[$k] -and -not $out[$k].StartsWith('ext:') -and -not (Get-SharedOption $k $out[$k])) {
            if ($AllowUnknown) { $out[$k] = '' } else { throw "Unknown choice: $k=$($out[$k])" }
        }
    }
    return $out
}
function Test-SharedDependencies($node, $flags) {
    if (-not $node) { return $true }
    $results = @()
    foreach ($c in $node.ChildNodes) {
        if ($c -isnot [System.Xml.XmlElement]) { continue }
        switch ($c.Name) {
            'flagDependency' { $results += ($flags[$c.GetAttribute('flag')] -ceq $c.GetAttribute('value')) }
            'dependencies' { $results += (Test-SharedDependencies $c $flags) }
            default { throw "Unsupported installer dependency: $($c.Name)" }
        }
    }
    if ($node.GetAttribute('operator') -eq 'Or') { return ($results -contains $true) }
    return ($results -notcontains $false)
}
function Get-SharedFlags($selection) {
    $flags = @{}
    foreach ($k in $script:SharedGroups.Keys) {
        $v = [string]$selection[$k]
        $flags[$k] = if (-not $v -or $v.StartsWith('ext:')) { 'vanilla' } else { $v }
    }
    return $flags
}
function Test-SharedChoice($key, $value, $selection) {
    if ([string]$value -like 'ext:*') { return $true }
    $p = Get-SharedOption $key $value
    if (-not $p) { return $false }
    $td = $p.SelectSingleNode('./typeDescriptor')
    $t = $td.SelectSingleNode('./type')
    if ($t) { return $t.GetAttribute('name') -ne 'NotUsable' }
    $dep = $td.SelectSingleNode('./dependencyType')
    if (-not $dep) { throw "Missing option type: $key/$value" }
    $flags = Get-SharedFlags $selection
    foreach ($pattern in $dep.SelectNodes('./patterns/pattern')) {
        if (Test-SharedDependencies $pattern.SelectSingleNode('./dependencies') $flags) { return $pattern.SelectSingleNode('./type').GetAttribute('name') -ne 'NotUsable' }
    }
    return $dep.SelectSingleNode('./defaultType').GetAttribute('name') -ne 'NotUsable'
}
function Get-SharedDescription($key, $value) {
    $p = Get-SharedOption $key $value
    if (-not $p) { return 'Imported mod. Review its requirements before applying.' }
    return $p.SelectSingleNode('./description').InnerText.Replace('Enable and deploy this original separately in Vortex.', 'Install the required original separately, or import it in this toolkit.')
}
function Get-Options($kind) { return @($script:SharedOptions[$kind.key].Keys | Where-Object { $_ -ne 'vanilla' }) }
function Get-OptionList($kind) {
    $result = @(Get-Options $kind)
    foreach ($e in @(Get-ExtMods)) { if ($e.main -eq $kind.key -and -not (Test-ExtHidden $e.name)) { $result += 'ext:' + $e.name } }
    return $result
}
function Option-Name($kind, $folder) {
    $p = Get-SharedOption $kind $folder
    if ($p) { return $p.GetAttribute('name') }
    return (& $script:LegacyFunctions['Option-Name'] $kind $folder)
}
function First-Label($kindKey) { return (Get-SharedOption $kindKey '').GetAttribute('name') }
function Preview-Path($kindKey, $o) {
    $override = Join-Path $script:PackageRoot ('modules/previews/' + $kindKey + '/' + $(if ($o) { $o.Replace(':','_').Replace('/','_') } else { 'vanilla' }) + '.png')
    if (Test-Path -LiteralPath $override) { return $override }
    $p = Get-SharedOption $kindKey $o
    if (-not $p) { return (& $script:LegacyFunctions['Preview-Path'] $kindKey $o) }
    $rel = $p.SelectSingleNode('./image').GetAttribute('path')
    if (Test-Path -LiteralPath (Join-Path $script:PackageRoot ($rel + '.jpg'))) { $rel += '.jpg' }
    return Join-Path $script:PackageRoot $rel
}
function Set-Preview($kindKey, $o, $img) {
    if (-not (Get-SharedOption $kindKey $o) -and [string]$o -notlike 'ext:*') { throw 'Unknown preview choice.' }
    $dst = Join-Path $script:PackageRoot ('modules/previews/' + $kindKey + '/' + $(if ($o) { $o.Replace(':','_').Replace('/','_') } else { 'vanilla' }) + '.png')
    [void][IO.Directory]::CreateDirectory((Split-Path -Parent $dst))
    if (Save-PreviewImage $img $dst) { return $dst }; return ''
}

function Read-Ini {
    $d = & $script:LegacyFunctions['Read-Ini']
    $selection = @{}; foreach ($k in $script:SharedGroups.Keys) { $selection[$k] = [string]$d['sel_' + $k] }
    $selection = Convert-SharedSelection $selection -AllowUnknown
    foreach ($k in $selection.Keys) { $d['sel_' + $k] = $selection[$k] }
    return $d
}
function Write-Ini($d) {
    $existing = @(); if (Test-Path -LiteralPath $INI_PATH) { $existing = [IO.File]::ReadAllLines($INI_PATH) }
    $seen = @{}; $lines = New-Object 'System.Collections.Generic.List[string]'
    foreach ($line in $existing) {
        if ($line -match '^\s*([^;#=\[\]\s][^=]*)=(.*)$') {
            $k = $matches[1].Trim()
            if ($d.ContainsKey($k)) {
                if (-not $seen.ContainsKey($k)) { $lines.Add($k + '=' + [string]$d[$k]); $seen[$k] = $true }
                continue
            }
        }
        $lines.Add($line)
    }
    foreach ($k in ($d.Keys | Sort-Object)) { if (-not $seen.ContainsKey($k)) { $lines.Add($k + '=' + [string]$d[$k]) } }
    $text = ($lines -join "`r`n") + "`r`n"
    if ((Test-Path -LiteralPath $INI_PATH) -and [IO.File]::ReadAllText($INI_PATH) -ceq $text) { return }
    $tmp = $INI_PATH + '.tmp-' + [guid]::NewGuid().ToString('N')
    try {
        [IO.File]::WriteAllText($tmp, $text, (New-Object Text.UTF8Encoding($false)))
        if (Test-Path -LiteralPath $INI_PATH) {
            $backup = $INI_PATH + '.backup-' + (Get-Date -Format 'yyyyMMdd-HHmmssfff')
            [IO.File]::Replace($tmp, $INI_PATH, $backup)
        } else { [IO.File]::Move($tmp, $INI_PATH) }
    } finally { if (Test-Path -LiteralPath $tmp) { Remove-Item -LiteralPath $tmp -Force } }
}
function Get-RequestedSelection {
    $out = @{}; $prefs = Read-Ini
    foreach ($k in $script:SharedGroups.Keys) { $out[$k] = [string]$prefs['sel_' + $k] }
    if ($SelectionFile) {
        $obj = Get-Content -LiteralPath $SelectionFile -Raw | ConvertFrom-Json
        foreach ($p in $obj.PSObject.Properties) {
            if (-not $out.ContainsKey($p.Name)) { throw "Unknown selection group: $($p.Name)" }
            $out[$p.Name] = [string]$p.Value
        }
    }
    foreach ($p in $InvocationOptions.Keys) {
        foreach ($k in $script:SharedGroups.Keys) { if ($p -ieq $k.Replace('_','')) { $out[$k] = [string]$InvocationOptions[$p] } }
    }
    return Convert-SharedSelection $out
}
function Get-RequestedImports {
    $value = if ($InvocationOptions.ContainsKey('Ext')) { [string]$ARG_EXT } else { [string](Read-Ini).ext_on }
    return @($value.Split(',') | ForEach-Object { $_.Trim() } | Where-Object { $_ })
}
function Resolve-ContainedPath($base, $relative) {
    if ([IO.Path]::IsPathRooted($relative) -or $relative -match '(^|[\\/])\.\.([\\/]|$)' -or $relative -match ':') { throw "Unsafe package path: $relative" }
    $b = [IO.Path]::GetFullPath($base).TrimEnd('\','/') + [IO.Path]::DirectorySeparatorChar
    $full = [IO.Path]::GetFullPath((Join-Path $b $relative))
    if (-not $full.StartsWith($b, [StringComparison]::OrdinalIgnoreCase)) { throw "Path escapes its root: $relative" }
    $q = $full
    while ($q -and $q.Length -ge $b.TrimEnd('\','/').Length) {
        if ((Test-Path -LiteralPath $q) -and ((Get-Item -LiteralPath $q -Force).Attributes -band [IO.FileAttributes]::ReparsePoint)) { throw "Linked installation path is not supported: $q" }
        $q = Split-Path -Parent $q
    }
    return $full
}
function Get-SharedHash($path) {
    $f = Get-Item -LiteralPath $path -ErrorAction Stop
    $stamp = $path + '|' + $f.Length + '|' + $f.LastWriteTimeUtc.Ticks
    if (-not $script:SharedHashCache.ContainsKey($stamp)) { $script:SharedHashCache[$stamp] = (Get-FileHash -LiteralPath $path -Algorithm SHA256).Hash.ToLowerInvariant() }
    return $script:SharedHashCache[$stamp]
}
function Add-SharedFile($map, $source, $destination, $external = $false) {
    $src = Resolve-ContainedPath $script:PackageRoot $source
    if (-not (Test-Path -LiteralPath $src -PathType Leaf)) { throw "Required file is missing: $source" }
    if ($destination -notmatch '^Dawnwalker[/\\]Content[/\\]Paks[/\\]~mods[/\\][^/\\]+\.(pak|ucas|utoc)$') { throw "Unexpected runtime destination: $destination" }
    $destination = $destination.Replace('\','/')
    $sha = Get-SharedHash $src
    if ($map.ContainsKey($destination)) {
        if ($map[$destination].sha256 -cne $sha) { throw "Conflicting selected files: $destination" }
        return
    }
    $map[$destination] = @{ source=$source.Replace('\','/'); destination=$destination; sha256=$sha; bytes=(Get-Item -LiteralPath $src).Length; external=[bool]$external }
}
function Add-SharedBox($map, $directory, $box, $destinationName = '', $external = $true) {
    if (-not $destinationName) { $destinationName = $box }
    $prefix = $script:PackageRoot.TrimEnd('\','/') + '\'
    $full = [IO.Path]::GetFullPath($directory)
    if (-not $full.StartsWith($prefix, [StringComparison]::OrdinalIgnoreCase)) { throw 'Imported sources must be inside this toolkit.' }
    foreach ($ext in @('.pak','.ucas','.utoc')) {
        Add-SharedFile $map (($full.Substring($prefix.Length)).TrimEnd('\','/') + '/' + $box + $ext) ('Dawnwalker/Content/Paks/~mods/' + $destinationName + $ext) $external
    }
}
function Add-SharedImports($map, $selection, $extOn) {
    $on = @($extOn | Where-Object { $_ })
    foreach ($v in $selection.Values) { if ([string]$v -like 'ext:*') { $on += ([string]$v).Substring(4) } }
    $on = @($on | Select-Object -Unique)
    if (-not $on.Count) { return }
    $all = @(Get-ExtMods)
    foreach ($name in $on) {
        $e = @($all | Where-Object { $_.name -ceq $name })
        if ($e.Count -ne 1) { throw "Imported mod is missing or ambiguous: $name" }
        foreach ($box in $e[0].boxes) { Add-SharedBox $map $e[0].dir $box (Get-ExtPlaceName $e[0] $box) }
    }
    $legacy = @{} + $selection
    if ($legacy.anca_body -eq 'pussywalker') { $legacy.anca_body='booty' }
    if ($legacy.lacra_body -eq 'pussywalker' -or $legacy.lacra_body -like 'compat_chars_445_*') { $legacy.lacra_body='fitness' }
    $candidates = @($map.Values | Where-Object { $_.source.EndsWith('.utoc') -and -not $_.external } | ForEach-Object { @{ dir=(Split-Path -Parent (Join-Path $script:PackageRoot $_.source)); box=[IO.Path]::GetFileNameWithoutExtension($_.source) } })
    $done = @()
    foreach ($c in @(Get-CompatMods)) {
        $e = Get-CompatSource $c
        if (-not $e -or $on -notcontains $e.name -or $done -contains $e.name) { continue }
        if ((Test-CompatReq $c $legacy $false) -and (Test-CompatWins $c $e)) {
            $db = ''; if ($c.dt) { $db = Get-CompatDtBox $c $candidates; if ($db -eq '') { throw "No matching clothing-table variant for imported mod: $($e.name)" } }
            Add-SharedBox $map $c.dir $c.box
            foreach ($box in @($c.extra)) { Add-SharedBox $map $c.dir $box }
            if ($db) { Add-SharedBox $map $c.dir $db }
            $done += $e.name
        }
        foreach ($part in @(Get-CompatParts $c $e $legacy $true)) { Add-SharedBox $map $part.dir $part.box }
    }
    foreach ($u in @(Get-ChildItem -LiteralPath $CORE_DIR -Filter '*.utoc' -File)) { Add-SharedBox $map $CORE_DIR $u.BaseName '' $false }
}
function Get-SharedPlan($selection, $extOn = @()) {
    $selection = Convert-SharedSelection $selection
    foreach ($key in $script:SharedGroups.Keys) {
        if (-not (Test-SharedChoice $key $selection[$key] $selection)) { throw ("Unavailable choice: $key=$($selection[$key]). " + (Get-SharedDescription $key $selection[$key])) }
    }
    $flags = Get-SharedFlags $selection; $files = @{}
    foreach ($pattern in $script:SharedXml.SelectNodes('/config/conditionalFileInstalls/patterns/pattern')) {
        if (Test-SharedDependencies $pattern.SelectSingleNode('./dependencies') $flags) {
            foreach ($f in $pattern.SelectNodes('./files/file')) { Add-SharedFile $files $f.GetAttribute('source') $f.GetAttribute('destination') }
        }
    }
    Add-SharedImports $files $selection $extOn
    return @{ schemaVersion=1; selections=$selection; external=@($extOn); files=@($files.Values | Sort-Object destination) }
}

function Assert-ManualTarget($root) {
    if (Test-Path -LiteralPath (Join-Path $root 'ELSB-Vortex/Installed.txt')) {
        throw 'ELSB is managed by Vortex here. Disable that entry and deploy in Vortex before using manual Apply. To return to Vortex, remove the manual ELSB selection with this toolkit first.'
    }
}
function Assert-ManualPath($paks) {
    if ($paks -match '^(.*)[\\/]Dawnwalker[\\/]Content[\\/]Paks[\\/]~mods[\\/]?$') { Assert-ManualTarget $matches[1] }
}
function Get-ManualReceipt($root) {
    $p = Resolve-ContainedPath $root 'ELSB-Manual/Installed.json'
    if (Test-Path -LiteralPath $p) {
        $r = Get-Content -LiteralPath $p -Raw | ConvertFrom-Json
        if ($r.schemaVersion -ne 1) { throw 'Unsupported manual installation receipt.' }
        return $r
    }
    return $null
}
function Get-Installed($root, $prefer = $null) {
    $receipt = Get-ManualReceipt $root
    if ($receipt) {
        $out = @{}; foreach ($p in $receipt.selections.PSObject.Properties) { $out[$p.Name]=$p.Value }
        $valid = $true
        foreach ($f in @($receipt.files)) {
            $p = Resolve-ContainedPath $root $f.destination
            if (-not (Test-Path -LiteralPath $p) -or (Get-SharedHash $p) -cne $f.sha256) { $valid=$false; break }
        }
        if ($valid) { return Convert-SharedSelection $out }
    }
    $old = & $script:LegacyFunctions['Get-Installed'] $root $prefer
    return Convert-SharedSelection $old -AllowUnknown
}
function Apply-Selection($root, $sel, $extOn) {
    Assert-ManualTarget $root
    if (Test-GameRunning) { throw 'Close the game before applying choices.' }
    $plan = Get-SharedPlan $sel $extOn
    $previous = Get-ManualReceipt $root
    $old = @{}; foreach ($f in @($previous.files)) { if ($f -and $f.owned -ne $false) { $old[$f.destination] = $f } }
    $desired = @{}; foreach ($f in $plan.files) { $desired[$f.destination] = $f }
    # Adopt only byte-identical known ELSB files from a previous script installation.
    $known = @{}
    foreach ($f in $script:SharedXml.SelectNodes('/config/conditionalFileInstalls/patterns/pattern/files/file')) {
        $rel = $f.GetAttribute('destination').Replace('\','/')
        if (-not $known.ContainsKey($rel)) { $known[$rel] = @() }
        $known[$rel] += $f.GetAttribute('source')
    }
    foreach ($rel in $known.Keys) {
        if ($old.ContainsKey($rel)) { continue }
        $path = Resolve-ContainedPath $root $rel
        if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { continue }
        $hash = Get-SharedHash $path
        foreach ($src in @($known[$rel] | Select-Object -Unique)) {
            $source = Resolve-ContainedPath $script:PackageRoot $src
            if ((Test-Path -LiteralPath $source) -and (Get-SharedHash $source) -ceq $hash) { $old[$rel] = @{ destination=$rel; sha256=$hash; owned=$true }; break }
        }
    }
    $affected = @(@($old.Keys) + @($desired.Keys) | Sort-Object -Unique)
    foreach ($rel in $affected) {
        $p = Resolve-ContainedPath $root $rel
        if (Test-Path -LiteralPath $p) {
            if (-not (Test-Path -LiteralPath $p -PathType Leaf)) { throw "A directory blocks the destination: $rel" }
            $hash = Get-SharedHash $p
            if ($old.ContainsKey($rel)) {
                if ($hash -cne $old[$rel].sha256) { throw "A managed file was changed outside this toolkit: $rel. Preserve it before switching choices." }
            } elseif ($desired.ContainsKey($rel) -and $hash -cne $desired[$rel].sha256) { throw "An unrelated file occupies this destination: $rel" }
        }
        if ($desired.ContainsKey($rel)) { $desired[$rel].owned = ($old.ContainsKey($rel) -or -not (Test-Path -LiteralPath $p)) }
    }
    $receiptPath = Resolve-ContainedPath $root 'ELSB-Manual/Installed.json'
    $work = Resolve-ContainedPath $root ('.ELSB-transaction-' + [guid]::NewGuid().ToString('N'))
    $changed = New-Object 'System.Collections.Generic.List[string]'
    $hadReceipt = Test-Path -LiteralPath $receiptPath
    $hadIni = Test-Path -LiteralPath $INI_PATH
    [void][IO.Directory]::CreateDirectory($work)
    $mutated = $false; $rollbackOk = $true
    try {
        if ($hadReceipt) { Copy-Item -LiteralPath $receiptPath -Destination (Join-Path $work 'receipt.json') }
        if ($hadIni) { Copy-Item -LiteralPath $INI_PATH -Destination (Join-Path $work 'settings.ini') }
        foreach ($rel in $affected) {
            $path = Resolve-ContainedPath $root $rel
            if (Test-Path -LiteralPath $path) {
                $backup = Resolve-ContainedPath $work ('before/' + $rel)
                [void][IO.Directory]::CreateDirectory((Split-Path -Parent $backup)); Copy-Item -LiteralPath $path -Destination $backup
            }
            if ($desired.ContainsKey($rel)) {
                $stage = Resolve-ContainedPath $work ('after/' + $rel)
                [void][IO.Directory]::CreateDirectory((Split-Path -Parent $stage))
                Copy-Item -LiteralPath (Join-Path $script:PackageRoot $desired[$rel].source) -Destination $stage
                if ((Get-SharedHash $stage) -cne $desired[$rel].sha256) { throw "File changed during preparation: $rel" }
            }
        }
        foreach ($rel in $affected) {
            $path = Resolve-ContainedPath $root $rel
            if ($desired.ContainsKey($rel) -and (Test-Path -LiteralPath $path) -and (Get-SharedHash $path) -ceq $desired[$rel].sha256) { continue }
            $mutated = $true; $changed.Add($rel)
            if ($desired.ContainsKey($rel)) {
                [void][IO.Directory]::CreateDirectory((Split-Path -Parent $path))
                Copy-Item -LiteralPath (Resolve-ContainedPath $work ('after/' + $rel)) -Destination $path -Force
            } elseif (Test-Path -LiteralPath $path) { Remove-Item -LiteralPath $path -Force }
        }
        $prefs = Read-Ini
        foreach ($k in $plan.selections.Keys) { $prefs['sel_' + $k] = $plan.selections[$k] }
        $prefs.ext_on = (@($extOn) -join ',')
        $mutated = $true
        Write-Ini $prefs
        if ($plan.files.Count) {
            [void][IO.Directory]::CreateDirectory((Split-Path -Parent $receiptPath))
            [IO.File]::WriteAllText($receiptPath, ($plan | ConvertTo-Json -Depth 30), (New-Object Text.UTF8Encoding($false)))
        } elseif (Test-Path -LiteralPath $receiptPath) { Remove-Item -LiteralPath $receiptPath -Force }
        if (Get-Variable ini -Scope Script -ErrorAction SilentlyContinue) { $script:ini = $prefs }
    } catch {
        $failure = $_
        if ($mutated) {
            try {
                foreach ($rel in $changed) {
                    $path = Resolve-ContainedPath $root $rel
                    $backup = Resolve-ContainedPath $work ('before/' + $rel)
                    if (Test-Path -LiteralPath $backup) { Copy-Item -LiteralPath $backup -Destination $path -Force }
                    elseif (Test-Path -LiteralPath $path) { Remove-Item -LiteralPath $path -Force }
                }
                if ($hadReceipt) { Copy-Item -LiteralPath (Join-Path $work 'receipt.json') -Destination $receiptPath -Force }
                elseif (Test-Path -LiteralPath $receiptPath) { Remove-Item -LiteralPath $receiptPath -Force }
                if ($hadIni) { Copy-Item -LiteralPath (Join-Path $work 'settings.ini') -Destination $INI_PATH -Force }
                elseif (Test-Path -LiteralPath $INI_PATH) { Remove-Item -LiteralPath $INI_PATH -Force }
            } catch { $rollbackOk = $false; throw "Apply failed and recovery needs attention. Original files are preserved at $work. $failure; $_" }
        }
        throw $failure
    } finally {
        if ($rollbackOk -and (Test-Path -LiteralPath $work)) {
            $verified = Resolve-ContainedPath $root ([IO.Path]::GetFileName($work))
            if ($verified -cne $work -or [IO.Path]::GetFileName($work) -notlike '.ELSB-transaction-*') { throw 'Unsafe transaction cleanup path.' }
            Remove-Item -LiteralPath $work -Recurse -Force
        }
    }
    return @()
}

function Accept-SharedControl($control) {
    $key = [string]$control.Tag; $row = $rows[$key]
    $value = if ($control.SelectedIndex -gt 0) { [string]$row.opts[$control.SelectedIndex-1] } else { '' }
    if (Test-SharedChoice $key $value (Get-RawSelection)) { $row.lastValid = $control.SelectedIndex; return $true }
    $tip.SetToolTip($control, (Get-SharedDescription $key $value))
    Show-Preview $key $control.SelectedIndex
    $script:syncing = $true
    try { $control.SelectedIndex = if ($row.ContainsKey('lastValid')) { [int]$row.lastValid } else { 0 } } finally { $script:syncing=$false }
    return $false
}
function Normalize-SharedControls {
    if (-not (Get-Variable rows -Scope Script -ErrorAction SilentlyContinue)) { return }
    $script:syncing=$true
    try {
        for ($pass=0; $pass -lt $script:SharedGroups.Count; $pass++) {
            $selection=Get-RawSelection; $changed=$false
            foreach ($k in $script:SharedGroups.Keys) {
                if (-not (Test-SharedChoice $k $selection[$k] $selection)) { $rows[$k].cmb.SelectedIndex=0; $rows[$k].lastValid=0; $changed=$true }
                else { $rows[$k].lastValid=$rows[$k].cmb.SelectedIndex }
                $rows[$k].cmb.Invalidate()
            }
            if (-not $changed) { break }
        }
    } finally { $script:syncing=$false }
}
