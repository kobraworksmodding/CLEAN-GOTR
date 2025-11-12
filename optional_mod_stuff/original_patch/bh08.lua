-- bh08.lua
-- SR2 mission script
-- 3/28/07

-- DEBUG FLAGS
	DEBUG_BOAT_PATHFINDING			= false

-- Groups --
	GROUP_BUSES =						"bh08_$buses"
	GROUP_BOATS =						"bh08_$boats"
	GROUP_PLAYER_VEHICLES =			"bh08_$player_vehicles"
	GROUP_PLAYER_VEHICLES_COOP =	"bh08_$player_vehicles_coop"
	GROUP_COURTESY_CAR =				"bh08_$courtesy_car"
	GROUP_COURTESY_CAR_COOP =		"bh08_$courtesy_car_coop"
	GROUP_ATTACK_HELIS =				"bh08_$boat_helis_attack"
	GROUP_NORMAL_HELIS =				"bh08_$boat_helis_normal"

-- Navpoints --
	NAV_LOCAL_START =					"bh08_$n000"
	NAV_REMOTE_START =				"bh08_$n001"
	NAV_BUS_ROUTE =					{{"bh08_$n002", "bh08_$n003", "bh08_$n004", "bh08_$n005", "bh08_$n006", "bh08_$n007", "bh08_$n008"},
											{{"bh08_$n002", "bh08_$n003", "bh08_$n004"}, {"bh08_$n012", "bh08_$n013", "bh08_$n014", "bh08_$n015", "bh08_$n008"}},
											{"bh08_$n002", "bh08_$n003", "bh08_$n004", "bh08_$n005", "bh08_$n006", "bh08_$n007", "bh08_$n008"}}
	NAV_BUS_DEST =						"bh08_$n008"
	NAV_BOAT_ROUTE =					{	{"bh08_$n017", "bh08_$n016", "bh08_$n020", "bh08_$n021", "bh08_$n024", "bh08_$n009"},
												{"bh08_$n018", "bh08_$n019", "bh08_$n011", "bh08_$n022", "bh08_$n010", "bh08_$n009"}}
	NAV_BOAT_DEST =					"bh08_$n009"
	NAVPOINT_FINISH_LOCAL =			"bh08_$n025"
	NAVPOINT_FINISH_REMOTE =		"bh08_$n026"

-- Vehicles --
	VEH_BUS =							{"bh08_$v000", "bh08_$v001", "bh08_$v002"}
	VEH_BUS_ESCORT =					{"bh08_$v003", "bh08_$v004", "bh08_$v005"}
	VEH_BOAT =							{"bh08_$v006", "bh08_$v007", "bh08_$v008", "bh08_$v009"}
	VEH_PLAYER =						{"bh08_$v010", "bh08_$v011"}
	VEH_PLAYER_BOAT =					"bh08_$v011"
	VEH_PLAYER_PLANE=					"bh08_$v010"
	VEH_PLAYER_COOP =					{"bh08_$v017"}
	VEH_BOAT_NORMAL_HELI=			{"bh08_$v020", "bh08_$v021"}
	VEH_BOAT_ATTACK_HELI=			{"bh08_$v012", "bh08_$v013"}
	VEH_BOAT_ESCORT_BOAT =			{"bh08_$v014", "bh08_$v015", "bh08_$v016"}

-- Characters --
	CHAR_BUSLOAD =						{{"bh08_$c000", "bh08_$c001", "bh08_$c002", "bh08_$c003", "bh08_$c004", "bh08_$c005"},
											{"bh08_$c006", "bh08_$c007", "bh08_$c008", "bh08_$c009", "bh08_$c010", "bh08_$c011"},
											{"bh08_$c012", "bh08_$c013", "bh08_$c014", "bh08_$c015", "bh08_$c016", "bh08_$c017"}}

	CHAR_BUS_ESCORT =					{{"bh08_$c018", "bh08_$c019"},
											{"bh08_$c020", "bh08_$c021"},
											{"bh08_$c022", "bh08_$c023"}}

--[[
	CHAR_BOATLOAD =					{{"bh08_$c024", "bh08_$c026"},
											{"bh08_$c029", "bh08_$c031"},
											{"bh08_$c034", "bh08_$c036"},
											{"bh08_$c039", "bh08_$c041"}}
]]

	CHAR_BOATLOAD =					{{"bh08_$c024"},
											{"bh08_$c029"},
											{"bh08_$c034"},
											{"bh08_$c039"}}

	CHAR_BOAT_ATTACK_HELI =			{{"bh08_$c050"},
											{"bh08_$c054"}}

	CHAR_BOAT_NORMAL_HELI =			{{"bh08_$c058"},
											{"bh08_$c059"}}

	CHAR_BOAT_ESCORT_BOAT =			{{"bh08_$c044", "bh08_$c045"},
											{"bh08_$c046", "bh08_$c047"},
											{"bh08_$c048", "bh08_$c049"}}

