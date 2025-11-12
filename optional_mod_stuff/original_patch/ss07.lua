-- ss07.lua
-- SR2 mission script
-- 3/28/07
-- Mission help table text tags
   -- Help text prefix
   HTP = "ss07_"
   HT_HURRY_UP =     HTP.."hurry_up"
   HT_HERE_WE_GO =   HTP.."here_we_go"
   HT_PIERCE_ABANDONED = HTP.."pierce_abandoned"
   HT_PIERCE_DIED =  HTP.."pierce_died"
   HT_GET_INTO_CAR = HTP.."get_into_car"
   HT_GET_ABOARD_BOAT =     HTP.."get_aboard_boat"
   HT_PRESS_TO_ENTER_CAR =  HTP.."press_to_enter_car"
   HT_PRESS_TO_BOARD_BOAT = HTP.."press_to_board_boat"
   HT_DESTROY_HELICOPTERS = HTP.."destroy_helicopters"
   HT_HELICOPTER_MADE_DROPOFF =      HTP.."helicopter_made_dropoff"
   HT_X_OF_Y_HELICOPTERS_DESTROYED = HTP.."x_of_y_helicopters_destroyed"
   HT_PIERCES_VEHICLE_DESTROYED = HTP.."pierces_vehicle_destroyed"
   ENEMY_GANG = "Samedi"

-- Mission states
   MS_DELAY_BEFORE_START =    1
   MS_PATHFINDING_FIRST_CAR = 2
   MS_ARRIVED_AT_DOCK =       3
   MS_PATHFINDING_BOAT =      4
   MS_LAND_HO =               5
   MS_FINAL_CHASE =           6
   MS_END_OF_MISSION =        7

