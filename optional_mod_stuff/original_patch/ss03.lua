-- ss03.lua
-- SR2 mission script
-- 3/28/07
-- Mission help table text tags
   HT_DESTROY_FARM_EQUIPMENT = "ss03_destroy_equipment"
   HT_ELIMINATE_LIEUTENANTS = "ss03_eliminate_lieutenants"
   HT_HELICOPTER_DESTROYED = "ss03_players_helicopter_destroyed"
   HT_X_OF_Y_LIEUTENANTS = "ss03_x_of_y_lieutenants"
   HT_X_OF_Y_TARGETS = "ss03_x_of_y_targets"
   HT_CHEM_TANK_DESTROYED = "ss03_chem_tank_destroyed"
   HT_CHEM_DEPOT_DESTROYED = "ss03_chem_depot_destroyed"
   HT_FUEL_TRUCK_DESTROYED = "ss03_fuel_truck_destroyed"
   HT_FERTILIZER_TRUCK_DESTROYED = "ss03_fertilizer_truck_destroyed"

-- Mission states
   MS_INIT = 1
   MS_REACHED_FARM = 2
   MS_FARM_DESTROYED = 4
   MS_BEGIN_CHASE = 5

-- Cutscene names

-- Groups, NPCs, vehicles, navpoints, and other names
   -- Mission constant names
   MISSION_NAME = "ss03"
   ENEMY_GANG = "Samedi"
   -- ( Mission Prefix )
   MP = MISSION_NAME.."_$"
   -- Checkpoints
   KILL_LIEUTENANTS_CHECKPOINT = "Kill_Lieutenants"

   -- Weapons
   SAW_NAME = "AR200"

   -- Groups
   TOBIAS_GROUP = MP.."Tobias"
   HELICOPTER_GROUP = MP.."Helicopter"

   GROUND_DEFENDERS_GROUP = MP.."Ground_Defenders"

   TARGET_VEHICLES_GROUP = MP.."Target_Vehicles"

   ESCAPEES_GROUP = MP.."Escapees"

   DRIVE_UP_DEFENDERS_GROUP = MP.."Drive_Up_Defenders"

   GAS_STATION_GROUP = MP.."Gas_Station_Stop"

   -- NPC names
   TOBIAS_NAME = MP.."Tobias"
   ESCAPEES_V1 = { MP.."EV1M_01", MP.."EV1M_02",
                   MP.."EV1M_03", MP.."EV1M_04" }
   ESCAPEES_V2 = { MP.."EV2M_01", MP.."EV2M_02",
                   MP.."EV2M_03", MP.."EV2M_04" }
   ESCAPEES_V3 = { MP.."EV3M_01", MP.."EV3M_02",
                   MP.."EV3M_03", MP.."EV3M_04" }
   ESCAPEES_V4 = { MP.."EV4M_01", MP.."EV4M_02",
                   MP.."EV4M_03", MP.."EV4M_04" }

   GROUND_DEFENDERS = { MP.."GD1", MP.."GD2", MP.."GD3",
                        MP.."GD4", MP.."GD5", MP.."GD6",
                        MP.."GD7", MP.."GD8", MP.."GD9",
                        MP.."GD10", MP.."GD11" }

   ROCKET_LAUNCHER_GUYS = { MP.."GD_Rocket01", MP.."GD_Rocket02", MP.."GD_Rocket03" }
   AK_47_GUY = MP.."GD_AK"

   ESCAPEES = { ESCAPEES_V1, ESCAPEES_V2, ESCAPEES_V3, ESCAPEES_V4 }

   DUD_MEMBERS = { MP.."DUD_1", MP.."DUD_2", MP.."DUD_3" }

   -- Vehicle names
   HELICOPTER_NAME = MP.."Helicopter"

   SEWAGE_TRUCK_NAME = MP.."Fertilizer_Truck"
   FUEL_TRUCK_TANK_NAME = MP.."Fuel_Truck_Tank"

   VEHICLE_TARGETS = { FUEL_TRUCK_TANK_NAME, SEWAGE_TRUCK_NAME }
   VEHICLE_AND_TRAILER = { MP.."Fuel_Truck_Cab", FUEL_TRUCK_TANK_NAME }

   DUD_VEHICLE = MP.."DUD_V"

   ESCAPEE_VEHICLES = { MP.."EscapeeV1", MP.."EscapeeV2", MP.."EscapeeV3", MP.."EscapeeV4" }

   -- Navpoints and paths
   MISSION_START_LOCATION = "mission_start_sr2_city_$ss03"
   REMOTE_PLAYER_START = MP.."Remote_Player_Start"

   NEAR_HELICOPTER = MP.."Near_Helicopter"
   NEAR_HELICOPTER_REMOTE_PLAYER = MP.."Near_Helicopter_Remote_Player"

   HELI_TO_FARM_PATH = MP.."To_Farm"
   HELI_CIRCULAR_RAIL_PATHS = { { MP.."Circular_Path" }, { MP.."Circular_Path2_1", MP.."Circular_Path2_2",
                                                           MP.."Circular_Path2_3", MP.."Circular_Path2_4" } }

   ESCAPEE_START_PATH = MP.."Escapee_Start_Path"
   ESCAPEE_PATHS = { MP.."EP1", MP.."EP2", MP.."EP3" }

   ESCAPEE_LOOPING_PATHS = { MP.."ELP1", MP.."ELP2" }

   ESCAPEE_TO_GAS_STATION_PATHS_PATH = { MP.."EPL1_01", MP.."EPL1_02", MP.."EPL1_03" }
   ESCAPEE_GAS_STATION_PATHS = { MP.."EV1_Gas", MP.."EV2_Gas", MP.."EV3_Gas", MP.."EV4_Gas" }

   ADDITIONAL_CARS_UP_TO_PATH = { MP.."Extra_Cars_to_Main_Path" }
   ADDITIONAL_CARS_PART_ONE = { MP.."EP1_13", MP.."EP1_14", MP.."EP1_15" }

   TO_HOLDING_POSITION = MP.."To_Holding_Position"
   HELI_HOLDING_POSITION = MP.."Heli_Holding_Position"

   HELI_CHECKPOINT_WARP = MP.."Heli_Checkpoint_Warp"
   LOCAL_PLAYER_CHECKPOINT_WARP = MP.."Local_Player_Checkpoint_Warp"
   REMOTE_PLAYER_CHECKPOINT_WARP = MP.."Remote_Player_Checkpoint_Warp"
   TOBIAS_CHECKPOINT_WARP = MP.."Tobias_Checkpoint_Warp"

   HELICOPTER_FOLLOW_PATHS = { MP.."HFP01", MP.."HFP02", MP.."HFP03" }
   HELICOPTER_FOLLOW_LOOP_PATHS = { MP.."HLP01", MP.."HLP02" }--, MP.."HLP03" }

   DUD_TO_FARM_PATH = MP.."DUD_To_Farm"
   DUD_ENTER_FARM_PATH = MP.."DUD_Enter_Farm"

   CHEM_DEPOT_FIRE_LOCATIONS = { MP.."Depot01_Location", MP.."Depot02_Location", MP.."Depot03_Location" }
   CROP_FIRE_LOCATIONS = { { MP.."Depot01_Crops_Location_01", MP.."Depot01_Crops_Location_02" },
                           { MP.."Depot02_Crops_Location_01", MP.."Depot02_Crops_Location_02" },
                           { MP.."Depot03_Crops_Location_01", MP.."Depot03_Crops_Location_02",
                             MP.."Depot03_Crops_Location_03", MP.."Depot03_Crops_Location_04",
                             MP.."Depot03_Crops_Location_05", MP.."Depot03_Crops_Location_06" } }

   CROP_FIRE_SPREAD_SEQUENCES = {
                                    {
                                       { CROP_FIRE_LOCATIONS[1][1] },
                                       { CROP_FIRE_LOCATIONS[1][2] }
                                    },

                                    {
                                       { CROP_FIRE_LOCATIONS[2][1] },
                                       { CROP_FIRE_LOCATIONS[2][2] },
                                    },

                                    {
                                        { CROP_FIRE_LOCATIONS[3][1] },
                                        { CROP_FIRE_LOCATIONS[3][2], CROP_FIRE_LOCATIONS[3][3], CROP_FIRE_LOCATIONS[3][5] },
                                        { CROP_FIRE_LOCATIONS[3][4], CROP_FIRE_LOCATIONS[3][6] }
                                    },
                                }

   BARN_ROOF_EXPLOSION_LOCATION = MP.."Barn_Roof_Location"

   GAS_STATION_VEHICLE_LOCATION = MP.."v000"

   -- Triggers
   LIEUTENANT_PASSED_BY_TRIGGERS = { MP.."Car_Caught_Up_Trigger",
                                     MP.."Car_Caught_Up_Trigger02",
                                     MP.."Car_Caught_Up_Trigger03" }
   HAZE_TRIGGERS = { MP.."Haze_01", MP.."Haze_02", MP.."Haze_03", MP.."Haze_04" }

   SPAWN_ADDITIONAL_CARS_TRIGGER = MP.."Spawn_Additional_Cars"
   -- Movers
   CHEMICAL_TANK = MP.."Chem_Tank"
   CHEMICAL_DEPOTS = { MP.."Chem_Depot_01", MP.."Chem_Depot_02",
                     MP.."Chem_Depot_03" }
   MOVER_TARGETS = { CHEMICAL_DEPOTS[1], CHEMICAL_DEPOTS[2],
                     CHEMICAL_DEPOTS[3], CHEMICAL_TANK }

   BILLBOARD_PARTS = { MP.."BB_Part1", MP.."BB_Part2", MP.."BB_Part3" }

   CAR_HUSK = MP.."Car_Husk_In_Barn"
   BARN_ROOF_NAME = MP.."Barn_Roof"

   -- Effects and animation states
   CHEM_DEPOT_FIRE = "fire_chemical"
   CHEM_DEPOT_CROP_FIRE = "fire_chemical_spread"
   BARN_ROOF_EXPLOSION = "dth_barnroof"

   -- Cutscenes
   CT_INTRO = "ss03-01"
   CT_OUTRO = "ss03-02"

