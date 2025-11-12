-- ep02.lua
-- SR2 mission script
-- 3/28/07

-- Groups --
	GROUP_GAT =									"ep02_$gat"
	GROUP_BILLBOARD_HELI =					"ep02_$billboard_heli"
	GROUP_ULTOR_BILLBOARD =					"ep02_$ultor_billboard"
	GROUP_DELIVERY_TRUCK =					"ep02_$delivery_truck"
	GROUP_ULTOR_TRUCK =						{"ep02_$ultor_truck", "ep02_$ultor_truck_2", "ep02_$ultor_truck_3", "ep02_$ultor_truck_4"}
	GROUP_ULTOR_MALL =						"ep02_$ultor_mall"
	GROUP_ULTOR_BASE =						"ep02_$ultor_base"
	GROUP_ESCAPE =								"ep02_$escape"
	GROUP_APC_KEYS =							"ep02_$apc_keys"
	GROUP_COURTESY_CAR =						"ep02_$courtesy_car"
	GROUP_COURTESY_CAR_COOP =				"ep02_$courtesy_car_coop"
	GROUP_CTE =									"ep02_$GCTE"
	GROUP_BOMBS =								"ep02_$Gbombs"

-- Navpoints --
	NAV_LOCAL_START =							"ep02_$n000"
	NAV_REMOTE_START =						"ep02_$n001"
	NAV_SAINTS_ROW	=							"ep02_$n021"
	NAV_BILLBOARD =							"ep02_$n002"
	NAV_BILLBOARD_GROUND =					"ep02_$n003"
	--NAV_DELIVERY_TRUCK_ROUTE =				{"ep02_$n004", "ep02_$n005", "ep02_$n006", "ep02_$n007", "ep02_$n008",
	--												"ep02_$n009", "ep02_$n010", "ep02_$n011", "ep02_$n012"}
	NAV_DELIVERY_TRUCK_ROUTE =				{"ep02_$n004", "ep02_$n005", "ep02_$n006", "ep02_$n007", "ep02_$n008",
													"ep02_$n013"}
	NAV_STORE =									{"ep02_$n014", "ep02_$n015"}
	NAV_WASTE_TUNNEL =						"ep02_$n017"
	NAV_ESCAPE_FINISH =						"ep02_$n018"
	NAV_ULTOR_TRUCK_CENTERS =				{"ep02_$n019", "ep02_$n011", "ep02_$n008", "ep02_$n020"}

	NAV_ALARM_SOURCES =						"ep02_$n022"

	NAV_BOMBS_PLANTED_LOCAL_START	=		"ep02_$n024"
	NAV_BOMBS_PLANTED_REMOTE_START	=	"ep02_$n025"

	NAV_CUTSCENE_LOCAL_START =				"ep02_$Ncutscene_local_start"
	NAV_CUTSCENE_REMOTE_START =			"ep02_$Ncutscene_remote_start"

-- Triggers --
	TRIGGER_ELEVATOR =						"university_$t-ug-ultorbase-in"
	TRIGGER_NEAR_BASE_ENTRANCE	=			"ep02_$t001"
	TRIGGERS_BASE_ENTRY_BREADCRUMBS =	{"ep02_$t005", "ep02_$t004", "ep02_$t002", "ep02_$t003"}
	--TRIGGERS_KEY_BREADCRUMBS =				{"ep02_$t006", "ep02_$t007", "ep02_$t008"}
	TRIGGERS_KEY_BREADCRUMBS =				{"ep02_$t006", "ep02_$t007", "ep02_$t011"}
	TRIGGERS_BOMBS =							{"ep02_$t000", "ep02_$t009", "ep02_$t010"}
	TRIGGER_BASE_LAB_DOOR_1 =				"ep02_$Tdoor_lab_1"
	TRIGGER_BASE_LAB_DOOR_2 =				"ep02_$Tdoor_lab_2"
	TRIGGER_BASE_LAB_DOOR_3 =				"ep02_$Tdoor_lab_3"
	TRIGGER_CTES =								{"ep02_$Tcte_1", "ep02_$Tcte_2", "ep02_$Tcte_3"}

	TRIGGER_BASE_TELEPORT_ENTER =			"university_$t-ug-ultorbase-out"
	TRIGGER_BASE_TELEPORT_EXIT =			"university_$t-ug-ultorbase-in"

	TRIGGER_WRONG_EXIT_WARNING =			"ep02_$Twrong_exit_warning"
	TRIGGER_WRONG_EXIT_FAIL =				"ep02_$Twrong_exit_fail"

-- Characters --
	CHAR_GAT =									"ep02_$c000"
	CHAR_ULTOR_BILLBOARD_HELI =			{"ep02_$c001", "ep02_$c002"}
	--CHAR_DELIVERY_TRUCK =					{"ep02_$c003", "ep02_$c004"}
	CHAR_DELIVERY_TRUCK =					{"ep02_$c003"}
	CHAR_ULTOR_TRUCK_CHASERS =				{{{"ep02_$c005", "ep02_$c006"}, {"ep02_$c007", "ep02_$c008"}},
													 {{"ep02_$c016", "ep02_$c017"}, {"ep02_$c018", "ep02_$c019"}},
													 {{"ep02_$c020", "ep02_$c021"}, {"ep02_$c022", "ep02_$c023"}},
													 {{"ep02_$c024", "ep02_$c025"}, {"ep02_$c026", "ep02_$c027"}}}
	CHAR_ULTOR_MALL =							{"ep02_$c009", "ep02_$c010", "ep02_$c011", "ep02_$c012"}
	CHAR_APC_GUARDS =							{"ep02_$c013", "ep02_$c014", "ep02_$c015"}

