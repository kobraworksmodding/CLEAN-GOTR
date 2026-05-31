-- bh06.lua
-- SR2 mission script
-- 3/28/07

-- Cutscene crash fixes by IdolNinja
-- 3/11/2011

-- Debug flags
DEBUG_TRUCK_ENTRY =				false

-- Tweakable Parameters
MIN_PHASE1_NOTORIETY =			2.000001
MIN_TURRET_NOTORIETY =			3
MIN_TURRET_NOTORIETY_COOP =	4
Truck_health_warning_level =	0.8
PIERCE_PREFERRED_STATION_1 =	7 -- 102.4 Klassic FM
PIERCE_PREFERRED_STATION_2 =	10 -- 105.0 The World

-- Groups --
GROUP_COURTESY_CAR =				"bh06_$courtesy_car"
GROUP_COURTESY_CAR_COOP =		"bh06_$courtesy_car_coop"
GROUP_PARCEL_TRUCK =				"bh06_$parcel_truck"
GROUP_TEMP =						"bh06_$temp"
GROUP_AMBUSH =						"bh06_$ambush"
GROUP_AMBUSH_BIKE =				"bh06_$ambush_bike"
GROUP_AMBUSH_MOUNTAIN =			"bh06_$ambush_mountain"

-- Navpoints --
NAV_LOCAL_START =					"bh06_$n032"
NAV_REMOTE_START =				"bh06_$n033"
NAV_TOP_OF_SEMI =					"bh06_$n000"
NAV_ARENA =							"bh06_$n001"
NAV_ARENA_ENTRY =					{"bh06_$n031", "bh06_$n030"}
NAV_ARENA_ROUTE =					{"bh06_$n003", "bh06_$n004", "bh06_$n005", "bh06_$n006", "bh06_$n026", "bh06_$n028", "bh06_$n029",
										"bh06_$n007", "bh06_$n008", "bh06_$n009", "bh06_$n010", "bh06_$n027",
										"bh06_$n011", "bh06_$n012", "bh06_$n013", "bh06_$n014", 
										"bh06_$n015", "bh06_$n016", "bh06_$n017", "bh06_$n018", 
										"bh06_$n019", "bh06_$n020", "bh06_$n021", "bh06_$n022", 
										"bh06_$n023", "bh06_$n001"}
NAV_AMBUSH_PATH =					{"bh06_$n034", "bh06_$n035"}
NAV_AMBUSH_BIKE_TRIG =			"bh06_$n036"
NAV_AMBUSH_MOUNTAIN_TRIG =		"bh06_$n038"
NAV_AMBUSH_MOUNTAIN_PATH =		"bh06_$n037"
FIRST_WAYPOINT =					"bh06_$waypoint"
NAV_LOCAL_TRUCK_STAGING =		"bh06_$c000"
NAV_REMOTE_TRUCK_STAGING =		"bh06_$c001"
NAV_PIERCE_TRUCK_STAGING =		"bh06_$c001"
NAV_LOCAL_END =					"bh06_$n039"
NAV_REMOTE_END =					"bh06_$n040"


-- Text --
TEXT_BRING_HOMEY =				"bh06_bring_homey"	-- Pickup the fireworks truck from the warehouse.
--TEXT_BRING_HOMEY_COOP =			"bh06_bring_homey_coop" -- Pickup the fireworks truck from the warehouse.
TEXT_NEED_A_HOMEY =				"bh06_need_a_homey" -- You'll need Pierce with you.
TEXT_REENTER_TRUCK =				"bh06_reenter_truck" -- Get back in the fireworks truck.
TEXT_30_SECONDS =					"bh06_30_seconds" -- You have 30 seconds to reenter the truck.
TEXT_GET_TO_THE_ARENA =			"bh06_get_to_the_arena" -- Get to the Arena
TEXT_PARCEL_TRUCK_DESTROYED = "bh06_parcel_truck_destroyed"
TEXT_PARCEL_TRUCK_HEALTH =		"bh06_parcel_truck_health" -- Truck:
TEXT_TRIBAL_KILLED =				"bh06_tribal_killed" -- Brotherhood killed
TEXT_KILL_TRIBAL =				"bh06_kill_tribal" -- Kill the Brotherhood guarding the turck.
TEXT_ENTER_TRUCK =				"bh06_enter_truck" -- Get into the Fireworks truck
TEXT_PIERCE_DIED =				"bh06_pierce_died"
TEXT_PIERCE_DISMISSED =			"bh06_pierce_dismissed"
TEXT_USE_FIREWORKS =				"bh06_use_fireworks" -- Throw fireworks boxes to defend the truck. 
TEXT_DONT_DAMAGE_TRUCK =		"bh06_dont_damage_truck" -- Don't damage the fir
TEXT_DIDNT_GET_TO_ARENA =		"bh06_didnt_get_to_arena"

