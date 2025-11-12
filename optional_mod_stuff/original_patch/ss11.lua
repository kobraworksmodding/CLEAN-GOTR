 -- ss11.lua
-- SR2 mission script
-- 3/28/07

-- Mission help table text tags
   HT_DIDNT_MAKE_IT_TO_AMBUSH_IN_TIME = "ss11_didnt_make_it_to_ambush_in_time"

   HT_SHAUNDI_ABANDONED    = "ss11_shaundi_abandoned"
   HT_GET_INTO_POSITION    = "ss11_get_into_position"
   HT_GO_AFTER_GENERAL = "ss11_go_after_general"
   HT_KILL_THE_GENERAL = "ss11_kill_the_general"
   HT_GET_TO_AMBUSH    = "ss11_get_to_ambush"
   HT_SHAUNDI_DIED = "ss11_shaundi_died"
   HT_DIDNT_MAKE_IT_TO_AMBUSH_IN_TIME = "ss11_didnt_make_it_to_ambush_in_time"
   HT_FINISH_OFF_ESCORTS = "ss11_finish_off_escorts"
   HT_X_OF_Y_ESCORT_MEMBERS_KILLED = "ss11_x_of_y_escort_members_killed"
   HT_TRACK_DOWN_GENERAL = "ss11_track_down_general"
   HT_GENERALS_RIDE_HP = "ss11_generals_bulldog_health"
   HT_GENERALS_HP = "ss11_generals_health"
   HT_TEMP_SHAUNDI_DROPOFF_ATV_LINE = "ss11_temp_shaundi_dropoff_atv_line"

-- Mission states
   MS_TRAVEL_TO_AMBUSH_LOCATION = 1
   MS_CUTSCENE = 2
   MS_ABOVEGROUND_FIREFIGHT = 3
   MS_GENERAL_ESCAPING_UNDERGROUND = 4
   MS_THROUGH_THE_MALL_FIREFIGHT = 5
   MS_GENERAL_BOSS_BATTLE_DRIVING_PART = 6
   MS_GENERAL_BOSS_BATTLE_ON_FOOT_PART = 7

-- Groups, NPCs, vehicles, navpoints, and other names
   -- Mission constant names
   MISSION_NAME = "ss11"
   -- ( Mission Prefix )
   MP = MISSION_NAME.."_$"

   ENEMY_GANG = "Samedi"
   UNDERGROUND_MALL_HOOD = "sr2_ul_mall01"
   -- These are defined in highend.lua:
   ENTER_UG_MALL_FUNCTION = "highend_ug_mall_elevator_out"
   -- Defined in neighborhoods.xtbl:
   UNDERGROUND_MALL_OWNER = "Ultor"
   -- Checkpoints
   REACHED_AMBUSH_LOCATION_CHECKPOINT = "Reached_Ambush_Location"
   GENERAL_FIGHT_CHECKPOINT = "General_Boss_Fight"

   -- Weapons
   THE_GENERALS_SAW = "AR200"


   -- NPC names
   SHAUNDI_NAME = MP.."Shaundi"
   PIERCE_NAME = MP.."Pierce"

   THE_GENERAL_NAME = MP.."The_General"
   BODYGUARD_GROUP_MEMBERS = { MP.."General_Bodyguard1", MP.."General_Bodyguard2", MP.."General_Bodyguard3" }

   FIRST_DEFENDER_GROUP_MEMBERS = { MP.."Limo_DefenderG1_01", MP.."Limo_DefenderG1_02",
                                    MP.."Limo_DefenderG1_03", MP.."Limo_DefenderG1_04" }
   SECOND_DEFENDER_GROUP_MEMBERS = { MP.."Limo_DefenderG2_01", MP.."Limo_DefenderG2_02",
                                     MP.."Limo_DefenderG2_03", MP.."Limo_DefenderG2_04" }
   BUS_DRIVER_NAME = MP.."Bus_Driver"

   MALL_SQUAD_MEMBERS = { { MP.."Squad1_01", MP.."Squad1_02", MP.."Squad1_03", MP.."Squad1_04",
                            MP.."Squad1_05", MP.."Squad1_06" },

                          { MP.."Squad2_01", MP.."Squad2_02", MP.."Squad2_03", MP.."Squad2_04",
                            MP.."Squad2_05" },

                          { MP.."Squad3_01", MP.."Squad3_02", MP.."Squad3_03", MP.."Squad3_04",
                            MP.."Squad3_05", MP.."Squad3_06" },

                          { MP.."Squad4_01", MP.."Squad4_02", MP.."Squad4_03", MP.."Squad4_04",
                            MP.."Squad4_05", MP.."Squad4_06", MP.."Squad4_07", MP.."Squad4_08" } }

   MALL_SQUAD_LEASHED_MEMBERS = { { MP.."Squad1_01", MP.."Squad1_02", MP.."Squad1_05", MP.."Squad1_06" },

                                  { MP.."Squad2_01", MP.."Squad2_02", MP.."Squad2_03" },

                                  { },

                                  { } }

   MALL_SQUAD_THREE_LEFT_SIDE_MEMBERS = { MALL_SQUAD_MEMBERS[3][1], MALL_SQUAD_MEMBERS[3][2],
                                          MALL_SQUAD_MEMBERS[3][3], MALL_SQUAD_MEMBERS[3][4] }
   MALL_SQUAD_THREE_RIGHT_SIDE_MEMBERS = { MALL_SQUAD_MEMBERS[3][5], MALL_SQUAD_MEMBERS[3][6] }

   GENERALS_RIDE_DRIVER_NAME = MP.."Generals_Driver"
   GENERALS_RIDE_AK_GUYS = { MP.."Rear_AK_Guy1", MP.."Rear_AK_Guy2" }

   -- Groups
   SHAUNDI_GROUP = MP.."Shaundi"
   STARTER_CAR_GROUP = MP.."Starter_Car"
   STARTER_CAR_COOP_GROUP = MP.."Starter_Car_Coop"
   BUS_GROUP = MP.."Bus"
   GENERALS_LIMO_GROUP = MP.."Generals_Limo"
   THE_GENERAL_GROUP = MP.."The_General"
   LIMO_DEFENDERS_GROUP = MP.."Limo_Defenders"
   AMBUSHER_SAINTS_GROUP = MP.."Ambusher_Saints"

   MALL_SAMEDI = MP.."Mall_Samedi"
   MALL_SQUAD_THREE_GROUP = MP.."Mall_Squad3"
   MALL_SQUAD_FOUR_GROUP = MP.."Mall_Squad4"

   GENERALS_RIDE_GROUP = MP.."Generals_Ride"

   SHAUNDI_DROPOFF_ATV_GROUP = MP.."Shaundi_Dropoff_ATV"
   PIERCE_DROPOFF_ATV_GROUP = MP.."Pierce_Dropoff_ATV"

   DROPOFF_ATV_GROUPS = { [SHAUNDI_NAME] = SHAUNDI_DROPOFF_ATV_GROUP,
                          [PIERCE_NAME] = PIERCE_DROPOFF_ATV_GROUP }

   VEHICLE_SHOW_GROUPS = { MP.."Vehicle_Show01", MP.."Vehicle_Show02", MP.."Vehicle_Show03",
                           MP.."Vehicle_Show04", MP.."Vehicle_Show05", MP.."Vehicle_Show06" }

   -- Vehicle names
   BUS = MP.."Bus"
   GENERALS_LIMO = MP.."Generals_Limo"
   FIRST_DEFENDER_GROUP_VEHICLE = MP.."Defender_V1"
   SECOND_DEFENDER_GROUP_VEHICLE = MP.."Defender_V2"
   GENERALS_RIDE = MP.."Generals_Ride_02"

   SHAUNDI_DROPOFF_ATV = MP.."Shaundi_Dropoff_ATV"
   PIERCE_DROPOFF_ATV = MP.."Pierce_Dropoff_ATV"

   DROPOFF_ATVS = { [SHAUNDI_NAME] = SHAUNDI_DROPOFF_ATV, 
                    [PIERCE_NAME] = PIERCE_DROPOFF_ATV }

   VEHICLE_SHOW_VEHICLES = { MP.."ATV_01", MP.."ATV_02", MP.."ATV_03",
                             MP.."ATV_04", MP.."ATV_05", MP.."ATV_06" }

   -- Navpoints and paths
   LOCAL_PLAYER_START = MP.."Local_Player_Start"
   REMOTE_PLAYER_START = MP.."Remote_Player_Start"

   LOCAL_PLAYER_AMBUSH_LOCATION = MP.."Ambush_Location"
   REMOTE_PLAYER_AMBUSH_LOCATION = MP.."Remote_Player_Ambush"

   FIRST_DEFENDER_GROUP_DROPOFF = MP.."Defender_V1_Dropoff"
   SECOND_DEFENDER_GROUP_DROPOFF = MP.."Defender_V2_Dropoff"

   GENERALS_RIDE_PATHS_CW = { MP.."Boss_Path1", MP.."Boss_Path2",
                              MP.."Boss_Path3", MP.."Boss_Path4" }

   GENERALS_RIDE_PATHS_CCW = { MP.."Boss_Path1c", MP.."Boss_Path2c",
                               MP.."Boss_Path3c", MP.."Boss_Path4c" }

   GENERALS_RIDE_PATHS_DIRECTIONS = { GENERALS_RIDE_PATHS_CW,
                                      GENERALS_RIDE_PATHS_CCW }

   GENERALS_RIDE_PATH_STARTS_CW = { MP.."Path1_Start", MP.."Path2_Start",
                                    MP.."Path3_Start", MP.."Path4_Start" }

   GENERALS_RIDE_PATH_STARTS_CCW = { MP.."Path1c_Start", MP.."Path2c_Start",
                                     MP.."Path3c_Start", MP.."Path4c_Start" }

   GENERALS_RIDE_PATH_STARTS_DIRECTIONS = { GENERALS_RIDE_PATH_STARTS_CW,
                                            GENERALS_RIDE_PATH_STARTS_CCW }

   UNDERGROUND_MALL_ENTRANCE = MP.."UG_Mall_Entrance"

   GENERAL_BATTLE_REMOTE_PLAYER_WARP = MP.."General_Battle_Remote_Player_Warp"
   GENERAL_BATTLE_LOCAL_PLAYER_WARP = MP.."General_Battle_Local_Player_Warp"

   GENERAL_BEHIND_PILLAR = MP.."General_Behind_Pillar_Spawn"

   NEAR_PILLAR_STOP = MP.."Near_Pillar_Stop"

   SHAUNDI_DROPOFF_ATV_PATH = MP.."Shaundi_Dropoff_ATV_Path"
   PIERCE_DROPOFF_ATV_PATH = MP.."Pierce_Dropoff_ATV_Path"

   SHAUNDI_LEAVE_PATH = MP.."Shaundi_Leave_Path"
   PIERCE_LEAVE_PATH = MP.."Pierce_Leave_Path"

   DROPOFF_LEAVE_PATHS = { [SHAUNDI_NAME] = SHAUNDI_LEAVE_PATH,
                           [PIERCE_NAME] = PIERCE_LEAVE_PATH }

   SHAUNDI_NEAR_ATV_WARP = MP.."Shaundi_Near_ATV_Warp"

   DROPOFF_ATV_PATHS = { [SHAUNDI_NAME] = SHAUNDI_DROPOFF_ATV_PATH,
                         [PIERCE_NAME] = PIERCE_DROPOFF_ATV_PATH }

   MALL_PATH_INITIAL = MP.."Mall_Path_Initial"

   GENERALS_RIDE_MALL_AROUND_THE_MALL_PATHS = { MP.."Generals_Ride_Mall_Path01",
                                                MP.."Generals_Ride_Mall_Path02",
                                                MP.."Generals_Ride_Mall_Path03",
                                                MP.."Generals_Ride_Mall_Path04" }

   -- Triggers
   SAINTS_PARKING_LOT_AREA_TRIGGER = MP.."Saints_Parking_Lot_Area"

   AMBUSH_LOCATION_TRIGGER = MP.."Ambush_Location"

   ENTER_UG_MALL_TELEPORT_TRIGGER = MP.."UG_Mall_Teleport_Entrance"

   -- The in-game enter and leave underground mall triggers. Not used by this mission-
   -- we disable them.
   DEFAULT_ENTER_UG_MALL_TRIGGER = "highend_$t-ug-mall-elevator-out"
   DEFAULT_LEAVE_UG_MALL_TRIGGER = "highend_$t-ug-mall-elevator-in"

   PARKING_GARAGE_UG_MALL_TRIGGER = MP.."UG_Mall_PG_Entrance"

   SQUAD_ONE_ATTACK_TRIGGER = MP.."Squad1_Attack"

   PAST_SQUAD_ONE_TRIGGER = MP.."Past_Squad1"
   PAST_SQUAD_TWO_TRIGGER = MP.."Past_Squad2"

   GENERAL_BATTLE_TRIGGER = MP.."General_Battle"
   GENERAL_BATTLE_ATTACK_POINTS = { MP.."Attack_Point1", MP.."Attack_Point2" }

   GENERAL_BATTLE_AREA_TRIGGER = MP.."In_Arena"

   -- Movers
   CHAIRS = { MP.."Chair01", MP.."Chair02", MP.."Chair03", MP.."Chair04", MP.."Chair05",
              MP.."Chair06", MP.."Chair07", MP.."Chair08", MP.."Chair09", MP.."Chair10",
              MP.."Chair11", MP.."Chair12", MP.."Chair13", MP.."Chair14", MP.."Chair15",
              MP.."Chair16", MP.."Chair17", MP.."Chair18", MP.."Chair19", MP.."Chair20",
              MP.."Chair21", MP.."Chair22", MP.."Chair23", MP.."Chair24", MP.."Chair25",
              MP.."Chair26", MP.."Chair27", MP.."Chair28", MP.."Chair29", MP.."Chair30",
              MP.."Chair31", MP.."Chair32", MP.."Chair33", MP.."Chair34", MP.."Chair35",
              MP.."Chair36", MP.."Chair37", MP.."Chair38", MP.."Chair39", MP.."Chair40",
              MP.."Chair41", MP.."Chair42" }

   TABLES = { MP.."Table01", MP.."Table02", MP.."Table03", MP.."Table04", MP.."Table05",
              MP.."Table06", MP.."Table07", MP.."Table08", MP.."Table09", MP.."Table10",
              MP.."Table11", MP.."Table12", MP.."Table13", MP.."Table14" }

   SPEED_LIMIT_20_TRIGGERS = { MP.."Speed_Limit_20_01", MP.."Speed_Limit_20_02", MP.."Speed_Limit_20_03",
                               MP.."Speed_Limit_20_04" }

   SPEED_LIMIT_25_TRIGGERS = { MP.."Speed_Limit_25_01", MP.."Speed_Limit_25_02", MP.."Speed_Limit_25_03",
                               MP.."Speed_Limit_25_04", MP.."Speed_Limit_25_05", MP.."Speed_Limit_25_06",
                               MP.."Speed_Limit_25_07", MP.."Speed_Limit_25_08" }

   SPEED_LIMIT_30_TRIGGERS = { MP.."Speed_Limit_30_01", MP.."Speed_Limit_30_02", MP.."Speed_Limit_30_03",
                               MP.."Speed_Limit_30_04" }

   SPEED_LIMIT_35_TRIGGERS = { MP.."Speed_Limit_35_01" }
   
   SPEED_LIMIT_40_TRIGGERS = { MP.."Speed_Limit_40_01", MP.."Speed_Limit_40_02", MP.."Speed_Limit_40_03",
                               MP.."Speed_Limit_40_04" }

   -- Effects and animation states
   
   -- Cutscenes
   CUTSCENE_NAME = "ig_ss11_scene1"
   CT_INTRO = "ss11-01"
   CT_OUTRO = "ss11-02"
   CT_COLLISION = "ss11-collision"
