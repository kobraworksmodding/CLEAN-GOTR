-- highend.lua
-- SR2 district script
-- 3/28/07


function highend_init()

end

function highend_main()
end

-- debug function - call from the console with 'lua' command
function warp_highend()
	message("warping...")
	delay(0)
	teleport("#PLAYER#", "highend_$nav-warp")
end