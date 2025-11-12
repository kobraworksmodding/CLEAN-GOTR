-- rn04.lua
-- SR2 mission script
-- 3/28/07

-- Global constants ( ALL_CAPS means that they shouldn't be modified in running code, except for maybe	group_create_hidden(group) in a setup function )

	DEBUG_TEXT_NUM_LIVING			= 1
	DEBUG_TEXT_RESPAWN_COUNT		= 2
	DEBUG_TEXT_RESPAWN_LOCATION	= 3	

	DEBUG_TEXT_ENABLED = {
		[DEBUG_TEXT_NUM_LIVING]			=	false,
		[DEBUG_TEXT_RESPAWN_COUNT]		=	false,
		[DEBUG_TEXT_RESPAWN_LOCATION] =	false,
	}
	
	DEBUG_SKIP_CHURCH_JUMP  = false -- If true, church jump is skipped

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
			RN04_PARAMETERS	= 
				{	
					-- Parameters used in both stages
							["HOMIE_VEHICLE_SPEED_OVERRIDE"]		= 65,		-- Speed of the homie's vehicle
							["HOMIE_VEHICLE_HEALTH_MULTIPLIER"]	= 4,	-- Health multiplier of the homie's vehicle

					-- Stage 1, defend the house

						-- single-player values
							["GAT_HIT_POINTS"]				= 5000,	-- How many hit points Gat has
							["MIN_RONIN_NOTORIETY"]			= 2,		-- Minimum Ronin notoriety during the defend Gat stage
							["MAX_RONIN_NOTORIETY"]			= 2,		-- Maximum Ronin notoriety during the defend Gat stage
							["PLAYER_DIALOGUE_DELAY_S"]	= 45,		-- 60 Delay before player says "Where the hell is that ambulance!" 
							["CELL_PHONE_DELAY_S"]			= 5,		-- Delay between player's dialogue and phone call
							["WAVE_MIN_SIZE"]					= 2,		-- Min number of Ronin to attack in one wave
							["WAVE_MAX_SIZE"]					= 3,		-- Max number of Ronin to attack in one wave
							["WAVE_MIN_DELAY_S"]				= 6,		-- Min delay between waves
							["WAVE_MAX_DELAY_S"]				= 10,		-- Max delay between waves
							["MAX_LIVING"]						= 6,		-- Maximum number of Ronin that can be alive at one time

						-- coop values
							["COOP_MIN_RONIN_NOTORIETY"]			= 3,
							["COOP_MAX_RONIN_NOTORIETY"]			= 3,
							["COOP_WAVE_MIN_SIZE"]					= 3,
							["COOP_WAVE_MAX_SIZE"]					= 5,
							["COOP_WAVE_MIN_DELAY_S"]				= 2,
							["COOP_WAVE_MAX_DELAY_S"]				= 4,
							["COOP_MAX_LIVING"]						= 10,

					-- Stage 2, hospital drive part 1
					
						-- single-player values
							["MIN_RONIN_NOTORIETY_DRIVE"]	= 3,		-- Minimum Ronin notoriety while driving to the hospital
							["MAX_RONIN_NOTORIETY_DRIVE"]	= 4,		-- Maximum Ronin notoriety while driving to the hospital
							["BIKE_CHASE_SPEED"]				= 75,		-- Speed of Ronin chasing the players on bikes
							["CAR_CHASE_SPEED"]				= 75,		-- Speed of Ronin chasing the players in cars
							["BIKE_CHASE_HP"]					= 800,	-- Speed of Ronin chasing the players on bikes
							["CAR_CHASE_HP"]					= 1600,	-- Speed of Ronin chasing the players in cars
							["MAX_CHASE_VEHICLES"]			= 5,		-- Limits # vehicles chasing players at any time
							["CHASE_TRAFFIC_DENSITY"]		= .40,	-- Traffic desnity during the chase

						-- coop values
							["COOP_MIN_RONIN_NOTORIETY_DRIVE"]	= 4,
							["COOP_MAX_RONIN_NOTORIETY_DRIVE"]	= 5,
							["COOP_BIKE_CHASE_HP"]			= 1200,	-- Speed of Ronin chasing the players on bikes
							["COOP_CAR_CHASE_HP"]			= 2400,	-- Speed of Ronin chasing the players in cars
							["COOP_MAX_CHASE_VEHICLES"]	= 8
				}

	-- COOP MISSION? -- 
		IN_COOP	= false

	-- CHARACTERS --

		CHARACTER_GAT		= "rn04_$Cgat"
		CHARACTER_HOMIE	= "rn04_$Chomie"

	-- CONVERSATIONS
	   DELIRIOUS_CONVERSATION =
		{
			{ "RON4_DELERIUM_L1", CHARACTER_GAT, 1 },
			{ "PLAYER_RON4_DELERIUM_L2", LOCAL_PLAYER, 1 },
			{ "RON4_DELERIUM_L3", CHARACTER_GAT, 1 },
			{ "RON4_DELERIUM_L4", CHARACTER_HOMIE, 1 },
			{ "PLAYER_RON4_DELERIUM_L5", LOCAL_PLAYER, 1 },
		}

	   HOMIE_PHONE_CONVERSATION =
		{
			{ "PLAYER_RON4_COME_L1", LOCAL_PLAYER, 1 },
			{ "RON4_COME_L2", CELLPHONE_CHARACTER, 1 },
		}


	-- CHECKPOINTS
		
		CHECKPOINT_START						= MISSION_START_CHECKPOINT			-- defined in ug_lib.lua
		CHECKPOINT_DRIVE					= "rn04_checkpoint_drive"
		
	-- GROUPS --

		GROUP_GAT							= "rn04_$Ggat"
		GROUP_START_VEHICLES				= "rn04_$Gstart_vehicles"
		GROUP_HOMIE							= "rn04_$Ghomie"
		GROUP_STAGE_1_RONIN				= "rn04_$Gstage_1_ronin"
		GROUP_STAGE_1_RONIN_VEHICLES	= "rn04_$Gstage_1_ronin_vehicles"
		GROUP_CHASE_0						= "rn04_$Gchase_0"
		GROUP_CHASE_1						= "rn04_$Gchase_1"
		GROUP_ROADBLOCK_1					= "rn04_$Groadblock_1"
		GROUP_ROADBLOCK_2					= "rn04_$Groadblock_2"
		GROUP_ROADBLOCK_3					= "rn04_$Groadblock_3"


	-- GROUP MEMBER TABLES -- 
	
		MEMBERS_GROUP_STAGE_1_RONIN		=	{	"rn04_$c000", "rn04_$c001", "rn04_$c002", "rn04_$c003", "rn04_$c004",
															"rn04_$c005", "rn04_$c006", "rn04_$c007", "rn04_$c008", "rn04_$c009",
															"rn04_$c010", "rn04_$c011", "rn04_$c012", "rn04_$c013", "rn04_$c014",
															"rn04_$c015"}
	-- HELPTEXT

		-- Failure conditions

			HELPTEXT_FAILURE_CAR_DESTROYED	= "rn04_failure_car_destroyed"	-- "Car destroyed."
			HELPTEXT_FAILURE_GAT_DIED			= "rn04_failure_gat_died"		
			HELPTEXT_FAILURE_GAT_ABANDONED	= "rn04_failure_gat_abandoned"

		-- Stage 1 

			HELPTEXT_PROMPT_DEFEND_GAT			= "rn04_prompt_defend_gat"			-- "Protect Gat til the ambulance arrives."

			--HELPTEXT_DIALOGUE_PLAYER_WHERE	= "rn04_dialogue_player_where"	-- "Playa: What the fuck is taking so long?" X
			--HELPTEXT_DIALOGUE_GAT_HEALTH_80	= "rn04_dialogue_gat_health_80"	-- "Gat: Tis but a flesh wound." X
			--HELPTEXT_DIALOGUE_GAT_HEALTH_40	= "rn04_dialogue_gat_health_40"	-- "Gat: Johnny Gat always triumphs! Have at you! Come on then." X
			--HELPTEXT_DIALOGUE_GAT_HEALTH_10	= "rn04_dialogue_gat_health_10"	-- "Gat: I'll bite your les off!." X

			HELPTEXT_HUD_AMBULANCE_TIMER		= "rn04_hud_ambulance_timer"		-- "Time until ambulance arrival" X
			HELPTEXT_HUD_GAT_HEALTH				= "rn07_hud_gat_health"				-- "Johnny Gat's Health"

			HELPTEXT_PROMPT_KEEP_WAITING		= "rn04_prompt_keep_waiting"		-- "Keep waiting til help comes." X
			HELPTEXT_PROMPT_GAT_HEALTH_50		= "rn04_prompt_gat_health_50"		-- "Gat is not looking good." X
			HELPTEXT_PROMPT_GAT_HEALTH_30		= "rn04_prompt_gat_health_30"		-- "Gat is barely hanging on." X
			HELPTEXT_PROMPT_CLEAR_AREA			= "rn04_prompt_clear_area"			-- "Clear out the area before help arrives." X
			HELPTEXT_PROMPT_CAR_ARIIVAL		= "rn04_prompt_car_arrival"		-- "Help has arrived." X

		-- Stage 2

			HELPTEXT_HUD_CAR_HEALTH				= "rn04_hud_car_health"				-- "Car Health"

			HELPTEXT_PROMPT_DEFEND_CAR			= "rn04_prompt_defend_car"			-- "Protect the car from Ronin until you get to the hospital." X
			HELPTEXT_PROMPT_GAT_DELIRIOUS		= "rn04_prompt_gat_delirious"		-- "Hurry, Gat's becoming delirious!" X

		-- UNLOCALIZED !!
			HELPTEXT_OBJECTIVE_CLEAR			= "rn05_objective_ltnts"			-- "%s of %s Ronin lieutenants killed"	

	-- MISC CONSTANTS
		RONIN_SAFE_SPAWN_DIST			= 100	 -- Distance at which we can safely spawn Ronin
		RONIN_RESPAWN_TIME_MS			= 250  -- Time in MS before respawning
		RONIN_RESPAWN_DISTANCE			= 0.01 -- Distance corpse must be from player in order to respawn

		WAVE_INITIAL_SPAWN_LOCATIONS = 
			{	
				"rn04_$n100", "rn04_$n101", "rn04_$n102", "rn04_$n103", "rn04_$n104",
				"rn04_$n105", "rn04_$n106", "rn04_$n107", "rn04_$n108", "rn04_$n109"
			}

		WAVE_SPAWN_LOCATIONS = 
			{	
--				{"rn04_$n000", "rn04_$n001", "rn04_$n002", "rn04_$n003", "rn04_$n004"};
				{"rn04_$n005", "rn04_$n006", "rn04_$n007", "rn04_$n008", "rn04_$n009"};
				{"rn04_$n010", "rn04_$n011", "rn04_$n012", "rn04_$n013", "rn04_$n014"};
				{"rn04_$n015", "rn04_$n016", "rn04_$n017", "rn04_$n018", "rn04_$n019"};				
				{"rn04_$n068", "rn04_$n069", "rn04_$n070", "rn04_$n071", "rn04_$n072"};		
			}

		LOCAL_PLAYER_WEAPON				= "rpg_launcher"
		REMOTE_PLAYER_WEAPON				= "rpg_launcher"

		ESCAPE_PATH_PART1	=	{	"rn04_$n074", "rn04_$n033", "rn04_$n034"}
		ESCAPE_PATH_PART2 =	{	"rn04_$n035", "rn04_$n036", "rn04_$n039", "rn04_$n040", "rn04_$n041", "rn04_$n042"}
		ESCAPE_PATH_PART3	=	{	"rn04_$n043", "rn04_$n044", "rn04_$n045"}
		ESCAPE_PATH_PART4 =  {	"rn04_$n046"}
		ESCAPE_PATH_PART5	=	{	"rn04_$n047"}
		ESCAPE_PATH_PART5b=	{	"rn04_$n110", "rn04_$n111", "rn04_$n112", "rn04_$n113", "rn04_$n114", "rn04_$n115", "rn04_$n116"}
		ESCAPE_PATH_PART5c =	{	"rn04_$n052", "rn04_$n021"}
		ESCAPE_PATH_PART6 =	{	"rn04_$n022", "rn04_$n023"}
		ESCAPE_PATH_PART6a=	{	"rn04_$n067", "rn04_$n117", "rn04_$n118"}
		ESCAPE_PATH_PART6b=	{	"rn04_$n119", "rn04_$n120", "rn04_$n121", "rn04_$n122", "rn04_$n123", "rn04_$n124", "rn04_$n125"}
		ESCAPE_PATH_PART6c=	{	"rn04_$n126", "rn04_$n127", "rn04_$n128", "rn04_$n129", "rn04_$n130", "rn04_$n131"}
		ESCAPE_PATH_PART6d=	{	"rn04_$n132", "rn04_$n133", "rn04_$n134", "rn04_$n135", "rn04_$n136", "rn04_$n137"}
		ESCAPE_PATH_PART6e=	{	"rn04_$n138", "rn04_$n139", "rn04_$n140", "rn04_$n141", "rn04_$n142", "rn04_$n143"}
		ESCAPE_PATH_PART7 =	{	"rn04_$n144", "rn04_$n145", "rn04_$n146", "rn04_$n032"}

		HOMIE_ARRIVAL_PATH = {	"rn04_$n073", "rn04_$n024"}

	-- MOVERS

	-- NAVPOINTS
	
		NAVPOINT_ATTACK_LOCATION 		= "rn04_$n147"

		NAVPOINT_LOCAL_PLAYER_START		= "rn04_$Nlocal_player_start"
		NAVPOINT_REMOTE_PLAYER_START		= "rn04_$Nremote_player_start"

		--NAVPOINT_HOMIE_ARRIVAL				= "rn04_$n024"	-- Where the homies park to pick up player(s) & Gat
		NAVPOINT_HOSPITAL_PARKING			= "rn04_$n048" -- Where the homie parks in the hospital parking lot to end the mission.

	-- TRIGGERS -- 
	
		TRIGGER_CHASE_1			= "rn04_$t000"
		TRIGGER_ROADBLOCK_1		= "rn04_$t001"
		TRIGGER_ROADBLOCK_2		= "rn04_$t002"
		TRIGGER_ROADBLOCK_3		= "rn04_$t004"

		-- List of all triggers, makes cleaning up more convenient
		TABLE_ALL_TRIGGERS		= {	TRIGGER_CHASE_1, TRIGGER_ROADBLOCK_1, TRIGGER_ROADBLOCK_2,
												TRIGGER_ROADBLOCK_3}		

	-- VEHICLES --
		VEHICLE_HOMIE_CHOICES	= {	"rn04_$Vhomie1", "rn04_$Vhomie2", "rn04_$Vhomie3", "rn04_$Vhomie4", "rn04_$Vhomie5"}
		--Rn04_vehicle_homie				= "rn04_$Vhomie_new"

	-- VEHICLE SPAWN LOCATIONS (for first sequence attacks)

		VEHICLE_SPAWN_LOCATIONS = 
			{
				{
					["navpoint"] = "rn04_$n076",
					["torque multiplier"] = 2,
					["jump speed"] = 70,
					["jump path"] = {"rn04_$n079"},
					["destination path"] = {"rn04_$n082", "rn04_$n097"},
					["vehicle"] = "rn04_$v014",
				},
				{
					["navpoint"] = "rn04_$n083",
					["destination path"] = {"rn04_$n084", "rn04_$n085", "rn04_$n086", "rn04_$n098"},
					["vehicle"] = "rn04_$v015",
				},
				{
					["navpoint"] = "rn04_$n087",
					["destination path"] = {"rn04_$n088", "rn04_$n089", "rn04_$n090", "rn04_$n091"},
					["vehicle"] = "rn04_$v016",
				},
				{	
					["navpoint"] = "rn04_$n075",
					["torque multiplier"] = 2,
					["jump speed"] = 55,
					["jump path"] = {"rn04_$n080"},
					["destination path"] = {"rn04_$n081"},
					["vehicle"] = "rn04_$v017",
				},
				{
					["navpoint"] = "rn04_$n092",
					["destination path"] = {"rn04_$n093", "rn04_$n094", "rn04_$n099"},
					["vehicle"] = "rn04_$v018",
				},
				{
					["navpoint"] = "rn04_$n095",
					["destination path"] = {"rn04_$n096"},
					["vehicle"] = "rn04_$v019",
				},
			}

	-- CHASE / AMBUSHES

		CHASES_AND_AMBUSHES = 
		{	
		
		["chase_0"]	=	
			{	["type"]			=	"chase",
				["vehicles"]	=	{	["rn04_$v006"]		=	{	["passengers"]	= {	"rn04_$c029"}, 
																			["type"]			= "bike"
																		},
											["rn04_$v007"]		=	{	["passengers"]	= {	"rn04_$c030"}, 
																			["type"]			= "bike"
																		},
										},
				["on_foot"]		=	{},
				-- No trigger, we start this chase immediately
			},

		
		
			["chase_1"]	=	
			{	["type"]			=	"chase",
				["group"]		=	GROUP_CHASE_1,
				["vehicles"]	=	{	["rn04_$v001 (0)"] =	{	["passengers"]	= {	"rn04_$c017 (0)"}, 
																			["type"]			= "car",
																			["jump"]			= true,
																			["delay_s"]		= 2.0,
																		},
											["rn04_$v000"]		=	{	["passengers"]	= {	"rn04_$c016",	"rn04_$c017"}, 
																			["type"]			= "car"
																		},
											["rn04_$v001"]		=	{	["passengers"]	= {	"rn04_$c018"}, 
																			["type"]			= "car"
																		},
										},
				["on_foot"]		= {	"rn04_$c019",	"rn04_$c020"},
				["trigger"]		= TRIGGER_CHASE_1
			},

			["roadblock_1"]	=	
			{	["type"]			=	"roadblock",
				["group"]		=	GROUP_ROADBLOCK_1,
				["vehicles"]	=	{	["rn04_$v002"]	=	{	["passengers"]	= {	"rn04_$c023",	"rn04_$c024"}, 
																		["type"]			= "car"
																	},
											["rn04_$v003"] =	{	["passengers"]	= {	"rn04_$c026"}, 
																		["type"]			= "car"
																	},
											["rn04_$v004"] =	{	["passengers"]	= {	"rn04_$c022",	"rn04_$c025"}, 
																		["type"]			= "car"
																	},
											["rn04_$v005"] =	{	["passengers"]	= {	"rn04_$c028"}, 
																		["type"]			= "bike"
																	},
										},
				["on_foot"]		=	{	"rn04_$c021",	"rn04_$c022",	"rn04_$c023",	"rn04_$c024",	"rn04_$c025",
											"rn04_$c026",	"rn04_$c027",	"rn04_$c028"
										},
				["misfire"]		=	{	["rn04_$c027"]	= "rn04_$n038"
										},
				["trigger"]		=	TRIGGER_ROADBLOCK_1,
			},

			["roadblock_2"]	=	
			{	["type"]			=	"roadblock",
				["group"]		=	GROUP_ROADBLOCK_2,
				["vehicles"]	=	{	["rn04_$v008"]	=	{	["passengers"]	= {	"rn04_$c031"}, 
																		["type"]			= "car"
																	},
											["rn04_$v009"] =	{	["passengers"]	= {	"rn04_$c032",	"rn04_$c033"}, 
																		["type"]			= "car"
																	},
										},
				["on_foot"]		=	{	
										},
				["trigger"]		=	TRIGGER_ROADBLOCK_2,
			},

			["roadblock_3"]	=	
			{	["type"]			=	"roadblock",
				["group"]		=	GROUP_ROADBLOCK_3,
				["vehicles"]	=	{	["rn04_$v010"]	=	{	["passengers"]	= {	"rn04_$c034", "rn04_$c035"}, 
																		["type"]			= "car"
																	},
											["rn04_$v011"] =	{	["passengers"]	= {	"rn04_$c036", "rn04_$c037"}, 
																		["type"]			= "car"
																	},
											["rn04_$v012"] =	{	["passengers"]	= {	"rn04_$c038"}, 
																		["type"]			= "bike"
																	},
											["rn04_$v013"] =	{	["passengers"]	= {	"rn04_$c039", "rn04_$c040"}, 
																		["type"]			= "bike"
																	},
										},
				["on_foot"]		=	{	"rn04_$c034", "rn04_$c035", "rn04_$c036", "rn04_$c037", "rn04_$c038", 
											"rn04_$c039", "rn04_$c040",
										},
				["misfire"]		=	{	["rn04_$c038"]	= "rn04_$n020"
										},
				["trigger"]		=	TRIGGER_ROADBLOCK_3,
			},
		}


-- Progress flags
	Ambulance_timer_expired					= false
	Clearing_ronin								= false -- Are players clearing out Ronin?
	Chase_or_ambush_sent						= false

-- Misc
	Spawning_initial_ronin					= true
	Ronin_to_clear								= 0
	Ronin_cleared								= 0
	Vehicles_attacking						= 0
	Last_complication							= ""
	Spawnable_ronin							= {}
	Spawnable_vehicle							= {}
	Spawn_area_navpoint_index				= {}
	Vehicle_navpoint_index					= 1
	Ragdolling_gat								= true
	Thread_ragdoll_gat						= -1
	Temp_weapons_given						= false

	-- There is a lot of random helptext and I don't want messages to get overriden.
	-- So, I'm queing up messages to be displayed and have a separate thread that 
	-- handles printing to the screen. There are two queuess, one for important
	-- prompts and dialogue and another for the random lines. Messages in the 2nd
	-- queue are only displayed if the first queue is empty.
	Helptext_queue_high_priority			= {}
	Helptext_queue_high_priority_first	= 1	-- Index of the next message to display (Will index a nil value if no messages in queue)
	Helptext_queue_high_priority_last	= 0	-- Index of the last message currently in the queue (Same warning)
	Helptext_queue_low_priority			= {}
	Helptext_queue_low_priority_first	= 1
	Helptext_queue_low_priority_last		= 0
	Last_message_displayed					= ""

function rn04_start(rn04_checkpoint, is_restart)

	mission_start_fade_out()

	if(rn04_checkpoint == CHECKPOINT_START) then

		local start_groups = {GROUP_GAT, GROUP_START_VEHICLES, GROUP_STAGE_1_RONIN, GROUP_STAGE_1_RONIN_VEHICLES}

		if (is_restart) then

			-- Load starting groups
			for i,group in pairs(start_groups) do
				group_create_hidden(group, true)
			end

			-- Teleport players to the start location
			teleport_coop(NAVPOINT_LOCAL_PLAYER_START, NAVPOINT_REMOTE_PLAYER_START, true)

		else
			-- Play the intro cutscene
			cutscene_play("ro04-01", start_groups, {NAVPOINT_LOCAL_PLAYER_START, NAVPOINT_REMOTE_PLAYER_START}, false)
		end

		group_show(GROUP_GAT)
		group_show(GROUP_START_VEHICLES)

	end

	rn04_initialize(rn04_checkpoint)

	-- Stage 1: Player(s) defend Gat from waves of attacking Ronin
	if(rn04_checkpoint == CHECKPOINT_START) then

		-- Start loading in the homie
		group_create_hidden(GROUP_HOMIE, true)

		turn_vulnerable(CHARACTER_GAT)
		turn_vulnerable(LOCAL_PLAYER)
		if (IN_COOP) then
			turn_vulnerable(REMOTE_PLAYER)
		end		

		rn04_defend_gat()

		-- CHECKPOINT!
		delay(1.0)

		-- Make sure that the homie and his vehicle will be saved by the checkpoint system
		vehicle_mark_as_players(Rn04_vehicle_homie, LOCAL_PLAYER)
		party_dismiss_all() 
		party_add(CHARACTER_HOMIE, LOCAL_PLAYER)

		mission_set_checkpoint(CHECKPOINT_DRIVE)
		rn04_checkpoint = CHECKPOINT_DRIVE

		-- Fade out and disable player controls
		fade_out(0.0,{0,0,0}, SYNC_ALL)
		fade_out_block()

		player_controls_disable(LOCAL_PLAYER)
		if (IN_COOP) then
			player_controls_disable(REMOTE_PLAYER)
		end

		-- Create the chase group... this needs to happen before the teleport_coop in rn04_setup_vehicle_occupants
		group_create(GROUP_CHASE_0, true)

		-- Place the correct people in the vehicle
		rn04_setup_vehicle_occupants()

		-- Prepare for the drive to the hospital
		rn04_setup_hospital_drive()

		-- Fade into the game
		fade_in(1.0, SYNC_ALL)
		fade_in_block()

		-- Reenable player controls
		player_controls_enable(LOCAL_PLAYER)
		if (IN_COOP) then
			player_controls_enable(REMOTE_PLAYER)
		end


	end -- ends CHECKPOINT_START

	-- Stage 2
	if (rn04_checkpoint == CHECKPOINT_DRIVE) then

		rn04_drive_to_hospital()
		
	end -- ends CHECKPOINT_DRIVE

	-- Don't have the mission succeed if we didn't arrive at the destination.
	if (vehicle_is_destroyed(Rn04_vehicle_homie) or get_dist(Rn04_vehicle_homie, NAVPOINT_HOSPITAL_PARKING) > 15) then
		rn04_failure_car_destroyed()
		while(true) do
			thread_yield()
		end
	else
		-- Mission end
		rn04_complete()
	end

end

function rn04_initialize(checkpoint)

	rn04_initialize_common()

	rn04_initialize_checkpoint(checkpoint)

	rn04_initialize_common_post()

	mission_start_fade_in()
end

function rn04_initialize_common()

	-- Start trigger is hit...the activate button was hit
	set_mission_author("Phillip Alexander")

	if (coop_is_active()) then
		IN_COOP	= true
	end

	-- Start the thread that will display helptext
	thread_new("rn04_display_helptext")

	notoriety_set("Police",0)
	notoriety_set_max("Police", 0)
end

function rn04_initialize_common_post()

	npc_suppress_persona(CHARACTER_GAT, true)
	character_prevent_flinching(CHARACTER_GAT, true)
	character_disallow_ragdoll(CHARACTER_GAT)

end


function rn04_initialize_checkpoint(checkpoint)

	if(checkpoint == CHECKPOINT_START) then

		-- Make sure that no one is damaged before we fade in
		turn_invulnerable(CHARACTER_GAT, false)
		turn_invulnerable(LOCAL_PLAYER, false)
		if (IN_COOP) then
			turn_invulnerable(REMOTE_PLAYER, false)
		end

		-- Don't allow the player to dial 911
		cell_spawns_enable(false)

		-- Setup Gat.
		on_death("rn04_failure_gat_died", CHARACTER_GAT)
		on_dismiss("rn04_failure_gat_abandoned", CHARACTER_GAT)
		character_make_priority_target(CHARACTER_GAT, true, 10)
		set_unrecruitable_flag(CHARACTER_GAT, true)
		inv_item_remove_all(CHARACTER_GAT)
		npc_combat_enable(CHARACTER_GAT, false)

		-- Eliminate ambient gang spawning and set notoriety levels
		ambient_gang_spawn_enable(false)
		spawning_allow_cop_ambient_spawns(false)
		notoriety_set_max("Ronin",rn04_get_parameter_value("MAX_RONIN_NOTORIETY"))		
		notoriety_set_min("Ronin",rn04_get_parameter_value("MIN_RONIN_NOTORIETY"))	

		-- Turn off notoriety spawning
		notoriety_force_no_spawn("Ronin", true) 
		
		-- Make sure Johnny Gat stays ragdolled
		Thread_ragdoll_gat = thread_new("rn04_ragdoll_johnny_gat")

		-- Play messages/dialogue when Gat's health drops below certain levels
		thread_new("rn04_display_gat_health_messages")

		-- Override the respawn distance for Ronin soldiers
		npc_respawn_dist_override(RONIN_RESPAWN_DISTANCE)

		-- Have Ronin attack the player(s), wait for initial group to spawn
		thread_new("rn04_attack_in_waves")
		while(Spawning_initial_ronin) do
			thread_yield()
		end

		city_chunk_set_all_civilians_fleeing("sr2_chunk182", true)
		spawning_pedestrians(false, false)
		action_nodes_enable(false)
	end

	if (checkpoint == CHECKPOINT_DRIVE) then

		group_create(GROUP_GAT, true)
		teleport(CHARACTER_HOMIE, NAVPOINT_LOCAL_PLAYER_START)
		character_show(CHARACTER_HOMIE)

		spawning_allow_cop_ambient_spawns(false)

		-- Create the chase group... this needs to happen before the teleport_coop in rn04_setup_vehicle_occupants
		group_create(GROUP_CHASE_0, true)

		-- Place the correct people in the vehicle
		rn04_setup_vehicle_occupants()

		-- Prepare for the drive to the hospital
		rn04_setup_hospital_drive()


	end

end

function rn04_defend_gat()

	-- Gat grunts when taking damage
	local thread_gat_grunt = thread_new("rn04_gat_grunt_damage")

	-- Tell the player to defend Gat
	rn04_add_high_priority_helptext(HELPTEXT_PROMPT_DEFEND_GAT)
	marker_add_npc(CHARACTER_GAT, MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_PROTECT_ACQUIRE, SYNC_ALL)
	set_max_hit_points(CHARACTER_GAT,rn04_get_parameter_value("GAT_HIT_POINTS"))
	damage_indicator_on(1, CHARACTER_GAT,0.0, HELPTEXT_HUD_GAT_HEALTH)

	-- Delay, then play Player dialogue
	hud_timer_set(0, rn04_get_parameter_value("PLAYER_DIALOGUE_DELAY_S")*1000,"rn04_ambulance_timer_expired")
	while(not Ambulance_timer_expired) do
		thread_yield()
	end

	-- Player wonders what is taking so long
	audio_play_for_character("PLAYER_RON4_FIRST_WAVE_01", LOCAL_PLAYER, "voice", false, true)
	delay(2)
	rn04_add_high_priority_helptext(HELPTEXT_PROMPT_KEEP_WAITING)

	-- Homie calls the player after a bit
	delay(rn04_get_parameter_value("CELL_PHONE_DELAY_S"))

	rn04_homie_phone_call()

	-- Tell the player to clear out the Ronin before the homie arrives
	rn04_add_high_priority_helptext(HELPTEXT_PROMPT_CLEAR_AREA)
	Clearing_ronin = true
	marker_remove_npc(CHARACTER_GAT, SYNC_ALL)

	-- Add markers on on_death callbacks to all of the Ronin that are still attacking
	for i,ronin in pairs(MEMBERS_GROUP_STAGE_1_RONIN) do
		if ( (Spawnable_ronin[ronin] == false) and (not character_is_dead(ronin)) and (not character_hidden(ronin))) then
			Ronin_to_clear = Ronin_to_clear + 1	
			marker_add_npc(ronin, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL)
			on_death("rn04_ronin_killed", ronin)
		end
	end

	-- Wait for all of the Ronin to be killed before sending in the Homie
	if (Ronin_to_clear > 0) then
		objective_text(0, HELPTEXT_OBJECTIVE_CLEAR, Ronin_cleared, Ronin_to_clear)
		while (Ronin_to_clear > Ronin_cleared)  do
			thread_yield()
		end
	end
	objective_text_clear(0)

	thread_kill(thread_gat_grunt)

	-- Homie to the rescue

		-- Get the closest vehicle that is out of sight of the player
		-- (If none in sight, get the furthest)
		local max_dist = -1
		local min_dist = 5000
		local far_vehicle = ""
		local near_vehicle = ""
		for i,vehicle in pairs(VEHICLE_HOMIE_CHOICES) do

			local dist = get_dist_closest_player_to_object(vehicle)

			-- Is this the furthest vehicle that we've found?
			if (dist > max_dist) then
				max_dist = dist
				far_vehicle = vehicle
			end

			-- Is it the closest out of sight vehicle that we've found?
			if((not rn04_navpoint_in_fov(vehicle,3)) and (dist < min_dist)) then
				min_dist = dist
				near_vehicle = vehicle
			end
		end

		if(near_vehicle ~= "") then
			Rn04_vehicle_homie = near_vehicle
		else
			Rn04_vehicle_homie = far_vehicle
		end

		-- Destroy other vehicles in the group to the world
		for i,vehicle in pairs(VEHICLE_HOMIE_CHOICES) do
			if (Rn04_vehicle_homie ~= vehicle) then
				object_destroy(vehicle)
			end
		end

		-- Place the homie in the vehicle
		vehicle_enter_teleport(CHARACTER_HOMIE,Rn04_vehicle_homie,0)
		set_seatbelt_flag(CHARACTER_HOMIE,true)

		-- make them visible
		vehicle_show(Rn04_vehicle_homie)
		character_show(CHARACTER_HOMIE)

		-- Don't let the vehicle/homie be destroyed before the player(s) knows that it is mission-critical
		turn_invulnerable(CHARACTER_HOMIE, false)
		turn_invulnerable(Rn04_vehicle_homie, false)
		vehicle_prevent_explosion_fling(Rn04_vehicle_homie, true) 

		-- prepare for turret base driving
		rn04_setup_homie_car(Rn04_vehicle_homie)

		-- Send homie to Aisha's place
		vehicle_turret_base_to(Rn04_vehicle_homie, HOMIE_ARRIVAL_PATH,true)
		audio_play_for_character("BMTSS1_RON4_SECOND_WAVE_01", CHARACTER_HOMIE, "voice", false, true)

		-- Gat's damage indicator is no longer needed.
		damage_indicator_off(1)

	-- Make the homie and his vehicle vulnerable again.
		turn_vulnerable(Rn04_vehicle_homie)

end

function rn04_gat_grunt_damage()

	delay(10)

	local gat_max_hit_points = rn04_get_parameter_value("GAT_HIT_POINTS")

	local function gat_health_ratio()
		if (character_is_dead(CHARACTER_GAT)) then
			return 0
		end
		local gat_hit_points = get_current_hit_points(CHARACTER_GAT)
		return gat_hit_points / gat_max_hit_points
	end

	while (gat_health_ratio() > .90) do
		thread_yield()
	end
	if (not character_is_dead(CHARACTER_GAT)) then
		audio_play_persona_line(CHARACTER_GAT, "voice - pain shout", 50)
	end

	while (gat_health_ratio() > .8) do
		thread_yield()
	end
	if (not character_is_dead(CHARACTER_GAT)) then
		audio_play_for_character("GAT_RON4_RANDOM_DELERIUM", CHARACTER_GAT, "voice", false, true)
	end

	while (gat_health_ratio() > .60) do
		thread_yield()
	end
	if (not character_is_dead(CHARACTER_GAT)) then
		audio_play_persona_line(CHARACTER_GAT, "voice - pain shout", 50)
	end

	while (gat_health_ratio() > .40) do
		thread_yield()
	end
	if (not character_is_dead(CHARACTER_GAT)) then
		audio_play_for_character("GAT_RON4_RANDOM_DELERIUM", CHARACTER_GAT, "voice", false, true)
	end

	while (gat_health_ratio() > .25) do
		thread_yield()
	end
	if (not character_is_dead(CHARACTER_GAT)) then
		audio_play_persona_line(CHARACTER_GAT, "voice - death scream", 50)
	end

end

function rn04_setup_vehicle_occupants()

	-- Make sure that no random ped or vehicle spawns obstruct our vehicle
	spawning_pedestrians(false, true)
	spawning_vehicles(false)

	-- Teleport players to the start location
	teleport_coop(NAVPOINT_LOCAL_PLAYER_START, NAVPOINT_REMOTE_PLAYER_START, true)

	-- Dismiss any extra followers and put Johnny Gat and the homie in the player's party
	party_dismiss_all() 
	party_add(CHARACTER_HOMIE, LOCAL_PLAYER)

	if (IN_COOP) then
		party_add(CHARACTER_GAT, REMOTE_PLAYER)
	else
		party_add(CHARACTER_GAT, LOCAL_PLAYER)
	end
	
	thread_kill(Thread_ragdoll_gat)
	Ragdolling_gat = false

	-- First make sure that the players aren't already in a vehicle
	character_evacuate_from_all_vehicles(LOCAL_PLAYER)
	if IN_COOP then
		character_evacuate_from_all_vehicles(REMOTE_PLAYER)
	end
	character_evacuate_from_all_vehicles(CHARACTER_HOMIE)

	-- Kick everyone out of the homie's vehicle
	vehicle_evacuate(Rn04_vehicle_homie)

	delay(0.5)

	-- Stop allowing npcs to exit the vehicle
	vehicle_suppress_npc_exit(Rn04_vehicle_homie, true)
	set_seatbelt_flag(CHARACTER_HOMIE,true)

	-- Then place everyone inside
	set_unjackable_flag(Rn04_vehicle_homie, false)
	follower_make_independent(CHARACTER_HOMIE, true)
	follower_make_independent(CHARACTER_GAT, true)
	vehicle_enter_teleport(CHARACTER_HOMIE,Rn04_vehicle_homie,0)
	vehicle_enter_teleport(CHARACTER_GAT,Rn04_vehicle_homie,2)
	vehicle_enter_teleport(LOCAL_PLAYER,Rn04_vehicle_homie,1)
	set_unjackable_flag(Rn04_vehicle_homie, true)
	if IN_COOP then
		vehicle_enter_teleport(REMOTE_PLAYER,Rn04_vehicle_homie,3)
	end

	while( not character_is_in_vehicle(CHARACTER_GAT, Rn04_vehicle_homie) ) do
		thread_yield()
	end
	while( not character_is_in_vehicle(CHARACTER_HOMIE, Rn04_vehicle_homie) ) do
		thread_yield()
	end
	while( not character_is_in_vehicle(LOCAL_PLAYER,Rn04_vehicle_homie)) do
		thread_yield()
	end
	if (IN_COOP) then
		local teleport_attempts = 1
		while( (not character_is_in_vehicle(REMOTE_PLAYER,Rn04_vehicle_homie)) and (teleport_attempts < 5) ) do
			set_unjackable_flag(Rn04_vehicle_homie, false)
			vehicle_enter_teleport(REMOTE_PLAYER, Rn04_vehicle_homie, 2)
			set_unjackable_flag(Rn04_vehicle_homie, true)
			teleport_attempts = teleport_attempts + 1
			delay(1.0)
		end
		-- Delay 1 more second or the client has a tendency to see themselves spawn outside of the car.
		delay(1.0)
	end

	character_set_injured(CHARACTER_GAT, true)

	-- Allow vehicle spawning
	spawning_vehicles(true)

end

function rn04_setup_hospital_drive()

	-- Set the min/max Ronin notoriety
	notoriety_set_max("Ronin",rn04_get_parameter_value("MAX_RONIN_NOTORIETY_DRIVE"))
	notoriety_set_min("Ronin",rn04_get_parameter_value("MIN_RONIN_NOTORIETY_DRIVE"))

	-- set traffic density
	set_traffic_density(rn04_get_parameter_value("CHASE_TRAFFIC_DENSITY"))

	-- give the player(s) better weapon
	inv_weapon_add_temporary(LOCAL_PLAYER, LOCAL_PLAYER_WEAPON, 1, true)
	inv_item_equip(LOCAL_PLAYER_WEAPON,LOCAL_PLAYER)
	if (IN_COOP) then
		inv_weapon_add_temporary(REMOTE_PLAYER, REMOTE_PLAYER_WEAPON, 1, true)
		inv_item_equip(REMOTE_PLAYER_WEAPON,REMOTE_PLAYER)
	end
	Temp_weapons_given = true

	-- Get Gat ready
	inv_item_remove_all(CHARACTER_GAT)
	npc_combat_enable(CHARACTER_GAT, false)
	character_set_injured(CHARACTER_GAT, true)

	-- Prepare homie
	set_seatbelt_flag(CHARACTER_HOMIE,true)
	character_set_injured(CHARACTER_GAT, true)

	-- Start the first chase
	rn04_complication("chase_0")

	-- Prepare the vehicle for turret mode
	rn04_setup_homie_car(Rn04_vehicle_homie)
	on_vehicle_destroyed("rn04_failure_car_destroyed", Rn04_vehicle_homie)
	set_unjackable_flag(Rn04_vehicle_homie, true)

	-- Player(s) can not enter/exit vehicles
	set_player_can_enter_exit_vehicles(LOCAL_PLAYER, false)
	if (IN_COOP) then
		set_player_can_enter_exit_vehicles(REMOTE_PLAYER, false)
	end

	-- Allow spawning
	spawning_pedestrians(true)
	action_nodes_enable(true)
	spawning_vehicles(true)

	-- Start spawning Ronin and cops again
	ambient_gang_spawn_enable(true)
	spawning_allow_cop_ambient_spawns(true)
	notoriety_force_no_spawn("Ronin", false)

end

function rn04_drive_to_hospital()

	-- start the thread that will release the initial Ronin vehicles
	thread_new("rn04_initial_ronin_release")

	-- start the chase and ambush thread
	thread_new("rn04_chase_and_ambush")

	-- Gat is getting loopy!
	thread_new("rn04_play_gat_delirious_conversation")

	-- Turret base away!
	roadblocks_enable(false)

	-- Tell the player to defend the car.
	rn04_add_high_priority_helptext(HELPTEXT_PROMPT_DEFEND_CAR)

	-- Head to roadblock
	vehicle_turret_base_to(Rn04_vehicle_homie, ESCAPE_PATH_PART1, false)
	audio_play_for_character("BMTSS1_RON4_ROADBLOCK_01", CHARACTER_HOMIE, "voice", false, false)

	-- Make a u-turn and leave the roadblock
	--rn04_add_high_priority_helptext(HELPTEXT_DIALOGUE_HOMIE_U_TURN)
	thread_new("rn04_homie_vehicle_speed_spurt",Rn04_vehicle_homie, 4, 70)

	-- Start pathfinding to the jump location
	vehicle_turret_base_to(Rn04_vehicle_homie, ESCAPE_PATH_PART2, false)

	-- Ignore repulsors for the remainder of the path to the jump
	vehicle_ignore_repulsors(Rn04_vehicle_homie, true)
	vehicle_turret_base_to(Rn04_vehicle_homie, ESCAPE_PATH_PART3, false)
	vehicle_turret_base_to(Rn04_vehicle_homie, ESCAPE_PATH_PART4, false)

	-- Increase speed to the ramp.
	vehicle_max_speed(Rn04_vehicle_homie,80)
	vehicle_speed_override(Rn04_vehicle_homie,80)

	if ( not DEBUG_SKIP_CHURCH_JUMP) then
		-- Switch to navmesh pathfinding before the church jump. Otherwise the ai will turn
		-- back onto a traffic spline before completing the jump.
		vehicle_set_torque_multiplier(Rn04_vehicle_homie, 1.5)
		vehicle_set_script_hard_goto(Rn04_vehicle_homie,true)
		turn_invulnerable(Rn04_vehicle_homie, false)

		audio_play_for_character("BMTSS1_RON4_CHURCH_JUMP_01", CHARACTER_HOMIE, "voice", false, false)

		vehicle_pathfind_to(Rn04_vehicle_homie,ESCAPE_PATH_PART5, true, false)
		--thread_new("rn04_homie_vehicle_speed_spurt",Rn04_vehicle_homie, 5, 86)

		-- Wait until we're airborne before Gat mouths off any more.
		local became_airborne = false
		local airborne_checks = 0
		local max_airborne_checks = 60
		while ( (not vehicle_in_air(Rn04_vehicle_homie)) and (airborne_checks < max_airborne_checks) ) do
			airborne_checks = airborne_checks + 1
			thread_yield()
		end
		if (airborne_checks < max_airborne_checks) then
			became_airborne = true
		end

		-- If we didn't get airborne, we're going to skip some stuff	
		if (became_airborne) then
			--rn04_add_high_priority_helptext(HELPTEXT_DIALOGUE_GAT_JUMP)
			delay(4.0)
		end

		vehicle_set_torque_multiplier(Rn04_vehicle_homie, 1.2)
	end

	-- Make sure that we've landed before calling pathfinding code again.
	while (vehicle_in_air(Rn04_vehicle_homie)) do
		thread_yield()
	end
	delay(0.25)
	turn_vulnerable(Rn04_vehicle_homie)
	vehicle_speed_cancel(Rn04_vehicle_homie)
	vehicle_ignore_repulsors(Rn04_vehicle_homie, false)

	-- Head to the ditch
	audio_play_for_character("BMTSS1_RON4_DITCH_JUMP_01", CHARACTER_HOMIE, "voice", false, false)
	vehicle_turret_base_to(Rn04_vehicle_homie, ESCAPE_PATH_PART5b, false)
	vehicle_turret_base_to(Rn04_vehicle_homie, ESCAPE_PATH_PART5c, false)

	-- Say something about the roadblock
	audio_play_for_character("BMTSS1_RON4_DITCH_JUMP_01", CHARACTER_HOMIE, "voice", false, false)
	-- Use navmesh pathfinding up to the roadblock, only have gps-only splines in this area. 
	-- Also stop at the splines end so that we don't end up in the agua 
	vehicle_pathfind_to(Rn04_vehicle_homie,ESCAPE_PATH_PART6, true, true)
	audio_play_for_character("BMTSS1_RON4_AROUND_DITCH_01", CHARACTER_HOMIE, "voice", false, false)

	-- Play random dialogue for Gat:
	thread_new("rn04_play_gat_delirious_messages")

	-- Do a u-turn to exit the ditch. Run over anyone in our way
	vehicle_ignore_repulsors(Rn04_vehicle_homie, true)
	vehicle_pathfind_to(Rn04_vehicle_homie,ESCAPE_PATH_PART6a, true, false)
	vehicle_ignore_repulsors(Rn04_vehicle_homie, false)

	vehicle_set_use_short_cuts(Rn04_vehicle_homie, false)

	vehicle_turret_base_to(Rn04_vehicle_homie, ESCAPE_PATH_PART6b, false)
	vehicle_turret_base_to(Rn04_vehicle_homie, ESCAPE_PATH_PART6c, false)
	vehicle_turret_base_to(Rn04_vehicle_homie, ESCAPE_PATH_PART6d, false)
	vehicle_turret_base_to(Rn04_vehicle_homie, ESCAPE_PATH_PART6e, false)

	-- Make a u-turn and leave the roadblock
	--thread_new("rn04_homie_vehicle_speed_spurt",Rn04_vehicle_homie, 4, 70)

	vehicle_turret_base_to(Rn04_vehicle_homie, ESCAPE_PATH_PART7, false)

	-- Pathfind into the parking lot
	vehicle_pathfind_to(Rn04_vehicle_homie,NAVPOINT_HOSPITAL_PARKING, true, true)

	-- Thank the homie
	audio_play_for_character("PLAYER_RON4_HOSPITAL_01", LOCAL_PLAYER, "voice", false, true)

end

function rn04_initial_ronin_release()

	delay(30)
	release_to_world(GROUP_START_VEHICLES)
	release_to_world(GROUP_STAGE_1_RONIN)
	release_to_world(GROUP_STAGE_1_RONIN_VEHICLES)

end

-- Spawn waves of ronin to attack ceiling supports that the player(s) is(are) defending
Num_living_attackers = 0
Num_ronin_spawned = 0
Spawnable_ronin = {}
Spawn_locations_next_navpoint_index	= {}
function rn04_attack_in_waves()

	-- Set respawn dist threshold very low.
	npc_respawn_dist_override(RONIN_RESPAWN_DISTANCE)
	
	-- All ronin are initially spawnable
	for i, ronin in pairs(MEMBERS_GROUP_STAGE_1_RONIN) do
		Spawnable_ronin[ronin] = true
	end

	-- Convenience variables for wave size parameters.
	local min_wave_size = rn04_get_parameter_value("WAVE_MIN_SIZE")
	local max_wave_size = rn04_get_parameter_value("WAVE_MAX_SIZE")
	local max_attackers = rn04_get_parameter_value("MAX_LIVING")

	local min_wave_delay = rn04_get_parameter_value("WAVE_MIN_DELAY_S")
	local max_wave_delay = rn04_get_parameter_value("WAVE_MAX_DELAY_S")

	-- Returns the next wave size
	local function get_next_wave_size()
		local next_wave_size = rand_int(min_wave_size, max_wave_size)
		rn04_debug_text("Next wave size = " .. next_wave_size, DEBUG_TEXT_RESPAWN_COUNT)
		return next_wave_size
	end

	-- Size of the next wave to spawn
	local next_wave_size = get_next_wave_size()

	-- Continuously check the number of Ronin attacking, spawn more if needed.
	while(not Clearing_ronin) do

		-- Spawn the next wave if there is room.
		if (next_wave_size + Num_living_attackers <= max_attackers) then

			local num_ronin_in_wave = rn04_send_wave(next_wave_size)
			Num_ronin_spawned = Num_ronin_spawned + num_ronin_in_wave
			Num_living_attackers = Num_living_attackers + num_ronin_in_wave
			rn04_debug_text("Ronin spawned, Num_living_attackers = " .. Num_living_attackers, DEBUG_TEXT_NUM_LIVING)
			next_wave_size =  get_next_wave_size()

			if(not Spawning_initial_ronin) then
				delay(rand_float(min_wave_delay, max_wave_delay))
			end

		else

		-- If there isn't enough room, we can't be on the initial wave anymore
			Spawning_initial_ronin = false
		end

		thread_yield()

	end -- end while(true)

end

-- Send a wave of ronin to attack the players
--
-- wave_size: number of attackers to send
--
-- returns number of attackers successfully spawned
function rn04_send_wave(wave_size)

	local num_ronin_spawned = 0
	num_ronin_spawned = rn04_maybe_send_wave_vehicle(wave_size)
	local peds_to_spawn = wave_size - num_ronin_spawned

	-- For each Ronin to be spawned
	for i=1, peds_to_spawn, 1 do

		-- Get a ronin to spawn and a safe spawning location. 
		local ronin = rn04_get_spawnable_ronin()
		local spawn_navpoint = rn04_get_safe_spawn()

		-- If either one not found, return # ronin already spawned.
		if ( spawn_navpoint == nil ) then
			return num_ronin_spawned
		end

		-- Teleport to the spawn navpoint
		teleport(ronin, spawn_navpoint)

		-- We're gonna spawn this guy, do some book keeping and start its patrol
		num_ronin_spawned = num_ronin_spawned + 1
		rn04_ronin_was_spawned(ronin)

		-- Show the ronin and start its patrol
		character_show(ronin)
		rn04_ronin_attack(ronin)

		-- Delay a little bit, gives the ronin time to leave the spawn area and keeps congestion down.
		if (not 	Spawning_initial_ronin ) then
			delay(.2,.5)
		end

	end

	-- Return num of ronin spawned
	return num_ronin_spawned

end

function rn04_ronin_was_spawned(ronin)

	-- Tell the ronin to respawn, override default respawn time
	Spawnable_ronin[ronin] = false
	npc_respawn_after_death(ronin, true)
	npc_respawn_after_death_time_override(ronin, RONIN_RESPAWN_TIME_MS, true)
	on_respawn("rn04_respawn_ronin",ronin)


end

function rn04_maybe_send_wave_vehicle(wave_size)

	if ( Spawning_initial_ronin ) then
		return 0
	end

	local safe_vehicle_spawn_location = rn04_get_safe_wave_vehicle_spawn_location()
	local num_ronin_spawned = 0

	if (safe_vehicle_spawn_location) then

		local vehicle_entrance = VEHICLE_SPAWN_LOCATIONS[safe_vehicle_spawn_location]
		local vehicle = vehicle_entrance["vehicle"]

		Sent_wave_vehicles[vehicle] = true

		-- Place the passengers in the vehicles
		local num_seats = vehicle_get_num_seats(vehicle)
		local num_passengers = min(num_seats, wave_size)
		local passengers = {}
		for i = 1, num_passengers, 1 do
			local ronin = rn04_get_spawnable_ronin()
			if ( (ronin ~= nil) and (vehicle ~= nil) ) then
				passengers[i] = ronin
				vehicle_enter_teleport(ronin, vehicle, i-1)
				num_ronin_spawned = num_ronin_spawned + 1
				character_show(ronin)
				rn04_ronin_was_spawned(ronin)
			end
		end

		-- If we couldn't find any Ronin to place in the vehicle, then we won't
		-- be able to send the vehicle
		if (num_ronin_spawned == 0) then
			return num_ronin_spawned
		end

		thread_new("rn04_send_wave_vehicle", safe_vehicle_spawn_location, passengers)
		
	end

	return num_ronin_spawned

end

function rn04_send_wave_vehicle(spawn_location, passengers)

	local vehicle_entrance = VEHICLE_SPAWN_LOCATIONS[spawn_location]
	local navpoint = vehicle_entrance["navpoint"]
	local vehicle = vehicle_entrance["vehicle"]
	local jump_speed = vehicle_entrance["jump speed"]
	local jump_path = vehicle_entrance["jump path"]
	local dest_path = vehicle_entrance["destination path"]
	local torque_multiplier = vehicle_entrance["torque multiplier"]

	Sent_wave_vehicles[vehicle] = true

	delay(1.0)
	if navpoint then
		teleport_vehicle(vehicle, navpoint)
	end
	delay(3.0)

	vehicle_show(vehicle)
	for i, passenger in pairs(passengers) do
		character_show(passenger)
	end

	vehicle_infinite_mass(vehicle, true)
	vehicle_ignore_repulsors(vehicle, true)
	vehicle_set_allow_ram_ped(vehicle,true)
	
	if jump_path then

		vehicle_speed_override(vehicle, jump_speed)
		if torque_multiplier then
			vehicle_set_torque_multiplier(vehicle, torque_multiplier)
		end

		vehicle_pathfind_to(vehicle, jump_path, true, false)

		-- Wait for take off
		while (not vehicle_in_air(vehicle)) do
			thread_yield()
		end
		-- Wait for landing
		while (vehicle_in_air(vehicle)) do
			thread_yield()
		end

		-- Cancel vehicle overrides
		vehicle_speed_cancel(vehicle)
		vehicle_set_torque_multiplier(vehicle, 1.0)
	end

	vehicle_pathfind_to(vehicle, dest_path, true, true)

	vehicle_infinite_mass(vehicle, false)
	vehicle_ignore_repulsors(vehicle, false)
	vehicle_set_allow_ram_ped(vehicle,false)
	
	for i, passenger in pairs(passengers) do
		set_attack_enemies_flag(passenger, true)
		vehicle_exit(passenger)
		if(rand_float(0.0,1.0) < .70) then
			attack(passenger, CHARACTER_GAT)
		else
			attack(passenger, LOCAL_PLAYER)
		end
	end
end

Sent_wave_vehicles = {}
function rn04_get_safe_wave_vehicle_spawn_location()

	for i, vehicle_info in pairs (VEHICLE_SPAWN_LOCATIONS) do
		local already_sent = ( Sent_wave_vehicles[vehicle_info["vehicle"]] == true)
		local in_fov = rn04_navpoint_in_fov(vehicle_info["navpoint"], 5)
		if ( (not already_sent) and (not in_fov) ) then
			Sent_wave_vehicles[vehicle_info["vehicle"]] = true
			return i
		end
	end

	return nil

end

function rn04_test_vehicle_entrances()

	for i,vehicle_entrance in pairs (VEHICLE_SPAWN_LOCATIONS) do
		
		local navpoint = vehicle_entrance["navpoint"]
		local driver = vehicle_entrance["driver"]
		local vehicle = vehicle_entrance["vehicle"]
		local jump_speed = vehicle_entrance["jump speed"]
		local jump_path = vehicle_entrance["jump path"]
		local dest_path = vehicle_entrance["destination path"]
		local torque_multiplier = vehicle_entrance["torque multiplier"]

		vehicle_enter_teleport(driver, vehicle)
		delay(1.0)
		if navpoint then
			teleport_vehicle(vehicle, navpoint)
		end
		delay(3.0)

		vehicle_show(vehicle)
		character_show(driver)
		if jump_path then

			vehicle_infinite_mass(vehicle, true)
			vehicle_ignore_repulsors(vehicle, true)
			vehicle_speed_override(vehicle, jump_speed)
			if torque_multiplier then
				vehicle_set_torque_multiplier(vehicle, torque_multiplier)
			end

			vehicle_pathfind_to(vehicle, jump_path, true, false)

			-- Wait for take off
			while (not vehicle_in_air(vehicle)) do
				thread_yield()
			end
			-- Wait for landing
			while (vehicle_in_air(vehicle)) do
				thread_yield()
			end

			-- Cancel vehicle overrides
			vehicle_speed_cancel(vehicle)
			vehicle_set_torque_multiplier(vehicle, 1.0)
			vehicle_infinite_mass(vehicle, false)
			vehicle_ignore_repulsors(vehicle, false)
		end

		vehicle_pathfind_to(vehicle, dest_path, true, true)
		vehicle_exit(driver)
		attack(driver)

	end

	while 1 do 
		thread_yield()
	end

end

-- Returns a spawnable ronin if one is available, nil else.
function rn04_get_spawnable_ronin()

	for i, ronin in pairs(MEMBERS_GROUP_STAGE_1_RONIN) do
		if (Spawnable_ronin[ronin] == true) then
			return ronin
		end
	end

	return nil

end

-- Handle the respawning of an attacking Ronin.
function rn04_respawn_ronin(ronin)

	-- Update the count of living ronin
	Num_living_attackers = Num_living_attackers - 1
	rn04_debug_text("Respawn, New num_living_attackers = " .. Num_living_attackers, DEBUG_TEXT_NUM_LIVING)

	-- keep the ronin hidden for now
	character_hide(ronin)

	-- Make this ronin available for spawning again
	delay(.5)
	Spawnable_ronin[ronin] = true

end

function rn04_ronin_attack(ronin)
	-- setup respawning
	npc_respawn_after_death(ronin, true)
	on_respawn("rn04_respawn_ronin", ronin)
	on_take_damage("rn04_ronin_damaged", ronin)

	if (not 	Spawning_initial_ronin ) then
		move_to(ronin, NAVPOINT_ATTACK_LOCATION, 2, false, true)
	end
	
	if(rand_float(0.0,1.0) < .70) then
		attack(ronin, CHARACTER_GAT)
	else
		attack(ronin, LOCAL_PLAYER)
	end
end

function rn04_ronin_damaged(ronin, attacker, damage_percent)
	on_take_damage("", ronin)

	if(attacker == LOCAL_PLAYER) then
		attack(ronin, LOCAL_PLAYER)
	elseif(attacker == REMOTE_PLAYER) then
		attack(ronin, REMOTE_PLAYER)
	end
	local new_health = damage_percent*get_max_hit_points(ronin)
	set_current_hit_points(ronin, new_health)

end

function rn04_ronin_killed(ronin)

	Ronin_cleared = Ronin_cleared + 1
	objective_text(0, HELPTEXT_OBJECTIVE_CLEAR, Ronin_cleared, Ronin_to_clear)

	marker_remove_npc(ronin)
	on_death("", ronin)
end


-- TODO: have the following function use the preferred starting location for the initial spawns.

-- Find a navpoint at which we can safely (without popping) spawn a Ronin.
--
-- The search for a safe navpoint has 2 stages:
-- 1) Try to return a navpoint from the hint location
-- 2) Try to return a navpoint that is a certain minimum distance from the players
--
-- Parameters:
--		hint_location: location at which we'd like to spawn the npc
--
--	Returns:
--		spawn_navpoint: navpoint at which to spawn
Rn04_initial_spawn_index = 0
function rn04_get_safe_spawn(hint_location)

	-- The initial allotment of Ronin is spawned at a special set of nav points right in front of the
	-- player. We aren't doing fov checks for these, they're spawned during a fade out.
	if (Spawning_initial_ronin) then
		Rn04_initial_spawn_index = Rn04_initial_spawn_index + 1
		return WAVE_INITIAL_SPAWN_LOCATIONS[Rn04_initial_spawn_index]
	end

	-- 1) Try to return a navpoint from the preferred location:
	if (hint_location ~= nil) then
		if (rn04_location_is_safe(hint_location)) then
			return rn04_return_location(hint_location)
		end
	end

	-- 2) Try to return a navpoint that is a certain minimum distance from the players

	local safe_spawn_location_indices = {}
	local num_safe_spawn_locations = 0;

	-- Add safe spawn locations to the list
	for i=1, sizeof_table(WAVE_SPAWN_LOCATIONS), 1 do

		if (rn04_location_is_safe(i)) then

			num_safe_spawn_locations = num_safe_spawn_locations + 1
			safe_spawn_location_indices[num_safe_spawn_locations] = i

		end

	end

	-- Can't do anything if there are no safe spawn areas.
	if (num_safe_spawn_locations == 0) then
		return nil
	end

	-- Select a random safe spawn area
	return rn04_return_location(safe_spawn_location_indices[rand_int(1,num_safe_spawn_locations)]) 