-- Checkpoints --
	CHECKPOINT_BUSES_DESTROYED =	"bh08_checkpoint_buses_destroyed"
	CHECKPOINT_IN_BOAT_OR_FLIER=	"bh08_checkpoint_boat_or_flier"

-- Text --
	--Three Busloads of Prisoners are en route to the Brotherhood Gang hideout. Kill them before they're set free.
	TEXT_DESTROY_THE_BUSES =		"bh08_destroy_the_buses"
	-- Prison Buses Destroyed: %s/%s
	TEXT_BUSES_DESTROYED =			"bh08_buses_destroyed"
	-- More Brotherhood Prisoners are being transfered from the Prison to the Mainland. Kill them before they're set free.
	TEXT_DESTROY_THE_BOATS =		"bh08_destroy_the_boats"
	-- Prison Boats Destroyed: %s/%s
	TEXT_BOATS_DESTROYED =			"bh08_boats_destroyed"
	-- A Boat is available for use at the Apartment Dock and a Fighter is available at the Airport.
	TEXT_FIGHTER_AVAILABLE =		"bh08_fighter_available"
	-- A Boat is available for use at the Apartment Dock and two Fighters are available at the Airport.
	TEXT_FIGHTER_AVAILABLE_COOP = "bh08_fighter_available_coop"
	-- A Prison Bus reached its destination.
	TEXT_BUS_REACHED_DEST =			"bh08_bus_reached_destination"
	-- A Prison Boat reached its destination.
	TEXT_BOAT_REACHED_DEST =		"bh08_boat_reached_destination"
	-- The Prison Buses are halfway to the Brotherhood hideout.
	TEXT_BUS_HALF_WAY =				"bh08_bus_half_way"
	-- A Prison Bus is almost to the Brotherhood hideout.
	TEXT_BUS_ALMOST_THERE =			"bh08_bus_almost_there"

	-- Find a vehicle to intercept the [format][color:red]prison boats[/format]
	BH08_FIND_VEHICLE		= "bh08_find_vehicle"
	-- One [format][color:red]bus[/format] remains
	BH08_1_BUS_REMAINING = "bh08_1_bus"
	-- Two [format][color:red]buses[/format] remain
	BH08_2_BUS_REMAINING = "bh08_2_bus"
	-- One [format][color:red]boat[/format] remains
	BH08_1_BOATS_REMAINING = "bh08_1_boat"
	-- Two [format][color:red]boats[/format] remain
	BH08_2_BOATS_REMAINING = "bh08_2_boats"
	-- Three [format][color:red]boats[/format] remain
	BH08_3_BOATS_REMAINING = "bh08_3_boats" 
	-- A [format][color:red]boat[/format] is almost at the dropoff
	BH08_BOAT_ALMOST_THERE  = "bh08_almost_there"

-- Threads --
	THREAD_BOAT_ESCORT =				{-1, -1, -1}

-- Cutscenes --
	CUTSCENE_IN =						"br08-1.bik"
	CUTSCENE_OUT =						"br08-2.bik"

-- Other --
	IN_COOP =							false
	Bus_reached_dest =				false
	Buses_destroyed =					0
	INITIAL_NUM_BUSES =				sizeof_table(VEH_BUS)
	Boats_destroyed =					0
	INITIAL_NUM_BOATS =				sizeof_table(VEH_BOAT)
	BOAT_DESTINATION_DISTANCE =	15

	PLAYER_SYNC		=	{	[LOCAL_PLAYER]	= SYNC_LOCAL,
								[REMOTE_PLAYER] = SYNC_REMOTE,
							}

	OTHER_PLAYER	=	{	[LOCAL_PLAYER]	= REMOTE_PLAYER,
								[REMOTE_PLAYER] = LOCAL_PLAYER,
							}

	HELI_ESCORT_TARGET_INDICES = {1, 4}
	BOAT_DELAYS	= { 0, 0, 10, 10}
	BOAT_ROUTES = {2, 1, 2, 1}
	VEHICLE_INVULNERABILITY_S = 15
	MODIFIED_BOAT_HEALTH = 9000
	BUS_MAX_SPEED = 25
	BOAT_MAX_SPEED = 25
	Boat_objective_sync				= -1

	-- Applied to pathfinding delays to keep vehicles further apart in co-op. Otherwise, syching can
	-- cause the vehicles to interpenetrate one another.
	COOP_PATHFIND_DELAY_FACTOR = 2.5

