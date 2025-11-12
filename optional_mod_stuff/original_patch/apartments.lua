-- apartments.lua
-- SR2 district script
-- 3/28/07


function apartments_init()
end

function apartments_main()
end

-- debug function - call from the console with 'lua' command
function warp_apartments()
	message("warping...")
	delay(0)
	teleport("#PLAYER#", "apartments_$nav-warp")
end