-- Sound
   -- Persona overrides
   TOBIAS_CHEER_ON_DESTROYED = "SOS03_TOBIAS_ATTACK"
   TOBIAS_CHEER_ON_DESTROYED_PERSONA_SITUATION = "custom line 1"
   TOBIAS_HELI_DAMAGED_PERSONA_SITUATION = "custom line 2"

   -- Lines/Dialog Stream
   TOBIAS_INTRODUCTION_DIALOG_STREAM =
   {
   { "SOS3_START_L1", TOBIAS_NAME, 0 },
   { "PLAYER_SOS3_START_L2", LOCAL_PLAYER, 0 },
   { "SOS3_START_L3", TOBIAS_NAME, 0 },
   { "PLAYER_SOS3_START_L4", LOCAL_PLAYER, 0 }
   }
   FLEEING_LIEUTENANTS_DIALOG_STREAM =
   {
   { "SOS3_FLEE_L1", TOBIAS_NAME, 0 },
   { "PLAYER_SOS3_FLEE_L2", LOCAL_PLAYER, 0 }
   }
   TOBIAS_ON_BARN_DESTROYED = "TOBIAS_SOS3_BARN_EXPLODE"
   TOBIAS_CONGRAT_PLAYER = "TOBIAS_SOS3_CONGRAT_PLAYER"

	TOBIAS_ON_DAMAGED_LINES = { "TOBIAS_SOS03_TAKEDAM_1", "TOBIAS_SOS03_TAKEDAM_2", "TOBIAS_SOS03_TAKEDAM_3",
										 "TOBIAS_SOS03_TAKEDAM_4", "TOBIAS_SOS03_TAKEDAM_5", "TOBIAS_SOS03_TAKEDAM_6" }

-- Distances

-- Percents and multipliers
   HAZE_CLOUD_STRENGTH = 0.75
	ROCKET_LAUNCHER_HIT_POINT_MOD = .60
	PLAYER_HELI_HIT_POINT_MOD = 2.5

-- Time values
   HELI_CIRCULAR_RAIL_PATH_DELAYS_SECONDS = { { 0 }, { 6.0, 6.0, 6.0, 0 } }
   CHECKPOINT_FADE_IN_TIME_SECONDS = 1.0

   MISSION_START_FADE_IN_TIME_SECONDS = 3.0
   START_NOTORIETY_DELAY_SECONDS = 60.0
   PERFECT_AIM_DELAY_SECONDS = 0--32
   HELI_WAIT_ON_CARS_DELAY_SECONDS = 0.0
   HELICOPTER_FOLLOW_PATH_DELAYS = { 0, 0.0 }
   HELICOPTER_FOLLOW_LOOP_PASSBY_DELAYS = { 0, 0, 0 }

   DRUG_FIRE_TIME_TO_START_HAZE_EFFECT_SECONDS = 8.0

   HAZE_CLOUD_RAMP_UP_SECONDS = 1.0
   HAZE_CLOUD_RAMP_DOWN_SECONDS = 12.0

   BEFORE_BARN_EXPLOSION_DELAY_SECONDS = 2.0

   BETWEEN_ESCAPE_CARS_DELAY_SECONDS = 1.5
   MISSION_END_FADE_OUT_TIME_SECONDS = 3.0
   DESTROYED_ALL_TARGETS_STOP_CIRCLING_DELAY_SECONDS = 2.0
   DESTROYED_BARN_LAST_EXTRA_TIME_SECONDS = 4.0

-- Speeds
   HELI_TO_FARM_SPEED_MPS = 60
   HELI_CIRCLE_SPEED_MPS = 12

   CAR_FINAL_PATH_SPEED_MPS = 35
   CAR_LEAD_SPEED_MPS = 35
   CAR_CHASE_SPEED_MPS = 55
   HELICOPTER_FOLLOW_PATH_SPEEDS = { 25, 25, 40 }
   HELICOPTER_FOLLOW_LOOP_PATH_SPEEDS = { 45, 45, 45 }

-- Constant values and counts
   TOTAL_NUM_TARGETS = sizeof_table( MOVER_TARGETS ) + sizeof_table ( VEHICLE_TARGETS )
   TOTAL_LIEUTENANT_VEHICLES = sizeof_table( ESCAPEE_VEHICLES )
   TOTAL_GROUND_PERSONNEL = sizeof_table( GROUND_DEFENDERS ) + sizeof_table( ROCKET_LAUNCHER_GUYS )
   HELICOPTER_HIT_POINTS = 40000
   TOBIAS_HIT_POINTS = 500000
   MIN_MISSION_NOTORIETY = 3
   NUM_HELI_CIRCULAR_RAIL_PATHS = sizeof_table( HELI_CIRCULAR_RAIL_PATHS )
   DUD_SPAWN_THRESHOLD = TOTAL_GROUND_PERSONNEL * .75

   HAZE_CLOUD_RAMP_INCREMENTS = 30
   NUM_LOOPS_BEFORE_STOP = 2
   HELI_MAX_BANK_ANGLE = 0.2

   INITIAL_LIEUTENANT_VEHICLE_COUNT = 2
	NUM_ON_DAMAGED_LINES = sizeof_table( TOBIAS_ON_DAMAGED_LINES )

-- Global variables
   Next_Tobias_cheer_index = 1
   Num_targets_destroyed = 0
   Heli_circle_pathing_thread_handle = INVALID_THREAD_HANDLE

   Current_haze_strength = 0

   Car_path_threads = { INVALID_THREAD_HANDLE, INVALID_THREAD_HANDLE }

   Lieutenant_car_passed_by_triggers = { false, false, false }

   Heli_at_holding_position = false
   Num_cars_killed = 0
   Num_members_killed = 0
   Start_notoriety_countdown_thread_handle = INVALID_THREAD_HANDLE

   Num_ground_personnel_remaining = TOTAL_GROUND_PERSONNEL
   Drive_up_defenders_spawned = false
   Current_lieutenant_count = TOTAL_LIEUTENANT_VEHICLES
   Lead_car_name = "none"

   Lead_car_current_path_segment = ESCAPEE_START_PATH
   Lead_car_resumed_from_index = 0

   Lead_car_loop_index = 1
	Cur_on_damage_line_index = 1
	
	--Toggle Damage yelling
	Audio_playing = false

   Extra_vehicles_added_to_chase = false

	Debug_car_followed = false