-- Vehicles --
	VEH_BILLBOARD_HELI =						"ep02_$v000"
	VEH_ULTOR_BILLBOARD_HELI =				"ep02_$v001"
	VEH_DELIVERY_TRUCK =						"ep02_$v002"
	VEH_ULTOR_TRUCK_CHASERS =				{{"ep02_$v003", "ep02_$v004"},
													 {"ep02_$v006", "ep02_$v007"},
													 {"ep02_$v008", "ep02_$v009"},
													 {"ep02_$v010", "ep02_$v011"}}
	VEH_APC =									"ep02_$v005"

-- Items --
	ITEM_ELEVATOR_KEYS =						"ep02_$i000"
	ITEM_APC_KEYS =							"ep02_$i001"

-- Threads --
	THREAD_BILLBOARD =						-1
	THREAD_TRUCK =								-1
	THREAD_MALL =								-1
	THREAD_HELI_CHASE =						-1

-- Checkpoints --
	CHECKPOINT_ULTOR_BASE =					"ep02_ultor_base"
	CHECKPOINT_BOMBS_PLANTED =				"ep02_bombs_planted"

-- Cutscenes --
	CUTSCENE_IN =						"tsse02-1.bik"
	CUTSCENE_OUT =						"tsse02-2.bik"

-- Animations --

-- Mesh Movers --
	
	MM_BASE_ESCAPE_DOOR =					"ep02_$MMdoor_apc"
	MM_BASE_LAB_DOOR_1 =						"ep02_$MMdoor_lab_1"
	MM_BASE_LAB_DOOR_2 =						"ep02_$MMdoor_lab_2"
	MM_BASE_LAB_DOOR_3 =						"ep02_$MMdoor_lab_3"

-- Text --
	TEXT_GO_TO_SAINTS_ROW =					"ep02_go_to_saints_row"		-- Head to Saints Row.
	TEXT_ULTOR_NOTORIETY =					"ep02_ultor_notoriety"		-- Get your Ultor notoriety up to 4 stars.
	TEXT_NOTORIETY_ZERO =					"ep02_notoriety_zero"		-- Eliminate your notoriety at a Forgive & Forget.
	TEXT_GO_TO_BASE =							"ep02_go_to_base"				-- Enter the Ultor base while they're distracted.
	TEXT_MEET_GAT =							"ep02_meet_gat"				-- Use the secret entrance and meet Gat in the base.
	TEXT_GET_KEY =								"ep02_get_key"					-- Get the keycard to the lab doors.
	TEXT_DESTROY_LABS =						"ep02_destroy_labs"			-- Plant bombs in each of the labs upstairs.
	TEXT_GET_OUT =								"ep02_get_out"					-- Exit the base before the bombs detonate.
	TEXT_EXIT_SEALED =						"ep02_exit_sealed"			-- The door has been shut, find another way out.
	TEXT_GAT_DIED =							"ep02_gat_died"				-- Gat died.
	TEXT_DIDNT_ESCAPE =						"ep02_didnt_escape"			-- You did not escape the Ultor base in time.

	TEXT_RETURN_SAINTS_ROW =				"ep02_return_saints_row"	-- Get back to Saints Row.
	TEXT_FAIL_OUT_OF_ROW =					"ep02_fail_out_of_row"		-- You did not get back to Saints Row in time.
	
	TEXT_WARN_WRONG_EXIT =					"ep02_warn_wrong_exit"
	TEXT_FAIL_WRONG_EXIT =					"ep02_fail_wrong_exit"

-- Other --
	IN_COOP =									false
	SAINTS_ROW_DISTRICT_NAME =				"Saints Row"
	OUT_OF_ROW_TIME_MS =						20 * 1000

	Timing_out_of_row =						{ [LOCAL_PLAYER] = false, [REMOTE_PLAYER] = false }
	Saints_row_reached =						{ [LOCAL_PLAYER] = false, [REMOTE_PLAYER] = false }
	Elevator_keys_acquired =				false

	Ultor_notoriety_vehicles =				4
	Ultor_notoriety_vehicles_coop	=		6

	PLAYER_TIMER	=	{	[LOCAL_PLAYER] = 0, [REMOTE_PLAYER] = 1 }

	PLAYER_SYNC		=	{	[LOCAL_PLAYER]	= SYNC_LOCAL,
								[REMOTE_PLAYER] = SYNC_REMOTE,
							}

	OTHER_PLAYER	=	{	[LOCAL_PLAYER]	= REMOTE_PLAYER,
								[REMOTE_PLAYER] = LOCAL_PLAYER,
							}

