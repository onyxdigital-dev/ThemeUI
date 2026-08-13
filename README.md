<p align="center">
  <img src="assets/logo.png" alt="ThemeUI" width="180">
</p>

<h1 align="center">ThemeUI</h1>
<p align="center">A theme switcher for the Unraid web UI.</p>

<p align="center">
  <img src="https://img.shields.io/github/license/onyxdigital-dev/ThemeUI?color=8892bf" alt="License">
  <img src="https://img.shields.io/badge/Unraid-7.2%2B-orange" alt="Unraid 7.2+">
  <img src="https://img.shields.io/badge/themes-10-informational" alt="10 themes">
  <img src="https://img.shields.io/github/last-commit/onyxdigital-dev/ThemeUI" alt="Last commit">
</p>

<p align="center">
  Apply beautiful dark color themes across the entire Unraid web UI - dashboard, login page, Docker and VM pages,<br>
  usage bars, pie charts, tables, buttons, dialogs, and context menus. No reboot, no page refresh.
</p>

<br>

## Themes

10 built-in themes, each with a live color-swatch preview right in the settings page.

| Theme | Background | Accent |
|---|---|---|
| Catppuccin Mocha | ![#1e1e2e](https://placehold.co/16x16/1e1e2e/1e1e2e.png) `#1e1e2e` | ![#89b4fa](https://placehold.co/16x16/89b4fa/89b4fa.png) `#89b4fa` |
| Nord | ![#2e3440](https://placehold.co/16x16/2e3440/2e3440.png) `#2e3440` | ![#88c0d0](https://placehold.co/16x16/88c0d0/88c0d0.png) `#88c0d0` |
| Dracula | ![#282a36](https://placehold.co/16x16/282a36/282a36.png) `#282a36` | ![#bd93f9](https://placehold.co/16x16/bd93f9/bd93f9.png) `#bd93f9` |
| Gruvbox Dark | ![#282828](https://placehold.co/16x16/282828/282828.png) `#282828` | ![#fe8019](https://placehold.co/16x16/fe8019/fe8019.png) `#fe8019` |
| Tokyo Night | ![#1a1b26](https://placehold.co/16x16/1a1b26/1a1b26.png) `#1a1b26` | ![#7aa2f7](https://placehold.co/16x16/7aa2f7/7aa2f7.png) `#7aa2f7` |
| Solarized Dark | ![#002b36](https://placehold.co/16x16/002b36/002b36.png) `#002b36` | ![#2aa198](https://placehold.co/16x16/2aa198/2aa198.png) `#2aa198` |
| One Dark | ![#282c34](https://placehold.co/16x16/282c34/282c34.png) `#282c34` | ![#61afef](https://placehold.co/16x16/61afef/61afef.png) `#61afef` |
| Rose Pine | ![#191724](https://placehold.co/16x16/191724/191724.png) `#191724` | ![#c4a7e7](https://placehold.co/16x16/c4a7e7/c4a7e7.png) `#c4a7e7` |
| Everforest | ![#2d353b](https://placehold.co/16x16/2d353b/2d353b.png) `#2d353b` | ![#a7c080](https://placehold.co/16x16/a7c080/a7c080.png) `#a7c080` |
| Black and White | ![#0d0d0d](https://placehold.co/16x16/0d0d0d/0d0d0d.png) `#0d0d0d` | ![#e8e8e8](https://placehold.co/16x16/e8e8e8/e8e8e8.png) `#e8e8e8` |

## Features

- **10 built-in dark themes**, switchable from one settings page
- **Themes the full UI** - dashboard, login page, Docker/VM pages, tables, pie charts, usage bars, buttons, dropdowns, native dialogs, and context menus
- **Modern design style** option - rounded corners, smooth transitions, subtle depth
- **Custom CSS override** textarea for fine-tuning any color
- **Color swatch previews** when picking a theme
- **Instant apply** - no reboot or manual page refresh needed
- **Login page themed** even before authentication (CSS embedded inline, bypasses the nginx auth block)

## Installation

1. In Unraid, go to **Plugins** and click **Install Plugin**
2. Paste this URL and click **Install**:

   ```
   https://raw.githubusercontent.com/Onyxdigital-dev/ThemeUI/master/themeui.plg
   ```

## Usage

1. Go to **Settings > Utilities > ThemeUI**
2. Set **Enable ThemeUI** to `Yes`
3. Pick a theme from the dropdown - color swatches preview instantly
4. Optionally select the **Modern** design style for rounded corners
5. Click **Apply** - the page reloads with the new theme active

### Custom CSS

The **Custom CSS Override** textarea accepts any valid CSS and is injected after the selected theme. Use it to tweak specific colors or override anything the theme sets.

## Uninstall

Go to **Plugins**, find ThemeUI, and click **Remove**. The plugin removes all files, config, and the login page injection on uninstall.

## Requirements

- Unraid 7.2 or later

## License

MIT - see [LICENSE](LICENSE)
