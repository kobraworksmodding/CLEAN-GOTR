-- ss04.lua
-- SR2 mission script
-- 3/28/07
-- Mission help table text tags
   HT_GO_TO_ON_TRACK_NIGHTCLUB = "ss04_go_to_on_track_nightclub"
   HT_KILL_VETERAN_CHILD = "ss04_kill_veteran_child"
   HT_LOOK_FOR_VETERAN_CHILD = "ss04_look_for_veteran_child"
   HT_TAKE_OUT_VC_CRONIES = "ss04_take_out_vc_cronies"
   HT_SHAUNDI_DIED = "ss04_shaundi_died"
   HT_SHAUNDI_ABANDONED = "ss04_shaundi_abandoned"
   HT_SHAUNDIS_HEALTH = "ss04_shaundis_health"
   HT_VETERAN_CHILDS_HEALTH = "ss04_veteran_childs_health"
   HT_FIND_WAY_TO_SEPARATE = "ss04_find_way_to_separate_shaundi_and_vc"

-- Mission states
   MS_START = 1
   MS_REACHED_FIRST_NIGHTCLUB = 2
   MS_FIRST_NIGHTCLUB_CHECKPOINT = 3
   MS_CLEARED_FIRST_NIGHTCLUB = 4
   MS_REACHED_SECOND_NIGHTCLUB = 5
   MS_SECOND_NIGHTCLUB_CHECKPOINT = 6
   MS_INSIDE_SECOND_NIGHTCLUB = 7
   MS_REACHED_ON_TRACK_BOTTOM_FLOOR = 8

-- Groups, NPCs, vehicles, navpoints, and other names
   -- Mission constant names
   MISSION_NAME = "ss04"
   -- ( Mission Prefix )
   MP = MISSION_NAME.."_$"
   ENEMY_GANG = "Samedi"

   STOCKS_SHOP_NAME = "HER Bar"
   ON_TRACK_SHOP_NAME = "BAR Bar"

   -- Checkpoints
   CP_REACHED_STOCKS_CLUB = "Reached $tock$ nightclub"
   CP_REACHED_ON_TRACK_CLUB = "Reached On Track nightclub"

   -- Weapons
   FLASHBANG = "flashbang"

   -- Groups
   STARTER_VEHICLE_GROUP = MP.."Starter_Vehicle"
   STARTER_VEHICLE_COOP_GROUP = MP.."Starter_Vehicle_Coop"

   STOCKS_NIGHTCLUB_GROUP = MP.."Stocks_Nightclub"

   STOCKS_NIGHTCLUB_COOP_GROUP = MP.."Stocks_Nightclub_Coop"

   VC_BACKUP_GROUPS = { MP.."VC_Backup_01", MP.."VC_Backup_02" }

   ON_TRACK_NIGHTCLUB_INITIAL_SAMEDI = MP.."On_Track_Initial_Samedi"
   ON_TRACK_NIGHTCLUB_SECOND_FLOOR_SAMEDI = MP.."On_Track_Second_Floor_Samedi"

   ON_TRACK_NIGHTCLUB_COOP_ATTACK_GROUP = MP.."On_Track_Nightclub_Attackers_Coop"

   VETERAN_CHILD_AND_SHAUNDI_GROUP = MP.."Veteran_Child_and_Shaundi"

   AUSSIE_VETERAN_CHILD_GROUP = MP.."Aussie_Veteran_Child"

   SHAUNDI_GROUP = MP.."Shaundi"

   FLASHBANG_GROUP = MP.."Flashbangs"

   CUTSCENE_GROUP = MP.."Shaundi_and_VC_Cutscene"

   -- NPC names
   VETERAN_CHILD_LIEUTENANTS = { MP.."VC_L01", MP.."VC_L02", MP.."VC_L03", MP.."VC_L04" }
   VETERAN_CHILD_LIEUTENANTS_HOMIES = { { MP.."VC_L01_H1" }, { MP.."VC_L02_H1" }, {},
                                        { MP.."VC_L04_H1", MP.."VC_L04_H2" } }
   STOCKS_COOP_MEMBERS = { MP.."Stocks_Coop01", MP.."Stocks_Coop02",
                           MP.."Stocks_Coop03", MP.."Stocks_Coop04" }

   STOCKS_OFFICE_LIEUTENANT = VETERAN_CHILD_LIEUTENANTS[3]

   VETERAN_CHILD_NAME = MP.."Veteran_Child"
   AUSSIE_VC_NAME = MP.."Aussie_Veteran_Child"

   ON_TRACK_STAIRWAY_ATTACKERS = { MP.."Stairway_Attackers_01", MP.."Stairway_Attackers_02",
                                   MP.."Stairway_Attackers_03" }

   SHAUNDI_NAME = MP.."Shaundi"

   VC_BACKUP_GROUPS_MEMBERS = { { MP.."VC_BU_M01", MP.."VC_BU_M02", MP.."VC_BU_M03" },
                                { MP.."VC_BU2_M01", MP.."VC_BU2_M02" } }

   -- Vehicle names
   STARTER_VEHICLE = MP.."Starter_Vehicle"

   -- Navpoints and paths
   REMOTE_PLAYER_START_LOCATION = MP.."Remote_Player_Start"
   LOCAL_PLAYER_START_LOCATION = "mission_start_sr2_city_$ss04"
   VETERAN_CHILD_HOLD_SHAUNDI_LOCATION = MP.."Veteran_Child_Hold_Shaundi_Location"

   SHOOT_OUT_WINDOWS_NAVPOINTS = { MP.."Blow_Out_Window01", MP.."Blow_Out_Window02" }
   FLASHBANG_CLUSTER_LOCATIONS = { MP.."FlashbangG1", MP.."FlashbangG2", MP.."FlashbangG3",
                                   MP.."FlashbangG4", MP.."FlashbangG5" }

   STOCKS_CHECKPOINT_WARP = MP.."Stocks_Checkpoint_Warp"
   STOCKS_CHECKPOINT_WARP_REMOTE_PLAYER = MP.."Stocks_Checkpoint_Warp_Remote_Player"

   ON_TRACK_POST_CT_WARP_LOCAL = MP.."On_Track_Post_CT_Warp_Local"
   ON_TRACK_POST_CT_WARP_REMOTE = MP.."On_Track_Post_CT_Warp_Remote"

   -- Triggers
   SAINTS_LOT_AREA_TRIGGER = MP.."Saints_Parking_Lot_Area"

   STOCKS_ENTRANCE = MP.."Stocks_Entrance"
   STOCKS_MAIN_CLUB_ENTRANCE = MP.."Stocks_Main_Club_Entrance"
   STOCKS_AREA = MP.."Stocks_Nightclub_Area"
   STOCKS_WINDOW_SHOOTING_TRIGGER = MP.."Window_Shooting"
   STOCKS_STAIRWAY_TRIGGER = MP.."Stairway"

   ON_TRACK_ENTRANCES = { MP.."On_Track_Entrance01", MP.."On_Track_Entrance02" }
   ON_TRACK_AREA = MP.."On_Track_Nightclub_Area"
   ON_TRACK_SECOND_FLOOR_SPAWN_TRIGGER = MP.."On_Track_Second_Floor_Spawn_Trigger"

   ON_TRACK_TO_VC_TRIGGERS = { MP.."To_VC_01", MP.."To_VC_02", MP.."To_VC_03" }

   ON_TRACK_BOTTOM_FLOOR_TRIGGER = MP.."On_Track_Bottom_Floor"

   FLOOR_LEASH_LOCATION = MP.."Floor_Leash_Location"

   -- Movers
   STOCKS_DOOR = "shops_sr2_city_$HER_bar_door"

   ON_TRACK_DOORS = { MP.."On_Track_Door01", MP.."On_Track_Door02" }

   -- Items
   FLASHBANG_CLUSTERS_FLASHBANGS = { { MP.."FlashbangG1_01", MP.."FlashbangG1_02", MP.."FlashbangG1_03" },
                                     { MP.."FlashbangG2_01", MP.."FlashbangG2_02", MP.."FlashbangG2_03" },
                                     { MP.."FlashbangG3_01", MP.."FlashbangG3_02", MP.."FlashbangG3_03" },
                                     { MP.."FlashbangG4_01", MP.."FlashbangG4_02", MP.."FlashbangG4_03" },
                                     { MP.."FlashbangG5_01", MP.."FlashbangG5_02", MP.."FlashbangG5_03" } }

   -- Effects and animation states
   SHAUNDI_COWER = "cower stand"

   -- Cutscenes
   CUTSCENE_NAME = "ig_ss04_scene1"
   AUSSIE_CUTSCENE_NAME = "ig_ss04_scene1alt"
   CT_INTRO = "ss04-01"
   CT_OUTRO = "ss04-02"

