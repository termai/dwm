//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
  /*Icon*/  /*Command*/   /*Update Interval*/ /*Update Signal*/
  {"", "prayer",  30,   0},
  {"", "~/more-github/move_to_github/dwm/scripts/weath.sh", 600,   0},
  //{"", "newdwmstatusbar", 1,   0},
  {"", "/home/termi/sb-vol", 1,   1},
  //{"", "batt", 1,   0},
  {"", "/home/termi/batt.sh", 30,   0},
  {"", "~/.myconfig/dwm-blocks/time", 1,   0},

};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
