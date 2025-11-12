-- bh09.lua
-- SR2 mission script
-- 3/28/07

-- Groups --
	GROUP_ULTOR =						"bh09_$ultor"
	GROUP_WAVE1 =						"bh09_$wave1"
	GROUP_WAVE2 =						"bh09_$wave2"
	GROUP_WAVE3 =						"bh09_$wave3"
   GROUPS_WAVES = { GROUP_WAVE1, GROUP_WAVE2, GROUP_WAVE3 }
	GROUP_START =						"bh09_$start"
   GROUP_START_COOP =            "bh09_$start_coop"
	GROUP_SAINTS =						"bh09_$saints"
	GROUP_COURTESY_HELI =			"bh09_$courtesy_heli"
   GROUP_HELI_DESTROYERS =       "bh09_$Heli_Destroyers"

-- Navpoints --
	NAV_LOCAL_START =					"bh09_$n010"
	NAV_REMOTE_START =				"bh09_$n011"
	NAV_SHIP =							"bh09_$n000"

	NAV_HELI_PATHS =					{ "bh09_$heli_path_01", "bh09_$heli_path_02", "bh09_$heli_path_03",
                                   "bh09_$heli_path_04", "bh09_$heli_path_05", "bh09_$heli_path_06" }
   NAV_HELI_DROPOFFS =           { "bh09_$heli_dropoff_01", "bh09_$heli_dropoff_02", "bh09_$heli_dropoff_03",
                                   "bh09_$heli_dropoff_04", "bh09_$heli_dropoff_05", "bh09_$heli_dropoff_06" }

   NAV_BOAT_LEFT_GOAL =          "bh09_$boat_left_goal"
   NAV_BOAT_RIGHT_GOAL =          "bh09_$boat_right_goal"
	NAV_BOAT_PATH_LEFT =				"bh09_$boat_path_left"
	NAV_BOAT_PATH_RIGHT =			"bh09_$boat_path_right"

   NAV_BOAT_LEAVE_PATH_LEFT =    "bh09_$boat_leave_path_left"
   NAV_BOAT_LEAVE_PATH_RIGHT =   "bh09_$boat_leave_path_right"

	NAV_CHECKPOINT_LOCAL =			"bh09_$nav_checkpoint_local"
	NAV_CHECKPOINT_REMOTE =			"bh09_$nav_checkpoint_remote"

   NAV_STAIRS_LEFT_PATH_STARTS = { "bh09_$stairs_left_path_start_01", "bh09_$stairs_left_path_start_02", "bh09_$stairs_left_path_start_03" }
   NUM_LEFT_PATH_STARTS = sizeof_table( NAV_STAIRS_LEFT_PATH_STARTS )
   NAV_STAIRS_RIGHT_PATH_STARTS = { "bh09_$stairs_right_path_start_01", "bh09_$stairs_right_path_start_02", "bh09_$stairs_right_path_start_03" }
   NUM_RIGHT_PATH_STARTS = sizeof_table( NAV_STAIRS_RIGHT_PATH_STARTS )

	NAV_STAIRS_LEFT_PATH =					"bh09_$stairs_left"
	NAV_STAIRS_RIGHT_PATH =				"bh09_$stairs_right"

-- Characters --
	TABLE_ULTOR_RPG =					{"bh09_$UAD_RPG01", "bh09_$UAD_RPG02", "bh09_$UAD_RPG03", "bh09_$UAD_RPG04"}

   TABLE_ULTOR_ABOVEDECKS = { "bh09_$UAD_M01", "bh09_$UAD_M02", "bh09_$UAD_M03", "bh09_$UAD_M04", "bh09_$UAD_M05",
                              "bh09_$UAD_M06", "bh09_$UAD_M07", "bh09_$UAD_M08", "bh09_$UAD_M09",
                              TABLE_ULTOR_RPG[1], TABLE_ULTOR_RPG[2], TABLE_ULTOR_RPG[3], TABLE_ULTOR_RPG[4],
                              TABLE_ULTOR_RPG[5] }

   TABLE_ULTOR_BELOWDECKS = { "bh09_$UBD_M01", "bh09_$UBD_M02", "bh09_$UBD_M03", "bh09_$UBD_M04", "bh09_$UBD_M05" }

	TABLE_ULTOR_STD = { "bh09_$UAD_M01", "bh09_$UAD_M02", "bh09_$UAD_M03", "bh09_$UAD_M04", "bh09_$UAD_M05",
                       "bh09_$UAD_M06", "bh09_$UAD_M07", "bh09_$UAD_M08", "bh09_$UAD_M09",
                       "bh09_$UBD_M01", "bh09_$UBD_M02", "bh09_$UBD_M03", "bh09_$UBD_M04", "bh09_$UBD_M05" }

   TABLE_ALL_ULTOR = { "bh09_$UAD_M01", "bh09_$UAD_M02", "bh09_$UAD_M03", "bh09_$UAD_M04", "bh09_$UAD_M05",
                       "bh09_$UAD_M06", "bh09_$UAD_M07", "bh09_$UAD_M08", "bh09_$UAD_M09",
                       TABLE_ULTOR_RPG[1], TABLE_ULTOR_RPG[2], TABLE_ULTOR_RPG[3], TABLE_ULTOR_RPG[4],
                       TABLE_ULTOR_RPG[5],
                       "bh09_$UBD_M01", "bh09_$UBD_M02", "bh09_$UBD_M03", "bh09_$UBD_M04", "bh09_$UBD_M05" }

   TABLE_HELI_DESTROYERS = { "bh09_$HD1", "bh09_$HD2", "bh09_$HD3" }

	CHARS_WAVE1_HELIS =				{ { "bh09_$w1_h1_m1", "bh09_$w1_h1_m2" },
											  { "bh09_$w1_h2_m1", "bh09_$w1_h2_m2" } }

	CHARS_WAVE2_HELIS =				{ { "bh09_$w2_h1_m1", "bh09_$w2_h1_m2" },
											  { "bh09_$w2_h2_m1", "bh09_$w2_h2_m2" },
											  { "bh09_$w2_h3_m1", "bh09_$w2_h3_m2" } }

	CHARS_WAVE3_HELIS =				{ { "bh09_$w3_h1_m1", "bh09_$w3_h1_m2" },
										     { "bh09_$w3_h2_m1", "bh09_$w3_h2_m2" },
										     { "bh09_$w3_h3_m1", "bh09_$w3_h3_m2" },
										     { "bh09_$w3_h4_m1", "bh09_$w3_h4_m2" },
										     { "bh09_$w3_h5_m1", "bh09_$w3_h5_m2" },
										     { "bh09_$w3_h6_m1", "bh09_$w3_h6_m2" } }

	CHARS_WAVES_HELIS = { CHARS_WAVE1_HELIS, CHARS_WAVE2_HELIS, CHARS_WAVE3_HELIS }

	CHARS_WAVE1_BOATS =				{ { "bh09_$w1_b1_m1", "bh09_$w1_b1_m2", "bh09_$w1_b1_m3" },
										     { "bh09_$w1_b2_m1", "bh09_$w1_b2_m2" },
										     { "bh09_$w1_b3_m1", "bh09_$w1_b3_m2", "bh09_$w1_b3_m3" },
										     { "bh09_$w1_b4_m1", "bh09_$w1_b4_m2", "bh09_$w1_b4_m3" },
										     { "bh09_$w1_b5_m1", "bh09_$w1_b5_m2", "bh09_$w1_b5_m3" } }

	CHARS_WAVE2_BOATS =				{ { "bh09_$w2_b1_m1", "bh09_$w2_b1_m2" },
										     { "bh09_$w2_b2_m1", "bh09_$w2_b2_m2", "bh09_$w2_b2_m3" },
										     { "bh09_$w2_b3_m1", "bh09_$w2_b3_m2", "bh09_$w2_b3_m3" },
										     { "bh09_$w2_b4_m1", "bh09_$w2_b4_m2", "bh09_$w2_b4_m3" },
										     { "bh09_$w2_b5_m1", "bh09_$w2_b5_m2", "bh09_$w2_b5_m3" },
										     { "bh09_$w2_b6_m1", "bh09_$w2_b6_m2" } }

	CHARS_WAVE3_BOATS =				{ { "bh09_$w3_b1_m1", "bh09_$w3_b1_m2", "bh09_$w3_b1_m3" },
										     { "bh09_$w3_b2_m1", "bh09_$w3_b2_m2", "bh09_$w3_b2_m3" },
										     { "bh09_$w3_b3_m1", "bh09_$w3_b3_m2" },
										     { "bh09_$w3_b4_m1", "bh09_$w3_b4_m2", "bh09_$w3_b4_m3" },
										     { "bh09_$w3_b5_m1", "bh09_$w3_b5_m2", "bh09_$w3_b5_m3" },
										     { "bh09_$w3_b6_m1", "bh09_$w3_b6_m2" },
                                   { "bh09_$w3_b7_m1", "bh09_$w3_b7_m2" },
                                   { "bh09_$w3_b8_m1", "bh09_$w3_b8_m2", "bh09_$w3_b8_m3" } }

	CHARS_WAVES_BOATS = { CHARS_WAVE1_BOATS, CHARS_WAVE2_BOATS, CHARS_WAVE3_BOATS }

   BOAT_DRIVER_COUNT = 1
   BOAT_DRIVER_INDEX = 1

	CHARS_SAINTS =						{"bh09_$c062", "bh09_$c063"}	

