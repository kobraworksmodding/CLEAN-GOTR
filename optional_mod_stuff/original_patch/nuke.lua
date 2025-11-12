-- nuke.lua
-- SR2 district script
-- 3/28/07


function nuke_init()
end

function nuke_main()
end

-- debug function - call from the console with 'lua' command
function warp_nuke()
	message("warping...")
	delay(0)
	teleport("#PLAYER#", "nuke_$nav-warp")
end