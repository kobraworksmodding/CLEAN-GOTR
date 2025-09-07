-- rn08.lua
-- SR2 mission script
-- 3/28/07

-- Cutscene crash fixes by IdolNinja
-- 3/11/2011

-- Global constants ( ALL_CAPS means that they shouldn't be modified in running code, except for maybe in a setup function )

	-- Coop mission?
	IN_COOP	= false

	-- GROUPS --

		-- the arms dealer group
		GROUP_ARMS_DEALER				= "rn08_$Garms_dealer"
	
		-- Ronin soldiers on the ground floor
		GROUP_SOLDIERS_GROUND		= "rn08_$Gsoldiers_ground"
		GROUP_SOLDIERS_GROUND_COOP = "rn08_$Gsoldiers_ground_coop"
		GROUP_SOLDIERS_GROUND_2		= "rn08_$Gsoldiers_ground_2"

		-- Civilians on the ground floor
		GROUP_CIVILIANS_GROUND		= "rn08_$Gcivilians_ground"

		-- Gat's group
		GROUP_GAT					= "rn08_$Gmission"

		-- courtesy vehicle groups
		GROUP_COURTESY_CAR			= "rn08_$Gcourtesy_car"
		GROUP_COURTESY_CAR_COOP		= "rn08_$Gcourtesy_car_coop"

		-- Ronin soldiers kth top floor (k-1 == flors above where elevator teleports to)
		GROUP_SOLDIERS_TOP_1			= "rn08_$Gsoldiers_top_1"
		GROUP_SOLDIERS_TOP_1_COOP	= "rn08_$Gsoldiers_top_1_coop"
		GROUP_SOLDIERS_TOP_2			= "rn08_$Gsoldiers_top_2"
		GROUP_SOLDIERS_TOP_2_COOP	= "rn08_$Gsoldiers_top_2_coop"
		GROUP_SOLDIERS_TOP_3			= "rn08_$Gsoldiers_top_3"
		GROUP_SOLDIERS_TOP_3_COOP	= "rn08_$Gsoldiers_top_3_coop"
		GROUP_SOLDIERS_TOP_4			= "rn08_$Gsoldiers_top_4"
		GROUP_SOLDIERS_TOP_4_COOP	= "rn08_$Gsoldiers_top_4_coop"
		GROUP_SOLDIERS_TOP_5			= "rn08_$Gsoldiers_top_5"
		GROUP_SOLDIERS_TOP_5_COOP	= "rn08_$Gsoldiers_top_5_coop"

		-- Ronin reinforcements (attack after 2nd to last floor cleared)
		GROUP_REINFORCEMENTS			= "rn08_$Greinforcements"

		-- Ronin lieutenants in the suite
		GROUP_LIEUTENANTS				= "rn08_$Glieutenants"
		GROUP_LIEUTENANTS_COOP		= "rn08_$Glieutenants_coop"

		-- Ronin soldiers spawned adjacent to bombs in final explosion
		GROUP_BODY_COUNT				= "rn08_$Gbody_count"

		-- Bombs
		GROUP_BOMBS						= "rn08_$Gbombs"
	
	-- GROUP MEMBER TABLES -- 

		TABLE_SOLDIERS_GROUND	= {	"rn08_$Csoldiers_ground_00", "rn08_$Csoldiers_ground_01", "rn08_$Csoldiers_ground_02", 
												"rn08_$Csoldiers_ground_03", "rn08_$Csoldiers_ground_04"}

		TABLE_SOLDIERS_GROUND_COOP	= {"rn08_$Csoldiers_ground_coop_00", "rn08_$Csoldiers_ground_coop_01"}

		TABLE_SOLDIERS_TOP_1		= {	"rn08_$Csoldiers_top_00", "rn08_$Csoldiers_top_01", "rn08_$Csoldiers_top_02",
												"rn08_$Csoldiers_top_03", "rn08_$Csoldiers_top_04"}

		TABLE_SOLDIERS_TOP_2		= {	"rn08_$Csoldiers_top_2_00", "rn08_$Csoldiers_top_2_01", "rn08_$Csoldiers_top_2_02",
												"rn08_$Csoldiers_top_2_03", "rn08_$Csoldiers_top_2_04", "rn08_$Csoldiers_top_2_05"}
		TABLE_SOLDIERS_TOP_2_COOP={	"rn08_$Csoldiers_top_2_coop_00", "rn08_$Csoldiers_top_2_coop_01"}

		TABLE_SOLDIERS_TOP_3		= {	"rn08_$Csoldiers_top_3_00", "rn08_$Csoldiers_top_3_01", "rn08_$Csoldiers_top_3_02",
												"rn08_$Csoldiers_top_3_03", "rn08_$Csoldiers_top_3_04", "rn08_$Csoldiers_top_3_05",
												"rn08_$Csoldiers_top_3_06"}
		TABLE_SOLDIERS_TOP_3_COOP={	"rn08_$Csoldiers_top_3_coop_00"}

		TABLE_SOLDIERS_TOP_4		= {	"rn08_$Csoldiers_top_4_00", "rn08_$Csoldiers_top_4_01", "rn08_$Csoldiers_top_4_02",
												"rn08_$Csoldiers_top_4_03"}
		TABLE_SOLDIERS_TOP_4_COOP={	"rn08_$Csoldiers_top_4_coop_00", "rn08_$Csoldiers_top_4_coop_01"}

		TABLE_SOLDIERS_TOP_5		= {	"rn08_$Csoldiers_top_5_00", "rn08_$Csoldiers_top_5_01", "rn08_$Csoldiers_top_5_02",
												"rn08_$Csoldiers_top_5_03", "rn08_$Csoldiers_top_5_04", "rn08_$Csoldiers_top_5_05",
												"rn08_$Csoldiers_top_5_06"}
		TABLE_SOLDIERS_TOP_5_COOP={	"rn08_$Csoldiers_top_5_coop_00", "rn08_$Csoldiers_top_5_coop_01",
												"rn08_$Csoldiers_top_5_coop_02"}

		TABLE_LIEUTENANTS			= {	"rn08_$Clieutenants_00", "rn08_$Clieutenants_01", "rn08_$Clieutenants_02",
												"rn08_$Clieutenants_03", "rn08_$Clieutenants_04", "rn08_$Clieutenants_05"}

		TABLE_LIEUTENANTS_COOP	= {	"rn08_$Clieutenants_coop_00", "rn08_$Clieutenants_coop_01"}

		TABLE_REINFORCEMENTS		= {	"rn08_$c004", "rn08_$c005", "rn08_$c006", "rn08_$c007", "rn08_$c008",
												"rn08_$c009", "rn08_$c010", "rn08_$c011"}

	-- TRIGGERS -- 

		-- the arms dealer trigger
		TRIGGER_ARMS_DEALER		= "rn08_$Tarms_dealer"

		-- the Ronin Hotel exit/entrance
		TRIGGER_HOTEL				= "rn08_$Thotel"

		-- the Ronin Hotel foyer
		TRIGGER_FOYER				= "rn08_$Thotel_foyer"

		-- the Ronin HQ ground floor elevator trigger
		TRIGGER_ELEVATOR			= "rn08_$Televator"

		TABLE_TRIGGER_TO_BOMB	=
		{ 
			["rn08_$Tbombs_top_1_00"] = "rn08_$i000",
			["rn08_$Tbombs_top_1_01"] = "rn08_$i001",
			["rn08_$Tbombs_top_2_00"] = "rn08_$i002",
			["rn08_$Tbombs_top_2_01"] = "rn08_$i003",
			["rn08_$Tbombs_top_3_00"] = "rn08_$i004",
			["rn08_$Tbombs_top_3_01"] = "rn08_$i005",
			["rn08_$Tbombs_top_4_00"] = "rn08_$i006",
			["rn08_$Tbombs_top_4_01"] = "rn08_$i007",
			["rn08_$Tbombs_top_5_00"] = "rn08_$i008",
			["rn08_$Tbombs_top_5_01"] = "rn08_$i009",
			["rn08_$Tbombs_top_5_02"] = "rn08_$i010",
			["rn08_$Tbombs_top_5_03"] = "rn08_$i011",
		}

		TABLE_BOMBS_TOP_1			= {	"rn08_$Tbombs_top_1_00", "rn08_$Tbombs_top_1_01"}

		TABLE_BOMBS_TOP_2			= {	"rn08_$Tbombs_top_2_00", "rn08_$Tbombs_top_2_01"}	

		TABLE_BOMBS_TOP_3			= {	"rn08_$Tbombs_top_3_00", "rn08_$Tbombs_top_3_01"}

		TABLE_BOMBS_TOP_4			= {	"rn08_$Tbombs_top_4_00", "rn08_$Tbombs_top_4_01"}	

		TABLE_BOMBS_TOP_5			= {	"rn08_$Tbombs_top_5_00"}

		TABLE_BOMBS_FREE_FALL_TOP = {	"rn08_$Tbomb_free_fall_top_00", "rn08_$Tbomb_free_fall_top_01", "rn08_$Tbomb_free_fall_top_02",
												"rn08_$Tbomb_free_fall_top_03", "rn08_$Tbomb_free_fall_top_04", "rn08_$Tbomb_free_fall_top_05"}

		TABLE_BOMBS_FREE_FALL_MID = {"rn08_$Tbomb_free_fall_mid_00", "rn08_$Tbomb_free_fall_mid_01", "rn08_$Tbomb_free_fall_mid_02",
												"rn08_$Tbomb_free_fall_mid_03", "rn08_$Tbomb_free_fall_mid_04"}

		TABLE_BOMBS_FREE_FALL_BOTTOM = {	"rn08_$Tbomb_free_fall_bottom_00", "rn08_$Tbomb_free_fall_bottom_01", "rn08_$Tbomb_free_fall_bottom_02",
												"rn08_$Tbomb_free_fall_bottom_03", "rn08_$Tbomb_free_fall_bottom_04", "rn08_$Tbomb_free_fall_bottom_05"}

		-- If the players hit this after using the elevator, but before killing off the ltnts, then we fail
		-- the mission because they left the hotel too early.
		TRIGGER_EARLY_JUMP		= "rn08_$Tearly_jump"
		
		-- the location where the player needs to jump from to complete the mission
		TRIGGER_JUMP				= "rn08_$Tjump"

		-- the topmost free fall bomb explosion trigger
		TRIGGER_FREE_FALL_1		= "rn08_$Tfree_fall_top_1"

		-- the next free fall bomb explosion trigger
		TRIGGER_FREE_FALL_2		= "rn08_$Tfree_fall_top_4"

		-- anothre free fall bomb explosion trigger
		TRIGGER_FREE_FALL_3		= "rn08_$Tfree_fall_mid"

		-- the entire ground floor (for triggering mission success)
		TRIGGER_GROUND_FLOOR		= "rn08_$Tground_floor"
		
		-- Door-to-stairwell icon navpoints
		TRIGGER_NORTH_TOP_2	= "rn08_$Tdoor_north_top_2"
		TRIGGER_SOUTH_TOP_2	= "rn08_$Tdoor_south_top_2"
		TRIGGER_NORTH_TOP_3	= "rn08_$Tdoor_north_top_3"
		TRIGGER_SOUTH_TOP_3	= "rn08_$Tdoor_south_top_3"
		TRIGGER_NORTH_TOP_4	= "rn08_$Tdoor_north_top_4"
		TRIGGER_SOUTH_TOP_4	= "rn08_$Tdoor_south_top_4"
		TRIGGER_NORTH_TOP_5	= "rn08_$Tdoor_north_top_5"

		-- Triggers inside stairwell just adjacent to the door
		TRIGGER_STAIRWELL_NORTH_TOP_3 = "rn08_$Tstairwell_north_top_3"
		TRIGGER_STAIRWELL_NORTH_TOP_4 = "rn08_$Tstairwell_north_top_4"
		TRIGGER_STAIRWELL_NORTH_TOP_5 = "rn08_$Tstairwell_north_top_5"
		TRIGGER_STAIRWELL_SOUTH_TOP_3 = "rn08_$Tstairwell_south_top_3"
		TRIGGER_STAIRWELL_SOUTH_TOP_4 = "rn08_$Tstairwell_south_top_4"

		-- List of all triggers, makes cleaning up more convenient
		TABLE_ALL_TRIGGERS		= {	TRIGGER_ARMS_DEALER, TRIGGER_HOTEL, TRIGGER_ELEVATOR, TRIGGER_JUMP, 
												TRIGGER_FREE_FALL_1, TRIGGER_FREE_FALL_2, TRIGGER_FREE_FALL_3, TRIGGER_NORTH_TOP_2,
												TRIGGER_NORTH_TOP_3, TRIGGER_NORTH_TOP_4, TRIGGER_NORTH_TOP_5,
												TRIGGER_SOUTH_TOP_2, TRIGGER_SOUTH_TOP_3, TRIGGER_SOUTH_TOP_4,
												TRIGGER_STAIRWELL_NORTH_TOP_3, TRIGGER_STAIRWELL_NORTH_TOP_4,
												TRIGGER_STAIRWELL_NORTH_TOP_5, TRIGGER_STAIRWELL_SOUTH_TOP_3,
												TRIGGER_STAIRWELL_SOUTH_TOP_4}		

	-- VEHICLES --

		-- convenience vehicle
		VEHICLE_GIFT_CAR			= "rn08_$Vgift_car"

	-- CHARACTERS --

		-- shady arms dealer
		CHARACTER_ARMS_DEALER	= "rn08_$Carms_dealer"
	
		-- Gat
		CHARACTER_GAT				= "rn08_$Cgat"


	-- CONVERSATIONS --

	   INTRO_CONVERSATION =
		{
			{ "RON8_ANTICIPATION_L1", CHARACTER_GAT, 0.25 },
			{ "PLAYER_RON8_ANTICIPATION_L2", LOCAL_PLAYER, 0.25 },
			{ "RON8_ANTICIPATION_L3", CHARACTER_GAT, 0.25 },
		}

		DEALER_CONVERSATION =
		{
			{ "PLAYER_RON8_GET_BOMBS_L1", LOCAL_PLAYER, 1 },
			{ "RON8_GET_BOMBS_L2", CHARACTER_ARMS_DEALER, 1 },
		}

	-- NAVPOINTS

		-- the Ronin HQ elevator
		NAVPOINT_ELEVATOR			= "rn08_$Nelevator"

		-- the Ronin HQ elevator that Gat needs to take
		NAVPOINT_ELEVATOR_GAT	= "rn08_$Nelevator_gat"

		-- the Ronin HQ elevator exit for player 2
		NAVPOINT_ELEVATOR_PLAYER_2 =	"rn08_$Nelevator_player_2"

		-- the Ronin HQ arrival trigger
		NAVPOINT_HOTEL				= "rn08_$Thotel"

		-- the Ronin HQ checkpoint start location for player 2
		NAVPOINT_HOTEL_PLAYER_2 = "rn08_$Nronin_hq_player2"

		-- the Ronin HQ checkpoint start location for Gat
		NAVPOINT_HOTEL_GAT		= "rn08_$Nronin_hq_gat"

		-- the start location for Player 1
		NAVPOINT_LOCATION_START							= "mission_start_sr2_city_$rn08"

		-- the start location for Player 2		
		NAVPOINT_LOCATION_START_PLAYER_2				= "rn08_$Nplayer2_start"
		
		-- the navpoints that the player are teleported to when the mission ends
		NAVPOINT_MISSION_END_1							= "rn08_$Nplayer1_end"
		NAVPOINT_MISSION_END_2							= "rn08_$Nplayer2_end"


	-- MOVERS

		-- Stairwell Doors
		DOOR_FRONT_1		= "rn08_$MMfront_door1"
		DOOR_FRONT_2		= "rn08_$MMfront_door2"
		DOOR_NORTH_TOP_2	= "rn08_$MMdoor_north_top_2"
		DOOR_SOUTH_TOP_2	= "rn08_$MMdoor_south_top_2"
		DOOR_NORTH_TOP_3	= "rn08_$MMdoor_north_top_3"
		DOOR_SOUTH_TOP_3	= "rn08_$MMdoor_south_top_3"
		DOOR_NORTH_TOP_4	= "rn08_$MMdoor_north_top_4"
		DOOR_SOUTH_TOP_4	= "rn08_$MMdoor_south_top_4"
		DOOR_NORTH_TOP_5	= "rn08_$MMdoor_north_top_5"
	
		-- Suite doors
		DOOR_SUITE_OUTER_1	= "rn08_$MMdoor_suite_outer_1"
		DOOR_SUITE_OUTER_2	= "rn08_$MMdoor_suite_outer_2"

	-- HELPTEXT
		HELPTEXT_GAT_DIED						= "rn08_gat_died"
		HELPTEXT_ARMS_DEALER_DIED			= "rn08_arms_dealer_died"
		HELPTEXT_ARMS_DEALER					= "rn08_arms_dealer"				-- ## Drive to the arms dealer.
		HELPTEXT_RONIN_HQ						= "rn08_ronin_hq"					-- ## Head to the Ronin hideout.

		HELPTEXT_FAIL_JUMP_EARLY			= "rn08_fail_jump_early"		-- You left the upper floors without finishing the job
		HELPTEXT_BOMBS							= "rn08_bombs"						-- ## Place the bombs one floor at a time.
		HELPTEXT_SUITE							= "rn08_suite"						-- ## Head to the suite and kill all the Ronin lieutenants.
		HELPTEXT_JUMP							= "rn08_jump"						-- ## Jump down the atrium and get out of the hotel!
		HELPTEXT_JUMP_APPROACH				= "rn08_jump_approach"			-- ## Head to the atrium.
		HELPTEXT_GAT_DISMISSED				= "rn08_gat_dismissed"			-- ## Johnny Gat was abandoned.
		HELPTEXT_OBJECTIVE_BOMBS			= "rn08_objective_bombs"		-- ## Bombs planted:
		HELPTEXT_OBJECTIVE_RONIN			= "rn08_objective_ronin"		-- ## Ronin killed:
		HELPTEXT_BOMB_FAILURE				= "rn08_bomb_failure"			-- ## Bombs detonated before you escaped.
		HELPTEXT_BOMB_FINISH					= "rn08_bomb_finish"				-- ## Finish planting bombs on this floor.
		HELPTEXT_NEXT_FLOOR					= "rn08_next_floor"				-- ## Move on to the next floor.
		HELPTEXT_DETONATION_WARN			= "rn08_detonation_warn"		-- ## 30 seconds until detonation.
		HELPTEXT_COUNTDOWN					= "rn08_countdown"				-- ## Countdown activated.
		HELPTEXT_GROUND_FLOOR				= "rn08_ground_floor"			-- ## Eliminate Ronin soldiers on the ground floor.

		--HELPTEXT_ELEVATOR			= "rn08_elevator"
		HELPTEXT_BOMBS_HURRY					=	"rn08_bomb_hurry"				-- "## Hurry, the detonation timers have been activated!"
		HELPTEXT_GROUND_FLOOR_CLEAR		=	"rn08_ground_floor_clear"	-- "## You're done here, get to the elevator.

	-- CHECKPOINTS
		CHECKPOINT_START						= MISSION_START_CHECKPOINT -- defined in ug_lib.lua
		CHECKPOINT_BOMBS						= "rn08_checkpoint_bombs"  -- player has cleared out the 1st and 2nd floor of the hotel 

	-- MISC.

		-- Bomb detonation time in seconds
		BOMB_TIME_S				= 240

		-- Mission Gang Name
		MISSION_GANG_NAME		= "Ronin"

		-- The number of bombs to plant
		NUMBER_BOMBS_TO_PLANT = 0
		
		--Number of players that have cleared the jump, in co-op
		NUMBER_PLAYERS_JUMPED = 0

		-- Lieutenant health multiplier
		LIEUTENANT_HEALTH_MULTIPLIER = 2.0

		-- Bomb planting sound effect
		FOLEY_BOMB_PLANT	= "SFX_RON08_SET_DETONATOR"

		-- Possible locations for the reinforcements to spawn
		TABLE_REINFORCEMENT_NAVPOINTS =	
			{	"rn08_$n000", "rn08_$n016", "rn08_$n001", "rn08_$n015", "rn08_$n002", "rn08_$n014",
				"rn08_$n003", "rn08_$n013", "rn08_$n004", "rn08_$n012", "rn08_$n005", "rn08_$n011",
				"rn08_$n006", "rn08_$n010", "rn08_$n007", "rn08_$n009", "rn08_$n008"}

		-- Number of reinforcements
		NUMBER_REINFORCEMENTS		= 6;
		NUMBER_REINFORCEMENTS_COOP	= 8;

	-- GUARD PATROL ROUTES

		DIR_FORWARD = 1
		DIR_REVERSE = 2
		DIR_EITHER = 3

		-- Rather than define separate routes for each guard, I've setup interconnecting segments of
		-- patrol routes. Segments can transition onto other segments at any point. If a guard reaches
		-- the end of a segment, then they'll return to their original spawn location.
		GUARD_INITIAL_PATH_SEGMENTS = 
		{	-- FIRST FLOOR
			["rn08_$Csoldiers_ground_00"] =			{	{1,DIR_FORWARD,1},
																	{1,DIR_REVERSE,5},
																	{2,DIR_FORWARD,1},
																	{5,DIR_FORWARD,1},
																},
			["rn08_$Csoldiers_ground_01"] =			{	{1,DIR_FORWARD,3},
																	{1,DIR_REVERSE,2},
																},
			["rn08_$Csoldiers_ground_03"] =			{	{3,DIR_REVERSE,1},
																},
			["rn08_$Csoldiers_ground_04"] =			{	{1,DIR_FORWARD,1},
																	{1,DIR_REVERSE,5},
																	{2,DIR_FORWARD,1},
																	{5,DIR_FORWARD,1},
																},
			["rn08_$Csoldiers_ground_coop_00"] =	{	{2, DIR_REVERSE, 1},
																	{2, DIR_FORWARD, 2},
																},
			["rn08_$Csoldiers_ground_coop_01"] =	{	{2, DIR_REVERSE, 1},
																	{2, DIR_FORWARD, 2},
																},
			-- FIRST UPPER FLOOR
			["rn08_$Csoldiers_top_00"]	=				{	{6, DIR_FORWARD, 1},
																	{6, DIR_REVERSE, 6},
																},
			["rn08_$Csoldiers_top_01"]	=				{	{6, DIR_FORWARD, 3},
																	{6, DIR_REVERSE, 1},
																},
			["rn08_$Csoldiers_top_02"]	=				{	{6, DIR_FORWARD, 5},
																	{6, DIR_REVERSE, 4},
																},
			["rn08_$Csoldiers_top_03"]	=				{	{6, DIR_FORWARD, 4},
																	{6, DIR_REVERSE, 3},
																},
			["rn08_$Csoldiers_top_04"]	=				{	{6, DIR_FORWARD, 2},
																	{6, DIR_REVERSE, 1},
																},
			-- SECOND UPPER FLOOR
			["rn08_$Csoldiers_top_2_00"] =			{	{9, DIR_FORWARD, 2},
																},
			["rn08_$Csoldiers_top_2_01"] =			{	{8, DIR_REVERSE, 1},
																	{8, DIR_FORWARD, 2},
																},
			["rn08_$Csoldiers_top_2_02"] =			{	{7, DIR_REVERSE, 5},
																	{7, DIR_FORWARD, 6},
																},
			["rn08_$Csoldiers_top_2_03"] =			{	{7, DIR_REVERSE, 5},
																	{7, DIR_FORWARD, 6},
																},
			["rn08_$Csoldiers_top_2_04"] =			{	{7, DIR_REVERSE, 2},
																	{7, DIR_FORWARD, 3},
																},
			["rn08_$Csoldiers_top_2_05"] =			{	{9, DIR_REVERSE, 1},
																	{9, DIR_FORWARD, 2},
																},
			["rn08_$Csoldiers_top_2_coop_00"] =		{	{8, DIR_REVERSE, 1},
																	{8, DIR_FORWARD, 2},
																},
			["rn08_$Csoldiers_top_2_coop_01"] =		{	{9, DIR_FORWARD, 2},
																},
			-- THIRD UPPER FLOOR
			["rn08_$Csoldiers_top_3_00"] =			{	{10, DIR_FORWARD, 3},
																	{10, DIR_REVERSE, 1},
																},
			["rn08_$Csoldiers_top_3_01"] =			{	{10, DIR_FORWARD, 5},
																	{10, DIR_REVERSE, 4},
																},
			["rn08_$Csoldiers_top_3_02"] =			{	{10, DIR_FORWARD, 5},
																	{10, DIR_REVERSE, 4},
																},
			["rn08_$Csoldiers_top_3_03"] =			{	{10, DIR_FORWARD, 2},
																	{10, DIR_REVERSE, 6},
																},
			["rn08_$Csoldiers_top_3_04"] =			{	{11, DIR_FORWARD, 2},
																	{11, DIR_REVERSE, 1},
																},		
			["rn08_$Csoldiers_top_3_05"] =			{	{11, DIR_FORWARD, 2},
																	{11, DIR_REVERSE, 1},
																},		
			["rn08_$Csoldiers_top_3_06"] =			{	{11, DIR_FORWARD, 2},
																	{11, DIR_REVERSE, 1},
																},		
			["rn08_$Csoldiers_top_3_coop_00"] =		{	{10, DIR_FORWARD, 2},
																	{10, DIR_REVERSE, 1},
																},	

			-- FOURTH UPPER FLOOR
			["rn08_$Csoldiers_top_4_00"] =			{	{13, DIR_REVERSE, 1},
																	{13, DIR_FORWARD, 2},
																},
			["rn08_$Csoldiers_top_4_01"] =			{	{13, DIR_REVERSE, 1},
																	{13, DIR_FORWARD, 2},
																},
			["rn08_$Csoldiers_top_4_02"] =			{	{13, DIR_REVERSE, 4},
																	{13, DIR_FORWARD, 5},
																},
			["rn08_$Csoldiers_top_4_03"] =			{	{13, DIR_FORWARD, 4},
																	{13, DIR_REVERSE, 3},
																},
			["rn08_$Csoldiers_top_4_coop_00"] =		{	{13, DIR_FORWARD, 1},
																	{13, DIR_REVERSE, 6},
																	{14, DIR_FORWARD, 1},
																},	
			["rn08_$Csoldiers_top_4_coop_01"] =		{	{13, DIR_FORWARD, 3},
																	{13, DIR_REVERSE, 1},
																	{15, DIR_FORWARD, 1},
																},	

		}

		-- Note, each navpoint can only belong to one path segment.
		GUARD_PATH_SEGMENTS = 
		{	-- FIRST FLOOR
			[1] = {"rn08_$n017", "rn08_$n018", "rn08_$n019", "rn08_$n020", "rn08_$n021", "rn08_$n022"},
			[2] = {"rn08_$n023", "rn08_$n024"},
			[3] = {"rn08_$n025", "rn08_$n026"},
			[4] = {"rn08_$n027", "rn08_$n028"},
			[5] = {"rn08_$n029", "rn08_$n030"},

			-- FIRST UPPER FLOOR
			[6] = {"rn08_$n031", "rn08_$n032", "rn08_$n033", "rn08_$n034", "rn08_$n035", "rn08_$n036"},

			-- SECOND UPPER FLOOR
			[7] = {"rn08_$n037", "rn08_$n038", "rn08_$n039", "rn08_$n040", "rn08_$n041", "rn08_$n042"},
			[8] = {"rn08_$n043", "rn08_$n044"},
			[9] = {"rn08_$n045", "rn08_$n046"},

			-- THIRD UPPER FLOOR
			[10] = {"rn08_$n047", "rn08_$n048", "rn08_$n049", "rn08_$n050", "rn08_$n051", "rn08_$n052"},
			[11] = {"rn08_$n053", "rn08_$n054"},
			[12] = {"rn08_$n055", "rn08_$n056"},

			-- FOURTH UPPER FLOOR
			[13] = {"rn08_$n057", "rn08_$n058", "rn08_$n059", "rn08_$n060", "rn08_$n061", "rn08_$n062"},
			[14] = {"rn08_$n063", "rn08_$n064"},
			[15] = {"rn08_$n065", "rn08_$n066"},
		}

		-- Is the path a loop?
		GUARD_PATH_IS_LOOP = 
		{	[1] = true,
			[2] = false,
			[3] = false,
			[4] = false,
			[5] = false,
		}

		-- ["current_node"] = {[current_direction] = {{next_path, direction, index of first node on next path, }}
		GUARD_SEGMENT_TRANSITIONS = 
		{	
			["rn08_$n017"]	=	{	[DIR_REVERSE]	=	{	{2, DIR_FORWARD, 1},
																	{5, DIR_FORWARD, 1},
																},
									},
			["rn08_$n018"]	=	{	[DIR_EITHER]	=	{	{4, DIR_FORWARD, 1},
																},
									},
			["rn08_$n019"]	=	{	[DIR_EITHER]	=	{	{4, DIR_REVERSE, 2},
																},
									},
			["rn08_$n020"]	=	{	[DIR_FORWARD]	=	{	{3, DIR_FORWARD, 1},
																	{5, DIR_REVERSE, 2},
																},
									},
			["rn08_$n021"]	=	{	[DIR_REVERSE]	=	{	{3, DIR_FORWARD, 1},
																	{5, DIR_REVERSE, 2},
																},
									},
			["rn08_$n022"]	=	{	[DIR_FORWARD]	=	{	{2, DIR_FORWARD, 1},
																	{5, DIR_FORWARD, 1},
																},
									},
			["rn08_$n023"]	=	{	[DIR_REVERSE]	=	{	{1, DIR_FORWARD, 1},
																	{1, DIR_FORWARD, 6},
																	{5, DIR_FORWARD, 1},
																},
									},
			["rn08_$n025"]	=	{	[DIR_REVERSE]	=	{	{1, DIR_FORWARD, 5},
																	{1, DIR_REVERSE, 4},
																	{5, DIR_REVERSE, 2},
																},
									},
			["rn08_$n027"]	=	{	[DIR_REVERSE]	=	{	{1, DIR_FORWARD, 2},
																	{1, DIR_REVERSE, 2},
																},
									},
			["rn08_$n028"]	=	{	[DIR_FORWARD]	=	{	{1, DIR_FORWARD, 3},
																	{1, DIR_REVERSE, 3}
																},
									},
			["rn08_$n029"]	=	{	[DIR_REVERSE]	=	{	{1, DIR_FORWARD, 1},
																	{1, DIR_REVERSE, 6},
																	{2, DIR_FORWARD, 1}
																},
									},
			["rn08_$n030"]	=	{	[DIR_REVERSE]	=	{	{1, DIR_FORWARD, 5},
																	{1, DIR_REVERSE, 4},
																	{3, DIR_FORWARD, 1}
																},
									},
			["rn08_$n037"]	=	{	[DIR_FORWARD]	=	{	{8, DIR_FORWARD, 1},
																},
									},
			["rn08_$n038"]	=	{	[DIR_REVERSE]	=	{	{8, DIR_FORWARD, 1},
																},
									},
			["rn08_$n039"]	=	{	[DIR_FORWARD]	=	{	{9, DIR_FORWARD, 1},
																},
									},
			["rn08_$n040"]	=	{	[DIR_REVERSE]	=	{	{9, DIR_FORWARD, 1},
																},
									},
			["rn08_$n043"]	=	{	[DIR_REVERSE]	=	{	{7, DIR_FORWARD, 2},
																	{7, DIR_REVERSE, 1},
																},
									},
			["rn08_$n045"]	=	{	[DIR_REVERSE]	=	{	{7, DIR_FORWARD, 4},
																	{7, DIR_REVERSE, 3},
																},
									},
			["rn08_$n047"]	=	{	[DIR_REVERSE]	=	{	{11, DIR_FORWARD, 1},
																},
									},
			["rn08_$n048"]	=	{	[DIR_FORWARD]	=	{	{12, DIR_FORWARD, 1},
																},
									},
			["rn08_$n049"]	=	{	[DIR_REVERSE]	=	{	{12, DIR_FORWARD, 1},
																},
									},
			["rn08_$n052"]	=	{	[DIR_FORWARD]	=	{	{11, DIR_FORWARD, 1},
																},
									},
			["rn08_$n053"]	=	{	[DIR_REVERSE]	=	{	{10, DIR_FORWARD, 1},
																	{10, DIR_REVERSE, 6},
																},
									},
			["rn08_$n055"]	=	{	[DIR_REVERSE]	=	{	{10, DIR_FORWARD, 3},
																	{10, DIR_REVERSE, 2},
																},
									},
			["rn08_$n057"]	=	{	[DIR_REVERSE]	=	{	{14, DIR_FORWARD, 1},
																},
									},
			["rn08_$n058"]	=	{	[DIR_FORWARD]	=	{	{15, DIR_FORWARD, 1},
																},
									},
			["rn08_$n059"]	=	{	[DIR_REVERSE]	=	{	{15, DIR_FORWARD, 1},
																},
									},
			["rn08_$n062"]	=	{	[DIR_FORWARD]	=	{	{14, DIR_FORWARD, 1},
																},
									},
			["rn08_$n063"]	=	{	[DIR_REVERSE]	=	{	{13, DIR_FORWARD, 1},
																	{13, DIR_REVERSE, 6},
																},
									},
			["rn08_$n065"]	=	{	[DIR_REVERSE]	=	{	{13, DIR_FORWARD, 3},
																	{13, DIR_REVERSE, 2},
																},
									},
		}


	PLAYER_SYNC = { [LOCAL_PLAYER] = SYNC_LOCAL, [REMOTE_PLAYER] = SYNC_REMOTE }


	RN08_RONIN_ATTACK_PERSONAS	= {
		["AM_Ron2"]	=	"AMRON2",

		["AF_Ron1"]	=	"AFRON1",
		["AF_Ron3"]	=	"AFRON3",

		["WM_Ron1"]	=	"WMRON1",

		["WF_Ron1"]	=	"WFRON1",
		["WF_Ron2"]	=	"WFRON2",
	}


-- Global Variables (First letter caps == Global Variable)
	Arms_dealer_reached		= false
	Elevator_reached			= false
	--[[
	Soldiers_top_1_cleared	= false
	Soldiers_top_2_cleared	= false
	Soldiers_top_3_cleared	= false
	Soldiers_top_4_cleared	= false
	Soldiers_top_5_cleared	= false
	]]
	Lieutenants_cleared		= false
	All_bombs_placed			= false
	Jump_location_reached	= false
	Exit_reached				= false
	Target_floor_reached		= false
	Enemy_set_cleared			= false
	Rn08_ronin_hq_reached	= false

	Soldiers_top_1_living	= 0
	Soldiers_top_2_living	= 0
	Soldiers_top_3_living	= 0
	Soldiers_top_4_living	= 0
	Soldiers_top_5_living	= 0
	Bombs_to_place				= 0
	Lieutenants_living		= 0
	Lieutenants_to_kill		= 0
	Total_bombs_placed		= 0
	Enemies_living				= 0
	Enemies_to_kill			= 0

	Enemy_set_objective_helptext = ""

	Bomb_timer_started		= false
	Bomb_effect_handles		= {}
	Bombs_placed				= {}

	-- Doorway triggers mark the transition from stairwell to the floor proper
	Doorway_trigger_1		= ""
	Doorway_trigger_2		= ""

	-- Stairwell triggers are in the stairwell, just adjacent to the doors
	Stairwell_trigger_1	= ""
	Stairwell_trigger_2	= ""

-- THREADS
	Thread_gat_take_elevator	= -1
	Thread_countdown_monitor	= -1
	
		
-- CUTSCENES --
-- Added by IdolNinja. These variables are used in the script for the cutscenes for stability instead of calling them directly

CUTSCENE_IN = 		"ro08-01"
CUTSCENE_OUT = 		"ro08-02"
MISSION_NAME =		"rn08"
MISSION_FAIL =		"rn08_failure"


-- Functions

-- Called when the mission starts
function rn08_start(rn08_checkpoint, is_restart)
	
	rn08_initialize(rn08_checkpoint, is_restart)

	if (rn08_checkpoint == CHECKPOINT_START) then

		-- Setup the lower levels of the hotel. This doesn't need to be blocking.
		thread_new("rn08_setup_hotel_lower_levels")

		-- Player departs arms dealer and heads to Ronin HQ
		rn08_reach_ronin_hq()
		
		-- Player passes through hotel lobby to the elevator
		rn08_reach_lobby_elevator()

		-- CHECKPOINT!
		mission_set_checkpoint(CHECKPOINT_BOMBS)
		rn08_checkpoint = CHECKPOINT_BOMBS

	end -- ends CHECKPOINT_START

	if (rn08_checkpoint == CHECKPOINT_BOMBS) then

		group_create_hidden(GROUP_BOMBS, true)
		
		-- Player plants bombs at each of the top 5 levels of the hotel
		-- also spawns Lieutenants
		rn08_bomb_placement()

		-- Player enters the suite and kills off all of the Lieutenants
		rn08_process_lieutenants()

		-- Player parachutes down the lobby atrium to the ground floor.
		rn08_leave_hotel()

		-- Wait a bit so that the player gets to see the coolness.
		delay(2.0)

		-- Win the mission
		rn08_complete()

	end -- end of CHECKPOINT_BOMBS

end

-- Load groups for the hotles lower levels, have the guards patrol
function rn08_setup_hotel_lower_levels()

	-- load the Ground floor soldiers
	rn08_group_create_maybe_coop(GROUP_SOLDIERS_GROUND,GROUP_SOLDIERS_GROUND_COOP, false)
	-- Prep guards
	for i,guard in pairs(TABLE_SOLDIERS_GROUND) do
		patrol("rn08_guard_patrol", guard)
	end

	-- load the second floor soldiers
	group_create(GROUP_SOLDIERS_GROUND_2, false)

	-- load the ground floor civilians
	group_create(GROUP_CIVILIANS_GROUND, false)

end

function rn08_initialize(checkpoint, is_restart)

	mission_start_fade_out(0.0)

	-- Load up initial groups, maybe play the initial cutscene
	if (checkpoint == CHECKPOINT_START) then

		local start_groups = {GROUP_GAT, GROUP_COURTESY_CAR}
		if (coop_is_active()) then
			start_groups = {GROUP_GAT, GROUP_COURTESY_CAR, GROUP_COURTESY_CAR_COOP}
		end

		-- If this is a restart from the beginning, teleport to start and reload initial groups
		if (is_restart) then
			teleport_coop(NAVPOINT_LOCATION_START, NAVPOINT_LOCATION_START_PLAYER_2, true)
			for i,group in pairs(start_groups) do
				group_create(group,true)
			end
		-- If it is the first time playing from the start, play the cutscene then show the initial groups.
		else
			cutscene_play(CUTSCENE_IN, start_groups, {NAVPOINT_LOCATION_START, NAVPOINT_LOCATION_START_PLAYER_2}, false)
			for i,group in pairs(start_groups) do
				group_show(group)
			end
		end
		fade_out(0)
	end

	rn08_initialize_common()
	rn08_initialize_checkpoint(checkpoint)

	mission_start_fade_in()

end

function rn08_initialize_common()

	set_mission_author("Phillip Alexander")

	if (coop_is_active()) then
		IN_COOP = true
	end

	-- A few Global constants need to be set up, but shouldn't be changed after this function
	rn08_setup_global_constants()

	-- No notoriety spawning
	notoriety_force_no_spawn(MISSION_GANG_NAME, true)

	-- No target/driver for base jumping
	base_jumping_enable(false)

	-- Override Ronin Attack peronas
	persona_override_group_start(RN08_RONIN_ATTACK_PERSONAS,POT_SITUATIONS[POT_ATTACK], "RO08_ATTACK")

	-- Make sure tha the player can use the parachute
	parachute_enable()
	
	--Make sure the front doors are unlocked.
	door_lock(DOOR_FRONT_1, false)
	door_lock(DOOR_FRONT_2, false)


end

function rn08_initialize_checkpoint(checkpoint)

	if(checkpoint == CHECKPOINT_START) then

		-- Remove any followers and make Gat a follower of the local player
		party_add(CHARACTER_GAT,LOCAL_PLAYER)

		-- Handle Gat's death
		on_death("rn08_gat_death_failure", CHARACTER_GAT)
		on_dismiss("rn08_gat_dismiss_failure", CHARACTER_GAT)

		-- Override Gat's persona
		persona_override_character_start(CHARACTER_GAT, POT_SITUATIONS[POT_ATTACK], "GAT_RON08_ATTACK")
		persona_override_character_start(CHARACTER_GAT, POT_SITUATIONS[POT_TAKE_DAMAGE], "GAT_RON08_TAKEDAM")

	elseif (checkpoint == CHECKPOINT_BOMBS) then

		-- Fail the mission if a player jumps too early.
		on_trigger("rn08_early_jump_failure", TRIGGER_EARLY_JUMP)
		trigger_enable(TRIGGER_EARLY_JUMP, true)

		-- make sure that the mission parachute override is enabled
		parachute_enable()

		-- Spawn all soldiers on top floors, local all hotel doors.
		rn08_group_create_maybe_coop(GROUP_SOLDIERS_TOP_2,GROUP_SOLDIERS_TOP_2_COOP,true)
		rn08_group_create_maybe_coop(GROUP_SOLDIERS_TOP_3,GROUP_SOLDIERS_TOP_3_COOP,false)
		for i,guard in pairs(TABLE_SOLDIERS_TOP_2) do
			patrol("rn08_guard_patrol", guard)
		end
		for i,guard in pairs(TABLE_SOLDIERS_TOP_3) do
			patrol("rn08_guard_patrol", guard)
		end
		-- lock all hotel doors, do this here so we don't see door activation ui elements popping
		rn08_close_and_lock_doors()

		-- Delay an extra second so that the bomb's smoke has time to clear.
		delay(1.0)

	end

end

function rn08_arms_dealer()

	-- spawn the dealer and his vehicle
	group_create(GROUP_ARMS_DEALER, true)

	-- Handle The arms dealer's death
	on_death("rn08_arms_dealer_failure", CHARACTER_ARMS_DEALER)

	-- enable the arms dealer trigger, add a minimap icon, glow effect, and callback
	trigger_enable(TRIGGER_ARMS_DEALER,true)
	marker_add_trigger(TRIGGER_ARMS_DEALER,MINIMAP_ICON_LOCATION,INGAME_EFFECT_LOCATION,SYNC_ALL)
	on_trigger("rn08_arms_dealer_reached",TRIGGER_ARMS_DEALER)

	-- add a waypoint to the dealer's location
	mission_waypoint_add( TRIGGER_ARMS_DEALER, SYNC_ALL )

	-- display helptext: "drive to the arms dealer."
	mission_help_table(HELPTEXT_ARMS_DEALER)

	-- delay a bit, play the intro dialogue
	audio_play_conversation(INTRO_CONVERSATION)

	-- wait for player to arrive at the dealer
	while (not Arms_dealer_reached) do
		thread_yield()
	end

	--
	on_death("", CHARACTER_ARMS_DEALER)

	-- when player arrives at glowy trigger, play dealer's dialogue line 
	
	audio_play_conversation(DEALER_CONVERSATION)

	parachute_enable()

	-- release the arms dealer group
	release_to_world(GROUP_ARMS_DEALER)

end

function rn08_reach_ronin_hq()

	-- delay a bit, play the intro dialogue
	local thread_intro_conversation = thread_new("rn08_play_intro_conversation")

	-- display minimap icon, glowy trigger for Downtown hotel 
	on_trigger("rn08_hotel_reached",TRIGGER_HOTEL)
	trigger_enable(TRIGGER_HOTEL,true)
	marker_add_trigger(TRIGGER_HOTEL,MINIMAP_ICON_LOCATION,INGAME_EFFECT_VEHICLE_LOCATION,SYNC_ALL)

	-- add a waypoint to the hotel's location
	mission_waypoint_add( TRIGGER_HOTEL, SYNC_ALL )

	-- display helptext "Drive to the Yakuza headquarters." 
	mission_help_table (HELPTEXT_RONIN_HQ)

	-- wait for player to arrive at the Hotel
	while (not Rn08_ronin_hq_reached) do
		thread_yield()
	end

end

function rn08_play_intro_conversation()

	delay(15)
	while(get_dist(CHARACTER_GAT, LOCAL_PLAYER) > 15) do
		thread_yield()
	end

	if (not Rn08_ronin_hq_reached) then
		audio_play_conversation(INTRO_CONVERSATION)
	end

end


function rn08_reach_lobby_elevator()

	-- Have the player take out the first and second floor guards
	rn08_process_enemy_set(TABLE_SOLDIERS_GROUND, HELPTEXT_GROUND_FLOOR, HELPTEXT_OBJECTIVE_RONIN)
	rn08_group_release_maybe_coop(GROUP_SOLDIERS_GROUND,GROUP_SOLDIERS_GROUND_COOP)

	-- Send Gat on his merry way
	audio_play_for_character("GAT_RON8_SPLIT_01", CHARACTER_GAT, "voice", false, false)
	npc_stop_following(CHARACTER_GAT)
	set_unrecruitable_flag(CHARACTER_GAT, true)
	turn_invulnerable(CHARACTER_GAT,true)
		
	-- display the objective text for bomb placement
	objective_text(0, HELPTEXT_OBJECTIVE_BOMBS, Total_bombs_placed, NUMBER_BOMBS_TO_PLANT)
	mission_help_table(HELPTEXT_GROUND_FLOOR_CLEAR)
	
	Thread_gat_take_elevator = patrol("rn08_take_elevator", CHARACTER_GAT)

	-- display minimap icon, glowy trigger for lobby elevator 
	on_trigger("rn08_elevator_reached",TRIGGER_ELEVATOR)
	trigger_enable(TRIGGER_ELEVATOR,true)
	marker_add_trigger(TRIGGER_ELEVATOR,MINIMAP_ICON_LOCATION,INGAME_EFFECT_LOCATION,SYNC_ALL)

	-- wait for player to reach the elevator ( the elevator trigger call back spawns the next group of soldiers)
	while (not Elevator_reached) do
		thread_yield()
	end

end

function rn08_bomb_placement()

	-- tell the player to place the bombs
	mission_help_table(HELPTEXT_BOMBS)

	-- handle placing of bombs
	rn08_process_bomb_set(TABLE_BOMBS_TOP_2)

	-- Tell the player to move on to the next floor
	mission_help_table_nag(HELPTEXT_NEXT_FLOOR)

	-- Unlock this floor's doors
	door_lock(DOOR_NORTH_TOP_2,false)
	door_lock(DOOR_SOUTH_TOP_2,false)

	-- Show this floor's entries into the stairwell
	rn08_stairwell_entry(TRIGGER_NORTH_TOP_2,TRIGGER_SOUTH_TOP_2)

	group_destroy(GROUP_SOLDIERS_GROUND_2)
	group_destroy(GROUP_CIVILIANS_GROUND)

	-- unlock the next floor's doors
	door_lock(DOOR_NORTH_TOP_3,false)
	door_lock(DOOR_SOUTH_TOP_3,false)

	-- Gid rid of the ground floor soldiers
	release_to_world(GROUP_SOLDIERS_TOP_1)

	rn08_group_create_maybe_coop(GROUP_SOLDIERS_TOP_4,GROUP_SOLDIERS_TOP_4_COOP,false)
	for i,guard in pairs(TABLE_SOLDIERS_TOP_4) do
		patrol("rn08_guard_patrol", guard)
	end

	rn08_process_bomb_set(	TABLE_BOMBS_TOP_3, TRIGGER_STAIRWELL_NORTH_TOP_3, TRIGGER_NORTH_TOP_3, 
							TRIGGER_STAIRWELL_SOUTH_TOP_3, TRIGGER_SOUTH_TOP_3)
	
	-- Tell the player to move on to the next floor
	delay(2.0)
	mission_help_table(HELPTEXT_NEXT_FLOOR)
	rn08_stairwell_entry(TRIGGER_NORTH_TOP_3,TRIGGER_SOUTH_TOP_3)

	door_lock(DOOR_NORTH_TOP_4,false)
	door_lock(DOOR_SOUTH_TOP_4,false)
	release_to_world(GROUP_SOLDIERS_TOP_2)
	rn08_group_create_maybe_coop(GROUP_SOLDIERS_TOP_5,GROUP_SOLDIERS_TOP_5_COOP,false)

	-- Start streaming in reinforcements
	group_create_hidden(GROUP_REINFORCEMENTS)

	rn08_process_bomb_set(TABLE_BOMBS_TOP_4)

	-- Spawn reinforcements
	rn08_spawn_reinforcements()

	-- Tell the player to move on to the next floor
	delay(2.0)
	mission_help_table(HELPTEXT_NEXT_FLOOR)
	rn08_stairwell_entry(TRIGGER_NORTH_TOP_4)

	door_lock(DOOR_NORTH_TOP_5,false)
	-- load the lieutenats and assign callbacks
	release_to_world(GROUP_SOLDIERS_TOP_3)
	rn08_group_create_maybe_coop(GROUP_LIEUTENANTS,GROUP_LIEUTENANTS_COOP, false)
	for i,guard in pairs(TABLE_SOLDIERS_TOP_5) do
		patrol("rn08_guard_patrol", guard)
	end

	rn08_process_bomb_set(TABLE_BOMBS_TOP_5)
	delay(2.0)

end

-- Guard patrol thread
Path_segment_occupied			= {}
function rn08_guard_patrol(guard)

	if (GUARD_INITIAL_PATH_SEGMENTS[guard] == nil) then
		return
	end

	local num_initial_path_segments = sizeof_table(GUARD_INITIAL_PATH_SEGMENTS[guard])
	local current_segment_index = 0
	local current_direction = DIR_FORWARD
	local current_node_index = 0
	local current_segment_num_nodes = 0

	-- Pathfind to the initial location

	local at_spawn_location = true


	-- Start patrolling
	while(true) do

		-- While we are at the spawn location, maybe decide to go for a little stroll
		if (at_spawn_location) then

			-- Select a path segment randomly from our list of possible initial paths
			local transition_info = GUARD_INITIAL_PATH_SEGMENTS[guard][rand_int(1,num_initial_path_segments)]
			local path_segment_index = transition_info[1]

			-- If the path is not occupied, start pathfinding
			if ( Path_segment_occupied[path_segment_index] ~= true) then

				--Path_segment_occupied[path_segment_index] = true
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
				current_segment_num_nodes = sizeof_table(GUARD_PATH_SEGMENTS[current_segment_index])

				move_to(guard, GUARD_PATH_SEGMENTS[current_segment_index][current_node_index])
				
			end

		-- Otherwise, already on patrol
		else
			
			-- Maybe check for a transition into another patrol
			local transition_found = false
			local transition_info = nil
			if (rand_float(0.0,1.0) < 0.5) then

				local current_node = GUARD_PATH_SEGMENTS[current_segment_index][current_node_index]

				if (GUARD_SEGMENT_TRANSITIONS[current_node] ~= nil) then

					local num_transitions_in_dir = 0
					if (GUARD_SEGMENT_TRANSITIONS[current_node][current_direction] ~= nil) then
						num_transitions_in_dir =
							sizeof_table(GUARD_SEGMENT_TRANSITIONS[current_node][current_direction])
					end

					local num_transitions_in_either = 0
					if (GUARD_SEGMENT_TRANSITIONS[current_node][DIR_EITHER] ~= nil) then
						num_transitions_in_either =
							sizeof_table(GUARD_SEGMENT_TRANSITIONS[current_node][DIR_EITHER])
					end

					if (num_transitions_in_either + num_transitions_in_dir > 0) then

						local rand_transition = rand_int (1, num_transitions_in_dir + num_transitions_in_either)

						if (rand_transition > num_transitions_in_dir) then
							rand_transition = rand_transition - num_transitions_in_dir
							transition_info = GUARD_SEGMENT_TRANSITIONS[current_node][DIR_EITHER][rand_transition]
						else
							transition_info = GUARD_SEGMENT_TRANSITIONS[current_node][current_direction][rand_transition]
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
					if (rand_int(1,2) == 1) then
						current_direction = DIR_FORWARD
					else
						current_direction = DIR_REVERSE
					end
				end
				current_node_index =  transition_info[3]

				local transition_segment_index = transition_info[1]
				local transition_node_index = transition_info[2]
				move_to(guard, GUARD_PATH_SEGMENTS[transition_segment_index][transition_node_index])

				Path_segment_occupied[current_segment_index] = false
				--Path_segment_occupied[transition_segment_index] = true
				current_segment_index = transition_segment_index
				current_segment_num_nodes = sizeof_table(GUARD_PATH_SEGMENTS[current_segment_index])

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
			
				move_to(guard, GUARD_PATH_SEGMENTS[current_segment_index][current_node_index])

			end
		end -- ends else(not at spawn location)

		thread_yield()

	end -- end while(true)

end

function rn08_spawn_reinforcements()
	local spawn_count = NUMBER_REINFORCEMENTS
	if (IN_COOP) then
		spawn_count = NUMBER_REINFORCEMENTS_COOP
	end
		
	for i=1, spawn_count, 1 do
		local spawn_navpoint = rn08_get_reinforcement_navpoint()
		if (spawn_navpoint ~= nil) then
			local ronin = TABLE_REINFORCEMENTS[i]
			if (ronin ~= nil) then
				teleport(ronin, spawn_navpoint)
				character_show(ronin)
				attack(ronin)
			end
		end
	end

end

rn08_next_spawn_navpoint = 1
function rn08_get_reinforcement_navpoint()

	local return_navpoint = nil

	for i = rn08_next_spawn_navpoint, sizeof_table(TABLE_REINFORCEMENT_NAVPOINTS), 1 do

		rn08_next_spawn_navpoint = rn08_next_spawn_navpoint + 1
		local current_navpoint = TABLE_REINFORCEMENT_NAVPOINTS[i]

		if (not rn08_navpoint_in_fov(current_navpoint)) then
			return_navpoint = current_navpoint
			break
		end		
	end

	return return_navpoint

end

function rn08_navpoint_in_fov(navpoint)

	local navpoint_in_local_fov = navpoint_in_player_fov(navpoint, LOCAL_PLAYER)
	local navpoint_in_remote_fov = false
	if (IN_COOP) then
		navpoint_in_remote_fov = navpoint_in_player_fov(navpoint, REMOTE_PLAYER)
	end

	return (navpoint_in_local_fov or navpoint_in_remote_fov)

end

function rn08_process_lieutenants()

	-- Unlock suite doors
	door_lock(DOOR_SUITE_OUTER_1,false)
	door_lock(DOOR_SUITE_OUTER_2,false)

	-- Increase LTNT. hit points
	for i, target in pairs(TABLE_LIEUTENANTS) do
		if(not character_is_dead(target)) then
			local hit_points = get_current_hit_points(target)
			hit_points = hit_points * LIEUTENANT_HEALTH_MULTIPLIER 
			set_max_hit_points(target, hit_points, true)
		end
	end
	
	rn08_process_enemy_set(TABLE_LIEUTENANTS, HELPTEXT_SUITE, HELPTEXT_OBJECTIVE_RONIN)

end

function rn08_leave_hotel()

	group_create(GROUP_BODY_COUNT)

	mission_help_table(HELPTEXT_JUMP)

	-- Jumping from the lower levels should no longer fail the mission.
	on_trigger("rn08_jump_reached", TRIGGER_EARLY_JUMP)
	trigger_enable(TRIGGER_EARLY_JUMP, true)

	on_trigger("rn08_jump_reached",TRIGGER_JUMP)
	trigger_enable(TRIGGER_JUMP,true)
	marker_add_trigger(TRIGGER_JUMP,MINIMAP_ICON_LOCATION,INGAME_EFFECT_LOCATION,SYNC_ALL)

	while (not Jump_location_reached) do 
		thread_yield()
	end

	if(Thread_countdown_monitor ~= -1) then
		thread_kill(Thread_countdown_monitor)
	end

	-- Enable the hotel ground floor trigger
	on_trigger("rn08_exit_reached",TRIGGER_GROUND_FLOOR)
	trigger_enable(TRIGGER_GROUND_FLOOR,true)

	-- Disable the elevator up
	on_trigger("",TRIGGER_ELEVATOR)
	trigger_enable(TRIGGER_ELEVATOR,false)

	-- Enable free fall explosion triggers
	on_trigger("rn08_free_fall_1_reached",TRIGGER_FREE_FALL_1)
	trigger_enable(TRIGGER_FREE_FALL_1,true)

	on_trigger("rn08_free_fall_2_reached",TRIGGER_FREE_FALL_2)
	trigger_enable(TRIGGER_FREE_FALL_2,true)

	on_trigger("rn08_free_fall_3_reached",TRIGGER_FREE_FALL_3)
	trigger_enable(TRIGGER_FREE_FALL_3,true)

	-- wait for player to clear the soldiers off of this level
	while (not Exit_reached) do
		thread_yield()
	end

end

function rn08_close_and_lock_doors()

	rn08_close_and_lock_door(DOOR_NORTH_TOP_2)
	rn08_close_and_lock_door(DOOR_NORTH_TOP_3)
	rn08_close_and_lock_door(DOOR_NORTH_TOP_4)
	rn08_close_and_lock_door(DOOR_NORTH_TOP_5)

	rn08_close_and_lock_door(DOOR_SOUTH_TOP_2)
	rn08_close_and_lock_door(DOOR_SOUTH_TOP_3)
	rn08_close_and_lock_door(DOOR_SOUTH_TOP_4)

	rn08_close_and_lock_door(DOOR_SUITE_OUTER_1)
	rn08_close_and_lock_door(DOOR_SUITE_OUTER_2)
end

function rn08_close_and_lock_door(door)
	door_close(door)
	door_lock(door,true)
end

function rn08_bomb_placed(placer,bomb)

	turn_invulnerable(placer, false)
	character_prevent_explosion_fling(placer, true)
	player_controls_disable(placer)
	local player_weapon = inv_item_get_equipped_item(placer)
	inv_item_equip("brass_knuckles",placer)
	inv_weapon_enable_or_disable_all_slots(false, PLAYER_SYNC[placer])

	local crouch_forced = false

	if not crouch_is_crouching(placer) then
		crouch_start(placer)
		crouch_forced = true
		delay(1)
	end
	set_animation_state(placer, "crouch plant bomb")				

	-- keep track of the bombs that have actually been placed
	local index_offset = sizeof_table(Bombs_placed)
	Bombs_placed[index_offset+1] = bomb
	Bombs_to_place = Bombs_to_place -1
	Total_bombs_placed = Total_bombs_placed + 1
	if (Bombs_to_place < 1) then
		All_bombs_placed = true
	end
	if (Total_bombs_placed < NUMBER_BOMBS_TO_PLANT) then
		objective_text(0, HELPTEXT_OBJECTIVE_BOMBS, Total_bombs_placed, NUMBER_BOMBS_TO_PLANT)
	else
		objective_text_clear(0)
	end

	delay(1)

	audio_play_for_navpoint(FOLEY_BOMB_PLANT, bomb, "foley")
	clear_animation_state(placer)
	inv_item_equip(player_weapon,placer)
	if crouch_forced then
		crouch_stop(placer)
	end		

	inv_weapon_enable_or_disable_all_slots(true, PLAYER_SYNC[placer])
	player_controls_enable(placer)
	character_prevent_explosion_fling(placer, false)
	turn_vulnerable(placer)

	-- if the bomb timer isn't started, get it going
	if (Bomb_timer_started == false) then
		mission_help_table_nag(HELPTEXT_BOMBS_HURRY)
		hud_timer_set(1, BOMB_TIME_S*1000,"rn08_bomb_timer_expired")
		Bomb_timer_started = true
		Thread_countdown_monitor = thread_new("rn08_monitor_bomb_timer")
	end

	item_show(TABLE_TRIGGER_TO_BOMB[bomb])
	on_trigger("",bomb)
	trigger_enable(bomb,false)
	marker_remove_trigger(bomb,SYNC_ALL)

end

function rn08_arms_dealer_reached()
	--if (get_char_in_vehicle(VEHICLE_GIFT_CAR,0)=="#PLAYER#") then
		on_trigger("",TRIGGER_ARMS_DEALER)
		trigger_enable(TRIGGER_ARMS_DEALER,false)
		marker_remove_trigger(TRIGGER_ARMS_DEALER,SYNC_ALL)
		mission_waypoint_remove()
		Arms_dealer_reached = true
	--end
end

function rn08_hotel_reached()

	on_trigger("",TRIGGER_HOTEL)
	trigger_enable(TRIGGER_HOTEL,false)
	marker_remove_trigger(TRIGGER_HOTEL,SYNC_ALL)
	mission_waypoint_remove()
	Rn08_ronin_hq_reached = true
end

Player_who_jumped = ""

function rn08_jump_reached(player)
	local sync = SYNC_LOCAL
	
	if (player == REMOTE_PLAYER) then
		sync = SYNC_REMOTE
	end
	
	if (not (IN_COOP) or ((Player_who_jumped ~= "") and (Player_who_jumped ~= player))) then	
		on_trigger("",TRIGGER_JUMP)
		trigger_enable(TRIGGER_JUMP,false)
		marker_remove_trigger(TRIGGER_JUMP,sync)
		Jump_location_reached = true
	else
		Player_who_jumped = player
		marker_remove_trigger(TRIGGER_JUMP,sync)
	end
end

function rn08_exit_reached()
	on_trigger("",TRIGGER_GROUND_FLOOR)
	trigger_enable(TRIGGER_GROUND_FLOOR,false)
	rn08_process_explosions_with_physics(TABLE_BOMBS_FREE_FALL_BOTTOM, "Plane")
	Exit_reached = true
end

function rn08_elevator_reached(triggerer,trigger)

	-- Turn off the trigger, remove its indicator
	on_trigger("",trigger)
	trigger_enable(trigger,false)
	minimap_icon_remove_trigger(TRIGGER_ELEVATOR, SYNC_ALL)

	-- Start fading out, disable controls
	fade_out(1.0, {0,0,0}, SYNC_ALL)
	player_controls_disable(LOCAL_PLAYER)
	if(IN_COOP) then
		player_controls_disable(REMOTE_PLAYER)
	end

	-- spawn ALL soldiers on all elevator + floors, only block on first group
	if (Elevator_reached == false) then
		rn08_group_create_maybe_coop(GROUP_SOLDIERS_TOP_2,GROUP_SOLDIERS_TOP_2_COOP,true)
		rn08_group_create_maybe_coop(GROUP_SOLDIERS_TOP_3,GROUP_SOLDIERS_TOP_3_COOP,false)
		for i,guard in pairs(TABLE_SOLDIERS_TOP_2) do
			patrol("rn08_guard_patrol", guard)
		end
		for i,guard in pairs(TABLE_SOLDIERS_TOP_3) do
			patrol("rn08_guard_patrol", guard)
		end
		-- lock all hotel doors, do this here so we don't see door activation ui elements popping
		rn08_close_and_lock_doors()
	end

	-- Wait for fading to finish, then teleport to upper levels
	fade_out_block()

	teleport_coop(NAVPOINT_ELEVATOR, NAVPOINT_ELEVATOR_PLAYER_2, true)

	-- Fail the mission if a player jumps too early.
	on_trigger("rn08_early_jump_failure", TRIGGER_EARLY_JUMP)
	trigger_enable(TRIGGER_EARLY_JUMP, true)

	-- Fade in, reenable player controls
	fade_in(1.0, SYNC_ALL)
	delay(1.0)
	player_controls_enable(LOCAL_PLAYER)
	if(IN_COOP) then
		player_controls_enable(REMOTE_PLAYER)
	end

	Elevator_reached = true
end

function rn08_early_jump_failure()
	mission_end_failure(MISSION_NAME, HELPTEXT_FAIL_JUMP_EARLY)
end

-- Send Gat on his merry way via the hotel elevator
function rn08_take_elevator(name)
	if (not character_is_dead(CHARACTER_GAT)) then
		move_to(CHARACTER_GAT,NAVPOINT_ELEVATOR_GAT,2,true,true)
		group_destroy(GROUP_GAT)
	end
end

-- Cleanup mission
function rn08_cleanup()

	-- Kill bomb effects
	for bomb,effect_handle in pairs(Bomb_effect_handles) do
		effect_stop(effect_handle)
	end

	--turn off bomb timer
	hud_timer_stop(1)
	
	-- Make sure no one is inulnerable from placing a bomb
	turn_vulnerable(LOCAL_PLAYER)
	inv_weapon_enable_or_disable_all_slots(true, SYNC_ALL)
	if (coop_is_active()) then
		turn_vulnerable(REMOTE_PLAYER)
	end

	-- Stop persona overrides
	persona_override_group_stop(RONIN_PERSONAS,POT_SITUATIONS[POT_ATTACK])

	-- Disable the mission parachute override
	parachute_disable()

	-- Remove markers, callbacks from all enemies
	for i,enemy in pairs(TABLE_SOLDIERS_GROUND) do
		marker_remove_npc(enemy)
		on_death("",enemy)
	end
	for i,enemy in pairs(TABLE_LIEUTENANTS) do
		marker_remove_npc(enemy)
		on_death("",enemy)
	end

	if (Thread_gat_take_elevator ~= -1) then
		thread_kill(Thread_gat_take_elevator)
	end

	if (Thread_countdown_monitor ~= -1) then
		thread_kill(Thread_countdown_monitor)
	end

	-- Remove the callback for Gat's death
	on_death("", CHARACTER_GAT)
	on_dismiss("", CHARACTER_GAT)

	-- get Gat to stop following me around
	if (npc_is_in_party(CHARACTER_GAT)) then
		npc_stop_following(CHARACTER_GAT)
	end

	-- disable all triggers, remove callbacks
	for i, trigger in pairs(TABLE_ALL_TRIGGERS) do
		on_trigger("",trigger)
		trigger_enable(trigger,false)
	end

	-- Allow notoriety spawning again
	notoriety_force_no_spawn(MISSION_GANG_NAME,false)

	-- No target/driver for base jumping
	base_jumping_enable(true)

end

function rn08_success()
	
	--Lock the front doors after the mission is over so players can't get back inside
	door_lock(DOOR_FRONT_1, true)
	door_lock(DOOR_FRONT_2, true)
end

function rn08_complete()

	-- End the mission with success
	mission_end_success(MISSION_NAME, CUTSCENE_OUT, {NAVPOINT_LOCATION_START, NAVPOINT_LOCATION_START_PLAYER_2})
end

function rn08_local_failure()
	-- End the mission since the local player died
	mission_end_failure(MISSION_NAME)--, MISSION_FAIL)
end

function rn08_remote_failure()
	-- End the mission since the local player died
	mission_end_failure(MISSION_NAME)--, MISSION_FAIL)
