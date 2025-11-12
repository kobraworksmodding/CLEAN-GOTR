-- bh05.lua
-- SR2 mission script
-- 3/28/07

-- Groups --
	GROUP_JESSICAS_CAR =						"bh05_$jessicas_car"
	GROUP_BANK =								"bh05_$bank"
	GROUP_BANK_COOP =							"bh05_$bank_coop"
	GROUP_COURTESY_CAR =						"bh05_$courtesy_car"
   GROUP_COURTESY_CAR_COOP =           "bh05_$courtesy_car_coop"
	GROUP_SWAT =								"bh05_$swat"
	GROUP_ARENA =								"bh05_$arena"
	GROUP_BANK_OUTSIDE =						"bh05_$bank_outside"
	GROUP_ALARM_SWAT =						"bh05_$alarm_swat"

-- Navpoints --
	NAV_LOCAL_START =							"bh05_$n002"
	NAV_REMOTE_START =						"bh05_$n003"
	NAV_BANK =									"bh05_$n000"
	NAV_BANK_INTERIOR =						"bh05_$n001"
	NAV_SWAT_DEST =							"bh05_$n004"
	NAV_TRUNK =									"bh05_$n007"
	NAV_TRUNK_CAM =							"bh05_$n023"
	NAV_JESSICA_FLEE =						{ "bh05_$n006", "bh05_$n008", "bh05_$n009" }

   NAV_SWAT_FRONT =							{ { "bh05_$n010", "bh05_$n013" },
													  { "bh05_$n010", "bh05_$n014" },
													  { "bh05_$n010", "bh05_$n011" },
													  { "bh05_$n010", "bh05_$n015" },
													  { "bh05_$n010", "bh05_$n012" },
													  { "bh05_$n010" } }

   SWAT_FRONT_LEASHED =						{ true, false, true, false, true, true}

   SWAT_SIDE_LEASHED =						{true, true, false, true, false, true}

   ALARM_DIRECTION =                   "bh05_$Alarm_Direction"
   AUSSIE_ALARM_DIRECTION =            "bh05_$Aussie_Alarm_Direction"

   FRONT_APC_WARP_POINTS =             { "bh05_$APC1_S1", "bh05_$APC1_S2" }
   SIDE_APC_WARP_POINTS =              { "bh05_$APC2_S1", "bh05_$APC2_S2" }
   APC_WARP_POINTS =                   { FRONT_APC_WARP_POINTS, SIDE_APC_WARP_POINTS }

   FRONT_APC_PATHS =                   { "bh05_$APC1_P1", "bh05_$APC1_P2" }
   SIDE_APC_PATHS =                    { "bh05_$APC2_P1", "bh05_$APC2_P2" }
   APC_PATHS =                         { FRONT_APC_PATHS, SIDE_APC_PATHS }

   OUTSIDE_COP_CAR_PATH =              "bh05_$Outside_Cop_Car_Path"

-- Triggers --
	TRIGGER_ARENA =							"bh05_$t000"
	TRIGGER_TRUNK =							"bh05_$t001"
	TRIGGER_ALARM =							"bh05_$t002"

   TRIGGER_BANK_INTERIOR =             "bh05_$Inside_Bank"

-- Interiors --
   BANK_INTERIOR =                     "barrio_$Bank_Interior"

-- Characters --
	CHAR_JESSICA =								"bh05_$c000"
	CHAR_BANK_SECURITY =						{"bh05_$c001", "bh05_$c002", "bh05_$c003", "bh05_$c004", "bh05_$c005"}
	CHAR_BANK_SECURITY_COOP =				{"bh05_$c015", "bh05_$c016"}
	CHAR_BANK_TELLERS =						{"bh05_$c006", "bh05_$c008"}
	CHAR_BANK_TELLERS_IDLE =				{"bh05_$c007", "bh05_$c009"}
	CHAR_BANK_CUSTOMERS =					{"bh05_$c011", "bh05_$c012"}
	CHAR_SWAT =									{"bh05_$c013", "bh05_$c014"}
	CHAR_SWAT_FRONT =							{"bh05_$c023", "bh05_$c024", "bh05_$c025", "bh05_$c026", "bh05_$c027", "bh05_$c028"}
	CHAR_SWAT_SIDE =							{"bh05_$c029", "bh05_$c030", "bh05_$c031", "bh05_$c032", "bh05_$c033", "bh05_$c034"}
   CHAR_SWAT_APCS =                    { CHAR_SWAT_FRONT, CHAR_SWAT_SIDE }

   CHAR_OUTSIDE_COP_CAR =              {"bh05_$c017", "bh05_$c018", "bh05_$c022" }

-- Vehicles --
	VEH_JESSICAS_CAR =						"bh05_$v000"
	VEH_SWAT =									"bh05_$v002"

   VEH_SWAT_SIDE_APC =                 "bh05_$SWAT_Side_APC"
   VEH_SWAT_FRONT_APC =                "bh05_$SWAT_Front_APC"
   VEH_SWAT_APCS =                     { VEH_SWAT_FRONT_APC, VEH_SWAT_SIDE_APC }

   VEH_OUTSIDE_COP_CAR =               "bh05_$v004"

-- Mesh Movers --
	MOVER_BANK_DOOR =							"bh05_$Bank_Door"

-- Threads --
	THREAD_BANK_ALARM =						-1
	THREAD_KEEP_HOSTAGE =					-1
	THREAD_JESSICA_TRUNK_VOICE =			-1

-- Checkpoints --
   CP_REACHED_BANK = "reached_bank_checkpoint"

-- Cutscenes --
	CUTSCENE_IN =						"br05-01"
	CUTSCENE_OUT =						"br05-02"
   CUTSCENE_TRUNK_TOSS =         "IG_bh05_scene1"

-- Voice --
	VOICE_JESSICA_TRUNK =			{"JESSICA_TRUNK_HIT",
											 "JESSICA_TRUNK_THROWN",
											 "VOC_JESSICA_TRUNK",
                                  "JESSICA_BR05_INTRUCK_1" }

-- Animations --
	ANIM_TRUNK_TOSS =							"GML1_HS_Trnk_Toss_A.animx"
	ANIM_TRUNK_TOSS_RECEIVE =				"GML1_HS_Trnk_Toss_B.animx"
	ANIM_ALARM_SHUTOFF =						"GML1_HS_SD_Dial_Jessica.animx"
   ANIM_ALARM_SHUTOFF_NO_HS =          "GFL1_BS_SD_Dial.animx"
	ANIM_BANK_SECURITY =						{"idle", "idle variant 1", "idle variant 2", "idle variant 3", "idle variant 4", "ready whip"}
	ANIM_BANK_TELLERS =						{"talk confrontational", "talk submissive", "talk yell", "react oh hell no", "react Surprised",
													"react negative A", "react negative B", "react negative C", "react positive A", "react positive B", "react positive C",
													"idle", "idle Greet", "idle flirt", "idle variant 1", "idle variant 2", "idle variant 3", "idle variant 4", "idle variant 5",
													"idle variant 6", "idle variant 7", "idle variant 8"}
	ANIM_BANK_TELLERS_IDLE =				{"idle", "idle Greet", "idle flirt", "idle variant 1", "idle variant 2", "idle variant 3", "idle variant 4", "idle variant 5",
													"idle variant 6", "idle variant 7", "idle variant 8"}
	ANIM_BANK_CUSTOMERS =					{"talk confrontational", "talk submissive", "talk yell", "react oh hell no", "react Surprised",
													"react negative A", "react negative B", "react negative C", "react positive A", "react positive B", "react positive C",
													"idle", "idle Greet", "idle flirt", "idle variant 1", "idle variant 2", "idle variant 3", "idle variant 4", "idle variant 5",
													"idle variant 6", "idle variant 7", "idle variant 8"}

