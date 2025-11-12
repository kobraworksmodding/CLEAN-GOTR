-- rn02.lua
-- SR2 mission script
-- 3/28/07

	-- KNOBS_TO_TURN --


			--[[ *** READ ME ***
			
				Whenever a script function looks up a wave parameter, a naming convention is used to select the appropriate value.
				Parameter values for single player missions can use any name, say "PARAMETER_1" for example. If you wish to have
				a different value for that parameter in coop, then prepend "COOP" to the parameter name. In this case, we get
				"COOP_PARAMETER_1".

				When a mission function needs to access "PARAMETER_1", it will search for the appropriate overloaded values first:

					*	Single player will use the value stored in "PARAMETER_1".
				
					*	Coop will use the value stored in "COOP_PARAMETER_1", if it exists. Otherwise it will use the
						default single player value stored in "PARAMETER_1".
			 ]]

			-- Mission parameters
			RN02_PARAMETERS	= 
				{						
						-- single-player values
							["BIKE_CHASE_SPEED"]				= 75,		-- Speed of Ronin chasing the players on bikes
							["CAR_CHASE_SPEED"]				= 75,		-- Speed of Ronin chasing the players in cars
							["BIKE_CHASE_HP"]					= 800,	-- HP of Ronin chasing the players on bikes
							["CAR_CHASE_HP"]					= 1600,	-- HP of Ronin chasing the players in cars
							["MAX_CHASE_VEHICLES"]			= 5,		-- Limits # vehicles chasing players at any time
							["CHASE_TRAFFIC_DENSITY"]		= .40,	-- Traffic desnity during the chase

						-- coop values
							["COOP_BIKE_CHASE_HP"]			= 1200,	-- HP of Ronin chasing the players on bikes
							["COOP_CAR_CHASE_HP"]			= 2400,	-- HP of Ronin chasing the players in cars
							["COOP_MAX_CHASE_VEHICLES"]	= 8,
				}

-- Global constants (All caps == GLOBAL CONSTANT)
--[[	In general, shouldn't be modified in running code, except for maybe in the setup function )

]]
	-- Coop mission?
	IN_COOP	= false

	-- GROUPS --
		GROUP_START_CAR			= "rn02_$Gstart_car"
		GROUP_START_CAR_COOP		= "rn02_$Gstart_car_coop"
		GROUP_PLAYER_CAR			= "rn02_$Gplayer_car"
		GROUP_CAR_DEALER			= "rn02_$Gcar_dealer"
		GROUP_CLOTHING_DEALER	= "rn02_$Gclothing_dealer"
		GROUP_WEAPON_DEALER		= "rn02_$Gweapon_dealer"
		GROUP_FENCE					= "rn02_$Gfence"
		GROUP_CHASE_1				= "rn02_$Gchase_1"
		GROUP_ROADBLOCK_1			= "rn02_$Groadblock_1"
		GROUP_TURRET				= "rn02_$Gturret"
	
	-- GROUP MEMBER TABLES -- 

	-- TRIGGERS -- 
		TRIGGER_CAR_DEALER			= "rn02_$Tcar_dealer"
		TRIGGER_CLOTHING_DEALER		= "rn02_$Tclothing_dealer"
		TRIGGER_WEAPON_DEALER		= "rn02_$Tweapon_dealer"
		TRIGGER_FENCE					= "rn02_$Tfence"
		TRIGGER_SAFE_HOUSE			= "rn02_$Tsafe_house"
		TRIGGER_CHASE_1				= "rn02_$t000"
		TRIGGER_ROADBLOCK_1			= "rn02_$t001"

		-- List of all triggers, makes cleaning up more convenient
		TABLE_ALL_TRIGGERS		= {	TRIGGER_CAR_DEALER, TRIGGER_CLOTHING_DEALER, TRIGGER_WEAPON_DEALER, TRIGGER_FENCE}		

	-- VEHICLES --
		VEHICLE_PLAYER_CAR			= "rn02_$Vplayer_car"
		VEHICLE_CLOTHING_DEALER		= "rn02_$Vclothing_dealer"
		VEHICLE_WEAPON_DEALER		= "rn02_$Vweapon_dealer"
		VEHICLE_TURRET					= "rn02_$Vturret"

	-- CHARACTERS --
		CHARACTER_CAR_DEALER			= "rn02_$Ccar_dealer"
		CHARACTER_CLOTHING_DEALER	= "rn02_$Cclothing_dealer"
		CHARACTER_WEAPON_DEALER		= "rn02_$Cweapon_dealer"
		CHARACTER_FENCE				= "rn02_$Cfence"


	-- CONVERSATIONS
	   INTRO_CONVERSATION =
		{
			{ "RON2_INTRO_L1", nil, 0.5 },
			{ "PLAYER_RON2_INTRO_L2", LOCAL_PLAYER, 0.5 },
			{ "RON2_INTRO_L3", nil, 0.5 },
			{ "PLAYER_RON2_INTRO_L4", LOCAL_PLAYER, 0.5 },
		}
		
		WARNING_CONVERSATION =
		{
			{ "RON2_WARNING_L1", nil, 0.5 },
			{ "PLAYER_RON2_WARNING_L2", LOCAL_PLAYER, 0.5 },
		}

		FENCE_PISSMOAN_CONVERSATION =
		{
			{ "RON2_FENCE_PISSMOAN_L1", CHARACTER_FENCE, 0.5 },
			{ "PLAYER_RON2_FENCE_PISSMOAN_L2", LOCAL_PLAYER, 0.5 },
		}

		FENCE_BITCHMOAN_CONVERSATION =
		{
			{ "RON2_FENCE_BITCHMOAN_L1", CHARACTER_FENCE, 0.5 },
			{ "PLAYER_RON2_FENCE_BITCHMOAN_L2", LOCAL_PLAYER, 0.5 },
		}

		FENCE_FINAL_CONVERSATION =
		{
			{ "FENCE_RON2_REINFORCEMENTS_01", CHARACTER_FENCE, 0.5},
		}

	-- CHECKPOINTS --
		CHECKPOINT_START				= MISSION_START_CHECKPOINT		-- defined in ug_lib.lua
		CHECKPOINT_WEAPON_DEALER	= "rn01_checkpoint_weapon_dealer"	-- Just before the player is sent to the arms dealer.
		CHECKPOINT_DRIVE				= "rn02_checkpoint_drive" -- The start of the turret sequence

	-- NAVPOINTS

		-- the start location for Player 1
		NAVPOINT_LOCAL_PLAYER_START		= "mission_start_sr2_city_$rn02"

		-- the start location for Player 2		
		NAVPOINT_REMOTE_PLAYER_START		= "rn02_$Nremote_player_start"
		
		NAVPOINT_SAFE_HOUSE_CAR_START		= "rn02_$n000"

		-- Navpoints used when staging players before teleporting them into the convertible
		NAVPOINT_LOCAL_CONVERTIBLE_STAGING		= "rn02_$n006"
		NAVPOINT_REMOTE_CONVERTIBLE_STAGING		= "rn02_$n007"
		
		NAVPOINT_LOCAL_SUCCESS				= "rn02_$Nlocal_player_finish" -- teleport nav for the end of the mission
		NAVPOINT_REMOTE_SUCCESS				= "rn02_$Nremote_player_finish" -- teleport nav for the end of the mission

	-- MOVERS

	-- localized helptext messages
		HELPTEXT_FAILURE_CONVERTIBLE		= "rn02_failure_convertible"
		HELPTEXT_FAILURE_DEALER_DIED		= "rn02_failure_dealer_died"
		HELPTEXT_FAILURE_FENCE				= "rn02_failure_fence"

		HELPTEXT_PROMPT_CAR_DEALERSHIP	= "rn02_prompt_car_dealership"
		HELPTEXT_PROMPT_CLOTHING_DEALER  = "rn02_prompt_clothing_dealer"
		HELPTEXT_PROMPT_FENCE				= "rn02_prompt_fence"
		HELPTEXT_PROMPT_PROTECT_FENCE		= "rn02_prompt_protect_fence"
		HELPTEXT_PROMPT_REENTER_CAR		= "rn02_prompt_reenter_car"
		HELPTEXT_PROMPT_WEAPON_DEALER		= "rn02_prompt_weapons_dealer"
		HELPTEXT_PROMPT_ENTER_CAR			= "rn02_prompt_enter_car"			-- Take the fence’s car.
		HELPTEXT_PROMPT_RONIN_ENFORCERS	= "rn02_prompt_ronin_enforcers"	-- Watch out for Ronin enforcers!"
		HELPTEXT_PROMPT_WRONG_CAR			= "rn02_prompt_wrong_car"
		HELPTEXT_PROMPT_REPAIR_CAR			= "rn02_prompt_repair_car"			-- Have the car repaired before visiting the fence.

	-- CHASE / AMBUSHES

		CHASES_AND_AMBUSHES = 
		{		
			["chase_1"]	=	
				{	["type"]			=	"chase",
					["group"]		=	GROUP_CHASE_1,
					["vehicles"]	=	{	["rn02_$v000"]		=	{	["passengers"]	= {	"rn02_$c000", "rn02_$c001"}, 
																				["type"]			= "car",
																				["jump"]			= true,
																			},
												["rn02_$v001"]		=	{	["passengers"]	= {	"rn02_$c002"}, 
																				["type"]			= "bike",
																				["jump"]			= true,
																			},
											},
					["on_foot"]		= {	},
					["trigger"]		= TRIGGER_CHASE_1,
				},

			["roadblock_1"]	=	
				{	["type"]			=	"roadblock",
					["group"]		=	GROUP_ROADBLOCK_1,
					["vehicles"]	=	{	["rn02_$v002"]	=	{	["passengers"]	= {	"rn02_$c008", "rn02_$c009"}, 
																			["type"]			= "car",
																		},
												["rn02_$v003"] =	{	["passengers"]	= {	"rn02_$c006", "rn02_$c007"}, 
																			["type"]			= "car",
																		},
												["rn02_$v004"] =	{	["passengers"]	= {	"rn02_$c005"}, 
																			["type"]			= "bike",
																		},
											},
					["on_foot"]		=	{	"rn02_$c003", "rn02_$c004"
											},
					["trigger"]		=	TRIGGER_ROADBLOCK_1,
				},
		}

	-- MISC CONSTANTS
		PLAYER_VEHICLE_HEALTH_MULTIPLIER = 2
		FENCE_PROTECT_TIME_S					= 180
		PROXIMITY_THRESHOLD					= 50.0
		FREE_WEAPON_GUN						= "AR50_launcher"
		FREE_WEAPON_THROWN					= "grenade"
		FREE_CLOTHING_NAME					= "parachute suit"
		FREE_CLOTHING_WEAR_OPTION			= "cmSui_uJumpSui01.cmeshx"
		FREE_CLOTHING_VARIANT_NAME			= "07 - Default"
		CONVERTIBLE_MAX_SPEED				= 65 -- Max speed of the fleeing convertible
		DEALER_INTERACT_DISTANCE			= 5 -- How close a player needs to be to the dealer for the interact message to play.
		PLAYER_SYNC								=
			{
				[LOCAL_PLAYER]					= SYNC_LOCAL,
				[REMOTE_PLAYER]				= SYNC_REMOTE,
			}
		OTHER_PLAYER							=
			{
				[LOCAL_PLAYER]					= REMOTE_PLAYER,
				[REMOTE_PLAYER]				= LOCAL_PLAYER,
			}
		MECHANIC_INFINITE_MASS_DIST		= 20 -- When player is < this distance from a mechanic, give the vehicle infinite mass.