end

function rn08_arms_dealer_failure()
	-- End the mission, The arms dealer died before the weapons were picked up
	mission_end_failure(MISSION_NAME, HELPTEXT_ARMS_DEALER_DIED)
end

function rn08_gat_death_failure()
	-- End the mission, Gat died
	mission_end_failure(MISSION_NAME, HELPTEXT_GAT_DIED)
end

function rn08_gat_dismiss_failure()
	-- End the mission, Gat was abandoned or dismissed
	mission_end_failure(MISSION_NAME, HELPTEXT_GAT_DISMISSED)
end

function rn08_bomb_failure()
	-- End the mission since the bombs exploded before the player finished
	mission_end_failure(MISSION_NAME, HELPTEXT_BOMB_FAILURE)
end


function rn08_setup_global_constants()
-- Make sure our list of ALL triggers really contains all triggers
	rn08_table_concat(TABLE_ALL_TRIGGERS, TABLE_BOMBS_TOP_1)
	rn08_table_concat(TABLE_ALL_TRIGGERS, TABLE_BOMBS_TOP_2)
	rn08_table_concat(TABLE_ALL_TRIGGERS, TABLE_BOMBS_TOP_3)
	rn08_table_concat(TABLE_ALL_TRIGGERS, TABLE_BOMBS_TOP_4)
	rn08_table_concat(TABLE_ALL_TRIGGERS, TABLE_BOMBS_TOP_5)

	NUMBER_BOMBS_TO_PLANT = sizeof_table(TABLE_BOMBS_TOP_2) + sizeof_table(TABLE_BOMBS_TOP_3) 
									+ sizeof_table(TABLE_BOMBS_TOP_4) + sizeof_table(TABLE_BOMBS_TOP_5) 

	-- Check for coop being active
	if (coop_is_active()) then
		IN_COOP	= true
		rn08_table_concat(TABLE_LIEUTENANTS, TABLE_LIEUTENANTS_COOP)
		rn08_table_concat(TABLE_SOLDIERS_GROUND,TABLE_SOLDIERS_GROUND_COOP)
		rn08_table_concat(TABLE_SOLDIERS_TOP_2,TABLE_SOLDIERS_TOP_2_COOP)
		rn08_table_concat(TABLE_SOLDIERS_TOP_3,TABLE_SOLDIERS_TOP_3_COOP)
		rn08_table_concat(TABLE_SOLDIERS_TOP_4,TABLE_SOLDIERS_TOP_4_COOP)
		rn08_table_concat(TABLE_SOLDIERS_TOP_5,TABLE_SOLDIERS_TOP_5_COOP)
	end
