-- ss09.lua
-- SR2 mission script
-- 3/28/07

-- Mission help table text tags
   HT_GO_TO_WAREHOUSE = "ss09_go_to_meatpacking_plant"
   HT_FIND_MR_SUNSHINE = "ss09_find_mr_sunshine"
   HT_KILL_MR_SUNSHINE = "ss09_kill_mr_sunshine"
   HT_MR_SUNSHINE_HEALTH = "ss09_sunshine_health_bar_label"
   HT_SHOOT_SUNSHINES_DOLL = "ss09_shoot_sunshines_doll"

-- Mission states
   MS_GO_TO_WAREHOUSE = 1
   MS_ENTERED_WAREHOUSE_AREA = 2
   MS_ENTERED_WAREHOUSE = 3
   MS_REACHED_MR_SUNSHINE = 4
   MS_MR_SUNSHINE_FINAL_BATTLE = 6

-- Groups, NPCs, vehicles, navpoints, and other names
   -- Mission constant names
   MISSION_NAME = "ss09"
   -- ( Mission Prefix )
   MP = MISSION_NAME.."_$"

   ENEMY_GANG = "Samedi"

   -- Checkpoints
   CP_REACHED_WAREHOUSE_SIDE_1 = "Reached_Warehouse_Checkpoint_One"
   CP_REACHED_WAREHOUSE_SIDE_2 = "Reached_Warehouse_Checkpoint_Two"
   CP_REACHED_MR_SUNSHINE = "Reached_Mr_Sunshine"

   -- Weapons
   SUNSHINE_RANGED_WEAPON = "ak47"
   SUNSHINE_MELEE_WEAPON = "machete"

   -- Groups
   STARTER_CAR_GROUP = MP.."Starter_Car"
   STARTER_CAR_COOP_GROUP = MP.."Starter_Car_Coop"
   OUTSIDE_DEFENDERS_GROUP = MP.."Outside_Defenders"
   AMBIENT_CARS_GROUP = MP.."Ambient_Cars"
   MEATPACKING_PLANT_DEFENDERS = MP.."Plant_Defenders"
   MR_SUNSHINE_GROUP = MP.."Mr_Sunshine"
   MR_SUNSHINE_DEFENDERS_GROUP = MP.."Mr_Sunshine_Defenders"
   MR_SUNSHINE_REINFORCEMENTS_GROUP = MP.."Mr_Sunshine_Reinforcements"
   EXTRA_AMMO_GROUP = MP.."Extra_Ammo"

   VOODOO_DOLL_GROUP = MP.."Voodoo_Doll"

   -- NPC names
   OUTSIDE_DEFENDERS = { MP.."OD01", MP.."OD02", MP.."OD03", MP.."OD04", MP.."OD05", MP.."OD06",
                         MP.."OD07", MP.."OD08", MP.."OD09", MP.."OD10", MP.."OD11" }

   OUTSIDE_DEFENDERS_TO_UNLEASH = { OUTSIDE_DEFENDERS[9], OUTSIDE_DEFENDERS[10], OUTSIDE_DEFENDERS[11] }

   PLANT_DEFENDER_ASSAULTERS = { MP.."PD_Charge1", MP.."PD_Charge2" }

   PLANT_DEFENDERS = { MP.."PD01", MP.."PD02", MP.."PD03", MP.."PD04", MP.."PD05",
                       MP.."PD06", MP.."PD07", MP.."PD08", MP.."PD09", MP.."PD10",
                       MP.."PD11", MP.."PD12" }

   RUN_DOWNSTAIRS_GUY = PLANT_DEFENDERS[12]

   SECOND_FLOOR_PLANT_DEFENDERS = { PLANT_DEFENDERS[6], PLANT_DEFENDERS[7], PLANT_DEFENDERS[8],
                                    PLANT_DEFENDERS[9], PLANT_DEFENDERS[10] }

   MR_SUNSHINE_NAME = MP.."Mr_Sunshine"

   WALKERS = { MP.."Walker01", MP.."Walker02" }

   MR_SUNSHINE_DEFENDERS = { MP.."DF1", MP.."DF2", MP.."DF3", MP.."DF4" }
   MR_SUNSHINE_REINFORCEMENTS = { MP.."RF1", MP.."RF2", MP.."RFG", MP.."RF4", MP.."Downfall", MP.."SR3" }

   MR_SUNSHINE_BODYGUARDS = { MP.."Sunshine_Bodyguard01", MP.."Sunshine_Bodyguard02" }

   -- Vehicle names

   -- Navpoints and paths
   WALKER_PATH = MP.."Walker_Path"
   LOCAL_PLAYER_START = MP.."Local_Player_Start"
   REMOTE_PLAYER_START = MP.."Remote_Player_Start"
   USE_VOODOO_ORIENT = MP.."Use_Voodoo_Orient"
   USE_VOODOO_LOCATION = MP.."Use_Voodoo"

   USE_VOODOO_DIRECTION = MP.."Use_Voodoo_Direction"
   DOLL_FALL_START_LOCATION = MP.."Doll_Fall_Start"

   INVINCIBLE_CANDLES_LOCATION = MP.."Invincible_Candles"
   SPARKING_LIGHTS_LOCATIONS = { MP.."Sparking_Light01", MP.."Sparking_Light02" }

   PLANT_DEFENDER_ASSAULTERS_GOALS = { MP.."PD_Charge1_Goal", MP.."PD_Charge2_Goal" }

   CHECKPOINT_WARP_LOCATIONS = { [CP_REACHED_WAREHOUSE_SIDE_1] = { [LOCAL_PLAYER] = MP.."Side1_Warp_Location_Local", [REMOTE_PLAYER] = MP.."Side1_Warp_Location_Remote" },
                                 [CP_REACHED_WAREHOUSE_SIDE_2] = { [LOCAL_PLAYER] = MP.."Side2_Warp_Location_Local", [REMOTE_PLAYER] = MP.."Side2_Warp_Location_Remote" } }

   SUNSHINE_BODYGUARD_PATHS = { MP.."Bodyguard1_Path", MP.."Bodyguard2_Path" }

   SUNSHINE_TO_DOLL_PATHS = { MP.."To_Doll_01", MP.."To_Doll_02", MP.."To_Doll_03" }
   SUNSHINE_BACK_TO_TOP_PLATFORM_PATH = MP.."Back_to_Top_Platform"

   MR_SUNSHINE_REINFORCEMENTS_GOALS = { MP.."RF1_Goal", MP.."RF2_Goal", MP.."RFG_Goal", MP.."RF4_Goal", MP.."Downfall_Goal", MP.."SR3_Goal" }

   RUN_DOWNSTAIRS_GUY_GOAL = MP.."PD12_Goal"

   POST_CT_WARP_POINTS = { [LOCAL_PLAYER] = MP.."Local_Post_CT_Warp",
                           [REMOTE_PLAYER] = MP.."Remote_Post_CT_Warp" }

   -- Triggers
   NEAR_WAREHOUSE_TRIGGERS = { MP.."Near_Warehouse01", MP.."Near_Warehouse02" }
   WAREHOUSE_ENTRANCE_TRIGGER = MP.."Warehouse_Entrance"
   WALKER_TRIGGER = MP.."Walker_Trigger"
   MR_SUNSHINE_FIGHT_ENTRANCE_TRIGGER = MP.."Mr_Sunshine_Fight_Entrance"
   MR_SUNSHINES_PLATFORM_TRIGGER = MP.."Top_Platform"

   -- Movers
   SUNSHINE_DOOR = MP.."Sunshine_Door"

   -- Effects and animation states
   STAB_VOODOO_DOLL = "use voodoo"
   VOODOO_DOLL_KNOCKED_AWAY_FLINCH = "flinch bullet back"
   VOODOO_DOLL_FALL = "SS_doll_drop"
   INVINCIBLE_CANDLES_EFFECT = "SS_candles_invulnerable"
   USE_VOODOO_EFFECT = "SS_underglow"
   SPARKING_LIGHT_EFFECTS = { "Light_elec_spark", "Light_elec_spark02" }

   -- Cutscene names
   USE_DOLL_CUTSCENE = "ig_ss09_scene1"
   WALK_UP_AND_USE_DOLL_CUTSCENE = "ig_ss09_scene2"
   CT_INTRO = "ss09-01"
   CT_OUTRO = "ss09-02"