end

function rn04_return_location(location_index) 

	-- Get current navpoint index
	local current_navpoint_index = Spawn_locations_next_navpoint_index[location_index]
	if (current_navpoint_index == nil) then
		current_navpoint_index = 0
	end

	-- Get the navpoint that we are going to return
	local navpoint = WAVE_SPAWN_LOCATIONS[location_index][current_navpoint_index]

	-- Do a modular ncrement the navpoint index for this location
	local next_navpoint_index = current_navpoint_index + 1
	local max_navpoint_index = sizeof_table(WAVE_SPAWN_LOCATIONS[location_index])
	if (next_navpoint_index > max_navpoint_index) then
		next_navpoint_index = 1
	end
	Spawn_locations_next_navpoint_index[location_index] = next_navpoint_index

	-- return the navpoint and location index
	return navpoint, next_navpoint_index

end

function rn04_location_is_safe(location_index)

	-- Get the next navpoint at this location
	local navpoint_index = Spawn_locations_next_navpoint_index[location_index]
	if (navpoint_index == nil) then
		navpoint_index = 1
	end
	local navpoint = WAVE_SPAWN_LOCATIONS[location_index][navpoint_index]

	-- See if the navpoint is distance-safe
	local dist, closest_player = get_dist_closest_player_to_object(navpoint)
	if (dist < 10.0 or dist > 150.0) then
		return false
	end

	if (not rn04_navpoint_in_fov(navpoint)) then
		return true
	end
	return false