function ep02_start(ep02_checkpoint, is_restart)

	if (ep02_checkpoint == MISSION_START_CHECKPOINT) then

		local group_list = {GROUP_GAT, GROUP_COURTESY_CAR}
		if (coop_is_active()) then
			group_list = {GROUP_GAT, GROUP_COURTESY_CAR, GROUP_COURTESY_CAR_COOP}
		end
				
		if (is_restart) then
			for i,group in pairs(group_list) do
				group_create(group, true)
			end
			teleport_coop(NAV_LOCAL_START, NAV_REMOTE_START)
		else
			cutscene_play("tsse02-01", group_list, {NAV_LOCAL_START, NAV_REMOTE_START}, false )
			for i,group in pairs(group_list) do
				group_show(group)
			end
		end
	end

	ep02_initialize(ep02_checkpoint, is_restart)

	-- Stage 1: Player(s) go to Saints Row and get their Ultor(Police) notoriety up to 4 stars
	if ep02_checkpoint == MISSION_START_CHECKPOINT then
		ep02_piss_off_the_ultor()

	-- Stage 2: Player(s) drop notoriety to 0, then head into the ultor base. Inside the base, they
	-- obtain a key to some research labs where they have to plant bombs.
	elseif ep02_checkpoint == CHECKPOINT_ULTOR_BASE then
		ep02_ultor_base()

	-- Stage 3: Players flee the base in an APC
	elseif ep02_checkpoint == CHECKPOINT_BOMBS_PLANTED then
		ep02_escape()
	end
end

function ep02_initialize(checkpoint, is_restart)

	mission_start_fade_out(0.0)

	-- A few Global constants need to be set up, but shouldn't be changed after this function
	-- ep02_setup_global_constants()

	ep02_initialize_common()

	ep02_initialize_checkpoint(checkpoint, is_restart)

	mission_start_fade_in()

end

-- Initialization code shared by all checkpoints.
function ep02_initialize_common()

	-- Start trigger is hit...the activate button was hit
	set_mission_author("Phillip Alexander and Aaron Hanson (aka Father Zucosos)")

	if coop_is_active() then
		IN_COOP = true
	end

	-- Disable the teleport triggers that take the player into and out of the Ultor base
	trigger_enable(TRIGGER_BASE_TELEPORT_ENTER, false)
	trigger_enable(TRIGGER_BASE_TELEPORT_EXIT, false)

	trigger_enable(TRIGGER_ELEVATOR, false)
	on_mission_item_pickup("")
	on_mission_item_drop("")

	-- Don't allow players to call Gat during this mission.
	homie_mission_lock("Johnny_Gat")

end

-- Initialization code specific to the checkpoint.
function ep02_initialize_checkpoint(checkpoint, is_restart)

	if ( checkpoint == MISSION_START_CHECKPOINT ) then

		set_unrecruitable_flag(CHAR_GAT, true)
		on_death("ep02_failure_gat_died", CHAR_GAT)
		on_dismiss("ep02_failure_gat_dismissed", CHAR_GAT)

	elseif ( checkpoint == CHECKPOINT_ULTOR_BASE ) then
		on_death("ep02_failure_gat_died", CHAR_GAT)
		on_dismiss("ep02_failure_gat_dismissed", CHAR_GAT)
	elseif ( checkpoint == CHECKPOINT_BOMBS_PLANTED) then
		on_death("ep02_failure_gat_died", CHAR_GAT)
		on_dismiss("ep02_failure_gat_dismissed", CHAR_GAT)

		on_trigger(	"ep02_open_lab_door", TRIGGER_BASE_LAB_DOOR_1)
		on_trigger(	"ep02_open_lab_door", TRIGGER_BASE_LAB_DOOR_2)
		on_trigger(	"ep02_open_lab_door", TRIGGER_BASE_LAB_DOOR_3)
		trigger_enable(TRIGGER_BASE_LAB_DOOR_1, true)
		trigger_enable(TRIGGER_BASE_LAB_DOOR_2, true)
		trigger_enable(TRIGGER_BASE_LAB_DOOR_3, true)

		teleport_coop(NAV_BOMBS_PLANTED_LOCAL_START, NAV_BOMBS_PLANTED_REMOTE_START)
	end

	if (checkpoint ~= CHECKPOINT_BOMBS_PLANTED) then
		door_lock(MM_BASE_LAB_DOOR_1, true)
		door_lock(MM_BASE_LAB_DOOR_2, true)
		door_lock(MM_BASE_LAB_DOOR_3, true)
	end
end

function ep02_district_changed(player, new_district_name, prev_district_name)

	local timer = PLAYER_TIMER[player]
	local sync = PLAYER_SYNC[player]

	-- If we've entered the row
	if ( new_district_name == SAINTS_ROW_DISTRICT_NAME ) then

		Saints_row_reached[player] = true
		-- Tell this player to get their Ultor notoriety up to 4.
		if ( not (notoriety_get("Police") == 4)) then
			mission_help_table(TEXT_ULTOR_NOTORIETY, "", "", sync)
		end

		-- Update the ui and don't allow notoriety to decay
		hud_timer_stop(timer)
		Timing_out_of_row[player] = false
		district_set_pulsing( SAINTS_ROW_DISTRICT_NAME, false, sync)
		marker_remove_navpoint(NAV_SAINTS_ROW, sync)
		mission_waypoint_remove(sync)
		notoriety_set_can_decay(false)
	end

	-- If we were in the row and we left
	if (	(Saints_row_reached[player] == true) and 
			(new_district_name ~= SAINTS_ROW_DISTRICT_NAME) and
			(not Timing_out_of_row[player])
		) then

		-- Update the UI
		district_set_pulsing( SAINTS_ROW_DISTRICT_NAME, true, sync)
		marker_add_navpoint(NAV_SAINTS_ROW, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, sync)
		mission_waypoint_add(NAV_SAINTS_ROW, sync)	
		notoriety_set_can_decay(true)
		Timing_out_of_row[player] = true

		-- Tell the player to get back to the Row, start a timer.
		hud_timer_set(timer, OUT_OF_ROW_TIME_MS,"ep02_failure_out_of_row", false, sync)
		mission_help_table_nag(TEXT_RETURN_SAINTS_ROW, "", "", sync)
	end

