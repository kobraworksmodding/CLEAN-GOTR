-- ss10.lua
-- SR2 mission script
-- 3/28/07

	CRIB_PB_TELE_GYM_OUT = "cribs_sr2_city_$PB_gym_out"

-- Mission help table text tags
	CATCH_UP_TO_VAN = "ss10_catch_up"
	CHECK_IN_AT_DESK = "ss10_check_in"
	DEFEND_ROOM = "ss10_defend_room"
	ESCORT_SHAUNDI = "ss10_escort_shaundi"
	SHAUNDI_ABANDONED = "ss10_shaundi_abandoned"
	ABANDONING_SHAUNDI = "ss10_abandoning_shaundi"
	SHAUNDI_DIED = "ss10_shaundi_died"
	FIND_REPAIRMEN = "ss10_find_repairmen"
	GET_EQUIPMENT_BACK = "ss10_get_equipment_back"
	GET_IN_VAN = "ss10_get_in_van"
	GET_TO_CAMERA_ROOM = "ss10_get_to_camera_room"
	ENTER_THE_STATION = "ss10_enter_the_station"
	PARK_VAN_AT_STATION = "ss10_park_van_at_station"
	HIJACK_VAN = "ss10_hijack_van"
	DONT_SHOW_WEAPONS = "ss10_dont_show_weapons"
	TALK_TO_CLERK = "ss10_talk_to_clerk"
	FLOOR_INDEX = "ss10_floor_index"
	VAN_ESCAPED = "ss10_van_escaped"
	VAN_DESTROYED = "ss10_van_destroyed"
	VAN_LOST = "ss10_van_lost"
	VAN_REQUIRED = "ss10_van_required"
	HEAD_TO_CAMERA_ROOM = "ss10_head_to_camera_room"
	MISSION_DISPLAY_NAME = "ss10_display_name"
	VAN_DAMAGE_BAR_LABEL = "ss10_van_damage"
	RUSE_BLOWN = "ss10_ruse_blown"
	GET_TO_TERMINAL = "ss10_get_to_terminal"

-- Mission states
	MS_INITIAL = 1
	MS_FIND_REPAIRMEN = 2
	MS_HIJACK_REPAIR_VAN = 3
	MS_REPAIRMEN_ESCAPING = 4
	MS_REACHED_REPAIRMEN_AGAIN = 5
	MS_VAN_DISABLED = 6
	MS_PARK_VAN_AT_STATION = 7
	MS_PARKED_VAN_AT_STATION = 8
	MS_ENTERED_POLICE_STATION = 9
	MS_GO_TO_CAMERA_ROOM = 10
	MS_RUN_TO_CAMERA_ROOM = 11
	MS_DEFEND_CAMERA_ROOM = 12
	MS_LEAVE_STATION = 13
	MS_RETURN_TO_BASE = 14

-- Groups, NPCs, vehicles, navpoints, and other names
	MISSION_NAME = "ss10"
	MP = MISSION_NAME.."_$"

	-- Checkpoints
	CP_PARKED_VAN_AT_STATION = "Parked_at_Station_Checkpoint"

	CAMERA_EQUIPMENT_GROUP = MP.."Camera_Equipment"

	SHAUNDI_GROUP_NAME = MP.."Shaundi"
	SHAUNDI_NAME = MP.."Shaundi"
	SHAUNDI_REPAIR_VARIANT_GROUP_NAME = MP.."Shaundi_Repair_Outfit"
	SHAUNDI_REPAIR_VARIANT_NAME = MP.."Shaundi_Repair_Outfit"
	STARTER_VEHICLE_GROUP_NAME = MP.."Starter_Vehicle"
	STARTER_VEHICLE_COOP_GROUP_NAME = MP.."Starter_Vehicle_Coop"
	HACKING_LOCATION_NAME = MP.."Hacking_Location"
	REPAIR_VAN_AND_REPAIRMEN_GROUP_NAME = MP.."Repair_Group"
	REPAIR_VAN_NAME = MP.."Repair_Van"
	REPAIR_MAN_NAME = MP.."Repairman_01"
	REPAIR_VAN_INITIAL_NAVPOINTS = { MP.."Initial_01", MP.."Initial_02" }
	REPAIR_VAN_PATHS  = { MP.."Repair_Van_Path_01" }--[[, MP.."Repair_Van_Path_02", MP.."Repair_Van_Path_03" }]]
								--[[{ MP.."Path_01", MP.."Path_02", MP.."Path_03", MP.."Path_04",
									MP.."Path_05", MP.."Path_06", MP.."Path_07", MP.."Path_08",
									MP.."Path_09", MP.."Path_10", MP.."Path_11", MP.."Path_12",
									MP.."Path_13", MP.."Path_14", MP.."Path_15", MP.."Path_16" },
								 { MP.."Path_17", MP.."Path_18", MP.."Path_19", MP.."Path_20",
									MP.."Path_21", MP.."Path_22", MP.."Path_23", MP.."Path_24",
									MP.."Path_25", MP.."Path_26", MP.."Path_27", MP.."Path_28",
									MP.."Path_29" } }]]

	REPAIR_VAN_AREA_TRIGGER = MP.."Repair_Van_Area"
	REPAIR_OUTFIT_NAME = "repair"

	CHECK_IN_VIEW_NAVPOINT_NAME = MP.."Check_In_View"

	POLICE_STATION_HELICOPTER = MP.."Police_Station_Heli"

	POLICE_STATION_POSITION_NAVPOINT_NAME = MP.."Police_Station_Position"
	POLICE_STATION_TRIGGER_NAME = MP.."Police_Station_Trigger"
	--RECEPTIONIST_CHAIR_NAME = MP.."Receptionist_Chair"
	RECEPTIONIST_GROUP_NAME = MP.."Receptionist"
	RECEPTIONIST_NAME = RECEPTIONIST_GROUP_NAME
	RECEPTIONIST_DESK_CHECKIN_TRIGGER_NAME = MP.."Receptionist_Desk_Checkin"
	RECEPTIONIST_DESK_CHECKIN_TRIGGER_POSITION = MP.."Checkin_Trigger_Position"
	RECEPTIONIST_DESK_SIGN_IN_POSITION = MP.."Receptionist_Desk_Sign_In_Position"
	PAST_DESK_TRIGGER_NAME = MP.."Past_Desk"
	MAIN_STATION_ENTRANCE_TRIGGERS = { MP.."Main_Station_Entrance_01", MP.."Main_Station_Entrance_02",
												  MP.."Main_Station_Entrance_03", MP.."Main_Station_Entrance_04" }

	PAST_LOBBY_TRIGGERS = { MAIN_STATION_ENTRANCE_TRIGGERS[1], MAIN_STATION_ENTRANCE_TRIGGERS[2] }

	STATION_EXIT_TRIGGER_NAMES = { MP.."Station_Exit_01",
											 MP.."Off_The_Balcony01", MP.."Off_The_Balcony02",
											 MP.."Off_The_Balcony03", MP.."Off_The_Balcony04" }

	CAMERA_ROOM_DOOR_TRIGGER = MP.."Camera_Room_Door"


	SAINTS_PARKING_LOT_TRIGGER_NAME = MP.."Saints_Hideout_Lot"

	GROUND_HQ_TRIGGER_INDEX = 1
	AIR_HQ_TRIGGER_INDEX = 2

	SAINTS_HQ_TRIGGER_NAMES = { [GROUND_HQ_TRIGGER_INDEX] = MP.."Saints_HQ_Trigger",
										 [AIR_HQ_TRIGGER_INDEX] = MP.."Saints_HQ_Trigger_02" }

	START_NAVPOINT_NAME = "mission_start_sr2_city_$ss10"
	START_NAVPOINT_NAME_COOP_PLAYER = MP.."Coop_Player_Start"
	MISSION_NAME = "ss10"
	POLICE_GANG = "police"
	ULTOR_GANG = "ultor"
	CHECK_IN_ANIMATION_NAME = "sign in"
	ALARM_ORIGIN = MP.."Alarm_Origin"

	STAIRWAY_GUIDE_NAVPOINT_NAME = MP.."Stairway_Guide"
	STAIRWAY_TRIGGER_NAMES = { MP.."Stairway_Trigger_01", MP.."Stairway_Trigger_02" }

	FOURTH_FLOOR_LOCATION_NAVPOINT_NAME = MP.."Fourth_Floor_Location"

	HELI_SQUAD_GROUP_NAME = MP.."Heli_Squad"

	SWAT_HELI_DROPOFF_GROUP_NAME = MP.."Swat_Dropoff"

	POLICE_PISTOL_NAME = "beretta"
	POLICE_PISTOL_AMMO_COUNT = 24
	POLICE_SHOTGUN_NAME = "pump_action_shotgun"
	POLICE_SHOTGUN_AMMO_COUNT = 9

	PACKAGE_NAME = MP.."Computer_Camera"
	STATE_HACK_CAMERA_ROOM = "Stand Hacking"

	END_LOCAL_WARP = MP.."End_Local_Warp"
	END_REMOTE_WARP = MP.."End_Remote_Warp"

-- Specifically spawned police attackers
	-- Per-location. Number of entries is number of locations.
	-- Number of entries must be the same for coop and normal
	-- attackers.
	NUM_WAVE_ATTACKERS = { 6, 7 }
	NUM_COOP_WAVE_ATTACKERS = { 3, 3 }

	WAVE_SHOTGUN_DISTRIBUTIONS = { 0, .25, .75, 1.0 }
	function WAVE_SHOTGUN_DISTRIBUTION( wave_index )
		local count = sizeof_table( WAVE_SHOTGUN_DISTRIBUTIONS )
		if ( wave_index <= count ) then
			return WAVE_SHOTGUN_DISTRIBUTIONS[wave_index]
		else
			return WAVE_SHOTGUN_DISTRIBUTIONS[count]
		end
	end

	-- Attacker name is WAVE_ATTACKER_NAME_LOCATION_PREFIX..location_index..WAVE_ATTACKER_NAME_INDEX_PREFIX..attacker_index
	-- Example: MP.."Location3_Attacker_02" would be the second member of the third wave.
	-- For coop, use WAVE_ATTACKER_COOP_NAME_INDEX_PREFIX instead of WAVE_ATTACKER_NAME_INDEX_PREFIX.
	WAVE_ATTACKER_NAME_LOCATION_PREFIX = MP.."Location"
	WAVE_ATTACKER_COOP_NAME_INDEX_PREFIX = "c_Attacker_0"
	WAVE_ATTACKER_NAME_INDEX_PREFIX = "_Attacker_0"

	-- WAVE_LOCATION_NAME_PREFIX..location_index..WAVE_LOCATION_NAME_SUFFIX
	-- For coop, WAVE_LOCATION_NAME_COOP_SUFFIX comes after location_index instead of
	-- WAVE_LOCATION_NAME_SUFFIX.
	WAVE_LOCATION_NAME_PREFIX = MP.."Location"
	WAVE_LOCATION_NAME_COOP_SUFFIX = "c_Attackers"
	WAVE_LOCATION_NAME_SUFFIX = "_Attackers"

	FLOOR_AMBIENT_NPC_GROUP_NAME = MP.."Station_Ambient_NPCs"

	FLOOR_GROUP_NAMES = { MP.."Floor1_Officers", MP.."Floor2_Officers",
								 MP.."Floor3_Officers", MP.."Floor4_Officers",
								 MP.."Floor5_Officers" }

	FLOOR1_OFFICER_NAMES = { MP.."F1_Officer01", MP.."F1_Officer02",
									 MP.."F1_Officer03", MP.."F1_Officer04",
									 MP.."F1_Officer05" }

	FLOOR2_OFFICER_NAMES = { MP.."F2_Officer01", MP.."F2_Officer02",
									 MP.."F2_Officer03", MP.."F2_Officer04" }

	FLOOR3_OFFICER_NAMES = { MP.."F3_Officer01", MP.."F3_Officer02",
									 MP.."F3_Officer03", MP.."F3_Officer04",
									 MP.."F3_Officer05" }

	FLOOR4_OFFICER_NAMES = { MP.."F4_Officer01", MP.."F4_Officer02",
									 MP.."F4_Officer03", MP.."F4_Officer04" }

	FLOOR5_OFFICER_NAMES = { MP.."F5_Officer01", MP.."F5_Officer02" }

	FLOOR_OFFICER_NAMES = { FLOOR1_OFFICER_NAMES, FLOOR2_OFFICER_NAMES,
									FLOOR3_OFFICER_NAMES, FLOOR4_OFFICER_NAMES,
									FLOOR5_OFFICER_NAMES }

	SWAT_ATTACKERS_GROUP_NAMES = { MP.."Swat_Attack1", MP.."Swat_Attack2" }
	SWAT_ATTACKER_NAMES = { { MP.."Swat1_1", MP.."Swat1_2", MP.."Swat1_3", MP.."Swat1_4", MP.."Swat1_5" },
									{ MP.."Swat2_1", MP.."Swat2_2", MP.."Swat2_3", MP.."Swat2_4", MP.."Swat2_5", MP.."Swat2_6" } }

	HELIPAD_MEMBER_NAMES = { MP.."Heli_M01", MP.."Heli_M02", MP.."Heli_M03", MP.."Heli_M04" }

	SWAT_HELI_DROPOFF_SQUAD_MEMBERS = { MP.."SH_M01", MP.."SH_M02", MP.."SH_M03" }
	SWAT_HELI_DROPOFF_PILOT = MP.."SH_Pilot"

	SWAT_HELI_SEATING = { SWAT_HELI_DROPOFF_PILOT,
								 SWAT_HELI_DROPOFF_SQUAD_MEMBERS[1], SWAT_HELI_DROPOFF_SQUAD_MEMBERS[2], SWAT_HELI_DROPOFF_SQUAD_MEMBERS[3] }

	SWAT_HELI = MP.."Swat_Heli"

	SWAT_HELI_DROPOFF_PATH = MP.."Swat_Heli_Dropoff_Path"
	SWAT_HELI_RETURN_PATH = MP.."Swat_Heli_Return_Path"

