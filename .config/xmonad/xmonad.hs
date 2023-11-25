--
-- xmonad example config file.
--
-- A template showing all available configuration hooks,
-- and how to override the defaults in your own xmonad.hs conf file.
--
-- Normally, you'd only override those defaults you care about.
--
-- BASE
import XMonad
import Data.Monoid
import System.Exit

-- DATA
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import qualified XMonad.Util.Hacks as Hacks
-- 
import Graphics.X11.ExtraTypes.XF86
-- Util
import XMonad.Util.SpawnOnce
import XMonad.Util.EZConfig
import XMonad.Util.Run
-- Hooks
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.WindowSwallowing

-- Layouts
import XMonad.Layout.Spacing
import XMonad.Layout.Renamed
--import XMonad.Layout.NoBorders
import qualified XMonad.Layout.NoBorders as BO
import XMonad.Layout.LayoutModifier
-- Actions
import XMonad.Actions.SpawnOn



-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
--
myTerminal      = "alacritty"

-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

-- Whether clicking on a window to focus also passes the click to the window
myClickJustFocuses :: Bool
myClickJustFocuses = False

-- Width of the window border in pixels.
--
myBorderWidth = 3

-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask       = mod4Mask

-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.
--
-- A tagging example:
--
-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
--
myWorkspaces    = ["1","2","3","4","5","6","7","8","9"]

-- Border colors for unfocused and focused windows, respectively.
--
--


-- Red Border Colors --
-- myNormalBorderColor  = "#141827"
-- myFocusedBorderColor = "#ff0000"


-- Purple Border Colors --
myNormalBorderColor  = "#1f2234"
myFocusedBorderColor = "#808bd9"


-- Yellow-gold Border Colors --
-- myNormalBorderColor  = "#1f2234"
-- myFocusedBorderColor = "#e3ca84"