-- Sound
   -- Persona overrides
   THE_GENERAL_PERSONA_OVERRIDES =
   {
   { "threat - alert (solo attack)", "GENERAL_SOS11_ATTACK" },
   { "threat - alert (group attack)", "GENERAL_SOS11_ATTACK" },
   { "threat - damage received (firearm)", "GENERAL_SOS11_TAKEDAM" },
   { "threat - damage received (melee)", "GENERAL_SOS11_TAKEDAM" }
   }
   SHAUNDI_PERSONA_OVERRIDES =
   {
   { "hostage - barters", "SOS11_SHAUNDI_BARTER" },
   { "misc - respond to player taunt w/taunt", "SOS11_SHAUNDI_TAUNT" },
   { "observe - praised by pc", "SOS11_SHAUNDI_PRAISED" },
   { "threat - alert (group attack)", "SOS11_SHAUNDI_ATTACK" },
   { "threat - alert (solo attack)", "SOS11_SHAUNDI_ATTACK" },
   { "threat - damage received (firearm)", "SOS11_SHAUNDI_TAKEDAM" },
   { "threat - damage received (melee)", "SOS11_SHAUNDI_TAKEDAM" }
   }

   -- Lines/Dialog Stream
   INTRO_DIALOG_STREAM =
   {
   { "SOS11_INTRO_L1", SHAUNDI_NAME, 0 },
   { "PLAYER_SOS11_INTRO_L2", LOCAL_PLAYER, 0 }
   }
   TAKE_OUT_GENERAL_DIALOG_STREAM =
   {
   { "PLAYER_SOS11_AMBUSH_01", LOCAL_PLAYER, 0 }
   }

   SHAUNDI_GET_READY_FOR_LIMO_LINE = "SOS11_SHAUNDI_SEEGENERAL_1"
   SHAUNDI_LIMO_BUILT_LIKE_TANK_LINE = "SOS11_SHAUNDI_ATTACKLIMO_1"
   SHAUNDI_GENERAL_IS_ESCAPING_LINE = "SHAUNDI_SOS11_GENERALFLEE_2"
   PLAYER_TAKE_THEM_OUT_LINE = "PLAYER_SOS11_AMBUSH_01"

   -- Sound effects

-- Distances

-- Percents and multipliers
   GENERALS_RIDE_HP_MULTIPLIER = 3
   GENERAL_HP_MULTIPLIER = 5
   HURRY_UP_PROMPT_PERCENT_OF_TIME = 0.75
   GENERALS_RIDE_START_MALL_LOOP_DAMAGE_PERCENT = .75

-- Time values
   MISSION_START_FADED_TIME_SECONDS = 3.0

   GET_TO_AMBUSH_TIME_MS = 110000

   BODYGUARD_LIMO_EXIT_DELAY_SECONDS = 10
   LIMO_CATCH_FIRE_DELAY_SECONDS = 30
   BUS_DRIVER_EXIT_DELAY_SECONDS = 7
   GENERAL_EXIT_LIMO_DELAY_SECONDS = 2
   LIMO_EXPLODE_DELAY_SECONDS = 4
   GENERAL_MALL_CHECKPOINT_DELAY_SECONDS = 2.0


   DRIVER_GRENADE_THROW_INTERVAL_SECONDS = 10
   ATTACK_THE_PLAYER_TIME_SECONDS = 15
   GENERALS_RIDE_PAUSE_DELAY_SECONDS = 12
   BETWEEN_GENERAL_ATTACKS_TIME_SECONDS = 12
   BETWEEN_GENERAL_PAUSES_DELAY_SECONDS = 6

   VS_VEHICLE_RESPAWN_DELAY_SECONDS = 30

   -- How long elapses between the left-hand and right-hand groups of squad three
   -- attacking the player
   BETWEEN_SQUAD_THREE_GROUPS_ATTACK_SECONDS = 3.0

   -- How many members of squad three must die before we spawn squad 4
   SQUAD_THREE_KILL_BEFORE_SPAWN_COUNT = 4

   -- How many members of squad four must be killed before we bump up Samedi notoriety
   SQUAD_FOUR_KILL_BEFORE_NOTORIETY_INCREASE = sizeof_table( MALL_SQUAD_MEMBERS[4] )

