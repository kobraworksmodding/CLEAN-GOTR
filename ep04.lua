-- ep04.lua
-- SR2 mission script
-- 3/28/07
-- Mission help table text tags

	--Crib Triggers
	PB_TRIGGER_ICON 		= "cribs_sr2_city_$PB_icon"
	PB_TRIGGER_WEAPON 		= "cribs_sr2_city_$PB_weapons"
	PB_TRIGGER_CLOTHES 		= "cribs_sr2_city_$PB_clothes"
	PB_TRIGGER_CASH 		= "cribs_sr2_city_$PB_cash"
	PB_TRIGGER_CLIP 		= "cribs_sr2_city_$PB_clipboard"
	PB_TRIGGER_TELE_IN 		= "cribs_sr2_city_$PB_in"
	PB_TRIGGER_TELE_OUT 		= "cribs_sr2_city_$PB_out"
	PB_TRIGGER_TELE_HELI_IN 	= "cribs_sr2_city_$PB_heli_in"
	PB_TRIGGER_TELE_HELI_OUT 	= "cribs_sr2_city_$PB_heli_out"
	PB_TRIGGER_TELE_ARENA_IN 	= "cribs_sr2_city_$PB_arena_in"
	PB_TRIGGER_TELE_TOHO_IN 	= "cribs_sr2_city_$PB_tohoku_in"
	PB_TRIGGER_TELE_ISLAND_IN 	= "cribs_sr2_city_$PB_island_in"
	PB_TRIGGER_TELE_GYM_IN 		= "cribs_sr2_city_$PB_gym_in"

   HT_ARMOR = "ep04_armor"
   HT_BUILDING_LOCKED_DOWN = "ep04_building_locked_down"
   HT_CATCH_UP = "ep04_catch_up"
   HT_GET_TO_THE_TOP = "ep04_get_to_the_top"
   HT_KILL_VOGEL = "ep04_kill_vogel"
	HT_VOGELS_HEALTH = "ep04_vogels_health"
   HT_ON_THE_STREETS = "ep04_on_the_streets"
   HT_VOGEL_ESCAPED = "ep04_vogel_escaped"
   HT_X_OF_Y_SECURITY_NODES = "ep04_x_of_y_power_stations"
   HT_X_OF_Y_SECURITY_NODES_DESTROYED = "ep04_x_of_y_power_stations_ht"
   HT_VOGELS_HEADING_BACK = "ep04_vogels_heading_back"
   HT_HELICOPTER_DESTROYED = "ep04_heli_destroyed"
   HT_HELICOPTER_ATTACKING = "ep03_ultor_sent_heli"

-- Mission states
   MS_START = 1
   MS_VOGEL_RETURN_TO_TOWER = 2
   MS_VOGEL_ENTER_THE_TOWER = 3
   MS_DESTROY_SECURITY_NODES = 4
   MS_GO_TO_TOP_OF_TOWER = 5
   MS_KILL_VOGEL = 6

-- Cutscene names
   CUTSCENE_NAME = "IG_ep04_scene1"

   CT_INTRO = "tsse04-01"
   CT_HELICOPTER = "tsse04-02"
   CT_OUTRO = "tsse04-03"

-- Groups, NPCs, vehicles, navpoints, and other names
   -- Mission constant names
   MISSION_NAME = "ep04"
   -- ( Mission Prefix )
   MP = MISSION_NAME.."_$"
   ENEMY_GANG = "Police"

   -- Checkpoints
   CP_VOGEL_ENTERED_BUILDING = "Vogel_Entered_Building"

   -- Weapons
   SNIPER_RIFLE = "mcmanus2010"

   -- Groups
   STARTER_CAR_GROUP = MP.."Starter_Car"
   VOGEL_GROUP = MP.."Vogel"
   VOGEL_LIMO_GROUP = MP.."Vogel_Limo"
   VOGEL_DEFENSE_SQUAD = MP.."Vogel_Defense_Squad"

   APC_GROUP = MP.."APC"

   VOGEL_DEFENSE_SQUAD_GROUP = MP.."Vogel_Defense_Squad"

   ATTACK_HELICOPTER_GROUP = MP.."Attack_Helicopter"
   SECURITY_NODE_DEFENDERS_GROUP = MP.."Security_Node_Defenders"

   ENEMY_HELICOPTER_GROUP = MP.."Enemy_Attack_Helicopter"

   CUTSCENE_GROUP = MP.."Cutscene"

   -- NPC names
   VOGEL_NAME = MP.."Vogel"
   VOGEL_LIMO_DRIVER = MP.."Driver"
   VOGEL_LIMO_BODYGUARD = MP.."Bodyguard"

   LIMO_CHARACTERS = { VOGEL_LIMO_DRIVER, VOGEL_LIMO_BODYGUARD, VOGEL_NAME }

   APC_SQUAD_MEMBERS = { MP.."APC_SM01", MP.."APC_SM02", MP.."APC_SM03",
                         MP.."APC_SM04", MP.."APC_SM05", MP.."APC_SM06" }

   VOGEL_DEFENSE_SQUAD_MEMBERS = { MP.."VDS_01", MP.."VDS_02", MP.."VDS_03",
                                   MP.."VDS_04", MP.."VDS_05", MP.."VDS_06" }

   ENEMY_PILOT = MP.."Enemy_Pilot"

   NODE1_DEFENDERS = { MP.."Node1_AR1", MP.."Node1_AR2", MP.."Node1_RPG" }
   NODE2_DEFENDERS = { MP.."Node2_AR1", MP.."Node2_AR2", MP.."Node2_RPG" }
   NODE3_DEFENDERS = { MP.."Node3_AR1", MP.."Node3_AR2", MP.."Node3_RPG" }
   NODE4_DEFENDERS = { MP.."Node4_AR1", MP.."Node4_AR2", MP.."Node4_RPG" }

   NODE_DEFENDERS = { NODE1_DEFENDERS, NODE2_DEFENDERS, NODE3_DEFENDERS, NODE4_DEFENDERS }

   -- Vehicle names
   STARTER_CAR_NAME = MP.."Starter_Car"
   VOGELS_LIMO_NAME = MP.."Vogels_Limo"

   APC_NAME = MP.."APC"

   ATTACK_HELICOPTER = MP.."Attack_Helicopter"

   ENEMY_ATTACK_HELICOPTER = MP.."Enemy_Attack_Helicopter"

   -- Navpoints and paths
   LOCAL_PLAYER_START = MP.."Player_Start"
   REMOTE_PLAYER_START = MP.."Remote_Player_Start"

	LOCAL_FRONT_OF_TOWER = MP.."In_Front_of_Tower_Local"
	REMOTE_FRONT_OF_TOWER = MP.."In_Front_of_Tower_Remote"

   VOGELS_LIMO_PATHS = { MP.."Limo_Looping_Path_01", MP.."Limo_Looping_Path_02" }
   PHILLIPS_TOWER_LIMO_RETURN_POINT_ONE = MP.."Phillips_Tower_Return_Point01"
   PHILLIPS_TOWER_LIMO_RETURN_POINT_TWO = MP.."Phillips_Tower_Return_Point02"
   PHILLIPS_TOWER_EXIT_POINT = MP.."Phillips_Tower_Exit"
   TO_LOOPING_PATH = MP.."To_Looping_Path"

   VOGEL_OFFICE_LOCATION = MP.."Vogel_Office_Location"
   PLAYER_OFFICE_LOCATION = MP.."Player_Office_Location"
	REMOTE_PLAYER_OFFICE_LOCATION = MP.."Remote_Player_Office_Location"

   ENEMY_ATTACK_HELICOPTER_WARP_POINTS = { MP.."Attack_Heli_Warp01", MP.."Attack_Heli_Warp02", MP.."Attack_Heli_Warp03" }

   BODYGUARD_CHECKPOINT_WARP = MP.."Bodyguard_Checkpoint_Warp"
   DRIVER_CHECKPOINT_WARP = MP.."Driver_Checkpoint_Warp"

   VOGEL_FLEE_POINTS = { MP.."EscapeP_01", MP.."EscapeP_02", MP.."EscapeP_03",
                         MP.."EscapeP_04", MP.."EscapeP_05", MP.."EscapeP_06" }

   ATTACK_HELI_FALL_LOCATION = MP.."Attack_Heli_Fall_Warp"

   -- Triggers
   TOP_OF_TOWER_TRIGGER = MP.."Top_of_Tower"
   NODE_ATTACK_AREA_TRIGGERS = { MP.."Node1_Attack_Area", MP.."Node2_Attack_Area",
                                 MP.."Node3_Attack_Area", MP.."Node4_Attack_Area" }


   -- Movers
   SECURITY_NODES = { MP.."Security_Node_01", MP.."Security_Node_02",
                      MP.."Security_Node_03", MP.."Security_Node_04" }

   NODE_SMOKE_ORIGINS = { [SECURITY_NODES[1]] = MP.."Node1_Smoke_Origin",
                          [SECURITY_NODES[2]] = MP.."Node2_Smoke_Origin",
                          [SECURITY_NODES[3]] = MP.."Node3_Smoke_Origin",
                          [SECURITY_NODES[4]] = MP.."Node4_Smoke_Origin" }
   NODE_MARKER_LOCATIONS = { [SECURITY_NODES[1]] = MP.."Node1_Marker_Location",
                             [SECURITY_NODES[2]] = MP.."Node2_Marker_Location",
                             [SECURITY_NODES[3]] = MP.."Node3_Marker_Location",
                             [SECURITY_NODES[4]] = MP.."Node4_Marker_Location" }

   -- Effects and animation states
   SMOKE_EFFECTS = { "Fire_flame_smk_lg" }

