-- subexp.lua
-- SR2 district script
-- 3/28/07


function subexp_init()
end

function subexp_main()
end

-- debug function - call from the console with 'lua' command
function warp_subexp()
	message("warping...")
	delay(0)
	teleport("#PLAYER#", "subexp_$nav-warp")
end