-- Floor triggers
	FLOOR_PREFIX = MP.."Floor"
	FLOOR_END_SINGLE_DIGIT_PREFIX = "_0"
	FLOOR_END_DOUBLE_DIGIT_PREFIX = "_"
	FLOOR1_TRIGGER_COUNT = 0
	FLOOR2_TRIGGER_COUNT = 2
	FLOOR3_TRIGGER_COUNT = 2
	FLOOR4_TRIGGER_COUNT = 1
	FLOOR5_TRIGGER_COUNT = 1
	FLOOR_TRIGGER_COUNTS = { FLOOR1_TRIGGER_COUNT, FLOOR2_TRIGGER_COUNT, FLOOR3_TRIGGER_COUNT, FLOOR4_TRIGGER_COUNT, FLOOR5_TRIGGER_COUNT }
	CAMERA_ROOM_FLOOR = 4

	STATION_AREA_TRIGGERS = { MP.."Station_Area_01", MP.."Station_Area_02", MP.."Station_Area_03" }
	HIDE_WEAPONS_TRIGGER_NAME = MP.."Hide_Weapons_Trigger"

	PARKING_SPOT_TRIGGER = MP.."Parking_Spot"

	STATION_DOORS = { MP.."Station_Front_Door01", MP.."Station_Front_Door02",
							MP.."Station_Helipad_Door01", MP.."Station_Helipad_Door02" }

	HELIPAD_DOORS = { STATION_DOORS[3], STATION_DOORS[4] }

	DOORS_TO_HIDE = { MP.."Door_To_Hide01", MP.."Door_To_Hide02", MP.."Door_To_Hide03",
							MP.."Door_To_Hide04" }

	-- Cutscenes
	CT_INTRO = "ss10-01"
	CT_OUTRO = "ss10-02"
-- Sound
	-- Persona overrides
	SHAUNDI_PERSONA_OVERRIDES =
	{
	{ "hostage - barters", "SOS10_SHAUNDI_BARTER" },
	{ "misc - respond to player taunt w/taunt", "SOS10_SHAUNDI_TAUNT" },
	{ "observe - praised by pc", "SOS10_SHAUNDI_PRAISED" },
	{ "threat - damage received (firearm)", "SOS10_SHAUNDI_TAKEDAM" },
	{ "threat - damage received (melee)", "SOS10_SHAUNDI_TAKEDAM" }
	}

	-- Lines/Dialog Stream
	DON_DISGUISE_DIALOG_STREAM =
	{
	{ "SOS10_DISGUISE_L1", SHAUNDI_REPAIR_VARIANT_NAME, 0 },
	{ "PLAYER_SOS10_DISGUISE_L2", LOCAL_PLAYER, 0 },
	{ "SOS10_DISGUISE_L3", SHAUNDI_REPAIR_VARIANT_NAME, 0 },
	{ "PLAYER_SOS10_DISGUISE_L4", LOCAL_PLAYER, 0 },
	{ "SOS10_DISGUISE_L5", SHAUNDI_REPAIR_VARIANT_NAME, 0 }
	}

	CHECKIN_DIALOG_STREAM = 
	{
	{ "SOS10_FIX_L1", RECEPTIONIST_NAME, 0 },
	{ "PLAYER_SOS10_FIX_L2", LOCAL_PLAYER, 0 },
	{ "SOS10_FIX_L3", SHAUNDI_REPAIR_VARIANT_NAME, 0 },
	{ "SOS10_FIX_L4", RECEPTIONIST_NAME, 0 },
	}

	PIERCE_STATUS_UPDATE_DIALOG_STREAM =
	{
	{ "SOS10_END_L1", nil, 0 },
	{ "PLAYER_SOS10_END_L2", LOCAL_PLAYER, 0 }
	}

	REPAIRMAN_ATTACKED_LINE = "REPAIRMAN_SOS10_DAMAGE_01"

	SHAUNDI_MISSION_START_LINE = "SHAUNDI_SOS10_START_01"
	SHAUNDI_NEAR_STATION_LINE = "SHAUNDI_SOS10_NEAR_STATION_01"
	SHAUNDI_PAST_DESK_LINE = "SOS10_SHAUNDI_ARRIVE_1"
	SHAUNDI_START_HACKING_LINE = "SOS10_SHAUNDI_STARTHACK_1"
	SHAUNDI_HACK20P_LINE = "SOS10_SHAUNDI_HACK20_1"
	SHAUNDI_HACK50P_LINE = "SOS10_SHAUNDI_HACK50_1"
	SHAUNDI_HACK75P_LINE = "SOS10_SHAUNDI_HACK75_1"
	SHAUNDI_HACK100P_LINE = "SOS10_SHAUNDI_HACK100_1"

	DONE_HACKING_LINE_ONE = "SOS10_DONE_L1"
	DONE_HACKING_LINE_TWO = "SOS10_DONE_L2"
	
	SHAUNDI_GO_TO_ROOF_LINE = "SOS10_SHAUNDI_GOROOF_1"

	-- Sound effects
	CHANGE_CLOTHES_SOUND = "SFX_MISSION_SOS10_CLOTHESCHANGE"

-- Distances
	REPAIR_VAN_CHASE_DISTANCE_METERS = 50
	RECEPTIONIST_CHECKIN_TRIGGER_TO_ENTRANCE_METERS = 20
	RECEPTIONIST_CHAIR_TRIGGER_DISTANCE_METERS = .10
	FOLLOWER_HQ_WIN_DISTANCE_METERS = 30

	REPAIR_VAN_DESIRED_SPEED_MPS = 25
	REPAIR_VAN_FLEE_SPEED_MPS = 55
	SHAUNDI_ABANDONED_DISTANCE_METERS = 40

-- Percents and multipliers
	REPAIR_VAN_DISABLED_DAMAGE_PERCENT = 0.7
	REPAIR_VAN_PERCENT_DAMAGE_TO_DISABLE = 1.0 - REPAIR_VAN_DISABLED_DAMAGE_PERCENT
	VAN_HP_MULTIPLIER = 4.0

-- Time values
	MISSION_START_FADE_TIME_SECONDS = 2.0

	TIME_TO_REACH_VAN_MS = 180000
	TIME_TO_CATCH_UP_WITH_VAN_MS = 30000
	PLAYER_RUSE_DISCOVERED_SECONDS = 30.0
	PLAYER_RUSE_DISCOVERED_CAMERA_ROOM_FLOOR_SECONDS = 2.0

	SWAT_SQUAD_SPAWN_DELAY_TIME_SECONDS = 30
	INITIAL_HACKING_TIME_VALUE_SECONDS = 45
	FINAL_HACKING_TIMER_VALUE_SECONDS = 120
	TOTAL_HACKING_TIME_VALUE_SECONDS = INITIAL_HACKING_TIME_VALUE_SECONDS + FINAL_HACKING_TIMER_VALUE_SECONDS
	SWAT_HELI_GROUP_SPAWN_THREAD_DELAY_SECONDS = 45
	SWITCH_TO_SWAT_SPAWN_TIME_DELAY_SECONDS = 60

	ITEM_CHECK_DELAY_SECONDS = 1.0

	CLOTHES_SWITCH_FADE_TIME_SECONDS = 2.0
	PIERCE_STATUS_UPDATE_DELAY_SECONDS = 7.0
	TIME_BEFORE_SHAUNDI_ABANDONED_SECONDS = 30

-- Constant values and counts
	MISSION_POST_ALARM_NOTORIETY = 4
	FRONTAL_ASSAULT_NOTORIETY = 3
	PER_FLOOR_OFFICERS_REMAINING_THRESHOLD = { 2, 2, 2, 1, 2 }
	OFFICERS_REMAINING_THRESHOLD = 2
	OFFICERS_FOR_WAVE_ATTACK_THRESHOLD = 2
	NUM_HACKING_TIME_DIVISIONS = 40
	REPAIR_VAN_SEAT_COUNT = 4

-- Global variables
	Repair_van_follow_path_thread_handle = -1
	Initial_van_hp = 0
	Floor1_trigger_names = {}
	Floor2_trigger_names = {}
	Floor3_trigger_names = {}
	Floor4_trigger_names = {}
	Floor5_trigger_names = {}
	Floor_trigger_names = { Floor1_trigger_names, Floor2_trigger_names, Floor3_trigger_names,
									Floor4_trigger_names, Floor5_trigger_names }
	Cur_floor_index = 1
	State = MS_INITIAL
	Player_ruse_thread_handle = INVALID_THREAD_HANDLE
	Track_weapon_thread_handle = INVALID_THREAD_HANDLE
	Tracking_Shaundi_in_vehicle_thread_handle = INVALID_THREAD_HANDLE
	Shaundi_abandoned_thread = INVALID_THREAD_HANDLE
	Mark_destination_thread_handle = INVALID_THREAD_HANDLE

	Alarm_set_off = false
	Signing_in = false

	Shaundi_has_started_hacking = false
	Shaundi_hacking = false

	Wave_attack_started = false
	Police_wave_spawn_enabled = true

	Swat_wave_spawn_enabled = false
	Helipad_doors_locked = false

	Current_wave_spawn_location = -1
	Num_wave_members_remaining = -1
	Alarm_handle = -1
	Num_waves_defeated = 0

	Follower_distance_check_threads = {}
	Players_in_repair_van = { [LOCAL_PLAYER] = false, [REMOTE_PLAYER] = false }
	Players_reached_stairs = { [LOCAL_PLAYER] = false, [REMOTE_PLAYER] = false }
	Players_in_area = { { [LOCAL_PLAYER] = false, [REMOTE_PLAYER] = false },
							  { [LOCAL_PLAYER] = false, [REMOTE_PLAYER] = false },
							  { [LOCAL_PLAYER] = false, [REMOTE_PLAYER] = false } }

	Floor_officers_remaining = { sizeof_table( FLOOR_OFFICER_NAMES[1] ), sizeof_table( FLOOR_OFFICER_NAMES[2] ),
										  sizeof_table( FLOOR_OFFICER_NAMES[3] ), sizeof_table( FLOOR_OFFICER_NAMES[4] ),
										  sizeof_table( FLOOR_OFFICER_NAMES[5] ) }

	Threshold_triggered = { false, false, false, false, false }

	Total_officers_remaining = Floor_officers_remaining[1] + Floor_officers_remaining[2] +
										Floor_officers_remaining[3] + Floor_officers_remaining[4] +
										Floor_officers_remaining[5];

-- These callbacks are used for a sequence in which officers on each floor attack
-- in sequence, starting with the fourth and fifth floors and proceeding down to
-- the first floor.
--
function ss10_floor5_officer_died()
	ss10_floor_officer_died( 5 )
end

function ss10_floor4_officer_died()
	local cascade_to_next_floor = true
	ss10_floor_officer_died( 4, cascade_to_next_floor )
end

function ss10_floor3_officer_died()
	local cascade_to_next_floor = true
	ss10_floor_officer_died( 3, cascade_to_next_floor )
end

function ss10_floor2_officer_died()
	local cascade_to_next_floor = true
	ss10_floor_officer_died( 2, cascade_to_next_floor )
end

function ss10_floor1_officer_died()
	ss10_floor_officer_died( 1 )
end

-- Sets up the station interior triggers to track whether the
-- players are in the station or not.
--
function ss10_setup_station_area_tracking()
	for index, name in pairs( STATION_AREA_TRIGGERS ) do
		trigger_enable( name, true )
		on_trigger( "ss10_entered_area_0"..index, name )
		on_trigger_exit( "ss10_left_area_0"..index, name )
	end
end

-- Returns true if the specified player is in the police station,
-- false otherwise.
--
function ss10_player_in_station( player_name )
	if ( Players_in_area[1][player_name] or
		  Players_in_area[2][player_name] or
		  Players_in_area[3][player_name] ) then
		return true
	end
	return false
end

function ss10_no_players_in_station()
	if ( ss10_player_in_station( LOCAL_PLAYER ) == false ) then
		if ( coop_is_active() ) then
			if ( ss10_player_in_station( REMOTE_PLAYER ) == false ) then
				return true
			end
		else
			return true
		end
	end

	return false
end

function ss10_maybe_entered_station()
	notoriety_force_no_spawn( POLICE_GANG, true )
	notoriety_force_no_spawn( ULTOR_GANG, true )
end

function ss10_maybe_left_station()
	if ( ss10_no_players_in_station() ) then
		notoriety_force_no_spawn( POLICE_GANG, false )
		notoriety_force_no_spawn( ULTOR_GANG, false )
	end
end

