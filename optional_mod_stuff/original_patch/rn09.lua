-- rn09.lua
-- SR2 mission script
-- 3/28/07

-- DEBUG Variables
DEBUG_QUICK_KILLS							= false


-- Global constants (All caps == GLOBAL CONSTANT)
--[[	In general, shouldn't be modified in running code, except for maybe in a setup function )



]]

	--[[ *** MISSION PARAMETERS ***
	
		Whenever a script function looks up a wave parameter, a naming convention is used to select the appropriate value.
		Parameter values for single player missions can use any name, say "PARAMETER_1" for example. If you wish to have
		a different value for that parameter in coop, then prepend "COOP" to the parameter name. In this case, we get
		"COOP_PARAMETER_1".

		When a mission function needs to access "PARAMETER_1", it will search for the appropriate overloaded values first:

			*	Single player will use the value stored in "PARAMETER_1".
		
			*	Coop will use the value stored in "COOP_PARAMETER_1", if it exists. Otherwise it will use the
				default single player value stored in "PARAMETER_1".
	 ]]

	RN09_PARAMETERS	= 
		{	
			-- Parameters used in both stages
				-- Time at which the mission takes place
				["TIME_OF_DAY_HOUR"]							= 20;
				["TIME_OF_DAY_MINUTE"]						= 30;

				["RONIN_NOTORIETY"]							= 3;	-- Fixed notoriety level throughout the mission.
				["COOP_RONIN_NOTORIETY"]					= 3;	

				["RONIN_DESIRED_VEHICLE_COUNT"]			= 1;
				["COOP_RONIN_DESIRED_VEHICLE_COUNT"]	= 2;

				["SHOGO_HIT_POINTS"]							= 3500;
				["COOP_SHOGO_HIT_POINTS"]					= 6000;

			-- Stage 1: faux boss fight w/ Shogo

			-- Stage 2: bike chase

				-- When chasing Shogo, player(s) must stay close to him. A timer starts when they are out of range,
				-- The mission fails if the timer counts down to 0 before a player gets back in range.
				["SHOGO_FLEE_DIST"]							= 65; -- The distance threshold
				["SHOGO_FLEE_TIME_S"]						= 30; -- Timer duration

				-- There is an initial period during which Shogo drives slowly
				["SHOGO_FLEE_INIT_MPH_TIME_S"]			= 5; -- Duration of slow driving
				["SHOGO_FLEE_INIT_MPH"]						= 60; -- Slow driving speed
		
				-- After the initial period, Shogo's speed depends on player proximity.
				["SHOGO_FLEE_FAST_MPH"]						= 75; -- Speed while players are in range
				["SHOGO_FLEE_SLOW_MPH"]						= 55; -- Speed while players are out of range

				-- Vehicle density during the bike chase, 1.0 is the normal density for the area.
				["SHOGO_FLEE_TRAFFIC_DENSITY"]			= .50;
		}

	-- Coop mission?
	IN_COOP	= false

	-- GROUPS --
		GROUP_GAT						= "rn09_$Ggat"
		GROUP_SHOGO						= "rn09_$Gshogo"
		GROUP_BIKER_FRIENDS			= "rn09_$Gbiker_friends"
		GROUP_BIKER_FRIENDS_COOP	= "rn09_$Gbiker_friends_coop"
		GROUP_CUTSCENE_1				= "rn09_$CTE_Gshogo"
		GROUP_MOTORCYCLES_PLAYERS	= "rn09_$Gmotorcycles"
		GROUP_MOTORCYCLES_SHOGO		= "rn09_$Gmotorcycles_shogo"
		GROUP_CEMETARY_RONIN			= "rn09_$Gronin_cemetary"
		GROUP_CEMETARY_RONIN_COOP	= "rn09_$Gronin_cemetary_coop"
		GROUP_CUTSCENE_2				= "rn09_$GCTE2"
		GROUP_CHASE_COURTESY_CAR	= "rn09_$Gchase_courtesy_car"
	
	-- GROUP MEMBER TABLES -- 

		TABLE_BIKER_FRIENDS			= {	"rn09_$Cbiker_friends_00", "rn09_$Cbiker_friends_01", "rn09_$Cbiker_friends_02",
													"rn09_$Cbiker_friends_03", "rn09_$Cbiker_friends_04", "rn09_$Cbiker_friends_05"}

		TABLE_BIKER_FRIENDS_COOP	= {	"rn09_$Cbiker_friends_00 (0)", "rn09_$Cbiker_friends_00 (1)"}

		TABLE_CEMETARY_RONIN			= {	"rn09_$Cronin_cemetary_00", "rn09_$Cronin_cemetary_01", "rn09_$Cronin_cemetary_02",
													"rn09_$Cronin_cemetary_03", "rn09_$Cronin_cemetary_04", "rn09_$Cronin_cemetary_05",
													"rn09_$Cronin_cemetary_06", "rn09_$Cronin_cemetary_07", "rn09_$Cronin_cemetary_08",
													"rn09_$Cronin_cemetary_09", "rn09_$Cronin_cemetary_10", "rn09_$Cronin_cemetary_11",
													"rn09_$Cronin_cemetary_12", "rn09_$Cronin_cemetary_13", "rn09_$Cronin_cemetary_14",
													"rn09_$Cronin_cemetary_15", "rn09_$Cronin_cemetary_16"}

		TABLE_CEMETARY_RONIN_COOP	= {	"rn09_$Cronin_cemetary_coop_00", "rn09_$Cronin_cemetary_coop_01", 
													"rn09_$Cronin_cemetary_coop_02", "rn09_$Cronin_cemetary_coop_03"}

	-- TRIGGERS -- 
		TRIGGER_START_CHASE			= "rn09_$Tstart_chase"

		-- List of all triggers, makes cleaning up more convenient
		TABLE_ALL_TRIGGERS			= {	TRIGGER_START_CHASE}		

	-- VEHICLES --
		VEHICLE_SHOGO_MOTORCYCLE			= "rn09_$Vshogo_motorcycle"
		VEHICLE_LOCAL_PLAYER_MOTORCYCLE	= "rn09_$Vlocal_player"
		VEHICLE_REMOTE_PLAYER_MOTORCYCLE	= "rn09_$Vremote_player"


	-- CHARACTERS --
		CHARACTER_GAT				= "rn09_$Cgat"
		CHARACTER_SHOGO			= "rn09_$Cshogo"

	-- NAVPOINTS

		-- the start location for Player 1
		NAVPOINT_LOCAL_PLAYER_START		= "mission_start_sr2_city_$rn09"

		-- the start location for Player 2		
		NAVPOINT_REMOTE_PLAYER_START		= "rn09_$Nremote_player_start"
		
		-- where Shogo heads after his health is halved in stage 1
		NAVPOINT_SHOGO_FLEE_TARGET			= "rn09_$Nshogo_flee_target"

	-- MOVERS
		MM_GARAGE_SIDE_DOOR						= "rn09_$MMgarage_side_door"

	-- CHECKPOINTS
		CHECKPOINT_START							= MISSION_START_CHECKPOINT -- defined in ug_lib.lua
		CHECKPOINT_GARAGE							= "rn08_checkpoint_garage" -- 

	-- localized helptext messages
		HELPTEXT_FAILURE_SHOGO_FLED			= "rn09_failure_shogo_fled"
		HELPTEXT_FAILURE_GAT_DIED				= "rn09_failure_gat_died"
		HELPTEXT_FAILURE_GAT_DISMISSED		= "rn09_failure_gat_dismissed"
		HELPTEXT_OBJECTIVE_CLEAN_CEMETARY	= "rn09_objective_clean_cemetary"
		HELPTEXT_PROMPT_CHASE_SHOGO			= "rn09_prompt_chase_shogo"
		HELPTEXT_PROMPT_FIND_SHOGO				= "rn09_prompt_find_shogo"
		HELPTEXT_PROMPT_CLEAN_CEMETARY		= "rn09_prompt_clean_cemetary"
		HELPTEXT_PROMPT_KILL_SHOGO				= "rn09_prompt_kill_shogo"
		HELPTEXT_PROMPT_WARN_DISTANCE			= "rn09_prompt_warn_distance"
		HELPTEXT_CHECKPOINT						= "rn09_checkpoint"

	-- helptext messages that need to be localized
		HELPTEXT_HUD_SHOGO_HEALTH				=	"rn09_hud_shogo_health"
	
