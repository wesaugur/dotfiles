.POSIX:  # COMPATIBILITY: BSD Make, GNU Make

.PHONY: all help key key-fido key-fido-resident key-fido-strong \
        --token-var-required --fido-pin-required

all: help

help:
	@echo 'usage: make key [EMAIL=<label>] [DATE=<label>]'
	@echo '       make key{-fido|-fido-resident|-fido-strong} TOKEN=<label> [EMAIL=<label>] [DATE=<label>]'

TYPE  ?= ed25519
#     OR ed25519-sk

EMAIL ?= ${USER}@$$(uname -n | cut -d. -f1)
TOKEN ?= notoken
DATE  ?= $$(date -u '+%Y%m%d')
NAME   = ${EMAIL}-${TOKEN}-${DATE}-ssh

key:
	ssh-keygen -t ${TYPE} -C "${NAME}" -f "${NAME}" ${SSH_KEYGEN_ARGS}
	mv "${NAME}" "${NAME}.sec"
	ssh-keygen -l  -f "${NAME}.pub" >> "${NAME}.fingerprint"
	ssh-keygen -Bv -f "${NAME}.pub" >> "${NAME}.fingerprint"

key-fido: --token-var-required
	$(MAKE) key TYPE=ed25519-sk

key-fido-resident: --token-var-required --fido-pin-required
	$(MAKE) key TYPE=ed25519-sk SSH_KEYGEN_ARGS="-O resident -O application=ssh://${NAME}"
	@echo 'USAGE:'
	@echo '> ssh-add -K         # Load resident keys from FIDO token into ssh-agent'
	@echo '> ssh-keygen -K      # Download resident keys from FIDO token into $$PWD'
	@echo '> ykman fido list    # List resident keys on YubiKey FIDO token'
	@echo '> ykman fido delete  # Delete a resident key on YubiKey FIDO token'

key-fido-strong: --token-var-required --fido-pin-required
	$(MAKE) key TYPE=ed25519-sk SSH_KEYGEN_ARGS='-a 64 -O verify-required'

--token-var-required:
	@[ "${TOKEN}" != notoken ] || ( echo 'TOKEN var is required' ; exit 3 )

--fido-pin-required:
	ykman info && { ykman fido info | tee /dev/tty | grep -i 'pin is set' || ykman fido set-pin ; }
