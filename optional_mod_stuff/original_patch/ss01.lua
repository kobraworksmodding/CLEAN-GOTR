-- ss01.lua
-- SR2 mission script
-- 3/28/07

-- Mission help table text tags
   DISPLAY_NAME = "ss01_display_name"
   HT_DRIVE_TO_UNIVERSITY = "ss01_drive_to_university"
   HT_TEMP_SHAUNDI_BLAH = "ss01_temp_shaundi_blah"
   HT_KILL_DRUG_DEALERS = "ss01_kill_drug_dealers"
   HT_FIND_MR_GABBY = "ss01_find_mr_gabby"
   HT_CATCH_UP = "ss01_catch_up"
   HT_DRUG_DEALERS_ESCAPED = "ss01_drug_dealers_escaped"
   HT_MR_GABBY_ESCAPED = "ss01_mr_gabby_escaped"
   HT_GET_A_SAMPLE = "ss01_get_a_sample"
   HT_GRAB_STASH = "ss01_grab_stash"
   HT_LOOSE_STASH = "ss01_loose_stash"
   HT_TAKE_OUT_MR_GABBY = "ss01_take_out_mr_gabby"
   HT_X_OF_Y_PACKAGES_COLLECTED = "ss01_x_of_y_packages"
   HT_GET_SAMPLES_TO_SHAUNDI = "ss01_get_samples_to_shaundi"
   HT_GRAB_UNION_PACKAGE = "ss01_grab_union_package"
   HT_GRAB_PARKING_LOT_PACKAGE = "ss01_grab_parking_lot_package"
   HT_BUDDY_COLLECTED_PACKAGE = "ss01_buddy_collected_package"

-- Groups, NPCs, vehicles, navpoints, and other names
   REACHED_GOAL_DISTRICT_CHECKPOINT = "Reached_Goal_District"
   KILLED_INITIAL_DEALERS_CHECKPOINT = "Killed_Initial_Dealers"

   DEFAULT_PISTOL = "beretta"
   DEFAULT_SMG = "tec9"

   MISSION_NAME = "ss01"

   LOA_DUST_NAME = "loa_dust_package"

   START_NAVPOINT_NAME = "mission_start_sr2_city_$ss01"
   START_NAVPOINT_NAME_COOP_PLAYER = "ss01_$Coop_Player_Start"

   STARTING_CAR_GROUP_NAME = MISSION_NAME.."_$Starting_Car"
   STARTING_CAR_COOP_GROUP_NAME = "ss01_$Starting_Car_Coop"

   SAINTS_PARKING_LOT_TRIGGER_NAME = "ss01_$Saints_Parking_Lot_Area"

   UNIVERSITY_LOCATION_NAVPOINT_NAME = "ss01_$University_Location"

   DRUG_DEALER_GROUP_NAMES = { "ss01_$Dealer_Group_01", "ss01_$Dealer_Group_02" }
   DRUG_DEALER_GROUP_COOP_SUFFIX = "c"
   DEALER_GROUP_LOCATION_NAVPOINT_NAMES = { "ss01_$Group1_Location", "ss01_$Group2_Location" }
   DEALER_GROUP_TRIGGER_NAMES = { "ss01_$Group1_Location_Trigger", "ss01_$Group2_Location_Trigger" }

   DEALER_GROUP_CHUNK_NAMES = { "sr2_chunk106", "sr2_chunk085" }

   FINAL_DRUG_DEALER_GROUP_NAVPOINT_NAME = "ss01_$Group3_Location"
   FINAL_DEALER_TRIGGER_NAME = "ss01_$Group3_Location_Trigger"
   FINAL_DRUG_DEALER_GROUP_NAME = "ss01_$Dealer_Group_03"
   FINAL_DEALER_GROUP_VEHICLE_NAME = "ss01_$Group3_v1"
   FINAL_GROUP_GROUP_NUMBER = 3

   NEIGHBORHOOD_NAMES = { "sr2_ss_university01", "sr2_ss_university02" }
   GOAL_DISTRICT_NAME = "University"

   MISSION_END_POINT_TRIGGER = "ss01_$Mission_End_Point"

   -- Action Node States
   SELL_DRUGS = "DrugDealer"
   BUY_DRUGS = "DrugBuyer"

   -- Group member name:
   -- GROUP_MEMBER_GROUP_PREFIX..group_index..GROUP_MEMBER_MEMBER_PREFIX..member_index
   -- Coop group member name:
   -- GROUP_MEMBER_GROUP_PREFIX..group_index..GROUP_MEMBER_COOP_MEMBER_PREFIX..member_index
   GROUP_MEMBER_GROUP_PREFIX = "ss01_$Group"
   GROUP_MEMBER_COOP_PREFIX = "c"
   GROUP_MEMBER_MEMBER_PREFIX = "_Member_0"
   GROUP_MEMBER_COOP_MEMBER_PREFIX = GROUP_MEMBER_COOP_PREFIX..GROUP_MEMBER_MEMBER_PREFIX

   GROUP_ONE_BUYERS = { "ss01_$Buyer03", "ss01_$Buyer04" }
   GROUP_TWO_BUYERS = { "ss01_$Buyer01", "ss01_$Buyer02" }

   GROUPS_POSSIBLE_PACKAGE_HOLDERS = { { "ss01_$Group1_Member_03", "ss01_$Group1_Member_04" },
                                       { "ss01_$Group2_Member_03", "ss01_$Group2_Member_04", "ss01_$Group2_Member_05" } }

   GROUPS_DRUG_DEALERS = { { "ss01_$Group1_Member_02", "ss01_$Group1_Member_04" },
                           { "ss01_$Group2_Member_03", "ss01_$Group2_Member_04" } }

   CUTSCENE_BUYING_CHARACTER = "ss01_$Drug_Buyer_Cutscene"

   ENEMY_GANG = "samedi"
   -- Cutscenes
   CUTSCENE_NAME = "IG_ss01_scene1"
   CT_INTRO = "ss01-01"
   CT_OUTRO = "ss01-02"

	ESCAPE_PATHS = { "ss01_$Escape_Path_01", "ss01_$Escape_Path_02", "ss01_$Escape_Path_03",
						  "ss01_$Escape_Path_04", "ss01_$Escape_Path_05", "ss01_$Escape_Path_06" }

-- Audio/Dialog streams
   SONS_OF_SAMEDI_INTRODUCTION_DIALOG_STREAM =
   {
   { "SOS1_BACKGROUND_L1", nil, 0 },
   { "PLAYER_SOS1_BACKGROUND_L2", LOCAL_PLAYER, 0 },
   { "SOS1_BACKGROUND_L3", nil, 0 },
   { "PLAYER_SOS1_BACKGROUND_L4", LOCAL_PLAYER, 0 },
   { "SOS1_BACKGROUND_L5", nil, 0 },
   { "PLAYER_SOS1_BACKGROUND_L6", LOCAL_PLAYER, 0 }
   }
   SONS_OF_SAMEDI_CAR_DEALER_GROUP_DIALOG_STREAM =
   {
   { "PLAYER_SOS1_UNHIDDEN_L1", LOCAL_PLAYER, 0 },
   { "SOS1_UNHIDDEN_L2", nil, 0 }
   }
   SONS_OF_SAMEDI_FINAL_DIALOG_STREAM = 
   {
   { "PLAYER_SOS1_FINAL_L1", LOCAL_PLAYER, 0 },
   { "SOS1_FINAL_L2", nil, 0 }
   }

