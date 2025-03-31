# Name of your virtual environment directory
VENV_DIR := venv
PYTHON := $(VENV_DIR)/Scripts/python
PIP := $(VENV_DIR)/Scripts/pip
JUPYTER := $(VENV_DIR)/Scripts/jupyter

# Create virtual environment only if it doesn't exist
$(VENV_DIR):
	python -m venv $(VENV_DIR)
	$(PYTHON) -m pip install --upgrade pip
	$(PIP) install --upgrade pip
	$(PIP) install -r requirements.txt

# Launch Jupyter Notebook using the virtualenv
notebook: $(VENV_DIR)
	$(JUPYTER) notebook

# Clean up virtual environment
clean:
	rm -rf $(VENV_DIR)

.PHONY: notebook clean
