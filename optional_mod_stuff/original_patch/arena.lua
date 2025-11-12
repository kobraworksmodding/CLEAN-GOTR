-- arena.lua
-- SR2 district script
-- 3/28/07


function arena_init()
end

function arena_main()
end

-- debug function - call from the console with 'lua' command
function warp_arena()
	message("warping...")
	delay(0)
	teleport("#PLAYER#", "arena_$nav-warp")
end