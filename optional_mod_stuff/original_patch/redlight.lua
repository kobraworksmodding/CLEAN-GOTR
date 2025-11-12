-- redlight.lua
-- SR2 district script
-- 03/10/08


function redlight_init()
end

function redlight_main()
end

-- debug function - call from the console with 'lua' command
function warp_redlight()
	message("warping...")
	delay(0)
	teleport("#PLAYER#", "redlight_$nav-warp")
end