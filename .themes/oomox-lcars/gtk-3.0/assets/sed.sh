#!/bin/sh
sed -i \
         -e 's/#171B2C/rgb(0%,0%,0%)/g' \
         -e 's/#ffffff/rgb(100%,100%,100%)/g' \
    -e 's/#171B2C/rgb(50%,0%,0%)/g' \
     -e 's/#756bff/rgb(0%,50%,0%)/g' \
     -e 's/#171b2c/rgb(50%,0%,50%)/g' \
     -e 's/#ffffff/rgb(0%,0%,50%)/g' \
	"$@"