-- Vehicles --
	VEH_START =							{ "bh09_$v022", "bh09_$v023", "bh09_$v024" }


	VEH_WAVE1_HELIS =					{ "bh09_$w1_heli1", "bh09_$w1_heli2" }
	VEH_WAVE1_BOATS =					{ "bh09_$w1_boat1", "bh09_$w1_boat2", "bh09_$w1_boat3",
                                   "bh09_$w1_boat4", "bh09_$w1_boat5" }

	VEH_WAVE1_BOATS_LEFT =			{ VEH_WAVE1_BOATS[1], VEH_WAVE1_BOATS[2] }
	VEH_WAVE1_BOATS_RIGHT =			{ VEH_WAVE1_BOATS[3], VEH_WAVE1_BOATS[4], VEH_WAVE1_BOATS[5] }

   VEH_WAVE2_HELIS =					{ "bh09_$w2_heli1", "bh09_$w2_heli2", "bh09_$w2_heli3" }
	VEH_WAVE2_BOATS =					{ "bh09_$w2_boat1", "bh09_$w2_boat2", "bh09_$w2_boat3",
                                   "bh09_$w2_boat4", "bh09_$w2_boat5", "bh09_$w2_boat6" }

	VEH_WAVE2_BOATS_LEFT =			{ VEH_WAVE2_BOATS[4], VEH_WAVE2_BOATS[5], VEH_WAVE2_BOATS[6] }
	VEH_WAVE2_BOATS_RIGHT =			{ VEH_WAVE2_BOATS[1], VEH_WAVE2_BOATS[2], VEH_WAVE2_BOATS[3] }

	VEH_WAVE3_HELIS =					{ "bh09_$w3_heli1", "bh09_$w3_heli2", "bh09_$w3_heli3",
                                   "bh09_$w3_heli4", "bh09_$w3_heli5", "bh09_$w3_heli6" }

	VEH_WAVE3_BOATS =					{ "bh09_$w3_boat1", "bh09_$w3_boat2", "bh09_$w3_boat3",
                                   "bh09_$w3_boat4", "bh09_$w3_boat5", "bh09_$w3_boat6",
                                   "bh09_$w3_boat7", "bh09_$w3_boat8" }

	VEH_WAVE3_BOATS_LEFT =			{ VEH_WAVE3_BOATS[1], VEH_WAVE3_BOATS[2], VEH_WAVE3_BOATS[3],
                                   VEH_WAVE3_BOATS[4] }
	VEH_WAVE3_BOATS_RIGHT =			{ VEH_WAVE3_BOATS[5], VEH_WAVE3_BOATS[6], VEH_WAVE3_BOATS[7],
                                   VEH_WAVE3_BOATS[8] }
	VEH_SAINTS =						"bh09_$v025"

   VEH_WAVES_HELIS = { VEH_WAVE1_HELIS, VEH_WAVE2_HELIS, VEH_WAVE3_HELIS }
   VEH_WAVES_BOATS = { VEH_WAVE1_BOATS, VEH_WAVE2_BOATS, VEH_WAVE3_BOATS }
   VEH_WAVES_BOATS_LEFT = { VEH_WAVE1_BOATS_LEFT, VEH_WAVE2_BOATS_LEFT, VEH_WAVE3_BOATS_LEFT }
   VEH_WAVES_BOATS_RIGHT = { VEH_WAVE1_BOATS_RIGHT, VEH_WAVE2_BOATS_RIGHT, VEH_WAVE3_BOATS_RIGHT }

   WAVE_BOAT_IS_TWO_SEATER =     { { false, true, false, false, false },
                                   { true, false, false, false, false, true },
                                   { false, false, true, false, false, true, true, false } }
	COURTESY_HELI =					"bh09_$v001"

-- Text --
	TEXT_BOARD_THE_SHIP =			"bh09_board_the_ship"
	TEXT_ELIMINATE_GANG =			"bh09_eliminate_gang"
	TEXT_30_SECONDS =					"bh09_30_seconds"
	TEXT_NEXT_WAVE =					"bh09_next_wave"
	TEXT_FIRST_WAVE =					"bh09_first_wave"
	TEXT_SECOND_WAVE =				"bh09_second_wave"
	TEXT_THIRD_WAVE =					"bh09_third_wave"
   TEXTS_WAVES = { TEXT_FIRST_WAVE, TEXT_SECOND_WAVE, TEXT_THIRD_WAVE }
	TEXT_SHIP_ABANDONED =			"bh09_ship_abandoned"
	TEXT_ULTOR_KILLED =				"bh09_ultor_killed"

-- Triggers --
	TRIGGER_AK47_AMMO =				"bh09_$t000"
	TRIGGER_RPG_AMMO =				"bh09_$t002"
   TRIGGER_HOTEL_ELEVATOR = "airport_$AI_crib_elevator_up"
   TRIGGER_BELOWDECKS = "bh09_$belowdecks"
   MISSION_ELEVATOR_TRIGGER = "bh09_$Hotel_Elevator"
   MISSION_ELEVATOR_DOWN_TRIGGER = "bh09_$Hotel_Elevator_Down"

   HELIPAD_UP_ELEVATOR_DESTINATION = "bh09_$Hotel_Elevator_Down"
   HELIPAD_DOWN_ELEVATOR_DESTINATION = "bh09_$Hotel_Elevator"


