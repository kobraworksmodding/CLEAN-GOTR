-- ss05.lua
-- SR2 mission script
-- 3/28/07
-- Mission help table text tags
   HT_DISPLAY_NAME = "ss05_display_name"
   HT_GO_TO_FIRST_LAB = "ss05_go_to_first_lab"
   HT_X_OF_Y_DUST_CONTAINERS_DESTROYED = "ss05_x_of_y_dust_containers_destroyed"
   HT_X_OF_Y_DUST_CONTAINERS_DESTROYED_HT = "ss05_x_of_y_dust_containers_destroyed_ht"

   HT_X_OF_Y_LABS_DESTROYED = "ss05_x_of_y_labs_destroyed"
   HT_HEAD_TO_SECOND_LAB = "ss05_head_to_second_lab"
   HT_DESTROY_THIRD_LAB = "ss05_destroy_third_lab"
   HT_DOOR_LOCKED = "ss05_door_locked"
   HT_LOCKED_SOMEONE_HAS_KEY = "ss05_locked_someone_has_key"
   HT_PICK_UP_KEY = "ss05_pick_up_key"
   HT_DESTROY_FOURTH_LAB = "ss05_destroy_fourth_lab"
   HT_X_OF_Y_TECHS_KILLED = "ss05_x_of_y_techs_killed"
   HT_X_OF_Y_TECHS_KILLED_HT = "ss05_x_of_y_techs_killed_ht"
   HT_CHASE_DOWN_TECH = "ss05_chase_down_tech"
   HT_TECH_ESCAPING = "ss05_tech_escaping"
   HT_TECH_ESCAPED = "ss05_tech_escaped"
   HT_KILL_SAMEDI_TECHS = "ss05_kill_samedi_techs"
   HT_DESTROY_STORAGE_CONTAINERS = "ss05_destroy_storage_containers"

-- Mission states
   MS_TRAVEL_TO_FIRST_LAB = 0
   MS_REACHED_FIRST_LAB = 1
   MS_DESTROYED_FIRST_LAB = 2
   MS_TRAVEL_TO_SECOND_LAB = 3
   MS_REACHED_SECOND_LAB = 4
   MS_CAPTURED_SECOND_LAB_TECH = 5
   MS_DROP_OFF_CAPTURED_TECH = 6
   MS_DESTROYED_SECOND_LAB = 7
   MS_TRAVEL_TO_THIRD_LAB = 8
   MS_REACHED_THIRD_LAB = 9
   MS_DESTROYED_THIRD_LAB = 10
   MS_TRAVEL_TO_FOURTH_LAB = 12
   MS_REACHED_FOURTH_LAB = 13
   MS_TECH_ESCAPING = 14
   MS_VICTORY = 15

   MS_FIRST_LAB_CHECKPOINT = 16
   MS_SECOND_LAB_CHECKPOINT = 17
   MS_THIRD_LAB_CHECKPOINT = 18
   MS_FOURTH_LAB_CHECKPOINT = 19

-- Groups, NPCs, vehicles, navpoints, and other names
   -- Mission constant names
   MISSION_NAME = "ss05"
   -- ( Mission Prefix )
   MP = MISSION_NAME.."_$"
   ENEMY_GANG = "samedi"

   LAB_FOUR_KEY = "keys"

   -- Chunk swap sequences for the fires
   FIRE_1 = "Chunk_Fire_1"
   FIRE_2 = "Chunk_Fire_2"
   LAB_FIRE_1 = "Lab_Fire_1"
   LAB_FIRE_2 = "Lab_Fire_2"
   LAB_FIRE_3 = "Lab_Fire_3"
   CHUNK_SWAP_FIRES = { FIRE_1, FIRE_2, LAB_FIRE_1, LAB_FIRE_2, LAB_FIRE_3 }

   -- Checkpoints
   CP_REACHED_LAB_ONE = "Lab_One_Reached"
   CP_REACHED_LAB_TWO = "Lab_Two_Reached"
   CP_REACHED_LAB_THREE = "Lab_Three_Reached"
   CP_REACHED_LAB_FOUR = "Lab_Four_Reached"

   -- Groups
   STARTER_VEHICLE_GROUP_NAME = MP.."Starter_Vehicle"
   STARTER_VEHICLE_COOP_GROUP_NAME = MP.."Starter_Vehicle_Coop"

   LAB_ONE_OUTSIDE_GROUP = MP.."L1_Outside_Attackers"
   LAB_ONE_INSIDE_GROUP = MP.."L1_Inside_Attackers"

   LAB_TWO_FLOOR_ONE_ATTACKERS = MP.."L2_Floor1_Attackers"
   LAB_TWO_FLOOR_TWO_ATTACKERS = MP.."L2_Floor2_Attackers"

   LAB_THREE_INITIAL_DEFENDERS_GROUP = MP.."L3_Initial_Defenders"
   LAB_THREE_ENCLOSED_LAB_GROUP = MP.."L3_Enclosed_Lab_Gang_Members"
   LAB_THREE_DEFENDERS_GROUP = MP.."L3_Defenders"
   LAB_THREE_AFTER_LAB_ATTACK_GROUP = MP.."L3_After_Lab_Attackers"

   LAB_FOUR_OUTSIDE_GROUP = MP.."L4_Outside_Defenders"
   LAB_FOUR_DEFENDERS_GROUP = MP.."L4_Defenders"
   LAB_FOUR_TECHS_GROUP = MP.."L4_Techs"
   LAB_FOUR_ESCAPING_TECH_GROUP = MP.."L4_Escapee_and_Car"
   LAB_FOUR_PLAYERS_CAR_GROUP = MP.."L4_Player_chase_car"

   -- NPC names
   LAB_ONE_OUTSIDE_GROUP_MEMBERS = { MP.."L1_Outside_M01", MP.."L1_Outside_M02", MP.."L1_Outside_M03" }
   LAB_ONE_INSIDE_GROUP_MEMBERS = { MP.."L1_Inside_M01", MP.."L1_Inside_M02", MP.."L1_Inside_M03",
                                    MP.."L1_Inside_M04", MP.."L1_Inside_M05" }

   LAB_TWO_LOBBY_GUARD = MP.."L2_Lobby_Guard"
   LAB_TWO_DEFENDER_MEMBERS = { MP.."L2_M01", MP.."L2_M02", MP.."L2_M03", MP.."L2_M04", MP.."L2_M05", MP.."L2_M06",
                                MP.."L2_M07", MP.."L2_M08", MP.."L2_M09", MP.."L2_M10", MP.."L2_M11", MP.."L2_M12",
                                MP.."L2_M13" }

   LAB_THREE_INITIAL_DEFENDER_MEMBERS = { MP.."L3_Initial_Defender01", MP.."L3_Initial_Defender02",
                                          MP.."L3_Initial_Defender03" }
   LAB_THREE_DEFENDER_MEMBERS = { MP.."L3_Defender01", MP.."L3_Defender02", MP.."L3_Defender03",
                                  MP.."L3_Defender04", MP.."L3_Defender05", MP.."L3_Defender06",
                                  MP.."L3_Defender07" }
   LAB_THREE_ENCLOSED_LAB_MEMBERS = { MP.."L3_EL_M01", MP.."L3_EL_M02" }

   LAB_THREE_AFTER_LAB_ATTACK_MEMBERS = { MP.."L3_ALA_01", MP.."L3_ALA_02", MP.."L3_ALA_03", MP.."L3_ALA_04" }

   LAB_FOUR_DEFENDER_MEMBERS = { MP.."L4_M01", MP.."L4_M02", MP.."L4_M03", MP.."L4_M04", MP.."L4_M05",
                                 MP.."L4_M06", MP.."L4_M07", MP.."L4_M08", MP.."L4_M09", MP.."L4_M10",
                                 MP.."L4_M11", MP.."L4_M12" }

   LAB_FOUR_ENTRYWAY_DEFENDERS = { LAB_FOUR_DEFENDER_MEMBERS[3], LAB_FOUR_DEFENDER_MEMBERS[4] }

   LAB_FOUR_TECH_MEMBERS = { MP.."L4_Tech_M01", MP.."L4_Tech_M02", MP.."L4_Tech_M03" }

   LAB_FOUR_ENTRYWAY_TECH_NAME = LAB_FOUR_TECH_MEMBERS[2]

   LAB_FOUR_ESCAPEE_TECH = MP.."L4_Escapee"

   FIRETRUCKS_FIREFIGHTERS = { { MP.."FF_01", MP.."FF_02" },
                               { MP.."FF2_01", MP.."FF2_02" },
                               { MP.."FF3_01", MP.."FF3_02" },
                               { MP.."FF4_01", MP.."FF4_02" } }

   -- Vehicle names
   LAB_THREE_AFTER_LAB_ATTACK_VEHICLE = MP.."L3_ALA_V"

   LAB_FOUR_ESCAPE_VEHICLE = MP.."Escape_Car"

   PLAYER_CHASE_CAR = MP.."Player_Chase_Car"

   FIRETRUCK_NAMES = { MP.."Firetruck", MP.."Firetruck02", MP.."Firetruck03", MP.."Firetruck04" }

   -- Navpoints
   REMOTE_PLAYER_START = MP.."Remote_Player_Start"

   LAB_TWO_SAINTS_HQ_PATH = { MP.."HQ01", MP.."HQ02", MP.."HQ03", MP.."HQ04",
                              MP.."HQ05", MP.."HQ06", MP.."HQ07", MP.."HQ08" }
   LAB_TWO_SAINTS_HQ_LOCATION = MP.."Saints_HQ"

   LAB_THREE_SMOKE_SOURCE = MP.."Smoke_Source"
   LAB_THREE_CLEAR_OF_ROOM = MP.."Clear_of_Room"

   LAB_FOUR_ESCAPE_PATHS = { MP.."Escape_Path", MP.."Escape_Path_02", MP.."Escape_Path_03", MP.."Escape_Path_04", MP.."Escape_Path_05" }

   FIRETRUCK_PATHS = { MP.."Firetruck_Path", MP.."Firetruck_Path02", MP.."Firetruck_Path03", MP.."Firetruck_Path04" }
   POST_CHUNK_SWAP_WARP_POSITIONS = { [LOCAL_PLAYER] = MP.."Local_Player_Post_Swap_Warp",
                                      [REMOTE_PLAYER] = MP.."Remote_Player_Post_Swap_Warp" }

   -- Triggers
   LAB_ONE_LOCATION_TRIGGER = MP.."Lab1_Location"
   LAB_ONE_SAMPLE_COLLECTION_TRIGGER = MP.."Get_sample_trigger"
   LAB_ONE_LIGHT_DRUG_EFFECT_TRIGGER = MP.."L1_Light_Drug_Effect"
   LAB_ONE_MEDIUM_DRUG_EFFECT_TRIGGER = MP.."L1_Medium_Drug_Effect"

   LAB_TWO_LOCATION_TRIGGER = MP.."Lab2_Location"
   LAB_TWO_ENTRANCE_TRIGGER = MP.."Lab2_Location"
   LAB_TWO_LIGHT_DRUG_EFFECT_TRIGGER = MP.."L1_Light_Drug_Effect"
   LAB_TWO_MEDIUM_DRUG_EFFECT_TRIGGER = MP.."L1_Medium_Drug_Effect"

   LAB_THREE_ENTRANCE_TRIGGER = MP.."Lab3_Entrance"
   LAB_THREE_LOCATION_TRIGGER = MP.."Lab3_Location"
   LAB_THREE_AREA_TRIGGER = MP.."Lab_Three_Area"
   LAB_THREE_TOP_OF_STAIRS_TRIGGER = MP.."L3_Top_of_Stairs"
   LAB_THREE_ENCLOSED_LAB_ENTRANCE_TRIGGER = MP.."L3_Enclosed_Lab_Entrance"
   LAB_THREE_FLUSH_OUT_SWITCH = MP.."Flush_Out_Switch"
   LAB_THREE_LIGHT_DRUG_EFFECT_TRIGGER = MP.."L1_Light_Drug_Effect"
   LAB_THREE_MEDIUM_DRUG_EFFECT_TRIGGER = MP.."L1_Medium_Drug_Effect"

   LAB_FOUR_NEAR_TRIGGER = MP.."Near_Lab_Four"

   LAB_FOUR_GUIDE_TRIGGERS = { MP.."Lab4_Guide01", MP.."Lab4_Guide02" }

   LAB_FOUR_LOCATION_TRIGGER = MP.."Lab4_Location"
   LAB_FOUR_CHUNK_SWAP_TRIGGER = MP.."Lab4_Chunk_Swap"
   LAB_FOUR_TECH_ESCAPE_TRIGGER = MP.."Lab4_Tech_Escape"
   LAB_FOUR_AREA1 = MP.."L4_Area1"
   LAB_FOUR_AREA2 = MP.."L4_Area2"
   LAB_FOUR_LIGHT_DRUG_EFFECT_TRIGGER = MP.."L1_Light_Drug_Effect"
   LAB_FOUR_MEDIUM_DRUG_EFFECT_TRIGGER = MP.."L1_Medium_Drug_Effect"
   LAB_FOUR_BEFORE_DOOR_UNLOCKED_TRIGGER = MP.."L4_Before_Door_Unlocked"
   LAB_FOUR_UNLOCK_DOOR_TRIGGER = MP.."L4_Unlock_Door"
   LAB_FOUR_POWER_FAILURE_TRIGGER = MP.."L4_Power_Failure"
	LAB_FOUR_EXIT_COOP_TRIGGER = MP.."L4_Coop_Exit"

   LAB_LIGHT_DRUG_EFFECT_TRIGGERS = { LAB_ONE_LIGHT_DRUG_EFFECT_TRIGGER, LAB_TWO_LIGHT_DRUG_EFFECT_TRIGGER,
                                      LAB_THREE_LIGHT_DRUG_EFFECT_TRIGGER, LAB_FOUR_LIGHT_DRUG_EFFECT_TRIGGER }

   LAB_MEDIUM_DRUG_EFFECT_TRIGGERS = { LAB_ONE_MEDIUM_DRUG_EFFECT_TRIGGER, LAB_TWO_MEDIUM_DRUG_EFFECT_TRIGGER,
                                       LAB_THREE_MEDIUM_DRUG_EFFECT_TRIGGER, LAB_FOUR_MEDIUM_DRUG_EFFECT_TRIGGER }

   FIRETRUCK_START_PATH_TRIGGER = MP.."Firetruck_Start_Path_Trigger"
   FIRETRUCK_MID_PATH_TRIGGER = MP.."Mid_Chase_Firetruck_Trigger"
   FIRETRUCK_END_PATHS_TRIGGER = MP.."Firetrucks_End_Paths_Trigger"

   -- Movers
   LAB_ONE_STORAGE_NAMES = { MP.."L1_Barrel01", MP.."L1_Barrel02" }

   LAB_TWO_STORAGE_NAMES = { MP.."L2_Voodo_Lab" }

   LAB_TWO_ENTRANCE_DOORS = { MP.."L2_Entrance_Door_01", MP.."L2_Entrance_Door_02" }

   LAB_THREE_DOOR_NAME = MP.."L3_Enclosed_Lab_Door"
   LAB_THREE_STORAGE_NAMES = { MP.."L3_Barrel01", MP.."L3_Voodo_Lab_02" }

   LAB_THREE_ENCLOSED_LAB_BARREL_NAME = MP.."L3_Barrel02"

   LAB_FOUR_ENTRANCE_DOOR = MP.."L4_Entrance_Door"
   LAB_FOUR_MIDDLE_DOOR = MP.."L4_Middle_Door"
   LAB_FOUR_DOOR_NEAR_BARREL = MP.."L4_Door_Near_Barrel"
   LAB_FOUR_EXIT_DOOR = MP.."L4_Exit_Door"
   LAB_FOUR_STORAGE_NAMES = { MP.."L4_Barrel01" }


   -- Barrel Effect Navpoints
   BARREL_FIRE_EFFECT_LOCATIONS = { [LAB_ONE_STORAGE_NAMES[1]] = { MP.."L1_B1_Fire01", MP.."L1_B1_Fire02" },
                                    [LAB_ONE_STORAGE_NAMES[2]] = { MP.."L1_B2_Fire01", MP.."L1_B2_Fire02" },

                                    [LAB_TWO_STORAGE_NAMES[1]] = { MP.."L2_B1_Fire01", MP.."L2_B1_Fire02", MP.."L2_B1_Fire03", MP.."L2_B1_Fire04" },

                                    [LAB_THREE_STORAGE_NAMES[1]] = { MP.."L3_B1_Fire01", MP.."L3_B1_Fire02", MP.."L3_B1_Fire03" },
                                    [LAB_THREE_STORAGE_NAMES[2]] = { MP.."L3_B2_Fire01", MP.."L3_B2_Fire02" },

                                    [LAB_FOUR_STORAGE_NAMES[1]] = { MP.."L4_B1_Fire01", MP.."L4_B1_Fire02" } }

   BARREL_SMALL_FIRE_EFFECT_LOCATIONS = { [LAB_ONE_STORAGE_NAMES[1]] = { MP.."L1_B1_SF01", MP.."L1_B1_SF02", MP.."L1_B1_SF03" },
                                          [LAB_ONE_STORAGE_NAMES[2]] = { MP.."L1_B2_SF01", MP.."L1_B2_SF02" },

                                          [LAB_TWO_STORAGE_NAMES[1]] = { MP.."L2_B1_SF01", MP.."L2_B1_SF02", MP.."L2_B1_SF03", MP.."L2_B1_SF04" },

                                          [LAB_THREE_STORAGE_NAMES[1]] = { MP.."L3_B1_SF01", MP.."L3_B1_SF02", MP.."L3_B1_SF03" },
                                          [LAB_THREE_STORAGE_NAMES[2]] = { MP.."L3_B2_SF01", MP.."L3_B2_SF02" },

                                          [LAB_FOUR_STORAGE_NAMES[1]] = { MP.."L4_B1_SF01", MP.."L4_B1_SF02", MP.."L4_B1_SF03" } }


   -- Effects and animation states
   LAB_THREE_SMOKE_EFFECT = "smoke_grenade"
   COUGH_ANIMATION = "TearGassed"
   LIGHT_DRUG_EFFECT = 1
   MEDIUM_DRUG_EFFECT = 2
   BOOZE_INDEX = 1
   WEED_INDEX = 2

   LARGE_FIRE = "fire_sticky"
   SMALL_FIRES = { "fire_sticky_sm", "fire_sticky_sm02" }
	BUILDING_SHAKE_BUILDING_TWO = "SS_building_shake"
	WINDOW_EXPLODE = "exp_fire_window"
	BIG_SIDE_EXPOSION = "mission_ss05_exp_side"

	


   -- Cutscenes
   CT_INTRO = "ss05-01"
   CT_OUTRO = "ss05-02"

