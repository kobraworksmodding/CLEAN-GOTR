-- ss02.lua
-- SR2 mission script
-- 3/28/07

-- Mission help table text tags
   HT_DISPLAY_NAME = "ss02_display_name"
   HT_DOOR_LOCKED = "ss02_door_locked"
   HT_FIND_A_BOAT = "ss02_find_a_boat"
   HT_RUNNING_OUT_OF_TIME = "ss02_running_out_of_time"
   HT_ALMOST_OUT_OF_TIME = "ss02_almost_out_of_time"
   HT_GET_CLEAR = "ss02_get_clear"
   HT_GET_OUT_OF_PRISON = "ss02_get_out_of_prison"
   HT_GET_TO_PRISON = "ss02_get_to_prison"
   HT_GET_INSIDE_PRISON = "ss02_get_inside_prison"
   HT_GET_TO_CELLBLOCKS = "ss02_get_to_cellblocks"
   HT_FIND_DRUG_EXPERT = "ss02_find_drug_expert"
   HT_PRESS_TO_PLANT_BOMB = "ss02_press_to_plant_bomb"
   HT_LAURA_DIED = "ss02_laura_died"
   HT_LAURA_ABANDONDED = "ss02_laura_abandoned"
   HT_PLANT_C4_ON_TURBINE = "ss02_plant_c4"
   HT_HAVE_BUDDY_PLANT_BOMB = "ss02_have_buddy_plant_bomb"
   HT_DESTROY_GRATE = "ss02_destroy_grate"
   HT_FAILED_TO_PLANT_BOMB_IN_TIME = "ss02_failed_to_plant_bomb"
   HT_ESCAPE_PRISON_AND_POLICE = "ss02_escape_prison_and_police"
   HT_LOCATE_POWER_GENERATOR = "ss02_locate_power_generator"

-- Mission states
   MS_GET_TO_BOAT = 1
   MS_CHECKPOINT = 2
   MS_GET_TO_PRISON = 3
   MS_PLANT_C4 = 4
   MS_C4_PLANTED = 5
   MS_PRISON_RIOT = 6
   MS_ESCAPE_FROM_PRISON = 7

-- Groups, NPCs, vehicles, navpoints, and other names
   -- Mission constant names
   MISSION_NAME = "ss02"
   MP = MISSION_NAME.."_$"
   PRISON_DEFENDER_TEAM = "Police"
   PRISON_DISTRICT_NAME = "Prison"
   DETONATED_C4_CHECKPOINT = "Detonated C4"

   -- Groups
   STARTER_WATERCRAFT_GROUP_NAME = MP.."Starter_Watercraft"

   GENERATOR_GUARD_GROUP_NAME = MP.."Generator_Patrol_Guard"

   OUTSIDE_GUARDS_GROUP_NAME = MP.."Outside_Guards"
   ENTRANCE_GUARDS_GROUP_NAME = MP.."Entrance_Guards"
   CAFETERIA_GUARDS_GROUP_NAME = MP.."Cafeteria_Guards"
   CAFETERIA_GUARDS_RESPAWN_GROUP_NAME = MP.."Cafeteria_Guard_Respawn"
   CAFETERIA_INMATES_GROUP_NAMES = { MP.."Cafeteria_Inmates01", MP.."Cafeteria_Inmates02",
                                     MP.."Cafeteria_Inmates03"--[[, MP.."Cafeteria_Inmates04",
                                     MP.."Cafeteria_Inmates05"]] }
   STAIRWELL_GUARDS_GROUP_NAME = MP.."Stairwell_Guards"
   STAIRWELL_INMATES_GROUP_NAME = MP.."Stairwell_Prisoners"
   CATWALK_GUARDS_GROUP_NAME = MP.."Catwalk_Guards"
   LAURA_GROUP_NAME = MP.."Laura"
   ESCAPE_HELICOPTERS_GROUP_NAME = MP.."Escape_Helicopters"

   AMBIENT_CHAOS_GROUP_NAME = MP.."Ambient_Chaos"

   -- NPC names
   GENERATOR_GUARD_NAME = MP.."Generator_Patrol_Guard"

   OUTSIDE_PRISON_WANDERING_GUARDS = { MP.."OG_01", MP.."OG_02" }

   LAURA_NAME = MP.."Laura"

   CAFETERIA_GUARD_NAMES = { MP.."Cafeteria_Guard1", MP.."Cafeteria_Guard2",
                             MP.."Cafeteria_Guard2", MP.."Cafeteria_Guard4",
                             MP.."Cafeteria_Guard5" }

   CAFETERIA_GROUPS_INMATE_NAMES = { { MP.."CI1_M01", MP.."CI1_M02", MP.."CI1_M03",
                                       MP.."CI1_M04", MP.."CI1_M05", MP.."CI1_M06" },
                                     { MP.."CI2_M01", MP.."CI2_M02", MP.."CI2_M03",
                                       MP.."CI2_M04", MP.."CI2_M05", MP.."CI2_M06" },
                                     { MP.."CI3_M01", MP.."CI3_M02", MP.."CI3_M03",
                                       MP.."CI3_M04", MP.."CI3_M05", MP.."CI3_M06" },
                                     --[[{ MP.."CI4_M01", MP.."CI4_M02", MP.."CI4_M03",
                                       MP.."CI4_M04", MP.."CI4_M05", MP.."CI4_M06" },
                                     { MP.."CI5_M01", MP.."CI5_M02", MP.."CI5_M03",
                                       MP.."CI5_M04", MP.."CI5_M05", MP.."CI5_M06" }]] }

   CAFETERIA_GUARD_RESPAWN_NAMES = { MP.."Guard_Respawn01", MP.."Guard_Respawn02" --[[, MP.."Guard_Respawn03"]] }

   CAFETERIA_DISABLED_GUARDS = { CAFETERIA_GUARD_NAMES[4], CAFETERIA_GUARD_NAMES[5] }

   STAIRWELL_GUARDS = { MP.."SG_01", MP.."SG_02", MP.."SG_03" }
   STAIRWELL_INMATES = { MP.."SW_Inmate_01", MP.."SW_Inmate_02", MP.."SW_Inmate_03" }

   AMBIENT_CHAOS_GROUPS_MEMBERS = { { MP.."AC1_C1", MP.."AC1_P1", MP.."AC1_P2" },
                                    { MP.."AC2_C1", MP.."AC2_P1", MP.."AC2_P2" },
                                    { MP.."AC3_C1", MP.."AC3_P1", MP.."AC3_P2" } }
   AMBIENT_CHAOS_GROUP_COP_INDEX = 1

   -- Vehicle names
   STARTER_WATERCRAFT_NAMES = { MP.."Starter_Watercraft01", MP.."Starter_Watercraft02",
                                MP.."Starter_Watercraft03", MP.."Starter_Watercraft04" }
   MARKED_WATERCRAFT = STARTER_WATERCRAFT_NAMES[2]

   HELIPAD_HELICOPTER = MP.."Chopper1"

   ESCAPE_HELICOPTER_NAMES = { HELIPAD_HELICOPTER, MP.."Chopper2" }

   -- Navpoints
   PRISON_COAL_TUNNELS_ENTRANCE_NAV = MP.."Prison_Coal_Tunnels_Entrance"

   PATROL_POINTS = { MP.."Patrol_Point01", MP.."Patrol_Point02" }

   EXPLOSION_SIDE_NAMES = { MP.."Explosion_Side1", MP.."Explosion_Side2" }
   GENERATOR_BOX_NAVPOINT_NAME = MP.."Generator_Box"
   PLANTING_BOMB_VIEW = MP.."Planting_Bomb_View"

   MISSION_START = "mission_start_sr2_city_$ss02"
   REMOTE_PLAYER_START = MP.."Remote_Player_Start"

   PRISON_ISLAND_LOCATION = MP.."Prison_Island_Location"

   PLANT_C4_LOCATION = MP.."Plant_C4_Location"

   OUTSIDE_ALARMS = { MP.."alarm1", MP.."alarm2", MP.."alarm3" }
   INSIDE_ALARMS = { MP.."alarm4", MP.."alarm5", MP.."alarm6", 
                     MP.."alarm7", MP.."alarm8" }

   LAURAS_HOUSE_REMOTE_PLAYER_TELEPORT = MP.."Lauras_House_Remote_Player"

   CAFETERIA_PRISONER_LEASH_LOCATION = MP.."Cafeteria_Prisoner_Leash"

   -- Triggers
   OPEN_DOOR_FROM_OUTSIDE_TRIGGER_NAME = MP.."Open_Door_from_Outside"
   PLANT_C4_TRIGGER = MP.."Plant_C4_Trigger"
   PLANT_C4_MESSAGE_TRIGGER = MP.."Plant_C4_Message"
   GENERATOR_ROOM_UNSAFE_ZONE_TRIGGER = MP.."Generator_Room"

   PRISON_DOCK_TRIGGERS = { MP.."Prison_Dock01", MP.."Prison_Dock02" }

   COAL_TUNNEL_THRESHOLD_TRIGGER = MP.."Entrance_Threshold"
   COAL_TUNNEL_OUTSIDE_TRIGGER = MP.."Entrance_Outside"
   COAL_TUNNEL_INSIDE_TRIGGER = MP.."Entrance_Inside"

   PRISON_GATE_TRIGGER_NAME = MP.."Prison_Gate"
   MAIN_ENTRANCE_TRIGGER_NAME = MP.."Prison_Main_Entrance"
   CAFETERIA_ENTRANCE_TRIGGER_NAME = MP.."Cafeteria_Entrance"
   CELL_BLOCKS_ENTRANCE_TRIGGER_NAME = MP.."Cell_Blocks_Entrance"
   STAIRWELL_TRIGGER_NAME = MP.."Stairwell"
   SECOND_FLOOR_TRIGGER_NAME = MP.."Second_Floor_Trigger"
   THIRD_FLOOR_TRIGGER_NAME = MP.."Third_Floor_Trigger"
   LAURA_TRIGGER_NAME = MP.."Laura_Location"
   LAURAS_HOUSE_TRIGGER_NAME = MP.."Lauras_House"
   FLOOR_TRIGGER_NAMES = { nil, MP.."Floor2_Trigger", MP.."Floor3_Trigger" }
   GENERATOR_ROOM_ESCAPE_TRIGGER_NAME = MP.."Generator_Room_Escape"

   CAFETERIA_SHOW_RESPAWNS_TRIGGER = MP.."Cafeteria_Show_Respawns_Trigger"
   WATCHING_GUARDS_ATTACK_TRIGGER = MP.."Watching_Guards_Attack_Trigger"

   -- Parking Spawns
   HELICOPTER_PARKING_SPAWN = "parking_spots_$parking_343"

   -- Movers
   PRISON_GRATE_NAME = MP.."Grate"
   PRISON_GRATE_BARRELS = { MP.."Barrel01", MP.."Barrel02" }
   GENERATOR_ROOM_EXIT_DOOR = MP.."Generator_Room_Exit"
   PRISON_ENTRANCE_DOORS = { MP.."Prison_Entrance1", MP.."Prison_Entrance2_Door1", MP.."Prison_Entrance2_Door2" }
   CAFETERIA_ENTRANCE_DOORS = { MP.."Cafeteria_Entrance_Door1", MP.."Cafeteria_Entrance_Door2" }

   DOORS_TO_LOCK = { MP.."Door01", MP.."Door02", MP.."Door03", MP.."Door04", MP.."Door05", MP.."Door06", 
                     MP.."Door07", MP.."Door08", MP.."Door09", MP.."Door10", MP.."Door11", MP.."Door12", 
                     MP.."Door13", MP.."Door14", MP.."Door15", MP.."Door16", MP.."Door17", MP.."Door18", 
                     MP.."Door19", MP.."Door20", MP.."Door21", MP.."Door22", MP.."Door23", MP.."Door24" }

   LAURA_CELLBLOCK_DOORS = { MP.."Laura_Door_01", MP.."Laura_Door_02" }

   -- Effects and animation states
   GENERATOR_BOX_SMOKE_EFFECT_NAME = "CarDamage-Smoke"
   SIDE_EXPLOSION_NAME = "Vehicle"
   C4_EXPLOSION_NAME = "Car Bomb Big"
   STATE_PLANT_C4 = "crouch plant bomb"

   -- Cutscenes
   CT_INTRO = "ss02-01"
   CT_OUTRO = "ss02-02"

