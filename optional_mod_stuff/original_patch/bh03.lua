-- bh03.lua
-- SR2 mission script
-- 3/28/07

-- Global constants
	-- Mission state constants

	-- End mission states

   -- Help text ( not all help text is listed here )
      HT_GOO_NEAR_TOWERS = "bh03_goo_near_towers"
      HT_GOO_NEAR_NORTH_DOCKS = "bh03_goo_near_north_docks"
      HT_GOO_IN_EAST_BUILDING = "bh03_goo_in_east_building"
      HT_GOO_ON_SOUTH_SIDE = "bh03_goo_on_south_side"

      HT_GOO_LOCATIONS = { HT_GOO_NEAR_TOWERS, HT_GOO_NEAR_TOWERS, HT_GOO_IN_EAST_BUILDING,
                           HT_GOO_ON_SOUTH_SIDE, HT_GOO_NEAR_NORTH_DOCKS, HT_GOO_NEAR_NORTH_DOCKS,
                           HT_GOO_NEAR_TOWERS }

      HT_HELI_BLOW_COVER_WARNING = "bh03_heli_blow_cover_warning"
      HT_GET_TO_HELIPAD = "bh03_get_to_helipad"
      HT_DEFEND_HELIPAD = "bh03_defend_helipad"
      HT_BOARD_HELICOPTER = "bh03_board_helicopter"
      HT_CARLOS_DIED = "bh03_carlos_died"
      HT_CARLOS_ABANDONED = "bh03_carlos_abandoned"
      HT_X_OF_Y_GUARDS_KILLED = "bh03_x_of_y_guards_killed"
      HT_HELICOPTER_DESTROYED = "bh03_helicopter_destroyed"
      HT_PILOT_KILLED = "bh03_heli_pilot_killed"
      HT_ABANDONED_HELIPAD = "bh03_abandoned_helipad"
      HT_GET_CLEAR_OF_HELI = "bh03_get_clear"
      HT_CLEAR_OUT_HELIPAD_GUARDS = "bh03_clear_out_helipad_guards"
      HT_RETURN_TO_HELIPADS_DEFENSE = "bh03_return_to_helipads_defense"

	-- Assorted constants --
		CURRENT_MISSION =			"bh03"
		ENEMY_GANG =				"Brotherhood"
      MP = CURRENT_MISSION.."_$"

		NAV_NUKE_TOWERS =			{MP.."n001", MP.."n002"}
		NAV_ALARM_LOCATION =		MP.."n003"
		NUKE_TOWER_RADIUS =		19

		WEAPON_STORE_MESSAGE_RADIUS =		10
		WEAPON_STORE_EFFECT =			"mission_purchase"

		NUKE_ISLAND_RADIUS =			350

		GOO_PREFIX =				MP.."goo_"
		GOO_TRIGGER_PREFIX =			MP.."goo_trigger_"
		GOO_COUNT =				7
      SPAWN_NEW_WAVE_THRESHOLD = 2

		GOO_LOCATION_MAP =		{MP.."nuke_island02", MP.."nuke_island02", MP.."nuke_island03", MP.."nuke_island03",
										 MP.."nuke_island01", MP.."nuke_island01", MP.."nuke_island02"}

		GOO_TRIGGER_EFFECT =			"mission_complete"

		GEIGER_MIN_DELAY =			0.1
		GEIGER_MAX_DELAY =			2.0
		GEIGER_MIN_DISTANCE =			3
		GEIGER_MAX_DISTANCE =			100
		GEIGER_MIN_FEEDBACK =			0
		GEIGER_CUTOFF_DELAY =			0

      LEAVE_PAD_FAILURE_TIME_SECONDS = 30
      TIME_PER_RETURN_TO_DEFEND_UPDATE_SECONDS = 5
      HELI_ARRIVAL_HOLD_OUT_TIME_MS = 90000
      MISSION_END_FAILURE_TIME_MS = 900000
      MISSION_END_WARNING_TIME_MS = 810000

      BETWEEN_GOO_NAGS_SECONDS = 30

      MISSION_END_FAILURE_AFTER_CHECKPOINT_MS = 660000
      MISSION_END_WARNING_AFTER_CHECKPOINT_MS = 570000

      MISSION_END_FAILURE_AFTER_SECOND_CHECKPOINT_MS = 540000
      MISSION_END_WARNING_AFTER_SECOND_CHECKPOINT_MS = 450000

      MISSION_END_FAILURE_AFTER_FINAL_CHECKPOINT_MS = 420000
      MISSION_END_WARNING_AFTER_FINAL_CHECKPOINT_MS = 330000

      -- How many of the initial guards should be remaining before the player's escape
      -- helicopter does its flyby of the helipad
      INITIAL_GUARDS_DO_FLYBY_THRESHOLD =		6

      HELIPAD_AREA_RADIUS_METERS =				25
      HELICOPTER_BUZZ_SPEED_MPS =				30
      HELICOPTER_LAND_SPEED_MPS =				30
      HELICOPTER_RAIL_SPEED_MPS =				20

      ULTOR_HELIS_CLOSING_SPEEDS_MPS =			{ 40, 40, 40 }
      ULTOR_HELIS_FOLLOW_SPEEDS_MPS =			{ 40, 40, 40 }

		GEIGER_CLICK =									"SFX_BRO_GEIGER_LOOP"
		GEIGER_ON =										"SFX_BRO_GEIGER_ON"
		GEIGER_OFF =									"SFX_BRO_GEIGER_OFF"
		NUKE_ALARM_INDOORS =							"SFX_BRO_PLANT_ALARM_IN"
		NUKE_ALARM_OUTDOORS =						"SFX_BRO_PLANT_ALARM_OUT"
		GEIGER_FEEDBACK =								"Geiger_Counter"

		ACTION_PICKUP_ITEM =							"pickup item"

		WEAPON_GEIGER_COUNTER =						"giegerCounter"

		HQ_WARNING_DISTANCE =						100
		HQ_PENALTY_DISTANCE =						50
		HQ_DELIVER_DISTANCE =						10
		HQ_PENALTY_NOTORIETY =						3

      MISSION_MAX_NOTORIETY =						2
		MISSION_MAX_NOTORIETY_COOP =				3

      ULTOR_HELI_PILOT_SEAT =						0
      ULTOR_HELI_GUNNER_SEAT =					4

	-- Patrol Stuff added by Bryan D.
		NUKE_PATROL_ROUTE01			= {MP.."sec_patrol_pt01", MP.."sec_patrol_pt02", MP.."sec_patrol_pt03", MP.."sec_patrol_pt04", MP.."sec_patrol_pt01"}
		NUM_NUKE_PATROL01			= sizeof_table(NUKE_PATROL_ROUTE01)
		NUKE_GUARDS				= {MP.."guard00", MP.."guard04", MP.."guard06", MP.."guard08", MP.."guard09", MP.."guard10", MP.."guard11", MP.."guard13", MP.."guard15"}
		NUM_NUKE_GUARDS				= sizeof_table(NUKE_GUARDS)
		NUKE_SECURITY				= "Police"

		GOO_GUARDS =				{{MP.."c000", MP.."c001", MP.."c002"},
										 {MP.."c003", MP.."c004", MP.."c005"},
										 {MP.."c006", MP.."c007", MP.."c008"},
										 {MP.."c009", MP.."c010", MP.."c011"},
										 {MP.."c012", MP.."c013", MP.."c014"},
										 {MP.."c015", MP.."c016", MP.."c017"},
										 {MP.."c018", MP.."c019", MP.."c020"}}

      HELIPAD_INITIAL_GUARDS = { MP.."HIG_01", MP.."HIG_02", MP.."HIG_03", MP.."HIG_04",
                                 MP.."HIG_05", MP.."HIG_06", MP.."HIG_07", MP.."HIG_08",
                                 MP.."HIG_09", MP.."HIG_10" }
      HELIPAD_SECOND_WAVE_MEMBERS = { { MP.."SWN_M1", MP.."SWN_M2", MP.."SWN_M3", MP.."SWN_M4" },
                                      { MP.."SWE_M1", MP.."SWE_M2", MP.."SWE_M3", MP.."SWE_M4" },
                                      { MP.."SWW_M1", MP.."SWW_M2", MP.."SWW_M3", MP.."SWW_M4" } }

      CARLOS_NAME = MP.."Carlos"
      ESCAPE_HELI_PILOT_NAME = MP.."Escape_Heli_Pilot"
      ESCAPE_HELICOPTER_PASSENGERS = { ESCAPE_HELI_PILOT_NAME, CARLOS_NAME }

      ULTOR_HELI_PILOTS = { MP.."UAH1_Pilot", MP.."UAH2_Pilot", MP.."UAH3_Pilot" }
      ULTOR_HELI_GUNNERS = { MP.."UAH1_Gunner", MP.."UAH2_Gunner", MP.."UAH3_Gunner" }

	-- Navpoints and paths --
		NAVPOINT_START =									MP.."player_start"
      NAVPOINT_START_COOP =							MP.."coop_player_start"
		NAVPOINT_FINISH =									MP.."player_finish"
		NAVPOINT_WEAPON_STORE_OUTSIDE =				MP.."n000"
		NAVPOINT_HQ =										MP.."brotherhood_hq"
		NAVPOINT_NUKE_ISLAND =							""
		NAVPOINT_NUKE_ISLAND_CENTER =					MP.."nuke_island02"
      IN_HELI_TELEPORT_LOCATIONS = { [LOCAL_PLAYER] = MP.."In_Heli_Teleport_Goal_Local",
                                     [REMOTE_PLAYER] = MP.."In_Heli_Teleport_Goal_Remote" }
		NEAR_HELI_CHECKPOINT_WARPS = { [LOCAL_PLAYER] = MP.."Near_Heli_Checkpoint_Warp_Local",
                                     [REMOTE_PLAYER] = MP.."Near_Heli_Checkpoint_Warp_Remote" }
		PASSENGERS_NEAR_HELI_WARPS = { MP.."Near_Heli_Checkpoint_Warp_Local",
                                     MP.."Near_Heli_Checkpoint_Warp_Remote" }

      HELI_BUZZ_HELIPAD_START =						MP.."Heli_Buzz_Helipad_Start"
      HELI_BUZZ_HELIPAD_PATH =						MP.."Heli_Buzz_Helipad"

      HELI_LAND_START =									MP.."Heli_Land_Start"
      HELI_LAND_PATH =									MP.."Heli_Land"

      REAL_HELI_START =									MP.."Real_Heli_Start"

      HELI_BACK_TO_STILWATER_AND_CRASH_PATH =	MP.."Back_To_Stilwater_and_Crash"
      HELI_CRASH_PATH = MP.."Heli_Crash"

      ULTOR_HELI_START_POINTS = { MP.."UAH1_Start", MP.."UAH2_Start", MP.."UAH3_Start" }
      ULTOR_HELI_FOLLOW_PATHS = { MP.."UAH1_Follow", MP.."UAH2_Follow", MP.."UAH3_Follow" }

      HELIPAD_SECOND_WAVE_PATHS = { MP.."North_Wave_Path", MP.."East_Wave_Path",
                                    MP.."West_Wave_Path" }

      OUTSIDE_ALARMS = { MP.."Outside_Alarm_01", MP.."Outside_Alarm_02", MP.."Outside_Alarm_03", MP.."Outside_Alarm_04",
                         MP.."Outside_Alarm_05", MP.."Outside_Alarm_06", MP.."Outside_Alarm_07", MP.."Outside_Alarm_08",
                         MP.."Outside_Alarm_09", MP.."Outside_Alarm_10", MP.."Outside_Alarm_11", MP.."Outside_Alarm_12",
                         MP.."Outside_Alarm_13", MP.."Outside_Alarm_14", MP.."Outside_Alarm_15", MP.."Outside_Alarm_16",
                         MP.."Outside_Alarm_17", MP.."Outside_Alarm_18", MP.."Outside_Alarm_19", MP.."Outside_Alarm_20" }
      INSIDE_ALARMS = { MP.."Inside_Alarm_01", MP.."Inside_Alarm_02", MP.."Inside_Alarm_03" }

		POLICE_SHOOTER01 = MP.."c021"
		POLICE_SHOOTER02 = MP.."c022"
		POLICE_SHOOTER03 = MP.."c023"

   -- Triggers --
      HELIPAD_AREA = MP.."Helipad_Area"

      LZ_TOO_HOT_TRIGGER = MP.."LZ_Too_Hot"

      ULTOR_HELI_FOLLOW_TRIGGERS = { MP.."UAH1_Trigger", MP.."UAH2_Trigger", MP.."UAH3_Trigger" }
		TRIGGER_BOAT_CHASE = MP.."trigger_chase_boats"
		TRIGGER_SHOOTERS = MP.."trigger_shooters"		
      FORCE_SEATING_TRIGGER = MP.."Force_Helicopter_Seating"

      HELI_IN_TROUBLE_TRIGGER = MP.."Heli_In_Trouble"
      HELI_GOING_DOWN_TRIGGER = MP.."Heli_Going_Down"
      HELI_EJECTION_TRIGGER = MP.."Heli_Eject"

	-- Store Trigger --
		WEAPON_STORE_ORIG =		"shops_sr2_city_$AP_gun_store" -- Weapon store we're replacing
		WEAPON_STORE =				MP.."weap_store_replacement"

	-- Vehicle --
		SECURITY_VEHICLE01 =			MP.."security_vehicle01"
		POLICE_BOAT01 =				MP.."police_boat01"
		POLICE_BOAT02 =				MP.."police_boat02"
		END_COURTESY_CAR =			MP.."v000"
      HELIPAD_SECOND_WAVE_VEHICLES = { MP.."SWN_V", MP.."SWE_V", MP.."SWW_V" }

      -- Just for appearances sake - we show this one flying by and landing
      FAUX_ESCAPE_HELICOPTER = MP.."Faux_Escape_Helicopter"
      -- This is the helicopter version that the player can actually shoot from
      ESCAPE_HELICOPTER = MP.."Escape_Helicopter"

      ULTOR_HELIS = { MP.."UAH1_Heli", MP.."UAH2_Heli", MP.."UAH3_Heli" }

	-- Police Boat Chase People
		BOAT01_DRIVER =				MP.."police_boat01_driver"
		BOAT01_PASSENGER =			MP.."police_boat01_passenger"	
		BOAT02_DRIVER =				MP.."police_boat02_driver"
		BOAT02_PASSENGER =			MP.."police_boat02_passenger"	
		BOAT01_BOAT	=					MP.."police_boat01"
		BOAT02_BOAT	=					MP.."police_boat02"
		BOAT01_PATH =					MP.."boat01_path"
		BOAT02_PATH =					MP.."boat02_path"
		BOATS_SPEED =					42
		BOAT_HEALTH_MULTIPLIER =	.45

	-- Groups --
		GROUP_GOO =				      MP.."goo_locations"
		GROUP_END_VEHICLE	=			MP.."final_courtesy"
		GROUP_EXTRA_BOATS =			MP.."extra_boat_spawns"
		GROUP_START_VEHICLE =		MP.."extra_vehicle_spawn"
		GROUP_START_VEHICLE_COOP =	MP.."extra_vehicle_spawn_coop"
		GROUP_ISLAND_PATROL01 =		MP.."island_patrols"
		GROUP_ISLAND_GUARDS =		MP.."island_guards"
		GROUP_POLICE_BOATS =			MP.."police_boat_chase"
		GROUP_POLICE_SHOOTERS =		MP.."police_shooters"
		GROUP_GOO_GUARDS =			{ MP.."goo_guards_1", MP.."goo_guards_2", MP.."goo_guards_3", MP.."goo_guards_4",
											  MP.."goo_guards_5", MP.."goo_guards_6", MP.."goo_guards_7" }

      HELIPAD_SECOND_WAVE_GROUPS = { MP.."helipad_second_wave_north", MP.."helipad_second_wave_east",
                                     MP.."helipad_second_wave_west" }
      HELIPAD_INITIAL_GUARDS_GROUP = MP.."helipad_initial_guards"
      FAUX_ESCAPE_HELICOPTER_GROUP = MP.."faux_escape_helicopter"
      ESCAPE_HELI_PASSENGERS_GROUP = MP.."heli_passengers"
      ESCAPE_HELICOPTER_GROUP = MP.."escape_helicopter"
      ULTOR_ATTACKING_HELICOPTER_GROUPS = { MP.."ultor_attack_heli_1", MP.."ultor_attack_heli_2", MP.."ultor_attack_heli_3" }

   -- Sound
      BE_READY_FOR_PICKUP_CALL = { { "PLAYER_BR03_CALL_GOO_L1", LOCAL_PLAYER, 0 },
                                   { "BR03_CALL_GOO_L2", CELLPHONE_CHARACTER, 0 } }

      PICK_ME_UP_NOW_CALL = { { "PLAYER_BR03_CALL_PICKUP_L1", LOCAL_PLAYER, 0 },
                              { "BR03_CALL_PICKUP_L2", CELLPHONE_CHARACTER, 0 } }

      AFTER_ENTER_HELI_DIALOG_STREAM = { { "PLAYER_BR03_ENTER_HELI_L1", LOCAL_PLAYER, 0 },
                                         { "BR03_ENTER_HELI_L2", CARLOS_NAME, 0 } }

      HELI_GOING_DOWN_LINE = "CARLOS_BR03_HELI_CRASH_01"

      AFTER_HELI_CRASH_DIALOG_STREAM = { { "PLAYER_BR03_CRASH_L1", LOCAL_PLAYER, 0 },
                                         { "BR03_CRASH_L2", CARLOS_NAME, 0 },
                                         { "PLAYER_BR03_CRASH_L3", LOCAL_PLAYER, 0 } }

      CARLOS_ALMOST_TO_NUKE_PLANT_CALL = { { "CARLOS_BR03_HELI_UPDATE_L1", CELLPHONE_CHARACTER, 0 } }
      CARLOS_TOO_HOT_LINE_CALL = { { "CARLOS_BR03_HELI_UPDATE_L2", CELLPHONE_CHARACTER, 0 } }
      CARLOS_LANDING_NOW_LINE_CALL = { { "CARLOS_BR03_HELI_UPDATE_L3", CELLPHONE_CHARACTER, 0 } }

      CARLOS_HELI_DAMAGED_LINE = "CARLOS_BR03_HELI_DAMAGE"

      CARLOS_LANDED_LINE = "CARLOS_BR03_LAND_HELI_01"

      PILOT_COMPLAIN_LINES = { "HMTRCK_BR03_CARLOS_THREAT_01", "HMTRCK_BR03_CARLOS_THREAT_02", "HMTRCK_BR03_CARLOS_THREAT_03" }
      CARLOS_COMPLAIN_TO_PILOT_LINES = { "CARLOS_BR03_HELI_PILOT_01", "CARLOS_BR03_HELI_PILOT_02", "CARLOS_BR03_HELI_PILOT_03" }
      NUM_PILOT_AND_CARLOS_COMPLAIN_CONVERSATIONS = 3

      CARLOS_PERSONA_OVERRIDES = { { "observe - passenger when driver hits cars", "CARLOS_BR03_PLAYER_DRIVE" },
                                   { "observe - passenger when driver hits object", "CARLOS_BR03_PLAYER_DRIVE" },
                                   { "observe - passenger when driver hits peds", "CARLOS_BR03_PLAYER_DRIVE" } }

	-- Checkpoints --
		CHECKPOINT_NUKE_ISLAND =		   "bh03_checkpoint_nuke_island"
      CHECKPOINT_COLLECTED_GOO =       "bh03_checkpoint_collected_goo"
      CHECKPOINT_HELICOPTER_ESCAPE =   "bh03_helicopter_escape"

   -- Weapons
      SAW_NAME = "AR200"

   -- Cutscenes --
		CUTSCENE_IN =						"br03-01"
		CUTSCENE_OUT =						"br03-02"

	-- Other --
		Geiger_sound =						{-1, -1, -1, -1, -1}	
      NUM_INITIAL_HELIPAD_GUARDS = sizeof_table( HELIPAD_INITIAL_GUARDS )
      HELIPAD_SECOND_WAVE_ATTACK_DIRECTION_COUNT = sizeof_table( HELIPAD_SECOND_WAVE_GROUPS )

      PERCENT_OF_HELI_DAMAGE_BEFORE_COMPLAINT = 0.1

      HUD_COMPLETE_MISSION_IN_TIME_INDEX = 0
      HUD_HELICOPTER_ARRIVE_INDEX = 1
      HELICOPTER_PARKING_SPAWN = "parking_spots_$parking_276_heli"

	-- Temporary stuff --
		TEMP_BOAT_SPAWN_PREFIX =		MP.."boat_spawn"
		TEMP_BOAT_NAVP_PREFIX =			MP.."boat_location"
		TEMP_BOAT_COUNT =			1