-- Global Variables (First letter caps == Global Variable)

	Shogo_half_health					= false
	Enemy_set_cleared					= false
	Start_chase							= false
	Timing_escape						= false
	Shogo_use_init_speed				= true
	Shogo_in_flee_mode				= false
	Shogo_flee_speed					= 0

	Enemies_living						= 0
	Enemies_to_kill					= 0
	Enemy_set_objective_helptext	= ""
	Player_shogo_fleeing				= "unset" -- Player Shogo is fleeing from

	-- THREADS
	--Thread_dealer						= -1
	Thread_shogo_motorcycle_throttle		= -1
	Thread_clear_initial_speed_override	= -1
	Table_all_threads					= {	Thread_shogo_motorcycle_throttle, Thread_clear_initial_speed_override}


-- REQUIRED MISSION FUNCTIONS -------------------------------

-- Called when the mission starts
function rn09_start(rn09_checkpoint, is_restart)

	mission_start_fade_out(0.0)

	local starting_groups = {GROUP_SHOGO, GROUP_GAT, GROUP_BIKER_FRIENDS}
	if (coop_is_active()) then
		starting_groups = {GROUP_SHOGO, GROUP_GAT, GROUP_BIKER_FRIENDS, GROUP_BIKER_FRIENDS_COOP}
	end

	if (rn09_checkpoint == CHECKPOINT_START) then
		if (is_restart) then

			-- Teleport player(s) to starting location
			teleport_coop(NAVPOINT_LOCAL_PLAYER_START, NAVPOINT_REMOTE_PLAYER_START)

			-- Create groups
			for i,group in pairs(starting_groups) do
				group_create(group, true)
			end
		else
			-- Play the cutscene, then show the groups.
			cutscene_play("ro09-01", starting_groups, {NAVPOINT_LOCAL_PLAYER_START, NAVPOINT_REMOTE_PLAYER_START}, false)
			for i,group in pairs(starting_groups) do
				group_show(group)
			end
		end
	end

	rn09_initialize(rn09_checkpoint)

	if (rn09_checkpoint == CHECKPOINT_START) then
	
		--disable Chainsaws for Boss Battle
		chainsaw_disable()

		-- Player has to get Shogo down to half health.
		rn09_faux_boss_battle()

		-- Then he flees, player pursues but falls in an open grave.
		character_prevent_flinching(CHARACTER_SHOGO, true)
		rn09_cutscene_shogo_flees()
		character_prevent_flinching(CHARACTER_SHOGO, false)

		-- Cemetary is filled w/ Ronin who must be cleared out.
		rn09_clear_cemetary()


		-- Fade out and disable player controls
		fade_out(0.0,{0,0,0}, SYNC_ALL)
		player_controls_disable(LOCAL_PLAYER)
		if (IN_COOP) then
			player_controls_disable(REMOTE_PLAYER)
		end

		-- Disable Ronin spawning until the players have had time to leave the garage.
		notoriety_force_no_spawn("Ronin", true) 
		ambient_gang_spawn_enable(false)
		notoriety_set_desired_vehicle_count("Ronin",0)

		-- Shogo flees the area
		rn09_cutscene_shogo_exits_garage()

		-- Show the motorcycles and shogo
		group_show(GROUP_MOTORCYCLES_PLAYERS)
		group_show(GROUP_CHASE_COURTESY_CAR)
		group_show(GROUP_MOTORCYCLES_SHOGO)

		-- Setup for the bike pursuit
		rn09_setup_bike_pursuit()

		-- Give players a bit of time to enter bikes
		delay(1.0)

		-- Fade into the game
		fade_in(1.0, SYNC_ALL)
		fade_in_block()

		-- Reenable player controls
		player_controls_enable(LOCAL_PLAYER)
		if (IN_COOP) then
			player_controls_enable(REMOTE_PLAYER)
		end

		-- CHECKPOINT!
		mission_set_checkpoint(CHECKPOINT_GARAGE)
		rn09_checkpoint = CHECKPOINT_GARAGE
		
	end -- ends CHECKPOINT_START

	-- Start the bike pursuit
	rn09_start_bike_pursuit()

	-- Players pursue and kill shogo
	rn09_bike_pursuit()

