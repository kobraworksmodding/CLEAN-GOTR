-- usability2.lua
-- SR2 usability testing script 2
-- 5/23/07

function usability2_start()
	set_mission_author("Scott Phillips")
	group_create("usability2_$Gplane")
	vehicle_enter_teleport("#PLAYER#", "usability2_$v000", 0)
end

function usability2_failure()
	mission_end_failure("usability1","usability1_fail")
end

function usability1_success()
	-- success called from code
end

function usability2_cleanup()
	release_to_world("usability2_$Gplane")
end
