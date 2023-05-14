#! /usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
FORMULA_DIR="$(cd "$ROOT_DIR/Formula" && pwd)"

function main() {
    updateSingleFileFormula "batect-bash-completion" "batect.bash"
    echo

    updateRepoArchiveFormula "batect-fish-completion"
    echo

    updateSingleFileFormula "batect-zsh-completion" "_batect"
    echo

    echo "Done."
}

function updateSingleFileFormula() {
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

function updateRepoArchiveFormula() {
    REPO="$1"
    FORMULA="$REPO.rb"
    REPO_SLUG="batect/$REPO"

    echo "Updating $REPO..."
    echo "Getting latest version information..."

    LATEST_VERSION=$(curl --fail --show-error --silent "https://api.github.com/repos/$REPO_SLUG/releases/latest" | jq -r '.tag_name')
    URL="https://github.com/$REPO_SLUG/archive/refs/tags/$LATEST_VERSION.tar.gz"

    # Homebrew redirects .tar.gz downloads to this location, which have different checksums:
    CHECKSUM_URL="https://codeload.github.com/$REPO_SLUG/tar.gz/refs/tags/$LATEST_VERSION"
    SHA256_HASH=$(curl --fail --show-error --silent "$CHECKSUM_URL" | sha256sum - | cut -d' ' -f1)

    echo "Latest version is $LATEST_VERSION, SHA-256 hash is $SHA256_HASH."
    echo "Updating formula..."

    sed -i '' -E "s#url \".*\"#url \"$URL\"#g" "$FORMULA_DIR/$FORMULA"
    sed -i '' -E "s#sha256 \".*\"#sha256 \"$SHA256_HASH\"#g" "$FORMULA_DIR/$FORMULA"
}

main
