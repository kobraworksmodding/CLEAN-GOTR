-- bh01.lua
-- SR2 mission script
-- 03/11/08

-- Navpoints --
NAVPOINT_START						= "bh01_$player_start"
NAVPOINT_REMOTE_START			= "bh01_$remote_start"
NAVPOINT_GIFT_SHOP_EXIT			= "bh01_$gift_shop_exit"
NAVPOINT_POLICE_BOAT_1_DEST	= "bh01_$police_boat_1_destination"
NAVPOINT_POLICE_BOAT_2_DEST	= "bh01_$police_boat_2_destination"
NAVPOINT_HELI_ATTACK				= "bh01_$heli_attack_location"
NAVPOINT_MAIN_BRIDGE				= "bh01_$main_bridge"
NAVPOINT_FLASHBANG_1				= "bh01_$flashbang_1"
NAVPOINT_FLASHBANG_2				= "bh01_$flashbang_2"
NAVPOINT_FLASHBANG_THROW_POS  = "bh01_$flashbang_throw_pos"
NAVPOINT_AMBUSH					= {"bh01_$Waypoint08", "bh01_$n000"}
NAVPOINT_BACK_ROUTE				= "bh01_$n001"
NAVPOINT_BOAT_FINISH_LOCAL		= "bh01_$local_finish"
NAVPOINT_BOAT_FINISH_REMOTE	= "bh01_$remote_finish"

CAVERN_WAYPOINTS					= {"bh01_$Waypoint01", "bh01_$n004", "bh01_$Waypoint02", "bh01_$Waypoint03", 
											"bh01_$Waypoint04", "bh01_$Waypoint05", "bh01_$Waypoint06", "bh01_$Waypoint07", 
											"bh01_$Waypoint08"}
NUM_WAYPOINTS						= sizeof_table(CAVERN_WAYPOINTS)

CHAR_MAERO							= "bh01_$maero"
CHAR_CARLOS							= "bh01_$carlos"
CHAR_POLICE_BOAT_DRIVER_1		= "bh01_$police_boat_driver_1"
CHAR_POLICE_BOAT_DRIVER_2		= "bh01_$police_boat_driver_2"
CHAR_POLICE_HELI_PILOT			= "bh01_$police_heli_pilot"
CHAR_POLICE_HELI_PILOT_2		= "bh01_$police_heli_pilot_2"
CHAR_POLICE_HELI_PILOT_3		= "bh01_$police_heli_pilot_3"
CHAR_LEASHED_COP_1				= "bh01_$c006"
CHAR_LEASHED_COP_2				= "bh01_$c007"
CHAR_LEASHED_COP_3				= "bh01_$c012"
CHAR_LEASHED_COP_4				= "bh01_$c013"
CHAR_LEASHED_COP_5				= "bh01_$c014"
CHAR_LEASHED_COP_6				= "bh01_$c015"
CHAR_FLASHBANG_COP				= "bh01_$cavern_police_4"
CHAR_WATERCRAFT_DRIVER_1		= "bh01_$c016"
CHAR_WATERCRAFT_DRIVER_2		= "bh01_$c017"
CHAR_COP_AMBUSH					= {{"bh01_$c013", "bh01_$c012 (0)"}, 
											{"bh01_$c012", "bh01_$c012 (1)"}}

TABLE_COPS_FIRST_WAVE			= {"bh01_$cavern_police_1", "bh01_$cavern_police_2", "bh01_$cavern_police_3", 
											"bh01_$cavern_police_4", "bh01_$cavern_police_5", "bh01_$c009", "bh01_$c010",}

POLICE_BOAT_1						= "bh01_$police_boat_1"
POLICE_BOAT_2						= "bh01_$police_boat_2"
POLICE_HELI							= "bh01_$v0003"
SPEEDBOAT							= "bh01_$speedboat"
SPEEDBOAT_2							= "bh01_$speedboat_2"
WATERCRAFT_1						= "bh01_$v004"
WATERCRAFT_2						= "bh01_$v005"

TABLE_GETAWAY_CARS				= {"bh01_$getaway_car", "bh01_$getaway_car (0)", "bh01_$getaway_car (1)"}
TABLE_ALL_BOATS					= {POLICE_BOAT_1, POLICE_BOAT_2, SPEEDBOAT, SPEEDBOAT_2, WATERCRAFT_1, WATERCRAFT_2}

-- Groups --
GROUP_ALLIES						= "bh01_$allies"
GROUP_BOATS							= "bh01_$boats"
GROUP_CAVERN_POLICE				= "bh01_$cavern_police"
GROUP_POLICE_BOATS				= "bh01_$police_boats"
GROUP_POLICE_BOAT_DRIVERS		= "bh01_$police_boat_drivers"
GROUP_POLICE_HELI					= "bh01_$police_heli"
GROUP_ROADBLOCKS					= "bh01_$roadblocks"
GROUP_GETAWAY_CAR					= "bh01_$getaway_car"
GROUP_CAVERN_POLICE_2			= "bh01_$cavern_police_2"
GROUP_WATER_GETAWAY_POLICE		= "bh01_$water_getaway_police"
GROUP_BACK_ROUTE_POLICE			= "bh01_$back_route_police"