end

function ep02_piss_off_the_ultor()

	-- Make the district pulse, add destination to the minimap.
   district_set_pulsing( SAINTS_ROW_DISTRICT_NAME, true, SYNC_ALL )
	marker_add_navpoint(NAV_SAINTS_ROW, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION, SYNC_ALL)
	mission_waypoint_add(NAV_SAINTS_ROW, SYNC_ALL)	

	 -- Set up district-tracking callbacks
	if ( IN_COOP ) then
		on_district_changed( "ep02_district_changed", REMOTE_PLAYER )
	end
	on_district_changed( "ep02_district_changed", LOCAL_PLAYER )

	-- Tell the player(s) to head to Saints Row
	mission_help_table(TEXT_GO_TO_SAINTS_ROW)

	-- Wait for either player to enter saint's row
	while ( not (Saints_row_reached[LOCAL_PLAYER] or Saints_row_reached[REMOTE_PLAYER]) ) do
		thread_yield()
	end

	-- Up the number of desired Ultor when their notoriety reaches 2.
	while( notoriety_get("Police") < 2) do
		thread_yield()
	end
	local num_vehicles = Ultor_notoriety_vehicles
	if (IN_COOP) then
		num_vehicles = Ultor_notoriety_vehicles_coop
	end
	notoriety_set_desired_vehicle_count("Ultor", num_vehicles)
	notoriety_set_desired_vehicle_count("Police", num_vehicles)
	gang_force_spawn("Ultor", true)

	-- Wait for Ultor notoriety to reach 4.
	while( notoriety_get("Police") < 4) do
		thread_yield()
	end

	-- Eliminate district change callbacks
	if ( IN_COOP ) then
		on_district_changed( "", REMOTE_PLAYER )
	end
	on_district_changed( "", LOCAL_PLAYER )

	-- Reset notoriety spawning
	notoriety_set_desired_vehicle_count("Ultor", -1)
	notoriety_set_desired_vehicle_count("Police", -1)
	gang_force_spawn("Ultor", false)
	notoriety_set_can_decay(true)

	-- Make sure that timers are stopped, district is not pulsing
	hud_timer_stop(PLAYER_TIMER[LOCAL_PLAYER])
	hud_timer_stop(PLAYER_TIMER[REMOTE_PLAYER])
	district_set_pulsing( SAINTS_ROW_DISTRICT_NAME, false, SYNC_ALL)
	marker_remove_navpoint(NAV_SAINTS_ROW, SYNC_ALL)
	mission_waypoint_remove(SYNC_ALL)

	-- Send the players to the ultor base
	ep02_enter_ultor_base()

end

function ep02_enter_ultor_base()

	-- Send the players to the ultor base's secret entrance, but require them to have 0 notoriety.
	ep02_send_to_location(	TRIGGER_NEAR_BASE_ENTRANCE, 
									INGAME_EFFECT_VEHICLE_LOCATION, 
									TEXT_GO_TO_BASE,
									true, 
									{	{ep02_prereq_low_notoriety, TEXT_NOTORIETY_ZERO},
									}
								)

	-- Breadcrumb down to the base proper
	ep02_breadcrumb_to_location(	TRIGGERS_BASE_ENTRY_BREADCRUMBS, INGAME_EFFECT_LOCATION, TEXT_MEET_GAT)
	--mesh_mover_reset_to_action_end(MM_BASE_TUNNEL_DOOR, "start1")
	
	--check to make sure Player's notoriety is less than 2
	local notoriety_low = (notoriety_get_decimal("Police") < 2)
	
	if (notoriety_low == true) then
		set_unrecruitable_flag(CHAR_GAT, false)
		party_add(CHAR_GAT)
		on_death("ep02_failure_gat_died", CHAR_GAT)
		on_dismiss("ep02_failure_gat_dismissed", CHAR_GAT)
	
		-- If Gat is told to follow the client, it could be awhile before he actually
		-- joins the party. Don't create a checkpoint until he's actually added or he
		-- won't be recreated when restarting from the checkpoint.
		while(not npc_is_in_party(CHAR_GAT)) do
			thread_yield()
		end
		mission_set_checkpoint(CHECKPOINT_ULTOR_BASE)
		ep02_ultor_base()
	end
	
end

