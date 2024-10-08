/* See LICENSE file for copyright and license details. */
#include <X11/XF86keysym.h>
//Cool
#define SESSION_FILE "/tmp/dwm-session"

#include "themes/gruvbox-dark.h"

/* appearance */
static const unsigned int borderpx  = 3;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int swallowfloating    = 0;        /* 1 means swallow floating windows by default */
static const unsigned int gappih    = 20;       /* horiz inner gap between windows */
static const unsigned int gappiv    = 10;       /* vert inner gap between windows */
static const unsigned int gappoh    = 10;       /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 10;       /* vert outer gap between windows and screen edge */
static       int smartgaps          = 0;        /* 1 means no outer gap when there is only one window */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 0;        /* 0 means bottom bar */
static const int vertpad            = 10;       /* vertical padding of bar */
static const int sidepad            = 10;       /* horizontal padding of bar */
static const char *fonts[]          = { "JetBrainsMono NF:size=12", "JoyPixels:pixelsize=12:antialias=true:autohint=true"};
static const char dmenufont[]       = "JetBrainsMono NF:size=12";
static char *colors[][3] = {
       /*               fg           bg           border   */
       [SchemeNorm] = { normalfgcolor, normalbgcolor, normalbordercolor },
       [SchemeSel]  = { selcfgcolor,  selcbgcolor,  selcbordercolor  },
};



//#include "/home/termi/.cache/wal/colors-wal-dwm.h"
/*
static const char *colors[][3]      = {
        //               fg         bg         border   //
        [SchemeNorm] = { col_cyan, col_gray1, col_gray2 },
        [SchemeSel]  = { col_gray1, col_cyan,  col_cyan  },
};
*/



/* tagging */
//Default

//static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };
// FontAwesome
static const char *tags[] = { "", "", "", "", ""};
//JetBrains MOno
//static const char *tags[] = { "", "", "", "", ""};
//Jet brains Mono
//static const char *tags[] = { "", "", "", "", ""};
//Fontawesome
//static const char *tags[] = { "", "", "", "", ""};

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	//{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	//{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
	/* class     instance  title           tags mask  isfloating  isterminal  noswallow  monitor */
	{ "Gimp",    NULL,     NULL,           0,         1,          0,           0,        -1 },
	{ "Firefox", NULL,     NULL,           1 << 8,    0,          0,          -1,        -1 },
	{ "st-256color",      NULL,     NULL,           0,         0,          1,           0,        -1 },
	{ "Alacritty",      NULL,     NULL,           0,         0,          1,           0,        -1 },
	{ NULL,      NULL,     "Event Tester", 0,         0,          0,           1,        -1 }, /* xev */
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

#define FORCE_VSPLIT 1  /* nrowgrid layout: force two clients to always split vertically */
#include "vanitygaps.c"
#include "selfrestart.c"

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	//{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
	{ "[@]",      spiral },
	{ "[\\]",     dwindle },
	{ "H[]",      deck },
	{ "TTT",      bstack },
	{ "===",      bstackhoriz },
	{ "HHH",      grid },
	{ "###",      nrowgrid },
	{ "---",      horizgrid },
	{ ":::",      gaplessgrid },
	{ "|M|",      centeredmaster },
	{ ">M>",      centeredfloatingmaster },
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ NULL,       NULL },
};



/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */


//COmmands
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
//static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };

static const char *dmenucmd[] = { "dmenu_run", "-fn", dmenufont, "-nb", normalbgcolor, "-nf", normalfgcolor, "-sb", selcbordercolor, "-sf", selcfgcolor, NULL };



static const char *rofi[] = { "rofi", "-show", "run", "-show-icons", NULL };
static const char *termcmd[]  = { "alacritty", NULL };
//static const char *termcmd[]  = { "st", NULL };
static const char *vlc[]  = { "vlc", NULL };
static const char *obsidian[]  = { "flatpak", "run", "md.obsidian.Obsidian", NULL };
static const char *wallpa[] = { "feh", "--bg-fill", "-r", "-z", "/home/termai/wallpapers3/", NULL };
static const char *browser[]    = {"google-chrome-stable", NULL };
static const char *shot[]    = {"scrot", "/home/termai/Pictures/Screenshots/%Y-%m-%d-%T-screenshot.png", NULL };

static const char *mute[] = { "amixer", "-q", "set", "Master", "toggle", NULL };
static const char *volup[] = { "amixer", "-q", "set", "Master", "5%+", "unmute", NULL };
static const char *voldown[] = { "amixer", "-q", "set", "Master", "5%-", "unmute", NULL };
//static const char *startimage[] = { "~/nitrowall.sh", "&", NULL };
static const char *fourtabs[] = { "/home/termai/scripts/fourtabs.sh", NULL };
static const char *endimage[] = { "endimage", NULL };


