//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{" ", "uptime -p | awk '{printf \"%dh %dm\\n\", $2, $4}'",	2,	0},
	
  {" ", "/home/termai/scripts/volumo.sh",	2,	0},
	
  {"", "/home/termai/scripts/mem.sh",	10,		0},

	{"", "date '+%a %D %I:%M %p'",					2,		0},
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