end

function rn09_initialize(checkpoint)

	rn09_initialize_common()
	rn09_initialize_checkpoint(checkpoint)

	mission_start_fade_in()

end

function	rn09_initialize_common()

	-- Start trigger is hit...the activate button was hit
	set_mission_author("Phillip Alexander")

	-- Check for coop being active
	if (coop_is_active()) then
		IN_COOP	= true
	end
	
	-- Close and lock the garage's side door:
	door_close(MM_GARAGE_SIDE_DOOR)
	door_lock(MM_GARAGE_SIDE_DOOR,true)

	-- Set time of day to dusk3
	set_time_of_day(rn09_get_parameter_value("TIME_OF_DAY_HOUR"),rn09_get_parameter_value("TIME_OF_DAY_MINUTE"))

	-- Make it rain!
	set_weather(6,true)

	-- Set a permanent notoriety of 2 and reduce notoriety vehicle spawning
	notoriety_set("Ronin", rn09_get_parameter_value("RONIN_NOTORIETY")) 
	notoriety_set_min("Ronin", rn09_get_parameter_value("RONIN_NOTORIETY"))
	notoriety_set_max("Ronin", rn09_get_parameter_value("RONIN_NOTORIETY"))

	-- Force Police Notoriety to 0
	notoriety_set("Police", 0) 
	notoriety_set_min("Police", 0)
	notoriety_set_max("Police", 0)

