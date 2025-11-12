-- bh02.lua
-- SR2 mission script
-- 3/28/07

-- Global constants
	-- Mission state constants

	-- End mission states

   -- Help text ( note that not all help text is here )
   HT_PRESS_TO_DETONATE_BOMB = "bh02_press_to_detonate_bomb"
   HT_SEE_TRUCK_TO_DETONATE = "bh02_see_truck_to_detonate"
   HT_SWITCH_TO_DETONATOR = "bh02_switch_to_detonator"

	-- Assorted constants --
		CURRENT_MISSION =			"bh02"
		ENEMY_GANG =				"Brotherhood"

		DROPOFF_DISTANCE =			15		-- Distance from the drop target where Donnie will get out
		DROPOFF_SPEED =				10		-- Maximum speed you can be going where Donnie will get out

      FIND_NEW_SEAT_LOCATION_TIME_SECONDS = 7
		BOMB_PLANT_TIME =			30		-- Length of time to plant a bomb
		PLANT_BOMB_MAX_DISTANCE =	2.5		-- Maximum distance from car center to keep planting bomb
		STATE_PLANT_BOMB =			"crouch plant bomb"		-- Bomb planting animation state

		DETONATOR_ITEM =			"Detonator"	-- Name of detonator inventory item
		ACTION_DETONATE =			"detonate"	-- Bomb detonation animation action
		DETONATION_DISTANCE =		30			-- Distance you must travel before the bombs detonate
		EXPLOSION_NAME =			"Car Bomb"	-- Name of the explosion to use for the bomb
		
		FINAL_DETONATION_DISTANCE =	50			-- Distance for broken detonator
		FINAL_EXPLOSION_NAME =		"Car Bomb Big"	-- Broken detonator explosion name

		BROKEN_DETONATOR_TIME_MS =		30000		-- Length of time before the broken detonator explodes

		DONNIE_SOLO_HP_MULTIPLIER =	5		-- Health multiplier in single-player
		DONNIE_WARNING_PERCENTAGE = 0.3		-- Percentage of damage before displaying the warning

		MINIMAP_ICON_EXPLODING =	"map_other_blip_human"

		NEXT_TARGET_ALERT_RADIUS = 25
      DRIVING_LINES_DELAY_MIN_SECONDS = 30
      DRIVING_LINES_DELAY_MAX_SECONDS = 45

      CLOSE_ENOUGH_TO_DONNIE_DIST_METERS = 5.0

      -- These are intended to be indexed by "IN_COOP." So the "false" values are
      -- the single player values and the "true" values are the coop values.
      FIRST_TARGET_MIN_NOTORIETIES = { [false] = 2, [true] = 2 }
      SECOND_TARGET_MIN_NOTORIETIES = { [false] = 2, [true] = 3 }
      THIRD_TARGET_MIN_NOTORIETIES = { [false] = 2, [true] = 3 }

      DETONATE_TRUCK_MESSAGES_VISIBLE_TIME_SECONDS = 3

	-- Navpoints --
		NAVPOINT_START =							"bh02_$player_start"
      NAVPOINT_START_REMOTE =					"bh02_$coop_player_start"

	-- Groups --
		GROUP_ALLIES =								"bh02_$allies"
		GROUP_BOMB_TARGETS =						"bh02_$bomb_targets"
		GROUP_GANG_SPAWN_1 =						"bh02_$gang_group_01"
		GROUP_GANG_SPAWN_2a =					"bh02_$gang_group_02a"
		GROUP_GANG_INTERMEDIATE =				"bh02_$group_gang_intermediate"
		GROUP_GANG_SPAWN_2b =					"bh02_$gang_group_02b"
		GROUP_GANG_SPAWN_3a =					"bh02_$gang_group_03a"
		GROUP_GANG_SPAWN_3b =					"bh02_$gang_group_03b"
		-- GROUP_GANG_ROADBLOCKS =				"bh02_$gang_group_roadblocks"

	-- Individual Objects --
		CHAR_DONNIE =								"bh02_$donnie"
		CHAR_GANG_SPAWN_1a =						"bh02_$gang_01a"
		CHAR_GANG_SPAWN_1b =						"bh02_$gang_01b"
		CHAR_GANG_SPAWN_1c =						"bh02_$gang_01c"

		VEHICLE_GANG_SPAWN_2 =					"bh02_$gang_car_02"	
		VEHICLE_GANG_SPAWN_INTERMEDIATE =	"bh02_$gang_car_intermediate"	
		VEHICLE_LIN_MOBILE =						"bh02_$lin_mobile"

		BOMB_TARGET_1 =							"bh02_$bomb_target_01"
		BOMB_TARGET_2a =							"bh02_$bomb_target_02a"
		BOMB_TARGET_2b =							"bh02_$bomb_target_02b"
		BOMB_TARGET_3 =							"bh02_$bomb_target_03"

      BOMB_TARGET_PLANT_LOCATIONS = { [BOMB_TARGET_1] = { "bh02_$bomb_plant_loc1_1", "bh02_$bomb_plant_loc1_2" },
                                      [BOMB_TARGET_2a] = { "bh02_$bomb_plant_loc2a_1", "bh02_$bomb_plant_loc2a_2" },
                                      [BOMB_TARGET_2b] = { "bh02_$bomb_plant_loc2b_1", "bh02_$bomb_plant_loc2b_2" },
                                      [BOMB_TARGET_3] = { "bh02_$bomb_plant_loc3_1", "bh02_$bomb_plant_loc3_2" } }

	-- Tables --
		TABLE_ALL_GROUPS =		{ GROUP_ALLIES, GROUP_BOMB_TARGETS, GROUP_GANG_SPAWN_1, GROUP_GANG_SPAWN_2a, GROUP_GANG_SPAWN_2b, GROUP_GANG_SPAWN_3a, GROUP_GANG_SPAWN_3b, GROUP_GANG_INTERMEDIATE, }
		TABLE_GANG_SPAWN_2b =		{ "bh02_$gang_02c", "bh02_$gang_02d", "bh02_$gang_02e" }
		TABLE_GANG_SPAWN_INTERMEDIATE =	{ "bh02_$gang_intermediate01", "bh02_$gang_intermediate02" }
		TABLE_GANG_SPAWN_3b =		{ "bh02_$gang_03c", "bh02_$gang_03d", "bh02_$gang_03e", "bh02_$gang_03f" }

	-- Cutscenes --
		CUTSCENE_IN =						"br02-01"
		CUTSCENE_OUT =						"br02-02"

	-- Voice --
		VOICE_INTRO =					{{"PLAYER_BR02_INTRO_L1", LOCAL_PLAYER, 1},
											 {"BR02_INTRO_L2", CHAR_DONNIE, 1},
											 {"PLAYER_BR02_INTRO_L3", LOCAL_PLAYER, 1}}
      -- Lines
      DONNIE_WHINING_LINES = { "DONNIE_BR02_WHINING_1", "DONNIE_BR02_WHINING_2", "DONNIE_BR02_WHINING_3", "DONNIE_BR02_WHINING_4", "DONNIE_BR02_WHINING_5" }
      NUM_WHINING_LINES = sizeof_table( DONNIE_WHINING_LINES )
      DONNIE_DRIVING_LINES = { "DONNIE_BR02_DRIVING_1", "DONNIE_BR02_DRIVING_2", "DONNIE_BR02_DRIVING_3", "DONNIE_BR02_DRIVING_4" }
      NUM_DRIVING_LINES = sizeof_table( DONNIE_DRIVING_LINES )

		DONNIE_BOMBSTART_LINES = { "DONNIE_BR02_BOMBSTART_1", "DONNIE_BR02_BOMBSTART_2", "DONNIE_BR02_BOMBSTART_3", "DONNIE_BR02_BOMBSTART_4", "DONNIE_BR02_BOMBSTART_5" }
      NUM_BOMBSTART_LINES = sizeof_table( DONNIE_BOMBSTART_LINES )
		DONNIE_BOMBFINISH_LINES = { "DONNIE_BR02_BOMBFINISH_1", "DONNIE_BR02_BOMBFINISH_2", "DONNIE_BR02_BOMBFINISH_3", "DONNIE_BR02_BOMBFINISH_4", "DONNIE_BR02_BOMBFINISH_5" }
		NUM_BOMBFINISH_LINES = sizeof_table( DONNIE_BOMBFINISH_LINES )

      -- Persona overrides
      DONNIE_WHINING_PERSONA_SITUATION = "custom line 1"

      DONNIE_PERSONA_OVERRIDES = { { "hostage - barters", "DONNIE_BR02_BARTER" },
                                   { "misc - respond to player taunt w/taunt", "DONNIE_BR02_TAUNT" },
                                   { "observe - praised by PC", "DONNIE_BR02_PRAISED" },
                                   { "observe - passenger when driver hits cars", "DONNIE_BR02_HITCAR" },
                                   { "observe - passenger when driver hits object", "DONNIE_BR02_HITOBJ" },
                                   { "observe - passenger when driver hits peds", "DONNIE_BR02_HITPED" },
                                   { "threat - alert (solo attack)", "DONNIE_BR02_ATTACK" },
                                   { "threat - alert (group attack)", "DONNIE_BR02_ATTACK" },
                                   { "threat - damage received (firearm)", "DONNIE_BR02_TAKEDAM" },
                                   { "threat - damage received (melee)", "DONNIE_BR02_TAKEDAM" }--[[,
                                   { DONNIE_WHINING_PERSONA_SITUATION, "DONNIE_BR02_WHINING" }]] }
      BH02_BROTHERHOOD_PERSONAS = {
                                    ["HM_Bro1"]	=	"HMBRO1",
                                    ["HM_Bro2"]	=	"HMBRO2",
                                    ["HM_Bro3"]	=	"HMBRO3",

                                    ["HF_Bro2"]	=	"HFBRO2",

                                    ["WM_Bro3"]	=	"WMBRO3",

                                    ["WF_Bro1"]	=	"WFBRO1",
                                    ["WF_Bro2"]	=	"WFBRO2",
                                 }
	-- Threads --
		THREAD_NEXT_TARGET =			-1
		THREAD_CHASE =					-1
		THREAD_DONNIE_ABANDONED =	-1
		TABLE_ALL_THREADS =			{THREAD_NEXT_TARGET, THREAD_CHASE, THREAD_DONNIE_ABANDONED}

	-- Roadblock Additions
	-- These are making the mission too hard at the third stop so I am commenting them out for now.  - BD
		GROUP_GANG_ROADBLOCKS =			"bh02_$gang_group_roadblocks"
		NAV_ROADBLOCK01 =			"bh02_$nav_roadblock01"
		NAV_ROADBLOCK02 = 			"bh02_$nav_roadblock02"
		NAV_ROADBLOCK03 = 			"bh02_$nav_roadblock03"
		VEHICLE_GANG_ROADBLOCK01 =		"bh02_$vehicle_roadblock01"
		VEHICLE_GANG_ROADBLOCK02 =		"bh02_$vehicle_roadblock02"
		VEHICLE_GANG_ROADBLOCK03 =		"bh02_$vehicle_roadblock03"
		TABLE_GANG_ROADBLOCK01 =		{ "bh02_$gang_roadblock01a", "bh02_$gang_roadblock01b" }
		TABLE_GANG_ROADBLOCK02 =		{ "bh02_$gang_roadblock02a", "bh02_$gang_roadblock02b" }
		TABLE_GANG_ROADBLOCK03 =		{ "bh02_$gang_roadblock03a", "bh02_$gang_roadblock03b" }