TEXT_WAREHOUSE	=					"bh06_warehouse"	-- Head to the warehouse.
TEXT_PROTECT_TRUCK =				"bh06_protect_truck" -- Protect the truck.

-- Vehicles --
VEH_PARCEL_TRUCK =				"bh06_$v000"
VEH_AMBUSH =						{"bh06_$v002", "bh06_$v003"}
VEH_AMBUSH_BIKE =					{"bh06_$v004", "bh06_$v005", "bh06_$v006"}
VEH_AMBUSH_MOUNTAIN =			"bh06_$v007"

-- Characters --
CHAR_TRIBAL_TELEPORT =			"bh06_$c008"
CHAR_PIERCE =							"bh06_$c009"
CHAR_TRIBAL =						{"bh06_$c000", "bh06_$c001", "bh06_$c002", "bh06_$c003", "bh06_$c004", "bh06_$c005", "bh06_$c006", "bh06_$c007", "bh06_$c008", "bh06_$c010", "bh06_$c011", "bh06_$c012"}
CHAR_AMBUSH =						{{"bh06_$c013", "bh06_$c014"},
										 {"bh06_$c015", "bh06_$c016"}}
CHAR_AMBUSH_BIKE =				{"bh06_$c017", "bh06_$c018", "bh06_$c019"}
CHAR_AMBUSH_MOUNTAIN =			{"bh06_$c020", "bh06_$c021"}

-- Cutscenes --
-- Added by IdolNinja. These variables are used in the script for the cutscenes for stability instead of calling them directly

CUTSCENE_IN =				"br06-01"
CUTSCENE_OUT =				"br06-02"
MISSION_NAME = 				"bh06"

-- Voice --
VOICE_CHECKIN =					{{"PIERCE_BR06_CHECKIN_01", CHAR_PIERCE, 1}, 
										 {"PLAYER_BR06_CHECKIN_01", LOCAL_PLAYER, 1}}
VOICE_MUSIC =						{{"PIERCE_BR06_MUSIC_01", CHAR_PIERCE, 1},
										 {"PLAYER_BR06_MUSIC_01", LOCAL_PLAYER, 1},
										 {"PIERCE_BR06_MUSIC_02", CHAR_PIERCE, 1}}
VOICE_BICKER =						{{"PLAYER_BR06_BICKER_01", LOCAL_PLAYER, 1},
										 {"PIERCE_BR06_BICKER_01", CHAR_PIERCE, 1}}
VOICE_PLAYER_INTRO_01 =			{{"PLAYER_BR06_INTRO_01", LOCAL_PLAYER, 1}}
VOICE_PIERCE_DAMAGE =			{{{"PIERCE_BR06_DAMAGE_01", CHAR_PIERCE, 1}},
										 {{"PIERCE_BR06_DAMAGE_02", CHAR_PIERCE, 1}},
										 {{"PIERCE_BR06_DAMAGE_03", CHAR_PIERCE, 1}}}
VOICE_PIERCE_DRIVING_01 =		{{"PIERCE_BR06_DRIVING_01", CHAR_PIERCE, 1}}
VOICE_PIERCE_END_01 =			{{"PIERCE_BR06_END_01", CHAR_PIERCE, 0}}

