-- projects.lua
-- SR2 district script
-- 3/28/07


function projects_init()
end

function projects_main()
end

-- debug function - call from the console with 'lua' command
function warp_projects()
	message("warping...")
	delay(0)
	teleport("#PLAYER#", "projects_$nav-warp")
end