-- Sound

   -- Persona overrides
   VOGEL_PERSONA_OVERRIDES = { { "threat - alert (solo attack)", "DANE_TSSE04_ATTACK" } }

   -- Lines/Dialog stream
   GAT_AND_PLAYER_CONVERSATION =
   {
   { "TSSE4_TOWER_L1", nil, 0 },
   { "PLAYER_TSSE4_TOWER_L2", LOCAL_PLAYER, 0 },
   { "TSSE4_TOWER_L3", nil, 0 }
   }

-- Distances
   VOGELS_LIMO_MAX_DIST_METERS = 62.5

-- Percents and multipliers
   LIMO_HEALTH_LEVEL_FLEE_PERCENT = 0.50

   PLAYER_VEHICLE_HEALTH_MULTIPLIER = 1.5

   VOGEL_RUN_TO_NEXT_POINT_DAMAGE_PERCENT = 0.20

   VOGEL_FLEEING_DAMAGE_MULTIPLIER = 0.25

-- Time values
   CHASE_VOGEL_FAIL_TIME_MS = 20000
   BETWEEN_ENEMY_HELICOPTERS_SECONDS = 30
   AFTER_CHUNK_SWAP_FADE_IN_TIME_SECONDS = 3.0
   TIME_PER_CATCH_UP_UPDATE_SECONDS = 5

   PRE_DEPARTURE_DELAY_TIME_SECONDS = 3.0
   POST_DEPARTURE_PROMPT_DELAY_TIME_SECONDS = 3.0

-- Speeds
   VOGELS_LIMO_ESCAPE_SPEED_MPS = 60
   VOGELS_LIMO_RETURN_TO_BASE_SPEED_MPS = 80

-- Constant values and counts
   INVALID_THREAD_HANDLE = -1
   NUM_SECURITY_NODES = sizeof_table( SECURITY_NODES )
   MISSION_MIN_NOTORIETY = 3
   VOGELS_LIMO_HEALTH = 30000
   VOGELS_HEALTH = 3000
   NUM_SMOKE_EFFECTS = sizeof_table( SMOKE_EFFECTS )
   INVALID_EFFECT_HANDLE = -1
   NUM_HELI_WARP_POINTS = sizeof_table( ENEMY_ATTACK_HELICOPTER_WARP_POINTS )

-- Global variables
   Vogel_limo_pathfinding_thread_handle = INVALID_THREAD_HANDLE
   Vogel_return_to_tower_thread_handle = INVALID_THREAD_HANDLE
   Num_nodes_killed = 0
   
   Node_smoke_handles = { [SECURITY_NODES[1]] = INVALID_EFFECT_HANDLE,
                          [SECURITY_NODES[2]] = INVALID_EFFECT_HANDLE,
                          [SECURITY_NODES[3]] = INVALID_EFFECT_HANDLE,
                          [SECURITY_NODES[4]] = INVALID_EFFECT_HANDLE }

   Nodes_destroyed = { [SECURITY_NODES[1]] = false,
                       [SECURITY_NODES[2]] = false,
                       [SECURITY_NODES[3]] = false,
                       [SECURITY_NODES[4]] = false }

   Currently_marked_node_name = SECURITY_NODES[1]
   Marked_node_currently_marked = false

   Cur_heli_warp_point_index = 1
   Heli_spawn_thread_handle = INVALID_THREAD_HANDLE
   Vogel_is_fleeing = false
   Vogel_percent_damage_since_last_flee = 0
   Limo_getting_away_thread_handle = INVALID_THREAD_HANDLE
   Gat_call_received = false

   Players_in_range_of_limo = { [LOCAL_PLAYER] = false, [REMOTE_PLAYER] = false }
   Players_in_helicopter = { [LOCAL_PLAYER] = false, [REMOTE_PLAYER] = false }

   Gat_and_player_cellphone_call_thread_handle = INVALID_THREAD_HANDLE
   Destroyed_all_nodes = false
   Node_destruction_started = false

	Entered_tower = false