------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKceys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

    -- launch a terminal
    [ ((modm,               xK_Return), spawn $ XMonad.terminal conf)

    -- launch dmenu/Rofi
    --, ((modm,               xK_p     ), spawn "dmenu_run")
    , ((modm,               xK_p     ), spawn "rofi -show run -show-icons")
    
    -- launch gmrun
    , ((modm .|. shiftMask, xK_p     ), spawn "gmrun")

    -- close focused window
    , ((modm,                        xK_q     ), kill)

     -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- Resize viewed windows to the correct size
    , ((modm,               xK_n     ), refresh)

    -- Move focus to the next window
    , ((modm,               xK_Tab   ), windows W.focusDown)

    -- Move focus to the next window
    , ((modm,               xK_bracketright     ), windows W.focusDown)

    -- Move focus to the previous window
    , ((modm,               xK_bracketleft     ), windows W.focusUp  )

    -- Move focus to the master window
    , ((modm .|. shiftMask,               xK_m     ), windows W.focusMaster  )

    -- Swap the focused window and the master window
    , ((modm .|. shiftMask,               xK_j), windows W.swapMaster)

    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_Return     ), windows W.swapDown  )

    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )

    -- Shrink the master area
    , ((modm,               xK_l     ), sendMessage Shrink)

    -- Expand the master area
    , ((modm,               xK_semicolon     ), sendMessage Expand)

    -- Push window back into tiling
    , ((modm .|. shiftMask,               xK_t     ), withFocused $ windows . W.sink)

    -- Increment the number of windows in the master area
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))

    -- Deincrement the number of windows in the master area
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))

    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    -- , ((modm              , xK_y     ), sendMessage ToggleStruts)

    -- Quit xmonad
    , ((modm .|. shiftMask, xK_y     ), io exitSuccess)

    -- Restart xmonad
    , ((modm .|. shiftMask, xK_q     ), spawn "xmonad --recompile; xmonad --restart")
   
    ---- Media
    -- Lower Volume
    , ((0,                  xF86XK_AudioLowerVolume     ), spawn "wpctl set-volume @DEFAULT_AUDIO_SINK@ 4%-"    )

    -- Raise Volume
    , ((0,                  xF86XK_AudioRaiseVolume     ), spawn "wpctl set-volume @DEFAULT_AUDIO_SINK@ 4%+"    )

    -- Mute Volume
    , ((0,                  xF86XK_AudioMute     ), spawn "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"    )

    -- Pause Media
    , ((0,                  xF86XK_AudioPlay     ), spawn "playerctl play-pause"    )
    
    -- Next Media
    , ((0,                  xF86XK_AudioNext     ), spawn "playerctl next"    )
    
    -- previous Media
    , ((0,                  xF86XK_AudioPrev     ), spawn "playerctl previous"    )
    
    ---- Programs
    , ((modm,                  xK_b     ), spawn "brave"    )
    
    , ((modm,                  xK_n     ), spawn "feh --bg-fill -r -z ~/wallpapers3"    )
    
    , ((modm,                  xK_w     ), spawn "~/scripts/xmonadwall.sh"    )
    
    , ((modm,                  xK_e     ), spawn "thunar"    )
    
    , ((modm,                  xK_apostrophe     ), spawn "~/.config/xmonad/scripts/ewwtoggle.sh"    )
    
    , ((modm .|. shiftMask,    xK_p              ), spawn "borderchange"    )
    
    , ((modm .|. shiftMask,    xK_c              ), spawn "eww open powerDash --config /home/termai/.config/eww/bar_xmonad2/power_dash/."    )
    
    , ((modm,                   xK_c              ), spawn "scrot /home/termai/Pictures/Screenshots/%Y-%m-%d-%T-screenshot.png"    )
    
    -- Layout Keys
    , ((modm,               xK_f    ), sendMessage $ JumpToLayout "Tall" )
    , ((modm,               xK_t    ), sendMessage $ JumpToLayout "Mirror Tall" )
    , ((modm,               xK_m    ), sendMessage $ JumpToLayout "Full" )
    -- Run xmessage with a summary of the default keybindings (useful for beginners)
    , ((modm .|. shiftMask, xK_slash ), xmessage help)
    ]
    ++

    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_g, xK_x, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), \w -> focus w >> mouseMoveWindow w
                                      >> windows W.shiftMaster)

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), \w -> focus w >> windows W.shiftMaster)

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), \w -> focus w >> mouseResizeWindow w
                                      >> windows W.shiftMaster)

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]

------------------------------------------------------------------------
-- Layouts:

-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--
--
--


mySpacing :: Integer -> l a -> ModifiedLayout Spacing l a
mySpacing i = spacingRaw False (Border i i i i) True (Border i i i i) True

--myLayout = BO.lessBorders BO.Never $ mySpacing 2 $ avoidStruts (tiled ||| Mirror tiled ||| Full)
myLayout = BO.lessBorders BO.Never $ avoidStruts (tiled ||| Mirror tiled ||| Full)
  where

     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio
    
     -- The default number of windows in the master pane
     nmaster = 1

     -- Default proportion of screen occupied by master pane
     ratio   = 1/2

     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

------------------------------------------------------------------------
-- Window rules:

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore ]

------------------------------------------------------------------------
-- Event handling

-- * EwmhDesktops users should change this to ewmhDesktopsEventHook
--
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
-- myEventHook = mempty
myEventHook = swallowEventHook (className =? "Alacritty" <||> className =? "Termite") (return True)

------------------------------------------------------------------------
-- Status bars and logging

-- Perform an arbitrary action on each internal state change or X event.
-- See the 'XMonad.Hooks.DynamicLog' extension for examples.
--
myLogHook = return ()