end

function rn09_initialize_checkpoint(checkpoint)

	if (checkpoint == CHECKPOINT_START) then

		-- Create a bunch of hidden groups that we'll need later on
		group_create_hidden(GROUP_MOTORCYCLES_SHOGO, false)
		group_create_hidden(GROUP_MOTORCYCLES_PLAYERS, false)
		group_create_hidden(GROUP_CHASE_COURTESY_CAR, false)

		-- Give the players a second of invulnerability
		turn_invulnerable(LOCAL_PLAYER, false)
		if ( character_exists(CHARACTER_GAT) ) then
			turn_invulnerable(CHARACTER_GAT, false)
		end
		if (IN_COOP) then 
			turn_invulnerable(REMOTE_PLAYER, false)
		end

		-- No extra bikers show up for now.
		--notoriety_set_desired_vehicle_count("Ronin",0)
		--notoriety_force_no_spawn("Ronin", true) 
		ambient_gang_spawn_enable(false)

		-- Make Gat a follower, add his failure callbacks
		party_add(CHARACTER_GAT,LOCAL_PLAYER)
		on_death("rn09_gat_death_failure", CHARACTER_GAT)
		on_dismiss("rn09_gat_dismiss_failure", CHARACTER_GAT)

		-- Setup persona overrides for Gat and Pierce
		persona_override_character_start(CHARACTER_GAT, POT_SITUATIONS[POT_ATTACK],"GAT_RON09_ATTACK")
		persona_override_character_start(CHARACTER_GAT, POT_SITUATIONS[POT_TAKE_DAMAGE],"GAT_RON09_TAKEDAM")
		persona_override_character_start(CHARACTER_SHOGO, POT_SITUATIONS[POT_ATTACK],"RON09_SHOGO_ATTACK")
		persona_override_character_start(CHARACTER_SHOGO, POT_SITUATIONS[POT_TAKE_DAMAGE],"RON09_SHOGO_TAKEDAM")

		-- Handle Shogo taking damage in script so that he doesn't die.
		set_max_hit_points(CHARACTER_SHOGO, rn09_get_parameter_value("SHOGO_HIT_POINTS"))
		set_current_hit_points(CHARACTER_SHOGO, rn09_get_parameter_value("SHOGO_HIT_POINTS"))
		damage_indicator_on(0,CHARACTER_SHOGO,0.0,HELPTEXT_HUD_SHOGO_HEALTH)
		on_take_damage("rn09_handle_shogo_damaged",CHARACTER_SHOGO)
		turn_invulnerable(CHARACTER_SHOGO, false)

	end

	if (checkpoint == CHECKPOINT_GARAGE) then

		-- Disable Ronin spawning until the players have had time to leave the garage.
		notoriety_force_no_spawn("Ronin", true) 
		ambient_gang_spawn_enable(false)
		notoriety_set_desired_vehicle_count("Ronin",0)

		-- Create groups
		group_create(GROUP_MOTORCYCLES_SHOGO, true)
		group_create(GROUP_CHASE_COURTESY_CAR, true)

		rn09_setup_bike_pursuit(true)
	end

end

function rn09_faux_boss_battle()
	
	-- Tell Shogo to KILL!!!
	attack(CHARACTER_SHOGO, LOCAL_PLAYER)

	-- Tell the player to attack Shogo
	mission_help_table(HELPTEXT_PROMPT_KILL_SHOGO)
	marker_add_npc(CHARACTER_SHOGO, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL) 

	-- Give the players a second of invulnerability
	delay(1.0)
	turn_vulnerable(LOCAL_PLAYER)
	if ( character_exists(CHARACTER_GAT) ) then
		turn_vulnerable(CHARACTER_GAT)
	end
	if (IN_COOP) then 
		turn_vulnerable(REMOTE_PLAYER)
	end

	-- wait for Shogo to reach half health
	while (not Shogo_half_health) do
		thread_yield()
	end	

	-- Fade out and destroy the script-copy of Shogo. (The cutscene has its own copy of him.)
	fade_out(0.5, {0,0,0}, SYNC_ALL)
	fade_out_block()
	group_destroy(GROUP_SHOGO)

	-- Shogo isn't a target in the next stage: remove health indicator and marker and hide him
	--hud_bar_off(0,SYNC_ALL)
	damage_indicator_off(0)

	marker_remove_npc(CHARACTER_SHOGO,SYNC_ALL)
	on_take_damage("", CHARACTER_SHOGO)

end