-- Cutscenes --
   CT_INTRO = "br01-01"
   CT_OUTRO = "br01-02"

-- Personas --
   CARLOS_PERSONA_OVERRIDES =
   {
   { "hostage - barters", "CARLOS_BR01_BARTER" },
   { "misc - respond to player taunt w/taunt", "CARLOS_BR01_TAUNT" },
   { "observe - praised by pc", "CARLOS_BR01_PRAISED" },
   { "combat - congratulate player", "CARLOS_BR01_GRATSPLAYER" },
   { "observe - passenger when driver hits cars", "CARLOS_BR01_HITCAR" },
   { "observe - passenger when driver hits object", "CARLOS_BR01_HITOBJ" },
   { "observe - passenger when driver hits peds", "CARLOS_BR01_HITPED" },
   { "threat - alert (group attack)", "CARLOS_BR01_ATTACK" },
   { "threat - alert (solo attack)", "CARLOS_BR01_ATTACK" },
   { "threat - damage received (firearm)", "CARLOS_BR01_TAKEDAM" },
   { "threat - damage received (melee)", "CARLOS_BR01_TAKEDAM" }
   }

   MAERO_PERSONA_OVERRIDES =
   {
   { "hostage - barters", "MAERO_BR01_HOSTAGE" },
   { "misc - respond to player taunt w/taunt", "MAERO_BR01_TAUNT" },
   { "observe - praised by pc", "MAERO_BR01_PRAISED" },
   { "combat - congratulate player", "MAERO_BR01_GRATSPLAYER" },
   { "combat - congratulate self", "MAERO_BR01_GRATSSELF" },
   { "observe - passenger when driver hits cars", "MAERO_BR01_HITCAR" },
   { "observe - passenger when driver hits object", "MAERO_BR01_HITOBJ" },
   { "observe - passenger when driver hits peds", "MAERO_BR01_HITPED" },
   { "threat - alert (group attack)", "MAERO_BR01_ATTACK" },
   { "threat - alert (solo attack)", "MAERO_BR01_ATTACK" },
   { "threat - damage received (firearm)", "MAERO_BR01_TAKEDAM" },
   { "threat - damage received (melee)", "MAERO_BR01_TAKEDAM" }
   }

-- Others --
Taking_back_route					= false

-- Checkpoints --
CHECKPOINT_TWO_PATHS				= "bh01_checkpoint_two_paths"

-- Triggers --
TRIGGER_TRIBAL_HQ					= "bh01_$tribal_hq"
TRIGGER_TRIBAL_HQ_DOCK			= "bh01_$tribal_hq_dock"
TRIGGER_GIFT_SHOP					= "bh01_$gift_shop_exit_point"
TRIGGER_CAVE						= "bh01_$cave_exit_point"

-- Booleans --
Player_begun_exiting_caverns	= false
Player_has_exited_caverns		= false
TABLE_WAYPOINT_BYPASSED			= {false, false, false, false, false, false, false}
Player_taking_land_getaway		= false
Mission_won                   = false

-- Threads --
THREAD_NPC_FLEE					= -1
THREAD_GETAWAY						= -1
THREAD_FLASHBANG					= -1
THREAD_ESCAPE_CAVERNS			= -1
THREAD_NOTORIETY					= -1
THREAD_WAYPOINT_2					= -1
THREAD_BRIDGE						= -1
THREAD_BACK_ROUTE					= -1
THREAD_WAYPOINT					= {-1, -1, -1, -1, -1, -1, -1}
THREAD_AMBUSH						= {-1, -1, -1, -1}
THREAD_POLICE_BOAT				= {-1, -1}
THREAD_POLICE_HELI				= -1
THREAD_WATERCRAFT_PROXIMITY	= -1
THREAD_WATERCRAFT					= {-1, -1}
THREAD_POLICE_BOATS				= -1
ALL_CAVERN_THREADS				= {THREAD_FLASHBANG, THREAD_ESCAPE_CAVERNS, THREAD_WAYPOINT_2, THREAD_BRIDGE, THREAD_BACK_ROUTE,
											THREAD_WAYPOINT[1], THREAD_WAYPOINT[2], THREAD_WAYPOINT[3], THREAD_WAYPOINT[4], THREAD_WAYPOINT[5], 
											THREAD_WAYPOINT[6], THREAD_WAYPOINT[7], THREAD_AMBUSH[1], THREAD_AMBUSH[2], THREAD_AMBUSH[3], 
											THREAD_AMBUSH[4], THREAD_NPC_FLEE}