-- Tracking the players entering the areas in the police station
function ss10_entered_area_01( triggerer_name )
	if ( ss10_player_in_station( triggerer_name ) == false ) then
		mission_debug( triggerer_name.." entered station" )
	end
	ss10_maybe_entered_station()

	Players_in_area[1][triggerer_name] = true
end

function ss10_entered_area_02( triggerer_name )
	if ( ss10_player_in_station( triggerer_name ) == false ) then
		mission_debug( triggerer_name.." entered station" )
	end
	ss10_maybe_entered_station()

	Players_in_area[2][triggerer_name] = true
end

function ss10_entered_area_03( triggerer_name )
	if ( ss10_player_in_station( triggerer_name ) == false ) then
		mission_debug( triggerer_name.." entered station" )
	end
	ss10_maybe_entered_station()

	Players_in_area[3][triggerer_name] = true
end

-- Tracking the players leaving the areas in the police station
function ss10_left_area_01( triggerer_name )
	Players_in_area[1][triggerer_name] = false
	ss10_maybe_left_station()

	if ( ss10_player_in_station( triggerer_name ) == false ) then
		mission_debug( triggerer_name.." left station" )
	end
end

function ss10_left_area_02( triggerer_name )
	Players_in_area[2][triggerer_name] = false
	ss10_maybe_left_station()

	if ( ss10_player_in_station( triggerer_name ) == false ) then
		mission_debug( triggerer_name.." left station" )
	end
end

function ss10_left_area_03( triggerer_name )
	Players_in_area[3][triggerer_name] = false
	ss10_maybe_left_station()

	if ( ss10_player_in_station( triggerer_name ) == false ) then
		mission_debug( triggerer_name.." left station" )
	end
end

