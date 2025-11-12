-- tss01.lua
-- SR2 mission script
-- 04/25/08

-- Global Variables --

	-- This factor is applied to player damage in single player. 
	SINGLE_PLAYER_DAMAGE_MULTIPLIER = 0.50

	-- This factor is applied to player damage in co-op.
	COOP_DAMAGE_MULTIPLIER = 0.75

	-- German builds don't have a doctor
	DOCTOR_ALLOWED = (build_get_build_type() ~= BUILD_TYPE_GERMAN)
	
	-- 
	LISBON_TWEAKS_ENABLED = false

	-- In coop, NPC hit points are increased by this factor
	COOP_NPC_HP_MULTIPLIER	= 1.5

	-- When a player enters a vehicle, its max hit points are increased by this factor:
	PLAYER_VEHICLE_HIT_POINT_FACTOR = 5.0
	BULLHORN_DELAY_RANGE = {15,25}
	LAND_BULLHORN_DELAY_RANGE = {20,35}
	MAX_BULLHORN_DIST = 100

	COOP_SPAWNS_DISABLED = true

	-- A factor applied to the max hit points of the player's boat in the turret sequence.
	HIGH_SEAS_VEHICLE_HIT_POINTS = 5000

	-- The min delay between Carlos's boat-takes-damage lines in the turret sequence
	CARLOS_BOAT_DAMAGE_LINE_DELAY_MIN_S = 20
	-- The max delay between Carlos's boat-takes-damage lines in the turret sequence
	CARLOS_BOAT_DAMAGE_LINE_DELAY_MAX_S = 25
	-- The min delay between Carlos's attack lines in the turret sequence
	CARLOS_BOAT_ATTACK_LINE_DELAY_MIN_S = 10

-- The initial doors the player(s) have to interact with
Tss01_doors								= {"tss01_PI_jail_MeshMover080", "tss01_PI_jail_MeshMover110", 
												"tss01_PI_jail_MeshMover100", "tss01_PI_vkp_jail_FDoor030"}
Num_tss01_doors						= sizeof_table(Tss01_doors)

-- These doors are locked the entire mission
Tss01_locked_doors					= {"tss01_PI_jaildr_MeshMover030", "tss01_JailDoor530", "tss01_GateMM020", 
												"tss01_GateMM030", "tss01_GateMM040", "tss01_GateMM050",
												"tss01__pi_jail_meshmover12000"}
Num_tss01_locked_doors				= sizeof_table(Tss01_locked_doors)

-- This doors are reset if the mission is failed...
Tss01_reset_doors						= {"tss01_JailDoor470", "tss01_JailDoor280", "tss01_PI_vkp_jail_FDoor080", 
												"tss01_PI_vkp_jail_FDoor100", "tss01_JailDoor320", "tss01_JailDoor080", 
												"tss01_PI_vkp_jail_FDoor050"}
Num_tss01_reset_doors				= sizeof_table(Tss01_reset_doors)

-- This will do the initial open if the player falls off so he can't see it
Tss01_door_set_1						= {"tss01_JailDoor320", "tss01_JailDoor080", "tss01_$MMcourtyard_door"}
-- Once the player falls off, these doors need to be opened
Tss01_door_set_2						= {"tss01_JailDoor470", "tss01_JailDoor280", "tss01_PI_vkp_jail_FDoor080", 
												"tss01_PI_vkp_jail_FDoor100"}
Num_tss01_door_set_1					= sizeof_table(Tss01_door_set_1)
Num_tss01_door_set_2					= sizeof_table(Tss01_door_set_2)

--Tss01_alarm_ext_pos					= {"tss01_$alarm1", "tss01_$alarm2", "tss01_$alarm3"}
Tss01_alarm_ext_pos					= {"tss01_$alarm1", "tss01_$alarm2"}
Tss01_audio_ext_inst					= {0, 0}
Num_tss01_alarm_ext_pos				= sizeof_table(Tss01_alarm_ext_pos)

Tss01_prisoner_audio_ext_pos		= {"tss01_$n137", "tss01_$n138"}
Tss01_audio_prisoner_ext_inst		= {0, 0}
Num_tss01_prisoner_ext_pos			= sizeof_table(Tss01_prisoner_audio_ext_pos)

Tss01_prisoner_audio_int_pos		= {"tss01_$n139", "tss01_$n140"}
Tss01_audio_prisoner_int_inst		= {0, 0}
Num_tss01_prisoner_int_pos			= sizeof_table(Tss01_prisoner_audio_int_pos)

Tss01_alarm_int_pos					= {"tss01_$alarm4", "tss01_$alarm5", "tss01_$alarm6", "tss01_$alarm7", "tss01_$alarm8"}
Tss01_audio_int_inst					= {0, 0, 0, 0, 0}
Num_tss01_alarm_int_pos				= sizeof_table(Tss01_alarm_int_pos)

Tss01_loud_speaker_audio_inst					= 0
Tss01_heli_speaker_audio_inst					= 0
Tss01_boat_chase_heli_speaker_audio_inst	= 0

Tss01_waypoints						= {"tss01_$wp01", "tss01_$wp02", "tss01_$wp03", "tss01_$wp04", "tss01_$wp05", 
												"tss01_$wp06", "tss01_$wp07", "tss01_$wp08", "tss01_$wp09", "tss01_$wp10", 
												"tss01_$wp11", "tss01_$wp12"}
Num_tss01_waypoints					= sizeof_table(Tss01_waypoints)

Tss01_key_guards						= {"tss01_$guard1", "tss01_$guard2"}
Num_tss01_key_guards					= sizeof_table(Tss01_key_guards)

Tss01_cafe_guards						= {"tss01_$guard3", "tss01_$guard4"}
Num_tss01_cafe_guards				= sizeof_table(Tss01_cafe_guards)

Tss01_rooftop_guards					= {"tss01_$wp06", "tss01_$rt02", "tss01_$rt03", "tss01_$rt04"}
Num_tss01_rooftop_guards			= sizeof_table(Tss01_rooftop_guards)

Tss01_hide_points						= {"tss01_$n126", "tss01_$n127", "tss01_$n128", "tss01_$n129", "tss01_$n130", 
												"tss01_$n131", "tss01_$n132", "tss01_$n133", "tss01_$n134", "tss01_$n135"}
Num_tss01_hide_points				= sizeof_table(Tss01_hide_points)

Tss01_search_01						= {"tss01_$c008", "tss01_$c009"}
Num_tss01_search_01					= sizeof_table(Tss01_search_01)

Tss01_tut_t_road						= {"tss01_$c010", "tss01_$c011"}
Num_tss01_tut_t_road					= sizeof_table(Tss01_tut_t_road)

Tss01_fire_escape_guards			= {"tss01_$fe1", "tss01_$fe2", "tss01_$fe3"}
Num_tss01_fire_escape_guards		= sizeof_table(Tss01_fire_escape_guards)

Tss01_courtyard_guards				= {"tss01_$cy01", "tss01_$cy02", "tss01_$cy07", "tss01_$cy08", "tss01_$cy09"}
Num_tss01_courtyard_guards			= sizeof_table(Tss01_courtyard_guards)

Tss01_courtyard_guards_coop		= {"tss01_$cy00", "tss01_$cy04", "tss01_$cy05"}
Num_tss01_courtyard_guards_coop	= sizeof_table(Tss01_courtyard_guards_coop)

Tss01_run_gun_part1					= {"tss01_$c041", "tss01_$c042", "tss01_$c043", "tss01_$c044"}
Num_tss01_run_gun_part1				= sizeof_table(Tss01_run_gun_part1)

Tss01_run_gun_part2					= {"tss01_$c045", "tss01_$c046", "tss01_$c047", "tss01_$c048"}
Num_tss01_run_gun_part2				= sizeof_table(Tss01_run_gun_part2)

Tss01_dock_guards						= {"tss01_$dg01", "tss01_$dg02", "tss01_$dg03", "tss01_$dg04", "tss01_$dg05", 
												"tss01_$dg06", "tss01_$dg07", "tss01_$dg08", "tss01_$dg09"}
Num_tss01_dock_guards				= sizeof_table(Tss01_dock_guards)

Tss01_dock_guards_coop				= {"tss01_$dg10", "tss01_$dg11", "tss01_$dg12", "tss01_$dg13"}
Num_tss01_dock_guards_coop			= sizeof_table(Tss01_dock_guards_coop)

Tss01_random_guards					= {"tss01_$c013", "tss01_$c014", "tss01_$c015", "tss01_$c016", "tss01_$c019", 
												"tss01_$c020", "tss01_$c021", "tss01_$c024"}
Num_tss01_random_guards				= sizeof_table(Tss01_random_guards)

Tss01_random_guards_coop			= {"tss01_$c012", "tss01_$c017", "tss01_$c022", "tss01_$c023", "tss01_$c025"}
Num_tss01_random_guards_coop		= sizeof_table(Tss01_random_guards_coop)

Tss01_roadblock_guards				= {"tss01_$c032", "tss01_$c033", "tss01_$c036", "tss01_$c037"}
Num_tss01_roadblock_guards			= sizeof_table(Tss01_roadblock_guards)

Tss01_roadblock_guards_coop		= {"tss01_$c030", "tss01_$c031", "tss01_$c034", "tss01_$c035", "tss01_$c038"}
Num_tss01_roadblock_guards_coop	= sizeof_table(Tss01_roadblock_guards_coop)

Tss01_roadblock_cars					= {"tss01_$v004", "tss01_$v005", "tss01_$v006", "tss01_$v007",
												"tss01_$v007 (0)", "tss01_$v006 (0)", "tss01_$v014"}
Num_tss01_roadblock_cars			= sizeof_table(Tss01_roadblock_cars)

Tss01_warden_guards					= {"tss01_$wg01", "tss01_$wg02", "tss01_$wg04", "tss01_$wg05", "tss01_$wg06", 
												"tss01_$wg07", "tss01_$wg12", "tss01_$wg13", "tss01_$wg15"}
Num_tss01_warden_guards				= sizeof_table(Tss01_warden_guards)

Tss01_warden_rifle_guards			= {"tss01_$wg03", "tss01_$wg08", "tss01_$wg09", "tss01_$wg10", 
												"tss01_$wg11", "tss01_$wg14"}
Num_tss01_warden_rifle_guards		= sizeof_table(Tss01_warden_rifle_guards)

Tss01_lighthouse_rifle_guards			= {"tss01_$bd03", "tss01_$bd08", "tss01_$bd09", "tss01_$bd10", "tss01_$bd11"}
Num_tss01_lighthouse_rifle_guards	= sizeof_table(Tss01_lighthouse_rifle_guards)

Tss01_explore_triggers				= {"tss01_$ww1", "tss01_$ww2", "tss01_$ww3"}
Num_tss01_explore_triggers			= sizeof_table(Tss01_explore_triggers)

Tss01_pursuit_guards					= {"tss01_$pg1", "tss01_$pg2", "tss01_$pg3"}
Num_tss01_pursuit_guards			= sizeof_table(Tss01_pursuit_guards)

Tss01_boat1_table						= {"tss01_$c000", "tss01_$c000 (0)"}
Tss01_boat2_table						= {"tss01_$c000 (3)", "tss01_$c000 (4)"}
Tss01_boat3_table						= {"tss01_$c000 (7)", "tss01_$c000 (8)"}
Tss01_boat4_table						= {"tss01_$c000 (11)", "tss01_$c000 (12)"}
Tss01_boat5_table						= {"tss01_$c000 (15)", "tss01_$c000 (16)"}

Num_tss01_boat1_table				= sizeof_table(Tss01_boat1_table)
Num_tss01_boat2_table				= sizeof_table(Tss01_boat2_table)
Num_tss01_boat3_table				= sizeof_table(Tss01_boat3_table)
Num_tss01_boat4_table				= sizeof_table(Tss01_boat4_table)
Num_tss01_boat5_table				= sizeof_table(Tss01_boat5_table)

Tss01_heli1_table						= {"tss01_$c000 (19)", "tss01_$c000 (20)", "tss01_$c000 (21)", 
												"tss01_$c000 (22)", "tss01_$c000 (26)", "tss01_$c000 (30)"}
Tss01_heli2_table						= {"tss01_$c000 (23)", "tss01_$c000 (24)", "tss01_$c000 (25)", 
												"tss01_$c000 (31)", "tss01_$c000 (32)", "tss01_$c000 (33)"}
Tss01_heli3_table						= {"tss01_$c000 (27)", "tss01_$c000 (28)", "tss01_$c000 (29)", 
												"tss01_$c000 (34)", "tss01_$c000 (35)", "tss01_$c000 (36)"}

Num_tss01_heli1_table				= sizeof_table(Tss01_heli1_table)
Num_tss01_heli2_table				= sizeof_table(Tss01_heli2_table)
Num_tss01_heli3_table				= sizeof_table(Tss01_heli3_table)

Tss01_warning_issued					= {false, false}
Tss01_lights_tracking				= {false, false}
Tss01_light_track_msg				= true
Tss01_lights_tracking_carlos		= false
Tss01_boat_sequence_begun			= false

Num_fineaim_guards_killed			= 0

Num_in_yacht							= 0
Num_key_guards_killed				= 0

BACK_DOOR								= 1	-- Tutorial infirmary exit
FRONT_DOOR_1							= 2	-- Skip tutorial infirmary exit 1
FRONT_DOOR_2							= 3	-- Skip tutorial infirmary exit 2
KEY_DOOR									= 4	-- Tutorial - door after first kills (requires key)

BACK_DOOR_POS							= "tss01_$tutorial"
FRONT_DOOR_POS							= "tss01_$run_gun"

BACK_DOOR_TRIGGER						= "tss01_$tutorial_trigger"
FRONT_DOOR_TRIGGER					= "tss01_$run_gun_trigger"

Tss01_kill_doctor_issued			= false

Tss01_door_msg							= {"tss01_$tutorial", "tss01_$front1", "tss01_$front2"}
Num_tss01_door_msg					= sizeof_table(Tss01_door_msg)

IN_COOP									= false

MISSION_CHECKPOINT_BOAT				= "boat"
MISSION_CHECKPOINT_DOCKS			= "docks"

LOCAL_PLAYER_START					= "tss01_$local_player_start"
REMOTE_PLAYER_START					= "tss01_$remote_player_start"

LOCAL_PLAYER_FINISH					= "tss01_$local_player_finish"
REMOTE_PLAYER_FINISH					= "tss01_$remote_player_finish"

LOCAL_PLAYER_DEMO						= "tss01_$local_demo"
REMOTE_PLAYER_DEMO					= "tss01_$remote_demo"

GROUP_START								= "tss01_$start"
GROUP_DOCTOR							= "tss01_$doctor"

GROUP_ATTACK_HELI						= "tss01_$Glisbon"

GROUP_TUT_PRISONERS					= "tss01_$Gtut_prisoners"
GROUP_NON_TUT_PRISONERS				= "tss01_$Gnon_tut_prisoners"

GROUP_KEY_GUARDS						= "tss01_$key_guards"
GROUP_ROOFTOP							= "tss01_$rooftop"
GROUP_PURSUIT_GUARDS					= "tss01_$pursuit_guards"
GROUP_FIRE_ESCAPE						= "tss01_$fire_escape"
GROUP_TUT_SEARCH						= "tss01_$search"
GROUP_TUT_FINE_AIM					= "tss01_$fineaim"
GROUP_TUT_T_IN_ROAD					= "tss01_$tut_t"

GROUP_CAFE_GUARDS						= "tss01_$cafe_guards"
GROUP_2ND_FLOOR						= "tss01_$2nd_floor"
GROUP_3RD_FLOOR						= "tss01_$3rd_floor"
GROUP_COURTYARD						= "tss01_$courtyard"
GROUP_COURTYARD_COOP					= "tss01_$courtyard_coop"
GROUP_SHORTBUS							= "tss01_$shortbus"
GROUP_RUN_GUN							= "tss01_$run_gun"

GROUP_HELI								= "tss01_$heli"
GROUP_HELI_GUARDS						= "tss01_$heli_guards"
GROUP_RANDOM							= "tss01_$random"
GROUP_RANDOM_COOP						= "tss01_$random_coop"
GROUP_DOCKS								= "tss01_$docks"
GROUP_DOCKS_COOP						= "tss01_$docks_coop"
GROUP_WARDENS							= "tss01_$wardens"
GROUP_WARDENS_COOP					= "tss01_$wardens_coop"
GROUP_LIGHTHOUSE						= "tss01_$backdoor"
GROUP_LIGHTHOUSE_COOP				= "tss01_$backdoor_coop"
GROUP_ROADBLOCK						= "tss01_$roadblock"
GROUP_ROADBLOCK_COOP					= "tss01_$roadblock_coop"
GROUP_HELI_AMBUSH						= "tss01_$ambush"

GROUP_WAVE_1							= "tss01_$wave1"
GROUP_WAVE_2							= "tss01_$wave2"
GROUP_BOAT_1							= "tss01_$boat1"
GROUP_BOAT_2							= "tss01_$boat2"
GROUP_BOAT_3							= "tss01_$boat3"
GROUP_BOAT_4							= "tss01_$boat4"
GROUP_BOAT_5							= "tss01_$boat5"
GROUP_HELI_1							= "tss01_$heli1"
GROUP_HELI_2							= "tss01_$heli2"
GROUP_HELI_3							= "tss01_$heli3"

CHARACTER_CARLOS						= "tss01_$carlos"
CHARACTER_DOCTOR						= "tss01_$doctor"
CHARACTER_GUARD						= "tss01_$guard5"
CHARACTER_GUARD2						= "tss01_$guard10"

GUARD_ATTACK_DOOR						= "tss01_JailDoor470"
GUARD_OPEN_DOOR						= "tss01_JailDoor280"
GURAD_KICK_DOOR_POSITION1			= "tss01_$kick"
GURAD_KICK_DOOR_POSITION2			= "tss01_$kick2"

KEY_TRIGGER								= "tss01_$obtain_key"
JUMP_CLIMB_TRIGGER					= "tss01_$jump"
JUMP_CLIMB_TRIGGER_REPEAT			= "tss01_$climb"
CROUCH_TRIGGER							= "tss01_$crouch"
CROUCH_CARLOS_TRIGGER					= "tss01_$crouch_carlos"
MINIMAP_TRIGGER						= "tss01_$minimap"
FIRST_ROOFTOP_TRIGGER				= "tss01_$wp06b"
FINEAIM_START_TRIGGER				= "tss01_$fineaim_start"
FINEAIM_START_HELI_TRIGGER			= "tss01_$fine_aim_start_heli"
PROGRESS_HELI_TRIGGER				= "tss01_$health"
END_ROOFTOP_TRIGGER					= "tss01_$end_rooftop"
HELI_LAND_TRIGGER						= "tss01_$heli_land"
HELI_BACKUP_TRIGGER					= "tss01_$heli_backup"

RUN_GUN_SPRINT_TRIGGER				= "tss01_$run_gun_sprint_tut"
RUN_GUN_TRIGGER_1						= "tss01_$courtyard1"
RUN_GUN_TRIGGER_2						= "tss01_$courtyard2"
RUN_GUN_TRIGGER_3						= "tss01_$courtyard3"
RUN_GUN_TRIGGER_2ND_FLOOR			= "tss01_$2nd_floor"
RUN_GUN_TRIGGER_3RD_FLOOR			= "tss01_$3rd_floor"
BRIDGE_TRIGGER							= "tss01_$bridge"
ARMORY_TRIGGER							= "tss01_$carlos_armory"
CATWALK_TRIGGER						= "tss01_$catwalk"
FALL_TRIGGER_OPEN						= "tss01_$open_doors"
FALL_TRIGGER_CLOSE					= "tss01_$no_fall"
FALLEN_TRIGGER							= "tss01_$fall_off"
COURTYARD_SHOWDOWN_TRIGGER			= "tss01_$rush"
RUN_GUN_TRIGGER_4						= "tss01_$run_gun_start"

WARDONS_TRIGGER						= "tss01_$warden"
LIGHTHOUSE_TRIGGER					= "tss01_$lighthouse"
CANCEL_TRIGGER							= "tss01_$cancel"
HELI_AMBUSH_TRIGGER					= "tss01_$ambush_start"

YACHT_TRIGGER_2						= "tss01_$yacht02"
YACHT_TRIGGER_3						= "tss01_$yacht03"

PURSUIT_TRIGGER_1						= "tss01_$tgt1"
PURSUIT_TRIGGER_2						= "tss01_$tgt2"

WAYPOINT_11_TRIGGERED				= false
TEMP_WEAPONS_GIVEN					= false

TABLE_ALL_TRIGGERS = 
{	
	KEY_TRIGGER, JUMP_CLIMB_TRIGGER, JUMP_CLIMB_TRIGGER_REPEAT, CROUCH_TRIGGER, CROUCH_CARLOS_TRIGGER, 
	MINIMAP_TRIGGER, FIRST_ROOFTOP_TRIGGER, FINEAIM_START_TRIGGER, FINEAIM_START_HELI_TRIGGER, PROGRESS_HELI_TRIGGER, 
	END_ROOFTOP_TRIGGER, HELI_LAND_TRIGGER, HELI_BACKUP_TRIGGER, RUN_GUN_TRIGGER_1, RUN_GUN_TRIGGER_2, RUN_GUN_TRIGGER_3,
	RUN_GUN_TRIGGER_2ND_FLOOR, RUN_GUN_TRIGGER_3RD_FLOOR, BRIDGE_TRIGGER, ARMORY_TRIGGER, CATWALK_TRIGGER, FALL_TRIGGER_OPEN,
	FALL_TRIGGER_CLOSE, FALLEN_TRIGGER, COURTYARD_SHOWDOWN_TRIGGER, RUN_GUN_TRIGGER_4, WARDONS_TRIGGER, LIGHTHOUSE_TRIGGER,
	CANCEL_TRIGGER, HELI_AMBUSH_TRIGGER, YACHT_TRIGGER_2, YACHT_TRIGGER_3, PURSUIT_TRIGGER_1, PURSUIT_TRIGGER_2,
	BACK_DOOR_TRIGGER, FRONT_DOOR_TRIGGER, "tss01_$heli_crash",
}

FINE_AIM_VEHICLE						= "tss01_$v012"
SEARCH_VEHICLE_01						= "tss01_$v002"
SEARCH_VEHICLE_02						= "tss01_$v013"
T_IN_ROAD_VEHICLE						= "tss01_$v003"

RUN_GUN_PART1_VEHICLE				= "tss01_$v010"
RUN_GUN_PART2_VEHICLE				= "tss01_$v011"

SPOT_LIGHT_HELI						= "tss01_$heli"
HELI_AMBUSH_VEHICLE					= "tss01_$v008"
HIGH_SEAS_VEHICLE						= "tss01_$v000"

VEHICLE_ATTACK_HELI					= "tss01_$v015"

DOCTOR_THREAD_HANDLE1				= INVALID_THREAD_HANDLE
DOCTOR_THREAD_HANDLE2				= INVALID_THREAD_HANDLE
ALARM_THREAD_HANDLE					= INVALID_THREAD_HANDLE
CARLOS_THREAD_HANDLE					= INVALID_THREAD_HANDLE
AMBUSH_THREAD_HANDLE					= INVALID_THREAD_HANDLE
VEHICLE_HP_THREAD_HANDLE			= INVALID_THREAD_HANDLE
CARLOS_HIDE_THREAD_HANDLE			= INVALID_THREAD_HANDLE
SWIM_DISTANCE_THREAD_HANDLE		= INVALID_THREAD_HANDLE
CARLOS_AMBUSH_THREAD_HANDLE		= INVALID_THREAD_HANDLE

LOCAL_PLAYER_ON_2ND_ROOFTOP		= false
REMOTE_PLAYER_ON_2ND_ROOFTOP		= false

NAVP_BOAT_STAGING_LOCAL				= "tss01_$Nboat_staging_local"
NAVP_BOAT_STAGING_CARLOS			= "tss01_$Nboat_staging_carlos"
NAVP_BOAT_STAGING_REMOTE			= "tss01_$Nboat_staging_remote"

-- A failure condition is triggered when the players get too far from the island without
-- starting the turret sequence.
NAVP_ISLAND_CENTER					= "tss01_$Nisland_center"
MAX_SWIM_DISTANCE_M					= 325

VEHICLE_HEALTH_MULTIPLIER			= .625

PARKINGSPAWN01							= "parking_spots_$parking_343"
PARKINGSPAWN02							= "parking_spots_$parking_905"

-- This needs to come after Carlos being defined...
Tss01_carlos_exchange_1 = {{"CARLOS_TSSP1_CHATTER_01",	CHARACTER_CARLOS,	0.0},
									{"PLAYER_TSSP1_CHATTER_01",	LOCAL_PLAYER,		rand_float(0.25, 0.75)}}
Tss01_carlos_exchange_2 = {{"CARLOS_TSSP1_CHATTER_02",	CHARACTER_CARLOS,	0.0},
									{"PLAYER_TSSP1_CHATTER_02",	LOCAL_PLAYER,		rand_float(0.25, 0.75)}}