-- Global Variables
	SECURITY_ESCAPED_DIST =			20
   Goo_index = -1
	Goo_item =							false
	Goo_trigger =						false
	Goo_picked_up =					false
	Goo_delivered =					false
   Goo_player =                  LOCAL_PLAYER
	Seen_by_security =				false
   Last_player_seen =            ""
	Alarm_triggered =					false
	Gotten_away_from_security =	false
	Gotten_notoriety_down =			false
	Thread_geiger =					INVALID_THREAD_HANDLE
	Thread_geiger_hud =				INVALID_THREAD_HANDLE
	Thread_geiger_message =			INVALID_THREAD_HANDLE
	Thread_security =					INVALID_THREAD_HANDLE
   Thread_time_running_out =     INVALID_THREAD_HANDLE
	Geiger_player =					""
	Geiger_bar_off =					true
	alarm_foley_local =				-1
	alarm_foley_remote =				-1

	Alarm_message_shown = { [LOCAL_PLAYER] = false, [REMOTE_PLAYER] = false }
   Players_near_helipad = { [LOCAL_PLAYER] = false, [REMOTE_PLAYER] = false }
   Player_failure_timers_threads = { [LOCAL_PLAYER] = INVALID_THREAD_HANDLE, [REMOTE_PLAYER] = INVALID_THREAD_HANDLE }

   Initial_helipad_guards_remaining = NUM_INITIAL_HELIPAD_GUARDS
   All_players_reached_pad = false
   Helipad_initial_defenders_cleared = false
   Waves_spawned = 0
   Num_tracked_helipad_wave_attackers = 0
   Wave_spawning_enabled = true
   Helicopter_has_arrived = false
   Crash_complete = false
   Heli_percent_damage_since_last_complaint = 0
   Carlos_already_talking = false
   Controls_disabled = false
   Faux_escape_helicopter_seated = false
	Outside_alarm_emitter_ids = {}
	Inside_alarm_emitter_ids = {}
	Players_have_heli_weapons = false