-- Called for when an officer belonging to a particular floor dies.
--
-- floor_index: Index of the floor that this officer belongs to.
-- trigger_next_floor: True if this officer dying could potentially trigger
--							the next floor to attack.
--
function ss10_floor_officer_died( floor_index, trigger_next_floor )

	local time_seconds = 5
	local debug_string = "Floor "..floor_index.." attacker died."

	if ( Alarm_set_off == false ) then
		ss10_police_station_alarm()
		debug_string = debug_string.." Ruse discovered."
		time_seconds = time_seconds + 5
	end

	if ( trigger_next_floor == nil ) then
		trigger_next_floor = false
	end

	Floor_officers_remaining[floor_index] = Floor_officers_remaining[floor_index] - 1
	Total_officers_remaining = Total_officers_remaining - 1
	debug_string = debug_string.." "..Floor_officers_remaining[floor_index].." remain."

	-- If enough of this floor dies, have the next floor help ( if we're supposed to )
	if ( Floor_officers_remaining[floor_index] <= PER_FLOOR_OFFICERS_REMAINING_THRESHOLD[floor_index] and
		  Threshold_triggered[floor_index] == false and
		  trigger_next_floor == true ) then
	  Threshold_triggered[floor_index] = true
	  ss10_floor_attack( floor_index - 1 )
	  debug_string = debug_string.." Next floor attacking."
	  time_seconds = time_seconds + 5

	  -- Special case for the fourth floor - remove leashes on fifth floor members
	  if ( floor_index == 4 ) then
		  if ( Floor_officers_remaining[floor_index] == 1 ) then
			  for index, name in pairs( FLOOR5_OFFICER_NAMES ) do
				  npc_leash_remove( name )
			  end
		  end
	  end
	-- Once the first floor is killed, have the helipad people attack
	elseif ( floor_index == 1 and
				Floor_officers_remaining[floor_index] <= PER_FLOOR_OFFICERS_REMAINING_THRESHOLD[floor_index] and
				Threshold_triggered[floor_index] == false ) then

		Threshold_triggered[floor_index] = true
		ss10_maybe_open_helipad_doors()

		for index, member in pairs( HELIPAD_MEMBER_NAMES ) do
			attack_closest_player( member )
		end
	end

	-- If few enough officers remain, start the wave spawning for reinforcements
	if ( Total_officers_remaining < OFFICERS_FOR_WAVE_ATTACK_THRESHOLD and Wave_attack_started == false ) then
		ss10_spawn_first_wave()
	  debug_string = debug_string.." Wave spawn started."
	  time_seconds = time_seconds + 5
	end

	mission_debug( debug_string, time_seconds )
end

-- Opens the helipad's doors if they're locked.
function ss10_maybe_open_helipad_doors()
	if ( Helipad_doors_locked ) then
		ss10_lock_helipad_doors( false )
		for index, name in pairs( HELIPAD_DOORS ) do
			door_open( name )
		end
	end
end

-- Causes all of the officers from the specified floor to attack
-- the player.
--
function ss10_floor_attack( floor_index )
	for index, name in pairs( FLOOR_OFFICER_NAMES[floor_index] ) do
		local distance, player_name = get_dist_closest_player_to_object( name )
		attack_safe( name, player_name, false )
	end
end

-- Starts the ambient attack chain, which has floor of attacks successively
-- come and attack until the player reaches the end of the chain and the
-- wave spawn attackers start spawning.
-- 
function ss10_begin_ambient_attack()
	ss10_floor_attack(5)
	ss10_floor_attack(4)
end

-- Clear the death callbacks for all members belonging to the specified floor.
--
function ss10_clear_callbacks( floor_index )
	for name_index, name in pairs( FLOOR_OFFICER_NAMES[floor_index] ) do
		if ( character_is_dead( name ) == false ) then
			on_death( "", name )
		end
	end
end

-- Sets up all the "on death" callbacks for all of the officers in the police station.
--
function ss10_setup_ambient_officer_callbacks()
	for floor_index, name_list in pairs( FLOOR_OFFICER_NAMES ) do
		for name_index, name in pairs( name_list ) do
			on_death( "ss10_floor"..floor_index.."_officer_died", name )
		end
	end
end

function ss10_start( checkpoint_name, is_restart )
	-- Start trigger is hit...the activate button was hit
	set_mission_author("Mark Gabby & Brad Johnson")

	action_nodes_restrict_spawning( true )

	-- Prevent the player from seeing or interacting with things that are being loaded
	mission_start_fade_out()

	--Disable PB Gym Trigger for cutscene
	trigger_enable ( CRIB_PB_TELE_GYM_OUT, false )

	if ( checkpoint_name == MISSION_START_CHECKPOINT ) then
		if ( is_restart == false ) then
			cutscene_play( CT_INTRO, { SHAUNDI_GROUP_NAME, HELI_SQUAD_GROUP_NAME, STARTER_VEHICLE_GROUP_NAME, STARTER_VEHICLE_COOP_GROUP_NAME }, { START_NAVPOINT_NAME, START_NAVPOINT_NAME_COOP_PLAYER }, false )
		else
			group_create_hidden( SHAUNDI_GROUP_NAME, true )
			group_create_hidden( HELI_SQUAD_GROUP_NAME, true )
			group_create_hidden( STARTER_VEHICLE_GROUP_NAME, true )
			group_create_hidden( STARTER_VEHICLE_COOP_GROUP_NAME, true )
			teleport_coop( START_NAVPOINT_NAME, START_NAVPOINT_NAME_COOP_PLAYER )
		end

		group_show( SHAUNDI_GROUP_NAME )
		group_show( HELI_SQUAD_GROUP_NAME )
		group_show( STARTER_VEHICLE_GROUP_NAME )
		if ( coop_is_active() ) then
			group_show( STARTER_VEHICLE_COOP_GROUP_NAME )
		end
	end

	local next_state = MS_FIND_REPAIRMEN

	if ( checkpoint_name == MISSION_START_CHECKPOINT ) then
		group_create_hidden( SHAUNDI_REPAIR_VARIANT_GROUP_NAME )

		for index, override in pairs( SHAUNDI_PERSONA_OVERRIDES ) do
			persona_override_character_start( SHAUNDI_NAME, override[1], override[2] )
			persona_override_character_start( SHAUNDI_REPAIR_VARIANT_NAME, override[1], override[2] )
		end

		party_add( SHAUNDI_NAME, LOCAL_PLAYER )
	elseif ( checkpoint_name == CP_PARKED_VAN_AT_STATION ) then
		customization_outfit_wear( REPAIR_OUTFIT_NAME, 0, SYNC_LOCAL )
		if ( coop_is_active() ) then
			customization_outfit_wear( REPAIR_OUTFIT_NAME, 0, SYNC_REMOTE )
		end
		trigger_type_enable("clothing store", false)
		trigger_type_enable("crib clothing", false)
		ss10_create_and_setup_police_station_groups()

		if ( group_is_loaded( SHAUNDI_REPAIR_VARIANT_GROUP_NAME ) == false ) then
			group_create( SHAUNDI_REPAIR_VARIANT_GROUP_NAME, true )
		end
		group_create( HELI_SQUAD_GROUP_NAME, true )
		ss10_setup_shaundi_repair_variant()
		party_add( SHAUNDI_REPAIR_VARIANT_NAME, LOCAL_PLAYER )
		on_dismiss( "ss10_shaundi_dismissed", SHAUNDI_REPAIR_VARIANT_NAME )
		on_death( "ss10_shaundi_follower_died", SHAUNDI_REPAIR_VARIANT_NAME )

		next_state = MS_PARKED_VAN_AT_STATION
	end

	ss10_lock_station_doors()

	-- Loading is done - enable player control and visuals
	mission_start_fade_in()

	-- Setup the mission for hijacking mode
	ss10_switch_state( next_state )
end

function ss10_lock_station_doors( lock )
	if ( lock == nil ) then
		lock = true
	end

	for door_index, door_name in pairs( STATION_DOORS ) do
		door_lock( door_name, lock )
	end
end

function ss10_lock_helipad_doors( lock )
	if ( lock == nil ) then
		lock = true
	end
	Helipad_doors_locked = lock

	for door_index, door_name in pairs( HELIPAD_DOORS ) do
		door_lock( door_name, lock )
	end
end

-- Called when the player gets near the repair van.
--
function ss10_reached_repair_van_area( triggerer_name, trigger_name )
	trigger_enable( trigger_name, false )

	-- Make the repair van start following a path
	Repair_van_follow_path_thread_handle = thread_new( "ss10_repair_van_follow_path" )
end

function ss10_maybe_repairman_flee()
	-- Have the repair man flee, but only if he's alive
	if ( character_is_dead( REPAIR_MAN_NAME ) == false ) then
		if ( character_is_in_vehicle( REPAIR_MAN_NAME ) ) then
			vehicle_exit( REPAIR_MAN_NAME )
			delay( 0 )
		end
		while ( not character_is_ready( REPAIR_MAN_NAME ) ) do
			delay( 0 )
		end
		local distance = 0
		local player_name = nil
		distance, player_name = get_dist_closest_player_to_object( REPAIR_MAN_NAME )
		flee( REPAIR_MAN_NAME, player_name, false )
	end
end

function ss10_parked_at_station( triggerer_name, trigger_name )
	if ( character_is_in_vehicle( triggerer_name, REPAIR_VAN_NAME ) ) then
		trigger_enable( trigger_name, false )

		mission_set_checkpoint( CP_PARKED_VAN_AT_STATION )
		ss10_switch_state( MS_PARKED_VAN_AT_STATION )
	else
		mission_help_table_nag( VAN_REQUIRED )
	end
end

-- Switches to a new state. All the state change code should be here if possible, not spread
-- out in various trigger callbacks.
--
-- new_state: The new state to switch to.
-- actor_name: MAY BE nil. The name of the actor that triggered the state change.
--				 Varies based on the state.
-- extra_data: MAY BE nil. Extra data, based on the state.
function ss10_switch_state( new_state, actor_name, extra_data )
	-- Setup the "Find the Repairmen" state where the player is given
	-- one minute to find the repair van.
	if ( new_state == MS_FIND_REPAIRMEN ) then
		-- Create the repair van
		ss10_create_repair_van_group()
		waypoint_add( REPAIR_VAN_NAME, SYNC_ALL )

		-- Set up a thread that causes the van to start pathing when the player gets close enough
		trigger_enable( REPAIR_VAN_AREA_TRIGGER, true )
		vehicle_speed_override( REPAIR_VAN_NAME, 0 )
		on_trigger( "ss10_reached_repair_van_area", REPAIR_VAN_AREA_TRIGGER )

		-- Add a timer to reach the repair van and objectives
		audio_play_for_character( SHAUNDI_MISSION_START_LINE, SHAUNDI_NAME, "voice", false, true )
		mission_help_table( FIND_REPAIRMEN )
		--objective_text(0, FIND_REPAIRMEN )
		hud_timer_set(0, TIME_TO_REACH_VAN_MS, "ss10_failed_to_catch_van" )

		-- Add callbacks for the distance
		distance_display_on( REPAIR_VAN_NAME, 0, REPAIR_VAN_CHASE_DISTANCE_METERS, 0, REPAIR_VAN_CHASE_DISTANCE_METERS, SYNC_ALL )
		on_tailing_good( "ss10_reached_van_initial" )
		marker_add_vehicle( REPAIR_VAN_NAME, MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL, SYNC_ALL )

		-- Add callbacks for the correct behavior if the van is destroyed
		-- or the driver is killed.
		on_vehicle_destroyed( "ss10_van_destroyed", REPAIR_VAN_NAME )
		on_damage( "ss10_van_disabled", REPAIR_VAN_NAME, REPAIR_VAN_DISABLED_DAMAGE_PERCENT )
		on_death( "ss10_van_disabled", REPAIR_MAN_NAME )
		set_unjackable_flag( REPAIR_VAN_NAME, true )

		-- Add a callback for the player claiming the van
		on_vehicle_enter( "ss10_entered_van", REPAIR_VAN_NAME )
		on_vehicle_exit( "ss10_exited_van", REPAIR_VAN_NAME )

		on_dismiss( "ss10_shaundi_dismissed", SHAUNDI_NAME )
		on_death( "ss10_shaundi_follower_died", SHAUNDI_NAME )

		-- Update the damage and collision callbacks
		vehicle_disable_chase( REPAIR_VAN_NAME, true )
		vehicle_disable_flee( REPAIR_VAN_NAME, true )
		on_take_damage( "ss10_van_damaged_initial", REPAIR_VAN_NAME )
		on_collision( "ss10_van_damaged_initial", REPAIR_VAN_NAME ) 

	-- Setup the "Hijack the Van" state where the player must disable the
	-- repairmen's van
	-- "extra_data" in this state is set to false if the van is still out-of-range
	-- when this is called.
	elseif ( new_state == MS_HIJACK_REPAIR_VAN ) then
		-- Give the player a prompt and update the objective
		local in_range = true
		if ( extra_data == false ) then
			in_range = extra_data
		end
		if ( in_range ) then
			mission_help_table( HIJACK_VAN )
		end

		-- Update the distance callbacks
		on_tailing_good( "ss10_good_distance" )
		on_tailing_too_far( "ss10_van_escaping" )

		-- Stop the "find the repairmen" timer
		hud_timer_stop(0)

		-- If we're in range of the van, have the HP bar show up
		if ( in_range ) then
			ss10_initialize_hud_bar()
			ss10_update_van_hp_hud_bar()
		-- Otherwise, the van is getting away!
		else
			ss10_van_escaping()
		end
	-- State for the repair van being too far away from the player
	elseif ( new_state == MS_REPAIRMEN_ESCAPING ) then
		-- Let the player know he has to catch up to the repairment again
		mission_help_table( CATCH_UP_TO_VAN )

		-- Add a timer - if he doesn't catch up soon enough, he fails
		hud_timer_set(0, TIME_TO_CATCH_UP_WITH_VAN_MS, "ss10_failed_to_catch_van" )

		-- Remove the damage bar temporarily.
		hud_bar_off( 0 )
	-- State for the player reaching the repair van again after reaching it
	-- and then falling back too far
	elseif ( new_state == MS_REACHED_REPAIRMEN_AGAIN ) then

		-- Stop the "he's getting away" failure time 
		hud_timer_stop(0)

		-- Re-add the hud bar and update it
		ss10_initialize_hud_bar()
		ss10_update_van_hp_hud_bar()
	-- State for the repair van being completely disabled, and ready to be
	-- obtained by the player.
	elseif ( new_state == MS_VAN_DISABLED ) then
		-- Stop all the HUD stuff, which is no longer necessary.
		mission_debug( "disabling hud bar and timers" )
		hud_timer_stop( 0 )
		hud_bar_off( 0 )
		distance_display_off(SYNC_ALL)

		-- Remove the callbacks which are also unnecessary.
		on_take_damage("", REPAIR_VAN_NAME)
		on_damage( "", REPAIR_VAN_NAME, REPAIR_VAN_DISABLED_DAMAGE_PERCENT )
		on_death( "", REPAIR_MAN_NAME )

		-- Mark the van as something to aquire and
		-- prompt the player to aquire it
		set_unjackable_flag( REPAIR_VAN_NAME, false )
		marker_remove_vehicle( REPAIR_VAN_NAME, SYNC_ALL )
		marker_add_vehicle( REPAIR_VAN_NAME, MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE, SYNC_ALL )
		-- Remove the objective text because the player's no longer time-limited
		--objective_text_clear(0)

		if ( Repair_van_follow_path_thread_handle ~= INVALID_THREAD_HANDLE ) then
			thread_kill( Repair_van_follow_path_thread_handle )
			Repair_van_follow_path_thread_handle = INVALID_THREAD_HANDLE
		end

		thread_new( "ss10_maybe_repairman_flee" )

	-- State for the player getting into the van and having to get to
	-- the police station with it.
	elseif ( new_state == MS_PARK_VAN_AT_STATION ) then
		-- Prevent the players from using clothing stores and clothing customization for the
		-- time being
		trigger_type_enable("clothing store", false)
		trigger_type_enable("crib clothing", false)
		-- Change the player's clothes
		fade_out( CLOTHES_SWITCH_FADE_TIME_SECONDS )
		follower_make_independent( SHAUNDI_NAME, true )
		player_controls_disable( LOCAL_PLAYER )
		if ( coop_is_active() ) then
			player_controls_disable( REMOTE_PLAYER )
		end
		vehicle_stop( REPAIR_VAN_NAME )
		delay( CLOTHES_SWITCH_FADE_TIME_SECONDS )

		spawning_vehicles( false )
		spawning_vehicles( true )
		spawning_pedestrians( false )
		spawning_pedestrians( true )

		on_dismiss( "", SHAUNDI_NAME )
		on_death( "", SHAUNDI_NAME )
		group_destroy( SHAUNDI_GROUP_NAME )

		-- Clear notoriety - you're in disguise!
		notoriety_set( POLICE_GANG, 0 )
		group_show( SHAUNDI_REPAIR_VARIANT_GROUP_NAME )
		party_add( SHAUNDI_REPAIR_VARIANT_NAME, LOCAL_PLAYER )
		ss10_setup_shaundi_repair_variant()

		on_dismiss( "ss10_shaundi_dismissed", SHAUNDI_REPAIR_VARIANT_NAME )
		on_death( "ss10_shaundi_follower_died", SHAUNDI_REPAIR_VARIANT_NAME )

		vehicle_evacuate( REPAIR_VAN_NAME )
		repeat
			thread_yield()
		until ( character_is_in_vehicle( SHAUNDI_NAME ) == false and
				  character_is_in_vehicle( LOCAL_PLAYER ) == false )
		if ( coop_is_active() ) then
			repeat
				thread_yield()
			until ( character_is_in_vehicle( REMOTE_PLAYER ) == false )
		end

		vehicle_enter_teleport( LOCAL_PLAYER, REPAIR_VAN_NAME, 0 )
		if ( coop_is_active() ) then
			vehicle_enter_teleport( REMOTE_PLAYER, REPAIR_VAN_NAME, 2 )
		end

		customization_outfit_wear( REPAIR_OUTFIT_NAME, 0, SYNC_LOCAL )
		if ( coop_is_active() ) then
			customization_outfit_wear( REPAIR_OUTFIT_NAME, 0, SYNC_REMOTE )
		end
		-- Play the clothes change sound blocking
		audio_play( CHANGE_CLOTHES_SOUND, "foley", true, true)

		player_controls_enable( LOCAL_PLAYER )
		if ( coop_is_active() ) then
			player_controls_enable( REMOTE_PLAYER )
		end
		fade_in( CLOTHES_SWITCH_FADE_TIME_SECONDS )
		fade_in_block()

		thread_new("ss10_don_disguise_conversation" )

		-- Change callbacks to prevent both a green and teal marker on the map at once
		on_vehicle_enter( "ss10_entered_van_during_drive_to_station", REPAIR_VAN_NAME )
		on_vehicle_exit( "ss10_exited_van_during_drive_to_station", REPAIR_VAN_NAME )

		ss10_create_and_setup_police_station_groups()
		--on_mover_dislodged( "receptionist_chair_moved", RECEPTIONIST_CHAIR_NAME, RECEPTIONIST_CHAIR_TRIGGER_DISTANCE_METERS )

		mission_help_table( PARK_VAN_AT_STATION )

		-- We can mark the parking spot and remove the marker for the van because all players are in the van when
		-- this is called.
		trigger_enable( PARKING_SPOT_TRIGGER, true )
		marker_add_trigger( PARKING_SPOT_TRIGGER, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION, SYNC_ALL )
		marker_remove_vehicle( REPAIR_VAN_NAME, SYNC_ALL )
		on_trigger( "ss10_parked_at_station", PARKING_SPOT_TRIGGER )
		waypoint_add( PARKING_SPOT_TRIGGER, SYNC_ALL )

	elseif ( new_state == MS_PARKED_VAN_AT_STATION ) then
		-- The repair van is no longer mission-critical.
		on_vehicle_destroyed( "", REPAIR_VAN_NAME )
		on_vehicle_enter( "", REPAIR_VAN_NAME )
		on_vehicle_exit( "", REPAIR_VAN_NAME )
		marker_remove_vehicle( REPAIR_VAN_NAME, SYNC_ALL )

		-- Unlock the station's doors
		ss10_lock_station_doors( false )

		-- Keep the helipad doors locked
		ss10_lock_helipad_doors()

		-- Lock and hide doors that we don't want to be in the way
		for door_index, door_name in pairs( DOORS_TO_HIDE ) do
			door_lock( door_name, true )
			mesh_mover_hide( door_name )
		end

		-- Add death tracking for receptionist
		on_death( "ss10_receptionist_died", RECEPTIONIST_NAME )
		on_notoriety_event( "ss10_notoriety_event_local", LOCAL_PLAYER )
		if ( coop_is_active() ) then
			on_notoriety_event( "ss10_notoriety_event_remote", REMOTE_PLAYER )
		end

		mission_help_table( ENTER_THE_STATION )

		trigger_enable( HIDE_WEAPONS_TRIGGER_NAME, true )
		on_trigger( "ss10_hide_weapon_prompt", HIDE_WEAPONS_TRIGGER_NAME )

		trigger_enable( POLICE_STATION_TRIGGER_NAME, true )
		on_trigger( "ss10_reached_police_station", POLICE_STATION_TRIGGER_NAME )
		marker_add_trigger( POLICE_STATION_TRIGGER_NAME, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL )
		waypoint_add( POLICE_STATION_TRIGGER_NAME, SYNC_ALL )

		ss10_setup_station_area_tracking()

	-- In this state, the player must get to the receptionist and check in
	elseif ( new_state == MS_ENTERED_POLICE_STATION ) then

		trigger_enable( POLICE_STATION_TRIGGER_NAME, false )
		marker_remove_trigger( POLICE_STATION_TRIGGER_NAME )

		-- If the player is sane and enters the station without police notoriety,
		-- allow the sneaking to continue
		if ( notoriety_get_decimal( POLICE_GANG ) < 1 ) then
			notoriety_set( POLICE_GANG, 0 )

			-- Tell the player what he should be doing
			mission_help_table( CHECK_IN_AT_DESK )

			-- Add the receptionist trigger
			trigger_enable( RECEPTIONIST_DESK_CHECKIN_TRIGGER_NAME, true )
			marker_add_trigger( RECEPTIONIST_DESK_CHECKIN_TRIGGER_NAME, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL )
			on_trigger( "ss10_sign_in_with_receptionist", RECEPTIONIST_DESK_CHECKIN_TRIGGER_NAME )

			Track_weapon_thread_handle = thread_new( "ss10_track_weapon_equipped" )

			on_weapon_fired( "", LOCAL_PLAYER )
			if ( coop_is_active() ) then
				on_weapon_fired( "", REMOTE_PLAYER )
			end

			trigger_enable( PAST_DESK_TRIGGER_NAME, true )
			on_trigger( "ss10_went_past_desk_before_checking_in", PAST_DESK_TRIGGER_NAME )
			for index, trigger in pairs( MAIN_STATION_ENTRANCE_TRIGGERS ) do
				trigger_enable( trigger, true )
				on_trigger( "ss10_entered_entrance_before_checking_in", trigger )
			end
		-- Deal with insane players by setting off the alarm
		else
			local entered_with_notoriety = true
			ss10_switch_state( MS_RUN_TO_CAMERA_ROOM, nil, entered_with_notoriety )
		end
	-- These states are enabled if the player either checks in or just runs past the desk
	elseif ( new_state == MS_GO_TO_CAMERA_ROOM or new_state == MS_RUN_TO_CAMERA_ROOM  ) then
		if ( new_state == MS_GO_TO_CAMERA_ROOM ) then
			Signing_in = true
		end

		-- Clear on-death callback for receptionist.
		if ( character_is_dead( RECEPTIONIST_NAME ) == false ) then
			on_death( "ss10_police_station_alarm", RECEPTIONIST_NAME )
		end

		if ( extra_data == nil ) then
			extra_data = false
		end
		local entered_with_notoriety = extra_data

		-- The player has checked in, so disable the pre-checkin triggers
		on_weapon_fired( "", LOCAL_PLAYER )
		if ( coop_is_active() ) then
			on_weapon_fired( "", REMOTE_PLAYER )
		end
		trigger_enable( PAST_DESK_TRIGGER_NAME, false )
		for index, trigger in pairs( MAIN_STATION_ENTRANCE_TRIGGERS ) do
			trigger_enable( trigger, false )
		end
		-- No more checking in, regardless of what happens next ...
		marker_remove_trigger( RECEPTIONIST_DESK_CHECKIN_TRIGGER_NAME )
		trigger_enable( RECEPTIONIST_DESK_CHECKIN_TRIGGER_NAME, false )

		if ( new_state == MS_GO_TO_CAMERA_ROOM ) then
			delay( 1 )
			fade_out( 0 )
			-- If we're in coop, make sure that one of the players isn't in a vehicle
			-- before the cutscene plays or ugly things can happen
			if ( coop_is_active() ) then
				vehicle_exit_teleport( LOCAL_PLAYER )
				vehicle_exit_teleport( REMOTE_PLAYER )
			end
			teleport( SHAUNDI_REPAIR_VARIANT_NAME, MP.."CT_Shaundi_Goal" )
			spawning_pedestrians( false )
			spawning_pedestrians( true )

			cutscene_play( "IG_ss10_scene1" )
			group_hide( MP.."Cutscene" )
			group_destroy( MP.."Cutscene" )
			Signing_in = false

			-- Start the "ruse was discovered" timer thread
			Player_ruse_thread_handle = thread_new( "ss10_player_ruse_discovered_timer" )
		end
		if ( entered_with_notoriety == false ) then
			-- Let the player know where he's supposed to go
			mission_help_table( HEAD_TO_CAMERA_ROOM )
		end

		-- Add the navpoint for the first stairway to give the player some guidance
		marker_add_navpoint( STAIRWAY_GUIDE_NAVPOINT_NAME, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL )
		-- Add triggers to turn off the guide if the player gets up the stairs
		for index, trigger in pairs( STAIRWAY_TRIGGER_NAMES ) do
			trigger_enable( trigger, true )
			on_trigger( "ss10_reached_stairway", trigger )
		end

		if ( new_state == MS_RUN_TO_CAMERA_ROOM ) then
			-- Assume that the player was doing the ruse
			local was_doing_ruse = true
			-- Unless they entered with notoriety, in which case they didn't
			-- even get that far in the ruse
			if ( entered_with_notoriety ) then
				was_doing_ruse = false
			end
			-- The player gave himself away.
			ss10_police_station_alarm( was_doing_ruse )
		elseif ( new_state == MS_GO_TO_CAMERA_ROOM ) then
			for index, name in pairs( PAST_LOBBY_TRIGGERS ) do
				mission_debug( "set up trigger "..name.." for past lobby" )
				trigger_enable( name, true )
				on_trigger( "ss10_past_lobby_after_checkin", name )
			end
		end
	elseif ( new_state == MS_DEFEND_CAMERA_ROOM ) then	
		distance_display_on( SHAUNDI_REPAIR_VARIANT_NAME, 0, SHAUNDI_ABANDONED_DISTANCE_METERS, 0, SHAUNDI_ABANDONED_DISTANCE_METERS, SYNC_LOCAL )
		on_tailing_good( "ss10_in_range_of_shaundi" )
		on_tailing_too_far( "ss10_out_of_range_of_shaundi" )

		mission_help_table( DEFEND_ROOM )
		delay( 5.0 )


		audio_play_for_character( SHAUNDI_START_HACKING_LINE, SHAUNDI_REPAIR_VARIANT_NAME, "voice", false, true )
		thread_new( "ss10_shaundi_hacking_timer" )

	elseif ( new_state == MS_LEAVE_STATION ) then
		ss10_maybe_open_helipad_doors()

		-- Stop animation
		clear_animation_state( SHAUNDI_REPAIR_VARIANT_NAME )

		-- Prompt the player about the next objective
		audio_play_for_character( DONE_HACKING_LINE_ONE, SHAUNDI_REPAIR_VARIANT_NAME, "voice", false, true)

		-- Have Shaundi play a "pick up the equipment" animation
		-- TODO
		-- Stop crouching
		if crouch_is_crouching( SHAUNDI_REPAIR_VARIANT_NAME ) then
			crouch_stop( SHAUNDI_REPAIR_VARIANT_NAME )
		end

		-- TODO: Play a pickup animation
		audio_play_for_character( DONE_HACKING_LINE_TWO, SHAUNDI_REPAIR_VARIANT_NAME, "voice", false, true)

		-- Have Shaundi follow the player again and
		-- remove special flags
		follower_make_independent( SHAUNDI_REPAIR_VARIANT_NAME, false )
		set_ignore_ai_flag( SHAUNDI_REPAIR_VARIANT_NAME, false )
		character_prevent_flinching( SHAUNDI_REPAIR_VARIANT_NAME, false )
		on_incapacitated( "", SHAUNDI_REPAIR_VARIANT_NAME )
		on_revived( "", SHAUNDI_REPAIR_VARIANT_NAME )
		distance_display_off( SYNC_LOCAL )
		ss10_maybe_kill_shaundi_abandoned_thread()

		npc_dont_auto_equip_or_unequip_weapons( SHAUNDI_REPAIR_VARIANT_NAME, true )
		npc_combat_enable( SHAUNDI_REPAIR_VARIANT_NAME, false )
		set_attack_enemies_flag( SHAUNDI_REPAIR_VARIANT_NAME, false )

		mission_help_table( ESCORT_SHAUNDI )
		marker_add_trigger( STATION_EXIT_TRIGGER_NAMES[1], MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL )
		audio_play_for_character( SHAUNDI_GO_TO_ROOF_LINE, SHAUNDI_REPAIR_VARIANT_NAME, "voice", false, false )

		ss10_setup_exit_station_triggers()

	elseif ( new_state == MS_RETURN_TO_BASE ) then
		mission_help_table( GET_EQUIPMENT_BACK )

		for index, trigger_name in pairs( SAINTS_HQ_TRIGGER_NAMES ) do
			trigger_enable( trigger_name, true )
			on_trigger( "ss10_reached_hq", trigger_name )
		end

		Mark_destination_thread_handle = thread_new( "ss10_update_marked_destination_location" )

		Police_wave_spawn_enabled = false
		Swat_wave_spawn_enabled = false

		trigger_enable( SAINTS_PARKING_LOT_TRIGGER_NAME, true )
		on_trigger( "ss10_reached_hideout_lot", SAINTS_PARKING_LOT_TRIGGER_NAME )

		thread_new( "ss10_pierce_status_update" )
	end

	State = new_state
end

function ss10_update_marked_destination_location()

	-- Returns whether or not the player with Shaundi is in a flying vehicle or not
	local function is_player_in_flying_vehicle()
		local player_vehicle_type = get_char_vehicle_type( LOCAL_PLAYER )
		if ( player_vehicle_type == VT_AIRPLANE or
			  player_vehicle_type == VT_HELICOPTER ) then
			return true
		end
		return false
	end

	-- Find out which trigger to mark right now based on what vehicle the player's in
	local player_was_in_flying_vehicle = is_player_in_flying_vehicle()
	local trigger_to_mark = SAINTS_HQ_TRIGGER_NAMES[GROUND_HQ_TRIGGER_INDEX]
	if ( player_was_in_flying_vehicle ) then
		trigger_to_mark = SAINTS_HQ_TRIGGER_NAMES[AIR_HQ_TRIGGER_INDEX]
	end
	-- Mark it
	waypoint_add( trigger_to_mark, SYNC_ALL )
	marker_add_trigger( trigger_to_mark, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION, SYNC_ALL )

	-- Keep going until the trigger is marked
	while ( true ) do
		-- Find out if the player is in a different vehicle now than they used to be
		local player_is_in_flying_vehicle = is_player_in_flying_vehicle()
		if ( player_was_in_flying_vehicle ~= player_is_in_flying_vehicle ) then

			-- If the vehicle is different, remove the old trigger marker and GPS path and add new ones to the new location
			if ( player_is_in_flying_vehicle ) then
				marker_remove_trigger( SAINTS_HQ_TRIGGER_NAMES[GROUND_HQ_TRIGGER_INDEX] )
				marker_add_trigger( SAINTS_HQ_TRIGGER_NAMES[AIR_HQ_TRIGGER_INDEX], MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION, SYNC_ALL )
				waypoint_add( SAINTS_HQ_TRIGGER_NAMES[AIR_HQ_TRIGGER_INDEX] )
			else
				marker_remove_trigger( SAINTS_HQ_TRIGGER_NAMES[AIR_HQ_TRIGGER_INDEX] )
				marker_add_trigger( SAINTS_HQ_TRIGGER_NAMES[GROUND_HQ_TRIGGER_INDEX], MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION, SYNC_ALL )
				waypoint_add( SAINTS_HQ_TRIGGER_NAMES[GROUND_HQ_TRIGGER_INDEX] )
			end
		end

		player_was_in_flying_vehicle = player_is_in_flying_vehicle
		delay( 1.0 )
	end
end

function ss10_check_for_shaundi_vehicle_enter()
	repeat
		thread_yield()
	until ( character_is_in_vehicle_transation( SHAUNDI_REPAIR_VARIANT_NAME ) or
			  character_is_in_vehicle( SHAUNDI_REPAIR_VARIANT_NAME ) )

	item_drop( PACKAGE_NAME, SHAUNDI_REPAIR_VARIANT_NAME )
	item_hide( PACKAGE_NAME )

	on_incapacitated( "", SHAUNDI_REPAIR_VARIANT_NAME )
	on_revived( "", SHAUNDI_REPAIR_VARIANT_NAME )

	npc_combat_enable( SHAUNDI_REPAIR_VARIANT_NAME, true )
	set_attack_enemies_flag( SHAUNDI_REPAIR_VARIANT_NAME, true )
	character_allow_ragdoll( SHAUNDI_REPAIR_VARIANT_NAME, true )
	npc_dont_auto_equip_or_unequip_weapons( SHAUNDI_REPAIR_VARIANT_NAME, false )
end

function ss10_shaundi_incapacitated_with_package()
	character_allow_ragdoll( SHAUNDI_REPAIR_VARIANT_NAME, true )
	character_ragdoll( SHAUNDI_REPAIR_VARIANT_NAME, -1 )
end

function ss10_shaundi_revived_with_package()
	item_wield( PACKAGE_NAME, SHAUNDI_REPAIR_VARIANT_NAME, false )
end

function ss10_setup_shaundi_repair_variant()
	set_cant_flee_flag( SHAUNDI_REPAIR_VARIANT_NAME, true )
	npc_weapon_pickup_override( SHAUNDI_REPAIR_VARIANT_NAME, false )
	set_attack_enemies_flag( SHAUNDI_REPAIR_VARIANT_NAME, false )
	npc_combat_enable( SHAUNDI_REPAIR_VARIANT_NAME, false )

	character_set_walk_variant( SHAUNDI_REPAIR_VARIANT_NAME, "Walk Hacking" )
	character_set_stand_variant( SHAUNDI_REPAIR_VARIANT_NAME, "Stand Ready Hacking" )
	character_set_run_variant( SHAUNDI_REPAIR_VARIANT_NAME, "Run Hacking" )
end

function ss10_notoriety_event_local()
	ss10_notoriety_event( LOCAL_PLAYER )
end

function ss10_notoriety_event_remote()
	ss10_notoriety_event( REMOTE_PLAYER )
end

function ss10_notoriety_event( player_name )
	mission_debug( "notoriety event" )
	if ( notoriety_get_decimal( POLICE_GANG ) > 0 ) then
		if ( ss10_player_in_station( player_name ) ) then
			ss10_police_station_alarm()
		end
	end
end


function ss10_don_disguise_conversation()
	audio_play_conversation( DON_DISGUISE_DIALOG_STREAM, NOT_CALL )
end

function ss10_reached_hideout_lot( triggerer_name, trigger_name )
	trigger_enable( trigger_name, false )

	notoriety_force_no_spawn( POLICE_GANG, true )
	notoriety_force_no_spawn( ULTOR_GANG, true )
end

function ss10_create_and_setup_police_station_groups()
	group_create( RECEPTIONIST_GROUP_NAME, true )
	for index, name in pairs( FLOOR_GROUP_NAMES ) do
		group_create( name, true )
	end

	ss10_setup_ambient_officer_callbacks()
end

-- Mostly deals with the case of players acting evilly and killing the receptionist,
-- though she might also die in other ways.
--
function ss10_receptionist_died( victim, attacker )
	mission_debug( "receptionist died" )
	ss10_switch_state( MS_RUN_TO_CAMERA_ROOM )
end

function ss10_pierce_status_update()
	delay( PIERCE_STATUS_UPDATE_DELAY_SECONDS )
	audio_play_conversation( PIERCE_STATUS_UPDATE_DIALOG_STREAM, INCOMING_CALL )
end

function ss10_past_lobby_after_checkin()
	mission_debug( "past lobby after checkin called" )
	for index, name in pairs( PAST_LOBBY_TRIGGERS ) do
		trigger_enable( name, false )
	end

	-- Have Shaundi warn the player there's not much time, but only if the
	-- cover hasn't been blown for some reason.
	if ( Alarm_set_off == false and notoriety_get( POLICE_GANG ) == 0 ) then
		audio_play_for_character( SHAUNDI_PAST_DESK_LINE, SHAUNDI_REPAIR_VARIANT_NAME, "voice", false, true )
	end
end

function ss10_shaundi_dismissed()
	-- End the mission since Shaundi was dismissed
	mission_end_failure( MISSION_NAME, SHAUNDI_ABANDONED )
end

function ss10_shaundi_follower_died()
	-- End the mission since Shaundi died
	mission_end_failure( MISSION_NAME, SHAUNDI_DIED )
end

-- This function delays until both the local player and Shaundi are in a vehicle.
-- At this point, it calls the "Left station" function.
--
function ss10_delay_until_shaundi_and_player_enter_escape_vehicle()
	-- Wait until both the local player and Shaundi are in an escape vehicle
	-- before continuing
	while ( character_is_in_vehicle( SHAUNDI_REPAIR_VARIANT_NAME ) == false or
			  character_is_in_vehicle( LOCAL_PLAYER ) == false ) do
		delay( 1 )
	end

	ss10_left_station()
end

function ss10_player_entered_vehicle_leaving_station()
	if ( Tracking_Shaundi_in_vehicle_thread_handle == INVALID_THREAD_HANDLE ) then
		Tracking_Shaundi_in_vehicle_thread_handle = thread_new( "ss10_delay_until_shaundi_and_player_enter_escape_vehicle" )
	end
end

function ss10_setup_exit_station_triggers()
	on_vehicle_enter( "ss10_player_entered_vehicle_leaving_station", POLICE_STATION_HELICOPTER )
	on_vehicle_enter( "ss10_player_entered_vehicle_leaving_station", REPAIR_VAN_NAME )
	on_vehicle_enter( "ss10_player_entered_vehicle_leaving_station", LOCAL_PLAYER )

	-- Add callbacks for exiting the station
	for index, trigger in pairs( STATION_EXIT_TRIGGER_NAMES ) do
		trigger_enable( trigger, true )
		on_trigger( "ss10_left_station", trigger )
	end
end

function ss10_disable_station_exit_triggers()
	on_vehicle_enter( "", POLICE_STATION_HELICOPTER )
	on_vehicle_enter( "", REPAIR_VAN_NAME )
	on_vehicle_enter( "", LOCAL_PLAYER )

	for index, trigger in pairs( STATION_EXIT_TRIGGER_NAMES ) do
		trigger_enable( trigger, false )
	end
end

function ss10_reached_hq( triggerer_name, trigger_name )
	thread_kill( Mark_destination_thread_handle )

	if ( triggerer_name == LOCAL_PLAYER ) then
		player_controls_disable( LOCAL_PLAYER )
		vehicle_stop_do( LOCAL_PLAYER )
		mission_end_success( MISSION_NAME, CT_OUTRO, { END_LOCAL_WARP, END_REMOTE_WARP } )
	end
end

function ss10_left_station()
	if ( Tracking_Shaundi_in_vehicle_thread_handle ~= INVALID_THREAD_HANDLE ) then
		thread_kill( Tracking_Shaundi_in_vehicle_thread_handle )
		Tracking_Shaundi_in_vehicle_thread_handle = INVALID_THREAD_HANDLE
	end
	ss10_disable_station_exit_triggers()
	ss10_switch_state( MS_RETURN_TO_BASE )
end

function ss10_shaundi_incapacitated()
	character_allow_ragdoll( SHAUNDI_REPAIR_VARIANT_NAME, true )
	character_ragdoll( SHAUNDI_REPAIR_VARIANT_NAME, -1 )
	--hud_timer_pause(0, true )

	-- She was knocked out while hacking, so she's
	-- stopped for now.
	Shaundi_hacking = false
end

function ss10_shaundi_revived()
	ss10_setup_shaundi_hacking_state()
	--hud_timer_pause(0, false )
end

-- Returns the name of the attack wave location group at the specified index.
--
function ss10_get_wave_location_group_name( location_index )
	return WAVE_LOCATION_NAME_PREFIX..location_index..WAVE_LOCATION_NAME_SUFFIX
end

-- Returns the name of the coop attack wave location group at the specified index.
--
function ss10_get_coop_wave_location_group_name( location_index )
	return WAVE_LOCATION_NAME_PREFIX..location_index..WAVE_LOCATION_NAME_COOP_SUFFIX
end

-- Creates a list of attackers at the specified location index.
-- Creates both coop and normal attackers, returns them as
-- attackers, coop_attackers
--
function ss10_create_attacker_names( location_index )
	local cur_attacker_names = {}
	local cur_coop_attacker_names = {}

	for attacker_index = 1, NUM_WAVE_ATTACKERS[location_index] do
		cur_attacker_names[attacker_index] = WAVE_ATTACKER_NAME_LOCATION_PREFIX..location_index..WAVE_ATTACKER_NAME_INDEX_PREFIX..attacker_index
	end

	if ( coop_is_active() ) then
		for attacker_index = 1, NUM_COOP_WAVE_ATTACKERS[location_index] do
			cur_coop_attacker_names[attacker_index] = WAVE_ATTACKER_NAME_LOCATION_PREFIX..location_index..WAVE_ATTACKER_COOP_NAME_INDEX_PREFIX..attacker_index
		end
	end

	return cur_attacker_names, cur_coop_attacker_names
end

-- Called to spawn the first wave.
-- Should only be called once.
--
function ss10_spawn_first_wave()
	Current_wave_spawn_location = 1
	Wave_attack_started = true
	ss10_spawn_location_attackers_and_attack( Current_wave_spawn_location )
end

-- Called to spawn subsequent waves after the first wave.
-- Handles all cleanup and location incrementing.
--
function ss10_spawn_next_wave()
	ss10_update_location_index()
	ss10_release_current_location_attackers()
	ss10_spawn_location_attackers_and_attack( Current_wave_spawn_location )
end

-- Releases the attack group at the current location index.
-- Completely safe to call at any time, because it checks
-- for group existance before it releases them.
--
function ss10_release_current_location_attackers()
	-- Release the old wave
	local cur_location_name = ss10_get_wave_location_group_name( Current_wave_spawn_location )
	if ( group_is_loaded( cur_location_name ) ) then
		mission_debug( "Releasing "..cur_location_name, 15 )
		release_to_world( cur_location_name )
	end
	if ( coop_is_active() ) then
		local cur_coop_location_name = ss10_get_coop_wave_location_group_name( Current_wave_spawn_location )
		if ( group_is_loaded( cur_coop_location_name ) ) then
			mission_debug( "Releasing "..cur_coop_location_name, 15 )
			release_to_world( cur_coop_location_name )
		end
	end
end

-- Spawns attackers at a location and has them attack.
-- 
-- location_index: The location to spawn.
--
function ss10_spawn_location_attackers_and_attack( location_index )

	-- Get the group names and create the groups
	local cur_location_group_name = ss10_get_wave_location_group_name( location_index )
	group_create( cur_location_group_name, true )
	Num_wave_members_remaining = 0

	-- Do this for coop as well
	local cur_coop_location_group_name = nil
	if ( coop_is_active() ) then
		cur_coop_location_group_name = ss10_get_coop_wave_location_group_name( location_index )
		group_create( cur_coop_location_group_name, true )
	end

	-- Get the attacker names
	local cur_attacker_names = {}
	local cur_coop_attacker_names = {}

	cur_attacker_names, cur_coop_attacker_names = ss10_create_attacker_names( location_index )

	local percent_with_shotguns = WAVE_SHOTGUN_DISTRIBUTION( Num_waves_defeated + 1 )
	local number_with_shotguns = percent_with_shotguns * NUM_WAVE_ATTACKERS[location_index] +
					  percent_with_shotguns * NUM_COOP_WAVE_ATTACKERS[location_index]
	local number_given_shotguns = 0

	-- Have all the attackers attack, and setup their 'on_death' functions so that we can
	-- keep track of how many remain.
	for index, member in pairs( cur_attacker_names ) do
		on_death( "ss10_wave_member_death", member )

		inv_item_remove_all( member )

		inv_item_add( POLICE_PISTOL_NAME, 1, member )
		inv_item_add_ammo( member, POLICE_PISTOL_NAME, POLICE_PISTOL_AMMO_COUNT )

		if ( number_given_shotguns < number_with_shotguns ) then
			inv_item_add( POLICE_SHOTGUN_NAME, 1, member )
			inv_item_add_ammo( member, POLICE_SHOTGUN_NAME, POLICE_SHOTGUN_AMMO_COUNT )
			number_given_shotguns = number_given_shotguns + 1
		end

		local distance, player_name = get_dist_closest_player_to_object(member)
		attack_safe( member, player_name, false )

		Num_wave_members_remaining = Num_wave_members_remaining + 1
	end

	-- Do the same thing for coop
	if ( coop_is_active() ) then
		for index, member in pairs( cur_coop_attacker_names ) do
			on_death( "ss10_wave_member_death", member )

			inv_item_remove_all( member )

			inv_item_add( POLICE_PISTOL_NAME, 1, member )
			inv_item_add_ammo( member, POLICE_PISTOL_NAME, POLICE_PISTOL_AMMO_COUNT )
			if ( number_given_shotguns < number_with_shotguns ) then
				inv_item_add( POLICE_SHOTGUN_NAME, 1, member )
				inv_item_add_ammo( member, POLICE_SHOTGUN_NAME, POLICE_SHOTGUN_AMMO_COUNT )
				number_given_shotguns = number_given_shotguns + 1
			end

			local distance, player_name = get_dist_closest_player_to_object(member)
			attack_safe( member, player_name, false )

			Num_wave_members_remaining = Num_wave_members_remaining + 1
		end
	end
end

-- Updates the current location index used for spawning.
-- Rolls over correctly so that it doesn't go over the
-- max number of locations.
--
function ss10_update_location_index()
	-- Go through each of the locations in turn, rolling over to 1
	-- when running out
	Current_wave_spawn_location = Current_wave_spawn_location + 1
	local num_spawn_locations = sizeof_table( NUM_WAVE_ATTACKERS )
	if ( Current_wave_spawn_location > num_spawn_locations ) then
		Current_wave_spawn_location = 1
	end
end

-- Callback for a wave member dying. Updates the number left and
-- updates the number of waves defeated and spawns a new wave if
-- all members are dead.
--
function ss10_wave_member_death()
	-- Update the number of members left
	Num_wave_members_remaining = Num_wave_members_remaining - 1

	-- If no more wave members survive, spawn members at another location.
	if ( Num_wave_members_remaining == 0 ) then
		if ( Police_wave_spawn_enabled ) then
			Num_waves_defeated = Num_waves_defeated + 1
			ss10_spawn_next_wave()
		-- If swat waves are enabled, then start them instead
		elseif ( Swat_wave_spawn_enabled ) then
			ss10_spawn_next_swat_wave()
		end
	end

end

-- Spawns another wave of swat attackers and has them attack the player.
--
function ss10_spawn_next_swat_wave()
	Current_wave_spawn_location = Current_wave_spawn_location + 1
	if ( Current_wave_spawn_location > sizeof_table( SWAT_ATTACKERS_GROUP_NAMES ) ) then
		Current_wave_spawn_location = 1
	end

	ss10_spawn_swat_wave()
end

function ss10_spawn_swat_wave()
	local wave_group = SWAT_ATTACKERS_GROUP_NAMES[Current_wave_spawn_location]

	if ( group_is_loaded( wave_group ) ) then
		release_to_world( wave_group )
	end
	group_create( wave_group, true )

	local wave_members = SWAT_ATTACKER_NAMES[Current_wave_spawn_location]

	for index, member in pairs( wave_members ) do
		on_death( "ss10_wave_member_death", member )

		attack_closest_player( member )

		Num_wave_members_remaining = Num_wave_members_remaining + 1
	end
end

-- This function is an internal timer that counts down to the player's ruse
-- being 'discovered.'
-- When that happens, this function calls 'ss10_police_station_alarm.'
--
function ss10_player_ruse_discovered_timer( time_seconds )
	-- Use PLAYER_RUSE_DISCOVERED_SECONDS unless we've been given an override.
	local player_ruse_discovered_countdown_seconds = PLAYER_RUSE_DISCOVERED_SECONDS
	if ( time_seconds ~= nil ) then
		player_ruse_discovered_countdown_seconds = time_seconds
	end

	delay( player_ruse_discovered_countdown_seconds )

	-- The timer's elapsed, call the 'discovered' function.
	ss10_police_station_alarm()
end

function ss10_swat_heli_spawn()
	--delay( SWAT_SQUAD_SPAWN_DELAY_TIME_SECONDS )

	mission_debug( "swat heli spawn called" )

	group_create( SWAT_HELI_DROPOFF_GROUP_NAME, true )
	vehicle_enter_group_teleport( SWAT_HELI_SEATING, SWAT_HELI )

	mission_debug( "swat heli squad flying" )
	helicopter_fly_to_direct( SWAT_HELI, SWAT_HELI_DROPOFF_PATH )

	for index, member_name in pairs( SWAT_HELI_DROPOFF_SQUAD_MEMBERS ) do
		vehicle_exit( member_name )
		attack_closest_player( member_name )
	end

	mission_debug( "swat heli squad deployed" )
	helicopter_fly_to_direct( SWAT_HELI, SWAT_HELI_RETURN_PATH )
	vehicle_hide( SWAT_HELI )
	release_to_world( SWAT_HELI_DROPOFF_GROUP_NAME )
	mission_debug( "swat heli spawn ending" )
end

-- This function has a delay, but only counts down the delay when Shaundi
-- is actively hacking.
--
-- time_to_delay: The amount of time to delay
-- num_divisions: The time is divided into these divisions. When Shaundi stops
--					 hacking ( for example, is knocked out ) the most time that will
--					 count down is time_to_delay / num_divisions before the
--					 countdown pauses until she's hacking again.
--
function ss10_delay_while_shaundi_hacking( time_to_delay, num_divisions )
	for i = 1, num_divisions do
		local time_chunk = time_to_delay / num_divisions
		delay( time_chunk )
		while ( Shaundi_hacking == false ) do
			delay( 0 )
		end
	end
end

function ss10_shaundi_hacking_timer()
	local time_delayed_seconds = 0
	local time_chunk = TOTAL_HACKING_TIME_VALUE_SECONDS / NUM_HACKING_TIME_DIVISIONS
	local lines_played = { [SHAUNDI_HACK20P_LINE] = false, [SHAUNDI_HACK50P_LINE] = false,
								  [SHAUNDI_HACK75P_LINE] = false }
	local heli_spawned = false

	for i = 1, NUM_HACKING_TIME_DIVISIONS do
		delay( time_chunk )
		time_delayed_seconds = time_delayed_seconds + time_chunk

		if ( time_delayed_seconds / TOTAL_HACKING_TIME_VALUE_SECONDS >= 0.20 and
			  lines_played[SHAUNDI_HACK20P_LINE] == false ) then
			audio_play_for_character( SHAUNDI_HACK20P_LINE, SHAUNDI_REPAIR_VARIANT_NAME, "voice", false, false )
			lines_played[SHAUNDI_HACK20P_LINE] = true
		end
		if ( time_delayed_seconds / TOTAL_HACKING_TIME_VALUE_SECONDS >= 0.50 and
			  lines_played[SHAUNDI_HACK50P_LINE] == false ) then
			audio_play_for_character( SHAUNDI_HACK50P_LINE, SHAUNDI_REPAIR_VARIANT_NAME, "voice", false, false )
			lines_played[SHAUNDI_HACK50P_LINE] = true
		end
		if ( time_delayed_seconds / TOTAL_HACKING_TIME_VALUE_SECONDS >= 0.75 and
			  lines_played[SHAUNDI_HACK75P_LINE] == false ) then
			audio_play_for_character( SHAUNDI_HACK75P_LINE, SHAUNDI_REPAIR_VARIANT_NAME, "voice", false, false )
			lines_played[SHAUNDI_HACK75P_LINE] = true
		end

		if ( time_delayed_seconds > SWAT_HELI_GROUP_SPAWN_THREAD_DELAY_SECONDS and
			  heli_spawned == false ) then
			thread_new( "ss10_swat_heli_spawn" )
			heli_spawned = true
		end

		if ( time_delayed_seconds > SWITCH_TO_SWAT_SPAWN_TIME_DELAY_SECONDS and
			  Swat_wave_spawn_enabled == false ) then
			Police_wave_spawn_enabled = false
			Swat_wave_spawn_enabled = true
		end

		while ( Shaundi_hacking == false ) do
			delay( 0 )
		end
	end
	ss10_hacking_complete()
end

-- Called when the HUD hacking timer, after being set to
-- FINAL_HACKING_TIMER_VALUE_MS, expires.
--
function ss10_hacking_complete()
	ss10_switch_state( MS_LEAVE_STATION )
end

-- This function sets off the alarm and causes the police to
-- attack the player.
--
function ss10_police_station_alarm( was_doing_ruse )
	-- Assume by default that the player was doing the ruse
	-- when the function was called
	if( was_doing_ruse == nil ) then
		was_doing_ruse = true
	end
	on_notoriety_event( "", LOCAL_PLAYER )
	if ( coop_is_active() ) then
		on_notoriety_event( "", REMOTE_PLAYER )
	end

	-- The disguise doesn't matter now that the alarm has gone off
	trigger_type_enable("clothing store", true)
	trigger_type_enable("crib clothing", true)

	-- Clear all the cases where the alarm could be set off again
	on_death( "", RECEPTIONIST_NAME )
	if ( Player_ruse_thread_handle ~= INVALID_THREAD_HANDLE ) then
		thread_kill( Player_ruse_thread_handle )
		Player_ruse_thread_handle = INVALID_THREAD_HANDLE
	end
	if ( Track_weapon_thread_handle ~= INVALID_THREAD_HANDLE ) then
		thread_kill( Track_weapon_thread_handle )
		Track_weapon_thread_handle = INVALID_THREAD_HANDLE
	end
	trigger_enable( RECEPTIONIST_DESK_CHECKIN_TRIGGER_NAME, false )

	-- Play the alarm!
	audio_play_for_navpoint( "SFX_POLICE_ALARM", ALARM_ORIGIN )
	Alarm_set_off = true

	-- Don't lower the notoriety, but raise it if necessary
	if ( notoriety_get( POLICE_GANG ) < MISSION_POST_ALARM_NOTORIETY ) then
		notoriety_set( POLICE_GANG, MISSION_POST_ALARM_NOTORIETY )
	end
	notoriety_set_min( POLICE_GANG, MISSION_POST_ALARM_NOTORIETY )

	-- If the player was doing the ruse
	if ( was_doing_ruse == true ) then
		-- Shaundi isn't hacking yet, so let the player know that
		-- she needs to start
		if ( Shaundi_has_started_hacking == false ) then
			--mission_help_table_nag( RUSE_BLOWN )
		-- Shaundi is hacking - she lets the player know to defend her
		else
		end
	-- Otherwise, the player isn't doing the ruse at all. Let him know
	-- to get to the terminal.
	else
		delay( 5.0 )
		mission_help_table( GET_TO_TERMINAL )
		--notoriety_set_min( POLICE_GANG, FRONTAL_ASSAULT_NOTORIETY )
	end

	thread_new( "ss10_begin_ambient_attack" )
	--thread_new( "ss10_notoriety_increase" )
end

-- Increases the player's notoriety to max over a period of time.
--
function ss10_notoriety_increase()
	local increments = 300
	local increase_segment_seconds = TOTAL_HACKING_TIME_VALUE_SECONDS / increments
	local notoriety_increase_per_increment = MAX_NOTORIETY_LEVEL / increments

	for i = 1, increments do
		delay( increase_segment_seconds )
		local cur_notoriety = notoriety_get_decimal( POLICE_GANG )
		local new_notoriety = cur_notoriety + notoriety_increase_per_increment
		if ( new_notoriety > MAX_NOTORIETY_LEVEL ) then
			new_notoriety = MAX_NOTORIETY_LEVEL
		end
		notoriety_set( POLICE_GANG, new_notoriety )
		notoriety_set_min( POLICE_GANG, new_notoriety )
	end
end

function ss10_went_past_desk_before_checking_in()
	-- TODO: Warn the player that he has to check in first!
	mission_help_table( CHECK_IN_AT_DESK )
end

function ss10_entered_entrance_before_checking_in()
	ss10_switch_state( MS_RUN_TO_CAMERA_ROOM )
end

function ss10_all_players_in_repair_van()
	if ( Players_in_repair_van[LOCAL_PLAYER] ) then
		if ( coop_is_active() ) then
			if ( Players_in_repair_van[REMOTE_PLAYER] ) then
				return true
			end
		else
			return true
		end
	end

	return false
end

-- Returns true if the specified player is in the police station
-- with a weapon equipped.
--
function ss10_player_has_weapon_equipped_in_station( player_name )
	local player_item = inv_item_get_equipped_item( player_name )

	if ( player_item ~= nil ) then
		if ( ss10_player_in_station( player_name ) ) then
			return true
		end
	end

	return false
end

-- Tracks if either player equips a weapon while in the station.
--
function ss10_track_weapon_equipped()
	local cover_blown = false

	while ( cover_blown == false ) do
		if ( ss10_player_has_weapon_equipped_in_station( LOCAL_PLAYER ) and Signing_in == false ) then
			cover_blown = true
		end

		if ( coop_is_active() ) then
			if ( ss10_player_has_weapon_equipped_in_station( REMOTE_PLAYER ) and Signing_in == false ) then
				cover_blown = true
			end
		end

		delay( ITEM_CHECK_DELAY_SECONDS )
	end

	ss10_police_station_alarm()
end

-- Creates and spawns the repair van and the repair men.
-- Additionally, seats the repair men in the van, and does
-- other setup of the vehicle itself.
--
function ss10_create_repair_van_group()
	group_create( REPAIR_VAN_AND_REPAIRMEN_GROUP_NAME )
	Initial_van_hp = get_current_hit_points( REPAIR_VAN_NAME ) * VAN_HP_MULTIPLIER
	set_max_hit_points( REPAIR_VAN_NAME, Initial_van_hp )
	set_current_hit_points( REPAIR_VAN_NAME, Initial_van_hp )
	
	vehicle_enter_teleport( REPAIR_MAN_NAME, REPAIR_VAN_NAME )
	vehicle_suppress_npc_exit( REPAIR_VAN_NAME, true )
end

function ss10_create_floor_trigger_names()
	local increment = 1

	for floor_index, floor_trigger_count in pairs( FLOOR_TRIGGER_COUNTS ) do
		for trigger_index = 1, floor_trigger_count, increment do
			local trigger_name = FLOOR_PREFIX..floor_index
			if ( trigger_index < 10 ) then
				trigger_name = trigger_name..FLOOR_END_SINGLE_DIGIT_PREFIX..trigger_index
			else
				trigger_name = trigger_name..FLOOR_END_DOUBLE_DIGIT_PREFIX..trigger_index
			end
			Floor_trigger_names[floor_index][trigger_index] = trigger_name
		end
	end
end

function ss10_set_activate_floor_triggers_and_set_callbacks( floor_index, enabled, callback_name )
	local increment = 1

	if ( FLOOR_TRIGGER_COUNTS[floor_index] ~= nil ) then
		for trigger_index = 1, FLOOR_TRIGGER_COUNTS[floor_index], increment do
			local trigger_name = Floor_trigger_names[floor_index][trigger_index]
			trigger_enable( trigger_name, enabled )
			on_trigger( callback_name, trigger_name )
		end
	end
end

function ss10_floor_trigger_callback( triggerer_name, trigger_name )
	if ( triggerer_name == LOCAL_PLAYER ) then
		Cur_floor_index = Cur_floor_index + 1
		local next_floor_index = Cur_floor_index + 1

		-- Let the player know the floor they're on
		mission_help_table_nag( FLOOR_INDEX, Cur_floor_index )

		-- The trigger we just hit ( and the other triggers on the same floor )
		-- were previously on the next floor. Now we're on their floor, the current floor, so we disable
		-- the current floor's triggers and add the triggers for the next floor.
		ss10_set_activate_floor_triggers_and_set_callbacks( Cur_floor_index, false, "" )
		ss10_set_activate_floor_triggers_and_set_callbacks( next_floor_index, true, "ss10_floor_trigger_callback" )

		if ( Cur_floor_index == CAMERA_ROOM_FLOOR ) then
			marker_remove_navpoint( FOURTH_FLOOR_LOCATION_NAVPOINT_NAME )

			trigger_enable( CAMERA_ROOM_DOOR_TRIGGER, true )
			on_trigger( "ss10_reached_camera_room", CAMERA_ROOM_DOOR_TRIGGER )
			marker_add_trigger( CAMERA_ROOM_DOOR_TRIGGER, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL )
		end
	end
end

function ss10_reached_camera_room( triggerer_name, trigger_name )
	-- Only trigger for the player that has Shaundi as a party member
	if ( triggerer_name == LOCAL_PLAYER ) then
		trigger_enable( trigger_name, false )

		-- Shaundi should start hacking now
		ss10_begin_hacking_state()
	end
end

function ss10_shaundi_abandoned_delay()
	mission_help_table_nag( ABANDONING_SHAUNDI, "", "", SYNC_LOCAL )
	delay( TIME_BEFORE_SHAUNDI_ABANDONED_SECONDS )

	mission_end_failure( MISSION_NAME, SHAUNDI_ABANDONED )
end

function ss10_maybe_kill_shaundi_abandoned_thread()
	if ( Shaundi_abandoned_thread ~= INVALID_THREAD_HANDLE ) then
		thread_kill( Shaundi_abandoned_thread )
		Shaundi_abandoned_thread = INVALID_THREAD_HANDLE
	end
end

function ss10_in_range_of_shaundi( player_name )
	if ( player_name == LOCAL_PLAYER ) then
		mission_help_clear( SYNC_LOCAL )
		ss10_maybe_kill_shaundi_abandoned_thread()
	end
end

function ss10_out_of_range_of_shaundi( player_name )
	if ( player_name == LOCAL_PLAYER ) then
		Shaundi_abandoned_thread = thread_new( "ss10_shaundi_abandoned_delay" )
	end
end

function ss10_setup_shaundi_hacking_state()
	Shaundi_has_started_hacking = true
	follower_make_independent( SHAUNDI_REPAIR_VARIANT_NAME, true )
	on_incapacitated( "ss10_shaundi_incapacitated", SHAUNDI_REPAIR_VARIANT_NAME )
	on_revived( "ss10_shaundi_revived", SHAUNDI_REPAIR_VARIANT_NAME )
	character_prevent_flinching( SHAUNDI_REPAIR_VARIANT_NAME, true )
	set_cant_flee_flag( SHAUNDI_REPAIR_VARIANT_NAME, true )
	npc_weapon_pickup_override( SHAUNDI_REPAIR_VARIANT_NAME, false )
	character_allow_ragdoll( SHAUNDI_REPAIR_VARIANT_NAME, false )
	set_ignore_ai_flag( SHAUNDI_REPAIR_VARIANT_NAME, true )

	move_to( SHAUNDI_REPAIR_VARIANT_NAME, HACKING_LOCATION_NAME, 2, true, false )
	delay( 1.0 )

	--name, anim_name, morph_name, force_play, percentage, stand_still)
	action_play( SHAUNDI_REPAIR_VARIANT_NAME, "stand to Hacking", "", true, 0.8, true )
	set_animation_state( SHAUNDI_REPAIR_VARIANT_NAME, STATE_HACK_CAMERA_ROOM )
	audio_play_for_character( "SFX_POLICE_CAMERA_ACTIVATE", SHAUNDI_REPAIR_VARIANT_NAME )
	Shaundi_hacking = true