end

function rn04_navpoint_in_fov(navpoint, radius)

	local navpoint_in_local_fov = navpoint_in_player_fov(navpoint, LOCAL_PLAYER, radius)
	local navpoint_in_remote_fov = false
	if (IN_COOP) then
		navpoint_in_remote_fov = navpoint_in_player_fov(navpoint, REMOTE_PLAYER, radius)
	end

	return (navpoint_in_local_fov or navpoint_in_remote_fov)

end

function rn04_play_gat_delirious_conversation()
	-- Wait a bit
	delay(10)
	audio_play_conversation( DELIRIOUS_CONVERSATION)
end

-- During stage 2, Gat becomes delirious and starts spouting nonsense.
function rn04_play_gat_delirious_messages()

	-- Chance that Gat will talk, how often we check.
	local talk_chance = .50
	local talk_interval = 15

	-- Gat says something odd every once in a while
	while(true) do
		
		delay(talk_interval)

		if (not character_is_dead(CHARACTER_GAT) ) then
			local talk_roll = rand_float(0.0,1.0)
			if (talk_roll < talk_chance) then
				audio_play_for_character("GAT_RON4_RANDOM_DELERIUM", CHARACTER_GAT, "voice", false, true)
			end
		end

		thread_yield()
	end

end

-- When Gat's health reaches certain levels, plays dialogue lines for Gat or 
-- displays a warning prompt for the player.
function rn04_display_gat_health_messages()

	-- Prompts given to the player to indicate that Gat's health is deteriorating
	local gat_health_prompts = 
		{
			{.50,	HELPTEXT_PROMPT_GAT_HEALTH_50},
			{.30,	HELPTEXT_PROMPT_GAT_HEALTH_30},
		}
	
	local num_health_prompts		= sizeof_table(gat_health_prompts)
	local next_prompt					= 1

	while	( (next_prompt <= num_health_prompts) and (not character_is_dead(CHARACTER_GAT)) )  do
	
		-- Calculate Gat's current health level on [0,1]
		local gat_current_health = get_current_hit_points(CHARACTER_GAT)
		local gat_health_ratio = get_current_hit_points(CHARACTER_GAT)/get_max_hit_points(CHARACTER_GAT)

		-- Display prompt?
		if( (next_prompt <= num_health_prompts) and (gat_health_ratio < gat_health_prompts[next_prompt][1]) ) then
			rn04_add_high_priority_helptext(gat_health_prompts[next_prompt][2])			
			next_prompt = next_prompt + 1
		end

		thread_yield()
	end