ALL_THREADS							= {THREAD_GETAWAY, THREAD_FLASHBANG, THREAD_ESCAPE_CAVERNS, THREAD_NOTORIETY, THREAD_WAYPOINT_2,
											THREAD_BRIDGE, THREAD_BACK_ROUTE, THREAD_WAYPOINT[1], THREAD_WAYPOINT[2], THREAD_WAYPOINT[3], 
											THREAD_WAYPOINT[4], THREAD_WAYPOINT[5], THREAD_WAYPOINT[6], THREAD_WAYPOINT[7], THREAD_AMBUSH[1],
											THREAD_AMBUSH[2], THREAD_AMBUSH[3], THREAD_AMBUSH[4], THREAD_POLICE_BOAT[1], THREAD_POLICE_BOAT[2],
											THREAD_POLICE_HELI, THREAD_WATERCRAFT_PROXIMITY, THREAD_WATERCRAFT[1], THREAD_WATERCRAFT[2],
											THREAD_POLICE_BOATS, THREAD_NPC_FLEE}

-- Distances
WIN_DISTANCE_METERS = 10


function bh01_start(checkpoint, is_restart)
	-- Start trigger is hit...the activate button was hit
--	set_mission_author("Aaron Hanson")
	set_mission_author("Ryan Spencer")
   mission_start_fade_out()

	ambient_gang_spawn_enable(false)

	-- Play the intro cutscene
   if ( checkpoint == MISSION_START_CHECKPOINT ) then

		-- Determine the starting groups
		local starting_groups = { GROUP_ALLIES , GROUP_CAVERN_POLICE, GROUP_BACK_ROUTE_POLICE}

		if (not is_restart) then
			cutscene_play( CT_INTRO, starting_groups, { NAVPOINT_START, NAVPOINT_REMOTE_START }, false )
			for i,group in pairs(starting_groups) do
				group_show(group)
			end
		else
			teleport_coop( NAVPOINT_START, NAVPOINT_REMOTE_START, true )	
			for i,group in pairs(starting_groups) do
				group_create(group, true)
			end
		end
   end

   party_allow_max_followers( true )
	ambient_gang_spawn_enable(false)

	-- Bring both players to the mission start location	

	if (checkpoint == CHECKPOINT_TWO_PATHS) then
		-- A checkpoint was hit so take that path...
		THREAD_NOTORIETY = thread_new("bh01_watch_brotherhood_notoriety")
		
		character_set_cannot_be_grabbed(CHAR_MAERO, true)
		character_set_cannot_be_grabbed(CHAR_CARLOS, true)
		
		ambient_gang_spawn_enable(false)

		group_create(GROUP_BOATS, true)
		group_create(GROUP_GETAWAY_CAR, true)
		group_create(GROUP_CAVERN_POLICE_2, true)

		on_death("failure_maero_death", CHAR_MAERO)
		on_dismiss("failure_maero_dismiss", CHAR_MAERO)
		on_death("failure_carlos_death", CHAR_CARLOS)
		on_dismiss("failure_carlos_dismiss", CHAR_CARLOS)
		
		notoriety_set("police", 2) 
		notoriety_set_min("police", 2)
		notoriety_set_max("police", 2)
		notoriety_force_no_spawn("police", true)
		notoriety_force_no_spawn("ultor", true)
		
		npc_weapon_pickup_override(CHAR_MAERO, false) 
		npc_weapon_pickup_override(CHAR_CARLOS, false) 
		
		turn_invulnerable(SPEEDBOAT)

		inv_item_add("twelve_gauge", 1, CHAR_MAERO)
		inv_item_add("glock", 1, CHAR_CARLOS)
		inv_item_equip("twelve_gauge", CHAR_MAERO)
		inv_item_equip("glock", CHAR_CARLOS)
   else
		bh01_setup_cavern_start()
	end

   mission_start_fade_in()

   if ( checkpoint == MISSION_START_CHECKPOINT ) then
   else
		bh01_two_escape_paths()
   end
end

