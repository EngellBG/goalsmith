#!/usr/bin/env bash
set -euo pipefail

# Instala el skill goalsmith en Claude Code.
SRC="$(cd "$(dirname "$0")" && pwd)/skill"
DEST="${HOME}/.claude/skills/goalsmith"

mkdir -p "$DEST"
cp -R "$SRC/." "$DEST/"

echo "goalsmith instalado en $DEST"
echo "Reinicia Claude Code o corre /reload-skills para activarlo."
