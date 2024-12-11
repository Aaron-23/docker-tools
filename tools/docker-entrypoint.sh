#!/bin/bash 
set -e

alias ll='ls -l' 
# pause
echo "Pausing for ${SLEEP:-0} seconds..."
sleep ${SLEEP:-0}