-- Donnie dialogue while planting bombs
	DONNIE_BOMB_DIALOGUE = {"bh02_bomb_planting_diag1", "bh02_bomb_planting_diag2", "bh02_bomb_planting_diag3", "bh02_bomb_planting_diag4", 
									"bh02_bomb_planting_diag5", "bh02_bomb_planting_diag6", "bh02_bomb_planting_diag7", "bh02_bomb_planting_diag8"}

-- Global Variables
	Current_bomb_target =			false
	Current_bomb_target_2nd =		false

	Mission_Successful =				false

	Current_target_seat =			1

	Num_targets_destroyed =			0
	Bomb_countdown_timer =			BOMB_PLANT_TIME
	Detonator_triggered =			true
	Explosion =				EXPLOSION_NAME
	Next_target =				false
	IN_COOP =					false
   Prev_weapon = ""
   Message_sent_for_this_damage = false
   Timer_thread_handles = { INVALID_THREAD_HANDLE, INVALID_THREAD_HANDLE, INVALID_THREAD_HANDLE }
   Targets_visible = false
   Detonator_timer_expired = false
   Last_seat_index = -1
   Donnie_canceled_by_not_being_watched = false

	Cur_bombstart_line = 0
	Cur_bombfinish_line = 0

   Cur_whining_line = 0

	LINS_CAR_HEALTH_MULTIPLIER = 1.5

