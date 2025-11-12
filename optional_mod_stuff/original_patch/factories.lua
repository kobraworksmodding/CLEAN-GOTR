-- factories.lua
-- SR2 district script
-- 3/28/07


function factories_init()
end

function factories_main()
end

-- debug function - call from the console with 'lua' command
function warp_factories()
	message("warping...")
	delay(0)
	teleport("#PLAYER#", "factories_$nav-warp")
end