-- Start the mission
function bh08_start(bh08_checkpoint, is_restart)

	if (bh08_checkpoint == MISSION_START_CHECKPOINT) then

		local start_groups = {GROUP_COURTESY_CAR, GROUP_BUSES}
		if (coop_is_active()) then
			start_groups = {GROUP_COURTESY_CAR, GROUP_COURTESY_CAR_COOP, GROUP_BUSES}
		end

		if (is_restart) then
			for i,group in pairs(start_groups) do
				group_create(group, true)
			end
			teleport_coop(NAV_LOCAL_START, NAV_REMOTE_START)
		else
			cutscene_play("br08-01", start_groups, {NAV_LOCAL_START, NAV_REMOTE_START}, false)
			for i,group in pairs(start_groups) do
				group_show(group)
			end
		end

	end

	if(DEBUG_BOAT_PATHFINDING) then
		bh08_debug_boats()
	end

	bh08_initialize(bh08_checkpoint)

	if bh08_checkpoint == MISSION_START_CHECKPOINT then
		bh08_the_buses()
	else	
		bh08_the_boats()
	end
end

-- Initialize the mission
function bh08_initialize(checkpoint)

	mission_start_fade_out(0.0)

	bh08_initialize_common()
	bh08_initialize_checkpoint(checkpoint)

	mission_start_fade_in()

end

-- Do mission initialization that is common to all checkpoints
function bh08_initialize_common()

	-- Start trigger is hit...the activate button was hit
	set_mission_author("Phillip Alexander and Aaron Hanson")

	if coop_is_active() then
		IN_COOP = true
	end

	roadblocks_enable(false)
	spawning_boats(false)

end

-- Do mission initialization that is not common to all checkpoints
function bh08_initialize_checkpoint(checkpoint)

	if (checkpoint == MISSION_START_CHECKPOINT) then

		for i, bus in pairs(VEH_BUS) do
			for j, npc in pairs(CHAR_BUSLOAD[i]) do
				set_ignore_ai_flag(npc, true)
			end
		end
		
		for i, bus in pairs(VEH_BUS) do
			on_vehicle_destroyed("bh08_bus_destroyed", bus)
			--vehicle_enter_group_teleport(CHAR_BUSLOAD[i], bus)
			vehicle_suppress_npc_exit(bus, true)
			vehicle_disable_flee(bus, true)
			vehicle_disable_chase(bus, true)
			for j, npc in pairs(CHAR_BUSLOAD[i]) do
				if j == 1 then
					vehicle_enter_teleport(npc, bus, 0)
					turn_invulnerable(npc)
				else
					vehicle_enter_teleport(npc, bus, j)
				end
				set_seatbelt_flag(npc, true)
				set_cant_flee_flag(npc, true)
				npc_combat_enable(npc, false)
				npc_detection_enable(npc, false)
				inv_item_remove_all(npc)
			end
			marker_add_vehicle(bus, MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL, SYNC_ALL)
		end

		for i, cruiser in pairs(VEH_BUS_ESCORT) do
			vehicle_enter_group_teleport(CHAR_BUS_ESCORT[i], cruiser)
			vehicle_suppress_npc_exit(cruiser, true)
			vehicle_disable_flee(cruiser, true)
			vehicle_disable_chase(cruiser, true)
			vehicle_set_sirenlights(cruiser, true)
			for j, npc in pairs(CHAR_BUS_ESCORT[i]) do
				set_ignore_ai_flag(npc, true)
				set_cant_flee_flag(npc, true)
				npc_combat_enable(npc, true)
			end
			if i==1 then
				thread_new("bh08_bus_escort", cruiser, CHAR_BUSLOAD[1][1], VEH_BUS[1])
			elseif i==2 then
				thread_new("bh08_bus_escort", cruiser, CHAR_BUSLOAD[2][1], VEH_BUS[2])
			elseif i==3 then
				thread_new("bh08_bus_escort", cruiser, CHAR_BUSLOAD[3][1], VEH_BUS[3])
			end
		end
	
	end

end

function bh08_heli_boat_escort(heli, char, passenger_list, delay_s)

	local attacking_player = false

	if (IN_COOP) then
		delay(delay_s * COOP_PATHFIND_DELAY_FACTOR)
	else
		delay(delay_s)
	end
	vehicle_chase(heli, char, false, false, false, false)

	while (not vehicle_is_destroyed(heli)) do

		local dist, player = get_dist_closest_player_to_object(char)
		local should_attack_player = ( (dist < 200) or character_is_dead(char) )
			
		if (should_attack_player and (not attacking_player) ) then
			vehicle_chase(heli, player, false, false, false, false)
			for i, npc in pairs(passenger_list) do
				npc_combat_enable(npc, true)
			end
			-- Always attack for at least 30 seconds
			delay(30)
		elseif ((not should_attack_player) and attacking_player) then
			for i, npc in pairs(passenger_list) do
				npc_combat_enable(npc, false)
			end
			vehicle_chase(heli, char, false, false, false, false)
		end

		-- No need to test this every frame
		delay(1)
		thread_yield()
	end

end