-- Sound
   -- Persona overrides
   MR_SUNSHINE_PERSONA_OVERRIDES =
   {
   { "threat - alert (solo attack)", "SOS09_SUNSHINE_ATTACK" },
   { "threat - alert (group attack)", "SOS09_SUNSHINE_ATTACK" },
   { "threat - damage received (firearm)", "SOS09_SUNSHINE_TAKEDAM" },
   { "threat - damage received (melee)", "SOS09_SUNSHINE_TAKEDAM" }
   }

   -- Lines/Dialog Stream
   PLAYER_REACHES_TOP_PLATFORM_DIALOG_STREAM =
   {
   { "SUNSHINE_SOS9_ENTER_02", MR_SUNSHINE_NAME, 0 },
   { "SOS9_STEPOFF_L2", MR_SUNSHINE_NAME, 0 }

   }

   SUNSHINE_USE_VOODOO_DOLL_LINES = "SOS09_SUNSHINE_USEDOLL"
   SUNSHINE_VOODOO_INTERRUPTED_LINES = "SUNSHINE_SOS9_VOODOO"

   -- Sound effects

-- Distances
   WANDER_RADIUS_METERS = 2.0
   SUNSHINE_MELEE_ATTACK_DIST = 5.0

-- Percents and multipliers
   MR_SUNSHINE_HP_MULTIPLIER = 6
   VOODOO_DOLL_DAMAGE_PERCENT = .05
   SUNSHINE_RECOVER_PERCENT = .1
   RAGDOLL_DAMAGE_MODIFIER = 0.25

-- Time values
   BEFORE_DISABLE_VOODOO_ATTACK_ALLOWED_SECONDS = 1
   VOODOO_ATTACK_BEFORE_EFFECT_SECONDS = 5.5
   MR_SUNSHINE_VOODOO_ATTACK_INTERVAL_SECONDS = 15
   MR_SUNSHINE_VOODOO_ATTACK_INTERVAL_WHEN_HIDING_SECONDS = 25
   THROUGH_WAREHOUSE_VOODOO_RAGDOLL_MS = 2000
   THROUGH_WAREHOUSE_VOODOO_RAGDOLL_MS_COOP = 4000
   VOODOO_RAGDOLL_MS = 2000
   REINFORCEMENTS_DELAY_SECONDS = 4.0
   MR_SUNSHINE_MIN_COVER_DELAY_SECONDS = 3.0
   MR_SUNSHINE_MAX_COVER_DELAY_SECONDS = 5.0

   MR_SUNSHINE_PICK_UP_DOLL_SECONDS = 4
   POST_DOLL_RETRIEVAL_RESUME_VOODOO_ATTACK_DELAY_SECONDS = 30.0 - MR_SUNSHINE_VOODOO_ATTACK_INTERVAL_SECONDS

   MR_SUNSHINE_FIRST_VOODOO_ATTACK_DELAY = MR_SUNSHINE_VOODOO_ATTACK_INTERVAL_SECONDS - 5

   -- How long Mr. Sunshine attacks in melee when he does
   SUNSHINE_MELEE_ATTACK_DURATION_SECONDS = 5
   -- Once Mr. Sunshine does a melee attack, how long before he
   -- can do it again
   SUNSHINE_BETWEEN_MELEE_ATTACKS_DURATION_SECONDS = 10
   -- How often the game checks to see if Mr. Sunshine should do a
   -- melee attack
   SUNSHINE_MELEE_UPDATE_SECONDS = 1

   THROUGH_THE_WAREHOUSE_VOODOO_ATTACK_INTERVAL_SECONDS = 15.0
   THROUGH_THE_WAREHOUSE_VOODOO_ATTACK_INTERVAL_COOP_SECONDS = 12.00

-- Speeds
   VOODOO_RAGDOLL_PUSH_SPEED_MPS = 10

-- Constant values and counts
   MIN_NOTORIETY_LEVEL = 5
   OUTSIDE_DEFENDERS_REMAINING_UNLEASH_THRESHOLD = sizeof_table( OUTSIDE_DEFENDERS ) - 2
   FAKE_NOTORIETY_LEVEL = 4
   SECOND_FLOOR_DEFENDER_THRESHOLD = 2
   MR_SUNSHINE_DEFENDERS_RESPAWN_THRESHOLD = 2

-- Global variables
   Players_making_way_through_warehouse = false

   Players_on_top_platform = { [LOCAL_PLAYER] = false, [REMOTE_PLAYER] = false }
   Mr_Sunshine_defender_count = 0
   Mr_Sunshine_voodoo_attack_thread_handle = INVALID_THREAD_HANDLE
   Mr_Sunshine_voodoo_attack_loop_thread_handle = INVALID_THREAD_HANDLE
   Mr_Sunshine_melee_attack_loop_thread_handle = INVALID_THREAD_HANDLE
   Mr_Sunshine_running_downstairs_thread_handle = INVALID_THREAD_HANDLE

   Mr_Sunshine_approaching_voodoo_location = false
   Mr_Sunshine_doing_voodoo_attack = false

   Mr_Sunshine_has_voodooed_once = false
   Mr_Sunshine_finished_running = false
   Mr_Sunshine_running_directly_downstairs = false

   Player_shot_voodoo_doll = false
   Shoot_objective_given = false

   Second_floor_defenders_remaining = sizeof_table( SECOND_FLOOR_PLANT_DEFENDERS )

   Outside_defenders_remaining = sizeof_table( OUTSIDE_DEFENDERS )

   Invincible_effect_handle = -1
   Use_voodoo_glow_handle = -1
   Sparking_lights_effect_handles = { -1 }
   Percent_damage_done_this_run = 0
	Controls_disabled = false