-- Sound
   -- Persona overrides
   JESSICA_PERSONA_OVERRIDES = { { "hostage - barters", "JESSICA_BR05_HOSTAGE" } }

   -- Lines/Dialog Stream
   JESSICA_GRABBED_LINE = "JESSICA_BR05_GRABBED_1"
   JESSICA_PRE_ALARM_DISABLED = "JESSICA_BR05_ALARM_OFF_01"
   SHUT_OFF_ALARM_DIALOG_STREAM =
   {
   { "PLAYER_BR05_ALARM_L1", LOCAL_PLAYER, 0 },
   { "BR05_ALARM_L2", CHAR_JESSICA, 0 },
   { "PLAYER_BR05_ALARM_L3", LOCAL_PLAYER, 0 }
   }
	SHUT_OFF_ALARM_DIALOG_STREAM_REMOTE =
	{
   { "PLAYER_BR05_ALARM_L1", REMOTE_PLAYER, 0 },
   { "BR05_ALARM_L2", CHAR_JESSICA, 0 },
   { "PLAYER_BR05_ALARM_L3", REMOTE_PLAYER, 0 }
	}


-- Text --
	TEXT_GO_TO_THE_BANK =					"bh05_go_to_the_bank"
	TEXT_GRAB_JESSICA =						"bh05_grab_jessica"
	TEXT_DONT_DAMAGE_CAR =					"bh05_dont_damage_car" 
	TEXT_HOLD_TRIGGERS =						"bh05_hold_triggers"
	TEXT_KEEP_HOSTAGE =						"bh05_keep_hostage"
	TEXT_TAKE_JESSICA_TO_VEHICLE =		"bh05_take_jessica_to_vehicle"
	TEXT_JESSICA_GETTING_AWAY =			"bh05_jessica_getting_away"
	TEXT_GET_NEXT_TO_JESSICA =				"bh05_get_next_to_jessica" 
	TEXT_PRESS_Y =								"bh05_press_y"
	TEXT_TAKE_JESSICA_TO_UNIVERSITY =	"bh05_take_jessica_to_university" 
	TEXT_DONT_WRECK =							"bh05_dont_wreck"
   TEXT_DONT_DESTROY_CAR =             "bh05_dont_destroy_car"
	TEXT_JESSICA_DIED =						"bh05_jessica_died"
   TEXT_JESSICA_STICKYBOMBED =         "bh05_jessica_stickybombed"
	TEXT_JESSICA_ESCAPED =					"bh05_jessica_escaped"
	TEXT_JESSICAS_CAR_DESTROYED =			"bh05_jessicas_car_destroyed"
	TEXT_DOORS_SEALED =						"bh05_doors_sealed"
	TEXT_DOORS_OPENED =						"bh05_doors_opened"
	TEXT_PRESS_Y_ALARM =						"bh05_press_y_to_stop_alarm"
	TEXT_GET_BACK_IN_CAR =					"bh05_get_back_in_car"
	TEXT_CAR_ABANDONED =						"bh05_car_abandoned"

-- Other --
   JESSICA_AFTER_GRABBED_PLAY_LINE_DELAY_SECONDS = 10.0
	JESSICAS_CAR_LOW_HP_THRESHOLD_PERCENT =         0.75

   TRUCK_DOOR_OPEN_ACCELERATION_MPSS = 300.0

	MONSTER_TRUCK_COMMERCIAL = "NEWS_ACT_RACING02"
	EXTRA_DAMAGE_AMOUNT =		50
	CAR_ABANDON_WARNING_DIST =	5
	BANK_INTERIOR_RADIUS =		20
	Jessica_in_trunk =			false
	Alarm_triggered =				false
	Alarm_shut_off =				false
	Shutting_off_alarm =			false
	Alarm_audio_id =				-1

   Players_in_bank_interior = { [LOCAL_PLAYER] = false, [REMOTE_PLAYER] = false }
   Players_in_jessicas_car = { [LOCAL_PLAYER] = false, [REMOTE_PLAYER] = false }
   Jessica_inside_bank = true

   Player_with_jessica_as_follower = "none"

   Controls_disabled = false
   Player_with_disabled_controls = "none"
   Num_bank_security_remaining = 0
   Testing_Aussie_version = false

function bh05_start( checkpoint_name, is_restart )
	-- Start trigger is hit...the activate button was hit
	set_mission_author("Aaron Hanson (aka Father Zucosos)")

   action_nodes_restrict_spawning( true )

   mission_start_fade_out()

   if ( checkpoint_name == MISSION_START_CHECKPOINT ) then
		local starter_groups = { GROUP_BANK, GROUP_COURTESY_CAR, GROUP_JESSICAS_CAR }
		if ( coop_is_active() ) then
			starter_groups = { GROUP_BANK, GROUP_BANK_COOP, GROUP_COURTESY_CAR, GROUP_COURTESY_CAR_COOP, GROUP_JESSICAS_CAR }
		end

		if ( is_restart == false ) then
			cutscene_play( CUTSCENE_IN, starter_groups, { NAV_LOCAL_START, NAV_REMOTE_START }, false )
			for index, group_name in pairs( starter_groups ) do
				group_show( group_name )
			end
			teleport_coop( NAV_LOCAL_START, NAV_REMOTE_START )
		else
			for index, group_name in pairs( starter_groups ) do
				group_create( group_name, true )
			end
			teleport_coop( NAV_LOCAL_START, NAV_REMOTE_START )	
		end
   end

   local resuming_from_checkpoint = false
   bh05_create_and_setup_jessicas_car()
   bh05_create_and_setup_bank_interior()

   set_police_never_fire_at_civilian_human_shields()
   if ( checkpoint_name == CP_REACHED_BANK ) then
      resuming_from_checkpoint = true
   end
   
   mission_start_fade_in()
	notoriety_force_no_spawn("police", true)

	bh05_get_to_the_bank( resuming_from_checkpoint )
end