-- Sound
   -- Persona overrides
   LAURA_PERSONA_OVERRIDES = { { "combat - congratulate player", "LAURA_SOS2_GRATSPLAYER" },
                               { "combat - congratulate self", "LAURA_SOS2_GRATSSELF" },
                               { "hostage - barters", "LAURA_SOS2_BARTER" },
                               { "misc - respond to player taunt w/taunt", "LAURA_SOS2_TAUNT" },
                               { "observe - praised by PC", "LAURA_SOS2_PRAISED" },
                               { "observe - passenger when driver hits cars", "LAURA_SOS2_HITCAR" },
                               { "observe - passenger when driver hits object", "LAURA_SOS2_HITOBJ" },
                               { "observe - passenger when driver hits peds", "LAURA_SOS2_HITPED" },
                               { "threat - alert (solo attack)", "LAURA_SOS2_ATTACK" },
                               { "threat - damage received (firearm)", "LAURA_SOS2_TAKEDAM" },
                               { "threat - damage received (melee)", "LAURA_SOS2_TAKEDAM" } }

   -- Lines/Dialog Stream
   LAURA_SAVED_DIALOG_STREAM = { { "LAURA_SOS2_SEEPLAYER_1", LAURA_NAME, 0 },
                                 { "PLAYER_SOS2_LAURA_L2", LOCAL_PLAYER, 0 },
                                 { "LAURA_SOS2_SEEPLAYER_2", LAURA_NAME, 0 } }
   SHAUNDI_PLANT_BOMB_DIALOG_STREAM = { { "PLAYER_SOS2_PHONECALL_L1", LOCAL_PLAYER, 0 },
                                        { "SOS2_PHONECALL_L2", nil, 0 },
                                        { "PLAYER_SOS2_PHONECALL_L3", LOCAL_PLAYER, 0 },
                                        { "SOS2_PHONECALL_L4", nil, 0 },
                                        { "PLAYER_SOS2_PHONECALL_L5", LOCAL_PLAYER, 0 }
                                        }

   PLANT_BOMB_LINE = "PLAYER_SOS2_PLANT_BOMB_01"

   ESCAPED_FROM_PRISON_LINE = "LAURA_SOS2_ARRIVELAND_1"
   RETURN_TO_STILWATER_LINES = { "LAURA_SOS2_DRIVING_1", "LAURA_SOS2_DRIVING_2", "LAURA_SOS2_DRIVING_3", "LAURA_SOS2_DRIVING_4" }

   -- Sound effects
   HELICOPTER_FLYBY_SOUND = "SFX_SS02_HELI_FLYBY_SLOW"

-- Distances
   WANDERING_GUARDS_WANDER_RADIUS_METERS = 3.5
   FOLLOWER_WIN_DISTANCE_METERS = 2.0
   DISTANCE_FROM_PRISON_WIN_METERS = 420.0
   GENERATOR_ROOM_SAFE_ZONE_DIAMETER_METERS = 22

   DISTANCE_FROM_PRISON_DIALOG_METERS = 618.0
   CAFETERIA_PRISONER_LEASH_DISTANCE_METERS = 10.4

-- Percents and multipliers

-- Time values
   FIND_A_BOAT_PROMPT_DELAY_SECONDS = 5.0
   CHECKPOINT_TIME_TO_PLANT_C4_MS = 60000
   TIME_TO_PLANT_C4_MS = 230000
   C4_POST_PLANT_DETONATION_TIME_MS = 10000
   PLANT_C4_TIME_SECONDS = 5.0
   DROP_C4_TIME_SECONDS = 2.0
   BETWEEN_LINES_DELAY_MIN_SECONDS = 10
   BETWEEN_LINES_DELAY_MAX_SECONDS = 20
   TIME_TO_DIE_SECONDS = 3.0

   -- Delay times for the prompts for the bomb timer running low
   FIRST_BOMB_PROMPT_TIME_SECONDS = 170
   SECOND_BOMB_PROMPT_TIME_SECONDS = 30

   PRISON_WINDOW_BLACKOUT_TIME_SECONDS = 10.0
   START_WINDOW_BLACKOUT_THRESHOLD = 1.0
   PRISON_WINDOW_NUM_UPDATES = 30

   PW_BLACKOUT_TIME_INDEX = 1
   PW_BLACKOUT_THRESHOLD_INDEX = 2

   PRISON_ZONE_BLACKOUT_SEQUENCE = { { 2.0, MP.."Blackout_Zone_01" },
                                     { 2.0, MP.."Blackout_Zone_02" },
                                     { 2.0, MP.."Blackout_Zone_03" },
                                     { 2.0, MP.."Blackout_Zone_04" },
                                     { 2.0, MP.."Blackout_Zone_05" } }
   PZ_BLACKOUT_TIME_INDEX = 1
   PZ_BLACKOUT_ZONE_NAME_INDEX = 2

-- Constant values and counts
   NOTORIETY_MIN_LEVEL_BREAKIN = 2
   NOTORIETY_MIN_LEVEL_ESCAPE = 2
   INVALID_EFFECT_HANDLE = -1

-- Global variables
   Players_in_threshold = { [LOCAL_PLAYER] = false, [REMOTE_PLAYER] = false }
   Players_in_inside = { [LOCAL_PLAYER] = false, [REMOTE_PLAYER] = false }
   Players_in_outside = { [LOCAL_PLAYER] = false, [REMOTE_PLAYER] = false }

   Players_in_coal_tunnels = { [LOCAL_PLAYER] = false, [REMOTE_PLAYER] = false }
   Players_in_prison_district = { [LOCAL_PLAYER] = false, [REMOTE_PLAYER] = false }
   Players_in_unsafe_zone = { [LOCAL_PLAYER] = false, [REMOTE_PLAYER] = false }

   Prison_guard_spawned = false
   Planting_C4 = false
   C4_correct_detonation_counting_down = false

   Smoke_effect_handle = INVALID_EFFECT_HANDLE
   Follower_distance_check_threads = { [LOCAL_PLAYER] = nil, [REMOTE_PLAYER] = nil }
   Generator_guard_patrol_thread = INVALID_THREAD_HANDLE
   Running_out_of_time_prompts_thread_handle = INVALID_THREAD_HANDLE
	Outside_alarm_emitter_ids = { 0, 0, 0 }
   Inside_alarm_emitter_ids = { 0, 0, 0, 0, 0 }

   Laura_leader_name = ""

   Mission_won = false

