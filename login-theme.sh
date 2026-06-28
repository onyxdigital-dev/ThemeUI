#!/bin/bash
# ThemeUI - Login page theme injection
# Saved to flash; called from /boot/config/go on every boot
# Also called directly by ThemeUI.page when settings are saved

LOGIN_PAGE="/usr/local/emhttp/webGui/include/.login.php"
CFG="/boot/config/plugins/themeui/themeui.cfg"

[ -f "$LOGIN_PAGE" ] || exit 0
[ -f "$CFG" ]        || exit 0

# Source config (avoids grep -P which BusyBox doesn't support)
SERVICE="disabled"
THEME="default"
source "$CFG"

# Remove any previous ThemeUI injection
sed -i '/data-themeui/d' "$LOGIN_PAGE"

if [ "$SERVICE" = "enabled" ] && [ "$THEME" != "default" ]; then
    THEME_LINK="    <link data-themeui rel='stylesheet' href='/plugins/ThemeUI/themes/${THEME}.css'>"
    LOGIN_LINK="    <link data-themeui rel='stylesheet' href='/plugins/ThemeUI/themes/login.css'>"
    sed -i "s|</head>|${THEME_LINK}\n${LOGIN_LINK}\n</head>|" "$LOGIN_PAGE"
fi