-- Sound
   -- Persona overrides

   -- Lines/Dialog Stream
   LAB_THREE_HIDE_IN_THE_LAB = "SOS5_LAB_3_L1"
   LAB_THREE_HIDING_TECHS_PLAYER_DIALOG_STREAM =
   {
   { "SOS5_LAB_3_L2", LOCAL_PLAYER, 0 }
   }

   LAB_THREE_HIDING_TECHS_TECH_DIALOG_STREAM =
   {
   { "SOS5_LAB_3_L3", LAB_THREE_ENCLOSED_LAB_MEMBERS[1], 0 }
   }

   LAB_THREE_FINAL_TECH_FLEE = "BMFRAT_SOS5_FLEE"
   LAB_THREE_ENCLOSED_LAB_SWITCH_AUDIO = "PLAYER_SOS5_GAS_SHUTOFF_01"
   LAB_FOUR_POWER_FAILURE_AUDIO = "PLAYER_SOS5_LIGHTS_OUT_01"
   LAB_FOUR_EXIT_LAB = "PLAYER_SOS5_LAB_DOOR_01"

   -- Sound effects
   LOCKED_DOOR_SOUND = "SFX_SS05_DOOR_LOCKED"

-- Distances
   LAB_TECH_CHASE_DISTANCE_METERS = 50
   LOBBY_GUARD_WANDER_RADIUS_METERS = 4.875

   LAB_FOUR_ENTRYWAY_NPCS_WANDER_RADIUS_METERS = 4.0

-- Speeds
   LAB_TECH_CHASE_INITIAL_SPEED_MPH = 25
   LAB_TECH_CHASE_NORMAL_SPEED_MPH = 40

-- Percents and multipliers
   LIGHT_DRUG_EFFECT_STRENGTHS = { [BOOZE_INDEX] = .0, [WEED_INDEX] = .25 }
   MEDIUM_DRUG_EFFECT_STRENGTHS = { [BOOZE_INDEX] = .0, [WEED_INDEX] = .70 }

   DRUG_EFFECT_STRENGTHS = { [LIGHT_DRUG_EFFECT] = LIGHT_DRUG_EFFECT_STRENGTHS,
                             [MEDIUM_DRUG_EFFECT] = MEDIUM_DRUG_EFFECT_STRENGTHS }

-- Time values
   TIME_TO_CATCH_UP_WITH_TECH_MS = 20000

   DRUG_EFFECT_FADE_TIME = { [LIGHT_DRUG_EFFECT] = 3.0, [MEDIUM_DRUG_EFFECT] = 10.0 }
   BEFORE_BACKUP_SPAWN_DELAY_SECONDS = 5.0
   LAB_DESTROYED_OBJECTIVE_UPDATE_DELAY_SECONDS = 5.0
   TECHS_KILLED_OBJECTIVE_UPDATE_DELAY_SECONDS = 3.0
   MISSION_BEGIN_FADE_IN_TIME_SECONDS = 2.0
   LAB_FOUR_TECH_LEAVE_DELAY_SECONDS = 2.0

-- Constant values and counts
   FIRST_LAB_MIN_NOTORIETY_LEVEL = 1
   MIN_NOTORIETY_LEVEL = 2
   LAB_COUNT = 4
   INITIAL_LAB_CHEM_STORAGE_COUNT = { sizeof_table( LAB_ONE_STORAGE_NAMES ), sizeof_table( LAB_TWO_STORAGE_NAMES ),
                                      sizeof_table( LAB_THREE_STORAGE_NAMES ), sizeof_table( LAB_FOUR_STORAGE_NAMES ) }

   LAB_THREE_DEFENDERS_COUNT = sizeof_table( LAB_THREE_INITIAL_DEFENDER_MEMBERS ) +
                               sizeof_table( LAB_THREE_DEFENDER_MEMBERS ) +
                               sizeof_table( LAB_THREE_ENCLOSED_LAB_MEMBERS )

   LAB_FOUR_INITIAL_TECH_COUNT = sizeof_table( LAB_FOUR_TECH_MEMBERS )


-- Global variables

   Labs_chem_storage_remaining = { INITIAL_LAB_CHEM_STORAGE_COUNT[1], INITIAL_LAB_CHEM_STORAGE_COUNT[2],
                                   INITIAL_LAB_CHEM_STORAGE_COUNT[3], INITIAL_LAB_CHEM_STORAGE_COUNT[4] }
   Lab_one_sample_collected = false
   Lab_one_sample_is_destroyed = { false, false }

   Players_in_Lab4_Area1 = { [LOCAL_PLAYER] = false, [REMOTE_PLAYER] = false }
   Players_in_Lab4_Area2 = { [LOCAL_PLAYER] = false, [REMOTE_PLAYER] = false }

   Players_in_Lab3_Area = { [LOCAL_PLAYER] = false, [REMOTE_PLAYER] = false }

   Players_drug_effect_rampoff_thread_handles = { [LOCAL_PLAYER] = INVALID_THREAD_HANDLE,
                                                  [REMOTE_PLAYER] = INVALID_THREAD_HANDLE }

   Lab_two_tech_captured = false

   Lab_four_techs_remaining = LAB_FOUR_INITIAL_TECH_COUNT
   Swap_sequences_enabled = { [FIRE_1] = false, [FIRE_2] = false }
   Mission_won = false
   Lab_three_defenders_remaining = LAB_THREE_DEFENDERS_COUNT
   Lab_three_after_lab_attackers_spawned = false
   Players_locked_in_lab_four = false
   Mission_being_replayed = false
   
   Player_controls_disabled = false

   Num_barrel_fire_effects = 0
   Barrel_fire_effect_handles = {}