-- Sound
   -- Persona overrides
   VC_HOLDING_SHAUNDI_PERSONA_SITUATION = "custom line 1"
   VC_PERSONA_OVERRIDES = { { "threat - alert (solo attack)", "DJVC_SS04_ATTACK" },
                            { "threat - alert (group attack)", "DJVC_SS04_ATTACK" },
                            { "threat - fleeing enemy", "DJVC_SS04_FLEE_1" } }

   -- Lines/Dialog Stream
   VC_GO_TO_STOCKS_CALL_DIALOG_STREAM = { { "SOS4_PHONECALL_L1", nil, 0 } }

   VC_AND_PLAYER_TAUNT_DIALOG_STREAM = { { "PLAYER_SOS4_TAUNT_L1", LOCAL_PLAYER, 0 },
                                         { "SOS4_TAUNT_L2", CELLPHONE_CHARACTER, 0 },
                                         { "PLAYER_SOS4_TAUNT_L3", LOCAL_PLAYER, 0 },
                                         { "SOS4_TAUNT_L4", CELLPHONE_CHARACTER, 0 },
                                         { "PLAYER_SOS4_TAUNT_L5", LOCAL_PLAYER, 0 },
                                         { "SOS4_TAUNT_L6", CELLPHONE_CHARACTER, 0 } }

   VC_AND_PLAYER_ARGUE_DIALOG_STREAM = { { "PLAYER_SOS4_ARGUE_L1", LOCAL_PLAYER, 0 },
                                         { "SOS4_ARGUE_L2", CELLPHONE_CHARACTER, 0 },
                                         { "PLAYER_SOS4_ARGUE_L3", LOCAL_PLAYER, 0 },
                                         { "SOS4_ARGUE_L4", CELLPHONE_CHARACTER, 0 },
                                         { "PLAYER_SOS4_ARGUE_L5", LOCAL_PLAYER, 0 },
                                         { "SOS4_ARGUE_L6", CELLPHONE_CHARACTER, 0 },
                                         { "PLAYER_SOS4_ARGUE_L7", LOCAL_PLAYER, 0 } }

   PIERCE_AND_PLAYER_FIRST_CALL_DIALOG_STREAM = { { "PLAYER_SOS4_PHONECALL_1_L1", LOCAL_PLAYER, 0 },
                                                  { "SOS4_PHONECALL_1_L2", nil, 0 }, 
                                                  { "PLAYER_SOS4_PHONECALL_1_L3", LOCAL_PLAYER, 0 }, 
                                                  { "SOS4_PHONECALL_1_L4", nil, 0 } }

   PIERCE_AND_PLAYER_SECOND_CALL_DIALOG_STREAM = { { "PLAYER_SOS4_PHONECALL_2_L1", LOCAL_PLAYER, 0 },
                                                   { "SOS4_PHONECALL_2_L2", nil, 0 }, 
                                                   { "PLAYER_SOS4_PHONECALL_2_L3", LOCAL_PLAYER, 0 } }

   SHAUNDI_MOAN_AUDIO_NAME = "SHAUNDI_SOS4_MOAN"
   SHAUNDI_STUNNED_AUDIO_NAME = "SHAUNDI_SOS4_STUN"
   VC_HOLDING_SHAUNDI_AUDIO_NAME = "DJVC_SS04_HOLDSHAUNDI"

-- Distances
   FLOOR_LEASH_RADIUS_METERS = 4.5

-- Percents and multipliers
   VETERAN_CHILD_RETREAT_HP_PERCENT = 0.6
   SHAUNDI_HEALTH_MULTIPLIER = 3.0

   VC_PER_RELEASE_DAMAGE_PERCENT_ALLOWED = 0.34

-- Time values
   TEMP_CONVERSATION_DELAY = 3.0
   MISSION_BEGIN_FADE_IN_TIME_SECONDS = 2.0
   AFTER_STOCKS_NOTORIETY_INCREASE_TIME_SECONDS = 15.0
   BEFORE_STOCKS_CELLPHONE_CALL_DELAY_SECONDS = 4.0
   BEFORE_FIRST_VC_CALL_DELAY_SECONDS = 2.0
   AFTER_VC_CALL_DELAY_SECONDS = 2.0
   BETWEEN_PERSONA_LINES_MIN_SECONDS = 6
   BETWEEN_PERSONA_LINES_MAX_SECONDS = 12
   BEFORE_PLAYER_FRIGHTENS_VC_SECONDS = 12
   BEFORE_PLAYER_TAUNTS_VC_SECONDS = 20
   -- Will need to be reset if this is changed editor-side
   FLASHBANG_RESPAWN_TIME_SECONDS = 15
   SECOND_NIGHTCLUB_NOTORIETY_END_SPAWNING_DELAY_SECONDS = 4.0
   STAIR_ATTACKERS_ATTACK_DELAY_SECONDS = 5.0
   VC_BACKUP_GROUPS_RESPAWN_DELAY_SECONDS = 10

-- Speeds

-- Constant values and counts
   VETERAN_CHILD_HIT_POINTS = 6000
   VETERAN_CHILD_HIT_POINTS_COOP = 9000

   AUSSIE_VC_HIT_POINTS = 12000
   AUSSIE_VC_HIT_POINTS_COOP = 15000

   AFTER_STOCKS_MIN_NOTORIETY = 3
   VC_HEALTH_BAR_INDEX = 0
   SHAUNDI_HEALTH_BAR_INDEX = 1
   VC_BACKUP_GROUPS_COUNT = sizeof_table( VC_BACKUP_GROUPS )
   VC_BACKUP_GROUPS_MEMBER_COUNTS = { sizeof_table( VC_BACKUP_GROUPS_MEMBERS[1] ),
                                      sizeof_table( VC_BACKUP_GROUPS_MEMBERS[2] ) }

-- Global variables
   Stocks_required_kills_remaining = 0

   Raise_notoriety_thread_handle = INVALID_THREAD_HANDLE
   Flashbang_groups_fbs_remaining = { sizeof_table( FLASHBANG_CLUSTERS_FLASHBANGS[1] ),
                                      sizeof_table( FLASHBANG_CLUSTERS_FLASHBANGS[2] ),
                                      sizeof_table( FLASHBANG_CLUSTERS_FLASHBANGS[3] ),
                                      sizeof_table( FLASHBANG_CLUSTERS_FLASHBANGS[4] ),
                                      sizeof_table( FLASHBANG_CLUSTERS_FLASHBANGS[5] ) }
   Cur_backup_group_members_remaining = 0
   Num_panic_instances = 0
   Num_shaundi_panic_instances = 0
   VC_call_received = false
   VC_call_complete = false
   Controls_disabled = false
   VC_damage_percent_since_last_release = 0
   VC_pre_hit_damage_percent = 1.0
   Testing_Aussie_version = false

