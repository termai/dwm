//static char normalbgcolor[]           = "#ffffff";

//static char normalbordercolor[]       = "#010101";

//static char normalfgcolor[]           = "#010101";
//static char selcfgcolor[]            = "#010101";

//static char selcbordercolor[]        = "#ffffff";

//static char selcbgcolor[]            = "#ffffff";

static char normalbgcolor[]           = "#010101";
static char normalbordercolor[]       = "#010101";
static char normalfgcolor[]           = "#ffffff";
static char selcfgcolor[]            = "#ffffff";
static char selcbordercolor[]        = "#ffffff";
static char selcbgcolor[]            = "#010101";

/*
static const char *tagsel[][2] = {
   //   fg         bg    
  { "#808080", "#1d2021" }, // norm 
  { normalfgcolor, "#1d2021"  }, // sel 
  { "#ffffff",  "#1d2021" }, // occ but not sel
  //{ col_cyan,  col_gray3 }, // has pinned tag
};*/


static const char *tagsel[][2] = {
   /*   fg         bg    */
  { "#808080", "#010101" }, /* norm */
  //{ normalfgcolor, "#1d2021"  }, /* sel */
  { normalbgcolor, normalfgcolor  }, /* sel */
  { "#ffffff",  "#010101" }, /* occ but not sel */
  //{ col_cyan,  col_gray3 }, /* has pinned tag */
};
