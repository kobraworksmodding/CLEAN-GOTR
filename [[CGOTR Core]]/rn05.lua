-- rn05.lua
-- SR2 mission script
-- 3/28/07
-- 3/28/10 Update by IdolNinja to fix the cutscene crash bug. Eerie how it was on the three year anniversary of when the mission was last updated by Volition.

-- Cutscene crash fixes by IdolNinja
-- 3/11/2011


-- Note: the baggage cart's default speed (as of 10-5-07) is 65

-- Global constants ( ALL_CAPS means that they shouldn't be modified in running code, except for maybe	group_create_hidden(group) in a setup function )


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
			RN05_PARAMETERS	= 
				{	

					-- Stage 1, drive to airport
						
						-- single-player values
						["AIRPORT_DRIVE_TIME_MS"]	=	2*60*1000; -- Time constraint on the initial drive to the airport.

						-- coop values

					-- Stage 2, gate fight
					
						-- single-player values
						["ARRIVAL_GATE_SKULK_TIME_MS"]	=	5*1000;	-- Amount of time players should avoid notice before the 
																					-- flight arrives.

						-- coop values

					-- Stage 3, airport chase
					
						-- single-player values
						["PIERCE_BLATHER_CHANCE"]			= .33;	-- During chase, chance that random Pierce line is played
																				-- checked every 5 seconds.

						["RONIN_CART_HP"]						=	4000;	-- Hit points of the Ronin's cart.
						["RONIN_CART_DRIVER_HP"]			=	1000; -- Hit points of the cart's driver.
						["RONIN_CART_PASSENGER_HP"]		=	600; -- Hit points of the cart's passenger.

						["RONIN_CART_SPEED_JUMP_MPH"]		=	75;	-- Ronin drive the carts off the ledge at this speed

						["RONIN_CART_NORMAL_MAX_SPEED"]	=	65;	-- Max speed of the Ronin's cart under normal conditions.
						["RONIN_CART_THROTTLE_DIST"]		=	20;	-- If Ronin cart > this dist from the players, then we slow it down.
						["RONIN_CART_THROTTLE_SPEED"]		=	35;	-- Max speed for Ronin when far from player and not preparing to jump.

						["RONIN_BIKE_NORMAL_MAX_SPEED"]	=	75;	-- Max speed of the Ronin's cart under normal conditions.
						["RONIN_BIKE_THROTTLE_DIST"]		=	30;	-- If Ronin cart > this dist from the players, then we slow it down.
						["RONIN_BIKE_THROTTLE_SPEED"]		=	50;	-- Max speed for Ronin when far from player and not preparing to jump.

						["RONIN_CART_FAILURE_DIST"]		=	60;	-- Player(s) need to stay w/in this dist from the fleeing Ronin.
						["RONIN_BIKE_FAILURE_DIST"]		=	50;	-- Player(s) need to stay w/in this dist from the fleeing Ronin.
						["RONIN_DIST_FAILURE_TIME_S"]		=	20;	-- Time player(s) can exceed the above limits before mission fails.

						["CART_TORQUE_MODIFIER"]			= 1.9;	-- Modifier applied to all carts, helps get up stairs

						-- coop values

				}

	-- COOP MISSION? -- 
		IN_COOP	= false

	-- CHARACTERS --

		CHARACTER_PIERCE				= "rn05_$Cpierce"
		CHARACTER_CART_DRIVER		= "rn05_$c023"
		CHARACTER_CART_PASSENGER	= "rn05_$c024"

	-- CONVERSATIONS --

	   INTRO_CONVERSATION =
		{
			{ "RON5_INTRO_L1", CHARACTER_PIERCE, 1 },
			{ "PLAYER_RON5_INTRO_L2", LOCAL_PLAYER, 1 },
			{ "RON5_INTRO_L3", CHARACTER_PIERCE, 1 },
			{ "PLAYER_RON5_INTRO_L4", LOCAL_PLAYER, 1 },
			{ "RON5_INTRO_L5", CHARACTER_PIERCE, 1 },
		}

	   OUTRO_CONVERSATION =
		{
			{ "PLAYER_RON5_OUTRO_L1", LOCAL_PLAYER, 1 },
			{ "RON5_OUTRO_L2", CHARACTER_PIERCE, 1 },
			{ "PLAYER_RON5_OUTRO_L3", LOCAL_PLAYER, 1 },
		}
		
		--Radio station defines for radio changing conversation
		DEFAULT_RADIO_STATION =			3 --95.4 KRhyme FM
		PIERCE_PREFERRED_STATION_1 =	7 -- 102.4 Klassic FM
		PIERCE_PERFERRED_STATION_2 =	10 -- 105.0 The World
		
		RADIO_CONVERSATION1 = 
		{
			{ "RON5_BICKER_L1", CHARACTER_PIERCE, 1 },
		}
	
		RADIO_CONVERSATION2 =
		{
			{ "PLAYER_RON5_BICKER_L2", LOCAL_PLAYER, 0 },
			{ "RON5_BICKER_L3", CHARACTER_PIERCE, 0 }
		}
	
		RADIO_CONVERSATION3 =
		{
			{ "PLAYER_RON5_BICKER_L4", LOCAL_PLAYER, 0 },
			{ "RON5_BICKER_L5", CHARACTER_PIERCE, 0 }
		}

	-- CHECKPOINTS
		
		CHECKPOINT_START			= MISSION_START_CHECKPOINT			-- defined in ug_lib.lua
		CHECKPOINT_AIRPORT		= "rn05_arrived_at_airport"		-- players made it to the airport
		CHECKPOINT_CHASE			= "rn05_airport_chase"				-- players started the chase from the 2nd gate
		
	-- GROUPS --

		GROUP_PIERCE							= "rn05_$Gpierce"
		GROUP_COURTESY							= "rn05_$Gcourtesy"
		GROUP_COURTESY_COOP					= "rn05_$Gcourtesy_coop"
		GROUP_RONIN_GATE_C1					= "rn05_$Gronin_gate_c1"			-- Ronin waiting for Akuji @ the first gate (c1).
		GROUP_RONIN_REINFORCEMENTS			= "rn05_$Gronin_reinforcements"	-- Ronin spawned if the player approaches the
																								-- Ronin @ gate c1 too soon.
		GROUP_PASSENGERS_GATE_C1			= "rn05_$Gpassengers_gate_c1"		-- Passengers on the plane at gate C1.
		GROUP_RONIN_LTNTS_GATE_C1			= "rn05_$Gronin_ltnts_gate_c1"	-- Ronin Lieutenants on the plane at gate C1.

		GROUP_RONIN_CHASE						= "rn05_$Gronin_chase"				-- Ronin driving the cart in stage 3.
--		GROUP_CARTS								= "rn05_$Gcarts"						-- Carts used in stage 3

		GROUP_BIKES								= "rn05_$Gbikes"						-- Bikes sitting outside the airport in stage 3.

		-- Groups to destroy in cleanup

		-- Groups to release in cleanup
		TABLE_RELEASE_GROUPS		= {	GROUP_PASSENGERS_GATE_C1}
		
		TABLE_DESTROY_GROUPS		= {	GROUP_PIERCE, GROUP_COURTESY, GROUP_RONIN_GATE_C1, GROUP_RONIN_REINFORCEMENTS,
												GROUP_RONIN_LTNTS_GATE_C1, GROUP_RONIN_CHASE, GROUP_BIKES, 
												GROUP_PASSENGERS_GATE_C1}


		-- Coop groups to destroy in cleanup
		TABLE_COOP_DESTROY_GROUPS		= {	}

		-- Coop groups to release in cleanup
		TABLE_COOP_RELEASE_GROUPS		= {	}

	-- GROUP MEMBER TABLES -- 

		MEMBERS_GROUP_RONIN_GATE_C1			=	{	"rn05_$c000", "rn05_$c001", "rn05_$c002", "rn05_$c003", "rn05_$c004",
																"rn05_$c005", "rn05_$c006", "rn05_$c007"}

		MEMBERS_GROUP_RONIN_REINFORCEMENTS	=	{	"rn05_$c008", "rn05_$c009", "rn05_$c010", "rn05_$c011", "rn05_$c012"}

		MEMBERS_GROUP_PASSENGERS_GATE_C1		=	{	"rn05_$c017", "rn05_$c018", "rn05_$c019", "rn05_$c020", "rn05_$c021", 
																"rn05_$c022"}

		MEMBERS_GROUP_RONIN_LTNTS_GATE_C1	=	{	"rn05_$c013", "rn05_$c014", "rn05_$c015", "rn05_$c016"}
	
	-- HELPTEXT

		-- localized helptext messages

			-- Failure conditions

			HELPTEXT_FAILURE_AIRPORT_DRIVE			= "rn05_failure_airport_drive"		-- ## You didn't get to the airport in time.
			HELPTEXT_FAILURE_PIERCE_ABANDONED		= "rn05_failure_pierce_abandoned"	-- "Pierce was abandoned"
			HELPTEXT_FAILURE_PIERCE_DIED				= "rn05_failure_pierce_died"			-- "Pierce died"
			HELPTEXT_FAILURE_VEHICLE_DIST				= "rn05_failure_vehicle_dist"			-- ## You let the Ronin get away.

			-- Prompts
			HELPTEXT_PROMPT_LOCATION_ARRIVAL_GATE	= "rn05_prompt_location_arrival_gate"	-- ## Head to the arrival gate.
			HELPTEXT_PROMPT_KILL_LTNTS					= "rn05_prompt_kill_ltnts"					-- ## Kill the Ronin lieutenants.
			HELPTEXT_PROMPT_WARN_DIST					= "rn05_prompt_warn_dist"					-- ## The Ronin are getting away!
			HELPTEXT_PROMPT_LOCATION_SECOND_GATE	= "rn05_prompt_location_second_gate"	-- Akuji isn't here, check the rest of the terminal!
			HELPTEXT_PROMPT_HANG_BACK					= "rn05_prompt_hang_back"		--"## Lay low until Akuj's flight arrives."
			HELPTEXT_PROMPT_PLANE_LANDED				= "rn05_prompt_plane_landed"		-- ## Akuji's plane arrived, head to the gate.
			HELPTEXT_PROMPT_BACK_ENTRANCE				= "rn05_prompt_back_entrance"		-- ## Use the back entrance to bypass security.
			HELPTEXT_PROMPT_CHASE_CART					= "rn05_prompt_chase_cart"			-- ## Chase down and kill the fleeing Ronin!
			HELPTEXT_PROMPT_LOCATION_AIRPORT			= "rn05_prompt_location_airport"	-- ## Drive to the airport before the Ronin arrive!

			-- Objectives
			HELPTEXT_OBJECTIVE_LTNTS					= "rn05_objective_ltnts"			-- Ronin LT's killed: %s/%s		
			HELPTEXT_OBJECTIVE_VEHICLE_DIST			= "rn05_objective_vehicle_dist"	-- Time:

			-- Dialogue
			HELPTEXT_DIALOGUE_PIERCE_WARN				= "rn05_dialogue_pierce_warn"	-- "## Pierce: Damn, lots of Ronin here. Hang back until we spot Akuji."

	-- MOVERS

		-- Doors at gate C1
		MOVER_DOOR_GATE_C1_1		= "rn05_APHeli_Door050"
		MOVER_DOOR_GATE_C1_2		= "rn05_APHeli_Door080"

		MM_DOOR_AIRPORT_2 = "rn05_$MM_airport_door_1"
		MM_DOOR_AIRPORT_1	= "rn05_$MM_airport_door_2"

		-- Rails obstructing the chase path
		MM_RAIL_1 = "rn05_$MMrail_1"
		MM_RAIL_2 = "rn05_$MMrail_2"
		MM_RAIL_3 = "rn05_$MMrail_3"

	-- NAVPOINTS

		-- Player locations at the mission's start
		NAVPOINT_LOCAL_PLAYER_START		= "mission_start_sr2_city_$rn05"
		NAVPOINT_REMOTE_PLAYER_START		= "rn05_$remote_player_start"

		-- Navpoints to which player(s) and Pierce are teleported after arriving at the airport
		NAVPOINT_LOCAL_PLAYER_AIRPORT_START			= "rn05_$Nlocal_player_airport_start"
		NAVPOINT_REMOTE_PLAYER_AIRPORT_START		= "rn05_$Nremote_player_airport_start"
		NAVPOINT_PIERCE_AIRPORT_START					= "rn05_$Npierce_airport_start"

		NAVPOINT_ARRIVAL_GATE							= "rn05_$n000" -- Minimap location for 1st gate.

		-- When the passengers disembark at gate C1, civilians walk to these navpoints and are released to the world.
		NAVPOINT_CIVILIAN_ARRIVAL_DESTINATIONS		= {	"rn05_$n004", "rn05_$n005"}

		-- When the Lieutenants disembark at gate C1, they walk to these navpoints.
		NAVPOINT_LIEUTENANT_ARRIVAL_DESTINATIONS	= {	"rn05_$n001", "rn05_$n002", "rn05_$n003"}

		-- The location that the players are warped to after the outro cutscene finishes
		NAVPOINT_END_SUCCESS = "rn05_$Nplayer_end_success"

	-- TRIGGERS -- 
	
		TRIGGER_AIRPORT_ARRIVAL				= "rn05_$t000" -- Destination in drive-to-airport stage.
		TRIGGER_NEAR_GATE_C1					= "rn05_$t001" -- When hit, indicates that the player is near the first gate.
		TRIGGER_NEARER_GATE_C1				= "rn05_$t002" -- When hit, indicates that the player has been spotted by the
																		-- Ronin at the first gate.
		TRIGGER_NEAR_GATE_C3					= "rn05_$t003" -- Start end of stage 2 cutscene when a player enters this area.

		TRIGGER_BREADCRUMB_1					= "rn05_$t004"	-- Starts the breadcrumbed path to the back entrance of the airport.
		TRIGGER_BREADCRUMB_2					= "rn05_$t005"	-- Starts the breadcrumbed path to the back entrance of the airport.
		TRIGGER_BREADCRUMB_3					= "rn05_$t006"	-- Starts the breadcrumbed path to the back entrance of the airport.
		TRIGGER_BREADCRUMB_4					= "rn05_$t007"	-- Starts the breadcrumbed path to the back entrance of the airport.
		TRIGGER_BREADCRUMB_5					= "rn05_$t008"	-- Starts the breadcrumbed path to the back entrance of the airport.

		-- List of all triggers, makes cleaning up more convenient
		TABLE_ALL_TRIGGERS		= {	TRIGGER_AIRPORT_ARRIVAL, TRIGGER_NEAR_GATE_C1, TRIGGER_NEARER_GATE_C1,
												TRIGGER_NEAR_GATE_C3, TRIGGER_BREADCRUMB_1, TRIGGER_BREADCRUMB_2,
												TRIGGER_BREADCRUMB_3, TRIGGER_BREADCRUMB_4, TRIGGER_BREADCRUMB_5}		

	-- VEHICLES --

		VEHICLE_RONIN_CART					= "rn05_$v001"
		VEHICLE_PLAYER_CART					= "rn05_$v002"

		VEHICLE_RONIN_BIKE					= "rn05_$v003"
		VEHICLE_PLAYER_BIKE					= "rn05_$v004"

	-- MISC CONSTANTS

		ESCAPE_PATH2 = {	"rn05_$n006",
								"rn05_$n007",
								"rn05_$n008",
								"rn05_$n009",
								"rn05_$n010",
								"rn05_$n011",
								"rn05_$n012",
								"rn05_$n013"}

		ESCAPE_PATH	=	{	{"rn05_$n006", "normal"}, 
								{"rn05_$n007", "stairs"},
								{"rn05_$n008", "normal"},
								{"rn05_$n009", "normal"},
								{"rn05_$n010", "normal"},
								{"rn05_$n011", "stairs"},
								{"rn05_$n012", "normal"},
								{"rn05_$n013", "normal"},
								{"rn05_$n014", "jump"},
								{"rn05_$n015", "fast"},
								{"rn05_$n016", "fast"},
							}

		JUMP_DELAY	=	{	["rn05_$n014"]	=	3.0
							}

-- Progress flags
	Gate_c1_ltnts_killed						= false -- Have the ltnts that disembark at C1 been killed?

-- Misc
	Players_near_gate_c3						= 0 -- # players in TRIGGER_NEAR_GATE_C3
	Timing_dist_failure						= false -- Is the player out of range in stage 3?
	Escape_vehicle								= VEHICLE_RONIN_CART
	Thread_ronin_escape						= -1

-- CUTSCENES --
-- Added by IdolNinja. These variables are used in the script for the cutscenes for stability instead of calling them directly

CUTSCENE_CHASE =	"IG_rn05_scene1"
CUTSCENE_IN = 		"ro05-01"
CUTSCENE_OUT = 		"ro05-02"
MISSION_NAME =		"rn05"

function rn05_start(rn05_checkpoint, is_restart)

	mission_start_fade_out()

	if (rn05_checkpoint == CHECKPOINT_START) then

		local start_groups = {GROUP_PIERCE, GROUP_COURTESY}
		if (coop_is_active()) then
			start_groups = {GROUP_PIERCE, GROUP_COURTESY, GROUP_COURTESY_COOP}
		end

		if (is_restart) then

			-- Teleport players to the start location
			teleport_coop(NAVPOINT_LOCAL_PLAYER_START,NAVPOINT_REMOTE_PLAYER_START)

			-- Load starting groups
			for i,group in pairs(start_groups) do
				group_create(group, true)
			end

		else

			-- Play the intro cutscene
			cutscene_play(CUTSCENE_IN, start_groups, {NAVPOINT_LOCAL_PLAYER_START,NAVPOINT_REMOTE_PLAYER_START}, false)
			for i,group in pairs(start_groups) do
				group_show(group)
			end

		end

	end
	
	rn05_initialize(rn05_checkpoint)

	local start_from_chase = (rn05_checkpoint == CHECKPOINT_CHASE)

	-- Stage 1: Drive to the airport
	if(rn05_checkpoint == CHECKPOINT_START) then

		rn05_drive_to_airport()

		mission_start_fade_out()
		rn05_initialize_checkpoint(CHECKPOINT_AIRPORT)
		mission_start_fade_in()

		-- CHECKPOINT!
		mission_set_checkpoint(CHECKPOINT_AIRPORT)
		rn05_checkpoint = CHECKPOINT_AIRPORT


	end -- ends CHECKPOINT_START

	-- Players have a gunfight w/ some Ronin at the gate where they think that Akuji will arrive
	if (rn05_checkpoint == CHECKPOINT_AIRPORT) then

		rn05_terminal_gun_fight()

		-- CHECKPOINT!
		mission_set_checkpoint(CHECKPOINT_CHASE)
		rn05_checkpoint = CHECKPOINT_CHASE

	end -- ends CHECKPOINT_AIRPORT

	-- Players chase 2 Ronin through the airport on baggage carts. If the Ronin manage to 
	-- escape the airport then they hop on some motorcycles and enter flee mode.
	if (rn05_checkpoint == CHECKPOINT_CHASE) then

		rn05_the_chase(start_from_chase)

		-- Both Ltnts have been killed, trigger success.
		rn05_complete()

	end
end

function rn05_initialize(checkpoint)

	rn05_initialize_common()

	rn05_initialize_checkpoint(checkpoint)

	-- No need to fade in before the cutscene
	if (checkpoint ~= CHECKPOINT_CHASE) then
		mission_start_fade_in()
	end

end

-- Initialization code shared by all checkpoints.
function rn05_initialize_common()

	-- Start trigger is hit...the activate button was hit
	set_mission_author("Phillip Alexander")

	if coop_is_active() then
		IN_COOP = true
	end

end

-- Initialization code specific to the checkpoint.
function rn05_initialize_checkpoint(checkpoint)

	if(checkpoint == CHECKPOINT_START) then
			
		-- Put Pierce in the player's party
		party_add(CHARACTER_PIERCE)

		if ( coop_is_active() == false ) then
			-- Find his current index
			local pierce_follower_index = party_get_follower_index(CHARACTER_PIERCE)

			-- If he's not the first follower, swap him and the first one
			if ( pierce_follower_index > 0 ) then
				party_swap_follower_indices( 0, pierce_follower_index )
				delay( 1.0 )
			end
		end

		on_death("rn05_failure_pierce_died", CHARACTER_PIERCE)
		on_dismiss("rn05_failure_pierce_abandoned", CHARACTER_PIERCE)

	end -- ends CHECKPOINT_START

	if (checkpoint == CHECKPOINT_AIRPORT) then

		on_death("rn05_failure_pierce_died", CHARACTER_PIERCE)
		on_dismiss("rn05_failure_pierce_abandoned", CHARACTER_PIERCE)

		group_create(GROUP_RONIN_GATE_C1,false)
		group_create(GROUP_PASSENGERS_GATE_C1, false)
		group_create(GROUP_RONIN_LTNTS_GATE_C1, false)

		character_evacuate_from_all_vehicles(LOCAL_PLAYER)
		character_evacuate_from_all_vehicles(CHARACTER_PIERCE)
		if (IN_COOP) then
			character_evacuate_from_all_vehicles(REMOTE_PLAYER)
		end

		-- Teleport players to the airport start location
		teleport_coop(NAVPOINT_LOCAL_PLAYER_AIRPORT_START, NAVPOINT_REMOTE_PLAYER_AIRPORT_START, true)
		teleport(CHARACTER_PIERCE, NAVPOINT_PIERCE_AIRPORT_START)

		-- Lock the doors at gate C1
		door_lock(MOVER_DOOR_GATE_C1_1, true)
		door_lock(MOVER_DOOR_GATE_C1_2, true)

		-- Setup a trigger to track when players are near gate C3 (used to start the cutscene)
		trigger_enable(TRIGGER_NEAR_GATE_C3,true)
		on_trigger("rn05_player_enter_gate_c3_area", TRIGGER_NEAR_GATE_C3)
		on_trigger_exit("rn05_player_exit_gate_c3_area", TRIGGER_NEAR_GATE_C3)
		trigger_set_delay_between_activations(TRIGGER_NEAR_GATE_C3,0)


	end -- ends CHECKPOINT_AIRPORT

	if (checkpoint == CHECKPOINT_CHASE) then

		if (not IN_COOP) then		
			on_death("rn05_failure_pierce_died", CHARACTER_PIERCE)
			on_dismiss("rn05_failure_pierce_abandoned", CHARACTER_PIERCE)
		end

		-- Setup stage 3...
			--thread_new("rn05_keep_doors_open")
			mesh_mover_hide(MM_DOOR_AIRPORT_1)
			mesh_mover_hide(MM_DOOR_AIRPORT_2)

			-- Hide the rails that obstruct the chase path
			mesh_mover_hide(MM_RAIL_1)
			mesh_mover_hide(MM_RAIL_2)
			mesh_mover_hide(MM_RAIL_3)

	end

end

function rn05_drive_to_airport()

	local dialog_thread = thread_new("rn05_play_drive_dialogue")

	-- Send the player(s) to a spot near the airport entrance
	rn05_send_to_location(	{	TRIGGER_BREADCRUMB_1},
									INGAME_EFFECT_VEHICLE_LOCATION, 
									{	HELPTEXT_PROMPT_LOCATION_AIRPORT}, 
									rn05_get_parameter_value("AIRPORT_DRIVE_TIME_MS"),
									"rn05_failure_airport_drive"
								)

	-- Send player(s) to the back door
	rn05_send_to_location(	{	TRIGGER_BREADCRUMB_2, 
										TRIGGER_BREADCRUMB_3, TRIGGER_BREADCRUMB_4,
										TRIGGER_BREADCRUMB_5, TRIGGER_AIRPORT_ARRIVAL
									},
									INGAME_EFFECT_VEHICLE_LOCATION, 
									{	HELPTEXT_PROMPT_BACK_ENTRANCE
									}
								)
	
	thread_kill(dialog_thread)

end

function rn05_terminal_gun_fight()

	-- Send player(s) to the airport C1 terminal.
	delay(1.0)
	rn05_persona_line_wrapper("PIERCE_RON5_FIRST_GATE_01", CHARACTER_PIERCE, false)

	-- Create the minimap marker near the gate.
	marker_add_navpoint(	NAVPOINT_ARRIVAL_GATE, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)

	-- Setup a trigger for when the players get close to the Ronin.
	rn05_send_to_location(	TRIGGER_NEAR_GATE_C1,
									nil, 
									HELPTEXT_PROMPT_PLANE_LANDED, 
									nil,
									nil)
	marker_remove_navpoint( NAVPOINT_ARRIVAL_GATE)

	-- Pierce spots the Ronin
	rn05_persona_line_wrapper("PIERCE_RON5_INTERCEPT_01", CHARACTER_PIERCE, false)

	-- Create a thread that will cause civilian passengers and Ronin ltnts to disembark from 
	-- the plane
	thread_new("rn05_gate_c1_disembark", rn05_get_parameter_value("ARRIVAL_GATE_SKULK_TIME_MS"))

	-- Wait for the ltnts to be killed.
	while (not Gate_c1_ltnts_killed) do
		thread_yield()
	end

	-- No Akuji here line
	rn05_persona_line_wrapper("PIERCE_RON5_TIPPED_01", CHARACTER_PIERCE, false)

	-- If there isn't a already near the gate, then place an icon and tell the player(s)
	-- to head that way.
	if (Players_near_gate_c3 == 0) then

		mission_help_table(HELPTEXT_PROMPT_LOCATION_SECOND_GATE)

		marker_add_navpoint(	TRIGGER_NEAR_GATE_C3, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)

		-- Wait until a player is near the gate
		while( Players_near_gate_c3 == 0) do
			thread_yield()
		end

		marker_remove_navpoint( TRIGGER_NEAR_GATE_C3)

	end

	-- Disable callbacks on the trigger tracking how many players are near gate C3
	trigger_enable(TRIGGER_NEAR_GATE_C3,false)
	on_trigger("", TRIGGER_NEAR_GATE_C3)
	on_trigger_exit("", TRIGGER_NEAR_GATE_C3)

end

function rn05_the_chase(start_from_chase)
	
	if (not start_from_chase) then
		mission_start_fade_out()
	end
	group_destroy(GROUP_RONIN_GATE_C1)
	group_destroy(GROUP_PASSENGERS_GATE_C1)
	group_destroy(GROUP_RONIN_LTNTS_GATE_C1)

	character_evacuate_from_all_vehicles(LOCAL_PLAYER)
	character_evacuate_from_all_vehicles(CHARACTER_PIERCE)
	if (IN_COOP) then
		character_evacuate_from_all_vehicles(REMOTE_PLAYER)
	end

	-- Destroy the old group.
	group_destroy(GROUP_RONIN_CHASE)

	-- Create a new group.
	group_create(GROUP_RONIN_CHASE, false)


	-- changed to new variable name instead of calling cutscene directly. Also cutscene play moved to after the groups are created and destroyed. IdolNinja
	cutscene_play(CUTSCENE_CHASE, "", "", false)

	rn05_initialize_checkpoint(CHECKPOINT_CHASE)

	-- start loading the bikes, place the Ronin in the carts
	group_create(GROUP_BIKES, false)
	vehicle_evacuate(VEHICLE_RONIN_CART)

	--delay(1.0)
	
	-- Ensure that pierce is the first homie
	if ( coop_is_active() == false ) then
		-- Find his current index
		local pierce_follower_index = party_get_follower_index(CHARACTER_PIERCE)

		-- If he's not the first follower, swap him and the first one
		if ( pierce_follower_index > 0 ) then
			party_swap_follower_indices( 0, pierce_follower_index )
			delay( 1.0 )
		end
	end

	vehicle_enter_teleport(CHARACTER_CART_DRIVER,VEHICLE_RONIN_CART,0)
	vehicle_enter_teleport(CHARACTER_CART_PASSENGER,VEHICLE_RONIN_CART,1)

	--delay(1.0)

	-- Set various flags on the escape vehicles before starting the chase. This needs to be done
	-- before the ronin are shown so that they don't start attacking the player(s) 
	-- before entering the cart.
	rn05_setup_ronin_escape_vehicle(VEHICLE_RONIN_CART)
	vehicle_set_torque_multiplier(VEHICLE_PLAYER_CART, rn05_get_parameter_value("CART_TORQUE_MODIFIER"))
	vehicle_set_torque_multiplier(VEHICLE_PLAYER_CART, rn05_get_parameter_value("CART_TORQUE_MODIFIER"))
	rn05_setup_ronin_escape_vehicle(VEHICLE_RONIN_BIKE)

	rn05_setup_player_cart_occupants()
	
	--delay(.2)

	-- Adjust the Ronin's health
	set_max_hit_points(CHARACTER_CART_DRIVER, rn05_get_parameter_value("RONIN_CART_DRIVER_HP"))
	set_max_hit_points(CHARACTER_CART_PASSENGER, rn05_get_parameter_value("RONIN_CART_PASSENGER_HP"))
	set_max_hit_points(VEHICLE_RONIN_CART, rn05_get_parameter_value("RONIN_CART_HP"))

	-- The Ronin drive out of the airport then flee from the closest player.
	Thread_ronin_escape = thread_new("rn05_ronin_escape")

	mission_start_fade_in(1.0)

-- Stage 3

	-- Wait for the player to kill the two fleeing Ronin ltnts.
	rn05_process_enemy_set(	{CHARACTER_CART_DRIVER, CHARACTER_CART_PASSENGER}, 
									HELPTEXT_PROMPT_CHASE_CART, 
									HELPTEXT_OBJECTIVE_LTNTS)

end

function rn05_setup_player_cart_occupants()

	-- Make sure that no random ped or vehicle spawns obstruct our vehicle
	spawning_pedestrians(false, true)
	spawning_vehicles(false)

	-- In single player, Pierce rides in the cart withg the player. The carts only
	-- hold 2 people, so we can't just place the client in the same cart. There really
	-- isn't a lot of room in the airport, so adding a 2nd cart is a bad idea. Instead,
	-- in Coop, Pierce just stays to "clean up"
	local passenger = CHARACTER_PIERCE
	if (IN_COOP) then
		passenger = REMOTE_PLAYER
		if (npc_is_in_party(CHARACTER_PIERCE)) then
			npc_stop_following(CHARACTER_PIERCE)
			on_death("", CHARACTER_PIERCE)
			on_dismiss("", CHARACTER_PIERCE)
		end
	end

	vehicle_enter_teleport(LOCAL_PLAYER, VEHICLE_PLAYER_CART,0)
	vehicle_enter_teleport(passenger, VEHICLE_PLAYER_CART,1)

	rn05_wait_for_vehicle_entry(LOCAL_PLAYER, VEHICLE_PLAYER_CART, 0)
	rn05_wait_for_vehicle_entry(passenger, VEHICLE_PLAYER_CART, 1)

	if (IN_COOP) then
		delay(1.0)
	end

	-- Reenable ped and vehicle spawning
	spawning_pedestrians(true, true)
	spawning_vehicles(true)	

end


-- Wait for a character to enter a vehicle. Blocks for a maximum of a second or two.
function rn05_wait_for_vehicle_entry(character, vehicle, seat_index)

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

-- Doors usually close on chunk load/reload... this keeps them open.
function rn05_keep_doors_open()
	while (true) do
		door_open(MM_DOOR_AIRPORT_1)
		door_open(MM_DOOR_AIRPORT_2)
		thread_yield()
	end
end


-- Stage 1 functions
Radio_dialogue_vehicle = ""

function rn05_play_drive_dialogue()

	local function rn05_in_same_vehicle()
		local player_vehicle = get_char_vehicle_name(LOCAL_PLAYER)
		if (player_vehicle ~= "") then
			return player_vehicle == get_char_vehicle_name(CHARACTER_PIERCE)
		else
			return false
		end
	end

	-- Wait for the players to get in the same vehicle
	while(not (rn05_in_same_vehicle())) do
		thread_yield()
	end
	
		
	delay(5)
	local player_vehicle = get_char_vehicle_name(LOCAL_PLAYER)
		
	if (rn05_in_same_vehicle()) then
		radio_set_station(player_vehicle, DEFAULT_RADIO_STATION)
	end
	
	delay(2)
	audio_play_conversation( INTRO_CONVERSATION)
	delay(10)
	
	--figure out what station the player is listening to and if its the one Pierce likes then redefine what he likes
	local player_station = radio_get_station(get_char_vehicle_name(LOCAL_PLAYER))
	local pierce_station = PIERCE_PREFERRED_STATION_1
		
	if (player_station == pierce_station) then
		pierce_station = PIERCE_PERFERRED_STATION_2
	end
	
	--Have the player and Pierce change the station while they argue about it.
	if (rn05_in_same_vehicle()) then
		audio_play_conversation(RADIO_CONVERSATION1)
		radio_set_station(player_vehicle, pierce_station)
		delay(2)
	end
	if (rn05_in_same_vehicle()) then
		audio_play_conversation(RADIO_CONVERSATION2)
	end
	if (rn05_in_same_vehicle()) then
		radio_set_station(player_vehicle, player_station)
		audio_play_conversation(RADIO_CONVERSATION3)
	end

end

Rn05_location_reached		= false
Rn05_current_trigger			= 1
Rn05_breadcrumb_triggers	= {}
Rn05_breadcrumb_helptext	= {}
Rn05_breadcrumb_effect		= ""
function rn05_send_to_location(trigger, effect, helptext, time, time_failure_function)

	Rn05_location_reached = false
	Rn05_breadcrumb_effect = false
	if (effect) then
		Rn05_breadcrumb_effect = effect
	end
	Rn05_current_trigger = 1
	Rn05_breadcrumb_triggers = {}
	Rn05_breadcrumb_helptext = {}

	-- Place triggers into a global table variable
	if ((type(trigger) == "table")) then
		Rn05_breadcrumb_triggers = trigger
	else
		Rn05_breadcrumb_triggers[1] = trigger
	end

	-- Same for helptext
	if ((type(helptext) == "table")) then
		Rn05_breadcrumb_helptext = helptext
	else
		Rn05_breadcrumb_helptext[1] = helptext
	end

	-- Add callbacks for all triggers, special callback for final trigger
	local num_breadcrumbs = sizeof_table(Rn05_breadcrumb_triggers)
	for i,breadcrumb in pairs(Rn05_breadcrumb_triggers) do
		trigger_enable(breadcrumb,true)
		if (i == num_breadcrumbs) then
			on_trigger("rn05_toggle_location_reached",breadcrumb)					
		else
			on_trigger("rn05_breadcrumb_reached", breadcrumb)
		end
	end

	if (effect) then
		marker_add_trigger(Rn05_breadcrumb_triggers[Rn05_current_trigger],MINIMAP_ICON_LOCATION,effect,SYNC_ALL)
		mission_waypoint_add( Rn05_breadcrumb_triggers[Rn05_current_trigger], SYNC_ALL )
	end

	-- Setup the time restraint if there is one.
	if (time and time_failure_function) then
		hud_timer_set(0, time, time_failure_function)
	end

	-- Display helptext
	if (Rn05_breadcrumb_helptext[1]) then
		mission_help_table(Rn05_breadcrumb_helptext[1])
	end

	-- Wait for player to arrive at the location
	while (not Rn05_location_reached) do
		thread_yield()
	end
	hud_timer_stop(0)

	Rn05_location_reached = false
end

function rn05_breadcrumb_reached(triggerer, trigger)

	-- Disable all breadcrumbs up to and including the one that we just hit
	for i = Rn05_current_trigger, sizeof_table(Rn05_breadcrumb_triggers), 1 do
		local breadcrumb = Rn05_breadcrumb_triggers[i]
		trigger_enable(breadcrumb,false)
		on_trigger("",trigger)
		marker_remove_trigger(trigger, SYNC_ALL)
		Rn05_current_trigger = i+1
		if(Rn05_breadcrumb_triggers[i] == trigger) then
			break
		end
	end

	-- Display helptext for the just-hit trigger.
	if (Rn05_breadcrumb_helptext[trigger]) then
		mission_help_table(Rn05_breadcrumb_helptext[trigger])
	end

	mission_waypoint_remove()

	-- Add an effect to the next trigger
	if (Rn05_breadcrumb_effect) then
		marker_add_trigger(Rn05_breadcrumb_triggers[Rn05_current_trigger],MINIMAP_ICON_LOCATION,Rn05_breadcrumb_effect,SYNC_ALL)
		mission_waypoint_add( Rn05_breadcrumb_triggers[Rn05_current_trigger], SYNC_ALL )
	end
end

function rn05_toggle_location_reached(triggerer,trigger)

	-- disable all breadcrumb triggers
	for i = Rn05_current_trigger, sizeof_table(Rn05_breadcrumb_triggers), 1 do
		local breadcrumb = Rn05_breadcrumb_triggers[i]
		trigger_enable(breadcrumb,false)
		on_trigger("",trigger)
		marker_remove_trigger(trigger, SYNC_ALL)
	end

	Rn05_location_reached = true		
	--trigger_enable(trigger, false)
	--marker_remove_trigger(trigger, SYNC_ALL)
	--on_trigger("",trigger)

	mission_waypoint_remove()
end

-- Stage 2 functions

-- Wait a bit and then cause passengers to disembark from the plane.
function rn05_gate_c1_disembark(delay_ms)

	-- Wait a bit
	delay(delay_ms * .001)

	-- Unlock and open airport terminal doors...
	door_lock(MOVER_DOOR_GATE_C1_1, false)
	door_lock(MOVER_DOOR_GATE_C1_2, false)
	door_open(MOVER_DOOR_GATE_C1_1)
	door_open(MOVER_DOOR_GATE_C1_2)
	-- Start disembarking
	local num_destination_navpoints = sizeof_table(NAVPOINT_CIVILIAN_ARRIVAL_DESTINATIONS)
	for i,passenger in pairs(MEMBERS_GROUP_PASSENGERS_GATE_C1) do
		thread_new(	"rn05_passenger_dismbark",
						passenger, 
						NAVPOINT_CIVILIAN_ARRIVAL_DESTINATIONS[rand_int(1,num_destination_navpoints)],
						true)
	end
	num_destination_navpoints = sizeof_table(NAVPOINT_LIEUTENANT_ARRIVAL_DESTINATIONS)
	for i,lieutenant in pairs(MEMBERS_GROUP_RONIN_LTNTS_GATE_C1) do
		thread_new(	"rn05_passenger_dismbark",
						lieutenant, 
						NAVPOINT_LIEUTENANT_ARRIVAL_DESTINATIONS[rand_int(1,num_destination_navpoints)],
						false)
	end

	-- Everyone is off the plane, player decides to take out the ltnts if any remain.
	local ltnts_remain = false
	for i, lieutenant in pairs (MEMBERS_GROUP_RONIN_LTNTS_GATE_C1) do
		if (not character_is_dead(lieutenant)) then
			ltnts_remain = true
			break
		end
	end

	-- Player(s) kill lieutenants are remaining at this point.
	rn05_process_enemy_set(MEMBERS_GROUP_RONIN_LTNTS_GATE_C1, HELPTEXT_PROMPT_KILL_LTNTS, HELPTEXT_OBJECTIVE_LTNTS)

	Gate_c1_ltnts_killed = true
end

function rn05_passenger_dismbark(passenger, destination, is_ped)
	if (is_ped == true) then
		flee_to_navpoint(passenger, destination)
		release_to_world(passenger)
	else
		set_blitz_flag(passenger,true)
		attack(passenger)
		npc_leash_to_nav(passenger, destination, 10)
	end
end

function rn05_player_enter_gate_c3_area()
	Players_near_gate_c3 = Players_near_gate_c3 + 1	
end

function rn05_player_exit_gate_c3_area()
	Players_near_gate_c3 = Players_near_gate_c3 - 1	
end

-- Stage 3 functions

function rn05_setup_ronin_escape_vehicle(escape_vehicle)
	vehicle_never_flatten_tires(escape_vehicle, true)
	vehicle_suppress_npc_exit(escape_vehicle, true)
	vehicle_prevent_explosion_fling(escape_vehicle,true)
	vehicle_set_allow_ram_ped(escape_vehicle,true)
	vehicle_set_crazy(escape_vehicle,true)
	vehicle_set_use_short_cuts(escape_vehicle, true)
	vehicle_infinite_mass(escape_vehicle, true)
	vehicle_ignore_repulsors(escape_vehicle, true)
	vehicle_disable_chase(escape_vehicle, true)
end

function rn05_ronin_escape()

	-- Override the cart's target speed when approaching stairs, throttle max speed when 
	-- the players are too far away.
	local cart_speed_override_thread = thread_new("rn05_ronin_cart_override_speed_near_stairs")
	local cart_speed_throttle_thread = thread_new("rn05_escape_vehicle_dist_throttle")
	thread_new("rn05_monitor_dist_failure")

	-- Pierce has a lot to say
	local pierce_cart_blather_thread = thread_new("rn05_pierce_cart_blather")

	-- The Ronin drive out of the airport and then flee the nearest player.
	vehicle_pathfind_to(VEHICLE_RONIN_CART,ESCAPE_PATH2, true, false)

	-- Kill cart speed monitoring threads so that we can take over during the jump
	thread_kill(cart_speed_override_thread)
	thread_kill(cart_speed_throttle_thread)

	-- Make sure that the speed override is canceled and that speed isn't throttled
	vehicle_speed_cancel(VEHICLE_RONIN_CART)

	-- We need the cart to drive off a ledge. To do this, we have the vehicle pathfind to a navpoint
	-- just before the ledge. We tell the vehicle not to stop at the end of the path, and we override
	-- its speed so that it doesn't slow down and go another way.
	vehicle_max_speed(VEHICLE_RONIN_CART, rn05_get_parameter_value("RONIN_CART_SPEED_JUMP_MPH"))
	vehicle_speed_override(VEHICLE_RONIN_CART, rn05_get_parameter_value("RONIN_CART_SPEED_JUMP_MPH"))
	vehicle_pathfind_to(VEHICLE_RONIN_CART, "rn05_$n014", true, false)

	-- Wait a little bit to give the cart time to get airborn.
	delay(.5)
	vehicle_speed_cancel(VEHICLE_RONIN_CART)
	vehicle_max_speed(VEHICLE_RONIN_CART, rn05_get_parameter_value("RONIN_CART_NORMAL_MAX_SPEED"))

	-- Retart throttling the Ronin's max speed when too far from the play.
	cart_speed_throttle_thread = thread_new("rn05_escape_vehicle_dist_throttle")

	--[[ TODO 11/14 replace this code, the delay is a hack to fix vehicle_in_air being broken.
	-- Wait for the cart to land before doing any more pathfinding.
	while (vehicle_in_air(VEHICLE_RONIN_CART)) do
		thread_yield()
	end
	]]
	-- TODO 11/14 when vehicle_in_air works, remove this delay
	delay(4.0)

	-- Pathfind to the edge of the freight room. Pathfinding currently has problems crossing the
	-- boundaries between interiors using super chunks, and regular exterior chunks. The cart is
	-- set to not stop at the end of the path, so we can wait for its momentum to carry it into
	-- the next chunk.
	vehicle_pathfind_to(VEHICLE_RONIN_CART, {"rn05_$n015", "rn05_$n016", "rn05_$n017", 
		"rn05_$n018", "rn05_$n019"}, true, false)
	vehicle_speed_override(VEHICLE_RONIN_CART, 30)
	delay(0.5)
	vehicle_speed_cancel(VEHICLE_RONIN_CART)

	-- Same trick
	vehicle_pathfind_to(VEHICLE_RONIN_CART, "rn05_$n020", true, false)
	vehicle_speed_override(VEHICLE_RONIN_CART, 30)
	delay(0.5)
	vehicle_speed_cancel(VEHICLE_RONIN_CART)

	-- Some of the cart lines sound better inside the aiport... so kill that thread off now
	-- that we're outside
	thread_kill(pierce_cart_blather_thread)

	-- The Cart is outside now, the ronin should get out and jump on the motorcycle
	vehicle_suppress_npc_exit(VEHICLE_RONIN_CART, false)
	vehicle_stop(VEHICLE_RONIN_CART,false)
	if (not character_is_dead(CHARACTER_CART_DRIVER)) then
		vehicle_exit(CHARACTER_CART_DRIVER)
	end
	if (not character_is_dead(CHARACTER_CART_PASSENGER)) then
		vehicle_exit(CHARACTER_CART_PASSENGER)
	end
	vehicle_enter_group({CHARACTER_CART_DRIVER, CHARACTER_CART_PASSENGER}, VEHICLE_RONIN_BIKE)
	Escape_vehicle = VEHICLE_RONIN_BIKE

	local dist, player = get_dist_closest_player_to_object(VEHICLE_RONIN_BIKE)
	vehicle_flee(VEHICLE_RONIN_BIKE, player)

end

-- Override the Cart's target speed near stairwells so that it doesn't go flying off into
-- a wall
function rn05_ronin_cart_override_speed_near_stairs()

	-- Navpoints at the top of the stairwells that we'll slow as we approach
	local slow_navpoints					= {"rn05_$n007", "rn05_$n011"}

	-- Distance from these navpoints at which speed should be throttled.
	local navpoint_override_dist	= {	["rn05_$n007"] = 15,
													["rn05_$n011"] = 15}

	-- Slow down when this close to the corresponding navpoint.
	local stop_override_dist		= {	["rn05_$n007"] = 5,
													["rn05_$n011"] = 0}

	-- Speed to slow down to.
	local navpoint_override_speed	= {	["rn05_$n007"] = 15,
													["rn05_$n011"] = 20}

	-- Closest distance that the Ronin cart has been to the navpoint. If the cart starts
	-- getting further away, we can go back to normal speed.
	local navpoint_closest_dist	= {	["rn05_$n007"] = 100,
													["rn05_$n011"] = 100}

	-- Is the cart's speed currently overriden?
	local speed_is_overriden = false

	while (not vehicle_is_destroyed(VEHICLE_RONIN_CART)) do

		-- Speed we should override to
		local override_speed = 100

		-- Should we be overriding speed now
		local should_override_speed = false

		-- See if we're nearing one of the navpoints that we should approach slowly.
		for i,navpoint in pairs (slow_navpoints) do
			
			-- get distance to the current navpoint
			local cur_dist = get_dist(VEHICLE_RONIN_CART,navpoint)

			-- If (1) within range AND (2) don't have slower speed from previous navpoint AND
			-- (3) not getting further from the navpoint, then override speed.
			if (	cur_dist < navpoint_override_dist[navpoint] and 
					navpoint_override_speed[navpoint] < override_speed and
					cur_dist < navpoint_closest_dist[navpoint]) then

				-- Record new closest distance
				navpoint_closest_dist[navpoint] = cur_dist

				-- If we haven't gotten close so close that we should stop overriding the speed
				if (cur_dist > stop_override_dist[navpoint]) then

					-- Record the new speed override
					override_speed = navpoint_override_speed[navpoint]
					should_override_speed = true
				end
			end
		end

		-- Start overriding speed if we weren't already and we need to
		if (should_override_speed and (not speed_is_overriden)) then
			vehicle_speed_override(VEHICLE_RONIN_CART, override_speed)
			speed_is_overriden = true
		-- Otherwise, if we were throttling and shouldn't be, then stop
		elseif (speed_is_overriden and (not should_override_speed)) then
			vehicle_speed_cancel(VEHICLE_RONIN_CART)
			speed_is_overriden = false
		end
		thread_yield()
	end
end

function rn05_pierce_cart_blather()

	-- Pierce isn't in the cart in coop.
	if(IN_COOP) then
		return
	end

	local blather_chance = rn05_get_parameter_value("PIERCE_BLATHER_CHANCE")

	while(true) do

		if(rand_float(0,1) < blather_chance and character_is_in_vehicle(CHARACTER_PIERCE, VEHICLE_PLAYER_CART)) then
			rn05_persona_line_wrapper("PIERCE_RON5_CHASE", CHARACTER_PIERCE, false)
		end
		delay(5.0)
		thread_yield()
	end
end

-- Monitor the distance between the player(s) and the escaping Ronin. Controls the
-- timer and displays hud messages for the out-of-range failure condition.
function rn05_monitor_dist_failure()

	local prev_escape_vehicle = ""

	local failure_dist = {	[VEHICLE_RONIN_CART] = rn05_get_parameter_value("RONIN_CART_FAILURE_DIST"),
									[VEHICLE_RONIN_BIKE] = rn05_get_parameter_value("RONIN_BIKE_FAILURE_DIST"),
								}

	local failure_time_ms = 1000 * rn05_get_parameter_value("RONIN_DIST_FAILURE_TIME_S")

	Timing_dist_failure = false

	while(not vehicle_is_destroyed(Escape_vehicle)) do

		-- Update the distance radar if we've switched vehicles
		if (Escape_vehicle ~= prev_escape_vehicle) then
			distance_display_off(SYNC_ALL)
			distance_display_on(Escape_vehicle,0,failure_dist[Escape_vehicle],0.0,failure_dist[Escape_vehicle], SYNC_ALL)
			prev_escape_vehicle = prev_escape_vehicle
		end

		local dist = get_dist_closest_player_to_object(Escape_vehicle)

		if (dist > failure_dist[Escape_vehicle] and not Timing_dist_failure and rn05_enemies_living > 0) then

			-- Tell the player(s) to catch up.
			mission_help_table(HELPTEXT_PROMPT_WARN_DIST, "", "", SYNC_LOCAL)

			-- Start the timer
			hud_timer_set(0, failure_time_ms,"rn05_ronin_escaped_failure")
			Timing_dist_failure = true

		elseif (dist < failure_dist[Escape_vehicle] and Timing_dist_failure) then

			-- Stop the timer
			hud_timer_stop(0)
			Timing_dist_failure = false

			-- Update the objective text
			objective_text(0, rn05_enemy_set_objective_helptext, rn05_enemies_to_kill - rn05_enemies_living, rn05_enemies_to_kill)

		end

		thread_yield()
	end

end

-- Throttle the Ronin escape vehicle's speed if it is too far from the player(s)
function rn05_escape_vehicle_dist_throttle()

	local param_prefix = "RONIN_CART_"
	if(Escape_vehicle == VEHICLE_RONIN_BIKE) then
		param_prefix = "RONIN_BIKE_"
	end

	-- Get the vehicle's non-throttled max speed, the distance at which we throttle, and the speed we throttle to
	local normal_speed	= rn05_get_parameter_value(param_prefix .. "NORMAL_MAX_SPEED")
	local throttle_dist	= rn05_get_parameter_value(param_prefix .. "THROTTLE_DIST")
	local throttle_speed = rn05_get_parameter_value(param_prefix .. "THROTTLE_SPEED")

	-- Is the vehicle's speed currently throttled?
	local speed_is_throttled = false

	-- Set the vehicle's initial max speed.
	local initial_throttled_speed = 0
	speed_is_throttled, initial_throttled_speed	= rn05_get_escape_vehicle_dist_throttle(throttle_dist, throttle_speed)
	if (speed_is_throttled) then
		vehicle_max_speed(Escape_vehicle, initial_throttled_speed)
	end

	-- Monitor distance and adjust speed accordingly.
	while (not vehicle_is_destroyed(Escape_vehicle)) do

		-- See if we need to throttle the speed because we're too far from the player(s):
		local should_throttle_speed, throttled_speed = rn05_get_escape_vehicle_dist_throttle(throttle_dist, throttle_speed)

		-- Throttle speed if we need to
		if (should_throttle_speed and (not speed_is_throttled)) then
			speed_is_throttled = true
			vehicle_max_speed(Escape_vehicle, throttled_speed)
		-- Otherwise, if we were throttling, then stop
		elseif (speed_is_throttled and (not should_throttle_speed)) then
			speed_is_throttled = false
			vehicle_max_speed(Escape_vehicle, normal_speed)
		end
		thread_yield()
	end
end

-- Returns 2 values: shouldThrottle, throttleSpeed
-- shouldThrottle = should we throttle the bike based on the distance to the player?
-- 
function rn05_get_escape_vehicle_dist_throttle(throttle_dist, throttle_speed)
	local dist = get_dist_closest_player_to_object(Escape_vehicle)
	if (dist > throttle_dist) then
		return true,throttle_speed
	else
		return false, 0
	end
end


--[[
function rn05_gate_ronin_attack()

	for i, ronin in pairs(MEMBERS_GROUP_RONIN_GATE_C1) do
		attack_safe(ronin)
	end

end
]]
rn05_enemies_to_kill = 0
rn05_enemies_living = 0
rn05_enemy_set_objective_helptext = ""

-- Wait for the player to kill a group of enemies
-- 
-- enemy_table				A table containing the names of the enemies that need to be killed
-- mission_helptext		The helptext message that will prompt the player(s) to kill the enemies
-- objective_helptext	The objective text displayed in the hud, needs to be in the format %s of %s killed
function rn05_process_enemy_set(enemy_table, mission_helptext, objective_helptext)

	-- Setup kill tracking numbers
	rn05_enemies_to_kill = sizeof_table(enemy_table)
	rn05_enemies_living =  0	-- We'll count living enemies when assigning callbacks in case the player already
										-- killed some.

	-- Assign enemy callbacks, add markers
	for i, enemy in pairs(enemy_table) do
		if ( not character_is_dead(enemy)) then
			on_death("rn05_enemy_killed", enemy)
			marker_add_npc(enemy, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL) 
			rn05_enemies_living = rn05_enemies_living + 1
		end
	end

	if (rn05_enemies_living > 0) then

		-- Display the objective text
		if(objective_helptext and not (Timing_dist_failure)) then
			rn05_enemy_set_objective_helptext = objective_helptext
			objective_text(0, rn05_enemy_set_objective_helptext, rn05_enemies_to_kill - rn05_enemies_living, rn05_enemies_to_kill)
		end

		-- Display the help text
		if(mission_helptext) then
			mission_help_table(mission_helptext)
		end

	end

	while (rn05_enemies_living > 0) do
		thread_yield()
	end

	if(objective_helptext) then
		objective_text_clear(0)
	end

end

function rn05_enemy_killed(enemy)
	marker_remove_npc(enemy)
	on_death("",enemy)
	rn05_enemies_living = rn05_enemies_living - 1
	if (rn05_enemies_living < 1) then
		objective_text_clear(0)
		hud_timer_stop(0)
		rn05_enemy_set_objective_helptext = ""
	else
		if (rn05_enemy_set_objective_helptext ~= "" and (not Timing_dist_failure)) then
			objective_text(0, rn05_enemy_set_objective_helptext, rn05_enemies_to_kill - rn05_enemies_living, rn05_enemies_to_kill)
		end
	end

	-- If the cart's driver is killed, make the passenger get out and flee
	if (enemy == CHARACTER_CART_DRIVER) then
		if (not character_is_dead(CHARACTER_CART_PASSENGER)) then

			thread_kill(Thread_ronin_escape)

			vehicle_suppress_npc_exit(Escape_vehicle, false)

			if (character_is_in_vehicle(CHARACTER_CART_PASSENGER)) then
				vehicle_exit(CHARACTER_CART_PASSENGER)
			end

			-- Just attack.
			if (not character_is_dead(CHARACTER_CART_PASSENGER)) then
				attack(CHARACTER_CART_PASSENGER)
			end

		end
	end

end

-- Other functions

function rn05_cleanup()

	-- Reenable ped and vehicle spawning
	spawning_pedestrians(true, true)
	spawning_vehicles(true)	

	-- Reset the radio
	if ((Radio_dialogue_vehicle ~= "") and (not vehicle_is_destroyed(Radio_dialogue_vehicle))) then
		vehicle_set_radio_controls_locked(Radio_dialogue_vehicle, false)
	end


	-- reset global variables

	-- reset notoriety
		
	-- remove markers
		marker_remove_navpoint( NAVPOINT_ARRIVAL_GATE)

	-- remove callbacks

		-- remove pierce's callbacks
		on_death("", CHARACTER_PIERCE)
		on_dismiss("", CHARACTER_PIERCE)

		-- disable all triggers, remove callbacks, remove from map
		for i, trigger in pairs(TABLE_ALL_TRIGGERS) do
			on_trigger("",trigger)
			trigger_enable(trigger,false)
			marker_remove_trigger(trigger)
		end
	
	--turn off timers
	hud_timer_stop(0)
	
	
	-- destroy/release groups as appropriate
		for i,group in pairs(TABLE_RELEASE_GROUPS) do
			release_to_world(group)
		end
		for i,group in pairs(TABLE_DESTROY_GROUPS) do
			group_destroy(group)
		end
		if (IN_COOP) then
			for i,group in pairs(TABLE_COOP_DESTROY_GROUPS) do
				group_destroy(group)
			end
			for i,group in pairs(TABLE_COOP_RELEASE_GROUPS) do
				release_to_world(group)
			end
		end
end

function rn05_success()
	-- Called when the mission has ended with success
end

function rn05_complete()

	-- Outro conversation, Pierce isn't around in coop
	if(not IN_COOP) then
		audio_play_conversation(OUTRO_CONVERSATION)
	end

	-- Play the success movie
	delay(.5)
	--bink_play_movie("ro05-2.bik")

	-- End the mission with success
	mission_end_success(MISSION_NAME, CUTSCENE_OUT, {NAVPOINT_END_SUCCESS, NAVPOINT_END_SUCCESS})
end

-- Get the value of the mission parameter.
--
-- parameter	Mission parameter whose value the function should return
--	i				If the parameter is a table, then i indexes the entry that should be returned
--
-- Returns mission paramater value.
function rn05_get_parameter_value(parameter, i)

	local return_val = nil

	-- Check for a coop value:
	if (IN_COOP) then
		if (i) then
			if (RN05_PARAMETERS["COOP_" .. parameter] ~= nil) then
				return_val = RN05_PARAMETERS["COOP_" .. parameter][i]
			end
		else
			return_val = RN05_PARAMETERS["COOP_" .. parameter]
		end
	end

	-- Get the standard value
	if (return_val == nil) then
		if (i) then
			if (RN05_PARAMETERS[parameter] ~= nil) then
				return_val = RN05_PARAMETERS[parameter][i]
			end
		else
			return_val = RN05_PARAMETERS[parameter]
		end
	end

	return return_val
end

function rn05_group_create_maybe_coop(group_always, group_coop, blocking)
	group_create(group_always, blocking)
	if (IN_COOP) then
		group_create(group_coop, blocking)
	end
end

function rn05_group_loaded_maybe_coop(group_always, group_coop)
	local group_always_is_loaded = group_is_loaded(group_always)
	if (IN_COOP) then
		return (group_always_is_loaded and group_is_loaded(group_always))
	else
		return group_always_is_loaded
	end
end

function rn05_group_create_hidden_maybe_coop(group_always, group_coop)
	group_create_hidden(group_always)
	if (IN_COOP) then
		group_create_hidden(group_coop)
	end
end

function rn05_group_show_maybe_coop(group_always, group_coop)
	group_show(group_always)
	if (IN_COOP) then
		group_show(group_coop)
	end
end

function rn05_release_to_world_maybe_coop(always, coop)
	release_to_world(always)
	if (IN_COOP) then
		release_to_world(coop)
	end
end

function rn05_persona_line_wrapper(audio_name, character, blocking)
	audio_play_for_character(audio_name, character, "voice", false, blocking)
end

-- MISSION FAILURE FUNCTIONS --------------------------------

-- End the mission, Pierce abandoned
function rn05_failure_pierce_abandoned()
	mission_end_failure(MISSION_NAME, HELPTEXT_FAILURE_PIERCE_ABANDONED)
end

-- End the mission, Pierce died
function rn05_failure_pierce_died()
	mission_end_failure(MISSION_NAME, HELPTEXT_FAILURE_PIERCE_DIED)
end

-- End the mission, the player(s) didn't arrive at the airport in time
function rn05_failure_airport_drive()
	mission_end_failure(MISSION_NAME, HELPTEXT_FAILURE_AIRPORT_DRIVE)
end

-- End the mission, the player(s) were too far from the Ronin's escape
-- cart for too long.
function rn05_ronin_escaped_failure()
	mission_end_failure(MISSION_NAME, HELPTEXT_FAILURE_VEHICLE_DIST)
end
