#!/bin/bash

# Check and install curl if not available
if ! command -v curl &>/dev/null; then
    echo "curl not found. Installing..."
    apt-get update -qq && apt-get install -y curl
    if ! command -v curl &>/dev/null; then
        echo "Failed to install curl. Please install it manually and retry."
        exit 1
    fi
fi

# Check and install unzip if not available
if ! command -v unzip &>/dev/null; then
    echo "unzip not found. Installing..."
    apt-get update -qq && apt-get install -y unzip
    if ! command -v unzip &>/dev/null; then
        echo "Failed to install unzip. Please install it manually and retry."
        exit 1
    fi
fi

REPO="doivedau1905/piBrick"
SCREEN="${1:-}"
VERSION="${2:-latest}"

SCREENS=("3.92inch" "5.48inch")

if [ -z "$SCREEN" ]; then
    echo "Select your piBrick screen size:"
    for i in "${!SCREENS[@]}"; do
        echo "  $((i+1)). ${SCREENS[$i]}"
    done
    read -p "Enter number: " choice
    SCREEN="${SCREENS[$((choice-1))]}"
fi

if [[ ! " ${SCREENS[*]} " =~ " $SCREEN " ]]; then
    echo "Unknown screen: $SCREEN"
    echo "Available: ${SCREENS[*]}"
    exit 1
fi

FILENAME="pibrick_${SCREEN}.zip"

if [ "$VERSION" = "latest" ]; then
    URL="https://github.com/$REPO/releases/latest/download/$FILENAME"
else
    URL="https://github.com/$REPO/releases/download/$VERSION/$FILENAME"
fi

echo "Downloading piBrick driver for $SCREEN ($VERSION)..."

TMP=$(mktemp -d)
curl -sSL "$URL" -o "$TMP/$FILENAME"

if [ $? -ne 0 ]; then
    echo "Download failed. Check your screen size, version tag, or internet connection."
    rm -rf "$TMP"
    exit 1
fi

echo "Extracting..."
unzip -q "$TMP/$FILENAME" -d "$TMP/pibrick"

echo "Installing..."
cd "$TMP/pibrick"
bash ./install.sh

rm -rf "$TMP"
