-- rn11.lua
-- SR2 mission script
-- 3/28/07

-- Cutscene crash fixes by IdolNinja
-- 3/11/2011


-- Global constants (All caps == GLOBAL CONSTANT)
--[[	In general, shouldn't be modified in running code, except for maybe in a setup function )

]]

	-- DEBUG FLAGS
	DEBUG_START_AT_FESTIVAL		= false
	DEBUG_START_AT_JUNKS			= false
	DEBUG_START_AT_CUTSCENE_2	= false
	DEBUG_EFFECTS					= false

	-- EFFECTS 
	JUNK_BOAT_FIRE_EFFECTS = 
	{
		["mission_ro11_flr_4x4"] = -- Large fire to be placed on floor, to be used with sticky fire
		{
			"rn11_$boat1_fire_main1", "rn11_$boat1_fire_main2", 
			"rn11_$boat1_fire_main3", "rn11_$boat1_fire_main4",
			"rn11_$boat2_fire_main1", "rn11_$boat2_fire_main2",
			"rn11_$boat2_fire_main3", "rn11_$boat2_fire_main4",
			"rn11_$boat2_fire_main5",
		},
		["fire_sticky"] = -- Large fire effect with light; don't use too much
		{
			"rn11_$n100"
		},
--[[
		["fire_sticky_sm"] = -- Smaller fire
		{
			"rn11_$boat1_fire_side1-1", "rn11_$boat1_fire_side1-2", 
			"rn11_$boat1_fire_side2-1", "rn11_$boat1_fire_side2-2",
			"rn11_$boat1_fire_side3-1", "rn11_$boat1_fire_side3-2",
			"rn11_$boat1_fire_side4-1", "rn11_$boat1_fire_side4-2",
			"rn11_$boat2_fire_side1-1", "rn11_$boat2_fire_side1-2", 
			"rn11_$boat2_fire_side2-1", "rn11_$boat2_fire_side2-2",
			"rn11_$boat2_fire_side3-1", "rn11_$boat2_fire_side3-2",
			"rn11_$boat2_fire_side4-1", "rn11_$boat2_fire_side4-2",
			"rn11_$boat2_fire_side5-1", "rn11_$boat2_fire_side5-2",
		},
		["fire_sticky_sm02"] = -- Smallest fire
		{
			"rn11_$n102"
		},
		["mission_ro11_clmn_fire"] = -- Fire to be placed at the base of a column
		{
			"rn11_$boat1_fire_column1", "rn11_$boat1_fire_column2", 
			"rn11_$boat1_fire_column3", "rn11_$boat1_fire_column4",
			"rn11_$boat2_fire_column1", "rn11_$boat2_fire_column2",
			"rn11_$boat2_fire_column3", "rn11_$boat2_fire_column4"
			--removed to reduce particle effect numbers: 
		},
		["mission_ro11_brdr_fire"] = --Fire on the top of junks
		{
			"rn11_$boat1_fire_brdr"
			--removed to reduce particle effect numbers:  "rn11_$boat2_fire_brdr"
		},
		["fire_flame_window"] = --Fire that goes on the junk windows
		{
			"rn11_$boat1_fire_win_1", "rn11_$boat1_fire_win_4", 
			"rn11_$boat2_fire_win_2", "rn11_$boat2_fire_win_3", 
			--removed to reduce particle effect numbers: "rn11_$boat1_fire_win_2", "rn11_$boat1_fire_win_3", "rn11_$boat2_fire_win_1", "rn11_$boat2_fire_win_4"
		},
		["mission_ro11_mast_fire"] = -- Fire that burns on the mast and sails
		{
			"rn11_$boat1_fire_mast"
			--removed to reduce particle effect numbers:  "rn11_$boat2_fire_mast"
		},
		["fire_flame_sky_debris"] = -- Fire that drops debris from sky, placed 8-10 meters above heads and boats
		{
			"rn11_$boat1_fire_sky"
			--removed to reduce particle effect numbers:  "rn11_$boat2_fire_sky"
		},
		["fire_ash_md"] = -- Falling ash to be palced above the boats
		{
			"rn11_$boat1_ash", "rn11_$boat2_ash"
			--removed to reduce particle effect numbers: 
		},
		["mission_ro11_bm_fire"] = -- Beam explosion and falling with wood on fire
		{
			"rn11_$n098"
		},
]]
	}

	-- Coop mission?
	IN_COOP	= false

	-- GROUPS --
		GROUP_START_CAR			= "rn11_$Gstart_car"
		GROUP_START_CAR_COOP		= "rn11_$Gstart_car_coop"
		GROUP_WATERCRAFT			= "rn11_$Gwatercraft"
		GROUP_LIEUTENANTS			= "rn11_$Glieutenants"
		GROUP_JUNK					= "rn11_$Gjunk"
		GROUP_JUNK_COOP			= "rn11_$Gjunk_coop"
		GROUP_AKUJI_AND_WONG		= "rn11_$akuji_and_wong"
		GROUP_CTE_AKUJI			= "rn11_$CTE_Gakuji"

	-- GROUP MEMBER TABLES -- 
	
		MEMBERS_GROUP_LIEUTENANTS	=	{	"rn11_$c000", "rn11_$c001", "rn11_$c002", "rn11_$c003", "rn11_$c004",
													"rn11_$c005", "rn11_$c006", "rn11_$c007", "rn11_$c008", "rn11_$c009",
													"rn11_$c010", "rn11_$c011", "rn11_$c012", "rn11_$c013", "rn11_$c014",
													"rn11_$c015", "rn11_$c016", "rn11_$c017", "rn11_$c018", "rn11_$c019"}

		MEMBERS_GROUP_JUNK			=	{	"rn11_$c020", "rn11_$c021", "rn11_$c022", "rn11_$c023", "rn11_$c024",
													"rn11_$c025", "rn11_$c027", "rn11_$c028", "rn11_$c029", "rn11_$c030",
													"rn11_$c031", "rn11_$c032", "rn11_$c033", "rn11_$c034", "rn11_$c035",
													"rn11_$c036", "rn11_$c037", "rn11_$c038", "rn11_$c039"}
											
		MEMBERS_GROUP_JUNK_COOP		=	{	"rn11_$c040", "rn11_$c041", "rn11_$c042"}

	-- TRIGGERS -- 
		TRIGGER_DOCK					= "rn11_$Tdock"
		TRIGGER_FESTIVAL_ARRIVAL	= "rn11_$Tfestival_arrival"
		TRIGGER_JUNK_AREA				= "rn11_$Tjunk_area"
		TRIGGER_AKUJI					= "rn11_$Takuji"

		-- List of all triggers, makes cleaning up more convenient
		TABLE_ALL_TRIGGERS		= {	TRIGGER_DOCK, TRIGGER_FESTIVAL_ARRIVAL, TRIGGER_JUNK_AREA, TRIGGER_AKUJI}		

	-- VEHICLES --
		VEHICLE_WAVERUNNER		= "rn11_$Vwavecraft"
		VEHICLE_SPEEDBOAT1		= "rn11_$Vspeedboat1"
		VEHICLE_SPEEDBOAT2		= "rn11_$Vspeedboat2"

	-- CHARACTERS --
		CHARACTER_SPEEDBOAT1_DRIVER		= "rn11_$Cspeedboat1_driver"
		CHARACTER_SPEEDBOAT2_DRIVER		= "rn11_$Cspeedboat2_driver"
		CHARACTER_SPEEDBOAT1_RPG			= "rn11_$Cspeedboat1_rpg"
		CHARACTER_SPEEDBOAT2_RPG			= "rn11_$Cspeedboat2_rpg"

		CHARACTER_AKUJI						= "rn11_$Cakuji"
		CHARACTER_WONG							= "rn11_$Cwong"

	-- NAVPOINTS

		-- the mission start locations
		NAVPOINT_LOCAL_PLAYER_START					= "mission_start_sr2_city_$rn11"
		NAVPOINT_REMOTE_PLAYER_START					= "rn11_$Nremote_player_start"

		NAVPOINT_LOCAL_PLAYER_START_CHECKPOINT_1	= "rn11_$Nlocal_start_checkpoint_1"
		NAVPOINT_REMOTE_PLAYER_START_CHECKPOINT_1	= "rn11_$Nremote_start_checkpoint_1"

		NAVPOINT_LOCAL_PLAYER_START_CHECKPOINT_2	= "rn11_$Nlocal_start_checkpoint_2"
		NAVPOINT_REMOTE_PLAYER_START_CHECKPOINT_2	= "rn11_$Nremote_start_checkpoint_2"

		NAVPOINT_LOCAL_PLAYER_START_CHECKPOINT_3	= "rn11_$Nlocal_start_checkpoint_3"
		NAVPOINT_REMOTE_PLAYER_START_CHECKPOINT_3	= "rn11_$Nremote_start_checkpoint_3"

		NAVPOINT_LOCAL_PLAYER_START_AKUJI			= "rn11_$Nlocal_start_akuji"
		NAVPOINT_REMOTE_PLAYER_START_AKUJI			= "rn11_$Nremote_start_akuji"

		NAVPOINT_HELI_START								= "rn11_$Nheli_start"

		ATTACK_HELI_SPAWN_LOCATIONS = 
		{
			"rn11_$n103", "rn11_$n104", "rn11_$n105", "rn11_$n106", "rn11_$n107"
		}

		FESTIVAL_NAVPOINTS	=	{	"rn11_$nfestival_000", "rn11_$nfestival_001", "rn11_$nfestival_002",
											"rn11_$nfestival_003", "rn11_$nfestival_004", "rn11_$nfestival_005",
											"rn11_$nfestival_006", "rn11_$nfestival_007", "rn11_$nfestival_008",
											"rn11_$nfestival_009", "rn11_$nfestival_010", "rn11_$nfestival_011",
											"rn11_$nfestival_012"}

		FESTIVAL_SPAWN_NAVPOINTS_PER_AREA = 5
		FESTIVAL_SPAWN_LOCATIONS = 
			{	
				{"rn11_$n043", "rn11_$n044", "rn11_$n045", "rn11_$n046", "rn11_$n047"};
				{"rn11_$n048", "rn11_$n049", "rn11_$n050", "rn11_$n051", "rn11_$n052"};
				{"rn11_$n053", "rn11_$n054", "rn11_$n055", "rn11_$n056", "rn11_$n057"};
				{"rn11_$n058", "rn11_$n059", "rn11_$n060", "rn11_$n061", "rn11_$n062"};
				{"rn11_$n063", "rn11_$n064", "rn11_$n065", "rn11_$n066", "rn11_$n067"};				
				{"rn11_$n068", "rn11_$n069", "rn11_$n070", "rn11_$n071", "rn11_$n072"};
				{"rn11_$n073", "rn11_$n074", "rn11_$n075", "rn11_$n076", "rn11_$n077"};
				{"rn11_$n078", "rn11_$n079", "rn11_$n080", "rn11_$n081", "rn11_$n082"};
				{"rn11_$n083", "rn11_$n084", "rn11_$n085", "rn11_$n086", "rn11_$n087"};				
			}

		NAVPOINT_MOLOTOV_TARGET	=	"rn11_$Nmolotov_target"


		FIRE_EFFECTS			= {	"fire_sticky_sm02", "fire_sticky_sm", "fire_sticky"}
		FIRE_EXPLOSIONS		= {	"Big Bang", "Gas Exp Medium", "Molotov Explosion", "Satchel"}

		HELI_FLEE_PATH = 
			{ "rn11_$n088", "rn11_$n089", "rn11_$n090", "rn11_$n091" }
		HELI_FLEE_CIRCLE_PATH = 
			{ "rn11_$n089", "rn11_$n090", "rn11_$n091" }

		-- TEMP .. test effects
		--for i, effect in pairs(effects) do
		--	local handle_most_significant,handle_least_significant = effect_play(effect,"mission_start_sr2_city_$rn11",true)
		--	mission_help_table("Playing " .. effect)
		--	delay(6.0)
		--	effect_stop(handle_most_significant, handle_least_significant)
		--	delay(1.0)
		--end

	-- MOVERS

	-- HELPTEXT

		-- localized helptext messages
			HELPTEXT_FAILURE_DOCK				= "rn11_failure_dock"			-- ## The Ronin got away!
			HELPTEXT_FAILURE_FOLLOW				= "rn11_failure_follow"			-- ## You let them get away!
			HELPTEXT_FAILURE_WONG				= "rn11_failure_wong"			-- ## You let Wong die!

			HELPTEXT_HUD_WONG_HEALTH			= "rn11_hud_wong_health"		-- ## Wong's Health

			HELPTEXT_OBJECTIVE_LIEUTENANTS	= "rn08_objective_ronin"		

			HELPTEXT_PROMPT_FESTIVAL			= "rn11_prompt_festival"		-- ## Head to the <teal>Heritage Festival</teal>.
			HELPTEXT_PROMPT_FOLLOW				= "rn11_prompt_follow"			-- ## Don't let the boat get to the Heritage Festival!
			HELPTEXT_PROMPT_GET_CLOSER			= "rn11_prompt_get_closer"    -- ## Get closer, the Ronin are escpaing.
			HELPTEXT_PROMPT_JUNK					= "rn11_prompt_junk"				-- ## Get on the junk boats and save Wong before he dies!
			HELPTEXT_PROMPT_LIEUTENANTS		= "rn11_prompt_lieutenants"	-- ## Dock the boat and kill the Ronin lieutenants!
			HELPTEXT_PROMPT_LOCATION_DOCK		= "rn11_prompt_location_dock" -- ## Drive to the dock before the Ronin get away!
			HELPTEXT_PROMPT_MASSACRE			= "rn11_prompt_massacre"		-- ## The ronin are killing civilians.
			HELPTEXT_PROMPT_WAVERUNNER			= "rn11_prompt_waverunner"		-- ## Get in the waverunner
			HELPTEXT_PROMPT_WARN_DIST			= "rn11_prompt_warn_dist"		-- ## The boat is getting away!

		-- helptext messages that need to be localized

		-- helptext messages that need to be fixed
			HELPTEXT_HUD_AKUJI_HEALTH			= "rn11_hud_akuji_health"		-- ## Wong's Health

	-- CHECKPOINTS
		
		CHECKPOINT_START							= MISSION_START_CHECKPOINT -- defined in ug_lib.lua
		CHECKPOINT_FESTIVAL						= "rn11_checkpoint_festival"
		CHECKPOINT_JUNKS							= "rn11_checkpoint_junks"
		CHECKPOINT_AKUJI							= "rn11_checkpoint_akuji"
	
	-- MISC CONSTANTS
	
		INVALID_INDEX								= 0	-- Represents an invalid array index

		TIME_OF_DAY_HOUR							= 20;
		TIME_OF_DAY_MINUTE						= 30;

		-- Stage 1: Go to dock
		ALLOWED_TIME_TO_DOCK_MS					= 1 * 75 * 1000
		ALLOWED_TIME_TO_FESTIVAL_MS			= 4 * 60 * 1000

		-- OLD Stage 2: Boat chase/ fight
		SPEEDBOAT_INITIAL_SPEED_MPH			= 30
		SPEEDBOAT_INITIAL_SPEED_TIME_S		= 6
		SPEEDBOAT_SLOW_SPEED_MPH				= 20
		SPEEDBOAT_FAST_SPEED_MPH				= 60
		SPEEDBOAT_CLOSE_RANGE_M					= 75
		SPEEDBOAT_FOLLOW_FAIL_TIME_S			= 20
		WAVERUNNER_MAX_SPEED						= 70
		WAVERUNNER_HIT_POINTS					= 20000

		-- Stage 3: Heritage Festival Battle

		RONIN_ATTACK_PERSONAS =
		{
			["AM_Ron2"]	=	"AMRON2",

			["AF_Ron1"]	=	"AFRON1",
			["AF_Ron3"]	=	"AFRON3",

			["WM_Ron1"]	=	"WMRON1",

			["WF_Ron1"]	=	"WFRON1",
			["WF_Ron2"]	=	"WFRON2",
		}

		RONIN_RESPAWN_TIME_MS					= 500  -- Time in MS before respawning
		RONIN_RESPAWN_DISTANCE					= 0.01
		
		LIEUTENANTS_TO_KILL					= 20-- # LTNTS that the player(s) need to kill
		MAX_LIEUTENANTS_ATTACKING			= 8	-- Max # of ltnts. attacking at any time.
		WAVE_MIN_SIZE							= 2	-- Min size of Wave
		WAVE_MAX_SIZE							= 4	-- Max size of Wave
		WAVE_CLUMPING_FACTOR					= 0.8	-- In (0,1), higher -> increased chance for Ronin to spawn near each other.

		PED_SPAWNING_DISABLE_RATIO			= 0.4	-- When ltnts killed / kills needed reaches this level, ped spawning is diabled
		ATTACK_PLAYER_ONLY_RATIO			= 0.5 -- When ltnts killed / kills needed reaches this level, ltnts always attack the player.

		-- Stage 4: Junk-Boat Fight
		WONG_SURVIVAL_TICKS			=	20		-- the number of times Wong takes damage before dying
		WONG_SURVIVAL_TIME_S			=	125		-- the amount of time Wong survives before dying
		COOP_HP_MULTIPLIER			=  1.25  -- factor applied to Ronin in coop

		-- Stage 5: Akuji Boss Battle
		AKUJI_HIT_POINTS						= 2500
		AKUJI_HIT_POINTS_COOP				= 2000
		AKUJI_PASSED_OUT_TIME_S				= 10	-- Time Akuji is vulnerable to finishers before he revives
		AKUJI_REVIVE_PERCENT					= .50 -- Amount of health Akuji revives with
		
		--Flags for when to use GPS
		GPS_TO_WATERCRAFT			= true
		GPS_TO_FESTIVAL				= true
		GPS_TO_AKUJI				= false
	
