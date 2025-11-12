-- airport.lua
-- SR2 district script
-- 3/28/07


function airport_init()

end

function airport_main()
end

-- debug function - call from the console with 'lua' command
function warp_airport()
	message("warping...")
	delay(0)
	teleport("#PLAYER#", "airport_$nav-warp")
end