Tss01_carlos_exchange_3 = {{"CARLOS_TSSP1_CHATTER_03",	CHARACTER_CARLOS,	0.0},
									{"PLAYER_TSSP1_CHATTER_03",	LOCAL_PLAYER,		rand_float(0.25, 0.75)}}
Tss01_carlos_exchange_4 = {{"CARLOS_TSSP1_CHATTER_04",	CHARACTER_CARLOS,	0.0},
									{"PLAYER_TSSP1_CHATTER_04",	LOCAL_PLAYER,		rand_float(0.25, 0.75)}}
Tss01_carlos_exchange_5 = {{"CARLOS_TSSP1_CHATTER_05",	CHARACTER_CARLOS,	0.0},
									{"PLAYER_TSSP1_CHATTER_05",	LOCAL_PLAYER,		rand_float(0.25, 0.75)}}

OTHER_PLAYER = {[LOCAL_PLAYER] = REMOTE_PLAYER, [REMOTE_PLAYER] = LOCAL_PLAYER}

function tss01_start(checkpoint, is_restart)
	-- Start trigger is hit...the activate button was hit
	set_mission_author("Ryan Spencer")

	-- Check for coop being active
	if (coop_is_active()) then
		IN_COOP	= true
	end

	-- Reduce the amount of damage applied to the players
	if (IN_COOP) then
		character_set_damage_multiplier(REMOTE_PLAYER, COOP_DAMAGE_MULTIPLIER)
		character_set_damage_multiplier(LOCAL_PLAYER, COOP_DAMAGE_MULTIPLIER)
	else
		character_set_damage_multiplier(LOCAL_PLAYER, SINGLE_PLAYER_DAMAGE_MULTIPLIER)
	end

	-- Fade out of free roam...
	mission_start_fade_out()

	if (checkpoint == MISSION_START_CHECKPOINT) then

		local start_groups =	{	GROUP_TUT_PRISONERS, GROUP_NON_TUT_PRISONERS, GROUP_START, 
										GROUP_KEY_GUARDS, GROUP_CAFE_GUARDS }
		if (DOCTOR_ALLOWED) then
			start_groups =	{	GROUP_TUT_PRISONERS, GROUP_NON_TUT_PRISONERS, GROUP_START, 
									GROUP_KEY_GUARDS, GROUP_CAFE_GUARDS, GROUP_DOCTOR }			
		end

		if (is_restart) then
			for i,group in pairs(start_groups) do
				group_create(group, true)
			end

			-- Teleport the player(s) to where they will need to be
			teleport_coop(LOCAL_PLAYER_START, REMOTE_PLAYER_START)

		else
			cutscene_play("tssp01-01", start_groups, {LOCAL_PLAYER_START,REMOTE_PLAYER_START}, false)
			for i,group in pairs(start_groups) do
				group_show(group)
			end
		end
	end

	--group_create(GROUP_START, true)
	--checkpoint = MISSION_CHECKPOINT_DOCKS

	if (LISBON_TWEAKS_ENABLED) then
		group_create_hidden(GROUP_ATTACK_HELI)
	end

	-- Do the initial setup for each checkpoint of data that is not common
	if (checkpoint == MISSION_START_CHECKPOINT) then
		tss01_jailbreak_setup()
	elseif (checkpoint == MISSION_CHECKPOINT_DOCKS) then
		tss01_docks_checkpoint()
	else
		tss01_boat_checkpoint()
	end

	if (checkpoint ~= MISSION_CHECKPOINT_BOAT) then
		-- Increase the hp of vehicles that the players enter
		VEHICLE_HP_THREAD_HANDLE = thread_new("tss01_player_vehicle_health")
		-- Kill the players if they swim too far from the island
		SWIM_DISTANCE_THREAD_HANDLE = thread_new("tss01_monitor_swim_failure")
	end


	-- Don't allow the player(s) to be busted
	set_player_can_be_busted(LOCAL_PLAYER, false)
	if (IN_COOP) then
		set_player_can_be_busted(REMOTE_PLAYER, false)
	end

	-- Disable the parking spanws of the helicopter and boat from the mission in the off chance they choose to appear.
	parking_spot_enable(PARKINGSPAWN01, false)
	parking_spot_enable(PARKINGSPAWN02, false)

	-- When Carlos dies
	on_death("tss01_failure_carlos", CHARACTER_CARLOS)
	-- When Carlos is dismissed as a follower
	on_dismiss("tss01_abandon_carlos", CHARACTER_CARLOS)

	-- Lets do some persona override here...
	persona_override_character_stop_all(CHARACTER_CARLOS)
	persona_override_character_start(CHARACTER_CARLOS, POT_SITUATIONS[POT_ATTACK],			"CARLOS_TSSP1_ATKFOOT")
	persona_override_character_start(CHARACTER_CARLOS, POT_SITUATIONS[POT_TAKE_DAMAGE],		"CARLOS_TSSP1_DAMFOOT")
	persona_override_character_start(CHARACTER_CARLOS, POT_SITUATIONS[POT_PRAISED_BY_PC],	"CARLOS_TSSP1_PRAISED")
	persona_override_character_start(CHARACTER_CARLOS, POT_SITUATIONS[POT_TAUNTED_BY_PC],	"CARLOS_TSSP1_TAUNT")
	persona_override_character_start(CHARACTER_CARLOS, POT_SITUATIONS[POT_BARTER],			"CARLOS_TSSP1_BARTER")
	persona_override_character_start(CHARACTER_CARLOS, POT_SITUATIONS[POT_GRATS_PC],			"CARLOS_TSSP1_GRATSPLAYER")
	persona_override_character_start(CHARACTER_CARLOS, POT_SITUATIONS[POT_GRATS_SELF],		"CARLOS_TSSP1_GRATSSELF")

	-- Override the Cop personas
	persona_override_group_start(COP_PERSONAS, POT_SITUATIONS[POT_ATTACK], "TSSP1_ATTACK")

	-- Set the time of day to 3am
	set_time_of_day(3, 0)
	set_time_of_day_scale(0.0)

	-- Turn spawning off
	spawning_vehicles(false)
	spawning_pedestrians(false)
	--action_nodes_enable(false)
	action_nodes_restrict_spawning(true)
	--distant_ped_vehicle_render_enable(false)

	-- This is not a restricted zone during this mission
	notoriety_restricted_zones_enable(false)
	-- Turn notoriety spawning off
	notoriety_force_no_spawn("police", true)
	-- Set the initial notoriety
	notoriety_set_max("police", 0)

	-- All cops can shoot from vehicles...
	set_cops_shooting_from_vehicles(true)

	-- Fade in from the mission setup
	mission_start_fade_in()

	-- Do the final setup for each checkpoint of data that is not common
	-- NOTE: These are allowed to block...no common data should come after this section
	--
	if (checkpoint == MISSION_START_CHECKPOINT) then
		-- This delays and will not immediately return
		tss01_jailbreak_start()
	elseif (checkpoint == MISSION_CHECKPOINT_DOCKS) then
		-- Setup the docks segment
		tss01_to_the_docks_from_checkpoint()
	else
		-- This blocks and does not return until the boat has finished it's path...
		tss01_setup_boat_segment_from_checkpoint()
	end
end

function tss01_player_vehicle_health()

	local player_vehicle = {[LOCAL_PLAYER] = "", [REMOTE_PLAYER] = ""}

	local function update_player_vehicle_health(player)

		local new_vehicle = get_char_vehicle_name(player)

		-- Somehow I sometimes get player's names back from this function ... even though all
		-- vehicles in this mission are scripted. WTF?
		if ( (new_vehicle == LOCAL_PLAYER) or (new_vehicle == REMOTE_PLAYER) ) then
			new_vehicle = ""
		end

		-- Handle player exiting a vehicle
		local was_in_vehicle = ((player_vehicle[player] ~= ""))
		local vehicle_changed = (new_vehicle ~= player_vehicle[player])
		local player_vehicles_differ = (player_vehicle[player] ~= player_vehicle[OTHER_PLAYER[player]])
		if ( was_in_vehicle and vehicle_changed and player_vehicles_differ) then
			if (vehicle_exists(player_vehicle[player]) and (not vehicle_is_destroyed(player_vehicle[player]))) then
				local max_hp = get_max_hit_points(player_vehicle[player])
				set_max_hit_points(player_vehicle[player], max_hp / PLAYER_VEHICLE_HIT_POINT_FACTOR)
			end
		end

		-- Handle player entering a vehicle
		local now_in_vehicle = (new_vehicle ~= "")
		local player_already_in_vehicle = ((player_vehicle[player] == new_vehicle) or (player_vehicle[OTHER_PLAYER[player]] == new_vehicle))
		if (now_in_vehicle and (not player_already_in_vehicle) )then
			local max_hp = get_max_hit_points(new_vehicle)
			set_max_hit_points(new_vehicle, max_hp*PLAYER_VEHICLE_HIT_POINT_FACTOR )
		end

		player_vehicle[player] = new_vehicle

	end

	while(true) do
		thread_yield()
		update_player_vehicle_health(LOCAL_PLAYER)
		if (IN_COOP) then
			update_player_vehicle_health(REMOTE_PLAYER)
		end
	end

end

function tss01_spawn_tut_extras()

	npc_use_closest_action_node_of_type("tss01_$c053", "InmateScrubFloor")
	npc_use_closest_action_node_of_type("tss01_$c054", "InmateScrubFloor")
	inv_item_remove_all("tss01_$c053")
	inv_item_remove_all("tss01_$c054")
	delay(10)
	release_to_world(GROUP_TUT_PRISONERS)

end

function tss01_spawn_non_tut_extras()

	npc_use_closest_action_node_of_type("tss01_$c055", "PicnicTableSit")
	npc_use_closest_action_node_of_type("tss01_$c056", "PicnicTableSit")
	npc_use_closest_action_node_of_type("tss01_$c057", "PicnicTableSit")
	inv_item_remove_all("tss01_$c055")
	inv_item_remove_all("tss01_$c056")
	inv_item_remove_all("tss01_$c057")
	delay(15)
	release_to_world(GROUP_NON_TUT_PRISONERS)

end


function tss01_jailbreak_setup()

	thread_new("tss01_spawn_tut_extras")
	thread_new("tss01_spawn_non_tut_extras")

	-- The German build has no doctor
	if (DOCTOR_ALLOWED) then

		-- Disarm the doctor
		inv_item_remove_all(CHARACTER_DOCTOR)

		-- Place the on_death callback on the Dr. now, just in case the player manages to kill her
		-- more quickly than expected
		on_death("tss01_get_out_of_here", CHARACTER_DOCTOR)

		-- Also have her ignore ai
		set_ignore_ai_flag(CHARACTER_DOCTOR, true)

		-- Doctors use clipboards.
		npc_use_closest_action_node_of_type(CHARACTER_DOCTOR,"Doctor_Clipboard", 5)

	end

	-- Put Carlos in player's party
	party_add(CHARACTER_CARLOS, LOCAL_PLAYER)

	-- Don't allow Carlos to equip or unequip what he starts out with
	npc_dont_auto_equip_or_unequip_weapons(CHARACTER_CARLOS, true)

	-- Carlos is unarmed
	inv_item_remove_all(CHARACTER_CARLOS)
	inv_item_remove_all(LOCAL_PLAYER)
	if (IN_COOP) then
		inv_item_remove_all(REMOTE_PLAYER)
	end

	-- Setup the callbacks
	on_trigger("tss01_waypoint02", Tss01_waypoints[1])
	on_trigger("tss01_waypoint03", Tss01_waypoints[2])
	on_trigger("tss01_waypoint04", Tss01_waypoints[3])
	on_trigger("tss01_waypoint05", Tss01_waypoints[4])
	on_trigger("tss01_waypoint06", Tss01_waypoints[5])
	-- Waypoint 06 is a human and not a trigger...setup elsewhere
	on_trigger("tss01_waypoint08", Tss01_waypoints[7])
	on_trigger("tss01_waypoint09", Tss01_waypoints[8])
	on_trigger("tss01_waypoint12a", Tss01_waypoints[9])
	on_trigger("tss01_waypoint11", Tss01_waypoints[10])
	on_trigger("tss01_waypoint12b", Tss01_waypoints[11])
	on_trigger("tss01_waypoint_end", Tss01_waypoints[12])

	-- Disable all of the explore triggers
	for i = 1, Num_tss01_explore_triggers, 1 do
		on_trigger("tss01_explore_trigger", Tss01_explore_triggers[i])
	end

	-- Close all the doors used and lock them
	-- BACK_DOOR
	-- FRONT_DOOR_1
	-- FRONT_DOOR_2
	-- KEY_DOOR
	for i = 1, Num_tss01_doors, 1 do
		door_close(Tss01_doors[i])
		door_lock(Tss01_doors[i], true)
	end

	-- The door on open callbacks
	on_door_opened("tss01_backdoor", Tss01_doors[BACK_DOOR])
--	door_message_override(Tss01_doors[BACK_DOOR], "tss01_tutorial_door")
	on_door_opened("tss01_frontdoor", Tss01_doors[FRONT_DOOR_1])
--	door_message_override(Tss01_doors[FRONT_DOOR_1], "tss01_run_gun_door")
	on_door_opened("tss01_frontdoor", Tss01_doors[FRONT_DOOR_2])
--	door_message_override(Tss01_doors[FRONT_DOOR_2], "tss01_run_gun_door")

	-- Lock the permanently locked doors during this mission
	for i = 1, Num_tss01_locked_doors, 1 do
		door_close(Tss01_locked_doors[i])
		door_lock(Tss01_locked_doors[i], true)
	end

	for i = 1, Num_tss01_reset_doors, 1 do
		door_close(Tss01_reset_doors[i])
		door_lock(Tss01_reset_doors[i], false)
	end

	-- Tell the cafe guards to wander
	for i = 1, Num_tss01_cafe_guards, 1 do
		npc_leash_to_nav(Tss01_cafe_guards[i], Tss01_cafe_guards[i], 2.0)
		wander_start(Tss01_cafe_guards[i], Tss01_cafe_guards[i], 2.0)
		on_death("tss01_release_to_world", Tss01_cafe_guards[i])
	end

	-- Leash Carlos so the player has to do the beatdown
	npc_leash_to_nav(CHARACTER_CARLOS, CHARACTER_CARLOS, 1.0)
end

function tss01_docks_checkpoint()

	on_trigger("tss01_waypoint_end", Tss01_waypoints[12])

	-- Create our dock group
	group_create(GROUP_DOCKS, true)
	group_create(GROUP_ROADBLOCK, true)
	group_create_hidden(GROUP_RANDOM)
	group_create_hidden(GROUP_TUT_T_IN_ROAD)

	if (tss01_spawn_coop_groups()) then
		group_create_hidden(GROUP_DOCKS_COOP)
		group_create_hidden(GROUP_RANDOM_COOP)
		group_create_hidden(GROUP_ROADBLOCK_COOP)
	end
	
	-- Setup the drop off segment
	tss01_docks_drop_segment()
	-- Setup the heli crash segment
	tss01_docks_heli_segment()

	-- We do not want our yacht to be destroyed
	on_vehicle_destroyed("tss01_failure_yacht", HIGH_SEAS_VEHICLE)

	-- Enable Carlos's boat damage lines whenever the boat is damaged
	on_take_damage("tss01_enable_carlos_damage_line", HIGH_SEAS_VEHICLE)

	-- Up the health of the boat
	set_max_hit_points(HIGH_SEAS_VEHICLE, HIGH_SEAS_VEHICLE_HIT_POINTS, true)
	-- Make sure the vehicle is not entered...we just want to teleport everyone
	set_unjackable_flag(HIGH_SEAS_VEHICLE, true)

	-- Sound the alarms
	thread_new("tss01_sound_escape_alarms")
end

function tss01_docks_drop_segment()
	-- Show the heli and humans
	group_create(GROUP_HELI, true)
	group_create(GROUP_HELI_GUARDS, true)

	-- Put the humans in the heli
	vehicle_enter_teleport("tss01_$pilot", SPOT_LIGHT_HELI, 0)
	vehicle_enter_teleport("tss01_$spot1", SPOT_LIGHT_HELI, 4)
	vehicle_enter_teleport("tss01_$spot2", SPOT_LIGHT_HELI, 5)

	-- Make the heli unjackable
	set_unjackable_flag(SPOT_LIGHT_HELI, true)

	-- Make the heli's pilot invulnerable
	turn_invulnerable("tss01_$pilot", false)
	on_vehicle_destroyed("tss01_spot_light_heli_destroyed",SPOT_LIGHT_HELI)

	-- Update hit points for coop
	tss01_update_hit_points({"tss01_$pilot", "tss01_$spot1", "tss01_$spot2"})

	-- These guys need to suck at shooting...
	npc_weapon_spread("tss01_$spot1", tss01_get_weapon_spread(2.0))
	npc_weapon_spread("tss01_$spot2", tss01_get_weapon_spread(2.0))

	-- Turn some lights on
	vehicle_lights_on(SPOT_LIGHT_HELI, true)
	vehicle_set_sirens(SPOT_LIGHT_HELI, true)

	-- Spawn off a thread to do a small pathfind
	thread_new("tss01_checkpoint_heli_pathfind", SPOT_LIGHT_HELI, "tss01_$n047", "tss01_$n033")
end

function tss01_spot_light_heli_destroyed()
	if (character_exists("tss01_$pilot") and (not character_is_dead("tss01_$pilot"))) then
		turn_vulnerable("tss01_$pilot")
	end
end

function tss01_docks_heli_segment()
	-- Show the heli and humans
	group_create(GROUP_TUT_FINE_AIM, true)

	-- Put the humans in the heli
	vehicle_enter_teleport("tss01_$c050", FINE_AIM_VEHICLE, 0)
	vehicle_enter_teleport("tss01_$c051", FINE_AIM_VEHICLE, 4)
	vehicle_enter_teleport("tss01_$c052", FINE_AIM_VEHICLE, 5)

	-- These guys need to suck at shooting...
	npc_weapon_spread("tss01_$c051", tss01_get_weapon_spread(2.0))
	npc_weapon_spread("tss01_$c052", tss01_get_weapon_spread(2.0))

	tss01_update_hit_points({"tss01_$c050", "tss01_$c051", "tss01_$c052"})

	-- Turn some lights on
	vehicle_lights_on(FINE_AIM_VEHICLE, true)
	vehicle_set_sirens(FINE_AIM_VEHICLE, true)

	-- Turn this heli invulnerable
	set_unjackable_flag(FINE_AIM_VEHICLE, true)

	-- Spawn off a thread to do a small pathfind
	thread_new("tss01_checkpoint_heli_pathfind", FINE_AIM_VEHICLE, "tss01_$n100", "tss01_$n101")
end

function tss01_checkpoint_heli_pathfind(heli, warp, navpoint)
	-- Yield for a several frames
	thread_yield()
	thread_yield()
	thread_yield()
	-- Teleport the vehicle where we need it to be
	teleport_vehicle(heli, warp)
	-- Do the pathfind now
	helicopter_fly_to_direct(heli, 50.0, navpoint)
end

function tss01_boat_checkpoint()

	-- Create the first wave
	group_create_hidden(GROUP_WAVE_1)
	group_create_hidden(GROUP_BOAT_1)
	group_create_hidden(GROUP_BOAT_2)
	group_create_hidden(GROUP_BOAT_3)
	group_create_hidden(GROUP_HELI_1)

	-- Create the player's turret boat
	group_create(GROUP_DOCKS, true)
	delay(1.0)

	-- We do not want our yacht to be destroyed
	on_vehicle_destroyed("tss01_failure_yacht", HIGH_SEAS_VEHICLE)

	-- Enable Carlos's boat damage lines whenever the boat is damaged
	on_take_damage("tss01_enable_carlos_damage_line", HIGH_SEAS_VEHICLE)

	-- Up the health of the boat
	set_max_hit_points(HIGH_SEAS_VEHICLE, HIGH_SEAS_VEHICLE_HIT_POINTS, true)
	-- Make sure the vehicle is not entered...we just want to teleport everyone
	set_unjackable_flag(HIGH_SEAS_VEHICLE, true)
	
	-- Sound the alarms
	thread_new("tss01_sound_escape_alarms")

	-- Make sure that everyone is in the right spot in the boat
	tss01_place_turret_boat_occupants()

	teleport_vehicle(HIGH_SEAS_VEHICLE, HIGH_SEAS_VEHICLE)
end

function tss01_jailbreak_start()

	if( DOCTOR_ALLOWED ) then
		-- Setup the doctor's death callback
		on_death("tss01_get_out_of_here", CHARACTER_DOCTOR)

		-- Spawn off a thread to watch how close the player(s) are to the doctor
		DOCTOR_THREAD_HANDLE1 = thread_new("tss01_jailbreak_kill_doctor_distance")
		DOCTOR_THREAD_HANDLE2 = thread_new("tss01_jailbreak_kill_doctor_time")
	else
		tss01_get_out_of_here()
	end


	-- Delay a short period of time so the fade in can complete...
--	delay(1.0)
	-- Show the melee help text
--	mission_help_table_nag("tss01_melee")
end

-- Trigger the doctor-killing prompts if the player gets to close to the doctor
-- NOT CALLED ON GERMAN BUILDS
function tss01_jailbreak_kill_doctor_distance()

	local dr_react_dist = 5

	-- Wait until the thread is killed or one of the player is close enough to the doctor
	local		dist,player = get_dist_closest_player_to_object(CHARACTER_DOCTOR)
	local		close_to_doctor = (dist < dr_react_dist)

	while (not close_to_doctor) do
		thread_yield()

		dist,player = get_dist_closest_player_to_object(CHARACTER_DOCTOR)
		close_to_doctor = (dist < dr_react_dist)
	end

	-- Kill the time watch thread
	thread_kill(DOCTOR_THREAD_HANDLE2)

	-- Prompt players to kill the Dr.
	tss01_jailbreak_kill_doctor()

	audio_play_persona_line(CHARACTER_DOCTOR, "threat - alert (solo attack)")
end

-- Trigger the doctor-killing prompts after a bit of time passes
-- NOT CALLED ON GERMAN BUILDS
function tss01_jailbreak_kill_doctor_time()
	-- Delay just a short period of time
	delay(5.0)

	-- Kill the distance watch thread
	thread_kill(DOCTOR_THREAD_HANDLE1)

	-- Prompt players to kill the Dr.
	tss01_jailbreak_kill_doctor()
end

-- Tell the player to kill the doctor
-- NOT CALLED ON GERMAN BUILDS
Tss01_kill_doctor_sequence_started = false
function tss01_jailbreak_kill_doctor()
	if (Tss01_kill_doctor_sequence_started == false) then
		Tss01_kill_doctor_sequence_started = true

		-- Have the Dr. stop ignoring AI
		set_ignore_ai_flag(CHARACTER_DOCTOR, false)
		npc_use_closest_action_node_of_type(CHARACTER_DOCTOR,"Doctor_Clipboard", 5)
		--npc_use_closest_action_node_of_type(CHARACTER_DOCTOR,"Doctor_Clipboard", 5)

		-- Show the tutorial
		tutorial_start("combat")
		-- Delay for a moment
		delay(0.5)

		-- The doctor is now a required kill
		marker_add_npc(CHARACTER_DOCTOR, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL)
		-- Prompt the user to kill the doctor
		mission_help_table("tss01_doctor")
	end
end