-- Finds the cluster index a flashbang belongs to based on the flashbang's name.
--
-- name_to_find: The name of the flashbang to find the cluster index of.
--
function ss04_find_flashbang_cluster_index( name_to_find )
   for cluster_index, flashbang_cluster in pairs( FLASHBANG_CLUSTERS_FLASHBANGS ) do
      for fb_index, fb_name in pairs( flashbang_cluster ) do
         if ( fb_name == name_to_find ) then
            return cluster_index
         end
      end
   end
   return -1
end

-- This function lets the mission know when a flashbang has respawned.
-- Re-adds the marker to the flashbangs if it was removed.
--
-- fb_cluster_index: The cluster that just had a flashbang respawn.
--
function ss04_flashbang_respawn_timer( fb_cluster_index )
   -- Delay for respawn
   delay( FLASHBANG_RESPAWN_TIME_SECONDS )
   mission_debug( "flashbang in cluster "..fb_cluster_index.." respawned.", 10 )
   -- It respawned - increment the count
   Flashbang_groups_fbs_remaining[fb_cluster_index] = Flashbang_groups_fbs_remaining[fb_cluster_index] + 1

   -- If this is the first to respawn, then add a marker at this location
   if ( Flashbang_groups_fbs_remaining[fb_cluster_index] == 1 ) then
      marker_add_navpoint( FLASHBANG_CLUSTER_LOCATIONS[fb_cluster_index], "", INGAME_EFFECT_PROTECT_ACQUIRE, SYNC_ALL )
   end
end

-- Called when a flashbang is picked up.
-- Removes the marker from the flashbang cluster if none remain.
--
-- picked_up_flashbang_name: Name of the flashbang that was picked up.
--
function ss04_flashbang_picked_up( human_name, picked_up_flashbang_name )
   local cluster_index = ss04_find_flashbang_cluster_index( picked_up_flashbang_name )
   mission_debug( "flashbang in cluster "..cluster_index.." picked up. ", 10 )

   Flashbang_groups_fbs_remaining[cluster_index] = Flashbang_groups_fbs_remaining[cluster_index] - 1
   mission_debug( Flashbang_groups_fbs_remaining[cluster_index].." remain. ", 10 )

   if ( Flashbang_groups_fbs_remaining[cluster_index] == 0 ) then
      marker_remove_navpoint( FLASHBANG_CLUSTER_LOCATIONS[cluster_index], SYNC_ALL )
   end

   thread_new( "ss04_flashbang_respawn_timer", cluster_index )
end

function ss04_start( checkpoint_name, is_restart )
	-- Start trigger is hit...the activate button was hit
	set_mission_author("Mark Gabby and Brad Johnson")

   ss04_start_or_resume_from_checkpoint( checkpoint_name, is_restart )
end

-- Starts the mission or resumes it from a checkpoint, based on
-- the value of the passed-in checkpoint name.
--
-- This function does any group creation or other work that causes
-- the game to "load" before the mission is ready. Therefore, it
-- fades the screen out before it starts and fades it back in when
-- it's done.
--
function ss04_start_or_resume_from_checkpoint( checkpoint_name, is_restart )
   mission_start_fade_out()

   if ( checkpoint_name == MISSION_START_CHECKPOINT ) then
		-- Setup the list of groups we want to create on mission start based on whether we're running in
		-- coop or single-player
	   local starter_groups = { STARTER_VEHICLE_GROUP, STOCKS_NIGHTCLUB_GROUP }
	   if ( coop_is_active() ) then
			starter_groups = { STARTER_VEHICLE_GROUP, STARTER_VEHICLE_COOP_GROUP, STOCKS_NIGHTCLUB_GROUP, STOCKS_NIGHTCLUB_COOP_GROUP }
		end

		if ( is_restart == false ) then
			cutscene_play( CT_INTRO, starter_groups, { LOCAL_PLAYER_START_LOCATION, REMOTE_PLAYER_START_LOCATION }, false )
			for index, group_name in pairs( starter_groups ) do
				group_show( group_name )
			end
		else
			for index, group_name in pairs( starter_groups ) do
				group_create( group_name, true )
			end
			teleport_coop( LOCAL_PLAYER_START_LOCATION, REMOTE_PLAYER_START_LOCATION )
		end
   end

   local state_to_setup

   shop_enable( STOCKS_SHOP_NAME, false )
   shop_enable( ON_TRACK_SHOP_NAME, false )

   ss04_lock_on_track_entrances( true )

   -- Default checkpoint - means mission is starting from the beginning
   if ( checkpoint_name == MISSION_START_CHECKPOINT ) then
      -- Sets the number of required kills remaining at the first nightclub
      ss04_create_first_nightclub_groups();

      spawning_allow_gang_team_ambient_spawns( HUMAN_TEAM_RONIN, false )

      state_to_setup = MS_START
   -- The player reached the $tock$ nightclub on a previous playthrough
   elseif ( checkpoint_name == CP_REACHED_STOCKS_CLUB ) then
      -- Create the groups for the first nightclub and sets the number
		-- of required kills remaining there
      ss04_create_first_nightclub_groups();

      spawning_allow_gang_team_ambient_spawns( HUMAN_TEAM_RONIN, false )
      teleport_coop( STOCKS_CHECKPOINT_WARP, STOCKS_CHECKPOINT_WARP_REMOTE_PLAYER )

      state_to_setup = MS_FIRST_NIGHTCLUB_CHECKPOINT
   -- The player reached the On Track nightclub on a previous playthrough
   elseif ( checkpoint_name == CP_REACHED_ON_TRACK_CLUB ) then
      -- Create the groups for the second nightclub
      state_to_setup = MS_SECOND_NIGHTCLUB_CHECKPOINT
      -- Create Veteran child's group and the attackers so they will all load quickly
      -- when required
      ss04_create_on_track_nightclub_groups()
      ss04_lock_on_track_entrances( false )
      notoriety_set_min( ENEMY_GANG, AFTER_STOCKS_MIN_NOTORIETY )
   end
   mission_start_fade_in()

   ss04_setup_state( state_to_setup )
end

-- Sets the $tock$ entrances to be locked or unlocked.
--
function ss04_lock_stocks_entrances( lock_state )
   door_lock( STOCKS_DOOR, lock_state )
end

-- Sets the On Track Nightclubs doors to be locked or unlocked.
--
function ss04_lock_on_track_entrances( lock_state )
   -- Lock or unlock the doors to the On Track nightclub to
   -- control access - we don't want the players going in
   -- before it's allowed.
   for index, name in pairs( ON_TRACK_DOORS ) do
      --door_close( name )
      door_lock( name, lock_state )
   end
end

function ss04_pierce_and_veteran_child_call()
   trigger_enable( SAINTS_LOT_AREA_TRIGGER, false )

   audio_play_conversation( PIERCE_AND_PLAYER_FIRST_CALL_DIALOG_STREAM, OUTGOING_CALL )

   delay( BEFORE_PLAYER_TAUNTS_VC_SECONDS )

   audio_play_conversation( VC_AND_PLAYER_TAUNT_DIALOG_STREAM, OUTGOING_CALL )
end

function ss04_vc_call_received()
   VC_call_received = true
end

function ss04_vc_call_player()
   mid_mission_phonecall( "ss04_vc_call_received" )

   local incoming_call_thread = thread_new( "ss04_play_vc_call_on_answer" )

   delay( 10.0 )

   if ( VC_call_received == false ) then
      thread_kill( incoming_call_thread )
      mid_mission_phonecall_reset()

      audio_play( CELLPHONE_INCOMING )
      delay( 1.0 )

      audio_play_conversation( VC_GO_TO_STOCKS_CALL_DIALOG_STREAM, INCOMING_CALL )

      VC_call_complete = true
   end
end

function ss04_play_vc_call_on_answer()
   repeat
      thread_yield()
   until VC_call_received

   audio_play_conversation( VC_GO_TO_STOCKS_CALL_DIALOG_STREAM, INCOMING_CALL )

   mid_mission_phonecall_reset()
   VC_call_complete = true
end