-- Threads --
	THREAD_STAY_ON_SHIP =			-1
	THREAD_WAVE1_BOATS =				{}
	THREAD_WAVE2_BOATS =				{}
	THREAD_WAVE3_BOATS =				{}
	THREAD_WAVE1_HELIS =				{}
	THREAD_WAVE2_HELIS =				{}
	THREAD_WAVE3_HELIS =				{}
	THREAD_BOARDING =					{}

   THREAD_WAVES_BOATS = { THREAD_WAVE1_BOATS, THREAD_WAVE2_BOATS, THREAD_WAVE3_BOATS }
   THREAD_WAVES_HELIS = { THREAD_WAVE1_HELIS, THREAD_WAVE2_HELIS, THREAD_WAVE3_HELIS }

-- Voice --
	VOICE_INTRO_PHONECALL =			{{"BR09_INTRO_L1", CELLPHONE_CHARACTER, 0},
											 {"PLAYER_BR09_INTRO_L2", LOCAL_PLAYER, 0},
											 {"BR09_INTRO_L3", CELLPHONE_CHARACTER, .25},
											 {"PLAYER_BR09_INTRO_L4", LOCAL_PLAYER, .25},
											 {"BR09_INTRO_L5", CELLPHONE_CHARACTER, .25},
											 {"PLAYER_BR09_INTRO_L6", LOCAL_PLAYER, .25},
											 {"BR09_INTRO_L7", CELLPHONE_CHARACTER, .25},
											 {"BR09_INTRO_L8", CELLPHONE_CHARACTER, 0},
											 {"PLAYER_BR09_INTRO_L9", LOCAL_PLAYER, .25},
											 {"BR09_INTRO_L10", CELLPHONE_CHARACTER, 0},
											 {"PLAYER_BR09_INTRO_L11", LOCAL_PLAYER, .25}}
	VOICE_OUTRO_PHONECALL =			{{"PLAYER_BR09_OUTRO_L1", LOCAL_PLAYER, .25}, 
											 {"BR09_OUTRO_L2", nil, 1}}

-- Checkpoints --
	CHECKPOINT_BOAT =					"bh09_checkpoint_boat"

-- Cutscenes --
	CUTSCENE_IN =						"br09-01"
	CUTSCENE_ATTACK =				   "br09-02"

-- Other --
   SHIP_BELOWDECKS_DOOR = "bh09_$Ship_Belowdecks_Entrance"
   AIRPORT_CRIB_NAME = "AI_Hotel_Crib"
   ATTACK_HELICOPTER_INDEX = 2

   BETWEEN_WAVES_DELAY_SECONDS = 10

   BOAT_HIT_POINTS_PERCENT_OF_NORMAL = 0.75
   HELI_MEMBER_TO_SEAT_INDEX_MAPPING = { 0, 5, 4, 1 }
   HELI_ATTACKER_WEAPON = "ak47"
   HELI_ATTACKER_WEAPON_AMMO_COUNT = 1000
	IN_COOP =							false
	Last_wave_completed =			0
	Ultor_killed =						0
	INITIAL_NUM_ULTOR =				18
	SHIP_DISTANCE =					50
	SHIP_ABANDON_DISTANCE =			100
   INITIAL_SHIP_ABANDON_DISTANCE_METERS = 500
   Num_abovedecks_remaining = sizeof_table( TABLE_ULTOR_ABOVEDECKS )

   Players_out_of_current_boat_range = { [LOCAL_PLAYER] = true, [REMOTE_PLAYER] = true }

   Wave_members_remaining = { 0, 0, 0 }

   Cur_left_path_start_index = 0
   Cur_right_path_start_index = 0
   Mission_won = false

function bh09_all_players_in_boat_range()
   if ( Players_out_of_current_boat_range[LOCAL_PLAYER] == false ) then
      if ( coop_is_active() ) then
         if ( Players_out_of_current_boat_range[REMOTE_PLAYER] == false ) then
            return true
         end
      else
         return true
      end
   end

   return false
end

function bh09_start(bh09_checkpoint, is_restart)
	-- Start trigger is hit...the activate button was hit
	set_mission_author("Aaron Hanson (aka Father Zucosos)")

	if coop_is_active() then
		IN_COOP = true
	end

   -- interior = false, blocking = true, temporary = true
   city_chunk_swap("sr2_chunk012", "ship", false, true, true )
   mission_start_fade_out()

	notoriety_force_no_spawn("police", true)
	notoriety_force_no_spawn("ultor", true)
	notoriety_force_no_spawn("brotherhood", true)
   --group_create_hidden( GROUP_HELI_DESTROYERS, true )

   --disable warping to shore.
   player_warp_to_shore_disable(LOCAL_PLAYER)
   if IN_COOP then
      player_warp_to_shore_disable(REMOTE_PLAYER)
   end

   -- TEMP
   --bh09_checkpoint = "blarg!"
   --teleport_coop( TRIGGER_AK47_AMMO, TRIGGER_AK47_AMMO )
   -- END TEMP

	if bh09_checkpoint == MISSION_START_CHECKPOINT then
      door_lock( SHIP_BELOWDECKS_DOOR, true )
	  if (not is_restart) then
		cutscene_play( CUTSCENE_IN, "", "", false )
	  end

      mission_debug( "teleport coop started.", 60, 1 )

      teleport_coop( NAV_LOCAL_START, NAV_REMOTE_START )

      mission_debug( "teleport coop finished, group create started.", 60, 2 )

      if IN_COOP then
   		group_create(GROUP_START_COOP, true)
		end
		group_create(GROUP_START, true)

      mission_debug( "group create finished.", 60, 3 )

      bh09_notoriety_force_no_spawn()

      mission_start_fade_in()

		bh09_get_to_the_ship()

	else--if ( bh09_checkpoint == CHECKPOINT_BOAT ) then

		teleport( LOCAL_PLAYER, NAV_CHECKPOINT_LOCAL )
		if ( coop_is_active() ) then
			teleport( REMOTE_PLAYER, NAV_CHECKPOINT_REMOTE )
		end

      if ( group_is_loaded( GROUP_START ) == false ) then
   		group_create(GROUP_START, true)
      end
      if ( IN_COOP and group_is_loaded( GROUP_START_COOP ) == false ) then
         group_create( GROUP_START_COOP, true )
      end
      bh09_notoriety_force_no_spawn()

		trigger_enable(TRIGGER_AK47_AMMO, true)
		marker_add_trigger(TRIGGER_AK47_AMMO, "", INGAME_EFFECT_LOCATION, SYNC_ALL)
		on_trigger("bh09_give_ak47_ammo", TRIGGER_AK47_AMMO)

		trigger_enable(TRIGGER_RPG_AMMO, true)
		marker_add_trigger(TRIGGER_RPG_AMMO, "", INGAME_EFFECT_LOCATION, SYNC_ALL)
		on_trigger("bh09_give_rpg_ammo", TRIGGER_RPG_AMMO)

      --thread_new( "bh09_destroy_helicopter" )

      mission_start_fade_in()
      door_open( SHIP_BELOWDECKS_DOOR )

      -- Update the "players near ship" stuff
      bh09_update_player_locations( INITIAL_SHIP_ABANDON_DISTANCE_METERS )

      bh09_do_waves_attack()
		--bh09_first_wave()
	end

end