end

-- add all entries of the tail table onto the end of the head table
function rn08_table_concat(head_table, tail_table)
	local offset = sizeof_table(head_table)
	for i, tail_entry_i in pairs(tail_table) do
		head_table[offset+i] = tail_entry_i
	end
end

function rn08_process_bomb_set(bomb_table, stairwell_trigger_1, doorway_trigger_1, stairwell_trigger_2, doorway_trigger_2)
	All_bombs_placed			= false
	Bombs_to_place				= sizeof_table(bomb_table)
	for i, bomb in pairs(bomb_table) do
		on_trigger("rn08_bomb_placed",bomb)
		trigger_enable(bomb,true)
		marker_add_trigger(bomb,MINIMAP_ICON_LOCATION,INGAME_EFFECT_LOCATION,SYNC_ALL)
		--trigger_set_use_message(bomb,HELPTEXT_USE_BOMB)
	end

	Target_floor_reached = true;

	if (doorway_trigger_1) then
		Target_floor_reached = false
		Doorway_trigger_1 = doorway_trigger_1
		on_trigger_exit("rn08_target_floor_reached",doorway_trigger_1)
		trigger_enable(doorway_trigger_1,true)
	end
	if (doorway_trigger_2) then
		Target_floor_reached = false
		Doorway_trigger_2 = doorway_trigger_2
		on_trigger_exit("rn08_target_floor_reached",doorway_trigger_2)
		trigger_enable(doorway_trigger_2,true)
	end

	-- wait for the player to enter the target floor
	while (not Target_floor_reached) do
		thread_yield()
	end

	-- reset the flag
	Target_floor_reached = false

	-- setup messages to be displayed to the player if they attempt to leave the floor before placing all bombs
	if(stairwell_trigger_1) then
		Stairwell_trigger_1 = stairwell_trigger_1
		on_trigger("rn08_floor_exit_early",stairwell_trigger_1)
		trigger_enable(stairwell_trigger_1, true)
	end
	if(stairwell_trigger_2) then
		Stairwell_trigger_2 = stairwell_trigger_2
		on_trigger("rn08_floor_exit_early",stairwell_trigger_2)
		trigger_enable(stairwell_trigger_2, true)
	end

	-- wait for player to place all of the bombs
	while (not All_bombs_placed) do
		thread_yield()
	end

	-- disable triggers
		Stairwell_trigger_1 = ""
		if(stairwell_trigger_1) then
		on_trigger("",stairwell_trigger_1)
		trigger_enable(stairwell_trigger_1, false)
	end
	if(stairwell_trigger_2) then
		Stairwell_trigger_2 = ""
		on_trigger("",stairwell_trigger_2)
		trigger_enable(stairwell_trigger_2, false)
	end
