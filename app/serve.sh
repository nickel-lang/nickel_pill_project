#!/bin/bash

set -e
clear
rm -f ./config.json
nickel -f ../config.ncl export -o ./config.json
./app.py