function bh09_update_player_locations( distance_meters )
   if get_dist_char_to_nav(LOCAL_PLAYER, NAV_SHIP) < distance_meters then
      Players_out_of_current_boat_range[LOCAL_PLAYER] = false
   end
   if ( IN_COOP and get_dist_char_to_nav(REMOTE_PLAYER, NAV_SHIP) < distance_meters ) then
      Players_out_of_current_boat_range[REMOTE_PLAYER] = false
   end
end

function bh09_went_down_hotel_elevator( triggerer_name, trigger_name )
   teleport( triggerer_name, HELIPAD_DOWN_ELEVATOR_DESTINATION )
end

function bh09_went_up_hotel_elevator_initial( triggerer_name, trigger_name )
   -- Remove the marker and guidance
   marker_remove_trigger( trigger_name, SYNC_ALL )
	mission_waypoint_remove( SYNC_ALL )

   -- Give the up trigger a normal "this can be used" effect
   marker_add_trigger( trigger_name, "", INGAME_EFFECT_LOCATION, SYNC_ALL )

   -- Mark the vehicle
   marker_add_vehicle( VEH_START[ATTACK_HELICOPTER_INDEX],
                       MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_INTERACT, SYNC_ALL )

   bh09_went_up_hotel_elevator( triggerer_name, trigger_name )

   on_trigger( "bh09_went_up_hotel_elevator", trigger_name )
end

function bh09_went_up_hotel_elevator( triggerer_name, trigger_name )
   teleport( triggerer_name, HELIPAD_UP_ELEVATOR_DESTINATION )
end

function bh09_get_to_the_ship()
   -- For the attack helicopter, disable the elevator's original trigger and enable the
   -- mission's trigger
   if ( crib_is_unlocked( AIRPORT_CRIB_NAME ) ) then
      trigger_enable( TRIGGER_HOTEL_ELEVATOR, false )
   end
   trigger_enable( MISSION_ELEVATOR_TRIGGER, true )
   trigger_enable( MISSION_ELEVATOR_DOWN_TRIGGER, true )
   on_trigger( "bh09_went_down_hotel_elevator", MISSION_ELEVATOR_DOWN_TRIGGER )
   on_trigger( "bh09_went_up_hotel_elevator_initial", MISSION_ELEVATOR_TRIGGER )

   -- Add guidance to the mission's trigger
   marker_add_trigger( MISSION_ELEVATOR_TRIGGER, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)
   mission_waypoint_add( MISSION_ELEVATOR_TRIGGER, SYNC_ALL )
   -- Add marker for the "elevator down" trigger
   marker_add_trigger( MISSION_ELEVATOR_DOWN_TRIGGER, "", INGAME_EFFECT_LOCATION, SYNC_ALL)

   thread_new( "bh09_phone_conversation" )
   delay ( 3.0 )

	group_create(GROUP_ULTOR, true)
	for i, npc in pairs(TABLE_ALL_ULTOR) do
		on_death("bh09_ultor_killed", npc)
	end

   for i, npc in pairs(TABLE_ULTOR_ABOVEDECKS) do
      on_death( "bh09_ultor_abovedecks_killed", npc )
   end

	for i, veh in pairs(VEH_START) do
		if i == ATTACK_HELICOPTER_INDEX then
         -- Don't add anything - yet
		else
			marker_add_vehicle(veh, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_INTERACT, SYNC_ALL)
		end
	end

	mission_help_table(TEXT_BOARD_THE_SHIP)


	while (get_char_vehicle_type(LOCAL_PLAYER) ~= VT_AIRPLANE) and
			(get_char_vehicle_type(LOCAL_PLAYER) ~= VT_HELICOPTER) and
			(get_char_vehicle_type(LOCAL_PLAYER) ~= VT_WATERCRAFT) and
			(get_dist_char_to_nav(LOCAL_PLAYER, NAV_SHIP) > SHIP_DISTANCE) do
		thread_yield()
	end

	mission_waypoint_remove(SYNC_ALL)

	for i, veh in pairs(VEH_START) do
      marker_remove_vehicle(veh, SYNC_ALL)
	end
   if ( crib_is_unlocked( AIRPORT_CRIB_NAME ) ) then
      trigger_enable( TRIGGER_HOTEL_ELEVATOR, true )
   end
   trigger_enable( MISSION_ELEVATOR_TRIGGER, false )

	marker_add_navpoint(NAV_SHIP, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)
	mission_waypoint_add(NAV_SHIP, SYNC_ALL)

	while (Ultor_killed == 0) and (get_dist_char_to_nav(LOCAL_PLAYER, NAV_SHIP) > SHIP_DISTANCE) 
			 and (not IN_COOP or (IN_COOP and get_dist_char_to_nav(REMOTE_PLAYER, NAV_SHIP) > SHIP_DISTANCE)) do
		thread_yield()
	end

   -- Make sure the players don't completely abandon the ship
   Players_out_of_current_boat_range[LOCAL_PLAYER] = false
   Players_out_of_current_boat_range[REMOTE_PLAYER] = false
   THREAD_STAY_ON_SHIP = thread_new( "bh09_stay_on_ship", INITIAL_SHIP_ABANDON_DISTANCE_METERS )

	if (get_char_vehicle_type(LOCAL_PLAYER) == VT_WATERCRAFT) then
		bh09_less_rpgs()
	end

	marker_remove_navpoint(NAV_SHIP, SYNC_ALL)
	mission_waypoint_remove(SYNC_ALL)

	bh09_eliminate_ultor()
end

function bh09_phone_conversation()
	audio_play_conversation(VOICE_INTRO_PHONECALL, INCOMING_CALL)
end

function bh09_eliminate_ultor()
	bh09_show_ultor_counter()
	mission_help_table(TEXT_ELIMINATE_GANG)

	for i, npc in pairs( TABLE_ULTOR_ABOVEDECKS ) do
		npc_combat_enable(npc, true)
		if not character_is_dead(npc) then
			marker_add_npc(npc, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL)
		end
	end

	while bh09_not_done_killing_ultor() do
		thread_yield()
	end

   -- Disable boat spawning - it gets in the way of the waves
   spawning_boats( false )

   fade_out( 0 )
   character_evacuate_from_all_vehicles( LOCAL_PLAYER )
   if ( coop_is_active() ) then
      character_evacuate_from_all_vehicles( REMOTE_PLAYER )
   end
   cutscene_play( CUTSCENE_ATTACK )
   door_open( SHIP_BELOWDECKS_DOOR )

   -- Now that the player knows about the ammo, add the triggers for it
   trigger_enable(TRIGGER_AK47_AMMO, true)
	ingame_effect_add_trigger(TRIGGER_AK47_AMMO, INGAME_EFFECT_LOCATION, SYNC_ALL)
	on_trigger("bh09_give_ak47_ammo", TRIGGER_AK47_AMMO)

	trigger_enable(TRIGGER_RPG_AMMO, true)
	ingame_effect_add_trigger(TRIGGER_RPG_AMMO, INGAME_EFFECT_LOCATION, SYNC_ALL)
	on_trigger("bh09_give_rpg_ammo", TRIGGER_RPG_AMMO)

	objective_text_clear(0)

   --thread_new( "bh09_destroy_helicopter" )

	--vehicle_detonate(VEH_START[2])
	delay(2)
	mission_set_checkpoint(CHECKPOINT_BOAT)

	release_to_world(GROUP_ULTOR)

   bh09_do_waves_attack()
	--bh09_first_wave()
