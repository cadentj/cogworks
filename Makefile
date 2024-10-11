# Variables
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = source
BUILDDIR      = build
DOCSDIR       = docs

# Default target
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile clean_docs move_files nojekyll build_docs deploy

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

# Target to build the Sphinx documentation
build_docs:
	@echo "Building the Sphinx documentation..."
	$(SPHINXBUILD) -M dirhtml "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS)
	@echo "Sphinx documentation built."

# Target to clean the /docs directory
clean_docs:
	@echo "Cleaning the /docs directory..."
	rm -rf $(DOCSDIR)/*
	@echo "Cleaned the /docs directory."

# Target to move everything from build/dirhtml to /docs
move_files:
	@echo "Moving files from build/dirhtml to /docs..."
	cp -r $(BUILDDIR)/dirhtml/* $(DOCSDIR)/
	@echo "Moved files to /docs."

# Target to create the .nojekyll file in /docs
nojekyll:
	@echo "Creating .nojekyll in /docs..."
	touch $(DOCSDIR)/.nojekyll
	@echo "Created .nojekyll in /docs."

# Target to build, clean, move files, and create .nojekyll
deploy: build_docs clean_docs move_files nojekyll
	@echo "Deployment completed."