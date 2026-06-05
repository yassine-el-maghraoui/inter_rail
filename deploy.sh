#!/usr/bin/env bash
# Déploie sur GitHub Pages (branche gh-pages) sans GitHub Actions.
# Le dossier build/ est recréé à chaque build, donc on réinitialise un dépôt jetable dedans.
set -euo pipefail

REPO="https://github.com/yassine-el-maghraoui/inter_rail.git"
BASE="/inter_rail"

echo "→ Build (BASE_PATH=$BASE)"
BASE_PATH="$BASE" npm run build

cd build
git init -q
git checkout -q -b gh-pages
git add -A
git -c user.email=elmaghraouiyassine3@gmail.com \
    -c user.name=yassine-el-maghraoui \
    commit -q -m "Deploy $(date +%Y-%m-%d_%H:%M)"
git push -f "$REPO" gh-pages
rm -rf .git
echo "✓ Déployé → https://yassine-el-maghraoui.github.io/inter_rail/"