-- Global Variables (First letter caps == Global Variable)
	Current_dealer_complete					= false
	Current_dealer_helptext					= ""
	Current_dealer								= ""
	Player_in_convertible					= 
		{
			[LOCAL_PLAYER] = false,
			[REMOTE_PLAYER] = false,
		}
	Clothing_dealer_player					= ""

	Min_notoriety_cell						= 2	-- Min notoriety set after cell call received
	Max_notoriety_cell						= 2	-- Max notoriety set after cell call received
	Min_notoriety_fence						= 2	-- Min notoriety set after fence picked up
	Max_notoriety_fence						= 2	-- Max notoriety set after fence picked up
	Chase_or_ambush_sent						= 0
	Vehicles_attacking						= 0
	Last_complication							= ""
	Weapons_received							= false

	-- THREADS
	Thread_dealer						= INVALID_THREAD_HANDLE
	Thread_prompt_tracking			= INVALID_THREAD_HANDLE
	Thread_delayed_release			= INVALID_THREAD_HANDLE
	Thread_vehicle_infinite_mass	= INVALID_THREAD_HANDLE
	Table_all_threads					= {	Thread_dealer,Thread_prompt_tracking,Thread_delayed_release}

-- REQUIRED MISSION FUNCTIONS -------------------------------

-- The main function/thread. Called when the mission starts.
function rn02_start(rn02_checkpoint, is_restart)

	mission_start_fade_out()

	if (rn02_checkpoint == CHECKPOINT_START) then

		local start_groups = {GROUP_START_CAR, GROUP_CAR_DEALER, GROUP_PLAYER_CAR}
		if (coop_is_active()) then
			start_groups = {GROUP_START_CAR, GROUP_START_CAR_COOP, GROUP_CAR_DEALER, GROUP_PLAYER_CAR}
		end

		if (is_restart) then

			-- Load starting groups
			for i,group in pairs(start_groups) do
				group_create(group, true)
			end

			-- Teleport players to the start location
			teleport_coop(NAVPOINT_LOCAL_PLAYER_START, NAVPOINT_REMOTE_PLAYER_START)

		else

			-- Play the intro cutscene
			cutscene_play("RO02-01", start_groups, {NAVPOINT_LOCAL_PLAYER_START, NAVPOINT_REMOTE_PLAYER_START}, false)
			for i,group in pairs(start_groups) do
				group_show(group)
			end

		end
	end

	rn02_initialize(rn02_checkpoint)

	if(rn02_checkpoint == CHECKPOINT_START) then

		-- Intro phone call.
		rn02_incoming_phone_call(INTRO_CONVERSATION)

		-- Now that the player(s) know that the dealer is critical, let the players damage him
		turn_vulnerable(CHARACTER_CAR_DEALER)
		turn_invulnerable(CHARACTER_CAR_DEALER, true)

		-- Tell the players to head to the car dealership
		mission_help_table(HELPTEXT_PROMPT_CAR_DEALERSHIP)

		-- Pickup the convertible from the car dealer
		rn02_car_dealer()

		-- CHECKPOINT!	
		while( not (Player_in_convertible[LOCAL_PLAYER] or Player_in_convertible[REMOTE_PLAYER]) ) do
			thread_yield()
		end
		mission_set_checkpoint(CHECKPOINT_WEAPON_DEALER)
		rn02_checkpoint = CHECKPOINT_WEAPON_DEALER

	end
	
	if (rn02_checkpoint == CHECKPOINT_WEAPON_DEALER) then

		-- Send players to the weapon dealer.
		rn02_weapon_dealer()

		-- Send players to the fence.
		rn02_fence()

		-- Fadeout and prepare for the turret portion of the mission
		rn02_transition_to_turret()
		rn02_checkpoint = CHECKPOINT_DRIVE
	end

	if (rn02_checkpoint == CHECKPOINT_DRIVE) then

		-- If the vehicle teleport failed to place the vehicle on the road, do normal pathfinding to 
		-- the path's start
		local dist = get_dist(VEHICLE_PLAYER_CAR, NAVPOINT_SAFE_HOUSE_CAR_START)
		if ( (dist > 5) and (dist < 50) ) then

			vehicle_ignore_repulsors(VEHICLE_PLAYER_CAR, true)

			-- Use navmesh pathfinding to get to the turret path's start
			vehicle_pathfind_to(VEHICLE_PLAYER_CAR,NAVPOINT_SAFE_HOUSE_CAR_START, true, true)

			vehicle_ignore_repulsors(VEHICLE_PLAYER_CAR, false)
		end


		-- Fence drives to his safe house while the players defend.
		rn02_safe_house()	

		if (	(not vehicle_is_destroyed(VEHICLE_PLAYER_CAR)) and 
				(get_dist(VEHICLE_PLAYER_CAR, TRIGGER_SAFE_HOUSE) < 80) ) then
			-- Players win!
			rn02_complete()
		else
			-- Something bad happened, fail the mission
			rn02_vehicle_destroyed_failure()
		end

	end

end

function rn02_transition_to_turret()

	-- Don't do anything while either player is dead
	while( character_is_dead(LOCAL_PLAYER) or (IN_COOP and character_is_dead(REMOTE_PLAYER)) ) do
		thread_yield()
	end

	-- Fade out and disable player controls
	fade_out(1.0,{0,0,0}, SYNC_ALL)
	fade_out_block()

	player_controls_disable(LOCAL_PLAYER)
	if (IN_COOP) then
		player_controls_disable(REMOTE_PLAYER)
	end

	-- Get rid of the old vehicle and create the new one
	rn02_swap_vehicles()

	-- CHECKPOINT! (ignore vehicle seating)
	delay(1.0)
	mission_set_checkpoint(CHECKPOINT_DRIVE, true)

	-- Place the correct people in the vehicle
	rn02_setup_convertible_occupants()

	-- Prepare the car for the drive
	rn02_setup_convertible_for_turret()

	-- Start the chases and ambushes
	rn02_setup_chases_and_ambushes()

	-- Fade into the game
	fade_in(1.0, SYNC_ALL)
	fade_in_block()

	-- Reenable player controls
	player_controls_enable(LOCAL_PLAYER)
	if (IN_COOP) then
		player_controls_enable(REMOTE_PLAYER)
	end