-- Global Variables (First letter caps == Global Variable)

	-- THREADS
	Thread_speedboat1					= -1
	Thread_speedboat2					= -1
	Thread_speedboat_throttle		= -1
	Thread_wong_health				= -1
	Table_all_threads					= {	Thread_speedboat1, Thread_speedboat2, Thread_speedboat_throttle, Thread_wong_health}

	-- Progress flags
	Waverunner_entered				= false -- Players have entered the waverunner?
	rn11_speedboat1_disabled		= false -- Speedboat1 or its driver destroyed/killed?
	rn11_speedboat2_disabled		= false -- Speedboat2 or its driver destroyed/killed?
	Festival_reached					= false
	Junk_area_reached					= false -- Player passed near junk boats, Wong's health can drop when true
	Wong_tick_next						= false -- Time to apply next tick of damage?
	--Akuji_reached						= false -- Player(s) arrived at Akuji?
	Sword_loaned						= false -- Players given temporary swords?
	Akuji_revived						= false

	Rn11_location_reached = false

	-- Have to define this function here so it can be used to initialize a global variable
	function rn11_table_copy(source)
		local table_copy = {}
		for i,entry in pairs(source) do
			table_copy[i] = entry
		end
		return table_copy
	end

	Spawnable_ronin = {}
	Spawn_locations_next_navpoint_index	= {}
	Lieutenant_completion_ratio = 0.001			-- We divide things by this so don't start it at 0.

	Effect_handles = {}