-- Speeds
   ATV_DROPOFF_SPEED_MPH = 25
   GENERALS_RIDE_PATH_START_SPEED_MPH = 20

-- Chunks
   MALL_CHUNK_NAME = "sr2_ug_chunk159_MallA"

-- Constant values and counts
   NUM_ESCORT_MEMBERS = sizeof_table( BODYGUARD_GROUP_MEMBERS ) +
                        sizeof_table( FIRST_DEFENDER_GROUP_MEMBERS ) +
                        sizeof_table( SECOND_DEFENDER_GROUP_MEMBERS )
-- Global variables
   Generals_ride_pathing_thread_handle = INVALID_THREAD_HANDLE
   Generals_ride_driver_throw_grenades_thread_handle = INVALID_THREAD_HANDLE

   Generals_ride_stop_cycle_thread_handle = INVALID_THREAD_HANDLE
   Generals_ride_attack_dispatcher_thread_handle = INVALID_THREAD_HANDLE

   Generals_ride_attacking_player_outside_of_arena_thread_handle = INVALID_THREAD_HANDLE

   Generals_ride_attacking_player = false
   Generals_ride_stopped = false

   Players_in_arena = { [LOCAL_PLAYER] = false, [REMOTE_PLAYER] = false }
   Players_went_underground = { [LOCAL_PLAYER] = false, [REMOTE_PLAYER] = false }

   Num_escort_members_killed = 0

   Num_mall_squad_three_members_killed = 0
   Num_mall_squad_four_members_killed = 0

   Hurry_up_prompt_thread_handle = INVALID_THREAD_HANDLE
   Built_like_tank_line_played = false

   Current_path_direction = 0

   Controls_disabled = false
   Went_underground_state_switched = false

-- Returns true if both players are in the center of the food court, false otherwise.
--
function ss11_both_players_in_arena()
   if ( Players_in_arena[LOCAL_PLAYER] ) then
      if ( coop_is_active() ) then
         if ( Players_in_arena[REMOTE_PLAYER] ) then
            return true
         end
      else
         return true
      end
   end
   return false
end

function ss11_create_mall_groups( blocking )
	if ( blocking == nil ) then
		blocking = false
	end
	if ( group_is_loaded( SHAUNDI_DROPOFF_ATV_GROUP ) == false ) then
		group_create_hidden( SHAUNDI_DROPOFF_ATV_GROUP, blocking )
	end
	if ( group_is_loaded( PIERCE_DROPOFF_ATV_GROUP ) == false ) then
		group_create_hidden( PIERCE_DROPOFF_ATV_GROUP, blocking )
	end

	for index, group_name in pairs( VEHICLE_SHOW_GROUPS ) do
		if ( group_is_loaded( group_name ) == false ) then
			group_create_hidden( group_name, blocking )
		end
	end
end

-- Starts and sets up the mission. Also handles setting up the mission
-- correctly for checkpoints.
--
-- checkpoint_name: Name of checkpoint to resume the mission from.
--
function ss11_start( checkpoint_name, is_restart )
	-- Start trigger is hit...the activate button was hit
	set_mission_author("Mark G. and Brad Johnson")

   character_slots_cap_for_team( "ronin", 1 )
   character_slots_cap_for_team( "police", 1 )
	chainsaw_disable()

   fade_out( 0 )
	
   local next_state

   player_controls_disable( LOCAL_PLAYER )
   if ( coop_is_active() ) then
      player_controls_disable( REMOTE_PLAYER )
   end

   if ( checkpoint_name == MISSION_START_CHECKPOINT ) then
		-- The starter groups are this in single player
		local start_groups = { SHAUNDI_GROUP, STARTER_CAR_GROUP, AMBUSHER_SAINTS_GROUP }
		-- If we're running in coop, append an extra group to the end
		if ( coop_is_active() ) then
			start_groups = { SHAUNDI_GROUP, STARTER_CAR_GROUP, AMBUSHER_SAINTS_GROUP, STARTER_CAR_COOP_GROUP }
		end

		if (not is_restart) then
			cutscene_play( CT_INTRO, start_groups, { LOCAL_PLAYER_START, REMOTE_PLAYER_START }, false )
			for index, group_name in pairs( start_groups ) do
				group_show( group_name )
			end
		else
			for index, group_name in pairs( start_groups ) do
				group_create( group_name, true )
			end
			-- Teleport the player last - helps with load times
			teleport_coop( LOCAL_PLAYER_START, REMOTE_PLAYER_START )
		end
	end

   -- Set up failure conditions for Shaundi dying and being abandoned
   on_death( "ss11_follower_died", SHAUNDI_NAME )
   on_dismiss( "ss11_follower_dismissed", SHAUNDI_NAME )

   if ( checkpoint_name == MISSION_START_CHECKPOINT ) then
      for index, override in pairs( SHAUNDI_PERSONA_OVERRIDES ) do
         persona_override_character_start( SHAUNDI_NAME, override[1], override[2] )
      end
      party_add( SHAUNDI_NAME, LOCAL_PLAYER )

      -- Set up failure conditions for Shaundi dying and being abandoned
      on_death( "ss11_follower_died", SHAUNDI_NAME )
      on_dismiss( "ss11_follower_dismissed", SHAUNDI_NAME )

      next_state = MS_TRAVEL_TO_AMBUSH_LOCATION
   elseif ( checkpoint_name == REACHED_AMBUSH_LOCATION_CHECKPOINT ) then
      group_create( AMBUSHER_SAINTS_GROUP, true )
      if ( group_is_loaded( SHAUNDI_GROUP ) == false ) then
         group_create( SHAUNDI_GROUP, true )
      end
      local disable_controls_required = false
      ss11_setup_ambush( disable_controls_required )
      next_state = "Puerto Rico"
      next_state = MS_ABOVEGROUND_FIREFIGHT
   elseif ( checkpoint_name == GENERAL_FIGHT_CHECKPOINT ) then
		-- We need the mall groups immediately at this point, so load them blocking
		ss11_create_mall_groups( true )

      if ( group_is_loaded( SHAUNDI_GROUP ) == false ) then
         group_create( SHAUNDI_GROUP, true )
      end
      local resuming_from_checkpoint = true

      -- Setup the ambient vehicles for the vehicle show
      ss11_setup_vehicle_show()
      ss11_hide_food_court_tables_and_chairs()

      ss11_setup_generals_ride_fight( resuming_from_checkpoint )
   end

   player_controls_enable( LOCAL_PLAYER )
   if ( coop_is_active() ) then
      player_controls_enable( REMOTE_PLAYER )
   end

	notoriety_allow_indoor_gang_spawning(true)

   fade_in( MISSION_START_FADED_TIME_SECONDS )

	if ( checkpoint_name == MISSION_START_CHECKPOINT or
		  checkpoint_name == REACHED_AMBUSH_LOCATION_CHECKPOINT ) then
		-- Create groups that will be used in the mall non-blocking since they have time to
		-- stream in
		ss11_create_mall_groups( false )
	end

   -- Don't let the player go underground using these triggers. He should
   -- only be able to go underground when we enable the mission-specific trigger,
   -- which isn't use-activated like these are.
   trigger_enable( DEFAULT_ENTER_UG_MALL_TRIGGER, false )
   trigger_enable( DEFAULT_LEAVE_UG_MALL_TRIGGER, false )

   ss11_switch_state( next_state )
end

-- Called when one of the Samedi defending the General outside the mall
-- gets killed. They are required kills - when all are delt with, the
-- General runs away and the mission proceeds with the player giving
-- chase.
--
function ss11_general_outside_defender_killed( defender_name )
   marker_remove_npc( defender_name, SYNC_ALL )

   Num_escort_members_killed = Num_escort_members_killed + 1

   objective_text( 0, HT_X_OF_Y_ESCORT_MEMBERS_KILLED, Num_escort_members_killed,
                   NUM_ESCORT_MEMBERS, SYNC_ALL )

   if ( Num_escort_members_killed == NUM_ESCORT_MEMBERS ) then
      ss11_switch_state( MS_GENERAL_ESCAPING_UNDERGROUND )
   end
end

function ss11_generals_limo_hit( name, attacker )
   if ( Built_like_tank_line_played == false and
        ( attacker == LOCAL_PLAYER or attacker == REMOTE_PLAYER ) ) then
      audio_play_for_character( SHAUNDI_LIMO_BUILT_LIKE_TANK_LINE, SHAUNDI_NAME, "voice", false, false )
      Built_like_tank_line_played = true
   end
end

