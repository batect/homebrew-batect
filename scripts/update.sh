#! /usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
FORMULA_DIR="$(cd "$ROOT_DIR/Formula" && pwd)"

echo "Getting latest version information..."

LATEST_VERSION=$(curl --fail --show-error --silent https://api.github.com/repos/batect/fish-completion/releases/latest | jq -r '.tag_name')
URL="https://raw.githubusercontent.com/batect/fish-completion/$LATEST_VERSION/completions/batect.fish"
SHA256_HASH=$(curl --fail --show-error --silent "$URL" | sha256sum - | cut -d' ' -f1)

echo "Latest version is $LATEST_VERSION, SHA-256 hash is $SHA256_HASH."
echo "Updating formula..."

sed -i '' -E "s#url \".*\"#url \"$URL\"#g" "$FORMULA_DIR/batect-fish-completion.rb"
sed -i '' -E "s#sha256 \".*\"#sha256 \"$SHA256_HASH\"#g" "$FORMULA_DIR/batect-fish-completion.rb"

echo "Done."
