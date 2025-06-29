#!/bin/bash

# Configuration
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
MODULE_DIR="$SCRIPT_DIR/.."
LAYER_DIR="$MODULE_DIR/lambda"
PYTHON_VERSION="python3.9"
PYTHON_DIR="python/lib/$PYTHON_VERSION/site-packages"
PYTHON_FILE="scheduler"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Print function
print_message() {
    echo -e "${1}${2}${NC}"
}

# Error handling
set -euxo pipefail

print_message $YELLOW "Starting Lambda package build process..."

# Check requirements.txt
if [ ! -f "$LAYER_DIR/requirements.txt" ]; then
    print_message $RED "Error: requirements.txt not found in $LAYER_DIR"
    exit 1
fi

# Check $PYTHON_FILE.py
if [ ! -f "$LAYER_DIR/$PYTHON_FILE.py" ]; then
    print_message $RED "Error: $PYTHON_FILE.py not found in $LAYER_DIR"
    exit 1
fi

# Clean previous builds
print_message $YELLOW "Cleaning previous builds..."
rm -rf "$LAYER_DIR/python"
rm -f "$LAYER_DIR/dependencies.zip"
rm -f "$LAYER_DIR/$PYTHON_FILE.zip"

# Build Lambda Layer
print_message $YELLOW "Building Lambda Layer..."
mkdir -p "$LAYER_DIR/$PYTHON_DIR"

# Create virtual environment
print_message $YELLOW "Setting up virtual environment..."
cd "$LAYER_DIR"
python3 -m venv .venv
source .venv/bin/activate

# Install dependencies
print_message $YELLOW "Installing dependencies..."
pip install --upgrade pip
pip install -r requirements.txt -t "$PYTHON_DIR"

# Create layer ZIP
print_message $YELLOW "Creating Lambda layer archive..."
cd "$LAYER_DIR"
zip -r dependencies.zip python/ > /dev/null

# Create function ZIP
print_message $YELLOW "Creating function archive..."
zip $PYTHON_FILE.zip $PYTHON_FILE.py > /dev/null

# Cleanup
print_message $YELLOW "Cleaning up build artifacts..."
rm -rf python/
rm -rf .venv/

# Show results
LAYER_SIZE=$(du -h dependencies.zip | cut -f1)
FUNC_SIZE=$(du -h $PYTHON_FILE.zip | cut -f1)

print_message $GREEN "\nBuild completed successfully!"
print_message $GREEN "Lambda layer location: $LAYER_DIR/dependencies.zip (size: $LAYER_SIZE)"
print_message $GREEN "Function code location: $LAYER_DIR/$PYTHON_FILE.zip (size: $FUNC_SIZE)"

print_message $YELLOW "\nLayer contents:"
unzip -l dependencies.zip | sed '1,3d' | sed '$d' | sed '$d' | awk '{print $4}'

print_message $YELLOW "\nFunction contents:"
unzip -l $PYTHON_FILE.zip | sed '1,3d' | sed '$d' | sed '$d' | awk '{print $4}'