-- TEMPORARY Global Variables

	Debug_ltnt_quick_kill			= false

-- DEBUG FUNCTIONS ------------------------------------------

-- CUTSCENES --
-- Added by IdolNinja. These variables are used in the script for the cutscenes for stability instead of calling them directly

CUTSCENE_IN = 		"ro11-01"
CUTSCENE_OUT = 		"ro11-02"
MISSION_NAME =		"rn11"

function rn11_debug_festival_battle()

	teleport(LOCAL_PLAYER, NAVPOINT_MOLOTOV_TARGET)
	delay(8.0)

	-- Turn off notoriety spawns, ambient spawns at this point
	notoriety_force_no_spawn("Ronin", true) 
	ambient_gang_spawn_enable(false)

	-- low ped density
	--set_ped_density(0.0001)

	rn11_festival_battle()

	rn11_complete()

end

function rn11_debug_junks()

	teleport(LOCAL_PLAYER, NAVPOINT_MOLOTOV_TARGET)
	delay(8.0)

	cutscene_play("IG_rn11_scene1", GROUP_JUNK)
	group_show(GROUP_JUNK)

	Thread_wong_health = thread_new("rn11_display_wong_health")	

	rn11_send_to_location(TRIGGER_AKUJI, INGAME_EFFECT_LOCATION, HELPTEXT_PROMPT_JUNK, GPS_TO_AUKJI)

	-- Ensure that Wong's health is no longer displayed
	thread_kill(Thread_wong_health)
	hud_bar_off(0)

	-- Akuji boss battle checkpoint
	mission_set_checkpoint(CHECKPOINT_AKUJI)
	rn11_checkpoint = CHECKPOINT_AKUJI

	rn11_complete()

end

function rn11_debug_cutscene()

	cutscene_in()

	-- Disable player controls
	player_controls_disable(LOCAL_PLAYER)
	if (IN_COOP) then
		player_controls_disable(REMOTE_PLAYER)
	end

	-- Remove the players from any vehicles before starting the boss fight
	if (character_is_in_vehicle(LOCAL_PLAYER)) then
		vehicle_exit_teleport(LOCAL_PLAYER)
	end		
	if (IN_COOP and character_is_in_vehicle(REMOTE_PLAYER)) then
		vehicle_exit_teleport(REMOTE_PLAYER)
	end

	spawning_pedestrians(false)
	spawning_vehicles(false)

	cutscene_play("IG_rn11_scene2", nil, {NAVPOINT_LOCAL_PLAYER_START_AKUJI, NAVPOINT_REMOTE_PLAYER_START_AKUJI}, false )

	-- Set Akuji's hit points, display his health bar
	inv_item_remove_all(CHARACTER_AKUJI)
	set_max_hit_points(CHARACTER_AKUJI,AKUJI_HIT_POINTS)
	on_death("rn11_complete", CHARACTER_AKUJI)
	damage_indicator_on(0, CHARACTER_AKUJI,0.0, HELPTEXT_HUD_AKUJI_HEALTH)
	npc_set_boss_type(CHARACTER_AKUJI, AI_BOSS_AKUJI)

	inv_item_add("samurai_sword", 1, CHARACTER_AKUJI)
	inv_item_equip("samurai_sword",CHARACTER_AKUJI)

	marker_add_npc(CHARACTER_AKUJI, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL)

	-- Give the players swords
	inv_weapon_add_temporary(LOCAL_PLAYER, "samurai_sword", 1, true)
	inv_item_equip("samurai_sword",LOCAL_PLAYER)
	if (IN_COOP) then
		inv_weapon_add_temporary(REMOTE_PLAYER, "samurai_sword", 1, true)
		inv_item_equip("samurai_sword",REMOTE_PLAYER)
	end
	Sword_loaned	= true
	party_use_melee_weapons_only(true)

	cutscene_out()

	-- Reenable player controls
	player_controls_enable(LOCAL_PLAYER)
	if (IN_COOP) then
		player_controls_enable(REMOTE_PLAYER)
	end

	-- Have Akuji attack
	npc_combat_enable(CHARACTER_WONG, false)
	attack(CHARACTER_AKUJI, LOCAL_PLAYER)

	delay(120)

	rn11_complete()

end

Rn11_junk_fire_start_thread = INVALID_THREAD_HANDLE
function rn11_start_junk_fire()

	if (Rn11_junk_fire_start_thread ~= INVALID_THREAD_HANDLE) then
		if (not thread_check_done(Rn11_junk_fire_start_thread)) then
			return
		end
	end

	Rn11_junk_fire_start_thread = thread_new("rn11_start_junk_fire_do")

end

function rn11_start_junk_fire_do()

	-- Delay so that effects stopped by other systems have time to die
	delay(1.0)

	-- Stop any currently playing fires
	for i, effect_handle in pairs(Effect_handles) do
		effect_stop(effect_handle)
	end

	-- Wait for the effects to die
	delay(1.0)

	-- Play new effects
	for effect, navpoints in pairs(JUNK_BOAT_FIRE_EFFECTS) do

		for i, navpoint in pairs(navpoints) do
			Effect_handles[navpoint] = effect_play(effect,navpoint,true)
		end

	end

end

-- REQUIRED MISSION FUNCTIONS -------------------------------

-- Called when the mission starts
function rn11_start(rn11_checkpoint, is_restart)

	-- The player is being respawned inside of the not-yet-loaded junk boats. This looks bad, so just
	-- fadeout immediately.
	if (rn11_checkpoint == CHECKPOINT_AKUJI) then
		fade_out(0)
	end
	mission_start_fade_out()

	if (rn11_checkpoint == CHECKPOINT_START) then

		-- Determine which groups we need to load
		local start_groups = {GROUP_START_CAR, GROUP_WATERCRAFT}
		if (coop_is_active()) then
			start_groups = {GROUP_START_CAR, GROUP_WATERCRAFT, GROUP_START_CAR_COOP}
		end

		-- If it is a restart then teleport players to the start location and create the starting groups
		if (is_restart) then
			for i,group in pairs(start_groups) do
				group_create(group,true)
			end
			teleport_coop(NAVPOINT_LOCAL_PLAYER_START, NAVPOINT_REMOTE_PLAYER_START)
		-- Else, play the cutscene then show the starting groups
		else
			cutscene_play(CUTSCENE_IN, start_groups, {NAVPOINT_LOCAL_PLAYER_START, NAVPOINT_REMOTE_PLAYER_START}, false)
			for i,group in pairs(start_groups) do
				group_show(group)
			end
		end
	end

	rn11_initialize(rn11_checkpoint)
	
	if (DEBUG_START_AT_FESTIVAL) then
		rn11_debug_festival_battle()
		delay(5.0)
	end

	if (DEBUG_START_AT_JUNKS) then
		rn11_debug_junks()
		delay(5.0)
	end

	if (DEBUG_START_AT_CUTSCENE_2) then
		rn11_debug_cutscene()
	end

	if (rn11_checkpoint == CHECKPOINT_START) then
		rn11_send_to_festival()

		mission_set_checkpoint(CHECKPOINT_FESTIVAL)
		rn11_checkpoint = CHECKPOINT_FESTIVAL

		-- Load junk boat ronin now, adjust health
		rn11_group_create_hidden_maybe_coop(GROUP_JUNK, GROUP_JUNK_COOP)
		rn11_adjust_hp_for_coop(MEMBERS_GROUP_JUNK)

	end 
	
	if (rn11_checkpoint == CHECKPOINT_FESTIVAL) then
		rn11_clear_lieutenants()

		mission_set_checkpoint(CHECKPOINT_JUNKS)
		rn11_checkpoint = CHECKPOINT_JUNKS

	end

	if (rn11_checkpoint == CHECKPOINT_JUNKS) then
		rn11_find_akuji_and_wong()

		mission_set_checkpoint(CHECKPOINT_AKUJI)
		rn11_checkpoint = CHECKPOINT_AKUJI

		-- Initialize next checkpoint
		rn11_initialize_checkpoint(CHECKPOINT_AKUJI)
	end

	rn11_akuji_boss_fight()
end