function ep04_start( checkpoint_name, is_restart )
	-- Start trigger is hit...the activate button was hit
	set_mission_author("Mark Gabby and Anoop Shekar")
	homie_mission_lock("gat")

	-- TEMP
	--checkpoint_name = CP_VOGEL_ENTERED_BUILDING
	-- END TEMP

   ep04_start_or_resume_from_checkpoint( checkpoint_name, is_restart )
end

-- Starts the mission or resumes it from a checkpoint, based on
-- the value of the passed-in checkpoint name.
--
-- This function does any group creation or other work that causes
-- the game to "load" before the mission is ready. Therefore, it
-- fades the screen out before it starts and fades it back in when
-- it's done.
--
function ep04_start_or_resume_from_checkpoint( checkpoint_name, is_restart )

   mission_start_fade_out()

	--Disable crib triggers
	trigger_enable ( PB_TRIGGER_ICON, false )
	trigger_enable ( PB_TRIGGER_WEAPON, false )
	trigger_enable ( PB_TRIGGER_CLOTHES, false )
	trigger_enable ( PB_TRIGGER_CASH, false )
	trigger_enable ( PB_TRIGGER_CLIP, false )
	trigger_enable ( PB_TRIGGER_TELE_IN, false )
	trigger_enable ( PB_TRIGGER_TELE_OUT, false )
	trigger_enable ( PB_TRIGGER_TELE_HELI_IN, false )
	trigger_enable ( PB_TRIGGER_TELE_HELI_OUT, false )
	trigger_enable ( PB_TRIGGER_TELE_ARENA_IN, false )
	trigger_enable ( PB_TRIGGER_TELE_TOHO_IN, false )
	trigger_enable ( PB_TRIGGER_TELE_ISLAND_IN, false )
	trigger_enable ( PB_TRIGGER_TELE_GYM_IN, false )

	
   notoriety_set_min( ENEMY_GANG, MISSION_MIN_NOTORIETY )

   group_create_hidden( VOGEL_DEFENSE_SQUAD_GROUP, true )

   -- Temporarily swap the tower back to the normal state if this mission is being replayed
   if ( mission_is_complete( MISSION_NAME ) ) then
      local interior, blocking, temporary
      interior = true
      blocking = true
      temporary = true
   	city_chunk_swap("SR2_IntSRMisPhiltwr", "normal", interior, blocking, temporary )
   end

   local state_to_setup
   if ( checkpoint_name == MISSION_START_CHECKPOINT ) then
		if (not is_restart) then
			cutscene_play( CT_INTRO, "", { LOCAL_PLAYER_START, REMOTE_PLAYER_START }, false )
		else
         teleport_coop( LOCAL_PLAYER_START, REMOTE_PLAYER_START )
		end
      group_create( VOGEL_GROUP, true )
      group_create( VOGEL_LIMO_GROUP, true )
      group_create( STARTER_CAR_GROUP, true )
      group_create_hidden( ATTACK_HELICOPTER_GROUP, true )
      group_create( APC_GROUP, true )
      vehicle_enter_group_teleport( APC_SQUAD_MEMBERS, APC_NAME )
	  vehicle_set_untowable( VOGELS_LIMO_NAME, true )

      vehicle_enter_group_teleport( LIMO_CHARACTERS, VOGELS_LIMO_NAME )
      state_to_setup = MS_START
   elseif ( checkpoint_name == CP_VOGEL_ENTERED_BUILDING ) then
      group_create( VOGEL_GROUP, true )
      group_create( VOGEL_LIMO_GROUP, true )
      group_create( ATTACK_HELICOPTER_GROUP, true )
      character_hide( VOGEL_NAME )
      teleport_vehicle( VOGELS_LIMO_NAME, PHILLIPS_TOWER_LIMO_RETURN_POINT_TWO )
      teleport( VOGEL_LIMO_BODYGUARD, BODYGUARD_CHECKPOINT_WARP )
      teleport( VOGEL_LIMO_DRIVER, DRIVER_CHECKPOINT_WARP )

      state_to_setup = MS_DESTROY_SECURITY_NODES
   end

   mission_start_fade_in()

   ep04_setup_state( state_to_setup )
end

-- Causes the defenders of the specified node to attack the specified player.
--
function ep04_node_defenders_attack( node_index, player_name )
   for index, name in pairs( NODE_DEFENDERS[node_index] ) do
      attack_safe( name, player_name )
   end
end

function ep04_node1_defenders_attack( triggerer_name )
   ep04_node_defenders_attack( 1, triggerer_name )
end

function ep04_node2_defenders_attack( triggerer_name )
   ep04_node_defenders_attack( 2, triggerer_name )
end

function ep04_node3_defenders_attack( triggerer_name )
   ep04_node_defenders_attack( 3, triggerer_name )
end

function ep04_node4_defenders_attack( triggerer_name )
   ep04_node_defenders_attack( 4, triggerer_name )
end


-- This function tracks when the player enters a vehicle initially - it's
-- used to have the APC chase the player.
--
function ep04_entered_vehicle_initial( player_name, vehicle_name )
   if ( coop_is_active() ) then
      on_vehicle_enter( "", REMOTE_PLAYER )
   end
   on_vehicle_enter( "", LOCAL_PLAYER )
   on_vehicle_enter( "", STARTER_CAR_NAME )

   vehicle_chase( APC_NAME, player_name )
end

function ep04_next_heli_spawn()
   Heli_spawn_thread_handle = thread_new( "ep04_enemy_heli_spawn_and_attack" )
end

function ep04_get_next_heli_warp_point()
   local next_warp_point = ENEMY_ATTACK_HELICOPTER_WARP_POINTS[Cur_heli_warp_point_index]

   Cur_heli_warp_point_index = Cur_heli_warp_point_index + 1
   if ( Cur_heli_warp_point_index > NUM_HELI_WARP_POINTS ) then
      Cur_heli_warp_point_index = 1
   end

   return next_warp_point
end