-- Main mission function
function bh02_start(bh02_checkpoint, is_restart)
	set_mission_author("Kevin J. Price, Aaron Hanson, and Mark Gabby")

	if coop_is_active() then
		IN_COOP = true
	end

	local start_groups = {GROUP_ALLIES, GROUP_BOMB_TARGETS}

   mission_start_fade_out()
	if (not is_restart) then
		cutscene_play( CUTSCENE_IN, start_groups, {NAVPOINT_START, NAVPOINT_START_REMOTE}, false)	
	else
		for i,group in pairs(start_groups) do
			group_create_hidden(group, true)
		end

		-- Bring both players to the mission start location
		teleport_coop( NAVPOINT_START, NAVPOINT_START_REMOTE )

	end
	group_show(GROUP_ALLIES)

   -- Don't allow Brotherhood notoriety to go over 2 in this mission
	notoriety_set_max(ENEMY_GANG, 2)
	notoriety_set_max("Police", 2)

	-- Load Donnie and the bomb targets (that'd be a terrible name for a band)
	vehicle_infinite_mass(BOMB_TARGET_3, true)
	party_add( CHAR_DONNIE, LOCAL_PLAYER )
	set_max_hit_points(VEHICLE_LIN_MOBILE, get_max_hit_points(VEHICLE_LIN_MOBILE) * LINS_CAR_HEALTH_MULTIPLIER, true)

   -- In single player, we may need to make Donnie the first follower so that he's in the
   -- correct seat when teleported in
   if ( coop_is_active() == false ) then
      -- Find his current index
      local donnie_follower_index = party_get_follower_index( CHAR_DONNIE )
      -- If he's not the first follower, swap him and the first one
      if ( donnie_follower_index > 0 ) then
         party_swap_follower_indices( 0, donnie_follower_index )
	      delay( 1.0 )
      end
   end
	vehicle_enter_teleport(LOCAL_PLAYER, VEHICLE_LIN_MOBILE, 0)

	if ( coop_is_active() ) then
		vehicle_enter_teleport(REMOTE_PLAYER, VEHICLE_LIN_MOBILE, 2)
	end

	bh02_start_persona_overrides()

   mission_start_fade_in()

   bh02_run_mission()
end

function bh02_donnie_killed()
	mission_end_failure( CURRENT_MISSION, "bh02_donnie_died" )
end

function bh02_donnie_warning()
	mission_help_table_nag("bh02_donnie_health_warning")
end

function bh02_run_mission()
	-- Should do this in the editor now that I can
	character_set_cannot_be_grabbed(CHAR_DONNIE, true)
	
	
	-- Setup callback for Donnie's untimely death
	on_dismiss("failure_donnie_dismiss", CHAR_DONNIE)
	on_death( "bh02_donnie_killed", CHAR_DONNIE )
	on_damage( "bh02_donnie_warning", CHAR_DONNIE, DONNIE_WARNING_PERCENTAGE )
	-- By design, Donnie can't be revived
	character_set_unrevivable( CHAR_DONNIE, true )

	-- Donnie is a pansy
	npc_combat_enable(CHAR_DONNIE, false)

	-- Play intro dialogue
	thread_new("bh02_play_intro_conversation_then_start_driving_lines")

	-- Set up stuff
	if not coop_is_active() then
		set_max_hit_points(CHAR_DONNIE, DONNIE_SOLO_HP_MULTIPLIER * get_max_hit_points(CHAR_DONNIE))
	end
	objective_text(0, "bh02_trucks_destroyed", 0, 4)
	delay(3)

	mission_help_table("bh02_go_to_first_truck")

   bh02_setup_first_target()

	-- First target
   bh02_do_first_target()
	delay(5)

	-- Pre-emptively create the second target
   bh02_setup_second_target()

	detonate_at_distance(BOMB_TARGET_1)
	bh02_update_truck_destroyed_counter()

   bh02_cleanup_first_target()

   bh02_create_intermediate_gang_attack_group()

	-- Second targets
	mission_help_table("bh02_go_to_second_truck")

   bh02_do_second_target()
	delay(5)

	-- Preemptively create the third target
   bh02_setup_third_target()
	
	detonate_at_distance(BOMB_TARGET_2a, BOMB_TARGET_2b)
	bh02_update_truck_destroyed_counter()
	bh02_update_truck_destroyed_counter()

   bh02_cleanup_second_target()
	delay(3)

	-- Third target
	mission_help_table("bh02_go_to_third_truck")

   bh02_do_third_target()
	delay(5)

	minimap_icon_add_vehicle_radius(Current_bomb_target, MINIMAP_ICON_EXPLODING, FINAL_DETONATION_DISTANCE)
	
	mission_help_table("bh02_get_away")

   --[[
	-- BDillow Addition 8/01
	-- One last truck to hopefully get in the player's way.
	vehicle_enter_group_teleport(TABLE_GANG_ROADBLOCK03, VEHICLE_GANG_ROADBLOCK03)
	delay(1)
	vehicle_pathfind_to(VEHICLE_GANG_ROADBLOCK03, NAV_ROADBLOCK03, true, true)
   ]]

	while not_far_enough_away(Current_bomb_target, FINAL_DETONATION_DISTANCE) do
		thread_yield()
	end

	-- The chase is on!
	THREAD_CHASE = thread_new("bh02_chase_players")

	audio_play_for_character("DONNIE_BR02_BREAKDET", CHAR_DONNIE, "voice")
	hud_timer_set( 1, BROKEN_DETONATOR_TIME_MS, "bh02_detonator_timer_expires" )
	delay(5)
	mission_help_table("bh02_stay_away")

	repeat
		thread_yield()
	until ( Detonator_timer_expired )

	on_vehicle_destroyed("", BOMB_TARGET_3)

	if not vehicle_is_destroyed(BOMB_TARGET_3) then
		if THREAD_CHASE ~= -1 then
			thread_kill(THREAD_CHASE)
		end
		bomb_explode(BOMB_TARGET_3)
	end
	release_to_world(BOMB_TARGET_3)
	bh02_update_truck_destroyed_counter()

	mission_end_success( CURRENT_MISSION, CUTSCENE_OUT )
end

function bh02_detonator_timer_expires()
   Detonator_timer_expired = true
end

function bh02_setup_vehicle_target( target_vehicle_name )
	vehicle_show( target_vehicle_name )
	on_vehicle_destroyed("failure_vehicle_death", target_vehicle_name )
   vehicle_infinite_mass( target_vehicle_name, true )
   turn_invulnerable( target_vehicle_name )
   vehicle_prevent_explosion_fling( target_vehicle_name, true )
	set_unjackable_flag( target_vehicle_name, true )
   vehicle_set_untowable( target_vehicle_name, true )
end

function bh02_setup_first_target()
   bh02_setup_vehicle_target( BOMB_TARGET_1 )
end

function bh02_setup_second_target()
   bh02_setup_vehicle_target( BOMB_TARGET_2a )
   bh02_setup_vehicle_target( BOMB_TARGET_2b )

	group_create(GROUP_GANG_SPAWN_2a, true)
	Next_target = BOMB_TARGET_2a
	THREAD_NEXT_TARGET = thread_new("bh02_next_target_watch")
end

function bh02_setup_third_target()
   bh02_setup_vehicle_target( BOMB_TARGET_3 )

	group_create(GROUP_GANG_SPAWN_3a, true)
	Next_target = BOMB_TARGET_3
	THREAD_NEXT_TARGET = thread_new("bh02_next_target_watch")
end

function bh02_do_first_target()
	group_create(GROUP_GANG_SPAWN_1, true)
	Current_bomb_target = BOMB_TARGET_1
	bh02_get_near_target()
	follower_make_independent(CHAR_DONNIE, true)
	mission_help_table("bh02_guard_donnie")
	bh02_donnie_plant_bomb()
	bh02_wait_until_planted(BOMB_PLANT_TIME/2)
	
   notoriety_set_min( ENEMY_GANG, FIRST_TARGET_MIN_NOTORIETIES[IN_COOP] )

   audio_play_persona_line( CHAR_GANG_SPAWN_1a, POT_CUSTOM_1 )
	attack(CHAR_GANG_SPAWN_1a, CHAR_DONNIE, false)
   audio_play_persona_line( CHAR_GANG_SPAWN_1b, POT_CUSTOM_1 )
	attack(CHAR_GANG_SPAWN_1b, CHAR_DONNIE, false)
	audio_play_persona_line( CHAR_GANG_SPAWN_1c, POT_CUSTOM_1 )
	attack(CHAR_GANG_SPAWN_1c, CHAR_DONNIE, false)

	bh02_wait_until_planted()
	follower_make_independent(CHAR_DONNIE, false)
end

function bh02_do_second_target()
	Current_bomb_target = BOMB_TARGET_2a
	Current_bomb_target_2nd = BOMB_TARGET_2b
	Current_target_seat = 0
	bh02_get_near_target()
	group_create(GROUP_GANG_SPAWN_2b, true)
	for index, name in pairs( TABLE_GANG_SPAWN_2b ) do
		vehicle_enter_teleport( name, VEHICLE_GANG_SPAWN_2, index - 1, false )
	end
	follower_make_independent(CHAR_DONNIE, true)
	--mission_help_table("bh02_guard_donnie")
	bh02_donnie_plant_bomb()

	notoriety_set_min( ENEMY_GANG, SECOND_TARGET_MIN_NOTORIETIES[IN_COOP] )
	bh02_wait_until_planted()
	
	vehicle_chase(VEHICLE_GANG_SPAWN_2, CHAR_DONNIE)
	
	Current_bomb_target = BOMB_TARGET_2b
	Current_target_seat = 1
	bh02_donnie_plant_bomb()
	bh02_wait_until_planted()
	follower_make_independent(CHAR_DONNIE, false)
end

function bh02_do_third_target()
	Current_bomb_target	= BOMB_TARGET_3
	Current_bomb_target_2nd = false
	Current_target_seat = 0
	Explosion = FINAL_EXPLOSION_NAME
	bh02_get_near_target()
	follower_make_independent(CHAR_DONNIE, true)
	--mission_help_table("bh02_guard_donnie")
	bh02_donnie_plant_bomb()

   notoriety_set_min( ENEMY_GANG, THIRD_TARGET_MIN_NOTORIETIES[IN_COOP] )

	-- BDillow Addition 05/08/08
	-- These additions are proving to make the mission too hard, commenting them out for now

	-- delay(3)
	-- group_create(GROUP_GANG_ROADBLOCKS, true)
	-- vehicle_enter_group_teleport(TABLE_GANG_ROADBLOCK01, VEHICLE_GANG_ROADBLOCK01)
	-- delay(1)
	-- vehicle_pathfind_to(VEHICLE_GANG_ROADBLOCK01, NAV_ROADBLOCK01, true, true)
	-- delay(3)
	-- vehicle_enter_group_teleport(TABLE_GANG_ROADBLOCK02, VEHICLE_GANG_ROADBLOCK02)
	-- delay(1)
	-- vehicle_pathfind_to(VEHICLE_GANG_ROADBLOCK02, NAV_ROADBLOCK02, true, true)
	-- delay(1)

	bh02_wait_until_planted()
	follower_make_independent(CHAR_DONNIE, false)
end

function bh02_cleanup_first_target()
	release_to_world(BOMB_TARGET_1)
	release_to_world(GROUP_GANG_SPAWN_1)
	thread_kill(THREAD_NEXT_TARGET)
end

function bh02_cleanup_second_target()
	release_to_world(BOMB_TARGET_2a)
	release_to_world(BOMB_TARGET_2b)
	release_to_world(GROUP_GANG_SPAWN_2a)
	release_to_world(GROUP_GANG_INTERMEDIATE)
	release_to_world(GROUP_GANG_SPAWN_2b)
	thread_kill(THREAD_NEXT_TARGET)
end

function bh02_create_intermediate_gang_attack_group()
	delay(1)
	group_create(GROUP_GANG_INTERMEDIATE, true)
	for index, name in pairs( TABLE_GANG_SPAWN_INTERMEDIATE ) do
		vehicle_enter_teleport( name, VEHICLE_GANG_SPAWN_INTERMEDIATE, index - 1, false )
	end
	delay(1)
	vehicle_chase(VEHICLE_GANG_SPAWN_INTERMEDIATE, LOCAL_PLAYER)
	delay(1)
end

function bh02_start_persona_overrides()
	persona_override_group_start( BH02_BROTHERHOOD_PERSONAS, POT_SITUATIONS[POT_ATTACK], "BR02_ATTACK" )
	persona_override_group_start( BH02_BROTHERHOOD_PERSONAS, POT_SITUATIONS[POT_CUSTOM_1], "BR02_BOMBS" )
   for index, override in pairs ( DONNIE_PERSONA_OVERRIDES ) do
      persona_override_character_start(CHAR_DONNIE, override[1], override[2] )
   end
end

function bh02_stop_persona_overrides()
   if ( group_is_loaded( GROUP_ALLIES ) == true ) then
      persona_override_group_stop( BH02_BROTHERHOOD_PERSONAS, POT_SITUATIONS[POT_ATTACK] )
      persona_override_group_stop( BH02_BROTHERHOOD_PERSONAS, POT_SITUATIONS[POT_CUSTOM_1] )
      for index, override in pairs ( DONNIE_PERSONA_OVERRIDES ) do
         persona_override_character_stop(CHAR_DONNIE, override[1] )
      end
   end
end

function bh02_play_intro_conversation_then_start_driving_lines()
	delay(2)
	audio_play_conversation(VOICE_INTRO, NOT_CALL)

   thread_new( "bh02_donnie_say_driving_lines" )
end

function bh02_donnie_say_driving_lines()
   -- Say all four lines
   for line_count = 1, NUM_DRIVING_LINES do
      -- Keep trying until we've played this line
      local cur_line_said = false
      while ( cur_line_said == false ) do
         -- Wait a random amount of time
         local pre_line_delay = rand_float( DRIVING_LINES_DELAY_MIN_SECONDS,
                                            DRIVING_LINES_DELAY_MAX_SECONDS )

         delay ( pre_line_delay )
         if ( character_is_in_vehicle( CHAR_DONNIE ) ) then
            audio_play_for_character( DONNIE_DRIVING_LINES[line_count], CHAR_DONNIE, "voice", false, false )
            --audio_play_persona_line( CHAR_DONNIE, DONNIE_COMPLAIN_PERSONA_SITUATION )
            cur_line_said = true
         end
      end
   end
end

function bh02_update_truck_destroyed_counter()
	Num_targets_destroyed = Num_targets_destroyed + 1
	objective_text(0, "bh02_trucks_destroyed", Num_targets_destroyed, 4)
end

-- Wait until Donnie is sufficiently close to the bomb target before returning
function bh02_get_near_target()
	marker_add_vehicle(Current_bomb_target, MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
	if Current_bomb_target_2nd then
		marker_add_vehicle(Current_bomb_target_2nd, "", INGAME_EFFECT_VEHICLE_KILL)
	end
	mission_waypoint_add(Current_bomb_target)
	local reached_truck_message_displayed = false
	while ( get_vehicle_speed(CHAR_DONNIE) > DROPOFF_SPEED or
           get_dist_char_to_vehicle(CHAR_DONNIE, Current_bomb_target) > DROPOFF_DISTANCE ) do

		if ( ( Current_bomb_target == BOMB_TARGET_1) and
           ( not reached_truck_message_displayed) and
           ( get_dist_char_to_vehicle(CHAR_DONNIE, Current_bomb_target) < 80) ) then
			reached_truck_message_displayed = true
			
		end
		thread_yield()
	end

   mission_debug( "near target: "..Current_bomb_target )
end

-- Start donnie planting a bomb
function bh02_donnie_plant_bomb()
	marker_remove_vehicle(Current_bomb_target)
	if Current_bomb_target_2nd then
		marker_remove_vehicle(Current_bomb_target_2nd)
	end
	mission_waypoint_remove()
	Bomb_countdown_timer = BOMB_PLANT_TIME
	patrol("bh02_plant_bomb", CHAR_DONNIE)
end

function bh02_get_next_whining_line_index()
   Cur_whining_line = Cur_whining_line + 1

   if ( Cur_whining_line > NUM_WHINING_LINES ) then
      Cur_whining_line = 1
   end

   return Cur_whining_line
end

function bh02_get_next_bombstart_line_index()
	Cur_bombstart_line = Cur_bombstart_line + 1

   if ( Cur_bombstart_line > NUM_BOMBSTART_LINES ) then
      Cur_bombstart_line = 1
   end

	return Cur_bombstart_line
end

function bh02_get_next_bombfinish_line_index()
	Cur_bombfinish_line = Cur_bombfinish_line + 1

   if ( Cur_bombfinish_line > NUM_BOMBFINISH_LINES ) then
      Cur_bombfinish_line = 1
   end

	return Cur_bombfinish_line
end



function bh02_force_facing()
	while ( 1 ) do
		turn_to( CHAR_DONNIE, Current_bomb_target )
		delay( 3.0 )
	end
end

-- Actual bomb planting patrol function
function bh02_plant_bomb(donnie)
	vehicle_exit(donnie)

	if coop_is_active() then
		mission_help_table("bh02_target_donnie")
	end

	local crouching = false

	on_vehicle_destroyed("failure_vehicle_donnie_death", Current_bomb_target)
	--coop_scorebox_show()

	THREAD_DONNIE_ABANDONED = thread_new("bh02_donnie_abandoned_watch")

	persona_override_group_stop(BH02_BROTHERHOOD_PERSONAS, POT_SITUATIONS[POT_ATTACK])
	persona_override_group_start(BH02_BROTHERHOOD_PERSONAS, POT_SITUATIONS[POT_ATTACK], "BR02_BOMBS")

	local bomb_planting_audio

	local diag1_shown = false
	local diag2_shown = false

	local force_facing_thread_handle = thread_new( "bh02_force_facing" )
	local line_index = bh02_get_next_bombstart_line_index()
	audio_play_for_character( DONNIE_BOMBSTART_LINES[line_index], donnie, "voice", false, true)

	while Bomb_countdown_timer > 0  do
		thread_yield()

      if ((not diag1_shown) and (Bomb_countdown_timer < 25)) then
         diag1_shown = true
         local next_line_index = bh02_get_next_whining_line_index()
         audio_play_for_character( DONNIE_WHINING_LINES[next_line_index], CHAR_DONNIE, "voice", false, false )
         --audio_play_persona_line( CHAR_DONNIE, DONNIE_WHINING_PERSONA_SITUATION )
      elseif ((not diag2_shown) and (Bomb_countdown_timer < 12)) then
         diag2_shown = true
         local next_line_index = bh02_get_next_whining_line_index()
         audio_play_for_character( DONNIE_WHINING_LINES[next_line_index], CHAR_DONNIE, "voice", false, false )
         --audio_play_persona_line( CHAR_DONNIE, DONNIE_WHINING_PERSONA_SITUATION )
      end

      if ( bh02_donnie_close_enough( donnie ) == false or
           not check_animation_state(donnie, STATE_PLANT_BOMB) ) then

			while ( crouch_is_crouching( donnie ) ) do
				clear_animation_state(donnie)
				crouch_stop( donnie )

				thread_yield()
			end

         --move_to( donnie, BOMB_TARGET_PLANT_LOCATIONS[Current_bomb_target][1], 3, true, false )
         --move_to( donnie, BOMB_TARGET_PLANT_LOCATIONS[Current_bomb_target][2], 1, true, false )
         bh02_donnie_get_to_bomb_plant_location( donnie, Current_bomb_target )
         set_animation_state(donnie, STATE_PLANT_BOMB)
         bomb_planting_audio = audio_play_for_navpoint("SFX_DON_BOMBPLANTING", Current_bomb_target, "foley")
      else
         if not crouch_is_crouching(donnie) then
            crouch_start(donnie)
            delay(1)
         end

         -- If we're in singleplayer, fallthrough. In coop, a player must be near Donnie for him to plant the
         -- bomb.
         if ( ( coop_is_active() == false ) or bh02_either_player_near_donnie() ) then
            if not check_animation_state(donnie, STATE_PLANT_BOMB) then
               set_animation_state(donnie, STATE_PLANT_BOMB)
            end
            Bomb_countdown_timer = Bomb_countdown_timer - get_frame_time()
         else
            Donnie_canceled_by_not_being_watched = true
            if check_animation_state(donnie, STATE_PLANT_BOMB) then
               clear_animation_state(donnie)
            end

            -- Don't continue until a player returns to being nearby
            if ( coop_is_active() ) then
               while ( bh02_either_player_near_donnie() == false ) do
                  thread_yield()
               end
            end
         end
      end
	end
   mission_debug( "fell out of bomb planting loop", 15 )

	audio_stop(bomb_planting_audio)
	audio_play_for_navpoint("SFX_DON_BOMBPLANTED", Current_bomb_target, "foley")
	local line_index = bh02_get_next_bombfinish_line_index()
	audio_play_for_character( DONNIE_BOMBFINISH_LINES[line_index], donnie, "voice")
	clear_animation_state(donnie)
	if crouch_is_crouching(donnie) then
		crouch_stop(donnie)
	end		
	thread_kill( force_facing_thread_handle )

	persona_override_group_stop(BH02_BROTHERHOOD_PERSONAS, POT_SITUATIONS[POT_ATTACK])
	persona_override_group_start(BH02_BROTHERHOOD_PERSONAS, POT_SITUATIONS[POT_ATTACK], "BR02_ATTACK")

	--coop_scorebox_hide()
	--on_vehicle_destroyed("bomb_explode", Current_bomb_target)
	on_vehicle_destroyed("failure_vehicle_death", Current_bomb_target)

	if THREAD_DONNIE_ABANDONED ~= -1 then
      hud_timer_stop(2)
      marker_remove_npc(CHAR_DONNIE, SYNC_ALL)
		thread_kill(THREAD_DONNIE_ABANDONED)
	end
end

function bh02_donnie_move_to_door( donnie, target_seat )
	while ( crouch_is_crouching( donnie ) ) do
		clear_animation_state(donnie)
		crouch_stop( donnie )

		thread_yield()
	end

   move_to_vehicle_entry_point(donnie, Current_bomb_target, target_seat, 2 )
end

function bh02_donnie_get_to_bomb_plant_location( donnie, Current_bomb_target )
   local LEFT = 0
   local RIGHT = 1
   local target_half = LEFT

   local move_to_door_thread_handle = INVALID_THREAD_HANDLE
   local seat_to_move_to = -1

   repeat
      if ( move_to_door_thread_handle ~= INVALID_THREAD_HANDLE ) then
         thread_kill( move_to_door_thread_handle )
         move_to_door_thread_handle = INVALID_THREAD_HANDLE
      end

      -- Choose a half of the vehicle to try to move to ( switch between them )
      if ( target_half == RIGHT ) then
         target_half = LEFT
      else
         target_half = RIGHT
      end

      seat_to_move_to = rand_int( 0, 1 )

      -- Choose a door on this half
      if ( target_half == LEFT ) then
         if ( seat_to_move_to == 1 ) then
            seat_to_move_to = 2
         end
      else -- target_half == RIGHT
         if ( seat_to_move_to == 0 ) then
            seat_to_move_to = 1
         else
            seat_to_move_to = 3
         end
      end

      -- Don't switch around seats if the reason Donnie's re-doing this is because he wasn't watched.
      -- This way he doesn't run around the car constantly.
      if ( Donnie_canceled_by_not_being_watched ) then
         seat_to_move_to = Last_seat_index
         Donnie_canceled_by_not_being_watched = false
      end

      -- Try to move to it
      mission_debug( "moving donnie to half "..target_half.." seat "..seat_to_move_to..".", 15 )
      move_to_door_thread_handle = thread_new( "bh02_donnie_move_to_door", donnie, seat_to_move_to )
      -- If, after some amount of time, we're not done moving there, try the whole thing again
      for i = 1, FIND_NEW_SEAT_LOCATION_TIME_SECONDS do
         delay( 1 )
         if ( thread_check_done( move_to_door_thread_handle ) == true and bh02_donnie_close_enough( donnie ) ) then
            break
         end
      end
   until ( thread_check_done( move_to_door_thread_handle ) == true and bh02_donnie_close_enough( donnie ) )

   -- If we succeed, then crouch and start the hacking
   crouch_start(donnie)
   delay(1)

   Last_seat_index = seat_to_move_to
end

function bh02_donnie_close_enough( donnie )
   return get_dist( donnie, Current_bomb_target ) < PLANT_BOMB_MAX_DISTANCE
end

function bh02_donnie_abandoned_watch()
	while 1 do
		thread_yield()
		if (get_dist_char_to_char(LOCAL_PLAYER, CHAR_DONNIE) > 50) then
			minimap_icon_add_npc_radius(CHAR_DONNIE, "map_other_blip_human", 50, "", SYNC_LOCAL)
			mission_help_table_nag("bh02_abandoning_donnie", SYNC_LOCAL)
			hud_timer_set(2, 30000, "failure_donnie_dismiss", true)
			while (get_dist_char_to_char(LOCAL_PLAYER, CHAR_DONNIE) > 50) do
				thread_yield()
			end
			hud_timer_stop(2)
			marker_remove_npc(CHAR_DONNIE, SYNC_ALL)
		end
	end
end

function bh02_either_player_near_donnie()
   local dist = get_dist_closest_player_to_object( CHAR_DONNIE )
   if ( dist <= CLOSE_ENOUGH_TO_DONNIE_DIST_METERS ) then
      return true
   end

   return false
end

function bh02_wait_until_planted(length)
	if length == nil then
		length = 0
	end

	while (Bomb_countdown_timer > length) do
		thread_yield()
	end	
end

function bh02_fix_detonator()
	Bomb_countdown_timer = DETONATOR_FIX_TIME
	while Bomb_countdown_timer > 0  do
		thread_yield()
		Bomb_countdown_timer = Bomb_countdown_timer - get_frame_time()
	end
end

function bh02_help_text_update_timer()
   delay( DETONATE_TRUCK_MESSAGES_VISIBLE_TIME_SECONDS + 1 )
end

function bh02_calculate_targets_visibility( target1, target2 )
   if ( navpoint_in_player_fov( target1 ) ) then
      if ( target2 ) then
         if ( navpoint_in_player_fov( target2 ) ) then
            return true
         end
      else
         return true
      end
   end

   return false
end
function bh02_detonator_equipped()
   if ( inv_item_get_equipped_item( LOCAL_PLAYER ) == DETONATOR_ITEM ) then
      return true
   end

   return false
end

function detonate_at_distance(target1, target2)
	minimap_icon_add_vehicle_radius(target1, MINIMAP_ICON_EXPLODING, DETONATION_DISTANCE)
	if target2 then
		minimap_icon_add_vehicle_radius(target2, MINIMAP_ICON_EXPLODING, DETONATION_DISTANCE)
	end
	mission_help_table("bh02_get_away")

	while not_far_enough_away(target1, DETONATION_DISTANCE) and (not target2 or not_far_enough_away(target2, DETONATION_DISTANCE)) do
		if target2 and vehicle_is_destroyed(target2) then
			target2 = nil
			minimap_icon_remove_vehicle(target2)
		end
		if vehicle_is_destroyed(target1) then
			minimap_icon_remove_vehicle(target1)
			if target2 then
				target1 = target2
				target2 = nil
			else
				return
			end
		end
		thread_yield()
	end

   waypoint_add( target1, SYNC_ALL )

   -- Can't assign nil to a global variable
   if ( inv_item_get_equipped_item( LOCAL_PLAYER ) ~= nil ) then
      Prev_weapon = inv_item_get_equipped_item( LOCAL_PLAYER )
   else
      Prev_weapon = ""
   end
   inv_weapon_add_temporary(LOCAL_PLAYER, DETONATOR_ITEM, 1, true )
	inv_item_equip(DETONATOR_ITEM, LOCAL_PLAYER)
	Detonator_triggered = false

	on_vehicle_destroyed("", target1)
	if target2 then
		on_vehicle_destroyed("", target2)
	end
	
	on_weapon_fired("trigger_detonator", LOCAL_PLAYER )
	
	--mission_help_table("bh02_detonate", "", "", SYNC_LOCAL)

	repeat
		thread_yield()
		if target2 and vehicle_is_destroyed(target2) then
			minimap_icon_remove_vehicle(target2)
			target2 = nil
			if not Detonator_triggered then
				failure_vehicle_death(target2)
			end
		end
		if vehicle_is_destroyed(target1) then
			minimap_icon_remove_vehicle(target1)
			if target2 then
				target1 = target2
				target2 = nil
			else
				target1 = nil
			end
			if not Detonator_triggered then
				failure_vehicle_death(target1)
			end
		end

      Targets_visible = bh02_calculate_targets_visibility( target1, target2 )

      -- Prompt the player for correct situations in which to detonate the truck
      -- If he doesn't have the truck in view, let him know
      -- 
      if ( Targets_visible == false ) then
         if ( thread_check_done( Timer_thread_handles[1] ) ) then
            mission_help_clear( SYNC_LOCAL )
            mission_help_table_nag( HT_SEE_TRUCK_TO_DETONATE, "", "", SYNC_LOCAL )
            Timer_thread_handles[1] = thread_new( "bh02_help_text_update_timer" )
         end
      elseif ( bh02_detonator_equipped() == false ) then
         if ( thread_check_done( Timer_thread_handles[2] ) ) then
            mission_help_clear( SYNC_LOCAL )
            mission_help_table_nag( HT_SWITCH_TO_DETONATOR, "", "", SYNC_LOCAL )
            Timer_thread_handles[2] = thread_new( "bh02_help_text_update_timer" )
         end
      else -- detonator equipped and truck in view
         if ( thread_check_done( Timer_thread_handles[3] ) ) then
            mission_help_clear( SYNC_LOCAL )
            mission_help_table_nag( HT_PRESS_TO_DETONATE_BOMB, "", "", SYNC_LOCAL )
            Timer_thread_handles[3] = thread_new( "bh02_help_text_update_timer" )
         end
      end

	until Detonator_triggered or target1 == nil
   
   waypoint_remove( SYNC_ALL )
   mission_help_clear( SYNC_LOCAL )

	if not Detonator_triggered then
		on_weapon_fired("", LOCAL_PLAYER)
		inv_weapon_remove_temporary(LOCAL_PLAYER, DETONATOR_ITEM)
      inv_item_equip( Prev_weapon, LOCAL_PLAYER )
		failure_vehicle_death(target1)
	end

	if target1 then
		minimap_icon_remove_vehicle(target1)
		bomb_explode(target1)
	end

	if target2 then
		minimap_icon_remove_vehicle(target2)
		bomb_explode(target2)
	end
end

function trigger_detonator( player, weapon )
	if weapon == DETONATOR_ITEM and not Detonator_triggered then
      -- Only allow the detonator to be set off if all current targets are visible
      if ( Targets_visible ) then
         Detonator_triggered = true
         audio_play_for_character( "SFX_DON_BOMB_DETONATE", player, "foley" )
         if ( character_is_in_vehicle( player ) == false ) then
            action_play(player, ACTION_DETONATE)
         end
         delay(0.5)
         inv_weapon_remove_temporary(LOCAL_PLAYER, DETONATOR_ITEM)
         inv_item_equip( Prev_weapon, LOCAL_PLAYER )
         on_weapon_fired("", player)
      else
         inv_weapon_remove_temporary(LOCAL_PLAYER, DETONATOR_ITEM)
         inv_weapon_add_temporary(LOCAL_PLAYER, DETONATOR_ITEM, 1, true )
	      inv_item_equip(DETONATOR_ITEM, LOCAL_PLAYER)
      end
	end
end

function not_far_enough_away(target, distance)
	return get_dist(CHAR_DONNIE, target) < distance or get_dist(LOCAL_PLAYER, target) < distance or ( coop_is_active() and get_dist(REMOTE_PLAYER, target) < distance)
end

function bh02_chase_players()
	group_create(GROUP_GANG_SPAWN_3b, true)
	set_unjackable_flag(BOMB_TARGET_3, false)
	vehicle_enter_group_teleport(TABLE_GANG_SPAWN_3b, Current_bomb_target)
	set_unjackable_flag(BOMB_TARGET_3, true)
	vehicle_suppress_npc_exit(Current_bomb_target, true)
	repeat 
		thread_yield()
		vehicle_chase(Current_bomb_target, get_closest_target(Current_bomb_target), false, true, true)
		delay(5)
	until vehicle_is_destroyed(Current_bomb_target)	
end

function get_closest_target(attacker)
	local dist_to_donnie = get_dist(attacker, CHAR_DONNIE)
	local dist_to_local_player = get_dist(attacker, LOCAL_PLAYER)
	local dist_to_remote_player = dist_to_local_player + 1000
	
	if coop_is_active() then
		dist_to_remote_player = get_dist(attacker, REMOTE_PLAYER)
	end
	
	if dist_to_donnie < dist_to_local_player and dist_to_donnie < dist_to_remote_player then
		return CHAR_DONNIE
	end
	
	if dist_to_local_player < dist_to_remote_player then
		return LOCAL_PLAYER
	end
	
	return REMOTE_PLAYER
end

function bomb_explode(vehicle)
   vehicle_infinite_mass( vehicle, false )
   vehicle_prevent_explosion_fling( vehicle, false )

   turn_vulnerable( vehicle )
	explosion_create(Explosion, vehicle, CHAR_DONNIE, false)
	if not vehicle_is_destroyed(vehicle) then
		vehicle_detonate(vehicle)
	end
end


function bh02_next_target_watch()
	repeat
		thread_yield()
		if get_dist(Next_target, LOCAL_PLAYER) < NEXT_TARGET_ALERT_RADIUS or (coop_is_active() and get_dist(Next_target, REMOTE_PLAYER) < NEXT_TARGET_ALERT_RADIUS ) then
			mission_help_table("bh02_detonate_last_target")
			delay(5)
		else
			delay(1)
		end
	until false
end

function failure_donnie_dismiss()
	delay(3)
	mission_end_failure(CURRENT_MISSION, "bh02_donnie_dismissed")
end

function failure_vehicle_death(vehicle)
	delay(3)
	mission_end_failure(CURRENT_MISSION, "bh02_vehicle_lost")
end

function failure_vehicle_donnie_death(vehicle)
	objective_text_clear(0)
	hud_timer_stop(1)
	character_kill(CHAR_DONNIE)
	bomb_explode(vehicle)
	delay(3)
	mission_end_failure(CURRENT_MISSION, "bh02_donnie_died")
end

function bh02_success()
	Mission_Successful = true
end

function bh02_cleanup()
	for i, thread in pairs(TABLE_ALL_THREADS) do
		thread_kill(thread)
	end

	if not Detonator_triggered then
		Detonator_triggered = false
		inv_weapon_remove_temporary(LOCAL_PLAYER, DETONATOR_ITEM)
		on_weapon_fired("", LOCAL_PLAYER)
      inv_item_equip( Prev_weapon, LOCAL_PLAYER )
	end
	
	notoriety_reset( ENEMY_GANG )
	notoriety_reset ( "Police" )

	objective_text_clear(0)

	hud_timer_stop(1)

	bh02_stop_persona_overrides()

	--party_dismiss(CHAR_DONNIE)
	object_destroy(CHAR_DONNIE)
	if (Mission_Successful == false) then
	object_destroy(VEHICLE_LIN_MOBILE)
	end	
	mission_waypoint_remove()
	
	if Current_bomb_target then
		marker_remove_vehicle(Current_bomb_target)
	end

	for i, group in pairs(TABLE_ALL_GROUPS) do
		release_to_world(group)
	end
end
