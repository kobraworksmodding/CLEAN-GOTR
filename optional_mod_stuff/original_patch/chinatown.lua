-- chinatown.lua
-- SR2 district script
-- 3/28/07


function chinatown_init()
end

function chinatown_main()
end

-- debug function - call from the console with 'lua' command
function warp_chinatown()
	message("warping...")
	delay(0)
	teleport("#PLAYER#", "chinatown_$nav-warp")
end