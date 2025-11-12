-- bh10.lua
-- SR2 mission script
-- 3/28/07

	-- Debug --
	DEBUG_ENTER_WAREHOUSE = false
	DEBUG_MAERO_FIGHT =		false

	DEBUG_TEXT_EXPLOIT =		1
	DEBUG_TEXT_MAERO_AI =	2
	DEBUG_TEXT_NUMBERS =		3
	DEBUG_TEXT_SATCHELS =	4
	DEBUG_TEXT_TARGETS =		5

	DEBUG_TEXT_ENABLED = {
		[DEBUG_TEXT_EXPLOIT] =		false,
		[DEBUG_TEXT_MAERO_AI] =		false,
		[DEBUG_TEXT_NUMBERS] =		false,
		[DEBUG_TEXT_SATCHELS] =		false,
		[DEBUG_TEXT_TARGETS] =		false,
	}

	-- Tweakable parameters
	MAX_BH_NOTORIETY =							4		-- Maximum Brotherhood notoriety level
	MAX_BH_NOTORIETY_COOP =						5		-- Maximum Brotherhood notoriety level
	Maero_explosion_ratio =						.25	-- Portion of explosion damage that is applied Maero.
	Maero_recover_damage_ratio =				.50	-- Portion of damage that is applied to Maero while he is recovering.
	Maero_initial_health =						12000	-- Maero's initial health in Single player.
	Maero_initial_health_coop_multiplier = 1.5	-- Multiplier applied to Maero's health in coop.
	Maero_damage_multiplier =					.75   -- Mutliplier applied to damage that Maero deals to players

	-- Navpoints --
	NAV_PLAYER_START =		"bh10_$player_start"
	NAV_REMOTE_START =		"bh10_$remote_start"
	NAV_MAERO =					"bh10_$maero"
	NAV_SAINTS_INITIAL_ENTRY = "bh10_$n064"
	NAV_BIKE_START =			{"bh10_$n001", "bh10_$n002", "bh10_$n003", "bh10_$n004"}
	NAV_WAREHOUSE_WAYPOINTS =			{"bh10_$n005", "bh10_$n006", "bh10_$n009", "bh10_$n007", "bh10_$n010", "bh10_$n008"}
	NAV_PLAYER_START_MAERO = "bh10_$n_maero_test_local"
	NAV_REMOTE_START_MAERO = "bh10_$n_maero_test_remote"

	-- Groups --
	GROUP_STANDARD_LIEUTENANTS =		"bh10_$standard_lieutenants"
	GROUP_ROCKET_LIEUTENANTS =			"bh10_$rocket_lieutenants"
	GROUP_WAREHOUSE_SOLDIERS =			"bh10_$warehouse_soldiers"
	GROUP_WAREHOUSE_FLOOR_1 =			"bh10_$warehouse_floor_1"
	GROUP_WAREHOUSE_FLOOR_2 =			"bh10_$warehouse_floor_2"
	GROUP_WAREHOUSE_FLOOR_3 =			"bh10_$warehouse_floor_3"
	GROUP_WAREHOUSE_FLOOR_4 =			"bh10_$warehouse_floor_4"
	GROUP_WAREHOUSE_FLOOR_5 =			"bh10_$warehouse_floor_5"
	GROUP_MAERO =							"bh10_$maero"
	GROUP_PLAYER_HOMIES =				"bh10_$player_homies"
	GROUP_SAINTS =							{"bh10_$saints1", "bh10_$saints2", "bh10_$saints3", "bh10_$saints4"}
	GROUP_LOS_DUMMIES =					{"bh10_$los_dummies1", "bh10_$los_dummies2", "bh10_$los_dummies3"}
	GROUP_EXPLOIT_BH =					"bh10_$maero_exploits"
	GROUP_COURTESY_CAR =					"bh10_$courtesy_car"
	GROUP_COURTESY_CAR_COOP =			"bh10_$courtesy_car_coop"
	GROUP_GRENADES =						"bh10_$Ggrenades"

	-- Tables --
	TABLE_STANDARD_LIEUTENANTS =		
		{"bh10_$c000", "bh10_$c001", "bh10_$c002", "bh10_$c003", "bh10_$c004", "bh10_$c005", "bh10_$c009", "bh10_$c010"}
	TABLE_ROCKET_LIEUTENANTS =			
		{"bh10_$c011", "bh10_$c012"}
	TABLE_PLAYER_HOMIES =				
		{"bh10_$c032", "bh10_$c033"}

	-- Checkpoints --
	CHECKPOINT_STAGING =					"bh10_checkpoint_staging"
	CHECKPOINT_WAREHOUSE =				"bh10_checkpoint_warehouse"
	CHECKPOINT_MAERO =					"bh10_checkpoint_maero"

	-- Vehicles --
	SAINTS_CAR =							{{"bh10_$v000"},
												 {"bh10_$v001"},
												 {"bh10_$v002"},
												 {"bh10_$v003", "bh10_$v004", "bh10_$v005", "bh10_$v006"}}

	-- Triggers --
	TRIGGER_TRIBAL_STAGING =			"bh10_$tribal_staging"
	TRIGGER_WAREHOUSE_ENTRANCE =		"bh10_$waypoint_2"
	TRIGGER_WAREHOUSE_ROOF =			"bh10_$waypoint_3"

	TRIGGER_LOW_GROUND =					"bh10_$t_low_ground"
	TRIGGER_HIGH_GROUND =				"bh10_$t_high_ground"
	TRIGGER_HIDING =						"bh10_$t_hiding"

	TRIGGER_WH_GROUP_01 =				"bh10_$trigger_warehouse_gp1"
	TRIGGER_WH_GROUP_02 =				"bh10_$trigger_warehouse_gp2"
	TRIGGER_WH_GROUP_03 =				"bh10_$trigger_warehouse_gp3"
	TRIGGER_WH_GROUP_04 =				"bh10_$trigger_warehouse_gp4"
	TRIGGER_WH_GROUP_05 =				"bh10_$trigger_warehouse_gp5"

	TRIGGER_EXPLOIT_AREA_1A =			"bh10_$t_exploit_area_1a"			
	TRIGGER_EXPLOIT_AREA_1B =			"bh10_$t_exploit_area_1b"			
	TRIGGER_EXPLOIT_AREA_1C =			"bh10_$t_exploit_area_1c"			
	TRIGGER_EXPLOIT_AREA_2 =			"bh10_$t_exploit_area_2"
	TRIGGER_EXPLOIT_AREA_3 =			"bh10_$t_exploit_area_3"
	
	TRIGGER_EXPLOIT_AREAS =				{	TRIGGER_EXPLOIT_AREA_1A, TRIGGER_EXPLOIT_AREA_1B,
													TRIGGER_EXPLOIT_AREA_1C,
													TRIGGER_EXPLOIT_AREA_2, TRIGGER_EXPLOIT_AREA_3}
	TRIGGER_EXPLOIT_ENTRANCES =		{	"bh10_$t_exploit_enter_1", "bh10_$t_exploit_enter_2", 
													"bh10_$t_exploit_enter_3", "bh10_$t_exploit_enter_4"}
	TRIGGER_EXPLOIT_EXITS =				{	"bh10_$t_exploit_exit_1", "bh10_$t_exploit_exit_2",
													"bh10_$t_exploit_exit_3", "bh10_$t_exploit_exit_4"}

	EXPLOIT_SPAWN_INFO = 
	{ 
		["A"] =
		{
			["max_npcs"] = 2,
			["max_npcs_coop"] = 4,
			["spawn points"] =	{	"bh10_$n028", "bh10_$n029", "bh10_$n030", 
											"bh10_$n031", "bh10_$n032", "bh10_$n033"},
			--[[
			["attack points"] =	{	"bh10_$n034", "bh10_$n035", "bh10_$n036",
											"bh10_$n037", "bh10_$n038", "bh10_$n039"},
			]]
			["attack points"] =	{	"bh10_$n023", "bh10_$n014", "bh10_$n015",
											"bh10_$n016", "bh10_$n017", "bh10_$n024"},
			["triggers"] =			{	"bh10_$t_exploit_spawn_a", "bh10_$t_exploit_spawn_a2"},
			["exploit_areas"] =	{	TRIGGER_EXPLOIT_AREA_1A, TRIGGER_EXPLOIT_AREA_1B, TRIGGER_EXPLOIT_AREA_2,
											TRIGGER_EXPLOIT_AREA_3}
		},
		["B"] =
		{
			["max_npcs"] = 2,
			["max_npcs_coop"] = 4,
			["spawn points"] =	{	"bh10_$n040", "bh10_$n041", "bh10_$n042", 
											"bh10_$n043", "bh10_$n044", "bh10_$n045"},
			["attack points"] =	{	"bh10_$n046", "bh10_$n047", "bh10_$n048",
											"bh10_$n049", "bh10_$n050", "bh10_$n051"},
			["triggers"] =			{	"bh10_$t_exploit_spawn_b"},
			["exploit_areas"] =	{	TRIGGER_EXPLOIT_AREA_1A, TRIGGER_EXPLOIT_AREA_1B, TRIGGER_EXPLOIT_AREA_1C}
		},
		-- Yes, I know I skipped "C".
		["D"] =
		{
			["max_npcs"] = 2,
			["max_npcs_coop"] = 4,
			["spawn points"] =	{	"bh10_$n052", "bh10_$n053", "bh10_$n054", 
											"bh10_$n055", "bh10_$n056", "bh10_$n057"},
			["attack points"] =	{	"bh10_$n058", "bh10_$n059", "bh10_$n060",
											"bh10_$n061", "bh10_$n062", "bh10_$n063",
											"bh10_$n065"},
			["triggers"] =			{	"bh10_$t_exploit_spawn_d"},
			["exploit_areas"] =	{	TRIGGER_EXPLOIT_AREA_2, TRIGGER_EXPLOIT_AREA_3}
		}

	}

	-- Characters --
	CHAR_MAERO =			"bh10_$maero"
	CHAR_FIRST_ROCKETEER =	"bh10_$c011"
	CHAR_FIRST_ROCKETEE =   "bh10_$c034"

	EXTRA_SAINTS =					{{"bh10_$c034", "bh10_$c035", "bh10_$c036", "bh10_$c037"}, 
										 {"bh10_$c038", "bh10_$c039", "bh10_$c040", "bh10_$c041"},
										 {"bh10_$c042", "bh10_$c043", "bh10_$c044", "bh10_$c045"}, 
										 {"bh10_$c046", "bh10_$c047", "bh10_$c048", "bh10_$c049"}}
	
	LOS_DUMMIES =					{"bh10_$c050", "bh10_$c051", "bh10_$c052"}

	EXPLOIT_BH =					{	"bh10_$c006", "bh10_$c007", "bh10_$c008", "bh10_$c013",
											"bh10_$c014", "bh10_$c073", "bh10_$c089", "bh10_$c090",
											"bh10_$c091", "bh10_$c092", "bh10_$c093", "bh10_$c094",
											"bh10_$c095", "bh10_$c096", "bh10_$c097", "bh10_$c098",
											"bh10_$c099", "bh10_$c100"}

	FLOOR_5_01 =					"bh10_$c101"
	FLOOR_5_02 =					"bh10_$c102"
	FLOOR_5_03 =					"bh10_$c103"
	FLOOR_5_04 =					"bh10_$c104"
	FLOOR_5_05 =					"bh10_$c105"

	FLOOR_3_1A =					"bh10_$c071"
	FLOOR_3_1B =					"bh10_$c072"
	FLOOR_3_2A =					"bh10_$c076"
	FLOOR_3_2B =					"bh10_$c079"

	-- Cutscenes --
	CUTSCENE_IN =						"br10-1.bik"
	CUTSCENE_OUT =						"br10-2.bik"

	-- Voice --
	VOICE_15_KILLS =					"PLAYER_BR10_15_KILLS"
	VOICE_12_KILLS =					"PLAYER_BR10_12_KILLS"
	VOICE_9_KILLS =					"PLAYER_BR10_9_KILLS"
	VOICE_6_KILLS =					"PLAYER_BR10_6_KILLS"
	VOICE_3_KILLS =					"PLAYER_BR10_3_KILLS"

	-- Mesh Movers --

		-- Doors that should be locked until the player is sent into the warehouse
		MM_STAIRWELL_DOOR_1 = "bh10_$MMdoor_stairwell_1"
		MM_STAIRWELL_DOOR_2 = "bh10_$MMdoor_stairwell_2"

		-- Door to roof
		MM_ROOF_DOOR =			"bh10_MMroof_door"

		-- Doors associated with exploit areas
		MM_EXPLOIT_DOOR_1 =	"bh10_MMexploit_door_1"
		MM_EXPLOIT_DOOR_2 =	"bh10_MMexploit_door_2"
		MM_EXPLOIT_DOOR_3 =	"bh10_MMexploit_door_3"

		-- Doors that should be hidden when the player gains access to the warehouse
		MM_HIDDEN_DOOR_1 = "bh10_$MMdoor_to_hide_3"
		MM_HIDDEN_DOOR_2 = "bh10_$MMdoor_to_hide_4a"
		MM_HIDDEN_DOOR_3 = "bh10_$MMdoor_to_hide_4b" 
		MM_HIDDEN_DOOR_4 = "bh10_$MMdoor_to_hide_5a"
		MM_HIDDEN_DOOR_5 = "bh10_$MMdoor_to_hide_5b"

		-- List of all doors to hide. A couple doors have movers but aren't in this list. 
		-- That's because I couldnt' remember for sure which doors Bryan asked me to hide.
		-- I put movers on some extras just in case.
		MM_DOORS_TO_HIDE = {MM_HIDDEN_DOOR_1, MM_HIDDEN_DOOR_2, MM_HIDDEN_DOOR_5}


	-- Other --
	CAR_NUM =					1
	INITIAL_LIEUTENANTS =  sizeof_table(TABLE_STANDARD_LIEUTENANTS) + sizeof_table(TABLE_ROCKET_LIEUTENANTS)
	Num_lieutenants_left = sizeof_table(TABLE_STANDARD_LIEUTENANTS) + sizeof_table(TABLE_ROCKET_LIEUTENANTS)
	Saints_max_distance = 70
	Min_saints_assisting =	2
	Thrown_weapon =			"satchel"
	IN_COOP = false
	THREAD_NOTORIETY =	  -1
	THREAD_LIEUTENANTS =	  -1
	THREAD_ROOF =			  -1
	THREAD_CLOSEST_NAV =   -1
	THREAD_SAINTS_BACKUP = -1

	BH10_BROTHERHOOD_ATTACK_PERSONAS = {
		["HM_Bro1"]	=	"HMBRO1",
		["HM_Bro2"]	=	"HMBRO2",
		["HM_Bro3"]	=	"HMBRO3",

		["HF_Bro2"]	=	"HFBRO2",

		["WM_Bro3"]	=	"WMBRO3",

		["WF_Bro1"]	=	"WFBRO1",
		["WF_Bro2"]	=	"WFBRO2",
	}

	BH10_SAINTS_ATTACK_PERSONAS = {
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

	OTHER_PLAYER = {[LOCAL_PLAYER] = REMOTE_PLAYER, [REMOTE_PLAYER] = LOCAL_PLAYER}

function bh10_start(bh10_checkpoint, is_restart)

	if (bh10_checkpoint == MISSION_START_CHECKPOINT) then

		local start_groups = {GROUP_PLAYER_HOMIES, GROUP_COURTESY_CAR, GROUP_COURTESY_CAR_COOP}

		if (is_restart) then

			for i,group in pairs(start_groups) do
				group_create(group, true)
			end

			teleport_coop(NAV_PLAYER_START, NAV_REMOTE_START)

		else
			cutscene_play("br10-01", start_groups, {NAV_PLAYER_START, NAV_REMOTE_START}, false)
			for i,group in pairs(start_groups) do
				group_show(group)
			end
		end

	end

	bh10_initialize(bh10_checkpoint)

	if(DEBUG_ENTER_WAREHOUSE) then
		bh10_enter_warehouse()
		while(true) do
			thread_yield()
		end
	end

	if bh10_checkpoint == MISSION_START_CHECKPOINT then
		if(DEBUG_MAERO_FIGHT) then
			bh10_kill_maero(true)
			while(true) do
				thread_yield()
			end
		else
			bh10_drive_to_staging_area()
		end
	elseif bh10_checkpoint == CHECKPOINT_STAGING then

		THREAD_NOTORIETY = thread_new("bh10_raise_tribal_notoriety")
		THREAD_LIEUTENANTS = thread_new("bh10_get_to_tribal_hq")
	elseif bh10_checkpoint == CHECKPOINT_WAREHOUSE then
		bh10_enter_warehouse()
	elseif bh10_checkpoint == CHECKPOINT_MAERO then
		bh10_kill_maero(false)
	end

end

function bh10_initialize(checkpoint)

	mission_start_fade_out(0.0)

	-- A few Global constants need to be set up, but shouldn't be changed after this function
	-- rn02_setup_global_constants()

	bh10_initialize_common()

	bh10_initialize_checkpoint(checkpoint)

	mission_start_fade_in()

end

-- Initialization code shared by all checkpoints.
function bh10_initialize_common()

	-- Start trigger is hit...the activate button was hit
	set_mission_author("Phillip Alexander and Aaron Hanson")

	if coop_is_active() then
		IN_COOP = true
		Maero_initial_health = Maero_initial_health * Maero_initial_health_coop_multiplier
		MAX_BH_NOTORIETY = MAX_BH_NOTORIETY_COOP
	end

	if coop_is_active() then
		IN_COOP = true
	end

	bh10_start_persona_overrides()

end

-- Initialization code specific to the checkpoint.
function bh10_initialize_checkpoint(checkpoint)

	if ( (checkpoint == MISSION_START_CHECKPOINT) or (checkpoint == CHECKPOINT_STAGING) ) then
		bh10_lock_warehouse_doors(true)
	else
		bh10_lock_warehouse_doors(false)
		bh10_hide_warehouse_doors()
	end

	if (checkpoint == MISSION_START_CHECKPOINT) then
		
		if IN_COOP then
			party_add(TABLE_PLAYER_HOMIES[2], REMOTE_PLAYER)
		else
			if (not DEBUG_MAERO_FIGHT) then
				party_add(TABLE_PLAYER_HOMIES[2], LOCAL_PLAYER)
			end
		end
		if ( (not DEBUG_MAERO_FIGHT) and (not DEBUG_ENTER_WAREHOUSE) ) then
			party_add(TABLE_PLAYER_HOMIES[1], LOCAL_PLAYER)
		end

		-- Teleport players to start locations --
		if (DEBUG_ENTER_WAREHOUSE) then
			teleport_coop("bh10_$waypoint_2", "bh10_$waypoint_2")
		end

		notoriety_set("Brotherhood", 0)
		notoriety_force_no_spawn("Brotherhood", false)

	elseif ( checkpoint == CHECKPOINT_STAGING )then

		bh10_create_saints_and_los_dummies()

		notoriety_set("Brotherhood", MAX_BH_NOTORIETY)
		notoriety_force_no_spawn("Brotherhood", false)

		on_trigger("",TRIGGER_TRIBAL_STAGING)
		trigger_enable(TRIGGER_TRIBAL_STAGING,false)
		marker_remove_trigger(TRIGGER_TRIBAL_STAGING, SYNC_ALL)
		mission_waypoint_remove(SYNC_ALL)

	elseif ( checkpoint == CHECKPOINT_WAREHOUSE ) then

		notoriety_set_max("Brotherhood", MAX_BH_NOTORIETY)
		notoriety_set("Brotherhood", MAX_BH_NOTORIETY)
		notoriety_set_min("Brotherhood", MAX_BH_NOTORIETY)

	elseif (checkpoint == CHECKPOINT_MAERO) then
		-- Normally Maero is created by the cutscene. We're skipping that so create him here.
		group_create(GROUP_MAERO, true)
		door_open(MM_ROOF_DOOR)
		door_open(MM_EXPLOIT_DOOR_1)
		door_open(MM_EXPLOIT_DOOR_2)
		door_open(MM_EXPLOIT_DOOR_3)
		bh10_setup_maero()
		inv_item_equip("minigun", CHAR_MAERO)
		bh10_exploits()
		--thread_new("bh10_no_crouch")
		thread_new("bh10_maero_ai")
	end

end

function bh10_create_saints_and_los_dummies()

	group_create(GROUP_SAINTS[1], true)

	for i, group in pairs(GROUP_LOS_DUMMIES) do
		group_create(group, true)
	end

	for i, npc in pairs(LOS_DUMMIES) do
		on_death("bh10_respawn_los_dummy", npc)
		set_ignore_ai_flag(npc, true)
		inv_item_remove_all(npc)
		npc_combat_enable(npc, false)
		npc_weapon_pickup_override(npc, false)
	end

	for i, npc in pairs(EXTRA_SAINTS[CAR_NUM]) do
		npc_combat_enable(npc, false)
		if i > 1 then
			vehicle_enter_teleport(npc, SAINTS_CAR[CAR_NUM][1], i-1)
		end
	end

end

-- Lock or unlock the stairwell doors that give access to the warehouse
function bh10_lock_warehouse_doors(lock)
	door_lock(MM_STAIRWELL_DOOR_1, lock)
	door_lock(MM_STAIRWELL_DOOR_2, lock)
	door_lock(MM_ROOF_DOOR, lock)
end

-- Hide a subset of the warehouse's doors
function bh10_hide_warehouse_doors()
	for i,door in pairs(MM_DOORS_TO_HIDE) do
		mesh_mover_hide(door)
	end
end

function bh10_start_persona_overrides()
	persona_override_group_start(BH10_BROTHERHOOD_ATTACK_PERSONAS, POT_SITUATIONS[POT_ATTACK], "BR10_ATTACK")
	persona_override_group_start(BH10_SAINTS_ATTACK_PERSONAS, POT_SITUATIONS[POT_ATTACK], "BR10_ATTACK")
end

function bh10_stop_persona_overrides()
	persona_override_group_stop(BROTHERHOOD_PERSONAS, POT_SITUATIONS[POT_ATTACK])
	persona_override_group_stop(SAINTS_PERSONAS, POT_SITUATIONS[POT_ATTACK])
end

function bh10_respawn_los_dummy(npc)
	local group = ""
	for i = 1, 3 do
		if npc==LOS_DUMMIES[i] then
			group = GROUP_LOS_DUMMIES[i]
			i = 4
		end
	end
	delay(3)
	release_to_world(group)
	group_create(group)
	on_death("bh10_respawn_los_dummy", npc)
	set_ignore_ai_flag(npc, true)
	inv_item_remove_all(npc)
	npc_combat_enable(npc, false)
	npc_weapon_pickup_override(npc, false)
end

function bh10_drive_to_staging_area()

	thread_new("bh10_create_saints_and_los_dummies")

	delay(2)
	mission_help_table("bh10_drive_to_staging_area")
	THREAD_NOTORIETY = thread_new("bh10_raise_tribal_notoriety")

	trigger_enable(TRIGGER_TRIBAL_STAGING, true)
	marker_add_trigger(TRIGGER_TRIBAL_STAGING, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION, SYNC_ALL)
	on_trigger("bh10_tribal_staging_reached", TRIGGER_TRIBAL_STAGING)
	mission_waypoint_add(TRIGGER_TRIBAL_STAGING)

end

function bh10_tribal_staging_reached()
	on_trigger("",TRIGGER_TRIBAL_STAGING)
	trigger_enable(TRIGGER_TRIBAL_STAGING,false)
	marker_remove_trigger(TRIGGER_TRIBAL_STAGING, SYNC_ALL)
	mission_waypoint_remove(SYNC_ALL)

	THREAD_LIEUTENANTS = thread_new("bh10_get_to_tribal_hq")
end

function bh10_num_saints_assisting()
	local Num_saints = 0
	for i, npc in pairs(EXTRA_SAINTS[CAR_NUM]) do
		if not character_is_dead(npc) and (get_dist_char_to_char(LOCAL_PLAYER, npc) < Saints_max_distance or character_is_in_vehicle(npc)) then
			Num_saints = Num_saints + 1
		end
	end
	return Num_saints
end

function bh10_initial_backup_run()
	vehicle_enter(EXTRA_SAINTS[CAR_NUM][1], SAINTS_CAR[CAR_NUM][1], 0)

	for i, npc in pairs(EXTRA_SAINTS[CAR_NUM]) do
		npc_combat_enable(npc, true)
	end

	vehicle_pathfind_to(SAINTS_CAR[CAR_NUM][1], NAV_SAINTS_INITIAL_ENTRY, true, true)
	force_fire_target(CHAR_FIRST_ROCKETEER, CHAR_FIRST_ROCKETEE, false)

	for i, npc in pairs(EXTRA_SAINTS[CAR_NUM]) do
		if not character_is_dead(npc) and character_is_in_vehicle(npc) then 
			thread_new("vehicle_exit", npc)
		end
	end
end

function bh10_select_backup_car()
	local Car_found = false
	local i = 0
	while not Car_found do
		thread_yield()
		i = rand_int(2,4)
		if not character_is_dead(LOS_DUMMIES[i-1]) and not los_check(LOCAL_PLAYER, LOS_DUMMIES[i-1]) and get_dist_char_to_nav(LOCAL_PLAYER, LOS_DUMMIES[i-1]) > 75 then
			CAR_NUM = i
			Car_found = true
		end
	end
end

function bh10_saints_backup()
	bh10_initial_backup_run()
	delay(5)

	while bh10_num_saints_assisting() >= Min_saints_assisting do
		thread_yield()
	end

	while(1) do
		thread_yield()
		release_to_world(GROUP_SAINTS[CAR_NUM])

		--determine next car to send
		bh10_select_backup_car()		

		group_create(GROUP_SAINTS[CAR_NUM], true)

		if CAR_NUM == 4 then
			for i, car in pairs(SAINTS_CAR[CAR_NUM]) do
				vehicle_repair(car, 1.0)
				--teleport_vehicle(car, NAV_BIKE_START[i])
				vehicle_enter_teleport(EXTRA_SAINTS[CAR_NUM][i], car, 0)
				npc_combat_enable(EXTRA_SAINTS[CAR_NUM][i], true)
				thread_new("bh10_backup_chase", car, LOCAL_PLAYER, true, false, true, true)
			end
		else
			vehicle_repair(SAINTS_CAR[CAR_NUM][1], 1.0)
			for i, npc in pairs(EXTRA_SAINTS[CAR_NUM]) do
				vehicle_enter_teleport(npc, SAINTS_CAR[CAR_NUM][1], i-1)
				npc_combat_enable(npc, true)
			end
			thread_new("bh10_backup_chase", SAINTS_CAR[CAR_NUM][1], LOCAL_PLAYER, true, false, true, true)
		end

		while bh10_num_saints_assisting() >= Min_saints_assisting do
			thread_yield()
		end
	end
end

function bh10_backup_chase(car, target, b1, b2, b3, b4)
	vehicle_chase(car, target, b1, b2, b3, b4)
end


function bh10_get_to_tribal_hq()
	mission_set_checkpoint(CHECKPOINT_STAGING)
	delay(1)
	group_create(GROUP_STANDARD_LIEUTENANTS, true)
	group_create(GROUP_ROCKET_LIEUTENANTS, true)

	THREAD_SAINTS_BACKUP = thread_new("bh10_saints_backup")

	for i, npc in pairs(TABLE_STANDARD_LIEUTENANTS) do
		npc_combat_enable(npc,true)
		npc_unholster_best_weapon(npc)
		npc_leash_to_nav(npc, npc, 5)
		marker_add_npc(npc, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL)
		on_death("bh10_lieutenant_killed", npc)
	end
	for i, npc in pairs(TABLE_ROCKET_LIEUTENANTS) do
		npc_combat_enable(npc,true)
		inv_item_add("rpg_launcher",1,npc)
		inv_item_equip("rpg_launcher",npc)
		npc_leash_to_nav(npc, npc, 5)
		marker_add_npc(npc, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL)
		on_death("bh10_lieutenant_killed", npc)
	end

	mission_help_table("bh10_kill_tribal_lieutenants")

	while Num_lieutenants_left > 0 do
		thread_yield()
		objective_text(0, "bh10_lieutenants_killed", (INITIAL_LIEUTENANTS - Num_lieutenants_left), INITIAL_LIEUTENANTS)
	end

	thread_kill(THREAD_SAINTS_BACKUP)
	objective_text(0, "bh10_lieutenants_killed", (INITIAL_LIEUTENANTS - Num_lieutenants_left), INITIAL_LIEUTENANTS)

	bh10_enter_warehouse()
end

function bh10_lieutenant_killed(character)
	Num_lieutenants_left = Num_lieutenants_left - 1
	marker_remove_npc(character, SYNC_ALL)
	on_death("", character)
	if (Num_lieutenants_left == 0) then
		delay(1)
		audio_play_for_character(VOICE_15_KILLS, LOCAL_PLAYER, "voice")
	elseif (Num_lieutenants_left == 2) then
		delay(1)
		audio_play_for_character(VOICE_12_KILLS, LOCAL_PLAYER, "voice")
	elseif (Num_lieutenants_left == 4) then
		delay(1)
		audio_play_for_character(VOICE_9_KILLS, LOCAL_PLAYER, "voice")
	elseif (Num_lieutenants_left == 6) then
		delay(1)
		audio_play_for_character(VOICE_6_KILLS, LOCAL_PLAYER, "voice")
	elseif (Num_lieutenants_left == 8) then
		delay(1)
		audio_play_for_character(VOICE_3_KILLS, LOCAL_PLAYER, "voice")
	end
end

function bh10_enter_warehouse()

	bh10_lock_warehouse_doors(false)
	bh10_hide_warehouse_doors()

	mission_set_checkpoint(CHECKPOINT_WAREHOUSE)
	notoriety_force_no_spawn("Brotherhood", true)
	delay(2)
	objective_text_clear(0)
	mission_help_table("bh10_get_into_warehouse")

	THREAD_ROOF = thread_new("bh10_get_to_warehouse_roof")

end

function bh10_get_to_warehouse_roof()
	-- group_create(GROUP_WAREHOUSE_SOLDIERS, true)

	trigger_enable(TRIGGER_WH_GROUP_01, true)
	on_trigger("bh10_warehouse_group_one", TRIGGER_WH_GROUP_01)
	trigger_enable(TRIGGER_WH_GROUP_02, true)
	on_trigger("bh10_warehouse_group_two", TRIGGER_WH_GROUP_02)
	trigger_enable(TRIGGER_WH_GROUP_03, true)
	on_trigger("bh10_warehouse_group_three", TRIGGER_WH_GROUP_03)
	trigger_enable(TRIGGER_WH_GROUP_04, true)
	on_trigger("bh10_warehouse_group_four", TRIGGER_WH_GROUP_04)
	trigger_enable(TRIGGER_WH_GROUP_05, true)
	on_trigger("bh10_warehouse_group_five", TRIGGER_WH_GROUP_05)

	-- group_create(GROUP_WAREHOUSE_FLOOR_1, true)
	-- group_create(GROUP_WAREHOUSE_FLOOR_2, true)
	-- group_create(GROUP_WAREHOUSE_FLOOR_3, true)
	-- group_create(GROUP_WAREHOUSE_FLOOR_4, true)

	delay(2)

	for i, waypoint in pairs(NAV_WAREHOUSE_WAYPOINTS) do
		thread_yield()
		marker_add_navpoint(waypoint, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)
		while ((get_dist_char_to_nav(LOCAL_PLAYER, waypoint) > 5) and ((not IN_COOP) or get_dist_char_to_nav(REMOTE_PLAYER, waypoint) > 5)) do
			thread_yield()
		end
		if (i==1) then
			mission_help_table("bh10_get_to_warehouse_roof")
		end
		marker_remove_navpoint(waypoint, SYNC_ALL)
	end

	trigger_enable(TRIGGER_WAREHOUSE_ROOF, true)
	marker_add_trigger(TRIGGER_WAREHOUSE_ROOF, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)
	on_trigger("bh10_warehouse_roof_reached", TRIGGER_WAREHOUSE_ROOF)
	mission_waypoint_add(TRIGGER_WAREHOUSE_ROOF)
end

function bh10_warehouse_group_one()
	group_create(GROUP_WAREHOUSE_FLOOR_1, true)
end

function bh10_warehouse_group_two()
	group_create(GROUP_WAREHOUSE_FLOOR_2, true)
end

function bh10_warehouse_group_three()
	group_create(GROUP_WAREHOUSE_FLOOR_3, true)
	delay(1)
	attack(FLOOR_3_1A, FLOOR_3_2A, true)
	attack(FLOOR_3_1B, FLOOR_3_2B, true)
end

function bh10_warehouse_group_four()
	group_create(GROUP_WAREHOUSE_FLOOR_4, true)
end

function bh10_warehouse_group_five()
	group_create(GROUP_WAREHOUSE_FLOOR_5, true)
	attack(FLOOR_5_01, LOCAL_PLAYER, true)
	attack(FLOOR_5_02, LOCAL_PLAYER, true)		
	attack(FLOOR_5_03, LOCAL_PLAYER, true)	
	attack(FLOOR_5_04, LOCAL_PLAYER, true)
	attack(FLOOR_5_05, LOCAL_PLAYER, true)
end

function bh10_warehouse_roof_reached()
	on_trigger("",TRIGGER_WAREHOUSE_ROOF)
	trigger_enable(TRIGGER_WAREHOUSE_ROOF,false)
	marker_remove_trigger(TRIGGER_WAREHOUSE_ROOF, SYNC_ALL)
	mission_waypoint_remove(SYNC_ALL)

	bh10_kill_maero(true)
end

In_high_ground = {[LOCAL_PLAYER] = true, [REMOTE_PLAYER] = true}
In_low_ground = {[LOCAL_PLAYER] = false, [REMOTE_PLAYER] = false}
Hiding = {[LOCAL_PLAYER] = false, [REMOTE_PLAYER] = false}

function bh10_high_ground_entered(triggerer, trigger)
	In_high_ground[triggerer] = true
end

function bh10_high_ground_exited(triggerer, trigger)
	In_high_ground[triggerer] = false
end

function bh10_low_ground_entered(triggerer, trigger)
	In_low_ground[triggerer] = true
end

function bh10_low_ground_exited(triggerer, trigger)
	In_low_ground[triggerer] = false
end

function bh10_hiding_entered(triggerer, trigger)
	Hiding[triggerer] = true
end

function bh10_hiding_exited(triggerer, trigger)
	Hiding[triggerer] = false
end

function bh10_kill_maero(play_cutscene)

	-- Setup Maero's Script AI Triggers
		trigger_enable(TRIGGER_HIGH_GROUND, true)
		on_trigger("bh10_high_ground_entered",TRIGGER_HIGH_GROUND)
		on_trigger_exit("bh10_high_ground_exited",TRIGGER_HIGH_GROUND)
		trigger_set_delay_between_activations(TRIGGER_HIGH_GROUND,0)

		trigger_enable(TRIGGER_LOW_GROUND, true)
		on_trigger("bh10_low_ground_entered",TRIGGER_LOW_GROUND)
		on_trigger_exit("bh10_low_ground_exited",TRIGGER_LOW_GROUND)
		trigger_set_delay_between_activations(TRIGGER_LOW_GROUND,0)

		trigger_enable(TRIGGER_HIDING, true)
		on_trigger("bh10_hiding_entered",TRIGGER_HIDING)
		on_trigger_exit("bh10_hiding_exited",TRIGGER_HIDING)
		trigger_set_delay_between_activations(TRIGGER_HIDING,0)

	-- Add damage callbacks for players
		on_take_damage("bh10_player_damaged", LOCAL_PLAYER)
		turn_invulnerable(LOCAL_PLAYER)
		if (IN_COOP) then
			on_take_damage("bh10_player_damaged", REMOTE_PLAYER)
			turn_invulnerable(REMOTE_PLAYER)
		end

	-- Play the cutscene
	if(play_cutscene) then
		fade_out(0.0,{0,0,0}, SYNC_ALL)

		-- Disable player controls
		player_controls_disable(LOCAL_PLAYER)
		if (IN_COOP) then
			player_controls_disable(REMOTE_PLAYER)
		end

		group_destroy(GROUP_WAREHOUSE_FLOOR_1)
		group_destroy(GROUP_WAREHOUSE_FLOOR_2)
		group_destroy(GROUP_WAREHOUSE_FLOOR_3)
		group_destroy(GROUP_WAREHOUSE_FLOOR_4)
		group_destroy(GROUP_WAREHOUSE_FLOOR_5)

		-- Eliminate everyone in the existing party. Turn off ped. spawnin and repopulate the world
		-- to eliminate any followers that you brought along.
		party_dismiss_all()
		party_set_recruitable(false)
		group_destroy(GROUP_PLAYER_HOMIES)
		spawning_pedestrians(false, true)

		cutscene_play("IG_bh10_scene1", nil, nil, false)

		-- Destroy the cutscene version of Maero and create a new one
		group_destroy(GROUP_MAERO)
		group_create(GROUP_MAERO, true)

		bh10_setup_maero()

		door_open(MM_ROOF_DOOR)
		door_open(MM_EXPLOIT_DOOR_1)
		door_open(MM_EXPLOIT_DOOR_2)
		door_open(MM_EXPLOIT_DOOR_3)

		-- Teleport players to the start of the fight
		teleport_coop(NAV_PLAYER_START_MAERO, NAV_REMOTE_START_MAERO)
		fade_in(1.0, SYNC_ALL)

		mission_set_checkpoint(CHECKPOINT_MAERO)

		-- Reenable player controls
		player_controls_enable(LOCAL_PLAYER)
		if (IN_COOP) then
			player_controls_enable(REMOTE_PLAYER)
		end

		bh10_exploits()
		--thread_new("bh10_no_crouch")
		thread_new("bh10_maero_ai")

	end

	delay(1.0)

	mission_help_table("bh11_kill_maero")

end

function bh10_player_damaged(player, attacker, damage_percent)

	local old_hit_points = get_current_hit_points(player)
	local new_hit_points = damage_percent * get_max_hit_points(player)
	local damage = old_hit_points - new_hit_points	

	if (attacker == CHAR_MAERO) then
		damage = damage * Maero_damage_multiplier
	end

	if (damage < 1) then
		damage = 1
	end

	character_damage( player,damage )
	
end

function bh10_setup_maero()

	group_create(GROUP_GRENADES)

	-- Setup Maero
	character_allow_ragdoll(CHAR_MAERO, false)
	set_never_crouch_flag(CHAR_MAERO, true)
	character_prevent_explosion_fling(CHAR_MAERO, true)
	character_prevent_flinching(CHAR_MAERO, true)
	set_max_hit_points(CHAR_MAERO, Maero_initial_health)
	set_current_hit_points(CHAR_MAERO, Maero_initial_health)

	-- Set always-on flags
	character_set_cannot_be_grabbed(CHAR_MAERO, true)
	set_perfect_aim(CHAR_MAERO, true)
	set_ignore_burst_accuracy_flag(CHAR_MAERO, true)
	set_trailing_aim_flag(CHAR_MAERO, true)

	-- Handle Maero taking damage in script
	turn_invulnerable(CHAR_MAERO, false) 
	on_take_damage("bh10_maero_damaged",CHAR_MAERO)

	-- Setup Maero w/ some weapons
	inv_item_add("minigun", 1, CHAR_MAERO)
	inv_item_add(Thrown_weapon, 1, CHAR_MAERO)

	on_death("bh10_mission_complete", CHAR_MAERO)	

	damage_indicator_on(0,CHAR_MAERO,0.0, "bh11_maeros_health")
end

function bh10_mission_complete()
	turn_invulnerable(LOCAL_PLAYER, false)
	if (IN_COOP) then
		turn_invulnerable(REMOTE_PLAYER, false)
	end
	mission_end_success("bh10", "br10-02")
end

Should_check_exploits	= {[LOCAL_PLAYER] = false, [REMOTE_PLAYER] = false}
In_exploit_area = {[LOCAL_PLAYER] = {}, [REMOTE_PLAYER] = {}}
In_spawn_area = {[LOCAL_PLAYER] = {}, [REMOTE_PLAYER] = {}}
function bh10_exploits()

	npc_respawn_dist_override(.01)

	-- Turn on general exploit area enter/exit functions
	for i,trigger in pairs(TRIGGER_EXPLOIT_ENTRANCES) do
		trigger_enable(trigger, true)
		on_trigger("bh10_exploit_entered",trigger)
		trigger_set_delay_between_activations(trigger,0)		
	end
	for i,trigger in pairs(TRIGGER_EXPLOIT_EXITS) do
		trigger_enable(trigger, true)
		on_trigger("bh10_exploit_exited",trigger)
		trigger_set_delay_between_activations(trigger,0)		
	end

	-- Turn on specific exploit area triggers
	for i,trigger in pairs(TRIGGER_EXPLOIT_AREAS) do
		trigger_enable(trigger, true)
		In_exploit_area[LOCAL_PLAYER][trigger] = false
		In_exploit_area[REMOTE_PLAYER][trigger] = false
		on_trigger("bh10_exploit_area_entered",trigger)
		on_trigger_exit("bh10_exploit_area_exited",trigger)
		trigger_set_delay_between_activations(trigger,0)		
	end

	-- Turn on spawn-area triggers
	for name,spawn_info in pairs(EXPLOIT_SPAWN_INFO) do
		for i,trigger in pairs(spawn_info["triggers"]) do
			trigger_enable(trigger, true)
			In_spawn_area[LOCAL_PLAYER][trigger] = 0
			In_spawn_area[REMOTE_PLAYER][trigger] = 0
			on_trigger("bh10_spawn_area_entered",trigger)
			on_trigger_exit("bh10_spawn_area_exited",trigger)
			trigger_set_delay_between_activations(trigger,0)
		end
		thread_new("bh10_exploit_spawn_area", name)
	end

	group_create_hidden(GROUP_EXPLOIT_BH)

end

-- Spawn brotherhood for a specific spawn area
Living_exploit_spawns = {}
function bh10_exploit_spawn_area(name)
	
	while( not group_is_loaded(GROUP_EXPLOIT_BH) ) do
		thread_yield()
	end

	local triggers = EXPLOIT_SPAWN_INFO[name]["triggers"]

	local max_spawns = EXPLOIT_SPAWN_INFO[name]["max_npcs"]
	if (IN_COOP) then
		max_spawns = EXPLOIT_SPAWN_INFO[name]["max_npcs_coop"]
	end
	Living_exploit_spawns[name] = 0
	local next_spawn_size = max_spawns

	while(true) do
		thread_yield()
	
		-- Maybe check if we should spawn more Brotherhood at this location
		if (Should_check_exploits[LOCAL_PLAYER] or IN_COOP) then

			-- Is the player in an associated exploit area?
			local is_exploiting = false
			for i, exploit in pairs(EXPLOIT_SPAWN_INFO[name]["exploit_areas"]) do
				if(In_exploit_area[LOCAL_PLAYER][exploit] or In_exploit_area[REMOTE_PLAYER][exploit]) then
					is_exploiting = true
					break
				end
			end

			-- If an associated exploit is being used or we're in COOP, then maybe spawn more attackers
			if(is_exploiting or IN_COOP) then

				local space_available = (next_spawn_size + Living_exploit_spawns[name] <= max_spawns)
				local no_popping = true
				for i,trigger in pairs(triggers) do
					if ( (In_spawn_area[LOCAL_PLAYER][trigger] > 0) or (In_spawn_area[REMOTE_PLAYER][trigger] > 0)) then
						no_popping = false
					end
				end
				
				-- If all preconditions are met, then send the wave
				if(space_available and no_popping) then

					local num_spawned = bh10_send_wave(next_spawn_size, name)
					Living_exploit_spawns[name] = Living_exploit_spawns[name] + num_spawned

					next_spawn_size = rand_int(1,max_spawns - 1)

					-- Wait a bit before spawning any more attackers
					delay(rand_int(3,6))

				end
			end
		end

	end
end

Exploit_spawn_origins = {}

-- Send a wave of brotherhood to attack the players
--
-- wave_size: number of attackers to send
--
-- returns number of attackers successfully spawned
function bh10_send_wave(wave_size, spawn_name)

	local num_spawned = 0
	local num_attack_points = sizeof_table(EXPLOIT_SPAWN_INFO[spawn_name]["attack points"])

	-- For each npc to be spawned
	for i=1, wave_size, 1 do

		-- Get an npc to spawn and a safe spawning location. 
		local npc = bh10_get_spawnable_exploit_bh()
		local spawn_navpoint = EXPLOIT_SPAWN_INFO[spawn_name]["spawn points"][i]
		if ( npc == nil ) then
			return num_spawned
		end

		-- We're gonna spawn this guy, do some book keeping.
		num_spawned = num_spawned + 1
		Exploit_spawn_origins[npc] = spawn_name

		-- Teleport to the spawn navpoint
		teleport(npc, spawn_navpoint)

		-- Tell the bh to respawn, override default respawn time
		npc_respawn_after_death(npc, true)
		npc_respawn_after_death_time_override(npc, 250, true)
		on_respawn("bh10_respawn_exploit_bh",npc)

		-- Show the npc and start its patrol
		character_show(npc)
		local attack_point = EXPLOIT_SPAWN_INFO[spawn_name]["attack points"][rand_int(1,num_attack_points)]
		thread_new("bh10_exploit_bh_attack", npc, attack_point)

		-- Delay a little bit, gives time to leave the spawn area and keeps congestion down.
		delay(.2,.5)

	end

	-- Return num of bh spawned
	return num_spawned

end

function bh10_exploit_bh_attack(bh, dest_navp)
	npc_respawn_after_death(bh, true)
	on_respawn("bh10_respawn_exploit_bh",bh)

	local force_complete = false
	local dist, player = get_dist_closest_player_to_object(dest_navp)
	if(dist > 40) then
		force_complete = true
	end

	move_to(bh,dest_navp,2,false, true)
	attack(bh)
end

-- Returns a spawnable bh if one is available, nil else.
function bh10_get_spawnable_exploit_bh()

	for i, bh in pairs(EXPLOIT_BH) do
		if (Exploit_spawn_origins[bh] == nil) then
			return bh
		end
	end

	return nil

end

function bh10_respawn_exploit_bh(bh)

	local spawn_name = Exploit_spawn_origins[bh]

	-- Hide until needed
	character_hide(bh)

	-- Make available for spawning after a brief delay
	delay(.5)
	Exploit_spawn_origins[bh] = nil
	Living_exploit_spawns[spawn_name] = Living_exploit_spawns[spawn_name] - 1
	bh10_debug_text(spawn_name .. " killed, " .. Living_exploit_spawns[spawn_name] - 1 .. " remain", DEBUG_TEXT_EXPLOIT)

end

function bh10_exploit_entered(triggerer, trigger)
	Should_check_exploits[triggerer] = true
end
function bh10_exploit_exited(triggerer, trigger)
	Should_check_exploits[triggerer] = false
end
function bh10_exploit_area_entered(triggerer, trigger)
	In_exploit_area[triggerer][trigger] = true
end
function bh10_exploit_area_exited(triggerer, trigger)
	In_exploit_area[triggerer][trigger] = false
end
function bh10_spawn_area_entered(triggerer, trigger)
	In_spawn_area[triggerer][trigger] = In_spawn_area[triggerer][trigger] + 1
end
function bh10_spawn_area_exited(triggerer, trigger)
	In_spawn_area[triggerer][trigger] = In_spawn_area[triggerer][trigger] - 1
end

function bh10_no_crouch()

	set_never_crouch_flag(CHAR_MAERO, true)

	while(false) do
		if(crouch_is_crouching(CHAR_MAERO)) then
			crouch_stop(CHAR_MAERO, true)
		end
		thread_yield()
	end

end

-- MAERO_AI_MODES
MAERO_AI_NONE =		"MAI_NONE"
MAERO_AI_MINIGUN =	"MAI_MINIGUN"
MAERO_AI_THROWN  =	"MAI_THROWN"
MAERO_AI_HIDING  =	"MAI_HIDING"
MAERO_AI_RECOVER =	"MAI_RECOVER"

Maero_current_ai_mode = MAERO_AI_NONE
Maero_knocked_down = false
Maero_delayed_ai_mode = MAERO_AI_NONE
Maero_delayed_ai_mode_time = 0
Maero_throw_delay = 0

function bh10_maero_ai()

	thread_new("bh10_maero_update_target")

	while(not character_is_dead(CHAR_MAERO)) do

		bh10_maero_ai_enter_mode(bh10_maero_get_ai_mode(), true)		
		bh10_maero_ai_process_mode(Maero_current_ai_mode)

		local frame_time = get_frame_time()
		if (Maero_delayed_ai_mode_time >= 0) then
			Maero_delayed_ai_mode_time = Maero_delayed_ai_mode_time - frame_time
		end

		if (Maero_throw_delay >= 0) then
			Maero_throw_delay = Maero_throw_delay - frame_time
		end

		thread_yield()

	end
end

Bh10_maero_target = LOCAL_PLAYER
function bh10_maero_update_target()

	-- Target never changes in single player. Duh.
	if (not IN_COOP) then
		return
	end

	local delayed_target_update_time = 0

	-- This function checks if a player is exploiting
	--[[
	local function is_exploiting(player)
		if (Should_check_exploits[player]) then
			for i, exploit in pairs(EXPLOIT_SPAWN_INFO[name]["exploit_areas"]) do
				if(In_exploit_area[player][exploit]) then
					return true
				end
			end
		else
			return false
		end
	end
	]]
	while(true) do

		thread_yield()

		if(character_exists(CHAR_MAERO) and (not character_is_dead(CHAR_MAERO))) then

			-- Switch immediately if current target is dead
			if (character_is_dead(Bh10_maero_target)) then
				mission_debug(Bh10_maero_target .. " is dead, switching to " .. OTHER_PLAYER[Bh10_maero_target], DEBUG_TEXT_TARGETS)
				Bh10_maero_target = OTHER_PLAYER[Bh10_maero_target]
			elseif (		Should_check_exploits[Bh10_maero_target] 
							and (not Should_check_exploits[OTHER_PLAYER[Bh10_maero_target]])
							and (not character_is_dead(OTHER_PLAYER[Bh10_maero_target]))
						) then
				-- Accumulate time that target_switching conditions have been met.
				if ( delayed_target_update_time  == 0) then
					bh10_debug_text("Considering switching targets", DEBUG_TEXT_TARGETS)
				end
				delayed_target_update_time = delayed_target_update_time + get_frame_time()
				if (delayed_target_update_time > 3) then
					Bh10_maero_target = OTHER_PLAYER[Bh10_maero_target]
					delayed_target_update_time = 0
					bh10_debug_text("Target switched to " .. Bh10_maero_target, DEBUG_TEXT_TARGETS)
				end
			else
			-- Switch conditions aren't met. Reset the switch countdown
				if (delayed_target_update_time ~= 0) then
					bh10_debug_text("No longer considering switching targets", DEBUG_TEXT_TARGETS)
				end
				delayed_target_update_time = 0
			end

		end
	end

end

function bh10_maero_get_ai_mode()

	if(Maero_knocked_down) then
		return MAERO_AI_RECOVER
	elseif(In_high_ground[Bh10_maero_target]) then
		return MAERO_AI_MINIGUN
	elseif(Hiding[Bh10_maero_target]) then
		return MAERO_AI_HIDING
	elseif(In_low_ground[Bh10_maero_target]) then
		return MAERO_AI_THROWN
	else
		return MAERO_AI_NONE
	end

end

Maero_throw_path_idx = 0
Maero_hide_path_idx = 0
function bh10_maero_ai_enter_mode(mode, delayed)

	-- If this is a delayed change & not enough time has passed, don't change modes.
	if ( delayed and (mode == Maero_delayed_ai_mode) and (Maero_delayed_ai_mode_time >= 0)) then
		return
	end

	-- A new delayed change has been requested, reset the timer and don't change modes
	if ( delayed and (mode ~= Maero_delayed_ai_mode) ) then
		Maero_delayed_ai_mode = mode
		Maero_delayed_ai_mode_time = 3
		return
	end

	-- Either Maero's AI will be changed or a request has been made to put him in his current
	-- AI mode. In either case, we can reset the delayed AI changes.
	Maero_delayed_ai_mode = MAERO_AI_NONE
	Maero_delayed_ai_mode_time = 0

	-- Already in this mode, nothing to see here.
	if (mode == Maero_current_ai_mode) then
		return
	end

	bh10_debug_text("Entering AI Mode " .. mode, DEBUG_TEXT_MAERO_AI)

	bh10_maero_ai_exit_mode(Maero_current_ai_mode)
	Maero_current_ai_mode = mode

	if (mode == MAERO_AI_NONE) then
		return

	elseif (mode == MAERO_AI_MINIGUN) then
		inv_item_add("minigun", 1, CHAR_MAERO)
		inv_item_equip("minigun", CHAR_MAERO)

	elseif (mode == MAERO_AI_THROWN) then
		inv_item_remove_all(CHAR_MAERO)
		inv_item_add(Thrown_weapon, 1, CHAR_MAERO)
		inv_item_equip(Thrown_weapon, CHAR_MAERO)
		Maero_throw_path_idx = move_to_do(CHAR_MAERO, "bh10_$n027", 2, true, true, false, 0)
		
	elseif (mode == MAERO_AI_RECOVER) then
		set_ignore_ai_flag( CHAR_MAERO, true )
		inv_item_add("minigun", 1, CHAR_MAERO)
		inv_item_equip("minigun", CHAR_MAERO)
		action_play_non_blocking(CHAR_MAERO, "minigun fallover", nil, nil, true )

	elseif (mode == MAERO_AI_HIDING) then
		inv_item_remove_all(CHAR_MAERO)
		inv_item_add(Thrown_weapon, 1, CHAR_MAERO)
		inv_item_equip(Thrown_weapon, CHAR_MAERO)
		Maero_hide_path_idx = move_to_do(CHAR_MAERO, "bh10_$n027", 2, true, true, false, 0)
	end

end

function bh10_maero_ai_exit_mode(mode)

	bh10_debug_text("bh10_maero_ai_exit_mode(" .. mode .. ")" , DEBUG_TEXT_MAERO_AI)

	bh10_maero_detonate_satchels()

	if (mode == MAERO_AI_NONE) then
	elseif (mode == MAERO_AI_MINIGUN) then
	elseif (mode == MAERO_AI_THROWN) then
	elseif (mode == MAERO_AI_HIDING) then
	elseif (mode == MAERO_AI_RECOVER) then
		inv_item_add("minigun", 1, CHAR_MAERO)
		inv_item_add(Thrown_weapon, 1, CHAR_MAERO)
		set_ignore_ai_flag( CHAR_MAERO, false)
		npc_combat_enable(CHAR_MAERO, true)
	end

end

Satchels_thrown = 0
function bh10_maero_ai_process_mode(mode)

	if (mode == MAERO_AI_NONE) then
		return
	elseif (mode == MAERO_AI_MINIGUN) then

		if (force_ai_mode_check_done(CHAR_MAERO)) then
			force_fire_target_do(CHAR_MAERO, Bh10_maero_target, false)
		end

	elseif (mode == MAERO_AI_THROWN) then

		if (Maero_throw_path_idx ~= 0) then
			if not (move_to_check_done(Maero_throw_path_idx, CHAR_MAERO, "bh10_$n027", 2, true, true, false, 0)) then
				return
			end
			-- Reorient to face the same direction as the destination navpoint
			--turn_to(CHAR_MAERO, "bh10_$n027", true)
		end
		Maero_throw_path_idx = 0

		if (force_ai_mode_check_done(CHAR_MAERO)) then
			force_throw_char_do(CHAR_MAERO, Bh10_maero_target)
			Satchels_thrown = Satchels_thrown + 1
			Maero_throw_delay = 0.5
			bh10_debug_text("Satchels thrown = " .. Satchels_thrown, DEBUG_TEXT_SATCHELS)
		end

	elseif (mode == MAERO_AI_RECOVER) then
		if (action_play_is_finished(CHAR_MAERO, .70)) then
			Maero_knocked_down = false
		end

	elseif (mode == MAERO_AI_HIDING) then

		if (Maero_hide_path_idx ~= 0) then
			if not (move_to_check_done(Maero_hide_path_idx, CHAR_MAERO, "bh10_$n027", 2, true, true, false, 0)) then
				return
			end
		end
		Maero_hide_path_idx = 0

		if (force_ai_mode_check_done(CHAR_MAERO)) then
			bh10_maero_attack_hiding_player(Bh10_maero_target)
			Satchels_thrown = Satchels_thrown + 1
			Maero_throw_delay = 0.5
			bh10_debug_text("Satchels thrown = " .. Satchels_thrown, DEBUG_TEXT_SATCHELS)
		end

	end

	if (Satchels_thrown >= 3) then
		bh10_maero_detonate_satchels()
	end

end

function bh10_maero_detonate_satchels()

	if(Thrown_weapon == "satchel" and Satchels_thrown > 0) then

		bh10_debug_text("Entering bh10_maero_detonate_satchels", DEBUG_TEXT_SATCHELS)

		while( not force_ai_mode_check_done(CHAR_MAERO) ) do
			thread_yield()
		end

		set_ignore_ai_flag( CHAR_MAERO, true)

		if (Maero_throw_delay > 0) then
			delay(Maero_throw_delay)
		end
		for i=1, Satchels_thrown, 1 do
			inv_item_equip(Thrown_weapon, CHAR_MAERO)
			force_fire_pull_alt_trigger(CHAR_MAERO)
			delay(0.5)
		end

		set_ignore_ai_flag( CHAR_MAERO, false)

	end

	Satchels_thrown = 0
	Maero_throw_delay = 0
end

function bh10_maero_attack_hiding_player(player)

	local target_noise = 0.2
	local speed_noise = 0.1
	local angle_noise = 0.1

	local grenade_targets = {	"bh10_$n011", "bh10_$n012", "bh10_$n013", "bh10_$n014", "bh10_$n015",
										"bh10_$n016", "bh10_$n017", "bh10_$n018", "bh10_$n019", "bh10_$n020",
										"bh10_$n021", "bh10_$n022", "bh10_$n023", "bh10_$n024", "bh10_$n025",
										"bh10_$n026"
									}

	local target = ""
	local dist = 1000
	local message = ""

	if(rand_int(1,2) == 1) then
		-- Sometimes Maero picks a target near the player
		for i,navpoint in pairs(grenade_targets) do
			local cur_dist = get_dist(navpoint, player)
			cur_dist = cur_dist * rand_float(1.0 - target_noise, 1.0 + target_noise)
			if (cur_dist < dist) then
				dist = cur_dist
				target = navpoint
			end
		end
	else
		-- Othertimes, a random target is selected
		target = grenade_targets[rand_int(1,sizeof_table(grenade_targets))]
	end
	dist = get_dist(target,CHAR_MAERO)

	local angle = 60 * rand_float(1.0 - angle_noise, 1.0 + angle_noise)
	local speed = dist

	local alpha = 0
	if (dist > 16) then
		alpha = 1
	elseif(dist > 7) then
		alpha = (dist - 7) / 9
	end

	if (alpha > 0) then
		speed = 7 + alpha * 4.5
		angle = angle - alpha * 15
	end

	speed = speed  * rand_float(1.0 - speed_noise, 1.0 + speed_noise)
	if (speed > 11.5) then
		speed = 11.5
	end
	
	message = message .. "Angle = " .. angle .. " Speed = " .. speed ..  " Dist = " .. dist 
	bh10_debug_text(message, DEBUG_TEXT_NUMBERS)

	force_throw_do(CHAR_MAERO, target, angle, speed)
	
end

function bh10_maero_damaged(maero, attacker, damage_percent, explosion)

	-- Maero can't damage himself. He's too cool.
	if(attacker == CHAR_MAERO) then
		return
	end

	local source = attacker
	if(not source) then
		source = "?"
	end

	local old_hit_points = get_current_hit_points(CHAR_MAERO)
	local new_hit_points = damage_percent * get_max_hit_points(CHAR_MAERO)
	local damage = old_hit_points - new_hit_points

	local msg = ""
	if(explosion) then
		damage = damage * Maero_explosion_ratio
		msg = msg .. "Explosion, "

		if(not Maero_knocked_down) then
			thread_new("bh10_maero_recover")
		end
	end

	if (Maero_knocked_down) then
		damage = damage * Maero_recover_damage_ratio
	end

	if(damage < 1) then
		damage = 1
	end

	bh10_debug_text(msg .. maero .. " at " .. damage_percent*100 .. "% health after attack by " .. source, DEBUG_TEXT_NUMBERS)

	set_current_hit_points(CHAR_MAERO, old_hit_points  - damage)

end

function bh10_maero_recover()

	Maero_knocked_down = true
	bh10_maero_ai_enter_mode(MAERO_AI_RECOVER, false)

end

function bh10_raise_tribal_notoriety()
	local phase_time = 0
	while(1) do
		thread_yield()
		phase_time = 0
		while (notoriety_get_decimal("Brotherhood") < MAX_BH_NOTORIETY) do
			thread_yield()
			local target_notoriety = MAX_BH_NOTORIETY
			phase_time = phase_time + get_frame_time()
			local pct = phase_time / 90
			local new_notoriety = pct * target_notoriety
			if new_notoriety > target_notoriety then
				new_notoriety = target_notoriety
			end
			notoriety_set_min("Brotherhood", new_notoriety)
			notoriety_set("Brotherhood", new_notoriety)
		end
	end
end

--[[
	while(1) do
		thread_yield()
		delay(20)
		local new_bh_notoriety = notoriety_get("Brotherhood") + 1
		if new_bh_notoriety <= MAX_BH_NOTORIETY then
			notoriety_set_max("Brotherhood", new_bh_notoriety)
			notoriety_set("Brotherhood", new_bh_notoriety)
			notoriety_set_min("Brotherhood", new_bh_notoriety)
		end
	end
end
]]--

function bh10_cleanup()

	damage_indicator_off(0)

	-- Cleanup mission here

	IN_COOP = coop_is_active()

	-- Allow follower recruiting
	party_set_recruitable(true)

	-- Start spawning peds again
	spawning_pedestrians(true)

	-- Remove damage callbacks for players
	turn_vulnerable(LOCAL_PLAYER)
	on_take_damage("", LOCAL_PLAYER)
	if (IN_COOP) then
		turn_vulnerable(REMOTE_PLAYER)
		on_take_damage("", REMOTE_PLAYER)
	end

	turn_vulnerable(LOCAL_PLAYER)
	if (IN_COOP) then
		turn_vulnerable(REMOTE_PLAYER)
	end

	bh10_lock_warehouse_doors(false)	

	npc_respawn_dist_reset()

	notoriety_force_no_spawn("Brotherhood", false)

	local TABLE_TRIGGERS = 
	{	TRIGGER_TRIBAL_STAGING, TRIGGER_WAREHOUSE_ENTRANCE, TRIGGER_WAREHOUSE_ROOF,
		TRIGGER_LOW_GROUND, TRIGGER_HIGH_GROUND, TRIGGER_HIDING
	}
	for i, trigger in pairs(TABLE_TRIGGERS) do
		trigger_enable(trigger, false)
		on_trigger("",trigger)
		on_trigger_exit("",trigger)		
	end
	for i, trigger in pairs(TRIGGER_EXPLOIT_AREAS) do
		trigger_enable(trigger, false)
		on_trigger("",trigger)
		on_trigger_exit("",trigger)		
	end
	for i, trigger in pairs(TRIGGER_EXPLOIT_ENTRANCES) do
		trigger_enable(trigger, false)
		on_trigger("",trigger)
		on_trigger_exit("",trigger)		
	end
	for i, trigger in pairs(TRIGGER_EXPLOIT_EXITS) do
		trigger_enable(trigger, false)
		on_trigger("",trigger)
		on_trigger_exit("",trigger)		
	end
	for name,spawn_info in pairs(EXPLOIT_SPAWN_INFO) do
		for i,trigger in pairs(spawn_info["triggers"]) do
			trigger_enable(trigger, false)
			on_trigger("",trigger)
			on_trigger_exit("",trigger)
		end
	end

	trigger_enable(TRIGGER_HIGH_GROUND, false)
	on_trigger("",TRIGGER_HIGH_GROUND)
	on_trigger_exit("",TRIGGER_HIGH_GROUND)

	trigger_enable(TRIGGER_LOW_GROUND, false)
	on_trigger("",TRIGGER_LOW_GROUND)
	on_trigger_exit("",TRIGGER_LOW_GROUND)

	trigger_enable(TRIGGER_HIDING, false)
	on_trigger("",TRIGGER_HIDING)
	on_trigger_exit("",TRIGGER_HIDING)

	

	if THREAD_NOTORIETY ~= -1 then
		thread_kill(THREAD_NOTORIETY)
	end
	if THREAD_LIEUTENANTS ~= -1 then
		thread_kill(THREAD_LIEUTENANTS)
	end
	if THREAD_ROOF ~= -1 then
		thread_kill(THREAD_ROOF)
	end
	if THREAD_SAINTS_BACKUP ~= -1 then
		thread_kill(THREAD_SAINTS_BACKUP)
	end

	on_trigger("", TRIGGER_TRIBAL_STAGING)
	on_trigger("", TRIGGER_WAREHOUSE_ENTRANCE)
	on_trigger("", TRIGGER_WAREHOUSE_ROOF)

	for i, npc in pairs(TABLE_STANDARD_LIEUTENANTS) do
		on_death("", npc)
		marker_remove_npc(npc, SYNC_ALL)
	end
	for i, npc in pairs(TABLE_ROCKET_LIEUTENANTS) do
		on_death("", npc)
		marker_remove_npc(npc, SYNC_ALL)
	end

	mission_waypoint_remove(SYNC_ALL)

	for i, group in pairs(GROUP_SAINTS) do
		release_to_world(group)
	end

	bh10_stop_persona_overrides()

end

function bh10_success()
	-- Called when the mission has ended with success
	--bink_play_movie(CUTSCENE_OUT)
end

function bh10_debug_text(text, debug_type)

	if(DEBUG_TEXT_ENABLED[debug_type]) then
		--mission_help_table_nag(text)
		mission_debug(text, 10, debug_type)
	end
--	delay(1.0)

end
