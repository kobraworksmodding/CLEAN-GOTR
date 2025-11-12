-- ai_test.lua
-- SR2 test script
-- 10/22/07

-- Groups --
GROUP_ONE =				"ai_test_$G0000"
GROUP_TWO =				"ai_test_$G0001"

PLAYER_START =			"ai_test_$player_start"

function ai_test_start()
	set_mission_author("SR2 AI Team")
	group_create(GROUP_ONE, true)

	--character_take_human_shield("ai_test_$c001", "ai_test_$c002", true, true)
	while (1) do
		delay(10)
		move_to("ai_test_$c001", "ai_test_$c002_navp");
		turn_to("ai_test_$c001", "ai_test_$c001_navp");
		delay(10)
		move_to("ai_test_$c001", "ai_test_$c001_navp");
		turn_to("ai_test_$c001", "ai_test_$c002_navp");
	end

	--group_create(GROUP_TWO, true)
	--vehicle_enter_teleport("ai_test_$c001", "ai_test_$v001")
	--vehicle_enter_teleport("ai_test_$c002", "ai_test_$v002")
	--delay(5)
	--vehicle_speed_override("ai_test_$v001", 1000)
	--vehicle_chase("ai_test_$v002", "ai_test_$c001", false, false, false)
	--vehicle_pathfind_to("ai_test_$v001", "ai_test_$n000")
end



function ai_test_success()
end