function rn09_cutscene_shogo_flees()

	-- make sure player doesn't die during fade out
	turn_invulnerable(LOCAL_PLAYER, false)
	if (IN_COOP) then
		turn_invulnerable(REMOTE_PLAYER, false)
	end

	fade_out(0.0, {0,0,0}, SYNC_ALL)

	-- Get rid of Shogo's biker friends
	-- do this while faded out to eliminate popping.
	rn09_group_destroy_maybe_coop(GROUP_BIKER_FRIENDS,GROUP_BIKER_FRIENDS_COOP)	

	cutscene_play("IG_rn09_scene1")
	group_destroy(GROUP_CUTSCENE_1)

	rn09_group_create_maybe_coop(GROUP_CEMETARY_RONIN,GROUP_CEMETARY_RONIN_COOP, true)


	fade_in(1.0, SYNC_ALL)

	-- Make players vulnerable to damage normally again
	turn_vulnerable(LOCAL_PLAYER)
	if (IN_COOP) then
		turn_vulnerable(REMOTE_PLAYER)
	end

end

function rn09_clear_cemetary()

	-- Set notoriety spawn limit and fix notoriety level.
	notoriety_set_desired_vehicle_count("Ronin",rn09_get_parameter_value("RONIN_DESIRED_VEHICLE_COUNT"))

	rn09_process_enemy_set(TABLE_CEMETARY_RONIN, HELPTEXT_PROMPT_CLEAN_CEMETARY, HELPTEXT_OBJECTIVE_CLEAN_CEMETARY)

	--follower_make_independent(CHARACTER_GAT,true)
	-- Make Gat invulnerable so that he isn't killed
	turn_invulnerable(CHARACTER_GAT, false)
	party_dismiss_all()
	on_death("", CHARACTER_GAT)
	on_dismiss("", CHARACTER_GAT)

	-- Tell the player to find Shogo
	mission_help_table(HELPTEXT_PROMPT_FIND_SHOGO)

	-- Add a minimap icon and in-game icon near the caretaker's house
	marker_add_navpoint(NAVPOINT_SHOGO_FLEE_TARGET, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)

	-- Wait for the player to hit the chase start trigger
	trigger_enable(TRIGGER_START_CHASE,true)
	on_trigger("rn09_start_chase", TRIGGER_START_CHASE)
	while (not Start_chase) do
		thread_yield()
	end
	
	marker_remove_navpoint(NAVPOINT_SHOGO_FLEE_TARGET,SYNC_ALL)

end

function rn09_cutscene_shogo_exits_garage()

	cutscene_play("IG_rn09_scene2", nil, "", false)

	group_destroy(GROUP_CUTSCENE_2)
	
end

function rn09_setup_bike_pursuit(restart_from_checkpoint)

	-- Recreate Shogo, setup his persona
	group_create(GROUP_SHOGO, true)
	persona_override_character_start(CHARACTER_SHOGO, POT_SITUATIONS[POT_ATTACK],"RON09_SHOGO_ATTACK")
	persona_override_character_start(CHARACTER_SHOGO, POT_SITUATIONS[POT_TAKE_DAMAGE],"RON09_SHOGO_TAKEDAM")

	-- Setup callback for Shogo's death
	on_death("rn09_shogo_killed",CHARACTER_SHOGO)

	-- Put Shogo on his bike
	vehicle_enter_teleport(CHARACTER_SHOGO, VEHICLE_SHOGO_MOTORCYCLE, 0)

	-- Shogo already entered his bike, set him up for the chase
	vehicle_suppress_npc_exit(VEHICLE_SHOGO_MOTORCYCLE, true)
	vehicle_prevent_explosion_fling(VEHICLE_SHOGO_MOTORCYCLE,true)
	set_seatbelt_flag(CHARACTER_SHOGO,true)
	vehicle_never_flatten_tires(VEHICLE_SHOGO_MOTORCYCLE, true)
	vehicle_set_allow_ram_ped(VEHICLE_SHOGO_MOTORCYCLE,true)
	vehicle_set_crazy(VEHICLE_SHOGO_MOTORCYCLE,true)
	vehicle_disable_chase(VEHICLE_SHOGO_MOTORCYCLE,true)
	vehicle_suppress_flipping(VEHICLE_SHOGO_MOTORCYCLE, true)

	-- lower the traffic density
	set_traffic_density(rn09_get_parameter_value("SHOGO_FLEE_TRAFFIC_DENSITY"))

	if (not restart_from_checkpoint) then

		-- Make sure that the players aren't already on vehicles
		character_evacuate_from_all_vehicles(LOCAL_PLAYER)
		if (IN_COOP) then
			character_evacuate_from_all_vehicles(REMOTE_PLAYER)
		end
		delay(1.0)

		-- Put players on motorcycles
		vehicle_enter_teleport(LOCAL_PLAYER,VEHICLE_LOCAL_PLAYER_MOTORCYCLE,0)
		if (IN_COOP) then
			vehicle_enter_teleport(REMOTE_PLAYER,VEHICLE_REMOTE_PLAYER_MOTORCYCLE,0)
		end

		local function rn09_character_in_vehicle(char, veh)
			if (not character_is_in_vehicle(char, veh)) then
				return false
			end
			if (not vehicle_enter_check_done(char)) then
				return false
			end
			return true
		end

		while( not rn09_character_in_vehicle(LOCAL_PLAYER,VEHICLE_LOCAL_PLAYER_MOTORCYCLE)) do
			thread_yield()
		end
		if (IN_COOP) then
			while( not rn09_character_in_vehicle(REMOTE_PLAYER,VEHICLE_REMOTE_PLAYER_MOTORCYCLE)) do
				thread_yield()
			end
		end

	end

	-- Make sure that the garage doors are open
	mesh_mover_reset_to_action_end("rn09_$MMgarage_door_1", "start1")
	mesh_mover_reset_to_action_end("rn09_$MMgarage_door_2", "start1")