function tss01_cleanup()

	-- Reset IN_COOP, in case the remote player disconnected
	IN_COOP = coop_is_active()

	-- Let players recruit again
	party_set_recruitable(false)

	-- Make sure players aren't invulnerable
	turn_vulnerable(LOCAL_PLAYER)
	if (IN_COOP) then
		turn_vulnerable(REMOTE_PLAYER)
	end

	-- Allow player persona lines to play.
	audio_suppress_ambient_player_lines(false)

	for i,trigger in pairs(TABLE_ALL_TRIGGERS) do
		on_trigger("", trigger)
		trigger_enable(trigger, false)
	end
	for i, trigger in pairs(Tss01_waypoints) do
		if (i ~= 6) then
			on_trigger("", trigger)
			trigger_enable(trigger, false)
		end
	end
	for i, trigger in pairs(Tss01_explore_triggers) do
		on_trigger("", trigger)
		trigger_enable(trigger, false)
	end

	on_vehicle_destroyed("", GROUP_BOAT_1)
	on_vehicle_destroyed("", GROUP_BOAT_2)
	on_vehicle_destroyed("", GROUP_BOAT_3)
	on_vehicle_destroyed("", GROUP_HELI_1)
	on_vehicle_destroyed("", GROUP_BOAT_4)
	on_vehicle_destroyed("", GROUP_BOAT_5)
	on_vehicle_destroyed("", GROUP_HELI_2)
	on_vehicle_destroyed("", GROUP_HELI_3)

	if (LISBON_TWEAKS_ENABLED) then
		vehicle_show(VEHICLE_ATTACK_HELI)
		vehicle_mark_as_players(VEHICLE_ATTACK_HELI)
		release_to_world(VEHICLE_ATTACK_HELI)
	end

	-- Re-enable the parking spanws of the helicopter and boat.
	parking_spot_enable(PARKINGSPAWN01, true)
	parking_spot_enable(PARKINGSPAWN02, true)

	-- Reset the amount of damage applied to the players
	character_set_damage_multiplier(LOCAL_PLAYER, 1.0)
	if (IN_COOP) then
		character_set_damage_multiplier(REMOTE_PLAYER, 1.0)
	end

	-- The player(s) can be busted again
	set_player_can_be_busted(LOCAL_PLAYER, true)
	if (IN_COOP) then
		set_player_can_be_busted(REMOTE_PLAYER, true)
	end

	-- Just reset all of the persona overrides...
	if (character_exists(CHARACTER_CARLOS)) then
		persona_override_character_stop_all(CHARACTER_CARLOS)
	end

	persona_override_group_stop(COP_PERSONAS, POT_SITUATIONS[POT_ATTACK])

	-- Reset the time of day scale factor
	set_time_of_day_scale()

	-- Remove the on weapon callbacks
	on_weapon_pickup("", LOCAL_PLAYER)
	if (IN_COOP) then
		on_weapon_pickup("", REMOTE_PLAYER)
	end

	on_weapon_equip("", LOCAL_PLAYER)
	if (IN_COOP) then
		on_weapon_equip("", REMOTE_PLAYER)
	end
	
	on_weapon_fired("", LOCAL_PLAYER)
	on_weapon_fired("", CHARACTER_CARLOS)
	if (IN_COOP) then
		on_weapon_fired("", REMOTE_PLAYER)
	end

	-- Invalidate the vehicle destroyed
	on_vehicle_destroyed("", HIGH_SEAS_VEHICLE)
	on_take_damage("", HIGH_SEAS_VEHICLE)

	-- Invalidate Carlos on death
	on_death("", CHARACTER_CARLOS)
	-- Invalidate the doctors death
	if (DOCTOR_ALLOWED) then
		on_death("", CHARACTER_DOCTOR)
	end

	-- Invalidate Carlos being dismissed
	on_dismiss("", CHARACTER_CARLOS)
	party_dismiss(CHARACTER_CARLOS)

	-- Remove the equip restriction from Carlos
	npc_dont_auto_equip_or_unequip_weapons(CHARACTER_CARLOS, false)

	-- Remove the player(s) searchlight callbacks
	on_searchlight_track("", LOCAL_PLAYER)
	on_searchlight_track("", CHARACTER_CARLOS)
	if (IN_COOP) then
		on_searchlight_track("", REMOTE_PLAYER)
	end

	-- Remove the damage callbacks
	on_damage("", LOCAL_PLAYER, 0.0)
	if (IN_COOP) then
		on_damage("", REMOTE_PLAYER, 0.0)
	end

	-- In case the hud timer is valid when the alarm triggers, we need to kill it
	hud_timer_stop(0)
	hud_timer_stop(1)
	-- Clear the hud from possible infinite showing text
	mission_help_clear()

	-- Invalidate the callback for this door
	on_door_opened("", "tss01_PI_vkp_jail_FDoor050")

	-- Remove the player(s) an assault rifle
	if (TEMP_WEAPONS_GIVEN) then
		inv_weapon_remove_temporary(LOCAL_PLAYER, "AR200_ss03")
		if (IN_COOP) then
			inv_weapon_remove_temporary(REMOTE_PLAYER, "AR200_ss03")
		end
	end

	-- Remove any weapon that is not in the melee, pistol, and shotgun slots
	inv_item_remove_in_slot( "smg", LOCAL_PLAYER)
	inv_item_remove_in_slot( "rifle", LOCAL_PLAYER)
	inv_item_remove_in_slot( "launcher", LOCAL_PLAYER)
	inv_item_remove_in_slot( "thrown", LOCAL_PLAYER)
	if (IN_COOP) then
		inv_item_remove_in_slot( "smg", REMOTE_PLAYER)
		inv_item_remove_in_slot( "rifle", REMOTE_PLAYER)
		inv_item_remove_in_slot( "launcher", REMOTE_PLAYER)
		inv_item_remove_in_slot( "thrown", REMOTE_PLAYER)
	end

	-- Enable all weapon slots...
	inv_weapon_enable_or_disable_all_slots(true)

	-- Turn the damage bar off
	damage_indicator_off(0)

	-- Let the player(s) exit
	set_player_can_enter_exit_vehicles(LOCAL_PLAYER, true)
	if (IN_COOP) then
		set_player_can_enter_exit_vehicles(REMOTE_PLAYER, true)
	end

	-- Reset all the doors used
	for i = 1, Num_tss01_doors, 1 do
		mesh_mover_reset(Tss01_doors[i])
		door_lock(Tss01_doors[i], false)
	end

	for i = 1, Num_tss01_locked_doors, 1 do
		mesh_mover_reset(Tss01_locked_doors[i])
		door_lock(Tss01_locked_doors[i], false)
	end

	for i = 1, Num_tss01_reset_doors, 1 do
		mesh_mover_reset(Tss01_reset_doors[i])
		door_lock(Tss01_reset_doors[i], false)
	end

	-- Remove the waypoint
	mission_waypoint_remove(SYNC_ALL)

	-- Turn spawning on
	spawning_vehicles(true)
	spawning_pedestrians(true)
	--action_nodes_enable(true)
	action_nodes_restrict_spawning(false)
	--distant_ped_vehicle_render_enable(true)

	-- Turn notoriety spawning on
	notoriety_force_no_spawn("police", false)
	notoriety_reset("police")
	notoriety_restricted_zones_enable(true)

	-- Cops can no longer shoot from vehicles
	set_cops_shooting_from_vehicles(false)

	-- Stop the alarms and prison riot sounds that might be playing
	for i = 1, Num_tss01_alarm_ext_pos, 1 do
		if (Tss01_audio_ext_inst[i] ~= 0) then
			audio_stop_emitting_id(Tss01_audio_ext_inst[i])
		end
	end

	for i = 1, Num_tss01_alarm_int_pos, 1 do
		if (Tss01_audio_int_inst[i] ~= 0) then
			audio_stop_emitting_id(Tss01_audio_int_inst[i])
		end
	end

	for i = 1, Num_tss01_prisoner_ext_pos, 1 do
		if (Tss01_audio_prisoner_ext_inst[i] ~= 0) then
			audio_stop_emitting_id(Tss01_audio_prisoner_ext_inst[i])
		end
	end

	for i = 1, Num_tss01_prisoner_int_pos, 1 do
		if (Tss01_audio_prisoner_int_inst[i] ~= 0) then
			audio_stop_emitting_id(Tss01_audio_prisoner_int_inst[i])
		end
	end

	audio_stop(Tss01_loud_speaker_audio_inst)
	audio_stop(Tss01_heli_speaker_audio_inst)
	audio_stop(Tss01_boat_chase_heli_speaker_audio_inst)

	--[[
	-- Remove the player(s) from the vehicle first...
	vehicle_exit_teleport(LOCAL_PLAYER)
	if (IN_COOP) then
		vehicle_exit_teleport(REMOTE_PLAYER)
	end

	if ( not mission_is_complete( "tss01" ) ) then
		if(coop_is_active()) then
			teleport( REMOTE_PLAYER, REMOTE_PLAYER_START, true)
		end
		teleport( LOCAL_PLAYER, LOCAL_PLAYER_START, true )		
		door_close(Tss01_doors[BACK_DOOR])
		door_lock(Tss01_doors[BACK_DOOR], true)
		door_close(Tss01_doors[FRONT_DOOR_1])
		door_lock(Tss01_doors[FRONT_DOOR_1], true)
		door_close(Tss01_doors[FRONT_DOOR_2])
		door_lock(Tss01_doors[FRONT_DOOR_2], true)
	end
	]]

end

function tss01_success()
	-- Called when the mission has ended with success

	-- Post the news events
	radio_post_event("JANE_NEWS_TSSP01", true)

	-- Remove the player(s) from the vehicle first...
	character_evacuate_from_all_vehicles(LOCAL_PLAYER)
	if (IN_COOP) then
		character_evacuate_from_all_vehicles(REMOTE_PLAYER)
	end

	-- Teleport the player(s) to where they will need to be
	if (is_demo_execution()) then
		teleport(LOCAL_PLAYER, LOCAL_PLAYER_DEMO)
		if (coop_is_active()) then
			teleport(REMOTE_PLAYER, REMOTE_PLAYER_DEMO)
		end
	end

	-- Show the autosave tutorial
	tutorial_start("autosave", 3000)
end

function tss01_monitor_swim_failure()

	-- In coop, there might be a brief period when we think that our partner is further away than they actually are.
	-- So don't start checking the distance immediately. It'll take awhile to get that far out anyway.
	delay(20)

	-- Get the furthest distance from the prison island's center to a player
	local function get_current_dist()
		local max_dist = get_dist(LOCAL_PLAYER, NAVP_ISLAND_CENTER)
		if(coop_is_active()) then
			max_dist = max(max_dist, get_dist(REMOTE_PLAYER, NAVP_ISLAND_CENTER))
		end
		return max_dist
	end

	-- Wait until a player is too far from the island
	while(get_current_dist() < MAX_SWIM_DISTANCE_M) do
		delay(0.25)
		thread_yield()
	end

	-- Too far, Carlos is abandoned
	tss01_abandon_carlos()
end

function tss01_failure_carlos()
	-- End the mission since Carlos was killed
	mission_end_failure("tss01", "tss01_carlos_died")
end

function tss01_abandon_carlos()
	-- End the mission since Carlos was abandoned
	mission_end_failure("tss01", "tss01_carlos_abandoned")
end

function tss01_failure_yacht()
	-- End the mission since the yacht was destroyed
	mission_end_failure("tss01", "tss01_yacht_destroyed")
end

function tss01_release_to_world(human)
	-- Release the human to the world
	release_to_world(human)
end

function tss01_get_out_of_here()
	-- Remove the marker
	if ( DOCTOR_ALLOWED ) then
		marker_remove_npc(CHARACTER_DOCTOR, SYNC_ALL)
	end

	-- Make sure Carlos is no longer leashed...
	npc_leash_remove(CHARACTER_CARLOS)

	-- Delay for a short period of time
	delay(2.0)
	-- Play audio line for Carlos
	tss01_audio_play_for_character("CARLOS_TSSP1_ESCAPE", CHARACTER_CARLOS, "voice", false, true)

	-- Show the objective
--	mission_help_table("tss01_choose")

	-- Unlock the doors
--	door_lock(Tss01_doors[BACK_DOOR], false)
--	door_lock(Tss01_doors[FRONT_DOOR_1], false)
--	door_lock(Tss01_doors[FRONT_DOOR_2], false)

	-- Delay a little while
--	delay(4.0)

	delay(0.5)

	-- In Coop, make sure that no one can die while the vint dialog box is up. 
	if (IN_COOP) then
		while(not (character_is_ready(LOCAL_PLAYER) and character_is_ready(REMOTE_PLAYER)) ) do
			thread_yield()
		end
		turn_invulnerable(LOCAL_PLAYER, false)
		turn_invulnerable(REMOTE_PLAYER, false)
	end

	local	path_choice = open_vint_dialog("tss01_choose", "tss01_body", "tss01_tutorial", "tss01_run_gun")

	if (IN_COOP) then
		turn_vulnerable(LOCAL_PLAYER)
		turn_vulnerable(REMOTE_PLAYER)
	end

	if (path_choice == 0) then
		door_lock(Tss01_doors[BACK_DOOR], false)

		trigger_enable(BACK_DOOR_TRIGGER, true)
		on_trigger("tss01_disable_exit_trigger", BACK_DOOR_TRIGGER)
		marker_add_trigger(BACK_DOOR_TRIGGER, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)
	else
		door_lock(Tss01_doors[FRONT_DOOR_1], false)
		door_lock(Tss01_doors[FRONT_DOOR_2], false)

		trigger_enable(FRONT_DOOR_TRIGGER, true)
		on_trigger("tss01_disable_exit_trigger", FRONT_DOOR_TRIGGER)
		marker_add_trigger(FRONT_DOOR_TRIGGER, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)
	end

	-- Spawn a thread to show the necessary messages
--	thread_new("tss01_what_path")
end

function tss01_disable_exit_trigger(human, trigger)
	-- Disable the trigger
	trigger_enable(trigger, false)
	-- Remove the marker
	marker_remove_trigger(trigger, SYNC_ALL)
end

function tss01_what_path()
	local	back_door_closed = not door_is_open(Tss01_doors[BACK_DOOR])
	local front_doors_closed = not door_is_open(Tss01_doors[FRONT_DOOR_1]) and not door_is_open(Tss01_doors[FRONT_DOOR_2])

	local local_was_near_back = false
	local remote_was_near_back = false
	local local_was_near_front = false
	local remote_was_near_front = false
	local local_was_near_door = false
	local remote_was_near_door = false

	-- Check player distances until a door is no longer closed
	while (back_door_closed and front_doors_closed) do
		local		local_close_to_back = (get_dist_char_to_nav(LOCAL_PLAYER, BACK_DOOR_POS) < 9.0)
		local		local_close_to_front = (get_dist_char_to_nav(LOCAL_PLAYER, FRONT_DOOR_POS) < 11.0)
		local		remote_close_to_back = false
		local		remote_close_to_front = false

		if (IN_COOP) then
			remote_close_to_back = (get_dist_char_to_nav(REMOTE_PLAYER, BACK_DOOR_POS) < 9.0)
			remote_close_to_front = (get_dist_char_to_nav(REMOTE_PLAYER, FRONT_DOOR_POS) < 11.0)
		end

		local		local_close_to_door_msg = false
		local		remote_close_to_door_msg = false

		-- Check to see if we need to show the door message
		for i = 1, Num_tss01_door_msg, 1 do
			if (get_dist_char_to_nav(LOCAL_PLAYER, Tss01_door_msg[i]) < 1.5) then
				local_close_to_door_msg = true
				break
			end
		end

		if (IN_COOP) then
			for i = 1, Num_tss01_door_msg, 1 do
				if (get_dist_char_to_nav(REMOTE_PLAYER, Tss01_door_msg[i]) < 1.5) then
					remote_close_to_door_msg = true
					break
				end
			end
		end
		
		-- Check the local player
		if (not local_was_near_back and local_close_to_back and not local_close_to_door_msg) then
			mission_help_table_nag("tss01_tutorial", nil, nil, SYNC_LOCAL)
		elseif (local_close_to_back and local_was_near_door and not local_close_to_door_msg) then
			mission_help_table_nag("tss01_tutorial", nil, nil, SYNC_LOCAL)
		elseif (not local_was_near_front and local_close_to_front and not local_close_to_door_msg) then
			mission_help_table_nag("tss01_run_gun", nil, nil, SYNC_LOCAL)
		elseif (local_close_to_front and local_was_near_door and not local_close_to_door_msg) then
			mission_help_table_nag("tss01_run_gun", nil, nil, SYNC_LOCAL)
		elseif (local_was_near_back and not local_close_to_back) then
			mission_help_clear(SYNC_LOCAL)
		elseif (local_was_near_front and not local_close_to_front) then
			mission_help_clear(SYNC_LOCAL)
		elseif (not local_was_near_door and local_close_to_door_msg) then
			mission_help_clear(SYNC_LOCAL)
		end

		-- Check the remote player
		if (not remote_was_near_back and remote_close_to_back and not remote_close_to_door_msg) then
			mission_help_table_nag("tss01_tutorial", nil, nil, SYNC_REMOTE)
		elseif (remote_close_to_back and remote_was_near_door and not remote_close_to_door_msg) then
			mission_help_table_nag("tss01_tutorial", nil, nil, SYNC_REMOTE)
		elseif (not remote_was_near_front and remote_close_to_front and not remote_close_to_door_msg) then
			mission_help_table_nag("tss01_run_gun", nil, nil, SYNC_REMOTE)
		elseif (remote_close_to_front and remote_was_near_door and not remote_close_to_door_msg) then
			mission_help_table_nag("tss01_run_gun", nil, nil, SYNC_REMOTE)
		elseif (remote_was_near_back and not remote_close_to_back) then
			mission_help_clear(SYNC_REMOTE)
		elseif (remote_was_near_front and not remote_close_to_front) then
			mission_help_clear(SYNC_REMOTE)
		elseif (not remote_was_near_door and remote_close_to_door_msg) then
			mission_help_clear(SYNC_REMOTE)
		end

		-- Update our variables
		local_was_near_back = local_close_to_back
		remote_was_near_back = remote_close_to_back
		local_was_near_front = local_close_to_front
		remote_was_near_front = remote_close_to_front
		local_was_near_door = local_close_to_door_msg
		remote_was_near_door = remote_close_to_door_msg

		-- Wait to check again
		thread_yield()
		-- Check the doors
		back_door_closed = not door_is_open(Tss01_doors[BACK_DOOR])
		front_doors_closed = not door_is_open(Tss01_doors[FRONT_DOOR_1]) and not door_is_open(Tss01_doors[FRONT_DOOR_2])
	end
end

function tss01_carlos_can_use_melee_weapons()
	-- Continually look at Carlos' melee slot
	while (1) do
		local		item_in_slot = inv_item_in_slot(CHARACTER_CARLOS, "melee")

		-- Check to see if the weapon in this slot is equipped
		if (not inv_item_is_equipped(item_in_slot, CHARACTER_CARLOS)) then
			-- Equip this item
			inv_item_equip(item_in_slot, CHARACTER_CARLOS)
		end

		-- Only need to check every second or so
		delay(1.0)
	end
end

function tss01_jump_climb_first_time(human, trigger)
	-- Changed to help text
	mission_help_table_nag("tss01_jump_climb")

	-- NOTE: Not changing this...there use to be a line that played here only the first time
	--		this type of trigger was hit...keeping in case things change
	
	-- After this has been hit the first time, the callback changes
	on_trigger("tss01_jump_climb", JUMP_CLIMB_TRIGGER)
	-- Enable the trigger exit callback
	on_trigger_exit("tss01_jump_climb_exit", JUMP_CLIMB_TRIGGER)
	on_trigger_exit("tss01_jump_climb_exit", JUMP_CLIMB_TRIGGER_REPEAT)
end

function tss01_jump_climb()
	-- Show the jump/climb message now
	mission_help_table_nag("tss01_jump_climb")

	-- Enable the trigger exit callback
	on_trigger_exit("tss01_jump_climb_exit", JUMP_CLIMB_TRIGGER)
	on_trigger_exit("tss01_jump_climb_exit", JUMP_CLIMB_TRIGGER_REPEAT)
end

function tss01_jump_climb_exit()
	-- Disable the trigger exit
	on_trigger_exit("", JUMP_CLIMB_TRIGGER)
	on_trigger_exit("", JUMP_CLIMB_TRIGGER_REPEAT)
	-- Clear the mission help message when these triggers are exited
	mission_help_clear()
end

function tss01_start_crouch(human, trigger)
	-- The human to enter the trigger needs to be the local player
	if (((human == LOCAL_PLAYER) or (human == REMOTE_PLAYER)) and (trigger == CROUCH_TRIGGER)) then
		-- Show help text about crouching...
		mission_help_table_nag("tss01_crouch")

		-- Enable the crouch trigger callback for the player
		on_trigger_exit("tss01_crouch_exit", CROUCH_TRIGGER)
	end
end

function tss01_crouch_exit()
	-- Disable the callback
	on_trigger_exit("", CROUCH_TRIGGER)
	-- Clear the mission help message when this trigger is exited
	mission_help_clear()
end

function tss01_start_crouch_carlos(human)
	-- This trigger only needs to process Carlos
	if (human == CHARACTER_CARLOS) then
		-- Force Carlos to start crouching
		crouch_start(CHARACTER_CARLOS, true)
	end
end

function tss01_stop_crouch_carlos(human)
	-- This trigger only needs to process Carlos
	if (human == CHARACTER_CARLOS) then
		-- Force Carlos to stop crouching
		crouch_stop(CHARACTER_CARLOS)
	end
end

function tss01_backdoor()
	-- Lock the front doors
	door_lock(Tss01_doors[FRONT_DOOR_1], true)
	door_lock(Tss01_doors[FRONT_DOOR_2], true)

	door_message_override(Tss01_doors[BACK_DOOR], "")
	door_message_override(Tss01_doors[FRONT_DOOR_1], "")
	door_message_override(Tss01_doors[FRONT_DOOR_2], "")

	-- Remove the callbacks
	on_door_opened("", Tss01_doors[BACK_DOOR])
	on_door_opened("", Tss01_doors[FRONT_DOOR_1])
	on_door_opened("", Tss01_doors[FRONT_DOOR_2])

	-- Spawn off a thread to force Carlos to equip a melee weapon if he picks it up
	CARLOS_THREAD_HANDLE = thread_new("tss01_carlos_can_use_melee_weapons")

	trigger_enable(JUMP_CLIMB_TRIGGER, true)
	on_trigger("tss01_jump_climb_first_time", JUMP_CLIMB_TRIGGER)
	
	trigger_enable(JUMP_CLIMB_TRIGGER_REPEAT, true)
	on_trigger("tss01_jump_climb", JUMP_CLIMB_TRIGGER_REPEAT)
	
	trigger_enable(CROUCH_CARLOS_TRIGGER, true)
	on_trigger("tss01_start_crouch_carlos", CROUCH_CARLOS_TRIGGER)
	on_trigger_exit("tss01_stop_crouch_carlos", CROUCH_CARLOS_TRIGGER)

	trigger_enable(CROUCH_TRIGGER, true)
	on_trigger("tss01_start_crouch", CROUCH_TRIGGER)

	tss01_tutorial()
end

function tss01_frontdoor()
	-- Lock the back door
	door_lock(Tss01_doors[BACK_DOOR], true)

	door_message_override(Tss01_doors[BACK_DOOR], "")
	door_message_override(Tss01_doors[FRONT_DOOR_1], "")
	door_message_override(Tss01_doors[FRONT_DOOR_2], "")

	-- Remove the callbacks
	on_door_opened("", Tss01_doors[BACK_DOOR])
	on_door_opened("", Tss01_doors[FRONT_DOOR_1])
	on_door_opened("", Tss01_doors[FRONT_DOOR_2])

	-- Check to see if this mission has already been completed
	if (not mission_is_complete("tss01")) then
		-- We chose the non-tutorial route (the front door)
		--
		-- Set the mission globals variable for having not taken the tutorial path
		--
		Tss01_tutorial_route_chosen = false
	end

	trigger_enable(RUN_GUN_SPRINT_TRIGGER, true)
	on_trigger("tss01_sprint_tut", RUN_GUN_SPRINT_TRIGGER)

	tss01_blazing_guns()
end


function tss01_sprint_tut()

	-- Disable the trigger
	on_trigger("", RUN_GUN_SPRINT_TRIGGER)
	trigger_enable(RUN_GUN_SPRINT_TRIGGER, false)
	
	-- Show the checkpoint tutorial
	tutorial_start("sprint")

end

function tss01_tutorial()
	-- Destroy the cafeteria guards
	group_destroy(GROUP_CAFE_GUARDS)
	-- Destroy the Run & Gun Prisoners
	group_destroy(GROUP_NON_TUT_PRISONERS)
	-- Setup the callback to show the next objective
	on_door_opened("tss01_kill_guards", "tss01_PI_vkp_jail_FDoor050")
	-- Play exchange between Carlos and the Player
	thread_new("tss01_audio_play_conversation", Tss01_carlos_exchange_1)
end

function tss01_carlos_make_dependent()
	if(CARLOS_HIDE_THREAD_HANDLE ~= INVALID_THREAD_HANDLE) then
		thread_kill(CARLOS_HIDE_THREAD_HANDLE )
		CARLOS_HIDE_THREAD_HANDLE  = INVALID_THREAD_HANDLE
	end
	follower_make_independent(CHARACTER_CARLOS, false)
end

function tss01_carlos_move(point, speed)

	if (speed == nil) then
		speed = 3
	end

	-- If Carlos is knocked out, wait for revival
	while (follower_is_unconscious(CHARACTER_CARLOS)) do
		thread_yield()
	end

	if (character_is_in_vehicle(CHARACTER_CARLOS)) then
		return
	end

	-- Make Carlos idle first
	npc_go_idle(CHARACTER_CARLOS)
	-- Yield for one thread cycle
	thread_yield()
	-- Move Carlos to point
	move_to_safe(CHARACTER_CARLOS, point, speed, true)
end