-- Groups, NPCs, vehicles, navpoints, and other names
   -- Mission constant names
   MISSION_NAME = "ss07"
   -- ( Mission Prefix )
   MP = MISSION_NAME.."_$"

   -- Checkpoints
   BOAT_CHASE_CHECKPOINT = "Boat_Chase_Checkpoint"
   FINAL_CHASE_CHECKPOINT = "Final_Chase_Checkpoint"
   -- Weapons
   PLAYER_HELI_KILL_WEAPON = "ar50"

   -- Groups
   RAIL_CAR_ONE_GROUP = MP.."Rail_Car_1"
   PIERCE_GROUP = MP.."Pierce"
   RAIL_BOAT_GROUP =    MP.."Rail_Boat"
   RAIL_CAR_TWO_GROUP = MP.."Rail_Car_2"

   HELICOPTER_ONE_GROUP =   MP.."Heli01"
   HELICOPTER_TWO_GROUP =   MP.."Heli02"
   HELICOPTER_THREE_GROUP = MP.."Heli03"
   HELICOPTER_FOUR_GROUP =  MP.."Heli04"
   HELICOPTER_FIVE_GROUP =  MP.."Heli05"
   HELICOPTER_SIX_GROUP =   MP.."Heli06"
   HELICOPTER_GROUPS = { HELICOPTER_ONE_GROUP, HELICOPTER_TWO_GROUP, HELICOPTER_THREE_GROUP,
                         HELICOPTER_FOUR_GROUP, HELICOPTER_FIVE_GROUP, HELICOPTER_SIX_GROUP }

   -- NPC names
   PIERCE_NAME = MP.."Pierce"
   HELI_ONE_CHARACTERS =   { MP.."H1_Driver", MP.."H1_Attacker1", MP.."H1_Attacker2" }
   HELI_TWO_CHARACTERS =   { MP.."H2_Driver", MP.."H2_Attacker1", MP.."H2_Attacker2" }
   HELI_THREE_CHARACTERS = { MP.."H3_Driver", MP.."H3_Attacker1", MP.."H3_Attacker2" }
   HELI_FOUR_CHARACTERS =  { MP.."H4_Driver", MP.."H4_Attacker1", MP.."H4_Attacker2" }
   HELI_FIVE_CHARACTERS =  { MP.."H5_Driver", MP.."H5_Attacker1", MP.."H5_Attacker2" }
   HELI_SIX_CHARACTERS =   { MP.."H6_Driver", MP.."H6_Attacker1", MP.."H6_Attacker2" }

   HELICOPTER_CHARACTERS = { HELI_ONE_CHARACTERS, HELI_TWO_CHARACTERS, HELI_THREE_CHARACTERS,
                             HELI_FOUR_CHARACTERS, HELI_FIVE_CHARACTERS, HELI_SIX_CHARACTERS }

   RAIL_CAR_TWO_CARJACK_VICTIM_NAME = MP.."Poor_Victim"

   -- Vehicle names
   RAIL_CAR_ONE_NAME = MP.."Rail_Car_1"
   RAIL_BOAT_NAME = MP.."Rail_Boat"
   RAIL_CAR_TWO_NAME = MP.."Rail_Car_2"

   RAIL_CAR_NAMES = { RAIL_CAR_ONE_NAME, RAIL_CAR_TWO_NAME }

   HELICOPTER_ONE_NAME =   MP.."Heli01"
   HELICOPTER_TWO_NAME =   MP.."Heli02"
   HELICOPTER_THREE_NAME = MP.."Heli03"
   HELICOPTER_FOUR_NAME =  MP.."Heli04"
   HELICOPTER_FIVE_NAME =  MP.."Heli05"
   HELICOPTER_SIX_NAME =   MP.."Heli06"

   HELICOPTER_NAMES = { HELICOPTER_ONE_NAME, HELICOPTER_TWO_NAME, HELICOPTER_THREE_NAME,
                        HELICOPTER_FOUR_NAME, HELICOPTER_FIVE_NAME, HELICOPTER_SIX_NAME }

   -- Navpoints
   NEAR_START_CAR = MP.."Near_Start_Car"
   NEAR_START_CAR_REMOTE_PLAYER = MP.."Near_Start_Car_Remote_Player"

   RAIL_CAR_ONE_PATH_PART_ONE =   MP.."Rail_Car_1_Path1_01"
   RAIL_CAR_ONE_PATH_PART_TWO =   MP.."Rail_Car_1_Path1_02"
   RAIL_CAR_ONE_PATH_PART_THREE = MP.."Rail_Car_1_Path1_03"
   RAIL_CAR_ONE_PATH_PART_FOUR =  MP.."Rail_Car_1_Path1_04"
   RAIL_CAR_ONE_PATH_PART_FIVE =  MP.."Rail_Car_1_Path1_05"
   RAIL_CAR_ONE_PATH_PART_SIX =  MP.."Rail_Car_1_Path1_06"
   RAIL_CAR_ONE_PATH_PART_SEVEN =  MP.."Rail_Car_1_Path1_07"
   RAIL_CAR_ONE_PATH_PART_EIGHT =  MP.."Rail_Car_1_Path1_08"

   FIRST_RAIL_CAR_PATH_SEGMENTS = { RAIL_CAR_ONE_PATH_PART_ONE,
                                    RAIL_CAR_ONE_PATH_PART_TWO,
                                    RAIL_CAR_ONE_PATH_PART_THREE,
			                           RAIL_CAR_ONE_PATH_PART_FOUR,
			                           RAIL_CAR_ONE_PATH_PART_FIVE,
                                    RAIL_CAR_ONE_PATH_PART_SIX,
                                    RAIL_CAR_ONE_PATH_PART_SEVEN,
                                    RAIL_CAR_ONE_PATH_PART_EIGHT }
   FIRST_RAIL_CAR_PATH_SEGMENTS_USE_ROADS = { true, false, false, true, true, false, true, false }

   RAIL_CAR_TWO_PATH_PART_ONE   = MP.."Rail_Car_2_Path3_01"
   RAIL_CAR_TWO_PATH_PART_TWO   = MP.."Rail_Car_2_Path3_02"
   RAIL_CAR_TWO_PATH_PART_THREE = MP.."Rail_Car_2_Path3_03"
   RAIL_CAR_TWO_PATH_PART_FOUR  = MP.."Rail_Car_2_Path3_04"
   RAIL_CAR_TWO_PATH_PART_FIVE  = MP.."Rail_Car_2_Path3_05"
   RAIL_CAR_TWO_PATH_PART_SIX  = MP.."Rail_Car_2_Path3_06"

   SECOND_RAIL_CAR_PATH_SEGMENTS = { RAIL_CAR_TWO_PATH_PART_ONE,  
                                     RAIL_CAR_TWO_PATH_PART_TWO,  
                                     RAIL_CAR_TWO_PATH_PART_THREE,
                                     RAIL_CAR_TWO_PATH_PART_FOUR,
                                     RAIL_CAR_TWO_PATH_PART_FIVE,
                                     RAIL_CAR_TWO_PATH_PART_SIX } 
   SECOND_RAIL_CAR_PATH_SEGEMENTS_USE_ROADS = { false, false, false, false, false, false }

   RAIL_CARS_PATH_SEGMENTS = { FIRST_RAIL_CAR_PATH_SEGMENTS, SECOND_RAIL_CAR_PATH_SEGMENTS }
   RAIL_CARS_PATH_SEGMENTS_USE_ROADS = { FIRST_RAIL_CAR_PATH_SEGMENTS_USE_ROADS,
                                         SECOND_RAIL_CAR_PATH_SEGEMENTS_USE_ROADS }

   RAIL_BOAT_PATH =    MP.."Rail_Boat_Path"
   RAIL_CAR_TWO_PATH = MP.."Rail_Car_2_Path"
   CARJACK_VICTIM_GROUP = MP.."Carjack_Victim"

   CARJACK_POINT_ONE = MP.."Pierce_Carjack_P1"
   CARJACK_POINT_TWO = MP.."Pierce_Carjack_P2"
   CARJACK_POINT_THREE = MP.."Pierce_Carjack_P3"

   CARJACKED_CAR_PATH = MP.."Victim_Path"

   CARJACKED_CAR_CHECKPOINT_SPAWN_POS = MP.."Hijacked_Car_Stop_Position"

   SECOND_CHECKPOINT_LOCAL_PLAYER_START_LOCATION = MP.."Second_Checkpoint_Start_Local"
   SECOND_CHECKPOINT_REMOTE_PLAYER_START_LOCATION = MP.."Second_Checkpoint_Start_Remote"

   NEAR_DOCK = MP.."Near_Dock"
   NEAR_DOCK_REMOTE_PLAYER = MP.."Near_Dock_Remote_Player"
   PIERCE_NEAR_DOCK = MP.."Pierce_Near_Dock"

   HELICOPTER_HOLDING_POSITIONS = { [1] = MP.."Heli1_Holding_Pos" , [2] = MP.."Heli2_Holding_Pos", [4] = MP.."Heli4_Holding_Pos" }

   HELICOPTER_ONE_PATHS = { MP.."Heli_Path_1_01", MP.."Heli_Path_1_02" }
   HELICOPTER_TWO_PATHS = { MP.."Heli_Path_2_01", MP.."Heli_Path_2_02" }
   HELICOPTER_THREE_PATH = MP.."Heli_Path_3"
   HELICOPTER_FOUR_PATH = MP.."Heli_Path_4"
   HELICOPTER_FIVE_PATHS = { MP.."Heli_Path_5_01", MP.."Heli_Path_5_02" }
   HELICOPTER_SIX_PATH = MP.."Heli_Path_6"

   HELICOPTER_PATHS = { HELICOPTER_ONE_PATHS, HELICOPTER_TWO_PATHS, HELICOPTER_THREE_PATH,
                        HELICOPTER_FOUR_PATH, HELICOPTER_FIVE_PATHS, HELICOPTER_SIX_PATH }
   HELICOPTER_IS_PATH_PIECEWISE = { true, true, false, false, true, false }
   HELICOPTER_IS_PATH_DIRECT = { true, true, true, true, true, true }

   HELICOPTER_ONE_DROPOFF =   MP.."H1_D"
   HELICOPTER_TWO_DROPOFF =   MP.."H2_D"
   HELICOPTER_THREE_DROPOFF = MP.."H3_D"
   HELICOPTER_FOUR_DROPOFF =  MP.."H4_D"
   HELICOPTER_FIVE_DROPOFF =  MP.."H5_D"
   HELICOPTER_SIX_DROPOFF =   MP.."H6_D"

   HELICOPTER_DROPOFFS = { HELICOPTER_ONE_DROPOFF, HELICOPTER_TWO_DROPOFF, HELICOPTER_THREE_DROPOFF,
                           HELICOPTER_FOUR_DROPOFF, HELICOPTER_FIVE_DROPOFF, HELICOPTER_SIX_DROPOFF }

   HELICOPTER_END_CUTSCENE_POSITION = MP.."scene1_heli_path02"

   -- Triggers
   HELICOPTER_TRIGGERS = { [2] = MP.."H2_Trigger", [4] = MP.."H4_Trigger", [6] = MP.."H6_Trigger" }
   PARK_BOAT_DIALOG_TRIGGER = MP.."Park_Boat_Dialog_Trigger"

   GRAB_BOAT_CONVERSATION_TRIGGER = MP.."Grab_Boat_Conversation_Trigger"

   -- Movers
   LAMPPOST = MP.."Lamppost"
   BILLBOARD = MP.."Billboard"
   BILLBOARD_BASE = MP.."Billboard_Base"

   -- Effects and animation states

   -- Cutscenes
   CT_INTRO = "ss07-01"
   CT_OUTRO = "ss07-02"

   CT_HELI_ESTABLISH = "ig_ss07_scene1"