function ss09_either_player_on_top_platform()
   if ( Players_on_top_platform[LOCAL_PLAYER] or Players_on_top_platform[REMOTE_PLAYER] ) then
      return true
   end
   return false
end

function ss09_sunshine_melee_attack_loop()
   while ( true ) do
      local dist, player = get_dist_closest_player_to_object( MR_SUNSHINE_NAME )
      if ( dist < SUNSHINE_MELEE_ATTACK_DIST and
           ss09_mr_sunshine_not_doing_voodoo() ) then
         inv_item_remove_all( MR_SUNSHINE_NAME )
         inv_item_add( SUNSHINE_MELEE_WEAPON, 1, MR_SUNSHINE_NAME )
         inv_item_equip( SUNSHINE_MELEE_WEAPON, MR_SUNSHINE_NAME )

         attack_safe( MR_SUNSHINE_NAME, player )
         delay( SUNSHINE_MELEE_ATTACK_DURATION_SECONDS )

         inv_item_remove_all( MR_SUNSHINE_NAME )
         inv_item_add( SUNSHINE_RANGED_WEAPON, 1, MR_SUNSHINE_NAME )
         inv_item_equip( SUNSHINE_RANGED_WEAPON, MR_SUNSHINE_NAME )
         attack_safe( MR_SUNSHINE_NAME, player )

         delay( SUNSHINE_BETWEEN_MELEE_ATTACKS_DURATION_SECONDS )
      else
         delay( SUNSHINE_MELEE_UPDATE_SECONDS )
      end
   end
end

function ss09_no_players_on_top_platform()
   if ( Players_on_top_platform[LOCAL_PLAYER] == false and
        Players_on_top_platform[REMOTE_PLAYER] == false ) then
      return true
   end
   return false
end

function ss09_start( checkpoint_name, is_restart )
   -- Start trigger is hit...the activate button was hit
   set_mission_author("Mark Gabby and Brad Johnson")

   persona_override_group_start( SAMEDI_PERSONAS, POT_SITUATIONS[POT_ATTACK], "SS09_ATTACK" )

   mission_start_fade_out()
  
	if ( checkpoint_name == MISSION_START_CHECKPOINT ) then
		-- The starter groups are this in single player
		local start_groups = { STARTER_CAR_GROUP, OUTSIDE_DEFENDERS_GROUP, AMBIENT_CARS_GROUP }
		-- If we're running in coop, append an extra group to the end
		if ( coop_is_active() ) then
			start_groups = { STARTER_CAR_GROUP, OUTSIDE_DEFENDERS_GROUP, AMBIENT_CARS_GROUP, STARTER_CAR_COOP_GROUP }
		end
		if (not is_restart) then
			cutscene_play( CT_INTRO, start_groups, { LOCAL_PLAYER_START, REMOTE_PLAYER_START }, false )
			for index, group_name in pairs( start_groups ) do
				group_show( group_name )
			end
		else
			for index, group_name in pairs( start_groups ) do
				group_create( group_name, true )
			end

			-- Teleport after group creation to improve loading times
			teleport_coop( LOCAL_PLAYER_START, REMOTE_PLAYER_START )
		end
   end

	local next_state = "Puerto Rico"
   local extra_data
   local actor_name

   if ( checkpoint_name == MISSION_START_CHECKPOINT ) then
      next_state = MS_GO_TO_WAREHOUSE
   elseif ( checkpoint_name == CP_REACHED_WAREHOUSE_SIDE_1 or
            checkpoint_name == CP_REACHED_WAREHOUSE_SIDE_2 ) then
      group_create( OUTSIDE_DEFENDERS_GROUP, true )
      group_create( AMBIENT_CARS_GROUP, true )

      group_create_hidden( MEATPACKING_PLANT_DEFENDERS, true )
      group_create_hidden( MR_SUNSHINE_DEFENDERS_GROUP, true )

      teleport_coop( CHECKPOINT_WARP_LOCATIONS[checkpoint_name][LOCAL_PLAYER],
                     CHECKPOINT_WARP_LOCATIONS[checkpoint_name][REMOTE_PLAYER] )

      next_state = MS_ENTERED_WAREHOUSE_AREA
   elseif ( checkpoint_name == CP_REACHED_MR_SUNSHINE ) then
      group_create( MR_SUNSHINE_GROUP, true )
      group_create( MR_SUNSHINE_DEFENDERS_GROUP, true )

      teleport( MR_SUNSHINE_NAME, USE_VOODOO_LOCATION )
      mesh_mover_play_action( SUNSHINE_DOOR, "start1")
		character_ragdoll( LOCAL_PLAYER, VOODOO_RAGDOLL_MS )
		if ( coop_is_active() ) then
			character_ragdoll( REMOTE_PLAYER, VOODOO_RAGDOLL_MS )
		end

      next_state = MS_REACHED_MR_SUNSHINE
      extra_data = true
   end

   -- No need for guidance to the warehouse if we've already reached Mr. Sunshine.
   if ( checkpoint_name ~= CP_REACHED_MR_SUNSHINE ) then
      trigger_enable( WAREHOUSE_ENTRANCE_TRIGGER, true )
      on_trigger( "ss09_reached_warehouse_entrance", WAREHOUSE_ENTRANCE_TRIGGER )
      marker_add_trigger( WAREHOUSE_ENTRANCE_TRIGGER, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL )
      waypoint_add( WAREHOUSE_ENTRANCE_TRIGGER, SYNC_ALL )
   end

   mission_start_fade_in()

   group_create_hidden( VOODOO_DOLL_GROUP )
	if ( checkpoint_name == MISSION_START_CHECKPOINT ) then
      -- Create all the other groups, but create them hidden
      group_create_hidden( MEATPACKING_PLANT_DEFENDERS )
      group_create_hidden( MR_SUNSHINE_DEFENDERS_GROUP )
	end

   ss09_switch_state( next_state, actor_name, extra_data )
end

function ss09_player_damaged_in_ragdoll( attacked_object_name, attacker_name, percent_hp_remaining_after_attack )
   -- Find the current health percent
   local cur_health_percent = get_current_hit_points( attacked_object_name ) / get_max_hit_points( attacked_object_name )
   -- Find out the percent damage
   local damage_percent = cur_health_percent - percent_hp_remaining_after_attack

   -- Reduce the percent damage
   local new_damage_percent = damage_percent * RAGDOLL_DAMAGE_MODIFIER
   -- Find a new percent remaining
   local new_percent_remaining = cur_health_percent - new_damage_percent

   -- Using the new percent remaining to find the number of hit points this thingy should have
   local new_hit_points = get_max_hit_points( attacked_object_name ) * new_percent_remaining

   if ( new_hit_points > 0 ) then
      set_current_hit_points( attacked_object_name, new_hit_points )
   else
      character_kill( attacked_object_name )
   end