-- Sets the mission to a specified state. For example,
-- when the player reaches the first nightclub, the
-- required kill lieutenants need to be highlighted and
-- their 'on death' callbacks set up, among other
-- things.
--
function ss04_setup_state( state_to_setup )
   -- Mission is starting from the beginning
   if ( state_to_setup == MS_START ) then
      ss04_lock_stocks_entrances( true )
      delay( BEFORE_FIRST_VC_CALL_DELAY_SECONDS )

      thread_new( "ss04_vc_call_player" )

      repeat
         thread_yield()
      until VC_call_complete

      delay( AFTER_VC_CALL_DELAY_SECONDS )
      ss04_lock_stocks_entrances( false )

      trigger_enable( SAINTS_LOT_AREA_TRIGGER, true )
      on_trigger_exit( "ss04_pierce_and_veteran_child_call", SAINTS_LOT_AREA_TRIGGER )

      -- Give the player a message concerning the objective
      mission_help_table( HT_LOOK_FOR_VETERAN_CHILD )
      -- Guide the player to his objective
      marker_add_trigger( STOCKS_ENTRANCE, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL )
      waypoint_add( STOCKS_ENTRANCE, SYNC_ALL )

      -- Setup the objective for the player's arrival
      -- Setup the guide trigger - this one just shows you where the
      -- entrance to the club is
      trigger_enable( STOCKS_ENTRANCE, true )
      on_trigger( "ss04_reached_stocks_entrance", STOCKS_ENTRANCE )

      -- Setup the area trigger - this triggers when you're near enough
      -- to the club
      trigger_enable( STOCKS_AREA, true )
      on_trigger( "ss04_reached_first_club", STOCKS_AREA )

      -- Set up the trigger that causes the Samedi gang member in the window office
      -- to possibly shoot out the windows and then shoot the player
      trigger_enable( STOCKS_WINDOW_SHOOTING_TRIGGER, true )
      on_trigger( "ss04_hit_window_shooting_trigger", STOCKS_WINDOW_SHOOTING_TRIGGER )

      trigger_enable( STOCKS_STAIRWAY_TRIGGER, true )
      on_trigger( "ss04_unleash_office_lieutenant", STOCKS_STAIRWAY_TRIGGER )

   -- The player has hit the trigger surrounding the first nightclub
   elseif ( state_to_setup == MS_REACHED_FIRST_NIGHTCLUB ) then
      -- Set the checkpoint then setup the nightclub
      mission_set_checkpoint( CP_REACHED_STOCKS_CLUB )
      trigger_enable( STOCKS_AREA, false )
      ss04_setup_first_nightclub()

   -- The player's resuming from the checkpoint set after hitting the
   -- 'near first nightclub' trigger
   elseif ( state_to_setup == MS_FIRST_NIGHTCLUB_CHECKPOINT ) then
      -- Just setup the nightclub, because the checkpoint's already set
      ss04_setup_first_nightclub()

      -- Set up the trigger that causes the Samedi gang member in the window office
      -- to possibly shoot out the windows and then shoot the player
      trigger_enable( STOCKS_WINDOW_SHOOTING_TRIGGER, true )
      on_trigger( "ss04_hit_window_shooting_trigger", STOCKS_WINDOW_SHOOTING_TRIGGER )

      trigger_enable( STOCKS_ENTRANCE, true )
      on_trigger( "ss04_reached_stocks_entrance", STOCKS_ENTRANCE )

   -- The player's cleared the first nightclub of lieutenants.
   elseif ( state_to_setup == MS_CLEARED_FIRST_NIGHTCLUB ) then
      spawning_allow_gang_ambient_spawns( true )

      delay( BEFORE_STOCKS_CELLPHONE_CALL_DELAY_SECONDS )
      -- Inform the player of his next goal
      audio_play_conversation( PIERCE_AND_PLAYER_SECOND_CALL_DIALOG_STREAM, OUTGOING_CALL )

      -- Spawn a thread that'll eventually have the player call VC and scare him
      thread_new( "ss04_player_frightens_veteran_child" )

      mission_help_table( HT_GO_TO_ON_TRACK_NIGHTCLUB )
      marker_add_trigger( ON_TRACK_ENTRANCES[1], MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL )
      waypoint_add( ON_TRACK_ENTRANCES[1], SYNC_ALL )
      trigger_enable( STOCKS_ENTRANCE, true )
      on_trigger( "ss04_left_stocks", STOCKS_ENTRANCE )

      -- Setup the On Track nightclub's entrance triggers. These are used to update
      -- the minimap guidance
      for index, name in pairs( ON_TRACK_ENTRANCES ) do
         trigger_enable( name, true )
         on_trigger( "ss04_reached_on_track_entrance", name )
      end

      -- It's all right to enter the club now, so unlock the doors
      ss04_lock_on_track_entrances( false )

      trigger_enable( ON_TRACK_AREA, true );
      on_trigger( "ss04_reached_on_track_area", ON_TRACK_AREA )

      -- Create Veteran child's group and the attackers so they will all load quickly
      -- when required
      ss04_create_on_track_nightclub_groups()

   -- The player has has hit the trigger surrounding the second nightclub
   elseif ( state_to_setup == MS_REACHED_SECOND_NIGHTCLUB ) then
      -- Set the checkpoint then setup the nightclub
      mission_set_checkpoint( CP_REACHED_ON_TRACK_CLUB )
      trigger_enable( ON_TRACK_AREA, false )

      marker_remove_trigger( ON_TRACK_ENTRANCES[1], SYNC_ALL )
      marker_add_trigger( ON_TRACK_ENTRANCES[1], "", INGAME_EFFECT_LOCATION, SYNC_ALL )

      ss04_setup_reached_on_track_nightclub()

   -- The player's resuming from the checkpoint set after hitting the
   -- 'near second nightclub' trigger
   elseif ( state_to_setup == MS_SECOND_NIGHTCLUB_CHECKPOINT ) then
      -- Just setup the nightclub, because the checkpoint's already set
      ss04_setup_reached_on_track_nightclub()

      -- Guide the player to his next objective
      mission_help_table( HT_KILL_VETERAN_CHILD )
      ss04_enable_next_path_trigger( ON_TRACK_TO_VC_TRIGGERS[1], "ss04_to_vc_01" )

   -- The player has ventured into the second nightclub
   elseif ( state_to_setup == MS_INSIDE_SECOND_NIGHTCLUB ) then
      persona_override_group_start( SAMEDI_PERSONAS, POT_SITUATIONS[POT_ATTACK], "SS04_ATTACK" )

      thread_new( "ss04_stair_attackers_setup_and_attack_after_delay" )
   elseif ( state_to_setup == MS_REACHED_ON_TRACK_BOTTOM_FLOOR ) then
      fade_out( 0 )
      spawning_pedestrians( false )
      spawning_pedestrians( true )

      player_controls_disable( LOCAL_PLAYER )
      if ( coop_is_active() ) then
         player_controls_disable( REMOTE_PLAYER )
      end
      Controls_disabled = true

   	teleport( LOCAL_PLAYER, ON_TRACK_POST_CT_WARP_LOCAL, true )
      if ( coop_is_active() ) then
         teleport( REMOTE_PLAYER, ON_TRACK_POST_CT_WARP_REMOTE, true )
         while ( get_dist_char_to_nav( REMOTE_PLAYER, ON_TRACK_POST_CT_WARP_REMOTE ) > 10 ) do
            thread_yield()
         end
      end

      player_controls_enable( LOCAL_PLAYER )
      if ( coop_is_active() ) then
         player_controls_enable( REMOTE_PLAYER )
      end
      Controls_disabled = false

      if ( human_shielding_disabled() or Testing_Aussie_version ) then
         cutscene_play( AUSSIE_CUTSCENE_NAME, "", "", false )
      else
         cutscene_play( CUTSCENE_NAME, "", "", false )      
      end
      group_hide( CUTSCENE_GROUP )
      group_destroy( CUTSCENE_GROUP )
      fade_out( 0 )
      chainsaw_disable()

      if ( human_shielding_disabled() or Testing_Aussie_version ) then
         group_create( AUSSIE_VETERAN_CHILD_GROUP, true )
         on_death( "ss04_veteran_child_killed", AUSSIE_VC_NAME )

         marker_add_npc( AUSSIE_VC_NAME, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL )
         character_prevent_explosion_fling( AUSSIE_VC_NAME, true )
         character_prevent_flinching( AUSSIE_VC_NAME, true )
         character_allow_ragdoll( AUSSIE_VC_NAME, false )
         character_set_no_satchel_panic( AUSSIE_VC_NAME, true )
         set_cant_flee_flag( AUSSIE_VC_NAME, true )

         local hit_points_to_set = AUSSIE_VC_HIT_POINTS
         if ( coop_is_active() ) then
            hit_points_to_set = AUSSIE_VC_HIT_POINTS_COOP
         end
         set_max_hit_points( AUSSIE_VC_NAME, hit_points_to_set )
         set_current_hit_points( AUSSIE_VC_NAME, hit_points_to_set )
         damage_indicator_on( VC_HEALTH_BAR_INDEX, AUSSIE_VC_NAME, 0, HT_VETERAN_CHILDS_HEALTH, hit_points_to_set )

         fade_in( 1 )
         mission_help_table_nag( HT_KILL_VETERAN_CHILD )
         attack_closest_player( AUSSIE_VC_NAME )
      else
         -- Show and mark the stun grenades
         group_show( FLASHBANG_GROUP )
         -- Add pickup callbacks and markers. The pickup callbacks add and remove the markers when the
         -- flashbangs respawn.
         for cluster_index, flashbang_cluster in pairs( FLASHBANG_CLUSTERS_FLASHBANGS ) do
            for fb_index, fb_name in pairs( flashbang_cluster ) do
               on_pickup( "ss04_flashbang_picked_up", fb_name )
            end
         end
         for cluster_index, cluster_location in pairs( FLASHBANG_CLUSTER_LOCATIONS ) do
            marker_add_navpoint( cluster_location, "", INGAME_EFFECT_PROTECT_ACQUIRE, SYNC_ALL )
         end
         marker_add_npc( VETERAN_CHILD_NAME, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL )

         group_show( VETERAN_CHILD_AND_SHAUNDI_GROUP )

         character_set_no_satchel_panic( VETERAN_CHILD_NAME, true )
         character_set_no_satchel_panic( SHAUNDI_NAME, true )
         character_prevent_explosion_fling( VETERAN_CHILD_NAME, true )
         character_prevent_explosion_fling( SHAUNDI_NAME, true )      
         -- Add her as a follower to the closest player
         local dist, player = get_dist_closest_player_to_object( SHAUNDI_NAME )
         on_death( "ss04_shaundi_died", SHAUNDI_NAME )
         character_prevent_flinching( VETERAN_CHILD_NAME, true )
         character_allow_ragdoll( VETERAN_CHILD_NAME, false )
         character_allow_ragdoll( SHAUNDI_NAME, false )
         character_set_only_scripted_grabs( SHAUNDI_NAME, true )
         character_suppress_squirted_reaction( SHAUNDI_NAME, true )
         character_suppress_squirted_reaction( VETERAN_CHILD_NAME, true )
         set_unrecruitable_flag( SHAUNDI_NAME, true ) 
         set_cant_flee_flag( VETERAN_CHILD_NAME, true )
         npc_dont_auto_equip_or_unequip_weapons( VETERAN_CHILD_NAME, true)
         on_panic( "ss04_veteran_child_panic", VETERAN_CHILD_NAME )
         on_panic( "ss04_shaundi_panic", SHAUNDI_NAME )

         npc_leash_to_nav( VETERAN_CHILD_NAME, FLOOR_LEASH_LOCATION, FLOOR_LEASH_RADIUS_METERS )
         npc_leash_to_nav( SHAUNDI_NAME, FLOOR_LEASH_LOCATION, FLOOR_LEASH_RADIUS_METERS )
         npc_leash_set_unbreakable( VETERAN_CHILD_NAME, true )
         npc_leash_set_unbreakable( SHAUNDI_NAME, true )

         -- Take Shaundi hostage
         character_take_human_shield( VETERAN_CHILD_NAME, SHAUNDI_NAME )
         thread_new( "ss04_veteran_child_play_hold_shaundi_lines" )
         --thread_new( "ss04_shaundi_play_drugged_moan_lines" )

         local distance, player = get_dist_closest_player_to_object( VETERAN_CHILD_NAME )

         turn_to( VETERAN_CHILD_NAME, player, false )
         delay( 0.5 )

         --thread_new( "ss04_veteran_child_emergency_retake" )

         turn_invulnerable( VETERAN_CHILD_NAME )
         on_death( "ss04_veteran_child_killed", VETERAN_CHILD_NAME )

         for index, override in pairs( VC_PERSONA_OVERRIDES ) do
            persona_override_character_start( VETERAN_CHILD_NAME, override[1], override[2] )
         end

         local hit_points_to_set = VETERAN_CHILD_HIT_POINTS
         if ( coop_is_active() ) then
            hit_points_to_set = VETERAN_CHILD_HIT_POINTS_COOP
         end
         set_max_hit_points( VETERAN_CHILD_NAME, hit_points_to_set )
         set_current_hit_points( VETERAN_CHILD_NAME, hit_points_to_set )

         local cur_max_shaundi_hp = get_max_hit_points( SHAUNDI_NAME )
         local new_shaundi_hp = SHAUNDI_HEALTH_MULTIPLIER * cur_max_shaundi_hp
         set_max_hit_points( SHAUNDI_NAME, new_shaundi_hp )
         set_current_hit_points( SHAUNDI_NAME, new_shaundi_hp )

         damage_indicator_on( VC_HEALTH_BAR_INDEX, VETERAN_CHILD_NAME, 0, HT_VETERAN_CHILDS_HEALTH, hit_points_to_set )
         hud_bar_on( SHAUNDI_HEALTH_BAR_INDEX, "Health", HT_SHAUNDIS_HEALTH, 1.0, SYNC_ALL )
         hud_bar_set_value( SHAUNDI_HEALTH_BAR_INDEX, 1.0, SYNC_ALL )
         on_take_damage( "ss04_shaundi_damaged", SHAUNDI_NAME )
         fade_in( 1.0 )
         attack_closest_player( VETERAN_CHILD_NAME )

         mission_help_table( HT_FIND_WAY_TO_SEPARATE )
      end

      thread_new( "ss04_spawn_backup_members" )
   end