Bombs_planted = 0
function ep02_ultor_base()

	-- Breadcrumb to the keys
	ep02_breadcrumb_to_location(	TRIGGERS_KEY_BREADCRUMBS, INGAME_EFFECT_LOCATION, TEXT_GET_KEY)
	group_create(GROUP_ULTOR_BASE, true)
	on_pickup("ep02_elevator_keys_acquired", ITEM_ELEVATOR_KEYS)

	group_create_hidden(GROUP_BOMBS, true)

	while (not Elevator_keys_acquired) do
		thread_yield()
	end

	trigger_enable(TRIGGER_BASE_LAB_DOOR_1, true)
	trigger_enable(TRIGGER_BASE_LAB_DOOR_2, true)
	trigger_enable(TRIGGER_BASE_LAB_DOOR_3, true)
	on_trigger(	"ep02_open_lab_door", TRIGGER_BASE_LAB_DOOR_1)
	on_trigger(	"ep02_open_lab_door", TRIGGER_BASE_LAB_DOOR_2)
	on_trigger(	"ep02_open_lab_door", TRIGGER_BASE_LAB_DOOR_3)

	mission_help_table(TEXT_DESTROY_LABS)

	for i, bomb_trigger in pairs(TRIGGERS_BOMBS) do
		marker_add_trigger(bomb_trigger, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)
		trigger_enable(bomb_trigger, true)
		on_trigger("ep02_plant_bomb", bomb_trigger)
	end

	local num_bombs = sizeof_table(TRIGGERS_BOMBS)
	while(Bombs_planted < num_bombs) do 
		thread_yield()
	end

	mission_set_checkpoint(CHECKPOINT_BOMBS_PLANTED)
	ep02_escape()
end

function ep02_plant_bomb(triggerer, trigger)

	local trigger_to_bomb = 
		{
			["ep02_$t000"] = "ep02_$i003",
			["ep02_$t009"] = "ep02_$i002",
			["ep02_$t010"] = "ep02_$i004",
		}

	-- Disable trigger, remove markers
	on_trigger("", trigger)
	trigger_enable(trigger, false)
	marker_remove_trigger(trigger, SYNC_ALL)

	-- Make sure that player can't be damaged/moved while planting the bomb
	turn_invulnerable(triggerer, false)
	character_prevent_explosion_fling(triggerer, true)

	-- Take over player controls
	player_controls_disable(triggerer)
	inv_weapon_enable_or_disable_all_slots(false, PLAYER_SYNC[triggerer])

	-- Make sure that the player is crouching
	local crouch_forced = false
	if not crouch_is_crouching(triggerer) then
		crouch_start(triggerer)
		crouch_forced = true
		delay(1)
	end

	-- Play the bomb planting animation and sound
	set_animation_state(triggerer, "crouch plant bomb")				
	local bomb_planting_audio = audio_play_for_navpoint("SFX_DON_BOMBPLANTING", trigger, "foley")
	delay(1)
	audio_stop(bomb_planting_audio)
	audio_play_for_navpoint("SFX_DON_BOMBPLANTED", trigger, "foley")

	-- Return player to normal
	clear_animation_state(triggerer)
	if crouch_forced then
		crouch_stop(triggerer)
	end		
	inv_weapon_enable_or_disable_all_slots(true, PLAYER_SYNC[triggerer])
	player_controls_enable(triggerer)
	character_prevent_explosion_fling(triggerer, false)
	turn_vulnerable(triggerer)

	item_show(trigger_to_bomb[trigger])
	Bombs_planted = Bombs_planted + 1

end

function ep02_open_lab_door(triggerer, trigger)

	on_trigger("", trigger)
	trigger_enable(trigger, false)

	local trigger_to_door = 
		{
			[TRIGGER_BASE_LAB_DOOR_1] = MM_BASE_LAB_DOOR_1,
			[TRIGGER_BASE_LAB_DOOR_2] = MM_BASE_LAB_DOOR_2,
			[TRIGGER_BASE_LAB_DOOR_3] = MM_BASE_LAB_DOOR_3,
		}

	local mm_door = trigger_to_door[trigger]
	door_open(mm_door)
	--mesh_mover_play_action(mm_door, "start1")
	--delay(2.0)
	--mesh_mover_hide(mm_door)

end

function ep02_cutscene()

	hud_timer_pause(0, true)

	for i,cte_trigger in pairs(TRIGGER_CTES) do
		on_trigger("", cte_trigger)
		trigger_enable(cte_trigger, false)
	end

	marker_remove_navpoint(NAV_WASTE_TUNNEL, SYNC_ALL)

	mission_start_fade_out(0.0)
	cutscene_play("IG_ep02_scene1", "", {NAV_CUTSCENE_LOCAL_START, NAV_CUTSCENE_REMOTE_START}, false)
	mesh_mover_reset_to_action_end(MM_BASE_ESCAPE_DOOR, "start1")
	group_destroy(GROUP_CTE)
	
	mission_start_fade_in()
	Cutscene_triggered = true
	hud_timer_pause(0, false)
	
end