function bh03_start(bh03_checkpoint, is_restart)
	bh03_initialize_alarms()

	-- Start trigger is hit...the activate button was hit
	set_mission_author("Kevin J. Price")

	notoriety_set_max( "Brotherhood", MISSION_MAX_NOTORIETY )
   notoriety_set_max( "Police", MISSION_MAX_NOTORIETY )
	if ( coop_is_active() ) then
		notoriety_set_max( "Police", MISSION_MAX_NOTORIETY_COOP )
	end

   parking_spot_enable( HELICOPTER_PARKING_SPAWN, false )

   -- TEMP
   --bh03_checkpoint = CHECKPOINT_HELICOPTER_ESCAPE
   -- END TEMP

   if bh03_checkpoint == MISSION_START_CHECKPOINT then
	   mission_start_fade_out()

		if (not is_restart) then
			cutscene_play( CUTSCENE_IN, "", {NAVPOINT_START, NAVPOINT_START_COOP} )
		else
			teleport_coop( NAVPOINT_START, NAVPOINT_START_COOP )
		end

   	set_time_of_day(20, 0)
		bh03_get_geiger_counter()
	elseif bh03_checkpoint == CHECKPOINT_NUKE_ISLAND then
      mission_start_fade_out()
      hud_timer_set( HUD_COMPLETE_MISSION_IN_TIME_INDEX, MISSION_END_FAILURE_AFTER_CHECKPOINT_MS, "bh03_mission_failure_timeout" )
		Thread_time_running_out = thread_new( "bh03_time_out_warning", MISSION_END_WARNING_AFTER_CHECKPOINT_MS );
		Geiger_player = LOCAL_PLAYER
		inv_weapon_add_temporary(Geiger_player, WEAPON_GEIGER_COUNTER, 1, true )
		initialize_goo()
      mission_start_fade_in()

		bh03_nuke_island_get_goo()
   elseif bh03_checkpoint == CHECKPOINT_COLLECTED_GOO then

      -- Go through all the goo locations and find the one closest to either player
      local closest_dist, closest_player = get_dist_closest_player_to_object( GOO_PREFIX.."1" )
      local closest_index = 1
      for i = 2, GOO_COUNT, 1 do
         local goo_location = GOO_PREFIX .. i
         local dist, closest_player = get_dist_closest_player_to_object( goo_location )
         if ( dist < closest_dist ) then
            closest_dist = dist
            closest_index = i
         end
      end

      mission_debug( "closest index found was "..closest_index )
      -- Create the particular guards that guard this goo, since this location is probably where the player picked it up
      group_create(GROUP_GOO_GUARDS[closest_index], true)
      for i, npc in pairs(GOO_GUARDS[closest_index]) do
         wander_start(npc, npc, 15.0)
         on_detection("bh03_seen_by_guard", npc)
      end
	   Thread_security = thread_new("bh03_security_watch")

      fade_in( 1 )
      hud_timer_set( HUD_COMPLETE_MISSION_IN_TIME_INDEX, MISSION_END_FAILURE_AFTER_SECOND_CHECKPOINT_MS, "bh03_mission_failure_timeout" )
		Thread_time_running_out = thread_new( "bh03_time_out_warning", MISSION_END_WARNING_AFTER_SECOND_CHECKPOINT_MS );
		Geiger_player = LOCAL_PLAYER
      bh03_helipad_defense_and_arrival()
   elseif bh03_checkpoint == CHECKPOINT_HELICOPTER_ESCAPE then
      mission_start_fade_out()

		script_profiler_reset()
		
		script_profiler_start_section( "checkpoint: give and equip weapons" )
		bh03_give_and_equip_player_heli_weapons()
		script_profiler_end_section( "checkpoint: give and equip weapons" )

		script_profiler_start_section( "checkpoint group creation" )
      if ( group_is_loaded( ESCAPE_HELICOPTER_GROUP ) == false ) then
         group_create_hidden( ESCAPE_HELICOPTER_GROUP, true )
      end
      on_death( "bh03_carlos_died", CARLOS_NAME )

      group_create_hidden( ESCAPE_HELI_PASSENGERS_GROUP, true )
      for index, group_name in pairs( ULTOR_ATTACKING_HELICOPTER_GROUPS ) do
         group_create_hidden( group_name )
      end
		script_profiler_end_section( "checkpoint group creation" )

      -- No notoriety spawning - attack helicopters destroy the escape helicopter rather quickly
      notoriety_force_no_spawn( NUKE_SECURITY, true )
      notoriety_force_no_spawn( "Ultor", true )

		script_profiler_start_section( "teleport coop" )
		teleport_coop( NEAR_HELI_CHECKPOINT_WARPS[LOCAL_PLAYER], NEAR_HELI_CHECKPOINT_WARPS[REMOTE_PLAYER], true )
		script_profiler_end_section( "teleport coop" )

      -- resuming_from_checkpoint = true
      bh03_helicopter_escape_and_brotherhood_hq_return( true )
   end
end

function bh03_give_and_equip_player_heli_weapons()
	inv_weapon_disable_all_but_this_slot( WEAPON_SLOT_RIFLE )
	inv_weapon_add_temporary( LOCAL_PLAYER, SAW_NAME, 1, true, true )
	inv_item_equip( SAW_NAME, LOCAL_PLAYER )
	if ( coop_is_active() ) then
		inv_weapon_add_temporary( REMOTE_PLAYER, SAW_NAME, 1, true, true ) 
		inv_item_equip( SAW_NAME, REMOTE_PLAYER )
	end
	Players_have_heli_weapons = true
end

function bh03_equip_player_heli_weapons()
	repeat
		inv_item_equip( SAW_NAME, LOCAL_PLAYER )
		if ( coop_is_active() ) then
			inv_item_equip( SAW_NAME, REMOTE_PLAYER )
		end
		delay( 1.0 )
	until ( inv_item_is_equipped( SAW_NAME, LOCAL_PLAYER ) and
			  ( coop_is_active() == false or inv_item_is_equipped( SAW_NAME, REMOTE_PLAYER ) ) )
end

function bh03_initialize_alarms()
	-- Setup the emitter ID arrays
	for index, name in pairs( OUTSIDE_ALARMS ) do
		Outside_alarm_emitter_ids[index] = 0
	end
	for index, name in pairs( INSIDE_ALARMS ) do
		Inside_alarm_emitter_ids[index] = 0
	end
end

function bh03_get_geiger_counter()
   -- Create groups
	if ( coop_is_active() ) then
      group_create( GROUP_START_VEHICLE_COOP, true )
   end
	group_create(GROUP_START_VEHICLE, true)
	group_create(GROUP_EXTRA_BOATS, true)
   trigger_type_enable("store ownership", false)
	trigger_type_enable("crib weapons", false)
   -- Fade in
   mission_start_fade_in()

   hud_timer_set( HUD_COMPLETE_MISSION_IN_TIME_INDEX, MISSION_END_FAILURE_TIME_MS, "bh03_mission_failure_timeout" )
	Thread_time_running_out = thread_new( "bh03_time_out_warning", MISSION_END_WARNING_TIME_MS );

   -- Let the player know about the time limit
   mission_help_table_nag("bh03_time_limit")
	delay(7)

   -- Guide the player to the first objective
	mission_help_table("bh03_get_geiger")
	Geiger_player = ""
	trigger_enable(WEAPON_STORE, true)
	marker_add_navpoint(NAVPOINT_WEAPON_STORE_OUTSIDE, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)
	waypoint_add(WEAPON_STORE)
	ingame_effect_add_trigger(WEAPON_STORE, WEAPON_STORE_EFFECT, SYNC_ALL)
	on_trigger("buy_geiger_counter", WEAPON_STORE)

   -- Wait until he's nearly to the weapon store
	repeat
		thread_yield()
	until Geiger_player ~= "" or get_dist_closest_player_to_object(WEAPON_STORE) < WEAPON_STORE_MESSAGE_RADIUS 
	marker_remove_navpoint(NAVPOINT_WEAPON_STORE_OUTSIDE, SYNC_ALL)
   ingame_effect_remove_trigger( WEAPON_STORE_ORIG, SYNC_ALL )
	trigger_type_enable("weapon store", false)
   trigger_enable(WEAPON_STORE_ORIG, false)

	mission_help_table("bh03_buy_geiger")

   -- Wait until the player's bought the geiger counter
	repeat
		thread_yield()
	until Geiger_player ~= ""

	waypoint_remove()

	-- Lets mark the available transprotation
	marker_add_vehicle(MP.."boat_spawn1", MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_INTERACT, SYNC_ALL)
   waypoint_add( MP.."boat_spawn1", SYNC_ALL )

	delay(1) 

	mission_help_table("bh03_vehicles_available")
	-- when the player enters one, remove the markers
	on_vehicle_enter("bh03_player_entered_vehicle", MP.."boat_spawn1") 
   on_vehicle_enter( "bh03_player_entered_vehicle", LOCAL_PLAYER )
   if ( coop_is_active() ) then
      on_vehicle_enter( "bh03_player_entered_vehicle", REMOTE_PLAYER )
   end

   -- If either player is ALREADY in the vehicle, just do the callback now
   if ( character_is_in_vehicle( LOCAL_PLAYER, MP.."boat_spawn1" ) ) then
      bh03_player_entered_vehicle( LOCAL_PLAYER )
   elseif ( coop_is_active() and character_is_in_vehicle( REMOTE_PLAYER, MP.."boat_spawn1" ) ) then
      bh03_player_entered_vehicle( REMOTE_PLAYER )      
   end

	-- Island Security Patrol added by Bryan D.
	group_create(GROUP_ISLAND_PATROL01, true)
	vehicle_enter_group_teleport(MP.."security01", MP.."security02", SECURITY_VEHICLE01)
	-- vehicle_pathfind_to(SECURITY_VEHICLE01, MP.."sec_patrol_pt01", MP.."sec_patrol_pt02", MP.."sec_patrol_pt01", MP.."sec_patrol_pt02", MP.."sec_patrol_pt01", MP.."sec_patrol_pt02", true, false)

	-- Force the security patrol to patrol
	thread_new("bh03_nuke_patrol_01", SECURITY_VEHICLE01, MP.."security01", MP.."security02")
	
	-- Tell the island guards to wander
	group_create(GROUP_ISLAND_GUARDS, true)
	for i = 1, NUM_NUKE_GUARDS, 1 do
		wander_start(NUKE_GUARDS[i], NUKE_GUARDS[i], 15.0)
	end

	-- Set all these dudes to react to the player when they see him or her by raising the notoriety
	bh03_set_guards_detection_callback( "bh03_seen_by_guard" )

	-- Time to disable ambient police
	spawning_allow_cop_ambient_spawns( false ) 
	roadblocks_enable( false )

	initialize_goo()

	while ( ( not bh03_either_player_in_water_travel_vehicle() ) and
			  ( not bh03_either_player_close_to_nav( NAVPOINT_NUKE_ISLAND, NUKE_ISLAND_RADIUS+150 ) ) ) do
		thread_yield()
	end

	bh03_remove_nuke_island_vehicles_markers()

	minimap_icon_add_navpoint(NAVPOINT_NUKE_ISLAND, MINIMAP_ICON_LOCATION)
   waypoint_add( NAVPOINT_NUKE_ISLAND, SYNC_ALL )
   mission_help_table("bh03_go_to_island")

   thread_new( "bh03_play_be_prepared_conversation" )

	repeat
		delay(0.25)
	until bh03_either_player_close_to_nav( NAVPOINT_NUKE_ISLAND,  NUKE_ISLAND_RADIUS )

	bh03_remove_nuke_island_vehicles_markers()

	minimap_icon_remove_navpoint(NAVPOINT_NUKE_ISLAND)
   waypoint_remove( SYNC_ALL )

	mission_set_checkpoint(CHECKPOINT_NUKE_ISLAND)

	bh03_nuke_island_get_goo()
end

function bh03_play_be_prepared_conversation()
   delay( 15 )
   audio_play_conversation( BE_READY_FOR_PICKUP_CALL, OUTGOING_CALL )
end

function bh03_either_player_in_water_travel_vehicle()
   local function bh03_player_in_water_travel_vehicle( player_name )
      if ( (get_char_vehicle_type(player_name) == VT_HELICOPTER) or
	        (get_char_vehicle_type(player_name) == VT_AIRPLANE) or
			  (get_char_vehicle_type(player_name) == VT_WATERCRAFT) ) then
         return true
      end
      return false
   end

   if ( bh03_player_in_water_travel_vehicle( LOCAL_PLAYER ) ) then
      return true
   end
   if ( coop_is_active() and bh03_player_in_water_travel_vehicle( REMOTE_PLAYER ) ) then
      return true
   end

   return false
end

function bh03_either_player_close_to_nav( nav, distance )
   if ( get_dist_char_to_nav( LOCAL_PLAYER, nav ) < distance ) then
      return true
   end
   if ( coop_is_active() and get_dist_char_to_nav( REMOTE_PLAYER, nav ) < distance ) then
      return true
   end

   return false
end

function bh03_set_guards_detection_callback( callback_name )
	on_detection(callback_name, MP.."guard00")
	on_detection(callback_name, MP.."guard04")
	on_detection(callback_name, MP.."guard06")
	on_detection(callback_name, MP.."guard08")
	on_detection(callback_name, MP.."guard09")
	on_detection(callback_name, MP.."guard10")
	on_detection(callback_name, MP.."guard11")
	on_detection(callback_name, MP.."guard13")
	on_detection(callback_name, MP.."guard15")