end

function bh09_destroy_helicopter()
   group_show( GROUP_HELI_DESTROYERS )

   local helicopter_was_attacked = false

   -- 
   local attack_heli = VEH_START[ATTACK_HELICOPTER_INDEX]
   for index, member_name in pairs( TABLE_HELI_DESTROYERS ) do

      -- Mark and set up these people as if they're members of the first wave
      marker_add_npc( member_name, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL )
		Wave_members_remaining[1] = Wave_members_remaining[1] + 1
		on_death( "bh09_wave_member_died_wave1", member_name )

      -- Have them attack the helicopter if it's close enough
      if ( vehicle_is_destroyed( attack_heli ) == false ) then
         local dist_to_heli = get_dist_char_to_vehicle( member_name, attack_heli )
         if ( dist_to_heli < 125 ) then
            -- fire_once = false
            force_fire_object_position( member_name, attack_heli, false )
            helicopter_was_attacked = true
         end
      end
   end

   -- If the attackers attacked the helicopter, destroy it
   if ( helicopter_was_attacked ) then
      -- Have the helicopter detonate
      delay( 3.0 )
      -- smoke = true, fire = true
      vehicle_set_smoke_and_fire_state( attack_heli, true, true )
      delay( 15.0 )
      vehicle_detonate( attack_heli )
   end

   for index, member_name in pairs( TABLE_HELI_DESTROYERS ) do
      if ( character_is_dead( member_name ) == false ) then
         attack_closest_player( member_name )
      end
   end
end

function bh09_less_rpgs()
	for i, npc in pairs(TABLE_ULTOR_RPG) do
		if (i ~= 1) then
			inv_item_remove_all(npc)
			inv_item_add("ak47", 1, npc)
			inv_item_equip("ak47", npc)
		end
	end
end

function bh09_not_done_killing_ultor()
	return (Ultor_killed < INITIAL_NUM_ULTOR)
end

function bh09_give_ak47_ammo( triggerer_name, trigger_name )
   bh09_maybe_cleanup_vehicles()

   local rifle_slot_weapon = inv_item_in_slot( triggerer_name, "rifle" )
   if ( rifle_slot_weapon == "none" ) then
      inv_item_add( "ak47", 1, triggerer_name )
      inv_item_equip( "ak47", triggerer_name )
   else
      inv_item_add_ammo( triggerer_name, rifle_slot_weapon, 30 )
   end
end

function bh09_weapon_is_not_rocket_launcher( weapon_name )
   if ( weapon_name == "rpg_launcher" or weapon_name == "rpg_annihilator" ) then
      return false
   end
   return true
end

function bh09_give_rpg_ammo( triggerer_name, trigger_name )
   bh09_maybe_cleanup_vehicles()

   local rpg_slot_weapon = inv_item_in_slot( triggerer_name, "launcher" )
   if ( rpg_slot_weapon == "none" or bh09_weapon_is_not_rocket_launcher( rpg_slot_weapon ) ) then
      inv_item_add( "rpg_launcher", 1, triggerer_name )
      inv_item_equip( "rpg_launcher", triggerer_name )
   else
      inv_item_add_ammo( triggerer_name, rpg_slot_weapon, 5 )
   end
end

function bh09_maybe_cleanup_vehicles()
	if (Last_wave_completed == 1) then
		Last_wave_completed = 0
		for i, veh in pairs(VEH_WAVE1_BOATS) do
			object_destroy(veh)
		end
		for i, veh in pairs(VEH_WAVE1_HELIS) do
			object_destroy(veh)
		end
	elseif (Last_wave_completed == 2) then
		Last_wave_completed = 0
		for i, veh in pairs(VEH_WAVE2_BOATS) do
			object_destroy(veh)
		end
		for i, veh in pairs(VEH_WAVE2_HELIS) do
			object_destroy(veh)
		end
	end
end

function bh09_ak47_ammo_trigger_watch()
	while(1) do
		thread_yield()
		if (get_dist_char_to_nav(LOCAL_PLAYER, TRIGGER_AK47_AMMO) < 3) and player_button_just_pressed(3) then
			local equipped_item = inv_item_get_equipped_item(LOCAL_PLAYER)
			inv_item_add("ak47", 1, LOCAL_PLAYER)
			if (equipped_item ~= nil) and (equipped_item ~= "") and (inv_has_item(equipped_item, LOCAL_PLAYER)) then
				inv_item_equip(equipped_item, LOCAL_PLAYER)
			else
				inv_item_equip("ak47", LOCAL_PLAYER)
			end
		end
	end
end

function bh09_rpg_ammo_trigger_watch()
	while(1) do
		thread_yield()
		if (get_dist_char_to_nav(LOCAL_PLAYER, TRIGGER_RPG_AMMO) < 3) and player_button_just_pressed(3) then
			local equipped_item = inv_item_get_equipped_item(LOCAL_PLAYER)
			inv_item_add("rpg_launcher", 1, LOCAL_PLAYER)
			if (equipped_item ~= nil) and (equipped_item ~= "") and (inv_has_item(equipped_item, LOCAL_PLAYER)) then
				inv_item_equip(equipped_item, LOCAL_PLAYER)
			else
				inv_item_equip("rpg_launcher", LOCAL_PLAYER)
			end
		end
	end
end

function bh09_wave_member_died_wave1( member_name )
	bh09_wave_member_died( member_name, 1 )
end

function bh09_wave_member_died_wave2( member_name )
	bh09_wave_member_died( member_name, 2 )
end

function bh09_wave_member_died_wave3( member_name )
	bh09_wave_member_died( member_name, 3 )
end

function bh09_wave_member_died( member_name, wave_index )
	-- Decrement the number of wave members left in this wave
	Wave_members_remaining[wave_index] = Wave_members_remaining[wave_index] - 1
	mission_debug( Wave_members_remaining[wave_index].." members remaining in wave "..wave_index..".", 10 )
	bh09_soldier_died( member_name )
end