end

function rn02_swap_vehicles()

	-- Make sure that the players aren't in a vehicle
	character_evacuate_from_all_vehicles(LOCAL_PLAYER)
	if IN_COOP then
		character_evacuate_from_all_vehicles(REMOTE_PLAYER)
		while(character_is_in_vehicle(REMOTE_PLAYER)) do
			thread_yield()
		end
	end

	-- Destroy the old vehicle
	if (vehicle_exists(VEHICLE_PLAYER_CAR)) then
		vehicle_evacuate(VEHICLE_PLAYER_CAR)
	end
	group_hide(GROUP_PLAYER_CAR)
	group_destroy(GROUP_PLAYER_CAR)

	-- Make sure that the client knows that it is deleted
	delay(0.5)

	-- Create the new car
	group_create(GROUP_TURRET, true)

	-- Record the name of the new vehicle
	VEHICLE_PLAYER_CAR = VEHICLE_TURRET

end

Rn02_call_received = false
function rn02_call_received()
	Rn02_call_received = true
end

function rn02_incoming_phone_call(conversation)
	Rn02_call_received = false
	mid_mission_phonecall("rn02_call_received")
	while( not Rn02_call_received ) do
		thread_yield()
	end
	audio_play_conversation( conversation, INCOMING_CALL)
end

function rn02_initialize(rn02_checkpoint)

	rn02_initialize_common()

	rn02_initialize_checkpoint(rn02_checkpoint)

	mission_start_fade_in()

end

-- Initialization code shared by all checkpoints.
function rn02_initialize_common()

	-- Start trigger is hit...the activate button was hit
	set_mission_author("Phillip Alexander")

	if coop_is_active() then
		IN_COOP = true
	end

	notoriety_set_max("Ronin",Max_notoriety_cell)
	notoriety_set_max("Police", Max_notoriety_cell)

	Thread_vehicle_infinite_mass = thread_new("rn02_vehicle_infinite_mass")

end

-- Initialization code specific to the checkpoint.
function rn02_initialize_checkpoint(checkpoint)

	if (checkpoint == CHECKPOINT_START) then

		-- Setup the car dealer
		turn_invulnerable(CHARACTER_CAR_DEALER, false)
		on_death("rn02_dealer_died_failure", CHARACTER_CAR_DEALER)

		-- Setup the convertible that the player(s) will obtain from the car dealership.
		set_unjackable_flag(VEHICLE_PLAYER_CAR, true)
		set_max_hit_points(VEHICLE_PLAYER_CAR, get_max_hit_points(VEHICLE_PLAYER_CAR)*PLAYER_VEHICLE_HEALTH_MULTIPLIER)
		on_vehicle_destroyed("rn02_vehicle_destroyed_failure",VEHICLE_PLAYER_CAR)
		vehicle_never_flatten_tires(VEHICLE_PLAYER_CAR, true)

	elseif (checkpoint == CHECKPOINT_WEAPON_DEALER) then

		vehicle_never_flatten_tires(VEHICLE_PLAYER_CAR, true)

		-- Add convertible callbacks
		on_vehicle_enter("rn02_convertible_entered", VEHICLE_PLAYER_CAR)
		on_vehicle_exit("rn02_convertible_exited", VEHICLE_PLAYER_CAR)
		on_vehicle_destroyed("rn02_vehicle_destroyed_failure",VEHICLE_PLAYER_CAR)

		-- Tell players to get in convertible if not already in it.
		if	( character_is_in_vehicle(LOCAL_PLAYER, VEHICLE_PLAYER_CAR) ) then
			Player_in_convertible[LOCAL_PLAYER] = true
		else
			local sync = SYNC_LOCAL
			mission_help_table(HELPTEXT_PROMPT_ENTER_CAR, "", "", sync)
			marker_add_vehicle(VEHICLE_PLAYER_CAR,MINIMAP_ICON_PROTECT_ACQUIRE,INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE,sync)
		end
		if (IN_COOP) then
			if	( character_is_in_vehicle(REMOTE_PLAYER, VEHICLE_PLAYER_CAR) ) then
				Player_in_convertible[REMOTE_PLAYER] = true
			else
				local sync = SYNC_REMOTE
				mission_help_table(HELPTEXT_PROMPT_ENTER_CAR, "", "", sync)
				marker_add_vehicle(VEHICLE_PLAYER_CAR,MINIMAP_ICON_PROTECT_ACQUIRE,INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE,sync)
			end
		end

		-- Make sure that prompt thread doesn't try to spit out any dealer prompts until
		-- we actually send the players to the next dealer.
		Current_dealer_complete = true

		-- Start prompt tracking
		Thread_prompt_tracking = thread_new("rn02_prompt_tracking")

	elseif (checkpoint == CHECKPOINT_DRIVE) then

		group_hide(GROUP_PLAYER_CAR)
		group_destroy(GROUP_PLAYER_CAR)

		-- Give the players the weapons that they received from the arms dealer
		inv_weapon_add_temporary(LOCAL_PLAYER, FREE_WEAPON_GUN, 1, true)
		inv_weapon_add_temporary(LOCAL_PLAYER, FREE_WEAPON_THROWN, 1, true)
		if (IN_COOP) then
			inv_weapon_add_temporary(REMOTE_PLAYER, FREE_WEAPON_GUN, 1, true)
			inv_weapon_add_temporary(REMOTE_PLAYER, FREE_WEAPON_THROWN, 1, true)
		end
		Weapons_received	= true

		rn02_swap_vehicles()

		-- Place the correct people in the vehicle
		rn02_setup_convertible_occupants()

		-- Prepare the convertible
		rn02_setup_convertible_for_turret()

		-- Start the chase and ambush threads
		rn02_setup_chases_and_ambushes()
	end

end

function rn02_car_dealer()

	-- spawn the vehicle dealer, send the player his way
	Thread_dealer = thread_new("rn02_setup_and_process_dealer_thread", CHARACTER_CAR_DEALER, nil, 
										HELPTEXT_PROMPT_CAR_DEALERSHIP)
	
	-- add a minimap icon and in game effect for the dealer trigger
	marker_add_npc(CHARACTER_CAR_DEALER,MINIMAP_ICON_LOCATION,INGAME_EFFECT_NPC_INTERACT,SYNC_ALL)
	mission_waypoint_add( CHARACTER_CAR_DEALER, SYNC_ALL)

	-- make the convertible invulnerable until the dealer's trigger is hit
	turn_invulnerable(VEHICLE_PLAYER_CAR, false)
	vehicle_prevent_explosion_fling(VEHICLE_PLAYER_CAR, true) 

	while (not Current_dealer_complete) do
		thread_yield()
	end
	thread_kill(Thread_dealer)

	-- make the dealer vulnerable
	turn_vulnerable(CHARACTER_CAR_DEALER)

	-- make the convertible invulnerable until the dealer's trigger is hit
	turn_vulnerable(VEHICLE_PLAYER_CAR)
	vehicle_prevent_explosion_fling(VEHICLE_PLAYER_CAR, false) 

	on_vehicle_enter("rn02_convertible_entered", VEHICLE_PLAYER_CAR)
	on_vehicle_exit("rn02_convertible_exited", VEHICLE_PLAYER_CAR)

	-- Tell the player(s) to get in the convertible
	mission_help_table(HELPTEXT_PROMPT_ENTER_CAR)
	marker_add_vehicle(VEHICLE_PLAYER_CAR,MINIMAP_ICON_PROTECT_ACQUIRE,INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE,SYNC_ALL)
	set_unjackable_flag(VEHICLE_PLAYER_CAR, false)

	-- Start prompt tracking
	Thread_prompt_tracking = thread_new("rn02_prompt_tracking")
	if IN_COOP then
		Thread_delayed_release = thread_new("rn02_delayed_release_to_world", GROUP_CAR_DEALER, GROUP_START_CAR, GROUP_START_CAR_COOP)
	else
		Thread_delayed_release = thread_new("rn02_delayed_release_to_world", GROUP_CAR_DEALER, GROUP_START_CAR)
	end

end

-- The current repair trigger
Current_repair_trigger = {[LOCAL_PLAYER] = "", [REMOTE_PLAYER] = ""}
Current_repair_waypoint_suppressed = {[LOCAL_PLAYER] = false, [REMOTE_PLAYER] = false}

-- The current prompt mode
PROMPT_MODE_NONE = 0
PROMPT_MODE_CONVERTIBLE = 1
PROMPT_MODE_REPAIR = 2
PROMPT_MODE_DEALER = 3
Current_prompt_mode = {	[LOCAL_PLAYER] = PROMPT_MODE_CONVERTIBLE, [REMOTE_PLAYER] = PROMPT_MODE_CONVERTIBLE, }

