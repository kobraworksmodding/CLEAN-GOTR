-- docks.lua
-- SR2 district script
-- 3/28/07


function docks_init()
end

function docks_main()
end

-- debug function - call from the console with 'lua' command
function warp_docks()
	message("warping...")
	delay(0)
	teleport("#PLAYER#", "docks_$nav-warp")
end