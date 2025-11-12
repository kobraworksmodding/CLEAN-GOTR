-- bh07.lua
-- SR2 mission script
-- 3/28/07

-- Cutscene crash fixes by IdolNinja
-- 3/11/2011

-- Groups --
	GROUP_FIREBOMBERS =			"bh07_$firebombers"
	GROUP_FIREBOMBERS_COOP =	"bh07_$firebombers_coop"
	GROUP_THE_STORE =				"bh07_$the_store"
	GROUP_THE_STORE_COOP =		"bh07_$the_store_coop"
	GROUP_PRISONERS =				"bh07_$prisoners"
	GROUP_PRISONERS_COOP =		"bh07_$prisoners_coop"
	GROUP_COORDINATOR =			"bh07_$coordinator"
	GROUP_COORDINATOR_COOP =	"bh07_$coordinator_coop"
	GROUP_COURTESY_CAR =			"bh07_$courtesy_car"
	GROUP_COURTESY_CAR_COOP =	"bh07_$courtesy_car_coop"

-- Navpoints --
	NAV_LOCAL_START =				"bh07_$n078"
	NAV_REMOTE_START =			"bh07_$n079"
	NAV_OBJ_FIREBOMBERS =		"bh07_$obj_firebombers"
	NAV_OBJ_STORE =				"bh07_$obj_store"
	NAV_OBJ_PRISONERS =			"bh07_$obj_prisoners"
	NAV_OBJ_COORD =				"bh07_$obj_coord"

	--NAV_COORD_FLEE_PATH =		{"bh07_$n081", "bh07_$n082", "bh07_$n083", "bh07_$n084", "bh07_$n085", "bh07_$n086", "bh07_$n087"}
	NAV_COORD_FLEE_PATH =		{"bh07_$n086", "bh07_$n087"}
	NAV_COORD_FLEE_GROUND =		{"bh07_$n088", "bh07_$n089", "bh07_$n090"}
	NAV_SWAT_HELI_INITIAL_PATH = "bh07_$n072"
	NAV_SWAT_HELI_APPROACH =   {"bh07_$n073", "bh07_$n074", "bh07_$n076", "bh07_$n077", "bh07_$n080", "bh07_$n071"}
	NAV_FIREBOMBER_PATHS =		{{"bh07_$n000", "bh07_$n001", "bh07_$n002", "bh07_$n003"},
										{"bh07_$n004", "bh07_$n005"},
										{"bh07_$n006", "bh07_$n007", "bh07_$n008"},
										{"bh07_$n009", "bh07_$n010", "bh07_$n011"},
										{"bh07_$n012", "bh07_$n013", "bh07_$n014", "bh07_$n015", "bh07_$n016"},
										{"bh07_$n017", "bh07_$n018", "bh07_$n019", "bh07_$n020", "bh07_$n021", "bh07_$n022"},
										{"bh07_$n023", "bh07_$n024", "bh07_$n025"},
										{"bh07_$n094", "bh07_$n095", "bh07_$n096", "bh07_$n097", "bh07_$n098", "bh07_$n016"},
										{"bh07_$n099", "bh07_$n100", "bh07_$n101", "bh07_$n102", "bh07_$n110", "bh07_$n097", "bh07_$n098", "bh07_$n016"},
										{"bh07_$n103", "bh07_$n104", "bh07_$n105", "bh07_$n106", "bh07_$n107", "bh07_$n108", "bh07_$n109", "bh07_$n022"}}
	FIREBOMBER_PATH_MAP =		{{2,4},
										{3,8},
										{5,9},
										{5,9},
										{6,10},
										{1,7},
										{3,8},
										{6,10},
										{6,10},
										{1,7}}

--[[
	NAV_STORE =						{"bh07_$n028", "bh07_$n029", "bh07_$n030", "bh07_$n031", 
										"bh07_$n032", "bh07_$n033", "bh07_$n034", "bh07_$n035", 
										"bh07_$n036", "bh07_$n037", "bh07_$n038", "bh07_$n039", 
										"bh07_$n040", "bh07_$n041", "bh07_$n042", "bh07_$n043",
										"bh07_$n044", "bh07_$n045", "bh07_$n046", "bh07_$n047",
										"bh07_$n048", "bh07_$n049", "bh07_$n050", "bh07_$n051",
										"bh07_$n052", "bh07_$n053", "bh07_$n054", "bh07_$n055",
										"bh07_$n056", "bh07_$n057", "bh07_$n058", "bh07_$n059",
										"bh07_$n060", "bh07_$n061", "bh07_$n062", "bh07_$n063",
										"bh07_$n064", "bh07_$n065", "bh07_$n066", "bh07_$n067",
										"bh07_$n068", "bh07_$n069", "bh07_$n070", "bh07_$n075"}
]]--
	NAV_STORE =						{{"bh07_$n065", "bh07_$n064", "bh07_$n063", "bh07_$n029", "bh07_$n062", "bh07_$n061", "bh07_$n060"},
										{"bh07_$n054", "bh07_$n055", "bh07_$n039", "bh07_$n056", "bh07_$n057", "bh07_$n037", "bh07_$n058", "bh07_$n059"},
										{"bh07_$n048", "bh07_$n049", "bh07_$n034", "bh07_$n050", "bh07_$n051", "bh07_$n052", "bh07_$n033", "bh07_$n053"},
										{"bh07_$n044", "bh07_$n032", "bh07_$n043", "bh07_$n036", "bh07_$n045", "bh07_$n035", "bh07_$n046"},
										{"bh07_$n066", "bh07_$n040", "bh07_$n038", "bh07_$n042", "bh07_$n041"},
										{"bh07_$n067", "bh07_$n030", "bh07_$n068", "bh07_$n031", "bh07_$n069", "bh07_$n069"}}

	NUM_STORE_NAVS =				sizeof_table(NAV_STORE)

-- Triggers
	TRIGGER_STORE_ENTRANCES	=	{"bh07_$Tstore_entrance_1", "bh07_$Tstore_entrance_2"}

-- Vehicles --
	VEH_FIREBOMBER =				"bh07_$v000"
	VEH_COORD =						"bh07_$v001"
	VEH_SWAT =						"bh07_$v002"
	VEH_FIREBOMBER_COOP =		"bh07_$v004"
	VEH_SWAT_HELI =				"bh07_$v005"