-- Sound
   -- Persona overrides

   -- Lines/Dialog Stream
   INTRO_DIALOG_STREAM = { { "SOS7_INTRO_L1", PIERCE_NAME, 0 },
                           { "PLAYER_SOS7_INTRO_L2", LOCAL_PLAYER, 0 },
                           { "SOS7_INTRO_L3", PIERCE_NAME, 0 },
                           { "PLAYER_SOS7_INTRO_L4", LOCAL_PLAYER, 0 },
                           { "SOS7_INTRO_L5", PIERCE_NAME, 0 },
                           { "PLAYER_SOS7_INTRO_L6", LOCAL_PLAYER, 0 },
                           { "SOS7_INTRO_L7", PIERCE_NAME, 0 } }

   BOAT_DIALOG_STREAM = { { "SOS7_WATER_L1", PIERCE_NAME, 0 },
                          { "PLAYER_SOS7_WATER_L2", LOCAL_PLAYER, 0 } }

   MUSIC_DIALOG_STREAM = { { "SOS7_MUSIC_L1", PIERCE_NAME, 0 },
                           { "PLAYER_SOS7_MUSIC_L2", LOCAL_PLAYER, 0 },
                           { "SOS7_MUSIC_L3", PIERCE_NAME, 0 },
                           { "PLAYER_SOS7_MUSIC_L4", LOCAL_PLAYER, 0 } }

   PIERCE_NEED_SOME_MUSIC_LINE = "SOS7_MUSIC_L1"
   PLAYER_YOU_MUST_BE_KIDDING_LINE = "PLAYER_SOS7_MUSIC_L2"
   PLAYER_YOU_ARE_BAD_AT_SINGING_LINE = "PLAYER_SOS7_MUSIC_L4"
   

   PIERCE_MAKING_JUMP_LINE = "PIERCE_SOS7_JUMP_01"
   PIERCE_CALLING_OUT_NEXT_HELICOPTER = "PIERCE_SOS7_NEXT_HELI"
   PIERCE_CARJACKING_DIALOG_LINE = "PIERCE_SOS7_CARJACK_01"

	PIERCE_CALLING_OUT_ALMOST_DROPOFF_LINES = { "PIERCE_SOS7_HELI_RANGE_01", "PIERCE_SOS7_HELI_RANGE_02", "PIERCE_SOS7_HELI_RANGE_03" }
	NUM_CALLING_OUT_HELI_LINES = sizeof_table( PIERCE_CALLING_OUT_ALMOST_DROPOFF_LINES )

   PLAYER_GET_BACK_TO_SHORE_LINE = "PLAYER_SOS7_LAND_01"

   -- Sound effects

-- Distances

-- Percents and multipliers
   RAIL_CAR_TWO_HEALTH_MULTIPLIER = 1.15
   HELICOPTER_HP_MULTIPLIERS = { 0.8, 0.55, 1.0, 1.0, 1.0, 0.8 }

-- Time values
   VEHICLE_FOLLOW_DELAYS_SECONDS = { 11.0, 2.0, 8.0 }
   HELICOPTER_START_DELAYS_SECONDS = { 0, 0, 0, 0, 0, 0 }
   HELI_TWO_START_DELAY = 2
   HELI_FOUR_START_DELAY = 0
   HELI_SIX_START_DELAY = 0
   HELI_TWO_PIERCE_BLAB_DELAY_SECONDS = 4
   HELI_FOUR_PIERCE_BLAB_DELAY_SECONDS = 1
   HELI_SIX_PIERCE_BLAB_DELAY_SECONDS = 4
   AFTER_JUMP_RESUME_PATHING_DELAY_SECONDS = 1.5

-- Speeds
   RAIL_CAR_ON_ROAD_RAIL_PATH_SPEEDS_MPS = { { 55, 55, 55, 55, 55, 55, 55, 55 },
                                             { 55, 40, 45, 50, 50, 50 } }
   BOAT_PATH_SPEED_MPS = 35
   HELICOPTER_PATH_SPEEDS_MPS = { { 20, 24 }, { 26, 26 }, 25, 15, { 23, 23 }, 20 }
   HELICOPTER_DROPOFF_SPEED_MPS = 20
   HELICOPTER_TO_HOLDING_POS_SPEED_MPS = 20

-- Constant values and counts
   HELICOPTER_COUNT = sizeof_table( HELICOPTER_GROUPS )

   HELI_DESTROYED_MIN_NOTORIETY_LEVELS = { 2, 3, 4, 4, 4, 4 }
   AFTER_FIRST_HELI_DAMAGED_MIN_NOTORIETY = 1

   MISSION_MAX_NOTORIETY = 4

   CLASSIC_RADIO_STATION_INDEX = 7
   PIERCE_RADIO_STATION_INDEX = 44

-- Global variables
   Helicopter_path_threads = { INVALID_THREAD_HANDLE, INVALID_THREAD_HANDLE, INVALID_THREAD_HANDLE,
                               INVALID_THREAD_HANDLE, INVALID_THREAD_HANDLE, INVALID_THREAD_HANDLE }
   Num_helicopters_destroyed = 0

   Players_in_boat = { [LOCAL_PLAYER] = false, [REMOTE_PLAYER] = false }
   Players_in_hijacked_car = { [LOCAL_PLAYER] = false, [REMOTE_PLAYER] = false }

	Cur_calling_out_heli_line_index = 0

function ss07_all_players_in_vehicle( in_vehicle_status )
   if ( in_vehicle_status[LOCAL_PLAYER] == true ) then
      if ( coop_is_active() ) then
         if ( in_vehicle_status[REMOTE_PLAYER] == true ) then
            return true
         end
      else
         return true
      end
   end

   return false
end

function ss07_vehicle_multiply_hp( vehicle_name, multiplier )
   local max_hp = get_max_hit_points( vehicle_name )
   
   local new_hp = max_hp * multiplier

   set_max_hit_points( vehicle_name, new_hp )
   set_current_hit_points( vehicle_name, new_hp )
end

function ss07_set_vehicle_interaction_allowed( allowed )
   set_player_can_enter_exit_vehicles( LOCAL_PLAYER, allowed )
   if ( coop_is_active() ) then
      set_player_can_enter_exit_vehicles( REMOTE_PLAYER, allowed )
   end
end