-- Threads --
THREAD_PATHFIND =					-1
THREAD_NOTORIETY =				-1
THREAD_PYROBOX =					-1
THREAD_AMBUSH =					-1
THREAD_AMBUSH_BIKE =				{-1, -1, -1}
THREAD_AMBUSH_TRUCK =			{-1, -1}
THREAD_AMBUSH_MOUNTAIN =		-1
ALL_THREADS =						{THREAD_PATHFIND, THREAD_NOTORIETY, THREAD_PYROBOX, THREAD_AMBUSH, THREAD_AMBUSH_BIKE[1], 
										 THREAD_AMBUSH_BIKE[2], THREAD_AMBUSH_BIKE[3], THREAD_AMBUSH_TRUCK[1], THREAD_AMBUSH_TRUCK[2], THREAD_AMBUSH_MOUNTAIN}

-- Other --
IN_COOP =							false
Tribal_killed =					0
INITIAL_NUM_TRIBAL =				sizeof_table(CHAR_TRIBAL)
NOTORIETY_DELTA =					0.0033
Heading_to_arena =				false
EXPLOSION_TRUCK_DESTROYED =	"Exp Fireworks"
PARCEL_TRUCK_INITIAL_HP =		0
Next_pierce_damage_voice =		1


function bh06_start(bh06_checkpoint, is_restart)

	-- Always create both courtesy cars. If the player starts the mission w/ extra followers,
	-- this gives them a vehicle to use.
	local start_groups = {GROUP_COURTESY_CAR, GROUP_COURTESY_CAR_COOP, GROUP_TEMP}

	if (is_restart) then

		for i,group in pairs(start_groups) do
			group_create(group, true)
		end

		-- Teleport the player(s) to their start locations
		teleport_coop(NAV_LOCAL_START, NAV_REMOTE_START)

	else
		cutscene_play(	CUTSCENE_IN, start_groups, {NAV_LOCAL_START, NAV_REMOTE_START}, false)
		for i,group in pairs(start_groups) do
			group_show(group)
		end		
	end

	bh06_initialize(bh06_checkpoint)

	if (DEBUG_TRUCK_ENTRY) then
		bh06_truck_test()
	end

	bh06_get_the_truck()
end

function bh06_initialize(checkpoint)

	mission_start_fade_out(0.0)

	bh06_initialize_common()

	bh06_initialize_checkpoint(checkpoint)

	mission_start_fade_in()

end

-- Initialization code shared by all checkpoints.
function bh06_initialize_common()

	-- Start trigger is hit...the activate button was hit
	set_mission_author("Phillip Alexander and Aaron Hanson (aka Father Zucosos)")

	if coop_is_active() then
		IN_COOP = true
	end

	set_time_of_day(18, 30)

	party_add(CHAR_PIERCE)
	on_death("bh06_failure_pierce_died", CHAR_PIERCE)
	on_dismiss("bh06_failure_pierce_dismissed", CHAR_PIERCE)

	notoriety_force_no_spawn("Brotherhood", true)
	notoriety_set_max("Brotherhood", 2)

end

-- Initialization code specific to the checkpoint.
function bh06_initialize_checkpoint(checkpoint)

	-- This mission has no checkpoints

end

function bh06_truck_test()

	group_create("bh06_$Gtruck_test", true)

	local VEH_TEST_TRUCK = "bh06_$v008"
	VEH_PARCEL_TRUCK = VEH_TEST_TRUCK

	NAV_LOCAL_TRUCK_STAGING = NAV_LOCAL_START
	NAV_REMOTE_TRUCK_STAGING = NAV_REMOTE_START
	NAV_PIERCE_TRUCK_STAGING = "bh06_$c0009"

	delay(10)

	bh06_setup_truck_occupants()

	thread_new("bh06_music_bicker", VEH_TEST_TRUCK)

	while(true) do
		thread_yield()
	end
end

function bh06_music_bicker(truck)

	audio_play_conversation(VOICE_PIERCE_DRIVING_01, NOT_CALL)

	if (IN_COOP) then
		return
	end

	delay(15)

	while( not character_is_ready(CHAR_PIERCE) ) do
		thread_yield()
	end

	if (not vehicle_is_destroyed(truck)) then
		local player_station = radio_get_station(truck)
		local pierce_station = PIERCE_PREFERRED_STATION_1
		if (player_station == pierce_station) then
			pierce_station = PIERCE_PREFERRED_STATION_2
		end

		radio_set_station(truck, pierce_station)

		delay(1)

		audio_play_conversation(VOICE_MUSIC, NOT_CALL)
	end