-- Causes an enemy attack helicopter to spawn and come at the player.
--
-- delay_before_spawn: (optional, default true) Whether there should be
--                     a short delay before the helicopter spawns.
--
function ep04_enemy_heli_spawn_and_attack( delay_before_spawn )
   if ( delay_before_spawn == nil or delay_before_spawn == true ) then
      delay( BETWEEN_ENEMY_HELICOPTERS_SECONDS )
   end

   release_to_world( ENEMY_HELICOPTER_GROUP )

   -- Create the helicopter
   group_create_hidden( ENEMY_HELICOPTER_GROUP, true )
   vehicle_enter_teleport( ENEMY_PILOT, ENEMY_ATTACK_HELICOPTER, 0, true )

   -- Once it's loaded, immediately seat the pilot and teleport it to a location nearer to the player
   group_show( ENEMY_HELICOPTER_GROUP )
   local warp_point = ep04_get_next_heli_warp_point()
   teleport_vehicle( ENEMY_ATTACK_HELICOPTER, warp_point )
   mission_help_table_nag( HT_HELICOPTER_ATTACKING )
 
	-- Set the attack heli to use the lockon system so that it will be more difficult
	vehicle_set_use_lockon_system( ENEMY_ATTACK_HELICOPTER, true )

   -- Find which player's closest to the position it was teleported to and have it attack that player
   local distance, player = get_dist_closest_player_to_object( ENEMY_ATTACK_HELICOPTER )
   vehicle_chase( ENEMY_ATTACK_HELICOPTER, player )

   -- Set up the spawning - when this helicopter dies, spawn the next one
   on_vehicle_destroyed( "ep04_next_heli_spawn", ENEMY_ATTACK_HELICOPTER )

   Heli_spawn_thread_handle = INVALID_THREAD_HANDLE
end

function ep04_no_player_in_helicopter()
   if ( Players_in_helicopter[LOCAL_PLAYER] == false ) then
      if ( coop_is_active() ) then
         if ( Players_in_helicopter[REMOTE_PLAYER] == false ) then
            return true
         end
      else
         return true
      end
   end

   return false
end

function ep04_entered_attack_heli_tower_attack( player_name, vehicle_name )
   -- If no one's in the helicopter before this player got in, remove the marker, because it had one
   if ( ep04_no_player_in_helicopter() ) then
      marker_remove_vehicle( vehicle_name, SYNC_ALL )
      if ( Destroyed_all_nodes == false ) then
         marker_add_navpoint( NODE_MARKER_LOCATIONS[Currently_marked_node_name], MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL, SYNC_ALL )
         Marked_node_currently_marked = true
      end
   end

   Players_in_helicopter[player_name] = true
end

function ep04_left_attack_heli_tower_attack( player_name, vehicle_name )
   Players_in_helicopter[player_name] = false

   -- If no one's in the helicopter after this player gets out, then add a marker for it
   if ( ep04_no_player_in_helicopter() ) then
      marker_add_vehicle( vehicle_name, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_INTERACT, SYNC_ALL )
      if ( Destroyed_all_nodes == false ) then
         marker_remove_navpoint( NODE_MARKER_LOCATIONS[Currently_marked_node_name], SYNC_ALL )
         Marked_node_currently_marked = false
      end
   end
end

function ep04_entered_vehicle_attack_tower( player_name, vehicle_name )
   if ( Gat_and_player_cellphone_call_thread_handle ~= INVALID_THREAD_HANDLE ) then
      thread_kill( Gat_and_player_cellphone_call_thread_handle )
      Gat_and_player_cellphone_call_thread_handle = INVALID_THREAD_HANDLE
      mid_mission_phonecall_reset()
   end
   marker_remove_vehicle( ATTACK_HELICOPTER, SYNC_ALL )
   on_vehicle_enter( "ep04_entered_attack_heli_tower_attack", ATTACK_HELICOPTER )
   on_vehicle_exit( "ep04_left_attack_heli_tower_attack", ATTACK_HELICOPTER )

   mission_help_table( HT_BUILDING_LOCKED_DOWN )

   objective_text(0, HT_X_OF_Y_SECURITY_NODES, Num_nodes_killed, NUM_SECURITY_NODES )
   marker_add_navpoint( NODE_MARKER_LOCATIONS[SECURITY_NODES[1]], MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL, SYNC_ALL )
   Currently_marked_node_name = SECURITY_NODES[1]
   Marked_node_currently_marked = true

   -- We're controlling the helicopter notoriety - don't spawn another one
   notoriety_force_no_spawn( ENEMY_GANG, true )
   notoriety_force_no_spawn( "ultor", true )

   -- Spawn a new helicopter - send in false for the delay because we want this first one to
   -- spawn instantly
   ep04_enemy_heli_spawn_and_attack( false )
end

function ep04_gat_call_received()
   Gat_call_received = true
end

function ep04_gat_and_player_converse()
   mid_mission_phonecall("ep04_gat_call_received")
   repeat
      thread_yield()
   until Gat_call_received
   Gat_and_player_cellphone_call_thread_handle = INVALID_THREAD_HANDLE
   audio_play_conversation( GAT_AND_PLAYER_CONVERSATION, INCOMING_CALL )
end