end

function rn09_start_bike_pursuit()

	Shogo_flee_speed = rn09_get_parameter_value("SHOGO_FLEE_INIT_MPH")
	vehicle_speed_override(VEHICLE_SHOGO_MOTORCYCLE, Shogo_flee_speed)

	Thread_clear_initial_speed_override = thread_new("rn09_clear_initial_speed_override")
	Thread_shogo_motorcycle_throttle	= thread_new("rn09_shogo_motorcycle_throttle")

	-- Start shogo pathfinding
	thread_new("rn09_shogo_turret")

	-- Delay so that Shogo can get up to speed and doors can finish opening:
	delay(2.0)

end

function rn09_shogo_turret()
	--vehicle_turret_base_to(VEHICLE_SHOGO_MOTORCYCLE, "rn09_$n016", "rn09_$n017", "rn09_$n018", "rn09_$n019", "rn09_$n020", false)
	vehicle_turret_base_to(VEHICLE_SHOGO_MOTORCYCLE, "rn09_$n017", "rn09_$n018", "rn09_$n019", "rn09_$n020", false)
	Shogo_in_flee_mode = true
	local dist
	dist, Player_shogo_fleeing = get_dist_closest_player_to_object(VEHICLE_SHOGO_MOTORCYCLE)
	vehicle_flee(VEHICLE_SHOGO_MOTORCYCLE,Player_shogo_fleeing)
end

function rn09_bike_pursuit()

	-- make the Shogo and the motorcycles vulnerable again
	turn_vulnerable(CHARACTER_SHOGO)
	
	-- Give the player prompts and indicators
	local shogo_hit_points = rn09_get_parameter_value("SHOGO_HIT_POINTS")
	local shogo_flee_dist = rn09_get_parameter_value("SHOGO_FLEE_DIST")
	mission_help_table(HELPTEXT_PROMPT_KILL_SHOGO)
	set_max_hit_points(CHARACTER_SHOGO, shogo_hit_points)
	set_current_hit_points(CHARACTER_SHOGO, 0.5*shogo_hit_points)
	damage_indicator_on(0,CHARACTER_SHOGO,0.0, HELPTEXT_HUD_SHOGO_HEALTH)
	distance_display_on(VEHICLE_SHOGO_MOTORCYCLE,0.0,shogo_flee_dist,0.0,shogo_flee_dist, SYNC_ALL)
	marker_add_npc(CHARACTER_SHOGO, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL) 

	-- Reenable gang/notoriety spawns, but give the players time to leave the garage.
	delay(2)
	notoriety_force_no_spawn("Ronin", false) 
	ambient_gang_spawn_enable(true)
	notoriety_set_desired_vehicle_count("Ronin",-1)

end

function rn09_clear_initial_speed_override()
	delay(rn09_get_parameter_value("SHOGO_FLEE_INIT_MPH_TIME_S"))
	if( not vehicle_is_destroyed(VEHICLE_SHOGO_MOTORCYCLE) ) then
		vehicle_speed_cancel(VEHICLE_SHOGO_MOTORCYCLE)
	end
	Shogo_use_init_speed = false
end