function ss07_start( checkpoint_name, is_restart )
   -- Start trigger is hit...the activate button was hit
   set_mission_author("Brad Johnson and Mark Gabby")

   local resuming_from_checkpoint = false

   mission_start_fade_out()

   if ( checkpoint_name == MISSION_START_CHECKPOINT ) then
      if (not is_restart) then
			cutscene_play( CT_INTRO, { RAIL_CAR_ONE_GROUP, PIERCE_GROUP, RAIL_BOAT_GROUP, RAIL_CAR_TWO_GROUP }, { NEAR_START_CAR, NEAR_START_CAR_REMOTE_PLAYER }, false )
		else
			group_create_hidden( RAIL_CAR_ONE_GROUP, true )
			group_create_hidden( PIERCE_GROUP, true )
			group_create_hidden( RAIL_BOAT_GROUP, true )
			group_create_hidden( RAIL_CAR_TWO_GROUP, true )
			teleport_coop( NEAR_START_CAR, NEAR_START_CAR_REMOTE_PLAYER )
		end

		-- Show groups that need to be seen immediately
		group_show( RAIL_CAR_ONE_GROUP )
		group_show( PIERCE_GROUP )

		-- Non-blocking group create for group used later in the mission
      group_create_hidden( CARJACK_VICTIM_GROUP )
   else
      resuming_from_checkpoint = true
   end

	spawning_boats( false )
   mesh_mover_hide( LAMPPOST )
   mesh_mover_hide( BILLBOARD )
   mesh_mover_hide( BILLBOARD_BASE )

   ss07_setup_heli_triggers()

   local next_state

   notoriety_set_max( ENEMY_GANG, MISSION_MAX_NOTORIETY )

   inv_weapon_add_temporary( LOCAL_PLAYER, PLAYER_HELI_KILL_WEAPON, 1, true ) 
   if ( coop_is_active() ) then
      inv_weapon_add_temporary( REMOTE_PLAYER, PLAYER_HELI_KILL_WEAPON, 1, true ) 
   end

   if ( checkpoint_name == MISSION_START_CHECKPOINT ) then
      party_add( PIERCE_NAME, LOCAL_PLAYER )
      follower_make_independent( PIERCE_NAME, true )

      on_vehicle_destroyed( "ss07_rail_vehicle_destroyed", RAIL_CAR_ONE_NAME )
      thread_yield()

      -- Teleport both players inside and lock them in
      vehicle_enter_teleport( PIERCE_NAME, RAIL_CAR_ONE_NAME, 0, true )
      vehicle_enter_teleport( LOCAL_PLAYER, RAIL_CAR_ONE_NAME, 2, true )
      if ( coop_is_active() ) then
         vehicle_enter_teleport( REMOTE_PLAYER, RAIL_CAR_ONE_NAME, 3, true )
      end
      turn_invulnerable( PIERCE_NAME )
      thread_yield()
      ss07_setup_rail_vehicle_for_chase( RAIL_CAR_ONE_NAME )

      -- Give everyone a frame to get in before we make the vehicle unenterable.
      thread_yield()
      --set_unjackable_flag( RAIL_CAR_ONE_NAME, true )

      trigger_enable( GRAB_BOAT_CONVERSATION_TRIGGER, true )
      on_trigger( "ss07_do_boat_conversation", GRAB_BOAT_CONVERSATION_TRIGGER )

      -- Start the mission
      next_state = MS_DELAY_BEFORE_START
   elseif ( checkpoint_name == BOAT_CHASE_CHECKPOINT ) then
      -- You've destroyed two helicopters, so set the min notoriety to the 2nd one's
      notoriety_set_min( ENEMY_GANG, HELI_DESTROYED_MIN_NOTORIETY_LEVELS[2] )

      if ( group_is_loaded( PIERCE_GROUP ) == false ) then
         group_create( PIERCE_GROUP, true )
         party_add( PIERCE_NAME, LOCAL_PLAYER )
      end
		if ( group_is_loaded( RAIL_BOAT_GROUP ) == false ) then
			group_create( RAIL_BOAT_GROUP, true )
		end
      group_create_hidden( RAIL_CAR_TWO_GROUP, true )
      group_create_hidden( CARJACK_VICTIM_GROUP, true )

      follower_make_independent( PIERCE_NAME, true )
      turn_invulnerable( PIERCE_NAME )

		teleport( PIERCE_NAME, PIERCE_NEAR_DOCK, true )
		teleport_coop( NEAR_DOCK, NEAR_DOCK_REMOTE_PLAYER, true )
		repeat
			thread_yield()
		until ( get_dist( LOCAL_PLAYER, NEAR_DOCK ) < 1.0 )
		if ( coop_is_active() ) then
			repeat
				thread_yield()
			until ( get_dist( REMOTE_PLAYER, NEAR_DOCK_REMOTE_PLAYER ) < 1.0 )
		end

		vehicle_enter_teleport( LOCAL_PLAYER, RAIL_BOAT_NAME, 1 )
      if ( coop_is_active() ) then
         vehicle_enter_teleport( REMOTE_PLAYER, RAIL_BOAT_NAME, 2 )
      end
		vehicle_enter_teleport( PIERCE_NAME, RAIL_BOAT_NAME, 0 )

      on_vehicle_destroyed( "ss07_rail_vehicle_destroyed", RAIL_BOAT_NAME )
      vehicle_suppress_npc_exit( RAIL_BOAT_NAME, true )
	   vehicle_disable_chase( RAIL_BOAT_NAME, true )
		vehicle_disable_flee( RAIL_BOAT_NAME, true )
      Num_helicopters_destroyed = 2
      next_state = MS_PATHFINDING_BOAT
   elseif ( checkpoint_name == FINAL_CHASE_CHECKPOINT ) then
      -- You've destroyed four helicopters, so set the min notoriety to the 4th one's
      notoriety_set_min( ENEMY_GANG, HELI_DESTROYED_MIN_NOTORIETY_LEVELS[4] )

      if ( group_is_loaded( PIERCE_GROUP ) == false ) then
         group_create( PIERCE_GROUP, true )
         party_add( PIERCE_NAME, LOCAL_PLAYER )
      end
		if ( group_is_loaded( RAIL_CAR_TWO_GROUP ) == false ) then
			group_create( RAIL_CAR_TWO_GROUP, true )
		end
      follower_make_independent( PIERCE_NAME, true )
		spawning_vehicles( false )
		spawning_pedestrians( false, true )

      on_vehicle_destroyed( "ss07_rail_vehicle_destroyed", RAIL_CAR_TWO_NAME )

		teleport( PIERCE_NAME, MP.."Pierce_Checkpoint_Two_Warp", true )
		teleport_coop( SECOND_CHECKPOINT_LOCAL_PLAYER_START_LOCATION, SECOND_CHECKPOINT_REMOTE_PLAYER_START_LOCATION, true )
		repeat
			thread_yield()
		until ( get_dist( LOCAL_PLAYER, SECOND_CHECKPOINT_LOCAL_PLAYER_START_LOCATION ) < 1.0 )
		if ( coop_is_active() ) then
			repeat
				thread_yield()
			until ( get_dist( REMOTE_PLAYER, SECOND_CHECKPOINT_REMOTE_PLAYER_START_LOCATION ) < 1.0 )
		end

		vehicle_enter_teleport( LOCAL_PLAYER, RAIL_CAR_TWO_NAME, 2 )
      if ( coop_is_active() ) then
         vehicle_enter_teleport( REMOTE_PLAYER, RAIL_CAR_TWO_NAME, 3, false )
      end
		vehicle_enter_teleport( PIERCE_NAME, RAIL_CAR_TWO_NAME, 0 )

      teleport_vehicle( RAIL_CAR_TWO_NAME, CARJACKED_CAR_CHECKPOINT_SPAWN_POS )
		spawning_vehicles( true )
		spawning_pedestrians( true )

      vehicle_suppress_npc_exit( RAIL_CAR_TWO_NAME, true )
      turn_invulnerable( PIERCE_NAME )
      ss07_setup_rail_vehicle_for_chase( RAIL_CAR_TWO_NAME )
      vehicle_set_radio_controls_locked( RAIL_CAR_TWO_NAME, true )
      radio_set_station( RAIL_CAR_TWO_NAME, CLASSIC_RADIO_STATION_INDEX )

      Num_helicopters_destroyed = 4
      next_state = MS_FINAL_CHASE
   end

   on_death( "ss07_pierce_died", PIERCE_NAME )
   on_dismiss( "ss07_pierce_abandoned", PIERCE_NAME )
   inv_item_remove_all( PIERCE_NAME )

   -- Prevent the players from getting out of rail vehicles - avoids all kinds of
   -- messiness
   ss07_set_vehicle_interaction_allowed( false )
   mission_start_fade_in()

   mission_help_table( HT_DESTROY_HELICOPTERS, SYNC_ALL )

   ss07_switch_state( next_state, resuming_from_checkpoint )
end

function ss07_reached_park_boat_dialog_trigger( triggerer_name, trigger_name )
   trigger_enable( trigger_name, false )
   audio_play_for_character( PLAYER_GET_BACK_TO_SHORE_LINE, LOCAL_PLAYER, "voice", false, false )
end

function ss07_first_helicopter_damaged( victim, attacker )
   if ( attacker ~= nil ) then
      if ( character_is_player( attacker ) ) then
         notoriety_set_min( ENEMY_GANG, AFTER_FIRST_HELI_DAMAGED_MIN_NOTORIETY )
         on_take_damage( "", victim )
         
         attack_safe( HELICOPTER_CHARACTERS[1][2], LOCAL_PLAYER )
         attack_safe( HELICOPTER_CHARACTERS[1][3], LOCAL_PLAYER )
      end
   end
end

function ss07_start_conversation()
   audio_play_conversation( INTRO_DIALOG_STREAM, NOT_CALL )