end

function bh03_nuke_island_get_goo()
	-- Temporary measure until notoriety on the Island works correctly.
	-- Unfortunately this appears necessary as on-detection will not work without it.
	notoriety_set_min(NUKE_SECURITY, 1)

   local player_reached_in_helicopter = false

   local dist, closest_player = get_dist_closest_player_to_object( NAVPOINT_NUKE_ISLAND )
   -- If you come in the helicopter, then set notoriety to 2
   if ( get_char_vehicle_type( closest_player ) == VT_HELICOPTER ) then
      player_reached_in_helicopter = true
   end
	Thread_security = thread_new("bh03_security_watch")

   -- If the player reached the island in a heli, then set off the alarm at once
   if ( player_reached_in_helicopter ) then
      bh03_seen_by_guard( nil, closest_player )
   -- Otherwise, warn the player about security
   else
      delay(2)
      mission_help_table_nag("bh03_island_security")
   	delay(7)
      -- Let the player know that he needs to get the goo and
      -- warn hit about guards and searchlights
	   mission_help_table("bh03_get_goo")
   end

   delay(5)
   -- Let the player know around where the goo is
   thread_new( "bh03_nag_about_goop" )

	--inv_item_equip(WEAPON_GEIGER_COUNTER, Geiger_player)
	Thread_geiger = thread_new("bh03_geiger_loop")
	Thread_geiger_hud = thread_new("bh03_geiger_hud_loop")
	Thread_geiger_message = thread_new("bh03_geiger_message_loop")

	repeat
		delay(0.25)
	until Goo_picked_up

   mission_set_checkpoint( CHECKPOINT_COLLECTED_GOO )

   bh03_helipad_defense_and_arrival()
end

function bh03_nag_about_goop()
   repeat
      mission_help_table_nag( HT_GOO_LOCATIONS[Goo_index] )
      delay( BETWEEN_GOO_NAGS_SECONDS )
   until Goo_picked_up
end

function bh03_helipad_defense_and_arrival()
   -- Set up the helipad, including the defenders
   delay( 3.0 )
   -- No notoriety spawning - the mission will handle that manually
   notoriety_force_no_spawn( NUKE_SECURITY, true )
   notoriety_force_no_spawn( "Ultor", true )

   audio_play_conversation( PICK_ME_UP_NOW_CALL, OUTGOING_CALL )
   bh03_setup_and_guide_to_helipad()

   -- Wait for both players to reach the pad and clear out the defenders
   bh03_delay_until_initial_defenders_cleared_and_all_players_reached_pad()
   mission_help_table( HT_DEFEND_HELIPAD )
   delay( 3.0 )
   -- If the "Guards killed" is displayed, then remove it.
   if ( bh03_all_players_near_helipad() ) then
      objective_text_clear( 0 )
   end

   -- Have the second wave of attackers attack
   bh03_helipad_second_wave_attack()
   -- Set the timer for the helicopter arriving
   hud_timer_hide( HUD_COMPLETE_MISSION_IN_TIME_INDEX, true )
   hud_timer_set( HUD_HELICOPTER_ARRIVE_INDEX, HELI_ARRIVAL_HOLD_OUT_TIME_MS, "bh03_helicopter_arrive", true, SYNC_ALL )

   -- Create groups of helicopters that will attack the player on return
   for index, group_name in pairs( ULTOR_ATTACKING_HELICOPTER_GROUPS ) do
      group_create_hidden( group_name )
   end

   repeat
      thread_yield()
   until ( bh03_all_players_near_helipad() and Helicopter_has_arrived )
   bh03_helicopter_escape_and_brotherhood_hq_return()
end

function bh03_helicopter_escape_and_brotherhood_hq_return( resuming_from_checkpoint )
   bh03_helicopter_escape( resuming_from_checkpoint )

   repeat
      thread_yield()
   until ( Crash_complete )

   notoriety_force_no_spawn( NUKE_SECURITY, false )
   notoriety_force_no_spawn( "Ultor", false )

	group_create(GROUP_END_VEHICLE, true)

	delay(2)

	Goo_delivered = false

   audio_play_conversation( AFTER_HELI_CRASH_DIALOG_STREAM, NOT_CALL )

	marker_add_navpoint(NAVPOINT_HQ, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION, SYNC_ALL)
   waypoint_add( NAVPOINT_HQ, SYNC_ALL )

	mission_help_table_nag("bh03_deliver_goo")

	repeat
	delay(.25)
	until get_dist(Goo_player, NAVPOINT_NUKE_ISLAND_CENTER) > NUKE_ISLAND_RADIUS

   repeat
		if get_dist(NAVPOINT_HQ, Goo_player) < HQ_DELIVER_DISTANCE then
			Goo_delivered = true
		end
		delay(0.25)
	until Goo_delivered

   -- Stop the players' vehicles when they reach the HQ trigger
	if ( character_is_in_vehicle( LOCAL_PLAYER ) ) then
      player_controls_disable( LOCAL_PLAYER )
      vehicle_stop_do( LOCAL_PLAYER )
   end
   if ( coop_is_active() ) then
      if ( character_is_in_vehicle( REMOTE_PLAYER ) ) then
         player_controls_disable( REMOTE_PLAYER )
         vehicle_stop_do( REMOTE_PLAYER )
      end
   end

	marker_remove_navpoint(NAVPOINT_HQ)
	waypoint_remove( SYNC_ALL )
	
	delay(1)
	mission_end_success(CURRENT_MISSION, CUTSCENE_OUT)
end

function bh03_clean_up_alarm_and_sunrise_timer()
   bh03_set_guards_detection_callback( "" )

   hud_timer_stop( HUD_COMPLETE_MISSION_IN_TIME_INDEX )

   if ( Thread_time_running_out ~= INVALID_THREAD_HANDLE ) then
      thread_kill( Thread_time_running_out )
      Thread_time_running_out = INVALID_THREAD_HANDLE
   end
end

function bh03_delay_until_initial_defenders_cleared_and_all_players_reached_pad()
   repeat
      thread_yield()
   until ( Helipad_initial_defenders_cleared and All_players_reached_pad )
end

function bh03_set_vehicle_interaction_allowed( allowed )
   set_player_can_enter_exit_vehicles( LOCAL_PLAYER, allowed )
   if ( coop_is_active() ) then
      set_player_can_enter_exit_vehicles( REMOTE_PLAYER, allowed )
   end
end

function bh03_helicopter_arrive()
   hud_timer_stop( HUD_HELICOPTER_ARRIVE_INDEX )
   --hud_timer_hide( HUD_COMPLETE_MISSION_IN_TIME_INDEX, false )
   hud_timer_pause( HUD_COMPLETE_MISSION_IN_TIME_INDEX, true )
   Wave_spawning_enabled = false

   group_show( FAUX_ESCAPE_HELICOPTER_GROUP )
   group_show( ESCAPE_HELI_PASSENGERS_GROUP )

   if ( Faux_escape_helicopter_seated == false ) then
      vehicle_enter_group_teleport( ESCAPE_HELICOPTER_PASSENGERS, FAUX_ESCAPE_HELICOPTER )
      Faux_escape_helicopter_seated = true
   end

   -- Place it
   teleport_vehicle( FAUX_ESCAPE_HELICOPTER, HELI_LAND_START )

   set_unjackable_flag( FAUX_ESCAPE_HELICOPTER, true )

   -- Let the player know the helicopter's flying in
   -- thread_new( "bh03_incoming_call", CARLOS_LANDING_NOW_LINE_CALL )

   -- Fly in for a landing
   helicopter_fly_to_direct( FAUX_ESCAPE_HELICOPTER, HELICOPTER_LAND_SPEED_MPS, HELI_LAND_PATH )

   -- Set jitter on helicopters to almost nothing so that this helicopter seems to be actually hovering
   helicopters_set_jitter_override( 0.1, 0.05 )

   audio_play( CARLOS_LANDED_LINE, "voice", true )

   mission_help_table( HT_BOARD_HELICOPTER )
   delay( 3.0 )

   Helicopter_has_arrived = true
end

-- Tracking function for first helipad defenders.
--
-- Possibly: Removes markers, update HUD, and
-- advance to the next mission state.
--
function bh03_helipad_initial_guard_killed( member_name )
   marker_remove_npc( member_name, SYNC_ALL )
   Initial_helipad_guards_remaining = Initial_helipad_guards_remaining - 1

   if ( All_players_reached_pad and bh03_all_players_near_helipad() ) then
      bh03_update_objective_display()
   end

   -- Let the player know that Carlos is almost there
   if ( Initial_helipad_guards_remaining == ( NUM_INITIAL_HELIPAD_GUARDS - 1 ) ) then
      thread_new( "bh03_incoming_call", CARLOS_ALMOST_TO_NUKE_PLANT_CALL )
   -- If a certain number remain, then do the flyby
   elseif ( Initial_helipad_guards_remaining == INITIAL_GUARDS_DO_FLYBY_THRESHOLD and
            All_players_reached_pad ) then
      bh03_do_flyby()
   -- If all the guards are dead, then mark the initial defenders as cleared
   elseif ( Initial_helipad_guards_remaining == 0 ) then
      Helipad_initial_defenders_cleared = true
      -- Clear the objective a few seconds after we complete it
      if ( All_players_reached_pad ) then
         delay( 3.0 )
         objective_text_clear( 0 )
      end
   end
end

Current_call_received = false

function bh03_current_call_received()
   mission_debug( "current call received!" )
   Current_call_received = true
end

function bh03_incoming_call( which_call )
   mission_debug( "call made" )
   cellphone_clear_between_call_delay()
   Current_call_received = false

   mid_mission_phonecall( "bh03_current_call_received" )
   local incoming_call_thread = thread_new( "bh03_do_incoming_call", which_call )

   delay( 20.0 )

   if ( Current_call_received == false ) then
      thread_kill( incoming_call_thread )
      mission_debug( "call killed!" )
      mid_mission_phonecall_reset()
   end
end

function bh03_do_incoming_call( which_call )
   mission_debug( "waiting on current call!" )
   repeat
      thread_yield()
   until Current_call_received

   mission_debug( "playing incoming call conversation" )
   audio_play_conversation( which_call, INCOMING_CALL )
   mission_debug( "incoming call conversation played" )
   mid_mission_phonecall_reset()
end

-- Displays the "LZ too hot" message when the escape helicopter hits
-- a trigger in the midst of its path
--
function bh03_heli_lz_too_hot_message( triggerer_name, trigger_name )
   if ( triggerer_name == CARLOS_NAME ) then
      trigger_enable( trigger_name, false )

      thread_new( "bh03_incoming_call", CARLOS_TOO_HOT_LINE_CALL )
   end
end

function bh03_carlos_died()
   mission_end_failure( CURRENT_MISSION, HT_CARLOS_DIED )
end

function bh03_carlos_abandoned()
   mission_end_failure( CURRENT_MISSION, HT_CARLOS_ABANDONED )
end

function bh03_heli_pilot_killed()
   mission_end_failure( CURRENT_MISSION, HT_PILOT_KILLED )
end

