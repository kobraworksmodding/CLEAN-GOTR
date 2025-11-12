-- saintsrow.lua
-- SR2 district script
-- 3/28/07


function saintsrow_init()

end

function saintsrow_main()
end

-- debug function - call from the console with 'lua' command
function warp_saintsrow()
	message("warping...")
	delay(0)
	teleport("#PLAYER#", "saintsrow_$nav-warp")
end