-- Sets up the ambush. The Saints are ambushing the General and have
-- people surrounding his expected stop point.
--
-- disable_controls_required: (optional) Whether or not we need to disable the player's
-- controls. Defaults to true.
function ss11_setup_ambush( disable_controls_required )
   if ( disable_controls_required == nil ) then
      disable_controls_required = true
   end

   spawning_vehicles( false )
   thread_yield()
   -- Clear out the starter cars so they don't mess with the spawning
   if ( group_is_loaded( STARTER_CAR_GROUP ) ) then
      group_destroy( STARTER_CAR_GROUP )
   end
   if ( group_is_loaded( STARTER_CAR_COOP_GROUP ) ) then
      group_destroy( STARTER_CAR_COOP_GROUP )
   end
   -- Disable control during the ambush
   if ( disable_controls_required ) then
      player_controls_disable( LOCAL_PLAYER )
      if ( coop_is_active() ) then
         player_controls_disable( REMOTE_PLAYER )
      end
      Controls_disabled = true
   end
   teleport_coop( LOCAL_PLAYER_AMBUSH_LOCATION, REMOTE_PLAYER_AMBUSH_LOCATION, true )
   teleport( SHAUNDI_NAME, LOCAL_PLAYER_AMBUSH_LOCATION )

   -- Create the Samedi groups
   group_create( THE_GENERAL_GROUP, true )
   group_create( GENERALS_LIMO_GROUP, true )
   group_create( LIMO_DEFENDERS_GROUP, true )
   group_create( BUS_GROUP, true )

   -- The General shouldn't be affected by or affect the fight.
   turn_invulnerable( THE_GENERAL_NAME )
   inv_item_remove_all( THE_GENERAL_NAME )
   for index, override in pairs( THE_GENERAL_PERSONA_OVERRIDES ) do
      persona_override_character_start( THE_GENERAL_NAME, override[1], override[2] )
   end

   turn_invulnerable( GENERALS_LIMO )
   on_take_damage( "ss11_generals_limo_hit", GENERALS_LIMO )
   vehicle_enter_teleport( BODYGUARD_GROUP_MEMBERS[1], GENERALS_LIMO, 0, true )
   vehicle_enter_teleport( THE_GENERAL_NAME, GENERALS_LIMO, 2, true )
   vehicle_suppress_npc_exit( GENERALS_LIMO, true )
   vehicle_prevent_explosion_fling( GENERALS_LIMO, true )
   vehicle_infinite_mass( GENERALS_LIMO, true )
   vehicle_set_bulletproof_glass( GENERALS_LIMO, true ) 
   vehicle_speed_override( GENERALS_LIMO, 0 )
   vehicle_enter_teleport( BUS_DRIVER_NAME, BUS, 0, true )
   vehicle_suppress_npc_exit( BUS, true )
   set_unjackable_flag( GENERALS_LIMO, true )
   vehicle_speed_override( BUS, 0 )
   vehicle_enter_group_teleport( FIRST_DEFENDER_GROUP_MEMBERS, FIRST_DEFENDER_GROUP_VEHICLE )
   vehicle_enter_group_teleport( SECOND_DEFENDER_GROUP_MEMBERS, SECOND_DEFENDER_GROUP_VEHICLE )

   ss11_setup_required_kill_defenders_group( FIRST_DEFENDER_GROUP_MEMBERS )
   ss11_setup_required_kill_defenders_group( SECOND_DEFENDER_GROUP_MEMBERS )
   ss11_setup_required_kill_defenders_group( BODYGUARD_GROUP_MEMBERS )

   -- Give the players control
   if ( disable_controls_required ) then
      player_controls_enable( LOCAL_PLAYER )
      if ( coop_is_active() ) then
         player_controls_enable( REMOTE_PLAYER )
      end
      Controls_disabled = false
   end
   spawning_vehicles( true )
end

function ss11_prompt_hurry_up()
   delay( HURRY_UP_PROMPT_PERCENT_OF_TIME * ( GET_TO_AMBUSH_TIME_MS / 1000.0 ) )
end

function ss11_setup_required_kill_defenders_group( group_members )
   for index, name in ipairs( group_members ) do
      mission_debug( "markering member "..index..": "..name, 15 )
      marker_add_npc( name, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL )
      on_death( "ss11_general_outside_defender_killed", name )
   end
end

-- Failure function for critical follower dying
--
function ss11_follower_died( follower_name )
   if ( follower_name == SHAUNDI_NAME ) then
      mission_end_failure( MISSION_NAME, HT_SHAUNDI_DIED )
   end
end

-- Failure function for critical follower being dismissed or being abandoned
--
function ss11_follower_dismissed( follower_name )
   if ( follower_name == SHAUNDI_NAME ) then
      mission_end_failure( MISSION_NAME, HT_SHAUNDI_ABANDONED )
   end
end

-- Cleans up the mission and restores the game to an acceptable state
--
function ss11_cleanup()
	-- Cleanup mission here
   -- Restore the in-game enter-leave triggers for the UG mall now that
   -- the mission is over.
   trigger_enable( DEFAULT_ENTER_UG_MALL_TRIGGER, true )
   trigger_enable( DEFAULT_LEAVE_UG_MALL_TRIGGER, true )
   notoriety_set_min( ENEMY_GANG, 0 )
   notoriety_set( ENEMY_GANG, 0 )
   notoriety_set_min( "police", 0 )
   notoriety_set( "police", 0 )
	chainsaw_enable()
   spawning_allow_gang_team_ambient_spawns( HUMAN_TEAM_SAMEDI, true )
	notoriety_allow_indoor_gang_spawning(false)
	spawning_vehicles( true )
	spawning_pedestrians( true, true )

   on_vehicle_enter( "", LOCAL_PLAYER )
   if ( coop_is_active() ) then
      on_vehicle_enter( "", REMOTE_PLAYER )
   end

   if ( Controls_disabled ) then
      player_controls_enable( LOCAL_PLAYER )
      if ( coop_is_active() ) then
         player_controls_enable( REMOTE_PLAYER )
      end
   end

   hud_timer_stop( 0 )
   spawning_vehicles( true )
   character_slots_clear_caps()
end

function ss11_take_out_general_dialog()
   audio_play_conversation( TAKE_OUT_GENERAL_DIALOG_STREAM, NOT_CALL )
end

function ss11_shaundi_blah( triggerer_name, trigger_name )
   trigger_enable( trigger_name, false )
   delay( 20 )
   audio_play_conversation( INTRO_DIALOG_STREAM, NOT_CALL )
end

-- Switches the mission to a new state.
--
-- new_state: Name of the new state to switch to.
--
function ss11_switch_state( new_state )
   if ( new_state == MS_TRAVEL_TO_AMBUSH_LOCATION ) then
      -- Add callback for the player getting a phone call from Shaundi
      trigger_enable( SAINTS_PARKING_LOT_AREA_TRIGGER, true )
      on_trigger_exit( "ss11_shaundi_blah", SAINTS_PARKING_LOT_AREA_TRIGGER )

      hud_timer_set( 0, GET_TO_AMBUSH_TIME_MS, "ss11_missed_ambush" )
      Hurry_up_prompt_thread_handle = thread_new( "ss11_prompt_hurry_up" )

      -- Enable trigger
      trigger_enable( AMBUSH_LOCATION_TRIGGER, true )
      on_trigger( "ss11_reached_ambush_location", AMBUSH_LOCATION_TRIGGER )

      -- Let the player know what he should be doing
      -- Prompt
      mission_help_table( HT_GET_TO_AMBUSH )
      -- Location marker and GPS path
      marker_add_trigger( AMBUSH_LOCATION_TRIGGER, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL )
      waypoint_add( AMBUSH_LOCATION_TRIGGER, SYNC_ALL )
   elseif ( new_state == MS_CUTSCENE ) then
      -- Play the cutscene
      cutscene_play( CT_COLLISION )

      fade_out( 0 )

      -- Setup the ambush groups
      ss11_setup_ambush()
      fade_in( 1.0 )
      release_to_world( AMBUSHER_SAINTS_GROUP )

      mission_set_checkpoint( REACHED_AMBUSH_LOCATION_CHECKPOINT )

      ss11_switch_state( MS_ABOVEGROUND_FIREFIGHT )

      -- Set the checkpoint
   elseif ( new_state == MS_ABOVEGROUND_FIREFIGHT ) then
      thread_new( "ss11_take_out_general_dialog" )

      notoriety_set_min( ENEMY_GANG, 3 )
      -- Spawn threads for the general's bodyguards getting out, the general
      -- getting out, the bus driver getting out, and the defender cars coming to help
      thread_new( "ss11_generals_bodyguards_get_out" )
      thread_new( "ss11_bus_driver_get_out" )
      thread_new( "ss11_defender_cars_come_help" )
      delay( 5.0 )
      mission_help_table( HT_FINISH_OFF_ESCORTS )
      objective_text( 0, HT_X_OF_Y_ESCORT_MEMBERS_KILLED, 0, NUM_ESCORT_MEMBERS, SYNC_ALL )
   elseif ( new_state == MS_GENERAL_ESCAPING_UNDERGROUND ) then
      -- Set the limo on fire, have the general get out, and have him run to
      -- the UG mall entrance
      turn_vulnerable( GENERALS_LIMO )
      --vehicle_set_smoke_and_fire_state( GENERALS_LIMO, true, true )
      delay( GENERAL_EXIT_LIMO_DELAY_SECONDS )
      ss11_setup_general_for_escape()
      local general_escape_thread_handle = thread_new( "ss11_general_escape" )
      delay( LIMO_EXPLODE_DELAY_SECONDS )
      vehicle_infinite_mass( GENERALS_LIMO, false )
      vehicle_prevent_explosion_fling( GENERALS_LIMO, false )
      vehicle_detonate( GENERALS_LIMO )

      if ( thread_check_done( general_escape_thread_handle ) == false ) then   
         delay( 5.0 )
         if ( thread_check_done( general_escape_thread_handle ) == false ) then
            thread_kill( general_escape_thread_handle )
            ss11_guide_player_to_chase_the_general()
         end
      end

      ss11_general_clear_escape_flags()
   elseif ( new_state == MS_THROUGH_THE_MALL_FIREFIGHT ) then
      -- Load the Samedi groups - make it blocking to be safer
      fade_out( 0 )
      player_controls_disable( LOCAL_PLAYER )
      if ( coop_is_active() ) then
         player_controls_disable( REMOTE_PLAYER )
      end
      if ( group_is_loaded( MALL_SAMEDI ) == false ) then
         group_create( MALL_SAMEDI, true )
      end
      group_create_hidden( MALL_SQUAD_THREE_GROUP, true )
      group_create_hidden( MALL_SQUAD_FOUR_GROUP, true )

      -- Setup the ambient vehicles for the vehicle show
      ss11_setup_vehicle_show()
	  
	  notoriety_set ( "police", 0 )
	  notoriety_set_max ( "police", 0 )

      player_controls_enable( LOCAL_PLAYER )
      if ( coop_is_active() ) then
         player_controls_enable( REMOTE_PLAYER )
      end
      fade_in( 0 )

      -- Let the player know what he needs to do in the mall
      mission_help_table( HT_TRACK_DOWN_GENERAL )

      trigger_enable( SQUAD_ONE_ATTACK_TRIGGER, true )
      on_trigger( "ss11_squad_one_attack", SQUAD_ONE_ATTACK_TRIGGER )

      trigger_enable( PAST_SQUAD_ONE_TRIGGER, true )
      on_trigger( "ss11_passed_squad_one", PAST_SQUAD_ONE_TRIGGER )

      trigger_enable( PAST_SQUAD_TWO_TRIGGER, true )
      on_trigger( "ss11_passed_squad_two", PAST_SQUAD_TWO_TRIGGER )

      for member_index, member_name in pairs( MALL_SQUAD_MEMBERS[3] ) do
         on_death( "ss11_mall_squad_three_member_died", member_name )
      end

      for member_index, member_name in pairs( MALL_SQUAD_MEMBERS[4] ) do
         on_death( "ss11_mall_squad_four_member_died", member_name )
      end

      trigger_enable( GENERAL_BATTLE_TRIGGER, true )
      marker_add_trigger( GENERAL_BATTLE_TRIGGER, MINIMAP_ICON_LOCATION, "", SYNC_ALL )
      on_trigger( "ss11_start_battle", GENERAL_BATTLE_TRIGGER )
      -- make ambient peds flee
      thread_new("ss11_ambient_npcs_flee")

      ss11_hide_food_court_tables_and_chairs()
   elseif ( new_state == MS_GENERAL_BOSS_BATTLE_DRIVING_PART ) then
      -- Clear on-death callbacks for the squads because they shouldn't change mission behavior
      -- after this point
      for member_index, member_name in pairs( MALL_SQUAD_MEMBERS[3] ) do
         if ( character_is_dead( member_name ) == false ) then
            on_death( "", member_name )
         end
      end
      for member_index, member_name in pairs( MALL_SQUAD_MEMBERS[4] ) do
         if ( character_is_dead( member_name ) == false ) then
            on_death( "", member_name )
         end
      end
	  
	 -- Setup the fight
      ss11_setup_generals_ride_fight()

   elseif ( new_state == MS_GENERAL_BOSS_BATTLE_ON_FOOT_PART ) then
   end