function bh08_the_buses()

	mission_help_table(TEXT_DESTROY_THE_BUSES)
	bh08_show_bus_counter()

	for i, bus in pairs(VEH_BUS) do
		local slowdown_factor
		if i == 2 then
			thread_new("bh08_bus_route_special", bus, NAV_BUS_ROUTE[i], i-1)
		else
			thread_new("bh08_bus_route", bus, NAV_BUS_ROUTE[i], i-1)
		end
	end

	thread_new("bh08_bus_gps_path")
	thread_new("bh08_bus_route_warnings")

	while (Buses_destroyed < INITIAL_NUM_BUSES) do
		thread_yield()
		if bh08_check_bus_reached_dest() then
			bh08_failure_bus_destination()
			break
		end
	end

	if (not bh08_check_bus_reached_dest()) then
		mission_set_checkpoint(CHECKPOINT_BUSES_DESTROYED)
		release_to_world(GROUP_BUSES)
		group_destroy(GROUP_BUSES)
		release_to_world(GROUP_COURTESY_CAR)
		group_destroy(GROUP_COURTESY_CAR)
		delay(2)
		objective_text_clear(0)

		bh08_the_boats()
	end

end

function bh08_bus_escort(cruiser, target, targets_vehicle)

	vehicle_chase(cruiser, target, false, false, true, true)
	
	while ((not vehicle_is_destroyed(cruiser)) and (not vehicle_is_destroyed(targets_vehicle)) and (not character_is_dead(target))) do
		thread_yield()
	end
	
	for i, escort_car in pairs(VEH_BUS_ESCORT) do

		if(cruiser == escort_car) then

			for j, npc in pairs(CHAR_BUS_ESCORT[i]) do
				if (not character_is_dead(npc)) then
					set_ignore_ai_flag(npc, false)
					set_cant_flee_flag(npc, true)
					npc_combat_enable(npc, true)
				end
			end

			if(not vehicle_is_destroyed(cruiser)) then
				vehicle_suppress_npc_exit(cruiser, false)
				vehicle_disable_chase(cruiser, false)
				vehicle_set_sirenlights(cruiser, true)
				local dist,player = get_dist_closest_player_to_object(cruiser)
				vehicle_chase(cruiser, player, true, true, true, false)
				
			end		
		end
	end
end

function bh08_bus_route(bus, route, delay_factor)
	if(delay_factor) then
		if (IN_COOP) then
			delay(2 * delay_factor * COOP_PATHFIND_DELAY_FACTOR)
		else
			delay(2 * delay_factor)
		end
	end
	vehicle_max_speed(bus, BUS_MAX_SPEED)
	vehicle_turret_base_to(bus, route, true)
end

function bh08_bus_route_special(bus, route, delay_factor)
	if (IN_COOP) then
		delay(2 * delay_factor * COOP_PATHFIND_DELAY_FACTOR)
	else
		delay(2 * delay_factor)
	end
	vehicle_max_speed(bus, BUS_MAX_SPEED)
	vehicle_turret_base_to(bus, route[1], false)
	vehicle_max_speed(bus, BUS_MAX_SPEED)
	vehicle_turret_base_to(bus, route[2], true)
end

function bh08_check_bus_reached_dest()
	if Bus_reached_dest then
		return true
	end
	for i, bus in pairs(VEH_BUS) do
		if (not vehicle_is_destroyed(bus)) and (get_dist_vehicle_to_nav(bus, NAV_BUS_DEST) < 5) then
			Bus_reached_dest = true
			return true
		end
	end
	return false
end

function bh08_bus_destroyed(bus)
	on_vehicle_destroyed("", bus)
	marker_remove_vehicle(bus, SYNC_ALL)
	local num_seats = vehicle_get_num_seats(bus)
	for j, veh in pairs(VEH_BUS) do
		if veh == bus then
			for k, npc in pairs(CHAR_BUSLOAD[j]) do
				set_ignore_ai_flag(npc, false)
				turn_vulnerable(npc)
				character_kill(npc)
			end
			break
		end
	end
	Buses_destroyed = Buses_destroyed + 1

	local buses_remaining = INITIAL_NUM_BUSES - Buses_destroyed
	if (buses_remaining == 1) then
		mission_help_table_nag(BH08_1_BUS_REMAINING)
	elseif (buses_remaining == 2) then
		mission_help_table_nag(BH08_2_BUS_REMAINING)
	end


	bh08_show_bus_counter()
end