end

function rn08_bomb_timer_expired()
	rn08_detonate_placed_bombs()
	rn08_bomb_failure()
end

function rn08_monitor_bomb_timer()
	while(hud_timer_get_remainder(1) > 30000) do
		thread_yield()
	end
	mission_help_table_nag(HELPTEXT_DETONATION_WARN)
end

function rn08_detonate_placed_bombs()
	-- only set off bombs that have actually been placed
	--rn08_process_explosions(Bombs_placed, "exp_plane", false)
	rn08_process_explosions_with_physics(Bombs_placed, "Plane")
	rn08_process_explosions(Bombs_placed, "Mission_RO8_exp", true)
end

function rn08_process_enemy_set(enemy_table, mission_helptext, objective_helptext)
	
	Enemy_set_cleared = false
	Enemies_to_kill = 0

	-- Assign enemy callbacks
	for i, enemy in pairs(enemy_table) do
		if(not character_is_dead(enemy)) then
			on_death("rn08_enemy_killed", enemy)
			marker_add_npc(enemy, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL) 
			Enemies_to_kill = Enemies_to_kill + 1
		end
	end

	-- Setup kill tracking numbers
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
	
	while (not Enemy_set_cleared) do
		thread_yield()
	end

end

function rn08_enemy_killed(enemy)
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