-- Distances
   MAX_ALLOWED_CAR_CHASE_DISTANCE_METERS = 70.0
   WANDER_RADIUS_METERS = 2.0
   ADD_PATH_CUTOFF_DIST_METERS = 20
   ACTION_NODE_SEARCH_RADIUS_METERS = 20

-- Percents and multipliers
   MR_GABBY_CAR_HIT_POINTS_PERCENT = 0.8

-- Time values
   OUT_OF_GROUP_AREA_FAIL_TIME_SECONDS = 30.0
   VICTORY_DELAY_SECONDS = 3.0
   CAR_CHASE_OUT_OF_RANGE_FAIL_TIME_MS = 30000
   BEFORE_CELLPHONE_CALL_DELAY_SECONDS = 4.0
   AFTER_CELLPHONE_CALL_DELAY_SECONDS = 5.0
   COMPLETE_IDIOT_TIME_SECONDS = 60.0
   SHAUNDI_START_BLATHERING_SECONDS = 2
	BEFORE_UNLEASH_DELAY_SECONDS = 4.0
   AFTER_FINAL_PACKAGE_COLLECTED_DELAY_SECONDS = 4.0

-- Speeds
   DEALER_CAR_MAX_SPEED_MPS = 45

-- Constant values and counts
   INITIAL_DRUG_DEALER_GROUP_COUNT = sizeof_table( DRUG_DEALER_GROUP_NAMES )

   GROUP1_DEALER_COUNT = 4
   GROUP1c_DEALER_COUNT = 2

   GROUP2_DEALER_COUNT = 5
   GROUP2c_DEALER_COUNT = 2

   GROUP_DEALER_COUNTS = { GROUP1_DEALER_COUNT, GROUP2_DEALER_COUNT }
   GROUP_DEALER_COUNTS_COOP = { GROUP1c_DEALER_COUNT, GROUP2c_DEALER_COUNT }

   FINAL_GROUP_MEMBER_COUNT = 3
   TOTAL_LOA_DUST_TO_COLLECT = 3
   LOA_DUST_TO_COLLECT_INITIAL = 2

   END_MISSION_NOTORIETY = 2

   STUDENT_UNION_DEALERS_GROUP_INDEX = 2
   PARKING_LOT_DEALERS_GROUP_INDEX = 1

-- Global variables
   Num_dealer_groups_remaining = INITIAL_DRUG_DEALER_GROUP_COUNT
   Group_members_remaining = {}
   Failure_thread_handles = { [LOCAL_PLAYER] = nil, [REMOTE_PLAYER] = nil }

   Group_committed_to_kill = { [LOCAL_PLAYER] = nil, [REMOTE_PLAYER] = nil }

   Goal_district_reached = false

   Group1_member_names = {}
   Group2_member_names = {}
   Group1_member_names_coop = {}
   Group2_member_names_coop = {}
   Final_group_member_names = {}
   Final_group_members_remaining = FINAL_GROUP_MEMBER_COUNT

   Groups = { Group1_member_names, Group2_member_names }
   Groups_coop = { Group1_member_names_coop, Group2_member_names_coop }
   Loa_dust_collected = 0

   Cur_dealer_group_path_location = { LOCAL_PLAYER = "none", REMOTE_PLAYER = "none" }

   Update_waypoint_thread_handle = INVALID_THREAD_HANDLE
   Dealer_vehicle_escape_thread = INVALID_THREAD_HANDLE
   Groups_cleared = { false, false, false }
   Get_sample_ht_played = { [LOCAL_PLAYER] = false, [REMOTE_PLAYER] = false }
   Pickup_package_prompt_thread_handles = { INVALID_THREAD_HANDLE, INVALID_THREAD_HANDLE }
   Group_dropped_sample = { false, false, false }
   Reached_district_checkpoint_set = false
   Shaundi_call_received = false

	Group_flee_triggered = false

-- Start and init function
-- Creates the groups and adds initial waypoint and other guidance.
--
function ss01_start( checkpoint_name, is_restart )
   -- Start trigger is hit...the activate button was hit
   set_mission_author("Mark Gabby and Brad Johnson")

   mission_start_fade_out()
   if ( checkpoint_name == MISSION_START_CHECKPOINT ) then
		-- Setup appropriate lists of starter vehicles based on SP or Coop
		local starter_groups = { DRUG_DEALER_GROUP_NAMES[1], DRUG_DEALER_GROUP_NAMES[2], FINAL_DRUG_DEALER_GROUP_NAME, STARTING_CAR_GROUP_NAME }
		if ( coop_is_active() ) then
			starter_groups = { DRUG_DEALER_GROUP_NAMES[1], DRUG_DEALER_GROUP_NAMES[2], FINAL_DRUG_DEALER_GROUP_NAME, STARTING_CAR_GROUP_NAME, STARTING_CAR_COOP_GROUP_NAME }
		end

		if ( is_restart == false ) then
			cutscene_play( CT_INTRO, starter_groups, { START_NAVPOINT_NAME, START_NAVPOINT_NAME_COOP_PLAYER }, false )
			for index, group_name in pairs( starter_groups ) do
				group_show( group_name )
			end
		else
			for index, group_name in pairs( starter_groups ) do
				group_create( group_name, true )
			end
		end
   end

	-- Teleport after all groups are loaded - helps with loading times
	if ( checkpoint_name == MISSION_START_CHECKPOINT and is_restart ) then
		teleport_coop( START_NAVPOINT_NAME, START_NAVPOINT_NAME_COOP_PLAYER )
	end

   spawning_allow_gang_team_ambient_spawns( HUMAN_TEAM_SAMEDI, false )

   -- Setup mission item callbacks here - they should always be called
   on_mission_item_pickup( "ss01_loa_dust_picked_up" )
   on_mission_item_drop( "ss01_loa_dust_dropped" )

   if ( checkpoint_name == MISSION_START_CHECKPOINT ) then
      -- Add callback for the player getting a phone call from Shaundi
      trigger_enable( SAINTS_PARKING_LOT_TRIGGER_NAME, true )
      on_trigger_exit( "ss01_shaundi_blah", SAINTS_PARKING_LOT_TRIGGER_NAME )
      notoriety_force_no_spawn( ENEMY_GANG, true )

      -- Add callbacks for district changed in order to update objectives
      -- once the players reach the University district
      on_district_changed( "ss01_district_changed", LOCAL_PLAYER )
      on_district_changed( "ss01_district_changed", REMOTE_PLAYER )

      ss01_setup_first_two_groups()
   elseif ( checkpoint_name == REACHED_GOAL_DISTRICT_CHECKPOINT ) then
		group_create_hidden( FINAL_DRUG_DEALER_GROUP_NAME, true )
      ss01_setup_first_two_groups()
   elseif ( checkpoint_name == KILLED_INITIAL_DEALERS_CHECKPOINT ) then
      Loa_dust_collected = LOA_DUST_TO_COLLECT_INITIAL

      -- Spawn the final goal
      mission_debug( "About to create final drug group." )
		group_create_hidden( FINAL_DRUG_DEALER_GROUP_NAME, true )
      ss01_create_final_drug_dealer_group( true )
   end

	mission_start_fade_in()

   -- Guide the players
   notoriety_set_max( ENEMY_GANG, END_MISSION_NOTORIETY )
   notoriety_set_max( "police", END_MISSION_NOTORIETY )
   
   if ( checkpoint_name == MISSION_START_CHECKPOINT ) then
      mission_help_table( HT_DRIVE_TO_UNIVERSITY )
      district_set_pulsing( GOAL_DISTRICT_NAME, true, SYNC_ALL )
      waypoint_add( UNIVERSITY_LOCATION_NAVPOINT_NAME, SYNC_ALL )
      marker_add_navpoint( UNIVERSITY_LOCATION_NAVPOINT_NAME, MINIMAP_ICON_LOCATION, "", SYNC_ALL )
   elseif ( checkpoint_name == REACHED_GOAL_DISTRICT_CHECKPOINT ) then

      Goal_district_reached = true

      ss01_prompt_and_guide_for_first_two_groups( SYNC_ALL )
   elseif ( checkpoint_name == KILLED_INITIAL_DEALERS_CHECKPOINT ) then
      objective_text(0, HT_X_OF_Y_PACKAGES_COLLECTED, Loa_dust_collected, TOTAL_LOA_DUST_TO_COLLECT )
   end
