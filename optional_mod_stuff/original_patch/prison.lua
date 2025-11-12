-- prison.lua
-- SR2 district script
-- 3/28/07


function prison_init()
end

function prison_main()
end

-- debug function - call from the console with 'lua' command
function warp_prison()
	message("warping...")
	delay(0)
	teleport("#PLAYER#", "prison_$nav-warp")
end