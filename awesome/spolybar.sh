#!/bin/sh
polybar-msg cmd quit
killall polybar
polybar &