end

function ss01_shaundi_call_received()
   Shaundi_call_received = true
end

function ss01_shaundi_and_player_converse()
   mid_mission_phonecall("ss01_shaundi_call_received")
   repeat
      thread_yield()
   until Shaundi_call_received or Goal_district_reached

   if ( Shaundi_call_received ) then
      audio_play_conversation( SONS_OF_SAMEDI_INTRODUCTION_DIALOG_STREAM, INCOMING_CALL )
   end
   mid_mission_phonecall_reset()
end


function ss01_shaundi_blah()
   trigger_enable( SAINTS_PARKING_LOT_TRIGGER_NAME, false )
   delay( SHAUNDI_START_BLATHERING_SECONDS )

   ss01_shaundi_and_player_converse()
end

function ss01_inform_player_of_final_goal()
   delay( BEFORE_CELLPHONE_CALL_DELAY_SECONDS )
   audio_play_conversation( SONS_OF_SAMEDI_CAR_DEALER_GROUP_DIALOG_STREAM, OUTGOING_CALL )
   mission_help_table( HT_FIND_MR_GABBY )
   delay( AFTER_CELLPHONE_CALL_DELAY_SECONDS )
end

function ss01_setup_first_two_groups()
   -- Activate and setup the triggers for the inital drug dealer groups
   for index, trigger in pairs( DEALER_GROUP_TRIGGER_NAMES ) do
      trigger_enable( trigger, true )
      on_trigger( "ss01_entered_group_trigger", trigger )
      on_trigger_exit( "ss01_left_group_trigger", trigger )
   end

   -- Create the initial drug dealer groups, the names of their members,
   -- and add on-death callbacks for them.
   for index, group_name in pairs( DRUG_DEALER_GROUP_NAMES ) do
		if ( group_is_loaded( group_name ) == false ) then
	      group_create( group_name, true )
		end
      Group_members_remaining[index] = GROUP_DEALER_COUNTS[index]
      if ( coop_is_active() ) then
         Group_members_remaining[index] = Group_members_remaining[index] + GROUP_DEALER_COUNTS_COOP[index]
         group_create( group_name..DRUG_DEALER_GROUP_COOP_SUFFIX, true )
      end

      Groups[index], Groups_coop[index] = ss01_create_group_member_names( index,
                                                                          GROUP_DEALER_COUNTS[index],
                                                                          GROUP_DEALER_COUNTS_COOP[index] )

      ss01_group_setup_inventory( index, Groups[index], Groups_coop[index] )
      ss01_group_add_death_callbacks( index, Groups[index], Groups_coop[index] )
      ss01_group_begin_wander( index, Groups[index], Groups_coop[index] )
   end
end

-- Returns the group index for the passed-in trigger.
--
function ss01_find_group_index_from_trigger_name( trigger_name )
   local group_index

   for index, trigger in pairs( DEALER_GROUP_TRIGGER_NAMES ) do
      if ( trigger_name == trigger ) then
         group_index = index
      end
   end

   return group_index
end

function ss01_group_play_action_node_actions( group_index )
   while( city_chunk_has_extras_loaded( DEALER_GROUP_CHUNK_NAMES[group_index] ) == false ) do
      thread_yield()
   end
   mission_debug( "group "..group_index.."'s chunk has extras loaded.", 15 )

   for index, dealer_name in pairs( GROUPS_DRUG_DEALERS[group_index] ) do
      if ( character_is_dead( dealer_name ) == false and Groups_cleared[group_index] == false ) then
         mission_debug( dealer_name.." has been told to use an action node.", 15 )
         npc_use_closest_action_node_of_type( dealer_name, SELL_DRUGS, ACTION_NODE_SEARCH_RADIUS_METERS )
      end
      delay( 2.0 )
   end
end

-- Callback when the player enters one of the group triggers for the drug dealer groups.
--
-- triggerer_name: The name of the person that triggered the trigger.
-- trigger_name: The name of the trigger than was triggered.
--
function ss01_entered_group_trigger( triggerer_name, trigger_name )
   local group_index = ss01_find_group_index_from_trigger_name( trigger_name )

   -- Play the help text letting the player know what to do if he hasn't had it told to him
   -- yet
   if ( Get_sample_ht_played[triggerer_name] == false ) then
      local sync_type = sync_from_player( triggerer_name )
      mission_help_table( HT_GET_A_SAMPLE, "", "", sync_type )
      Get_sample_ht_played[triggerer_name] = true
   end

   -- Find out if the player that's wandered into this trigger is already committed to
   -- kill a group or not
   if ( Group_committed_to_kill[triggerer_name] ~= nil ) then
      -- If so, then if it's this group, kill the failure thread and let this
      -- player continue the fight
      if ( Group_committed_to_kill[triggerer_name] == group_index and
           Failure_thread_handles[triggerer_name] ~= nil ) then
         mission_debug( "stopped failure timer for "..triggerer_name )
         thread_kill( Failure_thread_handles[triggerer_name] )
         Failure_thread_handles[triggerer_name] = nil
      end
   -- If not, commit this player to do so
   else
      -- Have the dealers play their selling actions
      thread_new( "ss01_group_play_action_node_actions", group_index )

      local sync_type = sync_from_player( triggerer_name )
      for index, navpoint_name in pairs( DEALER_GROUP_LOCATION_NAVPOINT_NAMES ) do
         mission_debug( "Entered trigger. Removing marker for "..navpoint_name..".", 15 )
         marker_remove_navpoint( navpoint_name, sync_type )
      end
      waypoint_remove( sync_type )

      if ( Update_waypoint_thread_handle ~= INVALID_THREAD_HANDLE ) then
         thread_kill( Update_waypoint_thread_handle )
	      Update_waypoint_thread_handle = INVALID_THREAD_HANDLE
      end

      Group_committed_to_kill[triggerer_name] = group_index

      Groups[group_index], Groups_coop[group_index] = ss01_create_group_member_names( group_index,
                                                                                      GROUP_DEALER_COUNTS[group_index],
                                                                                      GROUP_DEALER_COUNTS_COOP[group_index] )

      local other_group_index = STUDENT_UNION_DEALERS_GROUP_INDEX
      if ( group_index == STUDENT_UNION_DEALERS_GROUP_INDEX ) then
         other_group_index = PARKING_LOT_DEALERS_GROUP_INDEX
      end

      -- Only mark this group if there isn't a loose package
      local package_is_loose = false
      if ( Group_dropped_sample[other_group_index] and
           Groups_cleared[other_group_index] == false ) then
         package_is_loose = true
      end
      if ( package_is_loose == false ) then
         ss01_group_mark( sync_type, Groups[group_index], Groups_coop[group_index] )
      end
   end
end