end

function ss09_do_in_warehouse_ragdoll()
   local player_to_ragdoll = LOCAL_PLAYER

   local time_to_ragdoll_ms = THROUGH_WAREHOUSE_VOODOO_RAGDOLL_MS
   local delay_between_ragdoll_attacks_seconds = THROUGH_THE_WAREHOUSE_VOODOO_ATTACK_INTERVAL_SECONDS
   if ( coop_is_active() ) then
      time_to_ragdoll_ms = THROUGH_WAREHOUSE_VOODOO_RAGDOLL_MS_COOP
      delay_between_ragdoll_attacks_seconds = THROUGH_THE_WAREHOUSE_VOODOO_ATTACK_INTERVAL_COOP_SECONDS
   end

   while( Players_making_way_through_warehouse ) do
      -- Dampen player damage while in ragdoll mode
      turn_invulnerable( player_to_ragdoll )
      on_take_damage( "ss09_player_damaged_in_ragdoll", player_to_ragdoll )
      character_ragdoll( player_to_ragdoll, time_to_ragdoll_ms, VOODOO_RAGDOLL_PUSH_SPEED_MPS )
      mission_debug( "ragdolled "..player_to_ragdoll..", waiting "..time_to_ragdoll_ms.." milliseconds." )
      delay( time_to_ragdoll_ms / 1000 )
      -- Return player damage to normal after ragdolling
      turn_vulnerable( player_to_ragdoll )
      on_take_damage( "", player_to_ragdoll )

      -- Switch between players in coop
      if ( coop_is_active() ) then
         if ( player_to_ragdoll == LOCAL_PLAYER ) then
            player_to_ragdoll = REMOTE_PLAYER
         else
            player_to_ragdoll = LOCAL_PLAYER
         end
      end
      mission_debug( "will ragdoll "..player_to_ragdoll..", waiting "..delay_between_ragdoll_attacks_seconds.." seconds." )
      delay( delay_between_ragdoll_attacks_seconds )
   end
end

function ss09_outside_defender_killed()
   Outside_defenders_remaining = Outside_defenders_remaining - 1

   if ( Outside_defenders_remaining == OUTSIDE_DEFENDERS_REMAINING_UNLEASH_THRESHOLD ) then
      for index, member_name in pairs( OUTSIDE_DEFENDERS_TO_UNLEASH ) do
         npc_leash_remove( member_name )
      end
   end
end

function ss09_plant_defender_charge( defender_name, goal_name )
   move_to_safe( defender_name, goal_name, 2, false, true )

   local distance, closest_player = get_dist_closest_player_to_object( defender_name )

   npc_leash_to_nav( defender_name, goal_name, 2 )

   attack_safe( defender_name, closest_player )

   delay( 3.0 )
   npc_leash_remove( defender_name )
end