function bh05_entered_bank( triggerer_name, trigger_name )
   if ( triggerer_name ~= nil ) then
      if ( triggerer_name == CHAR_JESSICA ) then
         Jessica_inside_bank = true
      elseif ( character_is_player( triggerer_name ) ) then
         Players_in_bank_interior[triggerer_name] = true
      end
   end
end

function bh05_left_bank( triggerer_name, trigger_name )
   if ( triggerer_name ~= nil ) then
      if ( triggerer_name == CHAR_JESSICA ) then
         Jessica_inside_bank = false
      elseif ( character_is_player( triggerer_name ) ) then
         Players_in_bank_interior[triggerer_name] = false
      end
   end
end

function bh05_create_and_setup_jessicas_car()
	if ( group_is_loaded( GROUP_JESSICAS_CAR ) == false ) then
		group_create(GROUP_JESSICAS_CAR, true)
	end
   on_take_damage( "bh05_jessicas_car_took_damage", VEH_JESSICAS_CAR )
	on_vehicle_destroyed("bh05_failure_jessicas_car_destroyed", VEH_JESSICAS_CAR)
	--vehicle_set_radio_controls_locked(VEH_JESSICAS_CAR, true)
   vehicle_prevent_explosion_fling( VEH_JESSICAS_CAR, true )
	vehicle_infinite_mass(VEH_JESSICAS_CAR, true)
   set_unjackable_flag( VEH_JESSICAS_CAR, true )
   vehicle_set_untowable( VEH_JESSICAS_CAR )
end

function bh05_bank_security_killed( character_name )
   marker_remove_npc( character_name, SYNC_ALL )
   Num_bank_security_remaining = Num_bank_security_remaining - 1

   -- If all of the interior security guards have been killed, then add Jessica as a follower to
   -- one of the players
   if ( Num_bank_security_remaining == 0 ) then

      -- The closest player is the natural choice
      local distance, closest_player = get_dist_closest_player_to_object( CHAR_JESSICA )

      if ( Players_in_bank_interior[closest_player] ) then
         party_add( CHAR_JESSICA, closest_player )
         Player_with_jessica_as_follower = closest_player
      -- If the closest player is not in the bank, the other player gets Jessica
      else
         local other_player = LOCAL_PLAYER
         if ( closest_player == LOCAL_PLAYER ) then
            other_player = REMOTE_PLAYER
         end

         party_add( CHAR_JESSICA, other_player )
         Player_with_jessica_as_follower = other_player
      end

      npc_combat_enable( CHAR_JESSICA, false )
   end
end

function bh05_create_and_setup_bank_interior()
   -- Bank characters and behavior
	if ( group_is_loaded( GROUP_BANK ) == false ) then
	   group_create(GROUP_BANK, true)
	end
   for i, npc in pairs(CHAR_BANK_SECURITY) do
		wander_start(npc, npc, 10)
	end

   on_interior_enter( "bh05_entered_bank", BANK_INTERIOR )
   on_interior_exit( "bh05_left_bank", BANK_INTERIOR )

   if ( coop_is_active() ) then
		if ( group_is_loaded( GROUP_BANK_COOP ) == false ) then
	      group_create(GROUP_BANK_COOP, true)
		end
      for i, npc in pairs(CHAR_BANK_SECURITY_COOP) do
         wander_start(npc, npc, 10)
      end
   end

   -- Bank inside/outside tracking. Doesn't causing anything to happen by itself.
   trigger_enable( TRIGGER_BANK_INTERIOR, true )
   on_trigger( "bh05_entered_bank", TRIGGER_BANK_INTERIOR )
   on_trigger_exit( "bh05_left_bank", TRIGGER_BANK_INTERIOR )

   -- Weapon firing tracking - checks for inside bank, and potentially sets off
   -- alarm.
   on_weapon_fired("bh05_weapon_fired", LOCAL_PLAYER)
	if ( coop_is_active() ) then
		on_weapon_fired("bh05_weapon_fired", REMOTE_PLAYER)
	end
end

function bh05_get_to_the_bank( resuming_from_checkpoint )

   if ( resuming_from_checkpoint == false ) then
   	mission_help_table(TEXT_GO_TO_THE_BANK)
      marker_add_navpoint(NAV_BANK, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION, SYNC_ALL)
      waypoint_add(NAV_BANK, SYNC_ALL) 

      delay(6)

      while ((get_dist_char_to_nav(LOCAL_PLAYER, NAV_BANK) > 15) and ((not coop_is_active()) or get_dist_char_to_nav(REMOTE_PLAYER, NAV_BANK) > 15)) do
         thread_yield()
      end
      marker_remove_navpoint(NAV_BANK, SYNC_ALL)
      waypoint_remove(SYNC_ALL)

      mission_set_checkpoint( CP_REACHED_BANK )
   end

   if ( human_shielding_disabled() or Testing_Aussie_version ) then
      for i, npc in pairs(CHAR_BANK_SECURITY) do
         marker_add_npc( npc, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL )
         on_death( "bh05_bank_security_killed", npc )
      end
      Num_bank_security_remaining = Num_bank_security_remaining + sizeof_table( CHAR_BANK_SECURITY )

      if ( coop_is_active() ) then
         group_create(GROUP_BANK_COOP, true)
         for i, npc in pairs(CHAR_BANK_SECURITY_COOP) do
            wander_start(npc, npc, 10)

            -- If we're running without human shielding, these guys are required kills.
            if ( human_shielding_disabled() or Testing_Aussie_version ) then
               marker_add_npc( npc, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL )
               on_death( "bh05_bank_security_killed", npc )
            end
         end
         Num_bank_security_remaining = Num_bank_security_remaining + sizeof_table( CHAR_BANK_SECURITY_COOP )
      end
	end

	on_take_damage("bh05_player_taking_damage", LOCAL_PLAYER)
	if ( coop_is_active() ) then
		on_take_damage("bh05_player_taking_damage", REMOTE_PLAYER)
	end
   on_take_damage( "bh05_maybe_set_off_bank_alarm", CHAR_JESSICA )

	on_death("bh05_failure_jessica_died", CHAR_JESSICA)
   on_projectile_hit( "bh05_projectile_hit" )

	mission_help_table(TEXT_GRAB_JESSICA)

   if ( human_shielding_disabled() or Testing_Aussie_version ) then
      delay( 5.0 )
      mission_help_table("tss01_kill_guards")
      repeat
         thread_yield()
      until ( Player_with_jessica_as_follower ~= "none" )
   else
      -- Let the player know he should grab Jessica, and set her up to be upset when he does
      marker_add_npc(CHAR_JESSICA, MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_PROTECT_ACQUIRE, SYNC_ALL)
      for index, override in pairs( JESSICA_PERSONA_OVERRIDES ) do
         persona_override_character_start( CHAR_JESSICA, override[1], override[2] )
      end

      -- Wait until Jessica is grabbed
      local message_time = 0.0
      local message_time_remote = 0.0
      while (not bh05_jessica_in_human_shield()) do
         thread_yield()
         message_time = message_time + get_frame_time()
         message_time_remote = message_time_remote + get_frame_time()
         if (get_dist_char_to_char(LOCAL_PLAYER, CHAR_JESSICA) <= 4) then
            if (coop_is_active() and get_dist_char_to_char(REMOTE_PLAYER, CHAR_JESSICA) <= 4) then
               if message_time >= 6.0 or message_time_remote >= 6.0 then
                  mission_help_table(TEXT_HOLD_TRIGGERS, "", "", SYNC_ALL)
                  message_time = 0.0
                  message_time_remote = 0.0
               end
            else
               if message_time >= 6.0 then
                  mission_help_table(TEXT_HOLD_TRIGGERS, "", "", SYNC_LOCAL)
                  message_time = 0.0
               end
            end
         elseif (coop_is_active() and get_dist_char_to_char(REMOTE_PLAYER, CHAR_JESSICA) <= 4) then
            if message_time_remote >= 6.0 then
               mission_help_table(TEXT_HOLD_TRIGGERS, "", "", SYNC_REMOTE)
               message_time_remote = 0.0
            end
         end
      end

      -- Now that she's grabbed, do an update
      marker_remove_npc(CHAR_JESSICA, SYNC_ALL)
      audio_play_for_character( JESSICA_GRABBED_LINE, CHAR_JESSICA, "voice", false, true )
   end
   npc_leash_remove( CHAR_JESSICA )

   thread_new( "bh05_jessica_play_after_grabbed_line" )

   bh05_maybe_set_off_bank_alarm()