function ss03_start( checkpoint_name, is_restart )
	-- Start trigger is hit...the activate button was hit
	set_mission_author("Brad Johnson and Mark Gabby")

   audio_suppress_ambient_player_lines( true )

   persona_override_group_start( SAMEDI_PERSONAS, POT_SITUATIONS[POT_ATTACK], "SS03_ATTACK" )

   -- Vehicles cause problems with the car chase, yo
   spawning_pedestrians( false )

   -- TEMP
	--checkpoint_name = KILL_LIEUTENANTS_CHECKPOINT
   -- END TEMP

	script_profiler_reset()

   mission_start_fade_out()

   if ( checkpoint_name == MISSION_START_CHECKPOINT ) then
		if (not is_restart) then
			cutscene_play( CT_INTRO, { TOBIAS_GROUP, HELICOPTER_GROUP }, { NEAR_HELICOPTER, NEAR_HELICOPTER_REMOTE_PLAYER }, false )
			script_profiler_start_section( "SS03 Start" )
		else
			script_profiler_start_section( "SS03 Start" )
			script_profiler_start_section( "SS03 Restart Teleport Coop" )
	      teleport_coop( NEAR_HELICOPTER, NEAR_HELICOPTER_REMOTE_PLAYER ) 
			script_profiler_end_section( "SS03 Restart Teleport Coop" )
			-- Create the helicopter and seat the player(s) and the pilot
			script_profiler_start_section( "SS03 Restart Blocking Group Creates" )
			group_create_hidden( TOBIAS_GROUP, true )
			group_create_hidden( HELICOPTER_GROUP, true )
			script_profiler_end_section( "SS03 Restart Blocking Group Creates" )
		end
   end
	-- Add and equip the appropriate weapons
	inv_weapon_add_temporary( LOCAL_PLAYER, SAW_NAME, 1, true, true )
	if ( coop_is_active() ) then
		inv_weapon_add_temporary( REMOTE_PLAYER, SAW_NAME, 1, true, true ) 
	end
   inv_item_equip( SAW_NAME, LOCAL_PLAYER )
   if ( coop_is_active() ) then
      inv_item_equip( SAW_NAME, REMOTE_PLAYER )
   end

	script_profiler_start_section( "SS03 Misc" )
   group_create_hidden( GAS_STATION_GROUP )

   for index, name in pairs( BILLBOARD_PARTS ) do
      mesh_mover_hide( name )
   end

   inv_weapon_disable_all_but_this_slot( WEAPON_SLOT_RIFLE )

   if ( checkpoint_name == MISSION_START_CHECKPOINT ) then
      party_dismiss_all()

		script_profiler_start_section( "Misc Group Setup" )
		group_show( TOBIAS_GROUP )
		group_show( HELICOPTER_GROUP )
		-- Create these groups, but don't blocking load them because we have some time
		-- before they're necessary
		group_create( TARGET_VEHICLES_GROUP )
      group_create( GROUND_DEFENDERS_GROUP )
		group_create_hidden( ESCAPEES_GROUP )
      group_create_hidden( DRIVE_UP_DEFENDERS_GROUP )
		script_profiler_end_section( "Misc Group Setup" )

		script_profiler_start_section( "Misc Threads" )
		thread_new( "ss03_setup_ground_defenders_when_group_loads" )
		thread_new( "ss03_setup_targets_when_group_loads" )
		script_profiler_end_section( "Misc Threads" )

      helicopter_set_max_bank_angle( HELICOPTER_NAME, HELI_MAX_BANK_ANGLE )
		ss03_player_heli_hitpoint_adjust( HELICOPTER_NAME )

		script_profiler_start_section( "Misc Seat People" )
      ss03_board_helicopter()
		script_profiler_end_section( "Misc Seat People" )

      for index, mover_name in pairs( MOVER_TARGETS ) do
         on_mover_destroyed( "ss03_target_mover_destroyed", mover_name )
         marker_add_mover( mover_name, "", INGAME_EFFECT_VEHICLE_KILL, SYNC_ALL )
      end

		script_profiler_start_section( "Misc Do Path" )
      -- Have the helicopter start on its path
      thread_new( "ss03_helicopter_do_path" )
		script_profiler_end_section( "Misc Do Path" )
   elseif( checkpoint_name == KILL_LIEUTENANTS_CHECKPOINT ) then
		-- This group MUST be ready 
		group_create_hidden( ESCAPEES_GROUP, true )

      if ( group_is_loaded( TOBIAS_GROUP ) == false ) then
         group_create( TOBIAS_GROUP, true )
      end
      teleport( TOBIAS_NAME, TOBIAS_CHECKPOINT_WARP )

      thread_yield()
      if ( group_is_loaded( HELICOPTER_GROUP ) == false ) then
         group_create( HELICOPTER_GROUP, true )
      end
      teleport_vehicle( HELICOPTER_NAME, HELI_CHECKPOINT_WARP )
      thread_yield()

      helicopter_set_max_bank_angle( HELICOPTER_NAME, HELI_MAX_BANK_ANGLE )

      -- Get the helicopter ready and fly it to the holding position
      ss03_board_helicopter()

		teleport_vehicle( HELICOPTER_NAME, HELI_HOLDING_POSITION )
      helicopter_fly_to( HELICOPTER_NAME, HELI_CIRCLE_SPEED_MPS, HELI_HOLDING_POSITION )
      Heli_at_holding_position = true

      -- Set up the effects, including the barn on fire and the fields burning
      mesh_mover_hide( BARN_ROOF_NAME )
      for index, name in pairs( MOVER_TARGETS ) do
         mesh_mover_hide( name )
      end
      for index, depot_locations in pairs( CHEM_DEPOT_FIRE_LOCATIONS ) do
         effect_play( CHEM_DEPOT_FIRE, depot_locations, true )
      end
      for index, cluster_group in pairs( CROP_FIRE_SPREAD_SEQUENCES ) do
         for index, cluster in pairs( cluster_group ) do
            ss03_ignite_cluster( cluster )
         end
      end
   end

   -- Don't want the helichopper to go crazy if it's hit by a rocket
   vehicle_prevent_explosion_fling( HELICOPTER_NAME, true )
   -- Boost the helicopter's HP - it'll be under heavy fire, after all
   set_max_hit_points( HELICOPTER_NAME, HELICOPTER_HIT_POINTS )
   set_current_hit_points( HELICOPTER_NAME, HELICOPTER_HIT_POINTS )
   
   set_max_hit_points( TOBIAS_NAME, TOBIAS_HIT_POINTS  )
   set_current_hit_points( TOBIAS_NAME, TOBIAS_HIT_POINTS )

   set_player_can_enter_exit_vehicles( LOCAL_PLAYER, false )
   if ( coop_is_active() ) then
      set_player_can_enter_exit_vehicles( REMOTE_PLAYER, false )
   end

   inv_item_equip( SAW_NAME, REMOTE_PLAYER )

   persona_override_character_start( TOBIAS_NAME, TOBIAS_CHEER_ON_DESTROYED_PERSONA_SITUATION,
                                     TOBIAS_CHEER_ON_DESTROYED )
	script_profiler_end_section( "SS03 Misc" )
   if ( checkpoint_name == MISSION_START_CHECKPOINT ) then   
		script_profiler_end_section( "SS03 Start" )
      mission_start_fade_in()
		script_profiler_do_printout()
      thread_new( "ss03_helicopter_conversation" )
   else
		script_profiler_end_section( "SS03 Start" )
      mission_start_fade_in()
		script_profiler_do_printout()
      ss03_switch_state( MS_FARM_DESTROYED )
   end

   drug_enable_disable_effect_override( true, SYNC_ALL )
end

function ss03_setup_ground_defenders_when_group_loads()
	repeat
		thread_yield()
	until( group_is_loaded( GROUND_DEFENDERS_GROUP ) )

	for index, name in pairs( GROUND_DEFENDERS ) do
		on_death( "ss03_ground_personnel_member_died", name )
	end
	for index, name in pairs( ROCKET_LAUNCHER_GUYS ) do
		ss03_rocket_guys_hitpoint_adjust( name )
		on_death( "ss03_ground_personnel_member_died", name )
	end
end

function ss03_setup_targets_when_group_loads()
	repeat
		thread_yield()
	until( group_is_loaded( TARGET_VEHICLES_GROUP ) )

	for index, vehicle_name in pairs( VEHICLE_TARGETS ) do
		turn_invulnerable( vehicle_name )
		on_take_damage( "ss03_target_vehicle_player_damage_passthrough", vehicle_name )
		on_vehicle_destroyed( "ss03_target_vehicle_destroyed", vehicle_name )
		marker_add_vehicle( vehicle_name, "", INGAME_EFFECT_VEHICLE_KILL, SYNC_ALL )
	end
	vehicle_attach_trailer( VEHICLE_AND_TRAILER[1], VEHICLE_AND_TRAILER[2] )
end

function ss03_rocket_guys_hitpoint_adjust( CHARACTER )
local rocket_man_hit_points = get_max_hit_points(CHARACTER)

	-- adjust the ROCKET_LAUNCHER_HIT_POINT_MOD variable to increase or decrease the hitpoints
	set_current_hit_points(CHARACTER, (rocket_man_hit_points*ROCKET_LAUNCHER_HIT_POINT_MOD))

end

function ss03_player_heli_hitpoint_adjust( VEHICLE )
	local heli_hit_points = get_max_hit_points( VEHICLE )	
	-- adjust the PLAYER_HELI_HIT_POINT_MOD variable to increase or decrease the hitpoints
	set_current_hit_points(VEHICLE, (heli_hit_points*PLAYER_HELI_HIT_POINT_MOD))
end