function rn08_free_fall_1_reached()
	hud_timer_stop(1)
	rn08_detonate_placed_bombs()
end

function rn08_free_fall_2_reached()
	rn08_process_explosions(TABLE_BOMBS_FREE_FALL_TOP, "Mission_RO8_exp",false)
end

function rn08_free_fall_3_reached()
	rn08_process_explosions(TABLE_BOMBS_FREE_FALL_MID, "Mission_RO8_exp",false)
end

function rn08_process_explosions(bomb_table, effect, looping)
	for i, bomb in pairs(bomb_table) do
		if (Bomb_effect_handles[bomb] == nil) then
			Bomb_effect_handles[bomb] = effect_play(effect,bomb,looping)
			delay(rand_float(0.0,0.4))
		end
	end
end

function rn08_process_explosions_with_physics(bomb_table, explosion, looping)
	for i, bomb in pairs(bomb_table) do
		explosion_create(explosion, bomb)
		delay(rand_float(0.0,0.4))
	end
end

function rn08_group_create_maybe_coop(group_always,group_coop, blocking)
	group_create(group_always, blocking)
	if (IN_COOP) then
		group_create(group_coop, blocking)
	end
end

function rn08_group_release_maybe_coop(group_always, group_coop)
	release_to_world(group_always)
	if (IN_COOP) then
		release_to_world(group_coop)
	end