-- Sets the mission to a specified state. For example,
-- when the player damages Vogel's limo enough, it needs
-- to flee back to the Phillips Tower.
--
function ep04_setup_state( state_to_setup, actor_name )
   -- Mission is starting from the beginning
   if ( state_to_setup == MS_START ) then
      -- Increase the car's HP by the design-specified multiplier
      local car_cur_max_hp = get_max_hit_points( STARTER_CAR_NAME )
      local car_new_max_hp = car_cur_max_hp * PLAYER_VEHICLE_HEALTH_MULTIPLIER
      set_max_hit_points( STARTER_CAR_NAME, car_new_max_hp )
      set_current_hit_points( STARTER_CAR_NAME, car_new_max_hp )


      on_vehicle_enter( "ep04_entered_vehicle_initial", LOCAL_PLAYER )
      on_vehicle_enter( "ep04_entered_vehicle_initial", STARTER_CAR_NAME )
      if ( coop_is_active() ) then
         on_vehicle_enter( "ep04_entered_vehicle_initial", REMOTE_PLAYER )
      end


      ep04_setup_vogel_limo()

      ep04_setup_vogel_limo_tracking()

      delay( PRE_DEPARTURE_DELAY_TIME_SECONDS )
      Vogel_limo_pathfinding_thread_handle = thread_new( "ep04_limo_loop_pathfind" )

      -- Let the player know what he should be doing and guide
      -- him to the objective
      delay( POST_DEPARTURE_PROMPT_DELAY_TIME_SECONDS )
      mission_help_table( HT_ON_THE_STREETS )
   elseif ( state_to_setup == MS_VOGEL_RETURN_TO_TOWER ) then
      thread_kill( Vogel_limo_pathfinding_thread_handle )

   elseif ( state_to_setup == MS_VOGEL_ENTER_THE_TOWER ) then
      -- Play the cutscene
      cutscene_play( CUTSCENE_NAME, "", "", false )

      -- Hide the group - if the cutscene was skipped, we don't want the group getting in the way
      group_hide( CUTSCENE_GROUP )
      -- Have the helicopter appear so that the player can get in
      -- it after the cutscene
      group_show( ATTACK_HELICOPTER_GROUP )
		fade_in( 1.0 )

      -- Make the passengers and driver vulnerable
      for index, name in pairs( LIMO_CHARACTERS ) do
         turn_vulnerable( name )
      end   
      -- Allow the limo to be hijacked again.
      set_unjackable_flag( VOGELS_LIMO_NAME, false)

      -- Have Vogel disappear
      vehicle_exit_teleport( VOGEL_NAME )
      character_hide( VOGEL_NAME )
      -- Have the other characters get out
      vehicle_suppress_npc_exit( VOGELS_LIMO_NAME, false )
      vehicle_exit( VOGEL_LIMO_DRIVER )
      vehicle_exit( VOGEL_LIMO_BODYGUARD )

      -- Make the limo vulnerable
      turn_vulnerable( VOGELS_LIMO_NAME )
      
      mission_set_checkpoint( CP_VOGEL_ENTERED_BUILDING )

      -- Switch to the next state
      ep04_setup_state( MS_DESTROY_SECURITY_NODES )
   elseif ( state_to_setup == MS_DESTROY_SECURITY_NODES ) then
      -- Lead the player to the helicopter
      Gat_and_player_cellphone_call_thread_handle = thread_new( "ep04_gat_and_player_converse" )

      on_vehicle_enter( "ep04_entered_vehicle_attack_tower", ATTACK_HELICOPTER )
      on_vehicle_destroyed( "ep04_helicopter_destroyed", ATTACK_HELICOPTER )

      marker_add_vehicle( ATTACK_HELICOPTER, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_INTERACT )

      -- Setup the power node on-death callbacks
      for index, name in pairs( SECURITY_NODES ) do
         mesh_mover_reset( name )
         on_mover_destroyed( "ep04_security_node_destroyed", name )
      end

      -- Setup the node triggers 
      group_create( SECURITY_NODE_DEFENDERS_GROUP )

      for index, name in pairs( NODE_ATTACK_AREA_TRIGGERS ) do
         trigger_enable( name, true )
         on_trigger( "ep04_node"..index.."_defenders_attack", name );
      end

   elseif ( state_to_setup == MS_GO_TO_TOP_OF_TOWER ) then
      -- We've destroyed all the security nodes
      Destroyed_all_nodes = true

      -- Activate a trigger near the top of the tower
      trigger_enable( TOP_OF_TOWER_TRIGGER, true )
      on_trigger( "ep04_reached_top_of_tower", TOP_OF_TOWER_TRIGGER )
      marker_add_trigger( TOP_OF_TOWER_TRIGGER, MINIMAP_ICON_LOCATION, "", SYNC_ALL )

      -- No need to know how many security nodes remain
      objective_text_clear(0)

      -- Tell the player where to go
      mission_help_table( HT_GET_TO_THE_TOP )
   elseif ( state_to_setup == MS_KILL_VOGEL ) then
      ep04_stop_heli_attack()
      fade_out( 0 )
      if ( coop_is_active() ) then
         vehicle_exit_teleport( REMOTE_PLAYER )
      end
      vehicle_exit_teleport( LOCAL_PLAYER )
      group_destroy( ATTACK_HELICOPTER_GROUP )

      cutscene_play( CT_HELICOPTER, "", {PLAYER_OFFICE_LOCATION, REMOTE_PLAYER_OFFICE_LOCATION}, false )
		Entered_tower = true

      action_nodes_restrict_spawning(true)
	  local interior, blocking, temporary
      interior = true
      blocking = true
      temporary = false
   	city_chunk_swap("SR2_IntSRMisPhiltwr", "blowup", interior, blocking, temporary )

      group_show( VOGEL_DEFENSE_SQUAD_GROUP )

      -- Teleport the player and Vogel into a good location
      character_show( VOGEL_NAME )
      teleport( VOGEL_NAME, VOGEL_OFFICE_LOCATION )

      -- Do all the overrides for Vogel
      for index, override in pairs( VOGEL_PERSONA_OVERRIDES ) do
         persona_override_character_start( VOGEL_NAME, override[1], override[2] )
      end

		--Players should not use a chainsaw against Vogel it makes bad things happen
		if coop_is_active() then
			 if inv_has_item("chainsaw", REMOTE_PLAYER) then
				inv_weapon_disable_slot(WEAPON_SLOT_MELEE)
			 end
		end

      fade_in( AFTER_CHUNK_SWAP_FADE_IN_TIME_SECONDS )

      -- Setup Vogel
      turn_invulnerable( VOGEL_NAME )
      set_max_hit_points( VOGEL_NAME, VOGELS_HEALTH )
      set_current_hit_points( VOGEL_NAME, VOGELS_HEALTH )
      character_prevent_flinching( VOGEL_NAME, true )
      character_allow_ragdoll( VOGEL_NAME, false )
      on_death( "ep04_vogel_died", VOGEL_NAME )
      marker_add_npc( VOGEL_NAME, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL )
      hud_bar_on(0, "Health", HT_VOGELS_HEALTH, VOGELS_HEALTH )
      hud_bar_set_range(0, 0, VOGELS_HEALTH, SYNC_ALL )
      hud_bar_set_value(0, VOGELS_HEALTH, SYNC_ALL )
      on_take_damage( "ep04_vogel_damaged", VOGEL_NAME )

      attack_safe( VOGEL_NAME, LOCAL_PLAYER )

		mission_help_table( HT_KILL_VOGEL )
   end
end

-- Has Vogel flee to the point farthest from the location of any player.
--
function ep04_vogel_flee()
   Vogel_is_fleeing = true

   local farthest_dist, farthest_point
   farthest_dist = get_dist_closest_player_to_object( VOGEL_FLEE_POINTS[1] )
   farthest_point = VOGEL_FLEE_POINTS[1]

   for index, cur_flee_point in pairs( VOGEL_FLEE_POINTS ) do
      local cur_point_dist = get_dist_closest_player_to_object( cur_flee_point )

      if ( cur_point_dist > farthest_dist  ) then
         farthest_point = cur_flee_point
         farthest_dist = cur_point_dist
      end
   end
   mission_debug( "point found was: "..farthest_point, 20 )
   set_ignore_ai_flag( VOGEL_NAME, true )
   move_to_safe( VOGEL_NAME, farthest_point, 2, false, false )
   set_ignore_ai_flag( VOGEL_NAME, false )
   local distance, player_name = get_dist_closest_player_to_object( VOGEL_NAME )
   attack_safe( VOGEL_NAME, player_name )

   Vogel_is_fleeing = false
end