function ss03_tobias_curse_on_damage()
	local CURRENT_HELI_HITPOINTS = get_current_hit_points(HELICOPTER_NAME)
	local MAX_HELI_HITPOINTS = get_max_hit_points(HELICOPTER_NAME)

	--Only play lines when the hitpoints of the helicopter are less or = to 50% of the heli max
	if Audio_playing == false  and (CURRENT_HELI_HITPOINTS <= (MAX_HELI_HITPOINTS/2)) then
		--Make Tobias scream words that make Mark's ears burn when the helicopter is damaged.
		Audio_playing = true
		audio_play_for_character( TOBIAS_ON_DAMAGED_LINES[Cur_on_damage_line_index], TOBIAS_NAME, "voice", false, true )
		delay(20)
		Audio_playing = false

		Cur_on_damage_line_index = Cur_on_damage_line_index + 1
		if ( Cur_on_damage_line_index > NUM_ON_DAMAGED_LINES ) then
			Cur_on_damage_line_index = 1
		end
	end
end

function ss03_target_vehicle_player_damage_passthrough( victim_name, attacker_name, percent_hp_remaining_after_attack )
   if ( attacker_name == LOCAL_PLAYER or
        attacker_name == REMOTE_PLAYER ) then

      if ( percent_hp_remaining_after_attack > 0 ) then
         local new_hp = get_max_hit_points( victim_name ) * percent_hp_remaining_after_attack
         set_current_hit_points( victim_name, new_hp )
      else
         turn_vulnerable( victim_name )
      end
   end
end

function ss03_drive_up_defenders_run_defense()
   Drive_up_defenders_spawned = true
   group_show( DRIVE_UP_DEFENDERS_GROUP )

   vehicle_enter_group_teleport( DUD_MEMBERS, DUD_VEHICLE )
   vehicle_pathfind_to( DUD_VEHICLE, DUD_TO_FARM_PATH, false, false )
   vehicle_pathfind_to( DUD_VEHICLE, DUD_ENTER_FARM_PATH, true, true )

   for index, member_name in pairs( DUD_MEMBERS ) do
      vehicle_exit( member_name )
   end
   for index, member_name in pairs( DUD_MEMBERS ) do
      attack_safe( member_name, LOCAL_PLAYER )
   end
end

function ss03_ground_personnel_member_died()
   Num_ground_personnel_remaining = Num_ground_personnel_remaining - 1

   mission_debug( Num_ground_personnel_remaining.." ground personnel remain." )

   if ( Num_ground_personnel_remaining <= DUD_SPAWN_THRESHOLD and
        Drive_up_defenders_spawned == false ) then

      mission_debug( "running DUD" )
      ss03_drive_up_defenders_run_defense()
   end
end

function ss03_board_helicopter()
	script_profiler_start_section( "Seat People Equip Weapons" )
	repeat
		thread_yield()	
	until ( inv_item_is_equipped( SAW_NAME, LOCAL_PLAYER ) )
   if ( coop_is_active() ) then
		repeat
			thread_yield()	
		until ( inv_item_is_equipped( SAW_NAME, REMOTE_PLAYER ) )
   end
	script_profiler_end_section( "Seat People Equip Weapons" )

	-- Wait until both players are in the vehicle before continuing
	script_profiler_start_section( "Seat People Enter Helicopter" )
   vehicle_enter_teleport( LOCAL_PLAYER, HELICOPTER_NAME, 2, true )
	if ( coop_is_active() ) then
      vehicle_enter_teleport( REMOTE_PLAYER, HELICOPTER_NAME, 3, true )
   end
   while ( character_is_in_vehicle( LOCAL_PLAYER, HELICOPTER_NAME ) == false ) do
      delay( 0 )
   end
	if ( coop_is_active() ) then
      while ( character_is_in_vehicle( REMOTE_PLAYER, HELICOPTER_NAME ) == false ) do
         delay( 0 )
      end
   end
	script_profiler_end_section( "Seat People Enter Helicopter" )

   -- Finally, teleport Tobias into the helicopter
   vehicle_enter_teleport( TOBIAS_NAME, HELICOPTER_NAME, 0, true )
	repeat
		thread_yield()	
	until ( character_is_in_vehicle( TOBIAS_NAME, HELICOPTER_NAME ) )
end

function ss03_helicopter_do_path()
	teleport_vehicle( HELICOPTER_NAME, "ss03_$Heli_Start" )

   helicopter_fly_to( HELICOPTER_NAME, HELI_TO_FARM_SPEED_MPS, HELI_TO_FARM_PATH )

   ss03_switch_state( MS_REACHED_FARM )
end

function ss03_2d_conversation( dialog_stream )
   for index, dialog_segment in pairs( dialog_stream ) do
      if ( dialog_segment[DIALOG_STREAM_CHAR_NAME_INDEX] == LOCAL_PLAYER ) then
         audio_play_for_character( dialog_segment[DIALOG_STREAM_AUDIO_NAME_INDEX], LOCAL_PLAYER, "voice", false, true )
      else
         audio_play( dialog_segment[DIALOG_STREAM_AUDIO_NAME_INDEX], "voice", true )
      end
   end
end

function ss03_helicopter_conversation()
   ss03_2d_conversation( TOBIAS_INTRODUCTION_DIALOG_STREAM )
end

function ss03_perfect_aim_delay()
   delay( PERFECT_AIM_DELAY_SECONDS )

   for index, name in pairs( ROCKET_LAUNCHER_GUYS ) do
      set_perfect_aim( name, true )
      attack_safe( name, LOCAL_PLAYER )
   end
end

function ss03_switch_state( new_state )
   if ( new_state == MS_REACHED_FARM ) then
      -- Prompt the player and give him guidance on what to do
      mission_help_table( HT_DESTROY_FARM_EQUIPMENT, "", "", SYNC_ALL )
      -- Setup the targets so that the player knows what to shoot and the hits are recorded
      for index, vehicle_name in pairs( VEHICLE_TARGETS ) do
         marker_remove_vehicle( vehicle_name )
         marker_add_vehicle( vehicle_name, MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL, SYNC_ALL )
      end
      for index, mover_name in pairs( MOVER_TARGETS ) do
         marker_remove_mover( mover_name )
         marker_add_mover( mover_name, MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL, SYNC_ALL )
      end

      -- Setup things that trigger notoriety starting
      on_weapon_fired( "ss03_player_fired_gun", LOCAL_PLAYER )
      if ( coop_is_active() ) then
         on_weapon_fired( "ss03_player_fired_gun", REMOTE_PLAYER )
      end
      Start_notoriety_countdown_thread_handle = thread_new( "ss03_start_notoriety_countdown" )
      notoriety_force_no_spawn( ENEMY_GANG, true )

      local helicopter_hit_points = get_max_hit_points( HELICOPTER_NAME )

      on_vehicle_destroyed( "ss03_helicopter_destroyed", HELICOPTER_NAME )
      on_vehicle_exit( "ss03_left_helicopter", HELICOPTER_NAME )
		on_take_damage("ss03_tobias_curse_on_damage", HELICOPTER_NAME) 

      -- Start the helicopter
      Heli_circle_pathing_thread_handle = thread_new( "ss03_helicopter_circle" )
   elseif ( new_state == MS_FARM_DESTROYED ) then
      while ( Heli_at_holding_position == false ) do
         delay( 0 )
      end
      mission_set_checkpoint( KILL_LIEUTENANTS_CHECKPOINT )
      objective_text_clear( 0 )
      group_show( ESCAPEES_GROUP )

      for group_index, group_members in pairs( ESCAPEES ) do
         --set_ignore_ai_flag( group_members[1], true )
         vehicle_disable_chase( ESCAPEE_VEHICLES[group_index], true )
         vehicle_enter_teleport( group_members[1], ESCAPEE_VEHICLES[group_index], 0, true )
         turn_invulnerable( group_members[1] )
         vehicle_enter_teleport( group_members[2], ESCAPEE_VEHICLES[group_index], 1, true )
         vehicle_enter_teleport( group_members[3], ESCAPEE_VEHICLES[group_index], 2, true )
         vehicle_enter_teleport( group_members[4], ESCAPEE_VEHICLES[group_index], 3, true )

         vehicle_max_speed( ESCAPEE_VEHICLES[group_index], 0 ) 

         vehicle_suppress_npc_exit( ESCAPEE_VEHICLES[group_index], true )

         on_vehicle_destroyed( "ss03_car_destroyed", ESCAPEE_VEHICLES[group_index] )
      end

      objective_text( 0, HT_X_OF_Y_LIEUTENANTS, 0, Current_lieutenant_count )

      ss03_make_car_lead_car( ESCAPEE_VEHICLES[1] )
      Car_path_threads[1] = thread_new( "ss03_lead_car_start_pathfind", 1 )
      ss03_add_car_to_convoy( 2 )

      delay( HELI_WAIT_ON_CARS_DELAY_SECONDS )

      thread_new( "ss03_heli_follow_cars" )

      trigger_enable( SPAWN_ADDITIONAL_CARS_TRIGGER, true )
      on_trigger( "ss03_add_cars_to_chase", SPAWN_ADDITIONAL_CARS_TRIGGER )

      delay( 3.0 )
      mission_help_table( HT_ELIMINATE_LIEUTENANTS, "", "", SYNC_ALL )

   elseif ( new_state == MS_BEGIN_CHASE ) then
   end
