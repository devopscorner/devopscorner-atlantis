# Makefile

.PHONY: all clean build test package info

# Variables
LAYER_DIR = lambda
SCRIPTS_DIR = scripts

all: clean build test

build:
	@echo "Building Lambda packages..."
	@bash $(SCRIPTS_DIR)/build_lambda_layer.sh

clean:
	@echo "Cleaning build artifacts..."
	@rm -rf $(LAYER_DIR)/*.zip
	@rm -rf $(LAYER_DIR)/python
	@rm -rf $(LAYER_DIR)/.venv
	@find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true

test:
	@echo "Running tests..."
	@python3 -m pytest tests/ -v

info:
	@if [ -f $(LAYER_DIR)/dependencies.zip ] && [ -f $(LAYER_DIR)/scheduler.zip ]; then \
		echo "Lambda Layer:"; \
		echo "Size: $$(du -h $(LAYER_DIR)/dependencies.zip | cut -f1)"; \
		echo "\nLayer Contents:"; \
		unzip -l $(LAYER_DIR)/dependencies.zip | sed '1,3d' | sed '$d' | sed '$d' | awk '{print $$4}'; \
		echo "\nLambda Function:"; \
		echo "Size: $$(du -h $(LAYER_DIR)/scheduler.zip | cut -f1)"; \
		echo "\nFunction Contents:"; \
		unzip -l $(LAYER_DIR)/scheduler.zip | sed '1,3d' | sed '$d' | sed '$d' | awk '{print $$4}'; \
	else \
		echo "Lambda packages not found. Run 'make build' first."; \
	fi

# Helper targets
package: clean build

update: package
	@echo "Updating Lambda function and layer..."
	@terraform apply -target=aws_lambda_layer_version.dependencies -target=aws_lambda_function.scheduler