end

function ss04_veteran_child_emergency_retake()
   -- Don't do processing on this until Veteran Child initially has Shaundi as a human shield.
   repeat
      thread_yield()
   until ( character_has_specific_human_shield( VETERAN_CHILD_NAME, SHAUNDI_NAME ) )

   -- Keep this alive until one of these characters dies
   repeat
      -- If Shaundi is not VC's human shield and the panic callback isn't processing, something has fallen
      -- through the cracks
      if ( character_has_specific_human_shield( VETERAN_CHILD_NAME, SHAUNDI_NAME ) == false and
           Num_panic_instances == 0 ) then

         -- Make VC vulnerable since he doesn't have Shaundi
         turn_vulnerable( VETERAN_CHILD_NAME )

         -- Have VC try to grab Shaundi until he panics ( and therefore goes into his "grab Shaundi" state automatically )
         -- or grabs her
         repeat
            npc_go_idle( VETERAN_CHILD_NAME )
            character_take_human_shield( VETERAN_CHILD_NAME, SHAUNDI_NAME )
            mission_debug( "VC attempting to HS Shaundi - emergency", 2 )
            delay( 2.0 )
         until ( character_has_specific_human_shield( VETERAN_CHILD_NAME, SHAUNDI_NAME ) or Num_panic_instances > 0 )

         -- If he grabbed her, then turn him invulnerable
         if ( character_has_specific_human_shield( VETERAN_CHILD_NAME, SHAUNDI_NAME ) ) then
            turn_invulnerable( VETERAN_CHILD_NAME )
         end
      end
      thread_yield()
   until ( character_is_dead( VETERAN_CHILD_NAME ) or character_is_dead( SHAUNDI_NAME ) )