------------------------------------------------------------------------
-- Startup hook

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
--myStartupHook = return ()
myStartupHook = do
  
  -- Red Wallpaper
  -- spawnOnce "feh --bg-fill -r -z ~/wallpapers3/1324827.png"
  
  -- Purple Wallapaper
  spawnOnce "feh --bg-fill -z ~/wallpapers3/1319293.jpeg"
  
  -- Yellow-Gold Wallpaper
  --spawnOnce "feh --bg-fill -z /home/termai/wallpapers3/602575.png"
  
  --spawnOnce "xsetroot -cursor_name left_ptr"
  --spawnOnce "picomcall &"
  --spawnOnOnce "1" "/usr/bin/brave"
  --spawnOnce "/home/termai/.config/eww/bar_xmonad/scripts/fafull.sh &"
  spawnOnce "systemctl --user start dunst"
  spawnOnce "/home/termai/.config/eww/bar_dwm2/scripts/newcover.sh &"
------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.

-- Run xmonad with the settings you specify. No need to modify this.
--
main = do 
  xmproc <- spawnPipe "/home/termai/.config/xmonad/scripts/openeww.sh"
  --xmproc <- spawnPipe "xsetroot -cursor_name left_ptr"
 -- xmonad $ ewmh . docks $ defaults 
  xmonad $ ewmhFullscreen $ ewmh . docks $ defaults 
 -- xmonad $ docks $ defaults 

-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs
--
-- No need to modify this.
--
defaults = def {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

      -- key bindings
        --keys               = myKeys,
        keys               = myKceys,
        mouseBindings      = myMouseBindings,

      -- hooks, layouts
        layoutHook         = myLayout, 
        manageHook         = myManageHook,
        handleEventHook    = myEventHook <> Hacks.windowedFullscreenFixEventHook,
        logHook            = myLogHook,
        startupHook        = myStartupHook
    } --`additionalKeysP`
      --[ ("M-t", sendMessage $ JumpToLayout "Tall")
      --, ("M-f", sendMessage $ JumpToLayout "Mirror Tall")
      --, ("M-m", sendMessage $ JumpToLayout "Full")       
      --] 

-- | Finally, a copy of the default bindings in simple textual tabular format.
help :: String
help = unlines ["The default modifier key is 'alt'. Default keybindings:",
    "",
    "-- launching and killing programs",
    "mod-Shift-Enter  Launch xterminal",
    "mod-p            Launch dmenu",
    "mod-Shift-p      Launch gmrun",
    "mod-Shift-c      Close/kill the focused window",
    "mod-Space        Rotate through the available layout algorithms",
    "mod-Shift-Space  Reset the layouts on the current workSpace to default",
    "mod-n            Resize/refresh viewed windows to the correct size",
    "mod-Shift-/      Show this help message with the default keybindings",
    "",
    "-- move focus up or down the window stack",
    "mod-Tab        Move focus to the next window",
    "mod-Shift-Tab  Move focus to the previous window",
    "mod-j          Move focus to the next window",
    "mod-k          Move focus to the previous window",
    "mod-m          Move focus to the master window",
    "",
    "-- modifying the window order",
    "mod-Return   Swap the focused window and the master window",
    "mod-Shift-j  Swap the focused window with the next window",
    "mod-Shift-k  Swap the focused window with the previous window",
    "",
    "-- resizing the master/slave ratio",
    "mod-h  Shrink the master area",
    "mod-l  Expand the master area",
    "",
    "-- floating layer support",
    "mod-t  Push window back into tiling; unfloat and re-tile it",
    "",
    "-- increase or decrease number of windows in the master area",
    "mod-comma  (mod-,)   Increment the number of windows in the master area",
    "mod-period (mod-.)   Deincrement the number of windows in the master area",
    "",
    "-- quit, or restart",
    "mod-Shift-q  Quit xmonad",
    "mod-q        Restart xmonad",
    "mod-[1..9]   Switch to workSpace N",
    "",
    "-- Workspaces & screens",
    "mod-Shift-[1..9]   Move client to workspace N",
    "mod-{w,e,r}        Switch to physical/Xinerama screens 1, 2, or 3",
    "mod-Shift-{w,e,r}  Move client to screen 1, 2, or 3",
    "",
    "-- Mouse bindings: default actions bound to mouse events",
    "mod-button1  Set the window to floating mode and move by dragging",
    "mod-button2  Raise the window to the top of the stack",
    "mod-button3  Set the window to floating mode and resize by dragging"]
