"""Read deployed/staged containers and report relevant compatibility. Never installs or removes files."""
from pathlib import Path
import argparse, json, hashlib, subprocess, shutil, html, csv, datetime

EXTS=('.pak','.ucas','.utoc')
def digest(p):
 with p.open('rb') as f:return hashlib.file_digest(f,'sha256').hexdigest()
def normalize(p):return str(Path(p).resolve()).casefold()
def inspect(game,staging,retoc=None):
 catalogue=json.loads((Path(__file__).parent/'catalogue.json').read_text(encoding='utf-8'))
 byhash={}
 for c in catalogue['containers']:byhash.setdefault(c['files']['.utoc'],[]).append(c)
 owners={};inventories=[]
 for p in game.rglob('vortex.deployment.*.json'):
  d=json.loads(p.read_text(encoding='utf-8-sig'));inventories.append({'file':str(p),'sha256':digest(p),'deploymentTime':d.get('deploymentTime')})
  for f in d.get('files',[]):
   target=Path(d.get('targetPath',str(p.parent)))/f.get('target','')/f['relPath']
   owners.setdefault(normalize(target),[]).append({'entry':f['source'],'inventory':str(p),'staged':str(Path(d.get('stagingPath',str(staging)))/f['source']/f['relPath'])})
 active=[];file_rows=[];staged=[]
 paks=game/'Dawnwalker/Content/Paks'
 if not paks.is_dir():raise ValueError('Select the game root containing Dawnwalker/Content/Paks')
 def container(p,active_scan):
  hashes={e:digest(p.with_suffix(e)) for e in EXTS if p.with_suffix(e).is_file()}
  matches=[c for c in byhash.get(hashes.get('.utoc'),[]) if c['files']==hashes]
  assets=matches[0]['assets'] if matches else []
  if not matches and retoc:
   res=subprocess.run([str(retoc),'list','--path',str(p)],capture_output=True,text=True,encoding='utf-8',errors='replace')
   if res.returncode==0:assets=[line.split('ExportBundleData ',1)[1].strip().replace('\\','/').removeprefix('../../../') for line in res.stdout.splitlines() if 'ExportBundleData ' in line]
  entry={'path':str(p),'name':p.stem,'hashes':hashes,'complete':len(hashes)==3,'recognized':[m['id'] for m in matches],'titles':sorted({m['title'] for m in matches}),'assets':assets,'asset_inspection':'catalogue (exact hashes)' if matches else 'retoc' if assets else 'unknown - asset review needed'}
  if active_scan:
   for e,h in hashes.items():
    f=p.with_suffix(e);ownership=owners.get(normalize(f),[]);link_count=f.stat().st_nlink
    original=any(m['kind']=='elsb' for m in matches)
    imported=any(m['id'].startswith(('external/lacra_hair/','external/lacra_chest/')) for m in matches)
    action='KEEP managed file' if ownership else 'REVIEW unknown/unmanaged'
    if (original or imported) and not ownership and link_count==1:action='BACK UP then remove confirmed unmanaged copy before first deployment (user step)'
    file_rows.append({'path':str(f),'sha256':h,'bytes':f.stat().st_size,'links':link_count,'owners':'; '.join(o['entry'] for o in ownership),'action':action,'recognized':'; '.join(entry['recognized'])})
  return entry
 # Base game containers are dependencies, not mods. Never hash their multi-GB UCAS files here.
 for p in sorted(paks.rglob('*.utoc')):
  if p.parent==paks and p.stem in ('global','Dawnwalker-Windows'):continue
  active.append(container(p,True))
 known_names={n.casefold() for d in catalogue['dependencies'] for n in d['original_filenames'] if n.endswith('.utoc')}
 if staging and staging.is_dir():
  for p in sorted(staging.rglob('*.utoc')):
   if p.name.casefold() in known_names:staged.append(container(p,False))
 active_ids={i for c in active for i in c['recognized']};staged_ids={i for c in staged for i in c['recognized']}
 recommendations=[];inactive=[]
 for d in catalogue['dependencies']:
  state='ACTIVE: exact source bytes deployed' if set(d['required_containers'])<=active_ids else 'Present in staging, not deployed' if set(d['required_containers'])<=staged_ids else 'Not found at supported hashes'
  item=d|{'state':state}
  (recommendations if state.startswith('ACTIVE') else inactive).append(item)
 paths={};physical={}
 for c in active:
  physical.setdefault(c['name'].casefold(),[]).append(c['path'])
  for a in c['assets']:paths.setdefault(a.casefold(),[]).append(c)
 overlaps=[]
 for asset,entries in paths.items():
  unique={c['path']:c for c in entries}
  if len(unique)<2:continue
  ordered=sorted(unique.values(),key=lambda c:(c['name'].casefold(),c['path'].casefold()))
  priority=ordered[0]['name'] if ordered[0]['name'].casefold()!=ordered[1]['name'].casefold() else 'AMBIGUOUS: same container name in different folders'
  overlaps.append({'asset':asset,'containers':[c['path'] for c in ordered],'expected_name_priority':priority})
 collisions=[{'name':name,'paths':paths} for name,paths in physical.items() if len(paths)>1]
 missing=[c['path'] for c in active if not c['complete']]
 warnings=[]
 for collision in collisions:warnings.append(collision['name']+': duplicate physical container name in different folders; winning order requires review.')
 for d in inactive:
  if any('/compat/'+d['id']+'/' in i or '/Patches/'+d['id']+'/' in i for i in active_ids):warnings.append(d['title']+': an ELSB patch is deployed, but its supported original is not currently deployed. Review this patch/original combination in Vortex.')
 if any('/PussyWalker/' in i for i in active_ids) and any(i.startswith('external/vaginamod/') for i in active_ids):warnings.append('Standalone VaginaMod is deployed alongside the personal Pussy Walker add-on; this combination has not been validated.')
 for c in active:
  if not c['complete']:warnings.append(c['name']+': incomplete container triple.')
  if not c['recognized']:warnings.append(c['name']+': unknown bytes; known-patch eligibility is not established.')
 return {'date_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'game':str(game),'staging':str(staging),'inventories':inventories,'active':active,'staged':staged,'patches_for_active_mods':recommendations,'inactive_catalogue':inactive,'physical_filename_collisions':collisions,'overlapping_assets':overlaps,'migration':file_rows,'incomplete_triples':missing,'warnings':warnings,'limitations':catalogue['limitations']+' Active means deployed bytes; pending undeployed Vortex profile changes are not inferred. Name priority is the ELSB convention, not an in-game winner measurement.'}
def render(report):
 esc=lambda v:html.escape(str(v))
 cards=''.join('<article><h2>'+esc(d['title'])+'</h2><p>'+esc(d['state'])+' · Version '+esc(d['version'])+'</p><p>'+esc(d['selection'])+'</p></article>' for d in report['patches_for_active_mods']) or '<p>No supported third-party originals are currently deployed.</p>'
 rows=''.join('<tr>'+''.join('<td>'+esc(r[k])+'</td>' for k in ('path','owners','links','action','sha256'))+'</tr>' for r in report['migration'])
 conflicts=''.join('<tr><td>'+esc(o['asset'])+'</td><td>'+esc(', '.join(o['containers']))+'</td></tr>' for o in report['overlapping_assets'])
 cards+=''.join('<p>'+esc(w)+'</p>' for w in report['warnings'])
 return '<!doctype html><meta charset="utf-8"><title>ELSB compatibility audit</title><style>body{font:16px system-ui;background:#161820;color:#edf0f7;margin:3rem;max-width:1500px}h1{color:#ec8cab}article{padding:1rem 1.5rem;background:#222633;margin:1rem 0;border-radius:8px}table{border-collapse:collapse;width:100%;font-size:12px}td,th{text-align:left;border-bottom:1px solid #484959;padding:.6rem;overflow-wrap:anywhere}p{line-height:1.6}</style><h1>ELSB compatibility audit</h1><p>'+esc(report['date_utc'])+' · Read-only. No mods activated, disabled, installed or removed.</p><h2>Patches for active mods</h2>'+cards+'<p>'+esc(report['limitations'])+'</p><details><summary>Other catalogue entries (inactive or unsupported hashes)</summary><pre>'+esc(json.dumps(report['inactive_catalogue'],indent=2))+'</pre></details><h2>Migration ownership</h2><p>Only rows explicitly marked BACK UP are confirmed unmanaged ELSB/imported copies at this snapshot. Re-run before any cleanup. Never use the toolkit’s Remove all. Managed Coen Nude files stay in place.</p><table><tr><th>File</th><th>Vortex owner</th><th>Links</th><th>Action</th><th>SHA-256</th></tr>'+rows+'</table><h2>Internal Unreal asset overlaps</h2><p>These can occur without a Vortex filename conflict. An overlap is not itself proof of incompatibility.</p><table>'+conflicts+'</table>'
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--game',required=True,type=Path);p.add_argument('--staging',type=Path);p.add_argument('--retoc',type=Path);p.add_argument('--output',required=True,type=Path,help='Report directory outside game and staging');a=p.parse_args()
 game=a.game.resolve();staging=a.staging.resolve() if a.staging else None;output=a.output.resolve()
 for protected in (game,staging):
  if protected and (output==protected or protected in output.parents):p.error('Report output must be outside game and staging')
 result=inspect(game,staging,a.retoc or shutil.which('retoc'));output.mkdir(parents=True,exist_ok=True)
 (output/'Compatibility-Audit.json').write_text(json.dumps(result,indent=2),encoding='utf-8')
 (output/'Compatibility-Audit.html').write_text(render(result),encoding='utf-8')
 with (output/'Migration-Files.csv').open('w',newline='',encoding='utf-8-sig') as f:
  w=csv.DictWriter(f,fieldnames=('path','sha256','bytes','links','owners','action','recognized'));w.writeheader();w.writerows(result['migration'])
 print(str(output/'Compatibility-Audit.html'))
 print('Active supported originals:',len(result['patches_for_active_mods']),'| Unmanaged migration files:',sum(r['action'].startswith('BACK UP') for r in result['migration']))
if __name__=='__main__':main()