function rn11_initialize(checkpoint)

	-- Do initialization common to all checkpoints
	rn11_initialize_common()

	-- Do checkpoint-specific initialization
	rn11_initialize_checkpoint(checkpoint)

	-- When starting from the Akuji checkpoint, let the cutscene do the fade-in.
	if (checkpoint == CHECKPOINT_AKUJI) then
		player_controls_enable(LOCAL_PLAYER)
		if(IN_COOP) then
			player_controls_enable(REMOTE_PLAYER)
		end
	else
		mission_start_fade_in()
	end

end

function rn11_initialize_common()

	set_mission_author("Phillip Alexander")

	if (coop_is_active()) then
		IN_COOP	= true
		rn11_table_concat(MEMBERS_GROUP_JUNK, MEMBERS_GROUP_JUNK_COOP)
	end

	-- Swap out the normal chunk w/ the festival chunk:
	city_chunk_swap("sr2_chunk179", "festival", false, true, true)
	city_chunk_swap("sr2_intmamis3junksempty", "festival", true, true, true)

	-- Set notoriety  min/max
	notoriety_set_min("Ronin",4)
	notoriety_set_max("Ronin",4)
	notoriety_set("Ronin",4)

	-- Set time of day to dusk3
	set_time_of_day(TIME_OF_DAY_HOUR,TIME_OF_DAY_MINUTE)

end

function rn11_initialize_checkpoint(checkpoint)

	if (checkpoint ~= CHECKPOINT_START) then
	
		-- Start the junk boat fire
		rn11_start_junk_fire()

		-- Turn off notoriety spawns, ambient spawns at this point
		notoriety_force_no_spawn("Ronin", true) 
		ambient_gang_spawn_enable(false)
		
	end
	
	if (checkpoint == CHECKPOINT_FESTIVAL) then

		group_create(GROUP_LIEUTENANTS, true)

		-- Load junk boat ronin now, adjust health
		rn11_group_create_hidden_maybe_coop(GROUP_JUNK, GROUP_JUNK_COOP)
		rn11_adjust_hp_for_coop(MEMBERS_GROUP_JUNK)

	end

	if (checkpoint == CHECKPOINT_JUNKS) then
		rn11_group_create_maybe_coop(GROUP_JUNK, GROUP_JUNK_COOP)
		rn11_adjust_hp_for_coop(MEMBERS_GROUP_JUNK)
	end

end

function rn11_send_to_festival()

	thread_new("rn11_create_lieutenants")

	-- Make the waverunner invulnerable for now
	turn_invulnerable(VEHICLE_WAVERUNNER, false)
	set_max_hit_points(VEHICLE_WAVERUNNER, WAVERUNNER_HIT_POINTS)

	-- Send player(s) to the dock
	--rn11_send_to_location(	TRIGGER_DOCK, INGAME_EFFECT_VEHICLE_LOCATION, 
	--								HELPTEXT_PROMPT_LOCATION_DOCK, ALLOWED_TIME_TO_DOCK_MS, "rn11_failure_dock")
	hud_timer_set(0, ALLOWED_TIME_TO_FESTIVAL_MS, "rn11_failure_dock")
	rn11_send_to_location(	TRIGGER_DOCK, INGAME_EFFECT_VEHICLE_LOCATION, HELPTEXT_PROMPT_LOCATION_DOCK, GPS_TO_WATERCRAFT)

	-- Release the starting vehicle
	release_to_world(GROUP_START_CAR)
	if IN_COOP then
		release_to_world(GROUP_START_CAR_COOP)
	end

	-- Start the attack heli thread
	attack_heli_set_drop_accuracy(.2,.6)
	thread_new("rn11_attack_helis")

	-- Prompt the player to enter the Waverunner, add minimap and in-game icon to waverunner
	thread_new("mission_help_table",HELPTEXT_PROMPT_WAVERUNNER)
	marker_add_vehicle(VEHICLE_WAVERUNNER, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_INTERACT, SYNC_ALL)

	-- wait for a player to enter the waverunner
	on_vehicle_enter("rn11_waverunner_entered", VEHICLE_WAVERUNNER)
	while (not Waverunner_entered) do
		thread_yield()
	end
	turn_vulnerable(VEHICLE_WAVERUNNER)

	-- remove the Waverunner vehicle waypoint/icon and trigger
	marker_remove_vehicle(VEHICLE_WAVERUNNER,SYNC_ALL)
	on_vehicle_enter("",VEHICLE_WAVERUNNER)

	vehicle_max_speed(VEHICLE_WAVERUNNER,WAVERUNNER_MAX_SPEED)

	-- Send player(s) to the Heritage festival
	rn11_send_to_location(	TRIGGER_FESTIVAL_ARRIVAL, INGAME_EFFECT_VEHICLE_LOCATION, 
									HELPTEXT_PROMPT_FESTIVAL, GPS_TO_FESTIVAL)

	hud_timer_stop(0)
	Festival_reached = true

	rn11_start_junk_fire()

end

function rn11_create_lieutenants()
	group_create(GROUP_LIEUTENANTS, false)
end


function rn11_attack_helis()

	-- Create the attack heli
	attack_heli_create(NAVPOINT_HELI_START, 0)
	attack_heli_go(0)
	attack_heli_init_weave_ai(0)

	local heli_name = attack_heli_get_heli_name(0)

	local function rn11_process_attack_helis()
		if (vehicle_exists(heli_name) and (not vehicle_is_destroyed(heli_name))) then
			attack_heli_update(0)
		else
			attack_heli_destroy(0)
			heli_name = rn11_maybe_spawn_new_attack_heli()
		end
	end

	while ( not Festival_reached) do
		thread_yield()
		rn11_process_attack_helis()
	end

	if (vehicle_exists(heli_name) and (not vehicle_is_destroyed(heli_name))) then
		helicopter_enter_retreat(heli_name)
		while(vehicle_exists(heli_name) and (not vehicle_is_destroyed(heli_name)) ) do
			local dist, player = get_dist_closest_player_to_object(heli_name)
			if (dist > 300) then
				attack_heli_destroy(0)	
			end
			thread_yield()
		end
	end

end

function rn11_maybe_spawn_new_attack_heli()

	local function get_attack_heli_spawn_location()

		for i, navpoint in pairs(ATTACK_HELI_SPAWN_LOCATIONS) do

			if (not rn11_navpoint_in_fov(navpoint)) then

				local dist = get_dist(navpoint, LOCAL_PLAYER)
				if (dist < 500 and dist > 100) then
					return navpoint
				end

			end

		end

		return nil

	end

	local attack_heli_spawn_location = get_attack_heli_spawn_location()

	if (attack_heli_spawn_location ~= nil) then
		attack_heli_create(attack_heli_spawn_location, 0)
		attack_heli_go(0)
		attack_heli_init_weave_ai(0)

		return attack_heli_get_heli_name(0)
	else
		return ""
	end

end

function rn11_clear_lieutenants()

	-- Players have to kill all the lieutenants
	rn11_festival_battle()

	-- Cutscene, Akuji entering the boats
	cutscene_in()

	cutscene_play("IG_rn11_scene1", "", {NAVPOINT_LOCAL_PLAYER_START_CHECKPOINT_2,NAVPOINT_REMOTE_PLAYER_START_CHECKPOINT_2}, false)
	-- Get rid of the cutscene's group
	group_destroy(GROUP_CTE_AKUJI)

	-- Make the junk-boat Ronin visible
	rn11_group_show_maybe_coop(GROUP_JUNK, GROUP_JUNK_COOP)

	-- Start the junk boat fires
	rn11_start_junk_fire()
		
	cutscene_out()

end

function rn11_find_akuji_and_wong()

	-- Have Wong's health tick down as the players try to find him and Akuji
	Thread_wong_health = thread_new("rn11_display_wong_health")	
	rn11_send_to_location(TRIGGER_AKUJI, INGAME_EFFECT_LOCATION, HELPTEXT_PROMPT_JUNK, GPS_TO_AKUJI)

	-- Ensure that Wong's health is no longer displayed
	thread_kill(Thread_wong_health)
	hud_bar_off(0)

end

