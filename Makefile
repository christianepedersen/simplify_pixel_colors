# Name of your virtual environment directory
VENV_DIR := venv
PYTHON := $(VENV_DIR)/Scripts/python
PIP := $(VENV_DIR)/Scripts/pip
JUPYTER := $(VENV_DIR)/Scripts/jupyter

# Default target: set up env
all: venv install

# Create virtual environment
venv:
	python -m venv $(VENV_DIR)
	$(PYTHON) -m pip install --upgrade pip

# Install Python packages
install: venv
	$(PIP) install --upgrade pip
	$(PIP) install -r requirements.txt

# Launch Jupyter Notebook using the virtualenv
notebook: install
	$(JUPYTER) notebook

# Clean up virtual environment
clean:
	rm -rf $(VENV_DIR)

.PHONY: all venv install notebook clean