end

function ss10_begin_hacking_state()
	ss10_setup_shaundi_hacking_state()
	ss10_switch_state( MS_DEFEND_CAMERA_ROOM )
end

--function receptionist_chair_moved()
	-- Do something logical here.
--end

function ss10_reached_stairway( triggerer_name, trigger_name )
	-- The local player has Shaundi, so don't actually disable the
	-- stairway guidance or enable the further guidance until he
	-- gets to the stairway.
	if ( triggerer_name == LOCAL_PLAYER ) then
		-- Activate the path triggers
		ss10_create_floor_trigger_names()
		-- Activate the triggers on the second floor.
		ss10_set_activate_floor_triggers_and_set_callbacks( 2, true, "ss10_floor_trigger_callback" )
		for index, trigger in pairs( STAIRWAY_TRIGGER_NAMES ) do
			trigger_enable( trigger, false )
		end

		marker_remove_navpoint( STAIRWAY_GUIDE_NAVPOINT_NAME )

		marker_add_navpoint( FOURTH_FLOOR_LOCATION_NAVPOINT_NAME, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_LOCAL )
	end
end

-- Callback when the player first gets within hijack range of the van.
-- Puts the mission into the "Hijack the Van" state
--
function ss10_reached_van_initial()
	ss10_switch_state( MS_HIJACK_REPAIR_VAN )