end

function ss04_enable_next_path_trigger( trigger_name, callback )
   trigger_enable( trigger_name )
   on_trigger( callback, trigger_name )
   marker_add_trigger( trigger_name, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL )
end

function ss04_to_vc_01( triggerer_name, trigger_name )
   trigger_enable( trigger_name, false )

   ss04_enable_next_path_trigger( ON_TRACK_TO_VC_TRIGGERS[2], "ss04_to_vc_02" )
end

function ss04_to_vc_02( triggerer_name, trigger_name )
   trigger_enable( trigger_name, false )

   ss04_enable_next_path_trigger( ON_TRACK_TO_VC_TRIGGERS[3], "ss04_to_vc_03" )
end

function ss04_to_vc_03( triggerer_name, trigger_name )
   trigger_enable( trigger_name, false )
end

function ss04_backup_group_member_died( name )
   Cur_backup_group_members_remaining = Cur_backup_group_members_remaining - 1

   if ( Cur_backup_group_members_remaining == 0 ) then
      thread_new( "ss04_spawn_backup_members" )
   end
end

function ss04_spawn_backup_members()
   delay( VC_BACKUP_GROUPS_RESPAWN_DELAY_SECONDS )
   -- Randomly select a group index to spawn
   local group_index = rand_int( 1, VC_BACKUP_GROUPS_COUNT )
   mission_debug( "choose index "..group_index )

   -- Create the group
   mission_debug( "creating group "..VC_BACKUP_GROUPS[group_index] )
   if ( group_is_loaded( VC_BACKUP_GROUPS[group_index] ) ) then
      release_to_world( VC_BACKUP_GROUPS[group_index] )
   end
   group_create( VC_BACKUP_GROUPS[group_index] )
   Cur_backup_group_members_remaining = VC_BACKUP_GROUPS_MEMBER_COUNTS[group_index]

   -- Setup the callbacks and have them all attack
   for index, member_name in pairs( VC_BACKUP_GROUPS_MEMBERS[group_index] ) do
      on_death( "ss04_backup_group_member_died", member_name )
      local distance, player = get_dist_closest_player_to_object( member_name )
      attack_safe( member_name, player, false )
   end
end

-- Player calls Veteran Child and freaks VC out because VC's trap didn't work- 
-- the player is still alive.
-- Delays before the call is made so that it hopefully happens on the way to the club.
--
function ss04_player_frightens_veteran_child()
   repeat
      thread_yield()
   until ( get_dist_char_to_nav( LOCAL_PLAYER, STOCKS_ENTRANCE ) > 100 )

   audio_play_conversation( VC_AND_PLAYER_ARGUE_DIALOG_STREAM, OUTGOING_CALL )
end

-- Causes Shaundi to play her "drugged moan" lines randomly while being held by
-- Veteran Child.
--
function ss04_shaundi_play_drugged_moan_lines()
   while ( 1 ) do
      local between_lines_seconds = rand_float( BETWEEN_PERSONA_LINES_MIN_SECONDS,
                                                BETWEEN_PERSONA_LINES_MAX_SECONDS )

      delay( between_lines_seconds )
      if ( character_has_specific_human_shield( VETERAN_CHILD_NAME, SHAUNDI_NAME ) ) then
         audio_play_for_character( SHAUNDI_MOAN_AUDIO_NAME, SHAUNDI_NAME, "voice", false, true )
      end
   end
end

-- This function plays lines for Veteran Child holding Shaundi, assuming that
-- he's still got her grabbed. If he isn't grabbing her, it just skips playing
-- lines until he is.
--
function ss04_veteran_child_play_hold_shaundi_lines()
   while ( 1 ) do
      local between_lines_seconds = rand_float( BETWEEN_PERSONA_LINES_MIN_SECONDS,
                                                BETWEEN_PERSONA_LINES_MAX_SECONDS )

      delay( between_lines_seconds )
      if ( character_has_specific_human_shield( VETERAN_CHILD_NAME, SHAUNDI_NAME ) ) then
         audio_play_for_character( VC_HOLDING_SHAUNDI_AUDIO_NAME, SHAUNDI_NAME, "voice", false, true )
      end
   end
end

function ss04_shaundi_panic( stunned_char_name, stun_time_seconds )
   Num_shaundi_panic_instances = Num_shaundi_panic_instances + 1

   on_panic( "", SHAUNDI_NAME )

   repeat
      thread_yield()
   until ( character_is_panicking( stunned_char_name ) == false )
   if ( Num_shaundi_panic_instances == 1 ) then
      delay( 0.5 )
      set_cant_flee_flag( SHAUNDI_NAME, false )

      -- dont_leave_cower = true
		flee_to_navpoint( SHAUNDI_NAME, FLOOR_LEASH_LOCATION, VETERAN_CHILD_NAME, true )

		repeat
			thread_yield()
		until ( get_dist_char_to_nav( SHAUNDI_NAME, FLOOR_LEASH_LOCATION ) < FLOOR_LEASH_RADIUS_METERS - 1 )
		cower( SHAUNDI_NAME, VETERAN_CHILD_NAME, true )

      on_panic( "ss04_shaundi_panic", SHAUNDI_NAME )
   end
   Num_shaundi_panic_instances = Num_shaundi_panic_instances - 1
end

function ss04_setup_vc_to_take_damage()
   VC_damage_percent_since_last_release = 0
   VC_pre_hit_damage_percent = get_current_hit_points( VETERAN_CHILD_NAME ) / get_max_hit_points( VETERAN_CHILD_NAME )
   turn_vulnerable( VETERAN_CHILD_NAME )
   on_take_damage( "ss04_veteran_child_damaged", VETERAN_CHILD_NAME )
end

function ss04_setup_vc_as_shielding()
   turn_invulnerable( VETERAN_CHILD_NAME )
   on_take_damage( "", VETERAN_CHILD_NAME )
end

function ss04_veteran_child_damaged( attacked_object_name, attacker_name, percent_hp_remaining_after_attack )
   -- He's dead. Beyond our help at this point.
   if ( percent_hp_remaining_after_attack <= 0 ) then
      return
   end

   -- Find out how much damage was done in percent to VC by this last hit
   local vc_max_hp = get_max_hit_points( VETERAN_CHILD_NAME )
   local percent_damage_before_hit = get_current_hit_points( VETERAN_CHILD_NAME ) / vc_max_hp

   -- The percent damage is updated to itself plus any percentage just done
   VC_damage_percent_since_last_release = VC_damage_percent_since_last_release + ( VC_pre_hit_damage_percent - percent_hp_remaining_after_attack )

   --mission_debug( "VC damaged, percent since last is "..VC_damage_percent_since_last_release..", percent remaining is "..percent_hp_remaining_after_attack, 5 )

   -- Check if we've reached or exceeded the damage cap
   if ( VC_damage_percent_since_last_release >= VC_PER_RELEASE_DAMAGE_PERCENT_ALLOWED ) then
      -- Prevent more damage from being done after this point
      on_take_damage( "", VETERAN_CHILD_NAME )
      turn_invulnerable( VETERAN_CHILD_NAME )
   end

   local hp_left = percent_hp_remaining_after_attack * vc_max_hp
   mission_debug( "hit points remaining: "..hp_left )

   VC_pre_hit_damage_percent = percent_hp_remaining_after_attack
end