end

function ss03_add_cars_to_chase( triggerer_name, trigger_name )
   trigger_enable( trigger_name, false )

   -- Update the lieutenant count and objective text
   objective_text( 0, HT_X_OF_Y_LIEUTENANTS, Num_cars_killed, Current_lieutenant_count )

   local car_alive = false

   -- Find the first living car with a smaller index, if it exists, and follow that car
   for i = 2, 1, -1 do
      if ( vehicle_is_destroyed( ESCAPEE_VEHICLES[i] ) == false ) then
			car_alive = true
      end
   end

   if ( car_alive ) then
		Debug_car_followed = true
      ss03_add_car_to_convoy( 3 )
   else
		Debug_car_followed = false
      Lead_car_resumed_from_index = 0
      Lead_car_current_path_segment = ESCAPEE_PATHS[1]
      ss03_setup_car_for_pathfinding( 3 )
      thread_new( "ss03_make_car_lead_car", ESCAPEE_VEHICLES[3], 17 )
   end
   ss03_add_car_to_convoy( 4 )

   Extra_vehicles_added_to_chase = true
end

function ss03_player_fired_gun()
   ss03_do_notoriety()
   ss03_clear_notoriety_functions()
end

function ss03_start_notoriety_countdown()
   delay( START_NOTORIETY_DELAY_SECONDS )

   ss03_do_notoriety()
   ss03_clear_notoriety_functions()
end

function ss03_do_notoriety()
   for index, name in pairs( GROUND_DEFENDERS ) do
      attack_safe( name, LOCAL_PLAYER )
   end
   notoriety_set_min( ENEMY_GANG, MIN_MISSION_NOTORIETY )

   thread_new( "ss03_perfect_aim_delay" )
end

function ss03_clear_notoriety_functions()
   if ( Start_notoriety_countdown_thread_handle ~= INVALID_THREAD_HANDLE ) then
      thread_kill( Start_notoriety_countdown_thread_handle )
      Start_notoriety_countdown_thread_handle = INVALID_THREAD_HANDLE
   end

   on_weapon_fired( "", LOCAL_PLAYER )
   if ( coop_is_active() ) then
      on_weapon_fired( "", REMOTE_PLAYER )
   end
end

function ss03_heli_follow_cars()

   for index, path_name in pairs( HELICOPTER_FOLLOW_PATHS ) do
      delay( HELICOPTER_FOLLOW_PATH_DELAYS[index] )
      helicopter_fly_to_direct_follow_dont_stop( HELICOPTER_NAME, HELICOPTER_FOLLOW_PATH_SPEEDS[index], Lead_car_name, path_name )
   end

   local loops = 0

   while( Num_cars_killed < TOTAL_LIEUTENANT_VEHICLES and loops < NUM_LOOPS_BEFORE_STOP ) do
      for index, path_name in pairs( HELICOPTER_FOLLOW_LOOP_PATHS ) do
         if ( loops == NUM_LOOPS_BEFORE_STOP - 1 ) then
            helicopter_fly_to_direct_follow( HELICOPTER_NAME, HELICOPTER_FOLLOW_LOOP_PATH_SPEEDS[index], Lead_car_name, path_name )
         else
            helicopter_fly_to_direct_follow_dont_stop( HELICOPTER_NAME, HELICOPTER_FOLLOW_LOOP_PATH_SPEEDS[index], Lead_car_name, path_name )
         end
      end

      delay( 0 )

      loops = loops + 1
      
      if ( loops == NUM_LOOPS_BEFORE_STOP - 1 ) then
         -- We're going to make a stop at the gas station the next time around, so show that group
         thread_new( "ss03_show_gas_station_groups", 10 )
      end
   end
end

function ss03_show_gas_station_groups( delay_seconds )
   delay( delay_seconds )

   group_show( GAS_STATION_GROUP )
end

-- Returns the index of a escapee vehicle from its name.
-- Returns -1 if the vehicle wasn't found.
--
function ss03_escapee_vehicle_index_from_name( vehicle_name )
   for index, escapee_vehicle_name in pairs( ESCAPEE_VEHICLES ) do
      if ( vehicle_name == escapee_vehicle_name ) then
         return index
      end
   end

   return -1
end

-- Finds the index of the next living escapee car after the passed-in car index.
--
-- Returns -1 if there are no living cars after the passed-in index.
-- Note: Will NEVER return the passed-in index
--
function ss03_find_next_living_escapee_car_index( start_car_index )
   local next_car_index = start_car_index + 1

   while ( next_car_index <= Current_lieutenant_count and
           vehicle_is_destroyed( ESCAPEE_VEHICLES[next_car_index] ) == true ) do
      next_car_index = next_car_index + 1
   end

   -- Don't include the extra lieutenants until they've been added
   if ( ( next_car_index > INITIAL_LIEUTENANT_VEHICLE_COUNT and
          Extra_vehicles_added_to_chase == false ) ) then
      return -1
   end

   -- Don't include car indices past the end
   if ( next_car_index > Current_lieutenant_count  ) then
      return -1
   end

   return next_car_index
end

function ss03_make_car_lead_car( vehicle_name, path_point_index )
   -- If the resume path point index isn't nil, then this car is taking
   -- over for another lead car that was just destroyed
   local is_replacement_lead_car = false
   if ( path_point_index ~= nil ) then
      is_replacement_lead_car = true
   end

   Lead_car_name = vehicle_name
   vehicle_ignore_repulsors( Lead_car_name, true )
   helicopter_go_to_change_follow_target( HELICOPTER_NAME, Lead_car_name )
   on_vehicle_destroyed( "ss03_lead_car_destroyed", Lead_car_name )
   vehicle_max_speed( vehicle_name, CAR_LEAD_SPEED_MPS )
   vehicle_speed_override( vehicle_name, CAR_LEAD_SPEED_MPS )

   if ( is_replacement_lead_car ) then
      local resume_path_point_index = path_point_index + Lead_car_resumed_from_index

      local car_index = ss03_escapee_vehicle_index_from_name( vehicle_name )
      mission_debug( "car "..vehicle_name.." resuming from path point "..resume_path_point_index, 15 )
      ss03_new_lead_car_resume_pathfind( car_index, resume_path_point_index )
   end
end

function ss03_lead_car_destroyed( vehicle_name, path_point_index )
	if ( path_point_index ~= nil ) then
	   mission_debug( "lead car destroyed. path index returned was "..path_point_index, 15 )
	else
		path_point_index = 0
	end

   local vehicle_index = ss03_escapee_vehicle_index_from_name( vehicle_name )
   local next_car_index = ss03_find_next_living_escapee_car_index( vehicle_index )

   -- This car was destroyed, do the callback
   ss03_car_destroyed( vehicle_name )

   -- If there's another car, then the mission can continue
   if ( next_car_index ~= -1 ) then
      ss03_make_car_lead_car( ESCAPEE_VEHICLES[next_car_index], path_point_index )
   -- If there's not another car, check to see if maybe the extras haven't been added -
   -- If so, we need to proceed normally to the trigger where they're added
   elseif ( Extra_vehicles_added_to_chase == false ) then
      mission_debug( "cleared follow target" )
      helicopter_go_to_clear_follow_target( HELICOPTER_NAME )
   end
end

function ss03_following_car_destroyed( vehicle_name )
   -- Fix the gap in the chain of following cars caused by this car's death
   local vehicle_index = ss03_escapee_vehicle_index_from_name( vehicle_name )
   local next_car_index = ss03_find_next_living_escapee_car_index( vehicle_index )
   if ( next_car_index > 0 ) then
      -- already_following = true
      ss03_add_car_to_convoy( next_car_index, true )
      mission_debug( "following car "..vehicle_name.." destroyed. next car index "..next_car_index.." chasing.", 15 )
   else
      mission_debug( "following car "..vehicle_name.." destroyed.", 15 )
   end

   -- Handle the car destroyed
   ss03_car_destroyed( vehicle_name )
end

function ss03_all_current_targets_killed()
   if ( ( Num_cars_killed + Num_members_killed ) == Current_lieutenant_count ) then
      return true
   end
   return false
end