function rn09_shogo_motorcycle_throttle()

	local shogo_flee_dist = rn09_get_parameter_value("SHOGO_FLEE_DIST")

	while(true) do
		
		local dist, closest_player = get_dist_closest_player_to_object(VEHICLE_SHOGO_MOTORCYCLE)
		if (Shogo_in_flee_mode and (closest_player ~= Player_shogo_fleeing)) then
			Player_shogo_fleeing = closest_player
			vehicle_flee(VEHICLE_SHOGO_MOTORCYCLE,Player_shogo_fleeing)
		end
		if (dist < shogo_flee_dist) then
			if (not Shogo_use_init_speed) then
				Shogo_flee_speed = rn09_get_parameter_value("SHOGO_FLEE_FAST_MPH")
			end
			if(Timing_escape) then
				damage_indicator_on(0,CHARACTER_SHOGO,0.0, HELPTEXT_HUD_SHOGO_HEALTH)
				hud_timer_stop(0)
				Timing_escape = false

			end
		else
			if (not Shogo_use_init_speed) then
				Shogo_flee_speed = rn09_get_parameter_value("SHOGO_FLEE_SLOW_MPH")
			end
			if(not Timing_escape) then
				Timing_escape = true
				mission_help_table(HELPTEXT_PROMPT_WARN_DISTANCE, "", "", SYNC_LOCAL)
				hud_timer_set(0, 1000*rn09_get_parameter_value("SHOGO_FLEE_TIME_S"),"rn09_shogo_escaped_failure")
			end
		end

		vehicle_max_speed(VEHICLE_SHOGO_MOTORCYCLE, Shogo_flee_speed)

		thread_yield()
	end
end

function rn09_start_chase()
	marker_remove_navpoint(NAVPOINT_SHOGO_FLEE_TARGET, SYNC_ALL)
	trigger_enable(TRIGGER_START_CHASE,false)
	on_trigger("", TRIGGER_START_CHASE)
	Start_chase = true
end

-- Called when Shogo is damaged during the faux Shogo boss battle
-- damage_percent is Shogo's health percentage after the attack
function rn09_handle_shogo_damaged(shogo, attacker, damage_percent)

	if (damage_percent < 0.5) then
		Shogo_half_health = true
		damage_percent = 0.5
		turn_invulnerable(CHARACTER_SHOGO, false)
		on_take_damage("", CHARACTER_SHOGO)
	end

	set_current_hit_points(CHARACTER_SHOGO, damage_percent * get_max_hit_points(CHARACTER_SHOGO))
end

-- Shogo killed
function rn09_shogo_killed()
	-- Turn off the damage indicator
	damage_indicator_off(0)

	-- Players win
	rn09_complete()	
end

-- Cleanup mission
function rn09_cleanup()

	-- Make sure tha players aren't still invulnerable
	turn_vulnerable(LOCAL_PLAYER)
	if (IN_COOP) then 
		turn_vulnerable(REMOTE_PLAYER)
	end

	-- Players can use chainsaws once again.
	chainsaw_enable()

	-- garage side door doesn't need to be locked any more
	door_lock(MM_GARAGE_SIDE_DOOR,false)

	-- Reenable gang/notoriety spawns
	notoriety_force_no_spawn("Ronin", false) 
	ambient_gang_spawn_enable(true)
	notoriety_set_desired_vehicle_count("Ronin",-1)

	-- turn off damage, distance displays
	distance_display_off(SYNC_ALL)
	damage_indicator_off(0)

	-- make the motorcycles vulnerable again
	--rn09_set_motorcycles_invulnerable(false)

	-- Let the weather do as it likes
	set_weather(-1,false)

	-- Reset the notoriety
	notoriety_set_min("Ronin",0)
	notoriety_set_max("Ronin",5)
	notoriety_set("Ronin", 0) 
	
	--re-enable all weapons
	inv_weapon_enable_or_disable_all_slots(true, SYNC_ALL)

	-- Remove the callback for Gat's death
	on_death("", CHARACTER_GAT)
	on_dismiss("", CHARACTER_GAT)

	-- Stop the timer, this deregisters its callback.
	hud_timer_stop(0)

	-- get Gat to stop following me around
	if (npc_is_in_party(CHARACTER_GAT)) then
		npc_stop_following(CHARACTER_GAT)
	end

	-- Remove markers, callbacks from all enemies
	for i,enemy in pairs(TABLE_CEMETARY_RONIN) do
		marker_remove_npc(enemy)
		on_death("",enemy)
	end

	marker_remove_npc(CHARACTER_SHOGO)
	on_death("",CHARACTER_SHOGO)

	-- Kill all secondary threads
	for i, thread in pairs(Table_all_threads) do
		thread_kill(thread)
	end

	-- disable all triggers, remove callbacks
	for i, trigger in pairs(TABLE_ALL_TRIGGERS) do
		on_trigger("",trigger)
		trigger_enable(trigger,false)
	end

end

function rn09_success()
end

