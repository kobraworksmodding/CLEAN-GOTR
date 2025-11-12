-- Groups --
GROUP1 = "fr_checkMU_$npc_group"
GROUP2 = "fr_checkMU_$vehicle_group"
PASSENGER_GROUP1 = {"fr_checkMU_$human_6"}
PASSENGER_GROUP2 = {"fr_checkMU_$human_7"}
PASSENGER_GROUP3 = {"fr_checkMU_$human_8"}
PASSENGER_GROUP4 = {"fr_checkMU_$human_9"}
PASSENGER_GROUP5 = {"fr_checkMU_$human_10"}
PASSENGER_GROUP6 = {"fr_checkMU_$human_11"}

-- Main Mission Function --
function fr_checkMU_start()
	-- Start trigger is hit... the activate button was hit
	set_mission_author("Brendan Hanna Holloway")

	-- point camera to navpoint
	camera_look_through("fr_checkMU_$camera")

	-- spawn some groups
	group_create(GROUP2, true)
	group_create(GROUP1, true)

	-- place passengers in vehicles
	vehicle_enter_group_teleport(PASSENGER_GROUP1, "fr_checkMU_$vehicle_0")
	vehicle_enter_group_teleport(PASSENGER_GROUP2, "fr_checkMU_$vehicle_1")
	vehicle_enter_group_teleport(PASSENGER_GROUP3, "fr_checkMU_$vehicle_2")
	vehicle_enter_group_teleport(PASSENGER_GROUP4, "fr_checkMU_$vehicle_3")
	vehicle_enter_group_teleport(PASSENGER_GROUP5, "fr_checkMU_$vehicle_4")
	vehicle_enter_group_teleport(PASSENGER_GROUP6, "fr_checkMU_$vehicle_5")

	-- start effects
	local effect_handles = {}
	if (framerate_test_should_play_effects()) then
		effect_handles[1] = effect_play("CarDamage-Fire", "fr_checkMU_$vehicle_nav_1", true)
		effect_handles[2] = effect_play("CarDamage-Fire", "fr_checkMU_$vehicle_nav_2", true)
		effect_handles[3] = effect_play("CarDamage-Fire", "fr_checkMU_$vehicle_nav_3", true)
		effect_handles[4] = effect_play("CarDamage-Fire", "fr_checkMU_$vehicle_nav_4", true)
		effect_handles[5] = effect_play("CarDamage-Fire", "fr_checkMU_$vehicle_nav_5", true)
	end

	if (framerate_test_should_run_continuously()) then
		while (true) do
			thread_yield()
		end
	else
		delay(30)
		local dump_tag = framerate_get_dump_tag("MU")
		dump_fps_tagged(dump_tag)
		screenshot(dump_tag)
	end

	-- stop effects
	if (framerate_test_should_play_effects()) then
		effect_stop(effect_handles[1])
		effect_stop(effect_handles[2])
		effect_stop(effect_handles[3])
		effect_stop(effect_handles[4])
		effect_stop(effect_handles[5])
	end

	-- despawn groups
	group_destroy(GROUP1)
	group_destroy(GROUP2)

	-- end the mission
	mission_end_success("fr_checkMU")
end

function fr_checkMU_success()
	-- Called when the mission has ended with success
	release_to_world(GROUP1)
	release_to_world(GROUP2)
end