end

function bh06_get_the_truck()

	-- Start creating the parcel truck
	thread_new("bh06_create_the_truck")

	-- Play the intro conversation
	audio_play_conversation(VOICE_PLAYER_INTRO_01, NOT_CALL)

	-- Start raising Brotherhood notoriety
	THREAD_NOTORIETY = thread_new("bh06_notoriety")

	-- Add indicators for the fight with the Brotherhood
	mission_waypoint_add(FIRST_WAYPOINT, SYNC_ALL)
	for i, npc in pairs(CHAR_TRIBAL) do
      marker_add_npc( npc, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL )
		on_death("bh06_tribal_killed", npc)
	end

	-- Tell the players what to do
	mission_help_table(TEXT_BRING_HOMEY)
	local thread_warehouse_nag = thread_new("bh06_nag", TEXT_WAREHOUSE)

	-- Wait until a player is close to the truck or has killed a tribal gang member
	while (	(get_dist_closest_player_to_object(VEH_PARCEL_TRUCK) > 100) and
				(Tribal_killed == 0)
			) do
		thread_yield()
	end
	thread_kill(thread_warehouse_nag)
	mission_help_clear()	
	marker_remove_vehicle(VEH_PARCEL_TRUCK, SYNC_ALL)
	mission_waypoint_remove(SYNC_ALL)
	delay(2.0)

	mission_help_table(TEXT_KILL_TRIBAL)
	bh06_show_tribal_counter()

	while (bh06_truck_defenders_alive()) do
		thread_yield()
	end
	
	delay(2)
	objective_text_clear(0)

	minimap_icon_add_vehicle_radius(VEH_PARCEL_TRUCK, MINIMAP_ICON_PROTECT_ACQUIRE, 10)
	mission_help_table(TEXT_ENTER_TRUCK)
	
	-- Keep waiting if Pierce is incapacitated or the player's not near the truck
	local function ready_to_enter_truck()
		local close_enough = get_dist_closest_player_to_object(VEH_PARCEL_TRUCK) < 10
		return ( close_enough and character_is_ready(CHAR_PIERCE) )
	end

	while ( not ready_to_enter_truck() ) do
		thread_yield()
	end
		
	marker_remove_vehicle(VEH_PARCEL_TRUCK, SYNC_ALL)

	-- Setup the truck's occupants
	bh06_setup_truck_occupants()

	bh06_get_to_arena()
end

function bh06_create_the_truck()
	group_create(GROUP_PARCEL_TRUCK, true)
	PARCEL_TRUCK_INITIAL_HP = get_current_hit_points(VEH_PARCEL_TRUCK)
	vehicle_set_untowable(VEH_PARCEL_TRUCK, true)
	on_damage("bh06_truck_health_warning", VEH_PARCEL_TRUCK, Truck_health_warning_level)
	on_vehicle_destroyed("bh06_failure_truck_destroyed", VEH_PARCEL_TRUCK)
	set_unjackable_flag(VEH_PARCEL_TRUCK, true)
end

