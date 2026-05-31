# mac_os_dots

my macos setup inspired by i3wm on linux. configs for the bar, window borders, and tiling WM.

| Path | Tool | What it does |
|------|------|--------------|
| `.config/sketchybar/` | [SketchyBar](https://github.com/FelixKratz/SketchyBar) | Top bar black & white theme, JetBrains Mono, workspace numbers, media controls, center clock |
| `.config/borders/bordersrc` | [JankyBorders](https://github.com/FelixKratz/JankyBorders) | Active-window border (solid amber) |
| `.aerospace.toml` | [AeroSpace](https://github.com/nikitabobko/AeroSpace) | Tiling window manager + gaps |

Fonts used: **JetBrainsMono Nerd Font**, **SF Pro** (icons), **sketchybar-app-font** (app icons).

## How to install on a new machine

```bash
# dependencies
brew install FelixKratz/formulae/sketchybar FelixKratz/formulae/borders nikitabobko/tap/aerospace
brew install --cask font-jetbrains-mono-nerd-font font-sketchybar-app-font

# clone + symlink
git clone git@github.com:drakeking1/mac_os_dots.git ~/mac_os_dots
~/mac_os_dots/install.sh

# start
brew services start sketchybar
brew services start borders
open -a AeroSpace
```

## Editing

Files live in this repo and are symlinked into `~`/`~/.config`, so edit them
in either place it's the same file. After changes:

```bash
brew services restart sketchybar   # or: sketchybar --reload
brew services restart borders
aerospace reload-config
```
