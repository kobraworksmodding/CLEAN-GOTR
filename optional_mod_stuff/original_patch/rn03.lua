-- rn03.lua
-- SR2 mission script
-- 3/28/07

-- Global constants ( ALL_CAPS means that they shouldn't be modified in running code, except for maybe in a setup function )

-- 21 - 23

	-- KNOBS_TO_TURN --

		-- If set to TRUE, Ronin bikes are automatically detonated if their driver is killed
			AUTO_DETONATE_RIDERLESS_BIKES	= false
			-- Before detonating the bike, we make it start smoking and then catch on fire. These params control that process.
				BIKE_SMOKE_TO_FIRE_DELAY_S		= .50		-- Delay between starting a bike smoking and catching it on fire
				BIKE_FIRE_TO_EXPLODE_DELAY_S	= .50		-- Delay between the bike starting on fire, and it exploding	

		-- Maximum Ronin notoriety throughout the mission
			RONIN_NOTORIETY_MAX				= 2
			POLICE_NOTORIETY_MAX			= 2

		-- Hit points of player bike(s)
			PLAYER_BIKE_HIT_POINTS			= 3000

		-- Stage 1: fight initial convoy


			--[[ *** READ ME ***
			
				In Coop, the players can chose to drive separately or ride together. If they chose the latter option,
				then the passenger is free to concentrate on shooting, which makes the mission much easier. For this reason,
				I've decided to create three sets of parameters for each wave: one for single player, one for coop on 
				separate vehicles, and one for coop on the same vehicle.

				Whenever a script function looks up a wave parameter, a naming convention is used to select the appropriate value.
				Parameter values for single player missions can use any name, say "PARAMETER_1" for example. If you wish to have
				a different value for that parameter in coop, then prepend "COOP" to the parameter name. In this case, we get
				"COOP_PARAMETER_1". If yet another value is desired for coop missions when both players are on the same bike, then
				use the prefix "COOP_SAME_BIKE", which gives us "COOP_SAME_BIKE_PARAMETER_1".

				When a mission function needs to access "PARAMETER_1", it will search for the appropriate overloaded values first:

					*	Single player will use the value stored in "PARAMETER_1".
				
					*	Different-vehicle coop will use the value stored in "COOP_PARAMETER_1", if it exists. Otherwise it will use the
						default single player value stored in "PARAMETER_1".
				
					*	Same-vehicle adds another step, looking for "COOP_SAME_BIKE_PARAMETER_1", then "COOP_PARAMETER_1", then 
						"PARAMETER_1"

				In some situations, you may want a parametr to have the same value in single player and normal coop, but a different
				value if both players are on the same bike. I've done this with the "TRAFFIC_DENSITY" parameter by adding 
				"COOP_SAME_BIKE_TRAFFIC_DENSITY". When both players are on the same bike, one player can concentrate on driving 
				while the other player concentrates on shooting, so I think it makes sense to increase the traffic density. If you 
				want the same density no matter, what, just remove the "COOP_SAME_BIKE_TRAFFIC_DENSITY" entry in the WAVE_PARAMETERS
				table. No other code changes are needed.

				In a coop mission, if the players play for a while on separate bikes, and then switch to the same bike, or vice versa,
				only some of the parameters will be adjusted dynamically. Traffic density, for example, is set whenever a new wave
				is created. If the players get to the start of a new wave on the same bike, and subsequently split up, then they will
				have to deal with the higher traffic density. If this becomes a problem, then I could add code to remedy the
				situation. Here is the list of parameters, and whether or not they are dynamically updated:

				"START_DIST_M"			no
				"TRAFFIC_DENSITY"		yes
				"SLOW_SPEED"			yes
				"FAST_SPEED"			yes
				"CLOSE_RANGE_M"		yes
				"BIKE_HP"				no
				"DRIVER_HP"				no
				"MAX_RONIN"				no

			 ]]

			TEST_PATH	=
			{
				"rn03_$n000";
				{	
					"rn03_$n046",
					"rn03_$n047",
				};
			}

			-- Wave parameters
			WAVE_PARAMETERS	= 
				{	
					["wave_1"]	=	{	
											-- A wave of bikers starts pathfinding when a player gets too close or too far to the
											-- first bike's location
											["START_DIST_NEAR_M"]= 150,	-- Start wave pathfinding when a player gets this close
											["START_DIST_FAR_M"]	= 200,	-- Start wave pathfinding when a player gets this far

											["TRAFFIC_DENSITY"]	= .40,	-- Traffic density during wave. (1.00 is normal)
											["SLOW_SPEED"]			= 50,		-- Speed of Ronin when player is in close range
											["FAST_SPEED"]			= 65,		-- Speed of Ronin when player is not in close range
											["CLOSE_RANGE_M"]		= 50,		-- Distance considered to be close range
											["BIKE_HP"]				= 500,	-- Bike's Hit Points
											["DRIVER_HP"]			= 250,	-- Driver's Hit Points
											["MAX_RONIN"]			= 0,		-- The maximum number of Ronin that can be on non-disabled
																					-- bikes after this wave spawns. If the number is 0, then
																					-- all Ronin in the current wave will spawn regardless of the
																					-- number of Ronin already active.
											["BIKES"]				= {	"rn03_$v000", "rn03_$v001", "rn03_$v002", "rn03_$v007"}, -- Bikes in this wave
											["DRIVERS"]				= {	"rn03_$c000", "rn03_$c001", "rn03_$c002", "rn03_$c004"}, -- Drivers in this wave
											["PASSENGERS"]			= {	"rn03_$c003", "rn03_$c012", "rn03_$c013", "rn03_$c014"},	-- Passengers in this wave

											["PATH"]					= {	{	"rn03_$n003", "rn03_$n004", "rn03_$n021", "rn03_$n022", "rn03_$n023"},
																				{  "rn03_$n024", "rn03_$n025", "rn03_$n026", "rn03_$n027", "rn03_$n028"},
																				{	"rn03_$n029", "rn03_$n030", "rn03_$n031", "rn03_$n032", "rn03_$n033"}, 
																				{	"rn03_$n034", "rn03_$n035", "rn03_$n036", "rn03_$n037", "rn03_$n038"}, 
																				{	"rn03_$n039", "rn03_$n040", "rn03_$n041", "rn03_$n042", "rn03_$n043"},
																			},

											-- coop values
											["COOP_BIKE_HP"]				= 1000,
											["COOP_DRIVER_HP"]			= 500,

											-- coop, on same bike values
											["COOP_SAME_BIKE_TRAFFIC_DENSITY"]	= .60
										};

					["wave_2"]	=	{	["START_DIST_NEAR_M"]		= 150,	
											["TRAFFIC_DENSITY"]	= .60, 
											["SLOW_SPEED"]			= 50,  
											["FAST_SPEED"]			= 65,  
											["CLOSE_RANGE_M"]		= 65,  
											["BIKE_HP"]				= 1000,	-- Bike's Hit Points
											["DRIVER_HP"]			= 500,	-- Driver's Hit Points
											["MAX_RONIN"]			= 5,
											["BIKES"]				= {	"rn03_$v003", "rn03_$v004", "rn03_$v006"},
											["DRIVERS"]				= {	"rn03_$c005", "rn03_$c006", "rn03_$c008"},
											["PASSENGERS"]			= {	"rn03_$c009", "rn03_$c010", "rn03_$c011"},
											["PATH"]					= {	{	"rn03_$n004", "rn03_$n021", "rn03_$n022", "rn03_$n023", "rn03_$n024" },
																			{	"rn03_$n025", "rn03_$n026", "rn03_$n027" }, 
																			{	"rn03_$n028", "rn03_$n029", "rn03_$n030", "rn03_$n031", "rn03_$n032" },
																			{	"rn03_$n033", "rn03_$n034", "rn03_$n035" },
																			{	"rn03_$n036", "rn03_$n037", "rn03_$n038", "rn03_$n039", "rn03_$n040" },
																			{	"rn03_$n041", "rn03_$n042", "rn03_$n043" }
																			},
											-- coop values
											["COOP_BIKE_HP"]				= 1200,
											["COOP_DRIVER_HP"]			= 600,

											-- coop, on same bike values
											["COOP_SAME_BIKE_TRAFFIC_DENSITY"]	= .80
										}
				}

	-- COOP MISSION? -- 
		IN_COOP	= false

	-- CHARACTERS --

	-- CHECKPOINTS
		
		CHECKPOINT_START						= MISSION_START_CHECKPOINT		-- defined in ug_lib.lua
		CHECKPOINT_LIEUTENANTS				= "rn03_checkpoint_lieutenants"

	-- GROUPS --

		GROUP_PLAYER_BIKE_1	= "rn03_$Gplayer_bike_1"
		GROUP_PLAYER_BIKE_2	= "rn03_$Gplayer_bike_2"
		GROUP_RONIN_WAVE_1	= "rn03_$Gronin_wave_1"
		GROUP_RONIN_WAVE_2	= "rn03_$Gronin_wave_2"

		-- List of all groups, makes cleaning up more convenient
		TABLE_ALL_GROUPS			= {	GROUP_PLAYER_BIKE_1, GROUP_RONIN_WAVE_1, GROUP_RONIN_WAVE_2}

		TABLE_ALL_COOP_GROUPS	= {	GROUP_PLAYER_BIKE_2}

	-- GROUP MEMBER TABLES -- 

	-- HELPTEXT

		-- localized helptext messages
		HELPTEXT_PROMPT_BIKE					= "rn03_prompt_bike"					-- "Use the bike to intercept the Ronin."
		HELPTEXT_PROMPT_KILL_RONIN			= "rn03_prompt_kill_ronin"			-- "Take out the Ronin before they get to your turf!" 
		HELPTEXT_PROMPT_WARNING				= "rn03_prompt_warning"				-- "You have X targets left, hurry and take them out before they get away!" 
		HELPTEXT_PROMPT_KILL_LIEUTENANTS = "rn03_prompt_kill_lieutenants" -- "Chase the Ronin lieutenants down and kill them." 
		HELPTEXT_PROMPT_ANOTHER_GROUP		= "rn03_prompt_another_group"		-- "Careful, there's another group of Ronin ahead"
		HELPTEXT_PROMPT_MORE_RONIN			= "rn03_prompt_more_ronin"			--	"More Ronin have joined the fight!"
		HELPTEXT_PROMPT_REINFORCEMENTS	= "rn03_prompt_ronin_reinforcements" -- Intercept the Ronin reinforcements downtown.
		HELPTEXT_PROMPT_BIKE_DESTROYED	= "rn03_prompt_bike_destroyed"	-- "Ronin bike disabled!" 
		HELPTEXT_PROMPT_CROSSING_BRIDGE	= "rn03_prompt_crossing_bridge"	-- "The Ronin are crossing the bridge to Saints HQ!"
		HELPTEXT_PROMPT_ALMOST_THERE		= "rn03_prompt_almost_there"			-- "The Ronin are almost at Saints HQ!"
		HELPTEXT_PROMPT_REENTER_BIKE		= "rn03_prompt_reenter_bike"		-- "Get back on the bike"

		HELPTEXT_FAILURE_DISTANCE			= "rn03_failure_distance"			-- "You let too many Ronin get past you."
		HELPTEXT_FAILURE_RANGE				= "rn03_failure_range"				-- "You let the Ronin get away."
		HELPTEXT_FAILURE_BIKE_DESTROYED  = "rn03_failure_bike_destroyed"  -- "Motorcycle destroyed."
		HELPTEXT_FAILURE_BIKE_TIME			= "rn03_failure_bike_time"			-- "You didn't get on the bike in time."

		HELPTEXT_OBJECTIVE_BIKE				= "rn03_objective_bike"				-- "Get on the bike."
		HELPTEXT_OBJECTIVE_KILL_RONIN		= "rn03_objective_kill_ronin"		-- "%s of %s Ronin bikes disabled"


	-- MOVERS

	-- NAVPOINTS

		NAVPOINT_LOCAL_PLAYER_START		= "mission_start_sr2_city_$rn03"
		NAVPOINT_REMOTE_PLAYER_START		= "rn03_$Nremote_player_start"

	-- TRIGGERS -- 

		-- List of all triggers, makes cleaning up more convenient
		TABLE_ALL_TRIGGERS		= {	}		

	-- VEHICLES --
		VEHICLE_PLAYER_BIKE_1	= "rn03_$Vplayer_bike_1"
		VEHICLE_PLAYER_BIKE_2	= "rn03_$Vplayer_bike_2"

	-- MISC
			
		OFF_BIKE_TIME_LIMIT_S	= 15	-- How long a player can be off of a bike before triggering mission failure.

		PLAYER_SYNC								=
			{
				[LOCAL_PLAYER]					= SYNC_LOCAL,
				[REMOTE_PLAYER]				= SYNC_ALL,
			}

		WAVE_LIST								= {"wave_1", "wave_2"} -- List of all the waves of bikes

		RN03_RONIN_PERSONAS	= 
		{
			["AM_Ron2"]	=	"AMRON2",

			["AF_Ron1"]	=	"AFRON1",

			["WM_Ron1"]	=	"WMRON1",

			["WF_Ron2"]	=	"WFRON2",
		}

		FREE_WEAPON_GUN						= "tec9"
		
-- Progress flags
	Warning_1_played					= false
	Warning_2_played					= false

-- Misc

	-- Vehicles that the players are in/on. 
	Player_vehicles			= {[LOCAL_PLAYER] = "",
										[REMOTE_PLAYER]= ""}

	Players_in_same_vehicle	= false 	-- Are the players in/on the same vehicle?
	Bikes_disabled		= {}				-- Maps from bike name -> bool (true if bike is disabled, false else)	
	Bikes_remaining	= 0				-- Number of bikes remaining from all waves combined.
	Bikes_to_kill = 0						-- In the "Kill X/Y Bikes" objective, the Y value.
	Driver_to_bike_mapping	= {}		-- Maps from the Driver to his bike
	Bike_to_wave_mapping		= {}		-- Maps from the bike to its wave
	Last_wave					= "" 		-- The most recently spawned wave.
	Current_wave_index		= 1		-- The next wave of bikes that will be spawned.

	Rn03_bike_to_passenger = {}
	Weapons_received							= false

function rn03_start(rn03_checkpoint, is_restart)

	mission_start_fade_out()

	if(rn03_checkpoint == CHECKPOINT_START) then
		if (not is_restart) then
			cutscene_play("ro03-01", "", {NAVPOINT_LOCAL_PLAYER_START, NAVPOINT_REMOTE_PLAYER_START}, false)
		else
			teleport_coop(NAVPOINT_LOCAL_PLAYER_START, NAVPOINT_REMOTE_PLAYER_START)
		end
		fade_out(0)
	end

	rn03_initialize(rn03_checkpoint)

	if(rn03_checkpoint == CHECKPOINT_START) then

		-- Warn players as the Ronin get closer to the Saints HQ
		thread_new("rn03_proximity_warnings")

		-- Start throttling bike speeds
		thread_new("rn03_bike_speed_throttle")

		-- Provide a gps path to the closest bike
		thread_new("rn03_gps")

		-- Process waves of attacking Ronin
		mission_help_table(HELPTEXT_PROMPT_KILL_RONIN)
		rn03_process_waves()

	end -- ends CHECKPOINT_START

	-- Mission ends
	rn03_complete()

end

function rn03_initialize(checkpoint)

	rn03_initialize_common()

	rn03_initialize_checkpoint(checkpoint)

	mission_start_fade_in()

end

-- Initialization code shared by all checkpoints.
function rn03_initialize_common()

	-- Start trigger is hit...the activate button was hit
	set_mission_author("Phillip Alexander")

	if coop_is_active() then
		IN_COOP = true
	end

	-- Set the maximum notoriety
	notoriety_set_max("Ronin",RONIN_NOTORIETY_MAX)
	notoriety_set_max("Police",POLICE_NOTORIETY_MAX)	

	-- Override persona lines for attacking Ronin.
	persona_override_group_start(RN03_RONIN_PERSONAS,POT_SITUATIONS[POT_ATTACK], "RO03_ATTACK")
	
	--give the player a sub machine gun with unlimited ammo
	inv_weapon_add_temporary(LOCAL_PLAYER, FREE_WEAPON_GUN, 1, true, true)
	if (IN_COOP) then
		inv_weapon_add_temporary(REMOTE_PLAYER, FREE_WEAPON_GUN, 1, true, true)
	end
	Weapons_received	= true

end

-- Initialization code specific to the checkpoint.
function rn03_initialize_checkpoint(checkpoint)

	if(checkpoint == CHECKPOINT_START) then

		-- Start loading groups
		group_create(GROUP_PLAYER_BIKE_1, true)
		if (IN_COOP) then
			group_create(GROUP_PLAYER_BIKE_2, true)
		end
		group_create_hidden(GROUP_RONIN_WAVE_1)
		group_create_hidden(GROUP_RONIN_WAVE_2)

		-- add callbacks to players for vehicle enter/exit, tracks if players in the same vehicle (only for COOP)
		if (IN_COOP) then
			on_vehicle_enter("rn03_player_entered_vehicle", LOCAL_PLAYER)
			on_vehicle_exit("rn03_player_exited_vehicle", LOCAL_PLAYER)	
			on_vehicle_enter("rn03_player_entered_vehicle", REMOTE_PLAYER)
			on_vehicle_exit("rn03_player_exited_vehicle", REMOTE_PLAYER)
		end

		-- place players in bikes
		vehicle_enter_teleport(LOCAL_PLAYER,VEHICLE_PLAYER_BIKE_1,0)
		if (IN_COOP) then
			vehicle_enter_teleport(REMOTE_PLAYER,VEHICLE_PLAYER_BIKE_2,0)				
		end

		-- Setup the players' bikes
		vehicle_never_flatten_tires(VEHICLE_PLAYER_BIKE_1, true)
		set_max_hit_points(VEHICLE_PLAYER_BIKE_1, PLAYER_BIKE_HIT_POINTS)
		if (IN_COOP) then
			vehicle_never_flatten_tires(VEHICLE_PLAYER_BIKE_2, true)	
			set_max_hit_points(VEHICLE_PLAYER_BIKE_2, PLAYER_BIKE_HIT_POINTS)
		end


	end -- ends CHECKPOINT_START

end

-- Plays warnings that Ronin are getting close/arrived at Saints HQ.
function rn03_proximity_warnings()

	while(true) do

		-- Play a warning when the first bike is crossing the bridge
		if(not Warning_1_played) then
			for bike,disabled in pairs(Bikes_disabled) do
				if (not disabled) then
					local dist = get_dist(bike, "rn03_$n033")
					if (dist < 50.0) then
						mission_help_table(HELPTEXT_PROMPT_CROSSING_BRIDGE)
						Warning_1_played = true
					end
				end
			end
		end

		-- Play a warning when a bike is nearing the saint's HQ
		if(not Warning_2_played) then
			for bike,disabled in pairs(Bikes_disabled) do
				if (not disabled) then
					local dist = get_dist(bike, "rn03_$n043")
					if (dist < 300.0) then
						mission_help_table(HELPTEXT_PROMPT_ALMOST_THERE)
						-- It shouldn't be possible, but if a Ronin manages to get this close to HQ w/out crossing the bridge, then
						-- the bridge message shouldn't be played.
						Warning_1_played = true
						Warning_2_played = true
					end
				end
			end
		end

		-- Fail the mission if a bike gets too close to the Saint's hq
		for bike,disabled in pairs(Bikes_disabled) do
			if (not disabled) then
				local dist = get_dist(bike, "rn03_$n043")
				if (dist < 50.0) then
					rn03_failure_ronin_in_row()
				end
			end
		end

		thread_yield()

	end
end

function rn03_player_entered_vehicle(player, vehicle)
	Player_vehicles[player] = vehicle

	-- Don't need to special case both player's vehicle being "" because we know someone just entered a vehicle
	if ( Players_in_same_vehicle ~= (Player_vehicles[player] == Player_vehicles[rn03_get_other_player(player)] )) then
		Players_in_same_vehicle = not Players_in_same_vehicle

		-- Update the traffic density
		set_traffic_density(rn03_wave_parameter(Last_wave,"TRAFFIC_DENSITY"))
	end
end

function rn03_player_exited_vehicle(player, vehicle)
	Player_vehicles[player] = ""

	if (Players_in_same_vehicle ~= false) then
		Players_in_same_vehicle = false

		-- Update the traffic density
		set_traffic_density(rn03_wave_parameter(Last_wave,"TRAFFIC_DENSITY"))
	end

end

function rn03_get_other_player(player)
	if (player == LOCAL_PLAYER) then
		return REMOTE_PLAYER
	else
		return LOCAL_PLAYER
	end
end

function rn03_process_waves()

	-- Setup all bikes in all waves
	for i, wave_name in pairs(WAVE_LIST) do
		rn03_setup_wave_bikes(wave_name)
	end

	-- Send waves one at a time, sending the next wave when a player is too close or
	-- too far from the first bike. If all of the previously spawned bikes are disabled, 
	-- add a waypoint to the next wave's position.

	local last_wave_index = sizeof_table(WAVE_LIST)
	while(Current_wave_index <= last_wave_index) do

		local wave_name = WAVE_LIST[Current_wave_index]

		-- Monitor distance to the first bike in the wave.
		local first_bike = rn03_wave_parameter(wave_name,"BIKES",1)
		local start_dist_near = rn03_wave_parameter(wave_name,"START_DIST_NEAR_M")
		local start_dist_far = rn03_wave_parameter(wave_name,"START_DIST_FAR_M")
		if (start_dist_far == nil) then
			start_dist_far = 99999
		end
		local dist = (start_dist_near + start_dist_far) / 2

		while( dist > start_dist_near and dist < start_dist_far) do 

			dist = get_dist_closest_player_to_object(first_bike)
			thread_yield()

		end

		-- Keep track of the most recently spawned wave
		Last_wave = wave_name

		-- Set the traffic density for this wave
		set_traffic_density(rn03_wave_parameter(wave_name,"TRAFFIC_DENSITY"))
		
		rn03_send_wave(HELPTEXT_PROMPT_MORE_RONIN, wave_name)

		Current_wave_index = Current_wave_index + 1

	end

	while(Bikes_remaining > 0) do
		thread_yield()
	end

end

-- Keep the gps path updated
function rn03_gps()

	local current_gps_mode = 0
	local gps_mode_location = 1
	local gps_mode_bikes = 2
	
	-- Wait for the first wave of bikes to spawn.
	while(Bikes_remaining == 0) do
		thread_yield()
	end

	while(true) do

		-- What should our new gps mode be?
		local new_gps_mode = gps_mode_location
		if(Bikes_remaining > 0) then
			new_gps_mode = gps_mode_bikes
		end

		-- If we've changed gps modes
		if(current_gps_mode ~= new_gps_mode) then

			current_gps_mode = new_gps_mode

			-- Call the new mode's gps function
			if(current_gps_mode == gps_mode_bikes) then
				rn03_bike_gps_path()
			else
				rn03_wave_gps_path()
			end
		end

		thread_yield()

	end

end

-- Add a GPS path to the start of the next wave
function rn03_wave_gps_path()

	if (Current_wave_index > sizeof_table(WAVE_LIST)) then
		return
	elseif (Current_wave_index > 1) then
		mission_help_table(HELPTEXT_PROMPT_REINFORCEMENTS)
	end

	local wave_name = WAVE_LIST[Current_wave_index]
	local first_bike = rn03_wave_parameter(wave_name,"BIKES",1)			

	mission_waypoint_add(first_bike, SYNC_ALL)
	marker_add_navpoint(first_bike,MINIMAP_ICON_LOCATION,INGAME_EFFECT_LOCATION,SYNC_ALL)

	while(Bikes_remaining == 0) do
		thread_yield()
	end

	mission_waypoint_remove(SYNC_ALL)
	marker_remove_navpoint(first_bike, SYNC_ALL)

end

-- Keep a GPS path to the closest bike.
function rn03_bike_gps_path()

	local min_gps_dist = 100
	local gps_bike = {[LOCAL_PLAYER] = "", [REMOTE_PLAYER] = ""}

	-- Get the bike that the GPS should point the player to
	local function get_new_gps_bike(player)

		local closest_bike = ""
		local closest_dist = 0

		if (Bikes_remaining > 0) then
			for bike, disabled in pairs(Bikes_disabled) do
				if( not disabled) then
					local dist = get_dist(player, bike)
					if( (closest_bike == "") or (dist < closest_dist) ) then
						closest_bike = bike
						closest_dist = dist
					end
				end	
			end
		end
		
		if (closest_dist >= min_gps_dist) then
			return closest_bike
		else
			return ""
		end

	end

	-- Update the gps for the input player
	local function update_bike_gps(player)
		local new_gps_bike = get_new_gps_bike(player)
		if (new_gps_bike ~= gps_bike[player]) then
			if(gps_bike[player] ~= "") then
				mission_waypoint_remove(PLAYER_SYNC[player])
			end
			gps_bike[player] = new_gps_bike
			if(new_gps_bike ~= "") then
				mission_waypoint_add(new_gps_bike, PLAYER_SYNC[player])
			end
		end
	end

	-- Update the gps for both players
	while(Bikes_remaining > 0) do
		update_bike_gps(LOCAL_PLAYER)
		if(IN_COOP) then
			update_bike_gps(REMOTE_PLAYER)
		end
		thread_yield()
	end

	-- Clear up any existing waypoints
	mission_waypoint_remove(SYNC_ALL)

end

-- Make bikes invulnerable, teleport ronin onto the bike
function rn03_setup_wave_bikes(wave_name)

	-- Setup the bikes
	for i,bike in pairs(rn03_wave_parameter(wave_name,"BIKES")) do

		local driver = rn03_wave_parameter(wave_name,"DRIVERS",i)
		attack(driver)
		turn_invulnerable(driver, false)
		turn_invulnerable(bike,false)
		
		-- place the driver (and possibly passenger) on the bike
		vehicle_enter_teleport(driver,bike,0)
		local passenger = rn03_wave_parameter(wave_name,"PASSENGERS",i)
		if (passenger) then
			attack(passenger)
			vehicle_enter_teleport(passenger,bike,1)
			turn_invulnerable(passenger,false)
			Rn03_bike_to_passenger[bike] = passenger
		end

	end

end

-- Send a wave of ronin on their route to the Saints' HQ
--
-- params:
--		helptext_more_ronin	Helptext message played if these bikes are joining the fight.
--		wave_name Name of this wave of attackers (used to grab the correct set of parameters)
--
function rn03_send_wave(helptext_more_ronin, wave_name)

	-- Determine the number of Bikes that we can spawn
	local bikes_to_spawn = sizeof_table(rn03_wave_parameter(wave_name,"BIKES"))
	local max_bikes_allowed = rn03_wave_parameter(wave_name,"MAX_RONIN")
	if (max_bikes_allowed > 0) then
		bikes_to_spawn = max_bikes_allowed - Bikes_remaining
	end

	-- If we still have bikes around, then tell the player that more ronin have joined in.
	-- (If all bikes are gone, then the waypoint thread will have already displayed this message)
	if ( (Bikes_remaining > 0) and (bikes_to_spawn > 0) and helptext_more_ronin) then
		mission_help_table(helptext_more_ronin)		
	end

	-- loop over all of the bikes in the wave
	for i,bike in pairs(rn03_wave_parameter(wave_name,"BIKES")) do
		if (i <= bikes_to_spawn) then
	
			-- Set max hit points for the bike
			set_max_hit_points(bike, rn03_wave_parameter(wave_name,"BIKE_HP")) 

			-- Associate the bike with this wave
			Bike_to_wave_mapping[bike] = wave_name

			-- Note that this bike is not disabled
			Bikes_disabled[bike] = false
			Bikes_remaining = Bikes_remaining + 1
			Bikes_to_kill = Bikes_to_kill + 1

			thread_new("rn03_send_bike", bike, i)

			delay(rand_float(0.3,0.7))
		end
	end

	-- Update the objective text
	objective_text(0, HELPTEXT_OBJECTIVE_KILL_RONIN, Bikes_to_kill - Bikes_remaining, Bikes_to_kill)
end

-- Send a bike on its route to the Ronin HQ
--
-- Sets various flags and builds a ranom route if needed
--
-- params:
--		bike	The motorcycle that should start pathfinding.
--		i		The index of this bike in its wave.
function rn03_send_bike(bike, i)

	-- add marker, in game effect
	marker_add_vehicle(bike,MINIMAP_ICON_KILL,INGAME_EFFECT_VEHICLE_KILL,SYNC_ALL)

	-- convenience variables
	local wave_name = Bike_to_wave_mapping[bike]
	local driver = rn03_wave_parameter(wave_name,"DRIVERS",i)

	-- Set max hit points for the driver
	set_max_hit_points(driver, rn03_wave_parameter(wave_name,"DRIVER_HP")) 

	-- Keep track of who is driving this bike
	Driver_to_bike_mapping[driver] = bike

	-- Set a bunch of flags
	vehicle_never_flatten_tires(bike, true)
	vehicle_suppress_npc_exit(bike, true)
	vehicle_prevent_explosion_fling(bike,true)
	set_seatbelt_flag(driver,true)
	vehicle_set_allow_ram_ped(bike,true)
	vehicle_set_crazy(bike,true)
	vehicle_set_use_short_cuts(bike,true)
	
	-- Add bike-disabled callbacks for bike being destroyed and driver being killed
	on_death("rn03_bike_driver_killed", driver)
	on_vehicle_destroyed("rn03_bike_destroyed", bike)

	-- Make everything visible and vulnerable
	turn_vulnerable(bike)
	vehicle_show(bike)
	turn_vulnerable(driver)
	character_show(driver)
	local passenger = rn03_wave_parameter(wave_name,"PASSENGERS",i)
	if (passenger) then
		turn_vulnerable(passenger)
		character_show(passenger)
	end

	-- Send the bike on its way. If the bike is in the first wave, build a random path.
	if (wave_name == "wave_1") then

		local path_tree	=
		{
			[0]	= {1,2};
			[1]	= {5,6};
			[2]	= {3,8};
			[3]	= {4,7};
			[4]	= {5,6};
			[5]	= {9};
			[6]	= {9,10};
			[7]	= {9,10};
			[8]	= {9,10,17};
			[9]	= {17};
			[10]	= {17};
			[17]  = {18};
		}

		local path_node_names = 
		{
			[1]	= "rn03_$n048";
			[2]	= "rn03_$n052";
			[3]	= "rn03_$n053";
			[4]	= "rn03_$n055";
			[5]	= "rn03_$n049";
			[6]	= "rn03_$n056";
			[7]	= "rn03_$n057";
			[8]	= "rn03_$n054";
			[9]	= "rn03_$n050";
			[10]	= "rn03_$n058";
			[17]	= "rn03_$n051";
			[18]	= "rn03_$n059";
		}

		local my_path = rn03_get_random_path2(path_tree, path_node_names)

		vehicle_turret_base_to(bike, my_path, false)
	end

	local num_paths = sizeof_table(rn03_wave_parameter(wave_name,"PATH"))
	for i=1, num_paths, 1 do
		local stop = false
		if(i == num_paths) then
			stop = true
		end
		vehicle_turret_base_to(bike, rn03_wave_parameter(wave_name,"PATH")[i], stop)
	end

	-- If a bike arrives at the HQ, then the player loses
	delay(0.5)
	if (not Bikes_disabled[bike]) then

		-- Check the distance to the path's end... if the bike got stuck for some reason,
		-- just blow it up.
		local dist = get_dist(bike, "rn03_$n043")
		if (dist > 100.0) then
			vehicle_detonate(bike)
		else
			rn03_failure_ronin_in_row()
		end	

	end

end

-- Throttle the speed of all bikes based on their distance to the player
function rn03_bike_speed_throttle()

	local Bike_in_range = {}
	
	while (true) do

		for bike, disabled in pairs(Bikes_disabled) do

			-- If the bike isn't disabled, throttle its speed
			if (not disabled) then

				-- Get parameter values for this bike's wave
				local wave_name	= Bike_to_wave_mapping[bike]
				local range			= rn03_wave_parameter(wave_name,"CLOSE_RANGE_M")
				local speed_slow	= rn03_wave_parameter(wave_name,"SLOW_SPEED")
				local speed_fast	= rn03_wave_parameter(wave_name,"FAST_SPEED")

				-- Was the bike in range the last time we looked at it?
				local in_range		= Bike_in_range[bike]

				-- Get distance to closest player
				local dist = get_dist_closest_player_to_object(bike)

				-- Do some set up if the throttling thread hadn't seen this bike before
				if (in_range == nil) then

					-- Set initial speed
					if (dist < range) then
						Bike_in_range[bike] = true
						vehicle_speed_override(bike, speed_fast)
					else
						Bike_in_range[bike] = false
						vehicle_speed_override(bike, speed_slow)
					end

				-- Otherwise, only change speed if in-close-range status has changed
				else

					-- If in-range status has changed, set new speed
					if (dist < range ~= in_range) then

						Bike_in_range[bike] = not in_range

						if (Bike_in_range[bike]) then
							vehicle_speed_override(bike, speed_fast)
						else
							vehicle_speed_override(bike, speed_slow)
						end

					end -- Ends if (in-range status changed)

				end -- Ends else (only change speed if in-range status has changed)
				
			end -- Ends if (not disabled)

			-- Its not urgent that the speed is immediately updated, so yield after each bike
			thread_yield()

		end -- Ends loop over bikes

		-- Yield here as well, or we'll have problems when all bikes are disabled
		thread_yield()
	
	end

end

-- Handle the death of one of the Ronin drivers.
function rn03_bike_driver_killed(driver)
	local bike = Driver_to_bike_mapping[driver]
	rn03_bike_disabled(bike)

	delay(0.5)
	local passenger = Rn03_bike_to_passenger[bike]
	if (character_exists(passenger) and (not character_is_dead(passenger)) ) then
		if ( vehicle_exists(bike) and (not vehicle_is_destroyed(bike)) and character_is_in_vehicle(passenger)) then
			vehicle_suppress_npc_exit(bike, false)
			vehicle_exit(passenger)
			attack(passenger)
		end
	end

	if (AUTO_DETONATE_RIDERLESS_BIKES and (not vehicle_is_destroyed(bike))) then

		-- Check if bike is smoking and if it is on fire
		local smoking, on_fire = vehicle_get_smoke_and_fire_state(bike)

		-- Start the bike smoking if it isn't already doing so, then delay a bit
		if (not smoking) then
			vehicle_set_smoke_and_fire_state(bike,true,on_fire)
			delay(BIKE_SMOKE_TO_FIRE_DELAY_S)
		end

		-- If the bike isn't on fire, set it on fire and wait a bit before it explodes
		if (not smoking) then
			vehicle_set_smoke_and_fire_state(bike,true,true)
			delay(BIKE_SMOKE_TO_FIRE_DELAY_S)
		end
		
		vehicle_detonate(bike)

	end

end

-- Handle the destruction of on of the Ronin's bikes
function rn03_bike_destroyed(bike)
	rn03_bike_disabled(bike)
end

-- Called when one of the Ronin bike's is disabled
-- 
-- Does book keeping and updates objective text.
function rn03_bike_disabled(bike)
	if (not Bikes_disabled[bike]) then

		Bikes_disabled[bike] = true
		Bikes_remaining = Bikes_remaining - 1

		marker_remove_vehicle(bike)

		-- Update the objective text
		objective_text(0, HELPTEXT_OBJECTIVE_KILL_RONIN, Bikes_to_kill - Bikes_remaining, Bikes_to_kill)

		--log that we've destroyed a bike
		--gamelog_log_event("MISSION_EVENT", "bike destroyed", (Bikes_to_kill - Bikes_remaining))

		-- Tell the player that they disabled the bike 
		-- (unless its the last in which case another wave will spawn, or the mission ends)
		if(Bikes_remaining > 0) then
			mission_help_table(HELPTEXT_PROMPT_BIKE_DESTROYED)
		end
	
	end
end

-- Cleanup when mission is exited or restarted.
function rn03_cleanup()

	IN_COOP = coop_is_active()

	-- reset global variables
		set_traffic_density(1.00)

	-- remove markers

		-- Player bike(s)
		marker_remove_vehicle(VEHICLE_PLAYER_BIKE_1, SYNC_ALL)
		if (IN_COOP) then
			marker_remove_vehicle(VEHICLE_PLAYER_BIKE_2, SYNC_ALL)
		end

		-- Wave bikes
		for bike, disabled in pairs(Bikes_disabled) do
			marker_remove_vehicle(bike)
		end

		-- GPS
		mission_waypoint_remove()

	-- remove callbacks

		-- Player enter/exit player bike(s)
		on_vehicle_enter("",VEHICLE_PLAYER_BIKE_1)
		on_vehicle_exit("",VEHICLE_PLAYER_BIKE_1)
		if (IN_COOP) then
			on_vehicle_enter("",VEHICLE_PLAYER_BIKE_2)
			on_vehicle_exit("",VEHICLE_PLAYER_BIKE_2)
		end

		-- Player enter/exit vehicle
		on_vehicle_enter("", LOCAL_PLAYER)
		on_vehicle_exit("", LOCAL_PLAYER)	
		if (IN_COOP) then
			on_vehicle_enter("", REMOTE_PLAYER)
			on_vehicle_exit("", REMOTE_PLAYER)
		end

		-- Wave bikes, drivers
		for bike, disabled in pairs(Bikes_disabled) do
			on_vehicle_destroyed("", bike)
		end
		for driver, bike in pairs (Driver_to_bike_mapping) do
			on_death("", driver)
		end

		-- Stop persona overrides
		persona_override_group_stop(RONIN_PERSONAS,POT_SITUATIONS[POT_ATTACK])
		
	if (Weapons_received) then
		inv_weapon_remove_temporary(LOCAL_PLAYER, FREE_WEAPON_GUN)
		if ( IN_COOP ) then
			inv_weapon_remove_temporary(REMOTE_PLAYER, FREE_WEAPON_GUN)
		end
	end
end

-- Get a wave parameter value
--
-- params:
--		wave The name of the wave.
--		parameter The name of the parameter.
--		i If the parameter's value is a table, then the index to the entry to return.
function rn03_wave_parameter(wave, parameter, i)

	local return_val = nil

	-- Check for an overloaded value for coop missions when both players are on the same bike.
	if (Players_in_same_vehicle) then
		if (i) then
			if (WAVE_PARAMETERS[wave]["COOP_SAME_BIKE_" .. parameter] ~= nil) then
				return_val = WAVE_PARAMETERS[wave]["COOP_SAME_BIKE_" .. parameter][i]
			end
		else
			return_val = WAVE_PARAMETERS[wave]["COOP_SAME_BIKE_" .. parameter]
		end
	end

	-- Check for an overloaded value for coop missions.
	if (IN_COOP and return_val == nil) then
		if (i) then
			if (WAVE_PARAMETERS[wave]["COOP_" .. parameter] ~= nil) then
				return_val = WAVE_PARAMETERS[wave]["COOP_" .. parameter][i]
			end
		else
			return_val = WAVE_PARAMETERS[wave]["COOP_" .. parameter]
		end
	end

	-- Get the standard value
	if (return_val == nil) then
		if (i) then
			if (WAVE_PARAMETERS[wave][parameter] ~= nil) then
				return_val = WAVE_PARAMETERS[wave][parameter][i]
			end
		else
			return_val = WAVE_PARAMETERS[wave][parameter]
		end
	end

	return return_val
end

function rn03_complete()
	--bink_play_movie("ro03-2.bik")
	mission_end_success("rn03", "ro03-02")
end

function rn03_success()
	-- Called when the mission has ended with success
end

-- MISSION FAILURE FUNCTIONS --------------------------------

-- End the mission, player's bike destroyed
function rn03_failure_bike_destroyed()
	mission_end_failure("rn03", HELPTEXT_FAILURE_BIKE_DESTROYED)
end

-- End the mission, Ronin made it to the saint's district
function rn03_failure_ronin_in_row()
	mission_end_failure("rn03", HELPTEXT_FAILURE_RANGE)
end

-- Build a random path
--
-- params:
--		path_tree A table describing the tree.
--		node_names The names of the navpoints corresponding to each node.
--
--	returns:
--		A random path along the tree.
--
-- e.g. The following diagram represents a path w/ 3 routes from 1->6:
--
--		 2---------
--		/			   \
--	1-<	  4---6   \
--		\	 /     \   \
--		 3-<	     >---- 7
--			 \     /
--			  5----
-- 
-- Its path_tree table would be as follows:
--
--	path_tree = 
-- { 
--		[0] = {1}	-- 0 indexes the starting point(s)
--		[1] = {2,3}	-- From node 1, the path can progress to node 2 or 3
--		[2] = {7}	-- From node 2, the only possible next node is 7
--		[3] = {4,5}
--		[4] = {6}
--		[5] = {7}
--		[6] = {7}
-- }
--
-- The three possible routes are:
--		(1,2,7)
--		(1,3,4,6,7)
--		(1,3,5,7)

function rn03_get_random_path2(path_tree, node_names)

	local function get_next_node_id(current_node_id)
		if(path_tree[current_node_id] == nil) then
			return nil
		else
			local num_choices = sizeof_table(path_tree[current_node_id])
			return path_tree[current_node_id][rand_int(1,num_choices)]
		end
	end

	local current_id = get_next_node_id(0)
	local num_nodes = 0
	local rand_path = {}

	while (current_id ~= nil) do
		num_nodes = num_nodes + 1
		--rand_path[num_nodes] = current_id
		rand_path[num_nodes] = node_names[current_id]
		current_id = get_next_node_id(current_id)
	end

	return rand_path

end

-- add all entries of the tail table onto the end of the head table
function rn03_table_concat(head_table, tail_table)
	local offset = sizeof_table(head_table)
	for i, tail_entry_i in pairs(tail_table) do
		head_table[offset+i] = tail_entry_i
	end
end