-- Plays the alarms for the prison after the bomb goes off.
--
function ss02_play_alarms()

   local	outside_audio_id, outside_type = audio_get_id("SFX_ALARM_5", "foley")
   local	inside_audio_id, inside_type = audio_get_id("SFX_ALARM_3", "foley")

	for alarm_index, alarm_location in pairs( OUTSIDE_ALARMS ) do
		if ( Outside_alarm_emitter_ids[alarm_index] == 0 ) then
			Outside_alarm_emitter_ids[alarm_index] = audio_play_emitting_id_for_navpoint( alarm_location, outside_audio_id )
		end
	end

	for alarm_index, alarm_location in pairs( INSIDE_ALARMS ) do
		if ( Inside_alarm_emitter_ids[alarm_index] == 0 ) then
			Inside_alarm_emitter_ids[alarm_index] = audio_play_emitting_id_for_navpoint( alarm_location, inside_audio_id )
		end
	end
end

function ss02_stop_alarms()
	for alarm_index, alarm_location in pairs( OUTSIDE_ALARMS ) do
		if ( Outside_alarm_emitter_ids[alarm_index] ~= 0 ) then
			audio_stop_emitting_id( Outside_alarm_emitter_ids[alarm_index] )
			Outside_alarm_emitter_ids[alarm_index] = 0
		end
	end

	for alarm_index, alarm_location in pairs( INSIDE_ALARMS ) do
		if ( Inside_alarm_emitter_ids[alarm_index] ~= 0 ) then
			audio_stop_emitting_id( Inside_alarm_emitter_ids[alarm_index] )
			Inside_alarm_emitter_ids[alarm_index] = 0
		end
	end
end

-- Returns true if all players are in the unsafe zone, false otherwise.
-- ( This is the area in the generator room where the explosion from
--   the C4 is scripted to kill them if they're there when the bomb
--   detonates. )
--
function ss02_all_players_in_unsafe_zone()
   if ( Players_in_unsafe_zone[LOCAL_PLAYER] ) then
      if ( coop_is_active() ) then
         if ( Players_in_unsafe_zone[REMOTE_PLAYER] ) then
            return true
         end
      else
         return true
      end
   end
   return false
end

function ss02_running_out_of_time_prompts()
   delay( FIRST_BOMB_PROMPT_TIME_SECONDS )
   mission_help_table_nag( HT_RUNNING_OUT_OF_TIME )

   delay( SECOND_BOMB_PROMPT_TIME_SECONDS )
   mission_help_table_nag( HT_ALMOST_OUT_OF_TIME )
end

function ss02_start( checkpoint_name, is_restart )
   -- Start trigger is hit...the activate button was hit
   set_mission_author("Mark G. and Brad Johnson")

   mission_start_fade_out()
   if ( checkpoint_name == MISSION_START_CHECKPOINT ) then
		local starter_groups = { STARTER_WATERCRAFT_GROUP_NAME, OUTSIDE_GUARDS_GROUP_NAME, ENTRANCE_GUARDS_GROUP_NAME, LAURA_GROUP_NAME }

		if (not is_restart) then
			cutscene_play( CT_INTRO, starter_groups, { MISSION_START, REMOTE_PLAYER_START }, false )
		else
			for index, group_name in pairs( starter_groups ) do
				group_create_hidden( group_name, true )
			end

		   -- Teleport the players
			teleport_coop( MISSION_START, REMOTE_PLAYER_START )
		end
		group_show( STARTER_WATERCRAFT_GROUP_NAME )
	else -- checkpoint_name == DETONATED_C4_CHECKPOINT
		group_create_hidden( OUTSIDE_GUARDS_GROUP_NAME, true )
		group_create_hidden( ENTRANCE_GUARDS_GROUP_NAME, true )
		group_create_hidden( LAURA_GROUP_NAME, true )
   end

   set_time_of_day( 23, 0 )

   parking_spot_enable( HELICOPTER_PARKING_SPAWN, false )

   -- Set up district-tracking callbacks
   if ( coop_is_active() ) then
      on_district_changed( "ss02_district_changed", REMOTE_PLAYER )
   end
   on_district_changed( "ss02_district_changed", LOCAL_PLAYER )

	-- Run the overrides on Laura
   for index, override in pairs( LAURA_PERSONA_OVERRIDES ) do
      persona_override_character_start( LAURA_NAME, override[1], override[2] )
   end

   local state_to_setup

   if ( checkpoint_name == MISSION_START_CHECKPOINT ) then
      state_to_setup = MS_GET_TO_BOAT
   else
      state_to_setup = MS_CHECKPOINT
   end
   mission_start_fade_in()

	group_create_hidden( GENERATOR_GUARD_GROUP_NAME )
	group_create_hidden( CAFETERIA_GUARDS_GROUP_NAME )
   for index, group_name in pairs ( CAFETERIA_INMATES_GROUP_NAMES ) do
      group_create_hidden( group_name )
   end

   notoriety_set_max( PRISON_DEFENDER_TEAM, NOTORIETY_MIN_LEVEL_BREAKIN )

   ss02_switch_state( state_to_setup )
end

function ss02_entered_threshold()
   waypoint_remove( SYNC_ALL )
   marker_remove_navpoint( PRISON_COAL_TUNNELS_ENTRANCE_NAV, SYNC_ALL )
end

function ss02_prison_initial_setup( resuming_from_checkpoint )
	if ( resuming_from_checkpoint == nil ) then
		resuming_from_checkpoint = false
	end
   -- Prevent the player from getting into the generator room in any way but
   -- the docks entrance, and add a trigger that lets him know this is the case.
	if ( resuming_from_checkpoint == false ) then
		door_lock( GENERATOR_ROOM_EXIT_DOOR, true );
		trigger_enable( OPEN_DOOR_FROM_OUTSIDE_TRIGGER_NAME, true )
		on_trigger( "ss02_attempt_open_locked_generator_room_exit_door", OPEN_DOOR_FROM_OUTSIDE_TRIGGER_NAME )
	end

   for index, name in pairs( PRISON_DOCK_TRIGGERS ) do
      trigger_enable( name, true )
      on_trigger( "ss02_reached_dock", name )
   end

   trigger_enable( COAL_TUNNEL_THRESHOLD_TRIGGER, true );
   trigger_enable( COAL_TUNNEL_OUTSIDE_TRIGGER, true );
   trigger_enable( COAL_TUNNEL_INSIDE_TRIGGER, true );
   on_trigger( "ss02_entered_threshold", COAL_TUNNEL_THRESHOLD_TRIGGER )
   on_trigger_exit( "ss02_left_threshold", COAL_TUNNEL_THRESHOLD_TRIGGER )

   on_trigger( "ss02_entered_inside", COAL_TUNNEL_INSIDE_TRIGGER )
   on_trigger_exit( "ss02_left_inside", COAL_TUNNEL_INSIDE_TRIGGER )
   on_trigger( "ss02_entered_outside", COAL_TUNNEL_OUTSIDE_TRIGGER )
   on_trigger_exit( "ss02_left_outside", COAL_TUNNEL_OUTSIDE_TRIGGER )

   trigger_enable( GENERATOR_ROOM_UNSAFE_ZONE_TRIGGER, true )
   on_trigger( "ss02_entered_gen_room_unsafe_zone", GENERATOR_ROOM_UNSAFE_ZONE_TRIGGER )
   on_trigger_exit( "ss02_left_gen_room_unsafe_zone", GENERATOR_ROOM_UNSAFE_ZONE_TRIGGER )

	if ( resuming_from_checkpoint == false ) then
		-- Setup the prison doors, so that the players cannot get where they shouldn't be
		for index, door in PRISON_ENTRANCE_DOORS do
			door_lock( door, true )
		end
	end
   for index, door in DOORS_TO_LOCK do
      door_lock( door, true )
   end
   mesh_mover_hide( PRISON_GRATE_NAME )
   for index, barrel in pairs( PRISON_GRATE_BARRELS ) do
      mesh_mover_hide( barrel )
   end
end

function ss02_generator_guard_patrol()
   move_to( GENERATOR_GUARD_NAME, PATROL_POINTS[1], 1, true, true )
   move_to( GENERATOR_GUARD_NAME, PATROL_POINTS[2], 1, true, true )
end

function ss02_district_changed( player_name, new_district_name, prev_district_name )
   -- If a player just moved into the prison district, disable notoriety spawning
   if ( new_district_name == PRISON_DISTRICT_NAME ) then
      Players_in_prison_district[player_name] = true
      ss02_disable_gang_notoriety()
   -- If a player just moved out of the prison district
   elseif ( prev_district_name == PRISON_DISTRICT_NAME ) then
      Players_in_prison_district[player_name] = false
      -- Only enable notoriety spawning if both players are out of there
      if ( ss02_both_players_outside_of_prison_district() ) then
         ss02_enable_gang_notoriety()
      end
   end
end

function ss02_both_players_outside_of_prison_district()
   if ( Players_in_prison_district[LOCAL_PLAYER] == false and
        Players_in_prison_district[REMOTE_PLAYER] == false ) then
      return true
   end
   return false
end

function ss02_both_players_in_prison_district()
   if ( Players_in_prison_district[LOCAL_PLAYER] and
        Players_in_prison_district[REMOTE_PLAYER] ) then
      return true
   end
   return false
end

function ss02_disable_gang_notoriety()
   notoriety_force_no_spawn( "Samedi", true )
   notoriety_force_no_spawn( "Ronin", true )
   notoriety_force_no_spawn( "Brotherhood", true )
