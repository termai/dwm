#!/bin/bash
export XSECURELOCK_SAVER=saver_mpv
export XSECURELOCK_PASSWORD_PROMPT=cursor
export XSECURELOCK_SINGLE_AUTH_WINDOW=1
#export XSECURELOCK_LIST_VIDEOS_COMMAND="find ~/Videos/ -type f | sort -R"
export XSECURELOCK_LIST_VIDEOS_COMMAND="find ~/Videos/ -type f"
xsecurelock
