-- downtown.lua
-- SR2 district script
-- 3/28/07


function downtown_init()
end

function downtown_main()
end

-- debug function - call from the console with 'lua' command
function warp_downtown()
	message("warping...")
	delay(0)
	teleport("#PLAYER#", "downtown_$nav-warp")
end