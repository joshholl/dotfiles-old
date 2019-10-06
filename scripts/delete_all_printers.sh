#!/usr/bin/env bash

for i in $(cat /etc/printcap | cut -f1 -d'|' | grep '^#' -v); do lpadmin -x $1; done

