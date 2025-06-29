# Makefile
.PHONY: init test build deploy clean

# Variables
PYTHON = python3
PIP = pip3
VENV = venv
LAMBDA_DIR = lambda
TERRAFORM_DIR = terraform
BUILD_DIR = build
WORKSPACE ?= default

# Initialize the development environment
init:
	$(PYTHON) -m venv $(VENV)
	. $(VENV)/bin/activate && \
	$(PIP) install --upgrade pip && \
	$(PIP) install -r requirements.txt && \
	$(PIP) install pytest pytest-cov black mypy

# Run tests with coverage
test:
	. $(VENV)/bin/activate && \
	pytest tests/ --cov=$(LAMBDA_DIR) --cov-report=term-missing

# Format code
format:
	. $(VENV)/bin/activate && \
	black $(LAMBDA_DIR)/ tests/

# Type checking
typecheck:
	. $(VENV)/bin/activate && \
	mypy $(LAMBDA_DIR)/ --strict

# Build Lambda package
build: clean
	mkdir -p $(BUILD_DIR)
	cp -r $(LAMBDA_DIR)/* $(BUILD_DIR)/
	. $(VENV)/bin/activate && \
	pip install -r requirements.txt -t $(BUILD_DIR)/
	cd $(BUILD_DIR) && zip -r ../scheduler.zip .

# Deploy using Terraform
deploy:
	cd $(TERRAFORM_DIR) && \
	terraform workspace select $(WORKSPACE) && \
	terraform init && \
	terraform plan -out=tfplan && \
	terraform apply tfplan

# Clean build artifacts
clean:
	rm -rf $(BUILD_DIR)
	rm -f scheduler.zip
	rm -f .coverage
	rm -rf htmlcov/
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete