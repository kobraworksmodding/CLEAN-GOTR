-- ss08.lua
-- SR2 mission script
-- 3/28/07
-- Mission help table text tags
   HT_TRUCK_DESTROYED = "ss08_truck_destroyed"
   HT_GET_BACK_TO_WAREHOUSE = "ss08_get_back_to_warehouse"
   HT_WAREHOUSE_ABANDONED = "ss08_warehouse_abandoned"
   HT_DEFEND_THE_DUST = "ss08_defend_the_dust"
   HT_PIERCE_DIED = "ss08_pierce_died"
   HT_SHAUNDI_DIED = "ss08_shaundi_died"
   HT_PIERCE_ABANDONED = "ss08_pierce_abandoned"
   HT_SHAUNDI_ABANDONED = "ss08_shaundi_abandoned"
   HT_PROTECT_WHILE_LOADING = "ss08_protect_while_loading"
   HT_GET_DRUGS_TO_HQ = "ss08_get_drugs_to_hq"
   HT_PIERCE_WAITING_ON_YOU = "ss08_pierce_waiting_on_you"
   HT_GET_A_CAR = "ss08_get_a_car"
   HT_ESCORT_TRUCK_TO_HIDEOUT = "ss08_escort_truck_to_hideout"
   HT_TRUCK_HEALTH = "ss08_truck_health"
   HT_X_OF_Y_BOXES_LOADED = "ss08_x_of_y_crates_loaded"

-- Mission states
   MS_INIT = 1
   MS_INITIAL_JUNKIES_ATTACK = 2
   MS_REAL_ATTACK_STARTS = 3
   MS_WAITING_FOR_PIERCE = 4
   MS_LOADING_TRUCK = 5
   MS_TRUCK_LOADED = 6
   MS_TRAVELING_TO_BASE = 7
   MS_VICTORY = 8

-- Groups, NPCs, vehicles, navpoints, and other names
   -- Mission constant names
   MISSION_NAME = "ss08"
   -- ( Mission Prefix )
   MP = MISSION_NAME.."_$"

   CHASE_GROUP_GROUP_PREFIX = MP.."Chase_Group"
   CHASE_GROUP_OBJECT_PREFIX = MP.."CG_"
   CHASE_GROUP_NPC_SUFFIX = "_M"
   CHASE_GROUP_VEHICLE_SUFFIX = "_V"
   CHASE_GROUP_TRIGGER_SUFFIX = "_T"

   WEST = 1
   EAST = 2
   SOUTH = 3

   POLICE_GANG = "police"

   -- Checkpoints
   CP_TRUCK_LOADED = "Truck_Loaded"

   -- Loading states - for loading packages
   LS_NONE = 0
   LS_CARRYING_TO_DROPOFF = 1
   LS_MOVING_TO_PICK_UP = 2
   LS_WAITING_AT_DROPOFF = 3
   LS_WAITING_AT_PICKUP = 4
   LS_DISABLED = 5
   LS_JUST_REVIVED = 6

   -- Groups
   HOMIES_GROUP = MP.."Saint_Homies"
   DRUG_TRUCK_LOADING_GROUP = MP.."Drug_Truck_Loading"
   DRUG_TRUCK_GROUP = MP.."Drug_Truck"
   JUNKIES_GROUP = MP.."Initial_Attack_Junkies"
   ESCAPE_CAR_GROUP = MP.."Escape_Car"
   CUTSCENE_GROUP = MP.."Cutscene"
   OUTSIDE_OF_WAREHOUSE_AMBUSHER_GROUP = MP.."Outside_of_Warehouse_Ambush"
   PATH_AMBUSHER_GROUPS = { MP.."Path_Ambush_01", MP.."Path_Ambush_02" }

   ALL_ATTACK_SQUADS = { [WEST] = MP.."West_01", [EAST] = MP.."East_01", [SOUTH] = MP.."South_01" }

   CHASE_SQUAD_GROUP_NAMES = {}

   DRUG_BOXES_GROUP = MP.."Drug_Boxes"

   RANDOM_CHASE_SQUAD_GROUPS = { MP.."Random_Chase_Squad1", MP.."Random_Chase_Squad2", MP.."Random_Chase_Squad3" }

   -- NPC names
   INITIAL_ATTACK_JUNKIE_NAMES = { MP.."Initial_Junkie01", MP.."Initial_Junkie02", MP.."Initial_Junkie03",
                                   MP.."Initial_Junkie04", MP.."Initial_Junkie05", MP.."Initial_Junkie06" }
   PIERCE_NAME = MP.."Pierce"
   SHAUNDI_NAME = MP.."Shaundi"
   WEST_ATTACK_SQUAD_MEMBERS = { MP.."West_01_M01", MP.."West_01_M02", MP.."West_01_M03" }
   EAST_ATTACK_SQUAD_MEMBERS = { MP.."East_01_M01", MP.."East_01_M02", MP.."East_01_M03" }
   SOUTH_ATTACK_SQUAD_MEMBERS = { MP.."South_01_M01", MP.."South_01_M02", MP.."South_01_M03" }

   ATTACK_SQUADS_MEMBERS = { [WEST] = WEST_ATTACK_SQUAD_MEMBERS, [EAST] = EAST_ATTACK_SQUAD_MEMBERS,
                             [SOUTH] = SOUTH_ATTACK_SQUAD_MEMBERS }

   OUTSIDE_OF_WAREHOUSE_AMBUSHER_MEMBERS = { MP.."Ambusher_01", MP.."Ambusher_02", MP.."Ambusher_03" }

   PATH_AMBUSHER_GROUPS_MEMBERS = { { MP.."PA1_M01", MP.."PA1_M02", MP.."PA1_M03" },
                                    { MP.."PA2_M01", MP.."PA2_M02", MP.."PA2_M03" } }

   RANDOM_CHASE_SQUAD_MEMBERS = { { MP.."RC1_M1", MP.."RC1_M2" },
                                  { MP.."RC2_M1", MP.."RC2_M2" },
                                  { MP.."RC3_M1", MP.."RC3_M2", MP.."RC3_M3", MP.."RC3_M4" } }

   CHASE_SQUAD_GROUP_MEMBERS = {}

   -- Vehicle names
   DRUG_TRUCK_LOADING = MP.."Drug_Truck_02"
   DRUG_TRUCK = MP.."Drug_Truck"

   ATTACK_SQUAD_VEHICLES = { [EAST] =  MP.."East_V1", [WEST] = MP.."West_V1",
                             [SOUTH] = MP.."South_V1" }

   ESCAPE_CAR_NAME = MP.."Escape_Car"

   RANDOM_CHASE_SQUAD_VEHICLES = { MP.."RC1_V", MP.."RC2_V", MP.."RC3_V" }

   CHASE_SQUAD_GROUP_VEHICLES = {}

   -- Navpoints
   PLAYER1_START = MP.."Player1_Start"
   PLAYER2_START = MP.."Player2_Start"
   BOX_PICKUP_NAV = MP.."Box_Pickup_Position"
   BOX_DROPOFFS = { [PIERCE_NAME] = MP.."Pierce_Dropoff", [SHAUNDI_NAME] = MP.."Shaundi_Dropoff" }

   BOX_LOADING_TARGET = MP.."Box_Loading_Target"

   PIERCE_GET_TRUCK_PATH = { MP.."PE_00", MP.."PE_01", MP.."PE_02", MP.."PE_03",
                             MP.."PE_04", MP.."PE_05", MP.."PE_06", MP.."PE_07",
                             MP.."PE_08", MP.."PE_09", MP.."PE_10", MP.."PE_11" }
   PIERCE_RETURN_TO_LOAD_TRUCK_PATH = { MP.."PR_01", MP.."PR_02", MP.."PR_03",
                                        MP.."PR_04", MP.."PR_05" }

   ATTACK_VEHICLE_PATHS = { [EAST] = MP.."Attack_Path_East", [WEST] = MP.."Attack_Path_West",
                            [SOUTH] = MP.."Attack_Path_South" }

   BACK_TO_HQ_PATH_INITIAL = MP.."THQ_Initial_Path"
   BACK_TO_HQ_PATHS_MAIN = { MP.."THQ_01", MP.."THQ_02" }

   BACK_TO_HQ_PATH_FINAL = MP.."THQ_Final_Path"

   DROPOFF_POINTS = { [EAST] = { MP.."Dropoff_E01", MP.."Dropoff_E02", MP.."Dropoff_E03", MP.."Dropoff_E04", MP.."Dropoff_E05" },
                      [WEST] = { MP.."Dropoff_W01", MP.."Dropoff_W02", MP.."Dropoff_W03", MP.."Dropoff_W04", MP.."Dropoff_W05" },
                      [SOUTH] = { MP.."Dropoff_S01", MP.."Dropoff_S02", MP.."Dropoff_S03", MP.."Dropoff_S04" } }

   AMBUSHER_GOALS = { MP.."Ambusher01_Goal", MP.."Ambusher02_Goal", MP.."Ambusher03_Goal" }

   RANDOM_CHASE_SQUAD_SPAWN_LOCATIONS = { MP.."Path_Spawn01", MP.."Path_Spawn02", MP.."Path_Spawn03", MP.."Path_Spawn04",
                                          MP.."Path_Spawn05", MP.."Path_Spawn06", MP.."Path_Spawn07", MP.."Path_Spawn08",
                                          MP.."Path_Spawn09", MP.."Path_Spawn10", MP.."Path_Spawn11", MP.."Path_Spawn12",
                                          MP.."Path_Spawn13", MP.."Path_Spawn14", MP.."Path_Spawn15", MP.."Path_Spawn16",
                                          MP.."Path_Spawn17" }

   ARRIVAL_NAVPOINTS = { [LOCAL_PLAYER] = MP.."P1_Arrival", [REMOTE_PLAYER] = MP.."P2_Arrival" }

   -- Triggers
   WAREHOUSE_AREA = MP.."Warehouse_Area"

   SAINTS_HQ = MP.."Saints_HQ"

   CHASE_SQUAD_TRIGGER_NAMES = {}
   OUTSIDE_OF_WAREHOUSE_AMBUSH_TRIGGER = MP.."Outside_of_Warehouse_Ambush"
   PATH_AMBUSHER_TRIGGERS = { MP.."Path_Ambush_01_Trigger", MP.."Path_Ambush_02_Trigger" }

   -- Movers
   DRUG_BOXES = { MP.."Drug_Box_01", MP.."Drug_Box_02", MP.."Drug_Box_03", MP.."Drug_Box_04", MP.."Drug_Box_05",
                  MP.."Drug_Box_06", MP.."Drug_Box_07", MP.."Drug_Box_08", MP.."Drug_Box_09", MP.."Drug_Box_10",
                  MP.."Drug_Box_11", MP.."Drug_Box_12" }
   GARAGE_DOOR = MP.."Garage_Door"
   DOORS = { MP.."Door01", MP.."Door02", MP.."Door03" }

   -- Effects and animation states

   -- Weapons
   CHASE_SQUAD_HEAVY_WEAPONS = { "twelve_gauge", "gal43" }
   CHASE_SQUAD_THROWN_WEAPONS = { "molotov" }
   CHASE_SQUAD_LIGHT_WEAPONS = { "beretta" }
   
   -- Cutscenes
   ARRIVAL_CUTSCENE_NAME = "ig_ss08_scene0"
   SEATING_CUTSCENE_NAME = "ig_ss08_scene1"
   CT_INTRO = "ss08-01"
   CT_OUTRO = "ss08-02"
-- Sound
   -- Persona overrides
   SHAUNDI_JUNKIE_COMBAT_PERSONA_OVERRIDES = { { "combat - congratulate self", "SHAUNDI_SOS8_CONGRAT" },
                                               { "threat - damage received (firearm)", "SHAUNDI_SOS8_TAKEDAM" },
                                               { "threat - damage received (melee)", "SHAUNDI_SOS8_TAKEDAM" } }

   -- Lines/Dialog Stream
   PIERCE_COMPLAINING_DIALOG_STREAM = { { "SOS8_GRIPE_L1", PIERCE_NAME } }
   PLAYER_RESPONSE_TO_GRIPE_DIALOG_STREAM = { { "PLAYER_SOS8_GRIPE_L2", LOCAL_PLAYER } }

   GET_THE_TRUCK_DIALOG_STREAM = { { "SOS8_TRUCK_L1", SHAUNDI_NAME, 0 },
                                   { "PLAYER_SOS8_TRUCK_L2", LOCAL_PLAYER, 0 },
                                   { "SOS8_TRUCK_L3", PIERCE_NAME, 0 } }

   PIERCE_RETURNS_DIALOG_STREAM = { { "SOS8_RETURN_L1", PIERCE_NAME },
                                    { "PLAYER_SOS8_RETURN_L2", LOCAL_PLAYER } }

   SHAUNDI_AND_PIERCE_ARGUE_DIALOG_STREAM = { { "SOS8_BICKER_L1", SHAUNDI_NAME },
                                              { "SOS8_BICKER_L2", PIERCE_NAME },
                                              { "SOS8_BICKER_L3", SHAUNDI_NAME },
                                              { "SOS8_BICKER_L4", PIERCE_NAME },
                                              { "SOS8_BICKER_L5", SHAUNDI_NAME },
                                              { "SOS8_BICKER_L6", PIERCE_NAME },
                                              { "SOS8_BICKER_L7", SHAUNDI_NAME },
                                              { "SOS8_BICKER_L8", PIERCE_NAME } }

   TRUCK_LOADED_DIALOG_STREAM = { { "SOS8_COMPLETE_L1", PIERCE_NAME },
                                  { "PLAYER_SOS8_COMPLETE_L2", LOCAL_PLAYER } }

   END_MISSION_DIALOG_STREAM = { { "SOS8_END_L1", PIERCE_NAME },
                                 { "SOS8_END_L2", SHAUNDI_NAME },
                                 { "SOS8_END_L3", PIERCE_NAME } }

   SHAUNDI_DEFENDING_LINES = "SHAUNDI_SOS8_DEFEND"
   SHAUNDI_WHATS_TAKING_SO_LONG_LINE = "SHAUNDI_SOS8_TRUCK_02"

   -- Sound effects

-- Distances
   WAREHOUSE_AREA_TRIGGER_RADIUS_METERS = 34.8
   DRUG_TRUCK_MAX_DISTANCE_METERS = 50.0
   TO_HQ_WIN_DISTANCE_METERS = 10

-- Percents and multipliers

-- Time values
   FAILURE_TIME_MS = 30000

   TIME_PER_ABANDONED_UPDATE_SECONDS = 5

   BEFORE_ATTACK_DELAY_SECONDS = 6.0
   BEFORE_DEFEND_PROMPT_SECONDS = 3.5

   WAIT_FOR_PIERCE_TIME_MS = 120000
   WHERE_IS_PIERCE_MESSAGE_DELAY_SECONDS = 60.0
   NEW_ENTRANCE_ATTACK_DELAY_SECONDS = 30.0
   -- The delay before spawning a new wave if the attackers
   -- during the siege falls below a certain number.
   BELOW_MIN_ATTACKERS_FORCE_SPAWN_DELAY_SECONDS = 10.0
   OUT_OF_RANGE_OF_TRUCK_FAIL_TIME_MS = 30000
   MIN_BETWEEN_LINES_DELAY_SECONDS = 8
   MAX_BETWEEN_LINES_DELAY_SECONDS = 16
   BEFORE_LOAD_PACKAGES_CONVERSATION_TIME_SECONDS = 15
   RANDOM_CHASE_SQUAD_SPAWN_INTERVAL_SECONDS = 15.0

-- Speeds
   DRUG_TRUCK_INITIAL_SPEED_MPH = 20
   DRUG_TRUCK_DESIRED_SPEED_MPH = 30

-- Constant values and counts
   -- The minimum number of attackers allowed during the siege.
   -- If the attackers fall below this number, a timer is
   -- started for a new attack wave.
   MIN_ATTACKERS = 3
   NUM_ATTACK_DIRECTIONS = 3
   NUM_DRUG_BOXES = sizeof_table( DRUG_BOXES )
   INITIAL_DRUG_TRUCK_HP = 48000

   CHASE_SQUAD_MEMBER_COUNTS = { 2, 2, 2, 2, 2, 2, 2, 2,
                                 2, 2, 2, 2, 2, 2, 2 }
   NUM_CHASE_SQUADS = sizeof_table( CHASE_SQUAD_MEMBER_COUNTS )
   MAX_CHASING_CARS = 2

   WAVES_BEFORE_DUAL_ATTACK = 2

   FAILURE_TIME_INDEX = 0
   OBJECTIVE_TIME_INDEX = 1

   RANDOM_CHASE_SQUAD_COUNT = sizeof_table( RANDOM_CHASE_SQUAD_GROUPS )

   -- The number of dropoffs available in each direction
   DROPOFF_COUNTS = { [WEST] = sizeof_table( DROPOFF_POINTS[WEST] ),
                      [EAST] = sizeof_table( DROPOFF_POINTS[EAST] ),
                      [SOUTH] = sizeof_table( DROPOFF_POINTS[SOUTH] ) }

-- Global variables
   Initial_junkies_remaining = sizeof_table( INITIAL_ATTACK_JUNKIE_NAMES )
   Players_in_warehouse_area = { [LOCAL_PLAYER] = true, [REMOTE_PLAYER] = true }
   Abandoned_warehouse_failure_threads = { [LOCAL_PLAYER] = INVALID_THREAD_HANDLE, [REMOTE_PLAYER] = INVALID_THREAD_HANDLE }

   Cur_attack_directions = {}
   Cur_attackers_remaining = 0
   Cur_drug_boxes_remaining = NUM_DRUG_BOXES

   Homie_drug_carry_states = { [PIERCE_NAME] = LS_NONE, [SHAUNDI_NAME] = LS_NONE }
   Homie_drug_carry_threads = { [PIERCE_NAME] = INVALID_THREAD_HANDLE, [SHAUNDI_NAME] = INVALID_THREAD_HANDLE }

   Player_failure_countdown_threads = { [LOCAL_PLAYER] = INVALID_THREAD_HANDLE, [REMOTE_PLAYER] = INVALID_THREAD_HANDLE }
   Assault_turned_on = false
   Pierce_leaves_thread_handle = INVALID_THREAD_HANDLE
   Chase_squad_cars_chasing = {}
   Force_spawn_thread_handle = INVALID_THREAD_HANDLE
   Force_spawn_wave_index = 0

   Num_junkie_attack_waves_defeated = 0

   Num_chasing_cars = 0
   Last_random_chase_group_index = 0

   Players_in_range_of_drug_truck = { [LOCAL_PLAYER] = false, [REMOTE_PLAYER] = false }
   Players_in_vehicle = { [LOCAL_PLAYER] = false, [REMOTE_PLAYER] = false }
   Followers_incapacitated = { [PIERCE_NAME] = false, [SHAUNDI_NAME] = false }
   Garage_door_open = false
   Whos_carrying_drug_boxes = { [DRUG_BOXES[1]] = nil, [DRUG_BOXES[2]] = nil, [DRUG_BOXES[3]] = nil,
                                [DRUG_BOXES[4]] = nil, [DRUG_BOXES[5]] = nil, [DRUG_BOXES[6]] = nil,
                                [DRUG_BOXES[7]] = nil, [DRUG_BOXES[8]] = nil, [DRUG_BOXES[9]] = nil,
                                [DRUG_BOXES[10]] = nil, [DRUG_BOXES[11]] = nil, [DRUG_BOXES[12]] = nil }


   -- Index into DROPOFF_POINTS - the last dropoff index that was used
   -- from each direction. Initial value of zero denotes no dropoffs yet used
   Last_dropoff_indices = { [WEST] = 0, [EAST] = 0, [SOUTH] = 0 }
   Mission_won = false
   Drug_boxes_queued = 0
   Drug_boxes_loaded = 0
   Truck_waiting = false
   Group_spawning = false
	Pierce_has_returned = false
   Argue_converstation_thread_handle = INVALID_THREAD_HANDLE

function ss08_mission_critical_follower_dismissed( follower_name )
   if ( follower_name == PIERCE_NAME ) then
      mission_end_failure( MISSION_NAME, HT_PIERCE_ABANDONED )
   elseif ( follower_name == SHAUNDI_NAME ) then
      mission_end_failure( MISSION_NAME, HT_SHAUNDI_ABANDONED )
   end
end

function ss08_mission_critical_homie_died( homie_name )
   if ( homie_name == PIERCE_NAME ) then
      mission_end_failure( MISSION_NAME, HT_PIERCE_DIED )
   elseif ( homie_name == SHAUNDI_NAME ) then
      mission_end_failure( MISSION_NAME, HT_SHAUNDI_DIED )
   end
end

function ss08_all_players( player_conditions )
   if ( player_conditions[LOCAL_PLAYER] ) then
      if ( coop_is_active() ) then
         if ( player_conditions[REMOTE_PLAYER] ) then
            return true
         end
      else
         return true
      end
   end
   return false
end

function ss08_all_players_not( player_conditions )
   if ( player_conditions[LOCAL_PLAYER] == false ) then
      if ( coop_is_active() ) then
         if ( player_conditions[REMOTE_PLAYER] == false ) then
            return true
         end
      else
         return true
      end
   end
   return false
end

-- Returns true if all active players are out of range of the 
-- drug truck, false otherwise.
--
function ss08_all_players_out_of_range_of_truck()
   return ss08_all_players_not( Players_in_range_of_drug_truck )
end

function ss08_all_players_in_of_range_of_truck()
   return ss08_all_players( Players_in_range_of_drug_truck )
end

function ss08_all_players_in_vehicle()
   return ss08_all_players( Players_in_vehicle )
end

function ss08_all_players_in_warehouse_area()
   return ss08_all_players( Players_in_warehouse_area )
end


function ss08_all_players_outside_warehouse_area()
   return ss08_all_players_not( Players_in_warehouse_area )
end

-- Tracks incapacitation while the boxes are being loaded
-- so that the boxes won't be 'loaded' when one of the people
-- isn't loading them.
-- 
function ss08_follower_incapacitated( follower_name )
   local drug_thread_handle = Homie_drug_carry_threads[follower_name]
   if ( drug_thread_handle ~= INVALID_THREAD_HANDLE ) then
      thread_kill( drug_thread_handle )
      Homie_drug_carry_threads[follower_name] = INVALID_THREAD_HANDLE
   end

   for drug_box, whos_carrying in pairs( Whos_carrying_drug_boxes ) do
      if ( whos_carrying == follower_name ) then
         Drug_boxes_queued = Drug_boxes_queued - 1
         Whos_carrying_drug_boxes[drug_box] = nil
         item_drop( drug_box, follower_name )
         item_reset( drug_box )
      end
   end
end

-- If a follower is revived while the boxes are being loaded,
-- this function checks to see if both followers are not
-- incapacitated and if so, resumes the loading.
--
function ss08_follower_revived( follower_name )
   Homie_drug_carry_threads[follower_name] = thread_new( "ss08_homie_load_drugs", follower_name )
end

function ss08_shaundi_revived()
end

function ss08_open_doors( open )
   if ( open == nil ) then
      open = true
   end

   if ( open ) then
      for index, name in pairs( DOORS ) do
         door_open( name )
      end
   else
      for index, name in pairs( DOORS ) do
         door_close( name )
      end
   end
end

function ss08_hide_doors( hide )
   if ( hide == nil ) then
      hide = true
   end

   if ( hide ) then
      for index, name in pairs( DOORS ) do
         door_lock( name, true )
         mesh_mover_hide( name )
      end
   else
      for index, name in pairs( DOORS ) do
         door_lock( name, false )
         mesh_mover_show( name )
      end
   end
end

-- Works for numbers 0-99.
function ss08_get_zero_prefixed( number )
   local prefixed = nil
   if ( number < 10 ) then
      prefixed = "0"..number
   else
      prefixed = number
   end

   return prefixed
end

function ss08_generate_chase_squad_trigger_and_group_names()
   for i = 1, NUM_CHASE_SQUADS do
      local index = ss08_get_zero_prefixed( i )
      CHASE_SQUAD_TRIGGER_NAMES[i] = CHASE_GROUP_OBJECT_PREFIX..index..CHASE_GROUP_TRIGGER_SUFFIX
      CHASE_SQUAD_GROUP_NAMES[i] = CHASE_GROUP_GROUP_PREFIX..index
   end
end

function ss08_generate_chase_squad_vehicle_names()
   for i = 1, NUM_CHASE_SQUADS do
      local index = ss08_get_zero_prefixed( i )
      CHASE_SQUAD_GROUP_VEHICLES[i] = CHASE_GROUP_OBJECT_PREFIX..index..CHASE_GROUP_VEHICLE_SUFFIX
   end
end

function ss08_generate_chase_squad_group_member_names()
   -- Go through all the group member counts
   for group_index, member_count in pairs( CHASE_SQUAD_MEMBER_COUNTS ) do
      -- For each member in the group
      local group_members = {}
      local group_index_prefixed = ss08_get_zero_prefixed( group_index )
      for member_index = 1, member_count do
         -- Construct its name
         local member_index_prefixed = ss08_get_zero_prefixed( member_index )
         group_members[member_index] = CHASE_GROUP_OBJECT_PREFIX..group_index_prefixed..CHASE_GROUP_NPC_SUFFIX..member_index_prefixed
      end

      -- Add this group's members to the overall list
      CHASE_SQUAD_GROUP_MEMBERS[group_index] = group_members
   end
end

function ss08_entered_warehouse_area( triggerer_name, trigger_name )
   Players_in_warehouse_area[triggerer_name] = true
   local sync_type = sync_from_player( triggerer_name )
   minimap_icon_remove_navpoint( WAREHOUSE_AREA, sync_type )
   ss08_stop_failure_countdown( triggerer_name )
end

function ss08_left_warehouse_area( triggerer_name, trigger_name )
   Players_in_warehouse_area[triggerer_name] = false
   local sync_type = sync_from_player( triggerer_name )
   minimap_icon_add_navpoint_radius( WAREHOUSE_AREA, MINIMAP_ICON_LOCATION, WAREHOUSE_AREA_TRIGGER_RADIUS_METERS, nil, sync_type )
   ss08_start_failure_countdown( triggerer_name )
end

-- This function starts a failure countdown for the passed-in player.
--
-- player_name: Name of the player to start failure countdown for.
--
function ss08_start_failure_countdown( player_name )
   local sync_type = sync_from_player( player_name )

   Abandoned_warehouse_failure_threads[player_name] = thread_new( "ss08_abandoned_warehouse_fail_timer", sync_type )
end

function ss08_abandoned_warehouse_fail_timer( sync_type )
   local cur_time_left_seconds = FAILURE_TIME_MS / 1000
   mission_help_table_nag( HT_GET_BACK_TO_WAREHOUSE, cur_time_left_seconds, "", sync_type )
   while ( cur_time_left_seconds > 0 ) do
      delay( TIME_PER_ABANDONED_UPDATE_SECONDS )
      cur_time_left_seconds = cur_time_left_seconds - TIME_PER_ABANDONED_UPDATE_SECONDS
      mission_help_table_nag( HT_GET_BACK_TO_WAREHOUSE, cur_time_left_seconds, "", sync_type )
   end

   mission_end_failure( MISSION_NAME, HT_WAREHOUSE_ABANDONED )
end

-- This function stops the failure countdown if one is on.
--
-- player_name: Name of the player to stop the failure timer of.
--
function ss08_stop_failure_countdown( player_name )
   if ( Abandoned_warehouse_failure_threads[player_name] ~= INVALID_THREAD_HANDLE ) then
      thread_kill( Abandoned_warehouse_failure_threads[player_name] )
      Abandoned_warehouse_failure_threads[player_name] = INVALID_THREAD_HANDLE
   end
end

function ss08_abandoned_drugs()
   mission_end_failure( MISSION_NAME, HT_WAREHOUSE_ABANDONED )
end

function ss08_create_start_and_checkpoint_shared_groups( blocking_load )
	if ( group_is_loaded( ESCAPE_CAR_GROUP ) == false ) then
		group_create_hidden( ESCAPE_CAR_GROUP, blocking_load )
	end
	group_create_hidden( OUTSIDE_OF_WAREHOUSE_AMBUSHER_GROUP, blocking_load )
	for index, group_name in pairs( PATH_AMBUSHER_GROUPS ) do
		group_create_hidden( group_name, blocking_load )
	end
	for index, name in pairs( RANDOM_CHASE_SQUAD_GROUPS ) do
		group_create_hidden( name, blocking_load )
	end
end

function ss08_start( checkpoint_name, is_restart )
   -- Start trigger is hit...the activate button was hit
   set_mission_author("Mark G. & Brad Johnson")

   party_allow_max_followers( true )

   mission_start_fade_out()
   if ( checkpoint_name == MISSION_START_CHECKPOINT ) then
		-- Cutscene and blocking group creation
		if (not is_restart) then
			cutscene_play( CT_INTRO, { HOMIES_GROUP, JUNKIES_GROUP, DRUG_BOXES_GROUP }, { PLAYER1_START, PLAYER2_START }, false )
		else
			teleport_coop(PLAYER1_START, PLAYER2_START)
			group_create_hidden( HOMIES_GROUP, true )
			group_create_hidden( JUNKIES_GROUP, true )
			group_create_hidden( DRUG_BOXES_GROUP, true )
		end

		-- Show groups that should be visible at mission start checkpoint
		group_show( HOMIES_GROUP )
		group_show( JUNKIES_GROUP )
		group_show( DRUG_BOXES_GROUP )

		parking_spot_enable( "parking_spots_$parking_341 (1)", false )
		parking_spot_enable( "parking_spots_$parking_341 (0)", false )

		-- Non-blocking group creation for mission start
		ss08_create_start_and_checkpoint_shared_groups( false )
   end

   ss08_generate_chase_squad_trigger_and_group_names()
   ss08_generate_chase_squad_group_member_names()
   ss08_generate_chase_squad_vehicle_names()
   ss08_hide_doors()

   local next_state = nil
   local dont_play_cutscene = false

   -- Create the ambush groups
   if ( checkpoint_name == MISSION_START_CHECKPOINT ) then
      teleport_coop( PLAYER1_START, PLAYER2_START )
      next_state = MS_INIT
   else --if ( checkpoint_name == CP_TRUCK_LOADED ) then
		teleport_coop( ARRIVAL_NAVPOINTS[LOCAL_PLAYER], ARRIVAL_NAVPOINTS[REMOTE_PLAYER] )

		-- Create these groups blocking, because we need them right after the checkpoint
		-- blocking_load = true
		ss08_create_start_and_checkpoint_shared_groups( true )

		group_create( DRUG_TRUCK_GROUP, true )

      follower_make_independent( PIERCE_NAME, true )
      follower_make_independent( SHAUNDI_NAME, true )		
		teleport( SHAUNDI_NAME, MP.."Pre_Enter_Shaundi", true )
		teleport( PIERCE_NAME, MP.."Pre_Enter_Pierce", true )

      vehicle_enter_group_teleport( { PIERCE_NAME, SHAUNDI_NAME }, DRUG_TRUCK )
      vehicle_suppress_npc_exit( DRUG_TRUCK, true )
      set_unjackable_flag( DRUG_TRUCK, true )

      dont_play_cutscene = true
      next_state = MS_TRUCK_LOADED
   end

   mission_start_fade_in()

	mission_debug( "switching to initial state from start function", 15 )
   ss08_switch_state( next_state, dont_play_cutscene )
end

function ss08_argue_conversation()
   delay( BEFORE_LOAD_PACKAGES_CONVERSATION_TIME_SECONDS )
   audio_play_conversation( SHAUNDI_AND_PIERCE_ARGUE_DIALOG_STREAM, NOT_CALL )
end

-- Switches to a new mission state.
--
-- new_state: The state to switch to.
-- extra_data: Extra information on the state change.
--             For MS_TRUCK_LOADED, sets whether or not
--             to play the cutscene ( default yes. )
--
function ss08_switch_state( new_state, extra_data )
   if ( new_state == MS_INIT ) then
      -- Spawn the junkies
      for index, name in INITIAL_ATTACK_JUNKIE_NAMES do
	      on_death( "ss08_initial_junkie_died", name )
      end
      on_death( "ss08_mission_critical_homie_died", PIERCE_NAME )
      on_death( "ss08_mission_critical_homie_died", SHAUNDI_NAME )

      trigger_enable( WAREHOUSE_AREA, true )
      on_trigger( "ss08_entered_warehouse_area", WAREHOUSE_AREA )
      on_trigger_exit( "ss08_left_warehouse_area", WAREHOUSE_AREA )

      if ( coop_is_active() ) then
         party_add( SHAUNDI_NAME, REMOTE_PLAYER )
      else
         party_add( SHAUNDI_NAME, LOCAL_PLAYER )
      end
      party_add( PIERCE_NAME, LOCAL_PLAYER )
      on_dismiss( "ss08_mission_critical_follower_dismissed", PIERCE_NAME )
      on_dismiss( "ss08_mission_critical_follower_dismissed", SHAUNDI_NAME )
      thread_new( "ss08_before_attack_delay" )
   elseif ( new_state == MS_INITIAL_JUNKIES_ATTACK ) then

      -- Have them come at the player
      -- Track their status so that we know when they all die
      for index, name in INITIAL_ATTACK_JUNKIE_NAMES do
         attack_closest_player( name )
      end

      delay( BEFORE_DEFEND_PROMPT_SECONDS )
      audio_play_conversation( PLAYER_RESPONSE_TO_GRIPE_DIALOG_STREAM, NOT_CALL )
      mission_help_table( HT_DEFEND_THE_DUST, "", "", SYNC_ALL )

   elseif( new_state == MS_REAL_ATTACK_STARTS ) then
      audio_play_conversation( GET_THE_TRUCK_DIALOG_STREAM, NOT_CALL )

		-- Don't have Pierce run away until he's alive and well
		repeat
			thread_yield()
		until( character_is_ragdolled( PIERCE_NAME ) == false and character_is_dead( PIERCE_NAME ) == false )

		mission_debug( "Pierce is not ragdolled or dead." )
		-- Now make sure he can't be killed and have him run off
		turn_invulnerable( PIERCE_NAME )
      -- Have Pierce run away and then disappear when he gets far enough away
      Pierce_leaves_thread_handle = thread_new( "ss08_pierce_leaves" )
      -- Start a timer for Pierce's return.
      hud_timer_set( OBJECTIVE_TIME_INDEX, WAIT_FOR_PIERCE_TIME_MS, "ss08_pierce_returns" )
      -- Make the timer hidden
      hud_timer_hide( OBJECTIVE_TIME_INDEX, true )

      for index, override in pairs( SHAUNDI_JUNKIE_COMBAT_PERSONA_OVERRIDES ) do
         persona_override_character_start( SHAUNDI_NAME, override[1], override[2] )
      end

      -- Start the junkie attack
      ss08_start_junkie_attack()
   elseif ( new_state == MS_LOADING_TRUCK ) then
      -- This has to be set to allow box loading to work
      set_dont_drop_havok_weapons_on_idle( true )

      for index, override in pairs( SHAUNDI_JUNKIE_COMBAT_PERSONA_OVERRIDES ) do
         persona_override_character_stop( SHAUNDI_NAME, override[1] )
      end

      hud_timer_stop( OBJECTIVE_TIME_INDEX )
      hud_timer_hide( OBJECTIVE_TIME_INDEX, false )

      if ( Pierce_leaves_thread_handle ~= INVALID_THREAD_HANDLE ) then
         thread_kill( Pierce_leaves_thread_handle )
         Pierce_leaves_thread_handle = INVALID_THREAD_HANDLE
      end
      -- Get ready for the cutscene
      vehicle_mark_as_players( ESCAPE_CAR_NAME )
      spawning_vehicles( false )
      spawning_vehicles( true )
		spawning_pedestrians( false )
		spawning_pedestrians( true )
		trigger_enable(WAREHOUSE_AREA,false)
		on_trigger( "", WAREHOUSE_AREA )
      on_trigger_exit( "", WAREHOUSE_AREA )
		ss08_stop_failure_countdown( LOCAL_PLAYER )
		if coop_is_active() then
			ss08_stop_failure_countdown( REMOTE_PLAYER )
		end
      cutscene_play( ARRIVAL_CUTSCENE_NAME, DRUG_TRUCK_LOADING_GROUP, { ARRIVAL_NAVPOINTS[LOCAL_PLAYER], ARRIVAL_NAVPOINTS[REMOTE_PLAYER] } )
      -- Have every living junkie attack the player again, because the cutscene can stop them
		ss08_all_living_junkies_attack()

		on_trigger( "ss08_entered_warehouse_area", WAREHOUSE_AREA )
      on_trigger_exit( "ss08_left_warehouse_area", WAREHOUSE_AREA )
		trigger_enable(WAREHOUSE_AREA,true)
      group_hide("ss08_$Arrival_Cutscene")
      group_destroy("ss08_$Arrival_Cutscene")

      mesh_mover_play_action( GARAGE_DOOR, "start1")
      Garage_door_open = true
      
      -- Place the truck in the driveway with Pierce in the seat
      group_show( DRUG_TRUCK_LOADING_GROUP )
      on_vehicle_destroyed( "ss08_drug_truck_destroyed", DRUG_TRUCK_LOADING )
		teleport( PIERCE_NAME, "ss08_$cutscene_truck_half2" )
      character_show( PIERCE_NAME )
      --vehicle_enter_teleport( PIERCE_NAME, DRUG_TRUCK_LOADING, 0, true )
		--teleport_vehicle( DRUG_TRUCK_LOADING, DRUG_TRUCK_LOADING )

      -- Have Pierce come out of the truck and into the main area
      --vehicle_exit( PIERCE_NAME )
      party_add( PIERCE_NAME, LOCAL_PLAYER )
      follower_make_independent( PIERCE_NAME, true )
      set_unjackable_flag( DRUG_TRUCK_LOADING, true )
      vehicle_prevent_explosion_fling( DRUG_TRUCK_LOADING, true )
      vehicle_infinite_mass( DRUG_TRUCK_LOADING, true )

      local run = 2
      local retry_on_failure = true
      local move_and_fire = false
      move_to( PIERCE_NAME, PIERCE_RETURN_TO_LOAD_TRUCK_PATH, run, retry_on_failure, move_and_fire )

      audio_play_conversation( PIERCE_RETURNS_DIALOG_STREAM, NOT_CALL )
      mission_help_table( HT_PROTECT_WHILE_LOADING, "", "", SYNC_ALL )

      -- Once he's there, set him up to be the player's follower and start the loading sequence
      set_ignore_ai_flag( PIERCE_NAME, false )
      turn_vulnerable( PIERCE_NAME )
      on_dismiss( "ss08_mission_critical_follower_dismissed", PIERCE_NAME )

      -- Load up the drugs
      set_ignore_ai_flag( SHAUNDI_NAME, true )
      set_ignore_ai_flag( PIERCE_NAME, true )
      local walk = 1
      follower_make_independent( SHAUNDI_NAME, true )
		-- Have Shaundi get off a vehicle so that she doesn't get stuck on after she's 
		-- made independent
		vehicle_exit( SHAUNDI_NAME )
      on_incapacitated( "ss08_follower_incapacitated", PIERCE_NAME )
      on_incapacitated( "ss08_follower_incapacitated", SHAUNDI_NAME )
      on_revived( "ss08_follower_revived", PIERCE_NAME )
      on_revived( "ss08_follower_revived", SHAUNDI_NAME )
      objective_text( 0, HT_X_OF_Y_BOXES_LOADED, 0, NUM_DRUG_BOXES )
      Homie_drug_carry_threads[PIERCE_NAME] = thread_new( "ss08_homie_load_drugs", PIERCE_NAME )
      Homie_drug_carry_threads[SHAUNDI_NAME] = thread_new( "ss08_homie_load_drugs", SHAUNDI_NAME )
      Argue_converstation_thread_handle = thread_new( "ss08_argue_conversation" )

   elseif ( new_state == MS_TRUCK_LOADED ) then
      if ( Argue_converstation_thread_handle ~= INVALID_THREAD_HANDLE and
           thread_check_done( Argue_converstation_thread_handle ) == false ) then
         thread_kill( Argue_converstation_thread_handle )
      end
      Argue_converstation_thread_handle = INVALID_THREAD_HANDLE

      on_incapacitated( "", PIERCE_NAME )
      on_incapacitated( "", SHAUNDI_NAME )

      on_revived( "", PIERCE_NAME )
      on_revived( "", SHAUNDI_NAME )

      mission_debug( "Entered 'truck loaded' state.", 15 )

      -- Reset the "don't drop weapons on idle" flag because the boxes are done loading
      set_dont_drop_havok_weapons_on_idle( false )

      -- Wait until everyone is alive before stopping the attack and such
      repeat
         thread_yield()
      until ( ss08_homies_alive() )

      notoriety_force_no_spawn( POLICE_GANG, true )
      mission_debug( "Pierce and Shaundi alive. Spawning disabled...", 15 )

      -- Disable the in/out-of-warehouse tracking
      ss08_stop_failure_countdown( LOCAL_PLAYER )
      if ( coop_is_active() ) then
         ss08_stop_failure_countdown( REMOTE_PLAYER )
      end
      trigger_enable( WAREHOUSE_AREA, false )
      minimap_icon_remove_navpoint( WAREHOUSE_AREA )
      -- Turn off the assault
      Assault_turned_on = false

      -- Show the ambush groups
      group_show( OUTSIDE_OF_WAREHOUSE_AMBUSHER_GROUP )
      for index, group_name in pairs( PATH_AMBUSHER_GROUPS ) do
         group_show( group_name )
      end
      -- Setup the triggers for the path ambush groups
      for index, trigger_name in pairs( PATH_AMBUSHER_TRIGGERS ) do
         trigger_enable( trigger_name, true )
         on_trigger( "ss08_path_ambush_0"..index, trigger_name )
      end

      local skip_cutscene = false
      if ( extra_data == true ) then
         skip_cutscene = true
      end

      -- Don't play the conversation if the cutscene is skipped, because in this case
      -- Pierce and Shaundi are already in the truck
      if ( skip_cutscene == false ) then
         mission_debug( "Starting conversation...", 15 )
         -- Have the player tell Pierce that he's loaded the truck
         audio_play_conversation( TRUCK_LOADED_DIALOG_STREAM, NOT_CALL )
         mission_debug( "Conversation complete...", 15 )
      end

      -- Don't continue until Shaundi and Pierce are alive
      repeat
         thread_yield()
      until ( ss08_homies_alive() )
      mission_debug( "Pierce and Shaundi alive. Coming to cutscene...", 15 )

      if ( skip_cutscene == false ) then
         fade_out( 0 )
			teleport( SHAUNDI_NAME, MP.."Pre_Enter_Shaundi", true )
			teleport( PIERCE_NAME, MP.."Pre_Enter_Pierce", true )
         -- Hide all the boxes - in theory they should be "inside" the truck now
			group_hide( DRUG_BOXES_GROUP )
			group_destroy( DRUG_BOXES_GROUP )

         -- Hide Pierce and Shaundi so that there won't be any collision between them
         -- and the cutscene versions
         character_hide( SHAUNDI_NAME )
         character_hide( PIERCE_NAME )
         group_hide( DRUG_TRUCK_LOADING_GROUP )
         group_destroy( DRUG_TRUCK_LOADING_GROUP )
         -- Play the "Pierce and Shaundi board the truck" cutscene
         cutscene_play( SEATING_CUTSCENE_NAME, DRUG_TRUCK_GROUP, { ARRIVAL_NAVPOINTS[LOCAL_PLAYER], ARRIVAL_NAVPOINTS[REMOTE_PLAYER] } )

         -- The cutscene system leaves the group lying around for you to play with after the cutscene is done.
         -- Because we are working with imposters in the cutscene, we need to clean up the imposter group before using the real group.
         -- I group_hide the group first so that group_destroy will actually destroy the other objects, rather than just release-to-world.
         group_hide("ss08_$Cutscene")
         group_destroy("ss08_$Cutscene")

         -- Now that the cutscene is over, unhide the characters used by the cutscene.
         group_show( DRUG_TRUCK_GROUP )
         character_show( SHAUNDI_NAME )
         character_show( PIERCE_NAME )
      else
         -- Hide all the boxes - in theory they should be "inside" the truck now
			if ( group_is_loaded( DRUG_BOXES_GROUP ) ) then
				group_hide( DRUG_BOXES_GROUP )
				group_destroy( DRUG_BOXES_GROUP )
			end
      end

      -- Create the ambusher group
      group_show( OUTSIDE_OF_WAREHOUSE_AMBUSHER_GROUP )
      for index, name in pairs( OUTSIDE_OF_WAREHOUSE_AMBUSHER_MEMBERS ) do
         crouch_start( name )
         mission_debug( name.." was told to crouch.", 15 )
      end
      trigger_enable( OUTSIDE_OF_WAREHOUSE_AMBUSH_TRIGGER, true )
      on_trigger( "ss08_outside_of_warehouse_ambush", OUTSIDE_OF_WAREHOUSE_AMBUSH_TRIGGER )

      -- Put Shaundi and Pierce in the truck
      vehicle_speed_override( DRUG_TRUCK, 0 )
      vehicle_disable_chase( DRUG_TRUCK )
      vehicle_disable_flee( DRUG_TRUCK )
      vehicle_door_prevent_damage_detach( DRUG_TRUCK, "Door_BR", true )
      vehicle_door_prevent_damage_detach( DRUG_TRUCK, "Door_BL", true )
      vehicle_stop( DRUG_TRUCK )
      on_vehicle_destroyed( "ss08_drug_truck_destroyed", DRUG_TRUCK )

      if ( skip_cutscene == false ) then
         follower_make_independent( PIERCE_NAME, true )
         follower_make_independent( SHAUNDI_NAME, true )
			--delay( 2.0 )
			vehicle_enter_teleport( PIERCE_NAME, DRUG_TRUCK, 0 )
			vehicle_enter_teleport( SHAUNDI_NAME, DRUG_TRUCK, 1 )
         vehicle_suppress_npc_exit( DRUG_TRUCK, true )
         set_unjackable_flag( DRUG_TRUCK, true )
      end
      -- else: Pierce and Shaundi are already in the truck if the cutscene is skipped

      set_ignore_ai_flag( SHAUNDI_NAME, false )
      set_ignore_ai_flag( PIERCE_NAME, false )

      turn_invulnerable( PIERCE_NAME )
      turn_invulnerable( SHAUNDI_NAME )
      on_death( "", PIERCE_NAME )
      on_death( "", SHAUNDI_NAME )

      -- Let the player know what he should be doing
      if ( skip_cutscene == false ) then
         mission_help_table( HT_GET_DRUGS_TO_HQ, "", "", SYNC_ALL )
      end

      --mesh_mover_play_action( GARAGE_DOOR, "start2" )
      --Garage_door_open = false

      -- Show the player's escape car
      group_show( ESCAPE_CAR_GROUP )

      -- 
      thread_new( "ss08_check_for_state_change" )

      ss08_add_vehicle_enter_and_exit_callbacks( "ss08_entered_vehicle_escort_van_initial" )

      marker_add_vehicle( ESCAPE_CAR_NAME, MINIMAP_ICON_LOCATION, "" )
      waypoint_add( ESCAPE_CAR_NAME, SYNC_ALL )
      if ( skip_cutscene ) then
         mission_help_table_nag( HT_GET_A_CAR )
      else
         mission_help_table( HT_GET_A_CAR )
      end

      -- Have every living junkie attack the player again, because the cutscene can stop them
		ss08_all_living_junkies_attack()
      mission_set_checkpoint( CP_TRUCK_LOADED )

   elseif ( new_state == MS_TRAVELING_TO_BASE ) then
      thread_new( "ss08_maybe_spawn_random_chase_squad" )

      -- Add truck health display and tracking
      hud_bar_on(0, "Damage", HT_TRUCK_HEALTH )
      hud_bar_set_range(0, 0, 1.0, SYNC_ALL )
      hud_bar_set_value(0, 1.0, SYNC_ALL )
      set_max_hit_points( DRUG_TRUCK, INITIAL_DRUG_TRUCK_HP )
      set_current_hit_points( DRUG_TRUCK, INITIAL_DRUG_TRUCK_HP )
      on_take_damage( "ss08_drug_truck_damaged", DRUG_TRUCK )
      on_collision( "ss08_drug_truck_damaged", DRUG_TRUCK ) 

      -- Activate the obstacles and triggers for the trip back to HQ
      for index, name in pairs( CHASE_SQUAD_GROUP_NAMES ) do
         local chase_trigger_name = CHASE_SQUAD_TRIGGER_NAMES[index]
         trigger_enable( chase_trigger_name, true )
         on_trigger( "ss08_hit_chase_trigger", chase_trigger_name )
      end

      -- Activate the final objective trigger
      trigger_enable( SAINTS_HQ, true )
      on_trigger( "ss08_reached_hq", SAINTS_HQ )
      marker_add_trigger( SAINTS_HQ, "", INGAME_EFFECT_VEHICLE_LOCATION, SYNC_ALL )

      vehicle_infinite_mass( DRUG_TRUCK, true )
      set_cant_flee_flag( SHAUNDI_NAME, true )
      set_cant_flee_flag( PIERCE_NAME, true )
      vehicle_disable_chase( DRUG_TRUCK, true )
      vehicle_disable_flee( DRUG_TRUCK, true )
      vehicle_set_crazy( DRUG_TRUCK, true )

      -- Set the truck to pathfind to the Saints HQ
      vehicle_speed_override( DRUG_TRUCK, DRUG_TRUCK_INITIAL_SPEED_MPH )

      -- use_navmesh = true, stop_at_goal = false
      local p1_success = vehicle_pathfind_to( DRUG_TRUCK, BACK_TO_HQ_PATH_INITIAL, true, false )
      if ( p1_success == false ) then
         mission_debug( "Path one failed" )
      end
      vehicle_ignore_repulsors( DRUG_TRUCK, true )

      -- Require that the player be near the truck, once it gets out of the warehouse area
      distance_display_on( DRUG_TRUCK, 0, DRUG_TRUCK_MAX_DISTANCE_METERS, 0, DRUG_TRUCK_MAX_DISTANCE_METERS, SYNC_ALL )
      on_tailing_good( "ss08_in_range_of_truck" )
      on_tailing_too_far( "ss08_out_of_range_of_truck" )

      for index, path_name in pairs( BACK_TO_HQ_PATHS_MAIN ) do
         -- use_navmesh = false, stop_at_goal = false
         local p2_success = vehicle_pathfind_to( DRUG_TRUCK, path_name, false, false )
         if ( p2_success == false ) then
            mission_debug( "Path two failed" )
         end
      end

      ss08_add_vehicle_enter_and_exit_callbacks( "", "" )

      -- use_navmesh = true, stop_at_goal = true
      local p3_success = vehicle_pathfind_to( DRUG_TRUCK, BACK_TO_HQ_PATH_FINAL, true, true )
      if ( p3_success == false ) then
         mission_debug( "Path three failed" )
      end

      thread_new( "ss08_check_for_victory" )
   end
end

function ss08_all_living_junkies_attack()
	-- Go through all the squads in each direction
	for squad_index, squad in ATTACK_SQUADS_MEMBERS do
		-- Go through each member in each squad
		for junkie_index, junkie_name in pairs( squad ) do
			-- If this junkie isn't dead, then have him attack the player
			if ( character_is_released( junkie_name ) == false ) then
				if ( character_is_dead( junkie_name ) == false ) then
					local distance, player = get_dist_closest_player_to_object( junkie_name )
					attack_safe( junkie_name, player, false )
				end
			end
		end
	end
end

function ss08_homies_alive()
   if ( character_is_dead( PIERCE_NAME ) ) then
      return false
   end
   if ( character_is_dead( SHAUNDI_NAME ) ) then
      return false
   end

   return true
end

function ss08_add_vehicle_enter_and_exit_callbacks( enter_callback, exit_callback )
   if ( enter_callback == nil ) then
      enter_callback = ""
   end
   if ( exit_callback == nil ) then
      exit_callback = ""
   end

   -- Player callbacks
   on_vehicle_enter( enter_callback, LOCAL_PLAYER )
   on_vehicle_exit( exit_callback, LOCAL_PLAYER )
   if ( coop_is_active() ) then
      on_vehicle_enter( enter_callback, REMOTE_PLAYER )
      on_vehicle_exit( exit_callback, REMOTE_PLAYER )
   end

   -- Escape vehicle
   on_vehicle_enter( enter_callback, ESCAPE_CAR_NAME )
   on_vehicle_exit( exit_callback, ESCAPE_CAR_NAME )

   -- Attack squad vehicles
   for index, vehicle_name in pairs( ATTACK_SQUAD_VEHICLES ) do
      if ( vehicle_is_destroyed( vehicle_name ) == false ) then
         on_vehicle_enter( enter_callback, vehicle_name )
         on_vehicle_exit( exit_callback, vehicle_name )
      end
   end

   -- Chase squad vehicles
   for index, vehicle_name in pairs( CHASE_SQUAD_GROUP_VEHICLES ) do
      if ( vehicle_is_destroyed( vehicle_name ) == false ) then
         on_vehicle_enter( enter_callback, vehicle_name )
         on_vehicle_exit( exit_callback, vehicle_name )
      end
   end
end

function ss08_path_ambush_01( triggerer_name, trigger_name )
   if ( triggerer_name == SHAUNDI_NAME or triggerer_name == PIERCE_NAME or
        triggerer_name == LOCAL_PLAYER or triggerer_name == REMOTE_PLAYER ) then
      trigger_enable( trigger_name, false )

      for index, name in pairs( PATH_AMBUSHER_GROUPS_MEMBERS[1] ) do
         attack_safe( name, triggerer_name, false )
      end
   end
end

function ss08_path_ambush_02( triggerer_name, trigger_name )
   if ( triggerer_name == SHAUNDI_NAME or triggerer_name == PIERCE_NAME or
        triggerer_name == LOCAL_PLAYER or triggerer_name == REMOTE_PLAYER ) then
      trigger_enable( trigger_name, false )

      for index, name in pairs( PATH_AMBUSHER_GROUPS_MEMBERS[1] ) do
         attack_safe( name, triggerer_name, false )
      end
   end
end

-- Called when the "outside of warehouse ambush" trigger is hit - causes the-
-- ambushers lurking outside to attack the van.
--
function ss08_outside_of_warehouse_ambush( triggerer_name, trigger_name )
   if ( triggerer_name == SHAUNDI_NAME or triggerer_name == PIERCE_NAME or
        triggerer_name == LOCAL_PLAYER or triggerer_name == REMOTE_PLAYER ) then

      mission_debug( "ambush triggered by "..triggerer_name )

      trigger_enable( trigger_name, false )

      for index, name in pairs( OUTSIDE_OF_WAREHOUSE_AMBUSHER_MEMBERS ) do
         thread_new( "ss08_ambusher_ambush_truck", name, AMBUSHER_GOALS[index] )
      end
   end
end

function ss08_ambusher_ambush_truck( ambusher_name, ambusher_goal )
   npc_leash_remove( ambusher_name )
   crouch_stop( ambusher_name )

   attack_safe( ambusher_name, PIERCE_NAME, false )

   -- speed = run, retry_on_failure = false, move_and_fire = true
   move_to( ambusher_name, ambusher_goal, 2, false, true )
end


function ss08_entered_vehicle_during_escort( character_name, vehicle_name )
   Players_in_vehicle[character_name] = true
   mission_debug( character_name.." entered vehicle" )

   -- Add a callback for this vehicle if it's a script one. The random chase
   -- vehicles need their exit callbacks set to something else initially.
   if ( vehicle_name ~= nil ) then
      on_vehicle_exit( "ss08_left_vehicle_during_escort", vehicle_name )
   end

   if ( ss08_all_players_in_of_range_of_truck() and
        ss08_all_players_in_vehicle() ) then
      mission_debug( "Drug truck resuming" )
      vehicle_speed_override( DRUG_TRUCK, DRUG_TRUCK_DESIRED_SPEED_MPH )
      Truck_waiting = false
   end
end

function ss08_left_vehicle_during_escort( character_name )
   Players_in_vehicle[character_name] = false
   if ( ss08_all_players_in_vehicle() == false ) then
      mission_debug( "Left vehicle" )
      ss08_maybe_truck_start_waiting()
   end
end

function ss08_entered_vehicle_escort_van_initial( character_name )
   -- Update the "player in vehicle" status for both players
   if ( character_is_in_vehicle( LOCAL_PLAYER ) ) then
      Players_in_vehicle[LOCAL_PLAYER] = true
   end
   if ( coop_is_active() and character_is_in_vehicle( REMOTE_PLAYER ) ) then
      Players_in_vehicle[REMOTE_PLAYER] = true
   end
   -- Update the "player in range of truck" status for both players
   if ( get_dist( LOCAL_PLAYER, DRUG_TRUCK ) < DRUG_TRUCK_MAX_DISTANCE_METERS ) then
      Players_in_range_of_drug_truck[LOCAL_PLAYER] = true
   end
   if ( coop_is_active() and get_dist( REMOTE_PLAYER, DRUG_TRUCK ) < DRUG_TRUCK_MAX_DISTANCE_METERS ) then
      Players_in_range_of_drug_truck[REMOTE_PLAYER] = true
   end

   Players_in_vehicle[character_name] = true

   ss08_add_vehicle_enter_and_exit_callbacks( "ss08_entered_vehicle_during_escort",
                                              "ss08_left_vehicle_during_escort" )

   marker_remove_vehicle( ESCAPE_CAR_NAME )
   waypoint_remove( SYNC_ALL )

   mission_help_table( HT_ESCORT_TRUCK_TO_HIDEOUT )
   marker_add_vehicle( DRUG_TRUCK, MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE, SYNC_ALL )
end

function ss08_check_for_victory()
   while ( get_dist_char_to_nav( PIERCE_NAME, SAINTS_HQ ) > TO_HQ_WIN_DISTANCE_METERS ) do
      delay( 0 )
   end

   Mission_won = true
   mission_end_success( MISSION_NAME, CT_OUTRO )
end

function ss08_check_for_state_change()
   local neither_player_in_vehicle_and_in_range = true

   while ( neither_player_in_vehicle_and_in_range ) do
      -- 
      local distance = get_dist_char_to_nav( LOCAL_PLAYER, DRUG_TRUCK ) 
      if ( distance < DRUG_TRUCK_MAX_DISTANCE_METERS ) then
         local vehicle_type = get_char_vehicle_type( LOCAL_PLAYER )
         if ( vehicle_type ~= VT_NONE ) then
            neither_player_in_vehicle_and_in_range = false
         end
      end

      if ( coop_is_active() and neither_player_in_vehicle_and_in_range ) then
         distance = get_dist_char_to_nav( REMOTE_PLAYER, DRUG_TRUCK ) 
         if ( distance < DRUG_TRUCK_MAX_DISTANCE_METERS ) then
            local vehicle_type = get_char_vehicle_type( REMOTE_PLAYER )
            if ( vehicle_type ~= VT_NONE ) then
               neither_player_in_vehicle_and_in_range = false
	         end
         end
      end

      delay( 0 )
   end

	mission_debug( "switching to state MS_TRAVELING_TO_BASE from check_for_state_change", 15 )
   ss08_switch_state( MS_TRAVELING_TO_BASE )
end

function ss08_maybe_truck_start_waiting()
   if ( Truck_waiting == false ) then
      mission_debug( "Drug truck waiting" )
      mission_help_table( HT_PIERCE_WAITING_ON_YOU, SYNC_ALL )
      vehicle_speed_override( DRUG_TRUCK, 0 )
      Truck_waiting = true
   end
end

function ss08_in_range_of_truck( triggerer_name )
   mission_debug( triggerer_name.." in range" )
   Players_in_range_of_drug_truck[triggerer_name] = true

   if ( ss08_all_players_in_of_range_of_truck() and
        ss08_all_players_in_vehicle() ) then
      vehicle_speed_override( DRUG_TRUCK, DRUG_TRUCK_DESIRED_SPEED_MPH )
      Truck_waiting = false
   end
end

function ss08_out_of_range_of_truck( triggerer_name )
   mission_debug( triggerer_name.." out of range" )
   Players_in_range_of_drug_truck[triggerer_name] = false

   ss08_maybe_truck_start_waiting()
end

function ss08_get_chase_group_index_from_trigger_name( trigger_name )
   for index, name in pairs( CHASE_SQUAD_TRIGGER_NAMES ) do
      if ( name == trigger_name ) then
         return index
      end
   end
   return nil
end

function ss08_get_vehicle_group_index_from_name( vehicle_name )
   for index, name in pairs( CHASE_SQUAD_GROUP_VEHICLES ) do
      if ( name == vehicle_name ) then
         return index
      end
   end

   for index, name in pairs( RANDOM_CHASE_SQUAD_VEHICLES ) do
      if ( name == vehicle_name ) then
         return index + NUM_CHASE_SQUADS
      end
   end
   return nil
end

function ss08_get_npc_group_index_from_name( npc_name )
   for group_index, npc_list in pairs ( CHASE_SQUAD_GROUP_MEMBERS ) do
      for index, name in pairs( npc_list ) do
         if ( name == npc_name ) then
            return group_index
         end
      end
   end

   for group_index, npc_list in pairs( RANDOM_CHASE_SQUAD_MEMBERS ) do
      for index, name in pairs( npc_list ) do
         if ( name == npc_name ) then
            return group_index + NUM_CHASE_SQUADS
         end
      end
   end

   return nil
end

function ss08_hit_chase_trigger( triggerer_name, trigger_name )
   ss08_maybe_spawn_random_chase_squad()
   trigger_enable( trigger_name, false )
   --[[
   if ( Num_chasing_cars < MAX_CHASING_CARS ) then
      -- Disable the trigger so that this chase group only spawns once!
      trigger_enable( trigger_name, false )

      -- Find out which group we should spawn for this trigger
      local group_index = ss08_get_chase_group_index_from_trigger_name( trigger_name )

      Chase_squad_cars_chasing[group_index] = true

      -- 
      group_show( CHASE_SQUAD_GROUP_NAMES[group_index] )
      vehicle_enter_group_teleport( CHASE_SQUAD_GROUP_MEMBERS[group_index], CHASE_SQUAD_GROUP_VEHICLES[group_index] )

      on_vehicle_destroyed( "ss08_chase_car_destroyed", CHASE_SQUAD_GROUP_VEHICLES[group_index] )
      on_vehicle_exit( "ss08_attacker_leaves_chase_car", CHASE_SQUAD_GROUP_VEHICLES[group_index] )

      delay( 0 )
      local driver = get_char_in_vehicle( CHASE_SQUAD_GROUP_VEHICLES[group_index], 0)
      on_death( "ss08_chase_car_driver_killed", driver )

      -- 
--      local distance
--      local player
--      distance, player = get_dist_closest_player_to_object( driver )
      attack_safe( driver, SHAUNDI_NAME, false )
      Num_chasing_cars = Num_chasing_cars + 1
   end
   ]]
end

function ss08_find_nearest_chase_trigger_to_drug_truck()
   local closest_location = RANDOM_CHASE_SQUAD_SPAWN_LOCATIONS[1]
   local closest_dist = get_dist( DRUG_TRUCK, closest_location )

   for index, nav_name in pairs( RANDOM_CHASE_SQUAD_SPAWN_LOCATIONS ) do
      local cur_dist = get_dist( DRUG_TRUCK, nav_name )
      if ( cur_dist <= closest_dist --[[and ss08_navpoint_out_of_players_fov( nav_name )]] ) then
         closest_dist = cur_dist
         closest_location = nav_name
      end
   end

   return closest_location
end

function ss08_maybe_spawn_random_chase_squad()
   mission_debug( "rc spawning - waiting" )
   -- Only spawn one squad at a time in order to prevent overlap
   repeat
      thread_yield()
   until ( Group_spawning == false )

   if ( Num_chasing_cars < MAX_CHASING_CARS ) then
      Num_chasing_cars = Num_chasing_cars + 1

      mission_debug( "rc spawning - started", 15 )

      Group_spawning = true
      delay( RANDOM_CHASE_SQUAD_SPAWN_INTERVAL_SECONDS )

      -- Choose and create one of the chase groups
      local group_index = Last_random_chase_group_index + 1
      if ( group_index > RANDOM_CHASE_SQUAD_COUNT ) then
         group_index = 1
      end

      -- We record the random chase squads after the chase squads in the list
      -- of chasing cars
      Chase_squad_cars_chasing[group_index + NUM_CHASE_SQUADS] = true

      local group_to_load = RANDOM_CHASE_SQUAD_GROUPS[group_index]
      mission_debug( "rc spawning - decided to load group "..group_to_load, 15 )
      if ( group_is_loaded( group_to_load ) ) then
         release_to_world( group_to_load )
      end

      group_create( group_to_load, true )
      mission_debug( "rc spawning - loaded group "..group_to_load, 15 )

      local member_count = sizeof_table( RANDOM_CHASE_SQUAD_MEMBERS[group_index] )
      local num_with_heavy_weapons = rand_int( 2, member_count )
      local num_with_light_weapons = member_count - num_with_heavy_weapons

      -- Arm the members of the chase squad
      local function give_random_weapon( member_name, weapon_types )
         local weapon_index = rand_int( 1, sizeof_table( weapon_types ) )
         inv_item_add( weapon_types[weapon_index], 1, member_name )
         inv_item_add_ammo( member_name, weapon_types[weapon_index], 100 )
      end
      for index, member_name in pairs( RANDOM_CHASE_SQUAD_MEMBERS[group_index] ) do
         if ( index <= num_with_heavy_weapons ) then
            give_random_weapon( member_name, CHASE_SQUAD_HEAVY_WEAPONS )
         else
            give_random_weapon( member_name, CHASE_SQUAD_LIGHT_WEAPONS )
         end
         give_random_weapon( member_name, CHASE_SQUAD_THROWN_WEAPONS )
      end

      -- 
      vehicle_enter_group_teleport( RANDOM_CHASE_SQUAD_MEMBERS[group_index],
                                    RANDOM_CHASE_SQUAD_VEHICLES[group_index] )

      on_vehicle_enter( "ss08_entered_vehicle_during_escort", RANDOM_CHASE_SQUAD_VEHICLES[group_index] )

      on_vehicle_destroyed( "ss08_chase_car_destroyed", RANDOM_CHASE_SQUAD_VEHICLES[group_index] )
      on_vehicle_exit( "ss08_attacker_leaves_chase_car", RANDOM_CHASE_SQUAD_VEHICLES[group_index] )

      -- Wait for the driver to be seated
      delay( 0 )
      local driver = get_char_in_vehicle( RANDOM_CHASE_SQUAD_VEHICLES[group_index], 0)
      on_death( "ss08_chase_car_driver_killed", driver )

      -- Teleport the chase squad vehicle to the location and give chase
      -- Find the nearest chase trigger
      local location = ss08_find_nearest_chase_trigger_to_drug_truck()

      teleport_vehicle( RANDOM_CHASE_SQUAD_VEHICLES[group_index], location )
      mission_debug( "rc attacking" )
      for index, member_name in pairs( RANDOM_CHASE_SQUAD_MEMBERS[group_index] ) do
         attack_safe( member_name, PIERCE_NAME, false )
      end

      Last_random_chase_group_index = group_index

      -- Give the car some time to start chasing
      mission_debug( "rc delay" )
      delay( 3.0 )
      Group_spawning = false
      mission_debug( "rc spawning - done", 15 )
   end
end

function ss08_chase_car_removed( group_index )
   Num_chasing_cars = Num_chasing_cars - 1
   Chase_squad_cars_chasing[group_index] = false

   ss08_maybe_spawn_random_chase_squad()
end

function ss08_chase_car_driver_killed( driver_name )
   -- If a chase car's driver is killed, then remove the car's destroyed callback
   local group_index = ss08_get_npc_group_index_from_name( driver_name )

   if ( Chase_squad_cars_chasing[group_index] ) then
      if ( group_index <= NUM_CHASE_SQUADS ) then
         on_vehicle_destroyed( "", CHASE_SQUAD_GROUP_VEHICLES[group_index] )
         on_vehicle_exit( "", CHASE_SQUAD_GROUP_VEHICLES[group_index] )
         -- Remove the exit 
         for index, member_name in CHASE_SQUAD_GROUP_MEMBERS[group_index] do
            on_death( "", member_name )
         end
      else
         local rc_group_index = group_index - NUM_CHASE_SQUADS
         on_vehicle_destroyed( "", RANDOM_CHASE_SQUAD_VEHICLES[rc_group_index] )
         on_vehicle_exit( "ss08_left_vehicle_during_escort", RANDOM_CHASE_SQUAD_VEHICLES[rc_group_index] )
         -- Remove the exit 
         for index, member_name in RANDOM_CHASE_SQUAD_MEMBERS[rc_group_index] do
            on_death( "", member_name )
         end
      end

      ss08_chase_car_removed( group_index )
   end
end

function ss08_attacker_leaves_chase_car( attacker, chase_car )
   local group_index = ss08_get_vehicle_group_index_from_name( chase_car )

   if ( Chase_squad_cars_chasing[group_index] ) then
      on_vehicle_destroyed( "", chase_car )
      on_vehicle_exit( "ss08_left_vehicle_during_escort", chase_car )

      if ( group_index <= NUM_CHASE_SQUADS ) then
         -- Remove callbacks on every member... should get the driver :)
         for index, member_name in CHASE_SQUAD_GROUP_MEMBERS[group_index] do
            on_death( "", member_name )
         end
      else
         local rc_group_index = group_index - NUM_CHASE_SQUADS

         -- Remove callbacks on every member... should get the driver :)
         for index, member_name in RANDOM_CHASE_SQUAD_MEMBERS[rc_group_index] do
            on_death( "", member_name )
         end
      end

      ss08_chase_car_removed( group_index )
   end
end

function ss08_chase_car_destroyed( vehicle_name )
   -- If a chase car is destroyed, then remove its driver's callback
   local group_index = ss08_get_vehicle_group_index_from_name( vehicle_name )

   if ( Chase_squad_cars_chasing[group_index] ) then

      if ( group_index <= NUM_CHASE_SQUADS ) then
         on_vehicle_exit( "", CHASE_SQUAD_GROUP_VEHICLES[group_index] )
         -- Remove callbacks on every member... should get the driver :)
         for index, member_name in CHASE_SQUAD_GROUP_MEMBERS[group_index] do
            on_death( "", member_name )
         end
      else
         local rc_group_index = group_index - NUM_CHASE_SQUADS
         on_vehicle_exit( "", RANDOM_CHASE_SQUAD_VEHICLES[rc_group_index] )

         -- Remove callbacks on every member... should get the driver :)
         for index, member_name in RANDOM_CHASE_SQUAD_MEMBERS[rc_group_index] do
            on_death( "", member_name )
         end
      end

      ss08_chase_car_removed( group_index )
   end
end

function ss08_drug_truck_destroyed()
   mission_end_failure( MISSION_NAME, HT_TRUCK_DESTROYED )
end

function ss08_drug_truck_damaged()
   local cur_truck_hp = get_current_hit_points( DRUG_TRUCK )
   local percent_remaining = cur_truck_hp / INITIAL_DRUG_TRUCK_HP

   hud_bar_set_value(0, percent_remaining, SYNC_ALL )
end

function ss08_reached_hq( triggerer_name, trigger_name )
   -- Check to see if the person who triggered it is in the drug truck
   local character_driving_drug_truck = get_char_in_vehicle( DRUG_TRUCK, 0 )
   -- If so, we win the mission
   if ( character_driving_drug_truck == triggerer_name ) then
      audio_play_conversation( END_MISSION_DIALOG_STREAM, NOT_CALL )
      Mission_won = true
      mission_end_success( MISSION_NAME, CT_OUTRO )
   end
end

-- This function gets Pierce to leave the warehouse, obstensibly to get a
-- truck to cart the drugs away with.
--
function ss08_pierce_leaves()
   -- Have Pierce leave the player
   turn_invulnerable( PIERCE_NAME )
	thread_yield()
   on_dismiss( "", PIERCE_NAME )
   party_dismiss( PIERCE_NAME )
   set_ignore_ai_flag( PIERCE_NAME, true )
   character_prevent_flinching( PIERCE_NAME, true )
   character_prevent_explosion_fling( PIERCE_NAME, true )
   character_prevent_kneecapping( PIERCE_NAME, true )
	if ( crouch_is_crouching( PIERCE_NAME ) ) then
		crouch_stop( PIERCE_NAME )
		delay( 0.5 )
	end
	-- Set up the "where's Pierce" audio line
   thread_new( "ss08_where_is_pierce_delay" )

   -- Pathfind him to a location
   local run = 2
   local retry_on_failure = true
   local move_and_fire = false
   move_to( PIERCE_NAME, PIERCE_GET_TRUCK_PATH, run, retry_on_failure, move_and_fire )
   -- Hide him
   character_hide( PIERCE_NAME )
   Pierce_leaves_thread_handle = INVALID_THREAD_HANDLE

   character_prevent_flinching( PIERCE_NAME, false )
   character_prevent_explosion_fling( PIERCE_NAME, false )
   character_prevent_kneecapping( PIERCE_NAME, false )
end

-- Delay before Shaundi wonders where Pierce is.
--
function ss08_where_is_pierce_delay()
   local where_is_pierce_time_seconds = WHERE_IS_PIERCE_MESSAGE_DELAY_SECONDS
   while ( where_is_pierce_time_seconds > 0 ) do
      where_is_pierce_time_seconds = where_is_pierce_time_seconds - get_frame_time()
      delay( 0 )
   end

   -- Shaundi complains
   audio_play_for_character( SHAUNDI_WHATS_TAKING_SO_LONG_LINE, SHAUNDI_NAME, "voice", false, false )
end

-- This function is called when Pierce is due to return. It causes him to come back
-- and spawns the truck that the player uses to escape with the drugs.
--
function ss08_pierce_returns()
	--repeat
	--	thread_yield()
	--until ( thread_check_done( Pierce_leaves_thread_handle ) == true )

	if ( Pierce_has_returned == false ) then
		Pierce_has_returned = true

		mission_debug( "switching to state MS_LOADING_TRUCK from pierce_returns", 15 )
		ss08_switch_state( MS_LOADING_TRUCK )
	end
end

-- Callback when the truck has been loaded.
-- TBD: by a timer or by the homies collecting sufficient drugs
--
function ss08_truck_loaded()
   objective_text_clear( 0 )

	mission_debug( "switching to state MS_TRUCK_LOADED from truck_loaded", 15 )
   ss08_switch_state( MS_TRUCK_LOADED )
end

-- Returns the index of the next un-collected drug box.
--
function ss08_get_next_drug_box_index()
   return ( NUM_DRUG_BOXES - Cur_drug_boxes_remaining ) + 1
end

function ss08_homie_load_drugs( homie_name )
   -- Check to see if enough packages have been queued to be dropped of
      -- If so, stop loading.
      -- If not, repeat...
   while ( Drug_boxes_queued + Drug_boxes_loaded < NUM_DRUG_BOXES ) do
      local target_box = nil
      -- Target a package that's not currently targeted
      for index, box_name in pairs( DRUG_BOXES ) do
         if ( Whos_carrying_drug_boxes[box_name] == nil ) then
            target_box = box_name
            Whos_carrying_drug_boxes[box_name] = homie_name
            break
         end
      end
      if ( target_box == nil ) then
         return
      end
      Drug_boxes_queued = Drug_boxes_queued + 1

      local walk = 1
      local run = 2
      local retry_on_failure = true
      local move_and_fire = false
      -- Run toward the package
      move_to( homie_name, BOX_PICKUP_NAV, run, retry_on_failure, move_and_fire )

      -- Pick up the package
	   item_wield( target_box, homie_name, false )

      -- Walk toward the dropoff
      move_to( homie_name, BOX_DROPOFFS[homie_name], walk, retry_on_failure, move_and_fire )

      if ( character_is_dead( homie_name ) ) then
         return
      end

      -- Drop off the package
      turn_to( homie_name, BOX_LOADING_TARGET )
      item_throw( homie_name, BOX_LOADING_TARGET )
      delay( 2.0 )

--      item_drop( target_box, homie_name )
--      BOX_LOADING_TARGET
--      item_hide( target_box )
      Whos_carrying_drug_boxes[target_box] = DRUG_TRUCK

      -- Mark the package as dropped off and inform the mission (help text, etc)
      Drug_boxes_queued = Drug_boxes_queued - 1
      Drug_boxes_loaded = Drug_boxes_loaded + 1
      objective_text( 0, HT_X_OF_Y_BOXES_LOADED, Drug_boxes_loaded, NUM_DRUG_BOXES )

      if ( Drug_boxes_loaded == NUM_DRUG_BOXES ) then
         ss08_truck_loaded()
      end
   end
end

