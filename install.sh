#!/bin/bash
# One-shot installer for this macOS theme: SketchyBar + JankyBorders + AeroSpace.
# Installs dependencies, fonts (incl. custom app-icon font), symlinks the
# configs, and starts the services. Safe to re-run.
set -euo pipefail

DOTS="$(cd "$(dirname "$0")" && pwd)"

echo "==> 1/5  Homebrew"
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # add brew to PATH for this run (Apple Silicon default)
  [ -x /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "==> 2/5  Tools (sketchybar, borders, aerospace)"
brew install FelixKratz/formulae/sketchybar FelixKratz/formulae/borders
brew install --cask nikitabobko/tap/aerospace

echo "==> 3/5  Fonts"
brew install --cask font-jetbrains-mono-nerd-font font-sketchybar-app-font || true
# Overwrite the stock app-icon font with our custom build (adds Google Ads,
# OnlyOffice, LM Studio, YouTube Music, Claude, etc.)
if [ -f "$DOTS/icons/sketchybar-app-font.ttf" ]; then
  cp "$DOTS/icons/sketchybar-app-font.ttf" "$HOME/Library/Fonts/sketchybar-app-font.ttf"
  echo "    installed custom sketchybar-app-font.ttf"
fi

echo "==> 4/5  Symlink configs (existing files backed up to *.bak)"
link() { # link <target-in-repo> <dest>
  local target="$1" dest="$2"
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    mv "$dest" "$dest.bak.$(date +%s)"
    echo "    backed up existing $dest"
  fi
  ln -sfn "$target" "$dest"
  echo "    $dest -> $target"
}
mkdir -p "$HOME/.config" "$HOME/.config/borders"
link "$DOTS/.aerospace.toml"           "$HOME/.aerospace.toml"
link "$DOTS/.config/sketchybar"        "$HOME/.config/sketchybar"
link "$DOTS/.config/borders/bordersrc" "$HOME/.config/borders/bordersrc"

echo "==> 5/5  Start services"
brew services start sketchybar
brew services start borders
open -a AeroSpace 2>/dev/null || true

cat <<'NOTE'

Done! A few manual touches:
  • Media buttons (back/playpause/next) need Accessibility permission:
      System Settings -> Privacy & Security -> Accessibility -> enable "sketchybar"
  • Clock is hardcoded to US Mountain Time. To change it, edit the TZ line in
      ~/.config/sketchybar/plugins/clock.sh  (e.g. TZ="America/New_York")
  • AeroSpace workspace->monitor assignments in ~/.aerospace.toml may be
      specific to a multi-monitor setup; adjust if your layout differs.