--[[
   notoriety_set_max( "Samedi", 0 )
   notoriety_set_max( "Ronin", 0 )
   notoriety_set_max( "Brotherhood", 0 )]]
end

function ss02_enable_gang_notoriety()
   notoriety_force_no_spawn( "Samedi", false )
   notoriety_force_no_spawn( "Ronin", false )
   notoriety_force_no_spawn( "Brotherhood", false )
--[[
   notoriety_set_max( "Samedi", MAX_NOTORIETY_LEVEL )
   notoriety_set_max( "Ronin", MAX_NOTORIETY_LEVEL )
   notoriety_set_max( "Brotherhood", MAX_NOTORIETY_LEVEL )]]
end

function ss02_play_conversation_when_in_range()
   local distance

   repeat
      distance = get_dist_char_to_nav( LOCAL_PLAYER, PRISON_ISLAND_LOCATION )
      delay( 0.5 )
   -- Keep trying until the local player is close enough
   until ( distance < DISTANCE_FROM_PRISON_DIALOG_METERS )

   -- When you're close enough, play the conversation
   audio_play_conversation( SHAUNDI_PLANT_BOMB_DIALOG_STREAM, OUTGOING_CALL )
end

-- Switches to a new state. All the state change code should be here if possible, not spread
-- out in various trigger callbacks.
--
-- new_state: The new state to switch to.
-- actor_name: MAY BE nil. The name of the actor that triggered the state change.
--             Varies based on the state.
function ss02_switch_state( new_state, actor_name )

   if( new_state == MS_GET_TO_BOAT ) then
      ss02_prison_initial_setup()

      -- Let the players know what they have to do next, and give them the time limit
      hud_timer_set(0, TIME_TO_PLANT_C4_MS, "ss02_failed_to_plant_c4_in_time" )
      Running_out_of_time_prompts_thread_handle = thread_new( "ss02_running_out_of_time_prompts" )

      thread_new( "ss02_play_conversation_when_in_range" )

      for index, watercraft_name in STARTER_WATERCRAFT_NAMES do
         on_vehicle_enter( "ss02_player_entered_vehicle_initial", watercraft_name )
      end
      on_vehicle_enter( "ss02_player_entered_vehicle_initial", LOCAL_PLAYER )
      if ( coop_is_active() ) then
         on_vehicle_enter( "ss02_player_entered_vehicle_initial", REMOTE_PLAYER )
      end
      marker_add_vehicle( MARKED_WATERCRAFT, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_INTERACT, SYNC_ALL )

      mission_help_table( HT_GET_TO_PRISON )
   elseif ( new_state == MS_CHECKPOINT ) then
      -- Setup the prison
      ss02_prison_initial_setup( true )
      -- Clear all the triggers for the stuff we should already have passed
      --door_lock( GENERATOR_ROOM_EXIT_DOOR, false );
      trigger_enable( OPEN_DOOR_FROM_OUTSIDE_TRIGGER_NAME, false )

      for index, name in pairs( PRISON_DOCK_TRIGGERS ) do
         trigger_enable( name, false )
         on_trigger( "ss02_reached_dock", name )
      end

      trigger_enable( COAL_TUNNEL_THRESHOLD_TRIGGER, false )
      trigger_enable( COAL_TUNNEL_OUTSIDE_TRIGGER, false )
      trigger_enable( COAL_TUNNEL_INSIDE_TRIGGER, false )
      trigger_enable( GENERATOR_ROOM_UNSAFE_ZONE_TRIGGER, false )

      marker_remove_navpoint( PRISON_COAL_TUNNELS_ENTRANCE_NAV, SYNC_ALL )

      -- Spawn the guards who are outside
      group_show( OUTSIDE_GUARDS_GROUP_NAME )
      for index, member_name in pairs ( OUTSIDE_PRISON_WANDERING_GUARDS ) do
         wander_start( member_name, member_name, WANDERING_GUARDS_WANDER_RADIUS_METERS )
      end

      ss02_do_prison_blackout()   
      ss02_switch_state( MS_PRISON_RIOT )
   elseif ( new_state == MS_GET_TO_PRISON ) then
      -- Update objectives
      waypoint_remove( SYNC_ALL )
      waypoint_add( MP.."Dock_Location", SYNC_ALL )
      marker_add_navpoint( PRISON_COAL_TUNNELS_ENTRANCE_NAV, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL )
      marker_remove_trigger( PLANT_C4_TRIGGER, SYNC_ALL )

      -- Spawn the guards who are outside
      group_show( OUTSIDE_GUARDS_GROUP_NAME )
      for index, member_name in pairs ( OUTSIDE_PRISON_WANDERING_GUARDS ) do
         wander_start( member_name, member_name, WANDERING_GUARDS_WANDER_RADIUS_METERS )
      end

   elseif ( new_state == MS_PLANT_C4 ) then
      marker_add_trigger( PLANT_C4_TRIGGER, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL )
      marker_remove_navpoint( PRISON_COAL_TUNNELS_ENTRANCE_NAV, SYNC_ALL )
      trigger_enable( PLANT_C4_TRIGGER, true )
      on_trigger( "ss02_plant_c4", PLANT_C4_TRIGGER )
      trigger_enable( PLANT_C4_MESSAGE_TRIGGER, true )
      on_trigger( "ss02_plant_c4_message", PLANT_C4_MESSAGE_TRIGGER )
      on_trigger_exit( "ss02_plant_c4_message_leave", PLANT_C4_MESSAGE_TRIGGER )
		
   elseif ( new_state == MS_C4_PLANTED ) then
      -- Default to setting the timer to the post detonation time
      local time_to_set_ms = C4_POST_PLANT_DETONATION_TIME_MS
      -- If there's less time on the timer than this, then use the smaller value
      local hud_time_remaining_ms = hud_timer_get_remainder( 0 )
      if ( hud_time_remaining_ms < time_to_set_ms ) then
         time_to_set_ms = hud_time_remaining_ms
      end
		set_force_combat_ready_team("police")
      hud_timer_set(0, time_to_set_ms, "ss02_c4_correct_detonation" )
      C4_correct_detonation_counting_down = true
      hud_timer_pause( 0, false )

      trigger_enable( PLANT_C4_TRIGGER, false )
      trigger_enable( PLANT_C4_MESSAGE_TRIGGER, false )
      marker_remove_trigger( PLANT_C4_TRIGGER, SYNC_LOCAL )
      trigger_enable( COAL_TUNNEL_INSIDE_TRIGGER, false )
      trigger_enable( COAL_TUNNEL_OUTSIDE_TRIGGER, false )
      trigger_enable( COAL_TUNNEL_THRESHOLD_TRIGGER, false )
      trigger_enable( OPEN_DOOR_FROM_OUTSIDE_TRIGGER_NAME, false )
      door_lock( GENERATOR_ROOM_EXIT_DOOR, false );
      minimap_icon_add_navpoint_radius( GENERATOR_ROOM_UNSAFE_ZONE_TRIGGER, MINIMAP_ICON_LOCATION,
                                        GENERATOR_ROOM_SAFE_ZONE_DIAMETER_METERS, nil, SYNC_ALL )
   elseif( new_state == MS_PRISON_RIOT ) then
      -- Switch to the rioting prison chunk
      city_chunk_swap( "sr2_intsrmisprison02", "riot", true, false, true )

      -- Play the prison alarms
      thread_new( "ss02_play_alarms" )

      -- Set the player's notoriety to a minimum value
      notoriety_set_min( PRISON_DEFENDER_TEAM, NOTORIETY_MIN_LEVEL_BREAKIN )
	  notoriety_set_max( PRISON_DEFENDER_TEAM, NOTORIETY_MIN_LEVEL_BREAKIN )
      -- Prompt the player to go to the prison and use the map
      -- to guide him there.
      mission_help_table( HT_GET_INSIDE_PRISON, "", "", SYNC_ALL )
      marker_add_trigger( PRISON_GATE_TRIGGER_NAME, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL )
      trigger_enable( PRISON_GATE_TRIGGER_NAME, true )
      waypoint_add( PRISON_GATE_TRIGGER_NAME, SYNC_ALL )
      on_trigger( "ss02_reached_prison_gate", PRISON_GATE_TRIGGER_NAME )

      for index, name in PRISON_ENTRANCE_DOORS do
         on_door_opened( "ss02_cafeteria_door_opened", name )
      end

      -- Unlock the doors
      for index, door in PRISON_ENTRANCE_DOORS do
         door_lock( door, false )
      end

      for index, door in pairs( LAURA_CELLBLOCK_DOORS ) do
         door_lock( door, true )
         mesh_mover_hide( door )
      end
      group_show( ENTRANCE_GUARDS_GROUP_NAME )

      -- Disable the two guards from attacking, so they look distracted
      for index, name in pairs( CAFETERIA_DISABLED_GUARDS ) do
         set_ignore_ai_flag( name, true )
         npc_combat_enable( name, false )
      end
      -- Have them attack if you pass them or attack either of them
      trigger_enable( WATCHING_GUARDS_ATTACK_TRIGGER, true )
      on_trigger( "ss02_disabled_guards_attack", WATCHING_GUARDS_ATTACK_TRIGGER )
      ss02_tie_members_in_pack( "ss02_disabled_guards_attack", CAFETERIA_DISABLED_GUARDS )
   elseif ( new_state == MS_ESCAPE_FROM_PRISON ) then
      -- Set Laura up correctly for being a follower.
      npc_combat_enable( LAURA_NAME, false )
      set_attack_enemies_flag( LAURA_NAME, false )
      --inv_item_add( "beretta", 1, LAURA_NAME )
      npc_weapon_pickup_override( LAURA_NAME, false )
      set_ignore_ai_flag( LAURA_NAME, false )
      on_dismiss( "ss02_follower_dismissed", LAURA_NAME )
      -- Make her a follower
      party_add( LAURA_NAME, actor_name )
      Laura_leader_name = actor_name

      -- Release the earlier groups and spawn them again
      release_to_world( STAIRWELL_GUARDS_GROUP_NAME )
      for index, group_name in pairs ( CAFETERIA_INMATES_GROUP_NAMES ) do
         release_to_world( group_name )
      end

      if ( coop_is_active() ) then
         mission_debug( "running with coop_is_active check version" )
         local other_player = LOCAL_PLAYER
         if ( Laura_leader_name == LOCAL_PLAYER ) then
            other_player = REMOTE_PLAYER
         end

         if ( ss02_player_can_see_stairwell_guards( other_player ) == false ) then
            group_create( STAIRWELL_GUARDS_GROUP_NAME, true )
            for index, name in pairs( STAIRWELL_GUARDS ) do
               attack_closest_player( name, false )
            end
         end

         if ( ss02_player_can_see_respawned_cafeteria_guards( other_player ) == false ) then
            group_create_hidden( CAFETERIA_GUARDS_RESPAWN_GROUP_NAME, true )
            for i = 1, sizeof_table( CAFETERIA_GUARD_RESPAWN_NAMES ) do
               group_create_hidden( CAFETERIA_INMATES_GROUP_NAMES[i], true )
            end
            thread_new( "ss02_show_cafeteria_groups_and_start_battle" )
         end
      else
         group_create_hidden( CAFETERIA_GUARDS_RESPAWN_GROUP_NAME )
         for i = 1, sizeof_table( CAFETERIA_GUARD_RESPAWN_NAMES ) do
            group_create_hidden( CAFETERIA_INMATES_GROUP_NAMES[i], true )

            for index, name in pairs( CAFETERIA_GROUPS_INMATE_NAMES[i] ) do
               npc_leash_to_nav( name, CAFETERIA_PRISONER_LEASH_LOCATION, CAFETERIA_PRISONER_LEASH_DISTANCE_METERS )
               npc_leash_set_unbreakable( name, true )
            end
            --ss02_tie_members_in_pack( "ss02_cafeteria_inmate_damaged_g0"..i, CAFETERIA_GROUPS_INMATE_NAMES[i] )
         end

         group_create( STAIRWELL_GUARDS_GROUP_NAME, true )
         for index, name in pairs( STAIRWELL_GUARDS ) do
            attack_closest_player( name, false )
         end
         trigger_enable( CAFETERIA_SHOW_RESPAWNS_TRIGGER, true )
         on_trigger( "ss02_show_cafeteria_groups_and_start_battle", CAFETERIA_SHOW_RESPAWNS_TRIGGER )
      end

      -- Guide the player out of the prison
      mission_help_table( HT_GET_OUT_OF_PRISON )
      trigger_enable( CELL_BLOCKS_ENTRANCE_TRIGGER_NAME, true )
      marker_add_trigger( CELL_BLOCKS_ENTRANCE_TRIGGER_NAME, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL )
      on_trigger( "ss02_reached_cafeteria_escape", CELL_BLOCKS_ENTRANCE_TRIGGER_NAME )

      ss05_set_or_clear_escape_callbacks( true )

      notoriety_set_min( PRISON_DEFENDER_TEAM, NOTORIETY_MIN_LEVEL_ESCAPE )
	  notoriety_set_max( PRISON_DEFENDER_TEAM, NOTORIETY_MIN_LEVEL_ESCAPE )

      local sync_type = sync_from_player( actor_name )

      -- Make sure that the player that saves Laura is the one that speaks to her! ... hehe
      LAURA_SAVED_DIALOG_STREAM[2][2] = actor_name

		group_create( ESCAPE_HELICOPTERS_GROUP_NAME )

      audio_play_conversation( LAURA_SAVED_DIALOG_STREAM, NOT_CALL )

      audio_play( HELICOPTER_FLYBY_SOUND )
   end