end


function bh05_projectile_hit(type, name, weapon)
	if name == CHAR_JESSICA and weapon == "satchel" then
	   mission_end_failure( "bh05", TEXT_JESSICA_STICKYBOMBED )
	end
end

-- Set off the bank alarm if it hasn't already been set off.
--
function bh05_maybe_set_off_bank_alarm()
	if (not Alarm_triggered) and (THREAD_BANK_ALARM == -1) then
		THREAD_BANK_ALARM = thread_new("bh05_bank_alarm")
	end
end

-- Has Jessica play a custom line a short time after you grab her.
--
function bh05_jessica_play_after_grabbed_line()
   delay( JESSICA_AFTER_GRABBED_PLAY_LINE_DELAY_SECONDS )

   if ( Alarm_shut_off == false ) then
      audio_play_for_character( JESSICA_PRE_ALARM_DISABLED, CHAR_JESSICA, "voice", false, false )
   end
end

function bh05_all_players_inside_bank()
   if ( Players_in_bank_interior[LOCAL_PLAYER] ) then
      if ( coop_is_active() ) then
         if ( Players_in_bank_interior[REMOTE_PLAYER] ) then
            return true
         end
      else
         return true
      end
   end

   return false
end

function bh05_all_players_outside_bank()
   if ( Players_in_bank_interior[LOCAL_PLAYER] == false ) then
      if ( coop_is_active() ) then
         if ( Players_in_bank_interior[REMOTE_PLAYER] == false ) then
            return true
         end
      else
         return true
      end
   end

   return false
end

function bh05_either_player_in_car()
   if ( Players_in_jessicas_car[LOCAL_PLAYER] == true or
        Players_in_jessicas_car[REMOTE_PLAYER] == true ) then
      return true
   end

   return false
end

function bh05_bank_alarm()
	Alarm_triggered = true

	on_weapon_fired("", LOCAL_PLAYER)
	if ( coop_is_active() ) then
		on_weapon_fired("", REMOTE_PLAYER)
	end
   on_take_damage( "", CHAR_JESSICA )

	door_close(MOVER_BANK_DOOR)
	door_lock(MOVER_BANK_DOOR, true)
	delay(1)
	Alarm_audio_id = audio_play_for_navpoint("SFX_BR5_BANK_ALARM", NAV_BANK_INTERIOR, "Foley")
	notoriety_set_min("Police", 2)
	notoriety_set("Police", 2)

   -- If the players are outside and Jessica's inside, or vice versa, the mission is over
   if ( ( Jessica_inside_bank == true and bh05_all_players_outside_bank() ) or
        ( Jessica_inside_bank == false and bh05_all_players_inside_bank() ) ) then
      mission_debug( "failed because of different locations when alarm was triggered" )
      mission_end_failure( "bh05", TEXT_JESSICA_ESCAPED )
      return
   end

   if ( human_shielding_disabled() or Testing_Aussie_version ) then
      repeat
         thread_yield()
      until ( Player_with_jessica_as_follower ~= "none" )
   else
      while (not bh05_jessica_in_human_shield()) do
         thread_yield()
      end
   end

   local alarm_shutoff_function = "bh05_alarm_shutoff"

   if ( human_shielding_disabled() or Testing_Aussie_version ) then
      alarm_shutoff_function = "bh05_alarm_shutoff_without_human_shielding"
   end

   on_trigger( alarm_shutoff_function, TRIGGER_ALARM )
	marker_add_navpoint( TRIGGER_ALARM,  MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL )
	trigger_enable( TRIGGER_ALARM, true )

   if ( human_shielding_disabled() == false and ( Testing_Aussie_version == false ) ) then
      if THREAD_KEEP_HOSTAGE == -1 then
         THREAD_KEEP_HOSTAGE = thread_new("bh05_keep_jessica_close")
         mission_help_table(TEXT_KEEP_HOSTAGE)
         delay(6)
      end
   end
	
	mission_help_table(TEXT_DOORS_SEALED)

	while not Alarm_shut_off do
		thread_yield()
	end

	bh05_take_jessica_to_car()
end

function bh05_enable_groups_combat( group_members, enable )
	for index, name in pairs( group_members ) do
		npc_combat_enable( name, enable )
		set_attack_enemies_flag( name, enable )
		if ( enable == false ) then
			npc_go_idle( name )
		end
	end
end

function bh05_enable_security_attacks( enable )
   if ( enable == nil ) then
      enable = true
   end

	bh05_enable_groups_combat( CHAR_BANK_SECURITY, enable )
   if ( coop_is_active() ) then
		bh05_enable_groups_combat( CHAR_BANK_SECURITY_COOP, enable )
   end
	bh05_enable_groups_combat( CHAR_BANK_TELLERS, enable )
	bh05_enable_groups_combat( CHAR_BANK_TELLERS_IDLE, enable )
	bh05_enable_groups_combat( CHAR_BANK_CUSTOMERS, enable )
end