end

function rn08_stairwell_entry(trigger1,trigger2)

	Doorway_trigger_1 = trigger1
	trigger_enable(trigger1, true)
	marker_add_trigger(trigger1,MINIMAP_ICON_LOCATION,INGAME_EFFECT_LOCATION,SYNC_ALL)
	on_trigger("rn08_stairwell_reached",trigger1)

	if (trigger2 ~= nil) then
		Doorway_trigger_2 = trigger2
		trigger_enable(trigger2, true)
		marker_add_trigger(trigger2,MINIMAP_ICON_LOCATION,INGAME_EFFECT_LOCATION,SYNC_ALL)
		on_trigger("rn08_stairwell_reached",trigger2)
	end

	while (Doorway_trigger_1 ~= "") do
		thread_yield()
	end
end

function rn08_stairwell_reached()
	trigger_enable(Doorway_trigger_1, false)
	marker_remove_trigger(Doorway_trigger_1,SYNC_ALL)
	on_trigger("",Doorway_trigger_1)
	Doorway_trigger_1 = ""
	if (Doorway_trigger_2 ~= "") then
		trigger_enable(Doorway_trigger_2, false)
		marker_remove_trigger(Doorway_trigger_2,SYNC_ALL)
		on_trigger("",Doorway_trigger_2)
		Doorway_trigger_2 = ""
	end
end

function rn08_floor_exit_early()
	-- Display the message
	mission_help_table_nag(HELPTEXT_BOMB_FINISH)	

	-- Disable triggers so that we're only displaying the message once per floor
	trigger_enable(Stairwell_trigger_1, false)
	on_trigger("",Stairwell_trigger_1)
	Stairwell_trigger_1 = ""
	if (Stairwell_trigger_2 ~= "") then
		trigger_enable(Stairwell_trigger_2, false)
		on_trigger("",Stairwell_trigger_2)
		Stairwell_trigger_2 = ""
	end
end

function rn08_target_floor_reached(triggerer,trigger)
	trigger_enable(Doorway_trigger_1, false)
	on_trigger_exit("",Doorway_trigger_1)
	Doorway_trigger_1 = ""
	if (Doorway_trigger_2 ~= "") then
		trigger_enable(Doorway_trigger_2, false)
		on_trigger_exit("",Doorway_trigger_2)
		Doorway_trigger_2 = ""
	end
	Target_floor_reached = true
end
