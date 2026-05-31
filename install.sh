#!/bin/bash
# Symlink this repo's configs into their live macOS locations.
# Safe to re-run; -n/-f make it idempotent.
set -e
DOTS="$(cd "$(dirname "$0")" && pwd)"

ln -sfn "$DOTS/.aerospace.toml" "$HOME/.aerospace.toml"

mkdir -p "$HOME/.config"
ln -sfn "$DOTS/.config/sketchybar" "$HOME/.config/sketchybar"

mkdir -p "$HOME/.config/borders"
ln -sfn "$DOTS/.config/borders/bordersrc" "$HOME/.config/borders/bordersrc"

echo "Symlinks created. Now restart the services:"
echo "  brew services restart sketchybar"
echo "  brew services restart borders"
echo "  aerospace reload-config"
