-- barrio.lua
-- SR2 district script
-- 3/28/07


function barrio_init()
end

function barrio_main()
end

-- debug function - call from the console with 'lua' command
function warp_barrio()
	message("warping...")
	delay(0)
	teleport("#PLAYER#", "barrio_$nav-warp")
end