end

function ss10_initialize_hud_bar()
	hud_bar_on(0, "Damage", VAN_DAMAGE_BAR_LABEL )
	local full_value = REPAIR_VAN_PERCENT_DAMAGE_TO_DISABLE
	local min_value = 0
	hud_bar_set_range(0, min_value, full_value, SYNC_ALL )
	hud_bar_set_value(0, min_value, SYNC_ALL )
end

-- Callback when the player gets back into a good distance from
-- the van after getting there and then falling away again.
-- Puts the mission into the "Reached repairmen again" state
--
function ss10_good_distance()
	ss10_switch_state( MS_REACHED_REPAIRMEN_AGAIN )
end

-- Callback when the player falls out of range of the van after
-- getting in range at least once.
-- Puts the mission into the "Repairmen Escaping" state
--
function ss10_van_escaping()
	ss10_switch_state( MS_REPAIRMEN_ESCAPING )
end

-- Callback when the failure timer for catching or reaching the van
-- expires.
-- Fails the mission.
--
function ss10_failed_to_catch_van()
	mission_end_failure( MISSION_NAME, VAN_ESCAPED )
end

-- Callback when the van is destroyed. Should only be called when
-- the van is necessary.
--
function ss10_van_destroyed()
	mission_end_failure( MISSION_NAME, VAN_DESTROYED )
