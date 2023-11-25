#!/bin/bash

wifi=$(nmcli general status | awk 'FNR==2 {print $4}')
which=$(iwgetid -r)

if [[ $wifi == 'enabled' ]]
then
  echo 
else 
  echo 󱚵
fi


