//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/	 	/*Update Interval*/	/*Update Signal*/
    {" ⦼ ", "kernel",		    360,		        2},

	{"☑", "upt",		        60,		            2},

	{"↻ Pac ", "pacupdate",		360,		        9},
	
	{"↹ Mem ", "memory",	        6,		            1},

	{" Vol ", "volume",			2,		            10},

	{"", "clock",			5,		            0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim = '|';
