-- usability1.lua
-- SR2 usability testing script
-- 4/27/07

-- TABLES ------
checkpoints = {"usability1_$t001","usability1_$t002","usability1_$t003","usability1_$t004","usability1_$t005","usability1_$t006","usability1_$t007","usability1_$t008","usability1_$t009","usability1_$t010","usability1_$t011"}

-- GLOBAL VARIABLES ------
RACE_TIME = 120
CHECKPOINTS_COUNT = 0
CHECKPOINTS_TOTAL =  11

function usability1_start()
	set_mission_author("Scott Phillips")
	group_create("usability1_$Gboat")
	usability1_race()
end

function usability1_race()
	mission_help_table("usability1_start")  --TEXT: Race through each of the checkpoints before time expires!

	hud_timer_set(0, RACE_TIME*2400,"usability1_race_timer_expired")

	vehicle_enter_teleport("#PLAYER#", "usability1_$v000", 0)

	usability1_ckpt1()
end

function usability1_ckpt1()
	on_trigger("usability1_ckpt2","usability1_$t001")
	marker_add_trigger("usability1_$t001", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION)

	audio_play("SYS_ACT_TIMER")
	ingame_effect_add_trigger("usability1_$t001", "icon_race", 1)
end

function usability1_ckpt2()
	on_trigger("usability1_ckpt3","usability1_$t002")
	marker_remove_trigger("usability1_$t001")
	marker_add_trigger("usability1_$t002", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION)

	mission_help_table("usability1_checkpoint")  --TEXT: Checkpoint Passed!

	audio_play("SYS_ACT_TIMER")
	ingame_effect_remove_trigger("usability1_$t001",SYNC_ALL)
	ingame_effect_add_trigger("usability1_$t002", "icon_race", 1)
end

function usability1_ckpt3()
	on_trigger("usability1_ckpt4","usability1_$t003")
	marker_remove_trigger("usability1_$t002")
	marker_add_trigger("usability1_$t003", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION)

	mission_help_table("usability1_checkpoint")  --TEXT: Checkpoint Passed!

	audio_play("SYS_ACT_TIMER")
	ingame_effect_remove_trigger("usability1_$t002",SYNC_ALL)
	ingame_effect_add_trigger("usability1_$t003", "icon_race", 1)
end

function usability1_ckpt4()
	on_trigger("usability1_ckpt5","usability1_$t004")
	marker_remove_trigger("usability1_$t003")
	marker_add_trigger("usability1_$t004", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION)

	mission_help_table("usability1_checkpoint")  --TEXT: Checkpoint Passed!

	audio_play("SYS_ACT_TIMER")
	ingame_effect_remove_trigger("usability1_$t003",SYNC_ALL)
	ingame_effect_add_trigger("usability1_$t004", "icon_race", 1)

end

function usability1_ckpt5()
	on_trigger("usability1_ckpt6","usability1_$t005")
	marker_remove_trigger("usability1_$t004")
	marker_add_trigger("usability1_$t005", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION)

	mission_help_table("usability1_checkpoint")  --TEXT: Checkpoint Passed!

	audio_play("SYS_ACT_TIMER")
	ingame_effect_remove_trigger("usability1_$t004",SYNC_ALL)
	ingame_effect_add_trigger("usability1_$t005", "icon_race", 1)
end

function usability1_ckpt6()
	on_trigger("usability1_ckpt7","usability1_$t006")
	marker_remove_trigger("usability1_$t005")
	marker_add_trigger("usability1_$t006", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION)

	mission_help_table("usability1_checkpoint")  --TEXT: Checkpoint Passed!

	audio_play("SYS_ACT_TIMER")
	ingame_effect_remove_trigger("usability1_$t005",SYNC_ALL)
	ingame_effect_add_trigger("usability1_$t006", "icon_race", 1)
end

