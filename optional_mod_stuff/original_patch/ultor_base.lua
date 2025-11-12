-- ultor_base.lua
-- SR2 district script
-- 8/6/07


function ultor_base_init()
end

function ultor_base_main()
--	on_hood_changed("ultor_base_pimpcanes", "#PLAYER#")
end

-- debug function - call from the console with 'lua' command
function warp_ultor_base()
	message("warping...")
	delay(0)
	teleport("#PLAYER#", "ultor_base_$nav-warp")
end

-- create pimpcanes hidden in the ug ultor base
--function ultor_base_pimpcanes(sr2_ul_ultorbase01)
--	group_create("ultor_base_$G_pimpcanes")
--end