static const Key keys[] = {
        /* modifier                     key        function        argument */
        { MODKEY,                       XK_p,      spawn,          {.v = rofi } },
        { MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
				{ MODKEY,                       XK_v, spawn,          {.v = vlc } },
        { MODKEY,                       XK_t, spawn,          {.v = obsidian } },
				{ MODKEY,                       XK_n,      spawn,          {.v = wallpa } },
        { MODKEY,                       XK_b,      spawn,          {.v = browser } },
        { MODKEY,                       XK_c,      spawn,          {.v = shot } },
        { MODKEY,                       XK_e,      spawn,          {.v = endimage } },
        { MODKEY,                       XK_x,      spawn,          {.v = fourtabs } },
        { 0,                            XF86XK_AudioMute, spawn,   {.v = mute } },
        { 0,                            XF86XK_AudioLowerVolume,   spawn, {.v = voldown } },
        { 0,                            XF86XK_AudioRaiseVolume,   spawn, {.v = volup } },
        { MODKEY,                       XK_apostrophe,      togglebar,      {0} },
        { MODKEY,                       XK_bracketright,      focusstack,     {.i = +1 } },
        { MODKEY,                       XK_bracketleft,      focusstack,     {.i = -1 } },
        { MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
        { MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
        { MODKEY,                       XK_k,      setmfact,       {.f = -0.05} },
        { MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
        { MODKEY|ShiftMask,             XK_Return, zoom,           {0} },
        { MODKEY,                       XK_Tab,    view,           {0} },
        { MODKEY,                       XK_q,      killclient,     {0} },
        { MODKEY,                       XK_f,      setlayout,      {.v = &layouts[0]} },
        { MODKEY,                       XK_m,      setlayout,      {.v = &layouts[1]} },
        { MODKEY,                       XK_t,      setlayout,      {.v = &layouts[2]} },
        { MODKEY,                       XK_space,  setlayout,      {0} },
        { MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
        { MODKEY,                       XK_0,      view,           {.ui = ~0 } },
        { MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
        { MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
        { MODKEY,                       XK_period, focusmon,       {.i = +1 } },
        { MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
        { MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
				{ MODKEY|ShiftMask,             XK_h,      setcfact,       {.f = +0.25} },
				{ MODKEY|ShiftMask,             XK_l,      setcfact,       {.f = -0.25} },
				{ MODKEY|ShiftMask,             XK_o,      setcfact,       {.f =  0.00} },
				{ MODKEY|Mod4Mask,              XK_u,      incrgaps,       {.i = +1 } },
				{ MODKEY|Mod4Mask|ShiftMask,    XK_u,      incrgaps,       {.i = -1 } },
				{ MODKEY|Mod4Mask,              XK_i,      incrigaps,      {.i = +1 } },
				{ MODKEY|Mod4Mask|ShiftMask,    XK_i,      incrigaps,      {.i = -1 } },
				{ MODKEY|Mod4Mask,              XK_o,      incrogaps,      {.i = +1 } },
				{ MODKEY|Mod4Mask|ShiftMask,    XK_o,      incrogaps,      {.i = -1 } },
				{ MODKEY|Mod4Mask,              XK_6,      incrihgaps,     {.i = +1 } },
				{ MODKEY|Mod4Mask|ShiftMask,    XK_6,      incrihgaps,     {.i = -1 } },
				{ MODKEY|Mod4Mask,              XK_7,      incrivgaps,     {.i = +1 } },
				{ MODKEY|Mod4Mask|ShiftMask,    XK_7,      incrivgaps,     {.i = -1 } },
				{ MODKEY|Mod4Mask,              XK_8,      incrohgaps,     {.i = +1 } },
				{ MODKEY|Mod4Mask|ShiftMask,    XK_8,      incrohgaps,     {.i = -1 } },
				{ MODKEY|Mod4Mask,              XK_9,      incrovgaps,     {.i = +1 } },
				{ MODKEY|Mod4Mask|ShiftMask,    XK_9,      incrovgaps,     {.i = -1 } },
				{ MODKEY|Mod4Mask,              XK_0,      togglegaps,     {0} },
				{ MODKEY|Mod4Mask|ShiftMask,    XK_0,      defaultgaps,    {0} },
				{ MODKEY|ControlMask,   XK_comma,  cyclelayout,    {.i = -1 } },
				{ MODKEY|ControlMask,           XK_period, cyclelayout,    {.i = +1 } },
				TAGKEYS(                        XK_1,                      0)
        TAGKEYS(                        XK_2,                      1)
        TAGKEYS(                        XK_3,                      2)
        TAGKEYS(                        XK_4,                      3)
        TAGKEYS(                        XK_5,                      4)
        TAGKEYS(                        XK_6,                      5)
        TAGKEYS(                        XK_7,                      6)
        TAGKEYS(                        XK_8,                      7)
        TAGKEYS(                        XK_9,                      8)
        { MODKEY,             					XK_r,      self_restart,   {0} },
        { MODKEY|ShiftMask,             XK_f,      fullscreenmode, {0} },
				{ MODKEY,                       XK_F5,   	 xrdb,         	 {.v = NULL } },
				{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
        { MODKEY|ControlMask|ShiftMask, XK_q,      quit,           {1} },
};





/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};