-- Keep a GPS path to the closest bus.
function bh08_bus_gps_path()

	local min_gps_dist = 100
	local gps_bus = {[LOCAL_PLAYER] = "", [REMOTE_PLAYER] = ""}

	-- Get the bus that the GPS should point the player to
	local function get_new_gps_bus(player)

		local closest_bus = ""
		local closest_dist = 0

		for i, bus in pairs(VEH_BUS) do
			if ( not vehicle_is_destroyed(bus) ) then
				local dist = get_dist(player, bus)
				if( (closest_bus == "") or (dist < closest_dist) ) then
					closest_bus = bus
					closest_dist = dist
				end
			end
		end

		
		if (closest_dist >= min_gps_dist) then
			return closest_bus
		else
			return ""
		end

	end

	-- Update the gps for the input player
	local function update_bus_gps(player)
		local new_gps_bus = get_new_gps_bus(player)
		if (new_gps_bus ~= gps_bus[player]) then
			if(gps_bus[player] ~= "") then
				mission_waypoint_remove(PLAYER_SYNC[player])
			end
			gps_bus[player] = new_gps_bus
			if(new_gps_bus ~= "") then
				mission_waypoint_add(new_gps_bus, PLAYER_SYNC[player])
			end
		end
	end

	-- Update the gps for both players
	while(Buses_destroyed < INITIAL_NUM_BUSES) do
		update_bus_gps(LOCAL_PLAYER)
		if(IN_COOP) then
			update_bus_gps(REMOTE_PLAYER)
		end
		thread_yield()
	end

	-- Clear up any existing waypoints
	mission_waypoint_remove(SYNC_ALL)

end

function bh08_bus_route_warnings()
	
	local warning_messages = 
		{	[1] = {["dist_ratio"] = .50, ["message"] = TEXT_BUS_HALF_WAY}, 
			[2] = {["dist_ratio"] = .20, ["message"] = TEXT_BUS_ALMOST_THERE},
		}

	-- Get the shortest distance between a bus and its destination
	local function get_dist_to_destination()
		local min_dist = -1
		for i, bus in pairs(VEH_BUS) do
			if (not vehicle_is_destroyed(bus)) then
				local dist = get_dist_vehicle_to_nav(bus, NAV_BUS_DEST)
				if( (min_dist == -1) or (dist < min_dist) ) then
					min_dist = dist
				end
			end
		end
		return min_dist
	end

	-- The initial distance to the destination
	local initial_dist = get_dist_to_destination()

	-- Play each message when a bus gets close enough to the destination.
	for i, message_info in pairs(warning_messages) do
		local message_dist = message_info["dist_ratio"] * initial_dist
		local current_dist = initial_dist
		while(current_dist > message_dist) do
			delay(1.0)
			current_dist = get_dist_to_destination()
		end
		if(current_dist ~= -1) then
			mission_help_table_nag(message_info["message"])
		end
		delay(5.0)
	end

end

function bh08_boat_route_warnings()
	
	local warning_messages = 
		{	[1] = {["dist_ratio"] = .30, ["message"] = BH08_BOAT_ALMOST_THERE}, 
		}

	-- Get the shortest distance between a bus and its destination
	local function get_dist_to_destination()
		local min_dist = -1
		for i, boat in pairs(VEH_BOAT) do
			if (not vehicle_is_destroyed(boat)) then
				local dist = get_dist_vehicle_to_nav(boat, NAV_BOAT_DEST)
				if( (min_dist == -1) or (dist < min_dist) ) then
					min_dist = dist
				end
			end
		end
		return min_dist
	end

	-- The initial distance to the destination
	local initial_dist = get_dist_to_destination()

	-- Play each message when a bus gets close enough to the destination.
	for i, message_info in pairs(warning_messages) do
		local message_dist = message_info["dist_ratio"] * initial_dist
		local current_dist = initial_dist
		while(current_dist > message_dist) do
			delay(1.0)
			current_dist = get_dist_to_destination()
		end
		if(current_dist ~= -1) then
			mission_help_table_nag(message_info["message"])
		end
		delay(5.0)
	end

end

-- Players must destroy several boats before they can transport prisoners to 
-- the mainland.
function bh08_the_boats()

	-- Prepare the boats
	bh08_prepare_the_boats()

	-- Play the appropriate dialogue
	local conversation_thread = thread_new("bh08_play_boat_conversation")

	-- Yield until at least one player has received markers for the boats
	while( Boat_objective_sync == -1) do
		thread_yield()
	end

	-- If the conversation hasn't been received yet, eliminate the message
	if (not Bh08_call_received) then
		thread_kill(conversation_thread)
		mid_mission_phonecall_reset()
	else
		-- Wait for the conversation thread to finish whatever its doing
		while(not thread_check_done(conversation_thread)) do
			thread_yield()
		end
	end

	-- Start the boat paths
	bh08_send_the_boats()

end

Bh08_call_received = false
function bh08_call_received()
	Bh08_call_received = true
end

function bh08_play_boat_conversation()

	mid_mission_phonecall("bh08_call_received")
	while( not Bh08_call_received ) do
		thread_yield()
	end

	local conversation = 
	{
		{"BR08_PHONECALL_L1", nil, 1},
		{"PLAYER_BR08_PHONECALL_L2", LOCAL_PLAYER, 1},
	}

	audio_play_conversation( conversation, INCOMING_CALL)

	delay(1.0)

	if (Boat_objective_sync ~= -1) then
		return
	end

	-- Tell the players about the courtesy vehicles, wait for them to enter
	-- a boat, heli, or plane or to get close to the prisoner boats.
	thread_new("bh08_ready_for_boats", LOCAL_PLAYER)
	if(IN_COOP) then
		thread_new("bh08_ready_for_boats", REMOTE_PLAYER)
	end

	if (Boat_objective_sync ~= -1) then
		return
	end
	mission_help_table_nag(BH08_FIND_VEHICLE)

	if (Boat_objective_sync ~= -1) then
		return
	end
	delay(5)

	-- Display courtesy-vehicles-available message
	-- Always use the Coop version because there is a typo in the single-player version and it is
	-- too late to fix it.
	if (Boat_objective_sync ~= -1) then
		return
	end
	mission_help_table_nag(TEXT_FIGHTER_AVAILABLE_COOP)


