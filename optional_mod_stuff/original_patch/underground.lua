-- underground.lua
-- SR2 district script
-- 3/28/07


function underground_init()
end

function underground_main()
end

-- debug function - call from the console with 'lua' command
function warp_underground()
	message("warping...")
	delay(0)
	teleport("#PLAYER#", "underground_$nav-warp")
end