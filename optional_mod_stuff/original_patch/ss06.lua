-- ss06.lua
-- SR2 mission script
-- 3/28/07

-- Mission help table text tags
   HT_GET_BACK_TO_HQ_OBJECTIVE = "ss06_get_back_to_HQ"
   HT_SHAUNDI_RUNNING_OUT_OF_TIME = "ss06_shaundi_running_out_of_time"
   HT_DEFEND_HQ_OBJECTIVE = "ss06_defend_HQ"
   HT_X_OF_Y_WAVES_DEFEATED = "ss06_x_of_y_waves_defeated"
   HT_SHAUNDI_DIED = "ss06_shaundi_died"
   HT_SHAUNDI_DIED_HIGHLIGHTED = "ss06_shaundi_died_highlighted"
   HT_PIERCE_DIED = "ss06_pierce_died"
   HT_PIERCE_DIED_HIGHLIGHTED = "ss06_pierce_died_highlighted"
   HT_SHAUNDI_ABANDONED = "ss06_shaundi_abandoned"
   HT_PIERCE_ABANDONED = "ss06_pierce_abandoned"
   HT_HELP_PIERCE = "ss06_help_pierce"
   HT_SAMEDI_GANG_MEMBERS_KILLED = "ss06_samedi_gang_members_killed"
   HT_RESCUE_SHAUNDI = "ss06_rescue_shaundi"

   HT_SHAUNDI_HEALTH_BAR_LABEL = "ss06_shaundi_health_bar_label"
   HT_PIERCE_HEALTH_BAR_LABEL = "ss06_pierce_health_bar_label"
   HT_RETURN_TO_HQ_DEFENSE_SECONDS_TEXT = "ss06_return_to_hideout_seconds"
   HT_LEFT_HQ_UNDEFENDED_FAILURE = "ss06_left_hq_undefended"
   HT_SECONDS_TO_REVIVE_HOMIE_TEXT = "ss06_seconds_to_revive_homie"

-- Mission states
   MS_NONE = 1
   MS_BEGUN = 2
   MS_SPAWN_RESUMED = 3
   MS_SAVED_SHAUNDI = 4
   MS_KILL_DRIVEUP_ATTACKERS = 5
   MS_PIERCE_APPEARS = 6
   MS_DEFENDING_HQ = 7
   MS_FAILURE = 8

-- Checkpoints
   CP_SAVED_SHAUNDI = "Saved Shaundi"

-- Groups, NPCs, vehicles, navpoints, and other names
   -- Mission constant names
   ENEMY_GANG = "samedi"
   MISSION_NAME = "ss06"
   MP = MISSION_NAME.."_$"
   CLOSEST_PLAYER = "#PLAYER#"

   -- Groups
   NORTH_ROADBLOCK_NAME = MP.."North_Roadblock"
   SOUTH_ROADBLOCK_NAME = MP.."South_Roadblock"
   ON_FOOT_SQUAD_GROUP_NAMES = { MP.."On_foot_squad1", MP.."On_foot_squad2", MP.."On_foot_squad3" }
   ON_FOOT_SQUAD_GROUP_NAMES_COOP = { MP.."On_foot_squad1_coop", MP.."On_foot_squad2_coop", MP.."On_foot_squad3_coop" }   
   ALT_ESCAPE_GROUP_NAME = MP.."Alt_Escape_Squad1"
   ALT_ESCAPE_COOP_GROUP_NAME = MP.."Alt_Escape_Squad1c"

   MISSION_START_COLLISION_GROUP_NAME = MP.."Collision"

   INITIAL_ATTACKERS_GROUP_NAME = MP.."Initial_Base_Attackers"

   SHAUNDI_GROUP_NAME = MP.."Shaundi"
   SHAUNDI_ATTACKERS_GROUP_NAME = MP.."Shaundi_Attackers"
   HQ_GUN_SPAWN = MP.."HQ_Gun_Spawn"

   ENTRANCE_REINFORCEMENTS_GROUP_NAME = MP.."Entrance_Reinforcements"
   PRE_PIERCE_REINFORCEMENTS_GROUP_NAME = MP.."Pre_Pierce_Reinforcements"
   PIERCE_GROUP_NAME = MP.."Pierce"
   PIERCE_PURSUIT_GROUP_NAME = MP.."Pierce_Pursuit"

   -- Wave group prefix
   WAVE_GROUP = MP.."Wave"
   -- Example: Wave 4:
   -- WAVE_GROUP.."4" = "ss06_$Wave4"

   FINAL_ATTACK_GROUP_NAME = MP.."Final_Attack_Wave"

   -- NPC names
   SOUTH_CAMPER_NAMES = { MP.."South_Camper_01", MP.."South_Camper_02" }
   NORTH_CAMPER_NAMES = { MP.."North_Camper_01", MP.."North_Camper_02" }

   ON_FOOT_SQUAD_1_MEMBERS = { MP.."On_foot_1_lead", MP.."On_foot_1_01", MP.."On_foot_1_02" }
   ON_FOOT_SQUAD_1C_MEMBERS = { MP.."On_foot_1c_lead" }
   
   ON_FOOT_SQUAD_2_MEMBERS = { MP.."On_foot_2_lead", MP.."On_foot_2_01", MP.."On_foot_2_02" }
   ON_FOOT_SQUAD_2C_MEMBERS = { MP.."On_foot_2c_lead" }

   ON_FOOT_SQUAD_3_MEMBERS = { MP.."On_foot_3_lead", MP.."On_foot_3_01", MP.."On_foot_3_02" }
   ON_FOOT_SQUAD_3C_MEMBERS = { MP.."On_foot_3c_lead" }
   ON_FOOT_SQUAD_MEMBERS = { ON_FOOT_SQUAD_1_MEMBERS, ON_FOOT_SQUAD_2_MEMBERS, ON_FOOT_SQUAD_3_MEMBERS }
   ON_FOOT_SQUAD_MEMBERS_COOP = { ON_FOOT_SQUAD_1C_MEMBERS, ON_FOOT_SQUAD_2C_MEMBERS, ON_FOOT_SQUAD_3C_MEMBERS }

   ALT_ESCAPE_SQUAD_MEMBERS = { MP.."Alt_Escape_Squad1_01", MP.."Alt_Escape_Squad1_02", MP.."Alt_Escape_Squad1_03" }
   ALT_ESCAPE_COOP_MEMBERS = { MP.."Alt_Escape_Squad1c_01" }

   COLLISION_CAR_MEMBERS = { { MP.."CM1_1" }, { MP.."CM2_1" }, { MP.."CM3_1" }, { MP.."CM4_1" }, { MP.."CM5_1" } }

   INITIAL_BASE_ATTACKERS_MEMBERS = { MP.."Initial_01", MP.."Initial_02", MP.."Initial_03", MP.."Initial_04" }
   SHAUNDI_ATTACKERS_MEMBERS = { MP.."SA_01", MP.."SA_02", MP.."SA_03" }
   SHAUNDI_DIRECT_ATTACKERS = { SHAUNDI_ATTACKERS_MEMBERS[1], SHAUNDI_ATTACKERS_MEMBERS[2] }
   ENTRANCE_REINFORCEMENTS_MEMBERS = { MP.."ER_01", MP.."ER_02", MP.."ER_03", MP.."ER_04", MP.."ER_05" }
   PRE_PIERCE_SQUADS_MEMBERS = { { MP.."PP_S1_01", MP.."PP_S1_02", MP.."PP_S1_03" },
                                 { MP.."PP_S2_01", MP.."PP_S2_02", MP.."PP_S2_03" } }

   ENTRANCE_REINFORCEMENTS_DRIVERS = { MP.."ER_D1", MP.."ER_D2" }


   ENTRANCE_REINFORCEMENTS_V1_PASSENGERS = { ENTRANCE_REINFORCEMENTS_DRIVERS[1], ENTRANCE_REINFORCEMENTS_MEMBERS[1],
                                             ENTRANCE_REINFORCEMENTS_MEMBERS[2], ENTRANCE_REINFORCEMENTS_MEMBERS[3] }
   ENTRANCE_REINFORCEMENTS_V2_PASSENGERS = { ENTRANCE_REINFORCEMENTS_DRIVERS[2], ENTRANCE_REINFORCEMENTS_MEMBERS[4],
                                             ENTRANCE_REINFORCEMENTS_MEMBERS[5] }

   ENTRANCE_REINFORCEMENT_VEHICLE_PASSENGERS = { ENTRANCE_REINFORCEMENTS_V1_PASSENGERS,
                                                 ENTRANCE_REINFORCEMENTS_V2_PASSENGERS }

   PIERCE_NAME = MP.."Pierce"

   PIERCE_PURSUIT_SQUADS_MEMBERS = { { MP.."Pursuit_S1_01", MP.."Pursuit_S1_02", MP.."Pursuit_S1_03" },
                                     { MP.."Pursuit_S2_01", MP.."Pursuit_S2_02", MP.."Pursuit_S2_03" } }

   SHAUNDI_NAME = MP.."Shaundi"

   WAVE_COUNT = 10--2 Reduced by 1 
   WAVES_SQUAD_COUNT = { 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 }

   WAVES_SQUAD_MEMBER_COUNT = { { 4 }, { 4 },
                                { 2, 2 }, { 2, 2 }, { 2, 2 },
                                { 3, 2 }, { 3, 2 }, { 3, 2 }, { 3, 2 },
                                { 3, 3 }, { 3, 3 }, { 3, 3 } }

   WAVES_IS_VEHICLE_SQUAD = { { true }, { false },
                              { true, true }, { true, false }, { false, false },
                              { true, true }, { true, false }, { false, false }, { false, true },
                              { true, true }, { true, false }, { false, false } }

   WAVE_VEHICLE_SQUAD_CHARGE = { { false }, { false },
                                 { true, false }, { false, true }, { false, false },
                                 { false, false }, { false, false }, { false, false }, { false, true },
                                 { false, false }, { false, false }, { false, false } }

   -- Wave prefix
   WAVE = MP.."W"
   -- Squad prefix
   SQUAD = "_S"
   -- Member index prefix
   MIP = "_0"
   -- Example: Wave 1, squad 2, member number 3:
   -- WAVE.."1"..SQUAD.."2"..MIP.."3" -> "ss06_$W1_S2_03"

   -- Squad vehicle suffix
   VEHICLE = "_V"
   -- Example: Wave 3 squad 1 vehicle
   -- WAVE.."3"..SQUAD.."1"..VEHICLE

   FINAL_ATTACK_MEMBER_NAMES = { MP.."FA_01", MP.."FA_02" }
   FINAL_ATTACK_VEHICLE_NAME = MP.."FA_V"

   -- Weapons
   PISTOL = "beretta"
   SMG = "SKR-9"
   AK47 = "ak47"
   INITIAL_BASE_ATTACKERS_WEAPONS = { PISTOL, SMG, AK47, SMG }
   SHAUNDI_ATTACKERS_WEAPONS = { PISTOL, SMG, SMG }
   ENTRANCE_REINFORCEMENTS_WEAPONS = { PISTOL, SMG, AK47, SMG, AK47 }
   PRE_PIERCE_SQUADS_WEAPONS = { { PISTOL, SMG, AK47 }, { PISTOL, PISTOL, AK47 } }
   PIERCE_PURSUIT_SQUADS_WEAPONS = { { PISTOL, SMG, AK47 }, { PISTOL, PISTOL, AK47 } }

   -- Vehicle names
   COLLISION_VEHICLE_NAMES = { MP.."CV1", MP.."CV2", MP.."CV3", MP.."CV4", MP.."CV5" }

   ALT_ESCAPE_VEHICLE_NAME = MP.."Alt_Escape_v1"

   ENTRANCE_REINFORCEMENTS_VEHICLES = { MP.."ER_V1", MP.."ER_V2" }
   PRE_PIERCE_VEHICLE_NAMES = { MP.."PrePierce_V1", MP.."PrePierce_V2" }
   PIERCE_PURSUIT_VEHICLE_NAMES = { MP.."Pierce_Pursuit_V1", MP.."Pierce_Pursuit_V2" }
   PIERCE_VEHICLE_NAME = MP.."Pierce_Car"

   -- Navpoints
   START_NAVPOINT_NAME = "mission_start_sr2_city_$ss06"
   START_NAVPOINT_REMOTE_PLAYER_NAME = MP.."Start_Navpoint_Remote_Player"
   WS_WEST_STOP = MP.."Wave_Stop_04"
   WS_NORTH_STOP = MP.."Wave_Stop_03"
   WS_NORTHEAST_STOP = MP.."Wave_Stop_02"
   WS_SOUTH_STOP = MP.."Wave_Stop_01"
   WS_SOUTHEAST_STOP = MP.."Wave_Stop_02"
   ALT_ESCAPE_ATTACKER_STOP_NAVPOINT_NAME = MP.."Alt_Escape_Attacker_Stop_01"

   ENTRANCE_REINFORCEMENTS_DROPOFF_POINTS = { MP.."ER_V1_Dropoff", MP.."ER_V2_Dropoff" }
   PRE_PIERCE_REINFORCEMENTS_VEHICLE_PATHS = { MP.."PrePierce_V1_Path", MP.."PrePierce_V2_Path" }
   ENTRANCE_REINFORCEMENTS_TO_HQ_PATH = MP.."ER_To_HQ_Path"

   -- These are the goal points that the entrance reinforcements run to after arriving at the Saints HQ
   ENTRANCE_REINFORCEMENTS_GOAL_POINTS = { MP.."ER_Goal_01", MP.."ER_Goal_02", MP.."ER_Goal_03",
                                           MP.."ER_Goal_04", MP.."ER_Goal_05" }

   ENTRANCE_REINFORCEMENTS_VEHICLE_EXIT_PATH = MP.."ER_Exit_Path"
   ENTRANCE_REINFORCEMENTS_VEHICLE_DEST = MP.."ER_Vehicle_Destination"
   PIERCE_FLEE_PATHS = { MP.."Pierce_Flee_Path", MP.."Pierce_Alt_Flee_Path" }
   PIERCE_PURSUIT_WARP_POINTS = { { PIERCE_PURSUIT_VEHICLE_NAMES[1], PIERCE_PURSUIT_VEHICLE_NAMES[2], PIERCE_VEHICLE_NAME },
                                  { MP.."Pierce_Pursuit_V1_Alt_Spawn", MP.."Pierce_Pursuit_V2_Alt_Spawn", MP.."Pierce_Alt_Spawn" } }

   PIERCE_SPAWN_LOCATIONS = { PIERCE_PURSUIT_WARP_POINTS[1][3], PIERCE_PURSUIT_WARP_POINTS[2][3] }

   SAVED_SHAUNDI_CHECKPOINT_WARPS = { [LOCAL_PLAYER] = MP.."Saved_Shaundi_Checkpoint_Warp_Local",
                                      [REMOTE_PLAYER] = MP.."Saved_Shaundi_Checkpoint_Warp_Remote" }

   -- Start positions for vehicle drive-in attack squads
   NORTHEAST_VEHICLE_START = MP.."NorthE_Vehicle_Start"
   NORTHWEST_VEHICLE_START = MP.."NorthW_Vehicle_Start"
   SOUTH_VEHICLE_START = MP.."South_Vehicle_Start"
   EAST_VEHICLE_START = MP.."East_Vehicle_Start"
   WEST_VEHICLE_START = MP.."West_Vehicle_Start"
   VEHICLE_START_POSITIONS = { NORTHEAST_VEHICLE_START, NORTHWEST_VEHICLE_START, SOUTH_VEHICLE_START,
                               EAST_VEHICLE_START, WEST_VEHICLE_START }

   -- Paths that vehicle drive-in attack squads take to the HQ
   NORTHEAST_VEHICLE_PATH = MP.."NorthE_Vehicle_Path"
   NORTHWEST_VEHICLE_PATH = MP.."NorthW_Vehicle_Path"
   SOUTH_VEHICLE_PATH = MP.."South_Vehicle_Path"
   EAST_VEHICLE_PATH = MP.."East_Vehicle_Path"
   WEST_VEHICLE_PATH = MP.."West_Vehicle_Path"
   VEHICLE_DRIVE_UP_PATHS = { NORTHEAST_VEHICLE_PATH, NORTHWEST_VEHICLE_PATH, SOUTH_VEHICLE_PATH,
                              EAST_VEHICLE_PATH, WEST_VEHICLE_PATH }

   -- Dropoff points that vehicle drive-in attack squads use
   NORTHEAST_DROPOFFS = { MP.."NorthE_Dropoff_01", MP.."NorthE_Dropoff_02" }
   NORTHWEST_DROPOFFS = { MP.."NorthW_Dropoff_01", MP.."NorthW_Dropoff_02", MP.."NorthW_Dropoff_03", MP.."NorthW_Dropoff_04" }
   SOUTH_DROPOFFS = { MP.."South_Dropoff_01", MP.."South_Dropoff_02", MP.."South_Dropoff_03" }
   EAST_DROPOFFS = { MP.."East_Dropoff_01", MP.."East_Dropoff_02", MP.."East_Dropoff_03", MP.."East_Dropoff_04" }
   WEST_DROPOFFS = { MP.."West_Dropoff_01", MP.."West_Dropoff_02", MP.."West_Dropoff_03" }
   VEHICLE_DROPOFF_POINTS = { NORTHEAST_DROPOFFS, NORTHWEST_DROPOFFS, SOUTH_DROPOFFS,
                              EAST_DROPOFFS, WEST_DROPOFFS }

   -- Start positions for on-foot Samedi attackers
   NORTHEAST_RALLY_POINTS = { MP.."NorthE_On_Foot_Rally_01" }
   NORTHWEST_RALLY_POINTS = { MP.."NorthW_On_Foot_Rally_01", MP.."NorthW_On_Foot_Rally_02" }
   SOUTH_RALLY_POINTS = { MP.."South_On_Foot_Rally_01", MP.."South_On_Foot_Rally_02" }
   EAST_RALLY_POINTS = { MP.."East_On_Foot_Rally_01" }
   WEST_RALLY_POINTS = { MP.."West_On_Foot_Rally_01" }
   RALLY_POINTS = { NORTHEAST_RALLY_POINTS, NORTHWEST_RALLY_POINTS, SOUTH_RALLY_POINTS,
                    EAST_RALLY_POINTS, WEST_RALLY_POINTS }

   -- Triggers
   SAINTS_HQ_POS = MP.."Saints_HQ_Position"
   START_TRIGGER_REGION_NAME = MP.."Starting_Box"
   START_TRIGGER_ANNEX_NAME = MP.."Starting_Box_Annex"
   ALTERNATE_ESCAPE_SPAWN_TRIGGER_NAME = MP.."Alternate_Escape_Spawn"
   SAINTS_HQ_AREA = MP.."Saints_HQ_Area"
   WAVE_STOP_WEST_TRIGGER = MP.."Wave_Stop_Trigger_West"
   WAVE_STOP_NORTH_TRIGGER = MP.."Wave_Stop_Trigger_North"
   WAVE_STOP_NORTHEAST_TRIGGER = MP.."Wave_Stop_Trigger_Northeast"
   WAVE_STOP_SOUTH_TRIGGER = MP.."Wave_Stop_Trigger_South"
   WAVE_STOP_SOUTHEAST_TRIGGER = MP.."Wave_Stop_Trigger_Southeast"
   SOUTH_TRIGGER_NAME = MP.."South_trigger"
   NORTH_TRIGGER_NAME = MP.."North_trigger"
   SOUTH_CAMPER_TRIGGER_NAME = MP.."South_Camper_Trigger"
   NORTH_CAMPER_TRIGGER_NAME = MP.."North_Camper_Trigger"
   SHAUNDI_BREADCRUMBS = { MP.."Shaundi_BC01", MP.."Shaundi_BC02" }
   REACHED_SHAUNDI_TRIGGER = MP.."Reached_Shaundi_Trigger"
   NEAR_PIERCE_TRIGGER_NAME = MP.."Near_Pierce_Trigger"

	SAINTS_HQ_UP_ELEVATOR_TRIGGER = "redlight_$SHQ_heli_elevator_up"
	SAINTS_HQ_DOWN_ELEVATOR_TRIGGER = "redlight_$SHQ_heli_elevator_down"

   -- Movers
	HIDEOUT_ENTRANCE_DOORS = { MP.."Hideout_Entrance01", MP.."Hideout_Entrance02" }

   -- Effects and animation states

   -- Cutscenes
   CT_INTRO = "ss06-01"
   CT_OUTRO = "ss06-02"