end

function bh08_prepare_the_boats()

	group_create(GROUP_BOATS, true)
	group_create(GROUP_PLAYER_VEHICLES, true)
	-- We're always spawning the coop vehicles in single-player as well now.
	group_create(GROUP_PLAYER_VEHICLES_COOP, true)

	for i, boat in pairs(VEH_BOAT) do
		on_vehicle_destroyed("bh08_boat_destroyed", boat)
		vehicle_stop(boat)
		vehicle_enter_group_teleport(CHAR_BOATLOAD[i], boat)
		vehicle_set_sirenlights(boat, true)
		vehicle_suppress_npc_exit(boat, true)
		vehicle_disable_flee(boat, true)
		vehicle_disable_chase(boat, true)
		set_current_hit_points(boat, MODIFIED_BOAT_HEALTH)
		vehicle_max_speed(boat, BOAT_MAX_SPEED)
		for j, npc in pairs(CHAR_BOATLOAD[i]) do
			set_ignore_ai_flag(npc, true)
			set_cant_flee_flag(npc, true)
			npc_combat_enable(npc, false)
			npc_detection_enable(npc, false)
			inv_item_remove_all(npc)
		end
	end

	for i, boat in pairs(VEH_BOAT_ESCORT_BOAT) do
		vehicle_stop(boat)
		vehicle_enter_group_teleport(CHAR_BOAT_ESCORT_BOAT[i], boat)
		vehicle_suppress_npc_exit(boat, true)
		vehicle_disable_flee(boat, true)
		vehicle_set_sirenlights(boat, true)
		for j, npc in pairs(CHAR_BOAT_ESCORT_BOAT[i]) do
			set_cant_flee_flag(npc, true)
			npc_combat_enable(npc, true)
		end
	end

end

function bh08_send_the_helis()

	-- Decide if we're sending attack helis or normal helis.
	local send_attack_helis = false
	if (	(get_char_vehicle_type(LOCAL_PLAYER) == VT_HELICOPTER) or
			(get_char_vehicle_type(LOCAL_PLAYER) == VT_AIRPLANE) ) then
		send_attack_helis = true
	elseif (	IN_COOP and (	(get_char_vehicle_type(LOCAL_PLAYER) == VT_HELICOPTER) or
									(get_char_vehicle_type(LOCAL_PLAYER) == VT_AIRPLANE)	)	) then
		
		send_attack_helis = true
	end

	-- Make a group of helicopters escort the boats
	local function heli_group_escort(group, heli_list, char_list)

		group_create(group, true)

		for i, heli in pairs(heli_list) do

			-- Set the helicopter to use the new ai navigation.
			helicopter_set_dont_use_constraints(heli, true) 

			vehicle_enter_group_teleport(char_list[i], heli)
			vehicle_set_sirenlights(heli, true)
			for j, npc in pairs(char_list[i]) do
				npc_combat_enable(npc, false)
			end
			local boat_index = HELI_ESCORT_TARGET_INDICES[i]
			local delay_s = BOAT_DELAYS[boat_index]
			thread_new("bh08_heli_boat_escort", heli, CHAR_BOATLOAD[boat_index][1], char_list[i], delay_s)
			thread_new( "bh08_vehicle_invulnerability", heli, VEHICLE_INVULNERABILITY_S + delay_s)
		end		
	end

	-- Have the appropriate group of helicopters attack
	if(send_attack_helis) then
		heli_group_escort(GROUP_ATTACK_HELIS, VEH_BOAT_ATTACK_HELI, CHAR_BOAT_ATTACK_HELI)
	else 
		heli_group_escort(GROUP_NORMAL_HELIS, VEH_BOAT_NORMAL_HELI, CHAR_BOAT_NORMAL_HELI)
	end

end

function bh08_send_the_boats()

	thread_new("bh08_player_swimming_watch")	
	thread_new("bh08_send_the_helis")
	thread_new("bh08_bus_route_warnings")

	for i, boat in pairs(VEH_BOAT) do
		thread_new(	"bh08_boat_route", 
						VEH_BOAT[i], 
						VEH_BOAT_ESCORT_BOAT[i], 
						CHAR_BOATLOAD[i][1], 
						NAV_BOAT_ROUTE[BOAT_ROUTES[i]], 
						BOAT_DELAYS[i])
		thread_new( "bh08_vehicle_invulnerability", VEH_BOAT[i], VEHICLE_INVULNERABILITY_S + BOAT_DELAYS[i])
		thread_new( "bh08_vehicle_invulnerability", VEH_BOAT_ESCORT_BOAT[i], VEHICLE_INVULNERABILITY_S + BOAT_DELAYS[i])
	end


	while (Boats_destroyed < INITIAL_NUM_BOATS) do
		thread_yield()
		if bh08_check_boat_reached_dest() then
			bh08_failure_boat_destination()
			break
		end
	end

	bh08_success_boats_destroyed()

