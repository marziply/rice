#!/bin/bash

gpg \
  --passphrase "$(lpass show --field Passphrase 928732354107351825)" \
  --pinentry-mode loopback \
  --batch \
  $@