end

function ss11_get_vs_vehicle_index_from_name( vehicle_to_find )
   for index, vehicle_name in pairs( VEHICLE_SHOW_VEHICLES ) do
      if ( vehicle_name == vehicle_to_find ) then
         return index
      end
   end

   return -1
end

function ss11_respawn_vehicle_group( vehicle_index )
   release_to_world( VEHICLE_SHOW_GROUPS[vehicle_index] )
   group_create_hidden( VEHICLE_SHOW_GROUPS[vehicle_index] )
   delay( VS_VEHICLE_RESPAWN_DELAY_SECONDS )

   local vehicle_in_view = true

   repeat
      thread_yield()
      vehicle_in_view = navpoint_in_player_fov( VEHICLE_SHOW_VEHICLES[vehicle_index], LOCAL_PLAYER )
      if ( coop_is_active() and vehicle_in_view == false ) then
         vehicle_in_view = navpoint_in_player_fov( VEHICLE_SHOW_VEHICLES[vehicle_index], REMOTE_PLAYER )
      end
   until ( vehicle_in_view == false )

   group_show( VEHICLE_SHOW_GROUPS[vehicle_index] )
end

function ss11_entered_vs_vehicle( player_name, vehicle_name )
   local vehicle_index = ss11_get_vs_vehicle_index_from_name( vehicle_name )

   thread_new( "ss11_respawn_vehicle_group", vehicle_index )
end

function ss11_setup_vehicle_show()
   -- Show the vehicle show groups
   for index, group_name in pairs( VEHICLE_SHOW_GROUPS ) do
      group_show( group_name )
      on_vehicle_enter( "ss11_entered_vs_vehicle", VEHICLE_SHOW_VEHICLES[index] )
   end
end

-- Causes all the members of the first mall squad to attack the player when he
-- gets close enough.
--
function ss11_squad_one_attack( triggerer_name, trigger_name )
   trigger_enable( trigger_name, false )

   for member_index, member_name in pairs( MALL_SQUAD_MEMBERS[1] ) do
      attack_safe( member_name, triggerer_name )
   end
end

-- Called when the player passes the first squad. Unleashes any squad members that
-- are still alive and leashed, and tells the second squad to attack the player.
--
function ss11_passed_squad_one( triggerer_name, trigger_name )
   trigger_enable( trigger_name, false )

   for member_index, member_name in pairs( MALL_SQUAD_LEASHED_MEMBERS[1] ) do
      if ( character_is_dead( member_name ) == false ) then
         npc_leash_remove( member_name )
      end
   end

   for member_index, member_name in pairs( MALL_SQUAD_MEMBERS[2] ) do
      attack_safe( member_name, triggerer_name )
   end
end

-- Called when the player passes the second squad. Unleashes any squad members that
-- are still alive and leashed, and unhides the third squad and has it attack the
-- player.
--
function ss11_passed_squad_two( triggerer_name, trigger_name )
   trigger_enable( trigger_name, false )

   -- Remove the leashes from Squad 2 members that we've passed
   for member_index, member_name in pairs( MALL_SQUAD_LEASHED_MEMBERS[2] ) do
      if ( character_is_dead( member_name ) == false ) then
         npc_leash_remove( member_name )
      end
   end

   -- Show the third squad
   group_show( MALL_SQUAD_THREE_GROUP )

   -- Have the left-hand portion of it attack
   for member_index, member_name in pairs( MALL_SQUAD_THREE_LEFT_SIDE_MEMBERS ) do
      attack_safe( member_name, triggerer_name )
   end

   -- Delay, then have the right-hand portion of it attack
   delay( BETWEEN_SQUAD_THREE_GROUPS_ATTACK_SECONDS )

   for member_index, member_name in pairs( MALL_SQUAD_THREE_RIGHT_SIDE_MEMBERS ) do
      local distance, player_name = get_dist_closest_player_to_object( member_name )
      attack_safe( member_name, player_name )
   end
end


-- Death tracking function for squad three. If enough members die before the
-- fight with the General, group four is spawned.
--
function ss11_mall_squad_three_member_died()
   Num_mall_squad_three_members_killed = Num_mall_squad_three_members_killed + 1
   if ( Num_mall_squad_three_members_killed == SQUAD_THREE_KILL_BEFORE_SPAWN_COUNT ) then
      group_show( MALL_SQUAD_FOUR_GROUP )
      for member_index, member_name in pairs( MALL_SQUAD_MEMBERS[4] ) do
         local distance, player_name = get_dist_closest_player_to_object( member_name )
         attack_safe( member_name, player_name )
      end
   end
end

-- Death tracking function for squad four. If enough members die before the
-- fight with the General, Samedi notoriety is maxed out.
--
function ss11_mall_squad_four_member_died()
   Num_mall_squad_four_members_killed = Num_mall_squad_four_members_killed + 1

   if ( Num_mall_squad_four_members_killed == SQUAD_FOUR_KILL_BEFORE_NOTORIETY_INCREASE ) then
      notoriety_set_min( ENEMY_GANG, MAX_NOTORIETY_LEVEL )
   end
end

function ss11_assure_entry_success( character_name, vehicle_name, seat_index )
	repeat
		vehicle_enter_teleport( character_name, vehicle_name, seat_index, false )
		delay( 0.25 )
	until ( character_is_in_vehicle( character_name, vehicle_name ) )
end

