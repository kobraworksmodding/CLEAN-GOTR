-- university.lua
-- SR2 district script
-- 3/28/07


function university_init()

end


function university_main()
end


-- debug function - call from the console with 'lua' command
function warp_university()
	message("warping...")
	delay(0)
	teleport("#PLAYER#", "university_$nav-warp")
end


