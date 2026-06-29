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
"