function bh06_setup_truck_occupants()

	-- Make everyone invulnerable
	player_controls_disable(LOCAL_PLAYER)
	turn_invulnerable(LOCAL_PLAYER, false)
	if IN_COOP then
		turn_invulnerable(REMOTE_PLAYER, false)
		player_controls_disable(REMOTE_PLAYER)
	else
		turn_invulnerable(CHAR_PIERCE)
	end

	tutorial_lock("satchel_charges")
	fade_out(1.0)
	fade_out_block()

	-- Get rid of all party members other than Pierce
	party_dismiss_all()

	-- Wait for the dimiss to take effect
	if (IN_COOP) then
		delay(1.0)
	end
	party_add(CHAR_PIERCE)

	-- Make sure that no one is currently in a vehicle
	character_evacuate_from_all_vehicles(LOCAL_PLAYER)
	character_evacuate_from_all_vehicles(CHAR_PIERCE)
	if (IN_COOP) then
		character_evacuate_from_all_vehicles(REMOTE_PLAYER)
	end

	-- Teleport everyone to a staging area near the truck.
	teleport_coop(NAV_LOCAL_TRUCK_STAGING, NAV_REMOTE_TRUCK_STAGING, true)

	-- Courtesy vehicles are no longer needed.
	release_to_world(GROUP_COURTESY_CAR)
	release_to_world(GROUP_COURTESY_CAR_COOP)

	if(not IN_COOP) then
		vehicle_infinite_mass(VEH_PARCEL_TRUCK, true)
	end
	vehicle_disable_flee(VEH_PARCEL_TRUCK, true)
	vehicle_disable_chase(VEH_PARCEL_TRUCK, true)
	set_unjackable_flag(VEH_PARCEL_TRUCK, false)

	-- Wait for truck to spawn-in
	while(not vehicle_exists(VEH_PARCEL_TRUCK)) do
		thread_yield()
	end

	follower_make_independent(CHAR_PIERCE, true)
	if IN_COOP then
		vehicle_enter_teleport(REMOTE_PLAYER, VEH_PARCEL_TRUCK, 0)
		vehicle_enter_teleport(CHAR_PIERCE, VEH_PARCEL_TRUCK, 1)
		set_player_can_enter_exit_vehicles(REMOTE_PLAYER, false)
	else
		vehicle_enter_teleport(CHAR_PIERCE, VEH_PARCEL_TRUCK, 0)
	end
	vehicle_enter_teleport(LOCAL_PLAYER, VEH_PARCEL_TRUCK, 2)
	set_player_can_enter_exit_vehicles(LOCAL_PLAYER, false)
	follower_make_independent(CHAR_PIERCE, false)

	set_unjackable_flag(VEH_PARCEL_TRUCK, true)
	vehicle_suppress_npc_exit(VEH_PARCEL_TRUCK, true)
	vehicle_set_invulnerable_to_player_explosives(VEH_PARCEL_TRUCK, true)
	
	while(not character_is_in_vehicle(LOCAL_PLAYER, VEH_PARCEL_TRUCK)) do
		thread_yield()
	end
	while(not character_is_in_vehicle(CHAR_PIERCE, VEH_PARCEL_TRUCK)) do
		thread_yield()
	end
	if (IN_COOP) then
		while(not character_is_in_vehicle(REMOTE_PLAYER, VEH_PARCEL_TRUCK)) do
			thread_yield()
		end
	end

	-- Give the server the pyrobox and make sure that it stays equipped at all times.
	inv_weapon_add_temporary(LOCAL_PLAYER, "pyroBox", 1, true)
	inv_weapon_disable_all_but_this_slot(WEAPON_SLOT_THROWN, SYNC_LOCAL)
	THREAD_PYROBOX = thread_new("bh06_keep_pyrobox_equipped")

	fade_in(1.0)
	fade_in_block()

	player_controls_enable(LOCAL_PLAYER)
	turn_vulnerable(LOCAL_PLAYER)
	if IN_COOP then
		player_controls_enable(REMOTE_PLAYER)
		turn_vulnerable(REMOTE_PLAYER)
	else
		turn_vulnerable(CHAR_PIERCE)
	end
end

function bh06_nag(text_tag)

	delay(15.0)
	while(true) do
		mission_help_table_nag(text_tag)
		delay(25.0)
	end

end

function bh06_tribal_killed( tribal_name )
   mission_debug( tribal_name.." killed." )
	marker_remove_npc( tribal_name, SYNC_ALL )
	Tribal_killed = Tribal_killed + 1
	bh06_show_tribal_counter()
end

function bh06_show_tribal_counter()
	objective_text(0, TEXT_TRIBAL_KILLED, Tribal_killed, INITIAL_NUM_TRIBAL)
end

function bh06_truck_defenders_alive()
	return Tribal_killed < INITIAL_NUM_TRIBAL
end

