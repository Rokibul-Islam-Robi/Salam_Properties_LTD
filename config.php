<?php
session_start();
define('BASE_PATH', __DIR__);
define('DATA_FILE', BASE_PATH . '/data/content.json');
define('BACKUP_DIR', BASE_PATH . '/data/backups');
define('UPLOAD_DIR', BASE_PATH . '/uploads');
define('ADMIN_USER', 'admin');
define('ADMIN_PASS', 'admin123');
if (!is_dir(UPLOAD_DIR)) @mkdir(UPLOAD_DIR, 0755, true);
if (!is_dir(BACKUP_DIR)) @mkdir(BACKUP_DIR, 0755, true);

function cms_data(){
  if(!file_exists(DATA_FILE)) return ['pages'=>[]];
  $raw=file_get_contents(DATA_FILE);
  $d=json_decode($raw,true);
  // Tolerate stray control characters (e.g. pasted line breaks) inside strings
  // instead of blanking every CMS driven page.
  if(!is_array($d)) $d=json_decode(cms_repair_json($raw),true);
  return is_array($d)?$d:['pages'=>[]];
}
function cms_repair_json($raw){
  $out=''; $in=false; $esc=false; $n=strlen($raw);
  for($i=0;$i<$n;$i++){
    $c=$raw[$i];
    if(!$in){$out.=$c; if($c==='"'){$in=true;} continue;}
    if($esc){$out.=$c; $esc=false; continue;}
    if($c==='\\'){$out.=$c; $esc=true; continue;}
    if($c==='"'){$out.=$c; $in=false; continue;}
    $o=ord($c);
    if($o<0x20){
      $out.=($c==="\n")?'\\n':(($c==="\r")?'\\r':(($c==="\t")?'\\t':sprintf('\\u%04x',$o)));
      continue;
    }
    $out.=$c;
  }
  return $out;
}
function cms_save($d, $createBackup = true){
  if ($createBackup && file_exists(DATA_FILE)) {
    // Keep last 15 backups with timestamps
    $time = date('Y-m-d_H-i-s');
    $backupFile = BACKUP_DIR . '/content_' . $time . '.json';
    @copy(DATA_FILE, $backupFile);
    
    // Prune backups keeping the newest 15
    $files = glob(BACKUP_DIR . '/content_*.json');
    if ($files && count($files) > 15) {
      usort($files, fn($a, $b) => filemtime($a) - filemtime($b));
      while (count($files) > 15) {
        @unlink(array_shift($files));
      }
    }
  }
  $json = json_encode($d, JSON_PRETTY_PRINT|JSON_UNESCAPED_SLASHES|JSON_UNESCAPED_UNICODE);
  if ($json === false) return false; // never clobber the content file with an unusable payload
  return file_put_contents(DATA_FILE, $json, LOCK_EX) !== false;
}
function e($v){return htmlspecialchars((string)$v,ENT_QUOTES,'UTF-8');}
function logged_in(){return !empty($_SESSION['cms_admin']);}
function require_admin(){if(!logged_in()){header('Location: login.php');exit;}}
function page_label($p){return ucwords(str_replace(['-','_'],' ',$p));}

function base_url($path = '') {
    $scriptName = $_SERVER['SCRIPT_NAME'] ?? '';
    // Look for /admin in script name or detect folder name
    $dir = dirname($scriptName);
    // If inside /admin, go one level up
    if (basename($dir) === 'admin') {
        $dir = dirname($dir);
    }
    $base = rtrim(str_replace('\\', '/', $dir), '/');
    $path = ltrim($path, '/');
    return ($base === '' ? '' : $base) . '/' . $path;
}
