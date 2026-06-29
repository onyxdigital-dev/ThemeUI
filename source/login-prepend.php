<?php
$uri = $_SERVER['REQUEST_URI'] ?? '';
if (strpos($uri, '/login') === false) return;

ob_start(function($html) {
    if (strpos($html, '</head>') === false) return $html;
    $cfg = @parse_ini_file('/boot/config/plugins/themeui/themeui.cfg') ?: [];
    if (($cfg['SERVICE'] ?? 'disabled') !== 'enabled') return $html;
    $theme = $cfg['THEME'] ?? 'default';
    if ($theme === 'default') return $html;
    $links  = "\n<link rel='stylesheet' href='/plugins/ThemeUI/themes/" . rawurlencode($theme) . ".css'>";
    $links .= "\n<link rel='stylesheet' href='/plugins/ThemeUI/themes/login.css'>";
    return str_replace('</head>', $links . "\n</head>", $html, 1);
});