-- Called when Vogel takes damage. Causes him to flee if he isn't already doing so.
--
function ep04_vogel_damaged( attacked_object_name, attacker_name, percent_hp_remaining_after_attack )

   -- Find out the percent of Vogel's total hit points this attack did
   local cur_damage_percent = get_current_hit_points( VOGEL_NAME ) / get_max_hit_points( VOGEL_NAME )
   local percent_damage_done = cur_damage_percent - percent_hp_remaining_after_attack

   -- By default, do a normal amount of damage to Vogel
   local percent_to_set = percent_hp_remaining_after_attack

   -- If Vogel's not fleeing, then update his "percent until next flee."
   if ( Vogel_is_fleeing == false ) then
      -- Update the amount of damage Vogel has taken since he last fleed
      Vogel_percent_damage_since_last_flee = Vogel_percent_damage_since_last_flee + percent_damage_done

      -- If it's greater than the flee threshold, then have him flee, unless this is the last point.
      if ( Vogel_percent_damage_since_last_flee > VOGEL_RUN_TO_NEXT_POINT_DAMAGE_PERCENT and
           percent_hp_remaining_after_attack > VOGEL_RUN_TO_NEXT_POINT_DAMAGE_PERCENT ) then
         -- Set Vogel's HP to the amount after the attack minus the amount done is over the threshold
         local damage_done_over_threshold_percent = ( Vogel_percent_damage_since_last_flee - VOGEL_RUN_TO_NEXT_POINT_DAMAGE_PERCENT )
         percent_to_set = percent_hp_remaining_after_attack + damage_done_over_threshold_percent
         mission_debug( "vogel fleeing. setting percent at "..percent_to_set )

         Vogel_percent_damage_since_last_flee = 0
         thread_new( "ep04_vogel_flee" )
      end
   else
      -- Do a different amount of damage when Vogel is fleeing, and don't have it registered against the "percent since last flee."
      percent_to_set = cur_damage_percent - ( percent_damage_done * VOGEL_FLEEING_DAMAGE_MULTIPLIER )
   end
   
   local max_hp = get_max_hit_points( VOGEL_NAME )
   set_current_hit_points( VOGEL_NAME, percent_to_set * max_hp )

   local vogel_hp =  get_current_hit_points( VOGEL_NAME )
   hud_bar_set_value(0, vogel_hp, SYNC_ALL )
end

function ep04_vogel_died()
   character_allow_ragdoll( VOGEL_NAME, true )
   mission_end_success( MISSION_NAME, CT_OUTRO, { LOCAL_FRONT_OF_TOWER, REMOTE_FRONT_OF_TOWER } )
end

-- Sets up Vogel's limo itself so that it's ready to travel.
--
function ep04_setup_vogel_limo()
   turn_invulnerable( VOGELS_LIMO_NAME )

   vehicle_disable_chase( VOGELS_LIMO_NAME, true )
   vehicle_infinite_mass( VOGELS_LIMO_NAME, true )
   vehicle_ignore_repulsors( VOGELS_LIMO_NAME, true )

   vehicle_set_allow_ram_ped( VOGELS_LIMO_NAME, true )
   vehicle_suppress_npc_exit( VOGELS_LIMO_NAME, true )
   vehicle_prevent_explosion_fling( VOGELS_LIMO_NAME, true )

   vehicle_set_bulletproof_glass( VOGELS_LIMO_NAME, true )
   for index, name in pairs( LIMO_CHARACTERS ) do
      turn_invulnerable( name )
   end

   set_max_hit_points( VOGELS_LIMO_NAME, VOGELS_LIMO_HEALTH )
   set_current_hit_points( VOGELS_LIMO_NAME, VOGELS_LIMO_HEALTH )
end

function ep04_reached_top_of_tower( triggerer_name )
   trigger_enable( TOP_OF_TOWER_TRIGGER, false )
   marker_remove_trigger( TOP_OF_TOWER_TRIGGER, SYNC_ALL )

   ep04_setup_state( MS_KILL_VOGEL, triggerer_name )
end

-- Stops the attack helicopter spawn chain.
--
function ep04_stop_heli_attack()
   -- If the helicopter spawn thread is running, stop it - no more attack helicopters should
   -- spawn.
   if ( Heli_spawn_thread_handle ~= INVALID_THREAD_HANDLE ) then
      thread_kill( Heli_spawn_thread_handle )
   end

   -- Clear the on-killed callback if an attack helicopter is still alive
   if ( vehicle_is_destroyed( ENEMY_ATTACK_HELICOPTER ) == false ) then
      on_vehicle_destroyed( "", ENEMY_ATTACK_HELICOPTER )
   end

   if ( group_is_loaded( ENEMY_HELICOPTER_GROUP ) ) then
      group_destroy( ENEMY_HELICOPTER_GROUP )
   end
end

-- Finds the first node after the passed-in one in the list of nodes that is
-- still alive, and returns its name.
--
-- NOTE: If no nodes survive, will return nil.
--
-- this_node_name: The node to search after.
--
function ep04_get_next_living_node( this_node_name )
   -- Find the index of the node
   local this_nodes_index

   for node_index, node_name in pairs( SECURITY_NODES ) do
      if ( this_node_name == node_name ) then
         this_nodes_index = node_index
         break
      end
   end

   -- Start looking through the nodes one past this one
   local cur_node_index = this_nodes_index + 1

   -- Now, go through the indices until you find a living node
   while ( cur_node_index <= NUM_SECURITY_NODES ) do

      -- If this node isn't destroyed, then return its name
      if ( Nodes_destroyed[SECURITY_NODES[cur_node_index]] == false ) then
         return SECURITY_NODES[cur_node_index]
      end

      cur_node_index = cur_node_index + 1
   end

   return nil
end

function ep04_security_node_destroyed( security_node_name )
   Num_nodes_killed = Num_nodes_killed + 1

   Nodes_destroyed[security_node_name] = true

   local smoke_effect_to_play = SMOKE_EFFECTS[rand_int( 1, NUM_SMOKE_EFFECTS )]

   if ( Currently_marked_node_name == security_node_name ) then
      marker_remove_navpoint( NODE_MARKER_LOCATIONS[security_node_name], SYNC_ALL )
      Marked_node_currently_marked = false
   end
   Node_smoke_handles[security_node_name] = effect_play( smoke_effect_to_play,
                                                         NODE_SMOKE_ORIGINS[security_node_name], true )

   mission_help_table_nag( HT_X_OF_Y_SECURITY_NODES_DESTROYED, Num_nodes_killed, NUM_SECURITY_NODES )
   objective_text(0, HT_X_OF_Y_SECURITY_NODES, Num_nodes_killed, NUM_SECURITY_NODES )

   -- If there are more nodes to kill, we might need to update the player's guidance
   if ( Num_nodes_killed < NUM_SECURITY_NODES ) then
      -- If this node that was just killed had a marker before it was killed, then mark the next living node
      -- in the list and store that node's name as the currently marked node
      if ( Currently_marked_node_name == security_node_name ) then
         local next_living_node = ep04_get_next_living_node( security_node_name )

         marker_add_navpoint( NODE_MARKER_LOCATIONS[next_living_node], MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL, SYNC_ALL )
         Currently_marked_node_name = next_living_node
         Marked_node_currently_marked = true
      end
   else
      ep04_setup_state( MS_GO_TO_TOP_OF_TOWER )
   end
end