-- Returns the group index that the npc with the passed-in name belongs to.
--
function ss01_find_group_index_from_name( name )
   -- Check the first group
   if ( ss01_is_member_in_group( name, Groups[1] ) or 
        ss01_is_member_in_group( name, Groups_coop[1] ) ) then
      return 1;
   -- Check the second
   elseif ( ss01_is_member_in_group( name, Groups[2] ) or
            ss01_is_member_in_group( name, Groups_coop[2] ) ) then
      return 2;
   -- Check the last
   elseif ( ss01_is_member_in_group( name, Final_group_member_names ) ) then
      return 3;
   end
end

-- Goes through all members in the passed-in list of names and checks to
-- see if the passed-in name is in the list. If so, returns true. Otherwise,
-- returns false.
--
function ss01_is_member_in_group( name, group_member_names )
   for index, member_name in pairs( group_member_names ) do
      if ( name == member_name ) then
         return true
      end
   end

   return false
end

function ss01_group_setup_inventory( group_index, group_member_names, group_member_names_coop )

   -- Give all the group members pistols only
   for index, member_name in pairs( group_member_names ) do
      inv_item_remove_all( member_name )
      inv_item_add( DEFAULT_PISTOL, 1, member_name )
   end

   if ( coop_is_active() and group_member_names_coop ~= nil ) then
      for index, member_name in pairs( group_member_names_coop ) do
         inv_item_remove_all( member_name )
         inv_item_add( DEFAULT_PISTOL, 1, member_name )
      end
   end

   -- Now, give one of the group members a submachine gun
   local num_members = sizeof_table( group_member_names )
   local random_member_index = rand_int( 1, num_members )
   inv_item_add( DEFAULT_SMG, 1, group_member_names[random_member_index] )

   -- Finally, give one of the group members the loa dust package
   --    ( among those who have the potential to have a package )
   local members_that_might_have_packages = GROUPS_POSSIBLE_PACKAGE_HOLDERS[group_index]
   local num_potential_package_holders = sizeof_table( members_that_might_have_packages )

   random_member_index = rand_int( 1, num_potential_package_holders )
   loot_item_add( LOA_DUST_NAME, members_that_might_have_packages[random_member_index] )
end

-- Adds death callbacks for the passed-in group.
--
-- group_index: The index of this group.
-- group_member_names: The names of the group members.
-- group_member_names_coop: (Optional) The names of the coop additions to the group.
--
function ss01_group_add_death_callbacks( group_index, group_member_names, group_member_names_coop )
   for index, member_name in pairs( group_member_names ) do
      on_death( "ss01_group_member_died_group"..group_index, member_name )
   end

   if ( coop_is_active() and group_member_names_coop ~= nil ) then
      for index, member_name in pairs( group_member_names_coop ) do
         on_death( "ss01_group_member_died_group"..group_index, member_name )
      end
   end
end

-- Returns true if this member of this group is a drug dealer, false otherwise.
--
-- group_index: Group this member belongs to.
-- member_name: Name of the member.
--
-- Note that member_name might not actually belong to this group. It's up to the
-- caller to assure that.
--
function ss01_member_is_dealer( group_index, member_name )
   for index, dealer_name in pairs( GROUPS_DRUG_DEALERS[group_index] ) do
      if ( member_name == dealer_name ) then
         return true
      end
   end
   return false
end

-- Makes the members of the passed-in group wander about.
--
-- group_index: The index of this group.
-- group_member_names: The names of the group members.
-- group_member_names_coop: (Optional) The names of the coop additions to the group.
--
function ss01_group_begin_wander( group_index, group_member_names, group_member_names_coop )
   for index, member_name in pairs( group_member_names ) do
      -- We don't want dealers to wander, it'll mess up their action node attachments
      if ( ss01_member_is_dealer( group_index, member_name ) == false ) then
         wander_start(member_name, member_name, WANDER_RADIUS_METERS)
         mission_debug( member_name.." of group "..group_index.." told to wander.", 15 )
      end
   end

   if ( coop_is_active() and group_member_names_coop ~= nil ) then
      for index, member_name in pairs( group_member_names_coop ) do
	      wander_start(member_name, member_name, WANDER_RADIUS_METERS) 
      end
   end
end

-- Adds minimap and on-screen markers to the members of the drug dealer group.
--
-- sync_type: Whether to do this for the local player, the remote player, or both.
-- group_member_names: The names of the group members.
-- group_member_names_coop: (Optional) The names of the coop additions to the group.
--
function ss01_group_mark( sync_type, group_member_names, group_member_names_coop )
   for index, member_name in pairs( group_member_names ) do
      if ( character_is_dead(member_name ) == false ) then
         marker_add_npc( member_name, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, sync_type )
      end
   end

   if ( coop_is_active() and group_member_names_coop ~= nil ) then
      for index, member_name in pairs( group_member_names_coop ) do
         if ( character_is_dead(member_name ) == false ) then
            marker_add_npc( member_name, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, sync_type )
         end
      end
   end
end

-- Removes minimap and on-screen markers to the members of the drug dealer group.
--
-- sync_type: Whether to do this for the local player, the remote player, or both.
-- group_member_names: The names of the group members.
-- group_member_names_coop: (Optional) The names of the coop additions to the group.
--
function ss01_group_unmark( sync_type, group_member_names, group_member_names_coop )
   for index, member_name in pairs( group_member_names ) do
      if ( character_is_dead(member_name ) == false ) then
         marker_remove_npc( member_name, sync_type )
      end
   end

   if ( coop_is_active() and group_member_names_coop ~= nil ) then
      for index, member_name in pairs( group_member_names_coop ) do
         if ( character_is_dead(member_name ) == false ) then
            marker_remove_npc( member_name, sync_type )
         end
      end
   end
end

-- Callback when a member of group 1 dies.
-- Calls ss01_group_member_died with group 1 as a parameter.
--
function ss01_group_member_died_group1( member_name )
   ss01_group_member_died( member_name, 1 )
end

-- Callback when a member of group 2 dies.
-- Calls ss01_group_member_died with group 2 as a parameter.
--
function ss01_group_member_died_group2( member_name )
   ss01_group_member_died( member_name, 2 )
end

-- Deals with updating that's required when a member of the initial
-- drug dealer groups dies.
--
-- member_name: Name of the member who died.
-- group_index: The group that this member belongs to.
--
function ss01_group_member_died( member_name, group_index )
   -- Remove the marker and track the group count
   Group_members_remaining[group_index] = Group_members_remaining[group_index] - 1
   marker_remove_npc( member_name, SYNC_ALL )
   mission_debug( Group_members_remaining[group_index].." group members remaining in group "..group_index )
end