end

-- Plays dialogue lines for the Homie when his vehicle reaches certain levels of damage
function rn04_display_homie_car_health_messages()

	-- Gat's dialogue that is played when certain damage thresholds are reached
	local homie_dialogue_lines = 
		{
			{.65,	"BMTSS1_RON4_VEHICLE_65DAMAGE_01"},
		}
		
	local num_dialogue_lines		= sizeof_table(homie_dialogue_lines)
	local next_dialogue				= 1

	while	(	(next_dialogue <= num_dialogue_lines) and 
				(not character_is_dead(CHARACTER_HOMIE)) and
				(not vehicle_is_destroyed(Rn04_vehicle_homie)) )  do
	
		-- Calculate car's current health level on [0,1]
		local health_ratio = get_current_hit_points(Rn04_vehicle_homie)/get_max_hit_points(Rn04_vehicle_homie)

		-- Play dialogue helptext?
		if( (next_dialogue <= num_dialogue_lines) and (health_ratio < homie_dialogue_lines[next_dialogue][1]) ) then
			audio_play_for_character(homie_dialogue_lines[next_dialogue][2], CHARACTER_HOMIE, "voice", false, false)
		end

		thread_yield()
	end

end

function rn04_ambulance_timer_expired()
	Ambulance_timer_expired = true
	--hud_timer_hide(0, true)
	hud_timer_stop(0)
