#!/bin/sh
polybar-msg cmd quit || true
killall polybar || true
polybar &