function bh01_setup_cavern_start()
	party_add(CHAR_MAERO, LOCAL_PLAYER)

	if ( coop_is_active() ) then
		party_add(CHAR_CARLOS, REMOTE_PLAYER)
	else
		party_add(CHAR_CARLOS, LOCAL_PLAYER)
	end

   for index, override in pairs( CARLOS_PERSONA_OVERRIDES ) do
      persona_override_character_start( CHAR_CARLOS, override[1], override[2] )
   end
   for index, override in pairs( MAERO_PERSONA_OVERRIDES ) do
      persona_override_character_start( CHAR_MAERO, override[1], override[2] )
   end

	character_set_cannot_be_grabbed(CHAR_MAERO, true)
	character_set_cannot_be_grabbed(CHAR_CARLOS, true)
	
	set_force_combat_ready_team( "Police" )

	for i, npc in pairs(TABLE_COPS_FIRST_WAVE) do
		npc_weapon_pickup_override(npc, false) 
		inv_item_remove_all(npc)
		
		local choice = rand_int(0, 2)
		
		if (npc == CHAR_FLASHBANG_COP) then
			choice = 3
		end

		if (choice == 0) then
			inv_item_add("nightstick", 1, npc)
			inv_item_equip("nightstick", npc)
		elseif (choice == 1) then
			inv_item_add("pepper_spray", 1, npc)
			inv_item_equip("pepper_spray", npc)
		elseif (choice == 2) then
			inv_item_add("stun_gun", 1, npc)
			inv_item_equip("stun_gun", npc)
		else
			inv_item_add("flashbang", 5, npc)
			inv_item_equip("flashbang", npc)
		end
	end

	group_create(GROUP_BOATS, false)
	group_create(GROUP_GETAWAY_CAR, false)
	group_create_hidden(GROUP_CAVERN_POLICE_2)
	turn_invulnerable(SPEEDBOAT)
	npc_leash_to_nav(CHAR_LEASHED_COP_1, CHAR_LEASHED_COP_1, 4)
	npc_leash_to_nav(CHAR_LEASHED_COP_2, CHAR_LEASHED_COP_1, 4)
	npc_leash_to_nav(CHAR_LEASHED_COP_3, CHAR_LEASHED_COP_3, 4)
	npc_leash_to_nav(CHAR_LEASHED_COP_4, CHAR_LEASHED_COP_4, 4)
	npc_leash_to_nav(CHAR_LEASHED_COP_5, CHAR_LEASHED_COP_5, 4)
	npc_leash_to_nav(CHAR_LEASHED_COP_6, CHAR_LEASHED_COP_6, 4)

	for i, set in pairs(CHAR_COP_AMBUSH) do
		for j, npc in pairs(set) do
			set_ignore_ai_flag(npc, true)
		end
	end

	THREAD_FLASHBANG = thread_new("bh01_cop_fire_flashbang")
	THREAD_NPC_FLEE = thread_new("bh01_ambient_npcs_flee")

	notoriety_set("police", 2) 
	notoriety_set_min("police", 2)
	notoriety_set_max("police", 2)
	notoriety_force_no_spawn("police", true)
	notoriety_force_no_spawn("ultor", true)

	npc_weapon_pickup_override(CHAR_MAERO, false) 
	npc_weapon_pickup_override(CHAR_CARLOS, false) 
	
	inv_item_add("twelve_gauge", 1, CHAR_MAERO)
	inv_item_add("glock", 1, CHAR_CARLOS)
	inv_item_equip("twelve_gauge", CHAR_MAERO)
	inv_item_equip("glock", CHAR_CARLOS)

	-- Setup callback for Maero's death
	on_death("failure_maero_death", CHAR_MAERO)
	on_dismiss("failure_maero_dismiss", CHAR_MAERO)
	on_death("failure_carlos_death", CHAR_CARLOS)
	on_dismiss("failure_carlos_dismiss", CHAR_CARLOS)

	THREAD_ESCAPE_CAVERNS = thread_new("bh01_escape_caverns")
	THREAD_NOTORIETY = thread_new("bh01_watch_brotherhood_notoriety")
	THREAD_WAYPOINT_2 = thread_new("bh01_watch_waypoint_2_proximity")
	--THREAD_BRIDGE = thread_new("bh01_watch_main_bridge")

	for j = 1, (NUM_WAYPOINTS - 1), 1 do
		THREAD_WAYPOINT[j] = thread_new("bh01_watch_waypoint_bypass", j)
	end
	THREAD_BACK_ROUTE = thread_new("bh01_watch_back_route")
end

function bh01_ambient_npcs_flee()
	delay(1)

	while (1) do
		character_set_all_civilians_fleeing(LOCAL_PLAYER, 50)
		delay(1)
	end
end

function bh01_watch_hood()
	while (1) do
		mission_help_table(get_current_hood_by_position("#PLAYER#"))
		thread_yield()
	end
end

function bh01_player_is_on_land()
	return get_current_hood_by_position("#PLAYER#") ~= 'No Hood'
end

function bh01_cop_fire_flashbang()
	delay(4)
   move_to_safe( CHAR_FLASHBANG_COP, NAVPOINT_FLASHBANG_THROW_POS, 1, false, false )
	force_throw(CHAR_FLASHBANG_COP, NAVPOINT_FLASHBANG_1, 23)
end

function bh01_dialogue(char, dialogue)
	while ( character_is_dead(char) or character_is_ragdolled(char) or character_is_on_fire(char) ) do
		thread_yield()
	end

   audio_play_for_character( dialogue, char, "voice", false, true )