end

function bh08_vehicle_invulnerability(vehicle, delay_s)

	if (vehicle) then

		turn_invulnerable(vehicle)
		delay(delay_s)
		if ( vehicle_exists(vehicle) and (not vehicle_is_destroyed(vehicle)) ) then
			turn_vulnerable(vehicle)
		end

	end

end

function bh08_mark_the_boats(player)

	-- Update the boat objective sync
	if (Boat_objective_sync == PLAYER_SYNC[OTHER_PLAYER]) then
		Boat_objective_sync = SYNC_ALL
	else
		-- When the boats are marked for the first person start showing the x/y count for __both__ players
		Boat_objective_sync = PLAYER_SYNC[player]
		objective_text(0, TEXT_BOATS_DESTROYED, Boats_destroyed, INITIAL_NUM_BOATS, SYNC_ALL)
		bh08_show_boat_counter()
	end

	-- Tell the player to destroy the prison boats
	mission_help_table(TEXT_DESTROY_THE_BOATS, "", "", PLAYER_SYNC[player])

	for i, boat in pairs(VEH_BOAT) do
		if (not vehicle_is_destroyed(boat)) then
			marker_add_vehicle(boat, MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL, PLAYER_SYNC[player])
		end
	end

end

-- Wait for a player to enter a boat, plane or helicopter. (or to get too close to the prison boats)
function bh08_ready_for_boats(player)

	-- Get the sync type for this player
	local sync = PLAYER_SYNC[player]

	-- Define a couple of useful functions

		-- Is the player in a boat or flying vehicle or close enough?
		local function player_ready_for_boats()
			return (	(get_char_vehicle_type(player) == VT_HELICOPTER) or
						(get_char_vehicle_type(player) == VT_AIRPLANE) or
						(get_char_vehicle_type(player) == VT_WATERCRAFT) or
						(get_dist(player, VEH_BOAT[1]) < 500) ) 
		end

		-- Update the gps path.
		local gps_target = ""
		local function update_waypoint()
			local new_target = ""
			if(get_dist (player, VEH_PLAYER_PLANE) < 500) then
				new_target = VEH_PLAYER_PLANE
			else
				new_target = VEH_PLAYER_BOAT
			end
			if(gps_target ~= new_target) then
				gps_target = new_target
				mission_waypoint_remove(sync)
				mission_waypoint_add(new_target, sync)
			end
		end	

	-- If the player isn't in an appropriate vehicle, have them enter one.
	if( not player_ready_for_boats()) then

		-- Mark courtesy vehicles
		for i, veh in pairs(VEH_PLAYER) do
			marker_add_vehicle(veh, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_INTERACT, sync)
		end
		for i, veh in pairs(VEH_PLAYER_COOP) do
			marker_add_vehicle(veh, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_INTERACT, sync)
		end

		-- Update the gps path whenever it changes
		while (not player_ready_for_boats()) do
			update_waypoint()
			thread_yield()
		end

		-- Player has entered a vehicle of the appropriate type, remove courtesy vehicle markers.
		mission_waypoint_remove(sync)
		for i, veh in pairs(VEH_PLAYER) do
			marker_remove_vehicle(veh, sync)
		end
		for i, veh in pairs(VEH_PLAYER_COOP) do
			marker_remove_vehicle(veh, sync)
		end

	end

	-- Add kill markers to the boats
	bh08_mark_the_boats(player)

end

function bh08_player_swimming_watch()
	while 1 do
		thread_yield()
		if character_is_swimming(LOCAL_PLAYER) then
			local close_boat = bh08_police_boat_near_player()
			if (close_boat ~= nil) then
				--thread_kill(THREAD_BOAT_ESCORT[close_boat])
				local THREAD_CHASE = thread_new("vehicle_chase", VEH_BOAT_ESCORT_BOAT[close_boat], LOCAL_PLAYER)
				while character_is_swimming(LOCAL_PLAYER) do
					thread_yield()
				end
				thread_kill(THREAD_CHASE)
				--THREAD_BOAT_ESCORT[close_boat] = thread_new("bh08_boat_route", VEH_BOAT_ESCORT_BOAT[close_boat], close_boat-1)
			end
		end
	end
end

function bh08_police_boat_near_player()
	for i, boat in pairs(VEH_BOAT_ESCORT_BOAT) do
		if (not vehicle_is_destroyed(boat)) and (get_dist_char_to_vehicle(LOCAL_PLAYER, boat) <= 100) then
			return i
		end
	end
	return nil
