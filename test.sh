#!/bin/bash

set -e
rm -f config.json
clear
nickel -f config.ncl export -o config.json
cat config.json
echo ""
