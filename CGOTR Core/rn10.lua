-- rn10.lua
-- SR2 mission script
-- 3/28/07

-- Cutscene crash fixes by IdolNinja
-- 3/11/2011


-- DEBUGGING STUFF
Debug_ronin = ""

-- Global constants ( ALL_CAPS means that they shouldn't be modified in running code, except for maybe	group_create_hidden(group) in a setup function )

	-- KNOBS_TO_TURN --

		AKUJI_USE_SWORD = false

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
			rn10_PARAMETERS	= 
				{	

					-- Stage 1, defend the HQ

						-- single-player values
						["WAVE_MIN_SIZE"]			=	3, -- Smallest # of enemies that will spawn in a given wave.
						["WAVE_MAX_SIZE"]			=	5, -- Largeset # of enemies that will spawn in a given wave.
						["WAVE_MAX_ATTACKERS"]	=	8, -- Max # of enemies that can be attacking at one time.

						["WAVE_RPG_CHANCE"]		= .2,-- Probability that the Ronin will have an rpg
						["WAVE_GRENADE_CHANCE"] = .5, -- If no rpg, probability to have grenades
						["WAVE_MOLOTOV_CHANCE"] = .3, -- If no grenades, probability to hvae molotov

						["PILLAR_MAX_HIT_POINTS"] = 1000, -- Number of "hit points" each set of supports has.
						["PILLAR_DEFEND_TIME_S"]	= 80,  -- How long the player(s) must defend each set of supports.

						["BATTLE_RESPAWN_DIST"] = 20, -- Min distance at which to respawn a Ronin/Saints battle
						
						-- coop values

					-- Stage 2, boss fight
					
						-- single-player values
						["AKUJI_HIT_POINTS"]			= 3500,
						["AKUJI_LTNT_HIT_POINTS"]	= 1500,
						["AKUJI_FLEE_HEALTH_RATIO"] = .2, -- Current to max health ratio at which Akuji flees

						-- coop values

				}

	-- COOP MISSION? -- 
		IN_COOP	= false

	-- CHARACTERS --

		CHARACTER_PIERCE		= "rn10_$Cpierce"
		CHARACTER_GAT			= "rn10_$Cgat"
		CHARACTER_WONG			= "rn10_$Cwong"
		CHARACTER_TRANSLATOR	= "rn10_$Ctranslator"
		CHARACTER_AKUJI		= "rn10_$Cakuji"

	-- CHECKPOINTS
		
		CHECKPOINT_START			= MISSION_START_CHECKPOINT			-- defined in ug_lib.lua
		CHECKPOINT_FIRST_PILLAR = "rn10_checkpoint_first_pillar" -- first set of pillars defended
		CHECKPOINT_AKUJI			= "rn10_checkpoint_akuji"			-- just before the fight w/ Akuji begins
		
	-- GROUPS --

		GROUP_RONIN_STAGE_1		= "rn10_$Gronin_stage_1"
		GROUP_RONIN_STAGE_2		= "rn10_$Gronin_stage_2"

		GROUP_CHAOS_SAINTS_1		= "rn10_$Gchaos_saints_1"
		GROUP_CHAOS_RONIN_1		= "rn10_$Gchaos_ronin_1"
		GROUP_CHAOS_SAINTS_2		= "rn10_$Gchaos_saints_2"
		GROUP_CHAOS_RONIN_2		= "rn10_$Gchaos_ronin_2"

	-- GROUP MEMBER TABLES -- 

		MEMBERS_GROUP_RONIN_STAGE_1	= {	"rn10_$c000", "rn10_$c001", "rn10_$c002", "rn10_$c003",
														"rn10_$c004", "rn10_$c005", "rn10_$c006", "rn10_$c007",
														"rn10_$c008", "rn10_$c009", "rn10_$c010", "rn10_$c011",
														"rn10_$c012", "rn10_$c013", "rn10_$c014", "rn10_$c015",
														"rn10_$c016", "rn10_$c017", "rn10_$c018", "rn10_$c019"}
	
		MEMBERS_GROUP_CHAOS_SAINTS_1	= {	"rn10_$c024", "rn10_$c025", "rn10_$c026"}	
		MEMBERS_GROUP_CHAOS_RONIN_1	= {	"rn10_$c027", "rn10_$c028", "rn10_$c029"}
		MEMBERS_GROUP_CHAOS_SAINTS_2	= {	"rn10_$c033", "rn10_$c034", "rn10_$c035"}	
		MEMBERS_GROUP_CHAOS_RONIN_2	= {	"rn10_$c030", "rn10_$c031", "rn10_$c032"}

	-- HELPTEXT

		-- localized helptext messages

			-- Failure conditions
			HELPTEXT_FAILURE_GAT_ABANDONED		= "rn10_failure_gat_abandoned"
			HELPTEXT_FAILURE_GAT_DIED				= "rn10_failure_gat_died"
			HELPTEXT_FAILURE_PIERCE_ABANDONED	= "rn10_failure_pierce_abandoned"
			HELPTEXT_FAILURE_PIERCE_DIED			= "rn10_failure_pierce_died"
			HELPTEXT_FAILURE_SUPPORT_COLLAPSED	= "rn10_failure_support_collapsed" -- The ceiling collapsed.

			-- Hud
			HELPTEXT_HUD_PILLAR_HEALTH				= "rn10_hud_pillar_health"	-- Structural Integrity
			HELPTEXT_HUD_AKUJI_HEALTH				= "rn10_hud_akuji_health"

			-- Prompts
			HELPTEXT_PROMPT_MISSION_START			= "rn10_prompt_mission_start"	-- Find out what the Ronin are doing in the underground.
			HELPTEXT_PROMPT_PROTECT_SUPPORTS		= "rn10_prompt_protect_supports" -- Don't let the Ronin blow up the ceiling supports.
			HELPTEXT_PROMPT_NEXT_DEFENSE			= "rn10_prompt_next_defense" -- 	Look for other Ronin demolition teams.
			HELPTEXT_PROMPT_KILL_AKUJI				= "rn10_prompt_kill_akuji" -- Kill Akuji

			-- Objectives
			--HELPTECT_OBJECTIVE_PROTECT_SUPPORTS	= "rn10_objective_protect_supports" -- Protect the ceiling supports.

			-- Misc.

		-- unlocalized helptext messages

	-- MOVERS

	-- NAVPOINTS

		NAVPOINT_LOCAL_PLAYER_START		= "rn10_$Nlocal_player_start"
		NAVPOINT_REMOTE_PLAYER_START		= "rn10_$Nremote_player_start"

	-- TRIGGERS -- 
	
		-- List of all triggers, makes cleaning up more convenient
		TABLE_ALL_TRIGGERS		= {	}		

	-- VEHICLES --


	-- MISC CONSTANTS

		RONIN_RESPAWN_TIME_MS			= 1000  -- Time in MS before respawning
		RONIN_RESPAWN_DISTANCE			= 0.01


		OTHER_PLAYER	=	{	[LOCAL_PLAYER]	= REMOTE_PLAYER,
									[REMOTE_PLAYER] = LOCAL_PLAYER,
								}

		PLAYER_SYNC		=	{	[LOCAL_PLAYER]	= SYNC_LOCAL,
									[REMOTE_PLAYER] = SYNC_REMOTE,
								}

		-- defense locations are numbered in the same order as the map on 
		-- http://wiki.volition.net//tiki-index.php?page=SR2+Ronin+Mission+10

		-- Each defense objective is an area containing one or more ceiling supports. Players must
		-- defend the supports as incoming waves of Ronin attack them.
		DEFENSE_OBJECTIVES	=
			{
				{
					-- Regions which trigger the start of a defense objective.
					["trigger"]		= "rn10_$Tdefense_1",

					-- Floating navpoints inside the pillars at which the Ronin will shoot.
					["ai targets"]	= {"rn10_$Ndefense_1_pillar_1", "rn10_$Ndefense_1_pillar_2"},

					-- Spawn locations which are close to this objective.
					["spawn locations"] = {1,2,3,6},

					-- Spawn location(s) at which we'd prefer to spawn the initial allotment
					-- of Ronin to attack this area.
					["preferred initial locations"] = {6},
				},
				--[[
				{
					["trigger"]		= "rn10_$Tdefense_2",
					["ai targets"]	= {"rn10_$Tdefense_2_pillar_1", "rn10_$Tdefense_2_pillar_2"},
					["spawn locations"] = {2,3,4},
					["preferred initial locations"] = {4},
				},
				]]
				{
					["trigger"]		= "rn10_$Tdefense_3",
					["ai targets"]	= {"rn10_$Tdefense_3_pillar_1", "rn10_$Tdefense_3_pillar_2",
											"rn10_$Tdefense_3_pillar_3", "rn10_$Tdefense_3_pillar_4"},
					["spawn locations"] = {7,8,9,10,2},
					["preferred initial locations"] = {7,8},
				},
			}

		-- Navpoints from which the ai targets can be attacked
		TARGET_ATTACK_POSITIONS =
			{
				["rn10_$Ndefense_1_pillar_1"] = {"rn10_$n018", "rn10_$n019", "rn10_$n020", "rn10_$n021",
															"rn10_$n022", "rn10_$n023", "rn10_$n024", "rn10_$n025"},
				["rn10_$Ndefense_1_pillar_2"] = {"rn10_$n026", "rn10_$n027", "rn10_$n028", "rn10_$n029",
															"rn10_$n030", "rn10_$n031", "rn10_$n032", "rn10_$n033"},
				["rn10_$Tdefense_2_pillar_1"] = {"rn10_$n037", "rn10_$n038", "rn10_$n039", "rn10_$n040",
															"rn10_$n041", "rn10_$n048", "rn10_$n049", "rn10_$n050"},
				["rn10_$Tdefense_2_pillar_2"] = {"rn10_$n042", "rn10_$n043", "rn10_$n044", "rn10_$n045",
															"rn10_$n046", "rn10_$n047", "rn10_$n051", "rn10_$n052"},
				["rn10_$Tdefense_3_pillar_1"] = {"rn10_$n053", "rn10_$n054", "rn10_$n055", "rn10_$n057",
															"rn10_$n066", "rn10_$n067", "rn10_$n068", "rn10_$n069"},
				["rn10_$Tdefense_3_pillar_2"] = {"rn10_$n053", "rn10_$n054", "rn10_$n055", "rn10_$n056",
															"rn10_$n057", "rn10_$n058", "rn10_$n066", "rn10_$n067"},
				["rn10_$Tdefense_3_pillar_3"] = {"rn10_$n053", "rn10_$n054", "rn10_$n055", "rn10_$n056",
															"rn10_$n057", "rn10_$n058", "rn10_$n066", "rn10_$n067",
															"rn10_$n068", "rn10_$n069"},
				["rn10_$Tdefense_3_pillar_4"] = {"rn10_$n058", "rn10_$n059", "rn10_$n060", "rn10_$n061",
															"rn10_$n062", "rn10_$n063", "rn10_$n064", "rn10_$n065"},
			}
		
		-- Spawn locations for the waves of Ronin attackers in stage 1.
		SPAWN_LOCATIONS =	
			{	
				[1] = {	-- The set of triggers defining the portion of the level with line-of-sight to 
							-- the spawn navpoints. If no player is in any of these triggers, then we can
							-- safely spawn ronin in this location without fear of popping.
							["triggers"]	= {"rn10_$Tspawn_location_1_trigger_1"}, 

							-- The actual navpoints at which the Ronin spawn.
							["navpoints"]	= {	"rn10_$n000", "rn10_$n001", "rn10_$n002", "rn10_$n003",
														"rn10_$n004", "rn10_$n005", "rn10_$n006", "rn10_$n007"},

							-- The first navpoint to which the spawned Ronin pathfind. Often, the spawn
							-- navpoints are set in small, out of the way rooms and the Ronin have difficulty
							-- pathfinding out. Kevin P. has made improvements to pathfinding which probably
							-- make the exit navpoint obsolete.
							["exit"]			= {	"rn10_$n034"},
						},
				[2] = {	["triggers"]	= {"rn10_$Tspawn_location_2_trigger_1"}, 
							["navpoints"]	= {	"rn10_$n008", "rn10_$n009", "rn10_$n010", "rn10_$n011"},
							["exit"]			= {	"rn10_$n035"},
						},
				[3] = {	["triggers"]	= {"rn10_$Tspawn_location_3_trigger_1"}, 
							["navpoints"]	= {	"rn10_$n070", "rn10_$n071", "rn10_$n072", "rn10_$n073",
														"rn10_$n074", "rn10_$n075"},
							["exit"]			= {	"rn10_$n076"},
						},
				[4] = {	["triggers"]	= {"rn10_$Tspawn_location_4_trigger_1"}, 
							["navpoints"]	= {	"rn10_$n077", "rn10_$n078", "rn10_$n079", "rn10_$n080",
														"rn10_$n081", "rn10_$n082"},
							["exit"]			= {	"rn10_$n083"},
						},
				[6] = {	["triggers"]	= {"rn10_$Tspawn_location_6_trigger_1"},
							["navpoints"]	= {	"rn10_$n012", "rn10_$n013", "rn10_$n014", "rn10_$n015",
														"rn10_$n016", "rn10_$n017"},
							["exit"]			= {	"rn10_$n036"},
						},
				-- Spawn locations 7 and 8 intentionally share a trigger.
				[7] = {	["triggers"]	= {"rn10_$Tspawn_location_7_trigger_1"},
							["navpoints"]	= {	"rn10_$n084", "rn10_$n085", "rn10_$n086", "rn10_$n087"},
							["exit"]			= {	"rn10_$n088"},
						},
				[8] = {	["triggers"]	= {"rn10_$Tspawn_location_7_trigger_1"},
							["navpoints"]	= {	"rn10_$n089", "rn10_$n090", "rn10_$n091", "rn10_$n092"},
							["exit"]			= {	"rn10_$n093"},
						},
				[9] = {	["triggers"]	= {"rn10_$Tspawn_location_9_trigger_1"},
							["navpoints"]	= {	"rn10_$n094", "rn10_$n096"},
							["exit"]			= {	"rn10_$n095"},
						},
				[10] = {	["triggers"]	= {"rn10_$Tspawn_location_10_trigger_1"},
							["navpoints"]	= {	"rn10_$n097", "rn10_$n098", "rn10_$n099", "rn10_$n100"},
							["exit"]			= {	"rn10_$n101"},
						},
			}

	STATIONARY_BATTLES = 
		{
			{
				["group"] = "",
				["saints"] = {},
				["ronin"] = {},
			},
			{
				["group"] = "",
				["saints"] = {},
				["ronin"] = {},
			},
			{
				["group"] = "",
				["saints"] = {},
				["ronin"] = {},
			},
		}

RN10_RONIN_PERSONAS	= {
	["AM_Ron2"]	=	"AMRON2",

	["AF_Ron1"]	=	"AFRON1",
	["AF_Ron3"]	=	"AFRON3",

	["WM_Ron1"]	=	"WMRON1",

	["WF_Ron1"]	=	"WFRON1",
	["WF_Ron2"]	=	"WFRON2",
}

RN10_SAINTS_PERSONAS = {
	["AM_TSS2"]	=	"AMTSS2",
	["AM_TSS3"]	=	"AMTSS3",

	["BM_TSS1"]	=	"BMTSS1",
	["BM_TSS2"]	=	"BMTSS2",

	["BF_TSS1"]	=	"BFTSS1",
	["BF_TSS2"]	=	"BFTSS2",

	["HM_TSS1"]	=	"HMTSS1",
	["HM_TSS2"]	=	"HMTSS2",
	["HM_TSS3"]	=	"HMTSS3",

	["HF_TSS3"]	=	"HFTSS3",

	["WM_TSS2"]	=	"WMTSS2",
	["WM_TSS3"]	=	"WMTSS3",

	["WF_TSS1"]	=	"WFTSS1",
	["WF_TSS2"]	=	"WFTSS2",
	["WF_TSS3"]	=	"WFTSS3",
}


-- Progress flags
	Akuji_fleeing						= false  -- Is Akuji fleeing the players in the final stage.

-- Misc

	-- Spawn locations are defined by one more more triggers. This structure maps trigger -> spawn location index.
	Map_trigger_to_spawn_location_index = {} -- Maps from trigger -> spawn location index

	-- Maps spawn location -> (# times a player entered the location's trigger(s)) - (# of times a player left)
	-- Technically, this isn't a count of how many players are in the spawn location because it could have two
	-- or more overlapping triggers. However, it is still the case that no players are in the spawn location if
	-- and only if the value is 0
	Num_players_in_spawn_locations = {}

	-- Each defense objective has an associated trigger. If a player completes an objective while they are standing
	-- inside the trigger of another incomplete objective, then they should immediately start or join that objective.
	-- This structure keeps track of which defense objective triggers each player occupies.
	--[[ 

	*** (This structure is now defined in mission_gloabls.lua) ***

	Rn10_player_defense_objectives_occupied_at_checkpoint =
		{
			[LOCAL_PLAYER]		= {},
			[REMOTE_PLAYER]	= {},
		}
	]]

	Rn10_player_defense_objectives_occupied =
		{
			[LOCAL_PLAYER]		= {},
			[REMOTE_PLAYER]	= {},
		}

	-- Defense objectives that have been completed:
	Defense_objective_completed = {}
	
	-- Which defense objective each player is working on.
	NO_ACTIVE_DEFENSE_OBJECTIVE = 0
	Player_active_defense_objective = 
		{
			[LOCAL_PLAYER]		= NO_ACTIVE_DEFENSE_OBJECTIVE,
			[REMOTE_PLAYER]	= NO_ACTIVE_DEFENSE_OBJECTIVE,
		}

	-- Ronin which aren't currently spawned.
	Spawnable_ronin	= {}

	-- For each spawn location, store the index of the next navpoint at which to spawn a ronin
	-- The index is modularly incremented. I use this to decrease the chance that ronin will
	-- be spawned on top of each other.
	Spawn_locations_next_navpoint_index = {}

	-- Track which defense objective the ronin is attacking.
	Ronin_defense_objective_targeted = {}

	-- Total number of ronin attacking each defense objective
	Num_living_attackers = {}

	-- Each support has a number of associated nav points from which the Ronin have line of sight
	-- to attack. This structure tracks which Ronin occupy each of these attack positions so that
	-- I don't have them pathfinding to the same spot.
	Target_attack_position_occupants = {}

	-- First navpoint that the Ronin should pathfind to after spawning
	Spawn_area_exits = {}

	-- Pillar health
	Pillar_max_hit_points = {};

	-- Patrol threads for attacking ronin.
	Ronin_patrol_threads = {}

-- CUTSCENES --
-- Added by IdolNinja. These variables are used in the script for the cutscenes for stability instead of calling them directly

CUTSCENE_IN = 		"ro10-01"
CUTSCENE_OUT = 		"ro10-02"
MISSION_NAME =		"rn10"

-- Main Thread:
function rn10_start(rn10_checkpoint, is_restart)

	if (rn10_checkpoint == CHECKPOINT_START) then
		if (not is_restart) then
			cutscene_play(CUTSCENE_IN)
		end
		fade_out(0)
	end

	rn10_initialize(rn10_checkpoint)

	-- Stage 1, defend structural weak points in the Ronin HQ from sappers
	if(rn10_checkpoint == CHECKPOINT_START) then

		-- Defend the first objective
		rn10_defend_objective(1)

		-- CHECKPOINT!
		for trigger, occupied in pairs(Rn10_player_defense_objectives_occupied[LOCAL_PLAYER]) do
			Rn10_player_defense_objectives_occupied_at_checkpoint[LOCAL_PLAYER][trigger] = occupied
		end
		for trigger, occupied in pairs(Rn10_player_defense_objectives_occupied[REMOTE_PLAYER]) do
			Rn10_player_defense_objectives_occupied_at_checkpoint[REMOTE_PLAYER][trigger] = occupied
		end		mission_set_checkpoint(CHECKPOINT_FIRST_PILLAR)
		rn10_checkpoint = CHECKPOINT_FIRST_PILLAR
		delay(1.0)

	end -- ends CHECKPOINT_START

	-- Stage 1b, defend structural weak points in the Ronin HQ from sappers
	if(rn10_checkpoint == CHECKPOINT_FIRST_PILLAR) then

		-- Defend the second objective
		rn10_defend_objective(2)

		-- CHECKPOINT!
		mission_set_checkpoint(CHECKPOINT_AKUJI)
		rn10_checkpoint = CHECKPOINT_AKUJI
		delay(1.0)

	end -- ends CHECKPOINT_START


	-- Stage 2, fight Akuji
	if ( rn10_checkpoint == CHECKPOINT_AKUJI ) then

		-- Fight Akuji
		rn10_akuji()

		-- Player(s) win. Yay!
		rn10_complete()

	end
end

function rn10_initialize(checkpoint)

	mission_start_fade_out(0.0)

	rn10_initialize_common()

	rn10_initialize_checkpoint(checkpoint)

	mission_start_fade_in()

end

-- Initialization code shared by all checkpoints.
function rn10_initialize_common()

	-- Start trigger is hit...the activate button was hit
	set_mission_author("Phillip Alexander")

	if (coop_is_active()) then
		IN_COOP	= true
	end

	-- Start persona overrides
	persona_override_group_start(RN10_RONIN_PERSONAS,POT_SITUATIONS[POT_ATTACK], "RO10_ATTACK")
	persona_override_group_start(RN10_SAINTS_PERSONAS,POT_SITUATIONS[POT_ATTACK], "RO10_DEFEND")

		
	--Set notoriety to level 4 for mission duration
	notoriety_set("Ronin", 4)
	notoriety_set_min("Ronin", 4)
	notoriety_set_max("Ronin", 4)


	rn10_hide_shanties()

end

-- Initialization code specific to the checkpoint.
function rn10_initialize_checkpoint(checkpoint)

	if (checkpoint == CHECKPOINT_START) then

		Rn10_player_defense_objectives_occupied =
		{
			[LOCAL_PLAYER]		= {},
			[REMOTE_PLAYER]	= {},
		}
		Rn10_player_defense_objectives_occupied_at_checkpoint =
		{
			[LOCAL_PLAYER]		= {},
			[REMOTE_PLAYER]	= {},
		}

		teleport_coop(NAVPOINT_LOCAL_PLAYER_START, NAVPOINT_REMOTE_PLAYER_START)
	
		--Prepare triggers that will activate the defense objectives
		for i, defense_objective in pairs(DEFENSE_OBJECTIVES) do
			trigger_enable(defense_objective["trigger"], true)
			on_trigger("rn10_defense_objective_trigger_enter", defense_objective["trigger"])
			on_trigger_exit("rn10_defense_objective_trigger_exit", defense_objective["trigger"])		
		end

	end

	if (checkpoint == CHECKPOINT_FIRST_PILLAR) then
		for trigger, occupied in pairs(Rn10_player_defense_objectives_occupied_at_checkpoint[LOCAL_PLAYER]) do
			Rn10_player_defense_objectives_occupied[LOCAL_PLAYER][trigger] = occupied
		end
		for trigger, occupied in pairs(Rn10_player_defense_objectives_occupied_at_checkpoint[REMOTE_PLAYER]) do
			Rn10_player_defense_objectives_occupied[REMOTE_PLAYER][trigger] = occupied
		end
		trigger_enable(DEFENSE_OBJECTIVES[2]["trigger"], true)
		on_trigger("rn10_defense_objective_trigger_enter", DEFENSE_OBJECTIVES[2]["trigger"])
		on_trigger_exit("rn10_defense_objective_trigger_exit", DEFENSE_OBJECTIVES[2]["trigger"])
	end

	if ( (checkpoint == CHECKPOINT_START) or (checkpoint == CHECKPOINT_FIRST_PILLAR) ) then

		-- Start the thread that spawns Ronin to attack active defense objectives
		thread_new("rn10_ronin_attack_defense_objectives")

		-- Setup the triggers associated w/ each spawn location so that we can spawn Ronin out-of-sight.
		for i, spawn_location in pairs(SPAWN_LOCATIONS) do

			Num_players_in_spawn_locations[i]	= 0				
			for j, trigger in pairs(spawn_location["triggers"]) do
				
				-- Remember which spawn location this trigger is associated with.
				Map_trigger_to_spawn_location_index[trigger] = i
				trigger_enable(trigger, true)
				on_trigger("rn10_spawn_location_trigger_enter", trigger)
				on_trigger_exit("rn10_spawn_location_trigger_exit", trigger)
			end

		end

		thread_new("rn10_respawning_battles")
		--thread_new("rn10_setup_battle", GROUP_CHAOS_RONIN_1, GROUP_CHAOS_SAINTS_1, MEMBERS_GROUP_CHAOS_RONIN_1, MEMBERS_GROUP_CHAOS_SAINTS_1)
		-- Wait for some dudes to be spawned
		while(Battle_living == 0) do
			thread_yield()
		end

	end

end

-- Stage 1 functions

function rn10_hide_shanties()
	for i=1, 13, 1 do
		mesh_mover_hide("rn10_Shanty" .. i)
	end
end

function rn10_show_shanties()
	for i=1, 13, 1 do
		mesh_mover_show("rn10_Shanty" .. i)
	end
end

-- Defend an objective
function rn10_defend_objective(objective_index)
	
	marker_add_trigger(DEFENSE_OBJECTIVES[objective_index]["trigger"],MINIMAP_ICON_LOCATION,"",SYNC_ALL)
	mission_waypoint_add(DEFENSE_OBJECTIVES[objective_index]["trigger"], SYNC_ALL)

	if (objective_index == 1) then
		mission_help_table(HELPTEXT_PROMPT_MISSION_START)
	else
		mission_help_table(HELPTEXT_PROMPT_NEXT_DEFENSE)
	end

	-- Wait for a player to enter the trigger area
	local player_present = false
	while( not player_present) do
		player_present = Rn10_player_defense_objectives_occupied[LOCAL_PLAYER][objective_index]
		player_present = player_present or Rn10_player_defense_objectives_occupied[REMOTE_PLAYER][objective_index]
		thread_yield()
	end

	marker_remove_trigger(DEFENSE_OBJECTIVES[objective_index]["trigger"], SYNC_ALL)
	mission_waypoint_remove(SYNC_ALL)

	-- Begin the defense
	rn10_begin_defense_objective(LOCAL_PLAYER, objective_index)
	if(IN_COOP) then
		rn10_begin_defense_objective(REMOTE_PLAYER, objective_index)
	end

	-- Wait for the players to successfully defend the objective
	while (not Defense_objective_completed[objective_index]) do
		thread_yield()
	end
end

-- A player exited a defense objective
function rn10_defense_objective_trigger_exit(player, trigger)

	-- determine the index of the defense objective that we're dealing with
	local defense_objective_index = 0
	for i,defense_objective in pairs(DEFENSE_OBJECTIVES) do
		if (defense_objective["trigger"] == trigger) then
			defense_objective_index = i
			break
		end
	end

	-- Remember that the player exited this trigger
	Rn10_player_defense_objectives_occupied[player][defense_objective_index] = nil
end

-- A player entered a defense objective
function rn10_defense_objective_trigger_enter(player, trigger)

	-- determine the index of the defense objective that we're dealing with
	local defense_objective_index = 0
	for i,defense_objective in pairs(DEFENSE_OBJECTIVES) do
		if (defense_objective["trigger"] == trigger) then
			defense_objective_index = i
			break
		end
	end

	-- Remember that the player entered this trigger
	Rn10_player_defense_objectives_occupied[player][defense_objective_index] = true

end

-- Called when a player starts a defense objective _or_ joins one already in progress.
function rn10_begin_defense_objective(player, defense_objective_index)

	Player_active_defense_objective[player] = defense_objective_index
	
	local player_sync = PLAYER_SYNC[player]

	-- Add defend icons to structural weak points
	for i, ai_target in DEFENSE_OBJECTIVES[defense_objective_index]["ai targets"] do
		

		trigger_enable(ai_target, true)
		marker_add_trigger(	ai_target, 
									MINIMAP_ICON_PROTECT_ACQUIRE, 
									INGAME_EFFECT_VEHICLE_LOCATION,
									player_sync) 		
	end

	-- Player(s) must defend the pillar for a set amount of time.
	mission_help_table(HELPTEXT_PROMPT_PROTECT_SUPPORTS, "", "", player_sync)
	hud_timer_set(0, rn10_get_parameter_value("PILLAR_DEFEND_TIME_S")*1000,
							"rn10_pillar_defended_" .. defense_objective_index)
	
	-- Display the Pillar's health
	hud_bar_on(0, "Health", HELPTEXT_HUD_PILLAR_HEALTH, Pillar_max_hit_points[defense_objective_index])
	hud_bar_set_range(0, 0, Pillar_max_hit_points[defense_objective_index], SYNC_ALL)
	hud_bar_set_value(0, Pillar_max_hit_points[defense_objective_index], SYNC_ALL)

end

-- Defense objective complete wrappers
function rn10_pillar_defended_1()
	rn10_pillar_defended(1)
end
function rn10_pillar_defended_2()
	rn10_pillar_defended(2)
end
function rn10_pillar_defended_3()
	rn10_pillar_defended(3)
end

-- Called when a pillar has been successfully defended (still has health when timer elapses)
function rn10_pillar_defended(defense_objective_index)
	
	-- Kill all off the old patrol threads and have the ronin spawned for this mission
	-- attack the player(s)
	for i, ronin in pairs(MEMBERS_GROUP_RONIN_STAGE_1) do
		local patrol_thread = Ronin_patrol_threads[ronin]
		if (	(not character_is_dead(ronin)) and 
				(patrol_thread ~= nil)) then
			thread_kill(Ronin_patrol_threads[ronin])
			Ronin_patrol_threads[ronin] = nil
			--marker_remove_npc(ronin)
			attack(ronin)
			npc_hearing_enable(ronin,true)
			set_always_sees_player_flag(ronin,true)
		end
	end

	-- Eliminate the minimap icons associated with the defense objectives structural weak points.
	for i, ai_target in DEFENSE_OBJECTIVES[defense_objective_index]["ai targets"] do
		trigger_enable(ai_target, false)
		marker_remove_trigger(ai_target)
	end

	-- Clear the hud.
	hud_bar_off(0)
	hud_timer_stop(0)
	--objective_text_clear(0)	
	
	-- Book keeping.
	Defense_objective_completed[defense_objective_index] = true
	if (Player_active_defense_objective[LOCAL_PLAYER] == defense_objective_index) then
		Player_active_defense_objective[LOCAL_PLAYER] = NO_ACTIVE_DEFENSE_OBJECTIVE
	end
	if (Player_active_defense_objective[REMOTE_PLAYER] == defense_objective_index) then
		Player_active_defense_objective[REMOTE_PLAYER] = NO_ACTIVE_DEFENSE_OBJECTIVE
	end

end

-- A player entered a spawn location trigger
function rn10_spawn_location_trigger_enter(player, trigger)

	local spawn_location_index = Map_trigger_to_spawn_location_index[trigger]
	local num_players = Num_players_in_spawn_locations[spawn_location_index]
	Num_players_in_spawn_locations[spawn_location_index] = num_players + 1
end

-- A player exited a spawn location trigger
function rn10_spawn_location_trigger_exit(player, trigger)

	local spawn_location_index = Map_trigger_to_spawn_location_index[trigger]
	local num_players = Num_players_in_spawn_locations[spawn_location_index]
	Num_players_in_spawn_locations[spawn_location_index] = num_players - 1
end

-- Spawn waves of ronin to attack ceiling supports that the player(s) is(are) defending
function rn10_ronin_attack_defense_objectives()

	-- Start loading the ronin
	group_create_hidden(GROUP_RONIN_STAGE_1)

	-- Set respawn dist threshold very low.
	npc_respawn_dist_override(RONIN_RESPAWN_DISTANCE)
	
	-- All ronin are initially spawnable
	for i, ronin in pairs(MEMBERS_GROUP_RONIN_STAGE_1) do
		Spawnable_ronin[ronin] = true
	end

	-- Convenience variables for wave size parameters.
	local min_wave_size = rn10_get_parameter_value("WAVE_MIN_SIZE")
	local max_wave_size = rn10_get_parameter_value("WAVE_MAX_SIZE")
	local max_attackers = rn10_get_parameter_value("WAVE_MAX_ATTACKERS")

	-- Size of the next wave to spawn at each defense objective.
	local next_wave_sizes = {}

	-- Initialize per-objective data
	for i, defense_objective in pairs(DEFENSE_OBJECTIVES) do

		-- Determine the size of the next wave
		next_wave_sizes[i] = rand_int(min_wave_size, max_wave_size)

		-- No Ronin are attacking yet.
		Num_living_attackers[i] = 0

		-- All Pillars at full health
		Pillar_max_hit_points[i] = rn10_get_parameter_value("PILLAR_MAX_HIT_POINTS")

	end

	-- Wait for all Ronin to load.
	while (not group_is_loaded(GROUP_RONIN_STAGE_1)) do
		thread_yield()
	end

	-- Continuously check the number of Ronin attacking each location, spawn more if needed.
	while(true) do

		-- Examine each objective
		for i, defense_objective in pairs(DEFENSE_OBJECTIVES) do

			-- Only spawn ronin if players are actively defending this objecive
			if (	Player_active_defense_objective[LOCAL_PLAYER] == i or
					Player_active_defense_objective[REMOTE_PLAYER] == i) then
							
				-- Spawn the next wave if there is room.
				if (next_wave_sizes[i] + Num_living_attackers[i] <= max_attackers) then

					local num_ronin_spawned = rn10_send_wave(i, next_wave_sizes[i])
					Num_living_attackers[i] = Num_living_attackers[i] + num_ronin_spawned
					next_wave_sizes[i] = rand_int(min_wave_size, max_wave_size)

				end -- Spawn the next wave if we have room.
			
			end -- end Only spawn ronin if players are actively defending this objecive

		end -- end Examine each objective

		thread_yield()

	end -- end while(true)

end

-- Send a wave of ronin to attack a structural weakness
--
-- defense_objective_index: index of defense objective to attack.
-- 
-- wave_size: number of attackers to send
--
-- returns number of attackers successfully spawned
function rn10_send_wave(defense_objective_index, wave_size)

	local num_ronin_spawned = 0

	-- For each Ronin to be spawned
	for i=1, wave_size, 1 do

		-- Get a ronin to spawn and a safe spawning location. 
		local ronin = rn10_get_spawnable_ronin()
		local spawn_navpoint, spawn_location_index = rn10_get_safe_spawn(defense_objective_index)

		-- If any of these aren't found, return # ronin already spawned.
		if ( (spawn_navpoint == nil) or (spawn_location_index == nil) or (ronin == nil)) then
			return num_ronin_spawned
		end

		-- We're gonna spawn this guy, do some book keeping.
		num_ronin_spawned = num_ronin_spawned + 1
		Spawnable_ronin[ronin] = false
		Ronin_defense_objective_targeted[ronin] = defense_objective_index
		Spawn_area_exits[ronin] = SPAWN_LOCATIONS[spawn_location_index]["exit"]

		-- Teleport to the spawn navpoint
		teleport(ronin, spawn_navpoint)

		-- Tell the ronin to respawn, override default respawn time
		npc_respawn_after_death(ronin, true)
		npc_respawn_after_death_time_override(ronin, RONIN_RESPAWN_TIME_MS, true)
		on_respawn("rn10_respawn_ronin",ronin)
		on_death("rn10_cleanup_ronin",ronin)

		-- Show the ronin and start its patrol
		character_show(ronin)
		--marker_add_npc(ronin, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL) 
		Ronin_patrol_threads[ronin] = thread_new("rn10_ronin_patrol_" .. defense_objective_index, ronin)

		-- Delay a little bit, gives the ronin time to leave the spawn area and keeps congestion down.
		delay(.2,.5)

	end

	-- Return num of ronin spawned
	return num_ronin_spawned

end

-- Returns a spawnable ronin if one is available, nil else.
function rn10_get_spawnable_ronin()

	for i, ronin in pairs(MEMBERS_GROUP_RONIN_STAGE_1) do
		if (Spawnable_ronin[ronin] == true) then
			return ronin
		end
	end

	return nil

end

-- Wrappers for patrols at different defense objectives
function rn10_ronin_patrol_1(ronin)
	rn10_ronin_patrol(ronin, 1)
end
function rn10_ronin_patrol_2(ronin)
	rn10_ronin_patrol(ronin, 2)
end
function rn10_ronin_patrol_3(ronin)
	rn10_ronin_patrol(ronin, 3)
end

function rn10_ronin_patrol(ronin, defense_objective_index)

	local has_rpg_launcher = false
	local moved_to_entrance = false

	-- Maybe equip w/ an Rpg launcher
	local rpg_roll = rand_float(0.0,1.0)
	if (rpg_roll < rn10_get_parameter_value("WAVE_RPG_CHANCE")) then
		inv_item_add("rpg_launcher", 0, ronin) 
		inv_item_equip("rpg_launcher", ronin)
		has_rpg_launcher = true	
	end

	-- DEBUG
	if (Debug_ronin == "") then
		Debug_ronin = ronin
	end

	-- attack player on sight
	set_attack_player_flag(ronin,true)

	-- disable hearing
	npc_hearing_enable(ronin,false)
	
	-- how long to spend attacking player before checking for a new target
	local min_attack_time = 4.0
	local max_attack_time = 10.0

	-- objective target being attacked, position from which it is attacked
	local objective_target = ""
	local attack_position = ""

	while(not character_is_dead(ronin)) do

		-- See if there is a player that should be attacked.
		local player_to_attack = rn10_get_player_to_attack(ronin)
		--local player_to_attack = nil

		-- If so, then attack the player.
		if (player_to_attack ~= nil) then

			-- Do some book keeping.
			if (objective_target ~= "") then
				Target_attack_position_occupants[attack_position] = nil
				objective_target = ""
				attack_position = ""
			end

			-- Attack the player for a bit. The always sees player flag ensures that the 
			-- player can't get everyone's attention and go hide in a corner.
			local attack_time = rand_float(min_attack_time, max_attack_time)
			set_always_sees_player_flag(ronin,true)
			attack(ronin, player_to_attack, false)
			delay(min_attack_time, max_attack_time)

			-- Clear the flag so that the Ronin might go back to attacking the pillar.		
			set_always_sees_player_flag(ronin,false)

		-- attack objective
		else

			-- If we already have a target, then attack it.
			if (objective_target ~= "") then

				-- move to the attack position... don't retry on failure, can shoot as we go
				move_to(ronin,attack_position,2,false, true)


				-- Check again, objective may have completed while pathfinding
				if (objective_target ~= "") then
					-- If the Ronin doesn't have an rpg launcher, then they might use a grenade or a molotov.
					local thrown_weapon = ""
					if (not has_rpg_launcher) then

						-- Maybe select a thrown weapon
						local grenade_roll = rand_float(0.0,1.0)
						if (grenade_roll < rn10_get_parameter_value("WAVE_GRENADE_CHANCE")) then
							thrown_weapon = "grenade"		
						else
							local molotov_roll = rand_float(0.0,1.0)
							if (molotov_roll < rn10_get_parameter_value("WAVE_MOLOTOV_CHANCE")) then
								thrown_weapon = "molotov"
							end
						end

					end

					-- I can't really detect when a shot has hit the pillar, so make sure
					-- that the Ronin don't miss it.
					set_perfect_aim(ronin,true)
					if (thrown_weapon ~= "") then
					
						inv_item_add(thrown_weapon, 1, ronin)
						inv_item_equip(thrown_weapon, ronin)
						force_throw(ronin, objective_target)
						npc_unholster_best_weapon(ronin)

					-- Didn't throw an explosive, better shoot
					else

						local shots_to_fire = 1

						if (not has_rpg_launcher) then
							shots_to_fire = rand_int(1,3)
						end
						for i=1, shots_to_fire, 1 do
							force_fire(ronin, objective_target, true)
						end
					end
					set_perfect_aim(ronin,false)

					-- Damage the pillar
					local damage_dealt = 0.0
					if (has_rpg_launcher) then
						damage_dealt = rand_int(90,180)
					elseif (thrown_weapon == "grenade") then
						damage_dealt = rand_int(60,120)
					elseif (thrown_weapon == "molotov") then
						damage_dealt = rand_int(40,80)
					else 
						damage_dealt = rand_int (35,50)
					end

					Pillar_max_hit_points[defense_objective_index] = 
						Pillar_max_hit_points[defense_objective_index] - damage_dealt
					if(Pillar_max_hit_points[defense_objective_index] <= 0) then
						Pillar_max_hit_points[defense_objective_index] = 0
					end
					hud_bar_set_value(0, Pillar_max_hit_points[defense_objective_index], SYNC_ALL )

					if (Pillar_max_hit_points[defense_objective_index] == 0) then
						rn10_failure_support_collapse()
					end

					local all_shots_fired_delay = rand_float (0.4,1.0)
					if (thrown_weapon ~= "" or has_rpg_launcher) then
						all_shots_fired_delay = all_shots_fired_delay * 5.0
					end
					delay(all_shots_fired_delay)
				end

			-- else, if we haven't moved to the spawn location's exit, do that first.
			-- move to the spawn location's exit ... don't retry on failure, can shoot as we go
			elseif (not moved_to_entrance) then
				move_to(ronin,Spawn_area_exits[ronin],2,true, true)
				moved_to_entrance = true

			-- Find a target and move to a non-occupied position from which to attack it.
			else

				-- Find the closest target
				local closest_target = ""
				local closest_dist	= 0
				for i, ai_target in pairs(DEFENSE_OBJECTIVES[defense_objective_index]["ai targets"]) do
					local cur_dist = get_dist(ronin, ai_target)
					if (cur_dist < closest_dist or closest_target == "") then
						closest_dist = cur_dist
						closest_target = ai_target
					end
				end
				objective_target = closest_target

				-- Find the closest unoccupied attack position for that target
				local closest_attack_position = ""
				closest_dist = 0
				for i, attack_position in pairs(TARGET_ATTACK_POSITIONS[objective_target]) do
					if (Target_attack_position_occupants[attack_position] == nil) then
						local cur_dist = get_dist(ronin, attack_position)
						if (cur_dist < closest_dist or closest_attack_position == "") then
							closest_dist = cur_dist
							closest_attack_position = attack_position
						end					
					end
				end
				attack_position = closest_attack_position

				-- Mark the position as occupied even though we're not there yet. We don't want
				-- everyone trying to get into the same spot.
				Target_attack_position_occupants[attack_position] = ronin

				-- move to the attack position... don't retry on failure, can shoot as we go
				move_to(ronin,attack_position,2,false, true)

			end

		end		

		thread_yield()

	end

end

-- Gets the next player to attack (returns nil if should attack objective) 
function rn10_get_player_to_attack(ronin)

	-- TODO... maybe prefer attacking player working on this objective?

	-- These two variables define a range w/in which the player may be attacked. If closer,
	-- he'll definitely be attacked. If further, he might be. Combat is _not_ disabled, so the
	-- Ronin might attack if the player is spotted form further away.
	local always_attack_player_dist = 3.0
	local ignore_player_dist = 8.0

	-- Always attack the objective if the player is too far away. Always attack player if they are very close.
	local dist, closest_player = get_dist_closest_player_to_object(ronin)
	if (dist > ignore_player_dist) then
		return nil
	elseif (dist < always_attack_player_dist) then
		return closest_player

	-- Otherwise, scale the chance of attacking the player depending on the distance between them
	else

		-- Convert distance to player to a probability that they will be attacked
		local attack_chance = dist - always_attack_player_dist
		attack_chance = dist / (ignore_player_dist - always_attack_player_dist)

		local roll = rand_float(0.0,1.0)
		if ( roll < attack_chance) then
			return closest_player
		else
			return nil
		end

	end -- ends if (dist > ignore_player_dist)

end

-- TODO: have the following function use the preferred starting location for the initial spawns.

-- Find a navpoint at which we can safely (without popping) spawn a Ronin.
--
-- defense_objective_index: the index of the defense objective that the spawned ronin will attack
--
-- returns spawn_navpoint, spawn_location_index
-- 
--		spawn_navpoint: navpoint at which to spawn
--		spawn_location_index: index of the spawn location that contains spawn_navpoint
function rn10_get_safe_spawn(defense_objective_index)

	local spawn_location_index_to_return = nil
	local navpoint_to_return = nil

	-- Indices of spawn locations that are currently safe
	local safe_spawn_location_indices = {}
	local num_safe_spawn_locations = 0;

	-- Add spawn locations to the list if they are near the objective and not occupied by a player.
	for i, spawn_location_index in pairs(DEFENSE_OBJECTIVES[defense_objective_index]["spawn locations"]) do

		if (Num_players_in_spawn_locations[spawn_location_index] == 0) then

			num_safe_spawn_locations = num_safe_spawn_locations + 1
			safe_spawn_location_indices[num_safe_spawn_locations] = spawn_location_index			

		end

	end

	-- Can't do anything if there are no safe spawn areas.
	if (num_safe_spawn_locations == 0) then
		return navpoint_to_return, spawn_location_index_to_return
	end

	-- Select a random safe spawn area
	spawn_location_index_to_return = safe_spawn_location_indices[rand_int(1,num_safe_spawn_locations)]

	-- Select a navpoint
	local next_navpoint_index = Spawn_locations_next_navpoint_index[spawn_location_index_to_return]
	if (next_navpoint_index == nil) then
		next_navpoint_index = 1
	end
	navpoint_to_return = SPAWN_LOCATIONS[spawn_location_index_to_return]["navpoints"][next_navpoint_index]

	-- Increment next navpoint index for this spawn location
	next_navpoint_index = next_navpoint_index + 1
	if (	next_navpoint_index > 
			sizeof_table(SPAWN_LOCATIONS[spawn_location_index_to_return]["navpoints"])) then

			next_navpoint_index = 1
	end
	Spawn_locations_next_navpoint_index[spawn_location_index_to_return] = next_navpoint_index

	return navpoint_to_return, spawn_location_index_to_return

end

-- Handle the death of an attacking Ronin.
function rn10_cleanup_ronin(ronin)
	--marker_remove_npc(ronin)
	if (Ronin_patrol_threads[ronin] ~= nil) then
		thread_kill(Ronin_patrol_threads[ronin])
		Ronin_patrol_threads[ronin] = nil
	end
end

-- Handle the respawning of an attacking Ronin.
function rn10_respawn_ronin(ronin)

	-- keep the ronin hidden for now
	character_hide(ronin)

	-- Make sure that we don't have this ronin listed as occupying an attack position
	for attack_position, occupant in pairs(Target_attack_position_occupants) do
		if (occupant == ronin) then
			Target_attack_position_occupants[attack_position] = nil
		end
	end

	-- Update the count of living ronin
	local defense_objective_index = Ronin_defense_objective_targeted[ronin]
	Num_living_attackers[defense_objective_index] = Num_living_attackers[defense_objective_index] - 1

	-- Make this ronin available for spawning again
	delay(.5)
	Ronin_defense_objective_targeted[ronin] = nil
	Spawnable_ronin[ronin] = true

end

-- Stage 2 functions

function rn10_akuji()

	group_create_hidden(GROUP_RONIN_STAGE_2)

	--disable Chainsaws for Boss Battle
	if inv_has_item("chainsaw", LOCAL_PLAYER) then
		inv_weapon_disable_slot(WEAPON_SLOT_MELEE)
	end
	
	-- Setup Akuji
	
		--Override akuji's persona lines
		persona_override_character_start(CHARACTER_AKUJI, POT_SITUATIONS[POT_ATTACK],"KAZUO_RON10_ATTACK")
		persona_override_character_start(CHARACTER_AKUJI, POT_SITUATIONS[POT_TAKE_DAMAGE],"KAZUO_RON10_TAKEDAM")

		-- During faux boss battle, handle Akuji taking damage in script
		turn_invulnerable(CHARACTER_AKUJI, false)
		on_take_damage("rn10_akuji_damaged",CHARACTER_AKUJI)

		-- Set Akuji's health and display his health bar.
		set_max_hit_points( CHARACTER_AKUJI, rn10_get_parameter_value("AKUJI_HIT_POINTS") )
		damage_indicator_on(0,CHARACTER_AKUJI,0.0, HELPTEXT_HUD_AKUJI_HEALTH)

		-- Not using boss ai for now.	
		--npc_set_boss_type(CHARACTER_AKUJI, AI_BOSS_AKUJI)
		character_set_cannot_be_grabbed(CHARACTER_AKUJI, true)
		set_cant_flee_flag(CHARACTER_AKUJI, true)
		character_prevent_flinching(CHARACTER_AKUJI, true)

		-- Akuji attacks everything in sight
		set_attack_peds_flag(CHARACTER_AKUJI, true)
		set_always_sees_player_flag(CHARACTER_AKUJI,true)
		attack(CHARACTER_AKUJI)

		-- And he uses a sword.
		if (AKUJI_USE_SWORD) then
			set_blitz_flag(CHARACTER_AKUJI, true)
			inv_item_remove_all(CHARACTER_AKUJI)
			inv_item_add("samurai_sword", 1, CHARACTER_AKUJI) 
			inv_item_equip("samurai_sword",CHARACTER_AKUJI)
			npc_weapon_pickup_override(CHARACTER_AKUJI,false)
		end

		vehicle_enter_teleport(CHARACTER_AKUJI,"rn10_$v000",0)
	
	-- Setup Akuji's lieutenants
	
		set_max_hit_points( "rn10_$c020", rn10_get_parameter_value("AKUJI_LTNT_HIT_POINTS") )
		set_max_hit_points( "rn10_$c021", rn10_get_parameter_value("AKUJI_LTNT_HIT_POINTS") )
		set_max_hit_points( "rn10_$c022", rn10_get_parameter_value("AKUJI_LTNT_HIT_POINTS") )
		vehicle_enter_teleport("rn10_$c020","rn10_$v001",0)
		vehicle_enter_teleport("rn10_$c021","rn10_$v002",0)
		vehicle_enter_teleport("rn10_$c022","rn10_$v003",0)

	-- Wait for loading to finish, then have the Ronin attack and make them visible

		while (not group_is_loaded(GROUP_RONIN_STAGE_2) ) do
			thread_yield()
		end
	
		group_show(GROUP_RONIN_STAGE_2)

		-- Returns a random player
		local function rn01_player_to_chase()
			local player = LOCAL_PLAYER
			if (IN_COOP) then
				if (rand_int(1,2) == 2) then
					player = REMOTE_PLAYER
				end
			end
			return player
		end

		vehicle_chase("rn10_$v000", rn01_player_to_chase(), true, true)
		vehicle_chase("rn10_$v001", rn01_player_to_chase(), true, true)
		vehicle_chase("rn10_$v002", rn01_player_to_chase(), true, true)
		vehicle_chase("rn10_$v003", rn01_player_to_chase(), true, true)

	-- Tell the player(s) to kill Akuji and add the kill icon/effect
	mission_help_table(HELPTEXT_PROMPT_KILL_AKUJI)
	marker_add_npc(CHARACTER_AKUJI, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL) 

	-- Wait for Akuji to run away.
	while( not Akuji_fleeing) do
		thread_yield()
	end	

end

-- Handle Akuji taking damage.
function rn10_akuji_damaged(akuji, attacker, damage_percent)

	local new_hit_points = damage_percent * get_max_hit_points(akuji)

	-- Make sure Akuji always has at least a sliver of health
	if (new_hit_points < 100) then
		new_hit_points = 100
	end

	set_current_hit_points(CHARACTER_AKUJI, new_hit_points)

	if (	damage_percent < rn10_get_parameter_value("AKUJI_FLEE_HEALTH_RATIO") ) then
		character_ragdoll(akuji)
		Akuji_fleeing = true
	end

end

-- Other functions

function rn10_cleanup()

	IN_COOP = coop_is_active()

	hud_timer_stop(0)

	local function cleanup_battle_group(group_members)
		for i, npc in pairs(group_members) do
			if (character_exists(npc) and (not character_is_dead(npc))) then
				on_death("", npc)
			end
		end
	end

	cleanup_battle_group(MEMBERS_GROUP_CHAOS_RONIN_1, MEMBERS_GROUP_CHAOS_SAINTS_1, MEMBERS_GROUP_CHAOS_RONIN_2, MEMBERS_GROUP_CHAOS_SAINTS_2)
	
	--re-enable all weapons
	inv_weapon_enable_or_disable_all_slots(true, SYNC_ALL)

	-- Don't worry about showing the shanties... it was causing them to fall through the world for some reason.
	--rn10_show_shanties()

	-- End persona overrides
	persona_override_group_stop(RONIN_PERSONAS,POT_SITUATIONS[POT_ATTACK])

	-- kill ronin patrol threads
	for i,thread in pairs(Ronin_patrol_threads) do
		if(thread ~= nil) then
			thread_kill(thread)
		end
	end

	-- reset global variables

		-- Reset the respawn distance
		npc_respawn_dist_reset()

	-- reset notoriety
		
	-- remove markers
		
		for i, ronin in pairs(MEMBERS_GROUP_RONIN_STAGE_1) do
			--marker_remove_npc(ronin)
			on_respawn("",ronin)
			on_death("",ronin)
		end

	-- remove callbacks

		-- disable all triggers, remove callbacks, remove from map
		for i, trigger in pairs(TABLE_ALL_TRIGGERS) do
			on_trigger("",trigger)
			trigger_enable(trigger,false)
			marker_remove_trigger(trigger)
		end
		for i, defense_objective in pairs(DEFENSE_OBJECTIVES) do
			on_trigger("", defense_objective["trigger"])
			trigger_enable(defense_objective["trigger"], false)
			marker_remove_trigger(defense_objective["trigger"])
		end
		for i, spawn_location in pairs(SPAWN_LOCATIONS) do

			for j, trigger in pairs(spawn_location["triggers"]) do
				trigger_enable(trigger, false)
				on_trigger("", trigger)
				on_trigger_exit("", trigger)
				marker_remove_trigger(trigger)
			end

		end

	-- clear the hud
		damage_indicator_off(0)
		hud_bar_off(0)
		--objective_text_clear(0)	
end

function rn10_success()
	-- Called when the mission has ended with success
end

function rn10_complete()

	-- End the mission with success
	mission_end_success(MISSION_NAME, CUTSCENE_OUT)
end

-- Get the value of the mission parameter.
--
-- parameter	Mission parameter whose value the function should return
--	i				If the parameter is a table, then i indexes the entry that should be returned
--
-- Returns mission paramater value.
function rn10_get_parameter_value(parameter, i)

	local return_val = nil

	-- Check for a coop value:
	if (IN_COOP) then
		if (i) then
			if (rn10_PARAMETERS["COOP_" .. parameter] ~= nil) then
				return_val = rn10_PARAMETERS["COOP_" .. parameter][i]
			end
		else
			return_val = rn10_PARAMETERS["COOP_" .. parameter]
		end
	end

	-- If no coop value was found, then return the standard value.
	if (return_val == nil) then
		if (i) then
			if (rn10_PARAMETERS[parameter] ~= nil) then
				return_val = rn10_PARAMETERS[parameter][i]
			end
		else
			return_val = rn10_PARAMETERS[parameter]
		end
	end

	return return_val
end


Battle_max_living = 12
Battle_living = 0
Battle_saints_living = {}
Battle_ronin_living = {}
Battle_member_to_group = {}

function rn10_respawning_battles()

	local rn10_battles = 
		{
			{GROUP_CHAOS_RONIN_1, GROUP_CHAOS_SAINTS_1, MEMBERS_GROUP_CHAOS_RONIN_1, MEMBERS_GROUP_CHAOS_SAINTS_1},
			{GROUP_CHAOS_RONIN_2, GROUP_CHAOS_SAINTS_2, MEMBERS_GROUP_CHAOS_RONIN_2, MEMBERS_GROUP_CHAOS_SAINTS_2},
		}

	local function can_start_battle(ronin_group, saints_group, ronin_members, saints_members)

		-- Can't restart the battle if there are already npcs spawned from a previous instance
		if ( Battle_saints_living[saints_group] ~= nil ) then
			if (Battle_saints_living[saints_group] > 0) then
				return false
			end
		end
		if ( Battle_ronin_living[ronin_group] ~= nil ) then
			if ( Battle_ronin_living[ronin_group] > 0) then
				return false
			end
		end

		-- Can't start the battle if too many battle npcs will be created
		local num_ronin = sizeof_table(ronin_members)
		local num_saints = sizeof_table(saints_members)
		if (num_ronin + num_saints + Battle_living > Battle_max_living) then
			return false
		end
	
		-- If the game is faded out, don't need to do fov checks
		if(fade_get_percent() > .99) then
			return true
		end
		-- Can start battle if everyone is outside of fov
		local min_dist = rn10_get_parameter_value("BATTLE_RESPAWN_DIST")
		for i, ronin in pairs(ronin_members) do
			if (rn10_navpoint_in_fov(ronin, 1.5) or (get_dist_closest_player_to_object(ronin) < min_dist)) then
				return false
			end
		end
		for i, saint in pairs(saints_members) do
			if (rn10_navpoint_in_fov(saint, 1.5) or (get_dist_closest_player_to_object(saint) < min_dist)) then
				return false
			end
		end
		return true
	end

	while(true) do

		thread_yield()

		for i, battle in pairs(rn10_battles) do

			if (not group_is_loaded(battle[1])) then
				group_create_hidden(battle[1])
			end
			if (not group_is_loaded(battle[2])) then
				group_create_hidden(battle[2])
			end

			if (can_start_battle(battle[1], battle[2], battle[3], battle[4])) then
				thread_new("rn10_setup_battle", battle[1], battle[2], battle[3], battle[4])
			end

			thread_yield()
		end

	end

end

function rn10_setup_battle(ronin_group, saints_group, ronin_members, saints_members)

	local num_ronin = sizeof_table(ronin_members)
	local num_saints = sizeof_table(saints_members)

	Battle_saints_living[saints_group] = num_saints
	Battle_ronin_living[ronin_group] = num_ronin
	Battle_living = Battle_living + num_ronin + num_saints

	for i,ronin in pairs(ronin_members) do
		on_death("battle_ronin_killed", ronin)
		Battle_member_to_group[ronin] = ronin_group
	end
	for i,saint in pairs(saints_members) do
		on_death("battle_saint_killed", saint)
		Battle_member_to_group[saint] = saints_group
	end

	group_show(ronin_group)
	group_show(saints_group)

	for i,ronin in pairs(ronin_members) do
		attack(ronin, saints_members[rand_int(1,num_saints)])
	end
	for i,saint in pairs(saints_members) do
		attack(saint, ronin_members[rand_int(1,num_ronin)])
	end

	while(Battle_saints_living[saints_group] > 0 and Battle_ronin_living[ronin_group] > 0) do
		thread_yield()
	end

	if (Battle_saints_living[saints_group] == 0) then 
		release_to_world(saints_group)
	else
		-- Find the set of living Ronin
		local living_ronin = {}
		local num_living_ronin = 0
		for ronin, spawnable in pairs(Spawnable_ronin) do
			if ( (not spawnable) and character_exists(ronin) and (not character_is_dead(ronin)) ) then
				num_living_ronin = num_living_ronin + 1
				living_ronin[num_living_ronin] = ronin
			end
		end

		for i,saint in pairs(saints_members) do
			-- Find the closest living Ronin to attack
			local nearest_ronin = ""
			local nearest_ronin_dist = 1000
			for i, ronin in pairs(living_ronin) do
				local cur_dist = get_dist(ronin, saint)
				if (cur_dist < nearest_ronin_dist) then
					nearest_ronin_dist = cur_dist
					nearest_ronin = ronin
				end
			end
			if (nearest_ronin ~= "") then
				attack(nearest_ronin)
			end
		end
		while(not Battle_saints_living[saints_group] == 0) do
			thread_yield()
		end
	end

	if (Battle_ronin_living[ronin_group] == 0) then
		release_to_world(ronin_group)
	else
		for i,ronin in pairs(ronin_members) do
			if(character_exists(ronin) and (not character_is_dead(ronin))) then
				attack(ronin)
			end
		end		
		while(Battle_ronin_living[ronin_group] ~= 0) do
			thread_yield()
		end
	end

end

function battle_saint_killed(saint)

	local group = Battle_member_to_group[saint]
	if (Battle_saints_living[group] == 1) then
		release_to_world(group)
		group_create_hidden(group, true)
	end
	Battle_saints_living[group] = Battle_saints_living[group] - 1
	Battle_living = Battle_living - 1
end

function battle_ronin_killed(ronin)

	local group = Battle_member_to_group[ronin]
	if (Battle_ronin_living[group] == 1) then
		release_to_world(group)
		group_create_hidden(group, true)
	end
	Battle_ronin_living[group] = Battle_ronin_living[group] - 1
	Battle_living = Battle_living - 1
end

--[[
Rn10_stationary_battle_max_attackers = 12
Rn10_stationary_battle_attackers = 0
MAX_STATIONARY_BATTLE_SPAWN_DIST = 150
MIN_STATIONARY_BATTLE_SPAWN_DIST = 50
function rn10_chaos_stationary_battles()

	while(true) do
		
		thread_yield()

		-- Look for a battle that isn't already spawned, is out of sight, and relatively close by.
		for i,battle in pairs(STATIONARY_BATTLES) do

			local can_spawn = not group_exists(battle["saints"])
			local num_npcs = sizeof_table(battle["saints"]) + sizeof_table(battle["ronin"])

			if (can_spawn) then				
				if ( num_npcs + Rn10_stationary_battle_attackers  > Rn10_stationary_battle_max_attackers) then
					can_spawn = false
				end
			end

			local function can_spawn_npc(npc)
				local in_sight = rn10_navpoint_in_fov(npc)
				local dist = get_dist_closest_player_to_object( npc)
				local too_far = dist > MAX_STATIONARY_BATTLE_SPAWN_DIST
				local too_close = dist < MIN_STATIONARY_BATTLE_SPAWN_DIST
				if (in_sight or too_far or too_close) then
					return false
				end
				return true
			end

			if (can_spawn) then
				for i,saint in pairs(battle["saints"])
					if (not can_spawn_npc(saint)) then
						can_spawn = false
						break
					end
				end
			end

			if (can_spawn) then
				for i,ronin in pairs(battle["ronin"])
					if (not can_spawn_npc(ronin)) then
						can_spawn = false
						break
					end
				end
			end

			if (can_spawn) then
		
				Rn10_stationary_battle_attackers = Rn10_stationary_battle_attackers + num_npcs

				group_create_hidden(battle["group"])
				for i, ronin in pairs(battle["ronin"])
					on_death("rn10_battle_member_killed")
				end
				for i, saint in pairs(battle["saint"])
					on_death("rn10_battle_member_killed")
				end
				group_show(battle["group"]

			end

		end
	end

end

function rn10_battle_member_killed(member)
	on_death("", member)
	Rn10_stationary_battle_attackers = Rn10_stationary_battle_attackers - 1
end

function rn10_despawn_battles()

	while(true) do
		
		-- If everyone in a battle is dead, release the group to the world
		for i,battle in pairs(STATIONARY_BATTLES) do

			if (group_is_loaded(battle["group"])) then

				local all_ronin_dead = true
				for i, ronin in pairs(battle["ronin"])
					if (not character_is_dead(ronin)) then
						all_ronin_dead = false
						break
					end
				end

				local all_saints_dead = true
				for i, saint in pairs(battle["saint"])
					if (not character_is_dead(saint)) then
						all_saints_dead = false
						break
					end
				end

				if(all_ronin_dead and all_saints_dead) then
					release_to_world(battle["group"])
				end

			end

		end
	end

end
]]

function rn10_navpoint_in_fov(navpoint, radius)

	local navpoint_in_local_fov = navpoint_in_player_fov(navpoint, LOCAL_PLAYER, radius)
	local navpoint_in_remote_fov = false
	if (IN_COOP) then
		navpoint_in_remote_fov = navpoint_in_player_fov(navpoint, REMOTE_PLAYER, radius)
	end

	return (navpoint_in_local_fov or navpoint_in_remote_fov)

end

function rn10_group_create_maybe_coop(group_always, group_coop, blocking)
	group_create(group_always, blocking)
	if (IN_COOP) then
		group_create(group_coop, blocking)
	end
end

function rn10_group_loaded_maybe_coop(group_always, group_coop)
	local group_always_is_loaded = group_is_loaded(group_always)
	if (IN_COOP) then
		return (group_always_is_loaded and group_is_loaded(group_always))
	else
		return group_always_is_loaded
	end
end

function rn10_group_create_hidden_maybe_coop(group_always, group_coop)
	group_create_hidden(group_always)
	if (IN_COOP) then
		group_create_hidden(group_coop)
	end
end

function rn10_group_show_maybe_coop(group_always, group_coop)
	group_show(group_always)
	if (IN_COOP) then
		group_show(group_coop)
	end
end

-- MISSION FAILURE FUNCTIONS --------------------------------

function rn10_failure_gat_abandoned()
	-- End the mission, Gat abandoned
	delay(2.0)
	mission_end_failure(MISSION_NAME, HELPTEXT_FAILURE_GAT_ABANDONED)
end

function rn10_failure_gat_died()
	-- End the mission, Gat died
	delay(2.0)
	mission_end_failure(MISSION_NAME, HELPTEXT_FAILURE_GAT_DIED)
end

function rn10_failure_pierce_abandoned()
	-- End the mission, Pierce abandoned
	delay(2.0)
	mission_end_failure(MISSION_NAME, HELPTEXT_FAILURE_PIERCE_ABANDONED)
end

function rn10_failure_pierce_died()
	-- End the mission, Pierce died
	delay(2.0)
	mission_end_failure(MISSION_NAME, HELPTEXT_FAILURE_PIERCE_DIED)
end

function rn10_failure_support_collapse()
	-- End the mission, a support pillar has collapsed
	camera_shake_start(0.03,2000,2000)
	mission_end_failure(MISSION_NAME, HELPTEXT_FAILURE_SUPPORT_COLLAPSED)
end