end

function ss10_entered_van( player_name, vehicle_name )
	if ( player_name ~= LOCAL_PLAYER and player_name ~= REMOTE_PLAYER ) then
		return
	end

	if ( Repair_van_follow_path_thread_handle ~= INVALID_THREAD_HANDLE ) then
		thread_kill( Repair_van_follow_path_thread_handle )
		Repair_van_follow_path_thread_handle = INVALID_THREAD_HANDLE
	end
	Players_in_repair_van[player_name] = true

	local sync_type = sync_from_player( player_name )
	marker_remove_vehicle( REPAIR_VAN_NAME, sync_type )

	mission_debug( player_name.." entered "..vehicle_name, 10 )

	-- Find out if all the players have entered the vehicle
	local all_players_in_vehicle = ss10_all_players_in_repair_van()

	if ( all_players_in_vehicle ) then
		follower_make_independent( SHAUNDI_NAME, true )
		mission_debug( "Everyone's in the van." )
	end

	-- If we're trying to hijack the van and we just got in it, then
	-- we've successfully hijacked it. We call this here because we want to be sure
	-- that Players_in_repair_van is correct for the next state.
	if ( State == MS_HIJACK_REPAIR_VAN or
		  State == MS_REACHED_REPAIRMEN_AGAIN ) then
		mission_debug( "State was \"hijacked\", calling van_disabled.", 30 )
		ss10_switch_state( MS_VAN_DISABLED )
	end

	-- If so, we can go to the next mission state
	if ( all_players_in_vehicle ) then
		-- Advance the mission state
		on_vehicle_enter( "", REPAIR_VAN_NAME )
		mission_debug( "Switching to \"park_van_at_station\"", 30 )
		ss10_switch_state( MS_PARK_VAN_AT_STATION )
	end