end

function bh08_boat_route(boat, escort_boat, chase_target, route, delay_time)
	if(delay_time) then
		if (IN_COOP) then
			delay(delay_time * COOP_PATHFIND_DELAY_FACTOR)		
		else
			delay(delay_time)
		end
	end
	if(escort_boat) then	
		vehicle_chase(escort_boat, chase_target, false, false, false, false)
	end
	vehicle_pathfind_to(boat, route, true, false)
	if(escort_boat and (not vehicle_is_destroyed(escort_boat))) then
		release_to_world(escort_boat)
	end
end

function bh08_check_boat_reached_dest()
	for i, boat in pairs(VEH_BOAT) do
		if (not vehicle_is_destroyed(boat)) and (get_dist_vehicle_to_nav(boat, NAV_BOAT_DEST) < BOAT_DESTINATION_DISTANCE) then
			return true
		end
	end
	return false
end

function bh08_boat_destroyed(boat)
	on_vehicle_destroyed("", boat)
	marker_remove_vehicle(boat, SYNC_ALL)
	local num_seats = vehicle_get_num_seats(boat)
	for j, veh in pairs(VEH_BOAT) do
		if veh == boat then
			for k, npc in pairs(CHAR_BOATLOAD[j]) do
				if(not character_is_dead(npc)) then
					character_kill(npc)
				end
			end
			break
		end
	end
	Boats_destroyed = Boats_destroyed + 1
	local boats_remaining = (INITIAL_NUM_BOATS - Boats_destroyed)

	if (boats_remaining == 1) then
		mission_help_table_nag(BH08_1_BOATS_REMAINING)
	elseif (boats_remaining  == 2) then
		mission_help_table_nag(BH08_2_BOATS_REMAINING)
	elseif (boats_remaining == 3) then
		mission_help_table_nag(BH08_3_BOATS_REMAINING)
	end

	bh08_show_boat_counter()
	notoriety_set("Brotherhood", 4)
end

function bh08_show_bus_counter()
	objective_text(0, TEXT_BUSES_DESTROYED, Buses_destroyed, INITIAL_NUM_BUSES)
end

function bh08_show_boat_counter()
	-- We always show the boat count to both players... even the one that hasn't yet been
	-- instructed to destroy the boats.
	objective_text(0, TEXT_BOATS_DESTROYED, Boats_destroyed, INITIAL_NUM_BOATS, SYNC_ALL)
end

function bh08_failure_bus_destination()
	delay(3)
	mission_end_failure("bh08", TEXT_BUS_REACHED_DEST)
end

function bh08_failure_boat_destination()
	delay(3)
	mission_end_failure("bh08", TEXT_BOAT_REACHED_DEST)
end

function bh08_success_boats_destroyed()
	-- release_to_world(VEH_PLAYER_PLANE)
	-- release_to_world(VEH_PLAYER_COOP)
	-- release_to_world(VEH_PLAYER_BOAT)
	delay(3)
	mission_end_success("bh08", "br08-02", { NAVPOINT_FINISH_LOCAL, NAVPOINT_FINISH_REMOTE })
end

function bh08_cleanup()

	-- Get rid of the any mid-mission phone calls
	mid_mission_phonecall_reset()

	-- Fix up spawning
	spawning_boats(true)
	roadblocks_enable(true)

end

function bh08_success()
	-- Called when the mission has ended with success

	-- Post the news event
	radio_post_event("JANE_NEWS_BR08", true)

	--bink_play_movie(CUTSCENE_OUT)
end

-- DEBUG

function bh08_debug_boats()

	group_create(GROUP_BOATS, true)

	for i, boat in pairs(VEH_BOAT) do
		if (i ~= 1) then
			vehicle_detonate(boat)
		end
	end

	local boat = VEH_BOAT[1]

	--for i, boat in pairs(VEH_BOAT) do
		on_vehicle_destroyed("bh08_boat_destroyed", boat)
		vehicle_enter_group_teleport(CHAR_BOATLOAD[1], boat)
		vehicle_set_sirenlights(boat, true)
		vehicle_suppress_npc_exit(boat, true)
		vehicle_disable_flee(boat, true)
		vehicle_disable_chase(boat, true)
		set_current_hit_points(boat, 7500)
		for j, npc in pairs(CHAR_BOATLOAD[1]) do
			set_ignore_ai_flag(npc, true)
			set_cant_flee_flag(npc, true)
			npc_combat_enable(npc, false)
			npc_detection_enable(npc, false)
			inv_item_remove_all(npc)
		end
		marker_add_vehicle(boat, MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL, SYNC_ALL)

		thread_new(	"bh08_boat_route", 
						boat, 
						nil, 
						nil, 
						NAV_BOAT_ROUTE[2],
						0)

	while(true) do
		thread_yield()
	end

end