-- Sound
   -- Persona overrides
   SHAUNDI_COMBAT_PERSONA_SITUATION = "custom line 1"
   PIERCE_COMBAT_PERSONA_SITUATION = "custom line 1"
   PLAYER_COMBAT_PERSONA_SITUATION = "custom line 1"

   SHAUNDI_PERSONA_OVERRIDES =
   {
   { "hostage - barters", "SOS06_SHAUNDI_BARTER" },
   { "misc - respond to player taunt w/taunt", "SOS06_SHAUNDI_TAUNT" },
   { "observe - praised by pc", "SOS06_SHAUNDI_PRAISED" },
   { "threat - alert (group attack)", "SOS06_SHAUNDI_ATTACK" },
   { "threat - alert (solo attack)", "SOS06_SHAUNDI_ATTACK" },
   { "threat - damage received (firearm)", "SOS06_SHAUNDI_TAKEDAM" },
   { "threat - damage received (melee)", "SOS06_SHAUNDI_TAKEDAM" },
   { SHAUNDI_COMBAT_PERSONA_SITUATION, "SHAUNDI_SOS6_COMBAT" }
   }
   PIERCE_PERSONA_OVERRIDES = 
   {
   { PIERCE_COMBAT_PERSONA_SITUATION, "PIERCE_SOS6_COMBAT" }
   }
   PLAYER_PERSONA_OVERRIDES =
   {
   { PLAYER_COMBAT_PERSONA_SITUATION, "PLAYER_SOS6_COMBAT" }
   }

   SS06_SAINTS_PERSONAS = {
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

   -- Lines/Dialog Stream
   INITIAL_PHONE_CALL_DIALOG_STREAM = { { "SOS6_PHONECALL_L1", nil, 0 },
                                        { "PLAYER_SOS6_PHONECALL_L2", LOCAL_PLAYER, 0 },
                                        { "SOS6_PHONECALL_L3", nil, 0 },
                                        { "PLAYER_SOS6_PHONECALL_L4", LOCAL_PLAYER, 0 },
                                        { "SOS6_PHONECALL_L5", nil, 0 } }
   MISSION_END_DIALOG_STREAM = { { "SOS6_END_L1", SHAUNDI_NAME, 0 },
                                 { "SOS6_END_L2", PIERCE_NAME, 0 },
                                 { "PLAYER_SOS6_END_L3", LOCAL_PLAYER, 0 } }

   SAVED_SHAUNDI_DIALOG_LINE = "SHAUNDI_SOS6_CHECKPOINT_01"
   SAVED_PIERCE_DIALOG_LINE = "PIERCE_SOS6_ARRIVE_01"

   SHAUNDI_COMBAT_LINES = "SHAUNDI_SOS6_COMBAT"
   PIERCE_COMBAT_LINES = "PIERCE_SOS6_COMBAT"
   PLAYER_COMBAT_LINES = "PLAYER_SOS6_COMBAT"

   -- Sound effects

-- Distances
   SAINTS_HQ_TRIGGER_RADIUS_METERS = 40
   SAINTS_HQ_AREA_RADIUS_METERS = 53.5
   PIERCE_LEASH_DISTANCE = 10.1

-- Percents and multipliers
   DRUNK_EFFECT_MAGNITUDE = 0.75
   WEED_EFFECT_MAGNITUDE = 1.0

   PER_STATE_HAZE_MULTIPLIERS = { 1.0, 0.75, 0.30, 0.20, 0.15, 0.00, 0.00, 0.00, 0.00 }
   PER_STATE_WEED_MULTIPLIERS = { 1.0, 0.90, 0.80, 0.50, 0.50, 0.45, 0.45, 0.45, 0.45 }
   -- This is the range for the number of chunks the life timers will be divided into.
   -- The exact numbers are randomly chosen from within this range.
   GET_TO_HQ_DIVISION_RANGE = { 5, 5 }
   SAVE_PIERCE_DIVISION_RANGE = { 5, 5 }

   -- How far below the average percent for chunks the max size is allowed to be
   -- Between and 0 and 1. If it's one, then the chunks will all be the same size.
   HEALTH_CHUNK_MIN_MULTIPLIER = 0.50
   TIME_CHUNK_MIN_MULTIPLIER = 0.50
   -- How far above the average percent for chunks the max size is allowed to be
   -- Between and 0 and 1. If it's zero, then all chunks will be the same size.
   HEALTH_CHUNK_MAX_MULTIPLIER = 0.50
   TIME_CHUNK_MAX_MULTIPLIER = 0.50

-- Constant values and counts
   MISSION_START_NOTORIETY = 3
   MISSION_MIN_NOTORIETY = 3
   MISSION_MAX_NOTORIETY = 4
   GAME_MAX_NOTORIETY = 5
   ATTACK_CAR_OVERRIDE_SPEED = 70.0

   INITIAL_ATTACK_SQUAD = 1
   SOUTH_ATTACK_SQUAD = 2
   NORTH_ATTACK_SQUAD = 3

   LOCAL_PLAYER_INDEX = 1
   REMOTE_PLAYER_INDEX = 2

   ENTRANCE_REINFORCEMENTS_REMAINING_THRESHOLD = 2
   PRE_PIERCE_ATTACKERS_REMAINING_THRESHOLD = 3
   ATTACKS_REMAINING_SPAWN_NEW_WAVE_THRESHOLD = 4

   VEHICLE_DRIVE_UP_DIRECTION_COUNT = sizeof_table( VEHICLE_START_POSITIONS )
   RALLY_POINT_DIRECTION_COUNT = sizeof_table( RALLY_POINTS )

   -- Trigger options
   TRIGGER_ONCE_FIRST_TRIGGERER = 1
   TRIGGER_ONCE_PER_PLAYER = 2
   TRIGGER_MULTIPLE_TIMES = 3
   -- End trigger options

   -- Wave and squad index of the tow truck
   TOW_TRUCK_INDEX = { 5, 2 }

-- Time values
   DRUG_EFFECT_STATE_SWITCH_REDUCTION_TIME_SECONDS = 30.0
   NOTORIETY_BACK_TO_MIN_SECONDS = 30
   NOTORIETY_BACK_TO_MIN_INCREASE_PER_SECOND = MISSION_MIN_NOTORIETY / NOTORIETY_BACK_TO_MIN_SECONDS
   BETWEEN_WAVE_DELAY_RANGE_SECONDS = { 2.0, 3.0 }
   function get_between_wave_delay()
      return rand_float( BETWEEN_WAVE_DELAY_RANGE_SECONDS[1], BETWEEN_WAVE_DELAY_RANGE_SECONDS[2] )
   end
   BETWEEN_SQUADS_COOP_DELAY_SECONDS = 12.0
   BETWEEN_SQUADS_DELAY_SECONDS = 8.0

   FAILURE_TIMEOUT_ON_LEAVE_DEFENSE_AREA_SECONDS = 30
   GET_TO_HQ_TIME_SECONDS = 120.0
   BEFORE_CELLPHONE_CALL_DELAY = 2.0
   AFTER_CELLPHONE_CALL_DELAY = 5.0
   RESET_OBJECTIVE_TIME_SECONDS = 3.0
   WIN_DELAY_SECONDS = 2.0
   FADE_IN_SECONDS = 2.0
   INVALID_TIMER_VALUE = -1
   WAVE_ANNOUNCE_DELAY_SECONDS = 6
   SAVE_PIERCE_TIME_SECONDS = 30
   FREE_UP_VEHICLE_TELEPORT_LOCATION_DELAY_SECONDS = 5

-- Global variables
   Process_thread_handle = 0
   Current_mission_state = MS_NONE
   Cur_attack_wave = 0
   Players_arrived = { false, false }
   Players_south_trigger = { false, false }
   Players_north_trigger = { false, false }

   Players_in_starting_box = { true, true }
   Players_in_annex = { false, false }

   Players_in_defense_area = { false, false }
   Players_near_Pierce = { [LOCAL_PLAYER] = false, [REMOTE_PLAYER] = false }
   Player_failure_timer_thread_handles = { [LOCAL_PLAYER] = INVALID_THREAD_HANDLE, [REMOTE_PLAYER] = INVALID_THREAD_HANDLE }

   Waiting_on_wave_spawn = true

   Cur_haze_multiplier = PER_STATE_HAZE_MULTIPLIERS[1]
   Cur_weed_multiplier = PER_STATE_WEED_MULTIPLIERS[1]

   Cur_wave_vehicle_count = 0
   Cur_wave_vehicle_names = {}
   Cur_wave_driver_names = {}
   Cur_wave_coop_vehicle_count = 0
   Cur_wave_coop_vehicle_names = {}
   Cur_wave_coop_driver_names = {}

   Health_timer_cur_bar_values = {}

   Shaundi_health_timer_thread_handle = INVALID_THREAD_HANDLE
   Pierce_health_timer_thread_handle = INVALID_THREAD_HANDLE
   Initial_base_attackers_remaining = sizeof_table( INITIAL_BASE_ATTACKERS_MEMBERS )
   Shaundi_attackers_remaining = sizeof_table( SHAUNDI_ATTACKERS_MEMBERS )
   Shaundi_direct_attackers_remaining = sizeof_table( SHAUNDI_DIRECT_ATTACKERS )
   Entrance_reinforcements_remaining = sizeof_table( ENTRANCE_REINFORCEMENTS_MEMBERS )
   Pre_Pierce_reinforcements_remaining = sizeof_table( PRE_PIERCE_SQUADS_MEMBERS[1] ) +
                                         sizeof_table( PRE_PIERCE_SQUADS_MEMBERS[2] )
   Total_attackers_remaining = 0
   Num_attackers_killed_by_player = { [LOCAL_PLAYER] = 0, [REMOTE_PLAYER] = 0 }
   Cur_attack_wave_index = 1

   -- 'Timer' variables
   Reset_objective_time_remaining_seconds = RESET_OBJECTIVE_TIME_SECONDS
   Drug_effect_reduction_time_remaining_seconds = DRUG_EFFECT_STATE_SWITCH_REDUCTION_TIME_SECONDS
   Win_delay_seconds = WIN_DELAY_SECONDS

   -- Dropoff point used/not used data
   Northeast_dropoffs_used = { false, false }
   Northwest_dropoffs_used = { false, false, false, false }
   South_dropoffs_used = { false, false, false }
   East_dropoffs_used = { false, false, false, false }
   West_dropoffs_used = { false, false, false }
   Dropoffs_used = { Northeast_dropoffs_used, Northwest_dropoffs_used, South_dropoffs_used,
                     East_dropoffs_used, West_dropoffs_used }

   Vehicle_teleport_locations_used = { false, false, false, false, false }

   Northeast_rally_points_used = { false }
   Northwest_rally_points_used = { false, false }
   South_rally_points_used = { false, false }
   East_rally_points_used = { false }
   West_rally_points_used = { false }
   Rally_points_used = { Northeast_rally_points_used, Northwest_rally_points_used, South_rally_points_used,
                         East_rally_points_used, West_rally_points_used }

   Wave_currently_spawning = false
   Shaundi_saved = false
   Pierce_needs_to_be_rescued = false
   Final_attack_wave_started = false

   Last_vehicle_direction_used = -1
   Player_with_Shaundi = LOCAL_PLAYER
   Shaundi_call_received = false
   Shaundi_call_complete = false
   Marked_member_names = {}

-- Direction points query function - are there unused points
-- in this or that direction?
--
-- direction_points_used: One of the arrays listing used or
--                        unused points.
--
function ss06_some_points_unused( direction_points_used )
   for index, used in pairs( direction_points_used ) do
      -- If any are unused, return true
      if ( used == false ) then
         return true
      end
   end

   -- Otherwise, return false - no unused ones were found
   return false
end

function ss06_remove_group_required_kill_markers( group_members )
   for index, member_name in pairs( group_members ) do
      if ( ss06_character_has_been_released( member_name ) == false ) then
         if ( Marked_member_names[member_name] == true ) then
            marker_remove_npc( member_name, SYNC_ALL )
            Marked_member_names[member_name] = false
         end
      end
   end
end

function ss06_add_group_required_kill_markers( group_members )
   for index, member_name in pairs( group_members ) do
      if ( ss06_character_has_been_released( member_name ) == false ) then
         marker_add_npc( member_name, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL )
         Marked_member_names[member_name] = true
      end
   end
end

function ss06_delay_then_free_directions( vehicle_directions_used )
   delay( FREE_UP_VEHICLE_TELEPORT_LOCATION_DELAY_SECONDS )

   for squad_index, direction in pairs( vehicle_directions_used ) do
      Vehicle_teleport_locations_used[direction] = false
   end
end

function ss06_spawn_next_attack_wave()
   -- Do not spawn a new wave until the current one is done spawning
   while ( Wave_currently_spawning ) do
      thread_yield()
   end
   Wave_currently_spawning = true

   -- Keep spawning attack cycles until we reach the max count
   if ( Cur_attack_wave_index <= WAVE_COUNT ) then
      -- Create the group, first of all
      group_create( WAVE_GROUP..Cur_attack_wave_index, true )
      local cur_wave_squad_count = WAVES_SQUAD_COUNT[Cur_attack_wave_index]
      local cur_squads_in_vehicles = WAVES_IS_VEHICLE_SQUAD[Cur_attack_wave_index]

      --mission_debug( "Creating wave "..Cur_attack_wave_index..". "..cur_wave_squad_count.." squads." )

      local squad_attack_threads = {}
      local vehicle_directions_used = {}

      for squad_index = 1, cur_wave_squad_count do
         local squad_member_count = WAVES_SQUAD_MEMBER_COUNT[Cur_attack_wave_index][squad_index]
         Total_attackers_remaining = Total_attackers_remaining + squad_member_count

         if ( cur_squads_in_vehicles[squad_index] ) then
            local direction, goal = ss06_find_attack_direction_and_attack_point( VEHICLE_DROPOFF_POINTS, Dropoffs_used,
                                                                                 VEHICLE_DRIVE_UP_DIRECTION_COUNT, true )
            squad_attack_threads[squad_index] = thread_new( "ss06_spawn_and_path_vehicle_squad",
                                                            Cur_attack_wave_index, squad_index, squad_member_count, direction, goal )
            vehicle_directions_used[squad_index] = direction
         else
            squad_attack_threads[squad_index] = thread_new( "ss06_spawn_and_attack_on_foot_squad",
                                                            Cur_attack_wave_index, squad_index, squad_member_count )
         end
      end

      -- We've teleported this wave - the next wave should be free to use these locations
      thread_new( "ss06_delay_then_free_directions", vehicle_directions_used )
      for index, used in pairs( Vehicle_teleport_locations_used ) do
         Vehicle_teleport_locations_used[index] = false
      end

      -- Wait for all of the attack threads to complete
      local attack_threads_complete = false
      while ( attack_threads_complete == false ) do
         attack_threads_complete = true
         for index, thread_handle in pairs( squad_attack_threads ) do
            if ( thread_check_done( thread_handle ) == false ) then
               attack_threads_complete = false
            end
         end
         thread_yield()
      end

      -- Now that the threads are done, we're certainly done spawning, so move onto the next wave
      Cur_attack_wave_index = Cur_attack_wave_index + 1
      Wave_currently_spawning = false

      local character_choice = rand_int( 1, 3 )
      if ( character_choice == 1 ) then
         audio_play_persona_line( SHAUNDI_NAME, SHAUNDI_COMBAT_PERSONA_SITUATION )
      elseif ( character_choice == 2 ) then
         audio_play_persona_line( PIERCE_NAME, PIERCE_COMBAT_PERSONA_SITUATION )
      else
         audio_play_persona_line( LOCAL_PLAYER, PLAYER_COMBAT_PERSONA_SITUATION )
      end

   else
      ss06_spawn_final_attack_wave()
   end
end

-- Gets the index of the first unused point based on a list of
-- points that have been used.
--
function ss06_get_first_unused_point_index( points_used )
   for index, point_used in pairs( points_used ) do
      if ( point_used == false ) then
         return index
      end
   end
   return 1
end

-- Sets all the "used" flags to false.
-- Usually called when all points have been used once.
--
function ss06_reset_used_states( used_states )
   -- Go through each direction
   for used_in_direction_index, used_in_direction in pairs( used_states ) do
      -- For each direction, go through each "used" value
      for used_index, point_used in pairs( used_in_direction ) do
         used_states[used_in_direction_index][used_index] = false
      end
   end
end

function ss06_create_attack_squad_member_names( wave_index, squad_index, squad_member_count )
   -- Temp storage for the names
   local squad_members = {}

   -- Calculate the prefix once
   local squad_member_prefix = WAVE..wave_index..SQUAD..squad_index..MIP

   -- Create the list of member names
   for member_index = 1, squad_member_count do
      squad_members[member_index] = squad_member_prefix..member_index
   end

   return squad_members
end

-- Randomly selects an attack direction and an attack point based on whether
-- they've been used.
--
-- location_values: A list of attack points.
-- used_value: A list of which attack points have been used.
-- direction_count: The number of attack directions.
-- is_vehicle_squad: (Optional, default false) Whether or not we're looking
--                   for a vehicle squad attack direction.
--
function ss06_find_attack_direction_and_attack_point( location_points, used_values, direction_count, is_vehicle_squad )
   if ( is_vehicle_squad == nil ) then
      is_vehicle_squad = false
   end

   -- Randomly choose a search start for an unused direction
   local attack_direction = rand_int( 1, direction_count )
   local unused_direction_found = false

   -- Go through each direction once
   for i = 1, direction_count do
      if ( ss06_some_points_unused( used_values[attack_direction] ) ) then
         -- If this is a vehicle squad and this location is unused, we've found a valid direction, or
         -- if it isn't a vehicle squad we're also found one
         if ( ( is_vehicle_squad and Vehicle_teleport_locations_used[attack_direction] == false ) or
              ( is_vehicle_squad == false ) ) then
            unused_direction_found = true
            break
         end
      end

      -- Go to the next value, possibly rolling over
      attack_direction = attack_direction + 1
      if ( attack_direction > direction_count ) then
         attack_direction = 1
      end
   end

   -- Which point drop off at in this direction
   local point_index = 1

   -- If we found a direction with unused dropoff points, then find the first unused point
   if ( unused_direction_found ) then
      point_index = ss06_get_first_unused_point_index( used_values[attack_direction] )
   -- Otherwise, just set everything to unused, because everything has been used once
   else
      ss06_reset_used_states( used_values )

      -- Make sure we don't use the last used direction again
      if ( is_vehicle_squad and Last_vehicle_direction_used == attack_direction ) then
         attack_direction = attack_direction + 1
         if ( attack_direction > direction_count ) then
            attack_direction = 1
         end
      end
   end
   
   -- If this is a vehicle squad, record the chosen direction
   -- and keep track of the used directions
   if ( is_vehicle_squad ) then
      Last_vehicle_direction_used = attack_direction
      Vehicle_teleport_locations_used[attack_direction] = true
   end

   -- Record this particular point index in this direction as used
   used_values[attack_direction][point_index] = true

   return attack_direction, location_points[attack_direction][point_index]
end

-- Creates an on-foot attack squad and has it attack
--
-- wave_index: Which wave this squad belongs to. A wave can have more than one squad.
-- squad_index: The index of this squad within the wave.
-- squad_member_count: The number of members in this squad.
--
function ss06_spawn_and_attack_on_foot_squad( wave_index, squad_index, squad_member_count )
   -- Create the squad member names
   local squad_members = ss06_create_attack_squad_member_names( wave_index, squad_index,
                                                                squad_member_count )

   -- Teleport the squad to an attack location
   local direction, rally_point = ss06_find_attack_direction_and_attack_point( RALLY_POINTS, Rally_points_used,
                                                                               RALLY_POINT_DIRECTION_COUNT, true )

   -- First, add callbacks to prevent weirdness with death tracking
   for index, member_name in pairs( squad_members ) do
      on_death( "ss06_base_attacker_died", member_name )
   end

   -- Now, teleport the entire group to the rally point, and mark each as you
   -- teleport
   for index, member_name in pairs( squad_members ) do
      teleport( member_name, rally_point )
      marker_add_npc( member_name, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL )
      Marked_member_names[member_name] = true
      local distance, closest_player = get_dist_closest_player_to_object( member_name )

      attack_safe( member_name, closest_player, false )
   end

   --mission_debug( "Squad "..squad_index.." attacking on foot.")
end

-- Creates a vehicle attack squad and has it drive up
--
-- wave_index: Which wave this squad belongs to. A wave can have more than one squad.
-- squad_index: The index of this squad within the wave.
-- squad_member_count: The number of members in this squad.
-- direction: What attack direction this squad comes from
-- goal: The dropoff point goal of this squad
--
function ss06_spawn_and_path_vehicle_squad( wave_index, squad_index, squad_member_count, direction, goal )

   -- Create the squad member names
   local squad_members = ss06_create_attack_squad_member_names( wave_index, squad_index,
                                                                squad_member_count )
   for index, member_name in pairs( squad_members ) do
      on_death( "ss06_base_attacker_died", member_name )
   end

   -- Create the vehicle's name
   local squad_vehicle = WAVE..wave_index..SQUAD..squad_index..VEHICLE

   -- Seat the squad
   vehicle_enter_group_teleport( squad_members, squad_vehicle )

   -- Teleport the vehicle to the attack start location
   teleport_vehicle( squad_vehicle, VEHICLE_START_POSITIONS[direction] )

   -- Mark the NPCs now that they're in the correct location
   for index, member_name in pairs( squad_members ) do
      marker_add_npc( member_name, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL )
      Marked_member_names[member_name] = true
   end

   -- Drive from the start location along the attack direction path
   vehicle_pathfind_to( squad_vehicle, VEHICLE_DRIVE_UP_PATHS[direction], true, false )

   -- If we're not supposed to charge the player, just go to the goal and stop there
   if ( WAVE_VEHICLE_SQUAD_CHARGE[wave_index][squad_index] == false ) then
      mission_debug( "NOT charging the player", 10 )
      vehicle_pathfind_to( squad_vehicle, goal, true, true )

      for index, member_name in pairs( squad_members ) do
         if ( ss06_character_has_been_released( member_name ) == false ) then
            vehicle_exit( member_name )
         end
      end
   -- Otherwise, attack the closest player
   else
      mission_debug( "Charging the player", 10 )
      local distance, player = get_dist_closest_player_to_object( squad_members[1] )
      attack_safe( squad_members[1], player, false )
   end
   release_to_world( squad_vehicle )
end

function ss06_cleanup()
   -- Cleanup mission here
   thread_kill( Process_thread_handle )
   notoriety_set_min( ENEMY_GANG, 0 )
   notoriety_set_max( ENEMY_GANG, GAME_MAX_NOTORIETY )
   notoriety_set( ENEMY_GANG, 0 )
   spawning_vehicles( true )
   notoriety_force_no_spawn( ENEMY_GANG, false )
   party_dismiss_all()
   party_set_dismissable( true )
   party_allow_max_followers( false )
   release_to_world( HQ_GUN_SPAWN )
   drug_effect_set_override_values( 0, 0, SYNC_ALL )
   drug_enable_disable_effect_override( false, SYNC_ALL )
   minimap_icon_remove_navpoint( SAINTS_HQ_AREA, SYNC_ALL )
   persona_override_group_stop( SS06_SAINTS_PERSONAS, POT_SITUATIONS[POT_ATTACK] )

   for index, override in pairs( PLAYER_PERSONA_OVERRIDES ) do
      persona_override_character_stop( LOCAL_PLAYER, override[1] )
   end

	trigger_enable( SAINTS_HQ_UP_ELEVATOR_TRIGGER, true )
	trigger_enable( SAINTS_HQ_DOWN_ELEVATOR_TRIGGER, true )

	trigger_type_enable( "warp", true )

   mid_mission_phonecall_reset()
   mission_cleanup_maybe_reenable_player_controls()
end

function ss06_spawn_final_attack_wave()
   -- Create the group, update the number of attackers, and add on-death callbacks to assure that the
   -- mission progresses correctly
   group_create( FINAL_ATTACK_GROUP_NAME, true )
   Total_attackers_remaining = Total_attackers_remaining + sizeof_table( FINAL_ATTACK_MEMBER_NAMES )

   for index, member_name in pairs( FINAL_ATTACK_MEMBER_NAMES ) do
      on_death( "ss06_base_attacker_died", member_name )
   end

   -- Seat the squad
   vehicle_enter_group_teleport( FINAL_ATTACK_MEMBER_NAMES, FINAL_ATTACK_VEHICLE_NAME )

   -- Get an attack direction and goal point
   local direction = ss06_find_attack_direction_and_attack_point( VEHICLE_DROPOFF_POINTS, Dropoffs_used,
                                                                  VEHICLE_DRIVE_UP_DIRECTION_COUNT )

   teleport_vehicle( FINAL_ATTACK_VEHICLE_NAME, VEHICLE_START_POSITIONS[direction] )

   -- Mark the NPCs now that they're in the correct location
   for index, member_name in pairs( FINAL_ATTACK_MEMBER_NAMES ) do
      marker_add_npc( member_name, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL )
      Marked_member_names[member_name] = true
   end

   -- Drive from the start location along the attack direction path
   vehicle_pathfind_to( FINAL_ATTACK_VEHICLE_NAME, VEHICLE_DRIVE_UP_PATHS[direction], true, false )

   -- Have the vehicle attack the player
   local distance, player = get_dist_closest_player_to_object( FINAL_ATTACK_MEMBER_NAMES[1] )
   attack_safe( FINAL_ATTACK_MEMBER_NAMES[1], player, false )
   
   Final_attack_wave_started = true
end

function ss06_start( checkpoint_name, is_restart )
   -- Start trigger is hit...the activate button was hit
   set_mission_author( "Mark Gabby & Brad Johnson" )

   party_allow_max_followers( true )

	trigger_type_enable( "warp", false )

   -- Unload vehicles - there are problems with insufficient resources
   spawning_vehicles( false )
   thread_yield()

   mission_start_fade_out()

	trigger_enable( SAINTS_HQ_UP_ELEVATOR_TRIGGER, false )
	trigger_enable( SAINTS_HQ_DOWN_ELEVATOR_TRIGGER, false )

   local next_state = "Puerto Rico"
   local resume_from_checkpoint = false
   if ( checkpoint_name == MISSION_START_CHECKPOINT ) then
		if ( is_restart == false ) then
			cutscene_play( CT_INTRO, MISSION_START_COLLISION_GROUP_NAME, { START_NAVPOINT_NAME, START_NAVPOINT_REMOTE_PLAYER_NAME }, false )
		else
	      teleport_coop( START_NAVPOINT_NAME, START_NAVPOINT_REMOTE_PLAYER_NAME )
			group_create_hidden( MISSION_START_COLLISION_GROUP_NAME, true )
		end
   end

   if ( checkpoint_name == MISSION_START_CHECKPOINT ) then
      -- Create the mess around the player
      group_show( MISSION_START_COLLISION_GROUP_NAME )
      for vehicle_index, vehicle_name in pairs( COLLISION_VEHICLE_NAMES ) do
         if ( COLLISION_CAR_MEMBERS[vehicle_index] ~= nil ) then
            vehicle_enter_group_teleport( COLLISION_CAR_MEMBERS[vehicle_index], vehicle_name )
         end
         vehicle_speed_override( vehicle_name, 0 )
      end

      -- Create the roadblocks and the first attack squad
      group_create( NORTH_ROADBLOCK_NAME, true )
      group_create( SOUTH_ROADBLOCK_NAME, true )
      group_create_hidden( SHAUNDI_ATTACKERS_GROUP_NAME, true )
      group_create_hidden( INITIAL_ATTACKERS_GROUP_NAME, true )

      ss06_spawn_attack_group( ON_FOOT_SQUAD_GROUP_NAMES[SOUTH_ATTACK_SQUAD],
                               ON_FOOT_SQUAD_GROUP_NAMES_COOP[SOUTH_ATTACK_SQUAD] )
      ss06_spawn_attack_group( ON_FOOT_SQUAD_GROUP_NAMES[NORTH_ATTACK_SQUAD],
                               ON_FOOT_SQUAD_GROUP_NAMES_COOP[NORTH_ATTACK_SQUAD] )
      ss06_spawn_hidden_attack_group( ALT_ESCAPE_GROUP_NAME, ALT_ESCAPE_COOP_GROUP_NAME )

      camera_look_through( START_NAVPOINT_NAME )
      camera_end_look_through( true )
      next_state = MS_BEGUN
   elseif ( checkpoint_name == CP_SAVED_SHAUNDI ) then
      -- Re-enable vehicle spawning if we're resuming from the "Saved Shaundi" checkpoint, because
      -- vehicles should be enabled
      spawning_vehicles( true )
      Shaundi_saved = true
      teleport_coop( SAVED_SHAUNDI_CHECKPOINT_WARPS[LOCAL_PLAYER], SAVED_SHAUNDI_CHECKPOINT_WARPS[REMOTE_PLAYER] )

      notoriety_force_no_spawn( ENEMY_GANG, true )

      if ( group_is_loaded( SHAUNDI_GROUP_NAME ) == false ) then
         group_create( SHAUNDI_GROUP_NAME )
      end

      -- Get the pre-Pierce appearance people ready to appear
      group_create_hidden( PRE_PIERCE_REINFORCEMENTS_GROUP_NAME, true )
      -- Finally, get the groups for Pierce's appearance ready
      group_create_hidden( PIERCE_GROUP_NAME, true )
      group_create_hidden( PIERCE_PURSUIT_GROUP_NAME, true )

      -- Load in the very next group that appears after Shaundi is
      -- saved
      group_create( ENTRANCE_REINFORCEMENTS_GROUP_NAME, true )
      next_state = MS_SAVED_SHAUNDI
      resume_from_checkpoint = true

		for index, door_name in pairs( HIDEOUT_ENTRANCE_DOORS ) do
			door_open( door_name )
		end

      mission_help_table( HT_DEFEND_HQ_OBJECTIVE )
   end
   -- Start the process thread ( Do this before fadein so drug effect looks good )
   Process_thread_handle = thread_new( "ss06_per_frame_process" )

   mission_start_fade_in()

   ss06_setup_state( next_state, resume_from_checkpoint )
end

function ss06_divide_section_into_chunks( section_size, num_chunks, min_below_average_percent, max_above_average_percent )
   local chunks = {}
   local increment = 1
   local section_percent_remaining = 1.0

   local average_percent_per_chunk = section_percent_remaining / num_chunks
   -- Use the values to calculate a min and max 
   local chunk_min_size_percent = ( min_below_average_percent ) * average_percent_per_chunk
   local chunk_max_size_percent = ( max_above_average_percent + 1.0 ) * average_percent_per_chunk

   -- For each chunk we're dividing the section into
   for index = 1, num_chunks - 1, increment do
      -- Find the number of chunks remaining to be allocated after this one
      local num_chunks_remaining_after_this = num_chunks - index

      -- Find the average percent remaining for all other chunks depending on our choice here
      local average_percent_per_chunk_remaining_max = ( section_percent_remaining - chunk_min_size_percent ) / num_chunks_remaining_after_this
      local average_percent_per_chunk_remaining_min = ( section_percent_remaining - chunk_max_size_percent ) / num_chunks_remaining_after_this

      -- Find a random number between the min and max size of this chunk
      local chunk_percent_of_section = rand_float( chunk_min_size_percent, chunk_max_size_percent )

      -- Keep the min and max within bounds to assure that we don't mess things up
      -- If the remaining average is less than the minimum if we choose the maximum value, choose the minumum value instead
      if ( average_percent_per_chunk_remaining_min < chunk_min_size_percent ) then
         chunk_percent_of_section = chunk_min_size_percent
      -- And vice versa
      elseif ( average_percent_per_chunk_remaining_max > chunk_max_size_percent ) then
         chunk_percent_of_section = chunk_max_size_percent
      end

      chunks[index] = chunk_percent_of_section * section_size

      section_percent_remaining = section_percent_remaining - chunk_percent_of_section
   end

   -- The last chunk gets whatever's left
   chunks[num_chunks] = section_percent_remaining * section_size

   return chunks
end

-- Returns the number of chunks that the timer was divided into,
-- the actual health chunks, and the actual time chunks. ( in that order. )
--
-- total_time: The total amount of time to divide between the chunks.
-- chunk_count_range: The minimum and maximum value for the number of chunks that
--                    should be created.
--
function ss06_calculate_health_timer_data( total_time, chunk_count_range )
   local num_chunks = rand_int( chunk_count_range[1], chunk_count_range[2] )

   local health_chunks = ss06_divide_section_into_chunks( 1.0, num_chunks,
                                                          HEALTH_CHUNK_MIN_MULTIPLIER,
                                                          HEALTH_CHUNK_MAX_MULTIPLIER )   
   local time_chunks_seconds = ss06_divide_section_into_chunks( total_time, num_chunks,
                                                                TIME_CHUNK_MIN_MULTIPLIER,
                                                                TIME_CHUNK_MAX_MULTIPLIER )

   return num_chunks, health_chunks, time_chunks_seconds
end

function ss06_per_frame_process()
   -- Loop until the mission end conditions are met
   while ( 1 ) do
      local time_elapsed = get_frame_time()

      if ( Current_mission_state ~= MS_FAILURE ) then
         ss06_process_mission_notoriety( time_elapsed )
         ss06_process_haze( time_elapsed )
      end
      delay( 0 )
   end
end

function ss06_follower_died(name)
   if ( name == SHAUNDI_NAME ) then
      -- End the mission since Shaundi was killed
      mission_end_failure( MISSION_NAME, HT_SHAUNDI_DIED )
   elseif ( name == PIERCE_NAME ) then
      -- End the mission since Pierce was killed
      mission_end_failure( MISSION_NAME, HT_PIERCE_DIED )
   end
end

function ss06_follower_abandoned( name )
   if ( name == SHAUNDI_NAME ) then
      -- End the mission since Shaundi was abandoned
      mission_end_failure( MISSION_NAME, HT_SHAUNDI_ABANDONED )
   elseif ( name == PIERCE_NAME ) then
      -- End the mission since Pierce was killed
      mission_end_failure( MISSION_NAME, HT_PIERCE_ABANDONED )
   end
end

function ss06_kill_health_timer( timer_thread_handle, hud_bar_index, character_name )
   if ( timer_thread_handle ~= INVALID_THREAD_HANDLE ) then
      local char_max_hp = get_max_hit_points( character_name )
      local char_new_hp = char_max_hp * Health_timer_cur_bar_values[hud_bar_index]
      set_current_hit_points( character_name, char_new_hp )
      thread_kill( timer_thread_handle )
      timer_thread_handle = INVALID_THREAD_HANDLE
      hud_bar_off( hud_bar_index )
   end
end

function ss06_rescue_shaundi_message()
   mission_help_table( HT_RESCUE_SHAUNDI )
end

function ss06_process_health_timer( hud_bar_index, timer_label, warning_time, warning_hp_percent,
                                    chunk_count, health_chunks, time_chunks_seconds,
                                    out_of_time_message, failure_message, callback_on_first_damage )
   -- Enable the HUD bar's display
   hud_bar_on( hud_bar_index, "Health", timer_label, 1.0 )
   Health_timer_cur_bar_values[hud_bar_index] = 1.0
   hud_bar_set_range( hud_bar_index, 0, Health_timer_cur_bar_values[hud_bar_index], SYNC_ALL )
   hud_bar_set_value( hud_bar_index, Health_timer_cur_bar_values[hud_bar_index], SYNC_ALL )

   -- Setup values required to be above the loop's scope
   local cur_chunk_index = 1

   local cur_time_chunk_delay_seconds = time_chunks_seconds[cur_chunk_index]
   local total_time_elapsed = 0

   local out_of_time_message_triggered = false

   while ( cur_chunk_index <= chunk_count ) do
      --mission_debug( cur_time_chunk_delay_seconds.." seconds remaining", 15 )
      delay( cur_time_chunk_delay_seconds )
      total_time_elapsed = total_time_elapsed + cur_time_chunk_delay_seconds

      if ( callback_on_first_damage ~= nil ) then
         callback_on_first_damage()
         callback_on_first_damage = nil
      end

      Health_timer_cur_bar_values[hud_bar_index] = Health_timer_cur_bar_values[hud_bar_index] - health_chunks[cur_chunk_index]
      --mission_debug( Health_timer_cur_bar_values[hud_bar_index].." percent remaining", 15 )
      hud_bar_set_value( hud_bar_index, Health_timer_cur_bar_values[hud_bar_index], SYNC_ALL )

      -- Only prompt the player with the out-of-time message once
      if ( out_of_time_message_triggered == false and out_of_time_message ~= nil and out_of_time_message ~= "" ) then
         -- If health is at the halfway point and more than half of the time to get there
         -- has elapsed, tell the player to hurry up
         if ( total_time_elapsed >= warning_time and
              Health_timer_cur_bar_values[hud_bar_index] < warning_hp_percent ) then
            mission_help_table( out_of_time_message )
            out_of_time_message_triggered = true
         end
      end

      cur_chunk_index = cur_chunk_index + 1
      cur_time_chunk_delay_seconds = time_chunks_seconds[cur_chunk_index]
   end

	mission_debug( "mission failure being called" )

   -- If we fall through here, the mission has failed
   mission_end_failure( MISSION_NAME, failure_message )
end

function ss06_collision_members_flee()
   for vehicle_index, vehicle_name in pairs( COLLISION_VEHICLE_NAMES ) do
      if ( COLLISION_CAR_MEMBERS[vehicle_index] ~= nil ) then
         for member_index, member_name in pairs( COLLISION_CAR_MEMBERS[vehicle_index] ) do
            vehicle_exit( member_name )
            delay( rand_float( 0, 0.5 ) )
            flee( member_name, LOCAL_PLAYER, false, true )
         end
      end
   end
end

function ss06_shaundi_call_received()
   Shaundi_call_received = true
end

function ss06_shaundi_mission_start_call()
   Shaundi_call_received = false

   mid_mission_phonecall( "ss06_shaundi_call_received" )
   local incoming_call_thread = thread_new( "ss06_play_shaundi_call_on_answer" )

   delay( 10.0 )

   if ( Shaundi_call_received == false ) then
      thread_kill( incoming_call_thread )
      mid_mission_phonecall_reset()

      audio_play( CELLPHONE_INCOMING )
      delay( 1.0 )

      cellphone_animate_start_do()
      audio_play_conversation( INITIAL_PHONE_CALL_DIALOG_STREAM, INCOMING_CALL )

      Shaundi_call_complete = true
   end
end

function ss06_play_shaundi_call_on_answer()
   repeat
      thread_yield()
   until Shaundi_call_received

   audio_play_conversation( INITIAL_PHONE_CALL_DIALOG_STREAM, INCOMING_CALL )
   mid_mission_phonecall_reset()
   Shaundi_call_complete = true
end

-- Sets up a new mission state.
--
-- state_to_setup: The new state.
-- resume_from_checkpoint: Used by MS_SAVED_SHAUNDI to specify whether or not
--                         this is being resumed from a checkpoint ( true for being
--                         resumed )
function ss06_setup_state( state_to_setup, resume_from_checkpoint )
   -- State tracking and haze status tracking
   Drug_effect_reduction_time_remaining_seconds = DRUG_EFFECT_STATE_SWITCH_REDUCTION_TIME_SECONDS
   Current_mission_state = state_to_setup

   -- Mission starts - sets up the ambush and drug effect, etc
   if ( state_to_setup == MS_BEGUN ) then
      -- Have the members in the collision vehicles run away
      thread_new( "ss06_collision_members_flee" )

      -- Set notoriety as per design
      notoriety_set_max( ENEMY_GANG, MISSION_MAX_NOTORIETY )
      notoriety_set( ENEMY_GANG, MISSION_START_NOTORIETY )
      notoriety_set_min( ENEMY_GANG, MISSION_MIN_NOTORIETY )

      notoriety_force_no_spawn( ENEMY_GANG, true )

      -- Add the triggers for leaving the starting area and reaching the Saint's HQ.
      trigger_enable( START_TRIGGER_REGION_NAME, true )
      on_trigger_exit( "ss06_leave_starting_box_or_annex", START_TRIGGER_REGION_NAME )
      on_trigger( "ss06_enter_starting_box", START_TRIGGER_REGION_NAME )

      trigger_enable( START_TRIGGER_ANNEX_NAME, true )
      on_trigger_exit( "ss06_leave_starting_box_or_annex", START_TRIGGER_ANNEX_NAME )   
      on_trigger( "enter_annex", START_TRIGGER_ANNEX_NAME )

      trigger_enable( NORTH_CAMPER_TRIGGER_NAME, true )
      on_trigger( "ss06_north_camper_trigger", NORTH_CAMPER_TRIGGER_NAME )   
      for index, member in pairs(NORTH_CAMPER_NAMES) do
         set_ignore_ai_flag( member, true )
         delay( .25 )
         crouch_start( member )
      end

      trigger_enable( SOUTH_CAMPER_TRIGGER_NAME, true )
      on_trigger( "ss06_south_camper_trigger", SOUTH_CAMPER_TRIGGER_NAME )
      for index, member in pairs(SOUTH_CAMPER_NAMES) do
         set_ignore_ai_flag( member, true )
         delay( .25 )
         crouch_start( member )
      end

      trigger_enable( ALTERNATE_ESCAPE_SPAWN_TRIGGER_NAME, true )
      on_trigger( "ss06_alternate_escape_attack", ALTERNATE_ESCAPE_SPAWN_TRIGGER_NAME )

      -- Enable the overrides for the "haze" effect
      drug_enable_disable_effect_override( true, SYNC_ALL )
      drug_effect_set_override_values( DRUNK_EFFECT_MAGNITUDE * Cur_haze_multiplier,
                                       WEED_EFFECT_MAGNITUDE * Cur_weed_multiplier, SYNC_ALL )


      ss06_attack_squad_attack( ON_FOOT_SQUAD_MEMBERS[NORTH_ATTACK_SQUAD],
                                ON_FOOT_SQUAD_MEMBERS_COOP[NORTH_ATTACK_SQUAD] )
      ss06_attack_squad_attack( ON_FOOT_SQUAD_MEMBERS[SOUTH_ATTACK_SQUAD],
                                ON_FOOT_SQUAD_MEMBERS_COOP[SOUTH_ATTACK_SQUAD] )

      thread_new( "ss06_shaundi_mission_start_call" )

      repeat
         thread_yield()
      until ( Shaundi_call_complete )

      -- Let the player know what their next objective is
      mission_help_table( HT_GET_BACK_TO_HQ_OBJECTIVE )
      trigger_enable( SAINTS_HQ_POS, true )
      on_trigger( "ss06_reached_saints_hq_entrance", SAINTS_HQ_POS )
      marker_add_trigger( SAINTS_HQ_POS, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL )
      waypoint_add( SAINTS_HQ_POS, SYNC_ALL )

      -- Setup the area trigger to disable notoriety spawning when the player
      -- reaches the Saints HQ.
      trigger_enable( SAINTS_HQ_AREA, true )
      on_trigger( "ss06_disable_notoriety_spawning", SAINTS_HQ_AREA )

      -- Setup the get-back-to-HQ timer stuff
      local num_chunks,
            health_chunks,
            time_chunks_seconds = ss06_calculate_health_timer_data( GET_TO_HQ_TIME_SECONDS, GET_TO_HQ_DIVISION_RANGE )
      local warning_time_threshold = GET_TO_HQ_TIME_SECONDS / 2
      local warning_health_threshold = 0.5
      Shaundi_health_timer_thread_handle = thread_new( "ss06_process_health_timer", 0, HT_SHAUNDI_HEALTH_BAR_LABEL,
                                                       warning_time_threshold, warning_health_threshold,
                                                       num_chunks, health_chunks, time_chunks_seconds,
                                                       HT_SHAUNDI_RUNNING_OUT_OF_TIME, HT_SHAUNDI_DIED_HIGHLIGHTED,
                                                       ss06_rescue_shaundi_message )

      -- Clear up some resources
      release_to_world( NORTH_ROADBLOCK_NAME )
      release_to_world( SOUTH_ROADBLOCK_NAME )
      release_to_world( MISSION_START_COLLISION_GROUP_NAME )

      thread_yield()

      -- Create the groups that we'll be needing later in the mission
      group_create_hidden( ENTRANCE_REINFORCEMENTS_GROUP_NAME, true )
      -- Get the pre-Pierce appearance people ready to appear
      group_create_hidden( PRE_PIERCE_REINFORCEMENTS_GROUP_NAME, true )

		delay( 20.0 )

      -- Finally, get the groups for Pierce's appearance ready
      group_create_hidden( PIERCE_GROUP_NAME, true )
      group_create_hidden( PIERCE_PURSUIT_GROUP_NAME, true )

   elseif ( state_to_setup == MS_SPAWN_RESUMED ) then
      --mission_debug( "all players left" )
      trigger_enable( START_TRIGGER_REGION_NAME, false )
      trigger_enable( START_TRIGGER_ANNEX_NAME, false )
      notoriety_force_no_spawn( ENEMY_GANG, false )
      spawning_vehicles( true )

      -- Disable the north and south triggers
      trigger_enable(NORTH_TRIGGER_NAME, false)
      trigger_enable(SOUTH_TRIGGER_NAME, false)
      -- Release the attack groups
      ss06_release_attack_group( ON_FOOT_SQUAD_GROUP_NAMES[NORTH_ATTACK_SQUAD],
                                 ON_FOOT_SQUAD_GROUP_NAMES_COOP[NORTH_ATTACK_SQUAD] )
      ss06_release_attack_group( ON_FOOT_SQUAD_GROUP_NAMES[SOUTH_ATTACK_SQUAD],
                                 ON_FOOT_SQUAD_GROUP_NAMES_COOP[SOUTH_ATTACK_SQUAD] )

      release_to_world( MISSION_START_COLLISION_GROUP_NAME )

      -- Release the camper attack groups, restore their AI and their crouch status, and disable the triggers
      trigger_enable( NORTH_CAMPER_TRIGGER_NAME, false )
      for index, member in pairs(NORTH_CAMPER_NAMES) do
         set_ignore_ai_flag( member, false )
         delay( .25 )
         crouch_stop( member )
      end
      trigger_enable( SOUTH_CAMPER_TRIGGER_NAME, false )
      for index, member in pairs(SOUTH_CAMPER_NAMES) do
         set_ignore_ai_flag( member, false )
         delay( .25 )
         crouch_stop( member )
      end

      -- Create Shaundi
      group_create( SHAUNDI_GROUP_NAME, true )
      set_ignore_ai_flag( SHAUNDI_NAME, true )
      turn_invulnerable( SHAUNDI_NAME )

      -- Show the people who will be attacking Shaundi
      group_show( SHAUNDI_ATTACKERS_GROUP_NAME )
      ss06_give_weapons( SHAUNDI_ATTACKERS_MEMBERS, SHAUNDI_ATTACKERS_WEAPONS )
      Total_attackers_remaining = Total_attackers_remaining + Shaundi_attackers_remaining
      for index, member in pairs( SHAUNDI_ATTACKERS_MEMBERS ) do
         turn_invulnerable( member )
      end
      group_show( INITIAL_ATTACKERS_GROUP_NAME )
      ss06_give_weapons( INITIAL_BASE_ATTACKERS_MEMBERS, INITIAL_BASE_ATTACKERS_WEAPONS )
      Total_attackers_remaining = Total_attackers_remaining + sizeof_table( INITIAL_BASE_ATTACKERS_MEMBERS )
      for index, member in pairs( INITIAL_BASE_ATTACKERS_MEMBERS ) do
         on_death( "ss06_initial_base_attacker_death", member )
      end

      trigger_enable( REACHED_SHAUNDI_TRIGGER, true )
      on_trigger( "ss06_reached_shaundi_trigger", REACHED_SHAUNDI_TRIGGER )

      -- HACK: Hide this character, because he's having some behavioral problems
      character_hide( INITIAL_BASE_ATTACKERS_MEMBERS[4] )

   elseif ( state_to_setup == MS_SAVED_SHAUNDI ) then
      Shaundi_saved = true

      local distance, player = get_dist_closest_player_to_object( SHAUNDI_NAME )

		-- If Shaundi is already dead, don't add her to the player's party
		if ( resume_from_checkpoint == false or
			  resume_from_checkpoint == nil ) then
			if ( thread_check_done( Shaundi_health_timer_thread_handle ) == true ) then
				mission_debug( "Shaundi is already dead." )
				return
			end
		end

      party_add( SHAUNDI_NAME, player )
      Player_with_Shaundi = player

      npc_leash_remove( SHAUNDI_NAME )
      on_death( "ss06_follower_died", SHAUNDI_NAME )
      on_dismiss( "ss06_follower_abandoned", SHAUNDI_NAME )
      turn_vulnerable( SHAUNDI_NAME )

      -- Only do these things if we're not resuming from a checkpoint
      if ( resume_from_checkpoint == false or
           resume_from_checkpoint == nil ) then
         ss06_kill_health_timer( Shaundi_health_timer_thread_handle, 0, SHAUNDI_NAME )

         -- Start the "get back to the HQ!" failure timers
         if ( Players_in_defense_area[LOCAL_PLAYER_INDEX] == false ) then
            Player_failure_timer_thread_handles[LOCAL_PLAYER] = thread_new( "ss06_get_to_hq_or_fail", LOCAL_PLAYER )
         end
         if ( coop_is_active() and Players_in_defense_area[REMOTE_PLAYER_INDEX] == false ) then
            Player_failure_timer_thread_handles[REMOTE_PLAYER] = thread_new( "ss06_get_to_hq_or_fail", REMOTE_PLAYER )
         end

         mission_set_checkpoint( CP_SAVED_SHAUNDI )

         marker_remove_npc( SHAUNDI_NAME )

         -- Add markers for all the required kills and unleash them
         for index, name in pairs( INITIAL_BASE_ATTACKERS_MEMBERS ) do
            if ( ss06_character_has_been_released( name ) == false ) then
               marker_add_npc( name, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL )
               Marked_member_names[name] = true
               npc_leash_remove( name )
            end
         end
         for index, name in pairs( SHAUNDI_ATTACKERS_MEMBERS ) do
            if ( ss06_character_has_been_released( name ) == false ) then
               marker_add_npc( name, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL )
               Marked_member_names[name] = true
               npc_leash_remove( name )
            end
         end
         for vehicle_index, vehicle_passengers in pairs( ENTRANCE_REINFORCEMENT_VEHICLE_PASSENGERS ) do
            for member_index, member_name in pairs( vehicle_passengers ) do
               if ( member_index ~= 1 ) then
                  if ( ss06_character_has_been_released( member_name ) == false ) then
                     marker_add_npc( member_name, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL )
                     Marked_member_names[member_name] = true
                  end
               end
            end
         end
         audio_play_for_character( SAVED_SHAUNDI_DIALOG_LINE, SHAUNDI_NAME, "voice", false, false )
      else--if ( resume_from_checkpoint == true )
         -- The group was loaded by the resume-from-checkpoint code
         local group_loaded_hidden = false
         ss06_setup_and_process_entrance_reinforcements( group_loaded_hidden )
         ss06_add_group_required_kill_markers( ENTRANCE_REINFORCEMENTS_MEMBERS )

         trigger_enable( SAINTS_HQ_AREA, true )
         on_trigger( "ss06_entered_saints_hq_area", SAINTS_HQ_AREA )
         on_trigger_exit( "ss06_left_saints_hq_area", SAINTS_HQ_AREA )
      end

      mission_help_table( HT_DEFEND_HQ_OBJECTIVE )

   elseif ( state_to_setup == MS_KILL_DRIVEUP_ATTACKERS ) then
      -- Create the two cars and have them drive up to either side of the
      -- Saints HQ.
      group_show( PRE_PIERCE_REINFORCEMENTS_GROUP_NAME )
      Total_attackers_remaining = Total_attackers_remaining + sizeof_table( PRE_PIERCE_SQUADS_MEMBERS[1] )
      Total_attackers_remaining = Total_attackers_remaining + sizeof_table( PRE_PIERCE_SQUADS_MEMBERS[2] )

      ss06_give_weapons( PRE_PIERCE_SQUADS_MEMBERS[1], PRE_PIERCE_SQUADS_WEAPONS[1] )
      ss06_give_weapons( PRE_PIERCE_SQUADS_MEMBERS[2], PRE_PIERCE_SQUADS_WEAPONS[2] )

      thread_new( "ss06_pre_pierce_reinforcements_group_do_pathing", 1 )
      thread_new( "ss06_pre_pierce_reinforcements_group_do_pathing", 2 )

   elseif ( state_to_setup == MS_PIERCE_APPEARS ) then
      -- Add trigger that will be used for tracking Pierce later
      trigger_enable( NEAR_PIERCE_TRIGGER_NAME, true )
      on_trigger( "ss06_near_pierce", NEAR_PIERCE_TRIGGER_NAME )
      on_trigger_exit( "ss06_left_pierce_area", NEAR_PIERCE_TRIGGER_NAME )
      
      -- Seat the Pierce pursuers
      for vehicle_index, vehicle_name in pairs( PIERCE_PURSUIT_VEHICLE_NAMES ) do
         vehicle_enter_group_teleport( PIERCE_PURSUIT_SQUADS_MEMBERS[vehicle_index],
                                       vehicle_name )
      end      
      -- Seat Pierce in his car
      vehicle_enter_teleport( PIERCE_NAME, PIERCE_VEHICLE_NAME )

      -- Find the appropriate warp point and then seat
      local warp_point_index = 1
      if ( coop_is_active() ) then
         -- Find out the player that could possibly be in the correct place to see Pierce spawn
         local player_without_shaundi = LOCAL_PLAYER
         if ( Player_with_Shaundi == LOCAL_PLAYER ) then
            player_without_shaundi = REMOTE_PLAYER
         end

         -- We want the index of the point furthest from this player so that he won't see Pierce spawn
         local warp_point_distance = get_dist_char_to_nav( player_without_shaundi, PIERCE_SPAWN_LOCATIONS[warp_point_index] )

         -- Find the point furthest away from this player
         for index, location_name in pairs( PIERCE_SPAWN_LOCATIONS ) do
            local cur_point_distance = get_dist_char_to_nav( player_without_shaundi, location_name )

            if ( cur_point_distance > warp_point_distance ) then
               warp_point_distance = cur_point_distance
               warp_point_index = index
            end
         end

         mission_debug( "Warp point found index"..warp_point_index )

         -- Now that we've found the farthest index, teleport Pierce and the pursuers here if they aren't here already
         if ( warp_point_index > 1 ) then
            for vehicle_index, vehicle_name in pairs( PIERCE_PURSUIT_VEHICLE_NAMES ) do
               teleport_vehicle( vehicle_name, PIERCE_PURSUIT_WARP_POINTS[warp_point_index][vehicle_index] )
            end
            teleport_vehicle( PIERCE_VEHICLE_NAME, PIERCE_PURSUIT_WARP_POINTS[warp_point_index][3] )
         end
      end

      group_show( PIERCE_GROUP_NAME )
      group_show( PIERCE_PURSUIT_GROUP_NAME )
      Total_attackers_remaining = Total_attackers_remaining + sizeof_table( PIERCE_PURSUIT_SQUADS_MEMBERS[1] )
      Total_attackers_remaining = Total_attackers_remaining + sizeof_table( PIERCE_PURSUIT_SQUADS_MEMBERS[2] )

      ss06_give_weapons( PIERCE_PURSUIT_SQUADS_MEMBERS[1], PIERCE_PURSUIT_SQUADS_WEAPONS[1] )
      ss06_give_weapons( PIERCE_PURSUIT_SQUADS_MEMBERS[2], PIERCE_PURSUIT_SQUADS_WEAPONS[2] )

      thread_new( "ss06_pierce_flee_to_hq", warp_point_index )
      thread_new( "ss06_pierce_pursuit_group_do_chase", 1 )
      thread_new( "ss06_pierce_pursuit_group_do_chase", 2 )

   elseif ( state_to_setup == MS_DEFENDING_HQ ) then
      -- These overrides only really make sense at this point in the mission
      for index, override in pairs( SHAUNDI_PERSONA_OVERRIDES ) do
         persona_override_character_start( SHAUNDI_NAME, override[1], override[2] )
      end
      for index, override in pairs( PIERCE_PERSONA_OVERRIDES ) do
         persona_override_character_start( PIERCE_NAME, override[1], override[2] )
      end
      for index, override in pairs( PLAYER_PERSONA_OVERRIDES ) do
         persona_override_character_start( LOCAL_PLAYER, override[1], override[2] )
      end
      persona_override_group_start( SS06_SAINTS_PERSONAS, POT_SITUATIONS[POT_ATTACK], "SS06_DEFEND" )

      -- Mark all NPCs as required kills
      -- The ones who started in the entrance and the ones that were attacking Shaundi
      ss06_add_group_required_kill_markers( INITIAL_BASE_ATTACKERS_MEMBERS )
      ss06_add_group_required_kill_markers( SHAUNDI_ATTACKERS_MEMBERS )

      -- The two groups that came before Pierce
      -- The ones that did the dropoff
      for vehicle_index, vehicle_passengers in pairs( ENTRANCE_REINFORCEMENT_VEHICLE_PASSENGERS ) do
         for member_index, member_name in pairs( vehicle_passengers ) do
            if ( member_index ~= 1 ) then
               if ( ss06_character_has_been_released( member_name ) == false ) then
                  marker_add_npc( member_name, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL )
                  Marked_member_names[member_name] = true
                  local distance, player = get_dist_closest_player_to_object( member_name )
                  attack_safe( member_name, player, false )
               end
            end
         end
      end
      -- The ones that drove up to either side of the doors
      for squad_index, pre_pierce_squad in pairs( PRE_PIERCE_SQUADS_MEMBERS ) do
         ss06_add_group_required_kill_markers( pre_pierce_squad )
      end

      -- The group that arrived chasing Pierce
      for squad_index, pierce_pursuit_squad in pairs( PIERCE_PURSUIT_SQUADS_MEMBERS ) do
         ss06_add_group_required_kill_markers( pierce_pursuit_squad )
      end

      marker_remove_npc( PIERCE_NAME, SYNC_ALL )
      Pierce_needs_to_be_rescued = false

      --mission_debug( "Switched to Defending HQ state", 15 )
      ss06_kill_health_timer( Pierce_health_timer_thread_handle, 0, PIERCE_NAME )
      trigger_enable( NEAR_PIERCE_TRIGGER_NAME, false )
      npc_leash_remove( PIERCE_NAME )
      turn_vulnerable( PIERCE_NAME )
      on_death( "ss06_follower_died", PIERCE_NAME )
      on_dismiss( "ss06_follower_abandoned", PIERCE_NAME )
      party_set_dismissable( false )

      -- In coop, if the local player already has Shaundi as a homie, give Pierce to the remote player      
      if ( coop_is_active() and Player_with_Shaundi == LOCAL_PLAYER ) then
         party_add( PIERCE_NAME, REMOTE_PLAYER )
      -- Otherwise and in single player, give Pierce to the local player
      else
         party_add( PIERCE_NAME, LOCAL_PLAYER )
      end

      audio_play_for_character( SAVED_PIERCE_DIALOG_LINE, PIERCE_NAME, "voice", false, false )

      -- TODO: Check to see if there are few enough attackers for us to
      -- spawn an attack wave
      if ( Total_attackers_remaining == 0 ) then
         ss06_spawn_next_attack_wave()
      end
   end
end

function ss06_get_to_hq_or_fail( player_name )
   local sync_type = sync_from_player( player_name )
   waypoint_add( SAINTS_HQ_AREA, sync_type ) 
   mission_help_table_nag( HT_GET_BACK_TO_HQ_OBJECTIVE, "", "", sync_type )
   delay( 5.0 )
   ss06_failure_timer( GET_TO_HQ_TIME_SECONDS, 6,  sync_type )
end

-- Disables notoriety spawning when the player reaches a trigger.
-- Also disables the trigger to prevent notoriety spawning from
-- being disabled multiple times.
--
function ss06_disable_notoriety_spawning( triggerer_name, trigger_name )
   on_trigger( "ss06_entered_saints_hq_area", SAINTS_HQ_AREA )
   on_trigger_exit( "ss06_left_saints_hq_area", SAINTS_HQ_AREA )

   notoriety_force_no_spawn( ENEMY_GANG, true )
   ss06_entered_saints_hq_area( triggerer_name, trigger_name )
end

-- This callback is used to guide the player to Shaundi's location
-- smoothly.
--
function ss06_reached_saints_hq_entrance( triggerer_name, trigger_name )
   waypoint_remove( SYNC_ALL )
   trigger_enable( trigger_name, false )

   trigger_enable( SHAUNDI_BREADCRUMBS[1], true )
   marker_add_trigger( SHAUNDI_BREADCRUMBS[1],
                       MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL )
   on_trigger( "ss06_shaundi_breadcrumb01", SHAUNDI_BREADCRUMBS[1] )
end

-- If the player just defeated a wave, update the objective
-- display with this information.
--
function ss06_update_objective()
   objective_text(0, HT_X_OF_Y_WAVES_DEFEATED, Cur_attack_wave, WAVE_COUNT )
end

function ss06_initial_base_attacker_death( member_name, attacker_name )
   ss06_base_attacker_died( member_name, attacker_name )
   Initial_base_attackers_remaining = Initial_base_attackers_remaining - 1
end

-- Callback for a member of the Shaundi attackers that are directly attacking her.
-- Decrements the number of direct attackers and possibly switches to the saved
-- Shaundi state.
--
function ss06_shaundi_direct_attacker_death( member_name, attacker_name )
   ss06_base_attacker_died( member_name, attacker_name )
   Shaundi_direct_attackers_remaining = Shaundi_direct_attackers_remaining - 1

   if ( Shaundi_direct_attackers_remaining == 0 ) then
      if ( Current_mission_state < MS_SAVED_SHAUNDI ) then
         trigger_enable( REACHED_SHAUNDI_TRIGGER, false )
         ss06_setup_state( MS_SAVED_SHAUNDI )
      end
   end
end

-- Called when one of the reinforcements at the entrance is killed -
-- the next state is triggered based on the number left.
--
function ss06_entrance_reinforcement_member_killed( member_name, attacker_name )
   ss06_base_attacker_died( member_name, attacker_name )
   Entrance_reinforcements_remaining = Entrance_reinforcements_remaining - 1

   if ( Entrance_reinforcements_remaining == ENTRANCE_REINFORCEMENTS_REMAINING_THRESHOLD ) then
      ss06_setup_state( MS_KILL_DRIVEUP_ATTACKERS )
   end

end

-- Called when one of the reinforcements that appear right before Pierce
-- shows up dies. If enough of them die, it switches to the state where Pierce
-- shows up.
--
-- member_name: The reinforcement guy who just died.
--
function ss06_pre_pierce_reinforcements_member_died( member_name, attacker_name )
   Pre_Pierce_reinforcements_remaining = Pre_Pierce_reinforcements_remaining - 1
   ss06_base_attacker_died( member_name, attacker_name )

   if ( Pre_Pierce_reinforcements_remaining == PRE_PIERCE_ATTACKERS_REMAINING_THRESHOLD ) then
      ss06_setup_state( MS_PIERCE_APPEARS )
   end
end

-- This function is called whenever a character considered to
-- be a Saints HQ attacker is killed - it controls spawning
-- of reinforcements
--
function ss06_base_attacker_died( member_name, attacker_name )
   Total_attackers_remaining = Total_attackers_remaining - 1
   mission_debug( "total remaining: "..Total_attackers_remaining )
   if ( Marked_member_names[member_name] == true ) then
      marker_remove_npc( member_name, SYNC_ALL )
      Marked_member_names[member_name] = false
   end
   release_to_world( member_name )

   if ( attacker_name == LOCAL_PLAYER or attacker_name == REMOTE_PLAYER ) then
      local sync_type = sync_from_player( attacker_name )

      local cur_num_killed = Num_attackers_killed_by_player[attacker_name]
      cur_num_killed = cur_num_killed + 1
      Num_attackers_killed_by_player[attacker_name] = cur_num_killed
      mission_debug( "player "..attacker_name..", sync type "..sync_type.." number killed: "..cur_num_killed, 5 )

      -- Only show the "number killed" objective in cases where no "Save the Homie" health bar is visible
      if ( Shaundi_saved == true and Pierce_needs_to_be_rescued == false ) then
         local player_index = LOCAL_PLAYER_INDEX
         if ( attacker_name == REMOTE_PLAYER ) then
            player_index = REMOTE_PLAYER_INDEX
         end

         objective_text( player_index, HT_SAMEDI_GANG_MEMBERS_KILLED, cur_num_killed, "", sync_type )
      end
   end

   if ( Current_mission_state >= MS_DEFENDING_HQ ) then
      -- Spawn another wave if few attackers remain
      if ( Total_attackers_remaining == ATTACKS_REMAINING_SPAWN_NEW_WAVE_THRESHOLD or
           ( Total_attackers_remaining == 0 and Cur_attack_wave_index < WAVE_COUNT ) ) then
         ss06_spawn_next_attack_wave()
      elseif ( Total_attackers_remaining == 0 and Final_attack_wave_started ) then
			-- Clean up these triggers so that their functions aren't called when the cutscene teleports the players
         on_trigger( "", SAINTS_HQ_AREA )
         on_trigger_exit( "", SAINTS_HQ_AREA )
         mission_end_success( MISSION_NAME, CT_OUTRO, { "ss06_$Post_CT_Warp_Local", "ss06_$Post_CT_Warp_Remote" } )
      end
   end
end

-- Applies the mission's "haze" effect, and updates
-- it based on how far into the mission the player is.
--
-- time_elapsed: The number of seconds elapsed since
--               the last time this function was called.
--
function ss06_process_haze( time_elapsed )
   -- Update the haze reduction time
   Drug_effect_reduction_time_remaining_seconds = Drug_effect_reduction_time_remaining_seconds - time_elapsed
   if ( Drug_effect_reduction_time_remaining_seconds > 0 ) then
      -- Find the difference between the current effect multiplier and the desired minimum at this stage
      -- in the mission
      local haze_diff = Cur_haze_multiplier - PER_STATE_HAZE_MULTIPLIERS[Current_mission_state]
      local weed_diff = Cur_weed_multiplier - PER_STATE_WEED_MULTIPLIERS[Current_mission_state]
      -- Find out the number of percent per second to reduce the current multiplier to get it at the
      -- desired minimum in the reduction time
      local haze_reduction_percent_per_second = haze_diff / Drug_effect_reduction_time_remaining_seconds
      local weed_reduction_percent_per_second = weed_diff / Drug_effect_reduction_time_remaining_seconds

      -- Reduce the effect by the amount of time that passed
      Cur_haze_multiplier = Cur_haze_multiplier - ( time_elapsed * haze_reduction_percent_per_second )
      Cur_weed_multiplier = Cur_weed_multiplier - ( time_elapsed * weed_reduction_percent_per_second )
   else
      Drug_effect_reduction_time_remaining_seconds = 0
   end

   drug_effect_set_override_values( DRUNK_EFFECT_MAGNITUDE * Cur_haze_multiplier,
                                    WEED_EFFECT_MAGNITUDE * Cur_weed_multiplier, SYNC_ALL )
end

-- Updates the mission notoriety based on the mission's
-- state and the notoriety's current value
--
function ss06_process_mission_notoriety( time_elapsed )
   local current_enemy_notoriety = notoriety_get_decimal( ENEMY_GANG )

   -- We don't have to do any processing of the notoriety unless it
   -- drops below the min. If it has, that means the player has used
   -- a "Forgive and Forget," and we need to raise it back up as per
   -- the mission spec
   if ( current_enemy_notoriety < MISSION_MIN_NOTORIETY ) then

      -- Find the new notoriety based on the old, the time elapsed since last frame, and the increase
      -- per second back to the minimum notoriety value
      local new_notoriety = current_enemy_notoriety + ( time_elapsed * NOTORIETY_BACK_TO_MIN_INCREASE_PER_SECOND )

      -- If we're still below the minimum, then set to this value
      if ( new_notoriety < MISSION_MIN_NOTORIETY ) then
         notoriety_set( ENEMY_GANG, new_notoriety )
      -- If we've hit the min, then set the hard minimum
      else
         notoriety_set_min( ENEMY_GANG, MISSION_MIN_NOTORIETY )
      end
   end
end

-- Callback when the player leaves the starting area. Re-enables spawning and
-- notoriety spawning if at least one player is outside both of the annex and
-- starting box.
--
function ss06_leave_starting_box_or_annex( human_name, trigger_name )

   -- Based on which player and which trigger, update the players'
   -- in-or-out status
   if ( trigger_name == START_TRIGGER_ANNEX_NAME ) then
      if ( human_name == LOCAL_PLAYER ) then
         Players_in_annex[LOCAL_PLAYER_INDEX] = false
      elseif ( human_name == REMOTE_PLAYER ) then
         Players_in_annex[REMOTE_PLAYER_INDEX] = false
      end
   elseif ( trigger_name == START_TRIGGER_REGION_NAME ) then
      if ( human_name == LOCAL_PLAYER ) then
         Players_in_starting_box[LOCAL_PLAYER_INDEX] = false
      elseif ( human_name == REMOTE_PLAYER ) then
         Players_in_starting_box[REMOTE_PLAYER_INDEX] = false
      end
   end

   -- Check to see if a player is outside both boxes
   local player_completely_left = false
   if ( Players_in_starting_box[LOCAL_PLAYER_INDEX] == false and
       Players_in_annex[LOCAL_PLAYER_INDEX] == false ) then
		player_completely_left = true
	-- If the local player's not outside, check the remote player if we're in coop
   elseif ( coop_is_active() ) then
		if ( Players_in_starting_box[REMOTE_PLAYER_INDEX] == false and 
			 Players_in_annex[REMOTE_PLAYER_INDEX] == false ) then
			player_completely_left = true
		end
	 end

   -- If a player is outside, then do all the spawning updates
   if ( player_completely_left ) then
      ss06_setup_state( MS_SPAWN_RESUMED )
   end
end

-- First of two triggers that guide the player to Shaundi.
--
function ss06_shaundi_breadcrumb01( triggerer_name, trigger_name )
   trigger_enable( trigger_name, false )

   trigger_enable( SHAUNDI_BREADCRUMBS[2] )
   marker_add_trigger( SHAUNDI_BREADCRUMBS[2],
                       MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL )

   -- HACK: Show this character
   character_show( INITIAL_BASE_ATTACKERS_MEMBERS[4] )

   on_trigger( "ss06_shaundi_breadcrumb02", SHAUNDI_BREADCRUMBS[2] )
end

-- 
function ss06_shaundi_breadcrumb02( triggerer_name, trigger_name )
   trigger_enable( trigger_name, false )

   set_ignore_ai_flag( SHAUNDI_NAME, false )

   attack_safe( SHAUNDI_NAME, SHAUNDI_ATTACKERS_MEMBERS[1], false )
   -- Make the attackers vulnerable again and have them attack
   for index, member in pairs( SHAUNDI_ATTACKERS_MEMBERS ) do
      attack_safe( member, SHAUNDI_NAME, false )
      turn_vulnerable( member )
      on_death( "ss06_base_attacker_died", member )
   end

   for index, member in pairs( SHAUNDI_DIRECT_ATTACKERS ) do
      on_death( "ss06_shaundi_direct_attacker_death", member )
   end

   marker_add_npc( SHAUNDI_NAME,
                   MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_PROTECT_ACQUIRE, SYNC_ALL )

   local group_loaded_hidden = true
   ss06_setup_and_process_entrance_reinforcements( group_loaded_hidden )
end

-- Sets up the entrance reinforcements and has them path up to the Saints HQ
-- entrance and attack.
--
-- group_loaded_hidden: If this is true, the group was loaded hidden and
--                      needs to be shown.
--
function ss06_setup_and_process_entrance_reinforcements( group_loaded_hidden )
   if ( group_loaded_hidden ) then
      group_show( ENTRANCE_REINFORCEMENTS_GROUP_NAME )
   end
   Total_attackers_remaining = Total_attackers_remaining + Entrance_reinforcements_remaining

   ss06_give_weapons( ENTRANCE_REINFORCEMENTS_MEMBERS, ENTRANCE_REINFORCEMENTS_WEAPONS )


   vehicle_enter_group_teleport( ENTRANCE_REINFORCEMENTS_V1_PASSENGERS,
                                 ENTRANCE_REINFORCEMENTS_VEHICLES[1] )

   vehicle_enter_group_teleport( ENTRANCE_REINFORCEMENTS_V2_PASSENGERS,
                                 ENTRANCE_REINFORCEMENTS_VEHICLES[2] )

   vehicle_suppress_npc_exit( ENTRANCE_REINFORCEMENTS_VEHICLES[1], true )
   vehicle_suppress_npc_exit( ENTRANCE_REINFORCEMENTS_VEHICLES[2], true )


   for index, member_name in pairs( ENTRANCE_REINFORCEMENTS_MEMBERS ) do
      on_death( "ss06_entrance_reinforcement_member_killed", member_name )
   end

   thread_new( "ss06_do_dropoff", 1 )
   thread_new( "ss06_do_dropoff", 2 )
end

function ss06_entrance_reinforcement_index_from_name( name )
   for i = 1, sizeof_table( ENTRANCE_REINFORCEMENTS_MEMBERS ) do
      if ( name == ENTRANCE_REINFORCEMENTS_MEMBERS[i] ) then
         return i
      end
   end
end

function ss06_character_has_been_released( character_name )
   if ( character_exists( character_name ) == false ) then
      return true
   end
   return false
end

function ss06_do_dropoff( vehicle_index )
   vehicle_pathfind_to( ENTRANCE_REINFORCEMENTS_VEHICLES[vehicle_index],
                        ENTRANCE_REINFORCEMENTS_TO_HQ_PATH, true, true )

   vehicle_pathfind_to( ENTRANCE_REINFORCEMENTS_VEHICLES[vehicle_index],
                        ENTRANCE_REINFORCEMENTS_DROPOFF_POINTS[vehicle_index], true, true )

   for index, member_name in pairs( ENTRANCE_REINFORCEMENT_VEHICLE_PASSENGERS[vehicle_index] ) do
      -- Have everyone but the driver get out
      if ( index ~= 1 ) then
         if ( ss06_character_has_been_released( member_name ) == false ) then
            vehicle_exit( member_name )
            thread_new( "ss06_reinforcement_member_pathfind", member_name )
         end
      end
   end

   -- Have the vehicle pathfind away
   vehicle_pathfind_to( ENTRANCE_REINFORCEMENTS_VEHICLES[vehicle_index],
                        ENTRANCE_REINFORCEMENTS_VEHICLE_EXIT_PATH, true, false )

   vehicle_pathfind_to( ENTRANCE_REINFORCEMENTS_VEHICLES[vehicle_index],
                        ENTRANCE_REINFORCEMENTS_VEHICLE_DEST, false, false )

   -- Have the driver get out, and release the vehicle and driver to the world
   vehicle_exit( ENTRANCE_REINFORCEMENT_VEHICLE_PASSENGERS[vehicle_index][1] )
   release_to_world( ENTRANCE_REINFORCEMENT_VEHICLE_PASSENGERS[vehicle_index][1] )
   release_to_world( ENTRANCE_REINFORCEMENTS_VEHICLES[vehicle_index] )
end

function ss06_reinforcement_member_pathfind( member_name )
   local member_index = ss06_entrance_reinforcement_index_from_name( member_name )
   move_to_safe( member_name, ENTRANCE_REINFORCEMENTS_GOAL_POINTS[member_index], 3, true, true )

   --npc_leash_to_nav( member_name, ENTRANCE_REINFORCEMENTS_GOAL_POINTS[member_index], 3 )

   --attack_closest_player( member_name )
end

function ss06_pre_pierce_reinforcements_group_do_pathing( group_index )
   -- Seat the people, add callbacks
   vehicle_enter_group_teleport( PRE_PIERCE_SQUADS_MEMBERS[group_index],
                                 PRE_PIERCE_VEHICLE_NAMES[group_index] )

   for index, member_name in pairs( PRE_PIERCE_SQUADS_MEMBERS[group_index] ) do
      on_death( "ss06_pre_pierce_reinforcements_member_died", member_name )
   end

   -- Pathfind
   vehicle_pathfind_to( PRE_PIERCE_VEHICLE_NAMES[group_index],
                        PRE_PIERCE_REINFORCEMENTS_VEHICLE_PATHS[group_index],
                        true, true )

   -- Get out and attack the player
   for index, member_name in pairs( PRE_PIERCE_SQUADS_MEMBERS[group_index] ) do
      if ( ss06_character_has_been_released( member_name ) == false ) then
         marker_add_npc( member_name, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL )
         Marked_member_names[member_name] = true
         vehicle_exit( member_name )
      end
   end
   for index, member_name in pairs( PRE_PIERCE_SQUADS_MEMBERS[group_index] ) do
      if ( ss06_character_has_been_released( member_name ) == false ) then
         local distance, player = get_dist_closest_player_to_object( member_name )
         attack_safe( member_name, player, false )
      end
   end
end

function ss06_pierce_flee_to_hq( flee_path_index )
   turn_invulnerable( PIERCE_NAME )

   -- Have him flee to the HQ, and stop there
   vehicle_pathfind_to( PIERCE_VEHICLE_NAME, PIERCE_FLEE_PATHS[flee_path_index], true, true )

   -- Have him get out
   vehicle_exit( PIERCE_NAME )
   -- If the players are in range of Pierce, simply switch to the "defend the HQ" state.
   if ( Players_near_Pierce[LOCAL_PLAYER] or
        Players_near_Pierce[REMOTE_PLAYER] ) then
      ss06_setup_state( MS_DEFENDING_HQ )
   -- Otherwise, do the whole "he's running out of hit points!" sequence
   else
      Pierce_needs_to_be_rescued = true
      objective_text_clear( LOCAL_PLAYER_INDEX )
      objective_text_clear( REMOTE_PLAYER_INDEX )
      mission_help_table( HT_HELP_PIERCE )

      local num_chunks,
            health_chunks,
            time_chunks_seconds = ss06_calculate_health_timer_data( SAVE_PIERCE_TIME_SECONDS, SAVE_PIERCE_DIVISION_RANGE )
      local warning_time_threshold = SAVE_PIERCE_TIME_SECONDS / 2
      local warning_health_threshold = 0.5
      Pierce_health_timer_thread_handle = thread_new( "ss06_process_health_timer", 0, HT_PIERCE_HEALTH_BAR_LABEL,
                                                       warning_time_threshold, warning_health_threshold,
                                                       num_chunks, health_chunks, time_chunks_seconds,
                                                       "", HT_PIERCE_DIED_HIGHLIGHTED )

      -- Remove required-kill markers for all NPCs that are still alive
      -- The ones who started in the entrance and the ones that were attacking Shaundi
      ss06_remove_group_required_kill_markers( INITIAL_BASE_ATTACKERS_MEMBERS )
      ss06_remove_group_required_kill_markers( SHAUNDI_ATTACKERS_MEMBERS )

      -- The two groups that came before Pierce
      -- The ones that did the dropoff
      for vehicle_index, vehicle_passengers in pairs( ENTRANCE_REINFORCEMENT_VEHICLE_PASSENGERS ) do
         for member_index, member_name in pairs( vehicle_passengers ) do
            if ( member_index ~= 1 ) then
               if ( ss06_character_has_been_released( member_name ) == false ) then
                  if ( Marked_member_names[member_name] == true ) then
                     marker_remove_npc( member_name, SYNC_ALL )
                     Marked_member_names[member_name] = false
                  end
               end
            end
         end
      end
      -- The ones that drove up to either side of the doors
      for squad_index, pre_pierce_squad in pairs( PRE_PIERCE_SQUADS_MEMBERS ) do
         ss06_remove_group_required_kill_markers( pre_pierce_squad )
      end

      -- Mark Pierce with a protect/acquire marker
      marker_add_npc( PIERCE_NAME, MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_PROTECT_ACQUIRE, SYNC_ALL )

      -- Leash him to his trigger
      npc_leash_to_nav( PIERCE_NAME, NEAR_PIERCE_TRIGGER_NAME, PIERCE_LEASH_DISTANCE )
   end
end

function ss06_pierce_pursuit_group_do_chase( group_index )
   for index, member_name in pairs( PIERCE_PURSUIT_SQUADS_MEMBERS[group_index] ) do
      on_death( "ss06_base_attacker_died", member_name )
   end

   vehicle_chase( PIERCE_PURSUIT_VEHICLE_NAMES[group_index], PIERCE_NAME )
end

function ss06_reached_shaundi_trigger()
   trigger_enable( REACHED_SHAUNDI_TRIGGER, false )

   ss06_setup_state( MS_SAVED_SHAUNDI, false )
end

function ss06_enter_starting_box( human_name, trigger_name )
   if ( human_name == LOCAL_PLAYER ) then
      Players_in_starting_box[LOCAL_PLAYER_INDEX] = true
   elseif( human_name == REMOTE_PLAYER ) then
      Players_in_starting_box[REMOTE_PLAYER_INDEX] = true
   end
end

function enter_annex( human_name, trigger_name )
   if ( human_name == LOCAL_PLAYER ) then
      Players_in_annex[LOCAL_PLAYER_INDEX] = true
   elseif( human_name == REMOTE_PLAYER ) then
      Players_in_annex[REMOTE_PLAYER_INDEX] = true
   end
end


function ss06_give_weapons( members, weapons )
   for index, member_name in pairs( members ) do
      inv_item_remove_all( member_name )

      inv_item_add( weapons[index], 1, member_name )
   end
end

function ss06_near_pierce( human_name, trigger_name )
   Players_near_Pierce[human_name] = true

   if ( Pierce_health_timer_thread_handle ~= INVALID_THREAD_HANDLE ) then
      ss06_setup_state( MS_DEFENDING_HQ )
   end
end

function ss06_left_pierce_area( human_name, trigger_name )
   Players_near_Pierce[human_name] = false
end

-- Callback when either player enters the Saints HQ defend-the-base area.
--
function ss06_entered_saints_hq_area( human_name, trigger_name )
   if ( human_name == LOCAL_PLAYER ) then
      Players_in_defense_area[LOCAL_PLAYER_INDEX] = true
   elseif ( human_name == REMOTE_PLAYER ) then
      Players_in_defense_area[REMOTE_PLAYER_INDEX] = true
   end

   if ( Shaundi_saved ) then
      local sync_type = sync_from_player( human_name )
      waypoint_remove( sync_type )
      minimap_icon_remove_navpoint( SAINTS_HQ_AREA, sync_type )
   end
   ss06_stop_failure_timer( human_name )
end

-- Callback when either player leaves the Saints HQ defend-the-base area.
--
function ss06_left_saints_hq_area( human_name, trigger_name )
   if ( human_name == LOCAL_PLAYER ) then
      Players_in_defense_area[LOCAL_PLAYER_INDEX] = false
   elseif ( human_name == REMOTE_PLAYER ) then
      Players_in_defense_area[REMOTE_PLAYER_INDEX] = false
   end

   if ( Shaundi_saved ) then
      local sync_type = sync_from_player( human_name )
      waypoint_add( SAINTS_HQ_AREA, sync_type )
      minimap_icon_add_navpoint_radius( SAINTS_HQ_AREA, MINIMAP_ICON_LOCATION, SAINTS_HQ_AREA_RADIUS_METERS, nil, sync_type )
      ss06_start_failure_timer( human_name )
   end
end

-- Starts the "return to the HQ's defense" timer
-- Called when a player wanders away from the HQ
-- when they should be defending it
--
function ss06_start_failure_timer( human_name )
   local sync_type = sync_from_player( human_name )

   Player_failure_timer_thread_handles[human_name] = thread_new( "ss06_failure_timer", FAILURE_TIMEOUT_ON_LEAVE_DEFENSE_AREA_SECONDS, 6,  sync_type )
end

function ss06_failure_timer( time_seconds, num_updates, sync_type )
   local time_remaining_seconds = time_seconds
   local increment_seconds = time_seconds / num_updates

   mission_help_table_nag( HT_RETURN_TO_HQ_DEFENSE_SECONDS_TEXT, time_remaining_seconds, "", sync_type )
   while ( time_remaining_seconds > 0 ) do
      delay( increment_seconds )
      time_remaining_seconds = time_remaining_seconds - increment_seconds
      mission_help_table_nag( HT_RETURN_TO_HQ_DEFENSE_SECONDS_TEXT, time_remaining_seconds, "", sync_type )
   end
   mission_end_failure( MISSION_NAME, HT_LEFT_HQ_UNDEFENDED_FAILURE )
end

-- Stops the "return to the HQ's defense" timer
-- Called when a player returns to the HQ
-- after leaving the defense area
--
function ss06_stop_failure_timer( human_name )
   if ( Player_failure_timer_thread_handles[human_name] ~= INVALID_THREAD_HANDLE ) then
      thread_kill( Player_failure_timer_thread_handles[human_name] )
      Player_failure_timer_thread_handles[human_name] = INVALID_THREAD_HANDLE
   end
end

-- The south trigger callback in the starting zone. Spawns an 
-- attack squad to attack the player.
--
function ss06_south_trigger( human_name, trigger_name )
   -- The south trigger needs to catch either player to spawn an attack
   -- squad nearby
   if ( ss06_either_player_triggered( human_name, Players_south_trigger, TRIGGER_ONCE_FIRST_TRIGGERER ) ) then
      trigger_enable( SOUTH_TRIGGER_NAME, false )
      ss06_show_attack_group( ON_FOOT_SQUAD_GROUP_NAMES[SOUTH_ATTACK_SQUAD],
                              ON_FOOT_SQUAD_GROUP_NAMES_COOP[SOUTH_ATTACK_SQUAD]  )
      ss06_attack_squad_attack( ON_FOOT_SQUAD_MEMBERS[SOUTH_ATTACK_SQUAD],
                                ON_FOOT_SQUAD_MEMBERS_COOP[SOUTH_ATTACK_SQUAD], human_name, true )
   end
end

-- The north trigger callback in the starting zone. Spawns an 
-- attack squad to attack the player.
--
function ss06_north_trigger( human_name, trigger_name )
   -- The north trigger needs to catch either player to spawn an attack
   -- squad nearby
   if ( ss06_either_player_triggered( human_name, Players_north_trigger, TRIGGER_ONCE_FIRST_TRIGGERER ) ) then
      trigger_enable( NORTH_TRIGGER_NAME, false )
      ss06_show_attack_group( ON_FOOT_SQUAD_GROUP_NAMES[NORTH_ATTACK_SQUAD],
                              ON_FOOT_SQUAD_GROUP_NAMES_COOP[NORTH_ATTACK_SQUAD] )
      ss06_attack_squad_attack( ON_FOOT_SQUAD_MEMBERS[NORTH_ATTACK_SQUAD],
                                ON_FOOT_SQUAD_MEMBERS_COOP[NORTH_ATTACK_SQUAD], human_name, true )
   end
end

-- The south camper trigger callback. Causes the campers at the blockade to
-- pop out and attack the player.
--
function ss06_south_camper_trigger( human_name, trigger_name )
   trigger_enable( SOUTH_CAMPER_TRIGGER_NAME, false )
   for index, member in pairs(SOUTH_CAMPER_NAMES) do
      set_ignore_ai_flag( member, false )
      crouch_stop( member )
      attack_safe( member, human_name, false )
   end
end

-- The north camper trigger callback. Causes the campers at the blockade to
-- pop out and attack the player.
--
function ss06_north_camper_trigger( human_name, trigger_name )
   trigger_enable( NORTH_CAMPER_TRIGGER_NAME, false )
   for index, member in pairs(NORTH_CAMPER_NAMES) do
      set_ignore_ai_flag( member, false )
      crouch_stop( member )
      attack_safe( member, human_name, false )
   end
end

-- Attack squad that appears if the player tries to exit from the side alley
--
-- human_name: The player that hit the alley exit trigger
-- trigger_name: The name of the alley exit trigger
--
function ss06_alternate_escape_attack( human_name, trigger_name )
   local either_triggered = ss06_either_player_triggered( human_name )
   if ( either_triggered ) then
      trigger_enable( trigger_name, false )
      ss06_show_attack_group( ALT_ESCAPE_GROUP_NAME, ALT_ESCAPE_COOP_GROUP_NAME )
      ss06_seat_attack_squad( ALT_ESCAPE_SQUAD_MEMBERS, ALT_ESCAPE_COOP_MEMBERS, ALT_ESCAPE_VEHICLE_NAME, ALT_ESCAPE_VEHICLE_NAME )
      --ss06_attack_squad_attack( ALT_ESCAPE_SQUAD_MEMBERS, ALT_ESCAPE_COOP_MEMBERS, human_name )
      vehicle_speed_override( ALT_ESCAPE_VEHICLE_NAME, ATTACK_CAR_OVERRIDE_SPEED ) 
      vehicle_pathfind_to( ALT_ESCAPE_VEHICLE_NAME, ALT_ESCAPE_ATTACKER_STOP_NAVPOINT_NAME, true, true )
   end
end

-- Function to deal with trigger for multiple players
--
-- human_name: The name of the human that triggered it
-- players_trigger_trackers: (Optional if trigger_option is TRIGGER_MULTIPLE_TIMES. ) Variables that track the trigger
-- trigger_option: (Optional) If not set, defaults to TRIGGER_MULTIPLE_TIMES.
--
function ss06_either_player_triggered( human_name, players_trigger_trackers, trigger_option )

   local local_p_triggered
   local remote_p_triggered

   -- Check to see if it's a player
   if ( human_name == LOCAL_PLAYER ) then
      local_p_triggered = true
   elseif ( human_name == REMOTE_PLAYER ) then
      remote_p_triggered = true
   end

   -- Trigger multiple times - if either player triggered, return true
   if ( trigger_option == nil or trigger_option == TRIGGER_MULTIPLE_TIMES ) then
      if ( local_p_triggered == true ) then
         return true
      elseif ( remote_p_triggered == true ) then
         return true
      end
   -- Trigger once for the first person that triggers it
   elseif ( trigger_option == TRIGGER_ONCE_FIRST_TRIGGERER ) then
      if ( ( local_p_triggered or remote_p_triggered ) and 
           ( players_trigger_trackers[LOCAL_PLAYER_INDEX] or players_trigger_trackers[2] ) ) then
         return false
      else
         if ( local_p_triggered ) then
            players_trigger_trackers[LOCAL_PLAYER_INDEX] = true
         elseif ( remote_p_triggered ) then
            players_trigger_trackers[REMOTE_PLAYER_INDEX] = true
         end
         return true
      end
   -- Trigger once for each player
   elseif ( trigger_option == TRIGGER_ONCE_PER_PLAYER ) then
      if ( local_p_triggered == true ) then
         if ( players_trigger_trackers[LOCAL_PLAYER_INDEX] == false ) then
            players_trigger_trackers[LOCAL_PLAYER_INDEX] = true
            return true
         end
      elseif ( remote_p_triggered == true ) then
         if ( players_trigger_trackers[REMOTE_PLAYER_INDEX] == false ) then
            players_trigger_trackers[REMOTE_PLAYER_INDEX] = true
            return true
         end
      else
         return false
      end
   end
   return false
end

-- Checks to see if a trigger has been triggered by all the players.
-- In coop, that's two. In single player, that's one.
--
-- human_name: Name of the one that triggered the trigger.
-- Players_trigger_trackers: Table of two booleans that track player 1 and 2's
--                      previous status of triggering this trigger.
-- trigger_multiple_times: (Optional) Set to "true" if the trigger should be
--                     allowed to be triggered multiple times.
--
function ss06_all_players_triggered( human_name, players_trigger_trackers, trigger_multiple_times )
   local coop_on = coop_is_active()

   -- If both trackers mark this trigger as being triggered, then it's already been
   -- triggered and shouldn't be re-triggered.
   -- ( If "trigger multiple times" is set, it will have cleared these values already.
   --   See the last "if" statement in this function. )
   if ( players_trigger_trackers[LOCAL_PLAYER_INDEX] == true ) then
      if ( coop_on == false ) then
         return false
      elseif ( players_trigger_trackers[REMOTE_PLAYER_INDEX] == true ) then
         return false
      end
   end

   -- Check to see who triggered the trigger
   if ( human_name == LOCAL_PLAYER ) then
      players_trigger_trackers[LOCAL_PLAYER_INDEX] = true
   elseif ( human_name == REMOTE_PLAYER ) then
      players_trigger_trackers[REMOTE_PLAYER_INDEX] = true
   end

   -- Figure out if the trigger has been triggered for everyone
   local trigger_triggered_for_all_players = false

   if ( players_trigger_trackers[LOCAL_PLAYER_INDEX] ) then
      if ( coop_on == false ) then
         trigger_triggered_for_all_players = true
      elseif ( players_trigger_trackers[REMOTE_PLAYER_INDEX] ) then
         trigger_triggered_for_all_players = true
      end
   end

   -- If we're supposed to track if the trigger is triggered more than once, then
   -- reset the "triggered by player x" trigger values if the trigger was triggered
   if ( trigger_multiple_times ) then
      if ( trigger_triggered_for_all_players ) then
         players_trigger_trackers[LOCAL_PLAYER_INDEX] = false
         players_trigger_trackers[REMOTE_PLAYER_INDEX] = false
      end
   end

   return trigger_triggered_for_all_players
end

-- Creates the attack wave group specified
--
-- group_name: The name of the attack wave group
-- group_name_coop: The coop additions to the attack wave group, might be nil
--
function ss06_spawn_attack_group( group_name, group_name_coop )
   -- Create the squad, and its coop counterpart if applicable
   group_create( group_name, true )
   if ( coop_is_active() and group_name_coop ~= nil ) then
      group_create( group_name_coop, true )
   end
end

-- Creates the attack squad at the specified index,
-- hidden
--
-- group_name: The name of the attack group
-- group_name_coop: The coop additions to the attack group, might be nil
--
function ss06_spawn_hidden_attack_group( group_name, group_name_coop )

   -- Create the squad, and its coop counterpart if applicable
   group_create_hidden( group_name, true )
   if ( coop_is_active() and group_name_coop ~= nil ) then
      group_create_hidden( group_name_coop, true )
   end
end

-- Seats an attack squad in vehicles.
--
-- squad_members: The squad members
-- squad_members_coop: The coop squad members ( extra squad for coop-play, might be nil )
-- squad_vehicle: The squad's vehicle
-- squad_vehicle_coop: The coop squad's vehicle
--
function ss06_seat_attack_squad( squad_members, squad_members_coop, squad_vehicle, squad_vehicle_coop )

   vehicle_enter_group_teleport( squad_members, squad_vehicle )
   --for index, member in pairs( squad_members[squad_index] ) do
   --   vehicle_enter( member, squad_vehicle[squad_index] )
   --end

   if ( coop_is_active() and squad_members_coop ~= nil and sizeof_table( squad_members_coop ) > 0 ) then
      --for index, member in pairs( squad_members_coop[squad_index] ) do
      --   vehicle_enter( member, squad_vehicle_coop[squad_index] )
      --end
      vehicle_enter_group_teleport( squad_members_coop, squad_vehicle_coop )
   end
end

-- Have the specified squad_members attack a target
--
-- squad_members: The squad_members
-- squad_members_coop: The coop additions to the squad_members ( can be nil )
-- target_name: The name of the target to attack
-- never_give_up_never_surrender: Sets the 'cant_flee' flag for the NPCs if true.
--
function ss06_attack_squad_attack( squad_members, squad_members_coop, target_name, never_give_up_never_surrender )
   -- Attack, but don't yield thread control
   for index, member in pairs(squad_members) do
      if ( never_give_up_never_surrender == true ) then
         set_cant_flee_flag( member, true )
      end
      attack_safe( member, target_name, false )   
   end

   if ( coop_is_active() and squad_members_coop ~= nil ) then
      -- Attack, but don't yield thread control
      for index, member in pairs(squad_members_coop) do
         if ( never_give_up_never_surrender == true ) then
            set_cant_flee_flag( member, true )
         end
         attack_safe( member, target_name, false )   
      end
   end
end

-- Puts a marker over all the squad members in the specified attack squad.
--
-- squad_members: The squad members
-- squad_members_coop: The coop squad members ( extra squad for coop-play, might be nil )
-- squad_vehicle: The squad's vehicle
-- squad_vehicle_coop: The coop squad's vehicle
--
function ss06_mark_attack_squad( squad_members, squad_members_coop, squad_vehicle, squad_vehicle_coop )

   -- For each NPC, add a marker
   for index, member in pairs( squad_members ) do
      marker_add_npc(member, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL)
      Marked_member_names[member] = true
   end
   -- Add a vehicle marker for the squad's vehicle
   -- marker_add_vehicle(squad_vehicle, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL ) 

   -- If we're in coop, do this for any existing coop attack squads too
   if ( coop_is_active() and squad_members_coop ~= nil ) then
   
      -- For each NPC, add a marker
      for index, member in pairs( squad_members_coop ) do
         marker_add_npc(member, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL) 
         Marked_member_names[member] = true
      end
      -- Add a vehicle marker for the squad's vehicle
      -- marker_add_vehicle(squad_vehicle_coop, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL ) 
   end
end

-- Shows a hidden attack group
--
-- group_name: The name of the attack squad group
-- group_name_coop: The coop additions to the attack squad
--
function ss06_show_attack_group( group_name, group_name_coop )
   group_show( group_name )
   if ( coop_is_active() and group_name_coop ~= nil ) then
      group_show( group_name_coop )
   end
end

-- Releases a wave's group to the world
--
-- group_name: The name of the group
-- group_name_coop: The coop additions to the group
--
function ss06_release_attack_group( group_name, group_name_coop )
   --marker_remove_group( group_name )
   release_to_world( group_name )
   if ( coop_is_active() and group_name_coop ~= nil ) then
      --marker_remove_group( group_name_coop )
      release_to_world( group_name_coop )
   end
end

function ss06_success()
end