function bh06_get_to_arena()
	Heading_to_arena = true

	notoriety_set_max("Brotherhood", 5)
	notoriety_force_no_spawn("Brotherhood", false)

	THREAD_AMBUSH = thread_new("bh06_ambush")

	mission_help_table(TEXT_USE_FIREWORKS, "", "", SYNC_LOCAL)

	if not IN_COOP then
		thread_new("bh06_music_bicker", VEH_PARCEL_TRUCK)
		vehicle_set_use_short_cuts(VEH_PARCEL_TRUCK, false)
		THREAD_PATHFIND = thread_new("bh06_pathfind_to_arena")
	else
		hud_timer_set(0, 180000, "bh06_failure_didnt_get_to_arena_in_time", true, SYNC_ALL)
	end

	marker_add_navpoint(NAV_ARENA, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION, SYNC_ALL)
	if IN_COOP then
		mission_waypoint_add(NAV_ARENA, SYNC_ALL)
	end

	hud_bar_on(0, "Health", TEXT_PARCEL_TRUCK_HEALTH, PARCEL_TRUCK_INITIAL_HP)

	delay(6)
	mission_help_table(TEXT_GET_TO_THE_ARENA)

	local thread_protect_truck_nag = thread_new("bh06_nag", TEXT_PROTECT_TRUCK)
	while get_dist_vehicle_to_nav(VEH_PARCEL_TRUCK, NAV_ARENA) > 10 do
		thread_yield()
		hud_bar_set_value(0, get_current_hit_points(VEH_PARCEL_TRUCK), SYNC_ALL)
	end

	-- Turn off Brotherhood & Police notoriety so that cars don't pile up around the player as they stop.
	notoriety_reset("Brotherhood")
	notoriety_set("Brotherhood", 0)
	notoriety_set_max("Brotherhood", 0)

	notoriety_reset("Police")
	notoriety_set("Police", 0)
	notoriety_set_max("Police", 0)

	thread_kill(thread_protect_truck_nag)
	mission_help_clear()	

	hud_bar_off(0)

	mission_waypoint_remove()
	marker_remove_navpoint(NAV_ARENA)

	-- Stop the truck when they reach the trigger if a player is driving
	if IN_COOP then
		vehicle_max_speed(VEH_PARCEL_TRUCK, 0)
		player_controls_disable( REMOTE_PLAYER )
	   vehicle_stop_do( REMOTE_PLAYER )
   else
		player_controls_disable( LOCAL_PLAYER )
		vehicle_stop_do( LOCAL_PLAYER )
	end

	audio_play_conversation(VOICE_PIERCE_END_01, NOT_CALL)

	mission_end_success(MISSION_NAME, CUTSCENE_OUT, {NAV_LOCAL_END, NAV_REMOTE_END})

end

function bh06_ambush()
	group_create(GROUP_AMBUSH_BIKE, true)
	group_create(GROUP_AMBUSH, true)
	group_create(GROUP_AMBUSH_MOUNTAIN, true)

	for i, set in pairs(CHAR_AMBUSH) do
		for j, npc in pairs(set) do
			set_ignore_ai_flag(npc, true)
		end
	end
	for i, npc in pairs(CHAR_AMBUSH_BIKE) do
		set_ignore_ai_flag(npc, true)
	end
	for i, npc in pairs(CHAR_AMBUSH_MOUNTAIN) do
		set_ignore_ai_flag(npc, true)
	end

	for i, veh in pairs(VEH_AMBUSH_BIKE) do
		vehicle_enter_teleport(CHAR_AMBUSH_BIKE[i], veh)
	end
	for i, veh in pairs(VEH_AMBUSH) do
		vehicle_enter_group_teleport(CHAR_AMBUSH[i], veh)
	end
	vehicle_enter_group_teleport(CHAR_AMBUSH_MOUNTAIN, VEH_AMBUSH_MOUNTAIN)


	while (get_dist_vehicle_to_nav(VEH_PARCEL_TRUCK, NAV_AMBUSH_BIKE_TRIG) > 60) do
		thread_yield()
	end

	for i, veh in pairs(VEH_AMBUSH_BIKE) do
		THREAD_AMBUSH_BIKE[i] = thread_new("bh06_bike_ambusher", veh, i)
	end

	release_to_world(GROUP_AMBUSH_BIKE)

	while (get_dist_vehicle_to_nav(VEH_PARCEL_TRUCK, NAV_AMBUSH_PATH[1]) > 40) do
		thread_yield()
	end

	for i, veh in pairs(VEH_AMBUSH) do
		THREAD_AMBUSH_TRUCK[i] = thread_new("bh06_ambusher", veh, i)
	end

	release_to_world(GROUP_AMBUSH)


	if (not IN_COOP) then
		audio_play_conversation(VOICE_CHECKIN, NOT_CALL)
	end

	while (get_dist_vehicle_to_nav(VEH_PARCEL_TRUCK, NAV_AMBUSH_MOUNTAIN_TRIG) > 40) do
		thread_yield()
	end

	THREAD_AMBUSH_MOUNTAIN = thread_new("bh06_mountain_ambusher")

	if (not IN_COOP) then
		audio_play_conversation(VOICE_BICKER, NOT_CALL)
	end