function usability1_ckpt7()
	on_trigger("usability1_ckpt8","usability1_$t007")
	marker_remove_trigger("usability1_$t006")
	marker_add_trigger("usability1_$t007", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION)

	mission_help_table("usability1_checkpoint")  --TEXT: Checkpoint Passed!

	audio_play("SYS_ACT_TIMER")
	ingame_effect_remove_trigger("usability1_$t006",SYNC_ALL)
	ingame_effect_add_trigger("usability1_$t007", "icon_race", 1)
end

function usability1_ckpt8()
	on_trigger("usability1_ckpt9","usability1_$t008")
	marker_remove_trigger("usability1_$t007")
	marker_add_trigger("usability1_$t008", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION)

	mission_help_table("usability1_checkpoint")  --TEXT: Checkpoint Passed!

	audio_play("SYS_ACT_TIMER")
	ingame_effect_remove_trigger("usability1_$t007",SYNC_ALL)
	ingame_effect_add_trigger("usability1_$t008", "icon_race", 1)
end

function usability1_ckpt9()
	on_trigger("usability1_ckpt10","usability1_$t009")
	marker_remove_trigger("usability1_$t008")
	marker_add_trigger("usability1_$t009", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION)

	mission_help_table("usability1_checkpoint")  --TEXT: Checkpoint Passed!

	audio_play("SYS_ACT_TIMER")
	ingame_effect_remove_trigger("usability1_$t008",SYNC_ALL)
	ingame_effect_add_trigger("usability1_$t009", "icon_race", 1)
end

function usability1_ckpt10()
	on_trigger("usability1_ckpt11","usability1_$t010")
	marker_remove_trigger("usability1_$t009")
	marker_add_trigger("usability1_$t010", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION)

	mission_help_table("usability1_checkpoint")  --TEXT: Checkpoint Passed!

	audio_play("SYS_ACT_TIMER")
	ingame_effect_remove_trigger("usability1_$t009",SYNC_ALL)
	ingame_effect_add_trigger("usability1_$t010", "icon_race", 1)
end

function usability1_ckpt11()
	on_trigger("usability1_race_finish","usability1_$t011")
	marker_remove_trigger("usability1_$t010")
	marker_add_trigger("usability1_$t011", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION)

	mission_help_table("usability1_checkpoint")  --TEXT: Checkpoint Passed!

	audio_play("SYS_ACT_TIMER")
	ingame_effect_remove_trigger("usability1_$t010",SYNC_ALL)
	ingame_effect_add_trigger("usability1_$t011", "icon_race", 1)
end


function usability1_race_finish()
	marker_remove_trigger("usability1_$t011")
	ingame_effect_remove_trigger("usability1_$t011",SYNC_ALL)

	group_create("usability1_$Gheli")
	teleport("#PLAYER#", "usability1_$nafter")
	character_remove_vehicle("#PLAYER#")
	vehicle_enter_teleport("#PLAYER#", "usability1_$v001", 0)
	usability1_script_success()
end

function usability1_race_timer_expired()
	group_create("usability1_$Gheli")
	teleport("#PLAYER#", "usability1_$nafter")
	character_remove_vehicle("#PLAYER#")
	vehicle_enter_teleport("#PLAYER#", "usability1_$v001", 0)
	usability1_failure()
end

function usability1_failure()
	mission_end_failure("usability1","usability1_fail")
end

function usability1_script_success()
	-- success called from the script above
	mission_end_success("usability1")
end

function usability1_success()
	-- success called from code
end

function usability1_cleanup()
	release_to_world("usability1_$Gheli")
	group_destroy("usability1_$Gboat")
--	on_trigger("","usability1_$t001")
--	on_trigger("","usability1_$t002")
--	on_trigger("","usability1_$t003")
--	on_trigger("","usability1_$t004")
--	on_trigger("","usability1_$t005")
--	on_trigger("","usability1_$t006")
--	on_trigger("","usability1_$t007")
--	on_trigger("","usability1_$t008")
--	on_trigger("","usability1_$t009")
--	on_trigger("","usability1_$t010")
--	on_trigger("","usability1_$t011")
end
