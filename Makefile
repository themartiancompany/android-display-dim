#
# SPDX-License-Identifier: AGPL-3.0-or-later

PREFIX ?= /usr/local
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/android-display-dim
BIN_DIR=$(DESTDIR)$(PREFIX)/bin

DOC_FILES=$(wildcard *.rst)
SCRIPT_FILES=$(wildcard android-display-dim/*)

all:

check: shellcheck

shellcheck:
	shellcheck -s bash $(SCRIPT_FILES)

install: install-scripts install-doc

install-scripts:

	install -vDm 755 android-display-dim/android-display-dim "$(BIN_DIR)/android-display-dim"

install-doc:

	install -vDm 644 $(DOC_FILES) -t $(DOC_DIR)

.PHONY: check install install-doc install-scripts shellcheck
