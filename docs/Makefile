.POSIX:  # COMPATIBILITY: BSD Make, GNU Make (>= 4.0)

REPO_DIR  != git rev-parse --show-toplevel
LOCAL_DIR  = ${REPO_DIR}/.local
MAN7_DIR   = ${LOCAL_DIR}/share/man/man7

MANDOC_CSS_URI = https://wesaugur.sh/mandoc.css

.PHONY: all gitleaks shellcheck

all: dotfiles.7 dotfiles.7.html ${MAN7_DIR}/dotfiles.7 git-clone-home \
     gitleaks shellcheck

.SUFFIXES: .7.adoc .7 .7.html

# %.7: %.7.adoc
.7.adoc.7:
	asciidoctor --backend=manpage $<

# %.7.html: %.7
.7.7.html:
	mandoc -T html -O style=${MANDOC_CSS_URI} $< > $@

${MAN7_DIR}/dotfiles.7: dotfiles.7
	install -m 0644 $< $@

git-clone-home: ${LOCAL_DIR}/bin/git-clone-home
	install -m 0755 $< $@

gitleaks:
	gitleaks --path=${REPO_DIR}

shellcheck:
	git grep --files-with-matches -e '^#!/bin/sh' -e '^#\s*shellcheck' -- :/ | \
	xargs shellcheck