-- This function has the player's escape helicopter do a flyby of the 
-- helipad. The player is informed that the landing zone is too hot
-- and he's got to defend it before the helicopter can land.
--
function bh03_do_flyby()
   -- Show the group,
   group_show( FAUX_ESCAPE_HELICOPTER_GROUP )
   group_show( ESCAPE_HELI_PASSENGERS_GROUP ) 

   -- set up the helicopter
   on_vehicle_destroyed( "bh03_helicopter_destroyed", FAUX_ESCAPE_HELICOPTER )
   on_death( "bh03_heli_pilot_killed", ESCAPE_HELI_PILOT_NAME )
   vehicle_enter_group_teleport( ESCAPE_HELICOPTER_PASSENGERS, FAUX_ESCAPE_HELICOPTER )
   Faux_escape_helicopter_seated = true

   -- set up passengers
   on_death( "bh03_carlos_died", CARLOS_NAME )

   -- set up the "too hot" message
   trigger_enable( LZ_TOO_HOT_TRIGGER, true )
   on_trigger( "bh03_heli_lz_too_hot_message", LZ_TOO_HOT_TRIGGER )

   -- have it fly along the path
   teleport_vehicle( FAUX_ESCAPE_HELICOPTER, HELI_BUZZ_HELIPAD_START )
   helicopter_fly_to_direct( FAUX_ESCAPE_HELICOPTER, HELICOPTER_BUZZ_SPEED_MPS, HELI_BUZZ_HELIPAD_PATH )

   teleport_vehicle( FAUX_ESCAPE_HELICOPTER, FAUX_ESCAPE_HELICOPTER )
   group_hide( ESCAPE_HELI_PASSENGERS_GROUP )
   group_hide( FAUX_ESCAPE_HELICOPTER_GROUP )
end

function bh03_helicopter_damaged( name, attacker, percent_hp_left )
   local before_damage_percent = get_current_hit_points( ESCAPE_HELICOPTER ) / get_max_hit_points( ESCAPE_HELICOPTER )
   local percent_damaged = before_damage_percent - percent_hp_left

   Heli_percent_damage_since_last_complaint = Heli_percent_damage_since_last_complaint + percent_damaged
   if ( Heli_percent_damage_since_last_complaint >= PERCENT_OF_HELI_DAMAGE_BEFORE_COMPLAINT ) then
      repeat
         thread_yield()
      until ( Carlos_already_talking == false )
      Carlos_already_talking = true
      audio_play_for_character( CARLOS_HELI_DAMAGED_LINE, CARLOS_NAME )
      Heli_percent_damage_since_last_complaint = 0
      Carlos_already_talking = false
   end
end

function bh03_helicopter_destroyed()
   mission_end_failure( CURRENT_MISSION, HT_HELICOPTER_DESTROYED )
end

-- Sets up the helipad that the player needs to defend and guides
-- him there.
--
function bh03_setup_and_guide_to_helipad()
   -- Create the defenders, add death tracking
   group_create( HELIPAD_INITIAL_GUARDS_GROUP, true )
   for index, member_name in pairs( HELIPAD_INITIAL_GUARDS ) do
      on_death( "bh03_helipad_initial_guard_killed", member_name )
   end
   group_create_hidden( FAUX_ESCAPE_HELICOPTER_GROUP, true )
   group_create_hidden( ESCAPE_HELI_PASSENGERS_GROUP, true )
   group_create_hidden( ESCAPE_HELICOPTER_GROUP, true )

   -- Enable the helipad trigger and tracking for it
   trigger_enable( HELIPAD_AREA, true )
   on_trigger( "bh03_reached_helipad_initial", HELIPAD_AREA )
   on_trigger_exit( "bh03_left_helipad", HELIPAD_AREA )

   -- Guide the players to the helipad
   --minimap_icon_add_navpoint_radius( HELIPAD_AREA, MINIMAP_ICON_LOCATION, HELIPAD_AREA_RADIUS_METERS, "", SYNC_ALL )
   marker_add_navpoint( HELIPAD_AREA, MINIMAP_ICON_LOCATION, "", SYNC_ALL )
   waypoint_add( HELIPAD_AREA, SYNC_ALL )
   mission_help_table( HT_GET_TO_HELIPAD, SYNC_ALL )
end

-- Updates the HUD objective display for the number of helipad guards remaining
--
function bh03_update_objective_display()
   objective_text( 0, HT_X_OF_Y_GUARDS_KILLED, NUM_INITIAL_HELIPAD_GUARDS - Initial_helipad_guards_remaining,
                   NUM_INITIAL_HELIPAD_GUARDS, SYNC_ALL )
end

function bh03_reached_helipad_initial( triggerer_name )
   Players_near_helipad[triggerer_name] = true

   waypoint_remove( SYNC_ALL )

   local sync_type = sync_from_player( triggerer_name )
   marker_remove_navpoint( HELIPAD_AREA, sync_type )
   if ( bh03_all_players_near_helipad() ) then
      -- If any attackers remain, then marker them and prompt the player(s) to
      -- kill them
      All_players_reached_pad = true
      if ( Initial_helipad_guards_remaining > 0 ) then
         mission_help_table( HT_CLEAR_OUT_HELIPAD_GUARDS )
         bh03_update_objective_display()
         for index, member_name in pairs( HELIPAD_INITIAL_GUARDS ) do
            if ( character_is_dead( member_name ) == false ) then
               marker_add_npc( member_name, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL )
            end
         end
      -- Otherwise, advance to the "attack" state
      else
         Helipad_initial_defenders_cleared = true
      end
      -- In any case, rebind this function to the non-initial state
      on_trigger( "bh03_reached_helipad", HELIPAD_AREA )
   end
end

function bh03_reached_helipad( triggerer_name )
   Players_near_helipad[triggerer_name] = true
   local sync_type = sync_from_player( triggerer_name )
   minimap_icon_remove_navpoint( HELIPAD_AREA, sync_type )

   -- If there was a failure timer running for
   -- this player, stop it
   if ( Player_failure_timers_threads[triggerer_name] ~= INVALID_THREAD_HANDLE ) then
      local sync_type = sync_from_player( triggerer_name )
      -- Stop the failure timer
      thread_kill( Player_failure_timers_threads[triggerer_name] )
      Player_failure_timers_threads[triggerer_name] = INVALID_THREAD_HANDLE
   end
end

function bh03_defend_helipad_fail_help_text_timer( sync_type )
   local cur_time_left_seconds = LEAVE_PAD_FAILURE_TIME_SECONDS

   repeat
      mission_help_table_nag( HT_RETURN_TO_HELIPADS_DEFENSE, cur_time_left_seconds, "", sync_type )
      delay( TIME_PER_RETURN_TO_DEFEND_UPDATE_SECONDS )
      cur_time_left_seconds = cur_time_left_seconds - TIME_PER_RETURN_TO_DEFEND_UPDATE_SECONDS
   until cur_time_left_seconds <= 0

   mission_end_failure( CURRENT_MISSION, HT_ABANDONED_HELIPAD )
end

function bh03_left_helipad( triggerer_name )
   Players_near_helipad[triggerer_name] = false
   local sync_type = sync_from_player( triggerer_name )
   minimap_icon_add_navpoint_radius( HELIPAD_AREA, MINIMAP_ICON_LOCATION, HELIPAD_AREA_RADIUS_METERS, "", sync_type )

   -- Possibly start out-of-range failure timer
   -- and prompt player
   if ( All_players_reached_pad == true ) then
      Player_failure_timers_threads[triggerer_name] = thread_new( "bh03_defend_helipad_fail_help_text_timer", sync_type )
   end
end


function bh03_all_players_near_helipad()
   if ( Players_near_helipad[LOCAL_PLAYER] ) then
      if ( coop_is_active() ) then
         if ( Players_near_helipad[REMOTE_PLAYER] ) then
            return true
         end
      else
         return true
      end
   end
   return false
end

function bh03_helipad_second_wave_attack()
   -- Choose a direction and spawn the attackers
   local wave_direction_index = rand_int( 1, HELIPAD_SECOND_WAVE_ATTACK_DIRECTION_COUNT )

   -- Attack from this direction
   thread_new( "bh03_wave_direction_create_and_attack", wave_direction_index )
end

function bh03_wave_direction_create_and_attack( wave_direction_index )
   local cur_group = HELIPAD_SECOND_WAVE_GROUPS[wave_direction_index]

   if ( cur_group == nil ) then
      mission_debug( "wave_direction_index = "..wave_direction_index..", cur_group = nil" )
      return
   end
   mission_debug(  "wave_direction_index = "..wave_direction_index..", cur_group = "..cur_group )

   -- Release the group from this direction if it's loaded
   if ( group_is_loaded( cur_group ) ) then
      release_to_world( cur_group )
   end

   -- (Re)create the group
   group_create( cur_group, true )

   -- Seat the people
   local cur_members = HELIPAD_SECOND_WAVE_MEMBERS[wave_direction_index]
   local cur_vehicle = HELIPAD_SECOND_WAVE_VEHICLES[wave_direction_index]
   vehicle_enter_group_teleport( cur_members, cur_vehicle )

   -- Add death tracking
   for index, member_name in pairs( cur_members ) do
      on_death( "bh03_second_wave_member_died_d"..wave_direction_index, member_name )
      Num_tracked_helipad_wave_attackers = Num_tracked_helipad_wave_attackers + 1
   end

   -- Have them go to the helipad
   vehicle_pathfind_to( cur_vehicle, HELIPAD_SECOND_WAVE_PATHS[wave_direction_index], true, true )

   -- Finally, have them attack the player(s)
   for index, member_name in pairs( cur_members ) do
      if ( character_is_released( member_name ) == false ) then
         thread_new( "bh03_officer_exit_car", member_name )
      end
   end

   release_to_world( cur_vehicle )
end

function bh03_officer_exit_car( officer_name )
   vehicle_exit( officer_name )
   attack_closest_player( officer_name )
end

function bh03_second_wave_member_died_d1( member_name )
   bh03_second_wave_member_died( member_name, 1 )
end
function bh03_second_wave_member_died_d2( member_name )
   bh03_second_wave_member_died( member_name, 2 )
end
function bh03_second_wave_member_died_d3( member_name )
   bh03_second_wave_member_died( member_name, 3 )
end

function bh03_second_wave_member_died( member_name, direction_index )
   Num_tracked_helipad_wave_attackers = Num_tracked_helipad_wave_attackers - 1
   release_to_world( member_name )

   -- If we should spawn a new group to attack
   if ( Num_tracked_helipad_wave_attackers == SPAWN_NEW_WAVE_THRESHOLD and
        Wave_spawning_enabled ) then
      -- Spawn attackers from another direction - exclude the current one
      for i = 0, HELIPAD_SECOND_WAVE_ATTACK_DIRECTION_COUNT do
         if ( i ~= direction_index ) then
            thread_new( "bh03_wave_direction_create_and_attack", i )
         end
      end
   end
end

function bh03_attacking_heli1_follow( triggerer_name, trigger_name )
   trigger_enable( trigger_name, false )
   bh03_attacking_heli_follow( 1 )
end
function bh03_attacking_heli2_follow( triggerer_name, trigger_name )
   trigger_enable( trigger_name, false )
   bh03_attacking_heli_follow( 2 )
end
function bh03_attacking_heli3_follow( triggerer_name, trigger_name )
   trigger_enable( trigger_name, false )
   bh03_attacking_heli_follow( 3 )
end

-- Function that immediately destroys a helicopter that's on fire.
-- Stops checking and ends when the player's helicopter crashes.
--
function bh03_immediately_destroy_on_fire_heli( heli_name, pilot_name )
   
   repeat
      local smoke, fire = vehicle_get_smoke_and_fire_state( heli_name )

      if ( fire ) then
         turn_vulnerable( pilot_name )
         vehicle_detonate( heli_name )
         break
      end

      thread_yield()
   until ( vehicle_is_destroyed( heli_name ) or Crash_complete )
   turn_vulnerable( pilot_name )
end

function bh03_attacking_heli_follow( heli_index )
   local cur_heli = ULTOR_HELIS[heli_index]

   turn_invulnerable( ULTOR_HELI_PILOTS[heli_index] )
   thread_new( "bh03_immediately_destroy_on_fire_heli", cur_heli, ULTOR_HELI_PILOTS[heli_index] )

   -- Teleport to the start location
   teleport_vehicle( cur_heli, ULTOR_HELI_START_POINTS[heli_index] )

   thread_new( "bh03_heli_gunner_attack", ULTOR_HELI_GUNNERS[heli_index], 7 )
   helicopter_fly_to_direct_follow( cur_heli, ULTOR_HELIS_CLOSING_SPEEDS_MPS[heli_index],
                                    ESCAPE_HELICOPTER, ULTOR_HELI_FOLLOW_PATHS[heli_index] )

   -- Have the helicopter attack if it's still alive at this point
   if ( vehicle_is_destroyed( cur_heli ) == false ) then
      local distance, player_name = get_dist_closest_player_to_object( cur_heli )
      vehicle_chase( cur_heli, player_name )
   end