function ss01_loa_dust_dropped( dropper_name )
   local group_index = ss01_find_group_index_from_name( dropper_name )

   if ( group_index ~= nil ) then
      Group_dropped_sample[group_index] = true

      mission_debug( "group "..group_index.." dropped a sample.", 10 )

      local player_responsible = "unknown"

      -- Find out which player was committed to kill this group, and give an
      -- appropriate help text message if that player hasn't gotten one yet
      if ( group_index == 3 ) then
         mission_help_table( HT_GRAB_STASH, "", "", SYNC_ALL )
      else
			if ( Group_committed_to_kill[LOCAL_PLAYER] == group_index ) then
				mission_help_table( HT_GRAB_STASH, "", "", SYNC_LOCAL )
				player_responsible = LOCAL_PLAYER
			end
			if ( Group_committed_to_kill[REMOTE_PLAYER] == group_index ) then
				mission_help_table( HT_GRAB_STASH, "", "", SYNC_REMOTE )
				player_responsible = REMOTE_PLAYER
			end
		end

      -- Find the first unused pickup prompt thread handle and spawn a pickup
      -- prompt thread there. This thread will prompt the player that killed the
      -- guy who dropped the package to pick it up.
      for index, thread_handle in pairs( Pickup_package_prompt_thread_handles ) do
         if ( thread_handle == INVALID_THREAD_HANDLE ) then
            Pickup_package_prompt_thread_handles[index] = thread_new( "ss01_pickup_prompt", player_responsible )
            mission_debug( "thread with handle "..Pickup_package_prompt_thread_handles[index].." and index "..index.." spawned.", 10 )
            break
         end
      end

      -- Remove all markers - the loa dust package should take priority right now
      for index, location_nav_name in pairs( DEALER_GROUP_LOCATION_NAVPOINT_NAMES ) do
         marker_remove_navpoint( location_nav_name, SYNC_ALL )
      end

      -- Just in case the dealer with the package was killed while the player was outside the trigger,
      -- remove the GPS guidance if it's active.
      if ( Update_waypoint_thread_handle ~= INVALID_THREAD_HANDLE ) then
         thread_kill( Update_waypoint_thread_handle )
	      Update_waypoint_thread_handle = INVALID_THREAD_HANDLE
      end
      waypoint_remove( SYNC_ALL )

      --[[ Strictly follows mission guidelines, but probably a BAD IDEA
      -- Remove any group markers for groups the other player is killing
      local players = { LOCAL_PLAYER, REMOTE_PLAYER }
      for index, player_name in pairs( players ) do
         if ( Group_committed_to_kill[player_name] ~= group_index and
              Group_committed_to_kill[player_name] ~= nil ) then
            local other_group_index = Group_committed_to_kill[player_name]
            local other_player_sync = sync_from_player[player_name]
            ss01_group_unmark( other_player_sync, Groups[other_group_index], Groups_coop[group_index] )
         end
      end
      ]]

      -- Mark the group as non-critical
      if ( group_index < 3 ) then
         ss01_dealer_group_non_critical( group_index )
			ss01_dealer_group_unleash( group_index )
      else
         ss01_final_drug_dealer_group_non_critical()
      end
   end
end

-- Delays for a set number of seconds and then lets the players
-- know to pick up the loa dust package.
--
-- player_responsible: Set to LOCAL_PLAYER, REMOTE_PLAYER, or something else.
--                     If it's not LOCAL_PLAYER or REMOTE_PLAYER, then we don't
--                     know who's responsible so prompt everyone.
--
function ss01_pickup_prompt( player_responsible )
   delay( COMPLETE_IDIOT_TIME_SECONDS )

   local sync_type = SYNC_ALL
   if ( player_responsible == LOCAL_PLAYER ) then
      sync_type = SYNC_LOCAL
   elseif ( player_responsible == REMOTE_PLAYER ) then
      sync_type = SYNC_REMOTE
   end

   mission_help_table_nag( HT_LOOSE_STASH, "", "", sync_type )
end

-- Callback when the loa dust is picked up.
--
function ss01_loa_dust_picked_up( player_name )
   Loa_dust_collected = Loa_dust_collected + 1

   -- Find the first running prompt thread and kill it.
   for index, thread_handle in pairs( Pickup_package_prompt_thread_handles ) do
      if ( thread_handle ~= INVALID_THREAD_HANDLE ) then
         thread_kill( thread_handle )
         mission_debug( "thread with handle "..Pickup_package_prompt_thread_handles[index].." and index "..index.." killed.", 10 )
         Pickup_package_prompt_thread_handles[index] = INVALID_THREAD_HANDLE
         break
      end
   end
   
   local closest_nav
   local group_index
   closest_nav, group_index = ss01_get_closest_nav_to_char( DEALER_GROUP_LOCATION_NAVPOINT_NAMES, player_name )

   if ( Loa_dust_collected <= LOA_DUST_TO_COLLECT_INITIAL ) then
      objective_text(0, HT_X_OF_Y_PACKAGES_COLLECTED, Loa_dust_collected, LOA_DUST_TO_COLLECT_INITIAL )

      -- Mark this group as cleared
      ss01_dealer_group_cleared( group_index )

      mission_debug( "Cleared group with index: "..group_index..".", 30 )
   else
      objective_text(0, HT_X_OF_Y_PACKAGES_COLLECTED, Loa_dust_collected, TOTAL_LOA_DUST_TO_COLLECT )
   end

   mission_debug( Num_dealer_groups_remaining.." groups remaining, "..Loa_dust_collected.." packages picked up." )

   if ( Loa_dust_collected == TOTAL_LOA_DUST_TO_COLLECT ) then
      notoriety_force_no_spawn( ENEMY_GANG, false )

      notoriety_set_min( ENEMY_GANG, END_MISSION_NOTORIETY )
      delay( AFTER_FINAL_PACKAGE_COLLECTED_DELAY_SECONDS )
      audio_play_conversation( SONS_OF_SAMEDI_FINAL_DIALOG_STREAM, OUTGOING_CALL )
      mission_help_table( HT_GET_SAMPLES_TO_SHAUNDI, "", "", SYNC_ALL )
      marker_add_trigger( MISSION_END_POINT_TRIGGER, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION, SYNC_ALL )
      waypoint_add( MISSION_END_POINT_TRIGGER, SYNC_ALL )
      trigger_enable( MISSION_END_POINT_TRIGGER, true )
      on_trigger( "ss01_mission_complete", MISSION_END_POINT_TRIGGER )
   elseif ( Loa_dust_collected == INITIAL_DRUG_DEALER_GROUP_COUNT ) then
      mission_set_checkpoint( KILLED_INITIAL_DEALERS_CHECKPOINT )

      mission_debug( "About to create final drug group." )
      ss01_create_final_drug_dealer_group( false )

      -- Inform the player of the final goal
      ss01_inform_player_of_final_goal()

      -- Update the objective with the extra package of dust that's required
      objective_text(0, HT_X_OF_Y_PACKAGES_COLLECTED, Loa_dust_collected, TOTAL_LOA_DUST_TO_COLLECT )

      -- Spawn the final goal
      for index, member_name in pairs( Final_group_member_names ) do
         marker_add_npc( member_name, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL )
      end
      waypoint_add( FINAL_DRUG_DEALER_GROUP_NAVPOINT_NAME, SYNC_ALL )
   else
      -- Let all players that were committed to kill this group know to get the next package
      local other_player = LOCAL_PLAYER
      if ( player_name == LOCAL_PLAYER ) then
         other_player = REMOTE_PLAYER
      end

      -- Find out whether to tell one or both players about the next index
      local sync_type = sync_from_player( player_name )
      if ( Group_committed_to_kill[other_player] == group_index ) then
         sync_type = SYNC_ALL
      end

      -- Find out the index of the other group
      local other_group_index = STUDENT_UNION_DEALERS_GROUP_INDEX
      if ( group_index == STUDENT_UNION_DEALERS_GROUP_INDEX ) then
         other_group_index = PARKING_LOT_DEALERS_GROUP_INDEX
      end

      --[[ Strictly follows mission guidelines, but probably a bad idea.
      -- If the other player is busy fighting the other group, then add markers that group for that
      -- player ( All markers were removed when the dust was dropped. )
      if ( Group_committed_to_kill[other_player] == other_group_index and
           Group_dropped_sample[other_group_index] == false ) then
         local other_player_sync = sync_from_player[other_player]
         ss01_group_mark( other_player_sync, Groups[other_group_index], Groups_coop[group_index] )
      end
      ]]

      -- Let the appropriate players know
      if ( Groups_cleared[STUDENT_UNION_DEALERS_GROUP_INDEX] == false ) then
         mission_help_table( HT_GRAB_UNION_PACKAGE, "", "", sync_type )
      else
         mission_help_table( HT_GRAB_PARKING_LOT_PACKAGE, "", "", sync_type )
      end
   end