-- Characters --
	CHAR_LT_FIREBOMBER =			"bh07_$c000"
	CHAR_FIREBOMBERS =			{"bh07_$c000", "bh07_$c001", "bh07_$c002"}
	CHAR_FIREBOMBERS_COOP =		{"bh07_$c023", "bh07_$c024", "bh07_$c025", "bh07_$c026"}

	CHAR_SWAT =						{"bh07_$c014", "bh07_$c015", "bh07_$c005", "bh07_$c021", "bh07_$c022"}
	CHAR_SWAT_COOP =				{"bh07_$c033", "bh07_$c034"}
	CHAR_LT_SWAT =					"bh07_$c018"
	CHAR_SD_TRIBAL_SWAT =		{"bh07_$c016", "bh07_$c017", "bh07_$c040", "bh07_$c041"}
	CHAR_SD_SAINTS_SWAT =		{"bh07_$c019", "bh07_$c020", "bh07_$c038", "bh07_$c039"}
	CHAR_ALL_SWAT_PRISONERS =	{"bh07_$c016", "bh07_$c017", "bh07_$c018", "bh07_$c019", "bh07_$c020", "bh07_$c038", "bh07_$c039", "bh07_$c040", "bh07_$c041"}
	CHAR_TRIBAL_SWAT =			{"bh07_$c016", "bh07_$c017", "bh07_$c018", "bh07_$c040", "bh07_$c041"}
	CHAR_SWAT_HELI =				{"bh07_$c003", "bh07_$c004", "bh07_$c042", "bh07_$c043", "bh07_$c044"}

	CHAR_LT_STORE =				"bh07_$c006"
	CHAR_ALL_STORE =				{"bh07_$c007", "bh07_$c008", "bh07_$c037"}
	CHAR_STORE_COOP =				{"bh07_$c031", "bh07_$c032"}
	CHAR_CLERKBEATERS_STORE =	{"bh07_$c036", "bh07_$c006"}
	CHAR_CLERK_STORE =			"bh07_$c035"
	CHAR_BROWNBAGGERS_CLERK =	"shops_sr2_city_$TY_liq_clerk"

	CHAR_LT_COORD =				"bh07_$c009"
	CHAR_SD_COORD =				{"bh07_$c010", "bh07_$c011", "bh07_$c012", "bh07_$c013"}
	CHAR_ALL_COORD =				{"bh07_$c009", "bh07_$c010", "bh07_$c011", "bh07_$c012", "bh07_$c013"}
	CHAR_ALL_COORD_COOP =		{"bh07_$c027", "bh07_$c028", "bh07_$c029", "bh07_$c030"}

-- Text --
	TEXT_LTS_KILLED =				"bh07_lts_killed"
	TEXT_ELIMINATE_LTS =			"bh07_eliminate_lts"
	TEXT_KILL_REMAINING_LTS =	"bh07_kill_remaining_lts"
	TEXT_SAVE_SHOP_OWNER =		"bh07_save_shop_owner"
	TEXT_SHOP_OWNER_HEALTH =	"bh07_shop_owner_health"
	TEXT_PREVENT_DAMAGE =		"bh07_prevent_damage"
	TEXT_STORE_DAMAGE_METER =	"bh07_store_damage_meter"
	TEXT_SHOP_OWNER_DIED =		"bh07_shop_owner_died"
	TEXT_TOO_MUCH_DAMAGE =		"bh07_too_much_damage"
	TEXT_KILL_FLEEING_LT =		"bh07_kill_fleeing_lieutenant"

	TEXT_MEETING_LT =				"bh07_meeting_lieutenant"
	TEXT_TORCHING_DOCKS =		"bh07_torching_docks"
	TEXT_ARRESTED_LT =			"bh07_arrested_lieutenant"
	TEXT_DESTROYING_STORE =		"bh07_destroying_store"
	TEXT_REMAINING_LT	=			"bh07_remaining_lieutenant"

-- Threads --
	THREAD_STORE_MAYHEM =		{-1, -1, -1}
	THREAD_COORD_FLEE =			-1
	THREAD_HELI_PATH =			-1
	THREAD_INITIAL_GPS =			-1
	THREAD_FIREBOMBERS =			-1
	THREAD_STORE =					-1
	THREAD_PRISONERS =			-1
	THREAD_COORD =					-1
	THREAD_FIREBOMBER_ESCORT = -1
	THREAD_MOLOTOVS =				-1
	THREAD_SWAT_HELI =			-1
	THREAD_HELI_EXIT =			{-1, -1, -1, -1, -1, -1}
	THREAD_SHOP_OWNER =			-1
	THREAD_NOTORIETY =			-1
	ALL_THREADS =					{THREAD_STORE_MAYHEM[1], THREAD_STORE_MAYHEM[2], THREAD_STORE_MAYHEM[3], THREAD_COORD_FLEE, THREAD_HELI_PATH,
										 THREAD_INITIAL_GPS, THREAD_FIREBOMBERS, THREAD_STORE, THREAD_PRISONERS, THREAD_COORD, THREAD_FIREBOMBER_ESCORT,
										 THREAD_MOLOTOVS, THREAD_SWAT_HELI, THREAD_HELI_EXIT[1], THREAD_HELI_EXIT[2], THREAD_HELI_EXIT[3], THREAD_HELI_EXIT[4],
										 THREAD_HELI_EXIT[5], THREAD_HELI_EXIT[6], THREAD_SHOP_OWNER, THREAD_NOTORIETY}

-- Checkpoints --
	CHECKPOINT_SWAT =				"bh07_checkpoint_swat"
	CHECKPOINT_FIREBOMBERS =	"bh07_checkpoint_firebombers"
	CHECKPOINT_COORDINATOR =	"bh07_checkpoint_coordinator"
	CHECKPOINT_STORE =			"bh07_checkpoint_store"

-- Cutscenes --
-- Added by IdolNinja. These variables are used in the script for the cutscenes for stability instead of calling them directly
	CUTSCENE_IN =			"br07-01"
	CUTSCENE_OUT =			"br07-02"
	MISSION_NAME =			"bh07"

-- Other --
	Lieutenants_killed =			0
	Store_total_damage =			0
	Store_mayhem_choice =		{["bh07_$c006"] = -1, ["bh07_$c007"] = -1, ["bh07_$c008"] = -1}
	IN_COOP =						false
	INITIAL_NUM_LIEUTENANTS =	4
	STORE_COOP_DISTANCE =		20
	SWAT_HELI_LAUNCH_DISTANCE = 100
	FIREBOMBER_DISTANCE =		200
	STORE_DAMAGE_LIMIT =			1000
	STORE_DAMAGE_AMOUNT =		25
	ANIM_STATE_KNEEL =			"surrender"
	ANIM_STATE_SWAT =				"combat stand"
	ANIM_ACTION_DRINK =			"powerup liquor"
	MOLOTOV_INTERVAL =			1
	COORD_SPAWN_RADIUS =			200
	FIREBOMBER_SPAWN_RADIUS =	250
	STORE_SPAWN_RADIUS =			200
	PRISONERS_SPAWN_RADIUS =	600

	PLAYER_SYNC = {[LOCAL_PLAYER] = SYNC_LOCAL, [REMOTE_PLAYER] = SYNC_REMOTE}
	OTHER_PLAYER = {[LOCAL_PLAYER] = REMOTE_PLAYER, [REMOTE_PLAYER] = LOCAL_PLAYER}	

