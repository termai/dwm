static char normalbgcolor[]           = "#1d2021";
static char normalbordercolor[]       = "#1f2234";
static char normalfgcolor[]           = "#ebdbb2";
static char selcfgcolor[]            = "#ebdbb2";
static char selcbordercolor[]        = "#ebdbb2";
static char selcbgcolor[]            = "#1d2021";
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
  { "#808080", "#1d2021" }, /* norm */
  //{ normalfgcolor, "#1d2021"  }, /* sel */
  { normalbgcolor, normalfgcolor  }, /* sel */
  { "#ffffff",  "#1d2021" }, /* occ but not sel */
  //{ col_cyan,  col_gray3 }, /* has pinned tag */
};