end

-- Called when the last dealer group becomes non-critical. This happens when the group's
-- package is dropped.
--
function ss01_final_drug_dealer_group_non_critical()
   mission_debug( "marking final group as non-critical", 10 )
   for index, member_name in pairs( Final_group_member_names ) do
      if ( character_is_dead(member_name ) == false ) then
         marker_remove_npc( member_name )
         on_death( "", member_name )
      end
   end
   distance_display_off(SYNC_ALL)
   hud_timer_stop(0)
end

function ss01_dealer_group_unleash( group_index )
	delay( BEFORE_UNLEASH_DELAY_SECONDS )

	for index, name in pairs( Groups[group_index] ) do
		npc_leash_remove( name )
	end
end

-- Called when a dealer group becomes non-critical. This happens when the group's
-- package is dropped.
--
function ss01_dealer_group_non_critical( group_index )
   mission_debug( "Group "..group_index.." no longer critical." )
   Num_dealer_groups_remaining = Num_dealer_groups_remaining - 1
   marker_remove_navpoint( DEALER_GROUP_LOCATION_NAVPOINT_NAMES[group_index], SYNC_ALL )
   -- Disable this trigger, it shouldn't be used anymore.
   trigger_enable( DEALER_GROUP_TRIGGER_NAMES[group_index], false )

   -- Clear any failure timers that relate to this group, since it's dead
   if ( Group_committed_to_kill[LOCAL_PLAYER] == group_index ) then
      if ( Failure_thread_handles[LOCAL_PLAYER] ~= nil ) then
         mission_debug( "stopped failure timer for "..LOCAL_PLAYER )
         thread_kill( Failure_thread_handles[LOCAL_PLAYER] )
         Failure_thread_handles[LOCAL_PLAYER] = nil
      end
      Group_committed_to_kill[LOCAL_PLAYER] = nil
   end

   if ( Group_committed_to_kill[REMOTE_PLAYER] == group_index ) then
      if ( Failure_thread_handles[REMOTE_PLAYER] ~= nil ) then
         mission_debug( "stopped failure timer for "..REMOTE_PLAYER )
         thread_kill( Failure_thread_handles[REMOTE_PLAYER] )
         Failure_thread_handles[REMOTE_PLAYER] = nil
      end
      Group_committed_to_kill[REMOTE_PLAYER] = nil
   end

   for index, member_name in pairs( Groups[group_index] ) do
      if ( character_is_dead(member_name ) == false ) then
         marker_remove_npc( member_name )
         on_death( "", member_name )
      end
   end

   if ( coop_is_active() ) then
      for index, member_name in pairs( Groups_coop[group_index] ) do
         if ( character_is_dead(member_name ) == false ) then
            marker_remove_npc( member_name )
            on_death( "", member_name )
         end
      end
   end
end

-- Called when a entire group has been cleared by collecting
-- its Loa dust package. Updates the number of groups left.
--
-- group_index: Index of the group that was cleared.
--
function ss01_dealer_group_cleared( group_index )
   Groups_cleared[group_index] = true

   if ( Num_dealer_groups_remaining > 0 ) then

      -- Now that we've cleared a group, kill the update waypoint thread and restart it.
      -- The new information on what groups are cleared will cause it to update the paths.
      if ( Update_waypoint_thread_handle ~= INVALID_THREAD_HANDLE ) then
         thread_kill( Update_waypoint_thread_handle )
      end
      Update_waypoint_thread_handle = thread_new( "ss01_update_waypoint" )

      -- Go through all the remaining groups and add location markers for them
      for group_index, cleared in pairs( Groups_cleared ) do
         if ( cleared == false and group_index <= INITIAL_DRUG_DEALER_GROUP_COUNT ) then

            local players = { REMOTE_PLAYER, LOCAL_PLAYER }

            -- Add markers for this group for players who are not already committed to
            -- kill this group
            for player_index, player_name in pairs( players ) do
               if ( Group_committed_to_kill[player_name] ~= group_index ) then
                  local sync_type = sync_from_player( player_name )
                  marker_add_navpoint( DEALER_GROUP_LOCATION_NAVPOINT_NAMES[group_index],
                                       MINIMAP_ICON_LOCATION, "", sync_type )
               end
            end

         end
      end
   end
end

-- Function to create the final drug dealer group.
--
function ss01_create_final_drug_dealer_group( from_checkpoint )
   group_show( FINAL_DRUG_DEALER_GROUP_NAME )
   trigger_enable( FINAL_DEALER_TRIGGER_NAME, true )
   on_trigger( "ss01_final_group_trigger", FINAL_DEALER_TRIGGER_NAME )

   Final_group_member_names = ss01_create_group_member_names( FINAL_GROUP_GROUP_NUMBER,
                                                              FINAL_GROUP_MEMBER_COUNT, 0 )

   on_vehicle_destroyed( "ss01_dealer_vehicle_destroyed", FINAL_DEALER_GROUP_VEHICLE_NAME )
   on_take_damage( "ss01_final_groups_vehicle_attacked", FINAL_DEALER_GROUP_VEHICLE_NAME )
   vehicle_max_speed( FINAL_DEALER_GROUP_VEHICLE_NAME, DEALER_CAR_MAX_SPEED_MPS )

   local new_car_hp = MR_GABBY_CAR_HIT_POINTS_PERCENT * get_current_hit_points( FINAL_DEALER_GROUP_VEHICLE_NAME )
   set_current_hit_points( FINAL_DEALER_GROUP_VEHICLE_NAME, new_car_hp )
   set_max_hit_points( FINAL_DEALER_GROUP_VEHICLE_NAME, new_car_hp )

   for index, member_name in pairs( Final_group_member_names ) do
      on_death( "ss01_final_group_group_member_died", member_name )
      on_take_damage( "ss01_final_group_trigger", member_name )
   end

   -- Driver should have the loa dust
   loot_item_add( LOA_DUST_NAME, Final_group_member_names[1] )

   vehicle_enter_group_teleport( Final_group_member_names, FINAL_DEALER_GROUP_VEHICLE_NAME )
   if ( from_checkpoint ) then
      for index, member_name in pairs( Final_group_member_names ) do
         marker_add_npc( member_name, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL )
      end
      waypoint_add( FINAL_DEALER_GROUP_VEHICLE_NAME, SYNC_ALL )
      mission_help_table( HT_FIND_MR_GABBY )
   end
end

function ss01_dealer_vehicle_destroyed()
   hud_timer_stop(0)
   distance_display_off(SYNC_ALL)
end

-- Returns the first living member of the group that's found.
--
-- group_members: The names of the group members.
-- group_members_coop: (Optional) The names of the coop additions to the group.
--
function ss01_get_living_group_member( group_members, group_members_coop )
   for index, member_name in pairs( group_members ) do
      if ( character_is_dead(member_name ) == false ) then
         return member_name
      end
   end

   if ( coop_is_active() and group_members_coop ~= nil ) then
      for index, member_name in pairs( group_members_coop ) do
         if ( character_is_dead(member_name ) == false ) then
            return member_name
         end
      end
   end
   return nil
end

-- Callback when the final group's vehicle is attacked. Causes the group
-- to flee if the attacker is one of the players.
--
function ss01_final_groups_vehicle_attacked( attacker_name )
   if ( attacker_name == LOCAL_PLAYER or attacker_name == REMOTE_PLAYER ) then
      ss01_final_group_trigger( triggerer_name )
   end
end