end

function bh01_watch_main_bridge()
	while(1) do
		if ( bh01_either_player_near( NAVPOINT_MAIN_BRIDGE, 8 ) and (not Taking_back_route) and (not Player_has_exited_caverns) ) then
			bh01_dialogue(CHAR_CARLOS, "bh01_not_that_way")
			delay(15)
		end
		thread_yield()
	end
end

function bh01_watch_waypoint_2_proximity()
	while ( ( not bh01_either_player_near( CAVERN_WAYPOINTS[3], 40 ) ) and (not Taking_back_route) and (not Player_has_exited_caverns) ) do
		thread_yield()
	end
	group_show(GROUP_CAVERN_POLICE_2)
end

function bh01_watch_back_route()
	while(not Taking_back_route) do
		thread_yield()
		if ( bh01_either_player_near( NAVPOINT_BACK_ROUTE, 20 ) ) then
			Taking_back_route = true
			TABLE_WAYPOINT_BYPASSED[1] = true
			TABLE_WAYPOINT_BYPASSED[2] = true
			TABLE_WAYPOINT_BYPASSED[3] = true
		end
	end
end

function bh01_watch_waypoint_bypass(waypoint_id)
	while(not Player_begun_exiting_caverns and not TABLE_WAYPOINT_BYPASSED[waypoint_id]) do
		if bh01_either_player_near( CAVERN_WAYPOINTS[waypoint_id], 10 ) then
			for i = 1, waypoint_id, 1 do
				TABLE_WAYPOINT_BYPASSED[i] = true
			end
		end
		thread_yield()
	end
end

function bh01_watch_brotherhood_notoriety()
	while(notoriety_get("brotherhood") < 2) do
		thread_yield()
	end
	failure_brotherhood_notoriety()
end


function bh01_escape_caverns()
	bh01_dialogue(CHAR_MAERO, "MAERO_BR01_COPSATTACK_1")
	bh01_dialogue(CHAR_CARLOS, "CARLOS_BR01_GETOUT")
	mission_help_table("bh01_escape_caverns")
	delay(3)

	bh01_navigate_cavern_waypoints()

	thread_yield()
end

function bh01_navigate_cavern_waypoints()
	Player_begun_exiting_caverns = true

	for i = 1, NUM_WAYPOINTS, 1 do
		while i < NUM_WAYPOINTS and TABLE_WAYPOINT_BYPASSED[i] do
			i = i + 1
			thread_yield()
		end

		if (i <= NUM_WAYPOINTS) and (not TABLE_WAYPOINT_BYPASSED[i]) then
			marker_add_navpoint(CAVERN_WAYPOINTS[i], MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)
			while ( ( not bh01_either_player_near( CAVERN_WAYPOINTS[i], 10 ) ) and (not Player_has_exited_caverns) ) do
				thread_yield()
				if TABLE_WAYPOINT_BYPASSED[i] then
					break
				end
			end
			marker_remove_navpoint(CAVERN_WAYPOINTS[i])

			if Player_has_exited_caverns then
				i = NUM_WAYPOINTS
			end
			thread_yield()
		end
	end

	mission_set_checkpoint(CHECKPOINT_TWO_PATHS)

	bh01_two_escape_paths()
end


function bh01_two_escape_paths_msg()
	mission_help_table("bh01_getaway_choices")
end

function bh01_two_escape_paths()
	trigger_enable(TRIGGER_CAVE, true)
	marker_add_trigger(TRIGGER_CAVE, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)
	on_trigger("bh01_get_to_tribal_hq_by_water", TRIGGER_CAVE)

	trigger_enable(TRIGGER_GIFT_SHOP, true)
	marker_add_trigger(TRIGGER_GIFT_SHOP, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)
	on_trigger("bh01_get_to_tribal_hq_by_land", TRIGGER_GIFT_SHOP)

	bh01_cop_ambush()
   bh01_dialogue( CHAR_CARLOS, "CARLOS_BR01_MISSION_FORK" )
	thread_new("bh01_two_escape_paths_msg")
end

function bh01_cop_ambush()
	for i, set in pairs(CHAR_COP_AMBUSH) do
		for j, npc in pairs(set) do
			THREAD_AMBUSH[j + ((i-1)*2)] = thread_new("bh01_ambush_path", npc, NAVPOINT_AMBUSH[i])
		end
	end
end

function bh01_ambush_path(npc, nav)
	set_ignore_ai_flag(npc, true)
	move_to(npc, nav, 2, true, true)
	set_ignore_ai_flag(npc, false)
	turn_to_char(npc, LOCAL_PLAYER)
end

