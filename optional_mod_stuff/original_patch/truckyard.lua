-- truckyard.lua
-- SR2 district script
-- 3/28/07


function truckyard_init()
end

function truckyard_main()
end

-- debug function - call from the console with 'lua' command
function warp_truckyard()
	message("warping...")
	delay(0)
	teleport("#PLAYER#", "truckyard_$nav-warp")
end