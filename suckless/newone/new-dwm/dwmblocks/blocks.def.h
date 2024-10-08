//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
//{" ", "uptime -p | awk '{printf \"%dh %dm\\n\", $2, $4}'",	2,	0},
//{" ", " iwctl station wlan0 show | awk 'FNR == 7 {print $3}'", 2, 0},
  //{" ", "echo $(playerctl metadata title) - $(playerctl metadata artist)", 2, 0},
  {" ", "/sbin/iwgetid | awk -F: '{print $2}' | sed 's/\"//g'", 2, 0},
  {" Uptime: ", "awk '{printf(\"%d:%02d:%02d:%02d\\n\",($1/60/60/24),($1/60/60%24),($1/60%60),($1%60))}' /proc/uptime", 2, 0},

  {" ", "/home/termai/scripts/volumo.sh",	2,	0},
	
  {"", "/home/termai/scripts/mem.sh",	10,		0},

	{"", "date '+%a %D %I:%M %p'",					2,		0},
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