end

function bh03_heli_gunner_attack( gunner_name, delay_seconds )
   delay( delay_seconds )

   attack_safe( gunner_name, LOCAL_PLAYER )
end

function bh03_heli1_slow_down()
   bh03_heli_slow_down( 1 )
end

function bh03_heli2_slow_down()
   bh03_heli_slow_down( 2 )
end

function bh03_heli_slow_down( heli_index )
   vehicle_speed_override( ULTOR_HELIS[heli_index], ULTOR_HELIS_FOLLOW_SPEEDS_MPS[heli_index] )
end

function bh03_helicopter_escape( resuming_from_checkpoint )
   if ( resuming_from_checkpoint == nil ) then
      resuming_from_checkpoint = false
   end

   if ( resuming_from_checkpoint == false ) then
      fade_out( 1 )
      player_controls_disable( LOCAL_PLAYER )
      if ( coop_is_active() ) then
         player_controls_disable( REMOTE_PLAYER )
      end
      Controls_disabled = true
		fade_out_block()
	end -- else
	-- If we're resuming from a checkpoint, the screen has already been faded out and the
   -- player controls have been disabled. This is basically a mission start function in
   -- this case

	spawning_vehicles( false )
	spawning_pedestrians( false, true )
	
	if ( resuming_from_checkpoint ) then
		script_profiler_start_section( "checkpoint: evacuating from vehicles" )
	end

	if ( resuming_from_checkpoint == false ) then
		character_evacuate_from_all_vehicles( LOCAL_PLAYER )
		if ( coop_is_active() ) then
			character_evacuate_from_all_vehicles( REMOTE_PLAYER )
		end
	end

	if ( resuming_from_checkpoint ) then
		script_profiler_end_section( "checkpoint: evacuating from vehicles" )
	end

	if ( resuming_from_checkpoint ) then
		script_profiler_start_section( "checkpoint: blocking on player weapons" )
	end

	if ( resuming_from_checkpoint == false ) then
		-- Give the players the heli weapons here also
		bh03_give_and_equip_player_heli_weapons()
	end
	thread_new( "bh03_equip_player_heli_weapons" )

	if ( resuming_from_checkpoint ) then
		script_profiler_end_section( "checkpoint: blocking on player weapons" )
	end

   if ( resuming_from_checkpoint == false ) then
      -- Disable the "abandoned helipad" trigger and failure conditions
      trigger_enable( HELIPAD_AREA, false )
      if ( Player_failure_timers_threads[LOCAL_PLAYER] ~= INVALID_THREAD_HANDLE ) then
         thread_kill( Player_failure_timers_threads[LOCAL_PLAYER] )
         Player_failure_timers_threads[LOCAL_PLAYER] = INVALID_THREAD_HANDLE
      end
      if ( Player_failure_timers_threads[REMOTE_PLAYER] ~= INVALID_THREAD_HANDLE ) then
         thread_kill( Player_failure_timers_threads[REMOTE_PLAYER] )
         Player_failure_timers_threads[REMOTE_PLAYER] = INVALID_THREAD_HANDLE
      end
      minimap_icon_remove_navpoint( HELIPAD_AREA, SYNC_ALL )

      -- Return helicopter jitter to the default.
      helicopters_set_jitter_override()

      on_vehicle_destroyed( "", FAUX_ESCAPE_HELICOPTER )
		group_hide( FAUX_ESCAPE_HELICOPTER_GROUP )
		group_destroy( FAUX_ESCAPE_HELICOPTER_GROUP )
   end


	if ( resuming_from_checkpoint ) then
		script_profiler_start_section( "checkpoint: showing groups" )
	end

   -- Show the real escape helicopter, the pilot, and Carlos
   group_show( ESCAPE_HELICOPTER_GROUP )
   group_show( ESCAPE_HELI_PASSENGERS_GROUP )

	if ( resuming_from_checkpoint ) then
		script_profiler_end_section( "checkpoint: showing groups" )
	end

	if ( resuming_from_checkpoint == false ) then
		mission_set_checkpoint( CHECKPOINT_HELICOPTER_ESCAPE )
	end
   party_dismiss_all()

	if ( resuming_from_checkpoint ) then
		script_profiler_start_section( "checkpoint: teleport coop" )
	end
	teleport_coop( NEAR_HELI_CHECKPOINT_WARPS[LOCAL_PLAYER], NEAR_HELI_CHECKPOINT_WARPS[REMOTE_PLAYER], true )
	if ( resuming_from_checkpoint ) then
		script_profiler_end_section( "checkpoint: teleport coop" )
	end

	if ( resuming_from_checkpoint ) then
		script_profiler_start_section( "checkpoint: block on distance" )
	end
	delay( 2.0 )
	if ( resuming_from_checkpoint ) then
		script_profiler_end_section( "checkpoint: block on distance" )
	end
	if ( resuming_from_checkpoint ) then
		script_profiler_start_section( "checkpoint: teleporting passengers" )
	end
	for index, name in pairs( ESCAPE_HELICOPTER_PASSENGERS ) do
		teleport( name, PASSENGERS_NEAR_HELI_WARPS[index], true )
	end
	if ( resuming_from_checkpoint ) then
		script_profiler_end_section( "checkpoint: teleporting passengers" )
	end
	if ( resuming_from_checkpoint ) then
		script_profiler_start_section( "checkpoint: enter helicopter" )
	end
	-- players...
	vehicle_enter_teleport( LOCAL_PLAYER, ESCAPE_HELICOPTER, 2 )
	if ( coop_is_active() ) then
		vehicle_enter_teleport( REMOTE_PLAYER, ESCAPE_HELICOPTER, 3 )
	end
	if ( resuming_from_checkpoint ) then
		script_profiler_end_section( "checkpoint: enter helicopter" )
	end

	if ( resuming_from_checkpoint ) then
		script_profiler_end_section( "checkpoint: seating players" )
		script_profiler_start_section( "checkpoint: misc" )
	end

   -- Turn the driver invulnerable to prevent him from being killed and taking the helicopter down
   turn_invulnerable( ESCAPE_HELI_PILOT_NAME )
	npc_suppress_persona( ESCAPE_HELI_PILOT_NAME, true )

   -- Don't let the player recruit the pilot.
   set_unrecruitable_flag( ESCAPE_HELI_PILOT_NAME, true )

	if ( resuming_from_checkpoint ) then
		script_profiler_start_section( "checkpoint: vehicle teleport etc" )
	end

   -- Now, put the helicopter in the correct location
   teleport_vehicle( ESCAPE_HELICOPTER, REAL_HELI_START )
   -- Failure tracking
   on_vehicle_destroyed( "bh03_helicopter_destroyed", ESCAPE_HELICOPTER )
   -- Used to have Carlos possibly complain about the helicopter's state
   on_take_damage( "bh03_helicopter_damaged", ESCAPE_HELICOPTER )
   -- We don't want to be knocked off our path
   vehicle_prevent_explosion_fling( ESCAPE_HELICOPTER, true )
   vehicle_infinite_mass( ESCAPE_HELICOPTER, true )

	if ( resuming_from_checkpoint ) then
		script_profiler_end_section( "checkpoint: vehicle teleport etc" )
	end

   bh03_set_vehicle_interaction_allowed( false )

   -- Enable the triggers that will spawn the attacking helicopters
   for index, trigger_name in pairs( ULTOR_HELI_FOLLOW_TRIGGERS ) do
      trigger_enable( trigger_name, true )
      on_trigger( "bh03_attacking_heli"..index.."_follow", trigger_name )
		trigger_enable( TRIGGER_SHOOTERS, true )
		on_trigger( "bh03_start_shooters", TRIGGER_SHOOTERS )
		trigger_enable( TRIGGER_BOAT_CHASE, true )
		on_trigger( "bh03_start_chase_boats", TRIGGER_BOAT_CHASE )
   end

   trigger_enable( HELI_IN_TROUBLE_TRIGGER, true )
   on_trigger( "bh03_helicopter_alarm_smoke_and_shake", HELI_IN_TROUBLE_TRIGGER )

   trigger_enable( HELI_GOING_DOWN_TRIGGER, true )
   on_trigger( "bh03_helicopter_going_down", HELI_GOING_DOWN_TRIGGER )

   trigger_enable( HELI_EJECTION_TRIGGER, true )
   on_trigger( "bh03_helicopter_ejection_and_crash", HELI_EJECTION_TRIGGER )

   objective_text_clear( SYNC_ALL )
   mission_help_clear()

	group_create_hidden( "bh03_$explode_heli" )

   if ( resuming_from_checkpoint ) then
		script_profiler_end_section( "checkpoint: misc" )
		script_profiler_do_printout()
      mission_start_fade_in()
      
      hud_timer_set( HUD_COMPLETE_MISSION_IN_TIME_INDEX, MISSION_END_FAILURE_AFTER_FINAL_CHECKPOINT_MS, "bh03_mission_failure_timeout" )
      hud_timer_hide( HUD_COMPLETE_MISSION_IN_TIME_INDEX, true )
      hud_timer_pause( HUD_COMPLETE_MISSION_IN_TIME_INDEX, true )
		Thread_time_running_out = thread_new( "bh03_time_out_warning", MISSION_END_WARNING_AFTER_FINAL_CHECKPOINT_MS );
   else
      player_controls_enable( LOCAL_PLAYER )
      if ( coop_is_active() ) then
         player_controls_enable( REMOTE_PLAYER )
      end
      Controls_disabled = false
      fade_in( 1 )
      fade_in_block()
   end

	spawning_vehicles( true )
	spawning_pedestrians( true )

	-- Spawn threads for each entry
	local vehicle_enter_threads = {}

	-- Put the passengers in the helicopter
	for index, name in pairs( ESCAPE_HELICOPTER_PASSENGERS ) do
		vehicle_enter_threads[name] = thread_new( "bh03_seat_character", name, ESCAPE_HELICOPTER, index - 1 )
	end

   -- Setup the helicopters that will attack the player on the way
   for index, group_name in pairs( ULTOR_ATTACKING_HELICOPTER_GROUPS ) do
      group_show( group_name )
		vehicle_enter_threads[ULTOR_HELI_PILOTS[index]] = thread_new( "bh03_seat_character", ULTOR_HELI_PILOTS[index], ULTOR_HELIS[index], ULTOR_HELI_PILOT_SEAT )
		vehicle_enter_threads[ULTOR_HELI_GUNNERS[index]] = thread_new( "bh03_seat_character", ULTOR_HELI_GUNNERS[index], ULTOR_HELIS[index], ULTOR_HELI_GUNNER_SEAT )
   end

	-- Keep looping until all the entry threads have finished
	local all_entry_threads_complete = false
	repeat
		all_entry_threads_complete = true

		for index, name in pairs( ESCAPE_HELICOPTER_PASSENGERS ) do
			if ( thread_check_done( vehicle_enter_threads[name] ) == false ) then
				all_entry_threads_complete = false
			end
		end

		for index, group_name in pairs( ULTOR_ATTACKING_HELICOPTER_GROUPS ) do
			if ( thread_check_done( vehicle_enter_threads[ULTOR_HELI_PILOTS[index]] ) == false or
				  thread_check_done( vehicle_enter_threads[ULTOR_HELI_GUNNERS[index]] ) == false ) then
				all_entry_threads_complete = false
			end
		end
		thread_yield()
	until all_entry_threads_complete

   thread_new( "bh03_helicopter_conversations" )

   thread_new( "bh03_helicopter_fly_crash_path" )

   mission_help_table("bh03_deliver_goo")
end

function bh03_seat_character( character_name, vehicle_name, seat_index )
	vehicle_enter_teleport( character_name, vehicle_name, seat_index)
end