function ss03_car_destroyed( vehicle_name )
   local car_index = ss03_escapee_vehicle_index_from_name( vehicle_name )
   turn_vulnerable( ESCAPEES[car_index][1] )
   character_kill( ESCAPEES[car_index][1] )
   marker_remove_vehicle( vehicle_name )

   Num_cars_killed = Num_cars_killed + 1

   objective_text( 0, HT_X_OF_Y_LIEUTENANTS, Num_cars_killed, Current_lieutenant_count )
   
   ss03_update_objective_text_including_individuals()

   -- The mission ends if all current targets have been killed,
   -- but only if the extra cars have been added to the chase
   if ( ss03_all_current_targets_killed() and
        Current_lieutenant_count >= TOTAL_LIEUTENANT_VEHICLES ) then
      mission_end_success( MISSION_NAME, CT_OUTRO )
   end
end

function ss03_path_is_in_table( path_name, table_name )
   for index, name in pairs( table_name ) do
      if ( path_name == name ) then
         return true
      end
   end

   return false
end

function ss03_get_paths_index( path_name, table_name )
   for index, name in pairs( table_name ) do
      if ( path_name == name ) then
         return index
      end
   end
   return -1
end

function ss03_resume_lead_car_path( lead_car, resuming_path_index, path_name )
   -- Go the rest of the way along this path
   vehicle_navmesh_pathfind_to_starting_from( lead_car, resuming_path_index, path_name, false, false )
   if ( vehicle_is_destroyed( lead_car )  ) then
      return false
   end
   -- Now that the lead car has finished the rest of the old lead car's path, if it dies we'll get the correct index, so no need for this anymore
   Lead_car_resumed_from_index = 0   
   return true
end

-- Called when a car is made a lead car. Causes that car to take over the path
-- of the old lead car.
--
-- car_index: Index of the new lead car.
-- resuming_path_index: How far along the lead car was on its current path.
--
function ss03_new_lead_car_resume_pathfind( car_index, resuming_path_index )
   -- We're going to resume from this index. We need this recorded so that we know
   -- where to resume from 
   Lead_car_resumed_from_index = resuming_path_index

   local new_lead_car = ESCAPEE_VEHICLES[car_index]

   -- We haven't yet resumed
   local resumed = false

   -- If the lead car was on the start path, resume from there
   if ( Lead_car_current_path_segment == ESCAPEE_START_PATH ) then
      mission_debug( "Resuming from start, index "..resuming_path_index, 15 )

      resumed = true

      -- Go the rest of the way along the first path
      vehicle_navmesh_pathfind_to_starting_from( new_lead_car, resuming_path_index, ESCAPEE_START_PATH, false, false )

      if ( vehicle_is_destroyed( new_lead_car )  ) then
         return
      end
      -- Now that the lead car has finished the rest of the old lead car's path, if it dies we'll get the correct index, so no need for this anymore
      Lead_car_resumed_from_index = 0
   end

   -- If we've resumed, do the obvious from here on
   if ( resumed ) then
      for index, path_name in pairs( ESCAPEE_PATHS ) do
         if ( vehicle_is_destroyed( new_lead_car ) ) then
            return;
         end
         Lead_car_current_path_segment = path_name
         -- use_navmesh, stop_at_goal
         vehicle_pathfind_to( new_lead_car, path_name, true, false )
      end
   -- If we're resuming, resume
   elseif ( ss03_path_is_in_table( Lead_car_current_path_segment, ESCAPEE_PATHS ) ) then
      mission_debug( "Resuming from escapee paths, index "..resuming_path_index, 15 )

      resumed = true

      local path_index = ss03_get_paths_index( Lead_car_current_path_segment, ESCAPEE_PATHS )

      mission_debug( "Path index is "..path_index..", resume index is "..resuming_path_index..", lead path is "..Lead_car_current_path_segment..", indexed is "..ESCAPEE_PATHS[path_index], 20 )

      -- Go the rest of the way along this path
      vehicle_navmesh_pathfind_to_starting_from( new_lead_car, resuming_path_index, ESCAPEE_PATHS[path_index], false, false )
      if ( vehicle_is_destroyed( new_lead_car )  ) then
         return
      end
      -- Now that the lead car has finished the rest of the old lead car's path, if it dies we'll get the correct index, so no need for this anymore
      Lead_car_resumed_from_index = 0

      for i = path_index + 1, sizeof_table( ESCAPEE_PATHS ) do
         if ( vehicle_is_destroyed( new_lead_car ) ) then
            return;
         end
         Lead_car_current_path_segment = ESCAPEE_PATHS[i]
         vehicle_pathfind_to( new_lead_car, Lead_car_current_path_segment, true, false )
      end
   end

   -- Resumed - do the obvious
   if ( resumed ) then
      for i = Lead_car_loop_index, NUM_LOOPS_BEFORE_STOP do
         if ( vehicle_is_destroyed( new_lead_car ) ) then
            return;
         end

         Lead_car_loop_index = i
         for index, path_name in pairs( ESCAPEE_LOOPING_PATHS ) do
            if ( vehicle_is_destroyed( new_lead_car ) ) then
               return;
            end

            Lead_car_current_path_segment = path_name
            -- use_navmesh, stop_at_goal, force_path
            vehicle_pathfind_to( ESCAPEE_VEHICLES[car_index], path_name, true, false )
         end
         delay( 0 )
      end
   -- Finish off the current loop and then proceed to the next one
   elseif ( ss03_path_is_in_table( Lead_car_current_path_segment, ESCAPEE_LOOPING_PATHS ) ) then
      mission_debug( "Resuming from escapee looping paths, index "..resuming_path_index, 15 )

      resumed = true

      local path_index = ss03_get_paths_index( Lead_car_current_path_segment, ESCAPEE_LOOPING_PATHS )

      -- Finish up the current path
      vehicle_navmesh_pathfind_to_starting_from( new_lead_car, resuming_path_index, ESCAPEE_LOOPING_PATHS[path_index], false, false )
      if ( vehicle_is_destroyed( new_lead_car )  ) then
         return
      end
      Lead_car_resumed_from_index = 0

      -- If it's the last path in the list, then increment the loop count
      if ( path_index == sizeof_table( ESCAPEE_LOOPING_PATHS ) ) then
         if ( vehicle_is_destroyed( new_lead_car ) ) then
            return;
         end

         Lead_car_loop_index = Lead_car_loop_index + 1
      -- Otherwise, finish this loop
      else
         for index = path_index, sizeof_table( ESCAPEE_LOOPING_PATHS ) do
            if ( vehicle_is_destroyed( new_lead_car ) ) then
               return;
            end
            Lead_car_current_path_segment = ESCAPEE_LOOPING_PATHS[index]
            -- use_navmesh, stop_at_goal, force_path
            vehicle_pathfind_to( ESCAPEE_VEHICLES[car_index], Lead_car_current_path_segment, true, false )
         end

         if ( vehicle_is_destroyed( new_lead_car ) ) then
            return;
         end
         Lead_car_loop_index = Lead_car_loop_index + 1
      end

      -- Start looping again from the loop index you resumed at
      for i = Lead_car_loop_index, NUM_LOOPS_BEFORE_STOP do
         if ( vehicle_is_destroyed( new_lead_car ) ) then
            return;
         end

         Lead_car_loop_index = i
         for index, path_name in pairs( ESCAPEE_LOOPING_PATHS ) do
            if ( vehicle_is_destroyed( new_lead_car ) ) then
               return;
            end

            Lead_car_current_path_segment = path_name
            -- use_navmesh, stop_at_goal, force_path
            vehicle_pathfind_to( ESCAPEE_VEHICLES[car_index], path_name, true, false )
         end
         delay( 0 )
      end
   end

   ss03_do_final_pathing()
end

function ss03_lead_car_start_pathfind( car_index )
   -- Do any necessary setup on the car
   ss03_setup_car_for_pathfinding( car_index )

   Lead_car_current_path_segment = ESCAPEE_START_PATH
   -- use_navmesh, stop_at_goal
   vehicle_pathfind_to( ESCAPEE_VEHICLES[car_index], ESCAPEE_START_PATH, true, false )

   -- Now, start on the main path
   for index, path_name in pairs( ESCAPEE_PATHS ) do
      if ( vehicle_is_destroyed( ESCAPEE_VEHICLES[car_index] ) ) then
         return;
      end
      Lead_car_current_path_segment = path_name
      -- use_navmesh, stop_at_goal
      vehicle_pathfind_to( ESCAPEE_VEHICLES[car_index], path_name, true, false )
   end

   -- Do the looping path
   for i = 1, NUM_LOOPS_BEFORE_STOP do
      if ( vehicle_is_destroyed( ESCAPEE_VEHICLES[car_index] ) ) then
         return;
      end
      Lead_car_loop_index = i
      for index, path_name in pairs( ESCAPEE_LOOPING_PATHS ) do
         if ( vehicle_is_destroyed( ESCAPEE_VEHICLES[car_index] ) ) then
            return;
         end
         Lead_car_current_path_segment = path_name
         -- use_navmesh, stop_at_goal, force_path
         vehicle_pathfind_to( ESCAPEE_VEHICLES[car_index], path_name, true, false )
      end
      delay( 0 )
   end

   ss03_do_final_pathing()
