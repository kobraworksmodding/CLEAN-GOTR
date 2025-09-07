-- dlc05.lua
-- SR2 mission script

	MISSION_NAME						= "dlc05"

-- Debug Flags
	DEBUG_START_SECOND_OBJECTIVE  = false
	DEBUG_START_THIRD_OBJECTIVE	= false
	DEBUG_START_FOURTH_OBJECTIVE	= false

	DEBUG_SKIP_FIRST_DRIVE			= false
	DEBUG_SKIP_SECOND_DRIVE			= false
	DEBUG_NO_ATTACK_DELAYS			= false 	-- No delays between waves

	DEBUG_SKIP_SECOND_CHASE			= false

	DEBUG_TEST_RPG_GUYS				= false	-- No APCs, no enemy Tornado, reduced explosion damage
	DEBUG_NO_FAKE_RPGS				= false	-- Only fire RPGs when the guards can animate
	DEBUG_ALL_FAKE_RPGS				= false	-- Always use the fake navs

	DEBUG_TEST_COOP_DRIVE			= false
	DEBUG_SHOW_RPG_GUYS_FOR_TRUCK	= false
	DEBUG_COOP_TRUCK_INVULNERABLE	= false
	DEBUG_COOP_HELI_INVULNERABLE	= false
	DEBUG_COOP_NO_APCS				= false
	DEBUG_COOP_LOTSA_TIME			= false

-- Checkpoints
	CHECKPOINT_START					= MISSION_START_CHECKPOINT
	CHECKPOINT_SECOND_STOP			= "dlc05_checkpoint_second_stop"
	CHECKPOINT_PROTECT_TRUCKS		= "dlc05_checkpoint_protect_trucks"
	CHECKPOINT_PROTECT_TRUCKS_TWO	= "dlc05_checkpoint_protect_trucks_two"

-- Navpoints --
	NAVPOINT_START						= "dlc05_$nav_local_start"
	NAVPOINT_REMOTE_START			= "dlc05_$nav_remote_start"

	NAV_TRUCK01_ON_SHIP				= "dlc05_$nav_truck01_on_ship"
	NAV_TRUCK02_ON_SHIP				= "dlc05_$nav_truck02_on_ship"

	NAV_HELPER01						= {"dlc05_$n_helper_exit01", "dlc05_$n_helper_exit02", "dlc05_$n_helper_exit03", "dlc05_$n_helper_exit04"}

	NAV_PART02_START					= "dlc05_$local_part02_start"
	NAV_PART02_REMOTE_START			= "dlc05_$remote_part02_start"
	NAV_PART02_TRUCK_START			= "dlc05_$truck_part02_start"

	NAV_PART03_START					= "dlc05_$local_part03_start"
	NAV_PART03_REMOTE_START			= "dlc05_$remote_part03_start"
	NAV_PART03_TRUCK_START			= "dlc05_$truck_part03_start"

	NAV_PART04_START					= "dlc05_$nav_local_start"			-- Same as first start
	NAV_PART04_REMOTE_START			= "dlc05_$nav_remote_start"
	NAV_PART04_TRUCK_START			= "dlc05_$nav_part04_truck_start"

	NAV_DRIVER01						= "dlc05_$nav_driver01"

	NAV_OBJECTIVE03					= "dlc05_$nav_objective03"
	NAV_DRIVER_EXIT					= "dlc05_$nav_driver_exit"

	NAV_TORNADO_LANDING				= "dlc05_$nav_tornado_landing"

	NAV_SUPPORT_PILOT_STARTS		= {"dlc05_$nav_support_pilot01_start", "dlc05_$nav_support_pilot02_start"}
	NAV_SUPPORT_PILOT_ENDS			= {"dlc05_$nav_support_pilot01_end", "dlc05_$nav_support_pilot02_end"}

	NAV_PATH_HAZARD01_END			= "dlc05_$n203"
	NAV_PATH_HAZARD02_END			= "dlc05_$n055"
	NAV_PATH_HAZARD03_END			= "dlc05_$n182"

	NAV_ULTOR_TORNADO_START			= "dlc05_$nav_enemy_tornado_start"

	PARKING_SPOTS_TO_DISABLE		= {"parking_spots_$parking_891 (32)", "parking_spots_$parking_891 (45)", "parking_spots_$parking_891 (35)",
												"parking_spots_$parking_891 (36)", "parking_spots_$parking_891 (37)", "parking_spots_$parking_891 (38)"}

-- Movers --
	ATTACK02_DOOR01					= "dlc05_$attack02_door01"
	ATTACK02_DOOR02					= "dlc05_$attack02_door02"

-- Characters --
	HELPER_GROUP_01					= {"dlc05_$helper_ultor01", "dlc05_$helper_ultor02", "dlc05_$helper_ultor03", "dlc05_$helper_ultor04"}
	HELPER_GROUP_02					= {"dlc05_$helper_ultor05", "dlc05_$helper_ultor06", "dlc05_$helper_ultor07", "dlc05_$helper_ultor08"}

	HELPER_LIST							= {}		-- Constructed on startup

	SUPPORT_PILOTS						= {"dlc05_$support_pilot01", "dlc05_$support_pilot02"}

	DRIVER01								= "dlc05_$driver01"
	DRIVER02								= "dlc05_$driver02"
	DRIVER03								= "dlc05_$driver03"

	ULTOR_TORNADO_CREW01				= {"dlc05_$tornado01_crew01", "dlc05_$tornado01_crew02"}

-- Vehicles --
	HAZARD01								= "dlc05_$hazard01"
	HAZARD02								= "dlc05_$hazard02"
	HAZARD03								= "dlc05_$hazard03"
	HAZARD_TRUCKS						= {HAZARD01, HAZARD02, HAZARD03}

	HELPER_CAR01						= "dlc05_$helper_car01"

	ULTOR_TORNADO01					= "dlc05_$enemy_tornado"

	FRIENDLY_TORNADO					= "dlc05_$support_tornado"

	COOP_RETRIEVAL_CAR				= "dlc05_$coop_retrieval_car"

-- Groups --
	GROUP_HELPERS01					= "dlc05_$group_helpers01"
	GROUP_ATTACK01_GUYS01			= "dlc05_$group_atk01_guys01"
	GROUP_ATTACK01_GUYS02			= "dlc05_$group_atk01_guys02"
	GROUP_ATTACK01_GUYS03			= "dlc05_$group_atk01_guys03"
	GROUP_ATTACK01_HELIS				= "dlc05_$group_atk01_helis"
	GROUP_ATTACK01_SUVS				= "dlc05_$group_atk01_suvs"

	GROUP_HELPERS02					= "dlc05_$group_helpers02"
	GROUP_ATTACK02_GUYS01			= "dlc05_$group_atk02_guys01"
	GROUP_ATTACK02_GUYS02			= "dlc05_$group_atk02_guys02"
	GROUP_ATTACK02_SUVS				= "dlc05_$group_atk02_suvs"
	GROUP_ATTACK02_HELIS				= "dlc05_$group_atk02_helis"

	GROUP_DRIVER01						= "dlc05_$group_driver01"
	GROUP_DRIVER02						= "dlc05_$group_driver02"
	GROUP_DRIVER03						= "dlc05_$group_driver03"

	GROUP_TORNADO01					= "dlc05_$group_tornado01"

	GROUP_RPG_GUYS01					= "dlc05_$group_rpg_guys01"
	GROUP_RPG_GUYS02					= "dlc05_$group_rpg_guys02"
	GROUP_RPG_GUYS03					= "dlc05_$group_rpg_guys03"

	GROUP_RPG_GUYS_COOP01			= "dlc05_$group_rpg_guys_coop01"
	GROUP_RPG_GUYS_COOP02			= "dlc05_$group_rpg_guys_coop02"
	GROUP_RPG_GUYS_COOP03			= "dlc05_$group_rpg_guys_coop03"

	GROUP_START							= "dlc05_$group_start"
	GROUP_START_COOP					= "dlc05_$group_start_coop"
	GROUP_TRUCK02						= "dlc05_$group_truck02"
	GROUP_TRUCK03						= "dlc05_$group_truck03"

	GROUP_HELI_SUPPORT				= "dlc05_$group_heli_support"

	GROUP_COOP_RETRIEVAL_CAR		= "dlc05_$group_coop_retrieval_car"

-- Paths --
	PATH_HELPER01						= "dlc05_$path_helper01"
	PATH_HAZARD01						= "dlc05_$path_hazard01"
	PATH_HAZARD02						= "dlc05_$path_hazard02"
	PATH_HAZARD03						= "dlc05_$path_hazard03"
	PATH_APC01							= "dlc05_$path_apc01"
	PATH_APC02							= "dlc05_$path_apc02"
	PATH_APC03							= "dlc05_$path_apc03"
	PATH_ATTACK01_SUV					= "dlc05_$path_suv"
	PATH_ATTACK01_SUV2				= "dlc05_$path_suv2"
	PATH_ATTACK02_SUV					= "dlc05_$path_suv3"

	-- Need to split these up cuz of a heli bug in co-op
	PATH_ATTACK01_HELI01 =
	{
		"dlc05_$n064",
		"dlc05_$n065",
		"dlc05_$n066",
		"dlc05_$n067",
		"dlc05_$n068",
		"dlc05_$n069",
		"dlc05_$n070",
		"dlc05_$n071",
		"dlc05_$n072",
	}

	PATH_ATTACK01_HELI02 =
	{
		"dlc05_$n032",
		"dlc05_$n033",
		"dlc05_$n034",
		"dlc05_$n035",
		"dlc05_$n036",
		"dlc05_$n056",
		"dlc05_$n057",
		"dlc05_$n058",
	}

	PATH_ATTACK02_HELIS =
	{
		"dlc05_$n011",
		"dlc05_$n012",
		"dlc05_$n013",
		"dlc05_$n014",
		"dlc05_$n015",
		"dlc05_$n016",
		"dlc05_$n017",
		"dlc05_$n018",
		"dlc05_$n019",
		"dlc05_$n020",
		"dlc05_$n021",
	}

	PATH_SUPPORT01 =
	{
		"dlc05_$n151",
		"dlc05_$n152",
		"dlc05_$n153",
		"dlc05_$n154",
		"dlc05_$n155",
		"dlc05_$n156",
		"dlc05_$n157",
		"dlc05_$n158",
		"dlc05_$n159",
		"dlc05_$n160",
		"dlc05_$n167",
		"dlc05_$n168",
	}

	PATH_SUPPORT02 =
	{
		"dlc05_$n147",
		"dlc05_$n148",
		"dlc05_$n149",
		"dlc05_$n150",
		"dlc05_$n183",
		"dlc05_$n184",
		"dlc05_$n185",
		"dlc05_$n204",
		"dlc05_$n205",
		"dlc05_$n208",
	}

	PATH_SUPPORT03 =
	{
		"dlc05_$n161",
		"dlc05_$n162",
		"dlc05_$n163",
		"dlc05_$n037",
		"dlc05_$n038",
		"dlc05_$n093",
		"dlc05_$n094",
	}

-- Cutscenes --
	CUTSCENE_IN							= "dlc05-01"
	CUTSCENE_OUT						= "dlc05-02"

-- Personas --

-- Triggers --
	TRIG_OBJECTIVE01					= "dlc05_$trig_objective01"
	TRIG_OBJECTIVE02					= "dlc05_$trig_objective02"
	TRIG_TRUCK_END						= "dlc05_$trig_truck_end"

	TRIGGERS_TO_DISABLE				= {"cribs_sr2_city_$SHQ_clothes", "cribs_sr2_city_$SHQ_cash"}

-- Booleans --
	IN_COOP								= false

-- Text --


	TEXT_HUD_TRUCK_HEALTH					= "MSN_SS08_TRUCK_HEALTH" -- Truck Health



-- Conversations

	GRYPHON_PHONE_CONVERSATION =
	{
		-- We'll need to thin out the Masako...
		{"GRYPHON_DLC0202_PHONE_1", nil, 0.0},

		-- How the fuck we s'posed to do that?
		{"PLAYER_DLC0202_PHONE_1", LOCAL_PLAYER, 0.0},

		-- I leave the details up to you.
		{"GRYPHON_DLC0202_PHONE_2", nil, 0.0},

		-- Me against the whole army?
		{"PLAYER_DLC0202_PHONE_2", LOCAL_PLAYER, 0.0},

		-- You won't be alone....
		{"GRYPHON_DLC0202_PHONE_3", nil, 0.0},

		-- Well that'll be great for about 10 seconds...
		{"PLAYER_DLC0202_PHONE_3", LOCAL_PLAYER, 0.0},
	}

	GRYPHON_DIRECTIONS_CONVERSATION =
	{
		-- Impressive... Now get the remaining trucks down to the dock....
		{"GRYPHON_DLC0202_DIRECTIONS", nil, 0.0}
	}

	DEX_PHONE_CONVERSATION_1 =
	{
		-- You need to give up....
		{"DEX_DLC0202_CALL1_1", nil, 0.0},

		-- I'm having a little too much fun.
		{"PLAYER_DLC0202_DEXPHONE1_1", LOCAL_PLAYER, 0.0},

		-- Gryphon's not who you think he is.
		{"DEX_DLC0202_CALL1_2", nil, 0.0},

		-- He ain't you, and that's good enough for me.
		{"PLAYER_DLC0202_DEXPHONE1_2", LOCAL_PLAYER, 0.0},
	}

	DEX_PHONE_CONVERSATION_2 =
	{
		-- I've got you outnumbered.
		{"DEX_DLC0202_CALL2_1", nil, 0.0},

		-- Doesn't seem to be helping.
		{"PLAYER_DLC0202_DEXPHONE2_1", LOCAL_PLAYER, 0.0},

		-- Julius was right...
		{"DEX_DLC0202_CALL2_2", nil, 0.0},

		-- It's one of my many charms.
		{"PLAYER_DLC0202_DEXPHONE2_2", LOCAL_PLAYER, 0.0},

		-- You can't beat me.
		{"DEX_DLC0202_CALL2_3", nil, 0.0},

		-- Talk to me after I fuck up a few hundred more of your guys.
		{"PLAYER_DLC0202_DEXPHONE2_3", LOCAL_PLAYER, 0.0},
	}

	DEX_PHONE_CONVERSATION_3 =
	{
		-- You weren't gonna be needing this...
		{"PLAYER_DLC0202_DEXPHONE3_1", LOCAL_PLAYER, 0.0},

		-- Do you have any idea what you are doing?
		{"DEX_DLC0202_CALL3_1", nil, 0.0},

		-- Because I could just drop it off at your office if you did.
		{"PLAYER_DLC0202_DEXPHONE3_2", LOCAL_PLAYER, 0.0},

		-- This isn't some fucking backwards gang...
		{"DEX_DLC0202_CALL3_2", nil, 0.0},

		-- Maybe leave a boquet of flowers to go with it...
		{"PLAYER_DLC0202_DEXPHONE3_3", LOCAL_PLAYER, 0.0},

		-- You listening to me?
		{"DEX_DLC0202_CALL3_3", nil, 0.0},

		-- See you soon.
		{"PLAYER_DLC0202_DEXPHONE3_4", LOCAL_PLAYER, 0.0},
	}