function bh05_alarm_shutoff_without_human_shielding( triggerer_name, trigger_name )
   marker_remove_navpoint( trigger_name, SYNC_ALL )
   trigger_enable( trigger_name, false )

   follower_make_independent( CHAR_JESSICA, true )
   turn_invulnerable( CHAR_JESSICA )
   character_prevent_flinching( CHAR_JESSICA, true )
   character_prevent_explosion_fling( CHAR_JESSICA, true )
   character_prevent_kneecapping( CHAR_JESSICA, true )
   character_allow_ragdoll( CHAR_JESSICA, false )
	set_ignore_ai_flag( CHAR_JESSICA, true )

   move_to( CHAR_JESSICA, AUSSIE_ALARM_DIRECTION, 2, false, true )
   turn_to( CHAR_JESSICA, AUSSIE_ALARM_DIRECTION, true )
   delay( 1.0 )
   action_play_custom(CHAR_JESSICA, ANIM_ALARM_SHUTOFF_NO_HS)
	audio_play_for_navpoint("SFX_BR5_BANK_ALARM_OFF", TRIGGER_ALARM, "Foley")

   follower_make_independent( CHAR_JESSICA, false )
   turn_vulnerable( CHAR_JESSICA )
   character_prevent_flinching( CHAR_JESSICA, false )
   character_prevent_explosion_fling( CHAR_JESSICA, false )
   character_prevent_kneecapping( CHAR_JESSICA, false )
   character_allow_ragdoll( CHAR_JESSICA, true )
	set_ignore_ai_flag( CHAR_JESSICA, false )
   Alarm_shut_off = true
end

function bh05_alarm_shutoff(triggerer, trigger_name)
	if (character_has_specific_human_shield(triggerer, CHAR_JESSICA)) then
		Shutting_off_alarm = true
		on_trigger("", TRIGGER_ALARM)
		marker_remove_navpoint(TRIGGER_ALARM, SYNC_ALL)
		trigger_enable(TRIGGER_ALARM, false)

      -- Only disable security attacks if we're in single player. In coop, it would look wrong.
      if ( coop_is_active() == false ) then
         bh05_enable_security_attacks( false )
      end

      player_controls_disable( triggerer )
      Player_with_disabled_controls = triggerer
      Controls_disabled = true
		turn_invulnerable( triggerer )
		character_prevent_flinching( triggerer, true )
		character_prevent_explosion_fling( triggerer, true )
		character_prevent_kneecapping( triggerer, true )
		character_allow_ragdoll( triggerer, false )
	
		if ( triggerer == LOCAL_PLAYER ) then
	      audio_play_conversation( SHUT_OFF_ALARM_DIALOG_STREAM )
		else
	      audio_play_conversation( SHUT_OFF_ALARM_DIALOG_STREAM_REMOTE )
		end
		turn_invulnerable( CHAR_JESSICA )
		character_prevent_flinching( CHAR_JESSICA, true )
		character_prevent_explosion_fling( CHAR_JESSICA, true )
		character_prevent_kneecapping( CHAR_JESSICA, true )
		character_allow_ragdoll( CHAR_JESSICA, false )
		set_ignore_ai_flag( CHAR_JESSICA, true )
		character_release_human_shield( triggerer )

		move_to( CHAR_JESSICA, AUSSIE_ALARM_DIRECTION, 1, false, true )
		turn_to( CHAR_JESSICA, "bh05_$AD", true )
		delay( 1.0 )
		action_play_custom(CHAR_JESSICA, ANIM_ALARM_SHUTOFF_NO_HS)
		audio_play_for_navpoint("SFX_BR5_BANK_ALARM_OFF", TRIGGER_ALARM, "Foley")

		--character_take_human_shield( triggerer, CHAR_JESSICA )

		turn_vulnerable( CHAR_JESSICA )
		character_prevent_flinching( CHAR_JESSICA, false )
		character_prevent_explosion_fling( CHAR_JESSICA, false )
		character_prevent_kneecapping( CHAR_JESSICA, false )
		character_allow_ragdoll( CHAR_JESSICA, true )
		set_ignore_ai_flag( CHAR_JESSICA, false )

		turn_vulnerable( triggerer )
		character_prevent_flinching( triggerer, false )
		character_prevent_explosion_fling( triggerer, false )
		character_prevent_kneecapping( triggerer, false )
		character_allow_ragdoll( triggerer, true )

      player_controls_enable( triggerer )
      Controls_disabled = false
		Alarm_shut_off = true
		audio_stop(Alarm_audio_id)

		mission_help_table_nag( TEXT_HOLD_TRIGGERS )
		delay(5)
		Shutting_off_alarm = false
		--[[
      character_suppress_human_shield_idles( triggerer )
      move_to( triggerer, ALARM_DIRECTION, 1, false, false )	
	   turn_to( triggerer, ALARM_DIRECTION, true )
      delay( 1 )
		on_trigger("", TRIGGER_ALARM)
		marker_remove_navpoint(TRIGGER_ALARM, SYNC_ALL)
		trigger_enable(TRIGGER_ALARM, false)
		if ( triggerer == LOCAL_PLAYER ) then
	      audio_play_conversation( SHUT_OFF_ALARM_DIALOG_STREAM )
		else
	      audio_play_conversation( SHUT_OFF_ALARM_DIALOG_STREAM_REMOTE )
		end
      delay(1)
		action_play_custom(CHAR_JESSICA, ANIM_ALARM_SHUTOFF)
		audio_stop(Alarm_audio_id)
		audio_play_for_navpoint("SFX_BR5_BANK_ALARM_OFF", TRIGGER_ALARM, "Foley")
		delay(1)
		door_lock(MOVER_BANK_DOOR, false)
      character_suppress_human_shield_idles( triggerer, false )
		]]

      mission_help_table(TEXT_DOORS_OPENED)
	end
end

function bh05_swat_path(npc, navs, speed, retry, fire, leashed)
   vehicle_exit( npc )
	npc_unholster_best_weapon(npc)
	move_to(npc, navs, speed, retry, fire)
	if (leashed) then
		npc_leash_to_nav(npc, navs[1], 1)
	end
end

function bh05_player_taking_damage(player)
	character_damage(player, EXTRA_DAMAGE_AMOUNT)
end

function bh05_do_bank_outside_attack()
	group_create(GROUP_BANK_OUTSIDE, true)

   vehicle_enter_group_teleport( CHAR_OUTSIDE_COP_CAR, VEH_OUTSIDE_COP_CAR )
   vehicle_pathfind_to( VEH_OUTSIDE_COP_CAR, OUTSIDE_COP_CAR_PATH, true, true )
end