function ss05_fire_chase_explsions()
delay(2)
effect_play(BIG_SIDE_EXPOSION, "ss05_$nEffect_Trigger_One",false)
delay(.1)
effect_play(WINDOW_EXPLODE, "ss05_$nEffect_Trigger_One (0)",false)
delay(.1)
effect_play(BIG_SIDE_EXPOSION, "ss05_$nEffect_Trigger_One (1)",false)
delay(.5)
effect_play(WINDOW_EXPLODE, "ss05_$nEffect_Trigger_One (2)",false)
delay(.5)
effect_play(BIG_SIDE_EXPOSION, "ss05_$nEffect_Trigger_One (3)",false)
delay(.5)
effect_play(WINDOW_EXPLODE, "ss05_$nEffect_Trigger_One (4)",false)
delay(.5)
effect_play(BIG_SIDE_EXPOSION, "ss05_$nEffect_Trigger_One (5)",false)
delay(.5)
effect_play(WINDOW_EXPLODE, "ss05_$nEffect_Trigger_One (6)",false)

end


-- Called when a player enters the lab area - updates
-- location tracking
--
function ss05_entered_lab3_area( triggerer_name, trigger_name )
   Players_in_Lab3_Area[triggerer_name] = true
   mission_debug( triggerer_name.." entered lab 3 area" )
end

-- Called when a player leaves the lab area - updates
-- location tracking
--
function ss05_left_lab3_area( triggerer_name, trigger_name )
   Players_in_Lab3_Area[triggerer_name] = false
   mission_debug( triggerer_name.." left lab 3 area" )

   -- If we've cleared the third lab and this function is called,
   -- it means notoriety spawning hasn't been enabled - so enable
   -- it and clear the callbacks
   if ( Labs_chem_storage_remaining[3] == 0 ) then
      notoriety_force_no_spawn( ENEMY_GANG, false )
      ss05_clear_lab3_area_trigger()
      mission_debug( "enabled notoriety spawning" )
   end
end

-- Returns true if all players playing are inside lab 3,
-- false otherwise.
--
function ss05_both_players_in_lab3_area()
   -- If the local player's in the area 
   if ( Players_in_Lab3_Area[LOCAL_PLAYER] ) then
      -- Check to see if we should check the remote player
      if ( coop_is_active() ) then
        if ( Players_in_Lab3_Area[REMOTE_PLAYER] ) then
           return true
        end
      -- If not, then everyone who's playing is in the area
      else
         return true
      end
   end
   -- Otherwise, if the local player's not even there, exit
   return false
end

-- Sets up the triggers that track if players have entered
-- lab three's general area.
--
function ss05_setup_lab3_area_trigger()
   mission_debug( "lab three area trigger setup" )
   trigger_enable( LAB_THREE_AREA_TRIGGER, true )
   on_trigger( "ss05_entered_lab3_area", LAB_THREE_AREA_TRIGGER )
   on_trigger_exit( "ss05_left_lab3_area", LAB_THREE_AREA_TRIGGER )
end

-- Clear the triggers that track if players have entered
-- lab three's general area.
--
function ss05_clear_lab3_area_trigger()
   on_trigger( "", LAB_THREE_AREA_TRIGGER )
   on_trigger_exit( "", LAB_THREE_AREA_TRIGGER )
   trigger_enable( LAB_THREE_AREA_TRIGGER, false )
end

-- Callback when a player enters area 1 of lab 4.
-- Used to track what areas the players are in
-- to lock them in this lab.
--
function ss05_entered_lab4_area1( triggerer_name, trigger_name )
   Players_in_Lab4_Area1[triggerer_name] = true
   ss05_maybe_lock_players_in_lab_4()
end

-- Callback when a player enters area 2 of lab 4.
-- Used to track what areas the players are in
-- to lock them in this lab.
--
function ss05_entered_lab4_area2( triggerer_name, trigger_name )
   Players_in_Lab4_Area2[triggerer_name] = true
   ss05_maybe_lock_players_in_lab_4()
end

-- Callback when a player leaves area 1 of lab 4.
-- Used to track what areas the players are in
-- to lock them in this lab.
--
function ss05_left_lab4_area1( triggerer_name, trigger_name )
   Players_in_Lab4_Area1[triggerer_name] = false
end

-- Callback when a player leaves area 2 of lab 4.
-- Used to track what areas the players are in
-- to lock them in this lab.
--
function ss05_left_lab4_area2( triggerer_name, trigger_name )
   Players_in_Lab4_Area2[triggerer_name] = false
end

-- Returns true if the player specified is in the first half
-- of the lab. Areas 1 and 2 cover this first half.
--
function ss05_player_in_lab4_first_half( player_name )
   if ( Players_in_Lab4_Area1[player_name] or
        Players_in_Lab4_Area2[player_name] ) then
      return true;
   end

   return false;
end

-- Returns true if both players are in the first half
-- of the lab. Areas 1 and 2 cover this first half.
--
function ss05_all_players_in_lab4_first_half()

   -- Check to see if the local player is in the warehouse
   if ( ss05_player_in_lab4_first_half( LOCAL_PLAYER ) ) then
      -- If coop is on, also check the remote player.
      if ( coop_is_active() ) then
         if ( ss05_player_in_lab4_first_half( REMOTE_PLAYER ) ) then
	    -- If both are in, we've met our condition.
	    return true
	 end
      -- If it's single player and the local player is in the warehouse,
	   -- then all players are in
      else
         return true
      end
   end

   return false;
end

-- Locks the players in the first half of lab 4 if
-- they're both inside.
--
function ss05_maybe_lock_players_in_lab_4()
   if ( ss05_all_players_in_lab4_first_half() ) then
      trigger_enable( LAB_FOUR_AREA1, false );
      trigger_enable( LAB_FOUR_AREA2, false );

      while ( door_close( LAB_FOUR_ENTRANCE_DOOR ) == false ) do
         thread_yield()
      end
      delay( 0 )
		if ( coop_is_active() == false ) then
	      door_lock( LAB_FOUR_ENTRANCE_DOOR, true )
		end
      Players_locked_in_lab_four = true
   end
end

function ss05_lock_all_lab_exterior_doors()
   ss05_lock_lab_two_entrances( true )
   ss05_lock_enclosed_lab_door( true )
   ss05_lock_lab_four_exterior_doors( true )
end

function ss05_lock_lab_two_entrances( lock )
   for index, door_name in pairs( LAB_TWO_ENTRANCE_DOORS ) do
      door_lock( door_name, lock )
   end
end

function ss05_lock_enclosed_lab_door( lock )
   door_lock( LAB_THREE_DOOR_NAME, lock )
end

function ss05_lock_lab_four_exterior_doors( lock )
   door_lock( LAB_FOUR_ENTRANCE_DOOR, lock )
   door_lock( LAB_FOUR_EXIT_DOOR, lock )
end

function ss05_start( checkpoint_name, is_restart )
   -- Start trigger is hit...the activate button was hit
   set_mission_author("Brad Johnson and Mark Gabby")

   if ( mission_is_complete( MISSION_NAME ) ) then
      Mission_being_replayed = true
      mission_debug( "mission being replayed" )
   end

   -- TEMP -- uncomment this section to go to last lab and chunk swap.
	--cutscene_play("IG_SS05_scene1")
   --checkpoint_name = CP_REACHED_LAB_FOUR
   -- END TEMP

   mission_start_fade_out()
   if ( checkpoint_name == MISSION_START_CHECKPOINT ) then
		local starter_groups = { STARTER_VEHICLE_GROUP_NAME, LAB_ONE_OUTSIDE_GROUP, LAB_ONE_INSIDE_GROUP }
		if ( coop_is_active() ) then
			starter_groups = { STARTER_VEHICLE_GROUP_NAME, LAB_ONE_OUTSIDE_GROUP, LAB_ONE_INSIDE_GROUP, STARTER_VEHICLE_COOP_GROUP_NAME }
		end

		if (not is_restart) then
			cutscene_play( CT_INTRO, starter_groups, {"mission_start_sr2_city_$ss05", REMOTE_PLAYER_START}, false )
			for index, group_name in pairs( starter_groups ) do
				group_show( group_name )
			end
		else
			for index, group_name in pairs( starter_groups ) do
				group_create( group_name, true )
			end

			-- Teleport the player last to improve loading times
			teleport_coop( "mission_start_sr2_city_$ss05", REMOTE_PLAYER_START )
		end
   end

   ss05_lock_all_lab_exterior_doors( true )

   set_weather( 0, true )
   local state_to_setup

   -- If the mission is being replayed, temporarily revert the swap sequences
   if ( Mission_being_replayed ) then
      ss05_save_game_current_swaps()
   end

   if ( checkpoint_name == MISSION_START_CHECKPOINT ) then
      state_to_setup = MS_TRAVEL_TO_FIRST_LAB
   elseif ( checkpoint_name == CP_REACHED_LAB_ONE ) then
      -- Create the first lab's groups - make sure they're visible at start
      group_create( LAB_ONE_OUTSIDE_GROUP, true )
      group_create( LAB_ONE_INSIDE_GROUP, true )

      state_to_setup = MS_FIRST_LAB_CHECKPOINT
   elseif ( checkpoint_name == CP_REACHED_LAB_TWO ) then
      -- Create the second lab's groups
      group_create( LAB_TWO_FLOOR_ONE_ATTACKERS, true )
      group_create( LAB_TWO_FLOOR_TWO_ATTACKERS, true )
      wander_start( LAB_TWO_LOBBY_GUARD, LAB_TWO_LOBBY_GUARD, LOBBY_GUARD_WANDER_RADIUS_METERS )

      for index, name in pairs ( LAB_ONE_STORAGE_NAMES ) do
         mesh_mover_hide( name )
      end

      ss05_lock_lab_two_entrances( false )

      state_to_setup = MS_SECOND_LAB_CHECKPOINT
   elseif ( checkpoint_name == CP_REACHED_LAB_THREE ) then
      -- Create the third lab's groups
      group_create( LAB_THREE_INITIAL_DEFENDERS_GROUP, true )
      group_create( LAB_THREE_ENCLOSED_LAB_GROUP, true )
      group_create( LAB_THREE_DEFENDERS_GROUP, true )
      group_create_hidden( LAB_THREE_AFTER_LAB_ATTACK_GROUP, true )

      -- Add callbacks for the members dying
      for index, name in pairs( LAB_THREE_INITIAL_DEFENDER_MEMBERS ) do
         on_death( "ss05_lab_three_defender_died", name )
      end

      for index, name in pairs ( LAB_ONE_STORAGE_NAMES ) do
         mesh_mover_hide( name )
      end
      for index, name in pairs ( LAB_TWO_STORAGE_NAMES ) do
         mesh_mover_hide( name )
      end
      state_to_setup = MS_THIRD_LAB_CHECKPOINT
   elseif ( checkpoint_name == CP_REACHED_LAB_FOUR ) then
      -- Create the final lab's groups
	   group_create( LAB_FOUR_OUTSIDE_GROUP, true )
      group_create_hidden( LAB_FOUR_ESCAPING_TECH_GROUP, true )
      group_create_hidden( LAB_FOUR_PLAYERS_CAR_GROUP, true )
      group_create_hidden( LAB_FOUR_DEFENDERS_GROUP, true )
      group_create_hidden( LAB_FOUR_TECHS_GROUP, true )
      for index, name in pairs ( LAB_ONE_STORAGE_NAMES ) do
         mesh_mover_hide( name )
      end
      for index, name in pairs ( LAB_TWO_STORAGE_NAMES ) do
         mesh_mover_hide( name )
      end
      for index, name in pairs ( LAB_THREE_STORAGE_NAMES ) do
         mesh_mover_hide( name )
      end
      state_to_setup = MS_FOURTH_LAB_CHECKPOINT

      door_lock( LAB_FOUR_ENTRANCE_DOOR, false )
   end
   mission_start_fade_in()

	-- Create the outside guards at lab 4. It always makes sense to spawn these guys at mission start.
	-- However, only load them blocking if we're at lab four.
	if ( checkpoint_name ~= CP_REACHED_LAB_FOUR ) then
	   group_create( LAB_FOUR_OUTSIDE_GROUP )
	end

   ss05_switch_state( state_to_setup )
end