-- Misc --

	PLAYER_LIST											= {LOCAL_PLAYER}	-- Remote player added on startup if needed

	PLAYER_SYNC	=
	{
		[LOCAL_PLAYER]									= SYNC_LOCAL,
		[REMOTE_PLAYER]								= SYNC_REMOTE,
	}

	OTHER_PLAYER =
	{
		[LOCAL_PLAYER]									= REMOTE_PLAYER,
		[REMOTE_PLAYER]								= LOCAL_PLAYER,
	}

	PLAYER_TIMER_INDEX	=
	{
		[LOCAL_PLAYER]									= 0,
		[REMOTE_PLAYER]								= 1,
	}

	TRUCK_PLAYER										= LOCAL_PLAYER
	HELI_PLAYER											= REMOTE_PLAYER		-- Can change for debugging purposes

	HAZARD_HEALTH_MULTIPLIER						= 1.75
	HAZARD_HEALTH_MULTIPLIER_COOP					= 1.50
	HAZARD_SPEED_OVERRIDE							= 20
	HAZARD_SPEED_OVERRIDE_COOP						= 40
	HAZARD_EXPLOSION_MULTIPLIER					= 0.33
	HAZARD_EXPLOSION_MULTIPLIER_COOP				= 0.5
	TRUCK_PARK_DIST_M									= 8
	VEHICLE_EXIT_DIST_M								= 125		-- Distance to players at which various NPCs will exit their vehicles
																		-- (to prevent weirdness if a player isn't close)
																		-- NOTE: chunk size is 270x480, so this is at most 135 (half smallest side)
	VEHICLE_EXIT_SPEED								= 0.5		-- Speed at which vehicles are considered stopped for characters to exit
	HELPER_REMINDER_DIST_M							= 60
	DIST_TO_TRIGGER_OBJECTIVE_M					= 30		-- Distance both players must be to a pump objective before the next part starts

	SUV_EXIT_DIST_M									= 8

	HELI_NODE_APPROACH_DIST_M						= 8
	HELI_LANDING_SPEED								= 4
	HELI_EXIT_DIST_M									= 4

	MASAKO_HITPOINT_MULTIPLIER						= 0.80
	MASAKO_CLOSE_RANGE_DIST_M						= 15		-- Distance at which a target is considered to be in close range
	MASAKO_TARGET_HELPER_CHANCE					= 0.50	-- Chance Masako will target a helper NPC instead of a player

	SUPPORT_ATTACK_DIST_M							= 90
	FRIENDLY_TORNADO_HITPOINT_MODIFIER			= 2
	FRIENDLY_TORNADO_EXPLOSION_MULT_COOP		= 0.5

	APC_HEALTH_MULTIPLIER							= 0.65
	CHASE_TRUCK_ABANDON_DIST_M						= 125		-- NOTE: chunk size is 270x480, so this is at most 135 (half smallest side)
	CHASE_TRUCK_ABANDON_TIME_S						= 15

	ATTACK01_MASAKO_LIST								= {}		-- Generated on startup
	ATTACK01_SEND_HELIS_DEATH_COUNT				= 2
	ATTACK01_SEND_SECOND_GROUP_DEATH_COUNT		= 5
	ATTACK01_SEND_SUVS_DEATH_COUNT				= 8
	ATTACK01_HELI_SPEED								= 30
	ATTACK01_HELI_PAUSE_S							= 6
	ATTACK01_SUV_SPEED_LIMIT						= 45
	ATTACK01_SUV_PAUSE_S								= 4

	ATTACK02_MASAKO_LIST								= {}		-- Generated on startup
	ATTACK02_SEND_SECOND_GROUND_DEATH_COUNT	= 10
	ATTACK02_SEND_HELIS_DEATH_COUNT				= 16
	ATTACK02_HELI_SPEED								= 35
	ATTACK02_HELI_PAUSE_S							= 4

	-- Single player RPG guy stuff
	CHASE_TRIGGER_TO_RPG_INFO						= {}		-- Generated on startup
	RPG_GUY_TO_RPG_INFO								= {}		-- Generated on startup
	RPG_GUY_MARK_DISTANCE_M							= 75
	DEFEND_TRUCKS_PART_ONE_MAX_RPG_GUYS			= 2
	DEFEND_TRUCKS_PART_TWO_MAX_RPG_GUYS			= 3
	DEFEND_TRUCKS_PART_THREE_MAX_RPG_GUYS		= 5

	-- Co-op chase stuff
	RETRIEVAL_CAR_DESPAWN_DIST_M					= 75
	RETRIEVAL_CAR_HITPOINT_MULTIPLIER			= 1.5
	RETRIEVAL_CAR_EXPLOSION_DAMAGE_MULTIPLIER	= 0.25
	RETRIEVAL_CAR_MAX_SPEED_OVERRIDE				= 60

	APC_MIN_SPAWN_DIST_M								= 30
	APC_MAX_SPAWN_DIST_M								= 200

	DEFEND_TRUCKS_DELIVER_TIME_S =
	{
		45,		-- Part 1
		120,		-- Part 2
		135,		-- Part 3
	}

	DEFEND_TRUCKS_MAX_NUM_APCS	=
	{
		2,			-- Part 1
		4,			-- Part 2
		6,			-- Part 3
	}

	DEFEND_TRUCKS_APC_DELAY_S =
	{
		7,			-- Part 1
		5,			-- Part 2
		2,			-- Part 3
	}

	RETRIEVAL_MAX_NUM_APCS =
	{
		2,			-- Between 1 and 2
		3,			-- Between 2 and 3
	}
	
	RETRIEVAL_APC_DELAY_S =
	{
		6,			-- Between 1 and 2
		3,			-- Between 2 and 3
	}	
	
	DELIVER_TRUCK_REMINDER_TIME_LIST				= {60, 30}

-- Ignore This Stuff --
	GROUP_MYSTERY						= "dlc05_$group_mystery"
	V_UFO									= "dlc05_$v_ufo"
	C_ALIEN								= "dlc05_$c_alien"
	MYSTERY_PATH = {
		"dlc05_$n000",
		"dlc05_$n001",
		"dlc05_$n002",
		"dlc05_$n003",
		"dlc05_$n004",
		"dlc05_$n005",
		"dlc05_$n006",
		"dlc05_$n007",
		"dlc05_$n008",
		"dlc05_$n009",
		"dlc05_$n010",
	}

-- Globals
	Masako_group_dead					= 0
	Masako_attack_threads			= {}
	Suv_exit_threads					= {}
	Heli_dropoff_threads				= {}
	Heli_passengers_not_exited		= {}
	Heli_npc_threads					= {}
	Support_fly_threads				= {}
	Vehicle_chase_threads			= {}
	Rpg_guy_fire_threads				= {}
	Rpg_guy_fired_rocket				= {}
	Rpg_guy_fov_mark_thread			= INVALID_THREAD_HANDLE
	Truck_abandon_thread				= INVALID_THREAD_HANDLE
	Truck_driver_exit_threads		= {}
	Objective_three_phone_thread	= INVALID_THREAD_HANDLE
	Truck_player_time_thread		= INVALID_THREAD_HANDLE
	Retrieval_car_reset_thread		= INVALID_THREAD_HANDLE
	Coop_chase_apcs_thread			= INVALID_THREAD_HANDLE
	Coop_chase_apc_spawn_thread	= INVALID_THREAD_HANDLE
	Coop_chase_apcs_active			= {}
	Coop_truck_spawn_threads		= {}

-----------------------
-- Mission Functions --
-----------------------

function dlc05_start( checkpoint_name, is_restart )

	if DEBUG_START_SECOND_OBJECTIVE and (checkpoint_name == CHECKPOINT_START) then
		checkpoint_name = CHECKPOINT_SECOND_STOP
	end

	if DEBUG_START_THIRD_OBJECTIVE and ((checkpoint_name == CHECKPOINT_START) or (checkpoint_name == CHECKPOINT_SECOND_STOP)) then
		checkpoint_name = CHECKPOINT_PROTECT_TRUCKS
	end

	if DEBUG_START_FOURTH_OBJECTIVE then
		checkpoint_name = CHECKPOINT_PROTECT_TRUCKS_TWO
	end

	mission_start_fade_out()

	dlc05_initialize_checkpoint( checkpoint_name, is_restart )

end

function dlc05_initialize_common_pre_cutscene()

	-- Get Your Fur On.
	set_mission_author("Bryan Dillow and Sherwin Tam")

	IN_COOP = coop_is_active()

	-- Update the player list
	if IN_COOP then
		PLAYER_LIST[2] = REMOTE_PLAYER
	end

	if dlc05_is_coop_truck_chase() then
		TRUCK_PLAYER = LOCAL_PLAYER
		HELI_PLAYER = REMOTE_PLAYER
	else
		HELI_PLAYER = LOCAL_PLAYER
		TRUCK_PLAYER = REMOTE_PLAYER
	end

	if DEBUG_TEST_RPG_GUYS then
		HAZARD_EXPLOSION_MULTIPLIER = 0.2
	end

	-- Need to disable the triggers in the crib for the cutscene
	for i, trigger in pairs( TRIGGERS_TO_DISABLE ) do
		trigger_enable( trigger, false )
	end

	-- Disabling problematic parking spots
	for i, spot in pairs( PARKING_SPOTS_TO_DISABLE ) do
		parking_spot_enable( spot, false )
	end

	local idx = 1

	-- Construct the complete helper list
	for i, npc in pairs( HELPER_GROUP_01 ) do
		HELPER_LIST[idx] = npc
		idx = idx + 1
	end

	for i, npc in pairs( HELPER_GROUP_02 ) do
		HELPER_LIST[idx] = npc
		idx = idx + 1
	end

	-- Construct a list of the Attack01 Masako to possibly kill
	idx = 1

	for i, info in pairs( TARGET_ONE_GROUND_GUY_INFOS ) do
		for j, npc in pairs( info.npcs ) do
			ATTACK01_MASAKO_LIST[idx] = npc
			idx = idx + 1
		end
	end

	for i, info in pairs( TARGET_ONE_HELI_DROPOFF_INFOS ) do
		for j, npc in pairs( info.occupants ) do
			-- Don't include the pilot
			if j > 1 then
				ATTACK01_MASAKO_LIST[idx] = npc
				idx = idx + 1
			end
		end
	end

	for i, info in pairs( TARGET_ONE_SUV_INFOS ) do
		for j, npc in pairs( info.occupants ) do
			ATTACK01_MASAKO_LIST[idx] = npc
			idx = idx + 1
		end
	end

	-- Construct a list of the Attack02 Masako to possibly kill
	idx = 1

	for i, info in pairs( TARGET_TWO_INITIAL_MASAKO_SUV_INFOS ) do
		for j, npc in pairs( info.occupants ) do
			ATTACK02_MASAKO_LIST[idx] = npc
			idx = idx + 1
		end
	end

	for i, info in pairs( TARGET_TWO_MASAKO_GROUND_GUY_INFOS ) do
		for j, npc in pairs( info.npcs ) do
			ATTACK02_MASAKO_LIST[idx] = npc
			idx = idx + 1
		end
	end

	for i, info in pairs( TARGET_TWO_HELI_DROPOFF_INFOS ) do
		for j, npc in pairs( info.occupants ) do
			-- Don't include the pilot
			if j > 1 then
				ATTACK02_MASAKO_LIST[idx] = npc
				idx = idx + 1
			end
		end
	end

	-- Setup the chase trigger and rpg guy to info mappings
	for i, info in pairs( DEFEND_TRUCKS_PART_ONE_RPG_GUY_INFOS ) do
		CHASE_TRIGGER_TO_RPG_INFO[info.fire_trigger] = info
		RPG_GUY_TO_RPG_INFO[info.npc] = info
	end

	for i, info in pairs( DEFEND_TRUCKS_PART_TWO_RPG_GUY_INFOS ) do
		CHASE_TRIGGER_TO_RPG_INFO[info.fire_trigger] = info
		RPG_GUY_TO_RPG_INFO[info.npc] = info
	end

	for i, info in pairs( DEFEND_TRUCKS_PART_THREE_RPG_GUY_INFOS ) do
		CHASE_TRIGGER_TO_RPG_INFO[info.fire_trigger] = info
		RPG_GUY_TO_RPG_INFO[info.npc] = info
	end

end

function dlc05_initialize_common_post_cutscene()

	-- Eliminate existing peds and vehicles
	spawning_pedestrians( false )
	spawning_vehicles( false )

	-- We're going to fake notoriety; we don't want ambient Ultor spawns hunting you
	notoriety_set( "Police", 0 )
	notoriety_set_min( "Police", 0 )
	notoriety_set_max( "Police", 0 )

	notoriety_force_no_spawn( "Police", true )
	notoriety_force_no_spawn( "Ultor", true )
	set_cops_shooting_from_vehicles( true )
	spawning_allow_cop_ambient_spawns( false )
	roadblocks_enable( false )

	-- Set up the first truck
	group_create( GROUP_START, true )
	dlc05_prep_truck_initial( HAZARD01 )

end

function dlc05_initialize_checkpoint( checkpoint, is_restart )

	dlc05_initialize_common_pre_cutscene()

	-- Apparently playing the cutscene resets the spawning systems, so we need to play it before anything else...
	if checkpoint == CHECKPOINT_START then
		--if is_restart or DEBUG_SKIP_FIRST_DRIVE then
			teleport_coop( NAVPOINT_START, NAVPOINT_REMOTE_START )
		--else
			--cutscene_play( CUTSCENE_IN, {}, {NAVPOINT_START, NAVPOINT_REMOTE_START}, false )
	   --end
	end

	dlc05_initialize_common_post_cutscene()

	if checkpoint == CHECKPOINT_START then
		if IN_COOP then
			group_create( GROUP_START_COOP, true )
		end

		-- Create the token Gryphon helpers
		group_create( GROUP_HELPERS01, true )

		for i, npc in pairs( HELPER_GROUP_01 ) do
			set_unrecruitable_flag( npc, true )
			on_take_damage( "dlc05_ultor_goon_got_hurt", npc )
			vehicle_enter_teleport( npc, HELPER_CAR01, i-1 )
		end

		thread_new( "dlc05_helpers_get_goin" )

		-- Silently load the attack groups
		group_create_hidden( GROUP_ATTACK01_GUYS01 )
		group_create_hidden( GROUP_ATTACK01_GUYS02 )
		group_create_hidden( GROUP_ATTACK01_GUYS03 )

		if DEBUG_SKIP_FIRST_DRIVE then
			-- Move guys directly to the first trigger
			teleport_coop( NAV_PART02_START, NAV_PART02_REMOTE_START )
			teleport_vehicle( HAZARD01, NAV_PART02_TRUCK_START )

			on_vehicle_enter( "dlc05_enter_hazard01", HAZARD01 )
			on_vehicle_exit( "dlc05_exit_hazard01", HAZARD01 )

			-- Turn on the truck health hud
			damage_indicator_on( 0, HAZARD01, 0.0, TEXT_HUD_TRUCK_HEALTH )

			-- Truck is unjackable for now
			set_unjackable_flag( HAZARD01, true )

			thread_new( "dlc05_attack01" )
		else
			-- Mark the hazard truck
			marker_add_vehicle( HAZARD01, MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE )

			mission_help_table("TEXT_OBJECTIVE_GET_IN_TRUCK", SYNC_ALL)
			on_vehicle_enter( "dlc05_enter_hazard01_objective01_first", HAZARD01 )

			-- Start the thread that detects when to remind players about Ultor friendlies
			thread_new( "dlc05_helpers_friendly_reminder", TRIG_OBJECTIVE01 )
		end

	elseif checkpoint == CHECKPOINT_SECOND_STOP then

		if DEBUG_SKIP_SECOND_DRIVE then
			teleport_coop( NAV_PART03_START, NAV_PART03_REMOTE_START )
			teleport_vehicle( HAZARD01, NAV_PART03_TRUCK_START )
		else
			teleport_coop( NAV_PART02_START, NAV_PART02_REMOTE_START )
			teleport_vehicle( HAZARD01, NAV_PART02_TRUCK_START )
		end

		-- Mark the hazard truck
		marker_add_vehicle( HAZARD01, MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE )

		-- Health indicator should already be on
		damage_indicator_on( 0, HAZARD01, 0.0, TEXT_HUD_TRUCK_HEALTH )

		-- Notoriety set before
		hud_set_fake_notoriety( "Police", true, 2 )

		if not DEBUG_SKIP_SECOND_DRIVE then
			-- Start the thread that detects when to remind players about Ultor friendlies
			thread_new( "dlc05_helpers_friendly_reminder", TRIG_OBJECTIVE02 )
		end

		dlc05_intermission_1()

	elseif checkpoint == CHECKPOINT_PROTECT_TRUCKS then
		teleport_vehicle( HAZARD01, NAV_PART03_TRUCK_START )
		teleport_coop( NAV_PART03_START, NAV_PART03_REMOTE_START )

		if not DEBUG_TEST_COOP_DRIVE then
			dlc05_setup_heli_player()
		end

		if dlc05_is_coop_truck_chase() then
			dlc05_setup_truck_player()
		end

		-- Health indicator should already be on
		damage_indicator_on( 0, HAZARD01, 0.0, TEXT_HUD_TRUCK_HEALTH )

		-- Notoriety set before
		hud_set_fake_notoriety( "Police", true, 3 )

		dlc05_intermission_2()

	elseif checkpoint == CHECKPOINT_PROTECT_TRUCKS_TWO then
		teleport_vehicle( HAZARD01, NAV_TRUCK01_ON_SHIP )
		teleport_coop( NAV_PART04_START, NAV_PART04_REMOTE_START )

		-- Drop your homies
		party_dismiss_all()
		party_set_recruitable( false )

		if not DEBUG_TEST_COOP_DRIVE then
			dlc05_setup_heli_player()
		end

		-- Notoriety set before
		hud_set_fake_notoriety( "Police", true, 4 )

		-- Last Dex call
		thread_new( "dlc05_setup_cellphone_conversation", DEX_PHONE_CONVERSATION_3, true )

		if dlc05_is_coop_truck_chase() then
			local heli_sync = PLAYER_SYNC[HELI_PLAYER]
			local truck_sync = PLAYER_SYNC[TRUCK_PLAYER]

			-----------------------
			-- BOTH PLAYER STUFF --
			-----------------------

			local max_num, apc_delay

			if DEBUG_SKIP_SECOND_CHASE then
				-- Add the RPG guys
				group_create_hidden( GROUP_RPG_GUYS02 )
				group_create_hidden( GROUP_RPG_GUYS_COOP02 )
				dlc05_setup_all_coop_rpg_guys( COOP_RPG_GUYS02 )

				-- Start the retrieval chase
				max_num = RETRIEVAL_MAX_NUM_APCS[2]
				apc_delay = RETRIEVAL_APC_DELAY_S[2]
			else
				-- Add some of the RPG guys (not too close)
				group_create_hidden( GROUP_RPG_GUYS01 )
				group_create_hidden( GROUP_RPG_GUYS_COOP01 )
				dlc05_setup_all_coop_rpg_guys( COOP_RPG_GUYS01_CHECKPOINT )

				-- Start the retrieval chase
				max_num = RETRIEVAL_MAX_NUM_APCS[1]
				apc_delay = RETRIEVAL_APC_DELAY_S[1]
			end

			thread_kill( Coop_chase_apcs_thread )
			Coop_chase_apcs_thread = thread_new( "dlc05_setup_coop_chase_apcs", max_num, apc_delay )

			-----------------------
			-- HELI PLAYER STUFF --
			-----------------------

			if DEBUG_SKIP_SECOND_CHASE then
				mission_help_table("TEXT_OBJECTIVE_PROTECT_THIRD_TRUCK", nil, nil, heli_sync )
			else
				mission_help_table("TEXT_OBJECTIVE_PROTECT_SECOND_TRUCK", nil, nil, heli_sync )
			end

			-- Mark the truck player for the heli
			marker_add_player( TRUCK_PLAYER, MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE, heli_sync )

			thread_new( "dlc05_delayed_rpg_guy_message" )

			------------------------
			-- TRUCK PLAYER STUFF --
			------------------------

			-- Make the retrieval car
			Retrieval_car_reset_thread = thread_new( "dlc05_reset_coop_retrieval_car" )

			-- Wait for the retrieval car to come in
			while not thread_check_done( Retrieval_car_reset_thread ) do
				thread_yield()
			end

			-- Let the player enter stuff normally
			set_player_can_enter_exit_vehicles( TRUCK_PLAYER, true )

			-- Make the retrieval car vulnerable
			turn_vulnerable( COOP_RETRIEVAL_CAR )

			if DEBUG_SKIP_SECOND_CHASE then
				mission_help_table("TEXT_OBJECTIVE_GET_THIRD_TRUCK", nil, nil, truck_sync )

				-- Start the retrieval of the next truck
				dlc05_truck_player_timer_start( DEFEND_TRUCKS_DELIVER_TIME_S[3] )

				-- Start the spawn thread
				Coop_truck_spawn_threads[HAZARD03] = thread_new( "dlc05_spawn_coop_chase_truck", HAZARD03_COOP_INFO )

				-- Mark the truck's location
				marker_add_vehicle( HAZARD03, MINIMAP_ICON_PROTECT_ACQUIRE, "", truck_sync )
				mission_waypoint_add( HAZARD03, truck_sync )
			else
				mission_help_table("TEXT_OBJECTIVE_GET_SECOND_TRUCK", nil, nil, truck_sync )

				-- Start the retrieval of the next truck
				dlc05_truck_player_timer_start( DEFEND_TRUCKS_DELIVER_TIME_S[2] )

				-- Start the spawn thread
				Coop_truck_spawn_threads[HAZARD02] = thread_new( "dlc05_spawn_coop_chase_truck", HAZARD02_COOP_INFO )

				-- Mark the truck's location
				marker_add_navpoint( HAZARD02, MINIMAP_ICON_PROTECT_ACQUIRE, "", truck_sync )
				mission_waypoint_add( HAZARD02, truck_sync )
			end

			-- Can't die
			thread_new( "dlc05_truck_player_death_check" )

		else
			-- Make the other trucks
			group_create( GROUP_TRUCK02, true )
			dlc05_prep_truck_initial( HAZARD02 )

			group_create( GROUP_TRUCK03, true )
			dlc05_prep_truck_initial( HAZARD03 )

			-- Create the first truck driver (will exit immediately)
			group_create( GROUP_DRIVER01, true )
			turn_invulnerable( DRIVER01 )
			set_unrecruitable_flag( DRIVER01, true )

			vehicle_enter_teleport( DRIVER01, HAZARD01, 0, true, true )

			thread_new( "dlc05_end_chase_start_two" )
		end

	end

	mission_start_fade_in()

	mission_help_table("TEXT_WIP_DISCLAIMER", SYNC_ALL )

end

function dlc05_prep_truck_initial( truck )

	-- Failure callbacks on all the trucks
	on_vehicle_destroyed( "TEXT_FAIL_TRUCK_DESTROYED", truck )

	-- Damage warnings on all the trucks
	on_damage( "TEXT_HELP_TRUCK_DAMAGED", truck, 0.5 )

	-- Set the hit points on the trucks
	local multiplier = dlc05_is_coop_truck_chase() and HAZARD_HEALTH_MULTIPLIER_COOP or HAZARD_HEALTH_MULTIPLIER
	set_max_hit_points( truck, get_max_hit_points( truck ) * multiplier, true )

	vehicle_set_explosion_damage_multiplier( truck, 1.0 )
	vehicle_ignore_repulsors( truck, true )
	vehicle_suppress_npc_exit( truck, true )
	vehicle_disable_flee( truck, true )

	if truck == HAZARD01 then
		-- Make sure hazard01 is enterable and damage-able
		set_unjackable_flag( truck, false )
		turn_vulnerable( truck )
		vehicle_infinite_mass( truck, false )
		vehicle_prevent_explosion_fling( truck, false )
	else
		-- The other trucks start invulnerable and unmoveable
		set_unjackable_flag( truck, true )
		turn_invulnerable( truck )
		vehicle_infinite_mass( truck, true )
		vehicle_prevent_explosion_fling( truck, true )
	end

end

function dlc05_truck_damaged( truck )

	-- See which message we're throwing
	local current_hp = get_current_hit_points( truck )
	local max_hp = get_max_hit_points( truck )

	if current_hp / max_hp <= 0.25 then
		mission_help_table_nag("TEXT_HELP_TRUCK_NEAR_DEAD")

		-- Don't call it again
		on_damage( "", truck, 0.0 )
	else
		mission_help_table_nag("TEXT_HELP_TRUCK_DAMAGED")

		-- Call it again at 25%
		on_damage( "dlc05_truck_damaged", truck, 0.25 )
	end

end

------------------------------------------------------------------
-- These functions handle entering and exiting the hazard truck --
------------------------------------------------------------------

function dlc05_enter_hazard01_common( human )

	if not character_is_player( human ) then
		return false
	end

	marker_remove_vehicle( HAZARD01 )

	return true

end

function dlc05_exit_hazard01_common( human )

	if not character_is_player( human ) then
		return false
	end

	-- Check if any player is in the truck
	for i, player in pairs( PLAYER_LIST ) do
		if character_is_in_vehicle( player, HAZARD01 ) then
			return false
		end
	end

	-- Mark the truck if there's no players in the truck
	marker_add_vehicle( HAZARD01, MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE )

	return true

end

-- Triggered the first time you enter the truck
function dlc05_enter_hazard01_objective01_first( human )

	if not dlc05_enter_hazard01_common( human ) then
		return
	end

	-- Turn on the truck health hud
	damage_indicator_on( 0, HAZARD01, 0.0, TEXT_HUD_TRUCK_HEALTH )

	-- Replace the callback with the standard enter callback
	on_vehicle_enter( "dlc05_enter_hazard01_objective01", HAZARD01 )
	on_vehicle_exit( "dlc05_exit_hazard01_objective01", HAZARD01 )

	-- Mark the first objective
	marker_add_trigger( TRIG_OBJECTIVE01, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION )
	mission_waypoint_add( TRIG_OBJECTIVE01 )
	trigger_enable( TRIG_OBJECTIVE01, true )
	on_trigger( "dlc05_objective01_trigger_reached", TRIG_OBJECTIVE01 )

	mission_help_table("TEXT_OBJECTIVE_GO_TO_FIRST_STOP")

	-- Start the first phone conversation with Gryphon
	thread_new( "dlc05_setup_cellphone_conversation", GRYPHON_PHONE_CONVERSATION, true )

end

function dlc05_enter_hazard01_objective01( human )

	if not dlc05_enter_hazard01_common( human ) then
		return
	end

	-- Direct the player back to the trigger
	mission_waypoint_add( TRIG_OBJECTIVE01 )
	trigger_enable( TRIG_OBJECTIVE01, true )
	mission_help_table_nag("TEXT_OBJECTIVE_GO_TO_FIRST_STOP")

end

function dlc05_exit_hazard01_objective01( human )

	if not dlc05_exit_hazard01_common( human ) then
		return
	end

	-- Shut off the waypoint and bug them about getting back in
	mission_waypoint_remove()
	trigger_enable( TRIG_OBJECTIVE01, false )
	mission_help_table_nag("TEXT_HELP_REENTER_TRUCK")

end

function dlc05_enter_hazard01_objective02_first( human )

	if not dlc05_enter_hazard01_common( human ) then
		return
	end

	-- Replace the callback with the standard enter callback
	on_vehicle_enter( "dlc05_enter_hazard01_objective02", HAZARD01 )
	on_vehicle_exit( "dlc05_exit_hazard01_objective02", HAZARD01 )

	-- Mark the second objective
	marker_add_trigger( TRIG_OBJECTIVE02, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION )
	mission_waypoint_add( TRIG_OBJECTIVE02 )
	trigger_enable( TRIG_OBJECTIVE02, true )
	on_trigger( "dlc05_objective02_trigger_reached", TRIG_OBJECTIVE02 )

	mission_help_table("TEXT_OBJECTIVE_GO_TO_SECOND_STOP")

end

function dlc05_enter_hazard01_objective02( human )

	if not dlc05_enter_hazard01_common( human ) then
		return
	end

	-- Direct the player back to the trigger
	mission_waypoint_add( TRIG_OBJECTIVE02 )
	trigger_enable( TRIG_OBJECTIVE02, true )
	mission_help_table_nag("TEXT_OBJECTIVE_GO_TO_SECOND_STOP")

end

function dlc05_exit_hazard01_objective02( human )

	if not dlc05_exit_hazard01_common( human ) then
		return
	end

	-- Shut off the waypoint and bug them about getting back in
	mission_waypoint_remove()
	trigger_enable( TRIG_OBJECTIVE02, false )
	mission_help_table_nag("TEXT_HELP_REENTER_TRUCK")

end

--------------------------------------------------------------
-- Get the Helper Group to the First Pump and into position --
--------------------------------------------------------------

function dlc05_helpers_get_goin()

	-- Don't go anywhere if the driver's dead
	if dlc05_vehicle_is_active( HELPER_CAR01 ) and dlc05_character_is_active( HELPER_GROUP_01[1] ) then
		vehicle_pathfind_to( HELPER_CAR01, PATH_HELPER01, true, true )
	end

	for i, npc in pairs( HELPER_GROUP_01 ) do
		thread_new( "dlc05_helpers_get_out",  npc, NAV_HELPER01[i] )
	end

end

function dlc05_helpers_get_out( helper, nav )

	-- Don't do squat until a player is close; NPC ghosting is buggy and won't properly exit these guys if they're ghosted
	local dist, player
	repeat
		dist, player = get_dist_closest_player_to_object( helper, PLAYER_LIST )
		thread_yield()
	until not dlc05_character_is_active( helper ) or (dist < VEHICLE_EXIT_DIST_M)

	if not dlc05_character_is_active( helper ) then
		return
	end

	vehicle_exit( helper )

	repeat
		thread_yield()
	until not dlc05_character_is_active( helper ) or not character_is_in_vehicle( helper )

	if not dlc05_character_is_active( helper ) then
		return
	end

	move_to( helper, nav, 2, true, true )
	npc_unholster_best_weapon( helper )

end

function dlc05_helpers_friendly_reminder( dist_object )

	local dist, player
	repeat
		dist, player = get_dist_closest_player_to_object( dist_object, PLAYER_LIST )
		delay( 0.25 )
	until dist < HELPER_REMINDER_DIST_M

	mission_help_table_nag("TEXT_HELP_FRIENDLY_ULTOR")

end

-------------------------------
-- The Defense of Target One --
-------------------------------

TARGET_ONE_GROUND_GUY_INFOS =
{
	{
		npcs								= {"dlc05_$c_ground1_01", "dlc05_$c_ground1_02", "dlc05_$c_ground1_03", "dlc05_$c_ground1_04",
												"dlc05_$c_ground1_05", "dlc05_$c_ground1_06", "dlc05_$c_ground1_07"},
		navs								= {"dlc05_$n_ground1_01", "dlc05_$n_ground1_02", "dlc05_$n_ground1_03", "dlc05_$n_ground1_04",
												"dlc05_$n_ground1_05", "dlc05_$n_ground1_06", "dlc05_$n_ground1_07"},
	},
	{
		npcs								= {"dlc05_$c_ground2_01", "dlc05_$c_ground2_02", "dlc05_$c_ground2_03", "dlc05_$c_ground2_04"},
		navs								= {"dlc05_$n_ground2_01", "dlc05_$n_ground2_02", "dlc05_$n_ground2_03", "dlc05_$n_ground2_04"},
	},
	{
		npcs								= {"dlc05_$c_ground3_01", "dlc05_$c_ground3_02", "dlc05_$c_ground3_03", "dlc05_$c_ground3_04"},
		navs								= {"dlc05_$n_ground3_01", "dlc05_$n_ground3_02", "dlc05_$n_ground3_03", "dlc05_$n_ground3_04"},
	}
}

TARGET_ONE_SUV_INFOS =
{
	{
		suv								= "dlc05_$suv01",
		occupants						= {"dlc05_$suv01_crew01", "dlc05_$suv01_crew02", "dlc05_$suv01_crew03", "dlc05_$suv01_crew04"},
		speed_limit						= ATTACK01_SUV_SPEED_LIMIT,
		path								= PATH_ATTACK01_SUV,
		exit_nav							= "dlc05_$n_suv01_exit",
	},
	{
		suv								= "dlc05_$suv02",
		occupants						= {"dlc05_$suv02_crew01", "dlc05_$suv02_crew02", "dlc05_$suv02_crew03", "dlc05_$suv02_crew04"},
		speed_limit						= ATTACK01_SUV_SPEED_LIMIT,
		delay								= ATTACK01_SUV_PAUSE_S,
		path								= PATH_ATTACK01_SUV2,
		exit_nav							= "dlc05_$n_suv02_exit",
	},
	{
		suv								= "dlc05_$suv03",
		occupants						= {"dlc05_$suv03_crew01", "dlc05_$suv03_crew02", "dlc05_$suv03_crew03", "dlc05_$suv03_crew04"},
		speed_limit						= ATTACK01_SUV_SPEED_LIMIT,
		delay								= ATTACK01_SUV_PAUSE_S * 2,
		path								= PATH_ATTACK01_SUV,
		exit_nav							= "dlc05_$n_suv03_exit",
	},
	{
		suv								= "dlc05_$suv04",
		occupants						= {"dlc05_$suv04_crew01", "dlc05_$suv04_crew02", "dlc05_$suv04_crew03", "dlc05_$suv04_crew04"},
		speed_limit						= ATTACK01_SUV_SPEED_LIMIT,
		delay								= ATTACK01_SUV_PAUSE_S * 3,
		path								= PATH_ATTACK01_SUV2,
		exit_nav							= "dlc05_$n_suv04_exit",
	},
}

function dlc05_objective01_trigger_reached( triggerer, trigger )

	-- Only triggers if the truck is being driven
	if not character_is_player( triggerer ) or not character_is_in_vehicle( triggerer, HAZARD01 ) then
		return
	end

	-- Disable the trigger
	marker_remove_trigger( TRIG_OBJECTIVE01 )
	trigger_enable( TRIG_OBJECTIVE01, false )
	mission_waypoint_remove()

	-- Remove the callbacks (prevents marker shenanigans)
	on_vehicle_enter( "", HAZARD01 )
	on_vehicle_exit( "", HAZARD01 )

	-- Kick players out
	marker_remove_vehicle( HAZARD01 )
	dlc05_stop_truck_and_kick_out_players( HAZARD01 )

	thread_new( "dlc05_delay_thread_until_players_near_nav", trigger, "dlc05_attack01" )

end

function dlc05_attack01()

	-- Mark the hazard truck
	marker_add_vehicle( HAZARD01, MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE )

	-- Reset the counter
	Masako_group_dead = 0

	mission_help_table("TEXT_OBJECTIVE_DEFEND_FIRST_STOP")

	-- Ignore this
	thread_new( "dlc05_mystery" )

	-- Okay, you may pay attention again.
	for i, info in pairs( TARGET_ONE_GROUND_GUY_INFOS ) do
		for j, npc in pairs( info.npcs ) do
			-- Assign their death callback
			on_death( "dlc05_masako_death", npc )

			-- Adjust Masako HP
			set_max_hit_points( npc, get_max_hit_points( npc ) * MASAKO_HITPOINT_MULTIPLIER, true)
		end
	end

	-- Send the first two groups out
	group_show( GROUP_ATTACK01_GUYS01 )
	group_show( GROUP_ATTACK01_GUYS02 )
	for i = 1, 2 do
		-- Send the first two groups to their navpoints to attack
		local info = TARGET_ONE_GROUND_GUY_INFOS[i]

		for j, npc in pairs( info.npcs ) do
			thread_new( "dlc05_add_masako_to_assault", npc, info.navs[j] )
		end
	end

	-- Pump up perceived notoriety
	hud_set_fake_notoriety( "Police", true, 2 )

	-- Spin while we wait for enough kills
	while (Masako_group_dead < ATTACK01_SEND_HELIS_DEATH_COUNT) and not DEBUG_NO_ATTACK_DELAYS do
		thread_yield()
	end

	dlc05_attack01_heli_dropoff()

	while (Masako_group_dead < ATTACK01_SEND_SECOND_GROUP_DEATH_COUNT) and not DEBUG_NO_ATTACK_DELAYS do
		thread_yield()
	end

	dlc05_attack01_send_second_wave()

	while (Masako_group_dead < ATTACK01_SEND_SUVS_DEATH_COUNT) and not DEBUG_NO_ATTACK_DELAYS do
		thread_yield()
	end

	dlc05_attack01_send_suvs()

	if not DEBUG_NO_ATTACK_DELAYS then
		-- Wait for a bit before putting up the objective interface
		delay( 45 )
	end

	-- Start the thread for Masako cleanup
	local masako_cleanup_thread = thread_new( "dlc05_do_kill_remaining_masako", ATTACK01_MASAKO_LIST )

	while not thread_check_done( masako_cleanup_thread ) do
		thread_yield()
	end

	dlc05_objective01_completed()

end

function dlc05_objective01_completed()

	-- release the leftovers.  notoriety should keep them fighting but we dont need to deal with them anymore.
	release_to_world( GROUP_ATTACK01_GUYS01 )
	release_to_world( GROUP_ATTACK01_GUYS02 )
	release_to_world( GROUP_ATTACK01_SUVS )
	--release_to_world( GROUP_ATTACK01_HELIS )	-- Can't release these, has helis

	mission_help_table_nag("TEXT_OBJECTIVE_FIRST_STOP_DONE")

	delay( 3 )

	mission_set_checkpoint( CHECKPOINT_SECOND_STOP, true )

	-- get the players over to the next location.
	dlc05_intermission_1()

end

function dlc05_attack01_send_second_wave()

	local info = TARGET_ONE_GROUND_GUY_INFOS[3]

	group_show( GROUP_ATTACK01_GUYS03 )
	for i, npc in pairs( info.npcs ) do
		thread_new( "dlc05_add_masako_to_assault", npc, info.navs[i] )
	end

end

function dlc05_attack01_send_suvs() -- suvs this time.

	-- First call with Dex.  Don't animate, may be busy shooting stuff
	thread_new( "dlc05_setup_cellphone_conversation", DEX_PHONE_CONVERSATION_1, false )

	-- Enough of the first wave guys are dead to bring in more.
	group_create( GROUP_ATTACK01_SUVS, true )

	for i, info in pairs( TARGET_ONE_SUV_INFOS ) do
		-- Start moving them
		thread_new( "dlc05_start_suv_driveup", info )
	end

end

------------------------------------------------
-- Heli dropoffs to punch up the first attack --
------------------------------------------------

TARGET_ONE_HELI_DROPOFF_INFOS =
{
	{
		heli								= "dlc05_$atk01_heli01",
		occupants 						= {"dlc05_$atk01_heli01_crew01", "dlc05_$atk01_heli01_crew02", "dlc05_$atk01_heli01_crew03", "dlc05_$atk01_heli01_crew04"},
		path								= PATH_ATTACK01_HELI01,
		speed								= ATTACK01_HELI_SPEED,
		approach_nav					= "dlc05_$nav_atk01_approach01",
		landing_nav						= "dlc05_$nav_atk01_landing01",
		attack_points					= {"dlc05_$nav_atk01_heli01_clear01", "dlc05_$nav_atk01_heli01_clear02", "dlc05_$nav_atk01_heli01_clear03"},
	},
	{
		heli								= "dlc05_$atk01_heli02",
		occupants 						= {"dlc05_$atk01_heli02_crew01", "dlc05_$atk01_heli02_crew02", "dlc05_$atk01_heli02_crew03", "dlc05_$atk01_heli02_crew04"},
		delay								= ATTACK01_HELI_PAUSE_S,
		path								= PATH_ATTACK01_HELI02,
		speed								= ATTACK01_HELI_SPEED,
		approach_nav					= "dlc05_$nav_atk01_approach02",
		landing_nav						= "dlc05_$nav_atk01_landing02",
		attack_points					= {"dlc05_$nav_atk01_heli02_clear01", "dlc05_$nav_atk01_heli02_clear02", "dlc05_$nav_atk01_heli02_clear03"},
	},
}

function dlc05_attack01_heli_dropoff()

	-- a couple helis swoop in and unload guys during the initial attack
	group_create( GROUP_ATTACK01_HELIS, true )
	for i, info in pairs( TARGET_ONE_HELI_DROPOFF_INFOS ) do
		dlc05_start_heli_dropoff( info )
	end

end

-----------------------
-- Intermission Time --
-----------------------

function dlc05_intermission_1()

	-- Prepare the next area for battle
	group_create( GROUP_HELPERS02 )
	for i, helper in pairs( HELPER_GROUP_02 ) do
		set_unrecruitable_flag( helper, true )
		on_take_damage( "dlc05_ultor_goon_got_hurt", helper )
		npc_unholster_best_weapon( helper )
	end

	group_create_hidden( GROUP_ATTACK02_GUYS01 )
	group_create_hidden( GROUP_ATTACK02_GUYS02 )
	group_create_hidden( GROUP_ATTACK02_SUVS )

	if DEBUG_SKIP_SECOND_DRIVE then
		-- Truck is unjackable for now
		set_unjackable_flag( HAZARD01, true )

		thread_new( "dlc05_attack02" )

	else
		-- Make the truck jackable again
		set_unjackable_flag( HAZARD01, false )

		mission_help_table("TEXT_OBJECTIVE_GET_IN_TRUCK")

		-- Setup the enter callback for the truck
		on_vehicle_enter( "dlc05_enter_hazard01_objective02_first", HAZARD01 )

		delay( 2 )

		-- Second call with Dex
		thread_new( "dlc05_setup_cellphone_conversation", DEX_PHONE_CONVERSATION_2, true )
	end

end

-------------------------------
-- The Defense of Target Two --
-------------------------------

TARGET_TWO_INITIAL_MASAKO_SUV_INFOS =
{
	{
		suv								= "dlc05_$suv05",
		occupants						= {"dlc05_$suv05_crew01", "dlc05_$suv05_crew02", "dlc05_$suv05_crew03", "dlc05_$suv05_crew04"},
		path								= PATH_ATTACK02_SUV,
		exit_nav							= "dlc05_$n_suv05_exit",
	},
	{
		suv								= "dlc05_$suv06",
		occupants						= {"dlc05_$suv06_crew01", "dlc05_$suv06_crew02", "dlc05_$suv06_crew03", "dlc05_$suv06_crew04"},
		path								= PATH_ATTACK02_SUV,
		exit_nav							= "dlc05_$n_suv06_exit",
	},
}

TARGET_TWO_MASAKO_GROUND_GUY_INFOS =
{
	{
		npcs								= {"dlc05_$c_tunnel1_1", "dlc05_$c_tunnel1_2", "dlc05_$c_tunnel1_3", "dlc05_$c_tunnel1_4",
												"dlc05_$c_tunnel1_5", "dlc05_$c_tunnel1_6", "dlc05_$c_tunnel1_7", "dlc05_$c_tunnel1_8",
												"dlc05_$c_tunnel1_9"},
		navs								= {"dlc05_$n_tunnel1_1", "dlc05_$n_tunnel1_2", "dlc05_$n_tunnel1_3", "dlc05_$n_tunnel1_4",
												"dlc05_$n_tunnel1_5", "dlc05_$n_tunnel1_6", "dlc05_$n_tunnel1_7", "dlc05_$n_tunnel1_8",
												"dlc05_$n_tunnel1_9"},
	},
	{
		npcs								= {"dlc05_$c_outside1_1", "dlc05_$c_outside1_2", "dlc05_$c_outside1_3"},
		navs								= {"dlc05_$n_outside1_1", "dlc05_$n_outside1_2", "dlc05_$n_outside1_3"},
	},
	{
		npcs								= {"dlc05_$c_outside2_1", "dlc05_$c_outside2_2", "dlc05_$c_outside2_3"},
		navs								= {"dlc05_$n_outside2_1", "dlc05_$n_outside2_2", "dlc05_$n_outside2_3"},
	},
	{
		npcs								= {"dlc05_$c_stair1_1", "dlc05_$c_stair1_2", "dlc05_$c_stair1_3", "dlc05_$c_stair1_4"},
		navs								= {"dlc05_$n_stair1_1", "dlc05_$n_stair1_2", "dlc05_$n_stair1_3", "dlc05_$n_stair1_4"},
	},
	{
		npcs								= {"dlc05_$c_stair2_1", "dlc05_$c_stair2_2", "dlc05_$c_stair2_3", "dlc05_$c_stair2_4"},
		navs								= {"dlc05_$n_stair2_1", "dlc05_$n_stair2_2", "dlc05_$n_stair2_3", "dlc05_$n_stair2_4"},
	},
	{
		npcs								= {"dlc05_$c_tunnel2_1", "dlc05_$c_tunnel2_2", "dlc05_$c_tunnel2_3", "dlc05_$c_tunnel2_4"},
		navs								= {"dlc05_$n_tunnel2_1", "dlc05_$n_tunnel2_2", "dlc05_$n_tunnel2_3", "dlc05_$n_tunnel2_4"},
	},
}

function dlc05_objective02_trigger_reached( triggerer, trigger )

	-- Only triggers if the truck is being driven
	if not character_is_player( triggerer ) or not character_is_in_vehicle( triggerer, HAZARD01 ) then
		return
	end

	-- Disable the trigger
	marker_remove_trigger( TRIG_OBJECTIVE02 )
	trigger_enable( TRIG_OBJECTIVE02, false )
	mission_waypoint_remove()

	-- Remove the callbacks (prevents marker shenanigans)
	on_vehicle_enter( "", HAZARD01 )
	on_vehicle_exit( "", HAZARD01 )

	-- Kick players out
	marker_remove_vehicle( HAZARD01 )
	dlc05_stop_truck_and_kick_out_players( HAZARD01 )

	thread_new( "dlc05_delay_thread_until_players_near_nav", trigger, "dlc05_attack02" )

end

function dlc05_attack02()

	-- Mark the hazard truck
	marker_add_vehicle( HAZARD01, MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE )

	-- Reset the counter
	Masako_group_dead = 0

	mission_help_table("TEXT_OBJECTIVE_DEFEND_SECOND_STOP")

	-- Initial wave of SUVs
	group_show( GROUP_ATTACK02_SUVS )

	for i, info in pairs( TARGET_TWO_INITIAL_MASAKO_SUV_INFOS ) do
		thread_new( "dlc05_start_suv_driveup", info )
	end

	-- Buncha guys in a building
	group_show( GROUP_ATTACK02_GUYS01 )

	-- Doors apparently don't open in co-op...
	mesh_mover_hide( ATTACK02_DOOR01 )

	for i, info in pairs( TARGET_TWO_MASAKO_GROUND_GUY_INFOS ) do
		for j, npc in pairs( info.npcs ) do
			-- add callbacks for these guys so we know when to send in more.
			on_death( "dlc05_masako_death", npc )
			set_max_hit_points( npc, get_max_hit_points( npc ) * MASAKO_HITPOINT_MULTIPLIER, true )
		end
	end

	-- Only send out the first half for now
	for i = 1, 3 do
		thread_new( "dlc05_send_ground_guys", TARGET_TWO_MASAKO_GROUND_GUY_INFOS[i] )
	end

	-- Pump up perceived notoriety
	hud_set_fake_notoriety( "Police", true, 3 )

	-- Spin while we wait for enough kills
	while (Masako_group_dead < ATTACK02_SEND_SECOND_GROUND_DEATH_COUNT) and not DEBUG_NO_ATTACK_DELAYS do
		thread_yield()
	end

	dlc05_attack02_second_ground_group()

	while (Masako_group_dead < ATTACK02_SEND_HELIS_DEATH_COUNT) and not DEBUG_NO_ATTACK_DELAYS do
		thread_yield()
	end

	dlc05_attack02_heli_dropoff()

	if not DEBUG_NO_ATTACK_DELAYS then
		-- Wait for a bit before putting up the objective interface
		delay( 45 )
	end

	-- Start the thread for Masako cleanup
	local masako_cleanup_thread = thread_new( "dlc05_do_kill_remaining_masako", ATTACK02_MASAKO_LIST )

	while not thread_check_done( masako_cleanup_thread ) do
		thread_yield()
	end

	dlc05_objective02_completed()

end

-- Helper to send out guys from a location one at a time
function dlc05_send_ground_guys( info )

	for i, npc in pairs( info.npcs ) do
		thread_new( "dlc05_add_masako_to_assault", npc, info.navs[i] )
		delay( 1 )
	end

end

function dlc05_attack02_second_ground_group()

	group_show( GROUP_ATTACK02_GUYS02 )

	-- Doors apparently don't open in co-op...
	mesh_mover_hide( ATTACK02_DOOR02 )

	-- Send out the second half of guys
	for i = 4, 6 do
		thread_new( "dlc05_send_ground_guys", TARGET_TWO_MASAKO_GROUND_GUY_INFOS[i] )
	end

end

-------------------------------------------------
-- Heli dropoffs to punch up the second attack --
-------------------------------------------------

TARGET_TWO_HELI_DROPOFF_INFOS =
{
	{
		heli								= "dlc05_$atk02_heli01",
		occupants						= {"dlc05_$atk02_heli01_crew01", "dlc05_$atk02_heli01_crew02", "dlc05_$atk02_heli01_crew03", "dlc05_$atk02_heli01_crew04"},
		path								= PATH_ATTACK02_HELIS,
		speed								= ATTACK02_HELI_SPEED,
		approach_nav					= "dlc05_$nav_atk02_approach01",
		landing_nav						= "dlc05_$nav_atk02_landing01",
		attack_points					= {"dlc05_$nav_atk02_heli01_clear01", "dlc05_$nav_atk02_heli01_clear02", "dlc05_$nav_atk02_heli01_clear03"},
	},
	{
		heli								= "dlc05_$atk02_heli02",
		occupants						= {"dlc05_$atk02_heli02_crew01", "dlc05_$atk02_heli02_crew02", "dlc05_$atk02_heli02_crew03", "dlc05_$atk02_heli02_crew04"},
		delay								= ATTACK02_HELI_PAUSE_S,
		path								= PATH_ATTACK02_HELIS,
		speed								= ATTACK02_HELI_SPEED,
		approach_nav					= "dlc05_$nav_atk02_approach02",
		landing_nav						= "dlc05_$nav_atk02_landing02",
		attack_points					= {"dlc05_$nav_atk02_heli02_clear01", "dlc05_$nav_atk02_heli02_clear02", "dlc05_$nav_atk02_heli02_clear03"},
	},
	{
		heli								= "dlc05_$atk02_heli03",
		occupants						= {"dlc05_$atk02_heli03_crew01", "dlc05_$atk02_heli03_crew02", "dlc05_$atk02_heli03_crew03", "dlc05_$atk02_heli03_crew04"},
		delay								= ATTACK02_HELI_PAUSE_S * 2,
		path								= PATH_ATTACK02_HELIS,
		speed								= ATTACK02_HELI_SPEED,
		approach_nav					= "dlc05_$nav_atk02_approach03",
		landing_nav						= "dlc05_$nav_atk02_landing03",
		attack_points					= {"dlc05_$nav_atk02_heli03_clear01", "dlc05_$nav_atk02_heli03_clear02", "dlc05_$nav_atk02_heli03_clear03"},
	},
	{
		heli								= "dlc05_$atk02_heli04",
		occupants						= {"dlc05_$atk02_heli04_crew01", "dlc05_$atk02_heli04_crew02", "dlc05_$atk02_heli04_crew03", "dlc05_$atk02_heli04_crew04"},
		delay								= ATTACK02_HELI_PAUSE_S * 3,
		path								= PATH_ATTACK02_HELIS,
		speed								= ATTACK02_HELI_SPEED,
		approach_nav					= "dlc05_$nav_atk02_approach04",
		landing_nav						= "dlc05_$nav_atk02_landing04",
		attack_points					= {"dlc05_$nav_atk02_heli04_clear01", "dlc05_$nav_atk02_heli04_clear02", "dlc05_$nav_atk02_heli04_clear03"},
	},
}

function dlc05_attack02_heli_dropoff() -- helicopters this time.

	-- Enough of the first wave guys are dead to bring in more.
	group_create( GROUP_ATTACK02_HELIS, true )

	for i, info in pairs( TARGET_TWO_HELI_DROPOFF_INFOS ) do
		thread_new( "dlc05_start_heli_dropoff", info )
	end

	delay( ATTACK02_HELI_PAUSE_S * 2 )

	-- Time to send out the help
	Support_fly_threads.launch = thread_new( "dlc05_launch_the_support" )

end

function dlc05_objective02_completed()

	-- Tell the support chopper to land
	Support_fly_threads.landing = thread_new( "dlc05_support_landing" )

	-- Gryphon directions
	Objective_three_phone_thread = thread_new( "dlc05_setup_cellphone_conversation", GRYPHON_DIRECTIONS_CONVERSATION, true )

	-- release the leftovers.  notoriety should keep them fighting but we dont need to deal with them anymore.
	release_to_world( GROUP_ATTACK02_GUYS01 )
	release_to_world( GROUP_ATTACK02_GUYS02 )
	release_to_world( GROUP_ATTACK02_SUVS )
	--release_to_world( GROUP_ATTACK02_HELIS )  -- Can't release, has helis

	mission_help_table_nag("TEXT_OBJECTIVE_SECOND_STOP_DONE")

	-- Spin until the conversation's done
	repeat
		thread_yield()
	until thread_check_done( Objective_three_phone_thread )

	-- Spin some more until both players are alive
	local both_alive
	repeat
		both_alive = true

		for i, player in pairs( PLAYER_LIST ) do
			if character_is_dead( player ) then
				both_alive = false
				break
			end
		end

		thread_yield()
	until both_alive

	-- Client just refuses to exit vehicles quickly, so we're going to force everyone out and keep them out
	for i, player in pairs( PLAYER_LIST ) do
		character_evacuate_from_all_vehicles( player )
		set_player_can_enter_exit_vehicles( player, false )
	end

	mission_start_fade_out()

	group_destroy( GROUP_HELI_SUPPORT )

	if not DEBUG_TEST_COOP_DRIVE then
		dlc05_setup_heli_player()
	end

	if dlc05_is_coop_truck_chase() then
		dlc05_setup_truck_player()
	end

	mission_start_fade_in()

	mission_set_checkpoint( CHECKPOINT_PROTECT_TRUCKS, true )

	dlc05_intermission_2()

end

----------------------------------------------
-- Help arrives in a friendly Ultor Tornado --
----------------------------------------------

function dlc05_launch_the_support()

	mission_help_table_nag("TEXT_HELP_TORNADO")

	delay( 4 )

	group_create_hidden( GROUP_HELI_SUPPORT, true )

	set_max_hit_points( FRIENDLY_TORNADO, get_max_hit_points( FRIENDLY_TORNADO ) * FRIENDLY_TORNADO_HITPOINT_MODIFIER, true)
	on_vehicle_destroyed( "TEXT_FAIL_HELICOPTER_DESTROYED", FRIENDLY_TORNADO )

	for i, pilot in pairs( SUPPORT_PILOTS ) do
		vehicle_enter_teleport( pilot, FRIENDLY_TORNADO, i-1 )
		set_unrecruitable_flag( pilot, true )
	end

	-- Players can't get into it until the pilots get out
	set_unjackable_flag( FRIENDLY_TORNADO, true )

	teleport_vehicle( FRIENDLY_TORNADO, PATH_SUPPORT01[1] )
	group_show( GROUP_HELI_SUPPORT )
	Support_fly_threads.support = thread_new( "dlc05_support_will_now_support" )
	dlc05_fly_to_direct_even_in_coop( FRIENDLY_TORNADO, 35, PATH_SUPPORT01 )
	dlc05_fly_to_direct_even_in_coop( FRIENDLY_TORNADO, 35, PATH_SUPPORT02 )

end

-- The purpose of this function is to see if the helicopter is in range of the Masako Helis
-- Once in range it will start shooting them down.
-- To do this I will have it check if the target is alive
-- If we have a live target check the distance to it
-- If it's close, fire on it.
function dlc05_support_will_now_support()

	while not thread_check_done( Support_fly_threads.launch ) do
		if not dlc05_vehicle_is_active( FRIENDLY_TORNADO ) then
			return
		end

		local fired = false

		for i, info in pairs( TARGET_TWO_HELI_DROPOFF_INFOS ) do
			local heli = info.heli

			if dlc05_vehicle_is_active( heli ) and get_dist( FRIENDLY_TORNADO, heli ) < SUPPORT_ATTACK_DIST_M then
				helicopter_shoot_vehicle( FRIENDLY_TORNADO, heli, 0, 0 )
				fired = true
				break
			end
		end

		-- So it doesn't fire continuously
		delay( fired and rand_float( 5.0, 8.0 ) or 0.25 )
	end

	-- If we get this far, then the heli is sitting around in the air, so have it do something while it waits
	helicopter_set_dont_move_in_combat( FRIENDLY_TORNADO, true )

	while true do
		-- Pick the closest Masako
		local closest_dist, closest_npc

		for i, npc in pairs( ATTACK02_MASAKO_LIST ) do
			local dist = get_dist( FRIENDLY_TORNADO, npc )

			if not closest_dist or (dist < closest_dist) then
				closest_dist = dist
				closest_npc = npc
			end
		end

		if closest_npc then
			vehicle_chase( FRIENDLY_TORNADO, closest_npc )
		end

		-- Wait to re-evaluate who to attack
		delay( rand_float( 7.0, 10.0 ) )
	end

end

function dlc05_support_landing()

	-- wait until the Tornado is done flying around or else it will slam into a guard tower like its going out of style.
	while not thread_check_done( Support_fly_threads.launch ) do
		thread_yield()
	end

	helicopter_set_dont_move_in_combat( FRIENDLY_TORNADO, false )
	thread_kill( Support_fly_threads.support )

	-- Tack on the landing nav for smoothness
	local path = {}
	for i, nav in pairs( PATH_SUPPORT03 ) do
		path[i] = nav
	end

	local idx = sizeof_table( path )
	path[idx + 1] = NAV_TORNADO_LANDING

	Support_fly_threads.slow = thread_new( "dlc05_support_slow_for_landing" )
	dlc05_fly_to_direct_even_in_coop( FRIENDLY_TORNADO, 20, PATH_SUPPORT03 )

end

function dlc05_support_slow_for_landing()

	local path_end_nav = PATH_SUPPORT03[ sizeof_table( PATH_SUPPORT03 ) ]

	repeat
		thread_yield()
	until get_dist( FRIENDLY_TORNADO, path_end_nav ) < HELI_NODE_APPROACH_DIST_M

	-- Slow down!
	local path = {path_end_nav, NAV_TORNADO_LANDING}
	dlc05_fly_to_direct_even_in_coop( FRIENDLY_TORNADO, HELI_LANDING_SPEED, path )

end

-- Landing this sucker has issues, so we do a bait-and-switch with a grounded heli
function dlc05_setup_heli_player()

	-- Kill all the pathing threads
	for label, thread in pairs( Support_fly_threads ) do
		thread_kill( thread )
	end

	-- Get out of any other vehicle
	character_evacuate_from_all_vehicles( HELI_PLAYER )
	thread_yield()	-- Let the player get cleaned up

	group_create_hidden( GROUP_HELI_SUPPORT, true )
	on_vehicle_destroyed( "TEXT_FAIL_HELICOPTER_DESTROYED", FRIENDLY_TORNADO )
	set_max_hit_points( FRIENDLY_TORNADO, get_max_hit_points( FRIENDLY_TORNADO ) * FRIENDLY_TORNADO_HITPOINT_MODIFIER, true )
	set_unjackable_flag( FRIENDLY_TORNADO, true )

	if dlc05_is_coop_truck_chase() and DEBUG_COOP_TRUCK_INVULNERABLE then
		turn_invulnerable( FRIENDLY_TORNADO )
	else
		turn_vulnerable( FRIENDLY_TORNADO )
	end

	if dlc05_is_coop_truck_chase() then
		-- Make the heli hardier, RPG guys will target
		vehicle_set_explosion_damage_multiplier( FRIENDLY_TORNADO, FRIENDLY_TORNADO_EXPLOSION_MULT_COOP )
		vehicle_prevent_explosion_fling( FRIENDLY_TORNADO, true )
	else
		vehicle_set_explosion_damage_multiplier( FRIENDLY_TORNADO, 1.0 )
		vehicle_prevent_explosion_fling( FRIENDLY_TORNADO, false )
	end

	group_show( GROUP_HELI_SUPPORT )

	-- Teleport the pilots out...
	for i, pilot in pairs( SUPPORT_PILOTS ) do
		teleport( pilot, NAV_SUPPORT_PILOT_STARTS[i] )
		set_unrecruitable_flag( pilot, true )
		thread_new( "dlc05_move_out_and_away", pilot, NAV_SUPPORT_PILOT_ENDS[i] )
	end

	-- And teleport the player in
	vehicle_enter_teleport( HELI_PLAYER, FRIENDLY_TORNADO, 0 )

	-- Can't leave the heli
	set_player_can_enter_exit_vehicles( HELI_PLAYER, false )

end

function dlc05_move_out_and_away( npc, nav )

	move_to( npc, nav, 2, true, true )
	turn_to_nav( npc, NAV_TORNADO_LANDING )
	release_to_world( npc )

end

function dlc05_setup_truck_player()

	-- Get out of any other vehicle
	character_evacuate_from_all_vehicles( TRUCK_PLAYER )
	thread_yield()	-- Let the player get cleaned up

	vehicle_enter_teleport( TRUCK_PLAYER, HAZARD01, 0 )

	-- Can't get out until it's delivered
	set_player_can_enter_exit_vehicles( TRUCK_PLAYER, false )

	-- Set up the truck
	dlc05_prep_truck_for_chase( HAZARD01 )

end

-------------------------------------
--      Intermission Part Two      --
-------------------------------------

function dlc05_intermission_2()

	-- Drop your homies
	party_dismiss_all()
	party_set_recruitable( false )

	-- Clean up the truck
	on_vehicle_enter( "", HAZARD01 )
	on_vehicle_exit( "", HAZARD01 )
	marker_remove_vehicle( HAZARD01 )

	-- Reset its health for the third portion
	-- Let's avoid doing this and see if this makes the first chase a little harder ~SherwinT 4/13/09
	--set_current_hit_points( HAZARD01, get_max_hit_points( HAZARD01 ) )

	-- Pump up perceived notoriety
	hud_set_fake_notoriety( "Police", true, 4 )

	if dlc05_is_coop_truck_chase() then
		delay( 1 )
		dlc05_setup_coop_truck_chase()

	else
		-- Make it unjackable again (in case this is a checkpoint start)
		dlc05_stop_truck_and_kick_out_players( HAZARD01 )

		-- Explosions shouldn't fling it so the driver can get in
		vehicle_prevent_explosion_fling( HAZARD01, true )

		-- Move the first truck into place now that the players are in the heli
		teleport_vehicle( HAZARD01, NAV_PART03_TRUCK_START )

		-- Make the other trucks
		group_create( GROUP_TRUCK02, true )
		dlc05_prep_truck_initial( HAZARD02 )

		group_create( GROUP_TRUCK03, true )
		dlc05_prep_truck_initial( HAZARD03 )

		delay( 1 )

		marker_add_vehicle( HAZARD01, MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE )

		mission_help_table("TEXT_OBJECTIVE_HELI_DEFENSE")

		group_create_hidden( GROUP_RPG_GUYS01 )

		Vehicle_chase_threads[HAZARD01] = thread_new( "dlc05_apc_one" )
	end

end

function dlc05_delayed_rpg_guy_message()

	delay( 3 )

	mission_help_table_nag("TEXT_HELP_RPG_GUYS", nil, nil, PLAYER_SYNC[HELI_PLAYER] )

end


-----------------------------------
--                               --     H   H AAAAA ZZZZZ AAAAA RRRR  DDDD         000    11
--   Defend the Trucks Section   --     H   H A   A    ZZ A   A R  RR D  DD       0   0  1 1
--        Part the First         --     HHHHH AAAAA  ZZZ  AAAAA RRRR  D   D       0   0    1
--         Single Player         --     H   H A   A ZZ    A   A R  R  D  DD       0   0    1
--											--     H   H A   A ZZZZZ A   A R   R DDDD         000   1111
-----------------------------------

DEFEND_TRUCKS_PART_ONE_APC_INFOS =
{
	{
		group								= "dlc05_$group_apc03",
		apc								= "dlc05_$apc03",
		occupants						= {"dlc05_$apc03_crew01", "dlc05_$apc03_crew02"},
		target							= DRIVER01,
	},
	{
		group								= "dlc05_$group_apc06",
		apc								= "dlc05_$apc06",
		occupants						= {"dlc05_$apc06_crew01", "dlc05_$apc06_crew02"},
		target							= DRIVER01,
		send_nav							= "dlc05_$n192",
	}
}

DEFEND_TRUCKS_PART_ONE_RPG_GUY_INFOS =
{
	{
		npc								= "dlc05_$haz01_rpg_guy01",
		aim_nav							= "dlc05_$n192",
		fire_trigger					= "dlc05_$t_haz01_rpg01_shoot",
		target							= DRIVER01,
		fake_rpg_navs					= {"dlc05_$n_haz01_rpg01_fake01", "dlc05_$n_haz01_rpg01_fake02", "dlc05_$n_haz01_rpg01_fake03"},
	},
	{
		npc								= "dlc05_$haz01_rpg_guy02",
		aim_nav							= "dlc05_$n199",
		fire_trigger					= "dlc05_$t_haz01_rpg02_shoot",
		target							= DRIVER01,
		fake_rpg_navs					= {"dlc05_$n_haz01_rpg02_fake01", "dlc05_$n_haz01_rpg02_fake02"},
	},
	{
		npc								= "dlc05_$haz01_rpg_guy03",
		aim_nav							= "dlc05_$n202",
		fire_trigger					= "dlc05_$t_haz01_rpg03_shoot",
		target							= DRIVER01,
		fake_rpg_navs					= {"dlc05_$n_haz01_rpg03_fake01", "dlc05_$n_haz01_rpg03_fake02"},
	},
	{
		npc								= "dlc05_$haz01_rpg_guy04",
		aim_nav							= "dlc05_$n194",
		fire_trigger					= "dlc05_$t_haz01_rpg04_shoot",
		target							= DRIVER01,
		fake_rpg_navs					= {"dlc05_$n_haz01_rpg04_fake01", "dlc05_$n_haz01_rpg04_fake02"},
	},
}

function dlc05_apc_one()

	-- Start the truck distance thread
	Truck_abandon_thread = thread_new( "dlc05_start_truck_abandon_check", HAZARD01 )

	-- Create the first truck driver
	group_create( GROUP_DRIVER01, true )
	turn_invulnerable( DRIVER01 )
	set_unrecruitable_flag( DRIVER01, true )

	vehicle_enter_teleport( DRIVER01, HAZARD01, 0, true, true )

	dlc05_prep_truck_for_chase( HAZARD01 )

	-- Create the first chase APC
	dlc05_send_chase_apc( DEFEND_TRUCKS_PART_ONE_APC_INFOS[1] )

	thread_new( "dlc05_send_additional_chase_apc_at_nav", DEFEND_TRUCKS_PART_ONE_APC_INFOS[2] )

	-- Set up the RPG guys
	dlc05_setup_random_rpg_guys( DEFEND_TRUCKS_PART_ONE_RPG_GUY_INFOS, DEFEND_TRUCKS_PART_ONE_MAX_RPG_GUYS )

	dlc05_delayed_rpg_guy_message()

	-- Drive, sucka, drive
	repeat
		vehicle_pathfind_to( HAZARD01, PATH_HAZARD01, true, true )
		thread_yield()
	until not dlc05_vehicle_is_active( HAZARD01 ) or (get_dist( HAZARD01, NAV_PATH_HAZARD01_END ) < TRUCK_PARK_DIST_M)

	if not dlc05_vehicle_is_active( HAZARD01 ) then
		-- Wait for the failure condition
		return
	end

	mission_set_checkpoint( CHECKPOINT_PROTECT_TRUCKS_TWO, true )

	dlc05_stop_truck_abandon_check()		-- This needs to be done first before removing the marker (buggy distance display)
	marker_remove_vehicle( HAZARD01 )
	damage_indicator_off( 0 )

	-- Make sure the truck can't be destroyed at this point
	dlc05_save_truck_after_chase( HAZARD01 )

	thread_new( "dlc05_end_chase_start_two" )

	-- Last Dex call
	thread_new( "dlc05_setup_cellphone_conversation", DEX_PHONE_CONVERSATION_3, true )

end

function dlc05_end_chase_start_two()

	if DEBUG_SKIP_SECOND_CHASE then
		mission_help_table_nag("TEXT_HELP_TRUCK02")
		thread_new ( "dlc05_apc_three_prep" )
	else
		mission_help_table_nag("TEXT_HELP_TRUCK01")
		thread_new ( "dlc05_apc_two_prep" )
	end

	dlc05_truck_driver_exit( DRIVER01 )

end

-----------------------------------
--                               --     H   H AAAAA ZZZZZ AAAAA RRRR  DDDD         000    222
--   Defend the Trucks Section   --     H   H A   A    ZZ A   A R  RR D  DD       0   0  2  2
--        Part the Second        --     HHHHH AAAAA  ZZZ  AAAAA RRRR  D   D       0   0    2
--         Single Player         --     H   H A   A ZZ    A   A R  R  D  DD       0   0   2
--											--     H   H A   A ZZZZZ A   A R   R DDDD         000   22222
-----------------------------------

DEFEND_TRUCKS_PART_TWO_APC_INFOS =
{
	{
		group								= "dlc05_$group_apc02",
		apc								= "dlc05_$apc02",
		occupants						= {"dlc05_$apc02_crew01", "dlc05_$apc02_crew02"},
		target							= DRIVER02,
	},
	{
		group								= "dlc05_$group_apc04",
		apc								= "dlc05_$apc04",
		occupants						= {"dlc05_$apc04_crew01", "dlc05_$apc04_crew02"},
		target							= DRIVER02,
	},
	{
		group								= "dlc05_$group_apc07",
		apc								= "dlc05_$apc07",
		occupants						= {"dlc05_$apc07_crew01", "dlc05_$apc07_crew02"},
		target							= DRIVER02,
		send_nav							= "dlc05_$n043",
	},
	{
		group								= "dlc05_$group_apc08",
		apc								= "dlc05_$apc08",
		occupants						= {"dlc05_$apc08_crew01", "dlc05_$apc08_crew02"},
		target							= DRIVER02,
		send_nav							= "dlc05_$n044",
	},
	{
		group								= "dlc05_$group_apc11",
		apc								= "dlc05_$apc11",
		occupants						= {"dlc05_$apc11_crew01", "dlc05_$apc11_crew02"},
		target							= DRIVER02,
		send_nav							= "dlc05_$n046",
	},
}

DEFEND_TRUCKS_PART_TWO_RPG_GUY_INFOS =
{
	{
		npc								= "dlc05_$haz02_rpg_guy01",
		aim_nav							= "dlc05_$n_haz02_rpg01_aim",
		fire_trigger					= "dlc05_$t_haz02_rpg01_shoot",
		target							= DRIVER02,
		fake_rpg_navs					= {"dlc05_$n_haz02_rpg01_fake01", "dlc05_$n_haz02_rpg01_fake02", "dlc05_$n_haz02_rpg01_fake03"},
	},
	{
		npc								= "dlc05_$haz02_rpg_guy02",
		aim_nav							= "dlc05_$n045",
		fire_trigger					= "dlc05_$t_haz02_rpg02_shoot",
		target							= DRIVER02,
		fake_rpg_navs					= {"dlc05_$n_haz02_rpg02_fake01", "dlc05_$n_haz02_rpg02_fake02", "dlc05_$n_haz02_rpg02_fake03"},
	},
	{
		npc								= "dlc05_$haz02_rpg_guy03",
		aim_nav							= "dlc05_$n047",
		fire_trigger					= "dlc05_$t_haz02_rpg03_shoot",
		target							= DRIVER02,
		fake_rpg_navs					= {"dlc05_$n_haz02_rpg03_fake01", "dlc05_$n_haz02_rpg03_fake02", "dlc05_$n_haz02_rpg03_fake03", "dlc05_$n_haz02_rpg03_fake04"},
	},
	{
		npc								= "dlc05_$haz02_rpg_guy04",
		aim_nav							= "dlc05_$n_haz02_rpg04_aim",
		fire_trigger					= "dlc05_$t_haz02_rpg04_shoot",
		target							= DRIVER02,
		fake_rpg_navs					= {"dlc05_$n_haz02_rpg04_fake01", "dlc05_$n_haz02_rpg04_fake02"},
	},
	{
		npc								= "dlc05_$haz02_rpg_guy05",
		aim_nav							= "dlc05_$n051",
		fire_trigger					= "dlc05_$t_haz02_rpg05_shoot",
		target							= DRIVER02,
		fake_rpg_navs					= {"dlc05_$n_haz02_rpg05_fake01", "dlc05_$n_haz02_rpg05_fake02", "dlc05_$n_haz02_rpg05_fake03",
												"dlc05_$n_haz02_rpg05_fake04", "dlc05_$n_haz02_rpg05_fake05", "dlc05_$n_haz02_rpg05_fake06"},
	},
}

function dlc05_apc_two_prep()

	marker_add_vehicle( HAZARD02, MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE )

	-- Time to make this take damage
	turn_vulnerable( HAZARD02 )

	-- Create the second truck driver
	group_create( GROUP_DRIVER02, true )
	turn_invulnerable( DRIVER02 )
	set_unrecruitable_flag( DRIVER02, true )

	vehicle_enter_teleport( DRIVER02, HAZARD02, 0, true, true )

	dlc05_prep_truck_for_chase( HAZARD02 )

	-- Reconfigure the surviving APCs from before to track down the driver
	for i, info in pairs( DEFEND_TRUCKS_PART_ONE_APC_INFOS ) do
		if dlc05_vehicle_is_active( info.apc ) then
			vehicle_chase( info.apc, DRIVER02, true, true, true )
		end
	end

	-- Update the RPG guy groups
	if group_is_loaded( GROUP_RPG_GUYS01 ) then
		group_destroy( GROUP_RPG_GUYS01 )
	end

	group_create_hidden( GROUP_RPG_GUYS02 )

	-- Wait until the helicopter is back towards the next truck before starting
	repeat
		delay( 0.25 )
	until (get_dist( FRIENDLY_TORNADO, NAV_OBJECTIVE03 ) < CHASE_TRUCK_ABANDON_DIST_M) or DEBUG_TEST_RPG_GUYS

	delay( 2 )

	damage_indicator_on( 0, HAZARD02, 0.0, TEXT_HUD_TRUCK_HEALTH )

	teleport_vehicle( HAZARD01, NAV_TRUCK01_ON_SHIP )

	Vehicle_chase_threads[HAZARD02] = thread_new( "dlc05_apc_two" )

end

function dlc05_apc_two()

	-- Create its chase APCs
	dlc05_send_chase_apc( DEFEND_TRUCKS_PART_TWO_APC_INFOS[1] )
	dlc05_send_chase_apc( DEFEND_TRUCKS_PART_TWO_APC_INFOS[2] )

	for i = 3, 5 do
		thread_new( "dlc05_send_additional_chase_apc_at_nav", DEFEND_TRUCKS_PART_TWO_APC_INFOS[i] )
	end

	-- Set up the RPG guys
	dlc05_setup_random_rpg_guys( DEFEND_TRUCKS_PART_TWO_RPG_GUY_INFOS, DEFEND_TRUCKS_PART_TWO_MAX_RPG_GUYS )

	-- Start the truck distance thread
	Truck_abandon_thread = thread_new( "dlc05_start_truck_abandon_check", HAZARD02 )

	-- Pump up perceived notoriety
	hud_set_fake_notoriety( "Police", true, 4.5 )

	-- Drive, sucka, drive
	repeat
		vehicle_pathfind_to( HAZARD02, PATH_HAZARD02, true, true )
		thread_yield()
	until not dlc05_vehicle_is_active( HAZARD02 ) or (get_dist( HAZARD02, NAV_PATH_HAZARD02_END ) < TRUCK_PARK_DIST_M)

	if not dlc05_vehicle_is_active( HAZARD02 ) then
		-- Wait for the failure condition
		return
	end

	dlc05_stop_truck_abandon_check()		-- This needs to be done first before removing the marker (buggy distance display)
	marker_remove_vehicle( HAZARD02 )
	damage_indicator_off( 0 )

	-- Make sure the truck can't be destroyed at this point
	dlc05_save_truck_after_chase( HAZARD02 )

	thread_new( "dlc05_end_chase_start_three" )

end

function dlc05_end_chase_start_three()

	mission_help_table_nag("TEXT_HELP_TRUCK02")
	thread_new ( "dlc05_apc_three_prep" )

	dlc05_truck_driver_exit( DRIVER02 )

end

-----------------------------------
--                               --     H   H AAAAA ZZZZZ AAAAA RRRR  DDDD         000   3333
--   Defend the Trucks Section   --     H   H A   A    ZZ A   A R  RR D  DD       0   0      3
--        Part the Third         --     HHHHH AAAAA  ZZZ  AAAAA RRRR  D   D       0   0    33
--         Single Player         --     H   H A   A ZZ    A   A R  R  D  DD       0   0      3
--											--     H   H A   A ZZZZZ A   A R   R DDDD         000   3333
-----------------------------------

DEFEND_TRUCKS_PART_THREE_APC_INFOS =
{
	{
		group								= "dlc05_$group_apc01",
		apc								= "dlc05_$apc01",
		occupants						= {"dlc05_$apc01_crew01", "dlc05_$apc01_crew02"},
		target							= DRIVER03,
	},
	{
		group								= "dlc05_$group_apc05",
		apc								= "dlc05_$apc05",
		occupants						= {"dlc05_$apc05_crew01", "dlc05_$apc05_crew02"},
		target							= DRIVER03,
	},
	{
		group								= "dlc05_$group_apc09",
		apc								= "dlc05_$apc09",
		occupants						= {"dlc05_$apc09_crew01", "dlc05_$apc09_crew02"},
		target							= DRIVER03,
		send_nav							= "dlc05_$n173",
	},
	{
		group								= "dlc05_$group_apc10",
		apc								= "dlc05_$apc10",
		occupants						= {"dlc05_$apc10_crew01", "dlc05_$apc10_crew02"},
		target							= DRIVER03,
		send_nav							= "dlc05_$n173",
	},
	{
		group								= "dlc05_$group_apc12",
		apc								= "dlc05_$apc12",
		occupants						= {"dlc05_$apc12_crew01", "dlc05_$apc12_crew02"},
		target							= DRIVER03,
		send_nav							= "dlc05_$n024",
	},
	{
		group								= "dlc05_$group_apc13",
		apc								= "dlc05_$apc13",
		occupants						= {"dlc05_$apc13_crew01", "dlc05_$apc13_crew02"},
		target							= DRIVER03,
		send_nav							= "dlc05_$n024",
	},
}

DEFEND_TRUCKS_PART_THREE_RPG_GUY_INFOS =
{
	{
		npc								= "dlc05_$haz03_rpg_guy01",
		aim_nav							= "dlc05_$n172",
		fire_trigger					= "dlc05_$t_haz03_rpg01_shoot",
		target							= DRIVER03,
		fake_rpg_navs					= {"dlc05_$n_haz03_rpg01_fake01", "dlc05_$n_haz03_rpg01_fake02", "dlc05_$n_haz03_rpg01_fake03", "dlc05_$n_haz03_rpg01_fake04"},
	},
	{
		npc								= "dlc05_$haz03_rpg_guy02",
		aim_nav							= "dlc05_$n_haz03_rpg02_aim",
		fire_trigger					= "dlc05_$t_haz03_rpg02_shoot",
		target							= DRIVER03,
		fake_rpg_navs					= {"dlc05_$n_haz03_rpg02_fake01", "dlc05_$n_haz03_rpg02_fake02", "dlc05_$n_haz03_rpg02_fake03"},
	},
	{
		npc								= "dlc05_$haz03_rpg_guy03",
		aim_nav							= "dlc05_$n174",
		fire_trigger					= "dlc05_$t_haz03_rpg03_shoot",
		target							= DRIVER03,
		fake_rpg_navs					= {"dlc05_$n_haz03_rpg03_fake01", "dlc05_$n_haz03_rpg03_fake02", "dlc05_$n_haz03_rpg03_fake03", "dlc05_$n_haz03_rpg03_fake04"},
	},
	{
		npc								= "dlc05_$haz03_rpg_guy04",
		aim_nav							= "dlc05_$n189",
		fire_trigger					= "dlc05_$t_haz03_rpg04_shoot",
		target							= DRIVER03,
		fake_rpg_navs					= {"dlc05_$n_haz03_rpg04_fake01", "dlc05_$n_haz03_rpg04_fake02"},
	},
	{
		npc								= "dlc05_$haz03_rpg_guy05",
		aim_nav							= "dlc05_$n_haz03_rpg05_aim",
		fire_trigger					= "dlc05_$t_haz03_rpg05_shoot",
		target							= DRIVER03,
		fake_rpg_navs					= {"dlc05_$n_haz03_rpg05_fake01", "dlc05_$n_haz03_rpg05_fake02"},
	},
	{
		npc								= "dlc05_$haz03_rpg_guy06",
		aim_nav							= "dlc05_$n176",
		fire_trigger					= "dlc05_$t_haz03_rpg06_shoot",
		target							= DRIVER03,
		fake_rpg_navs					= {"dlc05_$n_haz03_rpg06_fake01", "dlc05_$n_haz03_rpg06_fake02", "dlc05_$n_haz03_rpg06_fake03",
												"dlc05_$n_haz03_rpg06_fake04", "dlc05_$n_haz03_rpg06_fake05", "dlc05_$n_haz03_rpg06_fake06"},
	},
	{
		npc								= "dlc05_$haz03_rpg_guy07",
		aim_nav							= "dlc05_$n177",
		fire_trigger					= "dlc05_$t_haz03_rpg07_shoot",
		target							= DRIVER03,
		fake_rpg_navs					= {"dlc05_$n_haz03_rpg07_fake01", "dlc05_$n_haz03_rpg07_fake02", "dlc05_$n_haz03_rpg07_fake03"},
	},
	{
		npc								= "dlc05_$haz03_rpg_guy08",
		aim_nav							= "dlc05_$n179",
		fire_trigger					= "dlc05_$t_haz03_rpg08_shoot",
		target							= DRIVER03,
		fake_rpg_navs					= {"dlc05_$n_haz03_rpg08_fake01", "dlc05_$n_haz03_rpg08_fake02", "dlc05_$n_haz03_rpg08_fake03"},
	},
	{
		npc								= "dlc05_$haz03_rpg_guy09",
		aim_nav							= "dlc05_$n_haz03_rpg09_aim",
		fire_trigger					= "dlc05_$t_haz03_rpg09_shoot",
		target							= DRIVER03,
		fake_rpg_navs					= {"dlc05_$n_haz03_rpg09_fake01", "dlc05_$n_haz03_rpg09_fake02", "dlc05_$n_haz03_rpg09_fake03", "dlc05_$n_haz03_rpg09_fake04"},
	},
}

function dlc05_apc_three_prep()

	marker_add_vehicle( HAZARD03, MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE )

	-- Time to make this take damage
	turn_vulnerable( HAZARD03 )

	-- Create the third truck driver
	group_create( GROUP_DRIVER03, true )
	turn_invulnerable( DRIVER03 )
	set_unrecruitable_flag( DRIVER03, true )

	vehicle_enter_teleport( DRIVER03, HAZARD03, 0, true, true )

	dlc05_prep_truck_for_chase( HAZARD03 )

	-- Reconfigure the surviving APCs from before to track down the driver
	for i, info in pairs( DEFEND_TRUCKS_PART_ONE_APC_INFOS ) do
		if  dlc05_vehicle_is_active( info.apc ) then
			vehicle_chase( info.apc, DRIVER03, true, true, true )
		end
	end

	for i, info in pairs( DEFEND_TRUCKS_PART_TWO_APC_INFOS ) do
		if  dlc05_vehicle_is_active( info.apc ) then
			vehicle_chase( info.apc, DRIVER03, true, true, true )
		end
	end

	-- Update the RPG guys
	if group_is_loaded( GROUP_RPG_GUYS02 ) then
		group_destroy( GROUP_RPG_GUYS02 )
	end

	group_create_hidden( GROUP_RPG_GUYS03 )

	thread_new( "dlc05_enemy_tornado" )

	-- Wait until the helicopter is back towards the next truck before starting
	repeat
		delay( 0.25 )
	until (get_dist( FRIENDLY_TORNADO, NAV_OBJECTIVE03 ) < CHASE_TRUCK_ABANDON_DIST_M) or DEBUG_TEST_RPG_GUYS

	delay( 2 )

	damage_indicator_on( 0, HAZARD03, 0.0, TEXT_HUD_TRUCK_HEALTH )

	teleport_vehicle( HAZARD02, NAV_TRUCK02_ON_SHIP )

	Vehicle_chase_threads[HAZARD03] = thread_new( "dlc05_apc_three" )

end

function dlc05_enemy_tornado()

	if DEBUG_TEST_RPG_GUYS or DEBUG_TEST_COOP_DRIVE then
		return
	end

	group_create( GROUP_TORNADO01, true )
	for i, npc in pairs( ULTOR_TORNADO_CREW01 ) do
		vehicle_enter_teleport( npc, ULTOR_TORNADO01, ( i - 1 ) )
		set_max_hit_points( npc, get_max_hit_points( npc ) * MASAKO_HITPOINT_MULTIPLIER, true )
	end
	teleport_vehicle( ULTOR_TORNADO01, NAV_ULTOR_TORNADO_START )

	marker_add_vehicle( ULTOR_TORNADO01, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, PLAYER_SYNC[HELI_PLAYER] )

	on_vehicle_destroyed( "dlc05_enemy_tornado_death", ULTOR_TORNADO01 )

	-- Chases the local player in SP, heli player in co-op
	vehicle_chase( ULTOR_TORNADO01, HELI_PLAYER, true, true, true )

end

function dlc05_enemy_tornado_death()

	marker_remove_vehicle( ULTOR_TORNADO01 )

end

function dlc05_apc_three()

	dlc05_send_chase_apc( DEFEND_TRUCKS_PART_THREE_APC_INFOS[1] )
	dlc05_send_chase_apc( DEFEND_TRUCKS_PART_THREE_APC_INFOS[2] )

	for i = 3, 6 do
		thread_new( "dlc05_send_additional_chase_apc_at_nav", DEFEND_TRUCKS_PART_THREE_APC_INFOS[i] )
	end

	-- Set up the RPG guys
	dlc05_setup_random_rpg_guys( DEFEND_TRUCKS_PART_THREE_RPG_GUY_INFOS, DEFEND_TRUCKS_PART_THREE_MAX_RPG_GUYS )

	-- Start the truck distance thread
	Truck_abandon_thread = thread_new( "dlc05_start_truck_abandon_check", HAZARD03 )

	-- Pump up perceived notoriety
	hud_set_fake_notoriety( "Police", true, 5 )

	-- Drive, sucka, drive
	repeat
		vehicle_pathfind_to( HAZARD03, PATH_HAZARD03, true, true )
		thread_yield()
	until not dlc05_vehicle_is_active( HAZARD03 ) or (get_dist( HAZARD03, NAV_PATH_HAZARD03_END ) < TRUCK_PARK_DIST_M)

	if not dlc05_vehicle_is_active( HAZARD03 ) then
		-- Wait for the failure condition
		return
	end

	dlc05_stop_truck_abandon_check()		-- This needs to be done first before removing the marker (buggy distance display)
	marker_remove_vehicle( HAZARD03 )
	damage_indicator_off( 0 )

	-- Make sure the truck can't be destroyed at this point
	dlc05_save_truck_after_chase( HAZARD03 )

	thread_new( "dlc05_end_chase_finish" )

end

function dlc05_end_chase_finish()

	for i, player in pairs( PLAYER_LIST ) do
		-- Remove the heli weapon from the inventory (complains about ownership)
		inv_item_remove_in_slot( "vehicle", player )
	end

	-- Are you through yet?
	mission_end_success( MISSION_NAME, CUTSCENE_OUT )

end

------------------------------------------------
-- Common functions for the co-op truck chase --
------------------------------------------------

HAZARD02_COOP_INFO =
{
	group				= GROUP_TRUCK02,
	truck				= HAZARD02,
	callback			= "dlc05_truck02_retrieved",
}

HAZARD03_COOP_INFO =
{
	group				= GROUP_TRUCK03,
	truck				= HAZARD03,
	callback			= "dlc05_truck03_retrieved",
}

-- Pops the truck in and out for multiplayer (stupid chunk ghosting)
function dlc05_spawn_coop_chase_truck( truck_info )

	local group = truck_info.group
	local truck = truck_info.truck
	local truck_sync = PLAYER_SYNC[TRUCK_PLAYER]

	while true do
		local dist, player = get_dist_closest_player_to_object( truck, PLAYER_LIST )
		local loaded = group_is_loaded( group )

		if loaded and (dist > CHASE_TRUCK_ABANDON_DIST_M) then
			marker_remove_vehicle( truck, truck_sync )
			group_destroy( group )
			
		elseif not loaded and (dist <= CHASE_TRUCK_ABANDON_DIST_M) then
			group_create( group, true )
			dlc05_prep_truck_initial( truck )

			-- Only add the ingame marker (minimap icon's tacked to the nav)
			marker_add_vehicle( truck, "", INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE, truck_sync )
			set_unjackable_flag( truck, false )
			on_vehicle_enter( truck_info.callback, truck )

		end

		thread_yield()
	end

end

-----------------------------------
--                               --     H   H AAAAA ZZZZZ AAAAA RRRR  DDDD         000    11
--   Defend the Trucks Section   --     H   H A   A    ZZ A   A R  RR D  DD       0   0  1 1
--        Part the First         --     HHHHH AAAAA  ZZZ  AAAAA RRRR  D   D       0   0    1
--             Co-op             --     H   H A   A ZZ    A   A R  R  D  DD       0   0    1
--											--     H   H A   A ZZZZZ A   A R   R DDDD         000   1111
-----------------------------------

COOP_RPG_GUYS01 	= {"dlc05_$haz01_rpg_guy01", "dlc05_$haz01_rpg_guy02", "dlc05_$haz01_rpg_guy03", "dlc05_$haz01_rpg_guy04",
							"dlc05_$haz01_rpg_guy_coop01", "dlc05_$haz01_rpg_guy_coop02", "dlc05_$haz01_rpg_guy_coop03",
							"dlc05_$haz01_rpg_guy_coop04", "dlc05_$haz01_rpg_guy_coop05", "dlc05_$haz01_rpg_guy_coop06",
							"dlc05_$haz01_rpg_guy_coop07", "dlc05_$haz01_rpg_guy_coop08", "dlc05_$haz01_rpg_guy_coop09",
							"dlc05_$haz01_rpg_guy_coop10", "dlc05_$haz01_rpg_guy_coop11"}

-- Subset for restarting at a checkpoint
COOP_RPG_GUYS01_CHECKPOINT	= {"dlc05_$haz01_rpg_guy01", "dlc05_$haz01_rpg_guy02",
										"dlc05_$haz01_rpg_guy_coop01", "dlc05_$haz01_rpg_guy_coop02", "dlc05_$haz01_rpg_guy_coop03",
										"dlc05_$haz01_rpg_guy_coop05", "dlc05_$haz01_rpg_guy_coop06", "dlc05_$haz01_rpg_guy_coop07",
										"dlc05_$haz01_rpg_guy_coop08", "dlc05_$haz01_rpg_guy_coop09", "dlc05_$haz01_rpg_guy_coop10",
										"dlc05_$haz01_rpg_guy_coop11"}

function dlc05_setup_coop_truck_chase()

	local heli_sync = PLAYER_SYNC[HELI_PLAYER]
	local truck_sync = PLAYER_SYNC[TRUCK_PLAYER]

	-----------------------
	-- BOTH PLAYER STUFF --
	-----------------------

	-- Set up the RPG guys
	group_create_hidden( GROUP_RPG_GUYS01, true )
	group_create_hidden( GROUP_RPG_GUYS_COOP01, true )
	dlc05_setup_all_coop_rpg_guys( COOP_RPG_GUYS01 )

	-- Start chase thread
	Coop_chase_apcs_thread = thread_new( "dlc05_setup_coop_chase_apcs", DEFEND_TRUCKS_MAX_NUM_APCS[1], DEFEND_TRUCKS_APC_DELAY_S[1] )

	-----------------------
	-- HELI PLAYER STUFF --
	-----------------------

	mission_help_table("TEXT_OBJECTIVE_PROTECT_PLAYER", nil, nil, heli_sync )

	-- Mark the truck player for the heli
	marker_add_player( TRUCK_PLAYER, MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE, heli_sync )

	thread_new( "dlc05_delayed_rpg_guy_message" )

	------------------------
	-- TRUCK PLAYER STUFF --
	------------------------

	mission_help_table("TEXT_OBJECTIVE_DELIVER_TRUCK", nil, nil, truck_sync )

	-- Turn on deliver trigger for the driver
	marker_add_trigger( TRIG_TRUCK_END, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION, truck_sync )
	mission_waypoint_add( TRIG_TRUCK_END, truck_sync )
	trigger_enable( TRIG_TRUCK_END, true )
	on_trigger( "dlc05_truck_end_reached_one", TRIG_TRUCK_END )

	-- Make the retrieval car
	Retrieval_car_reset_thread = thread_new( "dlc05_reset_coop_retrieval_car" )

	-- Start the timer
	dlc05_truck_player_timer_start( DEFEND_TRUCKS_DELIVER_TIME_S[1] )

	-- Can't die
	thread_new( "dlc05_truck_player_death_check" )

end

function dlc05_truck_player_death_check()

	-- If the truck player ever dies, the mission is immediately over
	repeat
		thread_yield()
	until not dlc05_character_is_active( TRUCK_PLAYER )

	dlc05_fail_truck_not_delivered()

end

function dlc05_truck_end_reached_one( triggerer, trigger )

	if (triggerer ~= TRUCK_PLAYER) or not character_is_in_vehicle( TRUCK_PLAYER, HAZARD01 ) then
		return
	end

	mission_set_checkpoint( CHECKPOINT_PROTECT_TRUCKS_TWO, true )

	if DEBUG_SKIP_SECOND_CHASE then
		-- Make sure the truck can't be destroyed at this point
		dlc05_save_truck_after_chase( HAZARD01 )

		-- Last Dex call
		thread_new( "dlc05_setup_cellphone_conversation", DEX_PHONE_CONVERSATION_3, true )

		-- Update the RPG guy groups
		if group_is_loaded( GROUP_RPG_GUYS01 ) then
			group_destroy( GROUP_RPG_GUYS01 )
		end

		if group_is_loaded( GROUP_RPG_GUYS_COOP01 ) then
			group_destroy( GROUP_RPG_GUYS_COOP01 )
		end

		group_create_hidden( GROUP_RPG_GUYS02, true )
		group_create_hidden( GROUP_RPG_GUYS_COOP02, true )
		dlc05_setup_all_coop_rpg_guys( COOP_RPG_GUYS02 )

		-- Go right to the third truck
		dlc05_setup_retrieve_coop_truck03()
	else
		dlc05_setup_retrieve_coop_truck02()
	end

end

function dlc05_setup_retrieve_coop_truck02()

	local heli_sync = PLAYER_SYNC[HELI_PLAYER]
	local truck_sync = PLAYER_SYNC[TRUCK_PLAYER]

	-----------------------
	-- BOTH PLAYER STUFF --
	-----------------------

	-- Not tracking the old truck
	damage_indicator_off( 0 )

	-- Make sure the truck can't be destroyed at this point
	dlc05_save_truck_after_chase( HAZARD01 )

	-- Last Dex call
	thread_new( "dlc05_setup_cellphone_conversation", DEX_PHONE_CONVERSATION_3, true )

	-- Start the retrieval chase
	thread_kill( Coop_chase_apcs_thread )
	Coop_chase_apcs_thread = thread_new( "dlc05_setup_coop_chase_apcs", RETRIEVAL_MAX_NUM_APCS[1], RETRIEVAL_APC_DELAY_S[1] )

	-----------------------
	-- HELI PLAYER STUFF --
	-----------------------

	mission_help_table("TEXT_OBJECTIVE_PROTECT_SECOND_TRUCK", nil, nil, heli_sync )

	------------------------
	-- TRUCK PLAYER STUFF --
	------------------------

	mission_help_table("TEXT_OBJECTIVE_GET_SECOND_TRUCK", nil, nil, truck_sync )

	-- Remove the trigger
	trigger_enable( TRIG_TRUCK_END, false )
	mission_waypoint_remove( truck_sync )
	marker_remove_trigger( TRIG_TRUCK_END, truck_sync )

	-- Kill the countdown
	dlc05_truck_player_timer_end()

	-- Kick the player out
	dlc05_stop_truck_and_kick_out_players( HAZARD01 )

	-- Let the player enter stuff normally
	set_player_can_enter_exit_vehicles( TRUCK_PLAYER, true )

	-- Make the retrieval car vulnerable
	turn_vulnerable( COOP_RETRIEVAL_CAR )

	-- Start the retrieval of the next truck
	dlc05_truck_player_timer_start( DEFEND_TRUCKS_DELIVER_TIME_S[2] )

	-- Start the spawn thread
	Coop_truck_spawn_threads[HAZARD02] = thread_new( "dlc05_spawn_coop_chase_truck", HAZARD02_COOP_INFO )

	-- Mark the truck's location
	marker_add_navpoint( HAZARD02, MINIMAP_ICON_PROTECT_ACQUIRE, "", truck_sync )
	mission_waypoint_add( HAZARD02, truck_sync )

end

-----------------------------------
--                               --     H   H AAAAA ZZZZZ AAAAA RRRR  DDDD         000    222
--   Defend the Trucks Section   --     H   H A   A    ZZ A   A R  RR D  DD       0   0  2  2
--        Part the Second        --     HHHHH AAAAA  ZZZ  AAAAA RRRR  D   D       0   0    2
--             Co-op             --     H   H A   A ZZ    A   A R  R  D  DD       0   0   2
--											--     H   H A   A ZZZZZ A   A R   R DDDD         000   22222
-----------------------------------

COOP_RPG_GUYS02		= {"dlc05_$haz02_rpg_guy01", "dlc05_$haz02_rpg_guy02", "dlc05_$haz02_rpg_guy03",
								"dlc05_$haz02_rpg_guy04", "dlc05_$haz02_rpg_guy05",
								"dlc05_$haz02_rpg_guy_coop01", "dlc05_$haz02_rpg_guy_coop02", "dlc05_$haz02_rpg_guy_coop03",
								"dlc05_$haz02_rpg_guy_coop04", "dlc05_$haz02_rpg_guy_coop05", "dlc05_$haz02_rpg_guy_coop06",
								"dlc05_$haz02_rpg_guy_coop07", "dlc05_$haz02_rpg_guy_coop08", "dlc05_$haz02_rpg_guy_coop09",
								"dlc05_$haz02_rpg_guy_coop10", "dlc05_$haz02_rpg_guy_coop11", "dlc05_$haz02_rpg_guy_coop12",
								"dlc05_$haz02_rpg_guy_coop13", "dlc05_$haz02_rpg_guy_coop14", "dlc05_$haz02_rpg_guy_coop15",
								"dlc05_$haz02_rpg_guy_coop16", "dlc05_$haz02_rpg_guy_coop17", "dlc05_$haz02_rpg_guy_coop18"}

function dlc05_truck02_retrieved( human )

	if human ~= TRUCK_PLAYER then
		return
	end

	local heli_sync = PLAYER_SYNC[HELI_PLAYER]
	local truck_sync = PLAYER_SYNC[TRUCK_PLAYER]

	-----------------------
	-- BOTH PLAYER STUFF --
	-----------------------

	-- Kill the spawn thread
	thread_kill( Coop_truck_spawn_threads[HAZARD02] )

	damage_indicator_on( 0, HAZARD02, 0.0, TEXT_HUD_TRUCK_HEALTH )

	-- Move the old truck away
	teleport_vehicle( HAZARD01, NAV_TRUCK01_ON_SHIP )

	-- Pump up perceived notoriety
	hud_set_fake_notoriety( "Police", true, 4.5 )

	-- Update the RPG guy groups
	if group_is_loaded( GROUP_RPG_GUYS01 ) then
		group_destroy( GROUP_RPG_GUYS01 )
	end

	if group_is_loaded( GROUP_RPG_GUYS_COOP01 ) then
		group_destroy( GROUP_RPG_GUYS_COOP01 )
	end

	group_create_hidden( GROUP_RPG_GUYS02, true )
	group_create_hidden( GROUP_RPG_GUYS_COOP02, true )
	dlc05_setup_all_coop_rpg_guys( COOP_RPG_GUYS02 )

	-- Start the second chase
	thread_kill( Coop_chase_apcs_thread )
	Coop_chase_apcs_thread = thread_new( "dlc05_setup_coop_chase_apcs", DEFEND_TRUCKS_MAX_NUM_APCS[2], DEFEND_TRUCKS_APC_DELAY_S[2] )

	-----------------------
	-- HELI PLAYER STUFF --
	-----------------------

	mission_help_table("TEXT_OBJECTIVE_PROTECT_PLAYER", nil, nil, heli_sync )

	------------------------
	-- TRUCK PLAYER STUFF --
	------------------------

	mission_help_table("TEXT_OBJECTIVE_DELIVER_TRUCK", nil, nil, truck_sync )

	-- Can't get back out
	set_player_can_enter_exit_vehicles( TRUCK_PLAYER, false )

	-- Remove the mark on the truck and make it vulnerable
	mission_waypoint_remove( truck_sync )
	marker_remove_vehicle( HAZARD02, truck_sync )
	marker_remove_navpoint( HAZARD02, truck_sync )
	turn_vulnerable( HAZARD02 )
	dlc05_prep_truck_for_chase( HAZARD02 )

	-- Turn on deliver trigger for the driver
	marker_add_trigger( TRIG_TRUCK_END, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION, truck_sync )
	mission_waypoint_add( TRIG_TRUCK_END, truck_sync )
	trigger_enable( TRIG_TRUCK_END, true )
	on_trigger( "dlc05_truck_end_reached_two", TRIG_TRUCK_END )

	-- Reset the retrieval car
	thread_kill( Retrieval_car_reset_thread )
	Retrieval_car_reset_thread = thread_new( "dlc05_reset_coop_retrieval_car", RETRIEVAL_CAR_DESPAWN_DIST_M )

end

function dlc05_truck_end_reached_two( triggerer, trigger )

	if (triggerer ~= TRUCK_PLAYER) or not character_is_in_vehicle( TRUCK_PLAYER, HAZARD02 ) then
		return
	end

	dlc05_setup_retrieve_coop_truck03()

end

function dlc05_setup_retrieve_coop_truck03()

	local heli_sync = PLAYER_SYNC[HELI_PLAYER]
	local truck_sync = PLAYER_SYNC[TRUCK_PLAYER]

	-----------------------
	-- BOTH PLAYER STUFF --
	-----------------------

	-- Not tracking the old truck
	damage_indicator_off( 0 )

	-- Make sure the truck can't be destroyed at this point
	dlc05_save_truck_after_chase( HAZARD02 )

	-- Start the retrieval chase
	thread_kill( Coop_chase_apcs_thread )
	Coop_chase_apcs_thread = thread_new( "dlc05_setup_coop_chase_apcs", RETRIEVAL_MAX_NUM_APCS[2], RETRIEVAL_APC_DELAY_S[2] )

	-----------------------
	-- HELI PLAYER STUFF --
	-----------------------

	mission_help_table("TEXT_OBJECTIVE_PROTECT_THIRD_TRUCK", nil, nil, heli_sync )

	thread_new( "dlc05_enemy_tornado" )

	------------------------
	-- TRUCK PLAYER STUFF --
	------------------------

	mission_help_table("TEXT_OBJECTIVE_GET_THIRD_TRUCK", nil, nil, truck_sync )

	-- Remove the trigger
	trigger_enable( TRIG_TRUCK_END, false )
	mission_waypoint_remove( truck_sync )
	marker_remove_trigger( TRIG_TRUCK_END, truck_sync )

	-- Kill the countdown
	dlc05_truck_player_timer_end()

	-- Kick the player out
	dlc05_stop_truck_and_kick_out_players( HAZARD02 )

	-- Let the player enter stuff normally
	set_player_can_enter_exit_vehicles( TRUCK_PLAYER, true )

	-- Make the retrieval car vulnerable
	turn_vulnerable( COOP_RETRIEVAL_CAR )

	-- Start the retrieval of the next truck
	dlc05_truck_player_timer_start( DEFEND_TRUCKS_DELIVER_TIME_S[3] )

	-- Start the spawn thread
	Coop_truck_spawn_threads[HAZARD03] = thread_new( "dlc05_spawn_coop_chase_truck", HAZARD03_COOP_INFO )

	-- Mark the truck's location
	marker_add_navpoint( HAZARD03, MINIMAP_ICON_PROTECT_ACQUIRE, "", truck_sync )
	mission_waypoint_add( HAZARD03, truck_sync )

end

-----------------------------------
--                               --     H   H AAAAA ZZZZZ AAAAA RRRR  DDDD         000   3333
--   Defend the Trucks Section   --     H   H A   A    ZZ A   A R  RR D  DD       0   0      3
--        Part the Third         --     HHHHH AAAAA  ZZZ  AAAAA RRRR  D   D       0   0    33
--            Co-op              --     H   H A   A ZZ    A   A R  R  D  DD       0   0      3
--											--     H   H A   A ZZZZZ A   A R   R DDDD         000   3333
-----------------------------------

COOP_RPG_GUYS03		= {"dlc05_$haz03_rpg_guy01", "dlc05_$haz03_rpg_guy02", "dlc05_$haz03_rpg_guy03",
								"dlc05_$haz03_rpg_guy04", "dlc05_$haz03_rpg_guy05", "dlc05_$haz03_rpg_guy06",
								"dlc05_$haz03_rpg_guy07", "dlc05_$haz03_rpg_guy08", "dlc05_$haz03_rpg_guy09",
								"dlc05_$haz03_rpg_guy_coop01", "dlc05_$haz03_rpg_guy_coop02", "dlc05_$haz03_rpg_guy_coop03",
								"dlc05_$haz03_rpg_guy_coop04", "dlc05_$haz03_rpg_guy_coop05", "dlc05_$haz03_rpg_guy_coop06",
								"dlc05_$haz03_rpg_guy_coop07", "dlc05_$haz03_rpg_guy_coop08", "dlc05_$haz03_rpg_guy_coop09",
								"dlc05_$haz03_rpg_guy_coop10", "dlc05_$haz03_rpg_guy_coop11", "dlc05_$haz03_rpg_guy_coop12",
								"dlc05_$haz03_rpg_guy_coop13", "dlc05_$haz03_rpg_guy_coop14", "dlc05_$haz03_rpg_guy_coop15",
								"dlc05_$haz03_rpg_guy_coop16", "dlc05_$haz03_rpg_guy_coop17", "dlc05_$haz03_rpg_guy_coop18",
								"dlc05_$haz03_rpg_guy_coop19", "dlc05_$haz03_rpg_guy_coop20", "dlc05_$haz03_rpg_guy_coop21",
								"dlc05_$haz03_rpg_guy_coop22", "dlc05_$haz03_rpg_guy_coop23", "dlc05_$haz03_rpg_guy_coop24",
								"dlc05_$haz03_rpg_guy_coop25", "dlc05_$haz03_rpg_guy_coop26"}

function dlc05_truck03_retrieved( human )

	if human ~= TRUCK_PLAYER then
		return
	end

	local heli_sync = PLAYER_SYNC[HELI_PLAYER]
	local truck_sync = PLAYER_SYNC[TRUCK_PLAYER]

	-----------------------
	-- BOTH PLAYER STUFF --
	-----------------------

	-- Kill the spawn thread
	thread_kill( Coop_truck_spawn_threads[HAZARD03] )

	damage_indicator_on( 0, HAZARD03, 0.0, TEXT_HUD_TRUCK_HEALTH )

	-- Move the old truck away
	teleport_vehicle( HAZARD02, NAV_TRUCK02_ON_SHIP )

	-- Pump up perceived notoriety
	hud_set_fake_notoriety( "Police", true, 5 )

	-- Update the RPG guys
	if group_is_loaded( GROUP_RPG_GUYS02 ) then
		group_destroy( GROUP_RPG_GUYS02 )
	end

	if group_is_loaded( GROUP_RPG_GUYS_COOP02 ) then
		group_destroy( GROUP_RPG_GUYS_COOP02 )
	end

	group_create_hidden( GROUP_RPG_GUYS03, true )
	group_create_hidden( GROUP_RPG_GUYS_COOP03, true )
	dlc05_setup_all_coop_rpg_guys( COOP_RPG_GUYS03 )

	-- Start the third chase
	thread_kill( Coop_chase_apcs_thread )
	Coop_chase_apcs_thread = thread_new( "dlc05_setup_coop_chase_apcs", DEFEND_TRUCKS_MAX_NUM_APCS[3], DEFEND_TRUCKS_APC_DELAY_S[3] )

	-----------------------
	-- HELI PLAYER STUFF --
	-----------------------

	mission_help_table("TEXT_OBJECTIVE_PROTECT_PLAYER", nil, nil, heli_sync )

	------------------------
	-- TRUCK PLAYER STUFF --
	------------------------

	mission_help_table("TEXT_OBJECTIVE_DELIVER_TRUCK", nil, nil, truck_sync )

	-- Can't get back out
	set_player_can_enter_exit_vehicles( TRUCK_PLAYER, false )

	-- Remove the mark on the truck and make it vulnerable
	mission_waypoint_remove( truck_sync )
	marker_remove_vehicle( HAZARD03, truck_sync )
	marker_remove_navpoint( HAZARD03, truck_sync )
	turn_vulnerable( HAZARD03 )
	dlc05_prep_truck_for_chase( HAZARD03 )

	-- Turn on deliver trigger for the driver
	marker_add_trigger( TRIG_TRUCK_END, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION, truck_sync )
	mission_waypoint_add( TRIG_TRUCK_END, truck_sync )
	trigger_enable( TRIG_TRUCK_END, true )
	on_trigger( "dlc05_truck_end_reached_three", TRIG_TRUCK_END )

end

function dlc05_truck_end_reached_three( triggerer, trigger )

	if (triggerer ~= TRUCK_PLAYER) or not character_is_in_vehicle( TRUCK_PLAYER, HAZARD03 ) then
		return
	end

	local heli_sync = PLAYER_SYNC[HELI_PLAYER]
	local truck_sync = PLAYER_SYNC[TRUCK_PLAYER]

	-----------------------
	-- BOTH PLAYER STUFF --
	-----------------------

	-- Not tracking the old truck
	damage_indicator_off( 0 )

	-- Make sure the truck can't be destroyed at this point
	dlc05_save_truck_after_chase( HAZARD03 )

	-----------------------
	-- HELI PLAYER STUFF --
	-----------------------

	------------------------
	-- TRUCK PLAYER STUFF --
	------------------------

	-- Remove the trigger
	trigger_enable( TRIG_TRUCK_END, false )
	mission_waypoint_remove( truck_sync )
	marker_remove_trigger( TRIG_TRUCK_END, truck_sync )

	-- Kill the countdown
	dlc05_truck_player_timer_end()

	-- Stop the truck
	vehicle_stop_do( HAZARD03 )

	-- And we're done!
	thread_new( "dlc05_end_chase_finish" )

end

-------------------------------------------------
-- Anything that exists in Multiple Objectives --
-------------------------------------------------

You_have_been_warned = false

function dlc05_ultor_goon_got_hurt( goon, attacker )

	if You_have_been_warned then
		return
	end

	if attacker and character_is_player( attacker ) then
		mission_help_table_nag("TEXT_HELP_DONT_KILL")
		You_have_been_warned = true
	end

end

function dlc05_character_is_active( npc )

	return (character_exists( npc ) and not character_is_dead( npc ))

end

function dlc05_vehicle_is_active( vehicle )

	return (vehicle_exists( vehicle ) and not vehicle_is_destroyed( vehicle ))

end

function dlc05_is_coop_truck_chase()

	return (IN_COOP or DEBUG_TEST_COOP_DRIVE)

end

-- Activates a new thread when both players are near a marked nav
function dlc05_delay_thread_until_players_near_nav( nav, func )

	-- Don't check this if we don't have two players
	if IN_COOP then

		local function get_farthest_dist()

			local farthest_dist

			for i, player in pairs( PLAYER_LIST ) do
				local dist = get_dist( player, nav )

				if not farthest_dist or (dist > farthest_dist) then
					farthest_dist = dist
				end
			end

			return farthest_dist

		end

		if get_farthest_dist() > DIST_TO_TRIGGER_OBJECTIVE_M then
			-- Mark the nav
			marker_add_navpoint( nav, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION )
			mission_waypoint_add( nav )

			-- Nag message for players to get closer
			mission_help_table_nag("TEXT_HELP_COOP_STICK_TOGETHER")

			delay( 3 )

			local current_dist
			repeat
				current_dist = get_farthest_dist()
				thread_yield()
			until current_dist <= DIST_TO_TRIGGER_OBJECTIVE_M

			-- Unmark the nav
			marker_remove_navpoint( nav )
			mission_waypoint_remove()
		end
	end

	thread_new( func )

end

function dlc05_setup_cellphone_conversation( conversation, animate )

	-- Have the phone ring
	audio_play(CELLPHONE_INCOMING, "foley", true)

	-- Answer the phone
	if not character_is_ready_to_speak( LOCAL_PLAYER ) then
		return
	end

	if animate then
		cellphone_animate_start_do()
	end

   delay( 0.5 )

	-- Play the conversation
	if not character_is_ready_to_speak( LOCAL_PLAYER ) then
		if animate then
			cellphone_animate_stop_do()
		end

		return
	end

	-- This is mostly a copy of audio_play_conversation(), except without character checks
   for segment_index, dialog_segment in pairs( conversation ) do
      local audio_name = dialog_segment[DIALOG_STREAM_AUDIO_NAME_INDEX]
      local speaking_character = dialog_segment[DIALOG_STREAM_CHAR_NAME_INDEX]
      local delay_seconds = dialog_segment[DIALOG_STREAM_DELAY_SECONDS_INDEX]
		local anim_action = dialog_segment[DIALOG_STREAM_ANIM_ACTION_INDEX]

		-- For players, use audio_play_for_character so that the tag can be correctly translated
		if (	speaking_character ~= nil and character_is_player( speaking_character ) ) then
			-- Don't play lines unless and until the player is alive and in a state to deliver them
			repeat
				thread_yield()
			until ( character_is_ready_to_speak( speaking_character ) )
			audio_play_for_character( audio_name, speaking_character, "voice", false, true)

		elseif ( speaking_character == CELLPHONE_CHARACTER or speaking_character == nil ) then
			-- for_cutscene = false, blocking = true, variant = nil, voice_distance = nil, cellphone_line = true
			audio_play_for_character( audio_name, LOCAL_PLAYER, "voice", false, true, nil, nil, true )

		else
			script_assert( false, "You must specify CELLPHONE_CHARACTER as the speaking character ( or leave it at nil ) for the other side of a cellphone conversation." )
			audio_play( audio_name, "voice", true )
		end

		delay( delay_seconds )
   end

	-- Put up the phone
	if animate then
		cellphone_animate_stop_do()
	end

end

-- Copied from DLC03, fix for heli pathfinding co-op bug
function dlc05_fly_to_direct_even_in_coop( heli, speed, path )

	-- Determine if we have a table or a single path
	local arg_type = type( path )

	-- If we have a table, then pathfind through the individual points one at a time
	if arg_type == "table" then
		local num_nodes = sizeof_table( path )

		-- Pathfind through the all but the last node without stopping
		for i = 1, num_nodes - 1, 1 do
			-- Return early if the heli is disabled
			if not dlc05_vehicle_is_active( heli ) then
				return
			end

			-- Pathfind through the next 2 nodes in the path
			local path_thread = thread_new( "dlc05_fly_to_direct_dont_stop", heli, speed, {path[i], path[i+1]} )

			-- Should we move on to the next navpoint?
			local move_to_next_node = false

			-- Has the heli gotten close to the current navpoint?
			local approached_navp = false

			-- The closest that the heli has been to the current navpoint?
			local nearest_dist = get_dist( heli, path[i] )

			while not move_to_next_node and dlc05_vehicle_is_active( heli ) do
				local current_dist = get_dist( heli, path[i] )

				-- Consider the heli to have approached the navp after it gets within 8 meters.
				if not approached_navp and (current_dist < HELI_NODE_APPROACH_DIST_M) then
					approached_navp = true
				end

				-- If the navp has been approached and the distance is no longer shrinking, move to the next node.
				if approached_navp and (current_dist >= nearest_dist) then
					move_to_next_node = true

				-- Also move to the next node if we're closer to it already
				elseif get_dist( heli, path[i+1] ) < current_dist then
					move_to_next_node = true

				-- Otherwise, update the nearest distance
				elseif current_dist < nearest_dist then
					nearest_dist = current_dist
				end

				thread_yield()
			end

			-- Kill the current pathfind, we'll start a new one soon.
			thread_kill( path_thread )
		end

		-- Pathfind to the last node and stop
		helicopter_fly_to_direct( heli, speed, path[num_nodes] )

	elseif arg_type == "string" then
		-- Pathfind to the last node and stop
		helicopter_fly_to_direct( heli, speed, path )
	end

end

-- A wrapper for helicopter_fly_to_direct so that we can spawn it in its own thread
function dlc05_fly_to_direct_dont_stop( heli, speed, path )

	helicopter_fly_to_direct_dont_stop( heli, speed, path )

end

function dlc05_stop_truck_and_kick_out_players( truck )

	-- Keep track of who was in the truck
	local players_in_truck = {}

	-- Bring the truck to a stop
	for i, player in pairs( PLAYER_LIST ) do
		if character_is_in_vehicle( player, truck ) then
			player_controls_disable( player )
			players_in_truck[player] = true
		end
	end

	vehicle_stop_do( truck )
	repeat
		thread_yield()
	until get_vehicle_speed( truck ) < VEHICLE_EXIT_SPEED

	-- Unjackable so no one can get back in
	set_unjackable_flag( truck, true )

	for player, dummy in pairs( players_in_truck ) do
		-- pop the players out
		vehicle_exit( player, true )

		-- re-enable player control
		player_controls_enable( player )
	end

end

function dlc05_prep_truck_for_chase( truck )

	if dlc05_is_coop_truck_chase() then
		set_unjackable_flag( truck, false )
		vehicle_max_speed( truck, HAZARD_SPEED_OVERRIDE_COOP)
		vehicle_infinite_mass( truck, false )
		vehicle_set_explosion_damage_multiplier( truck, HAZARD_EXPLOSION_MULTIPLIER_COOP )

		if DEBUG_COOP_TRUCK_INVULNERABLE then
			turn_invulnerable( truck )
		end
	else
		set_unjackable_flag( truck, true )
		vehicle_max_speed( truck, HAZARD_SPEED_OVERRIDE )
		vehicle_infinite_mass( truck, true )
		vehicle_set_explosion_damage_multiplier( truck, HAZARD_EXPLOSION_MULTIPLIER )
	end

	vehicle_prevent_explosion_fling( truck, true )
	vehicle_set_invulnerable_to_player_explosives( truck, true )
	vehicle_suppress_flipping( truck, true )

end

function dlc05_save_truck_after_chase( truck )

	-- Make sure the truck can't be destroyed at this point
	turn_invulnerable( truck )

	-- Douse any fires
	local smoke, fire = vehicle_get_smoke_and_fire_state( truck )
	vehicle_set_smoke_and_fire_state( truck, smoke, false )

	-- Make sure it's got enough HP to not be on fire later
	local current_hp = get_current_hit_points( truck )
	local max_hp = get_max_hit_points( truck )

	if current_hp < 0.20 * max_hp then
		set_current_hit_points( truck, 0.20 * max_hp )
	end

end

-- Puts up the interface for killing off the remaining Masako
function dlc05_do_kill_remaining_masako( masako_list )

	-- First kill all masako in the water.  Don't care how they got there,
	-- but they're not in the action.
	for i, npc in pairs( masako_list ) do
		if dlc05_character_is_active( npc ) and character_is_swimming( npc ) then
			character_kill( npc )
		end
	end

	-- Go through each NPC to see if we want them
	local masako_to_kill = {}

	for i, npc in pairs( masako_list ) do
		if dlc05_character_is_active( npc ) then
			masako_to_kill[npc] = true
			marker_add_npc( npc, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL )
		end
	end

	local current_size = sizeof_table( masako_to_kill )
	if current_size == 0 then
		-- No Masako to kill, skip this objective
		return
	end

	-- Change the objective to cleaning up masako
	mission_help_table("TEXT_OBJECTIVE_KILL_REMAINING_ULTOR")

	-- Display the number of kills remaining
	objective_text( 0, "TEXT_HUD_ULTOR_REMAINING", current_size )

	while current_size > 0 do
		-- Check for death
		local masako_deaths = {}

		for npc, i in pairs( masako_to_kill ) do
			if not dlc05_character_is_active( npc ) then
				masako_deaths[npc] = true
			end
		end

		-- Clear out the NPCs who died
		for npc, i in pairs( masako_deaths ) do
			masako_to_kill[npc] = nil
			marker_remove_npc( npc )
		end

		local size = sizeof_table( masako_to_kill )

		if current_size ~= size then
			current_size = size

			-- Update the interface
			objective_text( 0, "TEXT_HUD_ULTOR_REMAINING", current_size )
		end

		thread_yield()
	end

	objective_text_clear( 0 )

end

-- Distance tracking for chasing the trucks in a heli
function dlc05_start_truck_abandon_check( truck )

	if DEBUG_TEST_RPG_GUYS or DEBUG_TEST_COOP_DRIVE then
		return
	end

	local sync = PLAYER_SYNC[HELI_PLAYER]
	local timer_index = PLAYER_TIMER_INDEX[HELI_PLAYER]

	local timing_out_of_range = false

   while true do
      -- Heli is in range
      if get_dist( FRIENDLY_TORNADO, truck ) <= CHASE_TRUCK_ABANDON_DIST_M then
         -- Heli just moved into range
         if timing_out_of_range then
            -- Stop the failure timer
            hud_timer_stop( timer_index )
            timing_out_of_range = false

				-- Remove the distance display
				distance_display_off( sync )

				-- Nag them about guarding the truck
				mission_help_table_nag("TEXT_HELP_DEFEND_TRUCK", nil, nil, sync )
         end

      -- Heli is out of range now
      else
         -- Heli just moved out of range
         if not timing_out_of_range then
            -- Start the failure timer
            hud_timer_set( timer_index, CHASE_TRUCK_ABANDON_TIME_S * 1000, "TEXT_HELP_ABANDONING_TRUCK", true, sync )
            timing_out_of_range = true

				-- Add a distance for the truck
				distance_display_on( truck, 0.0, CHASE_TRUCK_ABANDON_DIST_M, 0.0, CHASE_TRUCK_ABANDON_DIST_M, sync )

            -- Tell the player to get back in range
            mission_help_table_nag("TEXT_HELP_ABANDONING_TRUCK", nil, nil, sync )
         end
      end

      thread_yield()
   end

end

function dlc05_stop_truck_abandon_check()

	thread_kill( Truck_abandon_thread )
	hud_timer_stop( PLAYER_TIMER_INDEX[HELI_PLAYER] )
	distance_display_off( PLAYER_SYNC[HELI_PLAYER] )

end

-- Handles truck drivers exiting (which won't work properly if the chunk isn't streamed in)
function dlc05_truck_driver_exit( npc )

	local dist, player = get_dist_closest_player_to_object( npc, PLAYER_LIST )

	if dist <= CHASE_TRUCK_ABANDON_DIST_M then
		-- Try the full animation
		Truck_driver_exit_threads[npc] = thread_new( "dlc05_truck_driver_exit_thread", npc )

		delay( 5 )

		-- We've waited long enough, just destroy the driver outright
		thread_kill( Truck_driver_exit_threads[npc] )
	end

	object_destroy( DRIVER01 )

end

function dlc05_truck_driver_exit_thread( npc )

	vehicle_exit( npc )

	move_to( npc, NAV_DRIVER_EXIT, 2, true, false )
	release_to_world( npc )

end

-- Reminder times are assumed to be in seconds
function dlc05_truck_player_timer_start( time_s )

	if DEBUG_COOP_LOTSA_TIME then
		time_s = 3600
	end

	hud_timer_set( PLAYER_TIMER_INDEX[TRUCK_PLAYER], time_s * 1000, "TEXT_FAIL_TRUCK_NOT_DELIVERED", true, PLAYER_SYNC[TRUCK_PLAYER] )

	-- Only set up reminders that are later than the time we start with
	local reminder_time_list = {}
	local idx = 1
	for i, t in pairs( DELIVER_TRUCK_REMINDER_TIME_LIST ) do
		if t < time_s then
			reminder_time_list[idx] = {time = t, done = false}
			idx = idx + 1
		end
	end

	Truck_player_time_thread = thread_new( "dlc05_truck_player_timer_process", reminder_time_list )

end

function dlc05_truck_player_timer_process( reminder_time_list )

	-- Reminds the player once for every time on the list (descending)

	local message_done_list = {}
	for i, t in pairs( reminder_time_list ) do
		message_done_list[i] = {time = t, done = false}
	end

	while true do
		for i, info in ipairs( reminder_time_list ) do
			if not info.done and (hud_timer_get_remainder( PLAYER_TIMER_INDEX[TRUCK_PLAYER] ) <= info.time * 1000 + 500) then
				mission_help_table_nag("TEXT_HELP_DELIVER_TIME_LEFT", "" .. info.time, nil, PLAYER_SYNC[TRUCK_PLAYER] )
				info.done = true

				if i == sizeof_table( reminder_time_list ) then
					return
				else
					break
				end
			end
		end

		thread_yield()
	end

end

function dlc05_truck_player_timer_end()

	thread_kill( Truck_player_time_thread )
	hud_timer_stop( PLAYER_TIMER_INDEX[TRUCK_PLAYER] )

end

function dlc05_reset_coop_retrieval_car( min_dist )

	if min_dist and vehicle_exists( COOP_RETRIEVAL_CAR ) then
		-- Don't reset until the truck driver is a certain distance away
		while get_dist( TRUCK_PLAYER, COOP_RETRIEVAL_CAR ) < min_dist do
			delay( 0.25 )
		end
	end

	if group_is_loaded( GROUP_COOP_RETRIEVAL_CAR ) then
		group_destroy( GROUP_COOP_RETRIEVAL_CAR )
	end

	group_create( GROUP_COOP_RETRIEVAL_CAR )

	set_max_hit_points( COOP_RETRIEVAL_CAR, get_max_hit_points( COOP_RETRIEVAL_CAR ) * RETRIEVAL_CAR_HITPOINT_MULTIPLIER, true )
	vehicle_max_speed( COOP_RETRIEVAL_CAR, RETRIEVAL_CAR_MAX_SPEED_OVERRIDE )
	vehicle_set_explosion_damage_multiplier( COOP_RETRIEVAL_CAR, RETRIEVAL_CAR_EXPLOSION_DAMAGE_MULTIPLIER )
	vehicle_set_invulnerable_to_player_explosives( COOP_RETRIEVAL_CAR, true )

	-- Invulnerable until the player needs it
	turn_invulnerable( COOP_RETRIEVAL_CAR )
	vehicle_prevent_explosion_fling( COOP_RETRIEVAL_CAR, true )

end

---------------------------------------------
-- Functions to handle truck chasing vehicles
---------------------------------------------

COOP_APC_INFOS =
{
	{
		group								= "dlc05_$group_apc01",
		apc								= "dlc05_$apc01",
		occupants						= {"dlc05_$apc01_crew01", "dlc05_$apc01_crew02"},
		target							= TRUCK_PLAYER,
	},
	{
		group								= "dlc05_$group_apc02",
		apc								= "dlc05_$apc02",
		occupants						= {"dlc05_$apc02_crew01", "dlc05_$apc02_crew02"},
		target							= TRUCK_PLAYER,
	},
	{
		group								= "dlc05_$group_apc04",
		apc								= "dlc05_$apc04",
		occupants						= {"dlc05_$apc04_crew01", "dlc05_$apc04_crew02"},
		target							= TRUCK_PLAYER,
	},
	{
		group								= "dlc05_$group_apc05",
		apc								= "dlc05_$apc05",
		occupants						= {"dlc05_$apc05_crew01", "dlc05_$apc05_crew02"},
		target							= TRUCK_PLAYER,
	},
	{
		group								= "dlc05_$group_apc06",
		apc								= "dlc05_$apc06",
		occupants						= {"dlc05_$apc06_crew01", "dlc05_$apc06_crew02"},
		target							= TRUCK_PLAYER,
	},
	{
		group								= "dlc05_$group_apc07",
		apc								= "dlc05_$apc07",
		occupants						= {"dlc05_$apc07_crew01", "dlc05_$apc07_crew02"},
		target							= TRUCK_PLAYER,
	},
	{
		group								= "dlc05_$group_apc08",
		apc								= "dlc05_$apc08",
		occupants						= {"dlc05_$apc08_crew01", "dlc05_$apc08_crew02"},
		target							= TRUCK_PLAYER,
	},
	{
		group								= "dlc05_$group_apc09",
		apc								= "dlc05_$apc09",
		occupants						= {"dlc05_$apc09_crew01", "dlc05_$apc09_crew02"},
		target							= TRUCK_PLAYER,
	},
	{
		group								= "dlc05_$group_apc10",
		apc								= "dlc05_$apc10",
		occupants						= {"dlc05_$apc10_crew01", "dlc05_$apc10_crew02"},
		target							= TRUCK_PLAYER,
	},
	{
		group								= "dlc05_$group_apc11",
		apc								= "dlc05_$apc11",
		occupants						= {"dlc05_$apc11_crew01", "dlc05_$apc11_crew02"},
		target							= TRUCK_PLAYER,
	},
	{
		group								= "dlc05_$group_apc13",
		apc								= "dlc05_$apc13",
		occupants						= {"dlc05_$apc13_crew01", "dlc05_$apc13_crew02"},
		target							= TRUCK_PLAYER,
	},
	{
		group								= "dlc05_$group_apc14",
		apc								= "dlc05_$apc14",
		occupants						= {"dlc05_$apc14_crew01", "dlc05_$apc14_crew02"},
		target							= TRUCK_PLAYER,
	},
	{
		group								= "dlc05_$group_apc15",
		apc								= "dlc05_$apc15",
		occupants						= {"dlc05_$apc15_crew01", "dlc05_$apc15_crew02"},
		target							= TRUCK_PLAYER,
	},
	{
		group								= "dlc05_$group_apc16",
		apc								= "dlc05_$apc16",
		occupants						= {"dlc05_$apc16_crew01", "dlc05_$apc16_crew02"},
		target							= TRUCK_PLAYER,
	},
	{
		group								= "dlc05_$group_apc17",
		apc								= "dlc05_$apc17",
		occupants						= {"dlc05_$apc17_crew01", "dlc05_$apc17_crew02"},
		target							= TRUCK_PLAYER,
	},
	{
		group								= "dlc05_$group_apc18",
		apc								= "dlc05_$apc18",
		occupants						= {"dlc05_$apc18_crew01", "dlc05_$apc18_crew02"},
		target							= TRUCK_PLAYER,
	},
}

-- Given an APC info table, send the APC after its target
-- APC info:
--		group:		name of group for APC and passengers
--		apc:			name of vehicle
--		occupants:	names of passengers
--		target:		name of driver target
function dlc05_send_chase_apc( apc_info )

	if DEBUG_TEST_RPG_GUYS then
		return
	end

	group_create_hidden( apc_info.group, true )

	local apc = apc_info.apc

	for i, npc in pairs( apc_info.occupants ) do
		vehicle_enter_teleport( npc, apc, i - 1 )
		set_max_hit_points( npc, get_max_hit_points( npc ) * MASAKO_HITPOINT_MULTIPLIER, true )
		set_attack_enemies_flag( npc, true )
		set_attack_player_flag( npc, true )

		if (i == 1) and dlc05_is_coop_truck_chase() then
			-- Give a one-handed weapon to the driver
			dlc05_give_masako_random_weapon( npc, false )
		else
			dlc05_give_masako_random_weapon( npc, true )
		end
	end

	set_max_hit_points( apc, get_max_hit_points( apc ) * APC_HEALTH_MULTIPLIER, true )

	group_show( apc_info.group )

	-- So the Masako don't get out and do weird things
	vehicle_suppress_npc_exit( apc, true )
	set_unjackable_flag( apc, true )

	vehicle_chase( apc, apc_info.target, false, true, true )

end

function dlc05_send_additional_chase_apc_at_nav( apc_info )

	if not apc_info.send_nav then
		-- No send nav, so just send it immediately
		dlc05_send_chase_apc( apc_info )
		return
	end

	repeat
		delay( 0.25 )
	until get_dist( apc_info.target, apc_info.send_nav ) < TRUCK_PARK_DIST_M	-- Middle of truck path

	delay( 1 )

	dlc05_send_chase_apc( apc_info )

end

function dlc05_setup_coop_chase_apcs( max_num, delay_s )

	if DEBUG_COOP_NO_APCS then
		return
	end

	-- Immediately send half of the max out
	local initial_num = floor( max_num / 2 )
	while sizeof_table( Coop_chase_apcs_active ) < initial_num do
		if thread_check_done( Coop_chase_apc_spawn_thread ) then
			Coop_chase_apc_spawn_thread = thread_new( "dlc05_choose_and_send_coop_chase_apc" )
		end

		thread_yield()
	end

	while true do
		-- Find all the invalid chasers from the list
		local apcs_to_remove = {}

		for apc, info in pairs( Coop_chase_apcs_active ) do
			if not dlc05_vehicle_is_active( apc ) or
				not dlc05_character_is_active( info.occupants[1] ) or
				(get_dist( apc, TRUCK_PLAYER ) > APC_MAX_SPAWN_DIST_M) then

				apcs_to_remove[apc] = info
			end
		end

		-- Now get rid of them
		for apc, info in pairs( apcs_to_remove ) do
			release_to_world( info.group )
			group_destroy( info.group )
			Coop_chase_apcs_active[apc] = nil
		end

		-- Only spawn one at a time
		if sizeof_table( Coop_chase_apcs_active ) < max_num and thread_check_done( Coop_chase_apc_spawn_thread ) then
			delay( delay_s )
			Coop_chase_apc_spawn_thread = thread_new( "dlc05_choose_and_send_coop_chase_apc" )
		end

		delay( 0.25 )
	end

end

function dlc05_choose_and_send_coop_chase_apc()

	local apc_candidates = {}
	local first_idx = 0
	local apc_created = false

	repeat
		-- Find any possible APCs to create, sorted by distance
		for i, info in pairs( COOP_APC_INFOS ) do
			local apc = info.apc

			if not Coop_chase_apcs_active[apc] and										-- Vehicle isn't active
				not navpoint_in_player_fov( apc, TRUCK_PLAYER, 3.0 ) then		-- Not in field of view

				local dist = get_dist( TRUCK_PLAYER, apc )
				if (APC_MIN_SPAWN_DIST_M <= dist) and (dist <= APC_MAX_SPAWN_DIST_M) then

					local current_idx
					if not apc_candidates[first_idx] then
						current_idx = first_idx
					else
						-- Find where to place this in the array
						local last_idx = sizeof_table( apc_candidates ) + first_idx - 1

						current_idx = last_idx + 1
						for i = first_idx, last_idx do
							if dist < apc_candidates[i].dist then
								current_idx = i-1
							end
						end
					end

					apc_candidates[current_idx] = {["info"] = info, ["dist"] = dist}

					if current_idx < first_idx then
						first_idx = current_idx
					end
				end
			end
		end

		if sizeof_table( apc_candidates ) > 0 then
			-- Choose randomly from the first two entries
			local rand_idx = rand_int( first_idx, first_idx + min( sizeof_table( apc_candidates ), 2 ) - 1 )
			local chosen_info = apc_candidates[rand_idx].info

			-- How are we not in the list?  Well, whatever
			if group_is_loaded( chosen_info.group ) then
				release_to_world( chosen_info.group )
				group_destroy( chosen_info.group )
			end

			dlc05_send_chase_apc( chosen_info )

			Coop_chase_apcs_active[chosen_info.apc] = chosen_info
			apc_created = true
		end

		thread_yield()
	until apc_created

end

-------------------------------------------
-- Functions to handle rocket shooting NPCs
-------------------------------------------

function dlc05_setup_random_rpg_guys( rpg_guy_info_list, max_num )

	-- Copy the list
	local remaining_list = {}
	for i, info in pairs( rpg_guy_info_list ) do
		remaining_list[i] = info
	end

	local num_remaining = max( sizeof_table( remaining_list ) - max_num, 0 )

	-- Spawn all when testing
	if DEBUG_TEST_RPG_GUYS then
		num_remaining = 0
	end

	while sizeof_table( remaining_list ) > num_remaining do
		-- Pick a random info
		local rand_count = rand_int( 1, sizeof_table( remaining_list ) )

		local count = 1
		for i, info in pairs( remaining_list ) do
			if count == rand_count then
				dlc05_setup_rpg_guy_sp( info )
				remaining_list[i] = nil
				break
			end

			count = count + 1
		end
	end

end

function dlc05_setup_all_coop_rpg_guys( npc_list )

	-- Create all the guys on the list
	for i, npc in pairs( npc_list ) do
		dlc05_setup_rpg_guy_coop( npc )
	end

	-- Start the thread to mark them as necessary
	thread_kill( Rpg_guy_fov_mark_thread )
	thread_yield()
	Rpg_guy_fov_mark_thread = thread_new( "dlc05_mark_rpg_guys_in_fov", npc_list )

end

function dlc05_setup_rpg_guy_common( npc )

	-- Assumed that the group was created hidden
	character_show( npc )

	-- Really, really easy to kill
	set_max_hit_points( npc, 10, true )

	-- But invulnerable to everyone but the player (so they don't blow themselves up)
	turn_invulnerable( npc, true )
	character_prevent_explosion_fling( npc, true )

	-- Can't move from starting location
	npc_leash_to_nav( npc, npc, 0.005 )
	npc_leash_set_unbreakable( npc, true )

	-- Give him the namesake weapon
	inv_item_remove_all( npc )
	inv_item_add( "rpg_launcher", 1, npc, true )

	character_set_combat_ready( npc, true, 2000 )

	on_death( "dlc05_rpg_guy_death", npc )

end

function dlc05_setup_rpg_guy_sp( rpg_guy_info )

	local npc = rpg_guy_info.npc

	dlc05_setup_rpg_guy_common( npc )

	marker_add_npc( npc, MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL )

	-- Only fires the RPG once
	on_weapon_fired( "dlc05_rpg_guy_finish_attack", npc )

	-- Make him aim at a specified point
	npc_aim_at_point( npc, rpg_guy_info.aim_nav )

	-- Setup the fire trigger for the pathing trucks
	local trigger = rpg_guy_info.fire_trigger

	on_trigger( "dlc05_rpg_guy_trigger_attack", trigger )
	trigger_enable( trigger, true )

end

function dlc05_setup_rpg_guy_coop( npc )

	dlc05_setup_rpg_guy_common( npc )

	if DEBUG_SHOW_RPG_GUYS_FOR_TRUCK and not IN_COOP then
		-- Okay to add them all at once if there's no syncing
		marker_add_npc( npc, MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL )
	end

	on_weapon_fired( "", npc )

	set_perfect_aim( npc, true )

	-- Just attacks the truck player directly
	Rpg_guy_fire_threads[npc] = thread_new( "dlc05_rpg_guy_attack_truck_player", npc )

end

-- We can have too many guys to mark in co-op at once without blowing an allocator,
-- so we need to only put arrows over the ones we can see
function dlc05_mark_rpg_guys_in_fov( npc_list )

	local list = {}
	for i, npc in pairs( npc_list ) do
		list[npc] = true
	end

	while sizeof_table( list ) > 0 do
		local npcs_marked = {}

		for npc, i in pairs( list ) do
			if not dlc05_character_is_active( npc ) then
				-- No need to mark
				npcs_marked[npc] = true

			elseif npc_in_player_fov( npc, HELI_PLAYER ) or npc_in_player_fov( npc, TRUCK_PLAYER ) then
				-- Make sure the distance is close enough
				local dist, player = get_dist_closest_player_to_object( npc, PLAYER_LIST )

				if dist <= CHASE_TRUCK_ABANDON_DIST_M then
					if DEBUG_SHOW_RPG_GUYS_FOR_TRUCK and IN_COOP then
						marker_add_npc( npc, MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL )
					else
						-- Too many to fit on the minimap, clutters things up
						marker_add_npc( npc, "", INGAME_EFFECT_VEHICLE_KILL )
					end

					npcs_marked[npc] = true
				end
			end
		end

		-- Removed the marked NPCs
		for npc, i in pairs( npcs_marked ) do
			list[npc] = nil
		end

		thread_yield()
	end

end

function dlc05_rpg_guy_trigger_attack( triggerer, trigger )

	-- Find the associated RPG info
	local rpg_guy_info = CHASE_TRIGGER_TO_RPG_INFO[trigger]

	if not rpg_guy_info or (triggerer ~= rpg_guy_info.target) then
		return
	end

	trigger_enable( trigger, false )

	local npc = rpg_guy_info.npc

	-- See if the guy is still alive at this point
	if not dlc05_character_is_active( npc ) then
		return
	end

	-- HACK: Animation isn't processing past a certain distance, so if you're at that distance, just make an explosion
	local fake_it = false
	local dist
	for i, player in pairs( PLAYER_LIST ) do
		-- Bone LOD 2 distance
		dist = get_dist( player, npc )
		if dist >= 45.0 then
			fake_it = true
			break
		end
	end

	-- HACK: Also do it if you're not looking at the guy
	if not fake_it then
		fake_it = not npc_in_player_fov( npc, HELI_PLAYER )
	end

	if DEBUG_NO_FAKE_RPGS then
		dlc05_rpg_guy_force_fire( npc, rpg_guy_info.aim_nav )

	elseif fake_it or DEBUG_ALL_FAKE_RPGS then
		-- Make a fake explosion
		dlc05_rpg_guy_fake_explosion( rpg_guy_info )

	else
		-- Give them a little time to fire
		Rpg_guy_fire_threads[npc] = thread_new( "dlc05_rpg_guy_force_fire", npc, rpg_guy_info.aim_nav )

		delay( 0.25 )

		if not Rpg_guy_fired_rocket[npc] then
			-- Too bad, so sad
			thread_kill( Rpg_guy_fire_threads[npc] )
			dlc05_rpg_guy_fake_explosion( rpg_guy_info )
		end
	end

end

function dlc05_rpg_guy_force_fire( npc, nav )

	-- Have the guy fire his rocket
	force_fire( npc, nav, true )

end

function dlc05_rpg_guy_fake_explosion( rpg_guy_info )

	local npc = rpg_guy_info.npc

	-- Make a fake explosion
	if rpg_guy_info.fake_rpg_navs then
		for i, nav in pairs( rpg_guy_info.fake_rpg_navs ) do
			effect_play( "trail_test", nav )
			delay( 0.1 )
		end
	end

	explosion_create( "RPG", rpg_guy_info.target, npc )
	dlc05_rpg_guy_finish_attack( npc )

end

function dlc05_rpg_guy_finish_attack( npc )

	-- Flag the rocket as happening
	Rpg_guy_fired_rocket[npc] = true

	on_weapon_fired( "", npc )

	-- Find the associated RPG info
	local rpg_guy_info = RPG_GUY_TO_RPG_INFO[npc]

	-- Get rid of his launcher
	inv_item_remove_all( npc )

	-- Not a threat anymore
	marker_remove_npc( npc )

end

function dlc05_rpg_guy_attack_truck_player( npc )

	while true do
		-- On the weird chance he loses it...
		if not inv_has_item( "rpg_launcher", npc ) then
			inv_item_add( "rpg_launcher", 1, npc, true )
		else
			inv_item_equip( "rpg_launcher", npc )
		end

		character_set_combat_ready( npc, true, 2000 )
		attack_safe( npc, TRUCK_PLAYER )

		delay( 2 )
	end

end

function dlc05_rpg_guy_death( npc )

	-- Toss the marker overhead
	marker_remove_npc( npc )

	-- Kill the fire thread
	if Rpg_guy_fire_threads[npc] then
		thread_kill( Rpg_guy_fire_threads[npc] )
	end

	-- Find the associated RPG info
	local rpg_guy_info = RPG_GUY_TO_RPG_INFO[npc]
	if not rpg_guy_info then
		return
	end

	-- Turn off the associated trigger
	trigger_enable( rpg_guy_info.fire_trigger, false )

end

---------------------------------------------
-- Functions to handle ground troop attacking
---------------------------------------------

Masako_weapon_infos =
{
	["m16"]							= {chance = 0.30, two_handed = true},
	["AR50"]							= {chance = 0.35, two_handed = true},
	["SKR-9"]						= {chance = 0.15, two_handed = false},
	["tec9"]							= {chance = 0.15, two_handed = false},
	["pump_action_shotgun"]		= {chance = 0.05, two_handed = true},
}

function dlc05_give_masako_random_weapon( npc, allow_two_handed )

	-- Replace the gun they have with a more diverse selection
	inv_item_remove_in_slot( "rifle", npc )
	inv_item_remove_in_slot( "smg", npc )
	inv_item_remove_in_slot( "shotgun", npc )

	-- Randomly choose a replacement
	local total_chance = 0.0
	local available_weapons = {}

	for weapon, info in pairs( Masako_weapon_infos ) do
		if not info.two_handed or allow_two_handed then
			available_weapons[weapon] = info.chance
			total_chance = total_chance + info.chance
		end
	end

	local rand_num = rand_float( 0.0, total_chance )
	local chosen_weapon

	for weapon, chance in pairs( available_weapons ) do
		rand_num = rand_num - chance

		if rand_num <= 0.0 then
			chosen_weapon = weapon
			break
		end
	end

	if not chosen_weapon then
		-- Take the last one on the list
		chosen_weapon = available_weapons[ sizeof_table( available_weapons ) ]
	end

	-- Add the weapon to the inventory and equip it
	inv_item_add( chosen_weapon, 1, npc, true )

end

-- Group troop assault threads

function dlc05_add_masako_to_assault( npc, rally )

	if not dlc05_character_is_active( npc ) then
		return
	end

	-- Replace the gun they have with a more diverse selection
	dlc05_give_masako_random_weapon( npc, true )

	-- Make sure they attack as they go
	set_always_sees_player_flag( npc, true )
	set_attack_enemies_flag( npc, true )
	set_attack_player_flag( npc, true )

	-- Start the attack thread for the NPC
	Masako_attack_threads[npc] = thread_new( "dlc05_masako_assault", npc, rally )

end

-- Tells a Masako to go somewhere and then attack a player
-- masako:			NPC we're trying to control
-- rally:			(optional) Maybe move to a point before attacking
function dlc05_masako_assault( npc, rally )

	local current_target
	local rally_reached = false

	thread_new( "dlc05_masako_play_persona", npc )

	if rally then
		repeat
			-- Try to move to the point
			rally_reached = move_to_safe( npc, rally, 2, false, true )

			if not rally_reached then
				-- Find the closest target
				local closest_dist, closest_target = dlc05_get_closest_masako_target( npc )

				if closest_target and ((closest_dist < get_dist( npc, rally )) or (closest_dist <= MASAKO_CLOSE_RANGE_DIST_M)) then
					-- Target... too... tempting...
					rally_reached = true
				end
			end

			if not rally_reached then
				thread_yield()
			end
		until rally_reached
	end

	while true do
		local new_target = false
		local target_players_only = false

		if not current_target then
			-- No existing target, shoot anyone
			new_target = true

		elseif not character_is_player( current_target ) then
			-- Always try targeting something new after taking a potshot at a non-player
			new_target = true

		elseif not dlc05_character_is_active( current_target ) then
			-- Old target is dead
			new_target = true

		elseif get_dist( npc, current_target ) > MASAKO_CLOSE_RANGE_DIST_M then
			-- Old target is too far away, advance towards a player
			new_target = true
			target_players_only = true
		end

		if new_target then
			-- New closest thing
			local dist
			dist, current_target = dlc05_get_closest_masako_target( npc, target_players_only )
		end

		if current_target then
			attack_safe( npc, current_target )
		end

		-- Wait before making another decision
		delay( rand_float( 1.0, 3.0 ) )
	end

end

function dlc05_masako_play_persona( npc )

	-- Short initial delay
	delay( rand_float( 0.0, 10.0 ) )

	while true do
		if not dlc05_character_is_active( npc ) then
			break
		end

		audio_play_persona_line( npc, "threat - alert (group attack)" )

		-- Longer repeat delay
		delay( rand_float( 5.0, 15.0 ) )
	end

end

-- Given a list of character targets and an object, returns the closest distance
-- and target from the list that's not dead
function dlc05_get_closest_dist_and_char_to_object( char_list, object )

	local closest_target, closest_dist
	for i, target in pairs( char_list ) do
		if dlc05_character_is_active( target ) then
			local dist = get_dist( object, target )

			if not closest_dist or (dist < closest_dist) then
				closest_target = target
				closest_dist = dist
			end
		end
	end

	return closest_dist, closest_target

end

-- Looks for the closest character for the npc to attack
function dlc05_get_closest_masako_target( npc, player_only )

	-- Defaults to all targets
	player_only = player_only or false

	-- Find the closest player
	local closest_dist, closest_target = dlc05_get_closest_dist_and_char_to_object( PLAYER_LIST, npc )

	-- If we have no player target, we should shoot *something*, right?
	if not closest_target or (not player_only and (rand_float( 0.0, 1.0 ) < MASAKO_TARGET_HELPER_CHANCE)) then
		-- Also consider any nearby helpers
		local helper_dist, helper_target = dlc05_get_closest_dist_and_char_to_object( HELPER_LIST, npc )

		if helper_target and (not closest_target or (helper_dist < closest_dist)) then
			closest_dist = helper_dist
			closest_target = helper_target
		end
	end

	return closest_dist, closest_target

end

function dlc05_masako_death( npc )

	-- Keep track of how many are killed off and when we reach a certain point, bring in more guys.
	Masako_group_dead	= Masako_group_dead + 1

	-- Kill the associated attack threads
	if Masako_attack_threads[npc] then
		thread_kill( Masako_attack_threads[npc] )
		Masako_attack_threads[npc] = nil
	end

	-- Remove any marker
	marker_remove_npc( npc )

	-- Remove the callback
	on_death( "", npc )

	-- No longer important
	release_to_world( npc )

end

-- Kicks an NPC out of a vehicle and starts them attacking a player
-- npc:				NPC that's gotta get out
-- unenterable:	Whether or not we should mark the vehicle to be unjackable after the NPC exits
-- rally:			(optional) Point for the NPC to move to before just chasing the player
function dlc05_masako_exit_vehicle_and_attack( npc, unenterable, rally )

	-- Don't do squat until a player is close; NPC ghosting is buggy and won't properly exit these guys if they're ghosted
	local dist, player
	repeat
		dist, player = get_dist_closest_player_to_object( npc, PLAYER_LIST )
		thread_yield()
	until not dlc05_character_is_active( npc ) or (dist < VEHICLE_EXIT_DIST_M)

	if not dlc05_character_is_active( npc ) then
		return
	end

	vehicle_exit( npc, unenterable )
	dlc05_add_masako_to_assault( npc, rally )

end

------------------------------------
-- Functions to handle SUV drive-ups
------------------------------------

function dlc05_start_suv_driveup( suv_info )

	local suv = suv_info.suv

	on_vehicle_destroyed( "dlc05_suv_destroyed", suv )

	for i, npc in pairs( suv_info.occupants ) do
		vehicle_enter_teleport( npc, suv, i - 1 )

		-- Set up on death callbacks for the SUV occupants
		on_death( "dlc05_masako_death", npc )

		-- Adjust their hit points while we're at it
		set_max_hit_points( npc, get_max_hit_points( npc ) * MASAKO_HITPOINT_MULTIPLIER, true )
	end

	if suv_info.speed_limit then
		-- Override the speed on the SUVs
		vehicle_max_speed( suv, suv_info.speed_limit )
	end

	if suv_info.delay then
		delay( suv_info.delay )
	end

	vehicle_pathfind_to( suv, suv_info.path, true, false )
	Suv_exit_threads[suv] = thread_new( "dlc05_suv_distance_check", suv_info )
	vehicle_pathfind_to( suv, suv_info.exit_nav, true, false )

end

function dlc05_suv_distance_check( suv_info )

	local suv = suv_info.suv

	while get_dist( suv, suv_info.exit_nav ) > SUV_EXIT_DIST_M do
		thread_yield()
	end

	-- This is to prevent sync errors where the speed isn't zeroed
	vehicle_stop_do( suv )
	repeat
		thread_yield()
	until get_vehicle_speed( suv ) < VEHICLE_EXIT_SPEED

	-- Get out and attack, ya bums
	for i, npc in pairs( suv_info.occupants ) do
		thread_new( "dlc05_masako_exit_vehicle_and_attack", npc, false )
	end

end

function dlc05_suv_destroyed( suv )

	if Suv_exit_threads[suv] then
		thread_kill( Suv_exit_threads[suv] )
		Suv_exit_threads[suv] = nil
	end

end

------------------------------------------
-- Functions to handle helicopter dropoffs
------------------------------------------

function dlc05_start_heli_dropoff( heli_info )

	local heli = heli_info.heli

	-- Init passenger list for dropoff tracking
	Heli_passengers_not_exited[heli] = {}

	for i, npc in pairs( heli_info.occupants ) do
		-- Stick them in the heli and set up their HP
		vehicle_enter_teleport( npc, heli, i - 1 )
		set_max_hit_points( npc, get_max_hit_points( npc ) * MASAKO_HITPOINT_MULTIPLIER, true )

		-- No callback here; helis have buggy death callbacks for passengers, so we have a separate death check thread
		on_death( "", npc )

		if i ~= 1 then
			-- Setup the passenger list
			Heli_passengers_not_exited[heli][npc] = true
		end

		set_unjackable_flag( heli, true )
	end

	on_vehicle_destroyed( "dlc05_heli_destroyed", heli )

	-- Start the thread that checks for heli occupant deaths
	thread_new( "dlc05_heli_npc_death_check", heli_info )

	if heli_info.delay then
		delay( heli_info.delay )
	end

	-- Init the dropoff thread table
	Heli_dropoff_threads[heli] = {}

	Heli_dropoff_threads[heli].approach = thread_new( "dlc05_heli_dropoff_approach", heli_info )

end

-- Fly to the landing location
function dlc05_heli_dropoff_approach( heli_info )

	local heli = heli_info.heli

	teleport_vehicle( heli, heli_info.path[1] )

	-- Tack on the approach nav to the given path to smooth things out
	local path = {}
	for i, nav in pairs( heli_info.path ) do
		path[i] = nav
	end

	local idx = sizeof_table( path )
	path[idx + 1] = heli_info.approach_nav

	-- Start the thread that will slow down the heli
	Heli_dropoff_threads[heli].slow = thread_new( "dlc05_heli_slow_for_landing", heli_info )

	dlc05_fly_to_direct_even_in_coop( heli, heli_info.speed, heli_info.path )

end

-- Slows down near the landing location
function dlc05_heli_slow_for_landing( heli_info )

	local heli = heli_info.heli

	local last_path_nav = heli_info.path[ sizeof_table( heli_info.path ) ]

	-- Wait to get close to the approach
	repeat
		thread_yield()
	until get_dist( heli, last_path_nav ) < HELI_NODE_APPROACH_DIST_M

	-- Kill previous pathing command
	thread_kill( Heli_dropoff_threads[heli].approach )
	thread_yield()		-- Let it go through

	-- Start the landing check thread
	Heli_dropoff_threads[heli].land = thread_new( "dlc05_heli_landing", heli_info )

	-- Slow down the heli for landing
	local path = {heli_info.approach_nav, heli_info.landing_nav}
	dlc05_fly_to_direct_even_in_coop( heli, HELI_LANDING_SPEED * 2, path )

end

-- Slows down even further to set down
function dlc05_heli_landing( heli_info )

	local heli = heli_info.heli

	-- Wait to get close to the landing position
	repeat
		thread_yield()
	until get_dist( heli, heli_info.landing_nav ) < HELI_NODE_APPROACH_DIST_M

	-- Kill previous pathing command
	thread_kill( Heli_dropoff_threads[heli].slow )
	thread_yield()		-- Let it go through

	-- Start the landing finished thread
	Heli_dropoff_threads[heli].on_ground = thread_new( "dlc05_heli_on_ground", heli_info )

	-- Slow down the heli even more
	dlc05_fly_to_direct_even_in_coop( heli, HELI_LANDING_SPEED, heli_info.landing_nav )

end

-- Heli finally on solid ground
function dlc05_heli_on_ground( heli_info )

	local heli = heli_info.heli

	-- Wait until we're close enough to exit out
	repeat
		thread_yield()
	until get_dist( heli, heli_info.landing_nav ) < HELI_EXIT_DIST_M

	delay( 1.5 )

	Heli_dropoff_threads[heli].dropoff = thread_new( "dlc05_heli_dropoff_passengers", heli_info )

end

-- Drops off the passengers and runs away
function dlc05_heli_dropoff_passengers( heli_info )

	local heli = heli_info.heli

	dlc05_heli_kick_passengers_out( heli_info )

	-- Wait until everyone's out of the heli
	while Heli_passengers_not_exited[heli] and (sizeof_table( Heli_passengers_not_exited[heli] ) > 0) do
		thread_yield()
	end

	delay( 3 )

	-- Tell it to go away
	helicopter_enter_retreat( heli )

	-- Wait until it's far enough away to not matter much (in case we need to hold on to it for the corpse)
	while dlc05_vehicle_is_active( heli ) and (get_dist( heli, heli_info.landing_nav ) < 150) do
		thread_yield()
	end

	local pilot = heli_info.occupants[1]

	-- Release the heli (unless it's a corpse, which we want to clean up)
	if dlc05_vehicle_is_active( heli ) then
		release_to_world( heli )
	end

	-- Release the driver
	if character_exists( pilot ) then
		release_to_world( pilot )
	end

end

function dlc05_heli_kick_passengers_out( heli_info )

	for i, npc in pairs( heli_info.occupants ) do
		-- Driver is listed first, don't tell him to exit
		if ( i ~= 1 ) then
			-- Don't do anything if the character is dead or they already have a running thread
			if dlc05_character_is_active( npc ) and not Heli_npc_threads[npc] then
				Heli_npc_threads[npc] = thread_new( "dlc05_heli_passenger_exit", npc, heli_info.heli, heli_info.attack_points[i-1] )
			end
		end
	end

end

function dlc05_heli_passenger_exit( npc, heli, attack_point )

	dlc05_masako_exit_vehicle_and_attack( npc, true, attack_point )

	-- Let the heli know that the passenger has exited the vehicle by taking the passenger off the list
	if Heli_passengers_not_exited[heli] then
		Heli_passengers_not_exited[heli][npc] = nil
	end

	-- Cleanup thread
	Heli_npc_threads[npc] = nil

end

function dlc05_heli_npc_death_check( heli_info )

	local heli = heli_info.heli

	-- We need to make a copy of the occupants table
	local alive_occupants = {}
	for i, npc in pairs( heli_info.occupants ) do
		alive_occupants[i] = npc
	end

	while sizeof_table( alive_occupants ) > 0 do
		-- Keep track of who's dead this frame so we can delete them later
		local dead_this_frame = {}

		for i, npc in pairs( alive_occupants ) do
			if not dlc05_character_is_active( npc ) then
				-- Do the on_death functionality
				if i == 1 then
					-- Pilot
					dlc05_heli_pilot_death( npc, heli_info )
				else
					-- Passengers
					dlc05_heli_passenger_death( npc, heli_info )
				end

				-- Save the dead guy
				dead_this_frame[i] = npc
			end
		end

		-- Now get rid of all the dead guys
		for i, npc in pairs( dead_this_frame ) do
			alive_occupants[i] = nil
		end

		thread_yield()
	end

end

function dlc05_heli_destroyed( heli )

	dlc05_heli_cleanup_heli_threads( heli )

	-- Remove the death callback
	on_vehicle_destroyed( "", heli )

end

function dlc05_heli_pilot_death( pilot, heli_info )

	local heli = heli_info.heli

	-- If we haven't already dropped the passengers off, tell them to jump off now
	dlc05_heli_kick_passengers_out( heli_info )

	-- Kill all the heli threads
	dlc05_heli_cleanup_heli_threads( heli )

end

function dlc05_heli_passenger_death( npc, heli_info )

	-- Run the standard death callback
	dlc05_masako_death( npc )

	if Heli_npc_threads[npc] then
		thread_kill( Heli_npc_threads[npc] )
		Heli_npc_threads[npc] = nil
	end

	-- Well, death is one way to exit a helicopter...
	local found = false
	for heli, npc_list in pairs( Heli_passengers_not_exited ) do
		if found then
			break
		end

		for n, dummy in pairs( npc_list ) do
			if n == npc then
				Heli_passengers_not_exited[heli][npc] = nil
				found = true
				break
			end
		end
	end

end

function dlc05_heli_cleanup_heli_threads( heli )

	-- Kill the associated heli threads
	if Heli_dropoff_threads[heli] then
		for label, thread in pairs( Heli_dropoff_threads[heli] ) do
			thread_kill( thread )
		end

		Heli_dropoff_threads[heli] = nil
	end

	-- Clean up the passengers while we're at it
	Heli_passengers_not_exited[heli] = nil

end

-------------------------------------
-- Failure Conditions Handled Here --
-------------------------------------

function dlc05_fail_truck_destroyed()

	-- Kill any running vehicle chase threads
	for i, thread in pairs( Vehicle_chase_threads ) do
		thread_kill( thread )
	end

	mission_end_failure( MISSION_NAME, "TEXT_FAIL_TRUCK_DESTROYED" )

end

function dlc05_fail_heli_destroyed()

	-- Kill any running vehicle chase threads
	for i, thread in pairs( Vehicle_chase_threads ) do
		thread_kill( thread )
	end

	mission_end_failure( MISSION_NAME, "TEXT_FAIL_HELICOPTER_DESTROYED" )

end

function dlc05_fail_abandoned_truck()

	-- Kill any running vehicle chase threads
	for i, thread in pairs( Vehicle_chase_threads ) do
		thread_kill( thread )
	end

	mission_end_failure( MISSION_NAME, "TEXT_FAIL_ABANDONED_TRUCK" )

end

function dlc05_fail_truck_not_delivered()

	-- Turn off the truck end trigger
	trigger_enable( TRIG_TRUCK_END, false )

	mission_end_failure( MISSION_NAME, "TEXT_FAIL_TRUCK_NOT_DELIVERED" )

end

-----------------
-- Cleaning Up --
-----------------

function dlc05_cleanup()

	IN_COOP = coop_is_active()

	-- Update the player list
	PLAYER_LIST[2] = IN_COOP and REMOTE_PLAYER or nil

	-- Re-enable the triggers
	for i, trigger in pairs( TRIGGERS_TO_DISABLE ) do
		trigger_enable( trigger, true )
	end

	-- Re-enable the parking spots
	for i, spot in pairs( PARKING_SPOTS_TO_DISABLE ) do
		parking_spot_enable( spot, true )
	end

	-- Clear out player callbacks
	for i, player in pairs( PLAYER_LIST ) do
		on_death( "", player )
	end

	-- Clear out vehicle callbacks
	for i, truck in pairs( HAZARD_TRUCKS ) do
		on_vehicle_enter( "", truck )
		on_vehicle_exit( "", truck )
		on_vehicle_destroyed( "", truck )
		on_damage( "", truck, 0.0 )
	end

	for i, info in pairs( TARGET_ONE_HELI_DROPOFF_INFOS ) do
		on_vehicle_destroyed( "", info.heli )
	end
	for i, info in pairs( TARGET_TWO_HELI_DROPOFF_INFOS ) do
		on_vehicle_destroyed( "", info.heli )
	end
	on_vehicle_destroyed( "", FRIENDLY_TORNADO )
	on_vehicle_destroyed( "", ULTOR_TORNADO01 )

	for i, info in pairs( DEFEND_TRUCKS_PART_ONE_APC_INFOS ) do
		on_vehicle_destroyed( "", info.apc )
	end
	for i, info in pairs( DEFEND_TRUCKS_PART_TWO_APC_INFOS ) do
		on_vehicle_destroyed( "", info.apc )
	end
	for i, info in pairs( DEFEND_TRUCKS_PART_THREE_APC_INFOS ) do
		on_vehicle_destroyed( "", info.apc )
	end

	spawning_pedestrians( true )
	spawning_vehicles( true )

	-- Reset notoriety
	hud_set_fake_notoriety( "Police", false )
	notoriety_reset( "Police" )
	notoriety_force_no_spawn( "Police", false )
	notoriety_force_no_spawn( "Ultor", false )
	set_cops_shooting_from_vehicles( false )
	spawning_allow_cop_ambient_spawns( true )
	roadblocks_enable( true )

	-- Make guys recruitable again
	party_set_recruitable( true )

	-- Make sure that the GSI is cleared
   objective_text_clear( 0 )
	damage_indicator_off( 0 )
	dlc05_stop_truck_abandon_check()		-- This needs to be done first before removing the marker (buggy distance display)

	for i, index in pairs( PLAYER_TIMER_INDEX ) do
		hud_timer_stop( index )
	end

	-- Remove all markers
	for i, player in pairs( PLAYER_LIST ) do
		marker_remove_player( player )
	end

	for i, truck in pairs( HAZARD_TRUCKS ) do
		marker_remove_vehicle( truck )
		marker_remove_navpoint( truck )	-- Can be assigned to the starting nav in co-op
	end

	marker_remove_vehicle( FRIENDLY_TORNADO )

	for i, npc in pairs( ATTACK01_MASAKO_LIST ) do
		marker_remove_npc( npc )
	end
	for i, npc in pairs( ATTACK02_MASAKO_LIST ) do
		marker_remove_npc( npc )
	end

	for i, info in pairs( DEFEND_TRUCKS_PART_ONE_APC_INFOS ) do
		marker_remove_vehicle( info.apc )
	end
	for i, info in pairs( DEFEND_TRUCKS_PART_TWO_APC_INFOS ) do
		marker_remove_vehicle( info.apc )
	end
	for i, info in pairs( DEFEND_TRUCKS_PART_THREE_APC_INFOS ) do
		marker_remove_vehicle( info.apc )
	end

	-- Co-op lists cover both co-op and single player RPG guys
	local rpg_guy_lists =
	{
		COOP_RPG_GUYS01,
		COOP_RPG_GUYS02,
		COOP_RPG_GUYS03,
	}

	for i, npc_list in pairs( rpg_guy_lists ) do
		for j, npc in pairs( npc_list ) do
			marker_remove_npc( npc )
		end
	end

	marker_remove_vehicle( ULTOR_TORNADO01 )

	marker_remove_trigger( TRIG_OBJECTIVE01 )
	marker_remove_trigger( TRIG_OBJECTIVE02 )
	marker_remove_trigger( TRIG_TRUCK_END )

	marker_remove_navpoint( TRIG_OBJECTIVE01 )
	marker_remove_navpoint( TRIG_OBJECTIVE02 )

	mission_waypoint_remove()

	for i, player in pairs( PLAYER_LIST ) do
		-- Let them enter vehicles again
		set_player_can_enter_exit_vehicles( player, true )

		-- Kick players out of vehicles
		character_evacuate_from_all_vehicles( player )

		-- 'port the player so they don't end up splatting when getting tossed out of the Tornado in part 3
		teleport( player, (player == LOCAL_PLAYER) and NAV_PART02_START or NAV_PART02_REMOTE_START, true )
	end

end

function dlc05_success()
end

----------------------------------
-- Ignore Everything Below Here --
----------------------------------

function dlc05_mystery()
	group_create( GROUP_MYSTERY )
	delay( 1 )
	vehicle_enter_teleport( C_ALIEN, V_UFO, 0 )
	teleport_vehicle( V_UFO, MYSTERY_PATH[1] )
	dlc05_fly_to_direct_even_in_coop( V_UFO, 45, MYSTERY_PATH )
	group_destroy( GROUP_MYSTERY )
end