end

function rn04_ragdoll_johnny_gat()

	local anim_name = "Gat Injured"
	while(true) do
		if (not check_animation_state(CHARACTER_GAT, anim_name)) then
			set_animation_state(CHARACTER_GAT, anim_name)
		end
		thread_yield()
	end
end

function rn04_homie_vehicle_speed_spurt(vehicle, time_s, speed)
	vehicle_ignore_repulsors(vehicle, true)
	vehicle_max_speed(vehicle,speed)
	vehicle_speed_override(vehicle, speed)
	delay(time_s)
	--vehicle_speed_override(vehicle, rn04_get_parameter_value("HOMIE_VEHICLE_SPEED_OVERRIDE"))
	vehicle_speed_cancel(vehicle)
	vehicle_max_speed(vehicle, rn04_get_parameter_value("HOMIE_VEHICLE_SPEED_OVERRIDE"))
	vehicle_ignore_repulsors(vehicle, false)
end

function rn04_chase_and_ambush()
	rn04_complication("chase_1")
	rn04_complication("roadblock_1")
	rn04_complication("roadblock_2")
	rn04_complication("roadblock_3")
end

function rn04_complication(complication_name)

	local complication = CHASES_AND_AMBUSHES[complication_name]
	local complication_type = complication["type"]

	-- Arm the trigger if it exists, otherwise we'll call the on_trigger_hit function immediately
	if(complication["trigger"]) then
		trigger_enable(complication["trigger"],true)
		on_trigger("rn04_chase_or_ambush_location_reached",complication["trigger"])
	else
		Chase_or_ambush_sent = true;
	end

	-- create the group
	if (complication["group"]) then
		group_create(complication["group"])
	end

	-- complication-type-specific preparation
	if (complication_type == "chase") then
		rn04_chase_prepare(complication_name)
	elseif (complication_type == "roadblock") then
		rn04_roadblock_prepare(complication_name)
	end

	-- wait for the complication trigger to be hit
	while (not Chase_or_ambush_sent) do
		thread_yield()
	end

	-- Reset the trigger
	if (complication["trigger"]) then
		trigger_enable(complication["trigger"],false)
		on_trigger("",complication["trigger"])
	end
	Chase_or_ambush_sent = false

	-- complication-type-specific trigger-hit function
	if (complication_type == "chase") then
		rn04_chase_trigger_hit(complication_name)
	elseif (complication_type == "roadblock") then
		rn04_roadblock_trigger_hit(complication_name)
	end

	-- complication-type-specific cleanup for the last complication
	-- Release the on_foot Ronin from the last group
	if (Last_complication ~= "") then
		local last_complication_type = CHASES_AND_AMBUSHES["Last_complication"]
		if (last_complication_type == "chase") then
			rn04_chase_cleanup(Last_complication)
		elseif (last_complication_type == "roadblock") then
			rn04_roadblock_cleanup(Last_complication)
		end
	end

	Last_complication = complication_name