-- Callback for the final group's trigger. Causes the group to
-- flee.
--
function ss01_final_group_trigger( triggerer_name )
	if ( Group_flee_triggered == false ) then
		Group_flee_triggered = true
		-- Remove the callbacks - this function should only be called once
		on_take_damage( "", FINAL_DEALER_GROUP_VEHICLE_NAME )
		for index, member_name in pairs( Final_group_member_names ) do
			on_take_damage( "", member_name )
		end
		trigger_enable( FINAL_DEALER_TRIGGER_NAME, false )

		mission_debug( "final group triggered", 10 )
		-- Now, if the sample hasn't been dropped, this group is still critical.
		-- Otherwise, it's no longer critical, so don't mark it.
		if ( Group_dropped_sample[3] == false ) then
			local sync_type = sync_from_player( triggerer_name )
			mission_help_table( HT_TAKE_OUT_MR_GABBY, "", "", sync_type )
			if ( Dealer_vehicle_escape_thread == INVALID_THREAD_HANDLE ) then
				Dealer_vehicle_escape_thread = thread_new( "ss01_vehicle_escape" )
			end
		else
			for index, member_name in pairs( Final_group_member_names ) do
				marker_remove_npc( member_name )
			end
			for index, member_name in pairs( Final_group_member_names ) do
				vehicle_exit( member_name )
				local distance, player = get_dist_closest_player_to_object( member_name )
				attack_safe( member_name, player, false )
			end
		end
	end
end

-- Callback when a member of the final group dies.
--
-- member_name: The name of the group member that died.
--
function ss01_final_group_group_member_died( member_name )
   Final_group_members_remaining = Final_group_members_remaining - 1
   marker_remove_npc( member_name, SYNC_ALL )
end
-- End the mission
--
function ss01_mission_complete()
	
	if ( character_is_in_vehicle( LOCAL_PLAYER ) ) then

       player_controls_disable( LOCAL_PLAYER )
		 turn_invulnerable(LOCAL_PLAYER, false) 

       vehicle_stop_do( LOCAL_PLAYER )

    end

    if ( coop_is_active() ) then

       if ( character_is_in_vehicle( REMOTE_PLAYER ) ) then

          player_controls_disable( REMOTE_PLAYER )
			turn_invulnerable(REMOTE_PLAYER, false)
          vehicle_stop_do( REMOTE_PLAYER )

       end

    end

   mission_end_success( MISSION_NAME, CT_OUTRO)
end

-- Causes a group to attack the passed-in player.
--
-- player_name: The player to attack
-- group_member_names: The names of the group members.
-- group_member_names_coop: (Optional) The names of the coop additions to the group.
--
function ss01_group_attack( player_name, group_member_names, group_member_names_coop )
   for index, member_name in pairs( group_member_names ) do
      attack_safe( member_name, player_name )
   end

   if ( coop_is_active() ) then
      for index, member_name in pairs( group_member_names_coop ) do
         attack_safe( member_name, player_name )
      end
   end
end

function ss01_member_escape_human_shield( player_name, member_name )
   character_release_human_shield( player_name, false )
   character_set_cannot_be_grabbed( member_name, true )

   delay( 1 )

   local member_start = member_name
   set_ignore_ai_flag( member_name, true )
   move_to_safe( member_name, member_start, 3, true, true )
   set_ignore_ai_flag( member_name, false )
   character_set_cannot_be_grabbed( member_name, false )
   attack_closest_player( member_name )
end

-- Failure countdown is started when the player leaves a group trigger if he's committed to
-- kill that group.
--
function ss01_left_group_trigger( triggerer_name, trigger_name )
   local group_index = ss01_find_group_index_from_trigger_name( trigger_name )

   -- Check to see if this player has a scripted character as a human shield
   local human_shield_name = character_get_human_shield_name( triggerer_name )
   if ( human_shield_name ~= nil ) then
      -- If so, check to see if it's a member of this group
      local human_shields_group_index = ss01_find_group_index_from_name( human_shield_name )
      if ( human_shields_group_index == group_index ) then
         -- If so, then have them get loose and run away
         thread_new( "ss01_member_escape_human_shield", triggerer_name, human_shield_name )
      end
   end

   -- Find out if the player that's wandered into this trigger is already committed to
   -- kill a group or not
   if ( Group_committed_to_kill[triggerer_name] == group_index ) then
      -- Only spawn a failure thread if there isn't one already running.
      if ( Failure_thread_handles[triggerer_name] == nil ) then
         mission_debug( "started failure timer for "..triggerer_name )
         Failure_thread_handles[triggerer_name] = thread_new( "ss01_failure_timer" )
      end
   end
end

-- This function is an internal timer that counts down to mission failure.
--
function ss01_failure_timer()
   delay( OUT_OF_GROUP_AREA_FAIL_TIME_SECONDS )

   -- The timer's elapsed, call the 'discovered' function.
   mission_end_failure( MISSION_NAME, HT_DRUG_DEALERS_ESCAPED )
end

-- Callback for district changing. If the district is the target district,
-- this function advances the mission to the next stage for the player
-- that reaches it.
--
function ss01_district_changed( player_name, new_district, prev_district )
   -- If we've made it to the district
   if ( new_district == GOAL_DISTRICT_NAME ) then
      -- Remove the marker and waypoint path
      district_set_pulsing( GOAL_DISTRICT_NAME, false, SYNC_ALL )
      waypoint_remove( SYNC_ALL ) 
      marker_remove_navpoint( UNIVERSITY_LOCATION_NAVPOINT_NAME, SYNC_ALL )

      -- Remove this callback
      on_district_changed( "", LOCAL_PLAYER )
      if ( coop_is_active() ) then
         on_district_changed( "", REMOTE_PLAYER )
      end

      -- Set the player as having reached the goal and update their
      -- waypoint GPS path
      Goal_district_reached = true

		thread_yield()
      if ( Reached_district_checkpoint_set == false ) then
         Reached_district_checkpoint_set = true
			ss01_prompt_and_guide_for_first_two_groups( SYNC_ALL )
         mission_set_checkpoint( REACHED_GOAL_DISTRICT_CHECKPOINT )
      end
   end
end

function ss01_prompt_and_guide_for_first_two_groups( sync_type )
   -- Add a help message and navpoints for the drug dealers
   mission_help_table( HT_KILL_DRUG_DEALERS, "", "", sync_type )
   delay( .96 )
   --objective_text( HT_X_OF_Y_PACKAGES_COLLECTED, 0, LOA_DUST_TO_COLLECT_INITIAL )
   for index, navpoint_name in pairs( DEALER_GROUP_LOCATION_NAVPOINT_NAMES ) do
      -- Only add navpoints for non-cleared groups
      if ( Groups_cleared[index] == false ) then
         marker_add_navpoint( navpoint_name, MINIMAP_ICON_LOCATION, "", sync_type )
      end
   end

   -- Add waypoint to the nearest group   
   if ( Update_waypoint_thread_handle == INVALID_THREAD_HANDLE ) then
      Update_waypoint_thread_handle = thread_new( "ss01_update_waypoint" )
   end
end

-- 
function ss01_get_closest_nav_to_char( navpoint_names, character_name )
   local closest_nav_name = navpoint_names[1]
   local closest_dist = get_dist_char_to_nav( character_name, navpoint_names[1] )
   local closest_index = 1

   for nav_index, nav_name in pairs( navpoint_names ) do
       local cur_dist = get_dist_char_to_nav( character_name, nav_name )

       if ( cur_dist < closest_dist ) then
         closest_nav_name = nav_name
         closest_dist = cur_dist
	      closest_index = nav_index
       end
   end

   return closest_nav_name, closest_index, closest_dist
