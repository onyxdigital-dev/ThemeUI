#!/bin/bash
php -r "
\$cfg  = @parse_ini_file('/boot/config/plugins/themeui/themeui.cfg') ?: [];
\$service = \$cfg['SERVICE'] ?? 'disabled';
\$theme   = \$cfg['THEME']   ?? 'default';
\$login   = '/usr/local/emhttp/webGui/include/.login.php';
\$plug    = '/usr/local/emhttp/plugins/ThemeUI';

if (!file_exists(\$login)) exit(0);

\$html = file_get_contents(\$login);
\$html = preg_replace('/<!--themeui-start-->.*?<!--themeui-end-->\n?/s', '', \$html);

if (\$service === 'enabled' && \$theme !== 'default') {
    \$css  = @file_get_contents(\"\$plug/themes/\$theme.css\") ?: '';
    \$css .= \"\n\" . (@file_get_contents(\"\$plug/themes/login.css\") ?: '');
    \$block = \"<!--themeui-start-->\n<style>\n\$css\n</style>\n<!--themeui-end-->\";
    \$html  = str_replace('</head>', \"\$block\n</head>\", \$html);
}

file_put_contents(\$login, \$html);

// Reapply the custom logo - /usr/local/emhttp is rebuilt from the boot image
// every boot, so the live SVGs need to be rewritten each time too.
\$logo_mode       = \$cfg['LOGO_MODE'] ?? 'none';
\$logo_url        = \$cfg['LOGO_URL']  ?? '';
\$logo_header     = '/usr/local/emhttp/webGui/images/UN-logotype-gradient.svg';
\$logo_anim       = '/usr/local/emhttp/webGui/images/animated-logo.svg';
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

if (file_exists(\$logo_header)) {
    if (!is_dir(\$logo_backup_dir)) @mkdir(\$logo_backup_dir, 0755, true);
    \$backup_header = \"\$logo_backup_dir/UN-logotype-gradient.svg\";
    \$backup_anim   = \"\$logo_backup_dir/animated-logo.svg\";
    if (!file_exists(\$backup_header)) @copy(\$logo_header, \$backup_header);
    if (file_exists(\$logo_anim) && !file_exists(\$backup_anim)) @copy(\$logo_anim, \$backup_anim);

    if (\$logo_src) {
        \$safe = htmlspecialchars(\$logo_src, ENT_QUOTES);
        \$svg  = '<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 222.36 39.04\" class=\"xs:w-[16rem] h-auto max-h-[3rem] w-[14rem] shrink-0\" aria-hidden=\"true\" focusable=\"false\"><image href=\"' . \$safe . '\" x=\"0\" y=\"0\" width=\"222.36\" height=\"39.04\" preserveAspectRatio=\"xMidYMid meet\"/></svg>';
        @file_put_contents(\$logo_header, \$svg);
        @file_put_contents(\$logo_anim, \$svg);
    } elseif (file_exists(\$backup_header)) {
        @copy(\$backup_header, \$logo_header);
        if (file_exists(\$backup_anim)) @copy(\$backup_anim, \$logo_anim);
    }
}
"
