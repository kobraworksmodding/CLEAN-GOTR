-- hotels.lua
-- SR2 district script
-- 3/28/07


function hotels_init()

end

function hotels_main()
end

-- debug function - call from the console with 'lua' command
function warp_hotels()
	message("warping...")
	delay(0)
	teleport("#PLAYER#", "hotels_$nav-warp")
end