end

function ss07_switch_state( new_state, from_checkpoint )
   if ( from_checkpoint == nil ) then
      from_checkpoint = false
   end

   if ( new_state == MS_DELAY_BEFORE_START ) then

      -- Spawn the helicopter
      ss07_create_and_init_helicopter( 1 )
      ss07_create_and_init_helicopter( 2 )
      on_take_damage( "ss07_first_helicopter_damaged", HELICOPTER_NAMES[1] )

      -- After the helicopter is created, start the conversation
      thread_new( "ss07_start_conversation" )
      -- Wait a few seconds before letting the helicopter start flying
      delay( 7.0 )

      -- Let it fly past
      Helicopter_path_threads[1] = thread_new( "ss07_heli_fly", 1 )
      -- Wait for the conversation to reach a good point before letting the vehicle follow
      delay( VEHICLE_FOLLOW_DELAYS_SECONDS[1] )

      on_vehicle_destroyed( "ss07_rail_vehicle_destroyed", RAIL_CAR_ONE_NAME )

      ss07_switch_state( MS_PATHFINDING_FIRST_CAR )
      --teleport_vehicle( RAIL_CAR_ONE_NAME, MP.."Temp_End_of_First_Path" )
      --ss07_switch_state( MS_ARRIVED_AT_DOCK )
   elseif ( new_state == MS_PATHFINDING_FIRST_CAR ) then
      -- Set the GSI to display X of Y helicopters killed
      objective_text( 0, HT_X_OF_Y_HELICOPTERS_DESTROYED, Num_helicopters_destroyed, HELICOPTER_COUNT, SYNC_ALL )
      -- Start the car pathfinding
      ss07_setup_rail_vehicle_damage_tracking( RAIL_CAR_ONE_NAME )

      thread_new( "ss07_rail_car_do_path", 1, MS_ARRIVED_AT_DOCK )
   elseif ( new_state == MS_ARRIVED_AT_DOCK ) then

      -- Create the boat
      group_show( RAIL_BOAT_GROUP )
      on_vehicle_destroyed( "ss07_rail_vehicle_destroyed", RAIL_BOAT_NAME )
      -- Have Pierce get out of the car and go to the boat
      thread_new( "ss07_pierce_exit_vehicle_and_go_to_boat" )

	   vehicle_disable_chase( RAIL_BOAT_NAME, true )
		vehicle_disable_flee( RAIL_BOAT_NAME, true )

      -- Delay, then allow the player(s) to get out
      delay( 2.0 )
      ss07_set_vehicle_interaction_allowed( true )
      -- The first rail car is no longer mission-critical at this point
      on_vehicle_destroyed( "", RAIL_CAR_ONE_NAME )

      -- Tell player what to do next
      mission_help_table( HT_GET_ABOARD_BOAT, "", "", SYNC_ALL )
      marker_add_vehicle( RAIL_BOAT_NAME, MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE, SYNC_ALL )

      -- Add callbacks for entering the boat, to proceed to the next stage
      on_vehicle_enter( "ss07_entered_boat", RAIL_BOAT_NAME )
      on_vehicle_exit( "ss07_left_boat", RAIL_BOAT_NAME )

   elseif ( new_state == MS_PATHFINDING_BOAT ) then
      -- The boat has started - lock the players in
      ss07_set_vehicle_interaction_allowed( false )
      -- Prevent Samedi from clogging up the area with the second car 
      notoriety_force_no_spawn( ENEMY_GANG, true )
      -- Prevent Police from bothering Pierce
      ambient_cop_spawn_enable( false )

		if ( from_checkpoint == false ) then
	      mission_set_checkpoint( BOAT_CHASE_CHECKPOINT, true )
		end

      trigger_enable( PARK_BOAT_DIALOG_TRIGGER, true )
      on_trigger( "ss07_reached_park_boat_dialog_trigger", PARK_BOAT_DIALOG_TRIGGER )

      ss07_create_and_init_second_rail_car()

      ss07_setup_rail_vehicle_damage_tracking( RAIL_BOAT_NAME )
      -- Create the helicopter
      ss07_create_and_init_helicopter( 3 )
      ss07_create_and_init_helicopter( 4 )
      --cutscene_play( CT_HELI_ESTABLISH )
      --teleport_vehicle( RAIL_BOAT_NAME, RAIL_BOAT_NAME )

      camera_look_through( RAIL_BOAT_NAME )

      teleport_vehicle( HELICOPTER_NAMES[3], HELICOPTER_END_CUTSCENE_POSITION )
      camera_end_look_through( true )

      -- Have it start moving on its path
      Helicopter_path_threads[3] = thread_new( "ss07_heli_fly", 3 )
      -- Wait
      delay( VEHICLE_FOLLOW_DELAYS_SECONDS[2] )

      attack_safe( HELICOPTER_CHARACTERS[3][2], LOCAL_PLAYER )
      attack_safe( HELICOPTER_CHARACTERS[3][3], LOCAL_PLAYER )

      -- Start the boat pathfinding
      thread_new( "ss07_boat_do_path" )
   elseif ( new_state == MS_LAND_HO ) then
      thread_new( "ss07_run_carjacking" )
      on_vehicle_enter( "ss07_entered_second_car", RAIL_CAR_TWO_NAME )
      on_vehicle_exit( "ss07_left_car", RAIL_CAR_TWO_NAME )
      on_vehicle_destroyed( "ss07_rail_vehicle_destroyed", RAIL_CAR_TWO_NAME )
      delay( 2.0 )
      -- Let the player get out of the car
      ss07_set_vehicle_interaction_allowed( true )

      on_vehicle_destroyed( "", RAIL_BOAT_NAME )
   elseif ( new_state == MS_FINAL_CHASE ) then
      mission_set_checkpoint( FINAL_CHASE_CHECKPOINT, true )
      -- Again, diallow getting out of the car
      ss07_set_vehicle_interaction_allowed( false )
      ss07_setup_rail_vehicle_damage_tracking( RAIL_CAR_TWO_NAME )

      ss07_vehicle_multiply_hp( RAIL_CAR_TWO_NAME, RAIL_CAR_TWO_HEALTH_MULTIPLIER )

      thread_new( "ss07_car_dialog_and_singalong", from_checkpoint )

      -- Spawn the helicopter
      ss07_create_and_init_helicopter( 5 )
      ss07_create_and_init_helicopter( 6 )
      -- Let it fly past
      Helicopter_path_threads[5] = thread_new( "ss07_heli_fly", 5 )

      delay( VEHICLE_FOLLOW_DELAYS_SECONDS[3] )

      attack_safe( HELICOPTER_CHARACTERS[5][2], LOCAL_PLAYER )
      attack_safe( HELICOPTER_CHARACTERS[5][3], LOCAL_PLAYER )

      -- Start the car pathfinding
      thread_new( "ss07_rail_car_do_path", 2, MS_END_OF_MISSION )

      -- Resume notoriety spawning now that the car is underway. We stopped it
      -- so that Pierce could get in the second rail car
      notoriety_force_no_spawn( ENEMY_GANG, false )
      -- Resume police spawning for the same reason
      ambient_cop_spawn_enable( true )
   end
end