-- This function begins the junkie attack and sets us the callbacks such that
-- the attack will continue until the player escapes with the truck.
--
function ss08_start_junkie_attack()
   -- Calculate which attack squad we should be attacking with
   ss08_attack_squad_spawn( SOUTH )

   -- Set death tracking up
   ss08_add_death_tracking( SOUTH )

   -- Have the west squad come and attack
   ss08_attack_squad_attack( SOUTH )

   -- Set up time to be allowed to attack from another direction
   --thread_new( "ss08_other_direction_allowed_delay" )
   Cur_attack_directions[1] = SOUTH

   Assault_turned_on = true
end

-- Adds death tracking for junkie attack squads.
--
-- attack_direction: The direction of the squad to add callbacks for
--
function ss08_add_death_tracking( attack_direction )
   for index, name in pairs( ATTACK_SQUADS_MEMBERS[attack_direction] ) do
      Cur_attackers_remaining = Cur_attackers_remaining + 1
      on_death( "ss08_squad_member_died", name )
   end
   mission_debug( "Cur_attackers_remaining = "..Cur_attackers_remaining..".", 5 )
end

-- Gets the next dropoff point in the list. Once the list runs out,
-- starts getting from the beginning of the list.
--
-- attack_direction: Which direction the dropoff point should be
--                   located in.
--
function ss08_get_next_dropoff_point( attack_direction )
   -- Find the next dropoff index in this direction based on the previous one
   local next_dropoff_index_in_direction = Last_dropoff_indices[attack_direction] + 1

   -- Check to see if this is in range
   if ( next_dropoff_index_in_direction > DROPOFF_COUNTS[attack_direction] ) then
      -- Out-of-range - roll over the counter
      next_dropoff_index_in_direction = 1
   end

   local next_dropoff_point = DROPOFF_POINTS[attack_direction][next_dropoff_index_in_direction]

   -- We've found the index of the next dropoff point - update the last dropoff index used for this
   -- direction
   Last_dropoff_indices[attack_direction] = next_dropoff_index_in_direction

   return next_dropoff_point
end

function ss08_navpoint_out_of_players_fov( navpoint_name )
   if ( navpoint_in_player_fov( navpoint_name, LOCAL_PLAYER ) == false ) then
      if ( coop_is_active() ) then
         if ( navpoint_in_player_fov( navpoint_name, REMOTE_PLAYER ) == false ) then
            return true
         end
      else
         return true
      end
   end

   return false
end

function ss08_attack_squad_spawn( attack_direction )
   group_create_hidden( ALL_ATTACK_SQUADS[attack_direction], true )
end

function ss08_attack_squad_attack( attack_direction )
   -- Have the members board the car
   vehicle_enter_group_teleport( ATTACK_SQUADS_MEMBERS[attack_direction],
                                 ATTACK_SQUAD_VEHICLES[attack_direction] )

   repeat
      thread_yield()
   until ( ss08_all_players_in_warehouse_area() or
           ss08_navpoint_out_of_players_fov( ATTACK_SQUAD_VEHICLES[attack_direction] ) )

   -- Make the squad visible
   group_show( ALL_ATTACK_SQUADS[attack_direction] )

   -- Lead it along the initial path
   vehicle_pathfind_to( ATTACK_SQUAD_VEHICLES[attack_direction],
                        ATTACK_VEHICLE_PATHS[attack_direction], true, false )

   -- Select a dropoff point
   local dropoff_point = ss08_get_next_dropoff_point( attack_direction )

   mission_debug( "Direction: "..attack_direction.." squad pathing to dropoff "..dropoff_point, 15 )

   -- Have it pathfind here
   vehicle_pathfind_to( ATTACK_SQUAD_VEHICLES[attack_direction],
                        dropoff_point, true, true )

   -- Have the vehicle inhabitants attack
   for index, member in pairs( ATTACK_SQUADS_MEMBERS[attack_direction] ) do
      thread_new( "ss08_member_do_attack", member )
   end

   -- Release the car to the world to avoid congestion
   release_to_world( ATTACK_SQUAD_VEHICLES[attack_direction] )
end

function ss08_member_do_attack( member_name )
   if ( character_is_released( member_name ) == false ) then
      if ( character_is_dead( member_name ) == false ) then
         if ( character_is_in_vehicle( member_name ) == true ) then
            vehicle_exit( member_name )
         end
         attack_closest_player( member_name )
      end
   end
end

function ss08_entered_drug_truck( player_name, vehicle_name )

	mission_debug( "switching to state MS_TRAVELING_TO_BASE from entered_drug_truck", 15 )
   ss08_switch_state( MS_TRAVELING_TO_BASE )
end

function ss08_next_junkie_wave_attack()
   -- Calculate the next attack directions.
   Cur_attack_directions = ss08_get_next_attack_directions()

   for index, direction in pairs( Cur_attack_directions ) do
      ss08_attack_squad_spawn( direction )

      -- Set death tracking up
      ss08_add_death_tracking( direction )
   end

   for index, direction in pairs( Cur_attack_directions ) do
      -- Have the squad come and attack
      thread_new( "ss08_attack_squad_attack", direction )
   end
end

function ss08_get_next_attack_directions()
   local attack_directions = {}

   -- Waves up to a point should only come from one direction
   if ( Num_junkie_attack_waves_defeated < 2 ) then
      if ( Cur_attack_directions[1] == NUM_ATTACK_DIRECTIONS ) then
         attack_directions[1] = 1
      else
         attack_directions[1] = Cur_attack_directions[1] + 1
      end
   -- Waves after the cutoff should come from two directions at once
   else
      -- Find a random direction
      attack_directions[1] = (rand_int( 1, NUM_ATTACK_DIRECTIONS ))
      -- Now, find another one that's different than the first
      repeat
         attack_directions[2] = (rand_int( 1, NUM_ATTACK_DIRECTIONS ))
      until ( attack_directions[2] ~= attack_directions[1] )
   end

   return attack_directions
end

function ss08_force_spawn_wave( wave_index_at_force_spawn )
   delay ( BELOW_MIN_ATTACKERS_FORCE_SPAWN_DELAY_SECONDS )

   local cur_wave_index = Num_junkie_attack_waves_defeated + 1

   -- If the force-spawn situation no longer exists, abort.
   if ( Cur_attackers_remaining >= MIN_ATTACKERS or
        Cur_attackers_remaining == 0 or
        -- Another wave has been spawned while we were waiting
        cur_wave_index > wave_index_at_force_spawn or
        Assault_turned_on == false ) then
      return
   end

   -- For each currently attacking direction
   for index, direction in pairs ( Cur_attack_directions ) do
      release_to_world( ALL_ATTACK_SQUADS[direction] )
   end

   Cur_attackers_remaining = 0
   mission_debug( "Cur_attackers_remaining = "..Cur_attackers_remaining..".", 5 )
   Num_junkie_attack_waves_defeated = Num_junkie_attack_waves_defeated + 1
   ss08_next_junkie_wave_attack()
end

function ss08_squad_member_died( member_name )
   if ( character_is_released( member_name ) == false ) then
      release_to_world( member_name )
   end
   Cur_attackers_remaining = Cur_attackers_remaining - 1
   mission_debug( "Cur_attackers_remaining = "..Cur_attackers_remaining..".", 5 )

   -- 
   if ( Cur_attackers_remaining < MIN_ATTACKERS ) then
      Force_spawn_thread_handle = thread_new( "ss08_force_spawn_wave", Num_junkie_attack_waves_defeated + 1 )
   end

   if ( Cur_attackers_remaining == 0 and Assault_turned_on == true ) then
      Num_junkie_attack_waves_defeated = Num_junkie_attack_waves_defeated + 1
      -- For each direction
      for index, direction in pairs ( Cur_attack_directions ) do
         release_to_world( ALL_ATTACK_SQUADS[direction] )
      end
      ss08_next_junkie_wave_attack()
   end
end

-- This function delays for a short time and then makes a callback,
-- switching the mission state to the "Three Junkies attack" state.
--
function ss08_before_attack_delay()
   --action_play_non_blocking( character_name, anim_name, morph_name, force_play, stand_still )
   action_play_non_blocking( PIERCE_NAME, "talk disrespect", "", true, true )
   audio_play_conversation( PIERCE_COMPLAINING_DIALOG_STREAM, NOT_CALL )

	mission_debug( "switching to state MS_INITIAL_JUNKIES_ATTACK from before_attack_delay", 15 )
   ss08_switch_state( MS_INITIAL_JUNKIES_ATTACK )
end

-- Callback on death of the initial junkies that are spawned
-- when the junkie attack starts.
--
-- junkie_name: Name of the junkie that died.
--
function ss08_initial_junkie_died( junkie_name )
   release_to_world( junkie_name )
   Initial_junkies_remaining = Initial_junkies_remaining - 1
   if ( Initial_junkies_remaining == 3 ) then
		mission_debug( "switching to state MS_REAL_ATTACK_STARTS from initial_junkie_died", 15 )
		ss08_switch_state( MS_REAL_ATTACK_STARTS )
   end
end

function ss08_cleanup()
   -- Cleanup mission here
   --for index, name in pairs( DRUG_BOXES ) do
   --   mesh_mover_show( name )
   --end

   -- Clean up any ambient junkies, since they may have been released to the world
   spawning_pedestrians( false )
   spawning_pedestrians( true )

   ss08_add_vehicle_enter_and_exit_callbacks( "", "" )
   if ( Garage_door_open ) then
      mesh_mover_play_action( GARAGE_DOOR, "start2" )
   end
   on_dismiss( "", PIERCE_NAME )
   on_dismiss( "", SHAUNDI_NAME )
   on_death( "", PIERCE_NAME )
   on_death( "", SHAUNDI_NAME )
   on_tailing_too_far( "" )
   on_tailing_good( "" )
   on_vehicle_destroyed( "", DRUG_TRUCK )
   on_take_damage( "", DRUG_TRUCK )
   on_collision( "", DRUG_TRUCK )
   distance_display_off(SYNC_ALL)
   hud_timer_stop( OBJECTIVE_TIME_INDEX)
   hud_timer_hide( OBJECTIVE_TIME_INDEX, false )
   hud_timer_stop( FAILURE_TIME_INDEX )
   for index, name in pairs( CHASE_SQUAD_GROUP_NAMES ) do
      local chase_trigger_name = CHASE_SQUAD_TRIGGER_NAMES[index]
      trigger_enable( chase_trigger_name, false )
      on_trigger( "", chase_trigger_name )
   end
   notoriety_force_no_spawn( POLICE_GANG, false )

   trigger_enable( WAREHOUSE_AREA, false )
   on_trigger( "", WAREHOUSE_AREA )
   on_trigger_exit( "", WAREHOUSE_AREA )
   -- Activate the final objective trigger
   trigger_enable( SAINTS_HQ, false )
   on_trigger( "", SAINTS_HQ )
   set_dont_drop_havok_weapons_on_idle( false )
   party_allow_max_followers( false )

   if ( vehicle_exists( DRUG_TRUCK ) ) then
      vehicle_door_prevent_damage_detach( DRUG_TRUCK, "Door_BR", false )
      vehicle_door_prevent_damage_detach( DRUG_TRUCK, "Door_BL", false )
   end

	parking_spot_enable( "parking_spots_$parking_341 (1)", true )
	parking_spot_enable( "parking_spots_$parking_341 (0)", true )

   ss08_hide_doors( false )
end

function ss08_success()
	-- Called when the mission has ended with success
end