end

function rn04_chase_prepare(chase_name)
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
			set_max_hit_points(vehicle, 	rn04_get_parameter_value("CAR_CHASE_HP"))

		elseif (vehicle_data["type"] == "bike") then
			set_max_hit_points(vehicle, 	rn04_get_parameter_value("BIKE_CHASE_HP"))
		end

		-- add callback to update count of vehicles attacking
		on_vehicle_destroyed("rn04_chase_vehicle_destroyed", vehicle)

	end
end

-- Vehicles attack if doing so won't cause us to excede the threshold, otherwise they are destroyed
-- peds attack
function rn04_chase_trigger_hit(chase_name)
	
	local chase = CHASES_AND_AMBUSHES[chase_name]

	-- Have vehicles enter chase mode
	for vehicle,vehicle_data in pairs(chase["vehicles"]) do

		-- get the maximum number of vehicles that can chasing the players
		local max_vehicles	= rn04_get_parameter_value("MAX_CHASE_VEHICLES")

		-- have the vehicle attack if we won't excede the max
		if (Vehicles_attacking < max_vehicles and not vehicle_is_destroyed(vehicle)) then

			-- Set vehicle class specific parameters
			-- (speed override is set later or vehicles will begin driving immediately)
			if (vehicle_data["type"] == "car") then
				vehicle_max_speed(vehicle, rn04_get_parameter_value("CAR_CHASE_SPEED"))
			elseif (vehicle_data["type"] == "bike") then
				vehicle_max_speed(vehicle, rn04_get_parameter_value("BIKE_CHASE_SPEED"))
			end
				
			-- Set vehicle class specific parameters
			local speed_override = 0
			if (vehicle_data["type"] == "car") then
				speed_override = rn04_get_parameter_value("CAR_CHASE_SPEED")
			elseif (vehicle_data["type"] == "bike") then
				speed_override = rn04_get_parameter_value("BIKE_CHASE_SPEED")
			end

			thread_new("rn04_vehicle_chase_maybe_jump",vehicle,vehicle_data["jump"], speed_override, vehicle_data["delay_s"])

			-- increment attacking count
			Vehicles_attacking = Vehicles_attacking + 1
		else

			-- release vehicles that we can't have attack
			on_vehicle_destroyed("", vehicle)
			release_to_world(vehicle)
			
		end

	end

	-- Have npcs attack
	for i,npc in pairs(chase["on_foot"]) do
		attack(npc,LOCAL_PLAYER,true)
	end
