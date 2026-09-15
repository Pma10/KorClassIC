#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FUWARI_REF="${FUWARI_REF:-6d39b0dec41282e7852e23e032998a5789abee28}"
SITE_URL="${SITE_URL:-https://korclassic.pma.kr}"
BASE_PATH="${BASE_PATH:-/}"
BUILD_ROOT="$ROOT_DIR/.build"
SITE_DIR="$BUILD_ROOT/fuwari"

rm -rf "$SITE_DIR" "$ROOT_DIR/dist"
mkdir -p "$BUILD_ROOT"

git init -q "$SITE_DIR"
git -C "$SITE_DIR" remote add origin https://github.com/saicaca/fuwari.git
git -C "$SITE_DIR" fetch -q --depth=1 origin "$FUWARI_REF"
git -C "$SITE_DIR" checkout -q --detach FETCH_HEAD

rm -rf "$SITE_DIR/src/content/posts"
mkdir -p "$SITE_DIR/src/content/posts" "$SITE_DIR/src/content/spec"
cp -R "$ROOT_DIR/fuwari-overrides/posts/." "$SITE_DIR/src/content/posts/"
cp "$ROOT_DIR/fuwari-overrides/config.ts" "$SITE_DIR/src/config.ts"
cp "$ROOT_DIR/fuwari-overrides/about.md" "$SITE_DIR/src/content/spec/about.md"
cp "$ROOT_DIR/fuwari-overrides/Profile.astro" "$SITE_DIR/src/components/widget/Profile.astro"

SITE_URL="$SITE_URL" BASE_PATH="$BASE_PATH" SITE_DIR="$SITE_DIR" node <<'NODE'
const fs = require('node:fs');
const path = require('node:path');
const file = path.join(process.env.SITE_DIR, 'astro.config.mjs');
let source = fs.readFileSync(file, 'utf8');
const site = process.env.SITE_URL;
const base = process.env.BASE_PATH;
source = source.replace('site: "https://fuwari.vercel.app/",', `site: ${JSON.stringify(site)},`);
source = source.replace('base: "/",', `base: ${JSON.stringify(base)},`);
fs.writeFileSync(file, source);
NODE

pnpm --dir "$SITE_DIR" install --frozen-lockfile
pnpm --dir "$SITE_DIR" build
cp -R "$SITE_DIR/dist" "$ROOT_DIR/dist"

printf 'Built KorClassIC with Fuwari %s for %s%s\n' "$FUWARI_REF" "$SITE_URL" "$BASE_PATH"
