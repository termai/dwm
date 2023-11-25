#!/bin/sh

content=$(iwctl station wlan0 show | awk 'FNR == 7 {print $3}')
content="(label :limit-width 50 :text '$content')"
echo "{\"show\": $2, \"content\": \"$content\"}"