end


function ss02_player_can_see_stairwell_guards( player_name )
   for index, name in pairs( STAIRWELL_GUARDS ) do
      if ( navpoint_in_player_fov( name, player_name ) ) then
         return true
      end
   end
   return false
end

function ss02_player_can_see_respawned_cafeteria_guards( player_name )
   -- Go through all of the groups
   for group_index = 1, sizeof_table( CAFETERIA_GUARD_RESPAWN_NAMES ) do
      -- Check to see if the player can see any of the members
      for member_index, member_name in pairs( CAFETERIA_GROUPS_INMATE_NAMES[group_index] ) do
         if ( navpoint_in_player_fov( member_name, player_name ) ) then
            return true
         end
      end
   end
   return false
end

function ss02_show_cafeteria_groups_and_start_battle( triggerer_name, trigger_name )
   trigger_enable( trigger_name, false )

   -- Show the guards
   group_show( CAFETERIA_GUARDS_RESPAWN_GROUP_NAME )

   -- Go through all of the groups
   for group_index = 1, sizeof_table( CAFETERIA_GUARD_RESPAWN_NAMES ) do
      -- Show each group of prisoners ( only respawn one per guard )
      group_show( CAFETERIA_INMATES_GROUP_NAMES[group_index] )
      -- Have the guard attack one of the group members
      attack_safe( CAFETERIA_GUARD_NAMES[group_index], CAFETERIA_GROUPS_INMATE_NAMES[group_index][3], false )

      -- Have all of the group members attack the guard
      for member_index, member_name in pairs( CAFETERIA_GROUPS_INMATE_NAMES[group_index] ) do
         attack_safe( member_name, CAFETERIA_GUARD_NAMES[group_index], false )
      end
   end
end

function ss02_reached_cafeteria_escape( triggerer_name, trigger_name )
   trigger_enable( trigger_name, false )

   local sync_type = sync_from_player( Laura_leader_name )

   trigger_enable( MAIN_ENTRANCE_TRIGGER_NAME, true )
   marker_add_trigger( MAIN_ENTRANCE_TRIGGER_NAME, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, sync_type )
   on_trigger( "ss02_left_prison", MAIN_ENTRANCE_TRIGGER_NAME )

   for index, name in pairs( CAFETERIA_GUARD_RESPAWN_NAMES ) do
      if ( character_exists( name ) ) then
         turn_vulnerable( name )
      end
   end
end

function ss05_set_or_clear_escape_callbacks( set )
   local callback_name = ""
   if ( set == true ) then
      callback_name = "ss02_player_entered_vehicle_escape"
   end

   on_vehicle_enter( callback_name, LOCAL_PLAYER )
   for index, name in pairs( STARTER_WATERCRAFT_NAMES ) do
      on_vehicle_enter( callback_name, name )
   end
   for index, name in pairs( ESCAPE_HELICOPTER_NAMES ) do
      on_vehicle_enter( callback_name, name )
   end
   if ( coop_is_active() ) then
      on_vehicle_enter( callback_name, REMOTE_PLAYER )
   end
end

-- Called when the player reaches the prison dock.
-- Sets a checkpoint there.
--
function ss02_reached_dock()
   for index, name in pairs( PRISON_DOCK_TRIGGERS ) do
      trigger_enable( name, false )
      on_trigger( "", name )
   end
end

