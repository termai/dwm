#!/bin/bash

mptitle=$(playerctl metadata --format "{{ title }}" | tr -d \"\"\")
mpmedia=$(echo "$mptitle")
mpmedias=$(echo "$mpmedia" | awk '{ if (length($0) <= 26) print; else print substr($0, 1, 26) "..." }')
printf "$mpmedias"