end

-- Have a vehicle possibly delay a bit and then enter chase mode
function rn04_vehicle_chase_maybe_jump(vehicle,jump,speed_override, delay_s)

	-- Maybe wait a bit
	if(delay_s) then
		vehicle_speed_override(vehicle, 0)
		delay(delay_s)
	end
	vehicle_speed_cancel(vehicle)

	-- If jumping, wait for the vehicle to become airborn and then land
	if(jump) then
		vehicle_speed_override(vehicle, vehicle_get_max_speed(vehicle))
		while( not vehicle_in_air(vehicle) ) do
			thread_yield()
		end
		delay(1.5)
		while( vehicle_in_air(vehicle) ) do
			thread_yield()
		end
		vehicle_speed_cancel(vehicle)
	end
	vehicle_chase(vehicle, LOCAL_PLAYER, true, true, true)
end

-- Tidy up a chase complication by releasing the on-foot attackers
-- vehicles and their passengers are cleaned up as the vehicles are destroyed
function rn04_chase_cleanup(chase_name)
	for i,npc in pairs(CHASES_AND_AMBUSHES[chase_name]["on_foot"]) do
		release_to_world(npc)
	end
end

function rn04_chase_vehicle_destroyed(vehicle)
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
function rn04_roadblock_prepare(roadblock_name)

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
			set_max_hit_points(vehicle, 	rn04_get_parameter_value("CAR_CHASE_HP"))
		elseif (vehicle_data["type"] == "bike") then
			set_max_hit_points(vehicle, 	rn04_get_parameter_value("BIKE_CHASE_HP"))
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
			patrol("rn04_npc_misfire",npc,target)
		else
			attack(npc,LOCAL_PLAYER,true)
		end
	end
end

