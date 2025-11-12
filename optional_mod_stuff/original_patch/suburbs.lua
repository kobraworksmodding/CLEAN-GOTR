-- suburbs.lua
-- SR2 district script
-- 3/28/07


function suburbs_init()
end

function suburbs_main()
end

-- debug function - call from the console with 'lua' command
function warp_suburbs()
	message("warping...")
	delay(0)
	teleport("#PLAYER#", "suburbs_$nav-warp")
end