function bh05_do_alarm_swat_attack()
   group_create_hidden( GROUP_ALARM_SWAT, true )

   -- Create the APCs and the character and get everyone seated
   vehicle_enter_group_teleport( CHAR_SWAT_FRONT, VEH_SWAT_FRONT_APC )
   vehicle_enter_group_teleport( CHAR_SWAT_SIDE, VEH_SWAT_SIDE_APC )

   -- Find out if a player is outside.
   local which_player_outside_bank = "none"
   if ( Players_in_bank_interior[LOCAL_PLAYER] == false ) then
      which_player_outside_bank = LOCAL_PLAYER
   elseif ( coop_is_active() and Players_in_bank_interior[REMOTE_PLAYER] == false ) then
      which_player_outside_bank = REMOTE_PLAYER
   end

   local spawn_location_indices = { 1, 1 }
   if ( which_player_outside_bank ~= "none" ) then
      -- If so, then find the best spawn side based on his position and view
      for index, nav_name in pairs( FRONT_APC_WARP_POINTS ) do
         if ( navpoint_in_player_fov( nav_name, which_player_outside_bank ) == false ) then
            spawn_location_indices[1] = index
            break
         end
      end

      for index, nav_name in pairs( SIDE_APC_WARP_POINTS ) do
         if ( navpoint_in_player_fov( nav_name, which_player_outside_bank ) == false ) then
            spawn_location_indices[2] = index
            break
         end
      end
   end

   -- Teleport the loaded SWAT APCs to the appropriate teleport locations
   teleport_vehicle( VEH_SWAT_FRONT_APC, FRONT_APC_WARP_POINTS[spawn_location_indices[1]] )
   teleport_vehicle( VEH_SWAT_SIDE_APC, SIDE_APC_WARP_POINTS[spawn_location_indices[2]] )

   -- Show everything now that it's in place
   group_show( GROUP_ALARM_SWAT )

   door_open( MOVER_BANK_DOOR )

   thread_new( "bh05_apc_path_and_attack", 1, spawn_location_indices[1] )
   thread_new( "bh05_apc_path_and_attack", 2, spawn_location_indices[2] )
end

function bh05_apc_path_and_attack( group_index, spawn_location_index )
   -- Have the loaded SWAT APCs path on their paths
   vehicle_pathfind_to( VEH_SWAT_APCS[group_index], APC_PATHS[group_index][spawn_location_index], true, true )

   -- Unload the SWAT APCs and have the members attack
   for index, member_name in pairs( CHAR_SWAT_APCS[group_index] ) do
		set_attack_player_flag(member_name, true)
		thread_new("bh05_swat_path", member_name, NAV_SWAT_FRONT[index], 2, true, true, SWAT_FRONT_LEASHED[index])
      delay( 0.25 )
   end
end

function bh05_release_characters( character_list )
	for index, name in pairs( character_list ) do
		release_to_world( name )
	end
end

function bh05_take_jessica_to_car()
	-- Only need to re-enable security attacks if we already disabled them
	if ( coop_is_active() == false ) then
		bh05_enable_security_attacks( true )
	end

	bh05_release_characters( CHAR_BANK_SECURITY )
	if ( coop_is_active() ) then
		bh05_release_characters( CHAR_BANK_SECURITY_COOP )
	end
	bh05_release_characters( CHAR_BANK_TELLERS )
	bh05_release_characters( CHAR_BANK_TELLERS_IDLE )
	bh05_release_characters( CHAR_BANK_CUSTOMERS )

	thread_new( "bh05_do_bank_outside_attack" )
	thread_new( "bh05_do_alarm_swat_attack" )

	marker_add_navpoint(TRIGGER_TRUNK, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)
	trigger_enable(TRIGGER_TRUNK, true)
	on_trigger( "bh05_trunk_toss_sequence", TRIGGER_TRUNK)
	delay(8)

	thread_new("bh05_take_jessica_to_car_message_loop")
	thread_new("bh05_send_swat")
	while (not Jessica_in_trunk) do
		thread_yield()

      if ( human_shielding_disabled() or Testing_Aussie_version ) then
         if ((get_dist_char_to_nav(Player_with_jessica_as_follower, TRIGGER_TRUNK) <= 2) ) then
            trigger_enable(TRIGGER_TRUNK, true)
         else
            trigger_enable(TRIGGER_TRUNK, false)
         end
      else
         if ((get_dist_char_to_nav(CHAR_JESSICA, TRIGGER_TRUNK) <= 2) and (bh05_jessica_in_human_shield())) then
            trigger_enable(TRIGGER_TRUNK, true)
         else
            trigger_enable(TRIGGER_TRUNK, false)
         end
      end
	end

   action_nodes_restrict_spawning( false )

	notoriety_set_min("Police", 3)
	notoriety_set("Police", 3)

	bh05_get_to_the_arena()
end

function bh05_take_jessica_to_car_message_loop()
	delay(15)
	while (not Jessica_in_trunk) do
		mission_help_table(TEXT_TAKE_JESSICA_TO_VEHICLE)
		delay(30)
	end
end

function bh05_trunk_toss_sequence(triggerer)
	if ( human_shielding_disabled() or Testing_Aussie_version ) then
		if ( triggerer ~= Player_with_jessica_as_follower ) then
			return
		end
	else
		if (not character_has_specific_human_shield(triggerer, CHAR_JESSICA)) then
			return
		end
	end

   marker_remove_navpoint( TRIGGER_TRUNK, SYNC_ALL )
   trigger_enable( TRIGGER_TRUNK, false )

	if ( human_shielding_disabled() == false and Testing_Aussie_version == false ) then
		if THREAD_KEEP_HOSTAGE ~= -1 then
			thread_kill(THREAD_KEEP_HOSTAGE)
		   THREAD_KEEP_HOSTAGE = -1
		end
	end
   fade_out( 0 )
	
	if ( human_shielding_disabled() or Testing_Aussie_version ) then
		-- Maybe disable the player controls here, if necessary?
	else
		group_hide( GROUP_JESSICAS_CAR )
		group_destroy( GROUP_JESSICAS_CAR )
		cutscene_play( CUTSCENE_TRUNK_TOSS, "", "", false )
		group_hide("bh05_$Trunk_Toss_Cutscene")
		group_destroy("bh05_$Trunk_Toss_Cutscene")
		bh05_create_and_setup_jessicas_car()
	end

	if ( human_shielding_disabled() == false and Testing_Aussie_version == false ) then
	   character_release_human_shield( triggerer, true )
	end
	character_hide(CHAR_JESSICA)
	object_destroy(CHAR_JESSICA)
	audio_play_for_navpoint("SFX_BR5_TRUNK_SLAM", NAV_TRUNK, "Foley")
   vehicle_prevent_explosion_fling( VEH_JESSICAS_CAR, false )
	vehicle_infinite_mass(VEH_JESSICAS_CAR, false)
   set_unjackable_flag( VEH_JESSICAS_CAR, false )
	teleport( triggerer, "bh05_$Away_From_Car" )
	thread_yield()
   vehicle_enter_teleport( triggerer, VEH_JESSICAS_CAR, 0 )
   vehicle_door_prevent_damage_detach( VEH_JESSICAS_CAR, "trunk", true )

	delay( 1.5 )
   
   fade_in( 1.0 )

	Jessica_in_trunk = true
end

