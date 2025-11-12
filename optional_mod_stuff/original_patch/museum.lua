-- museum.lua
-- SR2 district script
-- 3/28/07


function museum_init()
end

function museum_main()
end

-- debug function - call from the console with 'lua' command
function warp_museum()
	message("warping...")
	delay(0)
	teleport("#PLAYER#", "museum_$nav-warp")
end