-- Sets up the distance and damaged tracking for Vogel's limo.
--
function ep04_setup_vogel_limo_tracking()
   local full_value = 1.0
   local min_value = 0

   hud_bar_on(0, "Damage", HT_ARMOR, full_value )
   hud_bar_set_range(0, min_value, full_value, SYNC_ALL )
   hud_bar_set_value(0, full_value, SYNC_ALL )
   on_take_damage( "ep04_vogel_limo_initial_damage", VOGELS_LIMO_NAME )
   on_collision( "ep04_vogel_limo_collision", VOGELS_LIMO_NAME )

   if ( get_dist( LOCAL_PLAYER, VOGELS_LIMO_NAME ) < VOGELS_LIMO_MAX_DIST_METERS ) then
      Players_in_range_of_limo[LOCAL_PLAYER] = true
   end
   if ( coop_is_active() ) then
      if ( get_dist( REMOTE_PLAYER, VOGELS_LIMO_NAME ) < VOGELS_LIMO_MAX_DIST_METERS ) then
         Players_in_range_of_limo[REMOTE_PLAYER] = true
      end
   end

   distance_display_on( VOGELS_LIMO_NAME, 0, VOGELS_LIMO_MAX_DIST_METERS, 0, VOGELS_LIMO_MAX_DIST_METERS, SYNC_ALL )
   --on_tailing_good( "ep04_reached_vogels_limo_initial" )
   on_tailing_good( "ep04_good_distance_from_limo" )
   on_tailing_too_far( "ep04_too_far_from_vogels_limo" )
   marker_add_vehicle( VOGELS_LIMO_NAME, MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL, SYNC_ALL )
end

-- Causes Vogel's limo to continually pathfind in a loop.
--
function ep04_limo_loop_pathfind()
   -- 
   set_ignore_ai_flag( VOGEL_LIMO_DRIVER, true )

   set_unjackable_flag( VOGELS_LIMO_NAME, true )

   vehicle_set_crazy( VOGELS_LIMO_NAME, true )
   vehicle_disable_chase( VOGELS_LIMO_NAME, true )
   vehicle_disable_flee( VOGELS_LIMO_NAME, true )

   local stop_at_goal = false
   local navmesh_pathfind = true
   vehicle_pathfind_to( VOGELS_LIMO_NAME, TO_LOOPING_PATH, navmesh_pathfind, stop_at_goal )

   while ( true ) do
      mission_debug( "looping started" )
      stop_at_goal = false
      navmesh_pathfind = false

      for index, path_name in pairs( VOGELS_LIMO_PATHS ) do
         vehicle_pathfind_to( VOGELS_LIMO_NAME, path_name, navmesh_pathfind, stop_at_goal )
      end
      thread_yield()
   end
end

-- Called the first time Vogel's limo is damaged - results in the limo running away faster, to make
-- it seem to react intelligently to the attack.
--
function ep04_vogel_limo_initial_damage( attacked_object_name, attacker_name, percent_hp_remaining_after_attack )
   if ( attacker_name == LOCAL_PLAYER or attacker_name == REMOTE_PLAYER ) then
      mission_debug( "limo initial damage" )
      vehicle_speed_override( VOGELS_LIMO_NAME, VOGELS_LIMO_ESCAPE_SPEED_MPS )

      on_take_damage( "ep04_vogel_limo_damaged", VOGELS_LIMO_NAME )
      ep04_vogel_limo_damaged( attacked_object_name, attacker_name, percent_hp_remaining_after_attack )
   end
end

function ep04_vogel_limo_collision()
   local cur_hp = get_current_hit_points( VOGELS_LIMO_NAME )
   local max_hp = get_max_hit_points( VOGELS_LIMO_NAME )

   ep04_limo_damage_handler( cur_hp / max_hp )
end

-- Called when Vogel's limo is damaged - updates the HUD bar and possibly changes the limo's behavior.
--
function ep04_vogel_limo_damaged( attacked_object_name, attacker_name, percent_hp_remaining_after_attack )
   ep04_limo_damage_handler( percent_hp_remaining_after_attack )
end

function ep04_limo_damage_handler( percent_hp_remaining_after_attack )
   -- Check to see how much damage was done as a percent of the limo's total health - use the limo's current
   -- health and the percent left after the attack to calculate
   local cur_limo_hp_percent = ( get_current_hit_points( VOGELS_LIMO_NAME ) / get_max_hit_points( VOGELS_LIMO_NAME ) )
   local damage_done_percent = cur_limo_hp_percent - percent_hp_remaining_after_attack

   -- If the remaining HP is less than the flee threshold, then flee if we haven't already.
   if ( percent_hp_remaining_after_attack <= LIMO_HEALTH_LEVEL_FLEE_PERCENT ) then
      if ( Vogel_return_to_tower_thread_handle == INVALID_THREAD_HANDLE ) then
         on_take_damage( "", VOGELS_LIMO_NAME )
         on_collision( "", VOGELS_LIMO_NAME )

         mission_debug( "return to tower pathfind called" )
         Vogel_return_to_tower_thread_handle = thread_new( "ep04_limo_return_to_tower_pathfind" )
         -- smoke, fire
         vehicle_set_smoke_and_fire_state( VOGELS_LIMO_NAME, true, false )
      end
   end

   -- We want to set the HP at the normal amount of damage the car would have taken
   local percent_to_set_hp_at = percent_hp_remaining_after_attack

   -- Do not allow the limo's health to fall below the value it was at when it fled
   if ( percent_to_set_hp_at <= LIMO_HEALTH_LEVEL_FLEE_PERCENT ) then
      percent_to_set_hp_at = LIMO_HEALTH_LEVEL_FLEE_PERCENT
   end

   local cur_limo_max_hp = get_max_hit_points( VOGELS_LIMO_NAME )
   local limo_hp_to_set = percent_to_set_hp_at * cur_limo_max_hp
   set_current_hit_points( VOGELS_LIMO_NAME, limo_hp_to_set )

   local percent_to_set_bar_at = ( percent_to_set_hp_at - LIMO_HEALTH_LEVEL_FLEE_PERCENT ) / ( 1.0 - LIMO_HEALTH_LEVEL_FLEE_PERCENT )

   hud_bar_set_value(0, percent_to_set_bar_at, SYNC_ALL )
end