function bh05_get_to_the_arena()
	notoriety_force_no_spawn("police", false)
	on_take_damage("", LOCAL_PLAYER)
	if ( coop_is_active() ) then
		on_take_damage("", REMOTE_PLAYER)
	end

	THREAD_JESSICA_TRUNK_VOICE = thread_new("bh05_jessica_trunk_voice")

	mission_help_table(TEXT_TAKE_JESSICA_TO_UNIVERSITY)
   marker_add_vehicle( VEH_JESSICAS_CAR, MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE, SYNC_ALL )
	waypoint_add( VEH_JESSICAS_CAR, SYNC_ALL )

	set_unjackable_flag(VEH_JESSICAS_CAR, false)
	while ( ( not character_is_in_vehicle(LOCAL_PLAYER, VEH_JESSICAS_CAR)) and
           ( coop_is_active() == false or ( not character_is_in_vehicle( REMOTE_PLAYER, VEH_JESSICAS_CAR ) ) ) ) do
		thread_yield()
	end
   Players_in_jessicas_car[LOCAL_PLAYER] = true
   if ( coop_is_active() ) then
      Players_in_jessicas_car[REMOTE_PLAYER] = true
   end
   on_vehicle_enter( "bh05_entered_jessicas_car", VEH_JESSICAS_CAR )
   on_vehicle_exit( "bh05_left_jessicas_car", VEH_JESSICAS_CAR )

   on_take_damage( "", VEH_JESSICAS_CAR )
   on_damage( "bh05_jessicas_car_damaged_during_drive", VEH_JESSICAS_CAR, JESSICAS_CAR_LOW_HP_THRESHOLD_PERCENT )

   waypoint_remove( SYNC_ALL )
   marker_remove_vehicle( VEH_JESSICAS_CAR, SYNC_ALL )
   marker_add_navpoint(TRIGGER_ARENA, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION, SYNC_ALL)
	waypoint_add(TRIGGER_ARENA, SYNC_ALL)

	group_create(GROUP_ARENA, true)

	--radio_on()
	--delay(2)
	--radio_post_event(MONSTER_TRUCK_COMMERCIAL, true)

	while (get_dist_vehicle_to_nav(VEH_JESSICAS_CAR, TRIGGER_ARENA) > 10) do
		thread_yield()
	end

	if THREAD_JESSICA_TRUNK_VOICE ~= -1 then
		thread_kill(THREAD_JESSICA_TRUNK_VOICE)
	end

	bh05_success_arena_reached()

end

function bh05_jessicas_car_damaged_during_drive()
   mission_help_table( TEXT_DONT_WRECK )
end

function bh05_jessicas_car_took_damage( vehicle_name, attacker_name, percent_damage )
   if ( Jessica_in_trunk == false ) then
      if ( attacker_name ~= nil ) then
         if ( attacker_name == LOCAL_PLAYER or attacker_name == REMOTE_PLAYER ) then
            mission_help_table_nag( TEXT_DONT_DESTROY_CAR )
            on_take_damage( "", VEH_JESSICAS_CAR )
            delay( 5.0 )
            on_take_damage( "bh05_jessicas_car_took_damage", VEH_JESSICAS_CAR )
         end
      end
   else
      on_take_damage( "", VEH_JESSICAS_CAR )
   end
end
function bh05_jessica_trunk_voice()
	while 1 do
		thread_yield()
		if ( character_is_in_vehicle( LOCAL_PLAYER, VEH_JESSICAS_CAR ) ) then
			delay( rand_int( 2, 8 ) )
			local choice = rand_int( 1, sizeof_table( VOICE_JESSICA_TRUNK ) )
			audio_play( VOICE_JESSICA_TRUNK[choice] )
		end
	end
end

function bh05_entered_jessicas_car( name )
   mission_debug( name.." entered car." )
   if ( character_is_player( name ) ) then

      -- If no players were in the car before this player got in, be sure to add a marker for the goal
      if ( bh05_either_player_in_car() == false ) then
			marker_add_navpoint(TRIGGER_ARENA, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION, SYNC_ALL )
			waypoint_add(TRIGGER_ARENA, SYNC_ALL )

         -- Remove the car marker and cancel the failure timer
         marker_remove_vehicle( VEH_JESSICAS_CAR, SYNC_ALL )
			hud_timer_stop(0)
      end

      -- Now mark this player as in the car
      Players_in_jessicas_car[name] = true
   end
end

function bh05_left_jessicas_car( name )
   mission_debug( name.." left car." )

   if ( character_is_player( name ) ) then
      -- Mark this player as having left
      Players_in_jessicas_car[name] = false

      -- If no one's left in the car, then add a marker for it and remove the goal marker
      if ( bh05_either_player_in_car() == false ) then
         -- Remove the goal marker - the more immediate goal is the vehicle
         marker_remove_navpoint( TRIGGER_ARENA, SYNC_ALL )

         -- Let the players know to get back in the vehicle
			mission_help_table_nag( TEXT_GET_BACK_IN_CAR, SYNC_ALL )
			marker_add_vehicle( VEH_JESSICAS_CAR, MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE, SYNC_ALL )
			waypoint_add( VEH_JESSICAS_CAR, SYNC_ALL )
         -- Set a failure timer
			hud_timer_set( 0, 30000, "bh05_failure_abandoned_car", true, SYNC_ALL )
      end
   end
end

function bh05_bank_life_anim(npc, anim)
	local num_actions = sizeof_table(anim)
	while (not Alarm_triggered) do
		thread_yield()
		action_play(npc, anim[rand_int(1, num_actions)], "", true, true)
		delay(rand_int(4,7))
	end
end

function bh05_send_swat()
	group_create(GROUP_SWAT, true)
	vehicle_enter_group_teleport(CHAR_SWAT, VEH_SWAT)
	vehicle_pathfind_to(VEH_SWAT, NAV_SWAT_DEST, true, true)
	for i, npc in pairs(CHAR_SWAT) do	
		thread_new("vehicle_exit", npc)
		if ( coop_is_active() ) then
			local rnd = rand_int(0,1)
			if rnd == 0 then
				attack(npc, LOCAL_PLAYER)
			else
				attack(npc, REMOTE_PLAYER)
			end
		else
			attack(npc, LOCAL_PLAYER)
		end
	end
end

function bh05_keep_jessica_close()
	marker_remove_npc(CHAR_JESSICA, SYNC_ALL)

	while (not character_is_dead(CHAR_JESSICA)) do
		thread_yield()
		if (not bh05_jessica_in_human_shield()) and (not character_is_dead(CHAR_JESSICA) and (not Shutting_off_alarm)) then
			mission_help_table(TEXT_JESSICA_GETTING_AWAY)
			if Alarm_shut_off then
				marker_remove_navpoint(TRIGGER_TRUNK, SYNC_ALL)
				trigger_enable(TRIGGER_TRUNK, false)
			else
				marker_remove_navpoint(TRIGGER_ALARM, SYNC_ALL)
				trigger_enable(TRIGGER_ALARM, false)
			end
			marker_add_npc(CHAR_JESSICA, MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_PROTECT_ACQUIRE, SYNC_ALL)
			thread_yield()
			hud_timer_set(1, 30000, "bh05_failure_jessica_escaped", true)
			local Escaping_time = 0
			local Message_displayed = false
			while (not bh05_jessica_in_human_shield()) and (not character_is_dead(CHAR_JESSICA)) do
				thread_yield()
				Escaping_time = Escaping_time + get_frame_time()
				if (not Message_displayed) and (Escaping_time > 10) then
					mission_help_table(TEXT_JESSICA_GETTING_AWAY)
					Message_displayed = true
				end
			end
			thread_yield()
			hud_timer_stop(1)
			marker_remove_npc(CHAR_JESSICA, SYNC_ALL)
			if Alarm_shut_off then
				marker_add_navpoint(TRIGGER_TRUNK, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)
				trigger_enable(TRIGGER_TRUNK, true)
			else
				marker_add_navpoint(TRIGGER_ALARM, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)
				trigger_enable(TRIGGER_ALARM, true)
			end
		end
	end