BH07_SAINTS_ATTACK_PERSONAS = {
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

BH07_BH_ATTACK_PERSONAS = {
	["HM_Bro1"]	=	"HMBRO1",
	["HM_Bro2"]	=	"HMBRO2",
	["HM_Bro3"]	=	"HMBRO3",

	["HF_Bro1"]	=	"HFBRO1",
	["HF_Bro2"]	=	"HFBRO2",

	["WM_Bro1"]	=	"WMBRO1",
	["WM_Bro2"]	=	"WMBRO2",
	["WM_Bro3"]	=	"WMBRO3",

	["WF_Bro1"]	=	"WFBRO1",
	["WF_Bro2"]	=	"WFBRO2",
}

BH07_TAUNT_PERSONAS = {
	["HM_Bro1"]	=	"HMBRO1",
	["HM_Bro2"]	=	"HMBRO2",
	["HM_Bro3"]	=	"HMBRO3",

	["HF_Bro2"]	=	"HFBRO2",

	["WM_Bro3"]	=	"WMBRO3",

	["WF_Bro1"]	=	"WFBRO1",
	["WF_Bro2"]	=	"WFBRO2",
}

BH07_SHOP_PERSONAS = {
	["HM_Bro1"]	=	"HMBRO1",
	["HM_Bro2"]	=	"HMBRO2",
	["HM_Bro3"]	=	"HMBRO3",

	["HF_Bro2"]	=	"HFBRO2",

	["WM_Bro3"]	=	"WMBRO3",

	["WF_Bro1"]	=	"WFBRO1",
	["WF_Bro2"]	=	"WFBRO2",
}

BH07_MOLOTOV_PERSONAS = {
	["HM_Bro1"]	=	"HMBRO1",
	["HM_Bro2"]	=	"HMBRO2",
	["HM_Bro3"]	=	"HMBRO3",

	["HF_Bro2"]	=	"HFBRO2",

	["WM_Bro3"]	=	"WMBRO3",

	["WF_Bro1"]	=	"WFBRO1",
	["WF_Bro2"]	=	"WFBRO2",
}

function bh07_start(bh07_checkpoint, is_restart)

	if bh07_checkpoint == MISSION_START_CHECKPOINT then
		if (not is_restart) then
			cutscene_play(CUTSCENE_IN)
		end
		fade_out(0)
	end

	bh07_initialize(bh07_checkpoint)

	if not Bh07_checkpoint_firebombers_complete then
		THREAD_FIREBOMBERS = thread_new("bh07_firebombers")
	else
		Lieutenants_killed = Lieutenants_killed + 1
	end

	if not Bh07_checkpoint_store_complete then
		THREAD_STORE = thread_new("bh07_the_store")
	else
		Lieutenants_killed = Lieutenants_killed + 1
	end

	if not Bh07_checkpoint_swat_complete then
		THREAD_PRISONERS = thread_new("bh07_no_prisoners")
	else
		Lieutenants_killed = Lieutenants_killed + 1
	end

	if not Bh07_checkpoint_coordinator_complete then
		THREAD_COORD = thread_new("bh07_the_coordinator")
	else
		Lieutenants_killed = Lieutenants_killed + 1
	end

	--THREAD_NOTORIETY = thread_new("bh07_notoriety")

	if bh07_checkpoint == MISSION_START_CHECKPOINT then
		THREAD_INITIAL_GPS = thread_new("bh07_firebomber_gps")
		mission_help_table(TEXT_ELIMINATE_LTS)
	elseif (Lieutenants_killed == INITIAL_NUM_LIEUTENANTS - 1) then
		mission_help_table(TEXT_REMAINING_LT)
	else
		mission_help_table(TEXT_KILL_REMAINING_LTS)
	end

	bh07_show_lieutenant_counter()
end

function bh07_initialize(checkpoint)

	mission_start_fade_out(0.0)

	bh07_initialize_common()

	bh07_initialize_checkpoint(checkpoint)

	mission_start_fade_in()

end

-- Initialization code shared by all checkpoints.
function bh07_initialize_common()

	-- Start trigger is hit...the activate button was hit
	set_mission_author("Phillip Alexander and Aaron Hanson (aka Father Zucosos)")

	if coop_is_active() then
		IN_COOP = true
	end

	notoriety_set_max("Police", 2)	

	bh07_start_persona_overrides()

end

-- Initialization code specific to the checkpoint.
function bh07_initialize_checkpoint(checkpoint)

	if checkpoint == MISSION_START_CHECKPOINT then
		
		Bh07_checkpoint_firebombers_complete = false
		Bh07_checkpoint_swat_complete = false
		Bh07_checkpoint_store_complete = false
		Bh07_checkpoint_coordinator_complete = false

		group_create(GROUP_COURTESY_CAR, true)
		if IN_COOP then
			group_create(GROUP_COURTESY_CAR_COOP, true)
		end

		teleport_coop(NAV_LOCAL_START, NAV_REMOTE_START)

	end

end

function bh07_start_persona_overrides()
--	persona_override_group_start(BH07_SAINTS_ATTACK_PERSONAS, POT_SITUATIONS[POT_ATTACK], "BR07_ATTACK")
--	persona_override_group_start(BH07_TAUNT_PERSONAS, POT_SITUATIONS[POT_TAUNT_NEGATIVE], "BR07_TAUNT")
	persona_override_group_start(BH07_SHOP_PERSONAS, POT_SITUATIONS[POT_CUSTOM_1], "BR07_SHOP")
	persona_override_group_start(BH07_MOLOTOV_PERSONAS, POT_SITUATIONS[POT_CUSTOM_2], "BR07_MOLOTOV")
end

function bh07_stop_persona_overrides()
--	persona_override_group_stop(SAINTS_PERSONAS, POT_SITUATIONS[POT_ATTACK])
--	persona_override_group_stop(BROTHERHOOD_PERSONAS, POT_SITUATIONS[POT_TAUNT_NEGATIVE])
	persona_override_group_stop(BROTHERHOOD_PERSONAS, POT_SITUATIONS[POT_CUSTOM_1])
	persona_override_group_stop(BROTHERHOOD_PERSONAS, POT_SITUATIONS[POT_CUSTOM_2])
end

function bh07_wait_to_spawn_objective(nav, radius)
	local dist, closest_player = get_dist_closest_player_to_object(nav)
	while (dist >= radius) do
		dist, closest_player = get_dist_closest_player_to_object(nav)
		thread_yield()
	end
end

function bh07_firebomber_gps()

	-- Add a waypoint to the truck's starting location
	mission_waypoint_add(NAV_OBJ_FIREBOMBERS, SYNC_ALL)

	-- Returns true if the waypoint should no longer be displayed.
	local function should_keep_waypoint()
		if (	(Lieutenants_killed == 0) 
				and (get_dist_closest_player_to_object(CHAR_LT_COORD) > 25)
				and (get_dist_closest_player_to_object(CHAR_LT_STORE) > 25) 
				and (get_dist_closest_player_to_object(CHAR_LT_SWAT) > 25)
			) then
			return true
		end
		return false
	end

	local vehicle_waypoint = false	

	-- Remove the waypoint if the player is too close to any of the LTNTS, or any LTNT has been killed.
	while (should_keep_waypoint()) do
		if ( (not vehicle_waypoint) and (group_is_loaded(GROUP_FIREBOMBERS)) ) then
			mission_waypoint_remove(SYNC_ALL)
			mission_waypoint_add(VEH_FIREBOMBER)
			vehicle_waypoint = true
		end
		thread_yield()
	end

	mission_waypoint_remove(SYNC_ALL)
end

function bh07_initial_gps()
	mission_waypoint_add(NAV_OBJ_FIREBOMBERS, SYNC_ALL)

	local vehicle_waypoint = false

	while (Lieutenants_killed == 0) and
	      (get_dist_char_to_nav(LOCAL_PLAYER, CHAR_LT_COORD) > 25) and
			(get_dist_char_to_nav(LOCAL_PLAYER, CHAR_LT_STORE) > 25) and
			(get_dist_char_to_nav(LOCAL_PLAYER, CHAR_LT_SWAT) > 25) do
		if ( (not vehicle_waypoint) and (group_is_loaded(GROUP_FIREBOMBERS)) ) then
			mission_waypoint_remove(SYNC_ALL)
			mission_waypoint_add(VEH_FIREBOMBER)
			vehicle_waypoint = true
		end
		thread_yield()
	end

	mission_waypoint_remove(SYNC_ALL)
end

function bh07_show_lieutenant_counter()
	objective_text(0, TEXT_LTS_KILLED, Lieutenants_killed, INITIAL_NUM_LIEUTENANTS)
end

function bh07_firebombers()
	marker_add_navpoint(NAV_OBJ_FIREBOMBERS, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL)
	bh07_wait_to_spawn_objective(NAV_OBJ_FIREBOMBERS, FIREBOMBER_SPAWN_RADIUS)

	group_create(GROUP_FIREBOMBERS, true)
	if IN_COOP then
		group_create(GROUP_FIREBOMBERS_COOP, true)
	end

	delay(2.0)

	local closest_player, dist
	repeat
		thread_yield()
		dist, closest_player = get_dist_closest_player_to_object(VEH_FIREBOMBER)
	until dist <= FIREBOMBER_DISTANCE

	on_death("bh07_lieutenant_killed", CHAR_LT_FIREBOMBER)
	marker_add_npc(CHAR_FIREBOMBERS[1], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL)
	marker_remove_navpoint(NAV_OBJ_FIREBOMBERS, SYNC_ALL)
	thread_yield()
	
	set_ignore_ai_flag(CHAR_FIREBOMBERS[1], true)
	set_ignore_ai_flag(CHAR_FIREBOMBERS[2], true)
	set_ignore_ai_flag(CHAR_FIREBOMBERS[3], true)
	vehicle_suppress_npc_exit(VEH_FIREBOMBER, true)
	vehicle_enter_teleport(CHAR_FIREBOMBERS[1], VEH_FIREBOMBER, 0)
	vehicle_enter_teleport(CHAR_FIREBOMBERS[2], VEH_FIREBOMBER, 2)
	vehicle_enter_teleport(CHAR_FIREBOMBERS[3], VEH_FIREBOMBER, 3)
	set_unjackable_flag(VEH_FIREBOMBER, true)

	if IN_COOP then
		vehicle_enter_group_teleport(CHAR_FIREBOMBERS_COOP, VEH_FIREBOMBER_COOP)

		THREAD_FIREBOMBER_ESCORT = thread_new("bh07_firebomber_escort")
	end
	
	vehicle_prevent_explosion_fling(VEH_FIREBOMBER, true)
	vehicle_infinite_mass(VEH_FIREBOMBER, true)
	vehicle_set_crazy(VEH_FIREBOMBER, true)
	vehicle_max_speed(VEH_FIREBOMBER, 65)

	
	THREAD_MOLOTOVS = thread_new("bh07_firebombers_molotovs")
	local path_node = 6

	mission_help_table(TEXT_TORCHING_DOCKS)

	while(not character_is_dead(CHAR_LT_FIREBOMBER) and not vehicle_is_destroyed(VEH_FIREBOMBER)) do
		thread_yield()
		local num_choices = sizeof_table(FIREBOMBER_PATH_MAP[path_node])
		local choice_id = rand_int(1, num_choices)
		path_node = FIREBOMBER_PATH_MAP[path_node][choice_id]
		local path_navs =	NAV_FIREBOMBER_PATHS[path_node]
		vehicle_pathfind_to(VEH_FIREBOMBER, path_navs, true, false)
	end

	while(not character_is_dead(CHAR_LT_FIREBOMBER)) do
		thread_yield()
	end

	Bh07_checkpoint_firebombers_complete = true
	if bh07_more_objectives_remain() then
		mission_set_checkpoint(CHECKPOINT_FIREBOMBERS)

		if (Lieutenants_killed == INITIAL_NUM_LIEUTENANTS - 1) then
			mission_help_table(TEXT_REMAINING_LT)
		else
			mission_help_table(TEXT_KILL_REMAINING_LTS)
		end
	end

	marker_remove_npc(CHAR_LT_FIREBOMBER, SYNC_ALL)
end

function bh07_firebomber_escort()
	vehicle_chase(VEH_FIREBOMBER_COOP, CHAR_FIREBOMBERS[1], false, false, true)
end

function bh07_firebombers_molotovs()
	while(1) do
		thread_yield()
		delay(MOLOTOV_INTERVAL)
		inv_item_equip("molotov", CHAR_FIREBOMBERS[1])
		audio_play_persona_line(CHAR_FIREBOMBERS[1], POT_SITUATIONS[POT_CUSTOM_2][1])
		force_throw_from_vehicle(CHAR_FIREBOMBERS[1], true)
		thread_yield()
		delay(MOLOTOV_INTERVAL)
		inv_item_equip("molotov", CHAR_FIREBOMBERS[2])
		audio_play_persona_line(CHAR_FIREBOMBERS[2], POT_SITUATIONS[POT_CUSTOM_2][1])
		force_throw_from_vehicle(CHAR_FIREBOMBERS[2], true)
		thread_yield()
		delay(MOLOTOV_INTERVAL)
		inv_item_equip("molotov", CHAR_FIREBOMBERS[3])
		audio_play_persona_line(CHAR_FIREBOMBERS[3], POT_SITUATIONS[POT_CUSTOM_2][1])
		force_throw_from_vehicle(CHAR_FIREBOMBERS[3], true)
	end
end


function bh07_no_prisoners()
	marker_add_navpoint(NAV_OBJ_PRISONERS, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL)
	bh07_wait_to_spawn_objective(NAV_OBJ_PRISONERS, PRISONERS_SPAWN_RADIUS)

	group_create(GROUP_PRISONERS, true)
	-- Hide the swat group. we don't want the player to find them standing around
	vehicle_hide(VEH_SWAT_HELI)
	for i, npc in pairs(CHAR_SWAT_HELI) do
		character_hide(npc)
	end
	if IN_COOP then
		group_create(GROUP_PRISONERS_COOP, true)
	end

	vehicle_set_sirenlights(VEH_SWAT, true)

	marker_add_npc(CHAR_LT_SWAT, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL)
	marker_remove_navpoint(NAV_OBJ_PRISONERS, SYNC_ALL)
	on_death("bh07_lieutenant_killed", CHAR_LT_SWAT)
	thread_yield()

	for i, npc in pairs(CHAR_SWAT) do
		inv_item_add("m16", 1, npc)
		inv_item_equip("m16", npc)
		on_death("bh07_swat_killed", npc)
		on_damage("bh07_holdup_interrupted", npc, 0.99)
		npc_unholster_best_weapon(npc)
		set_animation_state(npc, ANIM_STATE_SWAT)
	end

	if IN_COOP then
		for i, npc in pairs(CHAR_SWAT_COOP) do
			inv_item_add("m16", 1, npc)
			inv_item_equip("m16", npc)
			on_death("bh07_swat_killed", npc)
			on_damage("bh07_holdup_interrupted", npc, 0.99)
			npc_unholster_best_weapon(npc)
			set_animation_state(npc, ANIM_STATE_SWAT)
		end
	end

	for i, npc in pairs(CHAR_ALL_SWAT_PRISONERS) do
		inv_item_remove_all(npc)
		on_damage("bh07_holdup_interrupted", npc, 0.99)
		set_animation_state(npc, ANIM_STATE_KNEEL)
	end

	for i, npc in pairs(CHAR_SD_SAINTS_SWAT) do
		set_attack_player_flag(npc, false)
	end

	local function bh07_npc_is_players_shield(npc)
		if (not character_is_dead(npc) ) then
			if (character_has_specific_human_shield(LOCAL_PLAYER,npc) ) then
				return true				
			elseif ( IN_COOP and character_has_specific_human_shield(REMOTE_PLAYER,npc) ) then
				return true
			end
		end
		return false
	end

	local heli_launched = false
	while not character_is_dead(CHAR_LT_SWAT) do
		thread_yield()
		if (not heli_launched) and (get_dist_closest_player_to_object(CHAR_LT_SWAT) <= SWAT_HELI_LAUNCH_DISTANCE) then
			THREAD_SWAT_HELI = thread_new("bh07_launch_swat_heli")
			heli_launched = true
			mission_help_table(TEXT_ARRESTED_LT)
		end

		if (not Bh07_holdup_triggered) then

			for i, npc in pairs(CHAR_SWAT) do
				if(bh07_npc_is_players_shield(npc)) then
					bh07_holdup_interrupted()
				end
			end

			if IN_COOP then
				for i, npc in pairs(CHAR_SWAT_COOP) do
					if(bh07_npc_is_players_shield(npc)) then
						bh07_holdup_interrupted()
					end
				end
			end

			for i, npc in pairs(CHAR_ALL_SWAT_PRISONERS) do
				if(bh07_npc_is_players_shield(npc)) then
					bh07_holdup_interrupted()
				end
			end
			
		end		

	end

	Bh07_checkpoint_swat_complete = true
	if bh07_more_objectives_remain() then
		mission_set_checkpoint(CHECKPOINT_SWAT)
		if (Lieutenants_killed == INITIAL_NUM_LIEUTENANTS - 1) then
			mission_help_table(TEXT_REMAINING_LT)
		else
			mission_help_table(TEXT_KILL_REMAINING_LTS)
		end
	end

	marker_remove_npc(CHAR_LT_SWAT, SYNC_ALL)
end

function bh07_launch_swat_heli()

	local dist,player = get_dist_closest_player_to_object(VEH_SWAT_HELI)
	-- If the player is close by, don't show the heli... don't want to pop it in on top of them.
	if (dist < 100) then
		return
	end
	
	vehicle_show(VEH_SWAT_HELI)
	for i, npc in pairs(CHAR_SWAT_HELI) do
		character_show(npc)
	end
	
	vehicle_enter_group_teleport(CHAR_SWAT_HELI, VEH_SWAT_HELI)
	delay(2)

	helicopter_fly_to(VEH_SWAT_HELI, 35, NAV_SWAT_HELI_INITIAL_PATH)
	delay()
	--THREAD_HELI_PATH = thread_new("bh07_swat_path")
	helicopter_fly_to_direct(VEH_SWAT_HELI, 35, NAV_SWAT_HELI_APPROACH)
	--[[
	while(get_dist(VEH_SWAT_HELI, NAV_SWAT_HELI_APPROACH[6]) > 3.5) do
		thread_yield()
	end
	]]
	turn_invulnerable(VEH_SWAT_HELI)
	delay(1)
	if(THREAD_HELI_PATH ~= -1) then
		thread_kill(THREAD_HELI_PATH)
	end
	delay()
	for i, npc in pairs(CHAR_SWAT_HELI) do
		if (i > 1) then
			THREAD_HELI_EXIT[i] = thread_new("bh07_swat_heli_exit", npc)
		end
	end
	turn_vulnerable(VEH_SWAT_HELI)
end

function bh07_swat_path()
	helicopter_fly_to_direct(VEH_SWAT_HELI, 35, NAV_SWAT_HELI_APPROACH)
end

function bh07_swat_heli_exit(npc)
	vehicle_exit(npc, false)
	attack(npc, LOCAL_PLAYER)
end

function bh07_swat_killed()
	for i, npc in pairs(CHAR_SWAT) do
		clear_animation_state(npc)
		on_death("", npc)
		on_damage("", npc, 0.99)
		inv_item_add("m16", 1, npc)
		inv_item_equip("m16", npc)
		set_ignore_ai_flag(npc, false)
		set_attack_player_flag(npc, true)
		attack(npc, CLOSEST_PLAYER)
	end

	if IN_COOP then
		for i, npc in pairs(CHAR_SWAT_COOP) do
			clear_animation_state(npc)
			on_death("", npc)
			on_damage("", npc, 0.99)
			inv_item_add("m16", 1, npc)
			inv_item_equip("m16", npc)
			set_ignore_ai_flag(npc, false)
			set_attack_player_flag(npc, true)
			attack(npc, CLOSEST_PLAYER)
		end
	end

	for i, npc in pairs(CHAR_TRIBAL_SWAT) do
		on_damage("", npc, 0.99)
		set_ignore_ai_flag(npc, false)
		clear_animation_state(npc)
	end

	for i, npc in pairs(CHAR_SD_SAINTS_SWAT) do
		set_attack_player_flag(npc, false)
		set_ignore_ai_flag(npc, false)
		attack(npc, CHAR_SD_TRIBAL_SWAT[i])
	end
end

Bh07_holdup_triggered = false
function bh07_holdup_interrupted()

	if(Bh07_holdup_triggered) then
		return
	else
		Bh07_holdup_triggered = true
	end

	for i, npc in pairs(CHAR_ALL_SWAT_PRISONERS) do
		on_damage("", npc, 0.99)
	end

	for i, npc in pairs(CHAR_SWAT) do
		clear_animation_state(npc)
		on_damage("", npc, 0.99)
		set_ignore_ai_flag(npc, false)
		set_attack_player_flag(npc, true)
		attack(npc, CLOSEST_PLAYER)
	end

	if IN_COOP then
		for i, npc in pairs(CHAR_SWAT_COOP) do
			clear_animation_state(npc)
			on_damage("", npc, 0.99)
			set_ignore_ai_flag(npc, false)
			set_attack_player_flag(npc, true)
			attack(npc, CLOSEST_PLAYER)
		end
	end
end

Store_approached = false
function bh07_the_store()
	marker_add_navpoint(NAV_OBJ_STORE, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL)
	bh07_wait_to_spawn_objective(NAV_OBJ_STORE, STORE_SPAWN_RADIUS)
	trigger_type_enable("liquor store", false)

	-- setup triggers so that we know when the player has approached the store
	for i,trigger in pairs (TRIGGER_STORE_ENTRANCES) do
		on_trigger("bh07_the_store_approached", trigger)
		trigger_enable(trigger, true)
	end

	group_create(GROUP_THE_STORE, true)
	if IN_COOP then
		group_create(GROUP_THE_STORE_COOP, true)
	end

	on_death("bh07_failure_shop_owner_died", CHAR_CLERK_STORE)

	marker_add_npc(CHAR_LT_STORE, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL)
	marker_remove_navpoint(NAV_OBJ_STORE, SYNC_ALL)
	on_death("bh07_lieutenant_killed", CHAR_LT_STORE)

	while (not Store_approached) do
		thread_yield()
	end

	local dist, closest_player = get_dist_closest_player_to_object(NAV_OBJ_STORE)
	local sync = PLAYER_SYNC[closest_player]

	character_hide(CHAR_BROWNBAGGERS_CLERK)

	mission_help_table(TEXT_DESTROYING_STORE, "", "", sync)
	--mission_help_table(TEXT_PREVENT_DAMAGE, "", "", sync)
	objective_text(1, TEXT_STORE_DAMAGE_METER, Store_total_damage, STORE_DAMAGE_LIMIT, sync)

	THREAD_SHOP_OWNER = thread_new("bh07_shop_owner")

	for i, npc in pairs(CHAR_ALL_STORE) do
		set_attack_player_flag(npc, false)
		character_set_cannot_wield_havok_weapon(npc, true)
		npc_weapon_pickup_override(npc, false)
		THREAD_STORE_MAYHEM[i] = thread_new("bh07_store_mayhem", npc)
		on_damage("bh07_store_fight", npc, 0.8)
	end

	if IN_COOP then
		for i, npc in pairs(CHAR_STORE_COOP) do
			on_damage("bh07_store_fight", npc, 0.8)
			npc_weapon_pickup_override(npc, false)
			character_set_cannot_wield_havok_weapon(npc, true)
		end
	end

	while not character_is_dead(CHAR_LT_STORE) do
		thread_yield()

		-- See if the Coop player should start getting the hud updates
		if (IN_COOP and (sync ~= SYNC_ALL)) then
			if (get_dist(OTHER_PLAYER[closest_player], NAV_OBJ_STORE) < STORE_COOP_DISTANCE) then
				mission_help_table(TEXT_PREVENT_DAMAGE, "", "", OTHER_PLAYER[closest_player])
				sync = SYNC_ALL
			end
		end
		objective_text(1, TEXT_STORE_DAMAGE_METER, Store_total_damage, STORE_DAMAGE_LIMIT, sync)

		if Store_total_damage >= STORE_DAMAGE_LIMIT then
			bh07_failure_store_damage()
		end

		-- If one of the brotherhood is taken as a human shield, then they should attack the player.
		if (not Store_fight_triggered) then
			for i, npc in pairs(CHAR_ALL_STORE) do
				if (not character_is_dead(npc) ) then
					if (character_has_specific_human_shield(LOCAL_PLAYER,npc) ) then
						bh07_store_fight()					
					elseif ( IN_COOP and character_has_specific_human_shield(REMOTE_PLAYER,npc) ) then
						bh07_store_fight()
					end
				end
			end

			if IN_COOP then
				for i, npc in pairs(CHAR_STORE_COOP) do
					if (not character_is_dead(npc) ) then
						if (character_has_specific_human_shield(LOCAL_PLAYER,npc) ) then
							bh07_store_fight()					
						elseif ( IN_COOP and character_has_specific_human_shield(REMOTE_PLAYER,npc) ) then
							bh07_store_fight()
						end
					end
				end
			end
		end

	end

	if ( character_exists(CHAR_CLERK_STORE) and (not character_is_dead(CHAR_CLERK_STORE)) ) then
		turn_invulnerable(CHAR_CLERK_STORE, false)
	end


	delay(2)
	Bh07_checkpoint_store_complete = true
	if bh07_more_objectives_remain() then
		mission_set_checkpoint(CHECKPOINT_STORE)

		if (Lieutenants_killed == INITIAL_NUM_LIEUTENANTS - 1) then
			mission_help_table(TEXT_REMAINING_LT)
		else
			mission_help_table(TEXT_KILL_REMAINING_LTS)
		end
	end

	objective_text_clear(1)
	damage_indicator_off(0)
	marker_remove_npc(CHAR_LT_STORE, SYNC_ALL)
end

function bh07_the_store_approached(trigger)

	Store_approached = true

	for i,trigger in pairs (TRIGGER_STORE_ENTRANCES) do
		on_trigger("", trigger)
		trigger_enable(trigger, false)
	end

end

Store_fight_triggered = false
function bh07_store_fight()
	
	if(Store_fight_triggered) then
		return
	else
		Store_fight_triggered = true
	end

	for i, npc in pairs(CHAR_ALL_STORE) do
		thread_kill(THREAD_STORE_MAYHEM[i])
		on_damage("", npc, 0.8)
		set_attack_player_flag(npc, true)
		set_ignore_ai_flag(npc, false)
		local dist, closest_player = get_dist_closest_player_to_object(npc)
		attack(npc, closest_player)
	end

	if IN_COOP then
		for i, npc in pairs(CHAR_STORE_COOP) do
			on_damage("", npc, 0.8)
			set_attack_player_flag(npc, true)
			set_ignore_ai_flag(npc, false)
			local dist, closest_player = get_dist_closest_player_to_object(npc)
			attack(npc, closest_player)
		end
	end
end

function bh07_store_mayhem(npc)
	set_attack_player_flag(npc, false)
	set_ignore_ai_flag(npc, true)
	npc_unholster_best_weapon(npc)
	local path_choice = 0
	local speak_delay = rand_int(4,10)
	while(1) do
		thread_yield()
		local maybe_drink = rand_int(1, 6)
		if maybe_drink == 1 then
			npc_do_drugs(npc, "40oz")
			delay(4)
			speak_delay = speak_delay - 4
		else
			repeat 
				path_choice = rand_int(1, NUM_STORE_NAVS)
			until not bh07_store_mayhem_choice_being_used(path_choice)
			Store_mayhem_choice[npc] = path_choice
			for i, nav in pairs(NAV_STORE[path_choice]) do
				thread_yield()
				move_to(npc, nav, 2, true, false)
				turn_to(npc, nav, true)
				if(speak_delay <= 0) then
					audio_play_persona_line(npc, POT_SITUATIONS[POT_CUSTOM_1][1])
					speak_delay = rand_int(6,9)
				end
				force_melee(npc, 2)
				delay(1)
				if not character_is_dead(CHAR_LT_STORE) then
					Store_total_damage = Store_total_damage + STORE_DAMAGE_AMOUNT
				end
				speak_delay = speak_delay - 2
			end
		end
	end
end

function bh07_store_mayhem_choice_being_used(choice)
	for i, used_choice in pairs(Store_mayhem_choice) do
		if used_choice == choice then
			return true
		end
	end
	return false
end

function bh07_shop_owner()
	--on_death("bh07_failure_shop_owner_died", CHAR_CLERK_STORE)

	local shop_owner_initial_health = get_current_hit_points(CHAR_CLERK_STORE)
	local increased_health = shop_owner_initial_health * 3
	set_max_hit_points(CHAR_CLERK_STORE, increased_health)
	set_current_hit_points(CHAR_CLERK_STORE, increased_health)

	delay(3)
	mission_help_table(TEXT_SAVE_SHOP_OWNER)
	--damage_indicator_on(0, CHAR_CLERK_STORE, 0, TEXT_SHOP_OWNER_HEALTH)

	for i, npc in pairs(CHAR_CLERKBEATERS_STORE) do
		inv_item_remove_all(npc)
		set_attack_player_flag(npc, false)
		npc_weapon_pickup_override(npc, false)
		character_set_cannot_wield_havok_weapon(npc, true)
		attack(npc, CHAR_CLERK_STORE)
	end
	set_attack_player_flag(CHAR_CLERK_STORE, false)

	local attacking_player = false
	local unattacked_time = 0
	local hit_points = {}
	for j, lnpc in pairs(CHAR_CLERKBEATERS_STORE) do
		hit_points[j] = get_current_hit_points(lnpc)
	end

	while bh07_shop_owner_in_danger() do
		thread_yield()

		if not attacking_player then

			bh07_shop_owner_attack_owner()
			for i, npc in pairs(CHAR_CLERKBEATERS_STORE) do
				if not character_is_dead(npc) and (get_current_hit_points(npc) - hit_points[i]) < -50 then
					attacking_player = true
					bh07_shop_owner_attack_player()
					for j, lnpc in pairs(CHAR_CLERKBEATERS_STORE) do
						hit_points[j] = get_current_hit_points(lnpc)
					end
					break
				end
			end

		else

			local unattacked = true
			for i, npc in pairs(CHAR_CLERKBEATERS_STORE) do
				if (get_current_hit_points(npc) - hit_points[i]) < -50 then
					unattacked_time = 0
					unattacked = false
					for j, lnpc in pairs(CHAR_CLERKBEATERS_STORE) do
						hit_points[j] = get_current_hit_points(lnpc)
					end
					break
				end
			end

			if unattacked then
				unattacked_time = unattacked_time + get_frame_time()
			end

			if unattacked_time >= 15 then
				bh07_shop_owner_attack_owner()
				attacking_player = false
				for j, lnpc in pairs(CHAR_CLERKBEATERS_STORE) do
					hit_points[j] = get_current_hit_points(lnpc)
				end
			end
		end
	end
	--damage_indicator_off(0)
end

function bh07_shop_owner_in_danger()
	for i, npc in pairs(CHAR_CLERKBEATERS_STORE) do
		if not character_is_dead(npc) then
			return true
		end
	end
	return false
end

function bh07_shop_owner_attack_player()
	for i, npc in pairs(CHAR_CLERKBEATERS_STORE) do
		set_attack_player_flag(npc, true)
		local dist, closest_player = get_dist_closest_player_to_object(npc)
		attack(npc, closest_player)
	end
end

function bh07_shop_owner_attack_owner()
	for i, npc in pairs(CHAR_CLERKBEATERS_STORE) do
		set_attack_player_flag(npc, false)
		attack(npc, CHAR_CLERK_STORE)
	end
end

function bh07_the_coordinator()
	marker_add_navpoint(NAV_OBJ_COORD, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL)
	bh07_wait_to_spawn_objective(NAV_OBJ_COORD, COORD_SPAWN_RADIUS)

	group_create(GROUP_COORDINATOR, true)
	if IN_COOP then
		group_create(GROUP_COORDINATOR_COOP, true)
	end

	marker_add_npc(CHAR_LT_COORD, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL)
	marker_remove_navpoint(NAV_OBJ_COORD, SYNC_ALL)
	on_death("bh07_lieutenant_killed", CHAR_LT_COORD)
	thread_yield()

	for i, npc in pairs(CHAR_ALL_COORD) do
		on_damage("bh07_coord_flee", npc, 0.90)
	end

	if IN_COOP then
		for i, npc in pairs(CHAR_ALL_COORD_COOP) do
			on_damage("bh07_coord_flee", npc, 0.90)
		end
	end

	mission_help_table(TEXT_MEETING_LT)

	while not character_is_dead(CHAR_LT_COORD) do
		thread_yield()
	end

	Bh07_checkpoint_coordinator_complete = true
	if bh07_more_objectives_remain() then
		mission_set_checkpoint(CHECKPOINT_COORDINATOR)
		if (Lieutenants_killed == INITIAL_NUM_LIEUTENANTS - 1) then
			mission_help_table(TEXT_REMAINING_LT)
		else
			mission_help_table(TEXT_KILL_REMAINING_LTS)
		end
	end

	marker_remove_npc(CHAR_LT_COORD, SYNC_ALL)
end

function bh07_coord_flee()
	for i, npc in pairs(CHAR_ALL_COORD) do
		on_damage("", npc, 0.90)
	end

	if IN_COOP then
		for i, npc in pairs(CHAR_ALL_COORD_COOP) do
			on_damage("", npc, 0.90)
		end
	end

	set_ignore_ai_flag(CHAR_LT_COORD, true)
	vehicle_enter(CHAR_LT_COORD, VEH_COORD)
	vehicle_disable_chase(VEH_COORD, true)
	while not character_is_in_vehicle(CHAR_LT_COORD, VEH_COORD) do
		thread_yield()
	end

	mission_help_table(TEXT_KILL_FLEEING_LT)

	set_unjackable_flag(VEH_COORD, true)
	vehicle_suppress_npc_exit(VEH_COORD, true)
	vehicle_set_crazy(VEH_COORD, true)
	on_vehicle_destroyed("bh07_kill_flee_thread", VEH_COORD)
	THREAD_COORD_FLEE = thread_new("bh07_coord_vehicle_flee")
end

function bh07_coord_vehicle_flee()
	vehicle_speed_override(VEH_COORD, 50)
	vehicle_pathfind_to(VEH_COORD, NAV_COORD_FLEE_PATH, true, false, false)
	delay(4)
	vehicle_pathfind_to(VEH_COORD, NAV_COORD_FLEE_GROUND, true, false, false)
	local dist, closest_player = get_dist_closest_player_to_object(VEH_COORD)
	vehicle_flee(VEH_COORD, closest_player)
end

function bh07_kill_flee_thread()
	if THREAD_COORD_FLEE ~= -1 then
		thread_kill(THREAD_COORD_FLEE)
	end
end

function bh07_more_objectives_remain()
	return not (Bh07_checkpoint_firebombers_complete and Bh07_checkpoint_swat_complete and	Bh07_checkpoint_store_complete and Bh07_checkpoint_coordinator_complete)
end

function bh07_lieutenant_killed()
	Lieutenants_killed = Lieutenants_killed + 1
	bh07_show_lieutenant_counter()
	if(Lieutenants_killed < INITIAL_NUM_LIEUTENANTS) then
		bh07_raise_notoriety()
	else
		delay(3)
		bh07_success_all_lieutenants_killed()
	end
end

function bh07_raise_notoriety()
	notoriety_set_max("Brotherhood", min(Lieutenants_killed + 1, 3))
	notoriety_set("Brotherhood", min(Lieutenants_killed + 1, 3))
	notoriety_set_min("Brotherhood", min(Lieutenants_killed + 1, 3))
end

function bh07_notoriety()
	local phase_time = 0
	while(1) do
		thread_yield()
		phase_time = 0
		while (true) do
			thread_yield()
			local current_notoriety = notoriety_get_decimal("Brotherhood")
			local target_notoriety = Lieutenants_killed + 1.0
			phase_time = phase_time + get_frame_time()
			local pct = phase_time / 30
			local new_notoriety = pct * target_notoriety
			if new_notoriety > target_notoriety then
				new_notoriety = target_notoriety
			end
			if (new_notoriety > current_notoriety) then
				notoriety_set_min("Brotherhood", new_notoriety)
				notoriety_set("Brotherhood", new_notoriety)
			end
		end
	end
end

function bh07_success_all_lieutenants_killed()
	delay(3)
	mission_end_success(MISSION_NAME, CUTSCENE_OUT)
end

function bh07_failure_shop_owner_died()
	mission_end_failure(MISSION_NAME, TEXT_SHOP_OWNER_DIED)
end

function bh07_failure_store_damage()
	mission_end_failure(MISSION_NAME, TEXT_TOO_MUCH_DAMAGE)
end

function bh07_cleanup()

	if ( vehicle_exists(VEH_FIREBOMBER) and not vehicle_is_destroyed(VEH_FIREBOMBER) ) then
		vehicle_prevent_explosion_fling(VEH_FIREBOMBER, false)
		vehicle_infinite_mass(VEH_FIREBOMBER, false)
			
	end

	-- Cleanup mission here

	marker_remove_navpoint(NAV_OBJ_FIREBOMBERS)
	marker_remove_navpoint(NAV_OBJ_PRISONERS)
	marker_remove_navpoint(NAV_OBJ_STORE)
	marker_remove_navpoint(NAV_OBJ_COORD)
	
	for i,trigger in pairs (TRIGGER_STORE_ENTRANCES) do
		on_trigger("", trigger)
		trigger_enable(trigger, false)
	end

	for i, thread in pairs(ALL_THREADS) do
		if thread ~= -1 then
			thread_kill(thread)
		end
	end

	objective_text_clear(1)
	damage_indicator_off(0)

	mission_waypoint_remove(SYNC_ALL)

	trigger_type_enable("liquor store", true)

	bh07_stop_persona_overrides()

end

function bh07_success()
	-- Called when the mission has ended with success
--	bink_play_movie(CUTSCENE_OUT)
end
