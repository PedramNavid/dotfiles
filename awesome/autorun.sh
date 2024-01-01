#!/bin/sh

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

run "compfy"
run "spotify"
run "discord"
run "slack"
run "obsidian"
