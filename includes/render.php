<?php
require_once __DIR__.'/../config.php';
function render_page($page, array $vars = []){
  $file=BASE_PATH.'/templates/'.$page.'.html';
  if(!file_exists($file)){http_response_code(404);exit('Page not found');}
  $html=file_get_contents($file);
  $page_nav = $vars['nav'] ?? null;
  if($page!=='index'){
    ob_start(); include BASE_PATH.'/includes/header.php'; $sharedHeader=ob_get_clean();
    ob_start(); include BASE_PATH.'/includes/footer.php'; $sharedFooter=ob_get_clean();
    $html=str_replace(['<!--HEADER-->','<!--FOOTER-->'],[$sharedHeader,$sharedFooter],$html);
  }
  if($page==='news'){
    require_once __DIR__.'/news_view.php';
    $html=news_inject($html);
  }elseif($page==='post'){
    require_once __DIR__.'/news_view.php';
    $html=news_post_inject($html,$vars);
  }
  $data=cms_data();
  $pageData=$data['pages'][$page]??['text'=>[],'images'=>[]];
  $textMap=[]; foreach($pageData['text']??[] as $x){$textMap[$x['key']]=$x['value'];}
  $imgMap=[]; foreach($pageData['images']??[] as $x){$imgMap[$x['key']]=$x;}
  $html=preg_replace_callback('/(<([a-z0-9]+)\b[^>]*data-cms-key="([^"]+)"[^>]*>)(.*?)(<\/\2>)/is',function($m)use($textMap){
      $key=$m[3]; if(!array_key_exists($key,$textMap)) return $m[0];
      return $m[1].e($textMap[$key]).$m[5];
  },$html);
  $html=preg_replace_callback('/<img\b([^>]*data-cms-image-key="([^"]+)"[^>]*)>/i',function($m)use($imgMap){
      $attrs=$m[1]; $key=$m[2]; if(!isset($imgMap[$key])) return $m[0];
      $item=$imgMap[$key];
      if(!empty($item['src'])){
        $src=e($item['src']);
        $attrs=preg_replace('/\s+src=(?:"[^"]*"|\'[^\']*\')/i',' src="'.$src.'"',$attrs,1);
      }
      if(array_key_exists('alt',$item)){
        $alt=e($item['alt']);
        if(preg_match('/\s+alt=(?:"[^"]*"|\'[^\']*\')/i',$attrs)) $attrs=preg_replace('/\s+alt=(?:"[^"]*"|\'[^\']*\')/i',' alt="'.$alt.'"',$attrs,1);
        else $attrs.=' alt="'.$alt.'"';
      }
      return '<img'.$attrs.'>';
  },$html);
  // Inject dynamic corporate settings (phone, email, address, company name)
  $settings = $data['settings'] ?? [];
  if (!empty($settings)) {
      $sitePhone = e($settings['company_phone'] ?? '01796000000');
      $siteEmail = e($settings['company_email'] ?? 'info@salamproperties.com');
      $siteAddress = e($settings['company_address'] ?? 'Holding No - 0785, Haji Mohsin Road, Chandpur Sadar, Chandpur');
      $siteName = e($settings['site_name'] ?? 'Salam Properties');

      // Update phone links and text
      $html = preg_replace('/href="tel:[^"]*"/i', 'href="tel:' . preg_replace('/[^0-9+]/', '', $sitePhone) . '"', $html);
      $html = preg_replace('/href="mailto:[^"]*"/i', 'href="mailto:' . $siteEmail . '"', $html);

      // Update company address classes
      $html = preg_replace('/(<p\b[^>]*class="[^"]*company-address[^"]*"[^>]*>)(.*?)(<\/p>)/is', '$1' . $siteAddress . '$3', $html);
  }

  // Keep the original static assets and JS; only CMS values are injected.
  echo $html;
}