Cutscene_triggered = false
function ep02_escape()

	for i,cte_trigger in pairs(TRIGGER_CTES) do
		on_trigger("ep02_cutscene", cte_trigger)
		trigger_enable(cte_trigger, true)
	end

	on_trigger("", TRIGGER_WRONG_EXIT_WARNING)
	trigger_enable(TRIGGER_WRONG_EXIT_WARNING, false)
	trigger_set_delay_between_activations(TRIGGER_WRONG_EXIT_WARNING,0)

	on_trigger("", TRIGGER_WRONG_EXIT_FAIL)
	trigger_enable(TRIGGER_WRONG_EXIT_FAIL, false)


	audio_play_for_navpoint("SFX_ALARM_5", NAV_ALARM_SOURCES, "foley")
	
	city_chunk_set_all_civilians_fleeing("sr2_UG_chunk095_UB01", true)
	city_chunk_set_all_civilians_fleeing("sr2_UG_chunk095_UB02", true)
		
	hud_timer_set(0, 105000, "ep02_failure_bomb_timer", true)

	marker_add_navpoint(NAV_WASTE_TUNNEL, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)
	mission_help_table(TEXT_GET_OUT)

	group_create_hidden(GROUP_ESCAPE, true)

	while(not Cutscene_triggered) do
		thread_yield()
	end
	
	-- Eanble the wrong exit triggers
	on_trigger("ep02_wrong_exit_warning", TRIGGER_WRONG_EXIT_WARNING)
	trigger_enable(TRIGGER_WRONG_EXIT_WARNING, true)

	on_trigger("ep02_failure_wrong_exit", TRIGGER_WRONG_EXIT_FAIL)
	trigger_enable(TRIGGER_WRONG_EXIT_FAIL, true)

	audio_play_for_navpoint("SFX_ALARM_5", NAV_ALARM_SOURCES, "foley")
	city_chunk_set_all_civilians_fleeing("sr2_UG_chunk095_UB01", true)
	city_chunk_set_all_civilians_fleeing("sr2_UG_chunk095_UB02", true)

	group_show(GROUP_ESCAPE)
--	set_unjackable_flag(VEH_APC, true)

	mission_help_table(TEXT_GET_OUT)
	delay(2)
	marker_add_vehicle(VEH_APC, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_INTERACT, SYNC_ALL)

	while not character_is_in_vehicle(LOCAL_PLAYER, VEH_APC) do
		thread_yield()
	end
	while (IN_COOP and (not character_is_in_vehicle(REMOTE_PLAYER, VEH_APC)) ) do
		thread_yield()
	end
	
	marker_remove_vehicle(VEH_APC, SYNC_ALL)

	local function all_characters_in_vehicle()
		if (not character_is_in_vehicle(LOCAL_PLAYER, VEH_APC)) then
			return false
		end
		if ( IN_COOP and (not character_is_in_vehicle(REMOTE_PLAYER, VEH_APC)) ) then
			return false
		end
		if ( character_is_dead(CHAR_GAT) or (not character_is_in_vehicle(CHAR_GAT)) ) then
			return false
		end
		return true
	end

	while not (all_characters_in_vehicle() and get_dist_char_to_nav(LOCAL_PLAYER, NAV_ESCAPE_FINISH) <= 5) do
		thread_yield()
	end

	hud_timer_stop(0)

	ep02_success_base_escaped()
end

Wrong_exit_warning_played = {[LOCAL_PLAYER] = false, [REMOTE_PLAYER] = false}

function ep02_wrong_exit_warning(triggerer)
	if(not Wrong_exit_warning_played[triggerer]) then
		mission_help_table_nag(TEXT_WARN_WRONG_EXIT, "", "", PLAYER_SYNC[triggerer])
		Wrong_exit_warning_played[triggerer] = true
	end
end

function ep02_elevator_keys_acquired()
	on_pickup("", ITEM_ELEVATOR_KEYS)
	Elevator_keys_acquired = true
	notoriety_set_max("Police",3)
	notoriety_set_min("Police",3)
end

function ep02_prereq_low_notoriety()

	-- Is notoriety above 1?
	local notoriety_low = (notoriety_get_decimal("Police") < 2)

	-- Updates the gps of one player
	local function update_confessional_gps(player)

		if(not notoriety_low) then
			local new_confessional = confessionals_get_nearest_trigger(player)
			ep02_update_waypoint(new_confessional, player)
		end

	end

	-- Update both players' gps
	update_confessional_gps(LOCAL_PLAYER)
	if (IN_COOP) then
		update_confessional_gps(REMOTE_PLAYER)
	end

	-- Return true if the prereq is met, false else
	return notoriety_low

end

Gps_waypoint = {[LOCAL_PLAYER] = "", [REMOTE_PLAYER] = ""}
function ep02_update_waypoint(waypoint, player)
	if(Gps_waypoint[player] ~= waypoint) then
		
		Gps_waypoint[player] = waypoint
		mission_waypoint_remove(PLAYER_SYNC[player])
		
		if(waypoint ~= "") then
			mission_waypoint_add(waypoint, PLAYER_SYNC[player])
		end
		
	end
end

