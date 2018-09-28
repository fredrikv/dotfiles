import XMonad
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.NoBorders
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Util.Run(spawnPipe)
import System.IO

myManageHook = composeAll
	[
		className =? "trayer" --> doIgnore
	]

main = do

xmonad $ ewmh defaultConfig
	{
		modMask = mod4Mask,
		handleEventHook    = fullscreenEventHook,
		manageHook = manageDocks <+> myManageHook <+> composeOne [
			isFullscreen -?> doFullFloat
		] <+> manageHook defaultConfig,
		layoutHook = avoidStruts $ smartBorders $ layoutHook defaultConfig,
		startupHook = setWMName "LG3D"
	}