-- Called to put the mission into a new state
--
-- actor_name: May be nil. Relevant actor.
-- extra_data: For MS_REACHED_MR_SUNSHINE, true if this is a checkpoint
--             resume.
function ss09_switch_state( new_state, actor_name, extra_data )
   -- Initial state- guide the player to the warehouse and set it up to be
   -- ready for his arrival
   if ( new_state == MS_GO_TO_WAREHOUSE ) then
      -- Have the outside defenders wander
      for index, member_name in pairs( OUTSIDE_DEFENDERS ) do
         on_death( "ss09_outside_defender_killed", member_name )
         wander_start( member_name, member_name, WANDER_RADIUS_METERS )
      end

      -- Setup the near and entering warehouse triggers
      for trigger_index, trigger_name in pairs( NEAR_WAREHOUSE_TRIGGERS ) do
         trigger_enable( trigger_name, true )
         on_trigger( "ss09_near_warehouse_side_"..trigger_index, trigger_name )
      end

      -- Guide the player to the warehouse
      mission_help_table( HT_GO_TO_WAREHOUSE, "", "", SYNC_ALL )
      marker_add_trigger( WAREHOUSE_ENTRANCE_TRIGGER, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL )
      waypoint_add( WAREHOUSE_ENTRANCE_TRIGGER, SYNC_ALL )

   -- The player has entered the warehouse's general area, have the outside
   -- defenders defend it
   elseif ( new_state == MS_ENTERED_WAREHOUSE_AREA ) then
      for index, name in pairs ( OUTSIDE_DEFENDERS ) do
         local distance, player = get_dist_closest_player_to_object( name )
         attack_safe( name, player, false )
      end
      notoriety_set_min( ENEMY_GANG, MIN_NOTORIETY_LEVEL )
      notoriety_force_no_spawn( ENEMY_GANG, true )

   -- The player has entered the warehouse.
   -- Play the cutscene and then ready the interior defenders
   elseif ( new_state == MS_ENTERED_WAREHOUSE ) then
      --cutscene_play( 
      Players_making_way_through_warehouse = true
      --thread_new( "ss09_do_in_warehouse_ragdoll" )

      -- Have the outside defenders all come and attack
      if ( group_is_loaded( OUTSIDE_DEFENDERS_GROUP ) ) then
         for index, name in pairs ( OUTSIDE_DEFENDERS ) do
            npc_leash_remove( name )
            local distance, player = get_dist_closest_player_to_object( name )
            attack_safe( name, player, false )
         end
      end

      -- Have two of the attackers charge the player and attack him from cover
      for index, member_name in pairs( PLANT_DEFENDER_ASSAULTERS ) do
         thread_new( "ss09_plant_defender_charge", member_name,
                     PLANT_DEFENDER_ASSAULTERS_GOALS[index] )
      end

      -- Let the player know that he's supposed to find Mr. Sunshine 
      mission_help_table( HT_FIND_MR_SUNSHINE, "", "", SYNC_ALL )
      waypoint_remove( SYNC_ALL )
      group_show( MEATPACKING_PLANT_DEFENDERS )

      hud_set_fake_notoriety( ENEMY_GANG, true, FAKE_NOTORIETY_LEVEL )

      for index, member_name in pairs( PLANT_DEFENDERS ) do
         wander_start( member_name, member_name, WANDER_RADIUS_METERS )
      end

      for index, member_name in pairs( SECOND_FLOOR_PLANT_DEFENDERS ) do
         on_death( "ss09_second_floor_defender_died", member_name )
      end

      -- Setup some special-case triggers
      trigger_enable( WALKER_TRIGGER, true )
      on_trigger( "ss09_walkers_walk", WALKER_TRIGGER )

      -- Set the transition trigger that triggers the next state
      trigger_enable( MR_SUNSHINE_FIGHT_ENTRANCE_TRIGGER, true )
      on_trigger( "ss09_reached_mr_sunshine_fight_area", MR_SUNSHINE_FIGHT_ENTRANCE_TRIGGER )

      marker_add_navpoint( MR_SUNSHINE_NAME, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL )
   elseif ( new_state == MS_REACHED_MR_SUNSHINE ) then
      Players_making_way_through_warehouse = false

      local resuming_from_checkpoint = extra_data
      if ( not resuming_from_checkpoint ) then
         marker_remove_navpoint( MR_SUNSHINE_NAME, SYNC_ALL )

         -- Play the cutscene
         player_controls_disable( LOCAL_PLAYER )
         if ( coop_is_active() ) then
            player_controls_disable( REMOTE_PLAYER )
         end
			Controls_disabled = true
         delay( 0.1 )
         cutscene_play( WALK_UP_AND_USE_DOLL_CUTSCENE, "", { POST_CT_WARP_POINTS[LOCAL_PLAYER], POST_CT_WARP_POINTS[REMOTE_PLAYER] }, false )
			mesh_mover_play_action( SUNSHINE_DOOR, "start1")
         -- Show the groups
			group_create( MR_SUNSHINE_GROUP, true )
         group_show( MR_SUNSHINE_DEFENDERS_GROUP )

			-- In case the cutscene was skipped
         teleport( MR_SUNSHINE_NAME, USE_VOODOO_LOCATION )
         character_ragdoll( LOCAL_PLAYER, VOODOO_RAGDOLL_MS )
         if ( coop_is_active() ) then
            character_ragdoll( REMOTE_PLAYER, VOODOO_RAGDOLL_MS )
         end
         player_controls_enable( LOCAL_PLAYER )
         if ( coop_is_active() ) then
            player_controls_enable( REMOTE_PLAYER )
         end
			Controls_disabled = false
			fade_in( 1.0 )
			fade_in_block()

         mission_set_checkpoint( CP_REACHED_MR_SUNSHINE )
      else
	      notoriety_set_min( ENEMY_GANG, MIN_NOTORIETY_LEVEL )
		   notoriety_force_no_spawn( ENEMY_GANG, true )
		end

      mission_help_table( HT_KILL_MR_SUNSHINE, "", "", SYNC_ALL )

      -- Setup Mr. Sunshine
      ss09_start_invincible_effects()
      turn_invulnerable( MR_SUNSHINE_NAME )
      -- Boss is too easy if you can ragdoll him
      character_prevent_flinching( MR_SUNSHINE_NAME, true )
      character_prevent_explosion_fling( MR_SUNSHINE_NAME, true )
      character_prevent_kneecapping( MR_SUNSHINE_NAME, true )
      character_allow_ragdoll( MR_SUNSHINE_NAME, false )

      on_death( "ss09_mr_sunshine_killed", MR_SUNSHINE_NAME )

      local sunshine_hit_points = get_max_hit_points( LOCAL_PLAYER ) * MR_SUNSHINE_HP_MULTIPLIER
      set_max_hit_points( MR_SUNSHINE_NAME, sunshine_hit_points )
      set_current_hit_points( MR_SUNSHINE_NAME, sunshine_hit_points )
      marker_add_npc( MR_SUNSHINE_NAME, MINIMAP_ICON_KILL, "", SYNC_ALL )

      damage_indicator_on( 0, MR_SUNSHINE_NAME, 0, HT_MR_SUNSHINE_HEALTH, sunshine_hit_points )

      Mr_Sunshine_defender_count = 4
      for index, name in pairs( MR_SUNSHINE_DEFENDERS ) do
         on_death( "ss09_sunshine_defender_died", name )
      end

      local dist, player = get_dist_closest_player_to_object( MR_SUNSHINE_NAME )
      attack_safe( MR_SUNSHINE_NAME, player )

      Mr_Sunshine_voodoo_attack_loop_thread_handle = thread_new( "ss09_mr_sunshine_voodoo_attack_loop" )
      for index, name in pairs( MR_SUNSHINE_BODYGUARDS ) do
         thread_new( "ss09_bodyguard_do_defense", name, SUNSHINE_BODYGUARD_PATHS[index] )
      end

      for index, override in pairs( MR_SUNSHINE_PERSONA_OVERRIDES ) do
         persona_override_character_start( MR_SUNSHINE_NAME, override[1], override[2] )
      end

      group_create( EXTRA_AMMO_GROUP )
   elseif ( new_state == MS_MR_SUNSHINE_FINAL_BATTLE ) then
   end
end

function ss09_start_invincible_effects()
   if ( Invincible_effect_handle == -1 ) then
      -- looping = true
      Invincible_effect_handle = effect_play( INVINCIBLE_CANDLES_EFFECT, INVINCIBLE_CANDLES_LOCATION, true )
   end
end

function ss09_stop_invincible_effects()
   if ( Invincible_effect_handle ~= -1 ) then
      effect_stop( Invincible_effect_handle )
      Invincible_effect_handle = -1
   end
end

-- Causes the bodyguard to path to the location specified and then attack the closest player.
--
-- bodyguard_name: Name of the bodyguard to do the path.
-- path_name: Name of the path to path along.
--
function ss09_bodyguard_do_defense( bodyguard_name, path_name )
   move_to_safe( bodyguard_name, path_name, 2, true, true )

   local dist, player = get_dist_closest_player_to_object( MR_SUNSHINE_NAME )
   attack_safe( bodyguard_name, player )
end

-- Callback when a player leaves the top platform.
-- If he's damaged enough, he needs to go into hiding.
--
function ss09_left_top_platform( triggerer_name )
   Players_on_top_platform[triggerer_name] = false

   if ( ss09_no_players_on_top_platform() ) then
      if ( Mr_Sunshine_melee_attack_loop_thread_handle ~= INVALID_THREAD_HANDLE ) then
         thread_kill( Mr_Sunshine_melee_attack_loop_thread_handle )
         Mr_Sunshine_melee_attack_loop_thread_handle = INVALID_THREAD_HANDLE
      end
   end
end

function ss09_near_warehouse( triggerer_name )
   for trigger_index, trigger_name in pairs( NEAR_WAREHOUSE_TRIGGERS ) do
      trigger_enable( trigger_name, false )
   end
   ss09_switch_state( MS_ENTERED_WAREHOUSE_AREA, triggerer_name )
end

function ss09_near_warehouse_side_1( triggerer_name, trigger_name )
   mission_set_checkpoint( CP_REACHED_WAREHOUSE_SIDE_1 )
   ss09_near_warehouse( triggerer_name )
end

function ss09_near_warehouse_side_2( triggerer_name, trigger_name )
   mission_set_checkpoint( CP_REACHED_WAREHOUSE_SIDE_2 )
   ss09_near_warehouse( triggerer_name )
end

function ss09_reached_warehouse_entrance( triggerer_name, trigger_name )
   trigger_enable( trigger_name, false )
   ss09_switch_state( MS_ENTERED_WAREHOUSE )
end

function ss09_second_floor_defender_died()
   Second_floor_defenders_remaining = Second_floor_defenders_remaining - 1
   if ( Second_floor_defenders_remaining == ( SECOND_FLOOR_DEFENDER_THRESHOLD ) ) then
      -- retry on failure = true, move and fire = true
      npc_leash_remove( RUN_DOWNSTAIRS_GUY )
      move_to( RUN_DOWNSTAIRS_GUY, RUN_DOWNSTAIRS_GUY_GOAL, 2, true, true )
   end
end

function ss09_walkers_walk()
   set_ignore_ai_flag( WALKERS[1], false )
   set_ignore_ai_flag( WALKERS[2], false )

   thread_new( "ss09_walker01_walk" )
   thread_new( "ss09_walker02_walk" )
end

function ss09_walker01_walk()
   move_to( WALKERS[1], WALKER_PATH, 1, true, false )
end

function ss09_walker02_walk()
   move_to( WALKERS[2], WALKER_PATH, 1, true, false )
end

function ss09_reached_mr_sunshine_fight_area( triggerer_name, trigger_name )
   trigger_enable( trigger_name, false )
   ss09_switch_state( MS_REACHED_MR_SUNSHINE )
end

function ss09_mr_sunshine_killed()
   character_allow_ragdoll( MR_SUNSHINE_NAME, true )
   character_prevent_flinching( MR_SUNSHINE_NAME, false )
   character_prevent_explosion_fling( MR_SUNSHINE_NAME, false )
   character_prevent_kneecapping( MR_SUNSHINE_NAME, false )

   thread_kill( Mr_Sunshine_voodoo_attack_loop_thread_handle )

   mission_end_success( MISSION_NAME, CT_OUTRO, { POST_CT_WARP_POINTS[LOCAL_PLAYER], POST_CT_WARP_POINTS[REMOTE_PLAYER] } )
end

function ss09_mr_sunshine_voodoo_attack_loop()
   -- Mr. Sunshine does a voodoo attack every set number of seconds
   while( character_is_dead( MR_SUNSHINE_NAME ) == false ) do
      if ( Mr_Sunshine_has_voodooed_once == false ) then
         Mr_Sunshine_has_voodooed_once = true
         mission_debug( "mr sunshine first delay before next attack" )
         delay( MR_SUNSHINE_FIRST_VOODOO_ATTACK_DELAY )
      else
        mission_debug( "mr sunshine delay before next attack" )
         delay( MR_SUNSHINE_VOODOO_ATTACK_INTERVAL_SECONDS )
      end

      mission_debug( "mr sunshine doing attack!" )
      Mr_Sunshine_voodoo_attack_thread_handle = thread_new( "ss09_mr_sunshine_do_voodoo_attack" )
      while ( thread_check_done( Mr_Sunshine_voodoo_attack_thread_handle ) == false ) do
         delay( 0 )
      end

      mission_debug( "mr sunshine did attack!" )
   end
end

function ss09_voodoo_doll_fall()
   -- Switch Mr. Sunshine into a different animation
   action_stop_custom( MR_SUNSHINE_NAME )
   -- Play the voodoo doll falling effect
   -- looping = false
   effect_play( VOODOO_DOLL_FALL, DOLL_FALL_START_LOCATION, false )
   -- Show the voodoo doll on the ground after the effect finishes
   group_show( VOODOO_DOLL_GROUP )
end

-- Function to track if Mr. Sunshine took damage when doing his
-- voodoo attack. If the damage was from an explosion, it knocks
-- his voodoo doll out of his hand.
--
function ss09_sunshine_took_damage_during_voodoo( character_name, attacker_name, damage_percent_remaining, was_explosion )
   if ( was_explosion ) then
      mission_debug( damage_percent_remaining.." percent life remaining." )
      ss09_sunshine_hand_hit( character_name )
   end
end

function ss09_sunshine_hand_hit( character_name )
   mission_debug( "You hit Mr. Sunshine's hand!", 10 )

   if ( Mr_Sunshine_voodoo_attack_thread_handle ~= INVALID_THREAD_HANDLE ) then
      ss09_abort_voodoo_attack()
      Player_shot_voodoo_doll = true

      voodoo_glow_stop( MR_SUNSHINE_NAME )
      effect_stop( Use_voodoo_glow_handle )
      Use_voodoo_glow_handle = -1
      for index, handle in pairs( Sparking_lights_effect_handles ) do
         effect_stop( handle )
         Sparking_lights_effect_handles[index] = -1
      end

      action_play_non_blocking( MR_SUNSHINE_NAME, VOODOO_DOLL_KNOCKED_AWAY_FLINCH, nil, nil, true )

      thread_kill( Mr_Sunshine_voodoo_attack_loop_thread_handle )
      Mr_Sunshine_voodoo_attack_loop_thread_handle = INVALID_THREAD_HANDLE

      -- Unbind the callback
      on_character_right_hand_hit( "", character_name )
      on_take_damage( "ss09_mr_sunshine_took_damage_while_running", MR_SUNSHINE_NAME )
      
      -- Have the Voodoo doll fall
      thread_new( "ss09_voodoo_doll_fall" )

      -- Make Mr. Sunshine vulnerable again
      ss09_stop_invincible_effects()
      if ( coop_is_active() == false ) then
		turn_vulnerable( MR_SUNSHINE_NAME )
      end
      character_prevent_flinching( MR_SUNSHINE_NAME, false )

      marker_remove_npc( MR_SUNSHINE_NAME, SYNC_ALL )
      marker_add_npc( MR_SUNSHINE_NAME, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL )

      set_ignore_ai_flag( MR_SUNSHINE_NAME, false )
      attack_closest_player( MR_SUNSHINE_NAME )

      Percent_damage_done_this_run = 0
      Mr_Sunshine_running_downstairs_thread_handle = thread_new( "ss09_mr_sunshine_run_downstairs" )

      repeat
         thread_yield()
      until ( Mr_Sunshine_finished_running  ) 

      on_take_damage( "", MR_SUNSHINE_NAME )

      crouch_stop( MR_SUNSHINE_NAME )
      -- Hide the voodoo doll
      group_hide( VOODOO_DOLL_GROUP )
      ss09_start_invincible_effects()
      marker_remove_npc( MR_SUNSHINE_NAME, SYNC_ALL )
      marker_add_npc( MR_SUNSHINE_NAME, MINIMAP_ICON_KILL, "", SYNC_ALL )
      turn_invulnerable( MR_SUNSHINE_NAME )

      -- Move back to the top platform
      -- retry on failure, move and fire
      npc_go_idle( MR_SUNSHINE_NAME )
      set_ignore_ai_flag( MR_SUNSHINE_NAME, true )
      mission_debug( "Mr. Sunshine told to run back up." )
      move_to_safe( MR_SUNSHINE_NAME, SUNSHINE_BACK_TO_TOP_PLATFORM_PATH, 2, true, false )
      mission_debug( "Mr. Sunshine run back up fell through." )
      set_ignore_ai_flag( MR_SUNSHINE_NAME, false )

      delay( POST_DOLL_RETRIEVAL_RESUME_VOODOO_ATTACK_DELAY_SECONDS )
      Mr_Sunshine_voodoo_attack_loop_thread_handle = thread_new( "ss09_mr_sunshine_voodoo_attack_loop" )
   end
end

function ss09_mr_sunshine_took_damage_while_running( attacked_object_name, attacker_name, percent_hp_remaining_after_attack )
   if ( coop_is_active() ) then
      local sunshine_max_hp = get_max_hit_points( MR_SUNSHINE_NAME )
      local percent_damage_before_hit = get_current_hit_points( MR_SUNSHINE_NAME ) / sunshine_max_hp

      -- The percent damage is updated to itself plus any percentage just done
      Percent_damage_done_this_run = Percent_damage_done_this_run + ( percent_damage_before_hit - percent_hp_remaining_after_attack )

      if ( Percent_damage_done_this_run >= .35 ) then
         -- Set the percent remaining up a bit so that it's capped at .33
         if ( Percent_damage_done_this_run > .35 ) then
            percent_hp_remaining_after_attack = percent_hp_remaining_after_attack + ( Percent_damage_done_this_run - .33 )
         end

         ss09_mr_sunshine_set_run_directly_downstairs()
--[[
         thread_kill( Mr_Sunshine_running_downstairs_thread_handle )
         Mr_Sunshine_running_downstairs_thread_handle = thread_new( "ss09_mr_sunshine_run_directly_downstairs" )]]
      end

      if ( attacker_name ~= nil ) then
         mission_debug( attacker_name.." attacked Sunshine." )
      end
      mission_debug( "Setting Sunshine HP to "..percent_hp_remaining_after_attack.." percent." )

      set_current_hit_points( MR_SUNSHINE_NAME, percent_hp_remaining_after_attack * sunshine_max_hp )
   end
end

function ss09_mr_sunshine_set_run_directly_downstairs()
   turn_invulnerable( MR_SUNSHINE_NAME )
   set_ignore_ai_flag( MR_SUNSHINE_NAME, true )
   on_take_damage( "", MR_SUNSHINE_NAME )
   marker_remove_npc( MR_SUNSHINE_NAME, SYNC_ALL )
   character_prevent_flinching( MR_SUNSHINE_NAME, true )
   Mr_Sunshine_running_directly_downstairs = true
end

function ss09_mr_sunshine_run_downstairs()
   Mr_Sunshine_finished_running = false
   Mr_Sunshine_running_directly_downstairs = false

   -- Do the run to the bottom thingy - stopping along the way
   for index, path in pairs( SUNSHINE_TO_DOLL_PATHS ) do
      -- retry on failure, move and fire
      mission_debug( MR_SUNSHINE_NAME.." pathing along "..path..".", 10 )
      npc_go_idle( MR_SUNSHINE_NAME )
      move_to_safe( MR_SUNSHINE_NAME, path, 2, true, true )
      if ( Mr_Sunshine_running_directly_downstairs == false ) then
         local cover_delay = rand_float( MR_SUNSHINE_MIN_COVER_DELAY_SECONDS,
                                         MR_SUNSHINE_MAX_COVER_DELAY_SECONDS )
         attack_closest_player( MR_SUNSHINE_NAME )
         mission_debug( "cover delay = "..cover_delay )
         delay( cover_delay )
      end
   end

   crouch_start( MR_SUNSHINE_NAME )
   character_prevent_flinching( MR_SUNSHINE_NAME, true )
   delay( MR_SUNSHINE_PICK_UP_DOLL_SECONDS )

   Mr_Sunshine_finished_running = true
end

function ss09_start_sparking_lights()
   local sparking_effect_handles = {}

   for index, light_location in pairs( SPARKING_LIGHTS_LOCATIONS ) do
      local random_effect_index = rand_int( 1, sizeof_table( SPARKING_LIGHT_EFFECTS ) )
      local sparking_effect = SPARKING_LIGHT_EFFECTS[random_effect_index]

      -- looping = true
      sparking_effect_handles[index] = effect_play( sparking_effect, light_location, true )
   end

   return sparking_effect_handles
end

function ss09_stop_sparking_lights( sparking_effect_handles )
   for index, handle in pairs( sparking_effect_handles ) do
      effect_stop( handle )
   end
end

function ss09_mr_sunshine_do_voodoo_attack()
   if ( ss09_mr_sunshine_not_doing_voodoo() ) then
      set_ignore_ai_flag( MR_SUNSHINE_NAME, true )
      --marker_add_navpoint( USE_VOODOO_LOCATION, "", INGAME_EFFECT_LOCATION, SYNC_ALL )

      inv_item_equip( SUNSHINE_RANGED_WEAPON, MR_SUNSHINE_NAME )

      -- Have him run over to the navpoint
      Mr_Sunshine_approaching_voodoo_location = true
      move_to( MR_SUNSHINE_NAME, USE_VOODOO_ORIENT, 2, true, false )
      move_to( MR_SUNSHINE_NAME, USE_VOODOO_LOCATION, 2, true, false )

      -- turn to target's orientation = true
      turn_to( MR_SUNSHINE_NAME, USE_VOODOO_DIRECTION, true )
      delay( 0.5 )

      --action_play( MR_SUNSHINE_NAME, STAB_VOODOO_DOLL, nil, nil, .75, true )
      if ( Player_shot_voodoo_doll == false ) then
         -- Only have an objective to shoot the doll given once
         if ( Shoot_objective_given == false ) then
            mission_help_table( HT_SHOOT_SUNSHINES_DOLL )
            Shoot_objective_given = true
         -- Nag the player afterward so there's not a bunch of objectives
         else
            mission_help_table_nag( HT_SHOOT_SUNSHINES_DOLL )
         end
      end

      -- looping = true
      Use_voodoo_glow_handle = effect_play( USE_VOODOO_EFFECT, USE_VOODOO_LOCATION, true )
      Sparking_lights_effect_handles = ss09_start_sparking_lights()

      -- Play the animation ( do the attack )
      action_play_non_blocking(MR_SUNSHINE_NAME, STAB_VOODOO_DOLL, nil, nil, true )
      audio_play( SUNSHINE_USE_VOODOO_DOLL_LINES, "voice", false )

      -- Don't let the player disable the voodoo attack until the animation has played for a bit
      delay( BEFORE_DISABLE_VOODOO_ATTACK_ALLOWED_SECONDS )
      Mr_Sunshine_approaching_voodoo_location = false
      Mr_Sunshine_doing_voodoo_attack = true
      -- Allow the animation to get to the "stab" part before hitting the player
      voodoo_glow_start( MR_SUNSHINE_NAME )
      on_character_right_hand_hit( "ss09_sunshine_hand_hit", MR_SUNSHINE_NAME )
      on_take_damage( "ss09_sunshine_took_damage_during_voodoo", MR_SUNSHINE_NAME )
      delay( VOODOO_ATTACK_BEFORE_EFFECT_SECONDS - BEFORE_DISABLE_VOODOO_ATTACK_ALLOWED_SECONDS )
      voodoo_glow_stop( MR_SUNSHINE_NAME )
      on_character_right_hand_hit( "", MR_SUNSHINE_NAME )
      on_take_damage( "", MR_SUNSHINE_NAME )
      Mr_Sunshine_doing_voodoo_attack = false

      -- At this point, the thread should not be killed under any circumstances
      Mr_Sunshine_voodoo_attack_thread_handle = INVALID_THREAD_HANDLE

      set_ignore_ai_flag( MR_SUNSHINE_NAME, false )
      -- Ragdoll the player
      character_ragdoll( LOCAL_PLAYER, VOODOO_RAGDOLL_MS, VOODOO_RAGDOLL_PUSH_SPEED_MPS )
      if ( coop_is_active() ) then
         character_ragdoll( REMOTE_PLAYER, VOODOO_RAGDOLL_MS, VOODOO_RAGDOLL_PUSH_SPEED_MPS )
      end
      audio_play( "SFX_SOS_VOODOO_DOLL_STAB" )

      -- Stop the effect - it's done playing
      effect_stop( Use_voodoo_glow_handle )
      for index, handle in pairs( Sparking_lights_effect_handles ) do
         effect_stop( handle )
         Sparking_lights_effect_handles[index] = -1
      end

      --ss09_stop_sparking_lights( sparking_lights_effect_handles )

      -- Give Mr. Sunshine HP
      local sunshine_max_hit_points = get_max_hit_points( MR_SUNSHINE_NAME )
      local sunshine_hit_points_boost = sunshine_max_hit_points * SUNSHINE_RECOVER_PERCENT
      local sunshine_current_hit_points = get_current_hit_points( MR_SUNSHINE_NAME )

      local sunshine_new_hit_points = sunshine_current_hit_points + sunshine_hit_points_boost
      if ( coop_is_active() ) then
         sunshine_new_hit_points = sunshine_new_hit_points + sunshine_hit_points_boost
      end

      if ( sunshine_new_hit_points > sunshine_max_hit_points ) then
         sunshine_new_hit_points = sunshine_max_hit_points
      end
      set_current_hit_points( MR_SUNSHINE_NAME, sunshine_new_hit_points )

      -- Take away some of the player's HP
      ss09_do_voodoo_damage( LOCAL_PLAYER )
      if ( coop_is_active() ) then
         ss09_do_voodoo_damage( REMOTE_PLAYER )
      end

      --marker_remove_navpoint( USE_VOODOO_LOCATION, SYNC_ALL )

      -- Return Mr. Sunshine's weapon
      inv_item_equip( SUNSHINE_RANGED_WEAPON, MR_SUNSHINE_NAME )
   end
end

function ss09_do_voodoo_damage( player_name )
   local player_voodoo_damage = get_max_hit_points( player_name ) * VOODOO_DOLL_DAMAGE_PERCENT
   local player_cur_hit_points = get_current_hit_points( player_name )

   local player_new_hit_points = player_cur_hit_points - player_voodoo_damage
   if ( player_new_hit_points > 0 ) then
      set_current_hit_points( player_name, player_new_hit_points )
   else
      character_kill( player_name )
   end
end

function ss09_abort_voodoo_attack()
   Mr_Sunshine_doing_voodoo_attack = false
   thread_kill( Mr_Sunshine_voodoo_attack_thread_handle )
   audio_play_for_character( SUNSHINE_VOODOO_INTERRUPTED_LINES, MR_SUNSHINE_NAME, "voice", false, false )
   Mr_Sunshine_voodoo_attack_thread_handle = INVALID_THREAD_HANDLE
   set_ignore_ai_flag( MR_SUNSHINE_NAME, false )
   marker_remove_navpoint( USE_VOODOO_LOCATION, SYNC_ALL )
end


-- Returns true if Mr. Sunshine is in his voodoo attack state, false otherwise.
-- This includes both running up to do it and actually doing the attack animation.
--
function ss09_mr_sunshine_not_doing_voodoo()
   if ( Mr_Sunshine_approaching_voodoo_location == false and
        Mr_Sunshine_doing_voodoo_attack == false ) then
      return true
   end

   return false
end

function ss09_sunshine_defender_died()
   Mr_Sunshine_defender_count = Mr_Sunshine_defender_count - 1

   mission_debug( "defender died, "..Mr_Sunshine_defender_count.." remain" )
   if ( Mr_Sunshine_defender_count == MR_SUNSHINE_DEFENDERS_RESPAWN_THRESHOLD ) then
      release_to_world( MR_SUNSHINE_REINFORCEMENTS_GROUP )
      delay( REINFORCEMENTS_DELAY_SECONDS )
      group_create( MR_SUNSHINE_REINFORCEMENTS_GROUP )
      Mr_Sunshine_defender_count = sizeof_table( MR_SUNSHINE_REINFORCEMENTS )
      delay( 0 )
      for index, name in pairs( MR_SUNSHINE_REINFORCEMENTS ) do
         on_death( "ss09_sunshine_defender_died", name )
         thread_new( "ss09_sunshine_defender_deploy", name, MR_SUNSHINE_REINFORCEMENTS_GOALS[index] )
      end
   end
end

function ss09_sunshine_defender_deploy( name, goal )
   -- retry on failure = true, move and fire = true
   move_to_safe( name, goal, 2, true, true )
   npc_leash_to_nav( name, goal, 8.0 )

   attack_closest_player( name )
end

function ss09_cleanup()
   -- Cleanup mission here
   hud_set_fake_notoriety( ENEMY_GANG, false, 0 )
   notoriety_force_no_spawn( ENEMY_GANG, false )
   notoriety_set_min( ENEMY_GANG, 0 )

   trigger_enable( MR_SUNSHINES_PLATFORM_TRIGGER, false )

	mesh_mover_reset( SUNSHINE_DOOR )
   
   persona_override_group_stop( SAMEDI_PERSONAS, POT_SITUATIONS[POT_ATTACK] )
   ss09_stop_invincible_effects()

	if ( Controls_disabled ) then
		player_controls_enable( LOCAL_PLAYER )
		if ( coop_is_active() ) then
			player_controls_enable( REMOTE_PLAYER )
		end
	end
end

function ss09_success()
   -- Called when the mission has ended with success
end