-- Callback when Veteran child is stunned, as by a stun grenade, for example
--
function ss04_veteran_child_panic( stunned_char_name, stun_time_seconds )
   -- Record how many times this function has been called
   Num_panic_instances = Num_panic_instances + 1
   mission_debug( "panic called. num instances: "..Num_panic_instances, 10 )
   --turn_vulnerable( VETERAN_CHILD_NAME )
   ss04_setup_vc_to_take_damage()
   audio_play_for_character( SHAUNDI_STUNNED_AUDIO_NAME, SHAUNDI_NAME, "voice", false, true )

   repeat
      thread_yield()
   until ( character_is_panicking( stunned_char_name ) == false )

   -- If this is the final instance of this function, then have VC re-grab Shaundi
   if ( Num_panic_instances == 1 ) then
      repeat
         npc_go_idle( VETERAN_CHILD_NAME )
         npc_leash_remove( VETERAN_CHILD_NAME )
         character_take_human_shield( VETERAN_CHILD_NAME, SHAUNDI_NAME )
         mission_debug( "VC attempting to HS Shaundi", 2 )
         delay( 2.0 )
      until ( character_has_specific_human_shield( VETERAN_CHILD_NAME, SHAUNDI_NAME ) )
      npc_leash_to_nav( VETERAN_CHILD_NAME, FLOOR_LEASH_LOCATION, FLOOR_LEASH_RADIUS_METERS )
      npc_leash_set_unbreakable( VETERAN_CHILD_NAME, true )
      mission_debug( "VC retook Shaundi as a shield.", 10 )

      set_ignore_ai_flag( SHAUNDI_NAME, false )
      --turn_invulnerable( VETERAN_CHILD_NAME )
      ss04_setup_vc_as_shielding()
      attack_closest_player( VETERAN_CHILD_NAME )
   end
   -- This instance is done, decrement
   Num_panic_instances = Num_panic_instances - 1
end

-- 
function ss04_create_first_nightclub_groups()
	if ( group_is_loaded( STOCKS_NIGHTCLUB_GROUP ) == false ) then
		group_create_hidden( STOCKS_NIGHTCLUB_GROUP )
	end
   Stocks_required_kills_remaining = sizeof_table( VETERAN_CHILD_LIEUTENANTS ) +
                                     sizeof_table( VETERAN_CHILD_LIEUTENANTS_HOMIES )

   if ( coop_is_active() ) then
		if ( group_is_loaded( STOCKS_NIGHTCLUB_COOP_GROUP ) == false ) then
			group_create_hidden( STOCKS_NIGHTCLUB_COOP_GROUP )
		end

      Stocks_required_kills_remaining = Stocks_required_kills_remaining +
                                        sizeof_table( STOCKS_COOP_MEMBERS )
   end
end

function ss04_create_on_track_nightclub_groups()
   group_create_hidden( ON_TRACK_NIGHTCLUB_INITIAL_SAMEDI, true )
   group_create_hidden( ON_TRACK_NIGHTCLUB_SECOND_FLOOR_SAMEDI, true )
   group_create_hidden( VETERAN_CHILD_AND_SHAUNDI_GROUP, true )
   group_create_hidden( FLASHBANG_GROUP, true )

   if ( coop_is_active() ) then
      group_create_hidden( ON_TRACK_NIGHTCLUB_COOP_ATTACK_GROUP, true )
   end
end

-- Helper function for ss04_setup_state. This will be called while
-- the player is outside the nightclub.
-- It gets the nightclub ready and updates the player's objectives.
--
function ss04_setup_first_nightclub()
   -- Give the player an update concerning the objective
   mission_help_table( HT_TAKE_OUT_VC_CRONIES )

   -- Setup the enemies in the club
   -- Make them visible and add required-kill markers
   group_show( STOCKS_NIGHTCLUB_GROUP )
   if ( coop_is_active() ) then
      group_show( STOCKS_NIGHTCLUB_COOP_GROUP )
   end

   for l_index, l_name in pairs( VETERAN_CHILD_LIEUTENANTS ) do
      -- Add death tracking
      on_death( "ss04_stocks_required_kill_died", l_name )

      -- Add markers and on-death calls for the lieutenant's homies
      for h_index, h_name in pairs ( VETERAN_CHILD_LIEUTENANTS_HOMIES[l_index] ) do
         on_death( "ss04_stocks_required_kill_died", h_name )
      end
   end

   if ( coop_is_active() ) then
      for index, name in pairs( STOCKS_COOP_MEMBERS ) do
         on_death( "ss04_stocks_required_kill_died", name )
      end
   end
end

-- Raises the player's notoriety after they kill a Samedi required-kill in
-- the $tock$ nightclub.
--
function ss04_stocks_raise_notoriety()
   local cur_notoriety = notoriety_get_decimal( ENEMY_GANG )
   local increase_per_second = AFTER_STOCKS_MIN_NOTORIETY / AFTER_STOCKS_NOTORIETY_INCREASE_TIME_SECONDS

   while ( cur_notoriety < AFTER_STOCKS_MIN_NOTORIETY ) do
      local time_elapsed = get_frame_time()

      cur_notoriety = cur_notoriety + ( time_elapsed * increase_per_second )

      if ( cur_notoriety > AFTER_STOCKS_MIN_NOTORIETY ) then
         cur_notoriety = AFTER_STOCKS_MIN_NOTORIETY
      end

      notoriety_set( ENEMY_GANG, cur_notoriety )
      delay( 0 )
   end

   notoriety_set_min( ENEMY_GANG, AFTER_STOCKS_MIN_NOTORIETY )
end

-- Called when one of the required-kill Samedi in the $tock$ nightclub dies.
--
-- name: Name of the required-kill Samedi that died.
--
function ss04_stocks_required_kill_died( name )
   if ( Raise_notoriety_thread_handle == INVALID_THREAD_HANDLE ) then
      Raise_notoriety_thread_handle = thread_new( "ss04_stocks_raise_notoriety" )
   end

   marker_remove_npc( name, SYNC_ALL )
   Stocks_required_kills_remaining = Stocks_required_kills_remaining - 1
   if ( Stocks_required_kills_remaining <= 0 ) then
      ss04_setup_state( MS_CLEARED_FIRST_NIGHTCLUB )
   end
end

-- Helper function for ss04_setup_state. This will be called while
-- the player is outside the nightclub.
-- It gets the nightclub ready and updates the player's objectives.
--
function ss04_setup_reached_on_track_nightclub()
   -- Setup the "inside the nightclub" event to occur when the player opens
   -- one of the doors
   for index, door_name in pairs( ON_TRACK_DOORS ) do
      on_door_opened( "ss04_opened_on_track_door", door_name )
   end

   trigger_enable( ON_TRACK_SECOND_FLOOR_SPAWN_TRIGGER, true )
   on_trigger( "ss04_hit_on_track_second_floor_spawn_trigger", ON_TRACK_SECOND_FLOOR_SPAWN_TRIGGER )

   trigger_enable( ON_TRACK_BOTTOM_FLOOR_TRIGGER, true )
   on_trigger( "ss04_reached_bottom_floor", ON_TRACK_BOTTOM_FLOOR_TRIGGER )

   group_show( ON_TRACK_NIGHTCLUB_INITIAL_SAMEDI )
end

function ss04_reached_bottom_floor( triggerer_name, trigger_name )
   trigger_enable( trigger_name, false )

   -- Disable the guidance if you reach the floor first
   for index, trigger_name in pairs( ON_TRACK_TO_VC_TRIGGERS ) do
      trigger_enable( trigger_name, false )
   end

   ss04_setup_state( MS_REACHED_ON_TRACK_BOTTOM_FLOOR )
end

function ss04_stair_attackers_setup_and_attack_after_delay()
   for index, member_name in pairs( ON_TRACK_STAIRWAY_ATTACKERS ) do
      set_ignore_ai_flag( member_name, true )
   end
   delay( STAIR_ATTACKERS_ATTACK_DELAY_SECONDS )

   for index, member_name in pairs( ON_TRACK_STAIRWAY_ATTACKERS ) do
      local distance, player = get_dist_closest_player_to_object( member_name )
      set_ignore_ai_flag( member_name, false )
      attack_safe( member_name, player, false )
   end