Last_displayed_dealer_helptext = ""
function rn02_prompt_tracking()

	-- Does the convertible need to be repaired?
	local function rn02_should_repair_convertible()
		if(Current_dealer == CHARACTER_FENCE) then
			if (vehicle_is_destroyed(VEHICLE_PLAYER_CAR)) then
				return false
			end
			if (get_current_hit_points(VEHICLE_PLAYER_CAR)/get_max_hit_points(VEHICLE_PLAYER_CAR) < .8) then
				return true
			end
		end
	end

	-- Get the new prompt mode for a player
	local function rn02_get_new_prompt_mode(player)

		if (Current_dealer_complete == true) then
			return PROMPT_MODE_NONE
		end


		-- For most dealers, we only care that the player is close to the dealer
		local dist_to_dealer = get_dist(player, Current_dealer)

		-- For the fence, we also care that the car is close to the dealer
		if ( (not vehicle_is_destroyed(VEHICLE_PLAYER_CAR)) and (Current_dealer == CHARACTER_FENCE)) then
			dist_to_dealer = max(dist_to_dealer, get_dist(VEHICLE_PLAYER_CAR, Current_dealer))
		end
		local close_to_dealer = (dist_to_dealer < PROXIMITY_THRESHOLD)
		local should_repair = rn02_should_repair_convertible()

		if ( not Player_in_convertible[player] ) then
			if ( should_repair or (not close_to_dealer) ) then
				return PROMPT_MODE_CONVERTIBLE
			end
		end

		if (should_repair) then			
			return PROMPT_MODE_REPAIR
		end

		return PROMPT_MODE_DEALER

	end

	local wrong_car_threads = 
		{	[LOCAL_PLAYER] = -1,	[REMOTE_PLAYER] = -1,}

	wrong_car_threads[LOCAL_PLAYER] = thread_new("rn02_wrong_car_message", LOCAL_PLAYER)
	if(IN_COOP) then
		wrong_car_threads[REMOTE_PLAYER] = thread_new("rn02_wrong_car_message", REMOTE_PLAYER)
	end

	-- Store previous dealer helptext so that we can switch prompts if the player
	-- talks to the dealer from inside of the convertible.
	local previous_dealer_helptext = Current_dealer_helptext
	local previous_dealer = Current_dealer

	-- Remove prompt mode's indicators
	local function rn02_remove_prompts(player, current_prompt_mode)

		local sync = PLAYER_SYNC[player]
		
		if(current_prompt_mode == PROMPT_MODE_REPAIR) then
			if(Current_repair_trigger[player] ~= "") then
				marker_remove_navpoint(Current_repair_trigger[player], sync)
				mission_waypoint_remove(sync)
				Current_repair_trigger[player] = ""
			end
		elseif(current_prompt_mode == PROMPT_MODE_CONVERTIBLE) then

			-- Stop warning player if they enter the wrong vehilce
			if(wrong_car_threads[player] ~= -1) then
				thread_kill(wrong_car_threads[player])
				wrong_car_threads[player] = -1
			end

			-- remove existing waypoint, marker
			marker_remove_vehicle(VEHICLE_PLAYER_CAR,sync)
			mission_waypoint_remove(sync)

		else -- PROMPT_MODE_DEALER
			marker_remove_npc(Current_dealer,sync)
			mission_waypoint_remove(sync)		
		end
	end

	-- Add prompts for a new mode
	local function rn02_add_prompts(player, new_prompt_mode)

		local sync = PLAYER_SYNC[player]

		if(new_prompt_mode == PROMPT_MODE_REPAIR) then

			Current_repair_trigger[player] = ""
			Current_repair_waypoint_suppressed[player] = false

			-- All indicators are added in the mode's update function
			mission_help_table_nag(HELPTEXT_PROMPT_REPAIR_CAR)

		elseif(new_prompt_mode == PROMPT_MODE_CONVERTIBLE) then
			-- Tell the player to get in the car
			mission_help_table_nag(HELPTEXT_PROMPT_REENTER_CAR, "", "", sync)

			-- Warn them if they get in the wrong car
			wrong_car_threads[player] = thread_new("rn02_wrong_car_message", player)

			-- Add markers to the car
			marker_add_vehicle(VEHICLE_PLAYER_CAR,MINIMAP_ICON_PROTECT_ACQUIRE,INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE,sync)
			mission_waypoint_add(VEHICLE_PLAYER_CAR, sync )

		else -- PROMPT_MODE_DEALER

			-- add a minimap icon and in-game effect for the dealer trigger
			marker_add_npc(Current_dealer,MINIMAP_ICON_LOCATION,INGAME_EFFECT_NPC_INTERACT,sync)
			mission_waypoint_add(Current_dealer, sync )

			-- Tell the player what to do next
			if (Last_displayed_dealer_helptext == Current_dealer_helptext) then
				mission_help_table_nag(Current_dealer_helptext, "", "", sync)
			else
				mission_help_table(Current_dealer_helptext, "", "", sync)
				Last_displayed_dealer_helptext = Current_dealer_helptext
			end
		end		

	end

	local function rn02_update_mode(player, prompt_mode)

		local sync = PLAYER_SYNC[player]

		if(prompt_mode == PROMPT_MODE_REPAIR) then

			local new_repair_trigger = player_get_nearest_trigger_of_type("car mechanic", player, false)

			-- The closest repair trigger changed.
			if (new_repair_trigger ~= Current_repair_trigger[player]) then

				-- Remove old indicators
				if(Current_repair_trigger[player] ~= "") then
					marker_remove_navpoint(Current_repair_trigger[player], sync)
					mission_waypoint_remove(sync)
				end

				-- Add new indicators
				if(new_repair_trigger ~= "") then
					marker_add_navpoint(new_repair_trigger, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION, sync)
					if (get_dist(new_repair_trigger, player) < 50) then
						mission_waypoint_add(new_repair_trigger, sync)
						Current_repair_waypoint_suppressed[player] = false
					else
						Current_repair_waypoint_suppressed[player] = true
					end
				end
				Current_repair_trigger[player] = new_repair_trigger

			-- The closest trigger didn't change, see if we need to start/stop suppressing the repair trigger
			-- waypoints.
			elseif(Current_repair_trigger[player] ~= "") then

				local should_suppress_waypoint = (get_dist(new_repair_trigger, player) < 50)

				if (should_suppress_waypoint ~= Current_repair_waypoint_suppressed[player]) then

					if (should_suppress_waypoint) then
						mission_waypoint_remove(sync)
					else
						mission_waypoint_add(new_repair_trigger, sync)
					end

					Current_repair_waypoint_suppressed[player] = should_suppress_waypoint
				end

			end

		elseif(prompt_mode == PROMPT_MODE_CONVERTIBLE) then
		else -- PROMPT_MODE_DEALER

			if (previous_dealer_helptext ~= Current_dealer_helptext) then
				-- add a minimap icon and in game effect for the dealer trigger
				marker_add_npc(Current_dealer,MINIMAP_ICON_LOCATION,INGAME_EFFECT_NPC_INTERACT,sync)
				mission_waypoint_add(Current_dealer, sync )

				-- Tell the player what to do next
				if (Last_displayed_dealer_helptext == Current_dealer_helptext) then
					mission_help_table_nag(Current_dealer_helptext, "", "", sync)
				else
					mission_help_table(Current_dealer_helptext, "", "", sync)
					Last_displayed_dealer_helptext = Current_dealer_helptext
				end

			end

		end	

	end

	local function rn02_update_player_prompts(player)

		local sync = PLAYER_SYNC[player]
		local new_prompt_mode = rn02_get_new_prompt_mode(player)
	
		-- If the prompt mode has changed, remove the old prompts and add new ones
		if (new_prompt_mode ~= Current_prompt_mode[player]) then
			rn02_remove_prompts(player, Current_prompt_mode[player])
			rn02_add_prompts(player, new_prompt_mode)
			Current_prompt_mode[player] = new_prompt_mode

		-- If we were in dealer prompt mode and the dealer changes, then update prompts
		else
			rn02_update_mode(player, Current_prompt_mode[player])
		end
	
	end -- local function rn02_update_player_prompts(player)

	while (true) do

		if (Current_dealer_complete ~= true) then

			rn02_update_player_prompts(LOCAL_PLAYER)
			if (IN_COOP) then
				rn02_update_player_prompts(REMOTE_PLAYER)
			end

			previous_dealer_helptext = Current_dealer_helptext
			previous_dealer = Current_dealer

		end

		thread_yield()
	end
end

