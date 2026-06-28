# ThemeUI

A theme switcher plugin for Unraid 7.2+. Apply beautiful dark color themes across the entire Unraid web UI — dashboard, login page, Docker and VM pages, usage bars, pie charts, tables, buttons, and context menus. Themes apply instantly on save with no reboot required.

![ThemeUI Settings](screenshots/Screenshot%202026-06-27%20022038.png)

---

## Themes

| Theme | Background | Accent |
|-------|-----------|--------|
| Catppuccin Mocha | `#1e1e2e` | `#89b4fa` |
| Nord | `#2e3440` | `#88c0d0` |
| Dracula | `#282a36` | `#bd93f9` |
| Gruvbox Dark | `#282828` | `#fe8019` |
| Tokyo Night | `#1a1b26` | `#7aa2f7` |
| Solarized Dark | `#002b36` | `#2aa198` |
| One Dark | `#282c34` | `#61afef` |
| Rose Pine | `#191724` | `#c4a7e7` |
| Everforest | `#2d353b` | `#a7c080` |
| Black and White | `#0d0d0d` | `#e8e8e8` |

---

## Features

- 10 built-in dark themes
- Themes the full UI: dashboard, login page, Docker/VM pages, tables, pie charts, usage bars, buttons, dropdowns, and context menus
- Modern design style option: rounded corners, smooth transitions, subtle depth
- Custom CSS override textarea for fine-tuning any color
- Color swatch preview when selecting a theme
- Applies instantly on save — no reboot or page refresh needed
- Login page themed even before authentication (CSS embedded inline, bypasses nginx auth block)

---

## Installation

1. In Unraid, go to **Plugins** and click **Install Plugin**
2. Paste this URL and click **Install**:

```
https://raw.githubusercontent.com/Onyxdigital-dev/ThemeUI/master/themeui.plg
```

---

## Usage

1. Go to **Settings > Utilities > ThemeUI**
2. Set **Enable ThemeUI** to `Yes`
3. Pick a theme from the dropdown (color swatches preview instantly)
4. Optionally select **Modern** design style for rounded corners
5. Click **Apply** — the page reloads with the new theme active

### Custom CSS

The **Custom CSS Override** textarea accepts any valid CSS and is injected after the selected theme. Use it to tweak specific colors or override anything the theme sets.

---

## Uninstall

Go to **Plugins**, find ThemeUI, and click **Remove**. The plugin removes all files, config, and the login page injection on uninstall.

---

## Requirements

- Unraid 7.2 or later

---

## License

MIT - see [LICENSE](LICENSE)