-- Activates the light drug effect on the player who wanders near a lab.
--
function ss05_activate_light_drug_effect( triggerer_name )
   local sync_type = sync_from_player( triggerer_name )

   -- Stop any rampoff that might be enabled
   if ( Players_drug_effect_rampoff_thread_handles[triggerer_name] ~= INVALID_THREAD_HANDLE ) then
      thread_kill( Players_drug_effect_rampoff_thread_handles[triggerer_name] )
      Players_drug_effect_rampoff_thread_handles[triggerer_name] = INVALID_THREAD_HANDLE
   end

   -- Enable the override
   drug_enable_disable_effect_override( true, sync_type )

   drug_effect_set_override_values( LIGHT_DRUG_EFFECT_STRENGTHS[BOOZE_INDEX],
                                    LIGHT_DRUG_EFFECT_STRENGTHS[WEED_INDEX], sync_type )
end

-- Activates the medium drug effect on the player who wanders near a lab.
--
function ss05_activate_medium_drug_effect( triggerer_name )
   local sync_type = sync_from_player( triggerer_name )

   -- Stop any rampoff that might be enabled
   if ( Players_drug_effect_rampoff_thread_handles[triggerer_name] ~= INVALID_THREAD_HANDLE ) then
      thread_kill( Players_drug_effect_rampoff_thread_handles[triggerer_name] )
      Players_drug_effect_rampoff_thread_handles[triggerer_name] = INVALID_THREAD_HANDLE
   end

   -- Enable the override
   drug_enable_disable_effect_override( true, sync_type )

   drug_effect_set_override_values( MEDIUM_DRUG_EFFECT_STRENGTHS[BOOZE_INDEX],
                                    MEDIUM_DRUG_EFFECT_STRENGTHS[WEED_INDEX], sync_type )
end

-- Activates the light drug effect rampoff for the player who wanders out of the light
-- drug radius.
--
function ss05_start_light_drug_effect_rampoff( triggerer_name )
   -- Check to see if the player already has a rampoff turned on...
   -- If so, then kill the thread
   if ( Players_drug_effect_rampoff_thread_handles[triggerer_name] ~= INVALID_THREAD_HANDLE ) then
      thread_kill( Players_drug_effect_rampoff_thread_handles[triggerer_name] )
      Players_drug_effect_rampoff_thread_handles[triggerer_name] = INVALID_THREAD_HANDLE
   end

   local sync_type = sync_from_player( triggerer_name )

   -- Start a new rampoff thread
   Players_drug_effect_rampoff_thread_handles[triggerer_name] = thread_new( "ss05_drug_rampoff", LIGHT_DRUG_EFFECT, sync_type )									    
end

-- Activates the medium drug effect rampoff for the player who wanders out of the medium
-- drug radius.
--
function ss05_start_medium_drug_effect_rampoff( triggerer_name )
   -- Check to see if the player already has a rampoff turned on...
   -- If so, then kill the thread
   if ( Players_drug_effect_rampoff_thread_handles[triggerer_name] ~= INVALID_THREAD_HANDLE ) then
      thread_kill( Players_drug_effect_rampoff_thread_handles[triggerer_name] )
      Players_drug_effect_rampoff_thread_handles[triggerer_name] = INVALID_THREAD_HANDLE
   end

   local sync_type = sync_from_player( triggerer_name )

   -- Start a new rampoff thread
   Players_drug_effect_rampoff_thread_handles[triggerer_name] = thread_new( "ss05_drug_rampoff", MEDIUM_DRUG_EFFECT, sync_type )
end

-- This function does the drug rampoff for a drug effect on a player.
--
-- drug_initial_effect_type: Not booze or weed - light or medium drug effects.
--
function ss05_drug_rampoff( drug_initial_effect_type, sync_type )
   -- Get the starting strength values for the rampoff
   local initial_strengths = { [BOOZE_INDEX] = DRUG_EFFECT_STRENGTHS[drug_initial_effect_type][BOOZE_INDEX],
                               [WEED_INDEX] = DRUG_EFFECT_STRENGTHS[drug_initial_effect_type][WEED_INDEX] }

   local cur_strengths = { [BOOZE_INDEX] = initial_strengths[BOOZE_INDEX], [WEED_INDEX] = initial_strengths[WEED_INDEX] }

   -- Find out how many units of strength drop per second
   local dropoffs_per_second = { [BOOZE_INDEX] = initial_strengths[BOOZE_INDEX] / DRUG_EFFECT_FADE_TIME[drug_initial_effect_type],
                                 [WEED_INDEX] = initial_strengths[WEED_INDEX] / DRUG_EFFECT_FADE_TIME[drug_initial_effect_type] }

   local dropoff_time_remaining = DRUG_EFFECT_FADE_TIME[drug_initial_effect_type]

   while ( dropoff_time_remaining > 0 ) do
      local frametime = get_frame_time()

      cur_strengths[BOOZE_INDEX] = cur_strengths[BOOZE_INDEX] - ( dropoffs_per_second[BOOZE_INDEX] * frametime )
      cur_strengths[WEED_INDEX] = cur_strengths[WEED_INDEX] - ( dropoffs_per_second[WEED_INDEX] * frametime )

      if ( cur_strengths[BOOZE_INDEX] < 0 ) then
         cur_strengths[BOOZE_INDEX] = 0
      end
      if ( cur_strengths[WEED_INDEX] < 0 ) then
         cur_strengths[WEED_INDEX] = 0
      end

      drug_effect_set_override_values( cur_strengths[BOOZE_INDEX], cur_strengths[WEED_INDEX], sync_type )

      dropoff_time_remaining = dropoff_time_remaining - frametime
      delay( 0 )
   end

   -- Disable the override; we've ramped off completely
   drug_enable_disable_effect_override( false, sync_type )
end

-- Sets up a lab's light drug effect radius.
--
-- lab_index: The index of the lab whose light drug effect we want to enable.
--
function ss05_set_light_drug_effect( lab_index )
   -- Activate the light drug effect trigger for this lab
   trigger_enable( LAB_LIGHT_DRUG_EFFECT_TRIGGERS[lab_index], true )
   on_trigger( "ss05_activate_light_drug_effect", LAB_LIGHT_DRUG_EFFECT_TRIGGERS[lab_index] )
   on_trigger_exit( "ss05_start_light_drug_effect_rampoff", LAB_LIGHT_DRUG_EFFECT_TRIGGERS[lab_index] )
end

-- Sets up a lab's medium drug effect radius. Disables the light drug effect for this lab.
--
-- lab_index: The index of the lab whose medium drug effect we want to enable.
--
function ss05_set_medium_drug_effect( lab_index )
   -- Disable the light drug effect trigger and enable the medium drug effect trigger for this lab
   trigger_enable( LAB_LIGHT_DRUG_EFFECT_TRIGGERS[lab_index], false )

   trigger_enable( LAB_MEDIUM_DRUG_EFFECT_TRIGGERS[lab_index], true )
   on_trigger( "ss05_activate_medium_drug_effect", LAB_MEDIUM_DRUG_EFFECT_TRIGGERS[lab_index] )
   on_trigger_exit( "ss05_start_medium_drug_effect_rampoff", LAB_MEDIUM_DRUG_EFFECT_TRIGGERS[lab_index] )
end

function ss05_setup_first_lab_interior()
   -- Add callbacks for the chemical storage tanks
   for index, name in LAB_ONE_STORAGE_NAMES do
      mesh_mover_reset( name )
      on_mover_destroyed( "ss05_lab_one_storage_destroyed", name )
      marker_add_mover( name, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL )
   end

   -- No notoriety spawns during lab attack
   notoriety_force_no_spawn( ENEMY_GANG, true )
end

function ss05_setup_second_lab_interior()
     -- Reset the chem storage barrels, mark them, and add callbacks for their destruction
   for index, name in LAB_TWO_STORAGE_NAMES do
      mesh_mover_reset( name )
      on_mover_destroyed( "ss05_lab_two_storage_destroyed", name )
      marker_add_mover( name, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL )
   end

    -- No notoriety spawns during lab attack
   notoriety_force_no_spawn( ENEMY_GANG, true )
end

function ss05_setup_third_lab_interior()
   for index, name in pairs( LAB_THREE_DEFENDER_MEMBERS ) do
      on_death( "ss05_lab_three_defender_died", name )
   end
   for index, name in pairs( LAB_THREE_ENCLOSED_LAB_MEMBERS ) do
      on_death( "ss05_lab_three_defender_died", name )
   end
   -- Enable the next trigger to guide the player to the main area
   marker_remove_trigger( LAB_THREE_ENTRANCE_TRIGGER, SYNC_ALL )
   trigger_enable( LAB_THREE_LOCATION_TRIGGER, true )
   on_trigger( "ss05_inside_lab_three", LAB_THREE_LOCATION_TRIGGER )
   marker_add_trigger( LAB_THREE_LOCATION_TRIGGER, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION, SYNC_ALL )
   waypoint_add( LAB_THREE_LOCATION_TRIGGER, SYNC_ALL )

   -- Enable the trigger at the top of the stairs - the player hears the Samedi planning to lock the door
   trigger_enable( LAB_THREE_TOP_OF_STAIRS_TRIGGER, true )
   on_trigger( "ss05_play_lab_techs_hiding_dialog", LAB_THREE_TOP_OF_STAIRS_TRIGGER )

   -- Enable the "Flush out the room" trigger
   trigger_enable( LAB_THREE_FLUSH_OUT_SWITCH, true )
   on_trigger( "ss05_activated_flush_out_switch", LAB_THREE_FLUSH_OUT_SWITCH )

   -- Enable the enclosed lab trigger, which will let the player he needs to flush out the
   -- gang members in the enclosed lab
   trigger_enable( LAB_THREE_ENCLOSED_LAB_ENTRANCE_TRIGGER, true )
   on_trigger( "ss05_reached_enclosed_lab_entrance", LAB_THREE_ENCLOSED_LAB_ENTRANCE_TRIGGER )
   -- Lock the door
   door_lock( LAB_THREE_DOOR_NAME, true )

   -- This is used to prevent notoriety spawns from resuming unless the players
   -- leave the lab
   ss05_setup_lab3_area_trigger()

   -- No notoriety spawns during lab attack
   notoriety_force_no_spawn( ENEMY_GANG, true )
end

function ss05_setup_fourth_lab_interior()
   trigger_enable( LAB_FOUR_AREA1, true )
   trigger_enable( LAB_FOUR_AREA2, true )
   on_trigger( "ss05_entered_lab4_area1", LAB_FOUR_AREA1 )
   on_trigger_exit( "ss05_left_lab4_area1", LAB_FOUR_AREA1 )
   on_trigger( "ss05_entered_lab4_area2", LAB_FOUR_AREA2 )
   on_trigger_exit( "ss05_left_lab4_area2", LAB_FOUR_AREA2 )

   -- Setup the locked door trigger to let the player know that it's locked
   trigger_enable( LAB_FOUR_BEFORE_DOOR_UNLOCKED_TRIGGER, true )
   on_trigger( "ss05_door_locked", LAB_FOUR_BEFORE_DOOR_UNLOCKED_TRIGGER )

   -- Lock the exit door and the door to the drug room
   door_lock( LAB_FOUR_EXIT_DOOR, true )
   door_close( LAB_FOUR_MIDDLE_DOOR )
   door_lock( LAB_FOUR_MIDDLE_DOOR, true )
   door_lock( LAB_FOUR_DOOR_NEAR_BARREL, true )

   -- TODO: Activate callback for reaching the inside of the building to lock both doors
   -- and do the chunk swapping.
   -- trigger_enable( LAB_FOUR_CHUNK_SWAP_TRIGGER, true )
   -- on_trigger( "start_fire", LAB_FOUR_CHUNK_SWAP_TRIGGER )

   -- Add callback on death for all of the techs
   for index, name in LAB_FOUR_TECH_MEMBERS do
      npc_leash_set_unbreakable( name, true )
      on_death( "ss05_lab_four_tech_killed", name )
   end

   -- Enable the guide triggers
   for trigger_index, trigger_name in pairs( LAB_FOUR_GUIDE_TRIGGERS ) do
      trigger_enable( trigger_name, true )
      on_trigger( "ss05_reached_guide_trigger0"..trigger_index, trigger_name )
   end
   -- Mark the first guide trigger
   marker_add_trigger( LAB_FOUR_GUIDE_TRIGGERS[1], MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION, SYNC_ALL )

   trigger_enable( LAB_FOUR_LOCATION_TRIGGER, true )
   on_trigger( "ss05_reached_lab_four_entrance", LAB_FOUR_LOCATION_TRIGGER )