-- This function is started whenever the Convertible prompt is displayed.
function rn02_wrong_car_message(player)

	local previous_car = ""

	while(true) do

		-- Warn the player if they've entered a new incorrect vehicle.
		local current_car = get_char_vehicle_name(player)

		-- Don't tell the player that they're in the wrong vehicle if they're in the convertible!.
		if(current_car == VEHICLE_PLAYER_CAR) then
			previous_car = ""
		elseif (current_car ~= previous_car) then
			previous_car = current_car
			if(current_car ~= "") then
				mission_help_table_nag(HELPTEXT_PROMPT_WRONG_CAR, "", "", PLAYER_SYNC[player])
			end
		end		

		thread_yield()

	end
end

function rn02_convertible_entered(player)
	Player_in_convertible[player] = true
end

function rn02_convertible_exited(player)
	Player_in_convertible[player] = false
end

function rn02_clothing_dealer()
	-- spawn the vehicle dealer, send the player his way
	Thread_dealer = thread_new("rn02_setup_and_process_dealer_thread", CHARACTER_CLOTHING_DEALER, GROUP_CLOTHING_DEALER, 
										HELPTEXT_PROMPT_CLOTHING_DEALER)

	thread_new("rn02_warning_call")
	thread_new("rn02_bump_notoriety")

	delay(15)

	audio_play_conversation( WARNING_CONVERSATION, INCOMING_CALL)	

	notoriety_set("Ronin", Min_notoriety_cell)
	notoriety_set_min("Ronin",Min_notoriety_cell)
	notoriety_set_max("Ronin",Max_notoriety_cell)

	while (not Current_dealer_complete) do
		thread_yield()
	end

	-- don the outfit
	local dist, player = get_dist_closest_player_to_object(CHARACTER_CLOTHING_DEALER)
	Clothing_dealer_player = player

	turn_invulnerable(Clothing_dealer_player)
	player_controls_disable(Clothing_dealer_player)

	fade_out(0.0,{0,0,0}, SYNC_ALL)

	customization_item_wear(FREE_CLOTHING_NAME,FREE_CLOTHING_WEAR_OPTION,FREE_CLOTHING_VARIANT_NAME, PLAYER_SYNC[player])
	audio_play_conversation( CLOTHING_CONVERSATION)	

	turn_vulnerable(Clothing_dealer_player)
	player_controls_enable(Clothing_dealer_player)

	fade_in(1.0, SYNC_ALL)

	-- make the dealer vulnerable
	turn_vulnerable(CHARACTER_CLOTHING_DEALER)
	release_to_world(GROUP_CLOTHING_DEALER)

	thread_kill(Thread_dealer)
end

function rn02_weapon_dealer()
	
	-- spawn the vehicle dealer, send the player his way
	Thread_dealer = thread_new("rn02_setup_and_process_dealer_thread", CHARACTER_WEAPON_DEALER, GROUP_WEAPON_DEALER, 
										HELPTEXT_PROMPT_WEAPON_DEALER)

	thread_new("rn02_warning_call")
	thread_new("rn02_bump_notoriety")

	while (not Current_dealer_complete) do
		thread_yield()
	end

	-- Give the players the temp. weapons
	inv_weapon_add_temporary(LOCAL_PLAYER, FREE_WEAPON_GUN, 1, true)
	inv_weapon_add_temporary(LOCAL_PLAYER, FREE_WEAPON_THROWN, 1, true)
	if (not character_is_in_a_driver_seat(LOCAL_PLAYER)) then
		inv_item_equip(FREE_WEAPON_GUN,LOCAL_PLAYER)
	end
	if (IN_COOP) then
		inv_weapon_add_temporary(REMOTE_PLAYER, FREE_WEAPON_GUN, 1, true)
		inv_weapon_add_temporary(REMOTE_PLAYER, FREE_WEAPON_THROWN, 1, true)
		if (not character_is_in_a_driver_seat(REMOTE_PLAYER)) then
			inv_item_equip(FREE_WEAPON_GUN,REMOTE_PLAYER)
		end		
	end
	Weapons_received	= true

	-- make the dealer vulnerable
	turn_vulnerable(CHARACTER_WEAPON_DEALER)
	release_to_world(GROUP_WEAPON_DEALER)

	--action_play(CHARACTER_WEAPON_DEALER, "compliment C", nil, true, 0.5, true)
	--thread_new("rn02_weapon_dealer_leave_and_release")

	thread_kill(Thread_dealer)
end

function rn02_warning_call()
	delay(10)
	rn02_incoming_phone_call( WARNING_CONVERSATION)

end

function rn02_bump_notoriety()
	delay(25)

	notoriety_set_min("Ronin",Min_notoriety_cell)
	notoriety_set_max("Ronin",Max_notoriety_cell)

end


function rn02_weapon_dealer_leave_and_release()
	vehicle_enter(CHARACTER_WEAPON_DEALER, VEHICLE_WEAPON_DEALER)

	local dist, player = get_dist_closest_player_to_object(VEHICLE_WEAPON_DEALER)
	vehicle_flee(VEHICLE_WEAPON_DEALER, player)

	delay(10)

	release_to_world(GROUP_WEAPON_DEALER)
end

function rn02_fence()
	
	-- spawn the vehicle dealer, send the player on his way
	Thread_dealer = thread_new("rn02_setup_and_process_dealer_thread", CHARACTER_FENCE, GROUP_FENCE, 
										HELPTEXT_PROMPT_FENCE)

	while (not Current_dealer_complete) do
		thread_yield()
	end
	
	party_dismiss_all()
		
	-- make the fence part of the player's party
	party_add(CHARACTER_FENCE,LOCAL_PLAYER)
	turn_vulnerable(CHARACTER_FENCE)

	thread_kill(Thread_dealer)

end

function rn02_setup_convertible_occupants()

	-- Make sure that no random ped or vehicle spawns obstruct our vehicle
	spawning_pedestrians(false, true)
	spawning_vehicles(false)

	thread_kill(Thread_vehicle_infinite_mass)

	-- Teleport the players to a staging area, removing them from vehicles along the way.
	teleport_coop(NAVPOINT_LOCAL_CONVERTIBLE_STAGING, NAVPOINT_REMOTE_CONVERTIBLE_STAGING, true)

	-- Dismiss any extra followers and put Johnny Gat and the homie in the player's party
	party_dismiss_all() 
	party_add(CHARACTER_FENCE,LOCAL_PLAYER)

	set_unjackable_flag(VEHICLE_PLAYER_CAR, false)
	follower_make_independent(CHARACTER_FENCE, true)

	vehicle_enter_teleport(CHARACTER_FENCE,VEHICLE_PLAYER_CAR,0)
	vehicle_enter_teleport(LOCAL_PLAYER,VEHICLE_PLAYER_CAR,1)
	if IN_COOP then
		vehicle_enter_teleport(REMOTE_PLAYER,VEHICLE_PLAYER_CAR,2)
	end

	rn02_wait_for_vehicle_entry(CHARACTER_FENCE, VEHICLE_PLAYER_CAR, 0)
	rn02_wait_for_vehicle_entry(LOCAL_PLAYER, VEHICLE_PLAYER_CAR, 1)

	if (IN_COOP) then
		rn02_wait_for_vehicle_entry(REMOTE_PLAYER, VEHICLE_PLAYER_CAR, 2)
		delay(1.0)
	end

	-- Reenable ped and vehicle spawning
	spawning_pedestrians(true, true)
	spawning_vehicles(true)	

end


-- Wait for a character to enter a vehicle. Blocks 
function rn02_wait_for_vehicle_entry(character, vehicle, seat_index)

	local delay_length = 0.25
	if (character == REMOTE_PLAYER) then
		delay_length = 0.5
	end

	local teleport_attempts = 1
	while( (not character_is_in_vehicle(character, vehicle)) and (teleport_attempts < 5) ) do
		teleport_attempts = teleport_attempts + 1
		vehicle_enter_teleport(character, vehicle, seat_index)
		delay(delay_length)
	end

end

function rn02_setup_convertible_for_turret()

	-- Make sure that the on_destroyed callback is still active
	on_vehicle_destroyed("rn02_vehicle_destroyed_failure",VEHICLE_PLAYER_CAR)

	-- Prepare the vehicle for turreting
	vehicle_set_torque_multiplier(VEHICLE_PLAYER_CAR, 1.2)
	vehicle_prevent_explosion_fling(VEHICLE_PLAYER_CAR,true)
	vehicle_set_allow_ram_ped(VEHICLE_PLAYER_CAR,true)
	vehicle_set_crazy(VEHICLE_PLAYER_CAR,true)
	--vehicle_set_use_short_cuts(VEHICLE_PLAYER_CAR, true)
	vehicle_infinite_mass(VEHICLE_PLAYER_CAR, true)
	vehicle_disable_flee(VEHICLE_PLAYER_CAR, true)
	vehicle_disable_chase(VEHICLE_PLAYER_CAR, true)
	vehicle_never_flatten_tires(VEHICLE_PLAYER_CAR, true)
	set_unjackable_flag(VEHICLE_PLAYER_CAR, true)

	-- make sure the fence doesn't get out of the car
	vehicle_suppress_npc_exit(VEHICLE_PLAYER_CAR,true)
	set_seatbelt_flag(CHARACTER_FENCE,true)

	-- Player(s) can not enter/exit vehicles
	set_player_can_enter_exit_vehicles(LOCAL_PLAYER, false)
	if (IN_COOP) then
		set_player_can_enter_exit_vehicles(REMOTE_PLAYER, false)
	end

	inv_item_equip(FREE_WEAPON_GUN,LOCAL_PLAYER)
	if (IN_COOP) then
		inv_item_equip(FREE_WEAPON_GUN,REMOTE_PLAYER)
	end