function rn09_set_motorcycles_invulnerable(flag)

	local explosion_multiplier = 1.0

	if (flag) then
		explosion_multiplier = 0.0
		turn_invulnerable(VEHICLE_SHOGO_MOTORCYCLE, false)
		turn_invulnerable(VEHICLE_LOCAL_PLAYER_MOTORCYCLE, false)
		turn_invulnerable(VEHICLE_REMOTE_PLAYER_MOTORCYCLE, false)
	end

	vehicle_prevent_explosion_fling(VEHICLE_SHOGO_MOTORCYCLE, flag) 
	vehicle_prevent_explosion_fling(VEHICLE_LOCAL_PLAYER_MOTORCYCLE, flag) 
	vehicle_prevent_explosion_fling(VEHICLE_REMOTE_PLAYER_MOTORCYCLE, flag) 

	vehicle_set_explosion_damage_multiplier(VEHICLE_SHOGO_MOTORCYCLE, explosion_multiplier) 
	vehicle_set_explosion_damage_multiplier(VEHICLE_LOCAL_PLAYER_MOTORCYCLE, explosion_multiplier) 
	vehicle_set_explosion_damage_multiplier(VEHICLE_REMOTE_PLAYER_MOTORCYCLE, explosion_multiplier) 
end

function rn09_complete()
	-- delay a little bit so that failure conditions have time to be checked
	--bink_play_movie("ro09-2.bik")

	-- End the mission with success
	mission_end_success("rn09", "ro09-02")
end

function rn09_group_create_maybe_coop(group_always,group_coop, blocking)
	group_create(group_always, blocking)
	if (IN_COOP) then
		group_create(group_coop, blocking)
	end
end

function rn09_group_destroy_maybe_coop(group_always, group_coop)
	group_destroy(group_always)
	if (IN_COOP) then
		group_destroy(group_coop)
	end
end

-- Get the value of the mission parameter.
--
-- parameter	Mission parameter whose value the function should return
--	i				If the parameter is a table, then i indexes the entry that should be returned
--
-- Returns mission paramater value.
function rn09_get_parameter_value(parameter, i)

	local return_val = nil

	-- Check for a coop value:
	if (IN_COOP) then
		if (i) then
			if (RN09_PARAMETERS["COOP_" .. parameter] ~= nil) then
				return_val = RN09_PARAMETERS["COOP_" .. parameter][i]
			end
		else
			return_val = RN09_PARAMETERS["COOP_" .. parameter]
		end
	end

	-- If no coop value was found, then return the standard value.
	if (return_val == nil) then
		if (i) then
			if (RN09_PARAMETERS[parameter] ~= nil) then
				return_val = RN09_PARAMETERS[parameter][i]
			end
		else
			return_val = RN09_PARAMETERS[parameter]
		end
	end

	return return_val
end

function rn09_process_enemy_set(enemy_table, mission_helptext, objective_helptext)
	
	Enemy_set_cleared = false

	-- Assign enemy callbacks
	for i, enemy in pairs(enemy_table) do
		on_death("rn09_enemy_killed", enemy)
		marker_add_npc(enemy, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL) 
		attack(enemy)
	end

	-- Setup kill tracking numbers
	Enemies_to_kill = sizeof_table(enemy_table)
	Enemies_living =  Enemies_to_kill

	-- Display the help text
	if(mission_helptext) then
		mission_help_table(mission_helptext)
	end

	-- Display the objective text
	if(objective_helptext) then
		Enemy_set_objective_helptext = objective_helptext
		objective_text(0, Enemy_set_objective_helptext, Enemies_to_kill - Enemies_living, Enemies_to_kill)
	end

	if(DEBUG_QUICK_KILLS) then
		delay(1.0)
		for i, enemy in pairs(enemy_table) do
			character_kill(enemy)
		end
	end
	
	while (not Enemy_set_cleared) do
		thread_yield()
	end

end

function rn09_enemy_killed(enemy)
	marker_remove_npc(enemy)
	on_death("",enemy)
	Enemies_living = Enemies_living - 1
	if (Enemies_living < 1) then
		Enemy_set_cleared = true
		objective_text_clear(0)
		Enemy_set_objective_helptext = ""
	else
		if (Enemy_set_objective_helptext ~= "") then
			objective_text(0, Enemy_set_objective_helptext, Enemies_to_kill - Enemies_living, Enemies_to_kill)
		end
	end
end

-- MISSION FAILURE FUNCTIONS --------------------------------

function rn09_shogo_escaped_failure()
	-- End the mission, fence died
	mission_end_failure("rn09", HELPTEXT_FAILURE_SHOGO_FLED)
end

function rn09_gat_death_failure()
	-- End the mission, fence died
	mission_end_failure("rn09", HELPTEXT_FAILURE_GAT_DIED)
end

function rn09_gat_dismiss_failure()
	-- End the mission, fence died
	mission_end_failure("rn09", HELPTEXT_FAILURE_GAT_DISMISSED)
end