end

function ss01_good_distance()
   hud_timer_stop(0)
end

function ss01_dealer_escaping()
   mission_help_table_nag( HT_CATCH_UP )
   -- Add a timer - if he doesn't catch up soon enough, he fails
   hud_timer_set(0, CAR_CHASE_OUT_OF_RANGE_FAIL_TIME_MS, "ss01_dealer_vehicle_escaped" )
end

function ss01_dealer_vehicle_escaped()
   mission_end_failure( MISSION_NAME, HT_MR_GABBY_ESCAPED )
end

function ss01_vehicle_escape()

   waypoint_remove( SYNC_ALL )

   -- Only have the vehicles escape if the group still exists
   if ( Final_group_members_remaining > 0 ) then
      -- Add callbacks for the distance
      distance_display_on( Final_group_member_names[1], 0,
                           MAX_ALLOWED_CAR_CHASE_DISTANCE_METERS, 0, MAX_ALLOWED_CAR_CHASE_DISTANCE_METERS, SYNC_ALL )      

      -- Update the distance callbacks
      on_tailing_good( "ss01_good_distance" )
      on_tailing_too_far( "ss01_dealer_escaping" )

      local use_navmesh = true
      local stop_at_goal = false
      local num_paths = sizeof_table( ESCAPE_PATHS )

      -- Go through each part of the path
      for index, path_name in pairs( ESCAPE_PATHS ) do
         -- Stop at the last goal point
         if ( num_paths == index ) then
            stop_at_goal = true
         end
			if ( ( vehicle_exists( FINAL_DEALER_GROUP_VEHICLE_NAME ) and vehicle_is_destroyed( FINAL_DEALER_GROUP_VEHICLE_NAME ) == false ) and
				  ( character_exists( Final_group_member_names[1] ) and character_is_dead( Final_group_member_names[1] ) == false ) ) then
	         vehicle_pathfind_to( FINAL_DEALER_GROUP_VEHICLE_NAME, path_name, use_navmesh, stop_at_goal )
			end
      end

      for index, member in pairs( Final_group_member_names ) do
         vehicle_exit( member )
         set_attack_player_flag( member, true ) 
      end
   end
end

-- Creates group member names for the groups based on the group index and the
-- number of group members and coop group members.
--
-- group_index: The index of the group to create.
-- member_count: The number of members in this group.
-- coop_member_count: The number of additional members for coop mode.
--
function ss01_create_group_member_names( group_index, member_count, coop_member_count )
   local member_names = {}
   local member_names_coop = {}

   local increment = 1

   for member_index = 1, member_count, increment do
      member_names[member_index] = GROUP_MEMBER_GROUP_PREFIX..group_index..GROUP_MEMBER_MEMBER_PREFIX..member_index
   end

   if ( coop_is_active() ) then   
      for member_index = 1, coop_member_count, increment do
         member_names_coop[member_index] = GROUP_MEMBER_GROUP_PREFIX..group_index..GROUP_MEMBER_COOP_MEMBER_PREFIX..member_index
      end
   end

   return member_names, member_names_coop
end

-- This function updates the waypoint paths if the player has moved such that one of the locations
-- is closer than another one.
--
function ss01_update_waypoint()
   local group_locations = {}
   local group_location_count = 0

   -- Find the surviving groups' locations and store them correctly in the 'group_locations'
   -- table.
   for index, cleared in Groups_cleared do
      if ( cleared == false ) then
         if ( index == 1 ) then
	         group_location_count = group_location_count + 1
	         group_locations[group_location_count] = DEALER_GROUP_LOCATION_NAVPOINT_NAMES[1]
	      elseif ( index == 2 ) then
            group_location_count = group_location_count + 1
            group_locations[group_location_count] = DEALER_GROUP_LOCATION_NAVPOINT_NAMES[2]
	      end
       end
   end
   Cur_dealer_group_path_location[LOCAL_PLAYER] = ""
   Cur_dealer_group_path_location[REMOTE_PLAYER] = ""

   while ( Loa_dust_collected < 2 ) do
      -- Find out if we should update the local player's path
      local closest_nav_local, c_index, c_dist = ss01_get_closest_nav_to_char( group_locations, LOCAL_PLAYER )
		-- Only replot the path if the closest navpoint is different than the last time we checked
      if ( Cur_dealer_group_path_location[LOCAL_PLAYER] ~= closest_nav_local ) then
         waypoint_remove( SYNC_LOCAL )
         waypoint_add( closest_nav_local, SYNC_LOCAL )
         Cur_dealer_group_path_location[LOCAL_PLAYER] = closest_nav_local
      end

      -- Find out if we should update the remote player's path
      if ( coop_is_active() ) then
         local closest_nav_remote, c_index, c_dist = ss01_get_closest_nav_to_char( group_locations, REMOTE_PLAYER )

			-- Only replot the path if the closest navpoint is different than the last time we checked
         if ( Cur_dealer_group_path_location[REMOTE_PLAYER] ~= closest_nav_remote ) then
            waypoint_remove( SYNC_REMOTE )
            waypoint_add( closest_nav_remote, SYNC_REMOTE )
            Cur_dealer_group_path_location[REMOTE_PLAYER] = closest_nav_remote
         end
      end

      delay( 1 )
   end
end

function ss01_cleanup()
   -- Cleanup mission here
   on_district_changed( "", LOCAL_PLAYER )
   on_district_changed( "", REMOTE_PLAYER )
	turn_vulnerable(LOCAL_PLAYER) 
	if coop_is_active() then
		turn_vulnerable(REMOTE_PLAYER) 
	end

   mid_mission_phonecall_reset()

   notoriety_set_min( ENEMY_GANG, 0 )
   distance_display_off(SYNC_ALL)
   on_tailing_good( "" )
   on_tailing_too_far( "" )
	hud_timer_stop( 0 )

   on_mission_item_pickup( "" )
   on_mission_item_drop( "" )
   on_trigger_exit( "", SAINTS_PARKING_LOT_TRIGGER_NAME )
   for index, trigger in pairs( DEALER_GROUP_TRIGGER_NAMES ) do
      on_trigger( "", trigger )
      on_trigger_exit( "", trigger )
   end
   waypoint_remove( SYNC_ALL )
   spawning_allow_gang_team_ambient_spawns( HUMAN_TEAM_SAMEDI )
   district_set_pulsing( GOAL_DISTRICT_NAME, false, SYNC_ALL )

	-- Remove all markers
	marker_remove_navpoint( UNIVERSITY_LOCATION_NAVPOINT_NAME, SYNC_ALL )
   for index, navpoint_name in pairs( DEALER_GROUP_LOCATION_NAVPOINT_NAMES ) do
		marker_remove_navpoint( navpoint_name, SYNC_ALL )
	end
	marker_remove_trigger( MISSION_END_POINT_TRIGGER, SYNC_ALL )
	ss01_maybe_remove_group_markers( Final_group_member_names )
	ss01_maybe_remove_group_markers( Group1_member_names )
   ss01_maybe_remove_group_markers( Group2_member_names )
   ss01_maybe_remove_group_markers( Group1_member_names_coop )
   ss01_maybe_remove_group_markers( Group2_member_names_coop )
end

function ss01_maybe_remove_group_markers( group_name )
	if ( group_name[0] ~= nil ) then
		for index, member_name in pairs( group_name ) do
         marker_remove_npc( member_name, SYNC_ALL )
      end
	end
end

function ss01_success()
   -- Called when the mission has ended with success
   release_to_world( STARTING_CAR_GROUP_NAME )
end