-- Sets up completion tracking for a wave.
--
function bh09_setup_wave_completion_tracking_and_mark_attackers( wave_index )
   -- Add the heli destroyers for the first wave
   if ( wave_index == 1 ) then
      -- ( They're marked/tracked on spawn, so no need to mark or track them here. )
		Wave_members_remaining[wave_index] = Wave_members_remaining[wave_index] + sizeof_table( TABLE_HELI_DESTROYERS )
   end

	for index, heli_group in pairs( CHARS_WAVES_HELIS[wave_index] ) do
		Wave_members_remaining[wave_index] = Wave_members_remaining[wave_index] + sizeof_table( heli_group )
		for member_index, member_name in pairs( heli_group ) do
			on_death( "bh09_wave_member_died_wave"..wave_index, member_name )
		   marker_add_npc( member_name, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL )
		end
	end
	for index, boat_group in pairs( CHARS_WAVES_BOATS[wave_index] ) do

      local cur_boat_two_seater = WAVE_BOAT_IS_TWO_SEATER[wave_index][index]
		for member_index, member_name in pairs( boat_group ) do
         -- Only include drivers as required kills if the boat is a two-seater. Otherwise the driver will drive away
         -- after dropping off the other members
         if ( member_index ~= BOAT_DRIVER_INDEX or cur_boat_two_seater ) then
            Wave_members_remaining[wave_index] = Wave_members_remaining[wave_index] + 1
            on_death( "bh09_wave_member_died_wave"..wave_index, member_name )
            marker_add_npc( member_name, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL )
         end
		end
	end
end

function bh09_do_waves_attack()
   -- Don't start the attack until all players are in range of the boat
   repeat
      thread_yield()
   until ( bh09_all_players_in_boat_range() )

   -- Make sure the players stay near the ship - closer, now that they're defending it
   thread_kill( THREAD_STAY_ON_SHIP )
	THREAD_STAY_ON_SHIP = thread_new( "bh09_stay_on_ship", SHIP_ABANDON_DISTANCE )

   -- Before we attack, delay for a few seconds
   delay(3)
   -- Setup notoriety
	notoriety_set("Brotherhood", 2)
	notoriety_set_min("Brotherhood", 2)

   -- Don't actually start the attack until both players are close enough
	while (get_dist_char_to_nav(LOCAL_PLAYER, NAV_SHIP) > SHIP_DISTANCE) 
			 and (not IN_COOP or (IN_COOP and get_dist_char_to_nav(REMOTE_PLAYER, NAV_SHIP) > SHIP_DISTANCE)) do
		thread_yield()
	end


   -- ( Note that these wave functions yield until the respective waves are defeated )
   -- First wave and intermission
   bh09_do_wave( 1 )
   bh09_do_intermission_and_prev_wave_cleanup( 1 )

   -- Second wave and intermission
   bh09_do_wave( 2 )
   bh09_do_intermission_and_prev_wave_cleanup( 2 )

   -- Third wave
   bh09_do_wave( 3 )
   bh09_waves_final_cleanup()

   bh09_success_all_waves_defeated()
end

function bh09_any_wave_member_alive( wave_index )
   if ( wave_index == 1 ) then
      for member_index, member_name in pairs( TABLE_HELI_DESTROYERS ) do
         if ( character_is_released( member_name ) == false ) then
            if ( character_is_dead( member_name ) == false ) then
               return true
            else
               marker_remove_npc( member_name, SYNC_ALL )
            end
         end
      end
   end

   for heli_group_index, heli_group_name in pairs( CHARS_WAVES_HELIS[wave_index] ) do
      for member_index, member_name in pairs( heli_group_name ) do
         if ( character_is_released( member_name ) == false ) then
            if ( character_is_dead( member_name ) == false ) then
               return true
            else
               marker_remove_npc( member_name, SYNC_ALL )
            end
         end
      end
   end

   for boat_group_index, boat_group_name in pairs( CHARS_WAVES_BOATS[wave_index] ) do
      for member_index, member_name in pairs( boat_group_name ) do
         if ( member_index ~= BOAT_DRIVER_INDEX ) then
            if ( character_is_released( member_name ) == false ) then
               if ( character_is_dead( member_name ) == false ) then
                  return true
               else
                  marker_remove_npc( member_name, SYNC_ALL )
               end
            end
         end
      end
   end

   return false
end

function bh09_do_wave( wave_index )
   -- Inform the player of the incoming wave
   mission_help_table( TEXTS_WAVES[wave_index] )

   -- Create the wave and setup tracking for it so that we'll
   -- know when it's dead
   group_create( GROUPS_WAVES[wave_index], true )
   bh09_setup_wave_completion_tracking_and_mark_attackers( wave_index )

   -- Go through all of the vehicles and have them attack
   -- Helicopters
   for heli_index, heli in pairs(VEH_WAVES_HELIS[wave_index]) do
		THREAD_WAVES_HELIS[wave_index][heli_index] = thread_new( "bh09_heli", heli,
                                                               CHARS_WAVES_HELIS[wave_index][heli_index],
                                                               heli_index )
	end
   -- Boats
	for boat_index, boat in pairs(VEH_WAVES_BOATS[wave_index]) do
		--marker_add_vehicle( boat, MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL, SYNC_ALL )
		vehicle_enter_group_teleport( CHARS_WAVES_BOATS[wave_index][boat_index], boat )
		on_vehicle_destroyed( "bh09_boat_destroyed", boat )

      -- Set the boat's HP to a new, lower, value
      local cur_max_boat_hp = get_max_hit_points( boat )
      local new_max_boat_hp = cur_max_boat_hp * BOAT_HIT_POINTS_PERCENT_OF_NORMAL
      set_current_hit_points( boat, new_max_boat_hp )
      set_max_hit_points( boat, new_max_boat_hp )
	end

   -- Have the left-hand boats take the left paths, and the right-hand boats take the right-hand paths
	for left_index, boat in pairs(VEH_WAVES_BOATS_LEFT[wave_index]) do
      local _wave_index, boat_index = bh09_get_boat_wave_index_and_boat_index( boat )

		THREAD_WAVES_BOATS[wave_index][boat_index] = thread_new( "bh09_boat", boat, left_index,
                                                               NAV_BOAT_PATH_LEFT, NAV_STAIRS_LEFT_PATH, CHARS_WAVES_BOATS[wave_index][boat_index] )
	end
	for right_index, boat in pairs(VEH_WAVES_BOATS_RIGHT[wave_index]) do
      local _wave_index, boat_index = bh09_get_boat_wave_index_and_boat_index( boat )

		THREAD_WAVES_BOATS[wave_index][boat_index] = thread_new( "bh09_boat", boat, right_index,
                                                               NAV_BOAT_PATH_RIGHT, NAV_STAIRS_RIGHT_PATH, CHARS_WAVES_BOATS[wave_index][boat_index] )
	end

   -- Yield until this wave is killed
	while bh09_any_wave_member_alive(wave_index) do--Wave_members_remaining[wave_index] > 0 do
		thread_yield()
	end
   Last_wave_completed = wave_index
end

function bh09_do_intermission_and_prev_wave_cleanup( last_wave_index )
	delay(3)
	mission_help_table_nag( TEXT_NEXT_WAVE, BETWEEN_WAVES_DELAY_SECONDS )
	hud_timer_set(0, BETWEEN_WAVES_DELAY_SECONDS * 1000, "", false)

	minimap_icon_add_trigger( TRIGGER_AK47_AMMO, MINIMAP_ICON_PROTECT_ACQUIRE )
	minimap_icon_add_trigger( TRIGGER_RPG_AMMO, MINIMAP_ICON_PROTECT_ACQUIRE )

	for i, thread in pairs(THREAD_WAVES_HELIS[last_wave_index]) do
		if thread ~= -1 then
			thread_kill(thread)
		end
	end

	for i, thread in pairs(THREAD_WAVES_BOATS[last_wave_index]) do
		if thread ~= -1 then
			thread_kill(thread)
		end
	end

	while(hud_timer_get_remainder(0) > 0) do
		thread_yield()
	end

	hud_timer_stop(0)

	minimap_icon_remove_trigger(TRIGGER_AK47_AMMO, SYNC_ALL)
	minimap_icon_remove_trigger(TRIGGER_RPG_AMMO, SYNC_ALL)

   release_to_world( GROUPS_WAVES[last_wave_index] )
end

function bh09_waves_final_cleanup()
	for i, thread in pairs(THREAD_BOARDING) do
		if thread ~= -1 then
			thread_kill(thread)
		end
	end
end

function bh09_wave_complete(chars, helis)
	for i, set in pairs(chars) do
		for j, npc in pairs(set) do
			if not character_is_dead(npc) then
				return false
			end
		end
	end
	for i, heli in pairs(helis) do
		if not vehicle_is_destroyed(heli) then
			return false
		end
	end
	return true
end

function bh09_get_boat_path_goal( boat_path_name )
   if ( boat_path_name == NAV_BOAT_PATH_LEFT ) then
      return NAV_BOAT_LEFT_GOAL
   else--if ( boat_path_name == NAV_BOAT_PATH_RIGHT ) then
      return NAV_BOAT_RIGHT_GOAL
   end
end

function bh09_get_boat_leave_path( boat_path_name )
   if ( boat_path_name == NAV_BOAT_PATH_LEFT ) then
      return NAV_BOAT_LEAVE_PATH_LEFT
   else--if ( boat_path_name == NAV_BOAT_PATH_RIGHT ) then
      return NAV_BOAT_LEAVE_PATH_RIGHT
   end
end

function bh09_get_boat_wave_index_and_boat_index( boat_name )
   for wave_index, boat_group in pairs( VEH_WAVES_BOATS ) do
      for boat_index, boat in pairs( boat_group ) do
         if ( boat_name == boat ) then
            return wave_index, boat_index
         end
      end
   end
   script_assert( false, "Boat with name "..boat_name.." not found." )
end

function bh09_is_boat_two_seater( boat_name )
   local wave_index, boat_index = bh09_get_boat_wave_index_and_boat_index( boat_name )

   return WAVE_BOAT_IS_TWO_SEATER[wave_index][boat_index]
end

function bh09_boat(boat, delay_factor, boat_path, stairs_path, passengers )
   vehicle_disable_chase( boat, true )
   vehicle_disable_flee( boat, true )

	delay(6 * delay_factor)
	local THREAD_PATHFIND = thread_new("bh09_boat_pathfind", boat, boat_path)

   local goal = bh09_get_boat_path_goal( boat_path )

   local boat_two_seater = bh09_is_boat_two_seater( boat )

	while (get_dist_vehicle_to_nav(boat, goal) > 10) do
		thread_yield()
	end
	thread_kill(THREAD_PATHFIND)
	delay(2)
   for index, name in pairs( passengers ) do
      -- Everyone in a two-seat boat gets off, but drivers of four-seat boats need to drive the boat
      -- back so they don't get off
      if ( index ~= BOAT_DRIVER_INDEX or boat_two_seater ) then
         if ( not character_is_dead( name ) and character_is_in_vehicle( name ) ) then
            mission_debug( "telling character "..name.." in boat "..boat.." to board.", 15 )
            THREAD_BOARDING[name] = thread_new("bh09_boarding", name, stairs_path, index * 2 )
         end
      end
   end
	marker_remove_vehicle(boat, SYNC_ALL)

   vehicle_stop( boat )
   delay( 1.0 )

   -- Boats with more than two seats pathfind back to their origin after making a dropoff.
   if ( boat_two_seater == false ) then
      local departure_path = bh09_get_boat_leave_path( boat_path )
      if ( vehicle_is_destroyed( boat ) == false and vehicle_get_driver( boat ) ~= nil ) then
         vehicle_pathfind_to(boat, departure_path, true, true)
      end

      if ( vehicle_is_destroyed( boat ) == false ) then
         vehicle_exit( passengers[BOAT_DRIVER_INDEX] )
         release_to_world( passengers[BOAT_DRIVER_INDEX] )
      end
   end
   release_to_world( boat )
end

function bh09_boat_pathfind(boat, boat_path)
	while not vehicle_is_destroyed(boat) do
		thread_yield()
		vehicle_pathfind_to(boat, boat_path, true, true)
	end
end

function bh09_get_stairs_path_start( stairs_path )
   if ( stairs_path == NAV_STAIRS_LEFT_PATH ) then
      Cur_left_path_start_index = Cur_left_path_start_index + 1
      if ( Cur_left_path_start_index > NUM_LEFT_PATH_STARTS ) then
         Cur_left_path_start_index = 1
      end
      return NAV_STAIRS_LEFT_PATH_STARTS[Cur_left_path_start_index]
   else--if ( stairs_path == NAV_STAIRS_RIGHT_PATH ) then
      Cur_right_path_start_index = Cur_right_path_start_index + 1
      if ( Cur_right_path_start_index > NUM_RIGHT_PATH_STARTS ) then
         Cur_right_path_start_index = 1
      end
		return NAV_STAIRS_RIGHT_PATH_STARTS[Cur_right_path_start_index]
   end
end

function bh09_boarding(npc, nav_stairs, delay_amount)
	vehicle_exit_teleport(npc)
	delay(delay_amount)

   local stairs_path_start = bh09_get_stairs_path_start( nav_stairs )
   teleport( npc, stairs_path_start )

	attack_closest_player(npc)
   move_to_safe( npc, nav_stairs, 2, false, true )
   if ( character_is_dead( npc ) ) then
      return
   end
	attack_closest_player(npc)
	while not character_is_dead(npc) do
		thread_yield()
		delay(1)
		if (not character_is_dead(npc)) and character_is_swimming(npc) then
			delay(2)
         teleport( npc, stairs_path_start )
         attack_closest_player(npc)
         move_to_safe( npc, nav_stairs, 2, false, true )
         if ( character_is_dead( npc ) ) then
            return
         end
         attack_closest_player(npc)
		end
	end
end

function bh09_soldier_died(npc)
	on_death("", npc)
	if ( THREAD_BOARDING[npc] ~= INVALID_THREAD_HANDLE and
		  THREAD_BOARDING[npc] ~= nil ) then
		thread_kill(THREAD_BOARDING[npc])
	end
	marker_remove_npc(npc, SYNC_ALL)
end

function bh09_boat_destroyed(boat)
	on_vehicle_destroyed("", boat)
	marker_remove_vehicle(boat, SYNC_ALL)
end

function bh09_heli(heli, chars, i)
	--marker_add_vehicle(heli, MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL, SYNC_ALL)
	for member_index, member_name in pairs( chars ) do
      inv_item_remove_all( member_name )
      inv_item_add( HELI_ATTACKER_WEAPON, 1, member_name )
      inv_item_add_ammo( member_name, HELI_ATTACKER_WEAPON, HELI_ATTACKER_WEAPON_AMMO_COUNT )
      vehicle_enter_teleport( member_name, heli, HELI_MEMBER_TO_SEAT_INDEX_MAPPING[member_index] )
	end
	delay((i-1) * 4)
	--local THREAD_TEMP_CHASE = thread_new("vehicle_chase", heli, LOCAL_PLAYER)
	--delay(8)
	--thread_kill(THREAD_TEMP_CHASE)

   helicopter_fly_to_direct( heli, 20, NAV_HELI_DROPOFFS[i] )
   vehicle_exit( chars[2] )
   delay( 2.0 )

   if ( i == 1 ) then
      helicopter_fly_to_direct( heli, 20, "bh09_$To_Path1_Start" )
   end

	while not vehicle_is_destroyed(heli) do
		helicopter_fly_to_direct(heli, 20, NAV_HELI_PATHS[i])
		thread_yield()
	end
	marker_remove_vehicle(heli, SYNC_ALL)
end

function bh09_stay_on_ship( distance_meters )
	while 1 do
		thread_yield()
		if get_dist_char_to_nav(LOCAL_PLAYER, NAV_SHIP) > distance_meters then
			mission_help_table_nag(TEXT_30_SECONDS, SYNC_LOCAL)
			hud_timer_set(1, 30000, "bh09_failure_abandoned_ship", true)

         minimap_icon_add_navpoint_radius( NAV_SHIP, MINIMAP_ICON_LOCATION, distance_meters, nil, SYNC_LOCAL )

         Players_out_of_current_boat_range[LOCAL_PLAYER] = true

			while get_dist_char_to_nav(LOCAL_PLAYER, NAV_SHIP) > distance_meters do
				thread_yield()
			end

         Players_out_of_current_boat_range[LOCAL_PLAYER] = false
         minimap_icon_remove_navpoint( NAV_SHIP, SYNC_LOCAL )
         hud_timer_stop(1)
		end
		if IN_COOP and get_dist_char_to_nav(REMOTE_PLAYER, NAV_SHIP) > distance_meters then
			mission_help_table_nag(TEXT_30_SECONDS, SYNC_REMOTE)
			hud_timer_set(1, 30000, "bh09_failure_abandoned_ship", true)

         minimap_icon_add_navpoint_radius( NAV_SHIP, MINIMAP_ICON_LOCATION, distance_meters, nil, SYNC_REMOTE )

         Players_out_of_current_boat_range[REMOTE_PLAYER] = true

         while get_dist_char_to_nav(REMOTE_PLAYER, NAV_SHIP) > distance_meters do
				thread_yield()
			end

         Players_out_of_current_boat_range[REMOTE_PLAYER] = false
         minimap_icon_remove_navpoint( NAV_SHIP, SYNC_REMOTE )
			hud_timer_stop(1)
		end
	end
end

function bh09_ultor_abovedecks_killed( npc )
   Num_abovedecks_remaining = Num_abovedecks_remaining - 1

   if ( Num_abovedecks_remaining == 0 ) then
      trigger_enable( TRIGGER_BELOWDECKS, true )
      on_trigger( "bh09_reached_belowdecks_door", TRIGGER_BELOWDECKS )
      marker_add_trigger( TRIGGER_BELOWDECKS, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL )

      for i, npc in pairs( TABLE_ULTOR_BELOWDECKS ) do
         npc_combat_enable(npc, true)
         if not character_is_dead(npc) then
            marker_add_npc(npc, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL)
         end
      end

      door_lock( SHIP_BELOWDECKS_DOOR, false )
      door_open( SHIP_BELOWDECKS_DOOR )
   end

   bh09_ultor_killed( npc )
end

function bh09_reached_belowdecks_door( triggerer_name, trigger_name )
   marker_remove_trigger( trigger_name, SYNC_ALL )
   trigger_enable( trigger_name, false )
end

function bh09_ultor_killed(npc)
	on_death("", npc)
	marker_remove_npc(npc, SYNC_ALL)
	Ultor_killed = Ultor_killed + 1
	bh09_show_ultor_counter()
end

function bh09_show_ultor_counter()
	objective_text(0, TEXT_ULTOR_KILLED, Ultor_killed, INITIAL_NUM_ULTOR)
end

function bh09_failure_abandoned_ship()
	delay(3)
	mission_end_failure("bh09", TEXT_SHIP_ABANDONED)
end

function bh09_success_all_waves_defeated()
   audio_play_conversation(VOICE_OUTRO_PHONECALL, INCOMING_CALL)

	delay(3)

   Mission_won = true

	mission_end_success("bh09")
end

function bh09_cleanup()
	-- Cleanup mission here
   -- Revert boat spawning
   spawning_boats( true )

   character_evacuate_from_all_vehicles( LOCAL_PLAYER )
   if ( coop_is_active() ) then
      character_evacuate_from_all_vehicles( REMOTE_PLAYER )
   end

   -- Swap the chunks back to their permanent state
   -- interior = false, blocking = false, temporary = false
   city_chunk_swap("sr2_chunk012", "normal", false, false, false )

	minimap_icon_remove_trigger( TRIGGER_AK47_AMMO, SYNC_ALL )
	ingame_effect_remove_trigger(TRIGGER_AK47_AMMO, SYNC_ALL)
	on_trigger("", TRIGGER_AK47_AMMO)
	minimap_icon_remove_trigger( TRIGGER_RPG_AMMO, SYNC_ALL )
	ingame_effect_remove_trigger(TRIGGER_RPG_AMMO, SYNC_ALL)
	on_trigger("", TRIGGER_RPG_AMMO)

   if ( crib_is_unlocked( AIRPORT_CRIB_NAME ) ) then
      trigger_enable( TRIGGER_HOTEL_ELEVATOR, true )
   end

	for i, set in pairs(CHARS_WAVE1_BOATS) do
		for j, npc in pairs(set) do
			marker_remove_npc(npc, SYNC_ALL)
		end
	end

	for i, set in pairs(CHARS_WAVE2_BOATS) do
		for j, npc in pairs(set) do
			marker_remove_npc(npc, SYNC_ALL)
		end
	end

	for i, set in pairs(CHARS_WAVE3_BOATS) do
		for j, npc in pairs(set) do
			marker_remove_npc(npc, SYNC_ALL)
		end
	end

	for i, thread in pairs(THREAD_WAVE1_BOATS) do
		if thread ~= -1 then
			thread_kill(thread)
		end
	end

	for i, thread in pairs(THREAD_WAVE2_BOATS) do
		if thread ~= -1 then
			thread_kill(thread)
		end
	end

	for i, thread in pairs(THREAD_WAVE3_BOATS) do
		if thread ~= -1 then
			thread_kill(thread)
		end
	end

	for i, thread in pairs(THREAD_WAVE1_HELIS) do
		if thread ~= -1 then
			thread_kill(thread)
		end
	end

	for i, thread in pairs(THREAD_WAVE2_HELIS) do
		if thread ~= -1 then
			thread_kill(thread)
		end
	end

	for i, thread in pairs(THREAD_WAVE3_HELIS) do
		if thread ~= -1 then
			thread_kill(thread)
		end
	end
	if THREAD_STAY_ON_SHIP ~= -1 then
		thread_kill(THREAD_STAY_ON_SHIP)
	end

	if group_is_loaded(GROUP_SAINTS) then
		group_show(GROUP_SAINTS)
	end
	notoriety_set_min("Brotherhood", 0)

	--re enable warping to shore.
	player_warp_to_shore_enable(LOCAL_PLAYER)
	if IN_COOP then
		player_warp_to_shore_enable(REMOTE_PLAYER)
	end

   if ( Mission_won == false ) then
     teleport( LOCAL_PLAYER, NAV_LOCAL_START )
     if ( coop_is_active() ) then
        teleport( REMOTE_PLAYER, NAV_REMOTE_START )
     end
   end

   bh09_notoriety_force_no_spawn( false )
end

-- Disables or enables notoriety spawning for all teams for which
-- it should be disabled for during this mission.
--
-- no_spawning: True to disable ( defaults to true. ) False to enable.
--
function bh09_notoriety_force_no_spawn( no_spawning )
   if ( no_spawning == nil ) then
      no_spawning = true
   end

   notoriety_force_no_spawn( "samedi", no_spawning )
	notoriety_force_no_spawn( "brotherhood", no_spawning )
	notoriety_force_no_spawn( "ronin", no_spawning )
	notoriety_force_no_spawn( "police", no_spawning )
	notoriety_force_no_spawn( "ultor", no_spawning )
end

function bh09_success()
	-- Called when the mission has ended with success
	group_create(GROUP_COURTESY_HELI, true)
	release_to_world(COURTESY_HELI)
end
