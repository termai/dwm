#!/bin/sh


uptimes() {
  uptime | awk -F'[ ,]+' '{printf "%d Hours : %d mins\n", $4, $5}'
}

imagas() {

coverart="(image :class \"cover-arts\" :path \"/tmp/cover.jpg\" :image-width 304 image-height 304)"
#echo "(box :class \"cover-arts\" :space-evenly \"false\" :orientation \"h\" :style \"background-image: url('/tmp/cover.jpg');\")"
echo "(box :class \"cover-art\" :space-evenly \"false\" :orientation \"h\" (button :class \"cover-arts\" :style \"background-image: url('/tmp/cover.jpg');\"))"

}


profile() {

#echo "(box :class \"cover-arts\" :space-evenly \"false\" :orientation \"h\" :style \"background-image: url('/tmp/cover.jpg');\")"
echo "(box :class \"avatar-box\" :space-evenly \"false\" :orientation \"h\" (button :class \"avatar-boxx\" :style \"background-image: url('/home/termai/.config/eww/bar_dwm2/widgets/noti/images/avatar.jpg');\"))"

}






"$@"

