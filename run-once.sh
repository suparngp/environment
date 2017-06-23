#!/bin/sh
rc_file="$HOME/.shell.config"
touch $rc_file
echo "source $rc_file" >> ~/.zshrc