ep02_location_reached			= false
function ep02_send_to_location(trigger, effect, helptext, use_waypoint, prereq_list, time, time_failure_function)

	-- Location not yet reached
	ep02_location_reached = false

	-- enable the trigger, add a minimap icon, glow effect, and callback
	trigger_enable(trigger,true)
	marker_add_trigger(trigger,MINIMAP_ICON_LOCATION,effect)
	on_trigger("ep02_toggle_location_reached",trigger)

	-- Maybe add waypoint
	if (use_waypoint) then
		ep02_update_waypoint(trigger, LOCAL_PLAYER)
		if(IN_COOP) then
			ep02_update_waypoint(trigger, REMOTE_PLAYER)
		end
	end

	-- Maybe add failure function
	if (time and time_failure_function) then
		hud_timer_set(1, time, time_failure_function)
	end

	-- wait for player(s) to arrive
	local initial_pass = true
	local failed_prereq = 0
	while (not ep02_location_reached) do

		-- Maybe check to see if player needs to do something else before heading to location
		if(prereq_list ~= nil) then

			local new_failed_prereq = 0

			-- Prereqs are listed in order of importance, so we can't use pairs()
			for i=1, sizeof_table(prereq_list), 1 do

				local prereq_function = prereq_list[i][1]
				local prereq_helptext = prereq_list[i][2]

				if(not prereq_function()) then

					-- If we just began failing the prereq...
					if ( i ~= failed_prereq ) then

						-- Eliminate any leftover waypoints from lower-priority prereqs failing
						ep02_update_waypoint( "", LOCAL_PLAYER)
						if (IN_COOP) then
							ep02_update_waypoint( "", REMOTE_PLAYER)
						end

						--Disable destination location
						if(failed_prereq == 0) then
							trigger_enable(trigger,false)
							marker_remove_trigger(trigger)
						end

						-- Tell the player what they need to do
						if( prereq_helptext ) then
							mission_help_table(prereq_helptext)
						end
					end

					-- We don't need to check any more prereqs
					new_failed_prereq = i
					break;

				end -- Ends prereq function fulfillment
			end -- Ends loop over prereqs

			-- If the players weren't meeting prereqs and now they are then reenable the destination
			if ( (new_failed_prereq == 0) and (failed_prereq ~= 0) ) then
	
				ep02_update_waypoint( "", LOCAL_PLAYER)
				if (IN_COOP) then
					ep02_update_waypoint( "", REMOTE_PLAYER)
				end

				-- Reenable trigger, add minimap location and waypoint
				trigger_enable(trigger,true)
				marker_add_trigger(trigger,MINIMAP_ICON_LOCATION,effect,SYNC_ALL)
				if (use_waypoint) then
					ep02_update_waypoint( trigger, LOCAL_PLAYER)
					if (IN_COOP) then
						ep02_update_waypoint( trigger, REMOTE_PLAYER)
					end
				end

				-- Remind players what the original goal was
				if (helptext) then
					mission_help_table(helptext)
				end

			-- On the initial pass, if no prereqs were failed then display the helptext
			elseif( new_failed_prereq == 0 and initial_pass) then
				if (helptext) then
					mission_help_table(helptext)
				end
			end

			failed_prereq = new_failed_prereq

		end -- Ends prereq list processing

		initial_pass = false

		thread_yield()
	end

	-- Maybe turn off timer
	if (time and time_failure_function) then
			hud_timer_stop(1)
	end
end

function ep02_toggle_location_reached(triggerer,trigger)
	ep02_location_reached = true		
	trigger_enable(trigger, false)
	marker_remove_trigger(trigger, SYNC_ALL)
	on_trigger("",trigger)
	ep02_update_waypoint("", LOCAL_PLAYER)
	if (IN_COOP) then
		ep02_update_waypoint("", REMOTE_PLAYER)
	end
end

Ep02_final_breadcrumb_reached	= false
Ep02_current_breadcrumb			= 1
Ep02_breadcrumb_triggers		= {}
Ep02_breadcrumb_helptext		= {}
Ep02_breadcrumb_effect			= ""
function ep02_breadcrumb_to_location(trigger, effect, helptext, time, time_failure_function)

	Ep02_final_breadcrumb_reached = false
	Ep02_breadcrumb_effect = false
	if (effect) then
		Ep02_breadcrumb_effect = effect
	end
	Ep02_current_breadcrumb = 1
	Ep02_breadcrumb_triggers = {}
	Ep02_breadcrumb_helptext = {}

	-- Place triggers into a global table variable
	if ((type(trigger) == "table")) then
		Ep02_breadcrumb_triggers = trigger
	else
		Ep02_breadcrumb_triggers[1] = trigger
	end

	-- Same for helptext
	if ((type(helptext) == "table")) then
		Ep02_breadcrumb_helptext = helptext
	else
		Ep02_breadcrumb_helptext[1] = helptext
	end

	-- Add callbacks for all triggers, special callback for final trigger
	local num_breadcrumbs = sizeof_table(Ep02_breadcrumb_triggers)
	for i,breadcrumb in pairs(Ep02_breadcrumb_triggers) do
		trigger_enable(breadcrumb,true)
		if (i == num_breadcrumbs) then
			on_trigger("ep02_final_breadcrumb_triggered",breadcrumb)					
		else
			on_trigger("ep02_breadcrumb_reached", breadcrumb)
		end
	end

	if (effect) then
		marker_add_trigger(Ep02_breadcrumb_triggers[Ep02_current_breadcrumb],MINIMAP_ICON_LOCATION,effect,SYNC_ALL)
		mission_waypoint_add( Ep02_breadcrumb_triggers[Ep02_current_breadcrumb], SYNC_ALL )
	end

	-- Setup the time restraint if there is one.
	if (time and time_failure_function) then
		hud_timer_set(0, time, time_failure_function)
	end

	-- Display helptext
	if (Ep02_breadcrumb_helptext[1]) then
		mission_help_table(Ep02_breadcrumb_helptext[1])
	end

	-- Wait for player to arrive at the location
	while (not Ep02_final_breadcrumb_reached) do
		thread_yield()
	end
	hud_timer_stop(0)

	Ep02_final_breadcrumb_reached = false
end