end

function ss05_reached_guide_trigger01( triggerer_name, trigger_name )
   -- Disable and unmark this trigger
   marker_remove_trigger( trigger_name, SYNC_ALL )
   trigger_enable( trigger_name, false )

   -- Mark the next trigger
   marker_add_trigger( LAB_FOUR_GUIDE_TRIGGERS[2], MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL )

   -- Disable notoriety here, possibly
   notoriety_force_no_spawn( ENEMY_GANG, true )
end
function ss05_reached_guide_trigger02( triggerer_name, trigger_name )
   -- Disable and unmark this trigger
   marker_remove_trigger( trigger_name, SYNC_ALL )
   trigger_enable( trigger_name, false )

   -- Disable and unmark the previous trigger in case we hit this one first
   marker_remove_trigger( LAB_FOUR_GUIDE_TRIGGERS[1], SYNC_ALL )
   trigger_enable( LAB_FOUR_GUIDE_TRIGGERS[1], false )

   -- Mark the next trigger
   marker_add_trigger( LAB_FOUR_LOCATION_TRIGGER, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL )

   -- Disable notoriety here, possibly
   notoriety_force_no_spawn( ENEMY_GANG, true )
end

function ss05_unleash_all( member_names )
   for index, member_name in pairs( member_names ) do
      if ( character_is_dead( member_name ) == false ) then
         npc_leash_remove( member_name )
      end
   end
end

function ss05_maybe_release_group( group_name )
   if ( group_is_loaded( group_name ) ) then
      release_to_world( group_name )
   end
end

function ss05_maybe_release_lab_groups( lab_index )
   if ( lab_index == 1 ) then
      ss05_maybe_release_group( LAB_ONE_OUTSIDE_GROUP )
      ss05_maybe_release_group( LAB_ONE_INSIDE_GROUP )
   elseif ( lab_index == 2 ) then
      ss05_maybe_release_group( LAB_TWO_FLOOR_ONE_ATTACKERS )
      ss05_maybe_release_group( LAB_TWO_FLOOR_TWO_ATTACKERS )
   elseif ( lab_index == 3 ) then
      ss05_maybe_release_group( LAB_THREE_INITIAL_DEFENDERS_GROUP )
      ss05_maybe_release_group( LAB_THREE_ENCLOSED_LAB_GROUP )
      ss05_maybe_release_group( LAB_THREE_DEFENDERS_GROUP )
      ss05_maybe_release_group( LAB_THREE_AFTER_LAB_ATTACK_GROUP )
   elseif ( lab_index == 4 ) then
      ss05_maybe_release_group( LAB_FOUR_OUTSIDE_GROUP )
      ss05_maybe_release_group( LAB_FOUR_ESCAPING_TECH_GROUP )
      ss05_maybe_release_group( LAB_FOUR_PLAYERS_CAR_GROUP )
      ss05_maybe_release_group( LAB_FOUR_DEFENDERS_GROUP )
      ss05_maybe_release_group( LAB_FOUR_TECHS_GROUP )
   end
end

function ss05_create_lab_groups_hidden( lab_index )
   if ( lab_index == 1 ) then
      group_create( LAB_ONE_OUTSIDE_GROUP, true )
      group_create( LAB_ONE_INSIDE_GROUP, true )
   elseif ( lab_index == 2 ) then
      -- Create the second lab's groups
      group_create_hidden( LAB_TWO_FLOOR_ONE_ATTACKERS, true )
      group_create_hidden( LAB_TWO_FLOOR_TWO_ATTACKERS, true )
   elseif ( lab_index == 3 ) then
      -- Create the third lab's groups
      group_create_hidden( LAB_THREE_INITIAL_DEFENDERS_GROUP, true )
      group_create_hidden( LAB_THREE_ENCLOSED_LAB_GROUP, true )
      group_create_hidden( LAB_THREE_DEFENDERS_GROUP, true )
      group_create_hidden( LAB_THREE_AFTER_LAB_ATTACK_GROUP, true )
   elseif ( lab_index == 4 ) then
      -- Create the final lab's groups
      group_create_hidden( LAB_FOUR_ESCAPING_TECH_GROUP, true )
      group_create_hidden( LAB_FOUR_PLAYERS_CAR_GROUP, true )
      group_create_hidden( LAB_FOUR_DEFENDERS_GROUP, true )
      group_create_hidden( LAB_FOUR_TECHS_GROUP, true )
   end
end

-- Switches the mission to a new state.
--
-- new_state: The state to switch to.
--
function ss05_switch_state( new_state )

   -- In this state, the player is guided to the first drug lab
   if ( new_state == MS_TRAVEL_TO_FIRST_LAB ) then
      -- Create the trigger and the location, and guide the player there
      trigger_enable( LAB_ONE_LOCATION_TRIGGER, true )
      on_trigger( "ss05_reached_lab_one", LAB_ONE_LOCATION_TRIGGER )
      marker_add_trigger( LAB_ONE_LOCATION_TRIGGER, MINIMAP_ICON_LOCATION, "", SYNC_ALL )
      waypoint_add( LAB_ONE_LOCATION_TRIGGER, SYNC_ALL )
      mission_help_table( HT_GO_TO_FIRST_LAB, "", "", SYNC_ALL )
      objective_text(0, HT_X_OF_Y_LABS_DESTROYED, 0, LAB_COUNT, SYNC_ALL )

   -- When the player reaches the first lab, the chemical storage tanks are marked.
   -- Additionally, the gang members outside attack him.
   elseif ( new_state == MS_REACHED_FIRST_LAB ) then
      mission_help_table( HT_DESTROY_STORAGE_CONTAINERS )
      ss05_setup_first_lab_interior()

      -- Update the player's objectives
      waypoint_remove( SYNC_ALL )
      trigger_enable( LAB_ONE_LOCATION_TRIGGER, false )

      mission_set_checkpoint( CP_REACHED_LAB_ONE )

      -- Have the gang members attack the closest player
      local distance, player = get_dist_closest_player_to_object( LAB_ONE_LOCATION_TRIGGER )
      for index, name in LAB_ONE_OUTSIDE_GROUP_MEMBERS do
         attack_safe( name, player )
         local attack_delay = rand_float( 1, 2 )
         delay( attack_delay )
      end

      notoriety_set_min( ENEMY_GANG, FIRST_LAB_MIN_NOTORIETY_LEVEL )
   -- When the player destroys the first lab,
   -- update his objective text and then switch the state
   elseif ( new_state == MS_DESTROYED_FIRST_LAB ) then
      ss05_unleash_all( LAB_ONE_INSIDE_GROUP_MEMBERS )

      notoriety_set_min( ENEMY_GANG, MIN_NOTORIETY_LEVEL )

      delay( LAB_DESTROYED_OBJECTIVE_UPDATE_DELAY_SECONDS )
      objective_text(0, HT_X_OF_Y_LABS_DESTROYED, 1, LAB_COUNT, SYNC_ALL )

      -- Notoriety spawns should be on between labs
      notoriety_force_no_spawn( ENEMY_GANG, false )

      ss05_switch_state( MS_TRAVEL_TO_SECOND_LAB )
   -- This state leads the player to the second lab and readies it for his arrival
   elseif ( new_state == MS_TRAVEL_TO_SECOND_LAB ) then
      -- Lead the player to the next objective
      mission_help_table( HT_HEAD_TO_SECOND_LAB )
      waypoint_add( LAB_TWO_LOCATION_TRIGGER, SYNC_ALL )

      -- Activate the trigger so that the mission is updated when the player
      -- reaches the second lab
      trigger_enable( LAB_TWO_LOCATION_TRIGGER, true )
      on_trigger( "ss05_reached_lab_two", LAB_TWO_LOCATION_TRIGGER )
      marker_add_trigger( LAB_TWO_LOCATION_TRIGGER, MINIMAP_ICON_LOCATION, "", SYNC_ALL )

      -- Create the lab's groups
      ss05_maybe_release_lab_groups( 1 )
      ss05_create_lab_groups_hidden( 2 )
      group_show( LAB_TWO_FLOOR_ONE_ATTACKERS )
      wander_start( LAB_TWO_LOBBY_GUARD, LAB_TWO_LOBBY_GUARD, LOBBY_GUARD_WANDER_RADIUS_METERS )
      ss05_lock_lab_two_entrances( false )

   -- Sets up the second lab on the player's arrival. 
   elseif ( new_state == MS_REACHED_SECOND_LAB ) then
      ss05_setup_second_lab_interior()
      waypoint_remove( SYNC_ALL )

      mission_help_table( HT_DESTROY_STORAGE_CONTAINERS )
      mission_set_checkpoint( CP_REACHED_LAB_TWO )
      group_show( LAB_TWO_FLOOR_TWO_ATTACKERS )
   -- When the player destroys the second lab,
   -- update his objective text and then switch the state
   elseif ( new_state == MS_DESTROYED_SECOND_LAB ) then
      npc_leash_remove( LAB_TWO_LOBBY_GUARD )
      ss05_unleash_all( LAB_TWO_DEFENDER_MEMBERS )

      delay( LAB_DESTROYED_OBJECTIVE_UPDATE_DELAY_SECONDS )
      objective_text(0, HT_X_OF_Y_LABS_DESTROYED, 2, LAB_COUNT, SYNC_ALL )

      -- Notoriety spawns should be on between labs
      notoriety_force_no_spawn( ENEMY_GANG, false )

      ss05_switch_state( MS_TRAVEL_TO_THIRD_LAB )
   -- This state leads the player to the third lab.
   elseif ( new_state == MS_TRAVEL_TO_THIRD_LAB ) then
      -- Guide the player to the third lab, and set up the triggers so that the mission will be updated when
      -- the player reaches the third lab
      waypoint_add( LAB_THREE_ENTRANCE_TRIGGER, SYNC_ALL )
      trigger_enable( LAB_THREE_ENTRANCE_TRIGGER, true )
      on_trigger( "ss05_reached_lab_three", LAB_THREE_ENTRANCE_TRIGGER )
      marker_add_trigger( LAB_THREE_ENTRANCE_TRIGGER, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION, SYNC_ALL )

      mission_help_table( HT_DESTROY_THIRD_LAB, "", "", SYNC_ALL )

      -- Create the lab's groups
      ss05_maybe_release_lab_groups( 2 )
      ss05_create_lab_groups_hidden( 3 )
      group_show( LAB_THREE_INITIAL_DEFENDERS_GROUP )

      for index, name in pairs( LAB_THREE_INITIAL_DEFENDER_MEMBERS ) do
         on_death( "ss05_lab_three_defender_died", name )
      end
   -- When the player destroys the third lab,
   -- update his objective text and then switch the state
   elseif ( new_state == MS_REACHED_THIRD_LAB ) then
      waypoint_remove( SYNC_ALL )

      -- Show the defenders
      group_show( LAB_THREE_ENCLOSED_LAB_GROUP )
      group_show( LAB_THREE_DEFENDERS_GROUP )

      ss05_setup_third_lab_interior()

      mission_set_checkpoint( CP_REACHED_LAB_THREE )
   -- When the player destroys the third lab,
   -- update his objective text and then switch the state
   elseif ( new_state == MS_DESTROYED_THIRD_LAB ) then
      ss05_unleash_all( LAB_THREE_DEFENDER_MEMBERS )
      ss05_unleash_all( LAB_THREE_INITIAL_DEFENDER_MEMBERS )

      delay( LAB_DESTROYED_OBJECTIVE_UPDATE_DELAY_SECONDS )
      objective_text(0, HT_X_OF_Y_LABS_DESTROYED, 3, LAB_COUNT, SYNC_ALL )

      if ( ss05_both_players_in_lab3_area() == false ) then
         -- Notoriety spawns should be on, because at least one player
         -- is out of the lab
         notoriety_force_no_spawn( ENEMY_GANG, false )
         ss05_clear_lab3_area_trigger()
         mission_debug( "enabled notoriety spawning - from state" )
      end

      ss05_switch_state( MS_TRAVEL_TO_FOURTH_LAB )
   elseif ( new_state == MS_TRAVEL_TO_FOURTH_LAB ) then
      mission_help_table( HT_DESTROY_FOURTH_LAB, "", "", SYNC_ALL )

      -- Activate the "reached" trigger, and guide the player toward it
      trigger_enable( LAB_FOUR_NEAR_TRIGGER, true )
      on_trigger( "ss05_reached_lab_four", LAB_FOUR_NEAR_TRIGGER )
      marker_add_trigger( LAB_FOUR_NEAR_TRIGGER, MINIMAP_ICON_LOCATION, "", SYNC_ALL )
      waypoint_add( LAB_FOUR_NEAR_TRIGGER, SYNC_ALL )

      -- Create the lab's groups
      ss05_maybe_release_lab_groups( 3 )
      ss05_create_lab_groups_hidden( 4 )
   elseif ( new_state == MS_REACHED_FOURTH_LAB ) then
      waypoint_remove( SYNC_ALL )

      marker_remove_trigger( LAB_FOUR_NEAR_TRIGGER )

      ss05_setup_fourth_lab_interior()
      mission_set_checkpoint( CP_REACHED_LAB_FOUR )
      door_lock( LAB_FOUR_ENTRANCE_DOOR, false )

   -- The last state - chase down and kill the head tech
   elseif ( new_state == MS_TECH_ESCAPING ) then
      for index, firetruck_name in pairs( FIRETRUCK_NAMES ) do
         vehicle_enter_group_teleport( FIRETRUCKS_FIREFIGHTERS[index], firetruck_name )      
      end
      trigger_enable( FIRETRUCK_START_PATH_TRIGGER, true )
      trigger_enable( FIRETRUCK_MID_PATH_TRIGGER, true )
      trigger_enable( FIRETRUCK_END_PATHS_TRIGGER, true )
      on_trigger( "ss05_firetruck_start_pathing", FIRETRUCK_START_PATH_TRIGGER )
      on_trigger( "ss05_mid_firetruck_start_pathing", FIRETRUCK_MID_PATH_TRIGGER )
      on_trigger( "ss05_end_firetrucks_start_pathing", FIRETRUCK_END_PATHS_TRIGGER )

      vehicle_ignore_repulsors(LAB_FOUR_ESCAPE_VEHICLE, true)
		vehicle_infinite_mass(LAB_FOUR_ESCAPE_VEHICLE, true) 
		vehicle_suppress_npc_exit( LAB_FOUR_ESCAPE_VEHICLE, true )
      set_ignore_ai_flag( LAB_FOUR_ESCAPEE_TECH, false )

      thread_new( "ss05_tech_escape_thread" )

      delay( 2.0 )
      audio_play_for_character( LAB_FOUR_EXIT_LAB, LOCAL_PLAYER, "voice", false, false )
   elseif ( new_state == MS_FIRST_LAB_CHECKPOINT ) then
      mission_help_table( HT_DESTROY_STORAGE_CONTAINERS )
      objective_text( 0, HT_X_OF_Y_DUST_CONTAINERS_DESTROYED, 0,
                      INITIAL_LAB_CHEM_STORAGE_COUNT[1], SYNC_ALL )

      notoriety_set_min( ENEMY_GANG, FIRST_LAB_MIN_NOTORIETY_LEVEL )
      ss05_setup_first_lab_interior()
   elseif ( new_state == MS_SECOND_LAB_CHECKPOINT ) then
      mission_help_table( HT_DESTROY_STORAGE_CONTAINERS )
      objective_text( 0, HT_X_OF_Y_DUST_CONTAINERS_DESTROYED, 0,
                      INITIAL_LAB_CHEM_STORAGE_COUNT[2], SYNC_ALL )

      notoriety_set_min( ENEMY_GANG, MIN_NOTORIETY_LEVEL )
      ss05_setup_second_lab_interior()
   elseif ( new_state == MS_THIRD_LAB_CHECKPOINT ) then
      mission_help_table( HT_DESTROY_STORAGE_CONTAINERS )
      objective_text( 0, HT_X_OF_Y_DUST_CONTAINERS_DESTROYED, 0,
                      INITIAL_LAB_CHEM_STORAGE_COUNT[3], SYNC_ALL )

      notoriety_set_min( ENEMY_GANG, MIN_NOTORIETY_LEVEL )
      ss05_setup_third_lab_interior()
   elseif ( new_state == MS_FOURTH_LAB_CHECKPOINT ) then
      mission_help_table( HT_DESTROY_STORAGE_CONTAINERS )
      objective_text(0, HT_X_OF_Y_LABS_DESTROYED, 3, LAB_COUNT, SYNC_ALL )

      notoriety_set_min( ENEMY_GANG, MIN_NOTORIETY_LEVEL )
      
      -- Disable notoriety so that the tech doesn't get clogged
      notoriety_force_no_spawn( ENEMY_GANG, true )
      ss05_setup_fourth_lab_interior()
   end