function ss07_car_dialog_and_singalong( from_checkpoint )
   if ( from_checkpoint == false ) then
      audio_play_for_character( PIERCE_CARJACKING_DIALOG_LINE, PIERCE_NAME, "voice", false, true )
   else
      delay( 3.0 )
   end
   audio_suppress_ambient_player_lines( true )
   -- Reset the station to the beginning
   audio_play_for_character( PIERCE_NEED_SOME_MUSIC_LINE, PIERCE_NAME, "voice", false, false )
   radio_set_sing_along( PIERCE_NAME )
   radio_set_station( RAIL_CAR_TWO_NAME, PIERCE_RADIO_STATION_INDEX )
   radio_reset_station( RAIL_CAR_TWO_NAME )
   delay( 17.725783 )
   audio_play_for_character( PLAYER_YOU_MUST_BE_KIDDING_LINE, LOCAL_PLAYER, "voice", false, false )
   delay( 28.551597 )
   audio_play_for_character( PLAYER_YOU_ARE_BAD_AT_SINGING_LINE, LOCAL_PLAYER, "voice", false, true )
   audio_suppress_ambient_player_lines( false )
end

function ss07_setup_rail_vehicle_damage_tracking( rail_vehicle_name )
   -- Setup death tracking
   on_vehicle_destroyed( "ss07_rail_vehicle_destroyed", rail_vehicle_name )
end

function ss07_rail_vehicle_destroyed()
   mission_end_failure( MISSION_NAME, HT_PIERCES_VEHICLE_DESTROYED )
end

function ss07_pierce_died()
   mission_end_failure( MISSION_NAME, HT_PIERCE_DIED )
end

function ss07_pierce_abandoned()
   mission_end_failure( MISSION_NAME, HT_PIERCE_ABANDONED )
end

function ss07_entered_boat( player_name )
   -- Check to see if all the players have entered the boat
   mission_debug( "entered boat called", 30 )
   Players_in_boat[player_name] = true

   -- If so, then proceed to the next state
   if ( ss07_all_players_in_vehicle( Players_in_boat ) and
        character_is_in_vehicle( PIERCE_NAME, RAIL_BOAT_NAME ) == true ) then
      on_vehicle_enter( "", RAIL_BOAT_NAME )
      marker_remove_vehicle( RAIL_BOAT_NAME, SYNC_ALL )
      ss07_switch_state( MS_PATHFINDING_BOAT )
   end
end

function ss07_left_boat( player_name )
   -- Update the in/out status of the player
   Players_in_boat[player_name] = false
end

function ss07_entered_second_car( player_name, vehicle_name )
   --if ( vehicle_name == RAIL_CAR_TWO_NAME ) then
      -- Check to see if all the players have entered the car
      Players_in_hijacked_car[player_name] = true

      -- If so, then proceed to the next state
      if ( ss07_all_players_in_vehicle( Players_in_hijacked_car ) and
			  character_is_in_vehicle( PIERCE_NAME, RAIL_CAR_TWO_NAME ) ) then
         on_vehicle_enter( "", RAIL_CAR_TWO_NAME )
         marker_remove_vehicle( RAIL_CAR_TWO_NAME, SYNC_ALL )
         ss07_switch_state( MS_FINAL_CHASE )
      end
   --end
end

function ss07_left_car( player_name )
   -- Update the in/out status of the player
   Players_in_hijacked_car[player_name] = false
end

function ss07_pierce_exit_vehicle_and_go_to_boat()
   --
   vehicle_suppress_npc_exit( RAIL_CAR_ONE_NAME, false )
   vehicle_exit( PIERCE_NAME )
   turn_vulnerable( PIERCE_NAME )
   set_ignore_ai_flag( PIERCE_NAME, true )

   player_force_vehicle_seat( LOCAL_PLAYER, 1, RAIL_BOAT_NAME )
   if ( coop_is_active() ) then
      player_force_vehicle_seat( REMOTE_PLAYER, 2, RAIL_BOAT_NAME )
   end

   move_to_safe( PIERCE_NAME, PIERCE_NEAR_DOCK, 2, false, false )
   while( character_is_dead( PIERCE_NAME ) ) do
      thread_yield()
   end

   vehicle_enter_teleport( PIERCE_NAME, RAIL_BOAT_NAME, 0 )
   turn_invulnerable( PIERCE_NAME )
   set_ignore_ai_flag( PIERCE_NAME, false )

   if ( ss07_all_players_in_vehicle( Players_in_boat ) and
        character_is_in_vehicle( PIERCE_NAME, RAIL_BOAT_NAME ) == true ) then
      on_vehicle_enter( "", RAIL_BOAT_NAME )
      marker_remove_vehicle( RAIL_BOAT_NAME, SYNC_ALL )
      ss07_switch_state( MS_PATHFINDING_BOAT )
   end
end

function ss07_setup_rail_vehicle_for_chase( rail_vehicle_name )
   vehicle_set_crazy( rail_vehicle_name, true )
   vehicle_infinite_mass( rail_vehicle_name, true )
   vehicle_ignore_repulsors( rail_vehicle_name, true )
   vehicle_suppress_npc_exit( rail_vehicle_name, true )
   vehicle_disable_chase( rail_vehicle_name, true )
   vehicle_disable_flee( rail_vehicle_name, true )
end

function ss07_carjack_pathfind()
   vehicle_pathfind_to( RAIL_CAR_TWO_NAME, CARJACKED_CAR_PATH, true, true )

   -- Prevent her from driving off and breaking the mission!
   vehicle_disable_chase( RAIL_CAR_TWO_NAME )
   vehicle_disable_flee( RAIL_CAR_TWO_NAME )
end

function ss07_create_and_init_second_rail_car()
   group_show( RAIL_CAR_TWO_GROUP )
   group_show( CARJACK_VICTIM_GROUP )
   ss07_setup_rail_vehicle_for_chase( RAIL_CAR_TWO_NAME )
   vehicle_enter_teleport( RAIL_CAR_TWO_CARJACK_VICTIM_NAME, RAIL_CAR_TWO_NAME, 0, true )
end

function ss07_run_carjacking()
   character_allow_ragdoll( PIERCE_NAME, false )

   -- Set up the forced vehicle seat information. This also clears the overrides for seat locations
   -- on the boat
   player_force_vehicle_seat( LOCAL_PLAYER, 2, RAIL_CAR_TWO_NAME )
   if ( coop_is_active() ) then
      player_force_vehicle_seat( REMOTE_PLAYER, 3, RAIL_CAR_TWO_NAME )
   end

   vehicle_set_radio_controls_locked( RAIL_CAR_TWO_NAME, true )
   radio_set_station( RAIL_CAR_TWO_NAME, CLASSIC_RADIO_STATION_INDEX )

   -- Have Pierce go to point 1
   vehicle_exit( PIERCE_NAME )
   --teleport( PIERCE_NAME, CARJACK_POINT_ONE )
   move_to( PIERCE_NAME, CARJACK_POINT_ONE, 2, true, false )

   set_ignore_ai_flag( PIERCE_NAME, true )

   -- Have the car drive to the location
   thread_new( "ss07_carjack_pathfind" )
   -- Have Pierce pathfind to the second and third points
   move_to( PIERCE_NAME, CARJACK_POINT_TWO, CARJACK_POINT_THREE, 2, true, false )

   -- Once there, it should look like he stopped the car by standing in front of it
   -- Have him get in, so it seems that he carjacked the car.
   local force_hijack_success = true
   vehicle_enter( PIERCE_NAME, RAIL_CAR_TWO_NAME, 0, true, force_hijack_success )
   vehicle_speed_override( RAIL_CAR_TWO_NAME, 0 )

   character_allow_ragdoll( PIERCE_NAME, true )

	-- If everyone's already in, then lock them in
	if ( ss07_all_players_in_vehicle( Players_in_hijacked_car ) and
		  character_is_in_vehicle( PIERCE_NAME, RAIL_CAR_TWO_NAME ) ) then
		ss07_set_vehicle_interaction_allowed( false )
	-- If someone's not in yet, then give a prompt to get in
	else
		mission_help_table( HT_GET_INTO_CAR )
		marker_add_vehicle( RAIL_CAR_TWO_NAME, MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE, SYNC_ALL )
	end