end


function bh06_mountain_ambusher()
	for i, npc in pairs(CHAR_AMBUSH_MOUNTAIN) do
		set_ignore_ai_flag(npc, false)
	end
	delay(3)
	vehicle_suppress_flipping(VEH_AMBUSH_MOUNTAIN, true)
	vehicle_set_torque_multiplier(VEH_AMBUSH_MOUNTAIN, 1.2)
	vehicle_pathfind_to(VEH_AMBUSH_MOUNTAIN, NAV_AMBUSH_MOUNTAIN_PATH, true, false, false)
	vehicle_chase(VEH_AMBUSH_MOUNTAIN, LOCAL_PLAYER, true, true, false, false)

	release_to_world(GROUP_AMBUSH_MOUNTAIN)

end

function bh06_bike_ambusher(veh, bike_num)
	set_ignore_ai_flag(CHAR_AMBUSH_BIKE[bike_num], false)
	delay(4-bike_num)
	vehicle_chase(veh, LOCAL_PLAYER, true, false, false, false)
end

function bh06_ambusher(veh, truck_num)
	for i, npc in pairs(CHAR_AMBUSH[truck_num]) do
		set_ignore_ai_flag(npc, false)
	end
	if truck_num > 1 then
		delay(2)
	end
	thread_yield()
	vehicle_pathfind_to(veh, NAV_AMBUSH_PATH[1], true, false, false)
	thread_yield()
	vehicle_chase(veh, LOCAL_PLAYER, true, true, false, false)
end

function bh06_truck_health_warning()
	mission_help_table(TEXT_DONT_DAMAGE_TRUCK)
	Truck_health_warning_level = Truck_health_warning_level - 0.2
	if Truck_health_warning_level > 0 then
		on_damage("bh06_truck_health_warning", VEH_PARCEL_TRUCK, Truck_health_warning_level)
	else
		on_damage("", VEH_PARCEL_TRUCK, Truck_health_warning_level)
	end

	if ( character_is_in_vehicle(LOCAL_PLAYER, VEH_PARCEL_TRUCK) ) then
		if Next_pierce_damage_voice < 4 then
			audio_play_conversation(VOICE_PIERCE_DAMAGE[Next_pierce_damage_voice], NOT_CALL)
		end
		Next_pierce_damage_voice = Next_pierce_damage_voice + 1
	end
end

function bh06_keep_pyrobox_equipped()
	while(1) do
		if (not inv_item_is_equipped("pyroBox", LOCAL_PLAYER)) and character_is_in_vehicle(LOCAL_PLAYER, VEH_PARCEL_TRUCK) then
			inv_item_equip("pyroBox", LOCAL_PLAYER)
		end
		character_set_combat_ready(LOCAL_PLAYER, true, 1.0)
		thread_yield()
	end
end

function bh06_pathfind_to_arena()
	if ( not IN_COOP ) then
		while not character_is_in_vehicle(CHAR_PIERCE, VEH_PARCEL_TRUCK) do
			thread_yield()
		end
	end
	vehicle_turret_base_to(VEH_PARCEL_TRUCK, NAV_ARENA_ENTRY, true)
	vehicle_pathfind_to(VEH_PARCEL_TRUCK, NAV_ARENA, true, true)