end

function ss10_exited_van( player_name, vehicle_name )
	if ( player_name == LOCAL_PLAYER or player_name == REMOTE_PLAYER ) then
		Players_in_repair_van[player_name] = false
	end
end

function ss10_entered_van_during_drive_to_station( player_name, vehicle_name )
	if ( player_name == LOCAL_PLAYER or player_name == REMOTE_PLAYER ) then
		local sync_type = sync_from_player( player_name )
		waypoint_add( PARKING_SPOT_TRIGGER, sync_type )
		marker_add_trigger( PARKING_SPOT_TRIGGER, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION, sync_type )
		marker_remove_vehicle( REPAIR_VAN_NAME, sync_type )
	end
end

function ss10_exited_van_during_drive_to_station( player_name, vehicle_name )
	if ( player_name == LOCAL_PLAYER or player_name == REMOTE_PLAYER ) then
		Players_in_repair_van[player_name] = false

		local sync_type = sync_from_player( player_name )
		waypoint_remove( sync_type )
		marker_remove_trigger( PARKING_SPOT_TRIGGER, sync_type )
		marker_add_vehicle( REPAIR_VAN_NAME, MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE, sync_type )

		mission_help_table_nag( VAN_REQUIRED )
	end
end

-- Takes an attacker name and returns the player responsible. If the
-- attacker name is a vehicle, for example, it looks at the vehicle's
-- driver, and if the player is the driver, returns the name of the player
function ss10_translate_attacker_name_to_player_name( attacker_name )

	if ( attacker_name == nil ) then
		return nil
	end

	-- No translation necessary if it's already the player's name.
	if ( character_is_player( attacker_name ) ) then
		return attacker_name
	end

	if ( vehicle_exists( attacker_name ) ) then
		-- Check to see if it's a vehicle, and being driven by a player
		local driver = get_char_in_vehicle( attacker_name, 0 )
		if ( driver == LOCAL_PLAYER or
			  driver == REMOTE_PLAYER ) then
			return driver
		end
	end

	-- This attacker is not a player...
	return nil
end

-- Callback when the van is first damaged or hit. Makes the van stop
-- pathfinding in a circle and begin to flee from the player.
-- Rebinds the take damage callback to another function.
--
-- This function doesn't update the mission state... It puts the van
-- into its own personal "fleeing" state, however.
--
function ss10_van_damaged_initial( van_name, attacker_name )

	local player_name = ss10_translate_attacker_name_to_player_name( attacker_name )

	if ( player_name == LOCAL_PLAYER or player_name == REMOTE_PLAYER ) then
		audio_play_for_character( REPAIRMAN_ATTACKED_LINE, REPAIR_MAN_NAME, "voice", false, false )
		--thread_kill( Repair_van_follow_path_thread_handle )
		--vehicle_flee( REPAIR_VAN_NAME, player_name )

		vehicle_speed_override( REPAIR_VAN_NAME, REPAIR_VAN_FLEE_SPEED_MPS )
		vehicle_set_crazy( REPAIR_VAN_NAME, true )

		set_unjackable_flag( REPAIR_VAN_NAME, false )
		on_take_damage("ss10_van_damaged", REPAIR_VAN_NAME) 
		on_collision("ss10_van_damaged", REPAIR_VAN_NAME) 
		-- If we're looking for the repairmen and the van was damaged
		-- by a player, then we need to switch to the hijack state with
		-- the extra information that we're out-of-range of the van
		if ( State == MS_FIND_REPAIRMEN ) then
			local in_range = false
			ss10_switch_state( MS_HIJACK_REPAIR_VAN, nil, in_range )
		else
			ss10_van_damaged()
		end
	end
end

-- Callback when the van is damaged. Updates the HUD "van HP"
-- meter.
-- 
function ss10_van_damaged()
	ss10_update_van_hp_hud_bar()
end

-- Updates the Van HP display during the hijacking portion of
-- the mission.
--
function ss10_update_van_hp_hud_bar()
	local cur_van_hp = get_current_hit_points( REPAIR_VAN_NAME )
	local cur_fraction_of_max_hp = cur_van_hp/ Initial_van_hp

	local percent_to_set = 1.0 - cur_fraction_of_max_hp

	if ( percent_to_set > REPAIR_VAN_PERCENT_DAMAGE_TO_DISABLE ) then
		percent_to_set = REPAIR_VAN_PERCENT_DAMAGE_TO_DISABLE
	end

	hud_bar_set_value(0, percent_to_set, SYNC_ALL )
end

-- Callback when the van is damaged enough to be disabled.
-- Puts the mission into the "Van disabled" state.
--
function ss10_van_disabled()
	ss10_switch_state( MS_VAN_DISABLED )
end

function ss10_hide_weapon_prompt( triggerer_name, trigger_name )
	trigger_enable( trigger_name, false )

	if ( notoriety_get_decimal( POLICE_GANG ) < 1 ) then
		-- Hide the players' weapons.
		inv_item_equip( nil, LOCAL_PLAYER ) 
		if ( coop_is_active() ) then
			inv_item_equip( nil, REMOTE_PLAYER ) 
		end
		audio_play_for_character( SHAUNDI_NEAR_STATION_LINE, SHAUNDI_REPAIR_VARIANT_NAME, "voice", false, true )
		mission_help_table_nag( DONT_SHOW_WEAPONS )
	end
end

function ss10_reached_police_station()
	waypoint_remove( SYNC_ALL )
	ss10_switch_state( MS_ENTERED_POLICE_STATION )
end

function ss10_sign_in_with_receptionist( triggerer_name, trigger_name )
	ss10_switch_state( MS_GO_TO_CAMERA_ROOM, triggerer_name )
end

function ss10_cleanup()
	-- Cleanup mission here
	--ss10_release_repair_van()

	--Enable PB Gym Trigger
	trigger_enable ( CRIB_PB_TELE_GYM_OUT, true )

	thread_kill( Repair_van_follow_path_thread_handle )
	distance_display_off(SYNC_ALL)

	notoriety_force_no_spawn( ULTOR_GANG, false )
	notoriety_force_no_spawn( POLICE_GANG, false )
	notoriety_set_min( POLICE_GANG, 0 )
	notoriety_set( POLICE_GANG, 0 )

	party_dismiss_all()
	group_destroy( SHAUNDI_GROUP_NAME )

	-- Cleanup all vehicle callbacks
	on_tailing_good( "" )
	on_tailing_too_far( "" )
	on_damage( "", REPAIR_VAN_NAME, REPAIR_VAN_DISABLED_DAMAGE_PERCENT )
	on_take_damage( "", REPAIR_VAN_NAME )
	on_collision( "", REPAIR_VAN_NAME ) 
	on_vehicle_enter( "", REPAIR_VAN_NAME )
	on_vehicle_exit( "", REPAIR_VAN_NAME )

	ss10_lock_station_doors( false )

	customization_item_revert( SYNC_LOCAL )
	if ( coop_is_active() ) then
		customization_item_revert( SYNC_REMOTE )
	end
	on_vehicle_enter( "", LOCAL_PLAYER )

	trigger_type_enable("clothing store", true)
	trigger_type_enable("crib clothing", true)
	action_nodes_restrict_spawning( false )
	set_dont_drop_havok_weapons_on_idle( false )

	on_notoriety_event( "", LOCAL_PLAYER )
	if ( coop_is_active() ) then
		on_notoriety_event( "", REMOTE_PLAYER )
	end
	hud_timer_stop( 0 )
end

function ss10_release_repair_van()
	distance_display_off(SYNC_ALL)
	marker_remove_vehicle( REPAIR_VAN_NAME, SYNC_ALL )
	release_to_world( REPAIR_VAN_AND_REPAIRMEN_GROUP_NAME )
end

function ss10_process()
	-- Per-update processing
end

function ss10_repair_van_follow_path()
	-- 
	vehicle_speed_override( REPAIR_VAN_NAME, REPAIR_VAN_DESIRED_SPEED_MPS )
	vehicle_pathfind_to( REPAIR_VAN_NAME, REPAIR_VAN_INITIAL_NAVPOINTS[1], REPAIR_VAN_INITIAL_NAVPOINTS[2], false, false )
	while ( 1 ) do
		for index, path_name in pairs( REPAIR_VAN_PATHS ) do
			vehicle_pathfind_to( REPAIR_VAN_NAME, path_name, false, false )
			thread_yield()
		end
	end
end

function ss10_success()
	-- Called when the mission has ended with success
end

