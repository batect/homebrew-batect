#! /usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
FORMULA_DIR="$(cd "$ROOT_DIR/Formula" && pwd)"

function main() {
    updateFormula "batect-fish-completion" "completions/batect.fish"
    echo

    updateFormula "batect-zsh-completion" "_batect"
    echo

    echo "Done."
}

function updateFormula() {
    REPO="$1"
    FORMULA="$REPO.rb"
    REPO_SLUG="batect/$REPO"
    PATH_IN_REPO=$2

    echo "Updating $REPO..."
    echo "Getting latest version information..."

    LATEST_VERSION=$(curl --fail --show-error --silent "https://api.github.com/repos/$REPO_SLUG/releases/latest" | jq -r '.tag_name')
    URL="https://raw.githubusercontent.com/$REPO_SLUG/$LATEST_VERSION/$PATH_IN_REPO"
    SHA256_HASH=$(curl --fail --show-error --silent "$URL" | sha256sum - | cut -d' ' -f1)

    echo "Latest version is $LATEST_VERSION, SHA-256 hash is $SHA256_HASH."
    echo "Updating formula..."

    sed -i '' -E "s#url \".*\"#url \"$URL\"#g" "$FORMULA_DIR/$FORMULA"
    sed -i '' -E "s#sha256 \".*\"#sha256 \"$SHA256_HASH\"#g" "$FORMULA_DIR/$FORMULA"
}

main