function rn11_akuji_boss_fight()

	-- Cutscene, Akuji and Wong talking
	cutscene_in()

	character_evacuate_from_all_vehicles(LOCAL_PLAYER)
	if (IN_COOP and character_is_in_vehicle(REMOTE_PLAYER)) then
		character_evacuate_from_all_vehicles(REMOTE_PLAYER)
	end

	spawning_pedestrians(false)
	spawning_vehicles(false)

	-- Eliminate everyone in the existing party. Turn off ped. spawnin and repopulate the world
	-- to eliminate any followers that you brought along.
	party_dismiss_all()
	party_set_recruitable(false)
	spawning_pedestrians(false, true)

	cutscene_play("IG_rn11_scene2")
	
	-- Enable sword combat
	rn11_enable_sword_combat(true)

	-- Override personas:
	persona_override_character_start(CHARACTER_AKUJI, POT_SITUATIONS[POT_ATTACK],"KAZUO_RON11_ATTACK")
	persona_override_character_start(CHARACTER_AKUJI, POT_SITUATIONS[POT_TAKE_DAMAGE],"KAZUO_RON11_TAKEDAM")

	-- Setup Akuji
	inv_item_remove_all(CHARACTER_AKUJI)
	set_max_hit_points(CHARACTER_AKUJI,AKUJI_HIT_POINTS)
	on_death("rn11_complete", CHARACTER_AKUJI)
	damage_indicator_on(0, CHARACTER_AKUJI,0.0, HELPTEXT_HUD_AKUJI_HEALTH)
	npc_set_boss_type(CHARACTER_AKUJI, AI_BOSS_AKUJI)
	inv_item_add("samurai_sword", 1, CHARACTER_AKUJI)
	inv_item_equip("samurai_sword",CHARACTER_AKUJI)
	marker_add_npc(CHARACTER_AKUJI, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL)
	--character_allow_ragdoll(CHARACTER_AKUJI, false)

	-- Teleport remote player to fight start
	if (IN_COOP) then
		teleport(REMOTE_PLAYER, NAVPOINT_REMOTE_PLAYER_START_AKUJI)
	end

	-- Give the players swords
	inv_weapon_add_temporary(LOCAL_PLAYER, "samurai_sword", 1, true)
	inv_item_equip("samurai_sword",LOCAL_PLAYER)
	party_use_melee_weapons_only(true)
	if (IN_COOP) then
		inv_weapon_add_temporary(REMOTE_PLAYER, "samurai_sword", 1, true)
		inv_item_equip("samurai_sword",REMOTE_PLAYER)
	end
	Sword_loaned	= true

	-- Start the junk boat fires
	rn11_start_junk_fire()
		
	cutscene_out()

	-- Make sure that the players stay close by.
	thread_new("rn11_boss_fight_monitor_distance")

	-- Have Akuji attack but Wong is a bit wussy.
	npc_combat_enable(CHARACTER_WONG, false)

	tutorial_start("combat_swords", 1000, true)

	mission_help_table("rn10_prompt_kill_akuji")

	attack(CHARACTER_AKUJI, LOCAL_PLAYER)	

end


function rn11_boss_fight_monitor_distance()

	local allowed_dist = 50
	local allowed_time_ms = 15000

	local player_in_range = {[LOCAL_PLAYER] = true, [REMOTE_PLAYER] = true}
	local player_timer = {[LOCAL_PLAYER] = 0, [REMOTE_PLAYER] = 1}
	local player_sync = {[LOCAL_PLAYER] = SYNC_LOCAL, [REMOTE_PLAYER] = SYNC_REMOTE}

	local function update_indicators(player)

		local currently_in_range = true

		if ( character_exists(CHARACTER_AKUJI) and (not  character_is_dead(CHARACTER_AKUJI)) ) then
			currently_in_range = ( get_dist(CHARACTER_AKUJI, player) < allowed_dist )
		end

		-- Were in range, now we're not. Display indicators and start timing failure.
		if ( player_in_range[player] and (not currently_in_range) ) then

			mission_help_table_nag("rn10_prompt_kill_akuji", "", "", player_sync[player])
			distance_display_on(CHARACTER_AKUJI, 0, 50.0, 0, 50.0, player_sync[player])
			hud_timer_set(player_timer[player], allowed_time_ms,"rn11_failure_wong")

		end

		-- Were out of range, now we're not. Remove indicators, stop timing failure.
		if ( (not player_in_range[player]) and currently_in_range ) then
			distance_display_off(player_sync[player])
			hud_timer_stop(player_timer[player])
		end

		player_in_range[player] = currently_in_range

	end

	while (true) do
		update_indicators(LOCAL_PLAYER)
		if (IN_COOP) then
			update_indicators(REMOTE_PLAYER)
		end
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

function rn11_enable_sword_combat(enable)
	combat_enable_sword_parries(enable)
	combat_enable_sword_strafing(enable)

	local take_damage_callback = ""
	if (enable) then
		take_damage_callback = "rn11_player_damaged"
		thread_new("rn11_always_ready")
	end

	on_take_damage(take_damage_callback, LOCAL_PLAYER)
	if(IN_COOP) then
		on_take_damage(take_damage_callback, REMOTE_PLAYER)
	end

	character_set_cannot_wield_havok_weapon(LOCAL_PLAYER, enable)
	if (IN_COOP) then
		character_set_cannot_wield_havok_weapon(REMOTE_PLAYER, enable)
	end

	-- Don't let the players enter vehicles
	set_player_can_enter_exit_vehicles(LOCAL_PLAYER, (not enable))
	if (IN_COOP) then
		set_player_can_enter_exit_vehicles(REMOTE_PLAYER, (not enable))
	end

end

function rn11_always_ready()

	local function combat_ready(character)
		if (	character_exists(character) and 
				(not character_is_dead(character)) and 
				(not character_is_ragdolled(character)) 
			) then
			character_set_combat_ready(character, true, 1.0)
		end
	end

	while(true) do
		thread_yield()
		combat_ready(LOCAL_PLAYER)
		combat_ready(REMOTE_PLAYER)
		combat_ready(CHARACTER_AKUJI)
	end

end

function rn11_player_damaged(player, attacker, damage_percent)

	if (attacker == CHARACTER_AKUJI) then
		character_ragdoll(player, 1000)
		audio_play_persona_line(CHARACTER_AKUJI, "threat - alert (solo attack)")
	end

end

-- Cleanup mission
function rn11_cleanup()

	IN_COOP = coop_is_active()

	-- Allow follower recruiting
	party_set_recruitable(true)

	-- Start spawning peds again
	spawning_pedestrians(true)

	-- Cleanup the hud
	hud_timer_stop(0)
	hud_timer_stop(1)
	distance_display_off(SYNC_ALL)

	-- Disable sword combat
	rn11_enable_sword_combat(false)

	-- Fires burn out
	for i, effect_handle in pairs(Effect_handles) do
		effect_stop(effect_handle)
	end

	-- End persona overrides
	persona_override_group_stop(RONIN_PERSONAS,POT_SITUATIONS[POT_ATTACK])

	-- Reset the respawn distance
	npc_respawn_dist_reset()

	-- Reenable ped, vehicle spawning. It may have been turned off for the boss battle.
	spawning_pedestrians(true)
	spawning_vehicles(true)

	-- Reset Ronin notoriety
	notoriety_set_min("Ronin",0)
	notoriety_set_max("Ronin",5)
	notoriety_set("Ronin",0)

	-- Turn on notoriety, ambient Ronin spawns
	notoriety_force_no_spawn("Ronin", false) 
	ambient_gang_spawn_enable(true)

	-- Remove waverunner marker
	if (group_is_loaded(GROUP_WATERCRAFT)) then
		marker_remove_vehicle(VEHICLE_WAVERUNNER,SYNC_ALL)
	end

	-- Remove npc markers, triggers
	if (group_is_loaded(GROUP_LIEUTENANTS)) then
		for i,lieutenant in pairs(MEMBERS_GROUP_LIEUTENANTS) do
			on_death("", lieutenant)
			marker_remove_npc(lieutenant)
		end
	end

	-- Kill all secondary threads
	for i, thread in pairs(Table_all_threads) do
		thread_kill(thread)
	end

	-- disable all triggers, remove callbacks
	for i, trigger in pairs(TABLE_ALL_TRIGGERS) do
		on_trigger("",trigger)
		trigger_enable(trigger,false)
	end

	-- remove temporary weapons
	if (Sword_loaned) then
		inv_weapon_remove_temporary(LOCAL_PLAYER, "samurai_sword")
		party_use_melee_weapons_only(false)
		if (IN_COOP) then
			inv_weapon_remove_temporary(REMOTE_PLAYER, "samurai_sword")
		end
	end

	party_use_melee_weapons_only(false)
	-- teleport players onto docks if they're in that area.
	if(get_dist(LOCAL_PLAYER, NAVPOINT_LOCAL_PLAYER_START_CHECKPOINT_3) < 300) then
		teleport(LOCAL_PLAYER, NAVPOINT_LOCAL_PLAYER_START_CHECKPOINT_3, true)
	end
	if (IN_COOP) then
		if (get_dist(REMOTE_PLAYER, NAVPOINT_REMOTE_PLAYER_START_CHECKPOINT_3) < 300) then
			teleport(REMOTE_PLAYER, NAVPOINT_REMOTE_PLAYER_START_CHECKPOINT_3, true)
		end
	end

	-- Replace festival chunks w/ normal ones.
	city_chunk_swap("sr2_chunk179", "normal", false, true, true)
	city_chunk_swap("sr2_intmamis3junksempty", "normal", true, true, true)

end

function rn11_success()

	-- Post the news event
	radio_post_event("JANE_NEWS_RON11", true)

end


-- MISSION FUNCTIONS ----------------------------------------

function rn11_waverunner_entered()
	Waverunner_entered = true;
end


