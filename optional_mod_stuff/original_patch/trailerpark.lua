-- trailerpark.lua
-- SR2 district script
-- 3/28/07


function trailerpark_init()
end

function trailerpark_main()
end

-- debug function - call from the console with 'lua' command
function warp_trailerpark()
	message("warping...")
	delay(0)
	teleport("#PLAYER#", "trailerpark_$nav-warp")
end