end

function rn02_safe_house()

	-- Start a thread to handle the fence's dialogue during the drive.
	thread_new("rn02_fence_drive_dialogue")

	-- tell the player to protect the fence	
	mission_help_table(HELPTEXT_PROMPT_PROTECT_FENCE)

	-- Set notoriety levels
	notoriety_set_max("Ronin",Max_notoriety_fence)
	notoriety_set_min("Ronin",Min_notoriety_fence)
	notoriety_set("Ronin", Min_notoriety_fence)
	
	marker_add_navpoint(TRIGGER_SAFE_HOUSE, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION, SYNC_ALL)

	-- increase the speed of the convertible
	vehicle_speed_override(VEHICLE_PLAYER_CAR, CONVERTIBLE_MAX_SPEED)

	-- drive to just before the first roadblock in turret mode
	vehicle_turret_base_to(VEHICLE_PLAYER_CAR, "rn02_$n001",false)

	-- Blast through the roadblock
	local normal_max_speed = vehicle_get_max_speed(VEHICLE_PLAYER_CAR)
	vehicle_max_speed(VEHICLE_PLAYER_CAR, 80)
	vehicle_speed_override(VEHICLE_PLAYER_CAR, 80)
	vehicle_ignore_repulsors(VEHICLE_PLAYER_CAR, true)

	vehicle_turret_base_to(VEHICLE_PLAYER_CAR, "rn02_$n002", false)

	-- Return to somewhat normal driving
	vehicle_speed_cancel(VEHICLE_PLAYER_CAR)
	vehicle_max_speed(VEHICLE_PLAYER_CAR, normal_max_speed)

	-- Use navmesh pathfinding to drive on grass while cutting a corner
	vehicle_pathfind_to(VEHICLE_PLAYER_CAR,"rn02_$n009", true, false)

	-- Stop ignoring repulsors now
	vehicle_ignore_repulsors(VEHICLE_PLAYER_CAR, false)

	-- drive to the safe house in turret mode
	vehicle_turret_base_to(VEHICLE_PLAYER_CAR, TRIGGER_SAFE_HOUSE,true)

end

function rn02_fence_drive_dialogue()

	local dialogue_info =	
		{	
			[.70] = FENCE_PISSMOAN_CONVERSATION,
			[.40] = FENCE_BITCHMOAN_CONVERSATION,
			[.20] = FENCE_FINAL_CONVERSATION,
		}

	local total_dist = get_dist(CHARACTER_FENCE, TRIGGER_SAFE_HOUSE)
	local current_dist = total_dist

	for dist_ratio, conversation in pairs(dialogue_info) do

		local dialogue_dist = current_dist * dist_ratio

		while(current_dist > dialogue_dist) do

			-- Don't want to measure the distance to a dead dude.
			if ( character_is_dead(CHARACTER_FENCE) ) then
				return
			end

			current_dist = get_dist(CHARACTER_FENCE, TRIGGER_SAFE_HOUSE)
			thread_yield()
		end

		audio_play_conversation(conversation)

	end

end

-- Cleanup mission
function rn02_cleanup()

	IN_COOP = coop_is_active()

	-- remove vehicle callbacks
	on_vehicle_destroyed("",VEHICLE_PLAYER_CAR)
	on_vehicle_enter("", VEHICLE_PLAYER_CAR)
	on_vehicle_exit("", VEHICLE_PLAYER_CAR)

	group_destroy(GROUP_PLAYER_CAR)
	group_destroy(GROUP_TURRET)

	mid_mission_phonecall_reset()

	-- remove minimap icons and ingame effects from dealers
	marker_remove_npc(CHARACTER_CAR_DEALER)
	marker_remove_npc(CHARACTER_CLOTHING_DEALER)
	marker_remove_npc(CHARACTER_WEAPON_DEALER)
	marker_remove_npc(CHARACTER_FENCE)

	-- remove minimap icon from final destination
	marker_remove_navpoint(TRIGGER_SAFE_HOUSE)

	if (Current_repair_trigger[LOCAL_PLAYER] ~= "") then
		marker_remove_navpoint(Current_repair_trigger[LOCAL_PLAYER], SYNC_LOCAL)
	end

	if (Current_repair_trigger[REMOTE_PLAYER] ~= "") then
		marker_remove_navpoint(Current_repair_trigger[REMOTE_PLAYER], SYNC_REMOTE)
	end

	mission_waypoint_remove(SYNC_ALL)

	-- remover dealer callbacks
	on_death("", CHARACTER_FENCE)
	on_death("", CHARACTER_CAR_DEALER)
	on_death("", CHARACTER_CLOTHING_DEALER)
	on_death("", CHARACTER_WEAPON_DEALER)

	-- Kill all secondary threads
	for i, thread in pairs(Table_all_threads) do
		thread_kill(thread)
	end

	if (npc_is_in_party(CHARACTER_FENCE)) then
		npc_stop_following(CHARACTER_FENCE)
	end

	-- put the player's regular clothes back on
	customization_item_revert(SYNC_LOCAL)
	if(IN_COOP) then
		customization_item_revert(SYNC_REMOTE)
	end

	-- revert the player's weapons
	if (Weapons_received) then
		inv_weapon_remove_temporary(LOCAL_PLAYER, FREE_WEAPON_GUN)
		inv_weapon_remove_temporary(LOCAL_PLAYER, FREE_WEAPON_THROWN)
		if ( IN_COOP ) then
			inv_weapon_remove_temporary(REMOTE_PLAYER, FREE_WEAPON_GUN)
			inv_weapon_remove_temporary(REMOTE_PLAYER, FREE_WEAPON_THROWN)
		end
	end

	-- disable all triggers, remove callbacks
	for i, trigger in pairs(TABLE_ALL_TRIGGERS) do
		on_trigger("",trigger)
		trigger_enable(trigger,false)
	end

	-- Player(s) can enter/exit vehicles
	set_player_can_enter_exit_vehicles(LOCAL_PLAYER, true)
	if (IN_COOP) then
		set_player_can_enter_exit_vehicles(REMOTE_PLAYER, true)
	end

	-- Reenable ped and vehicle spawning
	spawning_pedestrians(true)
	spawning_vehicles(true)	

end

function rn02_success()
	-- Called when the mission has ended with success
end

function rn02_complete()

	-- Make sure that the mid-mission phonecall is reset before the story cutscene plays.
	mid_mission_phonecall_reset()
	

	-- End the mission with success
	mission_end_success("rn02", "ro02-02", {NAVPOINT_LOCAL_SUCCESS, NAVPOINT_REMOTE_SUCCESS})
end