end

-- Has the firetruck path on its near-miss path.
--
function ss05_firetruck_start_pathing( triggerer_name, trigger_name )
   if ( triggerer_name == LAB_FOUR_ESCAPEE_TECH ) then
      trigger_enable( trigger_name, false )
		thread_new("ss05_fire_chase_explsions")
      ss05_firetruck_path( 1 )
   end
end

function ss05_mid_firetruck_start_pathing( triggerer_name, trigger_name )
   if ( triggerer_name == LAB_FOUR_ESCAPEE_TECH ) then
      trigger_enable( trigger_name, false )

      ss05_firetruck_path( 4 )
   end
end

function ss05_end_firetrucks_start_pathing( triggerer_name, trigger_name )
   if ( triggerer_name == LAB_FOUR_ESCAPEE_TECH ) then
      trigger_enable( trigger_name, false )

      thread_new( "ss05_firetruck_path", 2 )
      thread_new( "ss05_firetruck_path", 3 )
   end
end

function ss05_firetruck_path( truck_index )
   vehicle_pathfind_to( FIRETRUCK_NAMES[truck_index], FIRETRUCK_PATHS[truck_index], true, true )
end


-- Called when a player reaches the entrance to lab 4.
-- Guides the player to the next goal - killing all of the
-- drug techs - by marking them.
--
function ss05_reached_lab_four_entrance( triggerer_name, trigger_name )
   group_show( LAB_FOUR_DEFENDERS_GROUP )
   group_show( LAB_FOUR_TECHS_GROUP )

   for trigger_index, trigger_name in pairs( LAB_FOUR_GUIDE_TRIGGERS ) do
      trigger_enable( trigger_name, false )
      marker_remove_trigger( trigger_name, SYNC_ALL )
   end

   -- Objectives
   mission_help_table( HT_KILL_SAMEDI_TECHS )
   objective_text( 0, HT_X_OF_Y_TECHS_KILLED,
                   0, LAB_FOUR_INITIAL_TECH_COUNT, SYNC_ALL )

   wander_start( LAB_FOUR_ENTRYWAY_TECH_NAME, LAB_FOUR_ENTRYWAY_TECH_NAME,
                 LAB_FOUR_ENTRYWAY_NPCS_WANDER_RADIUS_METERS )

   for index, name in pairs( LAB_FOUR_ENTRYWAY_DEFENDERS ) do
      wander_start( name, name, LAB_FOUR_ENTRYWAY_NPCS_WANDER_RADIUS_METERS )
   end

   -- Add markers for all of the techs
   for index, name in LAB_FOUR_TECH_MEMBERS do
      marker_add_npc( name, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL )
      -- dont_leave_cower = true, ignore_distance = true
      cower( name, triggerer_name, true, true )
   end

   waypoint_remove( SYNC_ALL )
   marker_remove_trigger( trigger_name, SYNC_ALL )
   trigger_enable( trigger_name, false )

   -- Disable notoriety here, possibly
   notoriety_force_no_spawn( ENEMY_GANG, true )
end

function ss05_set_chase_enter_callbacks( callback_name )
   on_vehicle_enter( callback_name, LOCAL_PLAYER )
   if ( coop_is_active() ) then
      on_vehicle_enter( callback_name, REMOTE_PLAYER )
   end
   on_vehicle_enter( callback_name, PLAYER_CHASE_CAR )
end

function ss05_player_entered_car_chase_tech( character_name )
   if ( character_name == LOCAL_PLAYER or character_name == REMOTE_PLAYER ) then
      local cur_char_dist_to_vehicle = get_dist_char_to_vehicle( character_name, LAB_FOUR_ESCAPE_VEHICLE )
      -- 
      if ( cur_char_dist_to_vehicle < LAB_TECH_CHASE_DISTANCE_METERS ) then
         vehicle_speed_override( LAB_FOUR_ESCAPE_VEHICLE, LAB_TECH_CHASE_NORMAL_SPEED_MPH )
         ss05_set_chase_enter_callbacks( "" )
      end
   end
end

function ss05_tech_invincible()
	turn_invulnerable( LAB_FOUR_ESCAPE_VEHICLE )
	turn_invulnerable( LAB_FOUR_ESCAPEE_TECH )
	delay( 5.0 )
	turn_vulnerable( LAB_FOUR_ESCAPE_VEHICLE )
	turn_vulnerable( LAB_FOUR_ESCAPEE_TECH )
end

function ss05_tech_vehicle_unjackable()
   set_unjackable_flag( LAB_FOUR_ESCAPE_VEHICLE, true )
   delay( 15 )
   set_unjackable_flag( LAB_FOUR_ESCAPE_VEHICLE, false )
end

-- This thread handles the AI for the escaping tech.
--
function ss05_tech_escape_thread()
   thread_new( "ss05_tech_vehicle_unjackable" )
	thread_new( "ss05_tech_invincible" )

   audio_play_for_character( LAB_THREE_FINAL_TECH_FLEE, LAB_FOUR_ESCAPEE_TECH, "voice", false, false )
   on_vehicle_exit( "ss05_tech_left_car", LAB_FOUR_ESCAPE_VEHICLE )

   ss05_set_chase_enter_callbacks( "ss05_player_entered_car_chase_tech" )

   -- Add callbacks for the distance
   distance_display_on( LAB_FOUR_ESCAPE_VEHICLE, 0, LAB_TECH_CHASE_DISTANCE_METERS, 0, LAB_TECH_CHASE_DISTANCE_METERS, SYNC_ALL )
   on_tailing_good( "ss05_in_range_of_tech" )
   on_tailing_too_far( "ss05_out_of_range_of_tech" )
   delay( LAB_FOUR_TECH_LEAVE_DELAY_SECONDS )
   vehicle_speed_override( LAB_FOUR_ESCAPE_VEHICLE, LAB_TECH_CHASE_INITIAL_SPEED_MPH )

	local num_escape_paths = sizeof_table( LAB_FOUR_ESCAPE_PATHS )
	for path_index, path_name in pairs( LAB_FOUR_ESCAPE_PATHS ) do
		-- Normal path - keep going
		if ( path_index < num_escape_paths ) then
		   vehicle_pathfind_to( LAB_FOUR_ESCAPE_VEHICLE, path_name, true, false )
		-- Final path - stop at the end
		else
		   vehicle_pathfind_to( LAB_FOUR_ESCAPE_VEHICLE, path_name, true, true )
		end
	end
   
   vehicle_suppress_npc_exit( LAB_FOUR_ESCAPE_VEHICLE, false )

   vehicle_exit( LAB_FOUR_ESCAPEE_TECH )

   local distance = 0
   local player_name = LOCAL_PLAYER

   distance, player_name = get_dist_closest_player_to_object( LAB_FOUR_ESCAPEE_TECH )

   flee( LAB_FOUR_ESCAPEE_TECH, player_name )
end

-- When the tech leaves the car, disable all distance
-- failure conditions.
--
function ss05_tech_left_car()
   hud_timer_stop( 0 )
   distance_display_off(SYNC_ALL)
   on_tailing_good( "" )
   on_tailing_too_far( "" )
end

-- When the escaping tech is killed, the mission is
-- a success.
--
function ss05_escaping_tech_killed( tech_name )
   objective_text(0, HT_X_OF_Y_LABS_DESTROYED, 4, LAB_COUNT, SYNC_ALL )
   distance_display_off(SYNC_ALL)
   marker_remove_npc( tech_name, SYNC_ALL )

   Mission_won = true
   mission_end_success( MISSION_NAME, CT_OUTRO )
end

-- Called when the player reaches the first drug lab
--
function ss05_reached_lab_one( triggerer_name, trigger_name )
   objective_text( 0, HT_X_OF_Y_DUST_CONTAINERS_DESTROYED, 0,
                   INITIAL_LAB_CHEM_STORAGE_COUNT[1], SYNC_ALL )

   trigger_enable( trigger_name, false )
   marker_remove_trigger( trigger_name, SYNC_ALL )
   ss05_switch_state( MS_REACHED_FIRST_LAB )