-- Monitor the distance between the player(s) and the escaping Ronin. Controls the
-- timer and displays hud messages for the out-of-range failure condition.
function rn11_monitor_dist()

	-- Have the speedboats drive slowly for an initial period before starting failure timers
	vehicle_speed_override(VEHICLE_SPEEDBOAT1, SPEEDBOAT_INITIAL_SPEED_MPH)
	--delay(SPEEDBOAT_INITIAL_SPEED_TIME_S)

	-- The speedboat drives slowly until the player gets in the waverunner.
	while (not Waverunner_entered) do
		thread_yield()
	end

	-- Prompt to follow boats, minimap/in-game icons on boats
	local failure_distance = SPEEDBOAT_CLOSE_RANGE_M
	distance_display_on(VEHICLE_SPEEDBOAT1,0.0,failure_distance,0.0,failure_distance, SYNC_ALL)
	marker_add_vehicle(VEHICLE_SPEEDBOAT1, MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL, SYNC_ALL)
	mission_help_table(HELPTEXT_PROMPT_FOLLOW)

	-- Delay while the prompt is displayed
	delay(5.0)

	local failure_time_ms = SPEEDBOAT_FOLLOW_FAIL_TIME_S * 1000
	local timing_out_of_range = false

	-- Always update speed/messages for initial check
	local initial_distance_check = true

	while(not rn11_speedboat1_disabled) do

		local dist = get_dist_closest_player_to_object(VEHICLE_SPEEDBOAT1)

		if (dist > failure_distance and ((not timing_out_of_range) or initial_distance_check)) then

			vehicle_speed_override(VEHICLE_SPEEDBOAT1, SPEEDBOAT_SLOW_SPEED_MPH)

			-- Tell the player(s) to catch up and start the failure timer.
			mission_help_table(HELPTEXT_PROMPT_WARN_DIST)
			hud_timer_set(0, failure_time_ms,"rn11_failure_follow")
			timing_out_of_range = true

		elseif (dist < SPEEDBOAT_CLOSE_RANGE_M and (timing_out_of_range or initial_distance_check)) then

			vehicle_speed_override(VEHICLE_SPEEDBOAT1, SPEEDBOAT_FAST_SPEED_MPH)

			-- Stop the timer
			hud_timer_stop(0)
			timing_out_of_range = false

		end

		initial_distance_check = false

		thread_yield()
	end

	-- Make sure that the  distance display is off.
	distance_display_off(SYNC_ALL)

end


-- Monitors the distance from the players to the speedboat
-- throttles speedboat speed if vehicles are out of range
-- starts misison failure timer when players are too far away
function rn11_speedboat_throttle_old()

	-- Add boat radar indicators
	distance_display_on(VEHICLE_SPEEDBOAT1,SPEEDBOAT_CLOSE_RANGE_M,5000.0,0.0,SPEEDBOAT_CLOSE_RANGE_M, SYNC_ALL)
	distance_display_on(VEHICLE_SPEEDBOAT2,SPEEDBOAT_CLOSE_RANGE_M,5000.0,0.0,SPEEDBOAT_CLOSE_RANGE_M, SYNC_ALL)

	-- Have the speedboats drive slowly for an initial period
	vehicle_speed_override(VEHICLE_SPEEDBOAT1, SPEEDBOAT_INITIAL_SPEED_MPH)
	vehicle_speed_override(VEHICLE_SPEEDBOAT2, SPEEDBOAT_INITIAL_SPEED_MPH)

	delay(SPEEDBOAT_INITIAL_SPEED_TIME_S)

	local Timing_out_of_range = false

	local speedboat1_inrange = true
	local speedboat2_inrange = true

	while ( not (rn11_speedboat1_disabled and rn11_speedboat2_disabled)) do

		local speedboat1_dist, speedboat2_dist = SPEEDBOAT_CLOSE_RANGE_M+1,SPEEDBOAT_CLOSE_RANGE_M+1

		-- Treat disabled boats as out of range
		if (not rn11_speedboat1_disabled) then
			speedboat1_dist = get_dist_closest_player_to_object(VEHICLE_SPEEDBOAT1)
		end
		if (not rn11_speedboat2_disabled) then
			speedboat2_dist = get_dist_closest_player_to_object(VEHICLE_SPEEDBOAT2)
		end

		-- See if boats' in-range statuses have changed
		if ( (speedboat1_dist < SPEEDBOAT_CLOSE_RANGE_M) ~= speedboat1_inrange) then
			speedboat1_inrange = (not speedboat1_inrange)
			if (speedboat1_inrange) then
				vehicle_speed_override(VEHICLE_SPEEDBOAT1, SPEEDBOAT_FAST_SPEED_MPH)
			else
				vehicle_speed_override(VEHICLE_SPEEDBOAT1, SPEEDBOAT_SLOW_SPEED_MPH)
			end
		end

		if ( (speedboat2_dist < SPEEDBOAT_CLOSE_RANGE_M) ~= speedboat2_inrange) then
			speedboat2_inrange = (not speedboat2_inrange)
			if (speedboat2_inrange) then
				vehicle_speed_override(VEHICLE_SPEEDBOAT2, SPEEDBOAT_FAST_SPEED_MPH)
			else
				vehicle_speed_override(VEHICLE_SPEEDBOAT2, SPEEDBOAT_SLOW_SPEED_MPH)
			end
		end

		-- Player out of range and no timer is started, start the failure timer
		if ( (not speedboat1_inrange and not speedboat2_inrange) and (not Timing_out_of_range)) then
			Timing_out_of_range = true
			hud_timer_set(0, SPEEDBOAT_FOLLOW_FAIL_TIME_S * 1000, "rn11_failure_follow")
		elseif ( (speedboat1_inrange or speedboat2_inrange) and Timing_out_of_range) then
			Timing_out_of_range = false
			hud_timer_stop(0)
		end

		thread_yield()
	end

	-- Shouldn't be timing if both boats are disabled
	hud_timer_stop(0)

	-- kill the radar
	distance_display_off(SYNC_ALL)

end

function rn11_complete()
	--bink_play_movie("ro11-2.bik")

	-- End the mission with success
	mission_end_success(MISSION_NAME, CUTSCENE_OUT)
end

function rn11_send_speedboat1()
	-- Send the speedboat to the Marina
	vehicle_pathfind_to(VEHICLE_SPEEDBOAT1, "rn11_$n000", "rn11_$n001", "rn11_$n002", "rn11_$n003",
								"rn11_$n004", "rn11_$n005", "rn11_$n006", "rn11_$n007", "rn11_$n008",
								"rn11_$n009", "rn11_$n010", "rn11_$n011", "rn11_$n012", "rn11_$n013",
								"rn11_$n014", "rn11_$n015", "rn11_$n016", "rn11_$n017", "rn11_$n018",
								"rn11_$n019", "rn11_$n020", "rn11_$n021", "rn11_$n022", "rn11_$n023",
								"rn11_$n024", "rn11_$n025", "rn11_$n026", "rn11_$n027", "rn11_$n028",
								"rn11_$n029", "rn11_$n030", "rn11_$n031", "rn11_$n032", "rn11_$n033",
								"rn11_$n034", "rn11_$n035", "rn11_$n036", "rn11_$n037", "rn11_$n038",
								"rn11_$n039", "rn11_$n040", "rn11_$n041", "rn11_$n042",
								true, false)
	vehicle_chase(VEHICLE_SPEEDBOAT1, LOCAL_PLAYER, false, true, true);
end

function rn11_send_speedboat2()
	-- Send the speedboat to the Marina
	delay(1.0)
	vehicle_pathfind_to(VEHICLE_SPEEDBOAT2, "rn11_$n002", "rn11_$n003",
								"rn11_$n004", "rn11_$n005", "rn11_$n006", "rn11_$n007", "rn11_$n008",
								"rn11_$n009", "rn11_$n010", "rn11_$n011", "rn11_$n012", "rn11_$n013",
								"rn11_$n014", "rn11_$n015", "rn11_$n016", "rn11_$n017", "rn11_$n018",
								"rn11_$n019", "rn11_$n020", "rn11_$n021", "rn11_$n022", "rn11_$n023",
								"rn11_$n024", "rn11_$n025", "rn11_$n026", "rn11_$n027", "rn11_$n028",
								"rn11_$n029", "rn11_$n030", "rn11_$n031", "rn11_$n032", "rn11_$n033",
								"rn11_$n034", "rn11_$n035", "rn11_$n036", "rn11_$n037", "rn11_$n038",
								"rn11_$n039", "rn11_$n040", "rn11_$n041", "rn11_$n042",
								true, false)
	if (IN_COOP) then
		vehicle_chase(VEHICLE_SPEEDBOAT2, REMOTE_PLAYER, false, true, true);
	else
		vehicle_chase(VEHICLE_SPEEDBOAT2, LOCAL_PLAYER, false, true, true);
	end
end

function rn11_festival_battle()

	-- Start persona overrides
	persona_override_group_start(RONIN_ATTACK_PERSONAS,POT_SITUATIONS[POT_ATTACK], "RO11_ATTACK")

	rn11_process_enemy_set(MEMBERS_GROUP_LIEUTENANTS, HELPTEXT_PROMPT_LIEUTENANTS, HELPTEXT_OBJECTIVE_LIEUTENANTS)

	--[[ Add the helptext
	objective_text(0, HELPTEXT_OBJECTIVE_LIEUTENANTS, 0, LIEUTENANTS_TO_KILL)

	-- Have the Ronin attack in waves
	rn11_ronin_attack_in_waves()

	-- block until no living lieutenants remain
	while (Num_living_attackers ~= 0) do	
		thread_yield()
	end

	objective_text_clear(0)
	]]