function ss02_follower_dismissed( name )
   if ( name == LAURA_NAME ) then
      -- End the mission since Laura was dismissed
      -- ( ie, abandoned, because she's set to undismissable )
      mission_end_failure( MISSION_NAME, HT_LAURA_ABANDONDED )
   end
end

-- Fails the mission if Laura dies.
function ss02_laura_died()
   marker_remove_trigger( LAURA_TRIGGER_NAME, SYNC_ALL )
   trigger_enable( LAURA_TRIGGER_NAME, false )
   delay( 2.0 )
   mission_end_failure( MISSION_NAME, HT_LAURA_DIED )
end

-- Spawns threads to check if Laura is near the trigger.
-- If so, the mission is won.
--
function ss02_reached_house( triggerer_name, trigger_name )
	--
	if ( triggerer_name == LOCAL_PLAYER ) then
		Follower_distance_check_threads[LOCAL_PLAYER] = thread_new( "ss01_check_for_follower_close_to_win_location" )
	elseif ( triggerer_name == REMOTE_PLAYER ) then
		Follower_distance_check_threads[REMOTE_PLAYER] = thread_new( "ss01_check_for_follower_close_to_win_location" )
	end
end

-- Stops any threads spawned by "ss02_reached_house"
-- so that the mission isn't counted as won
-- until one of the players is at the trigger
-- with Laura nearby.
--
function ss02_left_house( triggerer_name, trigger_name )
	--
	if ( triggerer_name == LOCAL_PLAYER and Follower_distance_check_threads[LOCAL_PLAYER] ~= nil ) then
		thread_kill( Follower_distance_check_threads[LOCAL_PLAYER] )
		Follower_distance_check_threads[LOCAL_PLAYER] = nil
	elseif ( triggerer_name == REMOTE_PLAYER and Follower_distance_check_threads[REMOTE_PLAYER] ~= nil ) then
		thread_kill( Follower_distance_check_threads[REMOTE_PLAYER] )
		Follower_distance_check_threads[REMOTE_PLAYER] = nil
	end
end

-- Called when the players leave the prison. Guides them to the next location.
--
function ss02_left_prison( triggerer_name, trigger_name )
   if ( triggerer_name == Laura_leader_name ) then
      ss02_disable_and_unmark_trigger( trigger_name )

      -- Guide the player out of here
      mission_help_table( HT_ESCAPE_PRISON_AND_POLICE )
      thread_new( "ss02_prison_escape_distance_win" )
      marker_add_vehicle( HELIPAD_HELICOPTER, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_INTERACT, SYNC_ALL )
      waypoint_add( HELIPAD_HELICOPTER, SYNC_ALL )

      notoriety_force_no_spawn( PRISON_DEFENDER_TEAM, false )

      minimap_icon_add_trigger_radius( MAIN_ENTRANCE_TRIGGER_NAME, MINIMAP_ICON_LOCATION,
                                       DISTANCE_FROM_PRISON_WIN_METERS, nil, SYNC_ALL )
   end
end

function ss02_prison_escape_distance_win()
   local distance_from_prison = get_dist_char_to_nav( LAURA_NAME, MAIN_ENTRANCE_TRIGGER_NAME ) 

   while ( distance_from_prison < DISTANCE_FROM_PRISON_WIN_METERS ) do
      distance_from_prison = get_dist_char_to_nav( LAURA_NAME, MAIN_ENTRANCE_TRIGGER_NAME ) 
      delay( 0 )
   end


   audio_play_for_character( ESCAPED_FROM_PRISON_LINE, LAURA_NAME, "voice", false, true )

   Mission_won = true

   mission_end_success( MISSION_NAME, CT_OUTRO, { LAURAS_HOUSE_TRIGGER_NAME, LAURAS_HOUSE_REMOTE_PLAYER_TELEPORT } )
end

-- Called when the players make it back to the generator room after escaping the
-- prison with Laura in tow.
-- Guides them to the boat.
--
function ss02_got_back_to_generator_room( triggerer_name, trigger_name )
--   if ( triggerer_name == LOCAL_PLAYER ) then
      ss02_disable_and_unmark_trigger( trigger_name )
--   end
end

-- Called on a trigger to disable it and remove any markers on it.
--
function ss02_disable_and_unmark_trigger( trigger_name )
   marker_remove_trigger( trigger_name, SYNC_ALL )
   trigger_enable( trigger_name, false )
end

-- Disables a path trigger.
--
function ss02_disable_path_trigger( trigger_name )
   ss02_disable_and_unmark_trigger( trigger_name )
end

-- Enables a new path trigger, and binds the passed-in function to it.
--
function ss02_enable_next_path_trigger( function_name, trigger_name, sync_type )
   if ( sync_type == nil ) then
      sync_type = SYNC_ALL
   end
   marker_add_trigger( trigger_name, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, sync_type )
   trigger_enable( trigger_name, true )
   on_trigger( function_name, trigger_name )
end

function ss02_reached_prison_gate( triggerer_name, trigger_name )
   waypoint_remove( SYNC_ALL )
--   if ( triggerer_name == LOCAL_PLAYER ) then
      ss02_disable_path_trigger( trigger_name )
      ss02_enable_next_path_trigger( "ss02_reached_prison_entrance", MAIN_ENTRANCE_TRIGGER_NAME, SYNC_ALL )
--   end
end

-- Path trigger callbacks. These guide the player through the prison.
--
function ss02_reached_prison_entrance( triggerer_name, trigger_name )
--   if ( triggerer_name == LOCAL_PLAYER ) then
      notoriety_force_no_spawn( PRISON_DEFENDER_TEAM, true )
      ss02_disable_path_trigger( trigger_name )
      ss02_enable_next_path_trigger( "ss02_reached_cell_blocks_entrance", CELL_BLOCKS_ENTRANCE_TRIGGER_NAME, SYNC_ALL )
--   end
end

function ss02_reached_cell_blocks_entrance( triggerer_name, trigger_name )
--   if ( triggerer_name == LOCAL_PLAYER ) then
      mission_help_table( HT_FIND_DRUG_EXPERT, "", "", SYNC_ALL )
      ss02_disable_path_trigger( trigger_name )
      ss02_enable_next_path_trigger( "ss02_reached_stairwell", STAIRWELL_TRIGGER_NAME, SYNC_ALL )
      
      thread_new( "ss02_create_and_setup_ambient_chaos" )
--   end
end

function ss02_reached_stairwell( triggerer_name, trigger_name )
--   if ( triggerer_name == LOCAL_PLAYER ) then
      ss02_disable_path_trigger( trigger_name )
      ss02_enable_next_path_trigger( "ss02_reached_third_floor", THIRD_FLOOR_TRIGGER_NAME, SYNC_ALL )
      mission_help_table( HT_GET_TO_CELLBLOCKS, "", "", SYNC_ALL )
      group_create( STAIRWELL_INMATES_GROUP_NAME, true )
      group_create( STAIRWELL_GUARDS_GROUP_NAME, true )
      for index, guard_name in pairs( STAIRWELL_GUARDS ) do
         if ( index <= sizeof_table( STAIRWELL_INMATES ) ) then
            attack_safe( guard_name, STAIRWELL_INMATES[index], false )
            attack_safe( STAIRWELL_INMATES[index], guard_name, false )
         end
      end

      group_create( CATWALK_GUARDS_GROUP_NAME, true )

      ss02_tie_members_in_pack( "ss02_stairwell_guard_damaged", STAIRWELL_GUARDS )
      --ss02_tie_members_in_pack( "ss02_stairwell_inmate_damaged", STAIRWELL_INMATES )
--   end
end

function ss02_create_and_setup_ambient_chaos()
   group_create( AMBIENT_CHAOS_GROUP_NAME, true )

   for group_index, group in pairs( AMBIENT_CHAOS_GROUPS_MEMBERS ) do
      for member_index, member_name in pairs( group ) do
         -- Make every member by default invulerable except to player damage
         turn_invulnerable( member_name, true )

         -- Have the prisoners attack the cop
         if ( member_index ~= AMBIENT_CHAOS_GROUP_COP_INDEX ) then
            attack_safe( member_name, group[AMBIENT_CHAOS_GROUP_COP_INDEX], false )
         -- Disarm the cop
         else
            inv_item_remove_all( member_name )
         end
      end
   end
end

-- The last path trigger spawns Laura and enables the "talk to Laura" trigger.
--
function ss02_reached_third_floor( triggerer_name, trigger_name )
--   if ( triggerer_name == LOCAL_PLAYER ) then
      ss02_disable_path_trigger( trigger_name )
      --group_show( CATWALK_GUARDS_GROUP_NAME )

      trigger_enable( LAURA_TRIGGER_NAME, true )
      on_trigger( "ss02_talk_to_laura", LAURA_TRIGGER_NAME )
      group_show( LAURA_GROUP_NAME )
      marker_add_npc( LAURA_NAME, MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_PROTECT_ACQUIRE, SYNC_ALL )
      on_death( "ss02_laura_died", LAURA_NAME )
      set_ignore_ai_flag( LAURA_NAME, true )
--   end
end

-- Switches the mission into the "Ecape from Prison" state
--
function ss02_talk_to_laura( triggerer_name, trigger_name )
   trigger_enable( trigger_name, false )
   marker_remove_npc( LAURA_NAME, SYNC_ALL )

   ss02_switch_state( MS_ESCAPE_FROM_PRISON, triggerer_name )
end

function ss02_group_member_damaged( fellow_member_names, attacker_name )
   if ( attacker_name ~= nil ) then 
      if ( character_is_player( attacker_name ) ) then
         for index, name in pairs( fellow_member_names ) do
            on_take_damage( "", name )
            attack_closest_player( name, false )
         end
      end
   end
end

-- Ties group members together in a pack - if a player attacks one of them,
-- they'll all attack the nearest player
--
function ss02_tie_members_in_pack( function_name, group_member_names )
   for index, name in pairs( group_member_names ) do
      on_take_damage( function_name, name )
   end
end

function ss02_cafeteria_inmate_group_member_damaged( group_index, attacker_name )
   ss02_group_member_damaged( CAFETERIA_GROUPS_INMATE_NAMES[group_index], attacker_name )
end

-- Functions for cafeteria inmate group packs
function ss02_cafeteria_inmate_damaged_g01( victim_name, attacker_name )
   ss02_cafeteria_inmate_group_member_damaged( 1, attacker_name )
end

function ss02_cafeteria_inmate_damaged_g02( victim_name, attacker_name )
   ss02_cafeteria_inmate_group_member_damaged( 2, attacker_name )
end

function ss02_cafeteria_inmate_damaged_g03( victim_name, attacker_name )
   ss02_cafeteria_inmate_group_member_damaged( 3, attacker_name )
end

function ss02_cafeteria_inmate_damaged_g04( victim_name, attacker_name )
   ss02_cafeteria_inmate_group_member_damaged( 4, attacker_name )
end

function ss02_cafeteria_inmate_damaged_g05( victim_name, attacker_name )
   ss02_cafeteria_inmate_group_member_damaged( 5, attacker_name )
end
-- End functions for cafeteria inmate group packs

-- Other group packs
function ss02_cafeteria_guard_damaged( victim_name, attacker_name )
   ss02_group_member_damaged( CAFETERIA_GUARD_NAMES, attacker_name )
end

function ss02_stairwell_guard_damaged( victim_name, attacker_name )
   ss02_group_member_damaged( STAIRWELL_GUARDS, attacker_name )
end

function ss02_stairwell_inmate_damaged( victim_name, attacker_name )
   ss02_group_member_damaged( STAIRWELL_INMATES, attacker_name )
end

function ss02_guard_respawn_damaged( victim_name, attacker_name )
   ss02_group_member_damaged( CAFETERIA_GUARD_RESPAWN_NAMES, attacker_name )
end

-- Triggers the guards in the cafeteria to attack the prisoners.
--
function ss02_cafeteria_door_opened()
   for index, name in CAFETERIA_ENTRANCE_DOORS do
      on_door_opened( "", name )
   end

   -- Show the guards and the inmates
   group_show( CAFETERIA_GUARDS_GROUP_NAME )
   for group_index, group_name in pairs( CAFETERIA_INMATES_GROUP_NAMES ) do
      group_show( group_name )
   end

   -- Have the corresponding cop attack a group member and every group member attack
   -- the corresponding cop
   for group_index, group_member_names in pairs( CAFETERIA_GROUPS_INMATE_NAMES ) do
      attack_safe( CAFETERIA_GUARD_NAMES[group_index], group_member_names[3], false )

      --on_death( "ss02_guard_0"..group_index.."_died", CAFETERIA_GUARD_NAMES[group_index] )

      for member_index, member_name in pairs( group_member_names ) do
         attack_safe( member_name, CAFETERIA_GUARD_NAMES[group_index], false )
      end
   end

   for index, pack_member_names in pairs( CAFETERIA_GROUPS_INMATE_NAMES ) do
      for index, name in pairs( pack_member_names ) do
         npc_leash_to_nav( name, CAFETERIA_PRISONER_LEASH_LOCATION, CAFETERIA_PRISONER_LEASH_DISTANCE_METERS )
         npc_leash_set_unbreakable( name, true )
      end
      --ss02_tie_members_in_pack( "ss02_cafeteria_inmate_damaged_g0"..index, pack_member_names )
   end
end

function ss02_groups_guard_died( group_index )
   for member_index, member_name in pairs( CAFETERIA_GROUPS_INMATE_NAMES[group_index] ) do
      attack_closest_player( member_name, false )
   end
end

function ss02_guard_01_died()
   ss02_groups_guard_died( 1 )
end
function ss02_guard_02_died()
   ss02_groups_guard_died( 2 )
end
function ss02_guard_03_died()
   ss02_groups_guard_died( 3 )
end
function ss02_guard_04_died()
   ss02_groups_guard_died( 4 )
end
function ss02_guard_05_died()
   ss02_groups_guard_died( 5 )
end

-- Re-enables both disabled guards when one is hurt, to simulate them
-- becoming aware of the player.
--
-- name: Name of the guard.
--
function ss02_disabled_guards_attack( name )
   trigger_enable( WATCHING_GUARDS_ATTACK_TRIGGER, false )

   for index, guard_name in pairs( CAFETERIA_DISABLED_GUARDS ) do
      npc_combat_enable( guard_name, true )
      set_ignore_ai_flag( guard_name, false )
      on_take_damage( "", guard_name )
      attack_closest_player( guard_name, false )
   end
end

-- These two functions are used to track whether the players are in the
-- unsafe zone in the generator room, where they'll be killed if the C4
-- goes off.
--
function ss02_entered_gen_room_unsafe_zone( triggerer_name, trigger_name )
   Players_in_unsafe_zone[triggerer_name] = true
   mission_debug( "entered unsafe zone" )

   if ( C4_correct_detonation_counting_down == true ) then
      local sync_type = sync_from_player( triggerer_name )
      mission_debug( "called create marker" )

      minimap_icon_add_navpoint_radius( GENERATOR_ROOM_UNSAFE_ZONE_TRIGGER, MINIMAP_ICON_LOCATION,
                                        GENERATOR_ROOM_SAFE_ZONE_DIAMETER_METERS, nil, sync_type )
   end
end

function ss02_left_gen_room_unsafe_zone( triggerer_name, trigger_name )
   Players_in_unsafe_zone[triggerer_name] = false

   mission_debug( "left unsafe zone" )

   if ( C4_correct_detonation_counting_down == true ) then
      local sync_type = sync_from_player( triggerer_name )
      mission_debug( "called remove marker" )

      minimap_icon_remove_navpoint( GENERATOR_ROOM_UNSAFE_ZONE_TRIGGER, sync_type )
   end
end

-- Displays the appropriate message for the local and remote player
-- when they wander into the "Plant C4" trigger.
--
function ss02_plant_c4_message( triggerer_name, trigger_name )
   if ( triggerer_name == LOCAL_PLAYER ) then
      mission_help_table_nag( HT_PRESS_TO_PLANT_BOMB, "", "", SYNC_LOCAL )
   elseif ( triggerer_name == REMOTE_PLAYER ) then
      mission_help_table_nag( HT_HAVE_BUDDY_PLANT_BOMB, "", "", SYNC_REMOTE )
   end
end

-- Clear the messages for the local or remote player
-- when they wander out of the "Plant C4" trigger.
--
function ss02_plant_c4_message_leave( triggerer_name, trigger_name )
   if ( triggerer_name == LOCAL_PLAYER ) then
      mission_help_clear( SYNC_LOCAL )
   elseif ( triggerer_name == REMOTE_PLAYER ) then
      mission_help_clear( SYNC_REMOTE )
   end
end

-- Callback function for the "Plant C4" trigger.
-- Guides the player's actions correctly for
-- planting C4.
--
function ss02_plant_c4( triggerer_name, trigger_name )
   -- Only the local player can plant the C4.
   if ( triggerer_name == LOCAL_PLAYER ) then
      -- Stop the "You're running out of time!" messages. They are no longer relevant.
      if ( Running_out_of_time_prompts_thread_handle ~= INVALID_THREAD_HANDLE ) then
         thread_kill( Running_out_of_time_prompts_thread_handle )
         Running_out_of_time_prompts_thread_handle = INVALID_THREAD_HANDLE
      end

      local bomb_countdown_needs_changing = true
      local time_remaining_ms = hud_timer_get_remainder( 0 )
      if ( time_remaining_ms < C4_POST_PLANT_DETONATION_TIME_MS ) then
         bomb_countdown_needs_changing = false
      end

      -- Clear out the help messages
      mission_help_clear( SYNC_ALL )

      -- Disable the player's controls and take control of
      -- his character
      player_controls_disable( triggerer_name )

      local old_equipped_item = inv_item_get_equipped_item( triggerer_name )
      inv_item_equip( nil, triggerer_name )

      move_to( triggerer_name, PLANT_C4_LOCATION, 1, true, false)
      thread_yield()
      Planting_C4 = true
		character_release_human_shield( triggerer_name )
      camera_look_through( PLANTING_BOMB_VIEW, 0 )
      crouch_start( triggerer_name )		
      group_create_hidden( MP.."Bomb" )
      audio_play_for_character( PLANT_BOMB_LINE, triggerer_name, "voice", false, false )

      -- If the player's modifying the bomb countdown timer, then do the
      -- plant bomb animation
      if ( bomb_countdown_needs_changing ) then
         hud_timer_pause( 0, true )
         set_animation_state( triggerer_name, STATE_PLANT_C4 )
         delay( PLANT_C4_TIME_SECONDS )
         clear_animation_state( triggerer_name )
      else
         set_animation_state( triggerer_name, STATE_PLANT_C4 )
         delay( DROP_C4_TIME_SECONDS )
         clear_animation_state( triggerer_name )
      end
      camera_end_look_through( true )
      group_show( MP.."Bomb" )
      crouch_stop( triggerer_name )

      delay( .5 )
      Planting_C4 = false
      inv_item_equip( old_equipped_item, triggerer_name )
      player_controls_enable( triggerer_name )
      mission_help_table( HT_GET_CLEAR, "", "", SYNC_ALL )


      ss02_switch_state( MS_C4_PLANTED )
   end
end

-- This function is contrasted with ss02_failed_to_plant_c4_in_time, which causes
-- the player to detonate and fail the mission.
--
function ss02_c4_correct_detonation()
		audio_play_for_character( "SFX_SS05_EXP_DUSTLAB", LOCAL_PLAYER, "foley", false, false )
		explosion_create( C4_EXPLOSION_NAME, PLANT_C4_TRIGGER, LOCAL_PLAYER, true )

		group_hide( MP.."Bomb" )
		minimap_icon_remove_navpoint( GENERATOR_ROOM_UNSAFE_ZONE_TRIGGER, SYNC_ALL )
		for index, name in EXPLOSION_SIDE_NAMES do
			explosion_create( SIDE_EXPLOSION_NAME, name, LOCAL_PLAYER, true )
		end

		if ( Players_in_unsafe_zone[LOCAL_PLAYER] ) then
			character_kill( LOCAL_PLAYER )
			character_ragdoll( LOCAL_PLAYER, 100 )
		end
		if ( Players_in_unsafe_zone[REMOTE_PLAYER] ) then
			character_kill( REMOTE_PLAYER )
			character_ragdoll( REMOTE_PLAYER, 100 )
		end

		-- If at least one of the currently playing players is outside of the
		-- unsafe zone and therefore safe, set the checkpoint
		if ( ss02_all_players_in_unsafe_zone() == false ) then
			mission_set_checkpoint( DETONATED_C4_CHECKPOINT )
		end

		C4_correct_detonation_counting_down = false

		delay( 1.0 )

		-- Add smoke on the generator box
		Smoke_effect_handle = effect_play( GENERATOR_BOX_SMOKE_EFFECT_NAME, GENERATOR_BOX_NAVPOINT_NAME, true )

		thread_kill( Generator_guard_patrol_thread )

		ss02_do_prison_blackout()

		hud_timer_stop(0)
		notoriety_force_no_spawn( PRISON_DEFENDER_TEAM, false )
		ss02_switch_state( MS_PRISON_RIOT )
end

function ss02_do_prison_blackout()
   prison_blackout_start()
   thread_new( "ss02_run_window_blackout" )
   thread_new( "ss02_run_zone_blackout" )
end

-- Plays the blackout for the windows in the prison.
--
function ss02_run_window_blackout()

   local delay_seconds_per_update = PRISON_WINDOW_BLACKOUT_TIME_SECONDS / PRISON_WINDOW_NUM_UPDATES
   local cur_blackout_threshold = START_WINDOW_BLACKOUT_THRESHOLD
   local blackout_reduction_per_update = cur_blackout_threshold / PRISON_WINDOW_NUM_UPDATES

   for i = 1, PRISON_WINDOW_NUM_UPDATES do
      cur_blackout_threshold = cur_blackout_threshold - blackout_reduction_per_update
      mission_debug( "setting threshold to "..cur_blackout_threshold )
      prison_blackout_set_window_threshold( cur_blackout_threshold )
      delay( delay_seconds_per_update )
   end

   mission_debug( "setting threshold to 0" )
   prison_blackout_set_window_threshold( 0 )
end

-- Plays the blackout for trigger zones in the prison.
--
function ss02_run_zone_blackout()
   for step_index, sequence_step in pairs( PRISON_ZONE_BLACKOUT_SEQUENCE ) do
      delay( sequence_step[PZ_BLACKOUT_TIME_INDEX] )
      prison_blackout_nuke_zone( sequence_step[PZ_BLACKOUT_ZONE_NAME_INDEX] )
   end
end

-- These five functions keep track of where the players are in relation
-- to the inside of the coal tunnels.
--
function ss02_left_threshold( triggerer_name, trigger_name )
   if ( Players_in_inside[triggerer_name] == true ) then
      Players_in_coal_tunnels[triggerer_name] = true
      ss02_switch_state( MS_PLANT_C4 )
   elseif ( Players_in_outside[ triggerer_name] == true ) then
      Players_in_coal_tunnels[triggerer_name] = false
   end
end

function ss02_entered_inside( triggerer_name, trigger_name )
   Players_in_inside[triggerer_name] = true
   if  ( Prison_guard_spawned == false ) then
      notoriety_force_no_spawn( PRISON_DEFENDER_TEAM, true )
      notoriety_set_min( PRISON_DEFENDER_TEAM, 1 )
      mission_help_table( HT_PLANT_C4_ON_TURBINE )
      group_show( GENERATOR_GUARD_GROUP_NAME )
      Generator_guard_patrol_thread = thread_new( "ss02_generator_guard_patrol" )
      Prison_guard_spawned = true
   end
end

function ss02_left_inside( triggerer_name, trigger_name )
   Players_in_inside[triggerer_name] = false
end

function ss02_entered_outside( triggerer_name, trigger_name )
   Players_in_outside[triggerer_name] = true
end

function ss02_left_outside( triggerer_name, trigger_name )
   Players_in_outside[triggerer_name] = false
end

-- Used to let the player know that the outside of the generator room is locked.
--
function ss02_attempt_open_locked_generator_room_exit_door( triggerer_name, trigger_name )
   local sync_type = sync_from_player( triggerer_name )

   mission_help_table( HT_DOOR_LOCKED, "", "", sync_type )
end

-- Called when the player lets the C4 timer run out before planting the bomb.
--
function ss02_failed_to_plant_c4_in_time()
   if ( Planting_C4 ) then
      camera_end_look_through( true )

      clear_animation_state( LOCAL_PLAYER )

      player_controls_enable( LOCAL_PLAYER )
   end

   explosion_create( C4_EXPLOSION_NAME, LOCAL_PLAYER )
   character_kill( LOCAL_PLAYER )

   delay( TIME_TO_DIE_SECONDS )

   mission_end_failure( MISSION_NAME, HT_FAILED_TO_PLANT_BOMB_IN_TIME )
end

-- Used to check to see if the player entered a boat to escape the prison.
-- Switches the state to "Get to Laura's house"
--
function ss02_player_entered_vehicle_escape( player_name, vehicle_name )
   local vehicle_type = get_char_vehicle_type( player_name )
   mission_debug( player_name.." entered vehicle" )
   if ( vehicle_type == VT_WATERCRAFT or vehicle_type == VT_AIRPLANE or vehicle_type == VT_HELICOPTER ) then
      -- Clear the vehicle entrance callbacks
      ss05_set_or_clear_escape_callbacks( false )
      marker_remove_vehicle( HELIPAD_HELICOPTER, SYNC_ALL )

      thread_new( "ss02_check_for_getting_away_start" )
      waypoint_remove( SYNC_ALL )
   end
end

function ss02_check_for_getting_away_start()
   local vehicle_type
   repeat
      thread_yield()
      vehicle_type = get_char_vehicle_type( Laura_leader_name )
   until ( character_is_in_vehicle( LAURA_NAME ) and
           ( vehicle_type == VT_WATERCRAFT or vehicle_type == VT_AIRPLANE or vehicle_type == VT_HELICOPTER ) )

   mission_help_table( HT_ESCAPE_PRISON_AND_POLICE )
   thread_new( "ss02_laura_escape_driving_lines" )
end

-- Plays lines for Laura randomly when the player's escaping from the prison island.
--
function ss02_laura_escape_driving_lines()
	for index, line in pairs( RETURN_TO_STILWATER_LINES ) do
		local between_lines_delay = rand_float( BETWEEN_LINES_DELAY_MIN_SECONDS, BETWEEN_LINES_DELAY_MAX_SECONDS )
		delay( between_lines_delay )
		local vehicle_type
		repeat
			thread_yield()
	      vehicle_type = get_char_vehicle_type( LAURA_NAME )
		until ( vehicle_type == VT_WATERCRAFT or vehicle_type == VT_AIRPLANE or vehicle_type == VT_HELICOPTER )

		audio_play_for_character( line, LAURA_NAME, "voice", false, true )
	end
end

-- Used to check to see if the player entered a boat to get to the prison.
-- Switches the state to "Get to Prison" if so.
--
function ss02_player_entered_vehicle_initial( player_name, vehicle_name )
   local vehicle_type = get_char_vehicle_type( player_name )

   if ( vehicle_type == VT_WATERCRAFT or vehicle_type == VT_AIRPLANE or vehicle_type == VT_HELICOPTER ) then
      on_vehicle_enter( "", LOCAL_PLAYER )
      if ( coop_is_active() ) then
         on_vehicle_enter( "", REMOTE_PLAYER )
      end

      for index, watercraft_name in STARTER_WATERCRAFT_NAMES do
         on_vehicle_enter( "", watercraft_name )
      end
      marker_remove_vehicle( MARKED_WATERCRAFT, SYNC_ALL )

      ss02_switch_state( MS_GET_TO_PRISON )
   end
end

function ss02_cleanup()
	-- Cleanup mission here
   on_vehicle_enter( "", LOCAL_PLAYER )
   if ( coop_is_active() ) then
      on_vehicle_enter( "", REMOTE_PLAYER )
   end

   on_district_changed( "", LOCAL_PLAYER )
   if ( coop_is_active() ) then
      on_district_changed( "", REMOTE_PLAYER )
   end

   mesh_mover_show( PRISON_GRATE_NAME )
   for index, barrel in pairs( PRISON_GRATE_BARRELS ) do
      mesh_mover_show( barrel )
   end

   if Smoke_effect_handle ~= INVALID_EFFECT_HANDLE then
       effect_stop( Smoke_effect_handle )
   end
   notoriety_set_min( PRISON_DEFENDER_TEAM, 0 )

   ss02_enable_gang_notoriety()

   if ( camera_script_is_finished() == false ) then
      camera_end_look_through()
   end

   if ( Mission_won ) then
      group_destroy( ESCAPE_HELICOPTERS_GROUP_NAME )
      if ( coop_is_active() ) then
         teleport( REMOTE_PLAYER, LAURAS_HOUSE_REMOTE_PLAYER_TELEPORT, true )
      end
      teleport( LOCAL_PLAYER, LAURAS_HOUSE_TRIGGER_NAME, true )
   end

   for index, door in DOORS_TO_LOCK do
      door_lock( door, false )
   end
   for index, door in PRISON_ENTRANCE_DOORS do
      door_lock( door, false )
   end
   for index, door in CAFETERIA_ENTRANCE_DOORS do
      door_lock( door, false )
   end

   door_lock( GENERATOR_ROOM_EXIT_DOOR, false )
   prison_blackout_restore_everything()

   for index, door in pairs( LAURA_CELLBLOCK_DOORS ) do
      door_lock( door, false )
      mesh_mover_show( door )
   end
   parking_spot_enable( HELICOPTER_PARKING_SPAWN, true )
   
   hud_timer_stop(0)
   city_chunk_swap( "sr2_intsrmisprison02", "normal", true, true, true )
	ss02_stop_alarms()
end

function ss02_success()
	-- Called when the mission has ended with success
end