function rn04_npc_misfire(npc,target)
	local dist = 	get_dist(npc,Rn04_vehicle_homie)
	while(dist > 60) do
		dist = 	get_dist(npc,Rn04_vehicle_homie)
		thread_yield()
	end	
	force_fire(npc, target, true) 
	attack(npc,LOCAL_PLAYER,true)
end

-- Roadblock triggers are placed after the roadblock. When they are hit, the roadblockers
-- realize that their trap failed. Those that are still alive get in their vehicles and
-- join the chase. Npcs and vehicles which can't join the chase are released because
-- the player may not be that far away.
function rn04_roadblock_trigger_hit(roadblock_name)
	
	local roadblock = CHASES_AND_AMBUSHES[roadblock_name]

	-- Have vehicles enter chase mode
	for vehicle,vehicle_data in pairs(roadblock["vehicles"]) do

		-- get the maximum number of vehicles that can chasing the players
		local max_vehicles	= rn04_get_parameter_value("MAX_CHASE_VEHICLES")

		-- have the vehicle attack if we won't excede the max
		if ( (Vehicles_attacking < max_vehicles) and (not vehicle_is_destroyed(vehicle)) ) then

			-- Set vehicle class specific parameters
			-- (speed override is set later or vehicles will begin driving immediately)
			if (vehicle_data["type"] == "car") then
				vehicle_max_speed(vehicle, rn04_get_parameter_value("CAR_CHASE_SPEED"))
			elseif (vehicle_data["type"] == "bike") then
				vehicle_max_speed(vehicle, rn04_get_parameter_value("BIKE_CHASE_SPEED"))
			end

			thread_new("rn04_roadblock_vehicle_attack",roadblock_name,vehicle)

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

function rn04_roadblock_vehicle_attack(roadblock_name, vehicle)
	
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
		on_vehicle_destroyed("rn04_chase_vehicle_destroyed", vehicle)

		-- increment attacking count
		Vehicles_attacking = Vehicles_attacking + 1
	
	else
		
		-- If none of the potential passengers are alive, then release the vehicle
		release_to_world(vehicle)

	end

end

-- Tidy up a roadblock complication.
-- Releases npcs which aren't in a vehicle, and are far from the player(s) they were probably left behind.
function rn04_roadblock_cleanup(roadblock_name)
	for i,npc in pairs(CHASES_AND_AMBUSHES[roadblock_name]["on_foot"]) do
		if (not character_is_in_vehicle(npc)) then
			release_to_world(npc)
		end
	end
end

function rn04_chase_or_ambush_location_reached()
	Chase_or_ambush_sent = true
end

-- Get the value of the mission parameter.
--
-- parameter	Mission parameter whose value the function should return
--	i				If the parameter is a table, then i indexes the entry that should be returned
--
-- Returns mission paramater value.
function rn04_get_parameter_value(parameter, i)

	local return_val = nil

	-- Check for an overloaded value for coop missions.
	if (IN_COOP and return_val == nil) then
		if (i) then
			if (RN04_PARAMETERS["COOP_" .. parameter] ~= nil) then
				return_val = RN04_PARAMETERS["COOP_" .. parameter][i]
			end
		else
			return_val = RN04_PARAMETERS["COOP_" .. parameter]
		end
	end

	-- Get the standard value
	if (return_val == nil) then
		if (i) then
			if (RN04_PARAMETERS[parameter] ~= nil) then
				return_val = RN04_PARAMETERS[parameter][i]
			end
		else
			return_val = RN04_PARAMETERS[parameter]
		end
	end

--	cash_add(1,return_val)
	return return_val
end

-- Helptext functions
function rn04_add_high_priority_helptext(helptext)
	if (helptext ~= nil) then
		Helptext_queue_high_priority_last = Helptext_queue_high_priority_last + 1
		Helptext_queue_high_priority[Helptext_queue_high_priority_last] = helptext
	end	
end

function rn04_add_low_priority_helptext(helptext)
	if (helptext ~= nil) then
		Helptext_queue_low_priority_last = Helptext_queue_low_priority_last + 1
		Helptext_queue_low_priority[Helptext_queue_low_priority_last] = helptext
	end	
end

-- Display queued helptext
function rn04_display_helptext()

	while(true) do

		-- If there is a high priority message queued up, display it
		if ( Helptext_queue_high_priority_last >= Helptext_queue_high_priority_first) then
			local high_priority_message = Helptext_queue_high_priority[Helptext_queue_high_priority_first]
			Helptext_queue_high_priority[Helptext_queue_high_priority_first] = nil
			Helptext_queue_high_priority_first = Helptext_queue_high_priority_first + 1
			mission_help_table(high_priority_message)
			delay(5.0)
			Last_message_displayed = high_priority_message
		-- Otherwise, if there is a low priority message in the queue, display it
		elseif ( Helptext_queue_low_priority_last >= Helptext_queue_low_priority_first) then
			local low_priority_message = Helptext_queue_low_priority[Helptext_queue_low_priority_first]
			Helptext_queue_low_priority[Helptext_queue_low_priority_first] = nil
			Helptext_queue_low_priority_first = Helptext_queue_low_priority_first + 1
			mission_help_table(low_priority_message)
			delay(5.0)
			Last_message_displayed = low_priority_message
		end
		thread_yield()

	end
end

function rn04_cleanup()

	IN_COOP = coop_is_active()

	turn_vulnerable(LOCAL_PLAYER)
	if (IN_COOP) then
		turn_vulnerable(REMOTE_PLAYER)
	end		

	--cellphone_remove(persona_trigger_get_player_prefix(LOCAL_PLAYER).."PLAYER_RON4_COME_L1")

	-- Reenable cell phone spawns
		cell_spawns_enable(true)

	-- Clear the hud timer
		hud_timer_stop(0)

	-- Allow normal spawning
		roadblocks_enable(true)
		ambient_gang_spawn_enable(true)
		spawning_allow_cop_ambient_spawns(true)
		spawning_pedestrians(true)
		spawning_vehicles(true)
		action_nodes_enable(true)
		city_chunk_set_all_civilians_fleeing("sr2_chunk182", false)

	-- reset global variables

		-- Reset the respawn distance
		npc_respawn_dist_reset()

		-- Reset traffic density
		set_traffic_density(1.00)

		-- Player(s) can enter/exit vehicles
		set_player_can_enter_exit_vehicles(LOCAL_PLAYER, true)
		if (IN_COOP) then
			set_player_can_enter_exit_vehicles(REMOTE_PLAYER, true)
		end

	-- reset notoriety
		notoriety_reset("Ronin")
		notoriety_set("Ronin",0)
		notoriety_force_no_spawn("Ronin", false) 
		notoriety_reset("Police")

	-- remove markers and callbacks

		-- Ronin in stage 1
		for i,ronin in pairs (MEMBERS_GROUP_STAGE_1_RONIN) do
			on_death("", ronin)
			on_respawn("", ronin)
			marker_remove_npc(ronin, SYNC_ALL)
		end

		-- GPS
		mission_waypoint_remove()

		-- Gat callbacks
		on_incapacitated("", CHARACTER_GAT)
		on_death("", CHARACTER_GAT)
		on_dismiss("", CHARACTER_GAT)

		-- Homie's vehice
		if ( (Rn04_vehicle_homie ~= "") and (vehicle_exists(Rn04_vehicle_homie) and (not vehicle_is_destroyed(Rn04_vehicle_homie)))) then
			on_vehicle_destroyed("",Rn04_vehicle_homie)
			vehicle_set_untowable(Rn04_vehicle_homie, false)
			vehicle_evacuate(Rn04_vehicle_homie)
		end
		group_destroy(GROUP_HOMIE)

	-- Remove followers
		if (npc_is_in_party(CHARACTER_GAT)) then
			npc_stop_following(CHARACTER_GAT)
		end

	-- Remove temporary weapon(s)
	if (Temp_weapons_given) then
		inv_weapon_remove_temporary(LOCAL_PLAYER, LOCAL_PLAYER_WEAPON)
		if (IN_COOP) then
			inv_weapon_remove_temporary(REMOTE_PLAYER, REMOTE_PLAYER_WEAPON)
		end
	end
end

function rn04_success()
	-- Called when the mission has ended with success
end

-- setup_homie_car
--
-- Prepares homie's vehicle for turret mode
--
function rn04_setup_homie_car(vehicle_homie)
		local hit_points = get_max_hit_points(vehicle_homie)
		
		vehicle_set_torque_multiplier(vehicle_homie, 1.2)
		vehicle_never_flatten_tires(vehicle_homie, true)
		set_max_hit_points(vehicle_homie, hit_points*rn04_get_parameter_value("HOMIE_VEHICLE_HEALTH_MULTIPLIER"))
		vehicle_max_speed(vehicle_homie, rn04_get_parameter_value("HOMIE_VEHICLE_SPEED_OVERRIDE"))
		vehicle_suppress_npc_exit(vehicle_homie, true)
		vehicle_prevent_explosion_fling(vehicle_homie,true)
		vehicle_set_allow_ram_ped(vehicle_homie,true)
		vehicle_set_crazy(vehicle_homie,true)
		vehicle_set_use_short_cuts(vehicle_homie, true)
		vehicle_infinite_mass(vehicle_homie, true)
		set_unjackable_flag(vehicle_homie, true)
		vehicle_set_untowable(vehicle_homie, true)
		vehicle_suppress_flipping(vehicle_homie, true)
		--vehicle_ignore_repulsors(vehicle_homie, true)
		--vehicle_disable_flee(vehicle_homie, true)
		--vehicle_disable_chase(vehicle_homie, true)
end

function rn04_complete()

	-- End the mission with success
	mission_end_success("rn04", "ro04-02", {"player_respawns_$DT_hospital", "player_respawns_$DT_hospital"})
end

function rn04_homie_phone_call()

	audio_play_conversation( HOMIE_PHONE_CONVERSATION, OUTGOING_CALL )

end

-- MISSION FAILURE FUNCTIONS --------------------------------

function rn04_failure_car_destroyed()
	-- End the mission, player's car destroyed
	mission_end_failure("rn04", HELPTEXT_FAILURE_CAR_DESTROYED)
end

function rn04_failure_gat_abandoned()
	-- End the mission, Gat abandoned
	mission_end_failure("rn04", HELPTEXT_FAILURE_GAT_ABANDONED)
end

function rn04_failure_gat_died()
	-- End the mission, Gat died
	mission_end_failure("rn04", HELPTEXT_FAILURE_GAT_DIED)
end

function rn04_debug_text(text, debug_type)

	if(DEBUG_TEXT_ENABLED[debug_type]) then
		mission_debug(text, 10, debug_type)
	end

end