end

rn11_enemies_to_kill = 0
rn11_enemies_living = 0
rn11_enemy_set_objective_helptext = ""

-- Wait for the player to kill a group of enemies
-- 
-- enemy_table				A table containing the names of the enemies that need to be killed
-- mission_helptext		The helptext message that will prompt the player(s) to kill the enemies
-- objective_helptext	The objective text displayed in the hud, needs to be in the format %s of %s killed
function rn11_process_enemy_set(enemy_table, mission_helptext, objective_helptext)

	-- Assign enemy callbacks, add markers
	for i, enemy in pairs(enemy_table) do
		if (not character_is_dead(enemy)) then
			on_death("rn11_enemy_killed", enemy)
			marker_add_npc(enemy, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL) 
			rn11_enemies_to_kill = rn11_enemies_to_kill + 1
		end
	end
	rn11_enemies_living =  rn11_enemies_to_kill

	-- Display the objective text
	if(objective_helptext) then
		rn11_enemy_set_objective_helptext = objective_helptext
		objective_text(0, rn11_enemy_set_objective_helptext, rn11_enemies_to_kill - rn11_enemies_living, rn11_enemies_to_kill)
	end

	-- Display the help text
	if(mission_helptext) then
		mission_help_table(mission_helptext)
	end

	
	while (rn11_enemies_living > 0) do
		thread_yield()
	end

end

function rn11_enemy_killed(enemy)
	marker_remove_npc(enemy)
	on_death("",enemy)
	rn11_enemies_living = rn11_enemies_living - 1
	if (rn11_enemies_living < 1) then
		objective_text_clear(0)
		rn11_enemy_set_objective_helptext = ""
	else
		if (rn11_enemy_set_objective_helptext ~= "") then
			objective_text(0, rn11_enemy_set_objective_helptext, rn11_enemies_to_kill - rn11_enemies_living, rn11_enemies_to_kill)
		end

		if (rn11_enemies_living == 5) then
			for i,guard in pairs(MEMBERS_GROUP_LIEUTENANTS) do
				if (not character_is_dead(guard)) then
					npc_leash_remove(guard)
					attack(guard)
				end
			end		
		end
	end
end

-- Spawn waves of ronin to attack ceiling supports that the player(s) is(are) defending
Num_living_attackers = 0
Num_ronin_spawned = 0
function rn11_ronin_attack_in_waves()

	objective_text(0, HELPTEXT_OBJECTIVE_LIEUTENANTS, Num_ronin_spawned - Num_living_attackers, LIEUTENANTS_TO_KILL)

	-- Start loading the ronin
	group_create_hidden(GROUP_LIEUTENANTS, true)

	-- Set respawn dist threshold very low.
	npc_respawn_dist_override(RONIN_RESPAWN_DISTANCE)
	
	-- All ronin are initially spawnable
	for i, ronin in pairs(MEMBERS_GROUP_LIEUTENANTS) do
		Spawnable_ronin[ronin] = true
	end

	-- Convenience variables for wave size parameters.
	local min_wave_size = WAVE_MIN_SIZE
	local max_wave_size = WAVE_MAX_SIZE
	local max_attackers = MAX_LIEUTENANTS_ATTACKING

	-- Returns the next wave size
	local function get_next_wave_size()
		local size = rand_int(min_wave_size, max_wave_size)
		if (size + Num_ronin_spawned > LIEUTENANTS_TO_KILL) then
			size = LIEUTENANTS_TO_KILL - Num_ronin_spawned
		end
		return size
	end

	-- Size of the next wave to spawn
	local next_wave_size = get_next_wave_size()

	-- Continuously check the number of Ronin attacking, spawn more if needed.
	while(Num_ronin_spawned < LIEUTENANTS_TO_KILL) do

		if (next_wave_size + Num_ronin_spawned > LIEUTENANTS_TO_KILL) then
			next_wave_size = LIEUTENANTS_TO_KILL - Num_ronin_spawned
		end

		-- Spawn the next wave if there is room.
		if (next_wave_size + Num_living_attackers <= max_attackers) then

			local num_ronin_in_wave = rn11_send_wave(next_wave_size)
			Num_ronin_spawned = Num_ronin_spawned + num_ronin_in_wave
			Num_living_attackers = Num_living_attackers + num_ronin_in_wave
			next_wave_size =  get_next_wave_size()

		end

		thread_yield()

	end -- end while(true)

end

-- Send a wave of ronin to attack a structural weakness
--
-- wave_size: number of attackers to send
--
-- returns number of attackers successfully spawned
function rn11_send_wave(wave_size)

	local num_ronin_spawned = 0

	-- For each Ronin to be spawned
	for i=1, wave_size, 1 do

		-- Get a ronin to spawn and a safe spawning location. 
		local ronin = rn11_get_spawnable_ronin()
		local spawn_navpoint, spawn_location_index = rn11_get_safe_spawn()

		-- If either one not found, return # ronin already spawned.
		if ( (spawn_navpoint == nil) or (spawn_location_index == nil) ) then
			return num_ronin_spawned
		end

		-- We're gonna spawn this guy, do some book keeping.
		num_ronin_spawned = num_ronin_spawned + 1
		Spawnable_ronin[ronin] = false

		-- Teleport to the spawn navpoint
		teleport(ronin, spawn_navpoint)

		-- Tell the ronin to respawn, override default respawn time
		npc_respawn_after_death(ronin, true)
		npc_respawn_after_death_time_override(ronin, RONIN_RESPAWN_TIME_MS, true)
		on_respawn("rn11_respawn_ronin",ronin)

		-- Show the ronin and start its patrol
		character_show(ronin)
		marker_add_npc(ronin, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL) 
		rn11_lieutenant_attack(ronin)

		-- Delay a little bit, gives the ronin time to leave the spawn area and keeps congestion down.
		delay(.2,.5)

	end

	-- Return num of ronin spawned
	return num_ronin_spawned

end

-- Returns a spawnable ronin if one is available, nil else.
function rn11_get_spawnable_ronin()

	for i, ronin in pairs(MEMBERS_GROUP_LIEUTENANTS) do
		if (Spawnable_ronin[ronin] == true) then
			return ronin
		end
	end

	return nil

end

-- Handle the respawning of an attacking Ronin.
function rn11_respawn_ronin(ronin)

	-- keep the ronin hidden for now
	character_hide(ronin)

	-- Make this ronin available for spawning again
	delay(.5)
	Spawnable_ronin[ronin] = true

end

function rn11_lieutenant_killed(lieutenant)
	on_death("", lieutenant)
	marker_remove_npc(lieutenant)
	Num_living_attackers = Num_living_attackers - 1

	Lieutenant_completion_ratio = (Num_ronin_spawned - Num_living_attackers)/LIEUTENANTS_TO_KILL
	local ped_density = 1.0 - (Lieutenant_completion_ratio/PED_SPAWNING_DISABLE_RATIO)
	if (ped_density < .0001) then
		ped_density = .0001
	end
	set_ped_density(ped_density)

	objective_text(0, HELPTEXT_OBJECTIVE_LIEUTENANTS, Num_ronin_spawned - Num_living_attackers, LIEUTENANTS_TO_KILL)
end

function rn11_lieutenant_attack(lieutenant)

	on_death("rn11_lieutenant_killed", lieutenant)
	patrol("rn11_patrol_festival",lieutenant)
	if(Debug_ltnt_quick_kill) then
		delay(.25)
		character_kill(lieutenant)
	end
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
--		spawn_location_index: index of the spawn location that contains spawn_navpoint
function rn11_get_safe_spawn(hint_location)

	-- 1) Try to return a navpoint from the preferred location:
	if (hint_location ~= nil) then
		if (rn11_location_is_safe(hint_location)) then
			return rn11_return_location(hint_location)
		end
	end

	-- 2) Try to return a navpoint that is a certain minimum distance from the players

	local safe_spawn_location_indices = {}
	local num_safe_spawn_locations = 0;

	-- Add safe spawn locations to the list
	for i=1, sizeof_table(FESTIVAL_SPAWN_LOCATIONS), 1 do

		if (rn11_location_is_safe(i)) then

			num_safe_spawn_locations = num_safe_spawn_locations + 1
			safe_spawn_location_indices[num_safe_spawn_locations] = i

		end

	end

	-- Can't do anything if there are no safe spawn areas.
	if (num_safe_spawn_locations == 0) then
		return nil, nil
	end

	-- Select a random safe spawn area
	return rn11_return_location(safe_spawn_location_indices[rand_int(1,num_safe_spawn_locations)]) 

end

function rn11_return_location(location_index) 

	-- Get current navpoint index
	local current_navpoint_index = Spawn_locations_next_navpoint_index[location_index]
	if (current_navpoint_index == nil) then
		current_navpoint_index = 0
	end

	-- Get the navpoint that we are going to return
	local navpoint = FESTIVAL_SPAWN_LOCATIONS[location_index][current_navpoint_index]

	-- Do a modular ncrement the navpoint index for this location
	local next_navpoint_index = current_navpoint_index + 1
	local max_navpoint_index = sizeof_table(FESTIVAL_SPAWN_LOCATIONS[location_index])
	if (next_navpoint_index > max_navpoint_index) then
		next_navpoint_index = 1
	end
	Spawn_locations_next_navpoint_index[location_index] = next_navpoint_index

	-- return the navpoint and location index
	return navpoint, next_navpoint_index

