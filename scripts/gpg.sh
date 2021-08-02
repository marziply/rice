#!/bin/bash

gpg2 --password-fd=$(lpass show --field Passphrase 928732354107351825) $@