end

function ss04_hit_on_track_second_floor_spawn_trigger( triggerer_name, trigger_name )
   group_show( ON_TRACK_NIGHTCLUB_SECOND_FLOOR_SAMEDI )
end

-- Updates the minimap guidance ( removes it ) when the player reaches
-- the entrance to the $tock$ club.
--
function ss04_reached_stocks_entrance( triggerer_name, trigger_name )
   waypoint_remove( SYNC_ALL )
   marker_remove_trigger( trigger_name, SYNC_ALL )
   trigger_enable( trigger_name, false )

   for l_index, l_name in pairs( VETERAN_CHILD_LIEUTENANTS ) do
      -- Add the required-kill markers
      marker_add_npc( l_name, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL )

      for h_index, h_name in pairs ( VETERAN_CHILD_LIEUTENANTS_HOMIES[l_index] ) do
         -- Add the required-kill markers
         marker_add_npc( h_name, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL )
      end
   end

   if ( coop_is_active() ) then
      for index, name in pairs( STOCKS_COOP_MEMBERS ) do
         marker_add_npc( name, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL )
      end
   end

   trigger_enable( STOCKS_MAIN_CLUB_ENTRANCE, true )
   on_trigger( "ss04_entered_stocks_club_area", STOCKS_MAIN_CLUB_ENTRANCE )
end

function ss04_entered_stocks_club_area( triggerer_name, trigger_name )
   trigger_enable( trigger_name, false )

   if ( notoriety_get( ENEMY_GANG ) < 1 ) then
      notoriety_set( ENEMY_GANG, 1 )
      notoriety_set_min( ENEMY_GANG, 1 )
   end

   attack_closest_player( VETERAN_CHILD_LIEUTENANTS[1] )
   attack_closest_player( VETERAN_CHILD_LIEUTENANTS_HOMIES[1][1] )
end

function ss04_left_stocks( triggerer_name, trigger_name )
   waypoint_add( ON_TRACK_ENTRANCES[1], SYNC_ALL )
   trigger_enable( trigger_name, false )
end

-- Updates the minimap guidance ( removes it ) when the player reaches
-- an entrance to the On Track club.
--
function ss04_reached_on_track_entrance( triggerer_name, trigger_name )
   trigger_enable( trigger_name, false )

   -- Tell the player to kill VC and guide him to VC
   mission_help_table( HT_KILL_VETERAN_CHILD )
   ss04_enable_next_path_trigger( ON_TRACK_TO_VC_TRIGGERS[1], "ss04_to_vc_01" )

   waypoint_remove( SYNC_ALL )
   marker_remove_trigger( ON_TRACK_ENTRANCES[1], SYNC_ALL )

   -- The stocks entrance trigger can cause a waypoint to be set here -
   -- it would be silly for it to be triggered again though now that
   -- we've reached On Track.
   trigger_enable( STOCKS_ENTRANCE, false )
end

-- This function is called when the player is outside the first
-- nightclub, but close enough to have triggered the trigger.
--
function ss04_reached_first_club( triggerer_name, trigger_name )
   trigger_enable( trigger_name, false )
   ss04_setup_state( MS_REACHED_FIRST_NIGHTCLUB )
end

-- Called when the player's in range and shooting view of the Samedi
-- in the office in the $tock$ nightclub.
--
function ss04_hit_window_shooting_trigger( triggerer_name, trigger_name )
   trigger_enable( trigger_name, false )

--[[
   -- Shoot out each window
   local fire_once = true
   for index, window_name in pairs( SHOOT_OUT_WINDOWS_NAVPOINTS ) do
      force_fire( STOCKS_OFFICE_LIEUTENANT, window_name, fire_once )
   end
]]
   -- Attack the player
   attack_safe( STOCKS_OFFICE_LIEUTENANT, triggerer_name, false )
end

-- Called when the player goes up the stairs toward the Samedi in the
-- office in the $tock$ nightclub.
--
function ss04_unleash_office_lieutenant( triggerer_name, trigger_name )
   trigger_enable( trigger_name, false )
   npc_leash_remove( STOCKS_OFFICE_LIEUTENANT )
end

-- This function is called when the player is outside the On Track
-- nightclub, but close enough to have triggered the trigger.
--
function ss04_reached_on_track_area( triggerer_name, trigger_name )
   ss04_setup_state( MS_REACHED_SECOND_NIGHTCLUB )

   on_trigger( "ss04_entered_on_track_area", trigger_name )
   on_trigger_exit( "ss04_left_on_track_area", trigger_name )

   ss04_entered_on_track_area()
end

-- Disable notoriety spawning when you're in the second nightclub's area -
-- design request.
--
function ss04_entered_on_track_area()
   delay( SECOND_NIGHTCLUB_NOTORIETY_END_SPAWNING_DELAY_SECONDS )
   notoriety_force_no_spawn( ENEMY_GANG, true )
end

-- Re-enable notoriety spawning when you've left the second nightclub's area -
-- companion to the design request to disable it when you're in the area.
--
function ss04_left_on_track_area()
   notoriety_force_no_spawn( ENEMY_GANG, false )
end

function ss04_opened_on_track_door()
   -- Clear on-door-opened callbacks - we only want them to be triggered once
   for index, door_name in pairs( ON_TRACK_DOORS ) do
      on_door_opened( "", door_name )
   end
   ss04_setup_state( MS_INSIDE_SECOND_NIGHTCLUB )
end

function ss04_shaundi_damaged( name, attacker, percent_hp_left )
   local percent_to_set = percent_hp_left
   if ( percent_hp_left < 0 ) then
      percent_to_set = 0
   end

   hud_bar_set_value( SHAUNDI_HEALTH_BAR_INDEX, percent_to_set, SYNC_ALL )
end

-- Victory function for Veteran child being killed
--
function ss04_veteran_child_killed()
   character_allow_ragdoll( VETERAN_CHILD_NAME, true )

   if ( human_shielding_disabled() or Testing_Aussie_version ) then
      marker_remove_npc( AUSSIE_VC_NAME, SYNC_ALL )
   end

   mission_end_success( MISSION_NAME, CT_OUTRO, { LOCAL_PLAYER_START_LOCATION, REMOTE_PLAYER_START_LOCATION } )
end

-- Failure function for Shaundi dying
--
function ss04_shaundi_died()
   hud_bar_set_value( SHAUNDI_HEALTH_BAR_INDEX, 0, SYNC_ALL )

   character_allow_ragdoll( SHAUNDI_NAME, true )
   mission_end_failure( MISSION_NAME, HT_SHAUNDI_DIED )
end

-- If the player runs away from Shaundi when Veteran Child's
-- still alive, fail the mission.
--
function ss04_shaundi_abandoned()
   mission_end_failure( MISSION_NAME, HT_SHAUNDI_ABANDONED )
end

function ss04_cleanup()
	-- Cleanup mission here
   for index, door_name in pairs( ON_TRACK_DOORS ) do
      on_door_opened( "", door_name )
   end
   shop_enable( STOCKS_SHOP_NAME, true )
   shop_enable( ON_TRACK_SHOP_NAME, true )
   -- The doors should go back to being unlocked after the
   -- mission ends
   ss04_lock_on_track_entrances( false )
   ss04_lock_stocks_entrances( false )

   spawning_allow_gang_ambient_spawns( true )
   persona_override_group_stop( SAMEDI_PERSONAS, POT_SITUATIONS[POT_ATTACK] )
   notoriety_set_min( ENEMY_GANG, 0 )
   mid_mission_phonecall_reset()
   chainsaw_enable()
   spawning_pedestrians( true )

   if ( Controls_disabled ) then
      player_controls_enable( LOCAL_PLAYER )
      if ( coop_is_active() ) then
         player_controls_enable( REMOTE_PLAYER )
      end
   end
end

function ss04_success()
	-- Called when the mission has ended with success
end