function bh03_start_chase_boats()
	group_create(GROUP_POLICE_BOATS, true)
	delay(1)
	vehicle_enter_teleport(BOAT01_DRIVER, BOAT01_BOAT, 0)
   vehicle_enter_teleport(BOAT01_PASSENGER, BOAT01_BOAT, 1)
	vehicle_enter_teleport(BOAT02_DRIVER, BOAT02_BOAT, 0)
   vehicle_enter_teleport(BOAT02_PASSENGER, BOAT02_BOAT, 1)
	set_max_hit_points(BOAT01_BOAT, get_max_hit_points(BOAT01_BOAT) * BOAT_HEALTH_MULTIPLIER, true)
	set_max_hit_points(BOAT02_BOAT, get_max_hit_points(BOAT02_BOAT) * BOAT_HEALTH_MULTIPLIER, true)
	vehicle_lights_on(BOAT01_BOAT, true)
	-- vehicle_set_sirens(BOAT01_BOAT, true)
	vehicle_lights_on(BOAT02_BOAT, true)
	-- vehicle_set_sirens(BOAT02_BOAT, true)
	thread_new( "bh03_boat_pathfind02" )
	thread_new( "bh03_boat_pathfind01" )
end

function bh03_boat_pathfind01()
	delay(1)
	vehicle_speed_override(BOAT01_BOAT, BOATS_SPEED)
	vehicle_pathfind_to( BOAT01_BOAT, BOAT01_PATH, true, false)
end

function bh03_boat_pathfind02()
	delay(2)
	vehicle_speed_override(BOAT02_BOAT, BOATS_SPEED)
	vehicle_pathfind_to( BOAT02_BOAT, BOAT02_PATH, true, false)
end

function bh03_start_shooters()
	group_create(GROUP_POLICE_SHOOTERS, true)
	delay(1)
	attack(POLICE_SHOOTER01, LOCAL_PLAYER, false)
	attack(POLICE_SHOOTER02, LOCAL_PLAYER, false)
	attack(POLICE_SHOOTER03, LOCAL_PLAYER, false)
end

function bh03_helicopter_fly_crash_path()
   -- Have the helicopter fly to its next goal
   helicopter_fly_to_direct( ESCAPE_HELICOPTER, HELICOPTER_RAIL_SPEED_MPS, HELI_BACK_TO_STILWATER_AND_CRASH_PATH )
	-- we're off the ground we can now reenable ambient police
	spawning_allow_cop_ambient_spawns( true ) 
	roadblocks_enable( true )
end

function bh03_helicopter_conversations()
   delay( 2.0 )
   audio_play_conversation( AFTER_ENTER_HELI_DIALOG_STREAM, NOT_CALL )

   bh03_carlos_and_pilot_complain()
end

function bh03_carlos_and_pilot_complain()
   for i = 1, NUM_PILOT_AND_CARLOS_COMPLAIN_CONVERSATIONS do
      delay( rand_float( 15.0, 17.5 ) )

      repeat
         thread_yield()
      until ( Carlos_already_talking == false )
      Carlos_already_talking = true
      audio_play_for_character( PILOT_COMPLAIN_LINES[i], ESCAPE_HELI_PILOT_NAME, "voice", false, true )
      audio_play_for_character( CARLOS_COMPLAIN_TO_PILOT_LINES[i], CARLOS_NAME, "voice", false, true )
      Carlos_already_talking = false
   end
end

function bh03_helicopter_alarm_smoke_and_shake( triggerer_name, trigger_name )
   trigger_enable( trigger_name, false )

   local max_hp = get_max_hit_points( ESCAPE_HELICOPTER )

   set_current_hit_points( ESCAPE_HELICOPTER, max_hp * 0.2 )
   turn_invulnerable( ESCAPE_HELICOPTER )

   -- smoke = true, fire = false
   vehicle_set_smoke_and_fire_state( ESCAPE_HELICOPTER, true, false )

   delay( 1.0 )

   camera_shake_start( 0.00015, 14000, 14000, 0.003 )
end

function bh03_helicopter_going_down( triggerer_name, trigger_name )
   trigger_enable( trigger_name, false )

   -- Let the player know of the badness
   audio_play( HELI_GOING_DOWN_LINE, "voice", true )
end

function bh03_helicopter_ejection_and_crash( triggerer_name, trigger_name )
   trigger_enable( trigger_name, false )
   -- No more failure on pilot death - the escape flight is ended
   on_death( "", ESCAPE_HELI_PILOT_NAME )
   turn_vulnerable( ESCAPE_HELI_PILOT_NAME )

   vehicle_exit_dive( CARLOS_NAME )
   turn_invulnerable( CARLOS_NAME )
   -- Throw the players in random directions so it seems they were blown out of the helicopter
   if ( coop_is_active() ) then
      turn_invulnerable( REMOTE_PLAYER )
      vehicle_exit_dive( REMOTE_PLAYER )
   end
   turn_invulnerable( LOCAL_PLAYER )
   vehicle_exit_dive( LOCAL_PLAYER )

   vehicle_exit_teleport( ESCAPE_HELI_PILOT_NAME )

   if ( coop_is_active() ) then
      character_ragdoll( REMOTE_PLAYER, 5000 )
   end
   character_ragdoll( LOCAL_PLAYER, 5000 )
   character_ragdoll( CARLOS_NAME, 4000 )

   on_vehicle_destroyed( "", ESCAPE_HELICOPTER )
   on_take_damage( "", ESCAPE_HELICOPTER )
	thread_yield()
	group_hide( ESCAPE_HELICOPTER_GROUP )
	group_destroy( ESCAPE_HELICOPTER_GROUP )
	group_destroy( GROUP_POLICE_BOATS )

	group_show( "bh03_$explode_heli" )
	thread_yield()
   vehicle_enter_teleport( ESCAPE_HELI_PILOT_NAME, "bh03_$explode_heli", 0 )
	thread_yield()
	vehicle_detonate( "bh03_$explode_heli" )

   inv_weapon_enable_or_disable_all_slots( true )
   inv_weapon_remove_temporary( LOCAL_PLAYER, SAW_NAME )
   if ( coop_is_active() ) then
      inv_weapon_remove_temporary( REMOTE_PLAYER, SAW_NAME ) 
   end
	Players_have_heli_weapons = false

   --mission_help_table_nag( HT_GET_CLEAR_OF_HELI )

   party_add( CARLOS_NAME, LOCAL_PLAYER )
   on_death( "bh03_carlos_died", CARLOS_NAME )
   for index, override in pairs( CARLOS_PERSONA_OVERRIDES ) do
      persona_override_character_start( CARLOS_NAME, override[1], override[2] )
   end
   on_dismiss( "bh03_carlos_abandoned", CARLOS_NAME )
   bh03_set_vehicle_interaction_allowed( true )
   Crash_complete = true

   -- Now, make the players vulnerable again. Give them a few seconds to recover,
   -- and make sure they're up and about
   thread_new( "bh03_turn_human_vulnerable", LOCAL_PLAYER )
   if ( coop_is_active() ) then
      thread_new( "bh03_turn_human_vulnerable", REMOTE_PLAYER )
   end

   thread_new( "bh03_turn_human_vulnerable", CARLOS_NAME )

   hud_timer_pause( HUD_COMPLETE_MISSION_IN_TIME_INDEX, false )   
   hud_timer_hide( HUD_COMPLETE_MISSION_IN_TIME_INDEX, false )
end

function bh03_turn_human_vulnerable( human_name )
   repeat
      thread_yield()
   until ( character_is_ready( human_name )  )
   turn_vulnerable( human_name )
end

function bh03_security_watch()
	local time_since_alert = 0
	local first_alert = true
	while(1) do
		thread_yield()
		time_since_alert = time_since_alert + get_frame_time()
		if Seen_by_security and (first_alert or ((time_since_alert >= 20) and ((player_far_from_security()) or (player_removed_notoriety())))) then
         local sync_type = sync_from_player( Last_player_seen )

			notoriety_set(NUKE_SECURITY, MISSION_MAX_NOTORIETY)
				if ( coop_is_active() ) then
					notoriety_set(NUKE_SECURITY, MISSION_MAX_NOTORIETY_COOP)
				end
			-- Only show the message once for each player than sets off the alarm
			if ( Alarm_message_shown[Last_player_seen] == false ) then
				mission_help_table_nag( "bh03_seen_by_guard", "", "", sync_type )
				Alarm_message_shown[Last_player_seen] = true
			end
			Seen_by_security = false
			Gotten_away_from_security = false
			Gotten_notoriety_down = false
			time_since_alert = 0
			if first_alert then
				first_alert = false
			end
		end
	end
end

function player_removed_notoriety()
	if Gotten_notoriety_down then
		return true
	end

	if notoriety_get(NUKE_SECURITY) == 0 then
		Gotten_notoriety_down = true
	end

	return Gotten_notoriety_down
end

function player_far_from_security()
	if Gotten_away_from_security then
		return true
	end

	if ( coop_is_active() ) then
		for i, npc in pairs(NUKE_GUARDS) do
			if (get_dist(LOCAL_PLAYER, npc) < SECURITY_ESCAPED_DIST) or (get_dist(REMOTE_PLAYER, npc) < SECURITY_ESCAPED_DIST) then
				return false
			end
		end
		Gotten_away_from_security = true
		return true
	else
		for i, npc in pairs(NUKE_GUARDS) do
			if get_dist(LOCAL_PLAYER, npc) < SECURITY_ESCAPED_DIST then
				return false
			end
		end
		Gotten_away_from_security = true
		return true
	end
end

function bh03_mission_failure_timeout()
   mission_end_failure( CURRENT_MISSION, "bh03_failure_out_of_time" ) 
end

function bh03_time_out_warning( time_ms )
   delay( time_ms / 1000 )
   mission_debug( "time out warning delay over." )
   mission_help_table_nag("bh03_one_hour_left")
end

function buy_geiger_counter(player)
	on_trigger("", WEAPON_STORE)
	trigger_enable(WEAPON_STORE, false)
	trigger_type_enable("weapon store", true)
	trigger_enable(WEAPON_STORE_ORIG, true)
   ingame_effect_add_trigger(WEAPON_STORE_ORIG, WEAPON_STORE_EFFECT, SYNC_ALL)
	Geiger_player = player
	inv_weapon_add_temporary(Geiger_player, WEAPON_GEIGER_COUNTER, 1, true )
   inv_item_equip(WEAPON_GEIGER_COUNTER, Geiger_player)
end

Officers_see_player = false

function bh03_remove_nuke_island_vehicles_markers()
	marker_remove_vehicle(MP.."boat_spawn1", SYNC_ALL)
end

function bh03_remove_vehicle_enter_callbacks()
   on_vehicle_enter("", MP.."boat_spawn1")

   on_vehicle_enter( "", LOCAL_PLAYER )
   if ( coop_is_active() ) then
      on_vehicle_enter( "", REMOTE_PLAYER )
   end
end

function bh03_player_entered_vehicle( player_name )
   local vehicle_type = get_char_vehicle_type( player_name )

   -- Let the player know that a helicopter will blow his cover
   if ( vehicle_type == VT_HELICOPTER ) then
      mission_help_table_nag( HT_HELI_BLOW_COVER_WARNING )
   end

  waypoint_remove( SYNC_ALL )

	if ( vehicle_type == VT_HELICOPTER or
		  vehicle_type == VT_AIRPLANE or
		  vehicle_type == VT_WATERCRAFT ) then
      bh03_remove_vehicle_enter_callbacks()
      release_to_world( GROUP_EXTRA_BOATS )
	end
end

function bh03_nuke_patrol_01(vehicle, officer1, officer2)
	local	i = 1
	local	path_success = true

	on_detection("bh03_seen_player", officer1)
	on_detection("bh03_seen_player", officer2)

	-- Drive this path until the character attacks or is dead
	while (not Officers_see_player and path_success) do
		path_success = vehicle_pathfind_to(vehicle, NUKE_PATROL_ROUTE01[i], false, false)
		i = i + 1
		if (i > NUM_NUKE_PATROL01) then
			i = 1
		end
	end

	on_detection("", officer1)
	on_detection("", officer2)
	
--	thread_new("bh03_nuke_patrol_01", vehicle, officer1, officer2)
end