-- Causes Vogel's limo to return to the Phillips tower when it's been
-- damaged enough.
--
function ep04_limo_return_to_tower_pathfind()
   mission_debug( "vogel's limo returning to the tower called" )

   -- Stop "He's getting away!" mission failure and clear out any messages
   if ( Limo_getting_away_thread_handle ~= INVALID_THREAD_HANDLE ) then
      thread_kill( Limo_getting_away_thread_handle )
      Limo_getting_away_thread_handle = INVALID_THREAD_HANDLE
      mission_help_clear( SYNC_ALL )
   end
   hud_bar_off(0)
   hud_timer_stop(0)
   distance_display_off(SYNC_ALL)

   mission_help_table_nag( HT_VOGELS_HEADING_BACK )

   vehicle_speed_override( VOGELS_LIMO_NAME, VOGELS_LIMO_RETURN_TO_BASE_SPEED_MPS )

   thread_kill( Vogel_limo_pathfinding_thread_handle )
   Vogel_limo_pathfinding_thread_handle = INVALID_THREAD_HANDLE

   -- Pathfind up to the first point, still on the road
   local stop_at_goal = false
   local navmesh_pathfind = false
   vehicle_pathfind_to( VOGELS_LIMO_NAME, PHILLIPS_TOWER_LIMO_RETURN_POINT_ONE, navmesh_pathfind, stop_at_goal )

   mission_debug( "return part 1 finished" )

   -- Now continue on the navmesh till you're near the structure
   stop_at_goal = true
   navmesh_pathfind = true
   vehicle_pathfind_to( VOGELS_LIMO_NAME, PHILLIPS_TOWER_LIMO_RETURN_POINT_TWO, navmesh_pathfind, stop_at_goal )

   set_ignore_ai_flag( VOGEL_LIMO_DRIVER, false )
   mission_debug( "return part 2 finished" )


   marker_remove_vehicle( VOGELS_LIMO_NAME )

   mission_debug( "vogel enter tower ..." )
   ep04_setup_state( MS_VOGEL_ENTER_THE_TOWER )
end

function ep04_all_players_too_far_from_limo()
   if ( Players_in_range_of_limo[LOCAL_PLAYER] == false ) then
      if ( coop_is_active() ) then
         if ( Players_in_range_of_limo[REMOTE_PLAYER] == false ) then
            return true
         end
      else
         return true
      end
   end

   return false
end

function ep04_reached_vogels_limo_initial()
   mission_debug( "reached initial" )
   on_tailing_good( "ep04_good_distance_from_limo" )
   on_tailing_too_far( "ep04_too_far_from_vogels_limo" )
end

function ep04_good_distance_from_limo( triggerer_name )
   Players_in_range_of_limo[triggerer_name] = true

   if ( Limo_getting_away_thread_handle ~= INVALID_THREAD_HANDLE ) then
      thread_kill( Limo_getting_away_thread_handle )
      mission_help_clear( SYNC_ALL )
      Limo_getting_away_thread_handle = INVALID_THREAD_HANDLE
   end
end

function ep04_too_far_from_vogels_limo( triggerer_name )
   Players_in_range_of_limo[triggerer_name] = false

   if ( ep04_all_players_too_far_from_limo() ) then
      Limo_getting_away_thread_handle = thread_new( "ep04_vogel_fail_help_text_timer" )
   end
end

function ep04_helicopter_destroyed()
   mission_end_failure( MISSION_NAME, HT_HELICOPTER_DESTROYED )
end

function ep04_vogel_fail_help_text_timer()
   local cur_time_left_seconds = CHASE_VOGEL_FAIL_TIME_MS / 1000
   mission_help_table_nag( HT_CATCH_UP, cur_time_left_seconds )
   while ( cur_time_left_seconds > 0 ) do
      delay( TIME_PER_CATCH_UP_UPDATE_SECONDS )
      cur_time_left_seconds = cur_time_left_seconds - TIME_PER_CATCH_UP_UPDATE_SECONDS
      mission_help_table_nag( HT_CATCH_UP, cur_time_left_seconds )
   end

   mission_end_failure( MISSION_NAME, HT_VOGEL_ESCAPED )
end

function ep04_cleanup()
	-- Cleanup mission here

	--Enable crib triggers
	trigger_enable ( PB_TRIGGER_ICON, true )
	trigger_enable ( PB_TRIGGER_WEAPON, true )
	trigger_enable ( PB_TRIGGER_CLOTHES, true )
	trigger_enable ( PB_TRIGGER_CASH, true )
	trigger_enable ( PB_TRIGGER_CLIP, true )
	trigger_enable ( PB_TRIGGER_TELE_IN, true )
	trigger_enable ( PB_TRIGGER_TELE_OUT, true )
	trigger_enable ( PB_TRIGGER_TELE_HELI_IN, true )
	trigger_enable ( PB_TRIGGER_TELE_HELI_OUT, true )
	trigger_enable ( PB_TRIGGER_TELE_ARENA_IN, true )
	trigger_enable ( PB_TRIGGER_TELE_TOHO_IN, true )
	trigger_enable ( PB_TRIGGER_TELE_ISLAND_IN, true )
	trigger_enable ( PB_TRIGGER_TELE_GYM_IN, true )

   notoriety_set_min( ENEMY_GANG, 0 )
   on_vehicle_enter( "", LOCAL_PLAYER )
   if ( coop_is_active() ) then
      on_vehicle_enter( "", REMOTE_PLAYER )
   end
   on_tailing_good( "" )
   on_tailing_too_far( "" )
   distance_display_off(SYNC_ALL)
   
   vehicle_set_untowable( VOGELS_LIMO_NAME, false )

   for index, effect_handle in pairs( Node_smoke_handles ) do
      if ( effect_handle ~= INVALID_EFFECT_HANDLE ) then
         effect_stop( effect_handle )
      end
   end

   if ( Marked_node_currently_marked == true ) then
      marker_remove_navpoint( NODE_MARKER_LOCATIONS[Currently_marked_node_name], SYNC_ALL )
   end

   -- If either player is in the attack helicopter, release it to the world so that
   -- they don't fall to their deaths.
   if ( character_is_in_vehicle( LOCAL_PLAYER, ATTACK_HELICOPTER ) ) then
      release_to_world( ATTACK_HELICOPTER_GROUP )
   elseif ( coop_is_active() ) then
      if ( character_is_in_vehicle( REMOTE_PLAYER, ATTACK_HELICOPTER ) ) then
         release_to_world( ATTACK_HELICOPTER_GROUP )
      end
   end
   
   action_nodes_restrict_spawning(false)

	if ( Entered_tower ) then
		teleport( LOCAL_PLAYER, LOCAL_FRONT_OF_TOWER )
		if ( coop_is_active() ) then
			teleport( REMOTE_PLAYER, REMOTE_FRONT_OF_TOWER )
		end
	end

   -- Swap the tower back to the blown up state if this mission was being replayed
   if ( mission_is_complete( MISSION_NAME ) ) then
      local interior, blocking, temporary
      interior = true
      blocking = false
      temporary = false
   	city_chunk_swap("SR2_IntSRMisPhiltwr", "blowup", interior, blocking, temporary )
   end
   inv_weapon_enable_or_disable_all_slots( true )
   mid_mission_phonecall_reset()
	homie_mission_unlock("gat") 
end

function ep04_success()
	-- Called when the mission has ended with success

	-- Post the news event
	radio_post_event("JANE_NEWS_TSSE04", true)

end