function bh01_spawn_police_boat()
	group_create(GROUP_POLICE_HELI, true)
	group_create(GROUP_POLICE_BOATS, true)
	group_create(GROUP_POLICE_BOAT_DRIVERS, true)

	set_cops_shooting_from_vehicles(true)
	vehicle_suppress_npc_exit(POLICE_HELI, true)
	vehicle_enter_teleport(CHAR_POLICE_HELI_PILOT, POLICE_HELI, 0)
	vehicle_enter_teleport(CHAR_POLICE_HELI_PILOT_2, POLICE_HELI, 3)
	vehicle_enter_teleport(CHAR_POLICE_HELI_PILOT_3, POLICE_HELI, 2)

	npc_combat_enable(CHAR_POLICE_BOAT_DRIVER_1, true)
	npc_combat_enable(CHAR_POLICE_BOAT_DRIVER_2, true)
	vehicle_enter_teleport(CHAR_POLICE_BOAT_DRIVER_1, POLICE_BOAT_1)
	vehicle_enter_teleport(CHAR_POLICE_BOAT_DRIVER_2, POLICE_BOAT_2)

	THREAD_POLICE_BOAT[1] = thread_new("bh01_police_boat_1")
	THREAD_POLICE_BOAT[2] = thread_new("bh01_police_boat_2")
	THREAD_POLICE_HELI = thread_new("bh01_police_heli")

	THREAD_WATERCRAFT_PROXIMITY = thread_new("bh01_spawn_watercraft_on_proximity")
end

function bh01_spawn_watercraft_on_proximity()
	group_create_hidden(GROUP_WATER_GETAWAY_POLICE)
	vehicle_enter_teleport(CHAR_WATERCRAFT_DRIVER_1, WATERCRAFT_1, 0)
	vehicle_enter_teleport(CHAR_WATERCRAFT_DRIVER_2, WATERCRAFT_2, 0)
	group_show(GROUP_WATER_GETAWAY_POLICE)

	while get_dist_char_to_nav(LOCAL_PLAYER, WATERCRAFT_1) > 150 do
		thread_yield()
	end

	THREAD_WATERCRAFT[1] = thread_new("bh01_watercraft_1")
	THREAD_WATERCRAFT[2] = thread_new("bh01_watercraft_2")
end

function bh01_watercraft_1()
	vehicle_chase(WATERCRAFT_1, LOCAL_PLAYER, false, true, true)
end

function bh01_watercraft_2()
	vehicle_chase(WATERCRAFT_2, LOCAL_PLAYER, false, true, true)
end

function bh01_police_heli()
	vehicle_chase(POLICE_HELI, LOCAL_PLAYER)
end

function bh01_police_boat_1()
	vehicle_chase(POLICE_BOAT_1, LOCAL_PLAYER, false, true, true)
end

function bh01_police_boat_2()
	if ( coop_is_active() ) then
		vehicle_chase(POLICE_BOAT_2, REMOTE_PLAYER, false, true, true)
	else
		vehicle_chase(POLICE_BOAT_2, LOCAL_PLAYER, false, true, true)
	end
end

function bh01_get_to_tribal_hq_by_land()
	Player_has_exited_caverns = true
	Player_taking_land_getaway = true

	notoriety_force_no_spawn("police", false)
	notoriety_force_no_spawn("ultor", false)

	-- Display checkpoint message
	mission_help_table("bh01_take_maero_to_hq")

	on_trigger("", TRIGGER_CAVE)
	trigger_enable(TRIGGER_CAVE, false)
	marker_remove_trigger(TRIGGER_CAVE, SYNC_ALL)
	mission_waypoint_remove()

	on_trigger("", TRIGGER_GIFT_SHOP)
	trigger_enable(TRIGGER_GIFT_SHOP, false)
	marker_remove_trigger(TRIGGER_GIFT_SHOP, SYNC_ALL)
	mission_waypoint_remove()

	group_create(GROUP_ROADBLOCKS, true)

	--trigger_enable(TRIGGER_TRIBAL_HQ, true)
	marker_add_navpoint(TRIGGER_TRIBAL_HQ, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION, SYNC_ALL)
	--on_trigger("Ttribal_hq_reached", TRIGGER_TRIBAL_HQ)
	mission_waypoint_add(TRIGGER_TRIBAL_HQ, SYNC_ALL)

	bh01_kill_cavern_threads()

	THREAD_GETAWAY = thread_new("bh01_handle_getaway_choice")
end

