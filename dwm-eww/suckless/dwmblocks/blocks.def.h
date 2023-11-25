//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
  /*Icon*/  /*Command*/   /*Update Interval*/ /*Update Signal*/
  //{"", "/home/termai/scripts/prayer",   30,    0},
  {"", "/home/termai/scripts/non-vol mpriss",   1,    0},
  //{"", "/home/termai/scripts/sb-vol",   1,    10},
  {"", "/home/termai/scripts/non-vol volume",   1,    10},
  //{"", "/home/termai/scripts/batt",     5,     3},
  {"", "/home/termai/scripts/non-vol timess",     1,     0},

};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