-- MISSION FUNCTIONS ----------------------------------------
function rn02_setup_and_process_dealer_thread(character_dealer,group_dealer, helptext_prompt, helptext_dialogue)

	-- Store current dealer, helptext for prompt tracking
	Current_dealer = character_dealer
	Current_dealer_helptext = helptext_prompt

	-- haven't reached the dealer yet
	Current_dealer_complete = false
	
	-- create the dealer's group
	if (group_dealer ~= nil) then
		group_create(group_dealer, true)
	end

	-- Add the failure function, set some flags
	if (Current_dealer == CHARACTER_FENCE) then
		on_death("rn02_fence_died_failure", Current_dealer)
	else
		on_death("rn02_dealer_died_failure", Current_dealer)
	end
	set_unrecruitable_flag(character_dealer, true)
	set_cant_flee_flag(Current_dealer, true)
	turn_invulnerable(Current_dealer, true)

	local function player_triggered_dealer(player)

		if ( (player == REMOTE_PLAYER) and (not IN_COOP) ) then
			return false
		end

		local dist = get_dist(player, character_dealer)
		if (	(dist < DEALER_INTERACT_DISTANCE) and 
				( (Current_prompt_mode[player] == PROMPT_MODE_DEALER) or (Current_dealer == CHARACTER_CAR_DEALER) )
			) then
			return true
		else
			return false
		end
		
	end

	-- wait for one of the players to get close to the dealer
	while ( (not player_triggered_dealer(LOCAL_PLAYER)) and (not player_triggered_dealer(REMOTE_PLAYER)) ) do
		thread_yield()
	end

	marker_remove_npc(character_dealer)
	mission_waypoint_remove()
	
	if(helptext_dialogue) then
		mission_help_table_nag(helptext_dialogue)
		delay(3.0)
	end
		
	local dist,player = get_dist_closest_player_to_object(Current_dealer)
	turn_to(Current_dealer, player)

	local conversation = {}

	if (Current_dealer == CHARACTER_CAR_DEALER) then
		conversation =
			{
				{ "PLAYER_RON2_CAR_L1", player, 0.5, "talk to drugdealer"},
				{ "RON2_CAR_L2", CHARACTER_CAR_DEALER, 0.5, "talk to drugdealer"},
				{ "PLAYER_RON2_CAR_L3", player, 0.5, "talk to drugdealer"},
			}
	elseif(Current_dealer == CHARACTER_WEAPON_DEALER) then
		conversation =
			{
				{ "PLAYER_RON2_ARMS_L1", player, 0.5, "talk to drugdealer" },
				{ "RON2_ARMS_L2", CHARACTER_WEAPON_DEALER, 0.5, "talk to drugdealer" },
			}
	else
		conversation = 
			{
				{ "PLAYER_RON2_FENCE_L1", player, 0.5, "talk to drugdealer"},
				{ "RON2_FENCE_L2", CHARACTER_FENCE, 0.5, "talk to drugdealer" },
			}
	end

	audio_play_conversation( conversation)

	if (Current_dealer ~= CHARACTER_FENCE) then
		on_death("", Current_dealer)
		set_cant_flee_flag(character_dealer, false)
	end

	Current_dealer_complete = true

end

function rn02_setup_chases_and_ambushes()

	rn02_create_chase_and_ambush_groups()

	thread_new("rn02_complication", "chase_1", 1)
	thread_new("rn02_complication", "roadblock_1", 2)

end

function rn02_create_chase_and_ambush_groups()

	for complication_name, complication_info in pairs(CHASES_AND_AMBUSHES) do
		group_create(complication_info["group"])		
	end

end

function rn02_complication(complication_name, index)

	local complication = CHASES_AND_AMBUSHES[complication_name]
	local complication_type = complication["type"]

	-- complication-type-specific preparation
	if (complication_type == "chase") then
		rn02_chase_prepare(complication_name)
	elseif (complication_type == "roadblock") then
		rn02_roadblock_prepare(complication_name)
	end

	-- Wait for the previous trigger to be hit
	while (Chase_or_ambush_sent ~= (index - 1)) do
		thread_yield()
	end

	-- Arm the trigger if it exists, otherwise we'll call the on_trigger_hit function immediately
	if(complication["trigger"]) then
		trigger_enable(complication["trigger"],true)
		on_trigger("rn02_chase_or_ambush_location_reached",complication["trigger"])
	else
		Chase_or_ambush_sent = Chase_or_ambush_sent + 1
	end

	-- wait for the appropriate trigger to be hit
	while (Chase_or_ambush_sent ~= index) do
		thread_yield()
	end

	-- Reset the trigger
	if (complication["trigger"]) then
		trigger_enable(complication["trigger"],false)
		on_trigger("",complication["trigger"])
	end

	-- complication-type-specific trigger-hit function
	if (complication_type == "chase") then
		rn02_chase_trigger_hit(complication_name)
	elseif (complication_type == "roadblock") then
		rn02_roadblock_trigger_hit(complication_name)
	end

	-- complication-type-specific cleanup for the last complication
	-- Release the on_foot Ronin from the last group
	if (Last_complication ~= "") then
		local last_complication_type = CHASES_AND_AMBUSHES[Last_complication]
		if (last_complication_type == "chase") then
			rn02_chase_cleanup(Last_complication)
		elseif (last_complication_type == "roadblock") then
			rn02_roadblock_cleanup(Last_complication)
		end
	end

	Last_complication = complication_name
end

function rn02_chase_prepare(chase_name)
	local chase = CHASES_AND_AMBUSHES[chase_name]

		-- prepare vehicles
	for vehicle,vehicle_data in pairs(chase["vehicles"]) do

		-- place driver/passengers in the vehicle
		for i,passenger in pairs(vehicle_data["passengers"]) do
			vehicle_enter_teleport(passenger,vehicle,i-1)
			set_seatbelt_flag(passenger,true)
		end

		-- get ready to chase
		vehicle_suppress_npc_exit(vehicle, true)
		vehicle_set_allow_ram_ped(vehicle,true)
		vehicle_set_crazy(vehicle,true)
		vehicle_set_use_short_cuts(vehicle,true)

		-- Set vehicle class specific parameters
		-- (speed override is set later or vehicles will begin driving immediately)
		if (vehicle_data["type"] == "car") then
			set_max_hit_points(vehicle, 	rn02_get_parameter_value("CAR_CHASE_HP"))

		elseif (vehicle_data["type"] == "bike") then
			set_max_hit_points(vehicle, 	rn02_get_parameter_value("BIKE_CHASE_HP"))
		end

		-- add callback to update count of vehicles attacking
		on_vehicle_destroyed("rn02_chase_vehicle_destroyed", vehicle)

	end
end

-- Vehicles attack if doing so won't cause us to excede the threshold, otherwise they are destroyed
-- peds attack
function rn02_chase_trigger_hit(chase_name)
	
	local chase = CHASES_AND_AMBUSHES[chase_name]

	-- Have vehicles enter chase mode
	for vehicle,vehicle_data in pairs(chase["vehicles"]) do

		-- get the maximum number of vehicles that can chasing the players
		local max_vehicles	= rn02_get_parameter_value("MAX_CHASE_VEHICLES")

		-- have the vehicle attack if we won't excede the max
		if (Vehicles_attacking < max_vehicles and not vehicle_is_destroyed(vehicle)) then

			-- Set vehicle class specific parameters
			-- (speed override is set later or vehicles will begin driving immediately)
			if (vehicle_data["type"] == "car") then
				vehicle_max_speed(vehicle, rn02_get_parameter_value("CAR_CHASE_SPEED"))
			elseif (vehicle_data["type"] == "bike") then
				vehicle_max_speed(vehicle, rn02_get_parameter_value("BIKE_CHASE_SPEED"))
			end
			
			thread_new("rn02_vehicle_chase_maybe_jump",vehicle,vehicle_data["jump"])
	
			-- Set vehicle class specific parameters
			if (vehicle_data["type"] == "car") then
				vehicle_speed_override(vehicle, rn02_get_parameter_value("CAR_CHASE_SPEED"))
			elseif (vehicle_data["type"] == "bike") then
				vehicle_speed_override(vehicle, rn02_get_parameter_value("BIKE_CHASE_SPEED"))
			end

			-- increment attacking count
			Vehicles_attacking = Vehicles_attacking + 1
		else

			-- release vehicles that we can't have attack
			if (vehicle_exists(vehicle)) then
				on_vehicle_destroyed("", vehicle)
				release_to_world(vehicle)
			end
			
		end

	end

	-- Have npcs attack
	for i,npc in pairs(chase["on_foot"]) do
		attack(npc,LOCAL_PLAYER,true)
	end
end

-- Have a vehicle possibly delay a bit and then enter chase mode
function rn02_vehicle_chase_maybe_jump(vehicle,jump)

	-- If jumping, wait for the vehicle to become airborn and then land
	if(jump) then
		vehicle_speed_override(vehicle, vehicle_get_max_speed(vehicle))
		while( not vehicle_in_air(vehicle) ) do
			thread_yield()
		end
		delay(0.5)
		while( vehicle_in_air(vehicle) ) do
			thread_yield()
		end
		vehicle_speed_cancel(vehicle)
	end
	vehicle_chase(vehicle, LOCAL_PLAYER, true, true, true)
end

-- Tidy up a chase complication by releasing the on-foot attackers
-- vehicles and their passengers are cleaned up as the vehicles are destroyed
function rn02_chase_cleanup(chase_name)
	for i,npc in pairs(CHASES_AND_AMBUSHES[chase_name]["on_foot"]) do
		release_to_world(npc)
	end
end

function rn02_chase_vehicle_destroyed(vehicle)
	Vehicles_attacking = Vehicles_attacking - 1
	on_vehicle_destroyed("",vehicle)
	local num_seats = vehicle_get_num_seats(vehicle)
	for i=1, num_seats, 1 do
		local passenger = get_char_in_vehicle(vehicle,i)
		if (passenger) then
			release_to_world(passenger)
		end
	end
	release_to_world(vehicle)
end