function ss11_setup_generals_ride_fight( resuming_from_checkpoint )
   if ( resuming_from_checkpoint == nil ) then
      resuming_from_checkpoint = false
   end

   -- Remove Shaundi from the player's party
   on_dismiss( "", SHAUNDI_NAME )
   on_death( "", SHAUNDI_NAME )
   party_dismiss( SHAUNDI_NAME )
   group_hide( SHAUNDI_GROUP )
   group_destroy( SHAUNDI_GROUP )
   group_create_hidden( SHAUNDI_GROUP, true )
   
   notoriety_set ( "police", 0 )
   notoriety_set_max ( "police", 0 )

	script_profiler_reset()

   -- If we're supposed to play the cutscene, set it up and do it
   if ( resuming_from_checkpoint == false ) then
		cutscene_play( CUTSCENE_NAME, "", { GENERAL_BATTLE_LOCAL_PLAYER_WARP, GENERAL_BATTLE_REMOTE_PLAYER_WARP }, false )
		script_profiler_start_section( "Post CT: Part 1" )
		spawning_vehicles( false )
		spawning_pedestrians( false, true )

      player_controls_disable( LOCAL_PLAYER )
      if ( coop_is_active() ) then
         player_controls_disable( REMOTE_PLAYER )
      end
      Controls_disabled = true

		group_hide( "ss11_$GCTE" )
		group_destroy( "ss11_$GCTE" )
		group_create( GENERALS_RIDE_GROUP, true )
      teleport( THE_GENERAL_NAME, GENERAL_BEHIND_PILLAR )
      character_show( THE_GENERAL_NAME )
      vehicle_suppress_npc_exit( GENERALS_RIDE, true )
		script_profiler_end_section( "Post CT: Part 1" )

   -- Otherwise, we're doing a checkpoint, so just create the groups
   -- we don't have
   else
		spawning_vehicles( false )
		spawning_pedestrians( false, true )
      group_create( THE_GENERAL_GROUP, true )
      group_create( GENERALS_RIDE_GROUP, true )
      vehicle_suppress_npc_exit( GENERALS_RIDE, true )
   end
	spawning_vehicles( true )
	spawning_pedestrians( true, true )

   -- Tell the players to kill the General!
   marker_add_npc( THE_GENERAL_NAME, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL )

   -- Load up the ride
	script_profiler_start_section( "Post CT: Teleport Entry" )
	thread_new( "ss11_assure_entry_success", GENERALS_RIDE_DRIVER_NAME, GENERALS_RIDE, 0 )
	thread_new( "ss11_assure_entry_success", THE_GENERAL_NAME, GENERALS_RIDE, 1 )
	thread_new( "ss11_assure_entry_success", GENERALS_RIDE_AK_GUYS[1], GENERALS_RIDE, 2 )
	thread_new( "ss11_assure_entry_success", GENERALS_RIDE_AK_GUYS[2], GENERALS_RIDE, 3 )
	delay( .2 )
	script_profiler_end_section( "Post CT: Teleport Entry" )

	script_profiler_start_section( "Post CT: Misc" )
   -- Setup the people riding with the General to allow for a proper boss battle
   turn_invulnerable( GENERALS_RIDE_AK_GUYS[1] )
   turn_invulnerable( GENERALS_RIDE_AK_GUYS[2] )
   turn_invulnerable( GENERALS_RIDE_DRIVER_NAME )
   turn_invulnerable( THE_GENERAL_NAME )

   set_seatbelt_flag( GENERALS_RIDE_DRIVER_NAME, true )
   set_seatbelt_flag( THE_GENERAL_NAME, true )
   set_seatbelt_flag( GENERALS_RIDE_AK_GUYS[1], true )
   set_seatbelt_flag( GENERALS_RIDE_AK_GUYS[2], true )


   -- Prevent the General's ride from flipping over - it makes the battle too easy
   vehicle_suppress_flipping( GENERALS_RIDE, true )

   -- Setup the General's ride for a proper boss battle
   local standard_hit_points = get_max_hit_points(GENERALS_RIDE)
   local generals_ride_hp = GENERALS_RIDE_HP_MULTIPLIER * standard_hit_points
   set_max_hit_points( GENERALS_RIDE, generals_ride_hp )
   set_current_hit_points(GENERALS_RIDE, generals_ride_hp )
   set_unjackable_flag( GENERALS_RIDE, true )

   -- Start the AI mode for the General's car
   local distance, closest_player = get_dist_closest_player_to_object( GENERALS_RIDE )
   Generals_ride_attacking_player_outside_of_arena_thread_handle = thread_new( "ss11_generals_ride_chase_attack_player", closest_player )
   Generals_ride_driver_throw_grenades_thread_handle = thread_new( "ss11_generals_ride_driver_throw_grenades" )
   on_vehicle_destroyed( "ss11_generals_ride_destroyed", GENERALS_RIDE )
   damage_indicator_on( 0, GENERALS_RIDE, 0, HT_GENERALS_RIDE_HP, generals_ride_hp )

   -- Trigger stuff used by the boss battle AI
   trigger_enable( GENERAL_BATTLE_AREA_TRIGGER, true )
   on_trigger( "ss11_entered_battle_area", GENERAL_BATTLE_AREA_TRIGGER )
   on_trigger_exit( "ss11_left_battle_area", GENERAL_BATTLE_AREA_TRIGGER )

   -- Switch to the "loop around the mall" state if he's damaged enough
   on_damage( "ss11_generals_ride_start_around_the_mall_path", GENERALS_RIDE,
              GENERALS_RIDE_START_MALL_LOOP_DAMAGE_PERCENT )

	script_profiler_end_section( "Post CT: Misc" )

   -- Only enable the player's controls and fade in if the opposite things were done above
   if ( resuming_from_checkpoint == false ) then
		script_profiler_start_section( "Post CT: Reenable" )
      player_controls_enable( LOCAL_PLAYER )
      if ( coop_is_active() ) then
         player_controls_enable( REMOTE_PLAYER )
      end
      Controls_disabled = false
		script_profiler_end_section( "Post CT: Reenable" )
      fade_in( 1.0 )

      mission_set_checkpoint( GENERAL_FIGHT_CHECKPOINT )
   end
	script_profiler_do_printout()

   mission_help_table( HT_KILL_THE_GENERAL )
end

-- Called when the player doesn't reach it to the ambush location on time.
--
function ss11_missed_ambush()
   mission_end_failure( MISSION_NAME, HT_DIDNT_MAKE_IT_TO_AMBUSH_IN_TIME )
end

function ss11_maybe_kill_thread( thread_handle )
   if ( thread_handle ~= INVALID_THREAD_HANDLE ) then
      thread_kill( thread_handle )
   end
end

function ss11_maybe_speed_override( triggerer_name, speed_mph )
   if ( triggerer_name ~= nil ) then
      if ( character_is_in_vehicle( triggerer_name, GENERALS_RIDE ) ) then
         vehicle_speed_override( GENERALS_RIDE, speed_mph )
      end
   end
end

function ss11_speed_20( triggerer_name, trigger_name )
   ss11_maybe_speed_override( triggerer_name, 20 )
end

function ss11_speed_25( triggerer_name, trigger_name )
   ss11_maybe_speed_override( triggerer_name, 25 )
end

function ss11_speed_30( triggerer_name, trigger_name )
   ss11_maybe_speed_override( triggerer_name, 30 )
end

function ss11_speed_35( triggerer_name, trigger_name )
   ss11_maybe_speed_override( triggerer_name, 35 )
end

function ss11_speed_40( triggerer_name, trigger_name )
   ss11_maybe_speed_override( triggerer_name, 40 )
end

function ss11_setup_speed_limit_triggers()

   for index, name in pairs( SPEED_LIMIT_20_TRIGGERS ) do
      trigger_enable( name, true )
      on_trigger( "ss11_speed_20", name )
   end

   for index, name in pairs( SPEED_LIMIT_25_TRIGGERS ) do
      trigger_enable( name, true )
      on_trigger( "ss11_speed_25", name )
   end

   for index, name in pairs( SPEED_LIMIT_30_TRIGGERS ) do
      trigger_enable( name, true )
      on_trigger( "ss11_speed_30", name )
   end

   for index, name in pairs( SPEED_LIMIT_35_TRIGGERS ) do
      trigger_enable( name, true )
      on_trigger( "ss11_speed_35", name )
   end

   for index, name in pairs( SPEED_LIMIT_40_TRIGGERS ) do
      trigger_enable( name, true )
      on_trigger( "ss11_speed_40", name )
   end
end

function ss11_generals_ride_start_around_the_mall_path()
   mission_debug( "starting around-the-mall path" )

   -- Stop the "ride around the food court" attack pattern.
   ss11_stop_circling_attack()

   thread_new( "ss11_generals_ride_do_mall_loop" )

   thread_new( "ss11_shaundi_and_maybe_pierce_appear" )
end