end

function ss03_car_final_pathing( vehicle_name, vehicle_index )
   -- Set all the cars to the same speed so they don't collide
   vehicle_max_speed( vehicle_name, CAR_FINAL_PATH_SPEED_MPS )
   vehicle_speed_override( vehicle_name, CAR_FINAL_PATH_SPEED_MPS )   

   -- Stop at the gas station
   -- use_navmesh, stop_at_goal
   vehicle_pathfind_to( vehicle_name, ESCAPEE_TO_GAS_STATION_PATHS_PATH, true, false )
   -- use_navmesh, stop_at_goal
   vehicle_pathfind_to( vehicle_name, ESCAPEE_GAS_STATION_PATHS[vehicle_index], true, true )

	-- If the vehicle stopped and the people got out when they weren't at a good location to do so,
	-- the player should win.
	if ( get_dist_vehicle_to_nav( vehicle_name, MP.."Near_Dropoff_Points" ) > 13.1 ) then
		local car_followed = "true"
		if ( Debug_car_followed == false ) then
			car_followed = "false"
		end

		script_assert( false, vehicle_name.." failed path. Car followed = "..car_followed..". Please get Mark Gabby if you hit this. Thanks!" )
		vehicle_detonate( vehicle_name )
		return
	end

   vehicle_suppress_npc_exit( vehicle_name, false )
   for index, member_name in pairs( ESCAPEES[vehicle_index] ) do
      if ( character_is_dead( member_name ) == false ) then
         thread_new( "ss03_vehicle_member_exit_car", member_name )
      end
   end
   -- This vehicle no longer counts as a required kill
   Current_lieutenant_count = Current_lieutenant_count - 1
   marker_remove_vehicle( vehicle_name )
   on_vehicle_destroyed( "", vehicle_name )
   ss03_update_objective_text_including_individuals()
end

-- Handles the gas station stop for all surviving vehicles
--
function ss03_do_final_pathing()
   for vehicle_index, vehicle_name in pairs( ESCAPEE_VEHICLES ) do
      if ( vehicle_is_destroyed( vehicle_name ) == false ) then
         thread_new( "ss03_car_final_pathing", vehicle_name, vehicle_index )
      end
   end
end

function ss03_update_objective_text_including_individuals()
   objective_text( 0, HT_X_OF_Y_LIEUTENANTS, Num_cars_killed + Num_members_killed, Current_lieutenant_count )
end

function ss03_vehicle_member_exit_car( member_name )
   Current_lieutenant_count = Current_lieutenant_count + 1
   turn_vulnerable( member_name )
   on_death( "ss03_member_died", member_name )
   ss03_update_objective_text_including_individuals()

   marker_add_npc( member_name, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL )
   npc_leash_to_nav( member_name, GAS_STATION_VEHICLE_LOCATION, 20 )
   vehicle_exit( member_name )
   attack_closest_player( member_name )
end

function ss03_member_died( member_name )
   marker_remove_npc( member_name )
   Num_members_killed = Num_members_killed + 1
   ss03_update_objective_text_including_individuals()
   if ( ss03_all_current_targets_killed() ) then
      mission_end_success( MISSION_NAME, CT_OUTRO )
   end
end

-- Adds a car to the convoy. Sets up a car to follow the
-- car next in front of this car that is still alive.
--
-- already_following: (default false) True if this car was already following.
--
function ss03_add_car_to_convoy( car_index, already_following )
   if ( already_following == nil ) then
      already_following = false
   end

   -- Only do setup on this car if it's being freshly added to the chase
   if ( already_following == false ) then
      ss03_setup_car_for_pathfinding( car_index )
      vehicle_max_speed( ESCAPEE_VEHICLES[car_index], CAR_CHASE_SPEED_MPS )
      vehicle_speed_override( ESCAPEE_VEHICLES[car_index], CAR_CHASE_SPEED_MPS )
      on_vehicle_destroyed( "ss03_following_car_destroyed", ESCAPEE_VEHICLES[car_index] )
   end

   -- Find the first living car with a smaller index, if it exists, and follow that car
   for i = car_index - 1, 1, -1 do
      if ( vehicle_is_destroyed( ESCAPEE_VEHICLES[i] ) == false ) then
         vehicle_chase( ESCAPEE_VEHICLES[car_index], ESCAPEES[i][1], false, false, false, true )
         return
      end
   end

   script_assert( false, "Called 'add_car_to_convoy' index "..car_index..", vehicle: "..ESCAPEE_VEHICLES[car_index].." when there were no living cars in front of said car." )
end

function ss03_setup_car_for_pathfinding( car_index )
   for member_index, member_name in pairs( ESCAPEES[car_index] ) do
      -- ( attacker, yield )
      attack_closest_player( member_name, false )
   end

   marker_add_vehicle( ESCAPEE_VEHICLES[car_index], MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL, SYNC_ALL )
   vehicle_set_crazy( ESCAPEE_VEHICLES[car_index], true )
   vehicle_infinite_mass( ESCAPEE_VEHICLES[car_index], true )
end

-- Called when the helicopter is damaged. Updates the health bar.
--
function ss03_helicopter_damaged()
   local helicopter_hit_points = get_current_hit_points( HELICOPTER_NAME )
   hud_bar_set_value(0, helicopter_hit_points, SYNC_ALL )
end

function ss03_helicopter_destroyed()
   mission_end_failure( MISSION_NAME, HT_HELICOPTER_DESTROYED )
end

function ss03_left_helicopter()
   mission_end_failure( MISSION_NAME, HT_HELICOPTER_DESTROYED )
end

function ss03_helicopter_circle()
   local path_index = 1
   while( Num_targets_destroyed < TOTAL_NUM_TARGETS ) do
      -- Pathfind around the path, segment by segment
      for segment_index, segment_name in pairs( HELI_CIRCULAR_RAIL_PATHS[path_index] ) do
         helicopter_fly_to( HELICOPTER_NAME, HELI_CIRCLE_SPEED_MPS, segment_name )
         delay( HELI_CIRCULAR_RAIL_PATH_DELAYS_SECONDS[path_index][segment_index] )
         if ( Num_targets_destroyed == TOTAL_NUM_TARGETS ) then
            break
         end
      end
      path_index = path_index + 1
      if ( path_index > NUM_HELI_CIRCULAR_RAIL_PATHS ) then
         path_index = 1
      end
      delay( 0 )
   end
end

function ss03_fleeing_lieutenants_dialog()
   ss03_2d_conversation( FLEEING_LIEUTENANTS_DIALOG_STREAM )
end

function ss03_helicopter_end_circle()
   -- Kill the Samedi with rocket launchers so that they don't kill the player when
   -- he can't fight back
   for index, name in pairs( ROCKET_LAUNCHER_GUYS ) do
      if ( character_exists( name ) ) then
         if ( character_is_dead( name ) == false ) then
            on_death( "", name )
            character_kill( name )
         end
      end
   end

   helicopter_fly_to( HELICOPTER_NAME, HELI_CIRCLE_SPEED_MPS, TO_HOLDING_POSITION )
   thread_new( "ss03_fleeing_lieutenants_dialog" )
   helicopter_fly_to( HELICOPTER_NAME, HELI_CIRCLE_SPEED_MPS, HELI_HOLDING_POSITION )
   -- Turn off the haze triggers now that we've flown through this part of the mission
   for index, trigger_name in pairs( HAZE_TRIGGERS ) do
      -- Don't disable the last trigger - we're inside it right now
      if ( index ~= 4 ) then
         trigger_enable( trigger_name, false )
      end
   end
   Heli_at_holding_position = true
end

function ss03_target_mover_destroyed( mover_name )
   marker_remove_mover( mover_name, SYNC_ALL )
   ss03_target_destroyed( mover_name )
end

function ss03_target_vehicle_destroyed( vehicle_name )
   marker_remove_vehicle( vehicle_name, SYNC_ALL )
   if ( vehicle_name == SEWAGE_TRUCK_NAME ) then
      -- Hide the barn
      -- Start the huge barn explosion
      --delay( BEFORE_BARN_EXPLOSION_DELAY_SECONDS )

      mesh_mover_hide( BARN_ROOF_NAME )
      effect_play( BARN_ROOF_EXPLOSION, BARN_ROOF_EXPLOSION_LOCATION )

      audio_play( TOBIAS_ON_BARN_DESTROYED, "voice", false )
   end
   ss03_target_destroyed( vehicle_name )