end

function ss07_boat_do_path()
   vehicle_suppress_npc_exit( RAIL_BOAT_NAME, true )

   vehicle_speed_override( RAIL_BOAT_NAME, BOAT_PATH_SPEED_MPS )
   local use_navmesh = true
   local stop_at_goal = true
   vehicle_pathfind_to( RAIL_BOAT_NAME, RAIL_BOAT_PATH, use_navmesh, stop_at_goal )

   ss07_switch_state( MS_LAND_HO )
end

function ss07_create_and_init_helicopter( heli_index )
   -- Create the heli's group
   if ( HELICOPTER_HOLDING_POSITIONS[heli_index] ~= nil or heli_index == 3 ) then
      group_create( HELICOPTER_GROUPS[heli_index], true )
   else
      group_create_hidden( HELICOPTER_GROUPS[heli_index], true )
   end

   -- Have the people get on board
   vehicle_enter_teleport( HELICOPTER_CHARACTERS[heli_index][1], HELICOPTER_NAMES[heli_index], 0 )
   vehicle_enter_teleport( HELICOPTER_CHARACTERS[heli_index][2], HELICOPTER_NAMES[heli_index], 4 )
   vehicle_enter_teleport( HELICOPTER_CHARACTERS[heli_index][3], HELICOPTER_NAMES[heli_index], 5 )

   turn_invulnerable( HELICOPTER_CHARACTERS[heli_index][1] )

   -- Bind a callback for destruction, because we need to know when this heli is destroyed
   local on_destroyed_callback_name = "ss07_destroyed_heli_"..heli_index

   on_vehicle_destroyed( on_destroyed_callback_name, HELICOPTER_NAMES[heli_index] )


   if ( HELICOPTER_HOLDING_POSITIONS[heli_index] ~= nil ) then
      helicopter_fly_to_direct( HELICOPTER_NAMES[heli_index], HELICOPTER_TO_HOLDING_POS_SPEED_MPS, HELICOPTER_HOLDING_POSITIONS[heli_index] )
   end

   ss07_vehicle_multiply_hp( HELICOPTER_NAMES[heli_index], HELICOPTER_HP_MULTIPLIERS[heli_index] )
end

function ss07_setup_heli_triggers()
   trigger_enable( HELICOPTER_TRIGGERS[2], true )
   on_trigger( "ss07_heli_two_start", HELICOPTER_TRIGGERS[2] )
   trigger_enable( HELICOPTER_TRIGGERS[4], true )
   on_trigger( "ss07_heli_four_start", HELICOPTER_TRIGGERS[4] )
   trigger_enable( HELICOPTER_TRIGGERS[6], true )
   on_trigger( "ss07_heli_six_start", HELICOPTER_TRIGGERS[6] )
end

function ss07_heli_two_start()
   delay( HELI_TWO_START_DELAY )
   Helicopter_path_threads[2] = thread_new( "ss07_heli_fly", 2 )

   attack_safe( HELICOPTER_CHARACTERS[2][2], LOCAL_PLAYER )
   attack_safe( HELICOPTER_CHARACTERS[2][3], LOCAL_PLAYER )

   delay( HELI_TWO_PIERCE_BLAB_DELAY_SECONDS )
   audio_play_for_character( PIERCE_CALLING_OUT_NEXT_HELICOPTER, PIERCE_NAME, "voice", false, false )
end

function ss07_heli_four_start()
   delay( HELI_FOUR_START_DELAY )
   Helicopter_path_threads[4] = thread_new( "ss07_heli_fly", 4 )

   attack_safe( HELICOPTER_CHARACTERS[4][2], LOCAL_PLAYER )
   attack_safe( HELICOPTER_CHARACTERS[4][3], LOCAL_PLAYER )

   delay( HELI_FOUR_PIERCE_BLAB_DELAY_SECONDS )
   audio_play_for_character( PIERCE_CALLING_OUT_NEXT_HELICOPTER, PIERCE_NAME, "voice", false, false )
end

function ss07_heli_six_start()
   delay( HELI_SIX_START_DELAY )
   Helicopter_path_threads[6] = thread_new( "ss07_heli_fly", 6 )

   attack_safe( HELICOPTER_CHARACTERS[6][2], LOCAL_PLAYER )
   attack_safe( HELICOPTER_CHARACTERS[6][3], LOCAL_PLAYER )

   --delay( HELI_SIX_PIERCE_BLAB_DELAY_SECONDS )
   --audio_play_for_character( PIERCE_CALLING_OUT_NEXT_HELICOPTER, PIERCE_NAME, "voice", false, false )
end

function ss07_destroyed_heli_1()
   ss07_heli_destroyed( 1 )
end

function ss07_destroyed_heli_2()
   ss07_heli_destroyed( 2 )
end

function ss07_destroyed_heli_3()
   ss07_heli_destroyed( 3 )
end

function ss07_destroyed_heli_4()
   ss07_heli_destroyed( 4 )
end

function ss07_destroyed_heli_5()
   ss07_heli_destroyed( 5 )
end

function ss07_destroyed_heli_6()
   ss07_heli_destroyed( 6 )
end

function ss07_heli_destroyed( heli_index )
   Num_helicopters_destroyed = Num_helicopters_destroyed + 1
   objective_text( 0, HT_X_OF_Y_HELICOPTERS_DESTROYED, Num_helicopters_destroyed, HELICOPTER_COUNT, SYNC_ALL )
   marker_remove_vehicle( HELICOPTER_NAMES[heli_index] )

   -- Make the pilot vulnerable and kill him
   turn_vulnerable( HELICOPTER_CHARACTERS[heli_index][1] )
   character_kill( HELICOPTER_CHARACTERS[heli_index][1] )

   notoriety_set_min( ENEMY_GANG, HELI_DESTROYED_MIN_NOTORIETY_LEVELS[heli_index] )

   if ( Helicopter_path_threads[heli_index] ~= INVALID_THREAD_HANDLE ) then
      thread_kill( Helicopter_path_threads[heli_index] )
      Helicopter_path_threads[heli_index] = INVALID_THREAD_HANDLE
   end

   if ( Num_helicopters_destroyed == HELICOPTER_COUNT ) then
      mission_end_success( MISSION_NAME, CT_OUTRO )
   end
end

function ss07_do_boat_conversation( triggerer_name, trigger_name )
   trigger_enable( trigger_name, false )

   audio_play_conversation( BOAT_DIALOG_STREAM, NOT_CALL )
end