function bh01_get_to_tribal_hq_by_water() 
	Player_has_exited_caverns = true
	Player_taking_land_getaway = false

	-- Fade out and wait for the fade to complete
	follower_make_independent( CHAR_CARLOS, true )
	follower_make_independent( CHAR_MAERO, true )
	fade_out(1.0)
	while (fade_get_percent() < 1.0) do
		thread_yield()
	end

	-- Teleport the player(s) into the vehicle
	vehicle_enter_teleport(LOCAL_PLAYER, "bh01_$speedboat", 0)
	turn_vulnerable(SPEEDBOAT)

	if ( coop_is_active() ) then
		vehicle_enter_teleport(REMOTE_PLAYER, "bh01_$speedboat", 2)

		vehicle_enter_teleport(CHAR_MAERO, "bh01_$speedboat", 1)
		vehicle_enter_teleport(CHAR_CARLOS, "bh01_$speedboat", 3)
	else
		vehicle_enter_teleport(CHAR_MAERO, "bh01_$speedboat", 1)
		vehicle_enter_teleport(CHAR_CARLOS, "bh01_$speedboat", 2)
	end

	follower_make_independent( CHAR_CARLOS, false )
	follower_make_independent( CHAR_MAERO, false )

	-- Fade in and wait for the fade to complete roughly 50%
	fade_in(1.0)
	while (fade_get_percent() > 0.5) do
		thread_yield()
	end

	notoriety_force_no_spawn("police", false)
	notoriety_force_no_spawn("ultor", false)

	THREAD_POLICE_BOATS = thread_new("bh01_spawn_police_boat")
	
	-- Display checkpoint message
	mission_help_table("bh01_take_maero_to_hq")

	on_trigger("", TRIGGER_CAVE)
	trigger_enable(TRIGGER_CAVE, false)
	marker_remove_trigger(TRIGGER_CAVE, SYNC_ALL)
	mission_waypoint_remove()

	on_trigger("", TRIGGER_GIFT_SHOP)
	trigger_enable(TRIGGER_GIFT_SHOP, false)
	marker_remove_trigger(TRIGGER_GIFT_SHOP, SYNC_ALL)
	mission_waypoint_remove()

	--trigger_enable(TRIGGER_TRIBAL_HQ_DOCK, true)
	marker_add_navpoint(TRIGGER_TRIBAL_HQ_DOCK, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION, SYNC_ALL)
	mission_waypoint_add(TRIGGER_TRIBAL_HQ_DOCK, SYNC_ALL)

	bh01_kill_cavern_threads()

	THREAD_GETAWAY = thread_new("bh01_handle_getaway_choice")
end

function bh01_kill_cavern_threads()
	for i, thread in pairs(ALL_CAVERN_THREADS) do
		if thread ~= -1 then
			thread_kill(thread)
		end
	end
end

function bh01_switch_to_land_getaway()
	Player_taking_land_getaway = true

	--on_trigger("",TRIGGER_TRIBAL_HQ_DOCK)
	--trigger_enable(TRIGGER_TRIBAL_HQ_DOCK,false)
	marker_remove_navpoint(TRIGGER_TRIBAL_HQ_DOCK,SYNC_ALL)
	mission_waypoint_remove()

	--trigger_enable(TRIGGER_TRIBAL_HQ, true)
	marker_add_navpoint(TRIGGER_TRIBAL_HQ, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION, SYNC_ALL)
	--on_trigger("Ttribal_hq_reached", TRIGGER_TRIBAL_HQ)
	mission_waypoint_add( TRIGGER_TRIBAL_HQ, SYNC_ALL )
end

function bh01_switch_to_water_getaway()
	Player_taking_land_getaway = false

	--on_trigger("",TRIGGER_TRIBAL_HQ)
	--trigger_enable(TRIGGER_TRIBAL_HQ,false)
	marker_remove_navpoint(TRIGGER_TRIBAL_HQ,SYNC_ALL)
	mission_waypoint_remove()

	--trigger_enable(TRIGGER_TRIBAL_HQ_DOCK, true)
	marker_add_navpoint(TRIGGER_TRIBAL_HQ_DOCK, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION, SYNC_ALL)
	mission_waypoint_add(TRIGGER_TRIBAL_HQ_DOCK, SYNC_ALL)
end

function bh01_handle_getaway_choice()
	while not (bh01_tribal_hq_dock_reached() or bh01_tribal_hq_land_reached()) do
		if Player_taking_land_getaway then
			if bh01_player_is_in_boat() then
				bh01_switch_to_water_getaway()
			end
		else
			if (bh01_player_is_on_land() and not bh01_player_is_in_boat()) or bh01_player_is_in_car() then
				bh01_switch_to_land_getaway()
			end
		end
		thread_yield()
	end

	bh01_tribal_hq_reached()
end

function bh01_player_is_in_boat()
	return get_char_vehicle_type(LOCAL_PLAYER) == 4
end

function bh01_player_is_in_car()
	return get_char_vehicle_type(LOCAL_PLAYER) < 2
end

function bh01_local_player_near( navpoint_name, distance )
   if ( get_dist_char_to_nav( LOCAL_PLAYER, navpoint_name ) < distance ) then
      return true
   end

   return false
end