function ep02_breadcrumb_reached(triggerer, trigger)

	-- Disable all breadcrumbs up to and including the one that we just hit
	for i = Ep02_current_breadcrumb, sizeof_table(Ep02_breadcrumb_triggers), 1 do
		local breadcrumb = Ep02_breadcrumb_triggers[i]
		trigger_enable(breadcrumb,false)
		on_trigger("",trigger)
		marker_remove_trigger(trigger, SYNC_ALL)
		Ep02_current_breadcrumb = i+1
		if(Ep02_breadcrumb_triggers[i] == trigger) then
			break
		end
	end

	-- Display helptext for the just-hit trigger.
	if (Ep02_breadcrumb_helptext[trigger]) then
		mission_help_table(Ep02_breadcrumb_helptext[trigger])
	end

	mission_waypoint_remove()

	-- Add an effect to the next trigger
	if (Ep02_breadcrumb_effect) then
		marker_add_trigger(Ep02_breadcrumb_triggers[Ep02_current_breadcrumb],MINIMAP_ICON_LOCATION,Ep02_breadcrumb_effect,SYNC_ALL)
		mission_waypoint_add( Ep02_breadcrumb_triggers[Ep02_current_breadcrumb], SYNC_ALL )
	end
end

function ep02_final_breadcrumb_triggered(triggerer,trigger)

	-- disable all breadcrumb triggers
	for i = Ep02_current_breadcrumb, sizeof_table(Ep02_breadcrumb_triggers), 1 do
		local breadcrumb = Ep02_breadcrumb_triggers[i]
		trigger_enable(breadcrumb,false)
		on_trigger("",trigger)
		marker_remove_trigger(trigger, SYNC_ALL)
	end

	Ep02_final_breadcrumb_reached = true		

	mission_waypoint_remove()
end

function ep02_failure_out_of_row()
	mission_end_failure("ep02", TEXT_FAIL_OUT_OF_ROW)
end

function ep02_failure_bomb_timer()
	hud_bar_off(0)
	mission_end_failure("ep02", TEXT_DIDNT_ESCAPE)
end

function ep02_failure_gat_dismissed()
	mission_end_failure("ep02", TEXT_GAT_DIED)
end

function ep02_failure_gat_died()
	mission_end_failure("ep02", TEXT_GAT_DIED)
end

function ep02_failure_wrong_exit()
	mission_end_failure("ep02", TEXT_FAIL_WRONG_EXIT)
end

function ep02_success_base_escaped()
	mission_end_success("ep02", "tsse02-02")
end

function ep02_cleanup()

	IN_COOP = coop_is_active()

	-- Reenable the teleport triggers that take the player into and out of the Ultor base
	trigger_enable(TRIGGER_BASE_TELEPORT_ENTER, true)
	trigger_enable(TRIGGER_BASE_TELEPORT_EXIT, true)

	-- Allow players to summon Gat normally if he's been unlocked.
	homie_mission_unlock("Johnny_Gat")

	inv_weapon_enable_or_disable_all_slots(true, SYNC_ALL)
	turn_vulnerable(LOCAL_PLAYER)
	clear_animation_state(LOCAL_PLAYER)
	if (IN_COOP) then
		turn_vulnerable(REMOTE_PLAYER)
		clear_animation_state(REMOTE_PLAYER)
	end

	-- Cleanup mission here
	group_destroy(GROUP_ULTOR_BASE)

	-- Cleanup notoriety changes
	notoriety_set_desired_vehicle_count("Ultor", -1)
	notoriety_set_desired_vehicle_count("Police", -1)
	gang_force_spawn("Ultor", false)
	notoriety_set_can_decay(true)

	-- Cleanup UI
	hud_timer_stop(PLAYER_TIMER[LOCAL_PLAYER])
	hud_timer_stop(PLAYER_TIMER[REMOTE_PLAYER])
	district_set_pulsing( SAINTS_ROW_DISTRICT_NAME, false, SYNC_ALL)
	marker_remove_navpoint(NAV_SAINTS_ROW, SYNC_ALL)
	mission_waypoint_remove(SYNC_ALL)
	marker_remove_navpoint(NAV_WASTE_TUNNEL)
	if (vehicle_exists(VEH_APC) ) then
		marker_remove_vehicle(VEH_APC)
	end
	for i, bomb_trigger in pairs(TRIGGERS_BOMBS) do
		marker_remove_trigger(bomb_trigger)
	end
	for i, trigger in pairs(TRIGGERS_BASE_ENTRY_BREADCRUMBS) do
		marker_remove_trigger(trigger)
	end
	for i, trigger in pairs(TRIGGERS_KEY_BREADCRUMBS) do
		marker_remove_trigger(trigger)
	end
	marker_remove_trigger(TRIGGER_NEAR_BASE_ENTRANCE)

	persona_override_character_stop(CHAR_GAT, POT_SITUATIONS[POT_ATTACK])
	persona_override_character_stop(CHAR_GAT, POT_SITUATIONS[POT_TAKE_DAMAGE])

	trigger_enable(TRIGGER_ELEVATOR, true)

	 -- Remove district-tracking callbacks
	if ( IN_COOP ) then
		on_district_changed( "", REMOTE_PLAYER )
	end
	on_district_changed( "", LOCAL_PLAYER )

end

function ep02_success()
	-- Called when the mission has ended with success
	--bink_play_movie(CUTSCENE_OUT)

	-- Post the news event
	radio_post_event("JANE_NEWS_TSSE02", true)
end