Tss01_kill_guards_triggered = false
function tss01_kill_guards()

	--[[
	local debug_text = "tss01_kill_guards, Tss01_kill_guards_triggered = "
	if (Tss01_kill_guards_triggered == false) then
		debug_text = debug_text .. "false"		
	else
		debug_text = debug_text .. "true"		
	end
	mission_debug(debug_text, 10, -1)
	]]

	if (Tss01_kill_guards_triggered == false) then

		Tss01_kill_guards_triggered = true

		-- We do not want this callback to happen again
		on_door_opened("", "tss01_PI_vkp_jail_FDoor050")

		for i = 1, Num_tss01_key_guards, 1 do
			on_death("tss01_tutorial_guard_death", Tss01_key_guards[i])
			marker_add_npc(Tss01_key_guards[i], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
			attack(Tss01_key_guards[i])
		end

		
		-- If the doctor isn't allowed in this build, display the melee combat tutorial here
		if (not DOCTOR_ALLOWED ) then
			delay(1.0)
			tutorial_start("combat")
		end

		-- Show the kill guards text
		delay(1.5)
		mission_help_table("tss01_kill_guards")

	end
end

function tss01_tutorial_guard_death(human)
	-- Remove the callback
	on_death("", human)
	-- Remove the marker
	marker_remove_npc(human)

	-- Release this bad boy to the world
	release_to_world(human)

	-- Increment the count
	Num_key_guards_killed = Num_key_guards_killed + 1

	-- If the condition is met, proceed to have Carlos take the lead
	if (Num_key_guards_killed == Num_tss01_key_guards) then
		-- Carlos needs to be alive
		while (follower_is_unconscious(CHARACTER_CARLOS)) do
			thread_yield()
		end

		-- Have Carlos take the lead
		follower_make_independent(CHARACTER_CARLOS, true)

		-- Play audio line for Carlos
		tss01_audio_play_for_character("CARLOS_TSSP1_TUTORIAL", CHARACTER_CARLOS, "voice", false, true)

		-- Tell the player to follow Carlos to the roof
		mission_help_table("tss01_follow")

		-- Enable the first waypoint
		tss01_waypoint01()

		-- Carlos should not flinch or ragdoll from here to the roof
		character_prevent_flinching(CHARACTER_CARLOS, true)
		character_allow_ragdoll(CHARACTER_CARLOS, false)
		turn_invulnerable(CHARACTER_CARLOS)

		-- Kepp the players away from the doors
		thread_new("tss01_keep_player_away_from_door", LOCAL_PLAYER)
		if (IN_COOP) then
			thread_new("tss01_keep_player_away_from_door", REMOTE_PLAYER)
		end

		-- Tell Carlos to go to the door
		tss01_carlos_move(KEY_TRIGGER, 3)
	end
end

-- Keep the players away from the door that Carlos is supposed to be kicking open.
function tss01_keep_player_away_from_door(player)

	local controls_disabled = false
	local door = Tss01_doors[KEY_DOOR]
	local navs = {[LOCAL_PLAYER] = "tss01_$n142", [REMOTE_PLAYER] = "tss01_$n143"}

	while(not door_is_open(door)) do
		thread_yield()
		if ( (get_dist(player, door) < 2) and (not controls_disabled)) then
			controls_disabled = true
			player_controls_disable(player)

			-- Make Carlos not collide w/ other humans 
			npc_enable_human_collision(CHARACTER_CARLOS, false)
			
			move_to_safe(player, navs[player], 2, true)
		end
	end

	delay(.5)

	-- Make Carlos collide w/ other humans
	npc_enable_human_collision(CHARACTER_CARLOS, true)

	if(controls_disabled) then
		player_controls_enable(player)
	end

end


function tss01_blazing_guns()
	-- Destroy the key guards
	group_destroy(GROUP_KEY_GUARDS)

	-- Destroy the tutorial path extras
	group_destroy(GROUP_TUT_PRISONERS)

	-- Enable the trigger used when going to the armory
	trigger_enable(RUN_GUN_TRIGGER_2ND_FLOOR, true)
	on_trigger("tss01_2nd_floor_setup", RUN_GUN_TRIGGER_2ND_FLOOR)

	-- Enable the trigger used when we enter the court yard
	trigger_enable(RUN_GUN_TRIGGER_1, true)
	on_trigger("tss01_courtyard_setup", RUN_GUN_TRIGGER_1)

	-- Enable the door open callback
	thread_new("tss01_guard_attack")

	-- Sound the audio if it hasn't been already
	if (ALARM_THREAD_HANDLE == INVALID_THREAD_HANDLE) then
		ALARM_THREAD_HANDLE = thread_new("tss01_escape_alarms", false, false, true)
	end

	-- Have this guard use his best weapon
--	npc_unholster_best_weapon(Tss01_cafe_guards[CAFE_GUARD_WEAPON])
	-- This guard can't hit shit
--	npc_weapon_spread(Tss01_cafe_guards[CAFE_GUARD_WEAPON], 4.0)

	-- This will trigger the fine aim tutorial...since it is new we want to show it
	on_weapon_fired("tss01_blazing_weapon_fired", LOCAL_PLAYER)
	if (IN_COOP) then
		on_weapon_fired("tss01_blazing_weapon_fired", REMOTE_PLAYER)
	end

	-- Spawn off a thread to tell the guards to attack
	thread_new("tss01_guards_attack")

	-- If the doctor isn't allowed in this build, display the melee combat tutorial here
	if (not DOCTOR_ALLOWED ) then
		delay(1.0)
		tutorial_start("combat")
	end

	-- Play audio line for Carlos
	tss01_audio_play_for_character("CARLOS_TSSP1_RUNGUN_3", CHARACTER_CARLOS, "voice", false, true)

	-- Prompt the user with help text
	mission_help_table("tss01_docks")

	tss01_waypoint10()

	-- Delay for for a short period of time...
	delay(0.5)

	-- Play the exchange between Carlos and the player
	tss01_audio_play_conversation(Tss01_carlos_exchange_1)
end

function tss01_guards_attack()
	-- Delay for a short period of time
	delay(1.0)
	
	-- Have the cafe guards attack the player if they have not already
	for i = 1, Num_tss01_cafe_guards, 1 do
		npc_leash_remove(Tss01_cafe_guards[i])
		attack(Tss01_cafe_guards[i], CLOSEST_PLAYER)
	end
end

function tss01_blazing_weapon_fired(human, weapon, name)
	-- Only do this for when a weapon is fired
	if (name ~= "firearm") then
		return
	end
	
	-- Do not allow this callback to happen again
	on_weapon_fired("", LOCAL_PLAYER)
	if (IN_COOP) then
		on_weapon_fired("", REMOTE_PLAYER)
	end

	-- Do the tutorial

	-- Disabled for now in the run and gun path
--	tutorial_start("combat_fineaim", 500, true)
end

function tss01_sound_escape_alarms()

	thread_new("tss01_prisoners_riot")
	thread_new("tss01_bullhorn_audio")

	local	audio_ext_id = audio_get_id("SFX_ALARM_5", "foley")
	local	audio_int_id = audio_get_id("SFX_ALARM_3", "foley")

	-- Fire off the exterior alarms
	for i = 1, Num_tss01_alarm_ext_pos, 1 do
		if (Tss01_audio_ext_inst[i] == 0) then
			Tss01_audio_ext_inst[i] = audio_play_emitting_id_for_navpoint(Tss01_alarm_ext_pos[i], audio_ext_id)
		end
	end

	-- Fire off the interior alarms
	for i = 1, Num_tss01_alarm_int_pos, 1 do
		if (Tss01_audio_int_inst[i] == 0) then
			Tss01_audio_int_inst[i] = audio_play_emitting_id_for_navpoint(Tss01_alarm_int_pos[i], audio_int_id)
		end
	end

end

function tss01_prisoners_riot()

	delay(1.0)

	local	prisoner_audio_ext_id = audio_get_id("SFX_TSS01_PRISONERS_OUTDOOR", "foley")
	local	prisoner_audio_int_id = audio_get_id("SFX_TSS01_PRISONERS_INDOOR", "foley")

	-- Fire off the external alarms
	for i = 1, Num_tss01_prisoner_ext_pos, 1 do
		if (Tss01_audio_prisoner_ext_inst[i] == 0) then
			Tss01_audio_prisoner_ext_inst[i] = audio_play_emitting_id_for_navpoint(Tss01_prisoner_audio_ext_pos[i], prisoner_audio_ext_id)
		end
	end

	-- Fire off the interior alarms
	for i = 1, Num_tss01_prisoner_int_pos, 1 do
		if (Tss01_audio_prisoner_int_inst[i] == 0) then
			Tss01_audio_prisoner_int_inst[i] = audio_play_emitting_id_for_navpoint(Tss01_prisoner_audio_int_pos[i], prisoner_audio_int_id)
		end
	end

end

function tss01_bullhorn_audio()
	
	delay(0.5)

	local speaker_sfx = {"SFX_TSS01_BULLHORN_01", "SFX_TSS01_BULLHORN_02", "SFX_TSS01_BULLHORN_03", "SFX_TSS01_BULLHORN_04", "SFX_TSS01_BULLHORN_05"}
	local num_speaker_sfx = sizeof_table(speaker_sfx)

	local heli_list = {SPOT_LIGHT_HELI, HELI_AMBUSH_VEHICLE, FINE_AIM_VEHICLE}

	local recent_sfx = { "", "" }
	local function get_next_sfx()

		while(true) do
			local next_sfx = speaker_sfx[rand_int(1,num_speaker_sfx)]
			if ( (next_sfx ~= recent_sfx[1]) and (next_sfx ~= recent_sfx[2]) ) then
				recent_sfx[1],recent_sfx[2] = next_sfx, recent_sfx[1]
				return next_sfx
			end
		end

	end

	while (not Tss01_boat_sequence_begun) do

		thread_yield()

		-- Just wait a bit if audio is already playing
		if audio_is_playing(Tss01_loud_speaker_audio_inst) then
			thread_yield()
		else
			local dist, player = get_dist_closest_player_to_object("tss01_$bullhorn_1")
			if (dist < MAX_BULLHORN_DIST) then
				local	audio_id, type = audio_get_id(get_next_sfx(), "foley")
				Tss01_loud_speaker_audio_inst = audio_play_id_for_navpoint("tss01_$bullhorn_1", audio_id, type)
				delay(rand_int(LAND_BULLHORN_DELAY_RANGE[1], LAND_BULLHORN_DELAY_RANGE[2]))
			end
		end

		-- Just wait a bit if audio is already playing
		if audio_is_playing(Tss01_heli_speaker_audio_inst) then
			thread_yield()
		else

			-- Build a list of helis that can emit bullhorn audio
			local nearby_helis = {}
			local num_nearby_helis = 0
			for i, heli in pairs(heli_list) do 
				if (	vehicle_exists(heli) and 
						(not vehicle_hidden(heli)) and 
						(not vehicle_is_destroyed(heli)) and 
						((vehicle_get_driver(heli) ~= nil)) ) then
					local dist, player = get_dist_closest_player_to_object(heli)
					if (dist < MAX_BULLHORN_DIST) then
						num_nearby_helis = num_nearby_helis + 1
						nearby_helis[num_nearby_helis] = heli
					end
				end
			end

			-- Play the audio at a randomly selected heli from our list
			if (num_nearby_helis > 0) then
				local heli = nearby_helis[rand_int(1,num_nearby_helis)]
				local	audio_id, type = audio_get_id(get_next_sfx(), "foley")
				local driver = vehicle_get_driver(heli)
				if (driver ~= nil) then
					Tss01_heli_speaker_audio_inst = audio_play_id_for_character(vehicle_get_driver(heli), audio_id, type)
					delay(rand_int(BULLHORN_DELAY_RANGE[1], BULLHORN_DELAY_RANGE[2]))
				end
			end


		end

	end

end

function tss01_boat_chase_bullhorn_audio()
	
	delay(0.5)

	local heli_list = {GROUP_HELI, GROUP_HELI_1, GROUP_HELI_2, GROUP_HELI_3}

	while (1) do

		thread_yield()

		-- Just wait a bit if audio is already playing
		if (	audio_is_playing(Tss01_boat_chase_heli_speaker_audio_inst)
				or audio_is_playing(Tss01_loud_speaker_audio_inst)
				or audio_is_playing(Tss01_heli_speaker_audio_inst)
			) then
			thread_yield()
		else
		-- Select a random nearby heli and have them play
			local nearby_helis = {}
			local num_nearby_helis = 0
			for i, heli in pairs(heli_list) do 
				if (	vehicle_exists(heli) and 
						(not vehicle_hidden(heli)) and 
						(not vehicle_is_destroyed(heli)) and 
						((vehicle_get_driver(heli) ~= nil)) ) then
					local dist, player = get_dist_closest_player_to_object(heli)
					if (dist < MAX_BULLHORN_DIST) then
						num_nearby_helis = num_nearby_helis + 1
						nearby_helis[num_nearby_helis] = heli
					end
				end
			end

			if (num_nearby_helis > 0) then
				local heli = nearby_helis[rand_int(1,num_nearby_helis)]
				local	audio_id, type = audio_get_id("SFX_TSS01_BOATMEGA", "foley")
				local driver = vehicle_get_driver(heli)
				if (driver ~= nil) then
					Tss01_boat_chase_heli_speaker_audio_inst = audio_play_id_for_character(vehicle_get_driver(heli), audio_id, type)
					delay(rand_int(BULLHORN_DELAY_RANGE[1], BULLHORN_DELAY_RANGE[2]))
				end
			end

		end

	end

end

function tss01_escape_alarms(carlos_speaks, fired_shot, do_delay)
	-- Remove the searchlight callback
	on_searchlight_track("", LOCAL_PLAYER)
	on_searchlight_track("", CHARACTER_CARLOS)
	if (IN_COOP) then
		on_searchlight_track("", REMOTE_PLAYER)
	end

	-- In case the hud timer is valid when the alarm triggers, we need to kill it
	hud_timer_stop(0)
	hud_timer_stop(1)

	-- Clear the hud from possible infinite showing text
	mission_help_clear()

	-- Make sure Carlos is a dependent
	tss01_carlos_make_dependent()

	-- Delay a short period of time before sounding the alarms
	if (do_delay) then
		delay(rand_float(2.0, 4.0))
	end

	-- Kill the thread that watches Carlos and what he has equiped
	thread_kill(CARLOS_THREAD_HANDLE)

	-- Carlos can use a firearm weapon now
	npc_dont_auto_equip_or_unequip_weapons(CHARACTER_CARLOS, false)
	npc_unholster_best_weapon(CHARACTER_CARLOS)

	-- Set the notoriety for the rest of the mission
	notoriety_set_max("police", 1)
	notoriety_set_min("police", 1)

	-- Spawn off a new thread to handle the helicopter attacking
	thread_new("tss01_escape_heli", carlos_speaks, fired_shot)

	-- Do we need to play an audio line?
	if (carlos_speaks == true) then
		if (fired_shot == true) then
			-- Play audio line for Carlos
			tss01_audio_play_for_character("CARLOS_TSSP1_TRIGGER_ALARM_01", CHARACTER_CARLOS, "voice")
		else
			-- Play audio line for Carlos
			tss01_audio_play_for_character("CARLOS_TSSP1_ALARM", CHARACTER_CARLOS, "voice")
		end
	end

	tss01_sound_escape_alarms()
end

function tss01_escape_heli(tutorial, early_alarm)
	-- Create the heli group...block create
	if (not group_is_loaded(GROUP_HELI)) then
		group_create(GROUP_HELI, true)
	end
	group_create_hidden(GROUP_HELI_GUARDS)

	-- Delay and then have the helicopter attack
	if (not tutorial or early_alarm) then
		delay(rand_float(12.0, 18.0))
	else
		delay(rand_float(2.0, 8.0))
	end

	-- Show the heli and humans
	group_show(GROUP_HELI)
	group_show(GROUP_HELI_GUARDS)

	-- Put the humans in the heli
	vehicle_enter_teleport("tss01_$pilot", SPOT_LIGHT_HELI, 0)
	vehicle_enter_teleport("tss01_$spot1", SPOT_LIGHT_HELI, 4)
	vehicle_enter_teleport("tss01_$spot2", SPOT_LIGHT_HELI, 5)

	-- These guys need to suck at shooting...
	npc_weapon_spread("tss01_$spot1", tss01_get_weapon_spread(2.0))
	npc_weapon_spread("tss01_$spot2", tss01_get_weapon_spread(2.0))

	tss01_update_hit_points({"tss01_$spot1", "tss01_$spot2", "tss01_$pilot"})

	-- Turn some lights on
	vehicle_lights_on(SPOT_LIGHT_HELI, true)
	vehicle_set_sirens(SPOT_LIGHT_HELI, true)

	-- Spawn a thread to send the attack message after the heli is in the air
	thread_new("tss01_escape_heli_attack")

	-- If the alarm was set off early have the heli go slow...otherwise speed to where we need to go
	if (tutorial) then
		if (early_alarm) then
			-- Fly slowly into position to shoot at player on 2nd roof top
			helicopter_fly_to_direct(SPOT_LIGHT_HELI, 15.0, "tss01_$path011")

			-- Enable the progress heli trigger
			trigger_enable(PROGRESS_HELI_TRIGGER, true)
			on_trigger("tss01_progress_heli", PROGRESS_HELI_TRIGGER)
		else
			-- Fly quicly to get into position to drop off the spotters as gunmen
			helicopter_fly_to_direct(SPOT_LIGHT_HELI, 50.0, "tss01_$path013")
		end
	else
		-- Just fly above the courtyard and wait
		helicopter_fly_to_direct(SPOT_LIGHT_HELI, 35.0, "tss01_$path012")
	end
end

function tss01_escape_heli_attack()
	-- Delay for a short period of time
	delay(1.0)
	-- Tell the spotters to attack
	attack("tss01_$spot1")
	attack("tss01_$spot2")
end

function tss01_progress_heli()
	-- Disable this trigger as it is no longer needed
	trigger_enable(PROGRESS_HELI_TRIGGER, false)

	-- Fly slowly into position to shoot at player on 3rd roof top
	helicopter_fly_to_direct(SPOT_LIGHT_HELI, 15.0, "tss01_$path011a")
end

function tss01_cancel_pursuit(human)
	-- Set the 2nd rooftop flags...
	if (human == LOCAL_PLAYER) then
		LOCAL_PLAYER_ON_2ND_ROOFTOP = false
	elseif (human == REMOTE_PLAYER) then
		REMOTE_PLAYER_ON_2ND_ROOFTOP = false
	end
end

function tss01_activate_pursuit(human)
	-- Deactivate the searchlights, etc.
	tss01_deactivate_searchlights(human)

	-- Set the 2nd rooftop flags...
	if (human == LOCAL_PLAYER) then
		LOCAL_PLAYER_ON_2ND_ROOFTOP = true
	elseif (human == REMOTE_PLAYER) then
		REMOTE_PLAYER_ON_2ND_ROOFTOP = true
	else
		return
	end

	-- Act accordingly
	if (IN_COOP) then
		if (LOCAL_PLAYER_ON_2ND_ROOFTOP and REMOTE_PLAYER_ON_2ND_ROOFTOP) then
			tss01_setup_pursuit_guards()
		end
	elseif (LOCAL_PLAYER_ON_2ND_ROOFTOP) then
		tss01_setup_pursuit_guards()
	end
end

function tss01_activate_searchlights(human)
	-- Check to see if the alarm is already sounding...
	if (not (ALARM_THREAD_HANDLE == INVALID_THREAD_HANDLE)) then
		-- Disable the triggers
		trigger_enable(PURSUIT_TRIGGER_1, false)
		trigger_enable(PURSUIT_TRIGGER_2, false)
		return
	end

	-- Check who needs to have this activation
	if (human == LOCAL_PLAYER) then
		on_weapon_fired("tss01_tutorial_weapon_fired", LOCAL_PLAYER)
		on_searchlight_track("tss01_searchlight_track", LOCAL_PLAYER)
	elseif (human == REMOTE_PLAYER) then
		on_weapon_fired("tss01_tutorial_weapon_fired", REMOTE_PLAYER)
		on_searchlight_track("tss01_searchlight_track", REMOTE_PLAYER)
	elseif (human == CHARACTER_CARLOS) then
		on_weapon_fired("tss01_tutorial_weapon_fired_carlos", CHARACTER_CARLOS)
		on_searchlight_track("tss01_searchlight_track_carlos", CHARACTER_CARLOS)
	end
end

function tss01_deactivate_searchlights(human)
	-- Check who needs to have this de-activation
	if (human == LOCAL_PLAYER) then
		-- Remove the on weapon fired and searchlight callback
		on_weapon_fired("", LOCAL_PLAYER)
		on_searchlight_track("", LOCAL_PLAYER)
		-- In case the hud timer is valid when the alarm triggers, we need to kill it
		hud_timer_stop(0)
		-- Stop the help text
		mission_help_clear(SYNC_LOCAL)

		-- Remove the on weapon fired and searchlight callback
		on_weapon_fired("", CHARACTER_CARLOS)
		on_searchlight_track("", CHARACTER_CARLOS)
		-- Make sure Carlos is a dependent
		tss01_carlos_make_dependent()
	elseif (human == REMOTE_PLAYER) then
		-- Remove the on weapon fired and searchlight callback
		on_weapon_fired("", REMOTE_PLAYER)
		on_searchlight_track("", REMOTE_PLAYER)
		-- In case the hud timer is valid when the alarm triggers, we need to kill it
		hud_timer_stop(1)
		-- Stop the help text
		mission_help_clear(SYNC_REMOTE)
	elseif (human == CHARACTER_CARLOS) then
		-- Remove the on weapon fired and searchlight callback
		on_weapon_fired("", CHARACTER_CARLOS)
		on_searchlight_track("", CHARACTER_CARLOS)
	end
end

function tss01_setup_pursuit_guards()
	-- Has the alarm been set off?
	if (ALARM_THREAD_HANDLE == INVALID_THREAD_HANDLE) then
		-- Redirect these triggers...
		on_trigger("tss01_deactivate_searchlights", PURSUIT_TRIGGER_1)
		on_trigger("tss01_activate_searchlights", PURSUIT_TRIGGER_2)
	else
		-- Disable the triggers
		trigger_enable(PURSUIT_TRIGGER_1, false)
		trigger_enable(PURSUIT_TRIGGER_2, false)
	end

	-- Create the group
	group_create(GROUP_PURSUIT_GUARDS, true)

	-- Tell the guards to attack the player(s)
	for i = 1, Num_tss01_pursuit_guards, 1 do
		attack(Tss01_pursuit_guards[i])
		npc_weapon_spread(Tss01_pursuit_guards[i], tss01_get_weapon_spread(4.0))
		on_death("tss01_release_to_world", Tss01_pursuit_guards[i])
	end
	tss01_update_hit_points(Tss01_pursuit_guards)
end

function tss01_guard_attack()
	-- Remove the leash
	npc_leash_remove(CHARACTER_GUARD)

	-- Open the 1st door (This is out of sight of the pcs, we're pretending a guard opened it.)
	door_open(GUARD_OPEN_DOOR, true)

	-- Move the guard into position to kick open the door.
	npc_combat_enable(CHARACTER_GUARD, false)
	move_to_safe(CHARACTER_GUARD, GURAD_KICK_DOOR_POSITION2, 3, true, true)
	turn_to_orient(CHARACTER_GUARD, GURAD_KICK_DOOR_POSITION2)

	-- Play the door kick animation and audio
	action_play(CHARACTER_GUARD, "kick door", nil, true, 0.5, true)
	npc_combat_enable(CHARACTER_GUARD, true)
	audio_play("DOOR_KICK", "foley", false)

	-- Start opening the door and wait for it to open
	door_open(GUARD_ATTACK_DOOR, true)
	delay(1.0)

	-- Attack the player
	attack(CHARACTER_GUARD)

	-- We want this guy to react half way through
	thread_new("tss01_second_guard_attack")

end

function tss01_second_guard_attack()
	-- Delay this guy a bit
	delay(0.8)
	-- Remove the leash for the second guard
	npc_leash_remove(CHARACTER_GUARD2)
	-- Attack the player
	attack(CHARACTER_GUARD2)
end

function tss01_2nd_floor_setup()
	-- Disable this trigger
	trigger_enable(RUN_GUN_TRIGGER_2ND_FLOOR, false)

	-- Enable the next trigger
	trigger_enable(RUN_GUN_TRIGGER_3RD_FLOOR, true)
	on_trigger("tss01_3rd_floor_setup", RUN_GUN_TRIGGER_3RD_FLOOR)

	-- Create the 2nd floor guards
	group_create(GROUP_2ND_FLOOR)
	group_show(GROUP_2ND_FLOOR)
end

function tss01_3rd_floor_setup()
	-- Disable this trigger
	trigger_enable(RUN_GUN_TRIGGER_3RD_FLOOR, false)

	-- Create the 2nd floor guards
	group_create(GROUP_3RD_FLOOR)
	group_show(GROUP_3RD_FLOOR)
end

function tss01_create_shortbus_and_add_cops()
	-- Create the shortbuss hidden
	group_create_hidden(GROUP_SHORTBUS)

	-- Add the passengers to the bus
	vehicle_enter_teleport("tss01_$c001", "tss01_$bus", 0)
	vehicle_enter_teleport("tss01_$c002", "tss01_$bus", 1)
	vehicle_enter_teleport("tss01_$c006", "tss01_$bus", 2)
	vehicle_enter_teleport("tss01_$c007", "tss01_$bus", 3)

	-- Add the passengers to the car
	vehicle_enter_teleport("tss01_$c039", "tss01_$v009", 0)
	vehicle_enter_teleport("tss01_$c040", "tss01_$v009", 1)

	-- These guys can't hit shit
	npc_weapon_spread("tss01_$c001", tss01_get_weapon_spread(4.0))
	npc_weapon_spread("tss01_$c002", tss01_get_weapon_spread(4.0))
	npc_weapon_spread("tss01_$c006", tss01_get_weapon_spread(4.0))
	npc_weapon_spread("tss01_$c007", tss01_get_weapon_spread(4.0))
	npc_weapon_spread("tss01_$c039", tss01_get_weapon_spread(4.0))
	npc_weapon_spread("tss01_$c040", tss01_get_weapon_spread(4.0))

	tss01_update_hit_points({"tss01_$c001", "tss01_$c002", "tss01_$c006", "tss01_$c007", "tss01_$c039", "tss01_$c040"})

	-- Enable the trigger to activate the sequence
	trigger_enable(COURTYARD_SHOWDOWN_TRIGGER, true)
	on_trigger("tss01_courtyard_showdown", COURTYARD_SHOWDOWN_TRIGGER)
end

function tss01_reset_my_infinite_mass_status(human, vehicle, seat)
	-- Make sure the human is the driver
	if (not (seat == 0)) then
		return
	end
	-- Remove the callback
	on_vehicle_exit("", vehicle)
	-- Turn infinite mass off
	vehicle_infinite_mass(vehicle, false)
end

function tss01_courtyard_showdown()
	-- Disable the trigger
	trigger_enable(COURTYARD_SHOWDOWN_TRIGGER, false)

	-- Show the hidden shortbus group...also has a car now
	group_show(GROUP_SHORTBUS)

	-- Give both of these vehicle infinite mass
	vehicle_infinite_mass("tss01_$v009", true)
	on_vehicle_exit("tss01_reset_my_infinite_mass_status", "tss01_$v009")
	vehicle_infinite_mass("tss01_$bus", true)
	on_vehicle_exit("tss01_reset_my_infinite_mass_status", "tss01_$bus")

	-- Lower the health of these vehicles
	set_max_hit_points("tss01_$v009", get_max_hit_points("tss01_$v009") * VEHICLE_HEALTH_MULTIPLIER, true)
	set_max_hit_points("tss01_$bus", get_max_hit_points("tss01_$bus") * VEHICLE_HEALTH_MULTIPLIER, true)

	-- Turn the lights on
	vehicle_lights_on("tss01_$v009", true)
	vehicle_set_sirens("tss01_$v009", true)

	-- Have the vehicle pathfind to the the courtyard
	if ( not vehicle_is_destroyed("tss01_$v009") ) then
		vehicle_pathfind_to("tss01_$v009", "tss01_$path005", true, true)
		if (not character_is_dead("tss01_$c039")) then
			vehicle_exit_do("tss01_$c039", false, false, false)
		end
		if (not character_is_dead("tss01_$c040")) then
			vehicle_exit_do("tss01_$c040", false, false, false)
		end
	end

	-- Turn the lights on
	vehicle_lights_on("tss01_$bus", true)
	vehicle_set_sirens("tss01_$bus", true)
	
	-- Have the vehicle pathfind to the courtyard
	vehicle_pathfind_to("tss01_$bus", "tss01_$n049", true, true)
	-- Make sure the bus stops
	vehicle_stop("tss01_$bus")
	-- Make sure the bus occupants exit
	vehicle_exit_do("tss01_$c001", false, false, false)
	vehicle_exit_do("tss01_$c002", false, false, false)
	vehicle_exit_do("tss01_$c006", false, false, false)
	vehicle_exit_do("tss01_$c007", false, false, false)
end

function tss01_courtyard_setup()
	-- Disable this trigger
	trigger_enable(RUN_GUN_TRIGGER_1, false)

	-- Enable the next trigger
	trigger_enable(RUN_GUN_TRIGGER_2, true)
	on_trigger("tss01_courtyard_enter", RUN_GUN_TRIGGER_2)

	-- Create the court yard guards as hidden
	if (not group_is_loaded(GROUP_COURTYARD)) then
		group_create_hidden(GROUP_COURTYARD)
		
		-- Tell the courtyard guards to wander
		for i = 1, Num_tss01_courtyard_guards, 1 do
			wander_start(Tss01_courtyard_guards[i], Tss01_courtyard_guards[i], 5.0)
			npc_weapon_spread(Tss01_courtyard_guards[i], tss01_get_weapon_spread(4.0))
			on_death("tss01_release_to_world", Tss01_courtyard_guards[i])
		end
		tss01_update_hit_points(Tss01_courtyard_guards)

		if (tss01_spawn_coop_groups()) then
			group_create_hidden(GROUP_COURTYARD_COOP)
		
			for i = 1, Num_tss01_courtyard_guards_coop, 1 do
				wander_start(Tss01_courtyard_guards_coop[i], Tss01_courtyard_guards_coop[i], 5.0)
				npc_weapon_spread(Tss01_courtyard_guards_coop[i], 4.0)
				on_death("tss01_release_to_world", Tss01_courtyard_guards_coop[i])
			end
		end
	end

	-- Create the shortbus guards as hidden
	if (not group_is_loaded(GROUP_SHORTBUS)) then
		tss01_create_shortbus_and_add_cops()
	end
end

function tss01_courtyard_enter()
	-- Show the hidden courtyard group
	group_show(GROUP_COURTYARD)

	if (tss01_spawn_coop_groups()) then
		group_show(GROUP_COURTYARD_COOP)
	end

	-- Disable this trigger
	trigger_enable(RUN_GUN_TRIGGER_2, false)

	-- Enable the next trigger
	trigger_enable(RUN_GUN_TRIGGER_3, true)
	on_trigger("tss01_docks_setup", RUN_GUN_TRIGGER_3)

	-- Create the docks guards as hidden
	group_create_hidden(GROUP_DOCKS)
	group_create_hidden(GROUP_RANDOM)
	group_create_hidden(GROUP_ROADBLOCK)

	if (tss01_spawn_coop_groups()) then
		group_create_hidden(GROUP_DOCKS_COOP)
		group_create_hidden(GROUP_RANDOM_COOP)
		group_create_hidden(GROUP_ROADBLOCK_COOP)
	end
end

function tss01_docks_setup()
	-- Disable this trigger
	trigger_enable(RUN_GUN_TRIGGER_3, false)

	-- Release some stuff to the world
	release_to_world(GROUP_CAFE_GUARDS)
	release_to_world(GROUP_2ND_FLOOR)
	release_to_world(GROUP_3RD_FLOOR)

	-- Show the hidden docks group
	group_show(GROUP_DOCKS)
	group_show(GROUP_RANDOM)
	group_show(GROUP_ROADBLOCK)

	-- Tell the dock guards they can't hit the broad side of a barn
	for i = 1, Num_tss01_dock_guards, 1 do
		npc_weapon_spread(Tss01_dock_guards[i], tss01_get_weapon_spread(4.0))
		on_death("tss01_release_to_world", Tss01_dock_guards[i])
	end
	tss01_update_hit_points(Tss01_dock_guards)

	-- Tell the random guards they can't hit the broad side of a barn
	for i = 1, Num_tss01_random_guards, 1 do
		-- We want these guys to have rifles
		inv_item_add("m16", 1, Tss01_random_guards[i], true)
		npc_weapon_spread(Tss01_random_guards[i], tss01_get_weapon_spread(2.0))
		on_death("tss01_release_to_world", Tss01_random_guards[i])
	end
	tss01_update_hit_points(Tss01_random_guards)

	-- Tell the roadblock guards they can't hit the broad side of a barn
	for i = 1, Num_tss01_roadblock_guards, 1 do
		npc_weapon_spread(Tss01_roadblock_guards[i], tss01_get_weapon_spread(4.0))
		on_death("tss01_release_to_world", Tss01_roadblock_guards[i])
	end
	tss01_update_hit_points(Tss01_roadblock_guards)

	if (tss01_spawn_coop_groups()) then
		group_show(GROUP_DOCKS_COOP)
		group_show(GROUP_RANDOM_COOP)
		group_show(GROUP_ROADBLOCK_COOP)

		-- Tell the dock guards they can't hit the broad side of a barn
		for i = 1, Num_tss01_dock_guards_coop, 1 do
			npc_weapon_spread(Tss01_dock_guards_coop[i], 4.0)
			on_death("tss01_release_to_world", Tss01_dock_guards_coop[i])
		end

		-- Tell the random guards they can't hit the broad side of a barn
		for i = 1, Num_tss01_random_guards_coop, 1 do
			-- We want these guys to have rifles
			inv_item_add("m16", 1, Tss01_random_guards_coop[i], true)
			npc_weapon_spread(Tss01_random_guards_coop[i], 2.0)
			on_death("tss01_release_to_world", Tss01_random_guards_coop[i])
		end

		-- Tell the roadblock guards they can't hit the broad side of a barn
		for i = 1, Num_tss01_roadblock_guards_coop, 1 do
			npc_weapon_spread(Tss01_roadblock_guards_coop[i], 4.0)
			on_death("tss01_release_to_world", Tss01_roadblock_guards_coop[i])
		end
	end

	-- Play the exchange between Carlos and the player
	tss01_audio_play_conversation(Tss01_carlos_exchange_3)

	-- Delay a short period of time before the leashes are removed
	delay(4.0)
	-- Remove the leashes for the courtyard prison guards
	for i = 1, Num_tss01_courtyard_guards, 1 do
		npc_leash_remove(Tss01_courtyard_guards[i])
	end
end

function tss01_waypoint01()
	-- Remove the waypoint
	mission_waypoint_remove(SYNC_ALL)

	-- Enable the next trigger
--	trigger_enable(Tss01_waypoints[1], true)
	-- Add the objective destination
--	marker_add_trigger(Tss01_waypoints[1], MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)
	-- Add the new waypoint
--	mission_waypoint_add(Tss01_waypoints[1], SYNC_ALL)

	-- Enable the trigger in front of the door to do the canned animation...
	on_trigger("tss01_carlos_take_lead", KEY_TRIGGER)
	trigger_enable(KEY_TRIGGER, true)
end

function tss01_waypoint02()
	-- Remove the marker
--	marker_remove_trigger(Tss01_waypoints[1], SYNC_ALL)
	-- Disable the incomming trigger
--	trigger_enable(Tss01_waypoints[1], false)
	-- Remove the waypoint
--	mission_waypoint_remove(SYNC_ALL)

	-- Wait until Carlos has kicked the door open
--	while (not door_is_open(Tss01_doors[KEY_DOOR])) do
--		thread_yield()
--	end

	-- Change the callback
	on_trigger("tss01_carlos_has_lead", KEY_TRIGGER)
	-- Enable the trigger
	trigger_enable(KEY_TRIGGER, true)
	-- Show the next trigger to hit
	marker_add_trigger(KEY_TRIGGER, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)
	-- Add the new waypoint
	mission_waypoint_add(KEY_TRIGGER, SYNC_ALL)
end

function tss01_kick_open_door(human)
	if (not (human == CHARACTER_CARLOS)) then
		return
	end

	-- If the human is using the IV stand then force him/her to drop it
	if (mesh_mover_wielding(human)) then
		mesh_mover_wield_stop(human)
	end

	-- Turn to face the door
	turn_to(human, "tss01_$n141")
	delay(0.5)

	-- Play the kick animation
	action_play(human, "kick door", nil, true, 0.6, true)
	-- Play the kick audio
	audio_play("DOOR_KICK", "foley", false)
	
	-- Play the action of the door opening
	door_open(Tss01_doors[KEY_DOOR])

	-- Don't proceed until the door is fully open
	while (not door_is_open(Tss01_doors[KEY_DOOR])) do
		thread_yield()
	end

end

function tss01_carlos_take_lead(human, trigger)
	if (human == CHARACTER_CARLOS) then
		-- Disable the trigger
		trigger_enable(trigger, false)
		-- Kick open the door
		tss01_kick_open_door(human)

		-- Enable the player's waypoint
		tss01_waypoint02()
		-- Tell Carlos to move to the next location
		tss01_carlos_move("tss01_$carlos1")
	end
end

function tss01_carlos_has_lead(human, trigger)
	if (not (human == CHARACTER_CARLOS)) then
		-- Disable the trigger
		trigger_enable(trigger, false)
		on_trigger("", trigger)
		marker_remove_trigger(KEY_TRIGGER, SYNC_ALL)

		-- Play audio line for Carlos
		tss01_audio_play_for_character("CARLOS_TSSP1_WAYPOINT_2", CHARACTER_CARLOS, "voice", false, true)

		-- Enable the next trigger
		trigger_enable(Tss01_waypoints[2], true)
		-- Add the objective destination
		marker_add_trigger(Tss01_waypoints[2], MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)
		-- Add the new waypoint
		mission_waypoint_add(Tss01_waypoints[2], SYNC_ALL)
	end
end

function tss01_waypoint03()
	-- Remove the marker
	marker_remove_trigger(Tss01_waypoints[2], SYNC_ALL)
	-- Disable the incomming trigger
	trigger_enable(Tss01_waypoints[2], false)
	-- Remove the waypoint
	mission_waypoint_remove(SYNC_ALL)

	-- Enable the next trigger
	trigger_enable(Tss01_waypoints[3], true)
	-- Add the objective destination
	marker_add_trigger(Tss01_waypoints[3], MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)
	-- Add the new waypoint
	mission_waypoint_add(Tss01_waypoints[3], SYNC_ALL)

	-- Tell Carlos to move to the next location
	tss01_carlos_move("tss01_$carlos2")
end

function tss01_waypoint04()
	-- Remove the marker
	marker_remove_trigger(Tss01_waypoints[3], SYNC_ALL)
	-- Disable the incomming trigger
	trigger_enable(Tss01_waypoints[3], false)
	-- Remove the waypoint
	mission_waypoint_remove(SYNC_ALL)

	-- Enable the next trigger
	trigger_enable(Tss01_waypoints[4], true)
	-- Add the objective destination
	marker_add_trigger(Tss01_waypoints[4], MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)
	-- Add the new waypoint
	mission_waypoint_add(Tss01_waypoints[4], SYNC_ALL)

	-- Play exchange between Carlos and the Player
	thread_new("tss01_audio_play_conversation", Tss01_carlos_exchange_2)

	-- Tell Carlos to move to the next location
	tss01_carlos_move("tss01_$carlos3")
end

function tss01_waypoint05()
	-- Remove the marker
	marker_remove_trigger(Tss01_waypoints[4], SYNC_ALL)
	-- Disable the incomming trigger
	trigger_enable(Tss01_waypoints[4], false)
	-- Remove the waypoint
	mission_waypoint_remove(SYNC_ALL)

	-- Enable the next trigger
	trigger_enable(Tss01_waypoints[5], true)
	-- Add the objective destination
	marker_add_trigger(Tss01_waypoints[5], MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)
	-- Add the new waypoint
	mission_waypoint_add(Tss01_waypoints[5], SYNC_ALL)

	-- Enable the trigger to show the minimap tutorial
	trigger_enable(MINIMAP_TRIGGER, true)
	on_trigger("tss01_minimap_tutorial", MINIMAP_TRIGGER)

	-- Our goal is now waypoint 5 so create our rooftop group
	group_create_hidden(GROUP_ROOFTOP)

	-- Play exchange between Carlos and the Player
	thread_new("tss01_audio_play_conversation", Tss01_carlos_exchange_3)

	-- Tell Carlos to move to the next location
	tss01_carlos_move("tss01_$carlos4")

	npc_go_idle(CHARACTER_CARLOS)
	turn_to(CHARACTER_CARLOS, "tss01_$carlos4", true)
end

function tss01_minimap_tutorial()
	-- Not needed anymore
	trigger_enable(MINIMAP_TRIGGER, false)

	-- Do the tutorial
	tutorial_start("minimap", 0, true)
end

function tss01_waypoint06()
	-- Remove the marker
	marker_remove_trigger(Tss01_waypoints[5], SYNC_ALL)
	-- Disable the incomming trigger
	trigger_enable(Tss01_waypoints[5], false)
	-- Remove the waypoint
	mission_waypoint_remove(SYNC_ALL)

	-- Add the objective destination
	marker_add_npc(Tss01_waypoints[6], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL)
	-- Add the new waypoint
	mission_waypoint_add(Tss01_waypoints[6], SYNC_ALL)

	-- Our goal is now waypoint 6 so show our rooftop group
	group_show(GROUP_ROOFTOP)
	group_create_hidden(GROUP_FIRE_ESCAPE)

	-- Tell the rooftop guards to wander
	for i = 1, Num_tss01_rooftop_guards, 1 do
		wander_start(Tss01_rooftop_guards[i], Tss01_rooftop_guards[i], 3.0)
		on_death("tss01_release_to_world", Tss01_rooftop_guards[i])
	end

	-- One of the rooftop guards is a waypoint...so setup that on death 
	--		after all the guards have been iterated through
	on_death("tss01_waypoint07", Tss01_waypoints[6])

	-- Create the heli group
	if (not group_is_loaded(GROUP_HELI)) then
		group_create(GROUP_HELI)
		group_show(GROUP_HELI)
	end

	-- The player(s) and Carlos should not have a weapon until this point...
	on_weapon_fired("tss01_tutorial_weapon_fired", LOCAL_PLAYER)
	on_weapon_fired("tss01_tutorial_weapon_fired_carlos", CHARACTER_CARLOS)
	if (IN_COOP) then
		on_weapon_fired("tss01_tutorial_weapon_fired", REMOTE_PLAYER)
	end

	-- Tell the player(s) to kill the guard
	mission_help_table("tss01_kill_guard")

	tss01_carlos_make_dependent()

	-- Carlos can now flinch or ragdoll from here on out
	character_prevent_flinching(CHARACTER_CARLOS, false)
	character_allow_ragdoll(CHARACTER_CARLOS, true)
	turn_vulnerable(CHARACTER_CARLOS)

	-- Watch for the alarms to be set off
	thread_new("tss01_react_to_alarms")

	-- Look to show the radial menu tutorial
	on_weapon_pickup("tss01_weapon_pickup", LOCAL_PLAYER)
	if (IN_COOP) then
		on_weapon_pickup("tss01_weapon_pickup", REMOTE_PLAYER)
	end

end

function tss01_tutorial_weapon_fired(human, weapon, name)
	-- Only do this for when a weapon is fired
	if (name ~= "firearm") then
		return
	end
	
	-- Do not allow this callback to happen again
	on_weapon_fired("", LOCAL_PLAYER)
	on_weapon_fired("", CHARACTER_CARLOS)
	if (IN_COOP) then
		on_weapon_fired("", REMOTE_PLAYER)
	end

	-- One of the prisoners fired a weapon...the alarm must sound!
	if (ALARM_THREAD_HANDLE == INVALID_THREAD_HANDLE) then
		ALARM_THREAD_HANDLE = thread_new("tss01_escape_alarms", true, true, true)

		-- Alarm is set off early, have fire escape guards attack
		group_show(GROUP_FIRE_ESCAPE)
		for i = 1, Num_tss01_fire_escape_guards, 1 do
			attack(Tss01_fire_escape_guards[i])
			npc_weapon_spread(Tss01_fire_escape_guards[i], tss01_get_weapon_spread(4.0))
			on_death("tss01_release_to_world", Tss01_fire_escape_guards[i])
		end
		tss01_update_hit_points(Tss01_fire_escape_guards)
	end
end

function tss01_tutorial_weapon_fired_carlos(human, weapon, name)
	-- Only do this for when a weapon is fired
	if (name ~= "firearm") then
		return
	end
	
	-- Do not allow this callback to happen again
	on_weapon_fired("", CHARACTER_CARLOS)

	-- One of the prisoners fired a weapon...the alarm must sound!
	if (ALARM_THREAD_HANDLE == INVALID_THREAD_HANDLE) then
		ALARM_THREAD_HANDLE = thread_new("tss01_escape_alarms", true, true, true)

		-- Alarm is set off early, have fire escape guards attack
		group_show(GROUP_FIRE_ESCAPE)
		for i = 1, Num_tss01_fire_escape_guards, 1 do
			attack(Tss01_fire_escape_guards[i])
			npc_weapon_spread(Tss01_fire_escape_guards[i], tss01_get_weapon_spread(4.0))
			on_death("tss01_release_to_world", Tss01_fire_escape_guards[i])
		end
		tss01_update_hit_points(Tss01_fire_escape_guards)
	end
end

function tss01_searchlight_track(human, light, track)
	local		state_idx = 1
	local		hud_index = 0
	local		hud_sync = SYNC_LOCAL

	if (human == REMOTE_PLAYER) then
		state_idx = 2
		hud_index = 1
		hud_sync = SYNC_REMOTE
	end

	-- Is the search light starting to track or did it stop tracking?
	if (track) then
		if (Tss01_warning_issued[state_idx] == false) then
			-- Tell the player(s) to be stealth like!
			mission_help_table_nag("tss01_searchlight_avoid")
			-- The warning has been issued
			Tss01_warning_issued[state_idx] = true
			return
		end

		-- Check to see if it is already tracking a player
		if (Tss01_lights_tracking[state_idx] == true) then
			return
		end

		Tss01_lights_tracking[state_idx] = true

		-- Started tracking
		hud_timer_set(hud_index, 8 * 1000, "tss01_searchlight_timer_elapsed", true, hud_sync)
		-- Tell the player(s) to hide!
		mission_help_table_nag("tss01_searchlight_spot", nil, nil, hud_sync)

		if (Tss01_light_track_msg == true) then
			-- Play audio line for Carlos
			tss01_audio_play_for_character("CARLOS_TSSP1_SPOTLIGHTS", CHARACTER_CARLOS, "voice")

			-- Don't allow the audio and message to show again until the new thread is done executing
			thread_new("tss01_searhlight_enable_message")

			Tss01_light_track_msg = false
		end
	else
		-- Stopped tracking
		hud_timer_stop(hud_index)
		-- Stop the help text
		mission_help_clear(hud_sync)

		Tss01_lights_tracking[state_idx] = false
	end
end

function tss01_searchlight_track_carlos(human, light, track)
	-- Is the search light starting to track or did it stop tracking?
	if (track) then
		-- Check to see if it is already tracking Carlos
		if (Tss01_lights_tracking_carlos == true) then
			return
		end

		Tss01_lights_tracking_carlos = true

		-- Make Carlos independent
		follower_make_independent(human, true)

		local		point = Tss01_hide_points[1];
		local		point_dist = get_dist(Tss01_hide_points[1], CHARACTER_CARLOS)

		-- Find the closest hide point
		for i = 2, Num_tss01_hide_points, 1 do
			local		dist = get_dist(Tss01_hide_points[i], CHARACTER_CARLOS)
			
			if (dist < point_dist) then
				point_dist = dist
				point = Tss01_hide_points[i]
			end
		end

		-- Move Carlos to the hide point
		CARLOS_HIDE_THREAD_HANDLE = thread_new("tss01_carlos_move",point)
	else

		-- Carlos is no longer independent
		tss01_carlos_make_dependent()

		Tss01_lights_tracking_carlos = false
	end
end

function tss01_searchlight_timer_elapsed()
	-- Sound the audio if it hasn't been already
	if (ALARM_THREAD_HANDLE == INVALID_THREAD_HANDLE) then
		ALARM_THREAD_HANDLE = thread_new("tss01_escape_alarms", false, false, false)
	end
end

function tss01_searhlight_enable_message()
	-- Delay for 15 seconds
	delay(15.0)
	-- Enable the message to be shown...
	Tss01_light_track_msg = true
end

function tss01_react_to_alarms()
	-- Do nothing until the alarm has been set off
	while (ALARM_THREAD_HANDLE == INVALID_THREAD_HANDLE) do
		thread_yield()
	end

	-- Disable the pursuit guard triggers so they can't be triggered (if the alarm was set off early)
	trigger_enable(PURSUIT_TRIGGER_1, false)
	trigger_enable(PURSUIT_TRIGGER_2, false)

	-- Tell the rooftop guards to attack...those that are left
	for i = 1, Num_tss01_rooftop_guards, 1 do
		attack(Tss01_rooftop_guards[i])
	end
end

function tss01_waypoint06b()
	-- Remove the marker
	marker_remove_trigger(FIRST_ROOFTOP_TRIGGER, SYNC_ALL)
	-- Disable the incomming trigger
	trigger_enable(FIRST_ROOFTOP_TRIGGER, false)
	-- Remove the waypoint
	mission_waypoint_remove(SYNC_ALL)

	-- Enable the next trigger
	trigger_enable(Tss01_waypoints[7], true)
	-- Add the objective destination
	marker_add_trigger(Tss01_waypoints[7], MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)
	-- Add the new waypoint
	mission_waypoint_add(Tss01_waypoints[7], SYNC_ALL)
end

function tss01_waypoint07()
	-- Remove the marker
	marker_remove_npc(Tss01_waypoints[6], SYNC_ALL)
	-- Remove the waypoint
	mission_waypoint_remove(SYNC_ALL)

	-- Create our groups for the ground tutorial segment
	group_create_hidden(GROUP_TUT_SEARCH)
	group_create_hidden(GROUP_TUT_FINE_AIM)
	group_create_hidden(GROUP_TUT_T_IN_ROAD)

	-- Enable the next trigger
	trigger_enable(FIRST_ROOFTOP_TRIGGER, true)
	on_trigger("tss01_waypoint06b", FIRST_ROOFTOP_TRIGGER)
	-- Add the objective destination
	marker_add_trigger(FIRST_ROOFTOP_TRIGGER, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)
	-- Add the new waypoint
	mission_waypoint_add(FIRST_ROOFTOP_TRIGGER, SYNC_ALL)

	-- Enable the triggers for guard pursuit
	trigger_enable(PURSUIT_TRIGGER_1, true)
	trigger_enable(PURSUIT_TRIGGER_2, true)
	-- Setup the trigger callbacks
	on_trigger("tss01_activate_pursuit", PURSUIT_TRIGGER_1)
	on_trigger("tss01_cancel_pursuit", PURSUIT_TRIGGER_2)

	-- Prompt the user with help text...
	mission_help_table("tss01_roof")

	-- Look to show the ranged weapon tutorial
	thread_new("tss01_ranged_weapons")

	-- Delay for a short period of time to allow the messages to show
	delay(4.0)
	-- Setup the searchlight callback
	on_searchlight_track("tss01_searchlight_track", LOCAL_PLAYER)
	on_searchlight_track("tss01_searchlight_track_carlos", CHARACTER_CARLOS)
	if (IN_COOP) then
		on_searchlight_track("tss01_searchlight_track", REMOTE_PLAYER)
	end

	-- Watch the player(s) for the opportunity to show the health/sprint tutorial
	on_damage("tss01_health_tutorial", LOCAL_PLAYER, 0.66)
	if (IN_COOP) then
		on_damage("tss01_health_tutorial", REMOTE_PLAYER, 0.66)
	end
end

function tss01_weapon_pickup(human, weapon, firearm)
	-- Remove the callbacks
	on_weapon_pickup("", LOCAL_PLAYER)
	if (IN_COOP) then
		on_weapon_pickup("", REMOTE_PLAYER)
	end

	tutorial_start("combat_weapons", 1000)
end

function tss01_ranged_weapons(human, weapon, firearm)
	-- Only show the ranged when a firearm is equiped

	local function player_has_firearm_equipped()
		if (inv_item_is_firearm_equipped(LOCAL_PLAYER)) then
			return true
		end
		if (IN_COOP and inv_item_is_firearm_equipped(REMOTE_PLAYER)) then
			return true
		end
		return false
	end

	while(not player_has_firearm_equipped()) do
		thread_yield()
	end
	
	tutorial_start("combat_ranged", 1000)
end

function tss01_health_tutorial()
	-- Remove the damage callbacks
	on_damage("", LOCAL_PLAYER, 0.0)
	if (IN_COOP) then
		on_damage("", REMOTE_PLAYER, 0.0)
	end

	-- Show the tutorial
	tutorial_start("health_sprint_meter", 500)
end

function tss01_waypoint08()
	-- Remove the marker
	marker_remove_trigger(Tss01_waypoints[7], SYNC_ALL)
	-- Disable the incomming trigger
	trigger_enable(Tss01_waypoints[7], false)
	-- Remove the waypoint
	mission_waypoint_remove(SYNC_ALL)

	-- Enable the next trigger
	trigger_enable(Tss01_waypoints[8], true)
	-- Add the objective destination
	marker_add_trigger(Tss01_waypoints[8], MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)
	-- Add the new waypoint
	mission_waypoint_add(Tss01_waypoints[8], SYNC_ALL)

	-- Show the search group
	group_show(GROUP_TUT_SEARCH)
	-- Setup the fine aim tutorial scenario
	thread_new("tss01_setup_fine_aim")

	-- Play exchange between Carlos and the Player
	tss01_audio_play_conversation(Tss01_carlos_exchange_4)
end

function tss01_setup_fine_aim()
	-- Show the fine aim group
	group_show(GROUP_TUT_FINE_AIM)

	-- Put the humans in the heli
	vehicle_enter_teleport("tss01_$c050", FINE_AIM_VEHICLE, 0)
	vehicle_enter_teleport("tss01_$c051", FINE_AIM_VEHICLE, 4)
	vehicle_enter_teleport("tss01_$c052", FINE_AIM_VEHICLE, 5)

	-- These guys need to suck at shooting...
	npc_weapon_spread("tss01_$c051", tss01_get_weapon_spread(2.0))
	npc_weapon_spread("tss01_$c052", tss01_get_weapon_spread(2.0))

	tss01_update_hit_points({"tss01_$c050", "tss01_$c051", "tss01_$c052"})

	-- Turn some lights on
	vehicle_lights_on(FINE_AIM_VEHICLE, true)
	vehicle_set_sirens(FINE_AIM_VEHICLE, true)

	-- Tell the fine aim vehicle to fly where it needs to be
	helicopter_fly_to_direct(FINE_AIM_VEHICLE, 50.0, "tss01_$path007")

	-- Setup some on death callbacks for the guards with rifles
	on_death("tss01_fine_aim_fly_to_safe_zone", "tss01_$c051")
	on_death("tss01_fine_aim_fly_to_safe_zone", "tss01_$c052")
end

function tss01_fine_aim_fly_to_safe_zone(human)
	-- Remove the on death callback
	on_death("", human)

	Num_fineaim_guards_killed = Num_fineaim_guards_killed + 1

	if (Num_fineaim_guards_killed == 2) then
		-- Tell the fine aim vehicle to fly where it needs to be
		--helicopter_fly_to_direct(FINE_AIM_VEHICLE, 40.0, "tss01_$path009")
		--turn_vulnerable("tss01_$c050")

		--set it on fire and let it die
		vehicle_set_smoke_and_fire_state(FINE_AIM_VEHICLE, true, true)
	end
end

function tss01_waypoint09()
	-- Remove the marker
	marker_remove_trigger(Tss01_waypoints[8], SYNC_ALL)
	-- Disable the incomming trigger
	trigger_enable(Tss01_waypoints[8], false)
	-- Remove the waypoint
	mission_waypoint_remove(SYNC_ALL)

	-- Enable the next trigger
	trigger_enable(Tss01_waypoints[9], true)
	-- Add the objective destination
	marker_add_trigger(Tss01_waypoints[9], MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)
	-- Add the new waypoint
	mission_waypoint_add(Tss01_waypoints[9], SYNC_ALL)

	-- Enable the fine aim triggers
	trigger_enable(FINEAIM_START_TRIGGER, true)
	on_trigger("tss01_fine_aim_start", FINEAIM_START_TRIGGER)

	trigger_enable(FINEAIM_START_HELI_TRIGGER, true)
	on_trigger("tss01_fine_aim_start_heli", FINEAIM_START_HELI_TRIGGER)
	
	-- Setup the search scenario
	thread_new("tss01_setup_police_car_search_01")
	thread_new("tss01_setup_police_car_search_02")

	-- Play exchange between Carlos and the Player
	tss01_audio_play_conversation(Tss01_carlos_exchange_5)

	-- Sound the audio if it hasn't been already
	if (ALARM_THREAD_HANDLE == INVALID_THREAD_HANDLE) then
		ALARM_THREAD_HANDLE = thread_new("tss01_escape_alarms", true, false, true)
	end
end

function tss01_fine_aim_start()
	-- Disable the fine aim trigger
	trigger_enable(FINEAIM_START_TRIGGER, false)

	-- Do the tutorial
	tutorial_start("combat_fineaim")
end

function tss01_fine_aim_start_heli()

	local pilot = "tss01_$c050"
	if ((not vehicle_is_destroyed(FINE_AIM_VEHICLE) and character_exists(pilot) and (not character_is_dead(pilot)))) then
		trigger_enable(FINEAIM_START_HELI_TRIGGER, false)
		on_trigger("", FINEAIM_START_HELI_TRIGGER)

		-- Tell the fine aim vehicle to fly where it needs to be
		helicopter_fly_to_direct(FINE_AIM_VEHICLE, 50.0, "tss01_$path008")
		-- Nag the player to do fine aim
		mission_help_table_nag("tss01_fine_aim")
	end

end

function tss01_setup_police_car_search_01()

	local driver = Tss01_search_01[1]
	
	-- Teleport them into their vehicle
	vehicle_enter_group_teleport(Tss01_search_01, SEARCH_VEHICLE_01)

	-- Cut the hitpoints of the police cruiser to half
	set_max_hit_points(SEARCH_VEHICLE_01, get_max_hit_points(SEARCH_VEHICLE_01) * VEHICLE_HEALTH_MULTIPLIER, true)

	-- Spawn off a thread to turn on the lights while driving
	thread_new("tss01_police_turn_lights_on")

	local function should_terminate()
		if ( (not vehicle_exists(SEARCH_VEHICLE_01)) or vehicle_is_destroyed(SEARCH_VEHICLE_01) ) then
			return true
		end
		if ( (not character_exists(driver)) or character_is_dead(driver) ) then
			return true
		end
		return false
	end

	-- Start driving to the lighthouse
	vehicle_pathfind_to(SEARCH_VEHICLE_01, "tss01_$path001", true, false)

	-- Return early if the vehicle or driver are destroyed
	if ( should_terminate() ) then
		return
	end

	-- Finish driving to the lighthouse
	vehicle_pathfind_to(SEARCH_VEHICLE_01, "tss01_$path001a", true, true)

	-- Return early if the vehicle or driver are destroyed
	if ( should_terminate() ) then
		return
	end

	-- Force the guards to exit
	vehicle_stop(SEARCH_VEHICLE_02)

	-- Tell these guys to exit and then attack the player
	for i = 1, Num_tss01_search_01, 1 do
		local guard = Tss01_search_01[i]
		if (character_exists(guard) and (not character_is_dead(guard)) ) then
			thread_new("tss01_guard_exit_vehicle", guard)
			on_death("tss01_release_to_world", guard)
		end
	end
end

function tss01_guard_exit_vehicle(guard)
	-- Exit the vehicle
	vehicle_exit(guard)
	-- Attack the player now
	attack(guard)
	-- Decrease his accuracy
	npc_weapon_spread(guard, tss01_get_weapon_spread(4.0))
	tss01_update_hit_points({guard})
end

function tss01_police_turn_lights_on()
	-- Delay a short period of time
	delay(1.0)

	-- Turn on the vehicle sirens
	vehicle_lights_on(SEARCH_VEHICLE_01, true)
	vehicle_set_sirens(SEARCH_VEHICLE_01, true)
end

function tss01_setup_police_car_search_02()
	-- Do not let the guard exit this vehicle
	vehicle_suppress_npc_exit(SEARCH_VEHICLE_02)
	-- Teleport them into their vehicle
	vehicle_enter_teleport("tss01_$c049", SEARCH_VEHICLE_02)

	-- Set the driver's weapon spread and hit points
	npc_weapon_spread("tss01_$c049", tss01_get_weapon_spread(4.0))
	tss01_update_hit_points({"tss01_$c049"})

	-- Cut the hitpoints of the police cruiser to half
	set_max_hit_points(SEARCH_VEHICLE_02, get_max_hit_points(SEARCH_VEHICLE_02) * VEHICLE_HEALTH_MULTIPLIER, true)

	-- Delay for a little while before activating this sequence...
	delay(20.0)

	local function should_terminate()
		if ( (not vehicle_exists(SEARCH_VEHICLE_02)) or vehicle_is_destroyed(SEARCH_VEHICLE_02) ) then
			return true
		end
		if ( (not character_exists("tss01_$c049")) or character_is_dead("tss01_$c049") ) then
			return true
		end
		return false
	end

	-- Return early if the vehicle or driver are destroyed
	if ( should_terminate() ) then
		return
	end

	-- Turn on the vehicle sirens
	vehicle_lights_on(SEARCH_VEHICLE_02, true)
	vehicle_set_sirens(SEARCH_VEHICLE_02, true)

	-- Have the vehicle start the pathfind to the the light house
	vehicle_pathfind_to(SEARCH_VEHICLE_02, "tss01_$path006", true, false, false, true)

	-- Return early if the vehicle or driver are destroyed
	if ( should_terminate() ) then
		return
	end

	-- Have the vehicle finish the pathfind to the lighthouse
	vehicle_pathfind_to(SEARCH_VEHICLE_02, "tss01_$path006a", true, true, false, true)

	-- Return early if the vehicle or driver are destroyed
	if ( should_terminate() ) then
		return
	end

	-- The guard can exit now
	vehicle_suppress_npc_exit(SEARCH_VEHICLE_02, false)

	-- Force the guard to exit the vehicle and attack the player
	vehicle_stop(SEARCH_VEHICLE_02)
	if (character_exists("tss01_$c049") and (not character_is_dead("tss01_$c049"))) then
		vehicle_exit("tss01_$c049")
	end
	attack_safe("tss01_$c049")
end

function tss01_waypoint10()
	-- Remove the waypoint
	mission_waypoint_remove(SYNC_ALL)

	-- Enable the next trigger
	trigger_enable(Tss01_waypoints[10], true)
	-- Add the objective destination
	marker_add_trigger(Tss01_waypoints[10], MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)
	-- Add the new waypoint
	--mission_waypoint_add(Tss01_waypoints[10], SYNC_ALL)

	-- Enable the bridge trigger
	on_trigger("tss01_bridge_trigger", BRIDGE_TRIGGER)
	trigger_enable(BRIDGE_TRIGGER, true)

	-- Enable the armory trigger
	on_trigger("tss01_armory_trigger", ARMORY_TRIGGER)
	trigger_enable(ARMORY_TRIGGER, true)
end

function tss01_waypoint11()
	-- Check to see if the waypoint has been triggered
	if (WAYPOINT_11_TRIGGERED) then
		return
	end

	-- Mark as triggered
	WAYPOINT_11_TRIGGERED = true

	-- We no longer need this door callback
	on_door_opened("", GUARD_ATTACK_DOOR)

	-- Remove the marker
	marker_remove_trigger(Tss01_waypoints[10], SYNC_ALL)
	-- Disable the incomming trigger
	trigger_enable(Tss01_waypoints[10], false)
	-- Remove the waypoint
	--mission_waypoint_remove(SYNC_ALL)

	-- Enable the next trigger
	trigger_enable(Tss01_waypoints[11], true)
	-- Add the objective destination
	marker_add_trigger(Tss01_waypoints[11], MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)
	-- Add the new waypoint
	--mission_waypoint_add(Tss01_waypoints[11], SYNC_ALL)

	-- Play the exchange between Carlos and the player
	tss01_audio_play_conversation(Tss01_carlos_exchange_2)
end

function tss01_bridge_trigger()
	-- Disable this trigger
	trigger_enable(BRIDGE_TRIGGER, false)

	-- Create the court yard guards
	if (not group_is_loaded(GROUP_COURTYARD)) then
		-- We want the courtyard guards to be seen on the bridge
		group_create(GROUP_COURTYARD)

		-- Tell the courtyard guards to wander
		for i = 1, Num_tss01_courtyard_guards, 1 do
			wander_start(Tss01_courtyard_guards[i], Tss01_courtyard_guards[i], 5.0)
			npc_weapon_spread(Tss01_courtyard_guards[i], tss01_get_weapon_spread(4.0))
			on_death("tss01_release_to_world", Tss01_courtyard_guards[i])
		end
		tss01_update_hit_points(Tss01_courtyard_guards)

		if (tss01_spawn_coop_groups()) then
			group_create(GROUP_COURTYARD_COOP)

			-- Tell the courtyard guards to wander
			for i = 1, Num_tss01_courtyard_guards_coop, 1 do
				wander_start(Tss01_courtyard_guards_coop[i], Tss01_courtyard_guards_coop[i], 5.0)
				npc_weapon_spread(Tss01_courtyard_guards_coop[i], 4.0)
				on_death("tss01_release_to_world", Tss01_courtyard_guards_coop[i])
			end
		end
	end

	-- Create the shortbus guards as hidden
	if (not group_is_loaded(GROUP_SHORTBUS)) then
		tss01_create_shortbus_and_add_cops()
	end

	-- Enable the entering bridge trigger
	trigger_enable(FALL_TRIGGER_OPEN, true)
	on_trigger("tss01_player_entering_bridge", FALL_TRIGGER_OPEN)

	trigger_enable(FALL_TRIGGER_CLOSE, false)
	on_trigger("tss01_player_exiting_bridge", FALL_TRIGGER_CLOSE)

	trigger_enable(FALLEN_TRIGGER, false)
	on_trigger("tss01_player_fell_to_courtyard", FALLEN_TRIGGER)
end

function tss01_player_entering_bridge()
	-- Open the first set of doors
	for i = 1, Num_tss01_door_set_1, 1 do
		door_open(Tss01_door_set_1[i], true)
	end

	-- Enable/Disable appropriate triggers
	trigger_enable(FALL_TRIGGER_OPEN, false)
	trigger_enable(FALL_TRIGGER_CLOSE, true)
	trigger_enable(FALLEN_TRIGGER, true)
end

function tss01_player_exiting_bridge()
	-- Close the first set of doors
	for i = 1, Num_tss01_door_set_1, 1 do
		door_close(Tss01_door_set_1[i])
	end

	-- Enable/Disable appropriate triggers
	trigger_enable(FALL_TRIGGER_OPEN, true)
	trigger_enable(FALL_TRIGGER_CLOSE, false)
	trigger_enable(FALLEN_TRIGGER, false)
end

function tss01_player_fell_to_courtyard()
	-- Disable the fall triggers
	trigger_enable(FALL_TRIGGER_OPEN, false)
	trigger_enable(FALL_TRIGGER_CLOSE, false)
	trigger_enable(FALLEN_TRIGGER, false)

	-- Disable exit triggers...as this portion is no longer needed
	trigger_enable(RUN_GUN_TRIGGER_1, false)
	trigger_enable(RUN_GUN_TRIGGER_2, false)
	trigger_enable(RUN_GUN_TRIGGER_3, false)

	-- Open the remaining doors
	for i = 1, Num_tss01_door_set_2, 1 do
		door_open(Tss01_door_set_2[i], true)
	end

	tss01_waypoint11()

	-- Create the docks guards as hidden
	if (not group_is_loaded(GROUP_DOCKS)) then
		group_create(GROUP_DOCKS)
		group_create(GROUP_RANDOM)
		group_create(GROUP_ROADBLOCK)

		-- Tell the dock guards  they can't hit the broad side of a barn
		for i = 1, Num_tss01_dock_guards, 1 do
			npc_weapon_spread(Tss01_dock_guards[i], tss01_get_weapon_spread(3.0))
			on_death("tss01_release_to_world", Tss01_dock_guards[i])
		end
		tss01_update_hit_points(Tss01_dock_guards)

		-- Tell the random guards they can't hit the broad side of a barn
		for i = 1, Num_tss01_random_guards, 1 do
			-- We want these guys to have rifles
			inv_item_add("m16", 1, Tss01_random_guards[i], true)
			npc_weapon_spread(Tss01_random_guards[i], tss01_get_weapon_spread(2.0))
			on_death("tss01_release_to_world", Tss01_random_guards[i])
		end
		tss01_update_hit_points(Tss01_random_guards)

		-- Tell the roadblock guards they can't hit the broad side of a barn
		for i = 1, Num_tss01_roadblock_guards, 1 do
			npc_weapon_spread(Tss01_roadblock_guards[i], tss01_get_weapon_spread(3.0))
			on_death("tss01_release_to_world", Tss01_roadblock_guards[i])
		end
		tss01_update_hit_points(Tss01_roadblock_guards)

		if (tss01_spawn_coop_groups()) then
			group_create(GROUP_DOCKS_COOP)
			group_create(GROUP_RANDOM_COOP)
			group_create(GROUP_ROADBLOCK_COOP)

			-- Tell the dock guards  they can't hit the broad side of a barn
			for i = 1, Num_tss01_dock_guards_coop, 1 do
				npc_weapon_spread(Tss01_dock_guards_coop[i], 4.0)
				on_death("tss01_release_to_world", Tss01_dock_guards_coop[i])
			end 

			-- Tell the random guards they can't hit the broad side of a barn
			for i = 1, Num_tss01_random_guards_coop, 1 do
				-- We want these guys to have rifles
				inv_item_add("m16", 1, Tss01_random_guards_coop[i], true)
				npc_weapon_spread(Tss01_random_guards_coop[i], 2.0)
				on_death("tss01_release_to_world", Tss01_random_guards_coop[i])
			end

			-- Tell the roadblock guards they can't hit the broad side of a barn
			for i = 1, Num_tss01_roadblock_guards_coop, 1 do
				npc_weapon_spread(Tss01_roadblock_guards_coop[i], 4.0)
				on_death("tss01_release_to_world", Tss01_roadblock_guards_coop[i])
			end
		end
	end

	-- Show the hidden docks group
	group_show(GROUP_DOCKS)
	group_show(GROUP_RANDOM)
	group_show(GROUP_ROADBLOCK)

	if (tss01_spawn_coop_groups()) then
		group_show(GROUP_DOCKS_COOP)
		group_show(GROUP_RANDOM_COOP)
		group_show(GROUP_ROADBLOCK_COOP)
	end

	-- Delay a short period of time before the leashes are removed
	delay(4.0)
	-- Remove the leashes for the courtyard prison guards
	for i = 1, Num_tss01_courtyard_guards, 1 do
		npc_leash_remove(Tss01_courtyard_guards[i])
	end
end

function tss01_armory_trigger()
	-- Disable this trigger
	trigger_enable(ARMORY_TRIGGER, false)

	-- Play audio line for Carlos
	tss01_audio_play_for_character("CARLOS_TSSP1_RUNGUN_2", CHARACTER_CARLOS, "voice")

	-- Give Carlos an assault rifle
	inv_item_add("m16", 1, CHARACTER_CARLOS)

	-- Enable the catwalk trigger
	on_trigger("tss01_catwalk_trigger", CATWALK_TRIGGER)
	trigger_enable(CATWALK_TRIGGER, true)
end

function tss01_catwalk_trigger()
	-- Disable the catwalk trigger
	trigger_enable(CATWALK_TRIGGER, false)
	-- Play Carlos's catwalk line
	tss01_audio_play_for_character("CARLOS_TSSP1_CATWALK", CHARACTER_CARLOS, "voice")
end

function tss01_explore_trigger(human, trigger)
	-- Disable this explore trigger
	trigger_enable(trigger, false)
	-- Play audio line for Carlos
	tss01_audio_play_for_character("CARLOS_TSSP1_DOCKS_01", CHARACTER_CARLOS, "voice")
end

function tss01_waypoint12_common()

	trigger_enable(Tss01_waypoints[12], true)
	-- Add the objective destination
	marker_add_trigger(Tss01_waypoints[12], MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)
	-- Add the new waypoint
	mission_waypoint_add(Tss01_waypoints[12], SYNC_ALL)

	-- Tell the dock guards to attack
	for i = 1, Num_tss01_dock_guards, 1 do
		set_always_sees_player_flag(Tss01_dock_guards[i])
		attack(Tss01_dock_guards[i])
	end

	-- We do not want our yacht to be destroyed
	on_vehicle_destroyed("tss01_failure_yacht", HIGH_SEAS_VEHICLE)

	-- Enable Carlos's boat damage lines whenever the boat is damaged
	on_take_damage("tss01_enable_carlos_damage_line", HIGH_SEAS_VEHICLE)

	-- Up the health of the boat
	set_max_hit_points(HIGH_SEAS_VEHICLE, HIGH_SEAS_VEHICLE_HIT_POINTS, true)
	-- Make sure the vehicle is not entered...we just want to teleport everyone
	set_unjackable_flag(HIGH_SEAS_VEHICLE, true)

	-- Setup the heli ambush
	trigger_enable(HELI_AMBUSH_TRIGGER, true)
	on_trigger("tss01_heli_ambush", HELI_AMBUSH_TRIGGER)
	-- Create the group...
	group_create_hidden(GROUP_HELI_AMBUSH)

	-- Setup the Warden path
	trigger_enable(WARDONS_TRIGGER, true)
	on_trigger("tss01_warden_path", WARDONS_TRIGGER)
	
	-- Setup the Lighthouse path
	trigger_enable(LIGHTHOUSE_TRIGGER, true)
	on_trigger("tss01_lighthouse_path", LIGHTHOUSE_TRIGGER)

	-- Setup the cancel...this will cancel other scenarios for coop safety
	trigger_enable(CANCEL_TRIGGER, true)
	on_trigger("tss01_cancel_paths", CANCEL_TRIGGER)
end

function tss01_cancel_paths()
	-- Disable this trigger
	trigger_enable(CANCEL_TRIGGER, false)

	-- Once any player (local or remote) have reached this point, we want to disable all open scenarios.
	--		We need to do this so that one player cannot run around in an area where things are spawned or
	--		possibly going the wrong direction. One example of wrong direction is the heli ambush the if the
	--		wardens path is taken and then the player works his way around and then up to the light house...
	--		In this case, the heli would spawn and come in behind the player(s). The other case that is
	--		dangerous, especially in coop is, the same case but one player waits up top by the wardens house
	--		until the other player has gone down the warden path, past the docks, up to the light house, and
	--		and then the player waiting by the wardens house travels the normal path and triggers the run
	--		and gun section where the two cars spawn in and chase.

	-- Disable the run and gun
	trigger_enable(RUN_GUN_TRIGGER_4, false)
	-- Disable the heli ambush
	trigger_enable(HELI_AMBUSH_TRIGGER, false)
	-- Disable the wardens
	trigger_enable(WARDONS_TRIGGER, false)
end

-- Tutorial
function tss01_waypoint12a()
	-- Remove the marker
	marker_remove_trigger(Tss01_waypoints[9], SYNC_ALL)
	-- Disable the incomming trigger
	trigger_enable(Tss01_waypoints[9], false)
	-- Remove the waypoint
	mission_waypoint_remove(SYNC_ALL)

	-- Release some stuff to the world
	release_to_world(GROUP_KEY_GUARDS)
	
	-- Enable the triggers for when the player tries to explore
	for i = 1, Num_tss01_explore_triggers, 1 do
		trigger_enable(Tss01_explore_triggers[i], true)
	end

	-- Enable the trigger
	trigger_enable(END_ROOFTOP_TRIGGER, true)
	-- Setup the callback
	on_trigger("tss01_waypoint12aa", END_ROOFTOP_TRIGGER)
	-- Add the objective destination
	marker_add_trigger(END_ROOFTOP_TRIGGER, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)
	-- Add the new waypoint
	mission_waypoint_add(END_ROOFTOP_TRIGGER, SYNC_ALL)

	-- Create our dock group
	group_create_hidden(GROUP_DOCKS)
	group_create_hidden(GROUP_RANDOM)
	group_create_hidden(GROUP_ROADBLOCK)

	if (tss01_spawn_coop_groups()) then
		group_create_hidden(GROUP_DOCKS_COOP)
		group_create_hidden(GROUP_RANDOM_COOP)
		group_create_hidden(GROUP_ROADBLOCK_COOP)
	end
	
	-- We are going to have the heli land and drop guys off
	if (not vehicle_is_destroyed(SPOT_LIGHT_HELI)) then
		-- Pathfind!
		helicopter_fly_to_direct(SPOT_LIGHT_HELI, 60.0, "tss01_$n047")
		helicopter_fly_to_direct(SPOT_LIGHT_HELI, 40.0, "tss01_$n033")
	end
end

function tss01_waypoint12aa()
	-- If we are in coop, they need to be together in order to proceed
	if (IN_COOP) then
		-- Check the distance
		if (get_dist(LOCAL_PLAYER, REMOTE_PLAYER) > 10.0) then
			-- Show the players the cooperative message
			mission_help_table_nag("tss01_cooperative")
			return
		end
	end

	-- Disable the incomming trigger
	trigger_enable(END_ROOFTOP_TRIGGER, false)
	-- Remove the waypoint
	mission_waypoint_remove(SYNC_ALL)

	-- Release some stuff to the world
	release_to_world(GROUP_ROOFTOP)
	release_to_world(GROUP_FIRE_ESCAPE)
	release_to_world(GROUP_PURSUIT_GUARDS)

	-- Set the mission checkpoint
	mission_set_checkpoint(MISSION_CHECKPOINT_DOCKS)

	-- Get to the docks!
	tss01_to_the_docks()
end

function tss01_to_the_docks()
	-- Setup our next scenarios
	trigger_enable(HELI_LAND_TRIGGER, true)
	on_trigger("tss01_heli_land", HELI_LAND_TRIGGER)

	trigger_enable(HELI_BACKUP_TRIGGER, true)
	on_trigger("tss01_heli_backup", HELI_BACKUP_TRIGGER)

	-- Our goal is now the docks so show our docks group
	group_show(GROUP_DOCKS)
	group_show(GROUP_RANDOM)
	group_show(GROUP_ROADBLOCK)

	-- Tell the dock guards they can't hit shit
	for i = 1, Num_tss01_dock_guards, 1 do
		npc_weapon_spread(Tss01_dock_guards[i], tss01_get_weapon_spread(4.0))
		on_death("tss01_release_to_world", Tss01_dock_guards[i])
	end
	tss01_update_hit_points(Tss01_dock_guards)

	-- Tell the random guards they can't hit the broad side of a barn
	for i = 1, Num_tss01_random_guards, 1 do
		-- We want these guys to have rifles
		inv_item_add("m16", 1, Tss01_random_guards[i], true)
		npc_weapon_spread(Tss01_random_guards[i], tss01_get_weapon_spread(2.0))
		on_death("tss01_release_to_world", Tss01_random_guards[i])
	end
	tss01_update_hit_points(Tss01_random_guards)

	-- Tell the roadblock guards they can't hit the broad side of a barn
	for i = 1, Num_tss01_roadblock_guards, 1 do
		npc_weapon_spread(Tss01_roadblock_guards[i], tss01_get_weapon_spread(4.0))
		on_death("tss01_release_to_world", Tss01_roadblock_guards[i])
	end
	tss01_update_hit_points(Tss01_roadblock_guards)

	-- Turn the lights on 
	for i = 1, Num_tss01_roadblock_cars, 1 do
		vehicle_lights_on(Tss01_roadblock_cars[i], true)
		vehicle_set_sirenlights(Tss01_roadblock_cars[i], true)
		-- Lower the hit points...
		set_max_hit_points(Tss01_roadblock_cars[i], get_max_hit_points(Tss01_roadblock_cars[i]) * VEHICLE_HEALTH_MULTIPLIER, true)
	end

	-- Remove the leash from these guys
	for i = 1, Num_tss01_search_01, 1 do
		if (character_exists(Tss01_search_01[i]) and (not character_is_dead(Tss01_search_01[i])) ) then
			npc_leash_remove(Tss01_search_01[i])
		end
	end

	if (tss01_spawn_coop_groups()) then
		group_show(GROUP_DOCKS_COOP)
		group_show(GROUP_RANDOM_COOP)
		group_show(GROUP_ROADBLOCK_COOP)

		-- Tell the dock guards they can't hit shit
		for i = 1, Num_tss01_dock_guards_coop, 1 do
			npc_weapon_spread(Tss01_dock_guards_coop[i], 4.0)
			on_death("tss01_release_to_world", Tss01_dock_guards_coop[i])
		end

		-- Tell the random guards they can't hit the broad side of a barn
		for i = 1, Num_tss01_random_guards_coop, 1 do
			-- We want these guys to have rifles
			inv_item_add("m16", 1, Tss01_random_guards_coop[i], true)
			npc_weapon_spread(Tss01_random_guards_coop[i], 2.0)
			on_death("tss01_release_to_world", Tss01_random_guards_coop[i])
		end

		-- Tell the roadblock guards they can't hit the broad side of a barn
		for i = 1, Num_tss01_roadblock_guards_coop, 1 do
			npc_weapon_spread(Tss01_roadblock_guards_coop[i], 4.0)
			on_death("tss01_release_to_world", Tss01_roadblock_guards_coop[i])
		end
	end

	-- Give Carlos an hand gun in at this point...
	inv_item_add("glock", 1, CHARACTER_CARLOS)

	-- Play audio line for Carlos
	tss01_audio_play_for_character("CARLOS_TSSP1_LEAVEROOF", CHARACTER_CARLOS, "voice", false, true)
	-- Prompt the user with help text...
	mission_help_table("tss01_docks")

	-- Show the checkpoint tutorial
	tutorial_start("sprint")

	tss01_waypoint12_common()
end

function tss01_to_the_docks_from_checkpoint()
	-- Set the notoriety for the rest of the mission...this is for the restart at checkpoint
	notoriety_set_max("police", 1)
	notoriety_set_min("police", 1)

	tss01_to_the_docks()
end

Tss01_heli_passengers_exited = 0
function tss01_heli_land()
	-- Disable the trigger since it is no longer needed
	trigger_enable(HELI_LAND_TRIGGER, false)

	-- We are going to have the heli land and drop guys off
	if (not vehicle_is_destroyed(SPOT_LIGHT_HELI)) then
		-- Don't let the player jack this helicopter
		set_unjackable_flag(SPOT_LIGHT_HELI, true)

		-- Pathfind!
		helicopter_fly_to_direct(SPOT_LIGHT_HELI, 17.0, "tss01_$path003")

		delay(2.0)
		
		thread_new("tss01_heli_passenger_exit","tss01_$spot1")
		thread_new("tss01_heli_passenger_exit","tss01_$spot2")

		while(Tss01_heli_passengers_exited ~= 2) do
			thread_yield()
		end

		-- Pathfind back up!
		helicopter_fly_to_direct(SPOT_LIGHT_HELI, 50.0, "tss01_$n048")

		-- Put the heli back into chase mode
		vehicle_chase(SPOT_LIGHT_HELI, LOCAL_PLAYER)
	end
end

function tss01_heli_passenger_exit(npc)
	if (not character_is_dead(npc)) then
		vehicle_exit(npc, true)
		Tss01_heli_passengers_exited = Tss01_heli_passengers_exited + 1
		audio_play_persona_line(npc, "threat - alert (group attack)")

		-- Tell him to attack
		attack(npc)
	else
		Tss01_heli_passengers_exited = Tss01_heli_passengers_exited + 1
	end
end

function tss01_heli_backup()
	-- Disable the trigger since it is no longer needed
	trigger_enable(HELI_BACKUP_TRIGGER, false)

	-- Spawn off a thread to do the fine aim heli crash
	thread_new("tss01_heli_crash")

	--Show the fine aim group
	group_show(GROUP_TUT_T_IN_ROAD)
	-- Teleport them into their vehicle
	vehicle_enter_group_teleport(Tss01_tut_t_road, T_IN_ROAD_VEHICLE)

	-- Turn on the vehicle sirens
	vehicle_lights_on(T_IN_ROAD_VEHICLE, true)
	vehicle_set_sirens(T_IN_ROAD_VEHICLE, true)

	-- Lower the hit points...
	set_max_hit_points(T_IN_ROAD_VEHICLE, get_max_hit_points(T_IN_ROAD_VEHICLE) * VEHICLE_HEALTH_MULTIPLIER, true)

	-- Have the vehicle pathfind to the the light house
	vehicle_pathfind_to(T_IN_ROAD_VEHICLE, "tss01_$path002", true, true)

	-- Tell these guys to attack the player
	for i = 1, Num_tss01_tut_t_road, 1 do
		attack(Tss01_tut_t_road[i])
		npc_weapon_spread(Tss01_tut_t_road[i], tss01_get_weapon_spread(4.0))
		on_death("tss01_release_to_world", Tss01_tut_t_road[i])
	end
	tss01_update_hit_points(Tss01_tut_t_road)
end

function tss01_heli_crash()
	-- Make sure the vehicle hasn't been destroyed...this shouldn't be possible anymore but I'll keep it here anyway
	if (not vehicle_is_destroyed(FINE_AIM_VEHICLE)) then
		-- Setup the speed reduction
		trigger_enable("tss01_$heli_crash", true)
		on_trigger("tss01_slow_crash_down", "tss01_$heli_crash")
		-- Turn this heli vulnerable
		turn_vulnerable(FINE_AIM_VEHICLE)
		turn_vulnerable("tss01_$c050")
		-- Lower the hit points...
		set_current_hit_points(FINE_AIM_VEHICLE, get_max_hit_points(FINE_AIM_VEHICLE) * 0.12)
		-- Tell the fine aim vehicle to fly where it needs to be
		helicopter_fly_to_direct_dont_stop(FINE_AIM_VEHICLE, 70.0, "tss01_$path010")
	end
end

function tss01_slow_crash_down()
	-- Disable this trigger
	trigger_enable("tss01_$heli_crash", false)
	-- Change the speed
	vehicle_speed_override(FINE_AIM_VEHICLE, 30.0)
end

-- Run and Gun
function tss01_waypoint12b()
	-- Remove the marker
	marker_remove_trigger(Tss01_waypoints[11], SYNC_ALL)
	-- Disable the incomming trigger
	trigger_enable(Tss01_waypoints[11], false)
	-- Remove the waypoint
	mission_waypoint_remove(SYNC_ALL)

	-- Release some stuff to the world
	release_to_world(GROUP_COURTYARD)
	release_to_world(GROUP_COURTYARD_COOP)

	-- Create the run and gun group...
	group_create_hidden(GROUP_RUN_GUN)

	tss01_waypoint12_common()

	-- Put the spot light heli into chase mode
	if (not vehicle_is_destroyed(SPOT_LIGHT_HELI)) then
		vehicle_chase(SPOT_LIGHT_HELI, LOCAL_PLAYER)
	end

	-- Setup the run and gun portion as the player makes way to docks
	trigger_enable(RUN_GUN_TRIGGER_4, true)
	on_trigger("tss01_run_gun", RUN_GUN_TRIGGER_4)

	-- Play the exchange between Carlos and the player
	tss01_audio_play_conversation(Tss01_carlos_exchange_4)
end

function tss01_run_gun(human, trigger)
	-- Disable this trigger as it is no longer needed
	trigger_enable(RUN_GUN_TRIGGER_4, false)

	-- Play the exchange between Carlos and the player
	tss01_audio_play_conversation(Tss01_carlos_exchange_5)

	-- Show the group...
	group_show(GROUP_RUN_GUN)

	-- Teleport the humans into the heli
	vehicle_enter_group_teleport(Tss01_run_gun_part1, RUN_GUN_PART1_VEHICLE)
	vehicle_enter_group_teleport(Tss01_run_gun_part2, RUN_GUN_PART2_VEHICLE)

	-- Tell these guys they can't hit a barn 3 feet in front of them
	for i = 1, Num_tss01_run_gun_part1, 1 do
		npc_weapon_spread(Tss01_run_gun_part1[i], tss01_get_weapon_spread(4.0))
		on_death("tss01_release_to_world", Tss01_run_gun_part1[i])
	end
	tss01_update_hit_points(Tss01_run_gun_part1)

	for i = 1, Num_tss01_run_gun_part2, 1 do
		npc_weapon_spread(Tss01_run_gun_part2[i], tss01_get_weapon_spread(4.0))
		on_death("tss01_release_to_world", Tss01_run_gun_part2[i])
	end
	tss01_update_hit_points(Tss01_run_gun_part2)

	-- Turn the lights on
	vehicle_lights_on(RUN_GUN_PART1_VEHICLE, true)
	vehicle_set_sirens(RUN_GUN_PART1_VEHICLE, true)

	vehicle_lights_on(RUN_GUN_PART2_VEHICLE, true)
	vehicle_set_sirens(RUN_GUN_PART2_VEHICLE, true)

	-- Lower the hit points...
	set_max_hit_points(RUN_GUN_PART1_VEHICLE, get_max_hit_points(RUN_GUN_PART1_VEHICLE) * VEHICLE_HEALTH_MULTIPLIER, true)
	set_max_hit_points(RUN_GUN_PART2_VEHICLE, get_max_hit_points(RUN_GUN_PART2_VEHICLE) * VEHICLE_HEALTH_MULTIPLIER, true)

	-- Should the vehicles ram?
	local		ram_human = character_is_in_vehicle(human)

	-- Chase the player(s)
	vehicle_chase(RUN_GUN_PART1_VEHICLE, human, true, ram_human, false)
	delay(4.0)
	vehicle_chase(RUN_GUN_PART2_VEHICLE, human, true, ram_human, false)

	-- If we are to ram the player, give the lead vehicle infinite mass so they can plow through the roadblock
	if (ram_human) then
		vehicle_infinite_mass(RUN_GUN_PART1_VEHICLE, true)
		on_vehicle_exit("tss01_reset_my_infinite_mass_status", RUN_GUN_PART1_VEHICLE)
	end
end

function tss01_heli_ambush()
	
	AMBUSH_THREAD_HANDLE = thread_new("tss01_heli_ambush_do")

end

function tss01_heli_ambush_do()
	-- Disable this trigger...
	trigger_enable(HELI_AMBUSH_TRIGGER, false)

	local		local_can_see_heli = navpoint_in_player_fov(HELI_AMBUSH_VEHICLE, LOCAL_PLAYER, 5.0)
	local		remote_can_see_heli = false

	if (IN_COOP) then
		remote_can_see_heli = navpoint_in_player_fov(HELI_AMBUSH_VEHICLE, REMOTE_PLAYER, 5.0)
	end

	-- Wait until the heli is not being looked at...
	while (local_can_see_heli or remote_can_see_heli) do
		thread_yield()

		local_can_see_heli = navpoint_in_player_fov(HELI_AMBUSH_VEHICLE, LOCAL_PLAYER, 5.0)
		if (IN_COOP) then
			remote_can_see_heli = navpoint_in_player_fov(HELI_AMBUSH_VEHICLE, REMOTE_PLAYER, 5.0)
		end
	end

	-- The heli is not being looked at
	group_show(GROUP_HELI_AMBUSH)

	-- Teleport the humans into the heli
	vehicle_enter_teleport("tss01_$c027", HELI_AMBUSH_VEHICLE, 0)
	vehicle_enter_teleport("tss01_$c028", HELI_AMBUSH_VEHICLE, 4)
	vehicle_enter_teleport("tss01_$c029", HELI_AMBUSH_VEHICLE, 5)

	-- This guys can't hit shit
	npc_weapon_spread("tss01_$c027", tss01_get_weapon_spread(2.0))
	npc_weapon_spread("tss01_$c028", tss01_get_weapon_spread(2.0))
	npc_weapon_spread("tss01_$c029", tss01_get_weapon_spread(2.0))
	tss01_update_hit_points({"tss01_$c027", "tss01_$c028", "tss01_$c029"})

	vehicle_lights_on(HELI_AMBUSH_VEHICLE, true)
	vehicle_set_sirens(HELI_AMBUSH_VEHICLE, true)

	-- Setup the speed reduction
	trigger_enable("tss01_$heli_ambush", true)
	on_trigger("tss01_slow_ambush_down", "tss01_$heli_ambush")

	--	Reduce the hitpoints
	set_max_hit_points(HELI_AMBUSH_VEHICLE, get_max_hit_points(HELI_AMBUSH_VEHICLE) * VEHICLE_HEALTH_MULTIPLIER, true)

	-- Setup the callback
	on_vehicle_destroyed("tss01_ambush_destroyed", HELI_AMBUSH_VEHICLE)

	-- Teleport the heli to the location we want it to be
	teleport_vehicle(HELI_AMBUSH_VEHICLE, "tss01_$n035")

	-- Have the heli pathfind
	helicopter_fly_to_direct(HELI_AMBUSH_VEHICLE, 90.0, "tss01_$path004")
	-- Make this heli unjackable
	set_unjackable_flag(HELI_AMBUSH_VEHICLE, true)

	-- Have Carlos attack the helicopter if he can safely do so.
	CARLOS_AMBUSH_THREAD_HANDLE = thread_new("tss01_carlos_destroy_ambush")

	-- If Carlos needs to be revived, have him ignore the helicopter
	on_revived("tss01_carlos_ignore_ambush", CHARACTER_CARLOS)

	-- We've had problems with Carlos being stuck dependent trying to destroy the ambush.
	-- if he takes too long, kill the thread and make him dependent.
	delay(12)
	tss01_carlos_ignore_ambush()
end

function tss01_carlos_should_destroy_ambush()

	-- Have Carlos attack the heli if it is safe to do so.
	if (	(get_dist("tss01_$carlos_shoot", CHARACTER_CARLOS) < 50)
			and vehicle_exists(HELI_AMBUSH_VEHICLE)
			and (not vehicle_is_destroyed(HELI_AMBUSH_VEHICLE))
			and (character_exists("tss01_$c027"))
			and (not character_is_dead("tss01_$c027"))
			and (not character_is_in_vehicle(CHARACTER_CARLOS))
			and (not follower_is_unconscious(CHARACTER_CARLOS))
			and (CARLOS_HIDE_THREAD_HANDLE == INVALID_THREAD_HANDLE)
		) then
		return true
	end

	return false

end

function tss01_slow_ambush_down()
	-- Disable the trigger
	trigger_enable("tss01_$heli_ambush", false)
	-- Slow the heli down
	vehicle_speed_override(HELI_AMBUSH_VEHICLE, 15.0)
end

-- Have Carlos attempt to shoot down the ambush helicopter
function tss01_carlos_destroy_ambush()

	-- Move Carlos into position
	if(tss01_carlos_should_destroy_ambush()) then

		follower_make_independent(CHARACTER_CARLOS, true)
		move_to_safe(CHARACTER_CARLOS, "tss01_$carlos_shoot", 3, true, true)

		-- Tell Carlos to shoot it down (well the pilot that is)
		if ( tss01_carlos_should_destroy_ambush() and (get_dist("tss01_$carlos_shoot", CHARACTER_CARLOS) < 5) ) then
			set_perfect_aim(CHARACTER_CARLOS, true)
			attack(CHARACTER_CARLOS, "tss01_$c027")
		end

		set_perfect_aim(CHARACTER_CARLOS, false)

	end

end

-- Have Carlos stop trying to shoot down the ambush helicopter
Tss01_carlos_ignoring_ambush = false
function tss01_carlos_ignore_ambush(dont_make_dependent)

	if(Tss01_carlos_ignoring_ambush == false) then

		Tss01_carlos_ignoring_ambush = true

		-- Clear out the on-revived callback
		on_revived("", CHARACTER_CARLOS)

		-- Kill the thread that has Carlos attack the ambush helicopter
		if(CARLOS_AMBUSH_THREAD_HANDLE ~= INVALID_THREAD_HANDLE) then

			thread_kill(CARLOS_AMBUSH_THREAD_HANDLE )
			CARLOS_AMBUSH_THREAD_HANDLE  = INVALID_THREAD_HANDLE

		end

		-- Make Carlos dependent again.
		if (not dont_make_dependent) then
			follower_make_independent(CHARACTER_CARLOS, false)
		end

		set_perfect_aim(CHARACTER_CARLOS, false)

	end


end

-- Called when the ambush helicopter has been destroyed
function tss01_ambush_destroyed()
	-- Remove the callback
	on_vehicle_destroyed("", HELI_AMBUSH_VEHICLE)
	-- Remove the revived callback
	on_revived("", CHARACTER_CARLOS)
	-- Make Carlos dependent
	tss01_carlos_ignore_ambush()
end

function tss01_warden_path()
	-- Disable the trigger since it isn't needed anymore
	trigger_enable(WARDONS_TRIGGER, false)

	-- Create the Warden group incase the player tries to go that direction
	group_create(GROUP_WARDENS)
	if (tss01_spawn_coop_groups()) then
		group_create(GROUP_WARDENS_COOP)
	end

	-- Tell these guys they can't hit a barn 3 feet in front of them
	for i = 1, Num_tss01_warden_guards, 1 do
		npc_weapon_spread(Tss01_warden_guards[i], tss01_get_weapon_spread(1.5))
		on_death("tss01_release_to_world", Tss01_warden_guards[i])
	end
	tss01_update_hit_points(Tss01_warden_guards)

	for i = 1, Num_tss01_warden_rifle_guards, 1 do
		-- We want these guys to have rifles
		inv_item_add("m16", 1, Tss01_warden_rifle_guards[i], true)
		npc_weapon_spread(Tss01_warden_rifle_guards[i], tss01_get_weapon_spread(2.0))
		on_death("tss01_release_to_world", Tss01_warden_rifle_guards[i])
	end
	tss01_update_hit_points(Tss01_warden_rifle_guards)
end

function tss01_lighthouse_path()
	-- Disable the trigger since it isn't needed anymore
	trigger_enable(LIGHTHOUSE_TRIGGER, false)

	-- Create the Lighthouse group incase the player tries to go that direction
	group_create(GROUP_LIGHTHOUSE)
	if (tss01_spawn_coop_groups()) then
		group_create(GROUP_LIGHTHOUSE_COOP)
	end

	-- Tell these guys they can't hit a barn 3 feet in front of them
	for i = 1, Num_tss01_lighthouse_rifle_guards, 1 do
		-- We want these guys to have rifles
		inv_item_add("m16", 1, Tss01_lighthouse_rifle_guards[i], true)
		npc_weapon_spread(Tss01_lighthouse_rifle_guards[i], tss01_get_weapon_spread(2.0))
		on_death("tss01_release_to_world", Tss01_lighthouse_rifle_guards[i])
	end
	tss01_update_hit_points(Tss01_lighthouse_rifle_guards)
end

function tss01_waypoint_end()

	-- Carlos must be alive when this trigger is hit
	if (character_is_dead(CHARACTER_CARLOS)) then
		return
	end

	-- Make sure taht Carlos isn't still trying to shoot down the ambush helicopter
	tss01_carlos_ignore_ambush(true)

	-- Can't activate this checkpoint while in a vehicle
	if ( character_is_in_vehicle(LOCAL_PLAYER) or (IN_COOP and character_is_in_vehicle(REMOTE_PLAYER)) ) then
		return
	end

	-- If we are in coop, they need to be together in order to proceed
	if (IN_COOP) then
		-- Check the distance
		if (	(get_dist(LOCAL_PLAYER, REMOTE_PLAYER) > 10.0)
				or (not character_is_ready(LOCAL_PLAYER))
				or (not character_is_ready(REMOTE_PLAYER))
			) then
			-- Show the players the cooperative message
			mission_help_table_nag("tss01_cooperative")
			return
		end
	end

	-- Stop adjusting the hp of vehicles that the players enter
	if (VEHICLE_HP_THREAD_HANDLE ~= INVALID_THREAD_HANDLE) then
		thread_kill(VEHICLE_HP_THREAD_HANDLE)
	end

	if (SWIM_DISTANCE_THREAD_HANDLE ~= INVALID_THREAD_HANDLE) then
		thread_kill(SWIM_DISTANCE_THREAD_HANDLE)
	end

	-- The checkpoint has been hit!
	mission_set_checkpoint(MISSION_CHECKPOINT_BOAT)

	-- Make Carlos invulnerable
	turn_invulnerable(CHARACTER_CARLOS, false)

	-- Remove this callback in case this is hit before Carlos shoots it down
	on_vehicle_destroyed("", HELI_AMBUSH_VEHICLE)

	-- Remove the marker
	marker_remove_trigger(Tss01_waypoints[12], SYNC_ALL)
	-- Disable the incomming trigger
	trigger_enable(Tss01_waypoints[12], false)
	-- Remove the waypoint
	mission_waypoint_remove(SYNC_ALL)

	-- Release the groups that are no longer needed
	release_to_world(GROUP_TUT_SEARCH)
	release_to_world(GROUP_TUT_FINE_AIM)
	release_to_world(GROUP_TUT_T_IN_ROAD)
	release_to_world(GROUP_COURTYARD)
	release_to_world(GROUP_COURTYARD_COOP)
	release_to_world(GROUP_SHORTBUS)
	release_to_world(GROUP_RUN_GUN)
	release_to_world(GROUP_RANDOM)
	release_to_world(GROUP_RANDOM_COOP)
	release_to_world(GROUP_ROADBLOCK)
	release_to_world(GROUP_ROADBLOCK_COOP)
	release_to_world(GROUP_HELI_AMBUSH)

	-- Create the first wave
	group_create_hidden(GROUP_WAVE_1)
	group_create_hidden(GROUP_BOAT_1)
	group_create_hidden(GROUP_BOAT_2)
	group_create_hidden(GROUP_BOAT_3)
	group_create_hidden(GROUP_HELI_1)

	-- If Carlos is knocked out, wait for revival
	while (follower_is_unconscious(CHARACTER_CARLOS)) do
		thread_yield()
	end

	-- Play blocking audio line for Carlos
	if (get_dist(CHARACTER_CARLOS,Tss01_waypoints[12])  < 20) then
		tss01_audio_play_for_character("CARLOS_TSSP1_SEESBOAT", CHARACTER_CARLOS, "voice", false, false, true)
	end

	tss01_all_aboard()
end

function tss01_all_aboard()

	-- Disable player controls while we place them in the vehicles.
	player_controls_disable(LOCAL_PLAYER)
	if (IN_COOP) then
		player_controls_disable(REMOTE_PLAYER)
	end

	-- Stop any vehicles that the players are in
	local local_vehicle = get_char_vehicle_name(LOCAL_PLAYER)
	if (local_vehicle ~= "") then
		vehicle_stop(local_vehicle)
	end
	if (IN_COOP) then
		local remote_vehicle = get_char_vehicle_name(REMOTE_PLAYER)
		if (remote_vehicle ~= "") then
			vehicle_stop(remote_vehicle)
		end
	end

	-- Delay so the audio comes after the tutorial
	delay(1.0)

	--[[
	-- If Carlos or the players are far enough away, then we'll have to teleport people
	-- to the dock area.
	local teleport_distance = 20
	local need_to_teleport =	(	(get_dist(CHARACTER_CARLOS,Tss01_waypoints[12])  > teleport_distance)
											or (get_dist_closest_player_to_object(Tss01_waypoints[12]) > teleport_distance)
										)
	]]

	-- We're experience problems when players are directly teleported into the boat after hitting the trigger
	-- at full speed in a cop car. I think that always doing the teleport will fix the problem.
	local need_to_teleport = true

	if(need_to_teleport) then
		fade_out(1)
		fade_out_block()
	end

	tss01_place_turret_boat_occupants(need_to_teleport)

	if(need_to_teleport) then
		fade_in(0.5)
		fade_in_block()
	end

	-- Reenable player controls now that they're in the boat.
	player_controls_enable(LOCAL_PLAYER)
	if (IN_COOP) then
		player_controls_enable(REMOTE_PLAYER)
	end

	tss01_goto_mainland()
end

function tss01_place_turret_boat_occupants(need_to_teleport)

	-- Okay, now that the fade is complete the vehicle can be entered
	set_unjackable_flag(HIGH_SEAS_VEHICLE, false)

	-- But its radio doesn't work :(
	radio_block(HIGH_SEAS_VEHICLE)

	-- Make extra-special sure that the client knows they can't do shit
	delay(0.25)

	party_dismiss_all()

	character_evacuate_from_all_vehicles(CHARACTER_CARLOS)
	character_evacuate_from_all_vehicles(LOCAL_PLAYER)
	if (IN_COOP) then
		character_evacuate_from_all_vehicles(REMOTE_PLAYER)
	end
		
	if (need_to_teleport) then

		teleport_coop(NAVP_BOAT_STAGING_LOCAL, NAVP_BOAT_STAGING_REMOTE, true)
		teleport(CHARACTER_CARLOS, NAVP_BOAT_STAGING_CARLOS)
		while(	(get_dist(LOCAL_PLAYER, NAVP_BOAT_STAGING_LOCAL) > 5)
					or (get_dist(CHARACTER_CARLOS, NAVP_BOAT_STAGING_CARLOS) > 5)
				) do
			thread_yield()
		end
	end

	vehicle_evacuate(HIGH_SEAS_VEHICLE)

	-- Put Carlos in the driver's seat
	tss01_setup_carlos_entry()
	-- Put the player(s) in the correct seats
	tss01_setup_players()

	while(not character_is_in_vehicle(LOCAL_PLAYER, HIGH_SEAS_VEHICLE) ) do
		thread_yield()
	end
	while(not character_is_in_vehicle(CHARACTER_CARLOS, HIGH_SEAS_VEHICLE) ) do
		thread_yield()
	end

	if (IN_COOP) then	
		while(not character_is_in_vehicle(REMOTE_PLAYER, HIGH_SEAS_VEHICLE) ) do
			vehicle_enter_teleport(REMOTE_PLAYER, HIGH_SEAS_VEHICLE, 5)
			delay(1.0)
		end
	end

	-- Put Carlos back in the player's party
	party_add(CHARACTER_CARLOS, LOCAL_PLAYER)
	follower_make_independent(CHARACTER_CARLOS, true)

	-- Don't let players recruit anyone else 
	-- (Not sure if it would be possible to re-recruit followers left on the dock. Better safe than sorry.)
	party_set_recruitable(false)

end

function tss01_setup_carlos_entry()

	-- Make sure that the ambush thread is killed
	if(AMBUSH_THREAD_HANDLE ~= INVALID_THREAD_HANDLE) then
		thread_kill(AMBUSH_THREAD_HANDLE)
	end
	
	-- Remove the revive callback
	on_revived("", CHARACTER_CARLOS)
	-- Make Carlos go idle first so we don't switch from a state we are not suppose to
	npc_go_idle(CHARACTER_CARLOS)

	-- Don't let npcs exit until we say so
	vehicle_suppress_npc_exit(HIGH_SEAS_VEHICLE, true)
	-- Don't let the vehicle move until we say so
	vehicle_speed_override(HIGH_SEAS_VEHICLE, 0.05)

	-- Thread yield for a frame to allow the AI to change before entering a vehicle
	thread_yield()

	-- Teleport Carlos into the driver's seat
	vehicle_enter_teleport(CHARACTER_CARLOS, HIGH_SEAS_VEHICLE, 0)
end

function tss01_setup_players()
	
	-- Teleport the player(s) into the vehicle
	vehicle_enter_teleport(LOCAL_PLAYER, HIGH_SEAS_VEHICLE, 4)	
	if (IN_COOP) then
		vehicle_enter_teleport(REMOTE_PLAYER, HIGH_SEAS_VEHICLE, 5)
	end

	tss01_setup_boat_segment()
end

function tss01_setup_boat_segment()
	-- Do not let the player(s) exit...
	set_player_can_enter_exit_vehicles(LOCAL_PLAYER, false)
	if (IN_COOP) then
		set_player_can_enter_exit_vehicles(REMOTE_PLAYER, false)
	end

	-- Create a new thread to setup the boat ride sequence
	thread_new("tss01_yacht_attack_sequence")

	-- If the ambush heli was skipped it should now chase
	if (not vehicle_is_destroyed(HELI_AMBUSH_VEHICLE)) then
		vehicle_chase(HELI_AMBUSH_VEHICLE, LOCAL_PLAYER)
	end

	-- Give the player(s) an assault rifle
	inv_weapon_add_temporary(LOCAL_PLAYER, "AR200_ss03", 1, true, true)
	if (IN_COOP) then
		inv_weapon_add_temporary(REMOTE_PLAYER, "AR200_ss03", 1, true, true)
	end
	TEMP_WEAPONS_GIVEN = true

	-- Only allow the rifle slot
	inv_weapon_disable_all_but_this_slot(WEAPON_SLOT_RIFLE)

	-- Make sure that the weapons is equipped and the characters are combat ready
	thread_new("tss01_keep_ar200_equipped")

	-- Reset the time of day scale factor
	set_time_of_day_scale()

end

function tss01_keep_ar200_equipped()

	local function update_player(player)
		if (not inv_item_is_equipped("AR200_ss03", player)) and character_is_in_vehicle(player, HIGH_SEAS_VEHICLE) then
			inv_item_equip("AR200_ss03", player)
		end
		character_set_combat_ready(player, true, 1.0)
	end

	while(1) do
		update_player(LOCAL_PLAYER)
		if (IN_COOP) then
			update_player(REMOTE_PLAYER)
		end
		delay(0.25)
	end
end


Tss01_carlos_attack_line_enabled = false
Tss01_carlos_damage_line_enabled = false
function tss01_play_carlos_boat_lines()

	npc_suppress_persona(CHARACTER_CARLOS, true)

	local attack_line_delay = 0
	local damage_line_delay = 0

	-- Don't play any lines for a bit
	delay(10)
	Tss01_carlos_attack_line_enabled = false
	Tss01_carlos_damage_line_enabled = false

	local function can_play_attack_line()
		return (Tss01_carlos_attack_line_enabled and (attack_line_delay == 0))
	end

	local function can_play_damage_line()
		return (Tss01_carlos_damage_line_enabled and (damage_line_delay == 0))
	end

	while(true) do

		-- Wait until we can play a line. Favor attack lines, they're only triggered when a boat or
		-- heli is destroyed and are therefore more time critical
		while( (can_play_attack_line() == false) and (can_play_damage_line() == false) ) do

			-- Update delays
			if(attack_line_delay > 0) then
				attack_line_delay = attack_line_delay - 1
			end
			if(damage_line_delay > 0) then
				damage_line_delay = damage_line_delay - 1
			end

			-- Reset line playability. We only want to play lines that have been triggered since the
			-- last check
			Tss01_carlos_attack_line_enabled = false
			Tss01_carlos_damage_line_enabled = false

			-- Wait a second before checking again
			delay(1)

		end
	
		if (can_play_attack_line()) then
			tss01_audio_play_for_character("CARLOS_TSSP1_ATKBOAT", CHARACTER_CARLOS, "voice", false, true)
			delay(2.0)
			attack_line_delay = CARLOS_BOAT_ATTACK_LINE_DELAY_MIN_S
		elseif (Tss01_carlos_damage_line_enabled) then
			tss01_audio_play_for_character("CARLOS_TSSP1_DAMBOAT", CHARACTER_CARLOS, "voice", false, true)
			delay(2.0)
			damage_line_delay = rand_int(CARLOS_BOAT_DAMAGE_LINE_DELAY_MIN_S, CARLOS_BOAT_DAMAGE_LINE_DELAY_MAX_S)
		end

	end

end

function tss01_enable_carlos_attack_line()
	Tss01_carlos_attack_line_enabled = true
end

function tss01_enable_carlos_damage_line()
	Tss01_carlos_damage_line_enabled = true
end

function tss01_setup_boat_segment_from_checkpoint()

	-- Set the notoriety for the rest of the mission...this is for the restart at checkpoint
	notoriety_set_max("police", 1)
	notoriety_set_min("police", 1)

	--tss01_setup_boat_segment()

	-- Go to the mainland
	tss01_goto_mainland()
end

function tss01_goto_mainland()

	Tss01_boat_sequence_begun = true

	-- Make Carlos invulnerable... players can't revive him
	if (character_exists(CHARACTER_CARLOS) and (not character_is_dead(CHARACTER_CARLOS))) then
		turn_invulnerable(CHARACTER_CARLOS, false)
	end
	-- Spawn off a thread to play the line and deliver the help text (And make the boat not be invulnerable)
	thread_new("tss01_defend_boat")
	-- Start the boat sequence bullhorn audio
	thread_new("tss01_boat_chase_bullhorn_audio")
	-- Cancel the speed override and allow Carlos to drive off
	vehicle_speed_cancel(HIGH_SEAS_VEHICLE)
	-- Pathfind to the end!
	vehicle_pathfind_to(HIGH_SEAS_VEHICLE, "tss01_$path000", true, false)
end

function tss01_defend_boat()
	-- Play audio line for Carlos
	tss01_audio_play_for_character("CARLOS_TSSP1_ON_BOAT_01", CHARACTER_CARLOS, "voice", false, true)
	-- Prompt the user with help text...
	mission_help_table("tss01_boat")
	-- Show the damage bar of the vehicle...
	damage_indicator_on(0, HIGH_SEAS_VEHICLE, 0.0, "tss01_boat_health", get_max_hit_points(HIGH_SEAS_VEHICLE), SYNC_ALL)
	-- Create a thread to play Carlos's persona lines
	thread_new("tss01_play_carlos_boat_lines")
	-- Wait a little bit, then make the vehicle invulnerable.
	while(get_dist(Tss01_waypoints[12], HIGH_SEAS_VEHICLE) < 50) do
		thread_yield()
	end
	turn_vulnerable(HIGH_SEAS_VEHICLE)
end

function tss01_yacht_attack_sequence()
	-- Setup the triggers for the attack sequence
	trigger_enable(YACHT_TRIGGER_2, true)
	trigger_enable(YACHT_TRIGGER_3, true)

	-- Delay a short period of time
	delay(3)

	-- Show the first wave and execute
	tss01_attack_yacht_first_wave()
	
	-- Setup the second wave and mission complete triggers
	on_trigger("tss01_attack_yacht_second_wave", YACHT_TRIGGER_2)
	on_trigger("tss01_completed", YACHT_TRIGGER_3)

	-- Create the second wave
	group_create_hidden(GROUP_WAVE_2)
	group_create_hidden(GROUP_BOAT_4)
	group_create_hidden(GROUP_BOAT_5)
	group_create_hidden(GROUP_HELI_2)
	group_create_hidden(GROUP_HELI_3)

	-- Put the humans in the vehicles
	vehicle_enter_group_teleport(Tss01_boat4_table, GROUP_BOAT_4)
	vehicle_enter_group_teleport(Tss01_boat5_table, GROUP_BOAT_5)
	vehicle_enter_group_teleport(Tss01_heli2_table, GROUP_HELI_2)
	vehicle_enter_group_teleport(Tss01_heli3_table, GROUP_HELI_3)

	for i = 1, Num_tss01_boat4_table, 1 do
		inv_item_add("m16", 1, Tss01_boat4_table[i])
		npc_unholster_best_weapon(Tss01_boat4_table[i])
		npc_weapon_spread(Tss01_boat4_table[i], 2.0)
	end

	for i = 1, Num_tss01_boat5_table, 1 do
		inv_item_add("m16", 1, Tss01_boat5_table[i])
		npc_unholster_best_weapon(Tss01_boat5_table[i])
		npc_weapon_spread(Tss01_boat5_table[i], 2.0)
	end

	for i = 1, Num_tss01_heli2_table, 1 do
		inv_item_add("m16", 1, Tss01_heli2_table[i])
		npc_unholster_best_weapon(Tss01_heli2_table[i])
		npc_weapon_spread(Tss01_heli2_table[i], 1.5)
	end

	for i = 1, Num_tss01_heli3_table, 1 do
		inv_item_add("m16", 1, Tss01_heli3_table[i])
		npc_unholster_best_weapon(Tss01_heli3_table[i])
		npc_weapon_spread(Tss01_heli3_table[i], 1.5)
	end
end

function tss01_attack_yacht_first_wave()
	-- Put the humans in the vehicles
	vehicle_enter_group_teleport(Tss01_boat1_table, GROUP_BOAT_1)
	vehicle_enter_group_teleport(Tss01_boat2_table, GROUP_BOAT_2)
	vehicle_enter_group_teleport(Tss01_boat3_table, GROUP_BOAT_3)
	vehicle_enter_group_teleport(Tss01_heli1_table, GROUP_HELI_1)

	for i = 1, Num_tss01_boat1_table, 1 do
		inv_item_add("m16", 1, Tss01_boat1_table[i])
		npc_unholster_best_weapon(Tss01_boat1_table[i])
		npc_weapon_spread(Tss01_boat1_table[i], 2.0)
	end

	for i = 1, Num_tss01_boat2_table, 1 do
		inv_item_add("m16", 1, Tss01_boat2_table[i])
		npc_unholster_best_weapon(Tss01_boat2_table[i])
		npc_weapon_spread(Tss01_boat2_table[i], 2.0)
	end

	for i = 1, Num_tss01_boat3_table, 1 do
		inv_item_add("m16", 1, Tss01_boat3_table[i])
		npc_unholster_best_weapon(Tss01_boat3_table[i])
		npc_weapon_spread(Tss01_boat3_table[i], 2.0)
	end

	for i = 1, Num_tss01_heli1_table, 1 do
		inv_item_add("m16", 1, Tss01_heli1_table[i])
		npc_unholster_best_weapon(Tss01_heli1_table[i])
		npc_weapon_spread(Tss01_heli1_table[i], 1.5)
	end

	-- Show the vehicles
	group_show(GROUP_WAVE_1)
	group_show(GROUP_BOAT_1)
	group_show(GROUP_BOAT_2)
	group_show(GROUP_BOAT_3)
	group_show(GROUP_HELI_1)

	-- Set the helicopter to use the new ai navigation.
	helicopter_set_dont_use_constraints(GROUP_HELI_1, true) 

	-- Turn the lights on
	vehicle_lights_on(GROUP_BOAT_1, true)
	vehicle_lights_on(GROUP_BOAT_2, true)
	vehicle_lights_on(GROUP_BOAT_3, true)
	vehicle_lights_on(GROUP_HELI_1, true)
	vehicle_set_sirens(GROUP_BOAT_1, true)
	vehicle_set_sirens(GROUP_BOAT_2, true)
	vehicle_set_sirens(GROUP_BOAT_3, true)
	vehicle_set_sirens(GROUP_HELI_1, true)

	-- Make first wave attack
	vehicle_chase(GROUP_BOAT_1, LOCAL_PLAYER, false, false, true)
	vehicle_chase(GROUP_BOAT_2, LOCAL_PLAYER, false, false, true)
	vehicle_chase(GROUP_BOAT_3, LOCAL_PLAYER, false, false, true)
	vehicle_chase(GROUP_HELI_1, LOCAL_PLAYER)

	-- Lower the hitpoints to about half
	set_max_hit_points(GROUP_BOAT_1, get_max_hit_points(GROUP_BOAT_1) * 0.5, true)
	set_max_hit_points(GROUP_BOAT_2, get_max_hit_points(GROUP_BOAT_2) * 0.5, true)
	set_max_hit_points(GROUP_BOAT_3, get_max_hit_points(GROUP_BOAT_3) * 0.5, true)
	set_max_hit_points(GROUP_HELI_1, get_max_hit_points(GROUP_HELI_1) * 0.5, true)

	-- Allow Carlos to blay an attack line when a boat or heli is destroyed
	on_vehicle_destroyed("tss01_enable_carlos_attack_line", GROUP_BOAT_1)
	on_vehicle_destroyed("tss01_enable_carlos_attack_line", GROUP_BOAT_2)
	on_vehicle_destroyed("tss01_enable_carlos_attack_line", GROUP_BOAT_3)
	on_vehicle_destroyed("tss01_enable_carlos_attack_line", GROUP_HELI_1)
end

function tss01_attack_yacht_second_wave(human, trigger)
	trigger_enable(trigger, false)

	-- Show the vehicles
	group_show(GROUP_WAVE_2)
	group_show(GROUP_BOAT_4)
	group_show(GROUP_BOAT_5)
	group_show(GROUP_HELI_2)
	group_show(GROUP_HELI_3)
	
	-- Set the helicopter to use the new ai navigation.
	helicopter_set_dont_use_constraints(GROUP_HELI_2, true) 
	helicopter_set_dont_use_constraints(GROUP_HELI_3, true) 

	-- Turn the lights on
	vehicle_lights_on(GROUP_BOAT_4, true)
	vehicle_lights_on(GROUP_BOAT_5, true)
	vehicle_lights_on(GROUP_HELI_2, true)
	vehicle_lights_on(GROUP_HELI_3, true)
	vehicle_set_sirens(GROUP_BOAT_4, true)
	vehicle_set_sirens(GROUP_BOAT_5, true)
	vehicle_set_sirens(GROUP_HELI_2, true)
	vehicle_set_sirens(GROUP_HELI_3, true)

	-- Make second wave attack
	vehicle_chase(GROUP_BOAT_4, LOCAL_PLAYER, false, false, true)
	vehicle_chase(GROUP_BOAT_5, LOCAL_PLAYER, false, false, true)
	vehicle_chase(GROUP_HELI_2, LOCAL_PLAYER)
	vehicle_chase(GROUP_HELI_3, LOCAL_PLAYER)

	-- Lower the hitpoints to about half
	set_max_hit_points(GROUP_BOAT_4, get_max_hit_points(GROUP_BOAT_4) * 0.5, true)
	set_max_hit_points(GROUP_BOAT_5, get_max_hit_points(GROUP_BOAT_5) * 0.5, true)
	set_max_hit_points(GROUP_HELI_2, get_max_hit_points(GROUP_HELI_2) * 0.5, true)
	set_max_hit_points(GROUP_HELI_3, get_max_hit_points(GROUP_HELI_3) * 0.5, true)

	-- Allow Carlos to blay an attack line when a boat or heli is destroyed
	on_vehicle_destroyed("tss01_enable_carlos_attack_line", GROUP_BOAT_4)
	on_vehicle_destroyed("tss01_enable_carlos_attack_line", GROUP_BOAT_5)
	on_vehicle_destroyed("tss01_enable_carlos_attack_line", GROUP_HELI_2)
	on_vehicle_destroyed("tss01_enable_carlos_attack_line", GROUP_HELI_3)
end

function tss01_completed(human, trigger)
	trigger_enable(trigger, false)

	-- Retreat the first and second waves...
	if (vehicle_exists(GROUP_BOAT_1)) then
		vehicle_flee(GROUP_BOAT_1)
	end
	
	if (vehicle_exists(GROUP_BOAT_2)) then
		vehicle_flee(GROUP_BOAT_2)
	end
	
	if (vehicle_exists(GROUP_BOAT_3)) then
		vehicle_flee(GROUP_BOAT_3)
	end
	
	if (vehicle_exists(GROUP_BOAT_4)) then
		vehicle_flee(GROUP_BOAT_4)
	end
	
	if (vehicle_exists(GROUP_BOAT_5)) then
		vehicle_flee(GROUP_BOAT_5)
	end
	
--	if (vehicle_exists(GROUP_HELI_1)) then
--		vehicle_flee(GROUP_HELI_1)
--	end
	
--	if (vehicle_exists(GROUP_HELI_2)) then
--		vehicle_flee(GROUP_HELI_2)
--	end
	
--	if (vehicle_exists(GROUP_HELI_3)) then
--		vehicle_flee(GROUP_HELI_3)
--	end

	-- Wait 3 seconds in addition to the default 2 seconds
	delay(3.0)
	-- Success!
	mission_end_success("tss01","TSSP01-02", {LOCAL_PLAYER_FINISH, REMOTE_PLAYER_FINISH})
end

function tss01_spawn_coop_groups()
	return (IN_COOP and (not COOP_SPAWNS_DISABLED))
end

function tss01_get_weapon_spread(value)
	if (IN_COOP) then
		return (1 + 0.5*(value - 1))
	else
		return value
	end
end

function tss01_update_hit_points(npc_list)
	if (IN_COOP) then
		for i,npc in pairs(npc_list) do
			local max_hit_points = get_max_hit_points(npc)
			set_max_hit_points(npc, max_hit_points * COOP_NPC_HP_MULTIPLIER)
		end
	else
		return
	end
end

Tss01_mission_dialogue_playing = false

function tss01_audio_play_for_character(tag, character, audio_type, for_cutscene, blocking, ignore_pause)

	if (not Tss01_mission_dialogue_playing) then

		Tss01_mission_dialogue_playing = true
		audio_play_for_character(tag, character, audio_type, for_cutscene, blocking, nil, nil, nil, ignore_pause)
		Tss01_mission_dialogue_playing = false

	end

end

function tss01_audio_play_conversation(conversation)

	if (not Tss01_mission_dialogue_playing) then
		Tss01_mission_dialogue_playing = true
		audio_play_conversation(conversation)
		Tss01_mission_dialogue_playing = false
	end

end