function bh03_seen_player()
	Officers_see_player = true
	notoriety_set(NUKE_SECURITY, MISSION_MAX_NOTORIETY)
	if ( coop_is_active() ) then
		notoriety_set(NUKE_SECURITY, MISSION_MAX_NOTORIETY_COOP)
	end
end

function bh03_play_alarms()
   local	outside_audio_id, outside_type = audio_get_id("SFX_BRO_PLANT_ALARM_OUT", "foley")
   local	inside_audio_id, inside_type = audio_get_id("SFX_BRO_PLANT_ALARM_IN", "foley")

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

function bh03_stop_alarms()
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

-- Called when the player is seen. Can be called if the player
-- comes to the island in a helicopter.
--
-- guard_name: Name of the guard that saw the player. May be nil.
-- player_name: Name of the player that was seen.
--
function bh03_seen_by_guard( guard_name, player_name )
	Seen_by_security = true
   Last_player_seen = player_name
   if ( Alarm_triggered == false ) then
		Alarm_triggered = true
      bh03_play_alarms()
   end
end

function bh03_geiger_message_loop()
	local sync = sync_from_player(Geiger_player)
	repeat
		if not inv_item_is_equipped(WEAPON_GEIGER_COUNTER, Geiger_player) then
			bh03_stop_all_geiger_sounds()
			delay(20)
			mission_help_table("bh03_use_geiger", sync)
		else
			thread_yield()
		end
	until false
end

function bh03_geiger_hud_loop()
	local sync = sync_from_player(Geiger_player)
	repeat
		thread_yield()
		if inv_item_is_equipped(WEAPON_GEIGER_COUNTER, Geiger_player) then
			local dist = get_dist(Geiger_player, Goo_item)
			local ratio = 0
			if dist < GEIGER_MAX_DISTANCE then
				if dist < GEIGER_MIN_DISTANCE then
					ratio = 1
				else
					ratio = 1 - (dist - GEIGER_MIN_DISTANCE) / (GEIGER_MAX_DISTANCE - GEIGER_MIN_DISTANCE)
				end
			end

			if Geiger_bar_off then
				hud_bar_on(0, "Radioactivity", "bh03_radioactivity", 1.0, sync)
				hud_bar_set_range(0, 0.0, 1.0, SYNC_ALL)
				Geiger_bar_off = false
			end

			local noise_level = (ratio * 0.04) + 0.01
			local noisy_ratio = ratio + rand_float(0-noise_level, noise_level)
			if noisy_ratio < 0 then
				noisy_ratio = 0
			elseif noisy_ratio > 1.0 then
				noisy_ratio = 1.0
			end
			hud_bar_set_value(0, noisy_ratio, sync)
		else
			bh03_stop_all_geiger_sounds()
			hud_bar_off(0)
			Geiger_bar_off = true
		end
	until false
end

function bh03_geiger_loop()
	local sync = sync_from_player(Geiger_player)
	local equipped = false
	repeat
		thread_yield()
		if inv_item_is_equipped(WEAPON_GEIGER_COUNTER, Geiger_player) then
			if not equipped then
				audio_play_for_character_weapon(GEIGER_ON, Geiger_player)
			end
			equipped = true
			local dist = get_dist(Geiger_player, Goo_item)
			local ratio = 0
			if dist < GEIGER_MAX_DISTANCE then
				if dist < GEIGER_MIN_DISTANCE then
					ratio = 1
				else
					ratio = 1 - (dist - GEIGER_MIN_DISTANCE) / (GEIGER_MAX_DISTANCE - GEIGER_MIN_DISTANCE)
				end
			end

			local delay_time = GEIGER_MIN_DELAY + (GEIGER_MAX_DELAY - GEIGER_MIN_DELAY) * (1 - ratio)
			character_set_combat_ready(Geiger_player, true, delay_time * 1000 + 200)

			bh03_geiger_audio(ratio)

			--local click = audio_play_for_character_weapon(GEIGER_CLICK, Geiger_player)
			feedback_start(GEIGER_FEEDBACK, GEIGER_MIN_FEEDBACK + ratio * (1 - GEIGER_MIN_FEEDBACK), false, sync)
			--delay(delay_time)
			--audio_stop(click)
		else
			thread_yield()
			bh03_stop_all_geiger_sounds()
			equipped = false
		end
	until false
end

function bh03_geiger_audio(ratio)
	local new_num_geiger_sounds

	if ratio < 0.2 then
		new_num_geiger_sounds = 1
	elseif ratio < 0.4 then
		new_num_geiger_sounds = 2
	elseif ratio < 0.6 then
		new_num_geiger_sounds = 3
	elseif ratio < 0.8 then
		new_num_geiger_sounds = 4
	else
		new_num_geiger_sounds = 5
	end

	for i, sound in pairs(Geiger_sound) do
		if i <= new_num_geiger_sounds then
			if sound == -1 then
				Geiger_sound[i] = audio_play_for_character_weapon(GEIGER_CLICK, Geiger_player)
				delay(rand_float(0,1))
			end
		else
			if sound ~= -1 then
				audio_stop(sound)
				Geiger_sound[i] = -1
			end
		end
	end
end

function bh03_stop_all_geiger_sounds()
	local was_equipped = false
	for i, sound in pairs(Geiger_sound) do
		if sound ~= -1 then
			audio_stop(sound)
			Geiger_sound[i] = -1
			was_equipped = true
		end
	end
	if was_equipped then
		audio_play_for_character_weapon(GEIGER_OFF, Geiger_player)
	end
end

function initialize_goo()
   -- Create the goo
	group_create(GROUP_GOO, true)

   -- Select a particular good item randomly
	Goo_index = rand_int(1, GOO_COUNT)
	Goo_item = GOO_PREFIX .. Goo_index
	Goo_trigger = GOO_TRIGGER_PREFIX .. Goo_index

   -- Go through and hide all other goo
	for i = 1, GOO_COUNT, 1 do
		local item = GOO_PREFIX .. i
		item_hide(item)
	end

   -- Show the selected good item and mark it with an effect ( not a minimap icon though )
	item_show(Goo_item)	
	ingame_effect_add_item(Goo_item, INGAME_EFFECT_PROTECT_ACQUIRE, SYNC_ALL)

   -- Add the trigger and picked-up-good tracking
	Goo_picked_up = false
	trigger_enable(Goo_trigger, true)
	ingame_effect_add_trigger(Goo_trigger, GOO_TRIGGER_EFFECT, SYNC_ALL)
	on_trigger("pickup_goo", Goo_trigger)

   -- Create the particular guards that guard this goo
	group_create(GROUP_GOO_GUARDS[Goo_index], true)
	for i, npc in pairs(GOO_GUARDS[Goo_index]) do
		wander_start(npc, npc, 15.0)
		on_detection("bh03_seen_by_guard", npc)
	end

	NAVPOINT_NUKE_ISLAND = GOO_LOCATION_MAP[Goo_index]
end

function pickup_goo(player)
	bh03_stop_all_geiger_sounds()
	local sync = sync_from_player(Geiger_player)
	hud_bar_off(0)
	inv_weapon_remove_temporary(Geiger_player, WEAPON_GEIGER_COUNTER)
	thread_kill(Thread_geiger)
	thread_kill(Thread_geiger_hud)
	thread_kill(Thread_geiger_message)
	
	marker_remove_item(Goo_item)
	trigger_enable(Goo_trigger, false)
	on_trigger("", Goo_trigger)

	crouch_start(player)
	delay(1)
	action_play(player, ACTION_PICKUP_ITEM)
	for i = 1, GOO_COUNT, 1 do
		local item = GOO_PREFIX .. i
		object_destroy(item)
	end
	--object_destroy(Goo_item)
	Goo_picked_up = true
	crouch_stop(player)

   Goo_player = player

   -- The cop lines don't necessarily make sense until you've picked up the nuclear waste
   persona_override_group_start( COP_PERSONAS, POT_SITUATIONS[POT_ATTACK], "BR03_ATTACK" )
end

function bh03_cleanup()
	trigger_type_enable("store ownership", true)
	trigger_type_enable("weapon store", true)
	trigger_type_enable("crib weapons", true)
	if Geiger_player ~= "" then
		on_trigger("", WEAPON_STORE)
		trigger_enable(WEAPON_STORE_ORIG, true)
		trigger_enable(WEAPON_STORE, false)
		ingame_effect_add_trigger(WEAPON_STORE_ORIG, WEAPON_STORE_EFFECT, SYNC_ALL)
	end
   bh03_stop_all_geiger_sounds()
   bh03_remove_vehicle_enter_callbacks()

  	spawning_vehicles( true )
	spawning_pedestrians( true )

   hud_timer_stop( HUD_HELICOPTER_ARRIVE_INDEX )
   hud_timer_stop( HUD_COMPLETE_MISSION_IN_TIME_INDEX )
	hud_timer_hide( HUD_COMPLETE_MISSION_IN_TIME_INDEX, false )

	marker_remove_navpoint(NAVPOINT_WEAPON_STORE_OUTSIDE, SYNC_ALL)
   marker_remove_navpoint( NAVPOINT_HQ, SYNC_ALL )
	
	if Goo_trigger then
		trigger_enable(Goo_trigger, false)
	end
	
	inv_weapon_remove_temporary(Geiger_player, WEAPON_GEIGER_COUNTER)

	group_destroy(GROUP_GOO)

	if alarm_foley_local ~= -1 then
		audio_stop(alarm_foley_local)
	end
	if alarm_foley_remote ~= -1 then
		audio_stop(alarm_foley_remote)
	end

	notoriety_reset( "Brotherhood" )
	notoriety_reset( NUKE_SECURITY )
   notoriety_force_no_spawn( NUKE_SECURITY, false )
   notoriety_force_no_spawn( "Ultor", false )
   player_force_vehicle_seat( LOCAL_PLAYER, -1 )
   if ( coop_is_active() ) then
      player_force_vehicle_seat( REMOTE_PLAYER, -1 )
   end
   bh03_set_vehicle_interaction_allowed( true )
   -- Return helicopter jitter to the default.
   helicopters_set_jitter_override()

	if ( Players_have_heli_weapons ) then
		inv_weapon_remove_temporary( LOCAL_PLAYER, SAW_NAME )
		if ( coop_is_active() ) then
			inv_weapon_remove_temporary( REMOTE_PLAYER, SAW_NAME ) 
		end
	end
   inv_weapon_enable_or_disable_all_slots( true )
   
   persona_override_group_stop( COP_PERSONAS, POT_SITUATIONS[POT_ATTACK] )

--	notoriety_set_max( "Police", MAX_NOTORIETY_LEVEL )
--	notoriety_set_max( "Brotherhood", MAX_NOTORIETY_LEVEL )

	bh03_stop_alarms()

   mid_mission_phonecall_reset()

   if ( vehicle_exists( ESCAPE_HELICOPTER ) and vehicle_is_destroyed( ESCAPE_HELICOPTER ) == false ) then
      if ( character_is_in_vehicle( LOCAL_PLAYER, ESCAPE_HELICOPTER ) or
           character_is_in_vehicle( REMOTE_PLAYER, ESCAPE_HELICOPTER ) ) then
         group_destroy( ESCAPE_HELICOPTER_GROUP )

         if ( coop_is_active() ) then
            teleport( REMOTE_PLAYER, IN_HELI_TELEPORT_LOCATIONS[REMOTE_PLAYER], true )
         end
         teleport( LOCAL_PLAYER, IN_HELI_TELEPORT_LOCATIONS[LOCAL_PLAYER], true )
      end
   end

   if ( Controls_disabled ) then
      player_controls_enable( LOCAL_PLAYER )
      if ( coop_is_active() ) then
         player_controls_enable( REMOTE_PLAYER )
      end
   end

   turn_vulnerable( LOCAL_PLAYER )
   if ( coop_is_active() ) then
      turn_vulnerable( REMOTE_PLAYER )
   end
   mission_cleanup_maybe_reenable_player_controls()
   parking_spot_enable( HELICOPTER_PARKING_SPAWN, true )
	if ( vehicle_exists( END_COURTESY_CAR ) ) then
		release_to_world(END_COURTESY_CAR)
	end
end

function bh03_success()
end