end

-- Called when the player reaches the entrance of
-- the second drug lab
--
function ss05_reached_lab_two( triggerer_name, trigger_name )
   objective_text( 0, HT_X_OF_Y_DUST_CONTAINERS_DESTROYED, 0,
                   INITIAL_LAB_CHEM_STORAGE_COUNT[2], SYNC_ALL )

   trigger_enable( trigger_name, false )
   marker_remove_trigger( trigger_name, SYNC_ALL )
   ss05_switch_state( MS_REACHED_SECOND_LAB )
end

-- Called when the player reaches the entrance of
-- the third drug lab
--
function ss05_reached_lab_three( triggerer_name, trigger_name )
   trigger_enable( trigger_name, false )
   marker_remove_trigger( trigger_name, SYNC_ALL )

   -- Have the defender in the entrance attack the player
   attack_safe( LAB_THREE_INITIAL_DEFENDER_MEMBERS[1], triggerer_name, false )

   ss05_switch_state( MS_REACHED_THIRD_LAB )
end

-- Called when the player reaches the forth drug lab
--
function ss05_reached_lab_four( triggerer_name, trigger_name )
   trigger_enable( trigger_name, false )
   ss05_switch_state( MS_REACHED_FOURTH_LAB )
end

-- Called when the player gets to the inside of the third
-- drug lab.
--
function ss05_inside_lab_three( triggerer_name, trigger_name )
   -- Setup the chemical storage barrels
   -- Reset the chem storage barrels, mark them, and add callbacks for their destruction
   for index, name in LAB_THREE_STORAGE_NAMES do
      mesh_mover_reset( name )
      on_mover_destroyed( "ss05_lab_three_storage_destroyed", name )
      marker_add_mover( name, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL )
   end
   mission_help_table( HT_DESTROY_STORAGE_CONTAINERS )
   objective_text( 0, HT_X_OF_Y_DUST_CONTAINERS_DESTROYED, 0,
                   INITIAL_LAB_CHEM_STORAGE_COUNT[3], SYNC_ALL )

   waypoint_remove( SYNC_ALL )

   trigger_enable( trigger_name, false )
   marker_remove_trigger( trigger_name, SYNC_ALL )
end

-- Called when the player reaches the locked door to the enclosed lab
-- area in the third drug labs. Guides the player to flush out the techs
-- by pressing a switch.
--
function ss05_reached_enclosed_lab_entrance( triggerer_name, trigger_name )
   trigger_enable( trigger_name, false )
   -- Play the "door is locked" sound and delay so that it's heard
   audio_play( LOCKED_DOOR_SOUND )
   delay( 1.0 )

   -- Play the conversation if anyone is alive in there
   if ( ss05_anyone_alive_in_enclosed_lab() ) then
      audio_play_conversation( LAB_THREE_HIDING_TECHS_PLAYER_DIALOG_STREAM )
      ss05_living_enclosed_lab_members_taunt()
      audio_play_conversation( LAB_THREE_HIDING_TECHS_TECH_DIALOG_STREAM )
   end
   -- Offer some extra explanation in help text and then guide the player to the next objective
   mission_help_table( HT_DOOR_LOCKED, "", "", SYNC_ALL )
   marker_add_trigger( LAB_THREE_FLUSH_OUT_SWITCH, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL )
end

-- Called when the player reaches the door in lab 4 that's locked.
-- Informs him that he needs to find a key.
--
function ss05_door_locked()
   mission_help_table( HT_LOCKED_SOMEONE_HAS_KEY )
end

-- Plays a voice line informing the player that the lab techs are hiding in the enclosed drug lab.
--
function ss05_play_lab_techs_hiding_dialog( triggerer_name, trigger_name )
   trigger_enable( trigger_name, false )
   -- Play "lock the door" on the first member that's alive
   for index, member_name in pairs( LAB_THREE_ENCLOSED_LAB_MEMBERS ) do
      if ( character_is_dead( member_name ) == false ) then
         audio_play_for_character( LAB_THREE_HIDE_IN_THE_LAB, member_name, "voice", false, true )
         return
      end
   end
end

function ss05_anyone_alive_in_enclosed_lab()
   for index, name in LAB_THREE_ENCLOSED_LAB_MEMBERS do
      if ( character_is_dead( name ) == false ) then
         return true
      end
   end
   return false
end

function ss05_living_enclosed_lab_members_taunt()
   for index, name in pairs ( LAB_THREE_ENCLOSED_LAB_MEMBERS ) do
      if ( character_is_dead( name ) == false ) then
         if ( mod( index, 2 ) == 0 ) then
            action_play_non_blocking( name, "talk confrontational" )
         else
            action_play_non_blocking( name, "talk disrespect" )
         end
      end
   end
end

-- Flushes out the techs.
--
function ss05_activated_flush_out_switch( triggerer_name, trigger_name )
   -- Disable the "Enclosed Lab Entrance" trigger, because its message makes no
   -- sense after this switch is activated
   trigger_enable( LAB_THREE_ENCLOSED_LAB_ENTRANCE_TRIGGER, false )

   -- Disable the "flush out" trigger and unmark it
   trigger_enable( trigger_name, false )
   marker_remove_trigger( trigger_name, SYNC_ALL )

   local any_survivors_in_enclosed_lab = ss05_anyone_alive_in_enclosed_lab()

   if ( any_survivors_in_enclosed_lab ) then
      audio_play_for_character( LAB_THREE_ENCLOSED_LAB_SWITCH_AUDIO, LOCAL_PLAYER, "voice", false, false )
   end
   -- Add the smoke effect, and have the people inside play the cough animation
   local effect_handle = effect_play( LAB_THREE_SMOKE_EFFECT, LAB_THREE_SMOKE_SOURCE, true )
   for index, name in LAB_THREE_ENCLOSED_LAB_MEMBERS do
      if ( character_is_dead( name ) == false and
           character_is_ready( name ) == true ) then
         action_play(name, COUGH_ANIMATION, "", true, 0, true)
      end
   end
   delay( 3.0 )
   effect_stop( effect_handle )

   -- Open the door
   door_lock( LAB_THREE_DOOR_NAME, false )
   door_open( LAB_THREE_DOOR_NAME )
   -- Have the people inside run out
   for index, name in LAB_THREE_ENCLOSED_LAB_MEMBERS do
      thread_new( "ss05_lab_three_enclosed_member_escape", name )
   end
end

function ss05_lab_three_enclosed_member_escape( name )
   move_to_safe( name, LAB_THREE_CLEAR_OF_ROOM, 3, true, false )
   local distance, player = get_dist_closest_player_to_object( name )
   set_ignore_ai_flag( name, false )
   attack_safe( name, player )
end

-- Called when the player picks up the key in the fourth
-- drug lab. Marks the door as openable, and sets up the
-- trigger correctly for it.
--
function ss05_picked_up_key()
   trigger_enable( LAB_FOUR_BEFORE_DOOR_UNLOCKED_TRIGGER, false )
   trigger_enable( LAB_FOUR_UNLOCK_DOOR_TRIGGER, true )

   marker_add_trigger( LAB_FOUR_UNLOCK_DOOR_TRIGGER,
                       MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL )

   on_trigger( "ss05_unlock_door", LAB_FOUR_UNLOCK_DOOR_TRIGGER )
end

-- Called when the player hits the "unlocked the door" trigger.
--
function ss05_unlock_door()
   trigger_enable( LAB_FOUR_UNLOCK_DOOR_TRIGGER, false )
   door_lock( LAB_FOUR_MIDDLE_DOOR, false )
   door_open( LAB_FOUR_MIDDLE_DOOR )

   mission_help_table( HT_DESTROY_STORAGE_CONTAINERS )
   objective_text( 0, HT_X_OF_Y_DUST_CONTAINERS_DESTROYED, 0,
                   INITIAL_LAB_CHEM_STORAGE_COUNT[4], SYNC_ALL )

   -- Setup the chemical storage barrels
   -- Reset the chem storage barrels, mark them, and add callbacks for their destruction
   for index, name in LAB_FOUR_STORAGE_NAMES do
      mesh_mover_reset( name )
      on_mover_destroyed( "ss05_lab_four_storage_destroyed", name )
      marker_add_mover( name, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL )
   end

   on_door_opened( "ss05_lab_four_tech_begin_escape", LAB_FOUR_EXIT_DOOR )
end

-- Called when the key is dropped by the final tech -
-- it prompts the player to pick it up.
--
function ss05_key_dropped()
   mission_help_table( HT_PICK_UP_KEY )
end

-- Callback when a tech is killed. All techs must be killed for the
-- mission to end successfully.
--
-- tech_name: The name of the tech who was killed.
--
function ss05_lab_four_tech_killed( tech_name )
   Lab_four_techs_remaining = Lab_four_techs_remaining - 1

   marker_remove_npc( tech_name, SYNC_ALL )

   local num_killed = LAB_FOUR_INITIAL_TECH_COUNT - Lab_four_techs_remaining

   objective_text( 0, HT_X_OF_Y_TECHS_KILLED,
                   num_killed, LAB_FOUR_INITIAL_TECH_COUNT, SYNC_ALL )

   if ( Lab_four_techs_remaining == 1 ) then
      for index, name in LAB_FOUR_TECH_MEMBERS do
         if ( character_is_dead( name ) == false ) then
            loot_item_add( LAB_FOUR_KEY, name )
            on_mission_item_pickup( "ss05_picked_up_key" )
            on_mission_item_drop( "ss05_key_dropped" )
         end
      end
   end

   if ( Lab_four_techs_remaining == 0 ) then
   --[[
      delay( TECHS_KILLED_OBJECTIVE_UPDATE_DELAY_SECONDS )
      mission_help_table( HT_DESTROY_STORAGE_CONTAINERS )
      objective_text( 0, HT_X_OF_Y_DUST_CONTAINERS_DESTROYED, 0,
                      INITIAL_LAB_CHEM_STORAGE_COUNT[4], SYNC_ALL )

      -- Setup the chemical storage barrels
      -- Reset the chem storage barrels, mark them, and add callbacks for their destruction
      for index, name in LAB_FOUR_STORAGE_NAMES do
         mesh_mover_reset( name )
	      on_mover_destroyed( "ss05_lab_four_storage_destroyed", name )
	      marker_add_mover( name, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL )
      end

      on_door_opened( "ss05_lab_four_tech_begin_escape", LAB_FOUR_EXIT_DOOR )
      ]]
   end
end

-- Switches the mission into the "Tech Escaping" state.
--
function ss05_lab_four_tech_begin_escape()
   fade_out( 0 )

   for index, name in pairs( CHUNK_SWAP_FIRES ) do
      Swap_sequences_enabled[name] = true
      chunk_swap_sequence_start( name, true )
   end

   player_controls_disable( LOCAL_PLAYER )
   if ( coop_is_active() ) then
      player_controls_disable( REMOTE_PLAYER )
   end
   Player_controls_disabled = true
	cutscene_play("IG_SS05_scene1")
	group_hide("ss05_$L4_CTE_Escapee_and_Car")
	group_show( LAB_FOUR_ESCAPING_TECH_GROUP )
   teleport_coop( POST_CHUNK_SWAP_WARP_POSITIONS[LOCAL_PLAYER],
                  POST_CHUNK_SWAP_WARP_POSITIONS[REMOTE_PLAYER] )
	group_show( LAB_FOUR_ESCAPING_TECH_GROUP )
   player_controls_enable( LOCAL_PLAYER )
   if ( coop_is_active() ) then
      player_controls_enable( REMOTE_PLAYER )
   end
   Player_controls_disabled = false
   fade_in( 1.0 )
   on_door_opened( "", LAB_FOUR_EXIT_DOOR )
   ss05_switch_state( MS_TECH_ESCAPING )
end