function ss07_rail_car_do_path( car_index, state_after_path_complete )
   local segment_count = sizeof_table( RAIL_CARS_PATH_SEGMENTS[car_index] )
   -- Go through each segment in the path
   -- and have the car pathfind in them.
   for path_index, path_name in pairs( RAIL_CARS_PATH_SEGMENTS[car_index] ) do
      local stop_at_goal = false
      local use_navmesh = false
      vehicle_speed_override( RAIL_CAR_NAMES[car_index], RAIL_CAR_ON_ROAD_RAIL_PATH_SPEEDS_MPS[car_index][path_index] )

      -- Check for special pathing behavior for this segment

      -- If this is the last segment in the list, it's also the end of this car's path, so we want to
      -- stop after this segment.
      if ( path_index == segment_count ) then
         stop_at_goal = true
      end
      if ( RAIL_CARS_PATH_SEGMENTS_USE_ROADS[car_index][path_index] == false ) then
         use_navmesh = true
      end

      -- Special cases for car behavior at certain path points
      if ( car_index == 1 ) then
         -- Transition to another area - take it more slowly
         if ( path_index == 2 ) then

         -- The jump
         elseif ( path_index == 3 ) then
            audio_play_for_character( PIERCE_MAKING_JUMP_LINE, PIERCE_NAME, "voice", false, false )
            delay( AFTER_JUMP_RESUME_PATHING_DELAY_SECONDS )
         end
      elseif ( car_index == 2 ) then
         if ( path_index == 3 ) then
            vehicle_ignore_repulsors( RAIL_CAR_NAMES[car_index], true )
         elseif ( path_index == 5 ) then
            vehicle_ignore_repulsors( RAIL_CAR_NAMES[car_index], false )
         end
      end

      mission_debug( RAIL_CAR_NAMES[car_index].." pathing along "..path_name, 12 )
      if ( use_navmesh ) then
         vehicle_pathfind_to( RAIL_CAR_NAMES[car_index], path_name, use_navmesh, stop_at_goal )
      else
         vehicle_turret_base_to( RAIL_CAR_NAMES[car_index], path_name, stop_at_goal )
      end
   end

   ss07_switch_state( state_after_path_complete ) 
end

function ss07_get_next_calling_out_heli_line_index()
	Cur_calling_out_heli_line_index = Cur_calling_out_heli_line_index + 1

	if ( Cur_calling_out_heli_line_index > NUM_CALLING_OUT_HELI_LINES ) then
		Cur_calling_out_heli_line_index = 1
	end

	return Cur_calling_out_heli_line_index
end

function ss07_heli_fly( heli_index )
   -- Heli 3's a special case because of the CTE cutscene
   if ( heli_index ~= 3 and HELICOPTER_HOLDING_POSITIONS[heli_index] == nil ) then
      group_show( HELICOPTER_GROUPS[heli_index] )
   end
   marker_add_vehicle( HELICOPTER_NAMES[heli_index], MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL, SYNC_ALL )
   -- Have the heli fly along its path

   -- Find out which function to use based on whether we're direct pathfinding or not
   local helicopter_path_is_direct = HELICOPTER_IS_PATH_DIRECT[heli_index]
   -- Based on whether the path is piecewise, either do one pathfind or multiple
   local helicopter_path_is_piecewise = HELICOPTER_IS_PATH_PIECEWISE[heli_index]
 
   local heli_pathfinding_function = helicopter_fly_to

   if ( helicopter_path_is_piecewise == false ) then
      if ( helicopter_path_is_direct ) then
         heli_pathfinding_function = helicopter_fly_to_direct
      end
   else
      heli_pathfinding_function = helicopter_fly_to_dont_stop

      if ( helicopter_path_is_direct ) then
         heli_pathfinding_function = helicopter_fly_to_direct_dont_stop
      end
   end

   if ( helicopter_path_is_piecewise ) then
      for index, path_name in pairs( HELICOPTER_PATHS[heli_index] ) do
         heli_pathfinding_function( HELICOPTER_NAMES[heli_index], HELICOPTER_PATH_SPEEDS_MPS[heli_index][index], path_name )
      end
   else
      heli_pathfinding_function( HELICOPTER_NAMES[heli_index], HELICOPTER_PATH_SPEEDS_MPS[heli_index], HELICOPTER_PATHS[heli_index] )
   end

   -- If the helicopter's still alive, do the last segment, the dropoff and possible failure
   if ( ss07_helicopter_still_alive( heli_index ) ) then
      -- It's nearby - do the warning ( unless Pierce is distracted by his singing. )
      if ( heli_index < 5 ) then
			local line_index = ss07_get_next_calling_out_heli_line_index()
         audio_play_for_character( PIERCE_CALLING_OUT_ALMOST_DROPOFF_LINES[line_index], PIERCE_NAME, "voice", false, false )
      end
      mission_help_table_nag( HT_HURRY_UP, "", "", SYNC_ALL )

      helicopter_fly_to_direct( HELICOPTER_NAMES[heli_index], HELICOPTER_DROPOFF_SPEED_MPS, HELICOPTER_DROPOFFS[heli_index] )

      if ( ss07_helicopter_still_alive( heli_index ) ) then

         delay( 4.0 )

         -- Drop the package

         -- Fail the mission
         mission_end_failure( MISSION_NAME, HT_HELICOPTER_MADE_DROPOFF )
      end
   end
end

-- Returns true if the helicopter is still going and false otherwise
--
-- heli_index: Index of the helicopter to check.
--
function ss07_helicopter_still_alive( heli_index )
   local vehicle_smoking
   local vehicle_on_fire
   vehicle_smoking, vehicle_on_fire = vehicle_get_smoke_and_fire_state( HELICOPTER_NAMES[heli_index] )

   -- If no one's driving the heli or it's destroyed, the player need not worry about it anymore
   if ( get_char_in_vehicle( HELICOPTER_NAMES[heli_index], 0 ) == nil or
        vehicle_is_destroyed( HELICOPTER_NAMES[heli_index] ) or
        vehicle_on_fire == true ) then
      return false
   end

   return true
end

function ss07_cleanup()
	-- Cleanup mission here
   on_vehicle_enter( "", RAIL_CAR_TWO_NAME )
   on_vehicle_exit( "", RAIL_CAR_TWO_NAME )
   on_vehicle_enter( "", RAIL_BOAT_NAME )
   on_vehicle_exit( "", RAIL_BOAT_NAME )

   inv_weapon_remove_temporary( LOCAL_PLAYER, PLAYER_HELI_KILL_WEAPON ) 
   if ( coop_is_active() ) then
      inv_weapon_remove_temporary( REMOTE_PLAYER, PLAYER_HELI_KILL_WEAPON ) 
   end

   --party_dismiss( PIERCE_NAME )

   -- Destroy the rail vehicles - the player shouldn't be in them
	if ( group_is_loaded( RAIL_CAR_ONE_GROUP ) ) then
	   group_destroy( RAIL_CAR_ONE_GROUP )
	end
	if ( group_is_loaded( RAIL_CAR_TWO_GROUP ) ) then
		group_destroy( RAIL_CAR_TWO_GROUP )
	end
	if ( group_is_loaded( RAIL_BOAT_GROUP ) ) then
	   group_destroy( RAIL_BOAT_GROUP )
	end

   notoriety_force_no_spawn( ENEMY_GANG, false )
   spawning_boats( true )

   player_force_vehicle_seat( LOCAL_PLAYER, -1 )
   if ( coop_is_active() ) then
      player_force_vehicle_seat( REMOTE_PLAYER, -1 )
   end

   radio_set_sing_along()

   ss07_set_vehicle_interaction_allowed( true )
   audio_suppress_ambient_player_lines( false )
	
	spawning_vehicles( true )
	spawning_pedestrians( true )
end

function ss07_success()
	-- Called when the mission has ended with success
end
