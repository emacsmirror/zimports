export EMACS ?= emacs
CASK = cask

install: .install-$(EMACS)

.install-$(EMACS):
	$(CASK) install
	$(CASK) update
	touch $@

lint: install
	cask exec emacs -Q --batch -l elisp-lint.el -f elisp-lint-files-batch  zimports.el

test: install
	$(CASK) exec buttercup -L .

.PHONY: install lint