-- Peds attack, vehicles prepared in case they'll have to attack
function rn02_roadblock_prepare(roadblock_name)

	local roadblock = CHASES_AND_AMBUSHES[roadblock_name]

	for vehicle,vehicle_data in pairs(roadblock["vehicles"]) do

		-- set potential passengers to use their seat belts
		for i,passenger in pairs(vehicle_data["passengers"]) do
			set_seatbelt_flag(passenger,true)
		end

		-- prepare vehicle for chase
		vehicle_suppress_npc_exit(vehicle, true)
		vehicle_set_allow_ram_ped(vehicle,true)
		vehicle_set_crazy(vehicle,true)
		vehicle_set_use_short_cuts(vehicle,true)

		-- Set hit points
		if (vehicle_data["type"] == "car") then
			set_max_hit_points(vehicle, 	rn02_get_parameter_value("CAR_CHASE_HP"))
		elseif (vehicle_data["type"] == "bike") then
			set_max_hit_points(vehicle, 	rn02_get_parameter_value("BIKE_CHASE_HP"))
		end

	end

	-- Guys on foot can start attacking
	local check_misfires = roadblock["misfire"] ~= nil
	for i,npc in pairs(roadblock["on_foot"]) do
		-- Check if this npc should misfire
		local target = nil
		if(check_misfires) then
			local target = roadblock["misfire"][npc]
		end
		if (target) then
			patrol("rn02_npc_misfire",npc,target)
		else
			attack(npc,LOCAL_PLAYER,true)
		end
	end
end

function rn02_npc_misfire(npc,target)
	local dist = 	get_dist(npc,VEHICLE_PLAYER_CAR)
	while(dist > 60) do
		dist = 	get_dist(npc,VEHICLE_PLAYER_CAR)
		thread_yield()
	end	
	force_fire(npc, target, true) 
	attack(npc,LOCAL_PLAYER,true)
end

-- Roadblock triggers are placed after the roadblock. When they are hit, the roadblockers
-- realize that their trap failed. Those that are still alive get in their vehicles and
-- join the chase. Npcs and vehicles which can't join the chase are released because
-- the player may not be that far away.
function rn02_roadblock_trigger_hit(roadblock_name)
	
	local roadblock = CHASES_AND_AMBUSHES[roadblock_name]

	-- Have vehicles enter chase mode
	for vehicle,vehicle_data in pairs(roadblock["vehicles"]) do

		-- get the maximum number of vehicles that can chasing the players
		local max_vehicles	= rn02_get_parameter_value("MAX_CHASE_VEHICLES")

		-- have the vehicle attack if we won't excede the max
		if ( (Vehicles_attacking < max_vehicles) and (not vehicle_is_destroyed(vehicle)) ) then

			-- Set vehicle class specific parameters
			-- (speed override is set later or vehicles will begin driving immediately)
			if (vehicle_data["type"] == "car") then
				vehicle_max_speed(vehicle, rn02_get_parameter_value("CAR_CHASE_SPEED"))
			elseif (vehicle_data["type"] == "bike") then
				vehicle_max_speed(vehicle, rn02_get_parameter_value("BIKE_CHASE_SPEED"))
			end

			thread_new("rn02_roadblock_vehicle_attack",roadblock_name,vehicle)

		else

			-- If a vehicle can't attack, release it and its potentail passengers.
			on_vehicle_destroyed("", vehicle)
			release_to_world(vehicle)
			for i,passenger in pairs(vehicle_data["passengers"]) do
				if (not character_is_dead(passenger)) then
					release_to_world(passenger)
				end
			end
							
		end

	end

end

function rn02_roadblock_vehicle_attack(roadblock_name, vehicle)
	
	local vehicle_data = CHASES_AND_AMBUSHES[roadblock_name]["vehicles"][vehicle]

	-- See which of the potential passengers are still alive
	local passengers = {}
	local next_seat = 1
	for i,passenger in pairs(vehicle_data["passengers"]) do
		if (not character_is_dead(passenger)) then
			passengers[next_seat] = passenger
			next_seat = next_seat +1
		end
	end

	-- If someone was alive to enter the vehicle, have it attack
	if (next_seat ~= 1) then

		-- tell everyone to get in the vehicle
		vehicle_enter_group(passengers, vehicle)

		-- set some flags
		vehicle_set_crazy(vehicle,true)
		vehicle_set_use_short_cuts(vehicle, true)

		-- vroom vroom vroom
		vehicle_chase(vehicle, LOCAL_PLAYER, true, true, true)

		-- add callback to update count of vehicles attacking
		on_vehicle_destroyed("rn02_chase_vehicle_destroyed", vehicle)

		-- increment attacking count
		Vehicles_attacking = Vehicles_attacking + 1
	
	else
		
		-- If none of the potential passengers are alive, then release the vehicle
		release_to_world(vehicle)

	end

end

-- Tidy up a roadblock complication.
-- Releases npcs which aren't in a vehicle, and are far from the player(s) they were probably left behind.
function rn02_roadblock_cleanup(roadblock_name)
	for i,npc in pairs(CHASES_AND_AMBUSHES[roadblock_name]["on_foot"]) do
		if (not character_is_in_vehicle(npc)) then
			release_to_world(npc)
		end
	end
end

function rn02_chase_or_ambush_location_reached()
	Chase_or_ambush_sent = Chase_or_ambush_sent + 1
end

-- UTILITY FUNCTIONS ----------------------------------------

-- Get the value of the mission parameter.
--
-- parameter	Mission parameter whose value the function should return
--	i				If the parameter is a table, then i indexes the entry that should be returned
--
-- Returns mission paramater value.
function rn02_get_parameter_value(parameter, i)

	local return_val = nil

	-- Check for an overloaded value for coop missions.
	if (IN_COOP and return_val == nil) then
		if (i) then
			if (RN02_PARAMETERS["COOP_" .. parameter] ~= nil) then
				return_val = RN02_PARAMETERS["COOP_" .. parameter][i]
			end
		else
			return_val = RN02_PARAMETERS["COOP_" .. parameter]
		end
	end

	-- Get the standard value
	if (return_val == nil) then
		if (i) then
			if (RN02_PARAMETERS[parameter] ~= nil) then
				return_val = RN02_PARAMETERS[parameter][i]
			end
		else
			return_val = RN02_PARAMETERS[parameter]
		end
	end

	return return_val
end

-- release a script group after a brief delay
function rn02_delayed_release_to_world(...)
	delay(5)

	for i=1, arg.n, 1 do
		release_to_world(arg[i])
	end
end

-- add all entries of the tail table onto the end of the head table
function rn02_table_concat(head_table, tail_table)
	local offset = sizeof_table(head_table)
	for i, tail_entry_i in pairs(tail_table) do
		head_table[offset+i] = tail_entry_i
	end
end

function rn02_group_create_maybe_coop(group_always,group_coop, blocking)
	group_create(group_always, blocking)
	if (IN_COOP) then
		group_create(group_coop, blocking)
	end
end

function rn02_group_destroy_maybe_coop(group_always, group_coop)
	group_destroy(group_always)
	if (IN_COOP) then
		group_destroy(group_coop)
	end
end

function rn02_vehicle_infinite_mass()

	local car_has_infinite_mass = false

	-- The convertible should have infinite mass if the player is in the vehicle and it is
	-- near a mechanic.
	local function should_give_infinite_mass(player)
		if (not Player_in_convertible[player]) then
			return false
		end
		local new_repair_trigger = player_get_nearest_trigger_of_type("car mechanic", player, false)
		if (get_dist(player, new_repair_trigger) < MECHANIC_INFINITE_MASS_DIST) then
			return true
		end	
	end

	while(true) do

		thread_yield()

		local car_needs_infinite_mass = ( should_give_infinite_mass(LOCAL_PLAYER) or (IN_COOP and should_give_infinite_mass(REMOTE_PLAYER)) )

		if (car_needs_infinite_mass and (not car_has_infinite_mass)) then
			if(vehicle_exists(VEHICLE_PLAYER_CAR) and (not vehicle_is_destroyed(VEHICLE_PLAYER_CAR))) then
				vehicle_infinite_mass(VEHICLE_PLAYER_CAR, true)	
				car_has_infinite_mass = true
			end
		end

		if ( (not car_needs_infinite_mass) and car_has_infinite_mass) then
			if(vehicle_exists(VEHICLE_PLAYER_CAR) and (not vehicle_is_destroyed(VEHICLE_PLAYER_CAR))) then
				vehicle_infinite_mass(VEHICLE_PLAYER_CAR, false)	
				car_has_infinite_mass = false
			end
		end

	end

end

-- MISSION FAILURE FUNCTIONS --------------------------------

function rn02_vehicle_destroyed_failure()
	-- End the mission, convertible destroyed
	mission_end_failure("rn02", HELPTEXT_FAILURE_CONVERTIBLE)
end

function rn02_dealer_died_failure()
	mission_end_failure("rn02", HELPTEXT_FAILURE_DEALER_DIED)
end	

function rn02_fence_died_failure()
	-- End the mission, fence died
	mission_end_failure("rn02", HELPTEXT_FAILURE_FENCE)
end