-- Updates the number of storage containers left and displays
-- HUD information about their destruction. Called when a 
-- storage container is destroyed.
--
-- lab_index: The lab that said storage container belongs to.
--
function ss05_update_on_storage_destroyed( lab_index, storage_barrel_name )
   Labs_chem_storage_remaining[lab_index] = Labs_chem_storage_remaining[lab_index] - 1
   ss05_display_num_containers_destroyed( lab_index )

   for index, fire_location in pairs( BARREL_FIRE_EFFECT_LOCATIONS[storage_barrel_name] ) do
      Num_barrel_fire_effects = Num_barrel_fire_effects + 1
      -- looping = true
      Barrel_fire_effect_handles[Num_barrel_fire_effects] = effect_play( LARGE_FIRE, fire_location, true )
   end
   for index, small_fire_location in pairs( BARREL_SMALL_FIRE_EFFECT_LOCATIONS[storage_barrel_name] ) do
      Num_barrel_fire_effects = Num_barrel_fire_effects + 1
      local effect_index = rand_int( 1, sizeof_table( SMALL_FIRES ) )
      -- looping = true
      Barrel_fire_effect_handles[Num_barrel_fire_effects] = effect_play( SMALL_FIRES[effect_index], small_fire_location, true )
   end

   return Labs_chem_storage_remaining[lab_index]
end

-- Called when a dust storage container in this lab is killed.
--
-- Updates and then switches the state if all have been killed.
--
function ss05_lab_one_storage_destroyed( storage_barrel_name )
   local num_left = ss05_update_on_storage_destroyed( 1, storage_barrel_name )

   if ( num_left == 0 ) then
      --[[
      -- Disabled by design request
      -- Lab storage destroyed, activate the stronger drug effect
      ss05_set_medium_drug_effect( 1 )
      ]]
      ss05_switch_state( MS_DESTROYED_FIRST_LAB )
   end
end

-- Called when a dust storage container in this lab is killed.
--
-- Updates and then switches the state if all have been killed.
--
function ss05_lab_two_storage_destroyed( storage_barrel_name )
   local num_left = ss05_update_on_storage_destroyed( 2, storage_barrel_name )

   if ( num_left == 0 ) then
      --[[
      -- Disabled by design request
      -- Lab storage destroyed, activate the stronger drug effect
      ss05_set_medium_drug_effect( 2 )
      ]]

		effect_play(BUILDING_SHAKE_BUILDING_TWO,"ss05_$nL2_interior_Effect",false)
		camera_shake_start(.001, 1500, 1500)
      ss05_switch_state( MS_DESTROYED_SECOND_LAB )
   end
end

-- This function will spawn reinforcements for lab three
-- when enough lab members die if said reinforcements
-- aren't already spawned.
--
function ss05_lab_three_defender_died()
   Lab_three_defenders_remaining = Lab_three_defenders_remaining - 1
   if ( Lab_three_defenders_remaining == 0 and
        Lab_three_after_lab_attackers_spawned == false ) then
      delay( BEFORE_BACKUP_SPAWN_DELAY_SECONDS )
      ss05_do_lab_three_after_attack()
   end
end

-- 
function ss05_do_lab_three_after_attack()
   Lab_three_after_lab_attackers_spawned = true
   group_show( LAB_THREE_AFTER_LAB_ATTACK_GROUP )

   vehicle_enter_group_teleport( LAB_THREE_AFTER_LAB_ATTACK_MEMBERS,
                                 LAB_THREE_AFTER_LAB_ATTACK_VEHICLE )

   local distance, player = get_dist_closest_player_to_object( LAB_THREE_AFTER_LAB_ATTACK_VEHICLE )

   vehicle_chase( LAB_THREE_AFTER_LAB_ATTACK_VEHICLE, player )
end

-- Called when a dust storage container in this lab is killed.
--
-- Updates and then switches the state if all have been killed.
--
function ss05_lab_three_storage_destroyed( storage_barrel_name )
   local num_left = ss05_update_on_storage_destroyed( 3, storage_barrel_name )

   -- If the player destroys the enclosed lab barrel, unmark the flush
   -- out switch and disable the enclosed lab entrance trigger
   -- ( in case he does it before he flushes out the characters or receives the
   --   message to do so )
   if ( storage_barrel_name == LAB_THREE_ENCLOSED_LAB_BARREL_NAME ) then  
      trigger_enable( LAB_THREE_ENCLOSED_LAB_ENTRANCE_TRIGGER, false )
      marker_remove_trigger( LAB_THREE_FLUSH_OUT_SWITCH, SYNC_ALL )
   end

   -- If we're at zero, this lab has been destroyed.
   if ( num_left == 0 ) then
      -- Spawn the after attackers, but only if players are still
      -- in the lab
      if ( Lab_three_after_lab_attackers_spawned == false and
           ss05_both_players_in_lab3_area() == true ) then
         ss05_do_lab_three_after_attack()
      end
      ss05_switch_state( MS_DESTROYED_THIRD_LAB )
   end
end

function ss05_coop_open_exit_door( triggerer_name, trigger_name )
	trigger_enable( trigger_name, false )

	on_door_opened( "", LAB_FOUR_EXIT_DOOR )
	door_open( LAB_FOUR_EXIT_DOOR )

	ss05_lab_four_tech_begin_escape()
end

-- Called when a dust storage container in this lab is killed.
--
-- Updates and then switches the state if all have been killed.
--
function ss05_lab_four_storage_destroyed( storage_barrel_name )
   local num_left = ss05_update_on_storage_destroyed( 4, storage_barrel_name )

   -- If we've destroyed the barrels, then show the last tech
   -- He'll try to escape when we approach him.
   if ( num_left == 0 ) then
      door_lock( LAB_FOUR_DOOR_NEAR_BARREL, false )
      door_open( LAB_FOUR_DOOR_NEAR_BARREL )

      -- Let all the Samedi loose - this lab is cleared
      ss05_unleash_all( LAB_FOUR_DEFENDER_MEMBERS )

      -- Unlock the exit door
		if ( coop_is_active() == false ) then
	      door_lock( LAB_FOUR_EXIT_DOOR, false )
		-- In coop, don't unlock the door, but do add a trigger for it
		else
			trigger_enable( LAB_FOUR_EXIT_COOP_TRIGGER, true )
			on_trigger( "ss05_coop_open_exit_door", LAB_FOUR_EXIT_COOP_TRIGGER )
		end
      --group_show( LAB_FOUR_ESCAPING_TECH_GROUP )
      group_show( LAB_FOUR_PLAYERS_CAR_GROUP )
      vehicle_enter_teleport( LAB_FOUR_ESCAPEE_TECH, LAB_FOUR_ESCAPE_VEHICLE )
      set_ignore_ai_flag( LAB_FOUR_ESCAPEE_TECH, true )
      on_death( "ss05_escaping_tech_killed", LAB_FOUR_ESCAPEE_TECH )

      -- Clear the objective after a few seconds, because it's been completed
      delay( LAB_DESTROYED_OBJECTIVE_UPDATE_DELAY_SECONDS )
      objective_text_clear( 0 )

      -- Prompt the player to find the tech
      mission_help_table( HT_CHASE_DOWN_TECH )
      marker_add_npc( LAB_FOUR_ESCAPEE_TECH, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL )

      --[[
      -- Disabled by design request
      -- Lab storage destroyed, activate the stronger drug effect
      ss05_set_medium_drug_effect( 4 )
      ]]
   end
end

-- Displays the number of dust containers destroyed on the HUD.
--
-- lab_index: Which lab had a container destroyed.
--
function ss05_display_num_containers_destroyed( lab_index )
   local num_destroyed = INITIAL_LAB_CHEM_STORAGE_COUNT[lab_index] - Labs_chem_storage_remaining[lab_index];

   objective_text( 0, HT_X_OF_Y_DUST_CONTAINERS_DESTROYED, num_destroyed,
                   INITIAL_LAB_CHEM_STORAGE_COUNT[lab_index], SYNC_ALL )
end

-- Stops the failure timer for the chase when the tech gets in-range.
--
function ss05_in_range_of_tech()
   -- May be set multiple times - the point is just to set it once, though, when the
   -- player initially gets in range
   vehicle_speed_override( LAB_FOUR_ESCAPE_VEHICLE, LAB_TECH_CHASE_NORMAL_SPEED_MPH )
   hud_timer_stop(0);
end

-- Starts the failure timer for the chase when the tech falls out of
-- range, and prompts the player to catch up.
--
function ss05_out_of_range_of_tech()
   mission_help_table( HT_TECH_ESCAPING, "", "", SYNC_ALL )
   -- Add a timer - if he doesn't catch up soon enough, he fails
   hud_timer_set(0, TIME_TO_CATCH_UP_WITH_TECH_MS, "ss05_tech_got_away" )
end

-- Failure when the head tech gets away during the chase at the end.
--
function ss05_tech_got_away()
   mission_end_failure( MISSION_NAME, HT_TECH_ESCAPED )
end

-- Reverts any chunk swaps made, for example, when the mission
-- fails.
--
function ss05_revert_swaps()
   for index, name in pairs ( CHUNK_SWAP_FIRES ) do
      if ( Swap_sequences_enabled[name] == true ) then
         chunk_swap_sequence_revert( name )   
      end
   end
end

-- Saves current swaps that were already running in the game.
-- Used if the mission is being replayed.
--
function ss05_save_game_current_swaps()
   for index, name in pairs ( CHUNK_SWAP_FIRES ) do
      chunk_swap_sequence_save_and_revert( name )
   end
end

-- Restores saved swaps that were already running in the game.
-- Used if the mission is being replayed.
--
function ss05_restore_swaps()
   for index, name in pairs ( CHUNK_SWAP_FIRES ) do
      chunk_swap_sequence_restore_saved( name )
   end
end

-- Makes chunk swaps permanent. Used when the mission
-- succeeds.
--
function ss05_make_swaps_permanent()
   for index, name in pairs ( CHUNK_SWAP_FIRES ) do
      if ( Swap_sequences_enabled[name] == true ) then
         chunk_swap_sequence_make_permanent( name )
      end
   end
end

function ss05_stop_all_barrel_fire_effects()
   -- Cleanup all the fire effects we started for this mission
   for index, effect_handle in pairs( Barrel_fire_effect_handles ) do
      if ( effect_handle ~= -1 ) then
         effect_stop( effect_handle )
         Barrel_fire_effect_handles[index] = -1
      end
   end

   Num_barrel_fire_effects = 0
end

-- Does any required cleanup, such as removing callbacks
-- and such.
-- Also makes chunk swaps permanent if necessary.
--
function ss05_cleanup()
   -- Cleanup mission here
   notoriety_set_min( ENEMY_GANG, 0 )
   notoriety_force_no_spawn( ENEMY_GANG, false )
   release_to_world( STARTER_VEHICLE_GROUP_NAME )
   release_to_world( LAB_FOUR_PLAYERS_CAR_GROUP )
   on_door_opened( "", LAB_FOUR_ENTRANCE_DOOR )
   on_door_opened( "", LAB_FOUR_EXIT_DOOR )
   door_lock( LAB_FOUR_MIDDLE_DOOR, false )
   door_lock( LAB_FOUR_ENTRANCE_DOOR, false )
   door_lock( LAB_FOUR_EXIT_DOOR, false )
   on_tailing_good( "" )
   on_tailing_too_far( "" )
   distance_display_off(SYNC_ALL)
   ss05_set_chase_enter_callbacks( "" )
   
   ss05_stop_all_barrel_fire_effects()

   -- If this is the first time,
   if ( Mission_being_replayed == false ) then
      if ( Mission_won == false ) then
         ss05_revert_swaps()
      else -- Mission_won == true
         ss05_make_swaps_permanent()
      end
   else -- mission is being replayed
      -- Revert the swaps we made
      ss05_revert_swaps()
      -- Restore the saved swaps
      ss05_restore_swaps()
   end

   -- End weather override
   set_weather( -1 )

   -- Disable the override. If it's on, we need to end it because
   -- this mission is over.
   drug_enable_disable_effect_override( false, SYNC_ALL )
   --screen_blackout_end()

   on_mission_item_pickup( "" )
   on_mission_item_drop( "" )

   if ( Player_controls_disabled ) then
      player_controls_enable( LOCAL_PLAYER )
      if ( coop_is_active() ) then
         player_controls_enable( REMOTE_PLAYER )
      end
   end

   hud_timer_stop(0)

   mission_cleanup_maybe_reenable_player_controls()
   ss05_lock_all_lab_exterior_doors( false )
end

-- Called when the mission has ended with success
function ss05_success()

	-- Post the news event
	radio_post_event("JANE_NEWS_SOS05", true)

end
