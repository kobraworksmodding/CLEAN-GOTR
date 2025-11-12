-- rn01.lua
-- SR2 mission script
-- 3/28/07

-- Cutscene crash fixes by IdolNinja
-- 3/11/2011

DEBUG_SKIP_GUARDS				= false	-- Skip the security guard fight stage?	

--[[	***** NOTES *****
		In stage 4 of this mission, we need to spawn Ronin in waves to attack the players. To do this without
		the player seeing the enemies popping into existence, I've divided the the city into 6 areas. I keep
		track of which area each player is in. When a new enemy needs to be spawned, I select an area whose
		spawn locations can not be seen from the areas which contain players. Here are the areas:

		"area_1":	Hallway along the N-pointing corner of the 1st floor, runs from near reception desk to elevator.
		"area_2":	Hallway along the E-pointing corner of the 1st floor, runs from near reception desk to elevator.
		"area_3":	Counting room/safes.
		"area_4":	Casino's 2nd floor.
		"area_5":	Portion of Casino's first floor not already accounted for.
		"area_6":	Anywhere outside of the Casino.
		]]

-- Global constants ( ALL_CAPS means that they shouldn't be modified in running code, except for maybe in a setup function )

	-- COOP MISSION? -- 
		IN_COOP	= false

	-- KNOBS_TO_TURN --

		-- All stages
			MAX_RONIN_NOTORIETY				= 2
			MAX_POLICE_NOTORIETY			= 2

		-- Stage 1
		-- Stage 2

			-- Security guards that wander.
			WANDERING_GUARDS = {"rn01_$c002", "rn01_$c003", "rn01_$c004", "rn01_$c006"}

			MIN_RONIN_NOTORIETY			= 2 -- Minimum ronin notoriety after a security guard is attacked in single player.
			COOP_MIN_RONIN_NOTORIETY	= 2 -- Minimum ronin notoriety after a security guard is attacked in coop.

		-- Stage 3
		-- Stage 4, Defend homies while they load cash boxes

			TRUCK_HEALTH_MULTIPLIER			= 2.0  -- Hit point multiplier for the heist truck

		-- Stage 5

			MIN_POLICE_NOTORIETY			= 2 -- Minimum police notoriety for drive home in single player.
			COOP_MIN_POLICE_NOTORIETY	= 2 -- Minimum police notoriety for drive home in coop.

	-- CHARACTERS --
		CHARACTER_GAT				= "rn01_$Cgat"
		CHARACTER_HELPER		= "rn01_$Chelper_1"
		CHARACTER_PIERCE			= "rn01_$Cpierce"

	-- CHECKPOINTS
		
		CHECKPOINT_START						= MISSION_START_CHECKPOINT			-- defined in ug_lib.lua
		CHECKPOINT_CASINO						= "rn01_checkpoint_casino"			-- players arrived at Casino
		CHECKPOINT_LOAD_BOXES				= "rn01_checkpoint_load_boxes"	-- after counting room unlocked
		--CHECKPOINT_DRIVE_HOME				= "rn01_checkpoint_drive_home"	-- boxes loaded, ready to head back to sr_hq

	-- GROUPS --

		GROUP_TRUCK						= "rn01_$Gtruck"
		GROUP_START_CAR				= "rn01_$Gstart_car"
		GROUP_START_CAR_COOP			= "rn01_$Gstart_car_coop"
		GROUP_GAT						= "rn01_$Ggat"
		GROUP_CASINO_GUARDS			= "rn01_$Gcasino_guards"		-- Security guards inside the casino
		GROUP_COOP_CASINO_GUARDS	= "rn01_$Gcoop_casino_guards" -- As ^, but only used in coop.
		GROUP_RONIN_WAVES				= "rn01_$Gronin_waves"			-- Ronin that spawn in waves during stage 4

	-- GROUP MEMBER TABLES -- 
	
		MEMBERS_GROUP_CASINO_GUARDS		=	{	"rn01_$c000", "rn01_$c001", "rn01_$c002", "rn01_$c003", "rn01_$c004",
															"rn01_$c006", "rn01_$c008", "rn01_$c009", "rn01_$c011", "rn01_$c012",
															"rn01_$c013", "rn01_$c014", "rn01_$c015", "rn01_$c016", "rn01_$c017"}

		MEMBERS_GROUP_COOP_CASINO_GUARDS =	{	"rn01_$c005", "rn01_$c007", "rn01_$c010"}

	-- HELPTEXT

		HELPTEXT_PROMPT_REENTER_TRUCK		= "rn01_prompt_reenter_truck"		-- Get back in the truck!
		HELPTEXT_PROMPT_ENTER_TRUCK		= "rn01_prompt_enter_truck"		-- The boxes are loaded, get in the truck!
		HELPTEXT_PROMPT_CASINO				= "rn01_prompt_casino"				-- "Head to the casino."
		HELPTEXT_PROMPT_GUARDS				= "rn01_prompt_guards"				-- "Take out all the security guards."
		HELPTEXT_PROMPT_HEAD_HOME			= "rn01_prompt_head_home"			-- "Get the loot back to Saints headquarters."
		HELPTEXT_PROMPT_NOTORIETY_ZERO	= "rn01_prompt_notoriety_zero"	-- Eliminate your notoriety before heading to the hideout.
		HELPTEXT_PROMPT_POLICE_CALLED		= "rn01_prompt_police_called"		-- “The Ronin called in the police for help!” 
		HELPTEXT_PROMPT_BOMB_WARNING		= "rn01_prompt_bomb_warning"

		HELPTEXT_OBJECTIVE_GUARDS			= "rn01_objective_guards"			-- "%s of %s guards killed."
		HELPTEXT_OBJECTIVE_NEAR_CASINO	= "rn01_objective_near_casino"	-- "Get closer to the casino"

		HELPTEXT_FAILURE_GAT_DIED			= "rn01_failure_gat_died"			-- "Johnny Gat died."
		HELPTEXT_FAILURE_GAT_ABANDONED	= "rn01_failure_gat_abandoned"	-- "Johnny Gat was abandoned."
		HELPTEXT_FAILURE_PIERCE_DIED		= "rn01_failure_pierce_died"		-- "Pierce died."
		HELPTEXT_FAILURE_PIERCE_ABANDONED= "rn01_failure_pierce_abandoned" -- "Pierce was abandoned."
		HELPTEXT_FAILURE_HOMIE_KILLED		= "rn01_failure_homie_killed"		-- "Homie killed"
		HELPTEXT_FAILURE_TRUCK_DESTROYED = "rn01_failure_truck_destroyed"	-- "The heist truck was destroyed."

		HELPTEXT_PROMPT_PLANT_BOMBS		= "rn01_prompt_plant_bombs"		-- "Guard Gat while he rigs the doors with explosives"
		HELPTEXT_PROMPT_USE_DETONATOR		= "rn01_prompt_use_detonator"		-- "Use the detonator to set off the bombs from a safe distance."

		HELPTEXT_HUD_GAT_PROGRESS			= "rn01_hud_gat_progress"

	-- MOVERS
		DOOR_CASINO_MAIN_1					= "rn01_Dcasino_main_1"
		DOOR_CASINO_MAIN_2					= "rn01_Dcasino_main_2"
		DOOR_CASINO_REAR_1					= "rn01_Dcasino_rear_1"
		DOOR_CASINO_REAR_2					= "rn01_Dcasino_rear_2"
		DOOR_CASINO_REAR_3					= "rn01_Dcasino_rear_3"
		DOOR_CASINO_AREA_1					= "rn01_Dcasino_area_1"
		DOOR_CASINO_AREA_2					= "rn01_Dcasino_area_2"
		DOOR_COUNTING_ROOM_1					= "rn01_Dcounting_room_1"
		DOOR_COUNTING_ROOM_2					= "rn01_Dcounting_room_2"

	-- GUARD PATROL ROUTES

		DIR_FORWARD = 1
		DIR_REVERSE = 2
		DIR_EITHER = 3

		-- Rather than define separate routes for each guard, I've setup interconnecting segments of
		-- patrol routes. Segments can transition onto other segments at any point. If a guard reaches
		-- the end of a segment, then they'll return to their original spawn location.
		CASINO_GUARD_INITIAL_PATH_SEGMENTS = 
		{	["rn01_$c000"] =	{	{1,DIR_FORWARD,1},
										{1,DIR_REVERSE,4},
										{2,DIR_REVERSE,6},
									},
			["rn01_$c001"] =	{	{1,DIR_FORWARD,4},
										{1,DIR_REVERSE,3},
										{2,DIR_FORWARD,1},
									},
		}

		-- Note, each navpoint can only belong to one path segment.
		CASINO_GUARD_PATH_SEGMENTS = 
		{	[1] = {"rn01_$n045", "rn01_$n046", "rn01_$n047", "rn01_$n048"},
			[2] = {"rn01_$n049", "rn01_$n050", "rn01_$n051", "rn01_$n052", "rn01_$n053", "rn01_$n054"},
		}

		-- ["current_node"] = {[current_direction] = {{next_path, direction, index of first node on next path, }}
		CASINO_GUARD_SEGMENT_TRANSITIONS = 
		{	["rn01_$n045"]	=	{	[DIR_REVERSE]	=	{	{2, DIR_FORWARD, 1},
																},
									},
			["rn01_$n047"]	=	{	[DIR_FORWARD]	=	{	{2, DIR_REVERSE, 6},
																},
									},
			["rn01_$n048"]	=	{	[DIR_EITHER]	=	{	{2, DIR_FORWARD, 1},
																	{2, DIR_REVERSE, 6},
																},
									},
			["rn01_$n049"]	=	{	[DIR_REVERSE]	=	{	{1, DIR_FORWARD, 1},
																	{1, DIR_FORWARD, 4},
																	{1, DIR_REVERSE, 3},
																},
									},
			["rn01_$n054"]	=	{	[DIR_FORWARD]	=	{	{1, DIR_FORWARD, 1},
																	{1, DIR_REVERSE, 4},
																	{1, DIR_REVERSE, 3},
																},
									},
		}


	-- NAVPOINTS

		NAVPOINT_REMOTE_PLAYER_START		= "rn01_$Nremote_player_start"
		NAVPOINT_LOCAL_PLAYER_START		= "mission_start_sr2_city_$rn01"
		NAVPOINT_HELPER_ARRIVAL				= "rn01_$Nhelper_arrival"				-- Where Pierce and the homies vehicle arrives
		NAVPOINT_CHANDELIER					= "rn01_$Nchandelier"
		NAVPOINT_OCTO_1						= "rn01_$Nocto_1"
		NAVPOINT_OCTO_2						= "rn01_$Nocto_2"

		NAVPOINT_CASINO_LOCAL_START		= "rn01_$Ncasino_local_start"
		NAVPOINT_CASINO_REMOTE_START		= "rn01_$Ncasino_remote_start"


	-- TRIGGERS -- 
		
		TRIGGER_CASINO_ARRIVAL			= "rn01_$Tcasino_arrival"
		TRIGGER_COUNTING_ROOM_DOOR_1	= "rn01_$Tcounting_room_door_1"
		TRIGGER_COUNTING_ROOM_DOOR_2	= "rn01_$Tcounting_room_door_2"
		TRIGGER_AISHAS						= "rn01_$Taishas"

		-- List of all triggers, makes cleaning up more convenient
		TABLE_ALL_TRIGGERS		= {	TRIGGER_CASINO_ARRIVAL, TRIGGER_COUNTING_ROOM_DOOR_1, TRIGGER_COUNTING_ROOM_DOOR_2, 
												TRIGGER_AISHAS}		

	-- VEHICLES --

		VEHICLE_TRUCK				= "rn01_$v000"					-- Delivery truck

	-- CONVERSATIONS --
	   INTRO_CONVERSATION =
		{
			{ "RON1_INTRO_L1", CHARACTER_GAT, 0.5 },
			{ "PLAYER_RON1_INTRO_L2", LOCAL_PLAYER, 1 },
			{ "RON1_INTRO_L3", CHARACTER_GAT, 1 },
			{ "PLAYER_RON1_INTRO_L4", LOCAL_PLAYER, 1 },
			{ "RON1_INTRO_L5", CHARACTER_GAT, 1 },
		}

	   LAUNDER_CONVERSATION =
		{
			{ "PLAYER_RON1_LAUNDER_L1", LOCAL_PLAYER, 1 },
			{ "RON1_LAUNDER_L2", CHARACTER_GAT, 1 },
			{ "PLAYER_RON1_LAUNDER_L3", LOCAL_PLAYER, 1 },
			{ "RON1_LAUNDER_L4", CHARACTER_GAT, 1 },
			{ "PLAYER_RON1_LAUNDER_L5", LOCAL_PLAYER, 1 },
			{ "RON1_LAUNDER_L6", CHARACTER_GAT, 1 },
		}

	   LAUNDER_CONVERSATION_COOP =
		{
			{ "PLAYER_RON1_LAUNDER_L1", LOCAL_PLAYER, 1 },
			{ "RON1_LAUNDER_L2_PHONE", CELLPHONE_CHARACTER, 1 },
			{ "PLAYER_RON1_LAUNDER_L3", LOCAL_PLAYER, 1 },
			{ "RON1_LAUNDER_L4_PHONE", CELLPHONE_CHARACTER, 1 },
			{ "PLAYER_RON1_LAUNDER_L5", LOCAL_PLAYER, 1 },
			{ "RON1_LAUNDER_L6_PHONE", CELLPHONE_CHARACTER, 1 },
		}

	PLAYER_SYNC	= {[LOCAL_PLAYER] = SYNC_LOCAL, [REMOTE_PLAYER] = SYNC_REMOTE}

	STATE_PLANT_BOMB =			"crouch plant bomb"
	DETONATION_DISTANCE =			15
	DETONATOR_ITEM =			"Detonator"
	EXPLOSION_NAME =			"Big Bang"

	BOMB_PLANT_KILLS_REQUIRED			= 15
	BOMB_PLANT_KILLS_REQUIRED_COOP	= 20
	BOMB_PLANT_MIN_TIME_S				= 60

	RN01_RONIN_ATTACK_PERSONAS = 
	{
		["AM_Ron2"]	=	"AMRON2",

		["AF_Ron1"]	=	"AFRON1",

		["WM_Ron1"]	=	"WMRON1",

		["WF_Ron1"]	=	"WFRON1",
		["WF_Ron2"]	=	"WFRON2",
	}

-- Progress flags
	Casino_reached						= false
	Bombs_planted						= false

-- Misc
	Door_unlocked						= {}  -- List of doors that are unlocked.
	Door_opened							= {}	-- Doors have a tendency to close themselves, we need to keep a list of doors
													-- that are open.

	Path_segment_occupied			= {}
	Patrol_threads						= {}

	Gps_waypoint = {[LOCAL_PLAYER] = "", [REMOTE_PLAYER] = ""}

	-- These two variables are declared in mission_globals.lua so that we have access
	-- to the player's location when they restart from a checkpoint:
		-- Rn01_local_player_location		-- Location of the local player
		-- Rn01_remote_player_location	-- Location of the local player

-- CUTSCENES --
-- Added by IdolNinja. These variables are used in the script for the cutscenes for stability instead of calling them directly

	CUTSCENE_IN = 		"ro01-01"
	CUTSCENE_OUT = 		"ro01-02"
	MISSION_NAME =		"rn01"



function rn01_start(rn01_checkpoint, is_restart)

	mission_start_fade_out()

	if(rn01_checkpoint == CHECKPOINT_START) then

		-- Determine the list of groups needed at mission start
		local group_list = {GROUP_GAT, GROUP_START_CAR}
		if (IN_COOP) then
			group_list = {GROUP_GAT, GROUP_START_CAR, GROUP_START_CAR_COOP}
		end

		-- Starting from the mission beginning & not a checkpoint, so play the first cutscene
		if (not is_restart) then
			cutscene_play(CUTSCENE_IN, group_list, {NAVPOINT_LOCAL_PLAYER_START, NAVPOINT_REMOTE_PLAYER_START}, false)

			-- cutscene_play creates hidden groups, make sure that we show them.
			for i,group in pairs(group_list) do
				group_show(group)
			end
		else

			-- Teleport players to start location
			teleport_coop(NAVPOINT_LOCAL_PLAYER_START, NAVPOINT_REMOTE_PLAYER_START)

			-- Create the starting groups
			for i,group in pairs(group_list) do
				group_create(group, true)
			end
		end

	end

	rn01_initialize(rn01_checkpoint)

	if(rn01_checkpoint == CHECKPOINT_START) then
	
		-- Stage 1: Drive to the Casino
		rn01_drive_to_casino()

		mission_set_checkpoint(CHECKPOINT_CASINO, true)
		rn01_checkpoint = CHECKPOINT_CASINO

	end -- ends CHECKPOINT_START

	if (rn01_checkpoint == CHECKPOINT_CASINO) then

		-- Stage 2: Gain access to the counting room.
				
		--make sure doors are unlocked
		Door_opened[DOOR_CASINO_AREA_1] = true
		Door_opened[DOOR_CASINO_AREA_2] = true
		Door_opened[DOOR_CASINO_MAIN_1] = true
		Door_opened[DOOR_CASINO_MAIN_2] = true
		
		rn01_gain_access()

		mission_set_checkpoint(CHECKPOINT_LOAD_BOXES, true)
		rn01_checkpoint = CHECKPOINT_LOAD_BOXES
	
		-- Fade out for the cutscene
		mission_start_fade_out(3.0)

	end -- ends CHECKPOINT_CASINO

	if(rn01_checkpoint == CHECKPOINT_LOAD_BOXES) then

		-- Stage 3: Guard homies while they load boxes into the truck

		--make sure doors are unlocked
		Door_opened[DOOR_CASINO_AREA_1] = true
		Door_opened[DOOR_CASINO_AREA_2] = true
		Door_opened[DOOR_CASINO_MAIN_1] = true
		Door_opened[DOOR_CASINO_MAIN_2] = true
		
		rn01_guard_box_loaders()

	end -- ends checkpoint DRIVE_HOME

	-- Mission ends
	player_controls_disable( LOCAL_PLAYER )
    vehicle_stop_do( LOCAL_PLAYER )
	
	if coop_is_active() then
		player_controls_disable( REMOTE_PLAYER )
		vehicle_stop_do( REMOTE_PLAYER )
	end

	rn01_complete()

end

function rn01_initialize(checkpoint)

	rn01_initialize_common()

	rn01_initialize_checkpoint(checkpoint)

	-- Add failure callbacks which persist throughout the mission
	rn01_add_mission_failure_callbacks()

	if (checkpoint ~= CHECKPOINT_LOAD_BOXES) then
		mission_start_fade_in()
	end

end

-- Initialization code shared by all checkpoints.
function rn01_initialize_common()

	-- Start trigger is hit...the activate button was hit
	set_mission_author("Phillip Alexander")

	if coop_is_active() then
		IN_COOP = true
	end

	-- Make sure that casino side and rear doors are unlocked
	door_lock(DOOR_CASINO_AREA_1, false)
	door_lock(DOOR_CASINO_AREA_2, false)
	door_lock(DOOR_CASINO_REAR_1, true)
	door_lock(DOOR_CASINO_REAR_2, true)
	door_lock(DOOR_CASINO_REAR_3, true)
	door_lock(DOOR_CASINO_MAIN_1, false)
	door_lock(DOOR_CASINO_MAIN_2, false)

	-- This thread makes sure that any door that has been marked as open stays open.
	thread_new("rn01_keep_doors_open")
	Door_opened[DOOR_CASINO_AREA_1] = true
	Door_opened[DOOR_CASINO_AREA_2] = true
	Door_opened[DOOR_CASINO_MAIN_1] = true
	Door_opened[DOOR_CASINO_MAIN_2] = true

	-- Override Ronin Personas
	persona_override_group_start(RN01_RONIN_ATTACK_PERSONAS,POT_SITUATIONS[POT_ATTACK], "RO01_ATTACK")
	--[[
	persona_override_group_start(SAINTS_PERSONAS,POT_SITUATIONS[POT_ATTACK], "RO01_ATTACK")
	persona_override_group_start(SAINTS_PERSONAS,POT_SITUATIONS[POT_CUSTOM_1], "RO01_FINDMONEY")
	persona_override_group_start(SAINTS_PERSONAS,POT_SITUATIONS[POT_CUSTOM_2], "RO01_DROPMONEY")
	]]
	notoriety_set_max("Ronin", MAX_RONIN_NOTORIETY)
	notoriety_set_max("Police", MAX_POLICE_NOTORIETY)

end

-- Initialization code specific to the checkpoint.
function rn01_initialize_checkpoint(checkpoint)

	if(checkpoint == CHECKPOINT_START) then

		-- Put Johnny Gat in the player's party
		party_add(CHARACTER_GAT, LOCAL_PLAYER)

		if ( coop_is_active() == false ) then
			-- Find his current index
			local gat_follower_index = party_get_follower_index(CHARACTER_GAT)

			-- If he's not the first follower, swap him and the first one
			if ( gat_follower_index > 0 ) then
				party_swap_follower_indices( 0, gat_follower_index )
				delay( 1.0 )
			end
		end

		-- Setup the casino guards in a thread so that it is non-blocking
		thread_new("rn01_setup_casino_guards")

	end

	if(checkpoint == CHECKPOINT_CASINO) then

		-- Teleport both players to the front of the Casino
		teleport_coop(NAVPOINT_CASINO_LOCAL_START, NAVPOINT_CASINO_REMOTE_START, true)

		-- Setup the guards, block until finished
		rn01_setup_casino_guards()
		
	end

	-- Override Gat's persona
	persona_override_character_start(CHARACTER_GAT, POT_SITUATIONS[POT_ATTACK], "GAT_RON01_ATTACK")
	persona_override_character_start(CHARACTER_GAT, POT_SITUATIONS[POT_TAKE_DAMAGE], "GAT_RON01_TAKEDAM")

	if (checkpoint == CHECKPOINT_START or checkpoint == CHECKPOINT_CASINO) then

		-- Don't allow ambient cops to spawn
		spawning_allow_cop_ambient_spawns(false)

		-- Lock counting room doors	
		door_lock(DOOR_COUNTING_ROOM_1, true)
		door_lock(DOOR_COUNTING_ROOM_2, true)

	end

	if(checkpoint ~= CHECKPOINT_START) then

		if(checkpoint ~= CHECKPOINT_CASINO) then

			-- Make sure that the minimum Ronin notoriety has been set.
			if (not IN_COOP) then
				notoriety_set_min("Ronin",MIN_RONIN_NOTORIETY)
				notoriety_set("Ronin",MIN_RONIN_NOTORIETY)
			else
				notoriety_set_min("Ronin", COOP_MIN_RONIN_NOTORIETY)
				notoriety_set("Ronin", COOP_MIN_RONIN_NOTORIETY)
			end
		end

	end

end

function rn01_setup_casino_guards()
	-- Setup the guards
	group_create(GROUP_CASINO_GUARDS, true)
	for i,guard in pairs(MEMBERS_GROUP_CASINO_GUARDS) do
		on_take_damage("rn01_casino_guard_damaged",guard)
		attack(guard)
	end

	if(IN_COOP) then
		group_create(GROUP_COOP_CASINO_GUARDS, true)
		for i,guard in pairs(MEMBERS_GROUP_CASINO_GUARDS) do
			on_take_damage("rn01_casino_guard_damaged",guard)
			attack(guard)
		end
	end
end

	FIXED_VANTAGE_GROUP_MEMBERS = 
	{
		["rn01_$Gfixed_1"] =	{"rn01_$c018", "rn01_$c019"},
		["rn01_$Gfixed_2"] =	{"rn01_$c020", "rn01_$c021"},
		["rn01_$Gfixed_3"] =	{"rn01_$c022", "rn01_$c023"},
		["rn01_$Gfixed_4"] =	{"rn01_$c024", "rn01_$c053", "rn01_$c054"},
		["rn01_$Gfixed_5"] =	{"rn01_$c055", "rn01_$c056", "rn01_$c057"},
		["rn01_$Gfixed_6"] =	{"rn01_$c058", "rn01_$c059", "rn01_$c060", "rn01_$c061"},
		["rn01_$Gfixed_7"] =	{"rn01_$c062", "rn01_$c063", "rn01_$c064"},
		["rn01_$Gfixed_8"] =	{"rn01_$c065", "rn01_$c066", "rn01_$c067", "rn01_$c068"},
	}

	FIXED_VANTAGE_ATTACK_UNITS = 
	{
		{ 
			["groups"] = { "rn01_$Gfixed_1", "rn01_$Gfixed_2", "rn01_$Gfixed_3" },
			["points"] = { "rn01_$n068", "rn01_$n069", "rn01_$n070", "rn01_$n071", "rn01_$n072", "rn01_$n073"},
			["max attackers"] = 2,
			["max attackers coop"] = 4,
			["attack function"] =  "rn01_fixed_vantage_attack_player",
		},
		{ 
			["groups"] = { "rn01_$Gfixed_4", "rn01_$Gfixed_5", "rn01_$Gfixed_6", "rn01_$Gfixed_7", "rn01_$Gfixed_8" },
			["points"] = 
				{	"rn01_$n056", "rn01_$n057", "rn01_$n058", "rn01_$n059",
					"rn01_$n060", "rn01_$n061", "rn01_$n062", "rn01_$n063",
					"rn01_$n063", "rn01_$n064", "rn01_$n065", "rn01_$n066",
				},
			["max attackers"] = 4,
			["max attackers coop"] = 6,
			["attack function"] =  "rn01_fixed_vantage_attack_gat",
		},

	}

Fixed_vantage_attacker_count_per_unit = {}	-- Number of living attackers spawned from a single unit
Fixed_vantage_attacker_count_per_group = {}	-- Number of living attackers in the same script group

Fixed_vantage_attacker_to_attack_point = {}	-- Maps from attacker to the navpoint from which they're attacking
Fixed_vantage_attacker_to_unit = {}				-- Maps from attacker to attack unit
Fixed_vantage_attacker_to_group = {}			-- Maps from attacker to script group
Attack_point_in_use = {}							-- Attack_point_in_use[point] is true if point is in use

function rn01_fixed_vantage_plant_bombs()

	-- Ronin attack while gat places bombs.
	delay(2.0)
	rn01_gat_place_bombs()
	--rn01_detonate_bombs(TRIGGER_COUNTING_ROOM_DOOR_1, TRIGGER_COUNTING_ROOM_DOOR_2)

	Bombs_planted = true

end

Fixed_vantage_kills = 0
function rn01_fixed_vantage()

	-- Tell the players to guard Gat while he plants some bombs.
	mission_help_table(HELPTEXT_PROMPT_PLANT_BOMBS)

	-- First we need to make sure that the local player is close to where the bombs will be planted.
	-- Otherwise, who knows where Gat is and he may not be able to pathfind to the bomb location.
	local max_gat_distance = 35.0
	local max_player_distance = 5.0
	if (	(get_dist(CHARACTER_GAT, TRIGGER_COUNTING_ROOM_DOOR_1) > max_gat_distance)
			and (get_dist(LOCAL_PLAYER, TRIGGER_COUNTING_ROOM_DOOR_1) > max_player_distance)
		) then

		marker_add_navpoint(TRIGGER_COUNTING_ROOM_DOOR_1,MINIMAP_ICON_LOCATION,INGAME_EFFECT_LOCATION, SYNC_LOCAL)
		while(get_dist(LOCAL_PLAYER, TRIGGER_COUNTING_ROOM_DOOR_1) > max_player_distance) do
			thread_yield()
		end
		marker_remove_navpoint(TRIGGER_COUNTING_ROOM_DOOR_1, SYNC_LOCAL)

	end

	thread_new("rn01_fixed_vantage_plant_bombs")

	for i, attack_unit in pairs (FIXED_VANTAGE_ATTACK_UNITS) do
		Fixed_vantage_attacker_count_per_unit[i] = 0
		for j, group in pairs (attack_unit["groups"]) do
			Fixed_vantage_attacker_count_per_group[group] = 0
		end
	end

	while (not Bombs_planted) do

		-- Loop over all attack units
		for i, attack_unit in pairs (FIXED_VANTAGE_ATTACK_UNITS) do

			local max_attackers = attack_unit["max attackers"]
			if IN_COOP then
				max_attackers = attack_unit["max attackers coop"]
			end

			-- Loop over all groups in the attack unit
			for j, group in pairs (attack_unit["groups"]) do

				local group_available = (not group_is_loaded(group)) and (Fixed_vantage_attacker_count_per_group[group] == 0)
				local space_available = (Fixed_vantage_attacker_count_per_unit[i] < attack_unit["max attackers"] )

				local out_of_sight = true
				for i, attacker in pairs(FIXED_VANTAGE_GROUP_MEMBERS[group]) do
					out_of_sight = out_of_sight and (not rn01_navpoint_in_fov(attacker))
				end

				-- If the group isn't loaded ...
				if ( group_available and space_available and out_of_sight) then

					group_create_hidden(group, true)

					-- Send members of the group to attack
					local num_to_send = max_attackers - Fixed_vantage_attacker_count_per_unit[i]
					num_to_send = min(num_to_send, sizeof_table(FIXED_VANTAGE_GROUP_MEMBERS[group]))
					Fixed_vantage_attacker_count_per_group[group] = num_to_send
					Fixed_vantage_attacker_count_per_unit[i] =  Fixed_vantage_attacker_count_per_unit[i] + num_to_send

					for k=1, num_to_send, 1 do
						
						-- Show the attacker
						local attacker = FIXED_VANTAGE_GROUP_MEMBERS[group][k]
						marker_add_npc(attacker, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL)
						on_death("rn01_fixed_vantage_attacker_killed", attacker)

						-- Send to an unused attack point
						local num_attack_points = sizeof_table(attack_unit["points"])
						local point_index = rand_int(1,num_attack_points)
						for ii=1, num_attack_points,1 do

							local point = attack_unit["points"][point_index]
							
							if (not Attack_point_in_use[point]) then
								Attack_point_in_use[point] = true
								Fixed_vantage_attacker_to_attack_point[attacker] = point
								Fixed_vantage_attacker_to_unit[attacker] = i
								Fixed_vantage_attacker_to_group[attacker] = group
								thread_new(attack_unit["attack function"], attacker,  point)
								break;
							else
								point_index = point_index + 1
								if (point_index > num_attack_points) then
									point_index = 1
								end
							end
						end

					end -- End for k=1, ...

					delay(2.0)

				end -- End if (not group_is_loaded ...				
			end

		end
		thread_yield()
	end


	for group, member_list in pairs(FIXED_VANTAGE_GROUP_MEMBERS) do
		for j,member in pairs(member_list) do
				
			if ( character_exists(member) and not character_is_dead(member) ) then

				on_death("", member)
				marker_remove_npc(member)

			end

		end

		-- Destroy the groups in rn01_guard_box_loaders, don't want them popping.
		--group_destroy(group)

	end

end

function rn01_navpoint_in_fov(navpoint, radius)

	local navpoint_in_local_fov = navpoint_in_player_fov(navpoint, LOCAL_PLAYER, radius)
	local navpoint_in_remote_fov = false
	if (IN_COOP) then
		navpoint_in_remote_fov = navpoint_in_player_fov(navpoint, REMOTE_PLAYER, radius)
	end

	return (navpoint_in_local_fov or navpoint_in_remote_fov)

end

function rn01_fixed_vantage_attack_player(ronin, attack_point)

	character_show(ronin)

	-- Move to attack point
	move_to(ronin, attack_point, 2, true, true)
	npc_leash_to_nav(ronin, attack_point, 1.0)

	attack(ronin)

end

function rn01_fixed_vantage_attack_gat(ronin, attack_point)

	character_show(ronin)

	-- Move to attack point
	move_to(ronin, attack_point, 2, true, true)
	npc_leash_to_nav(ronin, attack_point, 1.0)

	if (not character_is_dead(CHARACTER_GAT)) then
		attack(ronin, CHARACTER_GAT)
	else
		attack(ronin)
	end
end

function rn01_fixed_vantage_attacker_killed(attacker)

	Fixed_vantage_kills = Fixed_vantage_kills + 1
	
	marker_remove_npc(attacker)

	local attack_point = Fixed_vantage_attacker_to_attack_point[attacker]
	Attack_point_in_use[attack_point] = false
	Fixed_vantage_attacker_to_attack_point[attacker] = nil

	local unit = Fixed_vantage_attacker_to_unit[attacker]
	Fixed_vantage_attacker_count_per_unit[unit] = Fixed_vantage_attacker_count_per_unit[unit] - 1
	Fixed_vantage_attacker_to_unit[attacker] = nil

	delay(1.0)

	-- If there are no more attackers from this group, then release it to the world so that it
	-- can be respawned.
	local group = Fixed_vantage_attacker_to_group[attacker]
	Fixed_vantage_attacker_count_per_group[group] = Fixed_vantage_attacker_count_per_group[group] - 1
	if (Fixed_vantage_attacker_count_per_group[group] == 0) then
		release_to_world(group)
	end
end

-- Players have to drive to the Casino
function rn01_drive_to_casino()

	-- Start a thread to handle Gat's dialogue during the drive.
	local gat_dialogue_thread = thread_new("rn01_casino_drive_gat_dialogue")
	rn01_send_to_location(	TRIGGER_CASINO_ARRIVAL, INGAME_EFFECT_LOCATION, HELPTEXT_PROMPT_CASINO, true)
	thread_kill(gat_dialogue_thread)

end

-- Players have to gain access to the counting room.
function rn01_gain_access()
		
	door_lock(DOOR_COUNTING_ROOM_1, true)
	door_lock(DOOR_COUNTING_ROOM_2, true)

	-- Force no notoriety spawns when in the casino
	notoriety_force_no_spawn("Ronin", true)
	ambient_gang_spawn_enable(false)

	-- Delay a couple of seconds before telling the player to kill the guards.
	delay(2)	
	rn01_process_enemy_set(	MEMBERS_GROUP_CASINO_GUARDS, HELPTEXT_PROMPT_GUARDS, HELPTEXT_OBJECTIVE_GUARDS, 
									DOOR_CASINO_MAIN_1, DOOR_CASINO_MAIN_2)
	
	rn01_fixed_vantage()

	-- Warn the player that the bombs are going to detonate
	mission_help_table_nag(HELPTEXT_PROMPT_BOMB_WARNING)

	delay(5.0)

	explosion_create(EXPLOSION_NAME, TRIGGER_COUNTING_ROOM_DOOR_1, CHARACTER_GAT, false)
	explosion_create(EXPLOSION_NAME, TRIGGER_COUNTING_ROOM_DOOR_2, CHARACTER_GAT, false)

	delay(0.5)

	mesh_mover_hide(DOOR_COUNTING_ROOM_1)
	mesh_mover_hide(DOOR_COUNTING_ROOM_2)

	delay(2.0)

end

Gat_bomb_progress = 0
Gat_planting_bomb = false
function rn01_gat_place_bombs()

	thread_new("rn01_bomb_progress_bar")

	local bomb_planting_audio

	local function rn01_plant_bomb(target, required_progress)

		while(Gat_bomb_progress < required_progress) do

			thread_yield()

			if( not character_is_ready(CHARACTER_GAT) ) then
				Gat_planting_bomb = false
			-- If Gat is too far, have him move back to the target
			elseif( get_dist(CHARACTER_GAT, target) > 2) then
				Gat_planting_bomb = false
            if crouch_is_crouching(CHARACTER_GAT) then
               crouch_stop(CHARACTER_GAT)
            end
				move_to(CHARACTER_GAT, target, 2, true, false)
			elseif (not check_animation_state(CHARACTER_GAT, STATE_PLANT_BOMB)) then
				Gat_planting_bomb = false
				set_animation_state(CHARACTER_GAT, STATE_PLANT_BOMB)				
				bomb_planting_audio = audio_play_for_navpoint("SFX_DON_BOMBPLANTING", target, "foley")
			elseif not crouch_is_crouching(CHARACTER_GAT) then
				Gat_planting_bomb = false
				crouch_start(CHARACTER_GAT)
				delay(1)
			else
				Gat_planting_bomb = true
			end
		end

		audio_stop(bomb_planting_audio)
		audio_play_for_navpoint("SFX_DON_BOMBPLANTED", target, "foley")
		clear_animation_state(CHARACTER_GAT)
		if crouch_is_crouching(CHARACTER_GAT) then
			crouch_stop(CHARACTER_GAT)
		end		

	end	-- End functions rn01_plant_bomb()

	follower_make_independent(CHARACTER_GAT, true)
	npc_combat_enable(CHARACTER_GAT, false)
	character_make_priority_target(CHARACTER_GAT, true, 20)

	rn01_plant_bomb(TRIGGER_COUNTING_ROOM_DOOR_1, 50)
	rn01_plant_bomb(TRIGGER_COUNTING_ROOM_DOOR_2, 100)

	character_make_priority_target(CHARACTER_GAT, false)
	follower_make_independent(CHARACTER_GAT, false)
	npc_combat_enable(CHARACTER_GAT, true)
end

-- Fill the bomb planting progress bar. Max progress limited by # of kills. Progress rate limited
-- by the min amount of time that it can take for Gat to plant the bombs.
function rn01_bomb_progress_bar()

	local max_progress = 0

	local kills_required = BOMB_PLANT_KILLS_REQUIRED
	if ( IN_COOP ) then
		kills_required = BOMB_PLANT_KILLS_REQUIRED_COOP
	end

	local progress_per_kill = 100 / kills_required
	local progress_per_sec = 100 / BOMB_PLANT_MIN_TIME_S

	hud_bar_on(0, "Health", HELPTEXT_HUD_GAT_PROGRESS, 1.0 )
	hud_bar_set_range(0, 0, 100, SYNC_ALL)
	hud_bar_set_value(0, 0, SYNC_ALL)

	while (max_progress < 100) do

		thread_yield()

		-- Determine the max progress
		max_progress = Fixed_vantage_kills * progress_per_kill
		if (max_progress > 100) then
			max_progress = 100
		end

		-- Increment the progress meter if needed
		local increment_size = max_progress - Gat_bomb_progress			-- Amount we can move the progress bar
		local increment_time_s = increment_size / progress_per_sec		-- Amount of time it will take
		local initial_progress = Gat_bomb_progress
		local cumulative_time_s = 0
		while (Gat_bomb_progress < max_progress) do
			thread_yield()
			if (Gat_planting_bomb) then
				cumulative_time_s = cumulative_time_s + get_frame_time()
				Gat_bomb_progress = initial_progress + increment_size * (cumulative_time_s / increment_time_s)
				if (Gat_bomb_progress > max_progress) then
					Gat_bomb_progress = max_progress
				end
				hud_bar_set_value(0, Gat_bomb_progress, SYNC_ALL)
			end
		end

	end

	hud_bar_off(0)
	hud_timer_stop(0)

end

-- Guard patrol thread
-- Currently, if a guard enters combat, then their currently occupied path
-- is never released.
function rn01_casino_guard_patrol(guard)

	turn_to(guard,"rn01_$n030",false)
	delay(1.0)
	set_animation_state( guard, "Doorman stand")

	local at_spawn_location = true
	local can_patrol = (CASINO_GUARD_INITIAL_PATH_SEGMENTS[guard] ~= nil)
	local num_initial_path_segments = 0
	if (can_patrol) then
		num_initial_path_segments = sizeof_table(CASINO_GUARD_INITIAL_PATH_SEGMENTS[guard])
	end

	local current_segment_index = 0
	local current_direction = DIR_FORWARD
	local current_node_index = 0
	local current_segment_num_nodes = 0

	-- If this guard can't patrol, we can let this thrad die
	while(can_patrol) do

		local output = guard .. " seg_ind = " .. current_segment_index
		output = output .. " dir = " .. current_direction
		output = output .. " node_ind = " .. current_node_index
		output = output .. " seg_num_nodes = " .. current_segment_num_nodes

		-- While we are at the spawn location, maybe decide to go for a little stroll
		if (at_spawn_location) then
			
			local start_patrol_probability = .1
			if (current_node_index == 0) then
				start_patrol_probability = .5
			end
			local start_patrol_roll = rand_float(0.0,1.0)			

			-- If we should try to start a patrol
			if (start_patrol_roll < start_patrol_probability) then

				-- Select a path segment randomly from our list of possible initial paths
				local transition_info_index = rand_int(1,num_initial_path_segments)
				local transition_info = CASINO_GUARD_INITIAL_PATH_SEGMENTS[guard][transition_info_index]
				local path_segment_index = transition_info[1]

				-- If the path is not occupied, start pathfinding
				if ( Path_segment_occupied[path_segment_index] ~= true) then

					Path_segment_occupied[path_segment_index] = true

					at_spawn_location = false

					current_segment_index = path_segment_index
					current_direction = transition_info[2]

					if(current_direction == DIR_EITHER) then
						local dir_roll = rand_int(1,2)
						if (dir_roll == 1) then
							current_direction = DIR_FORWARD
						else
							current_direction = DIR_REVERSE
						end
					end

					current_node_index =  transition_info[3]
					current_segment_num_nodes = sizeof_table(CASINO_GUARD_PATH_SEGMENTS[current_segment_index])

					move_to(guard, CASINO_GUARD_PATH_SEGMENTS[current_segment_index][current_node_index])
					
				end
			end

		-- Otherwise, already on patrol
		else
			
			local end_patrol_probability = .1
			local end_patrol_roll = rand_float(0.0,1.0)

			-- If we are ending the patrol, then return to the spawn location
			if(end_patrol_roll < end_patrol_probability) then

				move_to(guard, guard)
				Path_segment_occupied[current_segment_index] = false
				at_spawn_location = true
				turn_to(guard,"rn01_$n030",false)
			-- Otherwise, try to continue patrolling
			else
				
				-- Maybe look for a transition onto another patrol
				local transition_probability = 0.5
				local transition_roll = rand_float(0.0,1.0)
				local transition_found = false
				local transition_info = nil
				if (transition_roll < transition_probability) then

					local current_node = CASINO_GUARD_PATH_SEGMENTS[current_segment_index][current_node_index]

					if (CASINO_GUARD_SEGMENT_TRANSITIONS[current_node] ~= nil) then

						local num_transitions_in_dir = 0
						if (CASINO_GUARD_SEGMENT_TRANSITIONS[current_node][current_direction] ~= nil) then
							num_transitions_in_dir =
								sizeof_table(CASINO_GUARD_SEGMENT_TRANSITIONS[current_node][current_direction])
						end

						local num_transitions_in_either = 0
						if (CASINO_GUARD_SEGMENT_TRANSITIONS[current_node][DIR_EITHER] ~= nil) then
							num_transitions_in_either =
								sizeof_table(CASINO_GUARD_SEGMENT_TRANSITIONS[current_node][DIR_EITHER])
						end

						if (num_transitions_in_either + num_transitions_in_dir > 0) then

							local rand_transition = rand_int (1, num_transitions_in_dir + num_transitions_in_either)

							if (rand_transition > num_transitions_in_dir) then
								rand_transition = rand_transition - num_transitions_in_dir
								transition_info = CASINO_GUARD_SEGMENT_TRANSITIONS[current_node][DIR_EITHER][rand_transition]
							else
								transition_info = CASINO_GUARD_SEGMENT_TRANSITIONS[current_node][current_direction][rand_transition]
							end
							
							if (Path_segment_occupied[transition_info[1]] ~= true) then
								transition_found = true
							end

						end

					end

				end

				if (transition_found == true) then

					current_direction = transition_info[2]
					if(current_direction == DIR_EITHER) then
						local dir_roll = rand_int(1,2)
						if (dir_roll == 1) then
							current_direction = DIR_FORWARD
						else
							current_direction = DIR_REVERSE
						end
					end
					current_node_index =  transition_info[3]

					local transition_segment_index = transition_info[1]
					local transition_node_index = transition_info[2]
					move_to(guard, CASINO_GUARD_PATH_SEGMENTS[transition_segment_index][transition_node_index])

					Path_segment_occupied[current_segment_index] = false
					Path_segment_occupied[transition_segment_index] = true
					current_segment_index = transition_segment_index
					current_segment_num_nodes = sizeof_table(CASINO_GUARD_PATH_SEGMENTS[current_segment_index])

				else
					
					-- Get the index of the next node to pathfind to
					if(current_direction == DIR_FORWARD) then
						current_node_index = current_node_index + 1
						if (current_node_index > current_segment_num_nodes) then
							current_node_index = 1
						end
					else
						current_node_index = current_node_index - 1
						if (current_node_index == 0) then
							current_node_index = current_segment_num_nodes
						end
					end
				
					move_to(guard, CASINO_GUARD_PATH_SEGMENTS[current_segment_index][current_node_index])

				end
				
			end

		end

		-- If we're still at the spawn location, then delay a bit before thinking about moving again.
		if (at_spawn_location) then
			delay(2.0,4.0)
		end

		thread_yield()

	end

end

-- After a guard has been damaged, set players minimum Ronin notoriety
function rn01_casino_guard_damaged(guard, attacker, damage_percent)
	if (	attacker == LOCAL_PLAYER or
			attacker == CHARACTER_GAT or
			attacker == REMOTE_PLAYER) then

		-- Turn off action nodes in the Casino at this point.
		action_nodes_enable(false)

		-- Set min Ronin notoriety
		if (not IN_COOP) then
			notoriety_set_min("Ronin",MIN_RONIN_NOTORIETY)
			notoriety_set("Ronin",MIN_RONIN_NOTORIETY)
		else
			notoriety_set_min("Ronin", COOP_MIN_RONIN_NOTORIETY)
			notoriety_set("Ronin", COOP_MIN_RONIN_NOTORIETY)
		end
	end

	for i,guard in pairs(MEMBERS_GROUP_CASINO_GUARDS) do
		if (not character_is_dead(guard)) then
			set_attack_player_flag(guard, true)
		end
	end

end

-- Plays a series of Gat's dialogue line as the player(s) travel to the Casino.
function rn01_casino_drive_gat_dialogue()

	-- Wait until the player is 30& of the way to the casino
	local total_distance = get_dist(LOCAL_PLAYER, TRIGGER_CASINO_ARRIVAL)
	while( get_dist(LOCAL_PLAYER, TRIGGER_CASINO_ARRIVAL) > 0.7 * total_distance ) do
		thread_yield()
	end

	-- Make sure that Gat is near the player
	while( get_dist(LOCAL_PLAYER, CHARACTER_GAT) > 25 ) do
		thread_yield()
	end

	-- Play the conversation
	audio_play_conversation( INTRO_CONVERSATION)

end

-- Delays a bit and then bumps up police notoriety
function rn01_drive_notoriety()


	local total_dist = get_dist(VEHICLE_TRUCK, TRIGGER_AISHAS)

	-- Allow notoriety to be reduced to 0 via Forgive-and-Forgets, but don't let it decay by itself.
	notoriety_set_min("Police", 0)
	notoriety_set_max("Police", 0)
	notoriety_set("Police", 0)

	notoriety_set_min("Ronin", 1)
	notoriety_set("Ronin", 1)
	notoriety_set_max("Ronin",1)

	notoriety_set_can_decay(false)

	delay(8.)

	-- Set min police notoriety
	if (not IN_COOP) then
		notoriety_set_max("Police", MIN_POLICE_NOTORIETY)
		notoriety_set("Police",MIN_POLICE_NOTORIETY)
	else
		notoriety_set_max("Police", COOP_MIN_POLICE_NOTORIETY)
		notoriety_set("Police", COOP_MIN_POLICE_NOTORIETY)
	end
	
	audio_play_for_character("GAT_RON1_ESCAPE_01", CHARACTER_GAT, "voice", false, true)

	delay(10)
	thread_new("rn01_launder_conversation")

	while( get_dist(VEHICLE_TRUCK, TRIGGER_AISHAS) > 0.5 * total_dist ) do
		thread_yield()
	end

	notoriety_set_max("Ronin",2)
	notoriety_set_min("Ronin", 2)

end

Rn01_call_received = false
function rn01_call_received()
	Rn01_call_received = true
end

function rn01_launder_conversation()
	if (IN_COOP) then
		mid_mission_phonecall("rn01_call_received")
		while( not Rn01_call_received ) do
			thread_yield()
		end
		audio_play_conversation( LAUNDER_CONVERSATION_COOP, INCOMING_CALL)
	else
		audio_play_conversation( LAUNDER_CONVERSATION)
	end
end

function rn01_cleanup()

	-- Reevaluate IN_COOP, remote player may have dropped.
	IN_COOP = coop_is_active()

	-- Get rid of the any mid-mission phone calls
	mid_mission_phonecall_reset()

	-- Remove the navpoint indicated where the server needs to go before Gat will start planting bombs
	marker_remove_navpoint(TRIGGER_COUNTING_ROOM_DOOR_1, SYNC_LOCAL)

	-- Make sure that trucks are not invulnerable
	if (vehicle_exists(VEHICLE_TRUCK) and (not vehicle_is_destroyed(VEHICLE_TRUCK))) then
		turn_vulnerable(VEHICLE_TRUCK)
		on_vehicle_destroyed("", VEHICLE_TRUCK)
		on_vehicle_enter("", VEHICLE_TRUCK)
		on_vehicle_exit("", VEHICLE_TRUCK)
		vehicle_door_prevent_damage_detach( VEHICLE_TRUCK, "Door_BR", false )
		vehicle_door_prevent_damage_detach( VEHICLE_TRUCK, "Door_BL", false )
	end

	-- Remove persona overrides
	persona_override_group_stop(RONIN_PERSONAS,POT_SITUATIONS[POT_ATTACK])
	persona_override_group_stop(SAINTS_PERSONAS,POT_SITUATIONS[POT_ATTACK])
	persona_override_group_stop(SAINTS_PERSONAS,POT_SITUATIONS[POT_CUSTOM_1])
	persona_override_group_stop(SAINTS_PERSONAS,POT_SITUATIONS[POT_CUSTOM_2])

	-- Get rid of too-far from Casino timer
		hud_timer_stop(1)
		objective_text_clear(1)

	-- Reset global overrides

		-- Reset the spawning
		npc_respawn_dist_reset()
		spawning_vehicles(true)
		spawning_pedestrians(true)
		set_ped_density(1)
		action_nodes_enable(true)
		ambient_gang_spawn_enable(true)
		spawning_allow_cop_ambient_spawns(true)

	-- Clean up the UI

		-- clear mission item pickup text
		on_mission_item_pickup("")

		-- clear objective text
		objective_text_clear(0)

		-- remove any possible waypoint
		rn01_update_waypoint("", LOCAL_PLAYER)
		if( IN_COOP ) then
			rn01_update_waypoint("", REMOTE_PLAYER)	
		end

		-- remove all markers
		for i,enemy in pairs(MEMBERS_GROUP_CASINO_GUARDS) do
			marker_remove_npc(enemy)
		end

		marker_remove_npc(CHARACTER_HELPER)
		marker_remove_npc(CHARACTER_PIERCE)

	-- disable all triggers
	for i, trigger in pairs(TABLE_ALL_TRIGGERS) do
		on_trigger("",trigger)
	end

	-- Remove all callbacks

		-- trigger callbacks
		for i, trigger in pairs(TABLE_ALL_TRIGGERS) do
			on_trigger("",trigger)
			on_trigger_exit("",trigger)
		end

		-- stage 4 ronin waves callbacks
		for i,enemy in pairs(MEMBERS_GROUP_CASINO_GUARDS) do
			on_death("",enemy)
		end

		-- other character callbacks
		on_death("", CHARACTER_GAT)
		on_dismiss("", CHARACTER_GAT)

	-- Remove followers
		party_dismiss_all()
end

function rn01_success()
	-- Called when the mission has ended with success
	radio_post_event("JANE_NEWS_RON01", true)
end


-- Player in truck?
Truck_markers_displayed = {[LOCAL_PLAYER] = false, [REMOTE_PLAYER] = false}
function rn01_prereq_player_in_truck(player)

	if(vehicle_is_destroyed(VEHICLE_TRUCK) or (not vehicle_exists(VEHICLE_TRUCK))) then
		return true
	end

	if (character_is_in_vehicle(player, VEHICLE_TRUCK)) then
		if(Truck_markers_displayed[player]) then
			marker_remove_vehicle(VEHICLE_TRUCK, PLAYER_SYNC[player])
			Truck_markers_displayed[player] = false
		end
		return true
	else
		if(not Truck_markers_displayed[player]) then
			marker_add_vehicle(VEHICLE_TRUCK,MINIMAP_ICON_PROTECT_ACQUIRE,INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE,PLAYER_SYNC[player])
			Truck_markers_displayed[player] = true
			rn01_update_waypoint("", player)
		end
		return false
	end
end

rn01_location_reached			= false
failed_prereq = {[LOCAL_PLAYER] = 0, [REMOTE_PLAYER] = 0}
function rn01_send_to_location(trigger, effect, helptext, use_waypoint, prereq_list, time, time_failure_function)

	failed_prereq = {[LOCAL_PLAYER] = 0, [REMOTE_PLAYER] = 0}

	-- Location not yet reached
	rn01_location_reached = false

	-- enable the trigger, add a minimap icon, glow effect, and callback
	trigger_enable(trigger,true)
	marker_add_trigger(trigger,MINIMAP_ICON_LOCATION,effect)
	on_trigger("rn01_toggle_location_reached",trigger)
	trigger_set_delay_between_activations( trigger, 0)

	-- Maybe add waypoint
	if (use_waypoint) then
		rn01_update_waypoint(trigger, LOCAL_PLAYER)
		if(IN_COOP) then
			rn01_update_waypoint(trigger, REMOTE_PLAYER)
		end
	end

	-- Maybe add failure function
	if (time and time_failure_function) then
		hud_timer_set(1, time, time_failure_function)
	end

	-- Tell the player what to do
	if (helptext) then
		mission_help_table(helptext)
	end

	-- wait for player(s) to arrive
	--local initial_pass = true

	-- Maybe check to see if player needs to do something else before heading to location
	local function check_player_prereqs(player)

		-- If we have a list of prereqs
		if(prereq_list ~= nil) then

			-- Loop over all prereqs to see if any have  been failed
			-- Prereqs are listed in order of importance, so we can't use pairs()
			local new_failed_prereq = 0
			for i=1, sizeof_table(prereq_list), 1 do

				local prereq_function = prereq_list[i][1]
				local prereq_helptext = prereq_list[i][2]

				if(not prereq_function(player)) then

					-- If we just began failing the prereq...
					if ( i ~= failed_prereq[player] ) then

						-- Eliminate any leftover waypoints/markers from lower-priority prereqs failing
						rn01_update_waypoint( "", player)
						if(failed_prereq[player] == 0) then
							marker_remove_trigger(trigger, PLAYER_SYNC[player])
						end

						-- Tell the player what they need to do
						if( prereq_helptext ) then
							mission_help_table_nag(prereq_helptext, "", "", PLAYER_SYNC[player])
						end
					end

					-- We don't need to check any more prereqs
					new_failed_prereq = i
					break;

				end -- Ends prereq function fulfillment
			end -- Ends loop over prereqs

			-- If the players weren't meeting prereqs and now they are then reenable the destination
			if ( (new_failed_prereq == 0) and (failed_prereq[player] ~= 0) ) then
	
				-- Remove old waypoint that might have been added for failed prereq
				rn01_update_waypoint( "", player)
	
				-- Readd minimap location and waypoint
				marker_add_trigger(trigger,MINIMAP_ICON_LOCATION,effect,SYNC_ALL)
				if (use_waypoint) then
					rn01_update_waypoint( trigger, player)
				end

				-- Remind player what the original goal was
				if (helptext) then
					mission_help_table_nag(helptext, "", "", PLAYER_SYNC[player])
				end

			-- On the initial pass, if no prereqs were failed then display the helptext
			--elseif( new_failed_prereq == 0 and initial_pass) then
			--	if (helptext) then
			--		mission_help_table(helptext,  "", "", PLAYER_SYNC[player])
			--	end
			end

			failed_prereq[player] = new_failed_prereq

		end -- Ends prereq list processing	

	end

	while (not rn01_location_reached) do

		check_player_prereqs(LOCAL_PLAYER)
		if(IN_COOP) then
			check_player_prereqs(REMOTE_PLAYER)
		end

		--initial_pass = false

		thread_yield()
	end

	-- Maybe turn off timer
	if (time and time_failure_function) then
			hud_timer_stop(1)
	end
end

function rn01_toggle_location_reached(triggerer,trigger)

	if(failed_prereq[triggerer] == 0) then

		rn01_location_reached = true		
		trigger_enable(trigger, false)
		marker_remove_trigger(trigger, SYNC_ALL)
		on_trigger("",trigger)
		rn01_update_waypoint("", LOCAL_PLAYER)
		if (IN_COOP) then
			rn01_update_waypoint("", REMOTE_PLAYER)
		end

	end
end

rn01_enemies_to_kill = 0
rn01_enemies_living = 0
rn01_enemy_set_objective_helptext = ""

-- Wait for the player to kill a group of enemies
-- 
-- enemy_table				A table containing the names of the enemies that need to be killed
-- mission_helptext		The helptext message that will prompt the player(s) to kill the enemies
-- objective_helptext	The objective text displayed in the hud, needs to be in the format %s of %s killed
-- ...						A list of doors that will be unlocked to give the player access to the enemies
function rn01_process_enemy_set(enemy_table, mission_helptext, objective_helptext, ...)

	-- Assign enemy callbacks, add markers
	for i, enemy in pairs(enemy_table) do
		if (not character_is_dead(enemy)) then
			on_death("rn01_enemy_killed", enemy)
			marker_add_npc(enemy, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL) 
			rn01_enemies_to_kill = rn01_enemies_to_kill + 1
		end
	end
	rn01_enemies_living =  rn01_enemies_to_kill

	-- Open doors
	for i, door in ipairs(arg) do
		door_lock(door, false)
	end

	-- Display the objective text
	if(objective_helptext) then
		rn01_enemy_set_objective_helptext = objective_helptext
		objective_text(0, rn01_enemy_set_objective_helptext, rn01_enemies_to_kill - rn01_enemies_living, rn01_enemies_to_kill)
	end

	-- Display the help text
	if(mission_helptext) then
		mission_help_table(mission_helptext)
	end

	
	while (rn01_enemies_living > 0) do
		thread_yield()
	end

end

function rn01_enemy_killed(enemy)
	marker_remove_npc(enemy)
	on_death("",enemy)
	rn01_enemies_living = rn01_enemies_living - 1
	if (rn01_enemies_living < 1) then
		objective_text_clear(0)
		rn01_enemy_set_objective_helptext = ""
	else
		if (rn01_enemy_set_objective_helptext ~= "") then
			objective_text(0, rn01_enemy_set_objective_helptext, rn01_enemies_to_kill - rn01_enemies_living, rn01_enemies_to_kill)
		end

		if (rn01_enemies_living == 5) then
			for i,guard in pairs(MEMBERS_GROUP_CASINO_GUARDS) do
				if (not character_is_dead(guard)) then
					npc_leash_remove(guard)
					attack(guard)
				end
			end		
		end
	end
end

function rn01_complete()

	-- Get rid of the any mid-mission phone calls. We don't want them playing during the cutscene.
	mid_mission_phonecall_reset()

	-- End the mission with success
	mission_end_success(MISSION_NAME, CUTSCENE_OUT)
end

-- Doors usually close on chunk load/reload... this keeps them open.
function rn01_keep_doors_open()
	while (true) do
		for door,opened in pairs (Door_opened) do
			door_open(door)
		end
		thread_yield()
	end
end

function rn01_guard_box_loaders()


	for group, member_list in pairs(FIXED_VANTAGE_GROUP_MEMBERS) do
		group_destroy(group)
	end

	-- Make sure these are opened when player can't see them
	Door_opened[DOOR_COUNTING_ROOM_1] = true
	Door_opened[DOOR_COUNTING_ROOM_2] = true
	Door_opened[DOOR_CASINO_AREA_1] = true
	Door_opened[DOOR_CASINO_AREA_2] = true
	Door_opened[DOOR_CASINO_MAIN_1] = true
	Door_opened[DOOR_CASINO_MAIN_2] = true			

	-- Setup the truck and play the cutscene
	rn01_setup_truck()

	-- Don't let the vehicle's doors open
	vehicle_door_prevent_damage_detach( VEHICLE_TRUCK, "Door_BR", true )
	vehicle_door_prevent_damage_detach( VEHICLE_TRUCK, "Door_BL", true )

	-- Send player(s) to the casino
	rn01_send_to_hq()	
end


function rn01_setup_truck()

	-- Kill off vehicle and ped spawning
	spawning_vehicles(false)
	spawning_pedestrians(false, true)

	-- Player(s)/Gat shouldn't be in a vehicle
	character_evacuate_from_all_vehicles(LOCAL_PLAYER)
	if (IN_COOP) then
		character_evacuate_from_all_vehicles(REMOTE_PLAYER)
	end
	if (character_is_in_vehicle(CHARACTER_GAT)) then
		character_evacuate_from_all_vehicles(CHARACTER_GAT)
	end

	-- Play the In Game Cutscene.
	cutscene_play("IG_rn01_scene1", "", "", false) -- don't fade in after

	-- Remove helpers from the truck and destroy them
	vehicle_evacuate(VEHICLE_TRUCK)
	character_destroy(CHARACTER_PIERCE)
	character_destroy(CHARACTER_HELPER)

	-- Add the on-death failure callback to the truck
	on_vehicle_destroyed("rn01_failure_truck_destroyed", VEHICLE_TRUCK)

	-- Place local player and either Gat or the remote player into the vehicle
	if(IN_COOP) then
		npc_stop_following(CHARACTER_GAT)
		character_destroy(CHARACTER_GAT)
		vehicle_enter_teleport(LOCAL_PLAYER, VEHICLE_TRUCK, 0)
		vehicle_enter_teleport(REMOTE_PLAYER, VEHICLE_TRUCK, 1)
	else

		if ( coop_is_active() == false ) then
			-- Find Gat's current index
			local gat_follower_index = party_get_follower_index(CHARACTER_GAT)

			-- If he's not the first follower, swap him and the first one
			if ( gat_follower_index > 0 ) then
				party_swap_follower_indices( 0, gat_follower_index )
				delay( 1.0 )
			end
		end

		vehicle_enter_teleport(CHARACTER_GAT, VEHICLE_TRUCK, 1)
		vehicle_enter_teleport(LOCAL_PLAYER, VEHICLE_TRUCK, 0)
		set_perfect_aim(CHARACTER_GAT, false)
		party_add(CHARACTER_GAT, LOCAL_PLAYER)
		npc_combat_enable(CHARACTER_GAT, true)
		set_ignore_ai_flag(CHARACTER_GAT,false)
		set_attack_enemies_flag(CHARACTER_GAT,true)
		npc_weapon_pickup_override(CHARACTER_GAT,true)
	end

	-- Wait for everyone to get in the truck
	rn01_wait_for_vehicle_entry(LOCAL_PLAYER, VEHICLE_TRUCK, 0)
	if(IN_COOP) then
		rn01_wait_for_vehicle_entry(REMOTE_PLAYER, VEHICLE_TRUCK, 1)
		delay(1.0)
	else
		rn01_wait_for_vehicle_entry(CHARACTER_GAT, VEHICLE_TRUCK, 1)
	end

	-- Allow spawning to return to normal
	spawning_vehicles(true)
	spawning_pedestrians(true)
	spawning_allow_cop_ambient_spawns(true)	

	-- Fade back in from the cutscene
	mission_start_fade_in()

end

-- Wait for a character to enter a vehicle. Blocks 
function rn01_wait_for_vehicle_entry(character, vehicle, seat_index)

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

function rn01_send_to_hq()

	-- Add the on-death failure callback to the truck
	if (vehicle_exists(VEHICLE_TRUCK) and not vehicle_is_destroyed(VEHICLE_TRUCK)) then
		on_vehicle_destroyed("rn01_failure_truck_destroyed", VEHICLE_TRUCK)
	end

	--Re-allow Ronin notoriety spawns
	notoriety_force_no_spawn("Ronin", false)

	-- Bump up police notoriety a bit after the player(s) enter the truck
	thread_new("rn01_drive_notoriety")

	-- Send the players home, but require them to be in the vehicle and have 0 notoriety.
	rn01_send_to_location(	TRIGGER_AISHAS, 
									INGAME_EFFECT_VEHICLE_LOCATION, 
									HELPTEXT_PROMPT_HEAD_HOME,
									true, 
									{	{rn01_prereq_player_in_truck, HELPTEXT_PROMPT_REENTER_TRUCK},
--										{rn01_prereq_zero_notoriety, HELPTEXT_PROMPT_NOTORIETY_ZERO},
									}
								)

end

function rn01_update_waypoint(waypoint, player)
	if(Gps_waypoint[player] ~= waypoint) then
		
		waypoint_remove(PLAYER_SYNC[player])
		Gps_waypoint[player] = waypoint
		
		if(waypoint ~= "") then
			waypoint_add(waypoint, PLAYER_SYNC[player])
		end
		
	end
end

function rn01_prereq_zero_notoriety()

	-- Is notoriety at 0?
	local at_zero_notoriety = (	(notoriety_get_decimal("Ronin") == 0) and 
											(notoriety_get_decimal("Police") == 0)
										)

	-- Updates the gps of one player
	local function update_confessional_gps(player)

		if(not at_zero_notoriety) then
			local new_confessional = confessionals_get_nearest_trigger(player)
			rn01_update_waypoint(new_confessional, player)
		end

	end

	-- Update both players' gps
	update_confessional_gps(LOCAL_PLAYER)
	if (IN_COOP) then
		update_confessional_gps(REMOTE_PLAYER)
	end

	-- Return true if the prereq is met, false else
	return at_zero_notoriety

end

-- MISSION FAILURE FUNCTIONS --------------------------------

-- Add callbacks which need to exist throughout the mission, only adds callbacks
-- if the groups are loaded.
function rn01_add_mission_failure_callbacks()

	-- Add death/abandoment failures for Johnny Gat
	on_death("rn01_failure_gat_died", CHARACTER_GAT)
	on_dismiss("rn01_failure_gat_abandoned", CHARACTER_GAT)
end

function rn01_failure_gat_died()
	-- End the mission, Gat died
	mission_end_failure(MISSION_NAME, HELPTEXT_FAILURE_GAT_DIED)
end

function rn01_failure_gat_abandoned()
	-- End the mission, Gat abandoned
	mission_end_failure(MISSION_NAME, HELPTEXT_FAILURE_GAT_ABANDONED)
end

function rn01_failure_pierce_died()
	-- End the mission, Pierce died
	mission_end_failure(MISSION_NAME, HELPTEXT_FAILURE_PIERCE_DIED)
end

function rn01_failure_pierce_abandoned()
	-- End the mission, Pierce abandoned
	mission_end_failure(MISSION_NAME, HELPTEXT_FAILURE_PIERCE_ABANDONED)
end

function rn01_failure_truck_destroyed()
	-- End the mission, Gat abandoned
	delay(2.0)
	mission_end_failure(MISSION_NAME, HELPTEXT_FAILURE_TRUCK_DESTROYED)
end