end

function rn11_location_is_safe(location_index)

	-- Get the next navpoint at this location
	local navpoint_index = Spawn_locations_next_navpoint_index[location_index]
	if (navpoint_index == nil) then
		navpoint_index = 1
	end
	local navpoint = FESTIVAL_SPAWN_LOCATIONS[location_index][navpoint_index]

	-- See if the navpoint is distance-safe
	local dist, closest_player = get_dist_closest_player_to_object(navpoint)
	if (dist < 10.0 or dist > 200.0) then
		return false
	end

	if (not rn11_navpoint_in_fov(navpoint)) then
		return true
	end
	return false

end

function rn11_navpoint_in_fov(navpoint)

	local navpoint_in_local_fov = navpoint_in_player_fov(navpoint, LOCAL_PLAYER)
	local navpoint_in_remote_fov = false
	if (IN_COOP) then
		navpoint_in_remote_fov = navpoint_in_player_fov(navpoint, REMOTE_PLAYER)
	end

	return (navpoint_in_local_fov or navpoint_in_remote_fov)

end

function rn11_patrol_festival(lieutenant)

	-- run to the pier area before attacking peds
	local last_navpoint = FESTIVAL_NAVPOINTS[rand_int(1,sizeof_table(FESTIVAL_NAVPOINTS))]
	move_to(lieutenant, last_navpoint, 2, true, true)

	set_attack_peds_flag(lieutenant, true)
	set_attack_player_flag(lieutenant, true)

	local attacking_player_only = false

	while (not attacking_player_only) do

		-- Maybe begin ignoring peds and concentrate on attacking the player(s)
		local attack_player_only_chance = Lieutenant_completion_ratio / ATTACK_PLAYER_ONLY_RATIO
		if (rand_float(0.0,1.0) < attack_player_only_chance) then
			set_attack_peds_flag(lieutenant, false	)
			attack(lieutenant)
			attacking_player_only = true

		-- Otherwise move to a random festival navpoint
		else			
			local rand_navpoint = FESTIVAL_NAVPOINTS[rand_int(1,sizeof_table(FESTIVAL_NAVPOINTS))]

			-- if the npc is already in the right spot, have them mull around a bit
			if (rand_navpoint == last_navpoint) then
				delay(rand_float(1,5))
			else
				local rand_speed = rand_int(1,3)
				move_to(lieutenant, rand_navpoint, rand_speed, false, false)
				last_navpoint = rand_navpoint
			end
		end

	end
end

function rn11_display_wong_health()
	local wong_tick_time		=	{}
	local wong_tick_amount	=	{}
	local wong_health			= 100

   hud_bar_on(0, "Health", HELPTEXT_HUD_WONG_HEALTH, 1.0 )
   hud_bar_set_range(0, 0, wong_health, SYNC_ALL )
   hud_bar_set_value(0, wong_health, SYNC_ALL )

	-- Initialize time and damage dividers for health ticks
	wong_tick_time[100]	= true	-- always have the last interval end after the last segment
	local num_dividers	=	1
	while(num_dividers < WONG_SURVIVAL_TICKS) do
		local rand_divider = rand_int(1,99)
		if(wong_tick_time[rand_divider] == nil) then
			wong_tick_time[rand_divider] = 1
			num_dividers = num_dividers+1
		end
	end
	wong_tick_amount[100]	= true;
	num_dividers				= 1
	while(num_dividers < WONG_SURVIVAL_TICKS) do
		local rand_divider = rand_int(1,99)
		if(wong_tick_amount[rand_divider] == nil) then
			wong_tick_amount[rand_divider] = 1
			num_dividers = num_dividers+1
		end
	end
	
	local summed_damage = 0	-- cumulative damage applied to Wong
	local summed_time	  = 0 -- cumulative time

	for i=1, num_dividers, 1 do

		summed_damage = summed_damage +1
		summed_time	= summed_time + 1
		local tick_time = 1

		-- Calculate the percent of time before damage is applied during this tick
		while(wong_tick_time[summed_time] == nil) do
			tick_time = tick_time + 1
			summed_time = summed_time + 1
		end		

		-- Calculate the cumulative damage total after this tick is applied
		while(wong_tick_amount[summed_damage] == nil) do
			summed_damage = summed_damage + 1
		end

		-- Setup a notification to arrive after interval time has passed.
		-- Time until next tick in sec = (tick_time / 100) * WONG_SURVIVAL_TIME_S
		local trigger_time = .4 * tick_time * WONG_SURVIVAL_TIME_S
		on_game_time_trigger("rn11_wong_tick_next", trigger_time, 0, 0, 0, 0, 0)

		while(not Wong_tick_next) do -- Wait for current time interval to run out
			thread_yield()
		end

		Wong_tick_next = false
		hud_bar_set_value(0, wong_health - summed_damage, SYNC_ALL)
	end

	-- If we've gotten here, all intervals are processed. Wong is dead!
	delay(.3)	
	hud_bar_off(0)
	rn11_failure_wong()
end

-- Move on to the next interval
function rn11_wong_tick_next()
	Wong_tick_next = true
end

function rn11_akuji_passed_out()
	Akuji_revived = false
	on_game_time_trigger("rn11_akuji_maybe_revive", AKUJI_PASSED_OUT_TIME_S * 40, 0, 0, 0, 0, 0)
end

function rn11_akuji_maybe_revive()
	if (not Akuji_revived) then
		npc_revive(CHARACTER_AKUJI)	
		-- Reset the revived flag
		Akuji_revived = false
		local max_hp = get_max_hit_points(CHARACTER_AKUJI)
		set_current_hit_points(CHARACTER_AKUJI,AKUJI_REVIVE_PERCENT * max_hp)
	end
end

function rn11_akuji_revived()
	Akuji_revived = true
end

-- UTILITY FUNCTIONS ----------------------------------------

-- Apply the coop health multiplier to group memebers
function rn11_adjust_hp_for_coop(member_table)
	if (IN_COOP) then
		for i,member in pairs(member_table) do
			local hp = get_max_hit_points(member)
			set_max_hit_points(member, COOP_HP_MULTIPLIER*hp)
		end
	end
end

-- add all entries of the tail table onto the end of the head table
function rn11_table_concat(head_table, tail_table)
	local offset = sizeof_table(head_table)
	for i, tail_entry_i in pairs(tail_table) do
		head_table[offset+i] = tail_entry_i
	end
end

function rn11_table_copy(source)
	local table_copy = {}
	for i,entry in pairs(source) do
		table_copy[i] = entry
	end
	return table_copy
end

function rn11_group_create_maybe_coop(group_always, group_coop, blocking)
	group_create(group_always, blocking)
	if (IN_COOP) then
		group_create(group_coop, blocking)
	end
end

function rn11_group_create_hidden_maybe_coop(group_always, group_coop)
	group_create_hidden(group_always)
	if (IN_COOP) then
		group_create_hidden(group_coop)
	end
end

function rn11_group_show_maybe_coop(group_always, group_coop)
	group_show(group_always)
	if (IN_COOP) then
		group_show(group_coop)
	end
end

function rn11_group_destroy_maybe_coop(group_always, group_coop)
	group_destroy(group_always)
	if (IN_COOP) then
		group_destroy(group_coop)
	end
end

function rn11_send_to_location(trigger, effect, helptext, gps)

	Rn11_location_reached = false

	-- enable the trigger, add a minimap icon, glow effect, waypoint, and callback
	trigger_enable(trigger,true)
	marker_add_trigger(trigger,MINIMAP_ICON_LOCATION,effect,SYNC_ALL)

	on_trigger("rn11_toggle_location_reached",trigger)
	
	if (gps) then
		mission_waypoint_add( trigger, SYNC_ALL )
	end

	-- display helptext
	if (helptext) then
		mission_help_table(helptext)
	end

	-- wait for player to arrive at the location
	while (not Rn11_location_reached) do
		thread_yield()
	end

	Rn11_location_reached = false
end

function rn11_toggle_location_reached(triggerer,trigger)
	Rn11_location_reached = true		
	trigger_enable(trigger, false)
	marker_remove_trigger(trigger, SYNC_ALL)
	on_trigger("",trigger)
	mission_waypoint_remove()
end

function rn11_junk_area_reached(triggerer,trigger)
	Junk_area_reached = true		
	trigger_enable(trigger, false)
	on_trigger("",trigger)
end

-- MISSION FAILURE FUNCTIONS --------------------------------

function rn11_failure_dock()
	-- End the mission, Dock not reached in time
	mission_end_failure(MISSION_NAME, HELPTEXT_FAILURE_DOCK)
end

function rn11_failure_follow()
	-- End the mission, Player(s) didn't follow the boats well enough
	mission_end_failure(MISSION_NAME, HELPTEXT_FAILURE_FOLLOW)
end

function rn11_failure_wong()
	-- End the mission, Wong died
	mission_end_failure(MISSION_NAME, HELPTEXT_FAILURE_WONG)
end