end

function bh06_notoriety()
	local phase_time = 0
	while(1) do
		thread_yield()
		if Heading_to_arena then
			if (IN_COOP) then
				notoriety_set_min("Brotherhood", MIN_TURRET_NOTORIETY_COOP)
				notoriety_set("Brotherhood", MIN_TURRET_NOTORIETY_COOP)
			else
				notoriety_set_min("Brotherhood", MIN_TURRET_NOTORIETY)
				notoriety_set("Brotherhood", MIN_TURRET_NOTORIETY)
			end
			break
		else
			
			phase_time = 0
			while (not Heading_to_arena) and (notoriety_get_decimal("Brotherhood") < MIN_PHASE1_NOTORIETY) do
				thread_yield()
				phase_time = phase_time + get_frame_time()
				local pct = phase_time / 30
				local new_notoriety = pct * MIN_PHASE1_NOTORIETY
				if new_notoriety > MIN_PHASE1_NOTORIETY then
					new_notoriety = MIN_PHASE1_NOTORIETY
				end
				notoriety_set("Brotherhood", new_notoriety)
			end
		end
	end
end

function bh06_failure_truck_destroyed()
	if THREAD_PATHFIND ~= -1 then
		thread_kill(THREAD_PATHFIND)
	end

	if THREAD_NOTORIETY ~= -1 then
		thread_kill(THREAD_NOTORIETY)
	end

	explosion_create(EXPLOSION_TRUCK_DESTROYED, VEH_PARCEL_TRUCK, LOCAL_PLAYER, false)
	delay(2)
	explosion_create(EXPLOSION_TRUCK_DESTROYED, VEH_PARCEL_TRUCK, LOCAL_PLAYER, false)

	delay(3)
	mission_end_failure(MISSION_NAME, TEXT_PARCEL_TRUCK_DESTROYED)
end

function bh06_failure_abandoned_truck()
	mission_end_failure(MISSION_NAME, TEXT_PARCEL_TRUCK_DESTROYED)
end

function bh06_failure_pierce_died()
	mission_end_failure(MISSION_NAME, TEXT_PIERCE_DIED)
end

function bh06_failure_pierce_dismissed()
	mission_end_failure(MISSION_NAME, TEXT_PIERCE_DISMISSED)
end

function bh06_failure_didnt_get_to_arena_in_time()
	mission_end_failure(MISSION_NAME, TEXT_DIDNT_GET_TO_ARENA)
end

function bh06_cleanup()
	-- Cleanup mission here
	IN_COOP = coop_is_active()

	-- Clear out the hud timer
	hud_timer_stop(0)

	-- Make sure that the satchel charge tutorial doesn't stay locked
	tutorial_unlock("satchel_charges")

	-- Players were made invulnerable when teleporting into the truck... make sure that
	-- they are now vulnerable
	turn_vulnerable(LOCAL_PLAYER)
	if IN_COOP then
		turn_vulnerable(REMOTE_PLAYER)
	end

   -- The player may be in the parcel truck - explicitly destroy it
   group_destroy( GROUP_PARCEL_TRUCK )

	set_player_can_enter_exit_vehicles(LOCAL_PLAYER, true)
	if (IN_COOP) then
		set_player_can_enter_exit_vehicles(REMOTE_PLAYER, true)
	end

	for i, thread in pairs(ALL_THREADS) do
		if thread ~= -1 then
			thread_kill(thread)
		end
	end

	inv_weapon_remove_temporary(LOCAL_PLAYER, "pyroBox")
	inv_weapon_enable_or_disable_all_slots(true, SYNC_LOCAL)

	-- Make sure that all markers are removed
	mission_waypoint_remove()
	marker_remove_navpoint(NAV_ARENA)

end

function bh06_success()
	-- Called when the mission has ended with success
	if (IN_COOP) then
		player_controls_enable(REMOTE_PLAYER)
	else
		player_controls_enable(LOCAL_PLAYER)
	end
end