end

function bh05_weapon_fired( player )
	if ( ( not Alarm_triggered ) and Players_in_bank_interior[player] ) then
		on_weapon_fired("", LOCAL_PLAYER)
		if ( coop_is_active() ) then
			on_weapon_fired("", REMOTE_PLAYER)
		end
      bh05_maybe_set_off_bank_alarm()
	end
end

function bh05_jessicas_car_watch()
	while 1 do
		thread_yield()
		local sync = nil
		if character_is_in_vehicle(LOCAL_PLAYER, VEH_JESSICAS_CAR) then
			if ( coop_is_active() ) and character_is_in_vehicle(REMOTE_PLAYER, VEH_JESSICAS_CAR) then
				sync = SYNC_ALL
			else
				sync = SYNC_LOCAL
			end
		elseif ( coop_is_active() ) and character_is_in_vehicle(REMOTE_PLAYER, VEH_JESSICAS_CAR) then
			sync = SYNC_REMOTE
		end
		
		if sync ~= nil then
			mission_help_table(TEXT_DONT_DAMAGE_CAR, sync)
			delay(5)
		end
	end
end

function bh05_jessica_in_human_shield()
	return ((character_has_specific_human_shield(LOCAL_PLAYER, CHAR_JESSICA)) or 
			 (coop_is_active() and character_has_specific_human_shield(REMOTE_PLAYER, CHAR_JESSICA)))
end

function bh05_failure_jessica_died()
	mission_end_failure("bh05", TEXT_JESSICA_DIED)
end

function bh05_failure_abandoned_car()
	mission_end_failure("bh05", TEXT_CAR_ABANDONED)
end

function bh05_failure_jessicas_car_destroyed()
	mission_end_failure("bh05", TEXT_JESSICAS_CAR_DESTROYED)
end

function bh05_failure_jessica_escaped()
	mission_end_failure("bh05", TEXT_JESSICA_ESCAPED)
end

function bh05_success_arena_reached()
	-- Stop the players' vehicles when they reach the trigger
	if ( character_is_in_vehicle( LOCAL_PLAYER ) ) then
		player_controls_disable( LOCAL_PLAYER )
		vehicle_stop_do( LOCAL_PLAYER )
	end
	if ( coop_is_active() ) then
		if ( character_is_in_vehicle( REMOTE_PLAYER ) ) then
			player_controls_disable( REMOTE_PLAYER )
			vehicle_stop_do( REMOTE_PLAYER )
		end
	end
	marker_remove_navpoint(TRIGGER_ARENA, SYNC_ALL)
	waypoint_remove(SYNC_ALL)
	on_vehicle_enter( "", VEH_JESSICAS_CAR )
	on_vehicle_exit( "", VEH_JESSICAS_CAR )
	mission_end_success("bh05", CUTSCENE_OUT, { NAV_LOCAL_START, NAV_REMOTE_START } )
end

function bh05_cleanup()
	-- Cleanup mission here

   door_lock(MOVER_BANK_DOOR, false)

	camera_end_look_through(true)

   if ( Controls_disabled ) then
   	player_controls_enable( Player_with_disabled_controls )
		turn_vulnerable( Player_with_disabled_controls )
		character_prevent_flinching( Player_with_disabled_controls, false )
		character_prevent_explosion_fling( Player_with_disabled_controls, false )
		character_prevent_kneecapping( Player_with_disabled_controls, false )
		character_allow_ragdoll( Player_with_disabled_controls, true )
   end

   on_take_damage("", LOCAL_PLAYER)
	if ( coop_is_active() ) then
		on_take_damage("", REMOTE_PLAYER)
	end

	hud_timer_stop(0)
	hud_timer_stop(1)
	marker_remove_navpoint(NAV_BANK, SYNC_ALL)
	marker_remove_npc(CHAR_JESSICA, SYNC_ALL)
	marker_remove_vehicle(VEH_JESSICAS_CAR, SYNC_ALL)
	marker_remove_navpoint(TRIGGER_ARENA, SYNC_ALL)
	on_trigger("", TRIGGER_ARENA)
	trigger_enable(TRIGGER_ARENA, false)
	marker_remove_navpoint(TRIGGER_ALARM, SYNC_ALL)
	on_trigger("", TRIGGER_ALARM)
	trigger_enable(TRIGGER_ALARM, false)
	marker_remove_navpoint(TRIGGER_TRUNK, SYNC_ALL)
	on_trigger("", TRIGGER_TRUNK)
	trigger_enable(TRIGGER_TRUNK, false)
	waypoint_remove(SYNC_ALL)
	on_weapon_fired("", LOCAL_PLAYER)
	if ( coop_is_active() ) then
		on_weapon_fired("", REMOTE_PLAYER)
	end


	if THREAD_BANK_ALARM ~= -1 then
		thread_kill(THREAD_BANK_ALARM)
	end

	if THREAD_KEEP_HOSTAGE ~= -1 then
		thread_kill(THREAD_KEEP_HOSTAGE)
	end

	if THREAD_JESSICA_TRUNK_VOICE ~= -1 then
		thread_kill(THREAD_JESSICA_TRUNK_VOICE)
	end

	group_destroy(GROUP_JESSICAS_CAR)
	--release_to_world(GROUP_BANK)
	--if ( coop_is_active() ) then
	--	release_to_world(GROUP_BANK_COOP)
	--end

   set_police_never_fire_at_civilian_human_shields( false )
   action_nodes_restrict_spawning( false )
   on_projectile_hit( "" )
   
   vehicle_prevent_explosion_fling( VEH_JESSICAS_CAR, false )
	vehicle_infinite_mass(VEH_JESSICAS_CAR, false)
   set_unjackable_flag( VEH_JESSICAS_CAR, false )
   on_interior_enter( "", BANK_INTERIOR )
   on_interior_exit( "", BANK_INTERIOR )
   mission_cleanup_maybe_reenable_player_controls()

   if ( vehicle_exists( VEH_JESSICAS_CAR ) ) then
      vehicle_door_prevent_damage_detach( VEH_JESSICAS_CAR, "trunk", false )
   end
end

function bh05_success()
	-- Called when the mission has ended with success
end
