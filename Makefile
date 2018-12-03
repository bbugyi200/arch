.DEFAULT_GOAL := help

PREFIX ?= /usr
BINDIR ?= $(PREFIX)/bin

bindir = $(DESTDIR)/$(BINDIR)
runtests = test_arch.py
project = arch


.PHONY: help
help:  ## Print this message.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST) | sort

.PHONY: install
install:  ## Install arch.
	cp $(project) $(bindir)/$(project)
	chmod +x $(bindir)/$(project)

.PHONY: test check
test: check
check: $(runtests) ## Run all tests.
	pytest ./$(runtests)
