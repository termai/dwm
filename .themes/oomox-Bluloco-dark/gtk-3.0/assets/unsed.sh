#!/bin/sh
sed -i \
         -e 's/rgb(0%,0%,0%)/#282c34/g' \
         -e 's/rgb(100%,100%,100%)/#cdd3e0/g' \
    -e 's/rgb(50%,0%,0%)/#303842/g' \
     -e 's/rgb(0%,50%,0%)/#285bff/g' \
 -e 's/rgb(0%,50.196078%,0%)/#285bff/g' \
     -e 's/rgb(50%,0%,50%)/#3d434f/g' \
 -e 's/rgb(50.196078%,0%,50.196078%)/#3d434f/g' \
     -e 's/rgb(0%,0%,50%)/#d3dae3/g' \
	"$@"