function bh01_either_player_near( navpoint_name, distance )
   if ( bh01_local_player_near( navpoint_name, distance ) ) then
      return true
   end
   if ( coop_is_active() and get_dist_char_to_nav( REMOTE_PLAYER, navpoint_name ) < distance ) then
      return true
   end

   return false
end

function bh01_tribal_hq_dock_reached()
   return ( bh01_local_player_near( TRIGGER_TRIBAL_HQ_DOCK, WIN_DISTANCE_METERS ) and (not Player_taking_land_getaway ) )
end

function bh01_tribal_hq_land_reached()
   return ( bh01_local_player_near( TRIGGER_TRIBAL_HQ, WIN_DISTANCE_METERS ) and Player_taking_land_getaway )
end

function bh01_tribal_hq_reached()
	for i, thread in pairs(ALL_THREADS) do
		if thread ~= -1 then
			thread_kill(thread)
		end
	end

	if Player_taking_land_getaway then
		marker_remove_navpoint(TRIGGER_TRIBAL_HQ, SYNC_ALL)
	else 
		marker_remove_navpoint(TRIGGER_TRIBAL_HQ_DOCK, SYNC_ALL)
	end
	
	mission_waypoint_remove()

   -- Stop the players' vehicles when they reach the HQ trigger
   if ( get_dist( LOCAL_PLAYER, TRIGGER_TRIBAL_HQ_DOCK ) < WIN_DISTANCE_METERS or
        get_dist( LOCAL_PLAYER, TRIGGER_TRIBAL_HQ ) < WIN_DISTANCE_METERS ) then
      if ( character_is_in_vehicle( LOCAL_PLAYER ) ) then
         player_controls_disable( LOCAL_PLAYER )
         vehicle_stop_do( LOCAL_PLAYER )
      end
   end
   if ( coop_is_active() ) then
      if ( get_dist( REMOTE_PLAYER, TRIGGER_TRIBAL_HQ_DOCK ) < WIN_DISTANCE_METERS or
           get_dist( REMOTE_PLAYER, TRIGGER_TRIBAL_HQ ) < WIN_DISTANCE_METERS ) then
         if ( character_is_in_vehicle( REMOTE_PLAYER ) ) then
            player_controls_disable( REMOTE_PLAYER )
            vehicle_stop_do( REMOTE_PLAYER )
         end
      end
   end

	bh01_success_tribal_hq_reached()
end

function bh01_success_tribal_hq_reached()
   Mission_won = true
	mission_end_success( "bh01", CT_OUTRO, { NAVPOINT_BOAT_FINISH_LOCAL, NAVPOINT_BOAT_FINISH_REMOTE } )
end

function failure_maero_death()
	mission_end_failure("bh01", "bh01_maero_died")
end

function failure_maero_dismiss()
	mission_end_failure("bh01", "bh01_maero_dismissed")
end

function failure_carlos_death()
	mission_end_failure("bh01", "bh01_carlos_died")
end

function failure_carlos_dismiss()
	mission_end_failure("bh01", "bh01_carlos_dismissed")
end

function failure_brotherhood_notoriety()
	mission_end_failure("bh01", "bh01_brotherhood_notoriety")
end


function bh01_cleanup()
	-- Cleanup mission here
	for i, thread in pairs(ALL_THREADS) do
		if thread ~= -1 then
			thread_kill(thread)
		end
	end

	on_death("", CHAR_MAERO)
	on_dismiss("", CHAR_MAERO)
	on_death("", CHAR_CARLOS)
	on_dismiss("", CHAR_CARLOS)
	on_notoriety_event("")
	notoriety_reset("police") 
	ambient_gang_spawn_enable(true)
	group_destroy(GROUP_ALLIES)
	release_to_world(GROUP_GETAWAY_CAR)
	release_to_world(GROUP_BOATS)
	release_to_world(GROUP_POLICE_BOATS)
	release_to_world(GROUP_WATER_GETAWAY_POLICE)
	ambient_gang_spawn_enable(true)
   party_allow_max_followers( false )

	-- Clean up all navpoints
	for index, name in pairs( CAVERN_WAYPOINTS ) do
		marker_remove_navpoint( name )
	end
	marker_remove_trigger(TRIGGER_CAVE)
	marker_remove_trigger(TRIGGER_GIFT_SHOP)

	marker_remove_navpoint(TRIGGER_TRIBAL_HQ)
	marker_remove_navpoint(TRIGGER_TRIBAL_HQ_DOCK)

	if ( Mission_won ) then
      if( coop_is_active() ) then
         character_evacuate_from_all_vehicles(REMOTE_PLAYER)
         teleport( REMOTE_PLAYER, NAVPOINT_BOAT_FINISH_REMOTE )
      end
      character_evacuate_from_all_vehicles(LOCAL_PLAYER)
      teleport( LOCAL_PLAYER, NAVPOINT_BOAT_FINISH_LOCAL )
   end

end

function bh01_success()
end