end

-- Called when the player's helicopter hits a haze trigger.
-- Meant to simulate the helicopter flying into drug fumes and give the
-- player a drug haze effect.
-- Each trigger causes the global haze to increase a set delta amount.
--
function ss03_entered_haze()
   mission_debug( "entered haze" )
   -- Ramp up the haze strength
   -- Find out how long we take between updates when ramping up
   local ramp_up_update_seconds = HAZE_CLOUD_RAMP_UP_SECONDS / HAZE_CLOUD_RAMP_INCREMENTS
   -- Find out how much we bump up the haze strength between updates
   local ramp_up_amount_per_update = HAZE_CLOUD_STRENGTH / HAZE_CLOUD_RAMP_INCREMENTS
   for i = 1, HAZE_CLOUD_RAMP_INCREMENTS do
      delay( ramp_up_update_seconds )
      Current_haze_strength = Current_haze_strength + ramp_up_amount_per_update
      local strength_to_set = Current_haze_strength
      if ( Current_haze_strength > 1 ) then
         strength_to_set = 1
      end
      drug_effect_set_override_values( 0, strength_to_set, SYNC_ALL )
   end
   mission_debug( "Ramp Up: Current_haze_strength = "..Current_haze_strength )

end

-- Called when the player's helicopter leaves a haze trigger.
-- Meant to simulate the helicopter leaving the drug fumes and the player recovering.
-- Each trigger causes the global haze to decrease a set delta amount.
--
function ss03_left_haze()
   -- Ramp down the haze strength
   -- Find out how long we take between updates when ramping down
   local ramp_down_update_seconds = HAZE_CLOUD_RAMP_DOWN_SECONDS / HAZE_CLOUD_RAMP_INCREMENTS
   -- Find out how much we bump down the haze strength between updates
   local ramp_down_amount_per_update = HAZE_CLOUD_STRENGTH / HAZE_CLOUD_RAMP_INCREMENTS

   for i = 1, HAZE_CLOUD_RAMP_INCREMENTS do
      delay( ramp_down_update_seconds )
      Current_haze_strength = Current_haze_strength - ramp_down_amount_per_update
      local strength_to_set = Current_haze_strength
      if ( Current_haze_strength > 1 ) then
         strength_to_set = 1
      end
      drug_effect_set_override_values( 0, strength_to_set, SYNC_ALL )
   end
   mission_debug( "Ramp Down: Current_haze_strength = "..Current_haze_strength )
end

-- This function simulates the time it takes for the haze fire effect to rise
-- high enough to drug the player when he passes by.
--
-- haze_trigger_index: The index of the haze trigger to enable.
--                     Different triggers are linked to different chem depots.
--
function ss03_delay_before_enable_haze_trigger( haze_trigger_index )
   delay( DRUG_FIRE_TIME_TO_START_HAZE_EFFECT_SECONDS )
   trigger_enable( HAZE_TRIGGERS[haze_trigger_index], true )
   on_trigger( "ss03_entered_haze", HAZE_TRIGGERS[haze_trigger_index] )
   on_trigger_exit( "ss03_left_haze", HAZE_TRIGGERS[haze_trigger_index] )
end

function ss03_ignite_cluster( cluster )
   for index, point in pairs( cluster ) do
      effect_play( CHEM_DEPOT_CROP_FIRE, point, true )
   end
end

function ss03_do_fire_spreading( spread_cluster )
   -- Go through each cluster of navpoints in this 
   -- part of the spread and ignite them
   for index, cluster in pairs( spread_cluster ) do
      delay( 10.0 )
      ss03_ignite_cluster( cluster )
   end
end

function ss03_target_destroyed( target_name )
   Num_targets_destroyed = Num_targets_destroyed + 1

   -- Don't play the "cheer" line on the sewage truck, because Tobias cheers when the barn
   -- goes up.
   if ( target_name ~= SEWAGE_TRUCK_NAME ) then
      audio_play_persona_line( TOBIAS_NAME, TOBIAS_CHEER_ON_DESTROYED_PERSONA_SITUATION )
   end

   local delay_time_seconds = DESTROYED_ALL_TARGETS_STOP_CIRCLING_DELAY_SECONDS

   if ( target_name == CHEMICAL_DEPOTS[1] ) then
      mission_help_table( HT_CHEM_DEPOT_DESTROYED )

      -- Play the chemical depot's fire effect
      effect_play( CHEM_DEPOT_FIRE, CHEM_DEPOT_FIRE_LOCATIONS[1], true )
      -- Do the crop fire effects
      thread_new( "ss03_do_fire_spreading", CROP_FIRE_SPREAD_SEQUENCES[1] )

      -- Enable the "drug haze" trigger for this location
      thread_new( "ss03_delay_before_enable_haze_trigger", 1 )
   elseif ( target_name == CHEMICAL_DEPOTS[2] ) then
      mission_help_table( HT_CHEM_DEPOT_DESTROYED )

      -- Play the chemical depot's fire effect
      effect_play( CHEM_DEPOT_FIRE, CHEM_DEPOT_FIRE_LOCATIONS[2], true )
      -- Do the crop fire effects
      thread_new( "ss03_do_fire_spreading", CROP_FIRE_SPREAD_SEQUENCES[2] )

      -- Enable the "drug haze" trigger for this location
      thread_new( "ss03_delay_before_enable_haze_trigger", 2 )
   elseif ( target_name == CHEMICAL_DEPOTS[3] ) then
      mission_help_table( HT_CHEM_DEPOT_DESTROYED )

      -- Play the chemical depot's fire effect
      effect_play( CHEM_DEPOT_FIRE, CHEM_DEPOT_FIRE_LOCATIONS[3], true )
      -- Do the crop fire effects
      thread_new( "ss03_do_fire_spreading", CROP_FIRE_SPREAD_SEQUENCES[3] )

      -- Enable the "drug haze" trigger for this location
      thread_new( "ss03_delay_before_enable_haze_trigger", 3 )
      -- This trigger is above the flames. It's hit when the helicopter flies to the
      -- holding position.
      thread_new( "ss03_delay_before_enable_haze_trigger", 4 )
   elseif ( target_name == CHEMICAL_TANK ) then
      mission_help_table( HT_CHEM_TANK_DESTROYED )
   elseif ( target_name == SEWAGE_TRUCK_NAME ) then
      delay_time_seconds = delay_time_seconds + DESTROYED_BARN_LAST_EXTRA_TIME_SECONDS
      mission_help_table( HT_FERTILIZER_TRUCK_DESTROYED )
   elseif ( target_name == FUEL_TRUCK_TANK_NAME ) then
      mission_help_table( HT_FUEL_TRUCK_DESTROYED )
   end

   objective_text( 0, HT_X_OF_Y_TARGETS, Num_targets_destroyed, TOTAL_NUM_TARGETS )

   if ( Num_targets_destroyed >= TOTAL_NUM_TARGETS ) then
      delay( delay_time_seconds )
      thread_new( "ss03_switch_state", MS_FARM_DESTROYED )
   end
   if ( Num_targets_destroyed == TOTAL_NUM_TARGETS ) then
      ss03_helicopter_end_circle()
   end
end

function ss03_cleanup()
   spawning_pedestrians( true )
   on_vehicle_exit( "", HELICOPTER_NAME )

   on_weapon_fired( "", LOCAL_PLAYER )
   if ( coop_is_active() ) then
      on_weapon_fired( "", REMOTE_PLAYER )
   end
   --mesh_mover_show( CAR_HUSK )
   -- Cleanup mission here
   group_destroy( HELICOPTER_GROUP )
   teleport( LOCAL_PLAYER, MISSION_START_LOCATION, true )
   if ( coop_is_active() ) then
      teleport( REMOTE_PLAYER, REMOTE_PLAYER_START, true )
   end

   notoriety_set_min( ENEMY_GANG, 0 )
   inv_weapon_remove_temporary( LOCAL_PLAYER, SAW_NAME )
   if ( coop_is_active() ) then
      inv_weapon_remove_temporary( REMOTE_PLAYER, SAW_NAME ) 
   end

   persona_override_group_stop( SAMEDI_PERSONAS, POT_SITUATIONS[POT_ATTACK] )

   set_player_can_enter_exit_vehicles( LOCAL_PLAYER, true )
   if ( coop_is_active() ) then
      set_player_can_enter_exit_vehicles( REMOTE_PLAYER, true )
   end
   inv_weapon_enable_or_disable_all_slots( true )
   fade_in( 0 )
   drug_enable_disable_effect_override( false, SYNC_ALL )

   for index, name in pairs( BILLBOARD_PARTS ) do
      mesh_mover_show( name )
   end

   audio_suppress_ambient_player_lines( false )
end

function ss03_success()
	-- Called when the mission has ended with success
end