function ss11_generals_ride_do_mall_loop()
   -- Make sure we're not going crazy
   vehicle_speed_override( GENERALS_RIDE, GENERALS_RIDE_PATH_START_SPEED_MPH )
   vehicle_disable_chase( GENERALS_RIDE, true )

   -- Go to the path start
   vehicle_pathfind_to( GENERALS_RIDE, MALL_PATH_INITIAL, true, true )

   -- Enable the speed limits
   ss11_setup_speed_limit_triggers()

   -- Have the vehicle pathing around the mall continually ( until it's destroyed )
   while ( vehicle_is_destroyed( GENERALS_RIDE ) == false ) do
      for index, path_name in pairs( GENERALS_RIDE_MALL_AROUND_THE_MALL_PATHS ) do
         vehicle_pathfind_to( GENERALS_RIDE, path_name, true, false )
      end
      thread_yield()
   end
end

function ss11_shaundi_and_maybe_pierce_appear()
   group_show( SHAUNDI_GROUP )
   turn_invulnerable( SHAUNDI_NAME )
   teleport( SHAUNDI_NAME, SHAUNDI_NEAR_ATV_WARP )
   thread_new( "ss11_drop_off_atv", SHAUNDI_NAME )
   if ( coop_is_active() ) then
      thread_new( "ss11_drop_off_atv", PIERCE_NAME )
   end
end

function ss11_drop_off_atv( follower_name )
   -- Create the ATV
   group_show( DROPOFF_ATV_GROUPS[follower_name] )

   set_ignore_ai_flag( follower_name, true )
   character_prevent_flinching( follower_name, true )
   character_prevent_explosion_fling( follower_name, true )
   character_prevent_kneecapping( follower_name, true )
   turn_invulnerable( follower_name )

   -- Have the follower get in it
   vehicle_enter_teleport( follower_name, DROPOFF_ATVS[follower_name] )

   vehicle_speed_override( DROPOFF_ATVS[follower_name], ATV_DROPOFF_SPEED_MPH )

   -- Have it pathfind to the dropoff and have the follower get out
   vehicle_pathfind_to( DROPOFF_ATVS[follower_name], DROPOFF_ATV_PATHS[follower_name], true, true )
   vehicle_exit( follower_name )

   --mission_help_table( HT_TEMP_SHAUNDI_DROPOFF_ATV_LINE )
   delay( 2.0 )

   on_vehicle_enter( "ss11_entered_vehicle_during_chase", LOCAL_PLAYER )
   if ( coop_is_active() ) then
      on_vehicle_enter( "ss11_entered_vehicle_during_chase", REMOTE_PLAYER )
   end
   on_vehicle_enter( "ss11_entered_vehicle_during_chase", DROPOFF_ATVS[follower_name] )
   marker_add_vehicle( DROPOFF_ATVS[follower_name], MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_INTERACT, SYNC_ALL )

   -- Finally, have the follower run away
   mission_debug( "moving "..follower_name.." along "..DROPOFF_LEAVE_PATHS[follower_name], 15 )
   move_to( follower_name, DROPOFF_LEAVE_PATHS[follower_name], 2, true, false )

   character_hide( follower_name )
end

function ss11_entered_vehicle_during_chase()
   for index, atv_name in pairs( DROPOFF_ATVS ) do
      if ( vehicle_is_destroyed( atv_name ) == false ) then
         marker_remove_vehicle( atv_name, SYNC_ALL )
      end
   end
end

-- Stops the "ride around the food court" attack pattern.
--
function ss11_stop_circling_attack()
   ss11_maybe_kill_thread( Generals_ride_pathing_thread_handle )
   Generals_ride_pathing_thread_handle = INVALID_THREAD_HANDLE

   ss11_maybe_kill_thread( Generals_ride_driver_throw_grenades_thread_handle )
   Generals_ride_driver_throw_grenades_thread_handle = INVALID_THREAD_HANDLE

   ss11_maybe_kill_thread( Generals_ride_stop_cycle_thread_handle )
   Generals_ride_stop_cycle_thread_handle = INVALID_THREAD_HANDLE

   ss11_maybe_kill_thread( Generals_ride_attack_dispatcher_thread_handle )
   Generals_ride_attack_dispatcher_thread_handle = INVALID_THREAD_HANDLE

   ss11_maybe_kill_thread( Generals_ride_attacking_player_outside_of_arena_thread_handle )
   Generals_ride_attacking_player_outside_of_arena_thread_handle = INVALID_THREAD_HANDLE

   trigger_enable( GENERAL_BATTLE_AREA_TRIGGER, false )
end

-- Called when a player enters the center of the food court.
-- Keeps track of where the players are and calls appropriate logic
-- for the corresponding state.
--
-- triggerer_name: Name of the player that triggered the trigger.
-- trigger_name: Name of the trigger that was triggered.
--
function ss11_entered_battle_area( triggerer_name, trigger_name )
   mission_debug( triggerer_name.." entered battle arena" )
   -- Update the player location tracking
   Players_in_arena[triggerer_name] = true

   -- If both players are inside, then have the general's ride start circling.
   if ( ss11_both_players_in_arena() ) then
      if ( Generals_ride_attacking_player_outside_of_arena_thread_handle ~= INVALID_THREAD_HANDLE ) then
         thread_kill( Generals_ride_attacking_player_outside_of_arena_thread_handle )
         Generals_ride_attacking_player_outside_of_arena_thread_handle = INVALID_THREAD_HANDLE
      end

      Generals_ride_pathing_thread_handle = thread_new( "ss11_generals_ride_do_circle_pathing" )
      Generals_ride_stop_cycle_thread_handle = thread_new( "ss11_generals_ride_stop_cycle" )
      Generals_ride_attack_dispatcher_thread_handle = thread_new( "ss11_generals_ride_attack_dispatcher" )
   end
end

-- Called when a player leaves the center of the food court.
-- Keeps track of where the players are and calls appropriate logic
-- for the corresponding state.
--
-- triggerer_name: Name of the player that left the trigger.
-- trigger_name: Name of the trigger that was left.
--
function ss11_left_battle_area( triggerer_name, trigger_name )
   mission_debug( triggerer_name.." left battle arena" )

   -- Update the player location tracking
   Players_in_arena[triggerer_name] = false

   -- Cancel any currently running AI threads for the vehicle and have it
   -- attack the player that ventured outside
   thread_kill( Generals_ride_pathing_thread_handle )
   Generals_ride_pathing_thread_handle = INVALID_THREAD_HANDLE

   --thread_kill( Generals_ride_stop_cycle_thread_handle )
   --Generals_ride_stop_cycle_thread_handle = INVALID_THREAD_HANDLE

   thread_kill( Generals_ride_attack_dispatcher_thread_handle )
   Generals_ride_attack_dispatcher_thread_handle = INVALID_THREAD_HANDLE

   Generals_ride_attacking_player_outside_of_arena_thread_handle = thread_new( "ss11_generals_ride_chase_attack_player", triggerer_name )
end

function ss11_generals_ride_chase_attack_player( player_to_chase )
   vehicle_chase( GENERALS_RIDE, player_to_chase, false, true, false )
end

-- Deals with the General's ride being destroyed, including killing the
-- passengers and making sure that the General can get out and still
-- be a viable fighter for the next part of the mission.
--
function ss11_generals_ride_destroyed()
   damage_indicator_off( 0 )
   turn_vulnerable( GENERALS_RIDE_AK_GUYS[1] )
   turn_vulnerable( GENERALS_RIDE_AK_GUYS[2] )
   turn_vulnerable( GENERALS_RIDE_DRIVER_NAME )
   turn_vulnerable( THE_GENERAL_NAME )

   vehicle_suppress_npc_exit( GENERALS_RIDE, false )

   set_seatbelt_flag( GENERALS_RIDE_DRIVER_NAME, false )
   set_seatbelt_flag( THE_GENERAL_NAME, false )
   set_seatbelt_flag( GENERALS_RIDE_AK_GUYS[1], false )
   set_seatbelt_flag( GENERALS_RIDE_AK_GUYS[2], false )

   character_kill( GENERALS_RIDE_AK_GUYS[1] )
   character_kill( GENERALS_RIDE_AK_GUYS[2] )
   thread_kill( Generals_ride_driver_throw_grenades_thread_handle )
   if ( Generals_ride_pathing_thread_handle ~= INVALID_THREAD_HANDLE ) then
      thread_kill( Generals_ride_pathing_thread_handle )
      Generals_ride_pathing_thread_handle = INVALID_THREAD_HANDLE
   end
   character_kill( GENERALS_RIDE_DRIVER_NAME )

   character_kill( THE_GENERAL_NAME )

   mission_end_success( MISSION_NAME, CT_OUTRO )
--[[
   while ( character_is_ragdolled( THE_GENERAL_NAME ) ) do
      thread_yield()
   end

   -- Make the General more difficult
   turn_vulnerable( THE_GENERAL_NAME )
   character_prevent_flinching( THE_GENERAL_NAME, true )
   character_prevent_explosion_fling( THE_GENERAL_NAME, true )
   character_prevent_kneecapping( THE_GENERAL_NAME, true )

   on_death( "ss11_general_killed", THE_GENERAL_NAME )
   local player_max_hp = get_max_hit_points( LOCAL_PLAYER )
   local general_max_hp = player_max_hp * GENERAL_HP_MULTIPLIER

   inv_item_add( THE_GENERALS_SAW, 1, THE_GENERAL_NAME )
   inv_item_equip( THE_GENERALS_SAW, THE_GENERAL_NAME ) 

   set_max_hit_points( THE_GENERAL_NAME, general_max_hp )
   set_current_hit_points( THE_GENERAL_NAME, general_max_hp )
   damage_indicator_on( 0, THE_GENERAL_NAME, 0, HT_GENERALS_HP, general_max_hp )
]]
end

-- This function causes a passenger in the general's ride to throw grenades at a
-- random player every set number of seconds.
--
function ss11_generals_ride_driver_throw_grenades()
   -- Only throw grenades every so many seconds
   while ( true and ( character_is_dead( GENERALS_RIDE_DRIVER_NAME ) == false ) ) do
      delay( DRIVER_GRENADE_THROW_INTERVAL_SECONDS )

      -- By default, attack the local player
      local target = LOCAL_PLAYER

      -- but if coop is on, then possibly target the remote player
      if ( coop_is_active() ) then
         local which_player = rand_int( 1, 2 )
         if ( which_player == 2 ) then
            target = REMOTE_PLAYER
         end
      end

      force_throw_char( GENERALS_RIDE_DRIVER_NAME, target )
   end
end

function ss11_find_closest_nav_index_in_list_from_char( character_name, navpoints )
   -- Find the nearest path start
   local closest_index = 1
   local closest_distance = get_dist_char_to_nav( character_name, navpoints[1] )
   for index, name in navpoints do
      local cur_dist = get_dist_char_to_nav( character_name, name )
      if ( cur_dist < closest_distance ) then
         closest_distance = cur_dist
         closest_index = index
      end
   end

   return closest_index
end

-- Continually pathing around the center of the food court
--
function ss11_generals_ride_do_circle_pathing()
   -- Rollover to the next path direction ( this starts at 0, so 1 will be the first path. )
   -- The directions are counterclockwise or clockwise
   Current_path_direction = Current_path_direction + 1
   if ( Current_path_direction > sizeof_table( GENERALS_RIDE_PATHS_DIRECTIONS ) ) then
      Current_path_direction = 1
   end

   -- Find the list of path starts for this direction
   local current_path_starts = GENERALS_RIDE_PATH_STARTS_DIRECTIONS[Current_path_direction]
   -- Find the index of the path in this direction to path along
   local path_index =  ss11_find_closest_nav_index_in_list_from_char( THE_GENERAL_NAME,
                                                                      current_path_starts )
   -- Find the actual path we're using
   local current_path = GENERALS_RIDE_PATHS_DIRECTIONS[Current_path_direction][path_index]

   -- Path along this path
   local rode_to_a_stop = false
   while ( true ) do
      -- Pathfinding with looping support
      if ( Generals_ride_stopped == false ) then
         vehicle_pathfind_to( GENERALS_RIDE, current_path, true, false, true )
         rode_to_a_stop = false
      -- If we haven't already stopped, go to a stop
      -- We'll be waiting until "Generals_ride_stopped" is true again to resume pathing
      elseif ( rode_to_a_stop == false ) then
         vehicle_pathfind_to( GENERALS_RIDE, current_path, true, true, true )
         rode_to_a_stop = true
      end
      thread_yield()
   end
end

-- This function's purpose is to have the General's ride attack the
-- player ever so often, then resume circling the food court.
--
function ss11_generals_ride_attack_dispatcher()
   -- Continue attacking indefinitely
   while ( true ) do
      -- Only attack every so often
      delay( BETWEEN_GENERAL_ATTACKS_TIME_SECONDS )

      -- When it's time to do an attack, check to see if things are set up correctly for it
      if ( Generals_ride_stopped == false and Generals_ride_attacking_player == false ) then
         -- Stop circle pathing
         if ( Generals_ride_pathing_thread_handle ~= INVALID_THREAD_HANDLE ) then
            thread_kill( Generals_ride_pathing_thread_handle )
            Generals_ride_pathing_thread_handle = INVALID_THREAD_HANDLE
         end

         Generals_ride_attacking_player = true


         mission_debug( "attack!" )
         ss11_generals_ride_do_attack()
         Generals_ride_attacking_player = false
         Generals_ride_pathing_thread_handle = thread_new( "ss11_generals_ride_do_circle_pathing" )
      end
   end
end

-- This function causes the General's ride to stop circling ever so often.
--
function ss11_generals_ride_stop_cycle()
   while ( true ) do
      delay( BETWEEN_GENERAL_PAUSES_DELAY_SECONDS )

      -- When it's time to pause, check to see if this is a good time
      if ( Generals_ride_stopped == false and Generals_ride_attacking_player == false ) then
         -- 
         Generals_ride_stopped = true
         delay( GENERALS_RIDE_PAUSE_DELAY_SECONDS )
         Generals_ride_stopped = false
      end
   end
end

function ss11_generals_ride_do_attack()
   -- Attack
   local distance, player_name = get_dist_closest_player_to_object( GENERALS_RIDE )
   
   local attack_the_player_thread_handle = thread_new( "ss11_generals_ride_chase_attack_player", player_name )
   delay( ATTACK_THE_PLAYER_TIME_SECONDS )
   thread_kill( attack_the_player_thread_handle )
end

-- Begins the battle with the General when the player reaches the correct location
--
-- triggerer_name: The name of the player that triggered the battle
-- trigger_name: The name of the battle-triggering trigger
--
function ss11_start_battle( triggerer_name, trigger_name )
   -- No more trigger required
   trigger_enable( trigger_name, false )
   marker_remove_trigger( trigger_name, SYNC_ALL )

   -- Start the battle
   ss11_switch_state( MS_GENERAL_BOSS_BATTLE_DRIVING_PART )
end

-- Function that makes the bodyguards of the General get out of his wrecked limo.
--
function ss11_generals_bodyguards_get_out()
   delay( BODYGUARD_LIMO_EXIT_DELAY_SECONDS )
   for index, name in pairs( BODYGUARD_GROUP_MEMBERS ) do
      vehicle_exit( name )
   end
end

function ss11_setup_general_for_escape()

   set_unjackable_flag( GENERALS_LIMO, false )
   vehicle_suppress_npc_exit( GENERALS_LIMO, false )

   vehicle_exit( THE_GENERAL_NAME )

   character_prevent_flinching( THE_GENERAL_NAME, true )
   character_prevent_explosion_fling( THE_GENERAL_NAME, true )
   character_allow_ragdoll( THE_GENERAL_NAME, false )
   character_prevent_kneecapping( THE_GENERAL_NAME, true )

   set_ignore_ai_flag( THE_GENERAL_NAME, true )
   marker_add_npc( THE_GENERAL_NAME, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL )
end

-- Basic pathing function that hides the character after it paths
--
function ss11_general_escape()
   audio_play_for_character( SHAUNDI_GENERAL_IS_ESCAPING_LINE, SHAUNDI_NAME, "voice", false, false )
   move_to_safe( THE_GENERAL_NAME, UNDERGROUND_MALL_ENTRANCE, 3, true, false )

   ss11_guide_player_to_chase_the_general()
end

function ss11_guide_player_to_chase_the_general()
   marker_remove_npc( THE_GENERAL_NAME )
   character_hide( THE_GENERAL_NAME )

   trigger_enable( ENTER_UG_MALL_TELEPORT_TRIGGER, true )
   marker_add_trigger( ENTER_UG_MALL_TELEPORT_TRIGGER, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL )
   on_trigger( "ss11_player_went_underground", ENTER_UG_MALL_TELEPORT_TRIGGER )
   trigger_enable( PARKING_GARAGE_UG_MALL_TRIGGER, true )
   on_trigger( "ss11_player_went_underground", PARKING_GARAGE_UG_MALL_TRIGGER )
   mission_help_table( HT_GO_AFTER_GENERAL, "", "", SYNC_ALL )
   objective_text_clear( 0 )
end

-- Sets the General to "escaping" state, or deactivates said state.
--
function ss11_general_clear_escape_flags()
   character_prevent_flinching( THE_GENERAL_NAME, false )
   character_prevent_explosion_fling( THE_GENERAL_NAME, false )
   character_allow_ragdoll( THE_GENERAL_NAME, true )
   character_prevent_kneecapping( THE_GENERAL_NAME, false )
   set_ignore_ai_flag( THE_GENERAL_NAME, false )
end

function ss11_all_players_went_underground()
   if ( Players_went_underground[LOCAL_PLAYER] == true ) then
      if ( coop_is_active() ) then
         if ( Players_went_underground[REMOTE_PLAYER] == true ) then
            return true
         end
      else
         return true
      end
   end

   return false
end

-- Callback on player entering the underground trigger
--
function ss11_player_went_underground( triggerer_name, trigger_name )
   -- Disallow Samedi gang spawning while players are in the mall - it causes issues.
   spawning_allow_gang_team_ambient_spawns( HUMAN_TEAM_SAMEDI, false )

   if ( Players_went_underground[triggerer_name] == false ) then
      -- Remove the trigger's markers
      local sync_type = sync_from_player( triggerer_name )
      marker_remove_trigger( trigger_name, sync_type )

      -- If everyone's gone underground, disable all the go underground triggers
      Players_went_underground[triggerer_name] = true
      if ( ss11_all_players_went_underground() ) then
         trigger_enable( ENTER_UG_MALL_TELEPORT_TRIGGER, false )
         trigger_enable( PARKING_GARAGE_UG_MALL_TRIGGER, false )
      end

      thread_yield()
      if ( Went_underground_state_switched == false ) then
         Went_underground_state_switched = true
         ss11_switch_state( MS_THROUGH_THE_MALL_FIREFIGHT )
      end

      -- Only teleport the player if he used the elevator ( rather than walking in through the
      -- parking garage )
      if ( trigger_name == ENTER_UG_MALL_TELEPORT_TRIGGER ) then
         teleport( triggerer_name, DEFAULT_LEAVE_UG_MALL_TRIGGER )
      end

      -- If this was the local player, then Shaundi was teleported. Have her go idle so she
      -- doesn't attack people she can't possibly reach.
      if ( triggerer_name == LOCAL_PLAYER ) then
         npc_go_idle( SHAUNDI_NAME )
      end

   end
end

-- Hides all the tables and chairs in the food court so that they
-- don't get in the way of the battle.
--
function ss11_hide_food_court_tables_and_chairs()
   -- Hide all the chairs and tables
   for index, name in pairs( CHAIRS ) do
      mesh_mover_hide( name )
   end
   for index, name in pairs( TABLES ) do
      mesh_mover_hide( name )
   end
end

-- The bus driver needs a little while to recover from the bus crash,
-- so he doesn't get out immediately.
--
function ss11_bus_driver_get_out()
   delay( BUS_DRIVER_EXIT_DELAY_SECONDS )
   vehicle_exit( BUS_DRIVER_NAME )
end

-- force ambient pedestrians to flee the mall
--
function ss11_ambient_npcs_flee()
	while(1) do
		thread_yield()
		city_chunk_set_all_civilians_fleeing(MALL_CHUNK_NAME)
		delay(1)
	end
end

-- Have the two escorts of the General's limo pathfind and try to defend the General against the ambush
function ss11_defender_cars_come_help()
   thread_new( "ss11_defender_car_one_come_help" )
   thread_new( "ss11_defender_car_two_come_help" )
end

function ss11_defender_car_one_come_help()
   vehicle_pathfind_to( FIRST_DEFENDER_GROUP_VEHICLE, FIRST_DEFENDER_GROUP_DROPOFF, true, true )
end

function ss11_defender_car_two_come_help()
   vehicle_pathfind_to( SECOND_DEFENDER_GROUP_VEHICLE, SECOND_DEFENDER_GROUP_DROPOFF, true, true )
end

-- Starts the ambush
--
function ss11_reached_ambush_location()
   hud_timer_stop( 0 )
   -- We've reached the ambush location, so don't tell the player he needs to hurry up
   if ( Hurry_up_prompt_thread_handle ~= INVALID_THREAD_HANDLE ) then
      thread_kill( Hurry_up_prompt_thread_handle )
      Hurry_up_prompt_thread_handle = INVALID_THREAD_HANDLE
   end

   --audio_play_for_character( SHAUNDI_GET_READY_FOR_LIMO_LINE, SHAUNDI_NAME, "voice", false, true )
   --delay( GENERAL_MALL_CHECKPOINT_DELAY_SECONDS )
   marker_remove_trigger( AMBUSH_LOCATION_TRIGGER, SYNC_ALL )
   trigger_enable( AMBUSH_LOCATION_TRIGGER, false )
   waypoint_remove( SYNC_ALL )
   ss11_switch_state( MS_CUTSCENE )
end

function ss11_success()
	-- Called when the mission has ended with success
   -- Unlock story arc complete rewards

   spawning_pedestrians( false )
   spawning_pedestrians( true )
end
