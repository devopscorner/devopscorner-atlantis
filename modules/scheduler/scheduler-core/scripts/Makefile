#!/bin/bash

# Script to build Lambda layer with dependencies
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
LAYER_DIR="$SCRIPT_DIR/../lambda"
PYTHON_DIR="python/lib/python3.9/site-packages"

# Create directories
mkdir -p "$LAYER_DIR/$PYTHON_DIR"

# Install dependencies
pip install -r "$LAYER_DIR/requirements.txt" -t "$LAYER_DIR/$PYTHON_DIR"

# Create layer ZIP
cd "$LAYER_DIR"
zip -r dependencies.zip python/

# Cleanup
rm -rf python/

# modules/activity-logs/Makefile
.PHONY: build-layer test clean

build-layer:
	./scripts/build_lambda_layer.sh

test:
	python -m pytest tests/

clean:
	rm -rf lambda/*.zip
	rm -rf lambda/python
	find . -type d -name "__pycache__" -exec rm -rf {} +