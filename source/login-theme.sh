#!/bin/bash
php -r "
\$cfg  = @parse_ini_file('/boot/config/plugins/themeui/themeui.cfg') ?: [];
\$service = \$cfg['SERVICE'] ?? 'disabled';
\$theme   = \$cfg['THEME']   ?? 'default';
\$login   = '/usr/local/emhttp/webGui/include/.login.php';
\$plug    = '/usr/local/emhttp/plugins/ThemeUI';

\$logo_mode       = \$cfg['LOGO_MODE'] ?? 'none';
\$logo_url        = \$cfg['LOGO_URL']  ?? '';
\$logo_size       = \$cfg['LOGO_SIZE'] ?? 'medium';
\$logo_size_css   = ['small'=>'height:2.5rem;max-width:10rem;', 'medium'=>'height:3.5rem;max-width:14rem;', 'large'=>'height:4.5rem;max-width:18rem;'];
\$size_css        = \$logo_size_css[\$logo_size] ?? \$logo_size_css['medium'];
\$logo_header     = '/usr/local/emhttp/webGui/images/UN-logotype-gradient.svg';
\$logo_backup_dir = '/boot/config/plugins/themeui/logo-originals';
\$logo_upload_dir = '/boot/config/plugins/themeui';

\$existing_upload = null;
foreach (glob(\"\$logo_upload_dir/custom-logo.*\") as \$f) { \$existing_upload = basename(\$f); }

\$logo_src = '';
if (\$logo_mode === 'url' && \$logo_url) {
    \$logo_src = \$logo_url;
} elseif (\$logo_mode === 'upload' && \$existing_upload) {
    \$logo_src = \"/plugins/ThemeUI/\$existing_upload\";
}

if (file_exists(\$login)) {
    \$html = file_get_contents(\$login);
    \$html = preg_replace('/<!--themeui-start-->.*?<!--themeui-end-->\n?/s', '', \$html);
    \$block_content = '';

    if (\$service === 'enabled' && \$theme !== 'default') {
        \$css  = @file_get_contents(\"\$plug/themes/\$theme.css\") ?: '';
        \$css .= \"\n\" . (@file_get_contents(\"\$plug/themes/login.css\") ?: '');
        \$block_content .= \"<style>\n\$css\n</style>\n\";
    }

    if (\$service === 'enabled' && \$logo_src) {
        \$json = json_encode(\$logo_src);
        \$block_content .= \"<script>
(function(){
  var src = \$json;
  function swap(svg){
    if(!svg||svg.dataset.themeuiSwapped)return;
    svg.dataset.themeuiSwapped='1';
    var img=document.createElement('img');
    img.src=src;
    img.alt='Logo';
    img.style.cssText='\$size_css width:auto;object-fit:contain;flex-shrink:0;';
    svg.replaceWith(img);
  }
  function scan(){
    document.querySelectorAll('svg').forEach(function(svg){
      if(!svg.dataset.themeuiSwapped&&svg.querySelector('[id*=\\\"unraid-header-logo-gradient\\\"]'))swap(svg);
    });
  }
  scan();
  new MutationObserver(scan).observe(document.documentElement,{childList:true,subtree:true});
})();
</script>
\";
    }

    if (\$block_content) {
        \$block = \"<!--themeui-start-->\n\$block_content<!--themeui-end-->\";
        \$html  = str_replace('</head>', \"\$block\n</head>\", \$html);
    }

    file_put_contents(\$login, \$html);
}

if (file_exists(\$logo_header)) {
    if (!is_dir(\$logo_backup_dir)) @mkdir(\$logo_backup_dir, 0755, true);
    \$backup_header = \"\$logo_backup_dir/UN-logotype-gradient.svg\";
    if (!file_exists(\$backup_header)) @copy(\$logo_header, \$backup_header);

    if (\$logo_src) {
        \$safe = htmlspecialchars(\$logo_src, ENT_QUOTES);
        \$svg  = '<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 222.36 39.04\" class=\"xs:w-[16rem] h-auto max-h-[3rem] w-[14rem] shrink-0\" aria-hidden=\"true\" focusable=\"false\"><image href=\"' . \$safe . '\" x=\"0\" y=\"0\" width=\"222.36\" height=\"39.04\" preserveAspectRatio=\"xMidYMid meet\"/></svg>';
        @file_put_contents(\$logo_header, \$svg);
    } elseif (file_exists(\$backup_header)) {
        @copy(\$backup_header, \$logo_header);
    }
}
"
