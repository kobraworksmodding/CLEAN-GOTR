
FREE_CLOTHING_NAME					= "parachute suit"
FREE_CLOTHING_WEAR_OPTION			= "cmSui_uJumpSui01.cmeshx"
FREE_CLOTHING_VARIANT_NAME			= "07 - Default"

doors = {"coop_test_FrontDoor1", "coop_test_FrontDoor2", "coop_test_DoorToBack","coop_test_DoorToCas1A", "coop_test_DoorToCas2B", "coop_test_ExitCas1A", "coop_test_ExitCas1B", "coop_test_DoorToJail", "coop_test_CellDoor", "coop_test_DoorCas2B", "coop_test_DoorToCas2B", "coop_test_ExitCas2", "coop_test_GaurdDoor"}

Time = 0

function coop_test_start( checkpoint_name )
	set_mission_author("Russell Aasland")

	if (checkpoint_name == MISSION_START_CHECKPOINT) then
		fade_in( 0 )

		group_create( "coop_test_$G000_ghosting" )
		set_max_hit_points( "coop_test_$c000", 1500 )
		damage_indicator_on(0,"coop_test_$c000",0.0, "rn10_hud_akuji_health")
		
		teleport( LOCAL_PLAYER, "sr2_city_coop_test_mission" )
		
		if (coop_is_active()) then
			teleport( REMOTE_PLAYER, "sr2_city_coop_test_mission" )
		end
		
		on_pickup( "coop_test_checkpoint1", "coop_test_satchel" )
		
		--set_ignore_ai_flag( "coop_test_$c000", true )
		
		--vehicle_enter_group_teleport( "coop_test_$c001", "coop_test_$c002", "coop_test_$v001" )
	end
	
	mission_debug( checkpoint_name, 0, 0 )
	
	on_vehicle_enter( "coop_test_checkpoint2", LOCAL_PLAYER )
	
	mission_help_table( "bh09_next_wave", 10 )
end

DEFAULT_ENTER_UG_MALL_TRIGGER = "highend_$t-ug-mall-elevator-out"
DEFAULT_LEAVE_UG_MALL_TRIGGER = "highend_$t-ug-mall-elevator-in"
function coop_trigger_disable_test( )
	trigger_enable( DEFAULT_ENTER_UG_MALL_TRIGGER, false )
	trigger_enable( DEFAULT_LEAVE_UG_MALL_TRIGGER, false )
	trigger_type_enable("clothing store", false)
end
function coop_trigger_enable_test( )
	trigger_enable( DEFAULT_ENTER_UG_MALL_TRIGGER, true )
	trigger_enable( DEFAULT_LEAVE_UG_MALL_TRIGGER, true )
	trigger_type_enable("clothing store", true)
end

function coop_kill_followers()
	character_kill( "coop_test_$c001" )
	character_kill( "coop_test_$c002" )
end

function coop_cash_add()
	cash_add( 100000, REMOTE_PLAYER )
end

function coop_cash_remove()
	cash_remove( 100000, REMOTE_PLAYER )
end

function coop_players_warp()
	teleport_coop( "coop_test_$n002", "coop_test_$n003" )
	
	coop_test_timer()
end

function coop_cellphone_test()
	mid_mission_phonecall( "coop_test_checkpoint3" )
end

function coop_test_doors_open()
	for k,v in doors do
		door_open( v )
	end
end

function coop_test_doors_hide()
	for k,v in doors do
		mesh_mover_hide( v )
	end
end

function coop_test_doors_show()
	for k,v in doors do
		mesh_mover_show( v )
	end
end

function coop_test_warp_test()
	teleport( LOCAL_PLAYER, "coop_test_$c001" )
	
	while (teleport_check_done(LOCAL_PLAYER) == false) do
		thread_yield()
	end
	
	coop_test_timer()
end

function coop_mover_hide_test()
	door_lock( "coop_test_FrontDoor1", true );
	door_lock( "coop_test_FrontDoor2", true );
	mesh_mover_hide( "coop_test_FrontDoor1" );
	mesh_mover_hide( "coop_test_FrontDoor2" );
end

function coop_objective_local()
	objective_text( 0, "ss06_samedi_gang_members_killed", 1, "", SYNC_LOCAL )
end

function coop_objective_remote()
	objective_text( 0, "ss06_samedi_gang_members_killed", 2, "", SYNC_REMOTE )
end

function coop_objective_all()
	objective_text( 0, "ss06_samedi_gang_members_killed", 3, "", SYNC_ALL )
end

function coop_help_text()
	mission_help_table( "ss06_samedi_gang_members_killed", 3, "", SYNC_ALL )
end

function coop_unhide_test()
	group_show( "coop_test_$G000_ghosting" )
end

function coop_give()
	group_give_to_client( "coop_test_$G000_ghosting" )
end

function coop_test_heli_pathfind()
	helicopter_fly_to_direct( "coop_test_$v001", 45, "coop_test_$n005", "coop_test_$n004" )
end

function coop_test_ragdoll_entry()
	character_ignite( LOCAL_PLAYER, true )
	delay( 1 )
	vehicle_enter_group_teleport( REMOTE_PLAYER, LOCAL_PLAYER, "coop_test_$v001" )
end

function coop_test_mission_win_cutscene()
	mission_end_success( "coop_test", "mayhem_nukeplant" )
end

function coop_test_mover_reset()
	mesh_mover_reset( "coop_test_gazebo" )
end

function coop_test_hud_bar()
	local value = 100

	hud_bar_on( 0, "Health", "rn07_hud_gat_health", value )
	
	while (true) do
		delay( .25 )
		
		value = value - 10
		hud_bar_set_value( 0, value )
		
		if (value == 0) then
			value = 100
		end
	end
end

function coop_test_timer()
	hud_timer_set( 0, 30000 )
end

function coop_test_weapon_give()
	inv_item_add( "ar50_launcher", 100, REMOTE_PLAYER, true );
end

function coop_test_action_node()
	npc_use_closest_action_node_of_type( "coop_test_$c000", "Hammerer", 100 )
end

function coop_test_pause_menu_objective( )
	mission_help_table("bh01_escape_caverns")
end

function coop_test_add_follower( )
	party_add( "coop_test_$c000", REMOTE_PLAYER );
	set_ignore_ai_flag( "coop_test_$c000", false )
end

function coop_test_add_objective()
	objective_text(0, "rss01_objective", 4, 8, SYNC_ALL)
end

function coop_test_remove_objective()
	objective_text_clear(0)
end

function coop_test_cleanup()
	finishers_disable()
	coop_test_doors_show()
	on_vehicle_enter( "", LOCAL_PLAYER )
end

function coop_test_global()
	finishers_enable()
end

function coop_test_game_time()
	Time = get_game_time()
end

function coop_test_mark_local( )
	vehicle_mark_as_players( "coop_test_$v000", LOCAL_PLAYER )
end

function coop_test_mark_remote( )
	vehicle_mark_as_players( "coop_test_$v000", REMOTE_PLAYER )
end

function coop_test_disable_slot( )
	inv_weapon_disable_slot( WEAPON_SLOT_SHOTGUN, true, SYNC_REMOTE )
end

function coop_test_disable_all_but_slot( )
	inv_weapon_disable_all_but_this_slot( WEAPON_SLOT_PISTOL, SYNC_REMOTE )
end

function coop_test_enable_all( )
	inv_weapon_enable_or_disable_all_slots( true, SYNC_REMOTE )
end

function coop_test_group_entry( )
	vehicle_enter_group_teleport( "coop_test_$c000", "coop_test_$c001", "coop_test_$c002", "coop_test_$v000" )
end

function coop_test_current1()
	objective_text(1, "bh07_store_damage_meter", 5, "", SYNC_REMOTE)
end

function coop_test_current2()
	objective_text_clear(1)
end

function coop_test_success()
	set_ignore_ai_flag( "coop_test_$c000", true )
	set_ignore_ai_flag( "coop_test_$c001", true )
	set_ignore_ai_flag( "coop_test_$c002", true )
end

function coop_test_checkpoint1( )
	mission_set_checkpoint( "cp alpha" )
end

function coop_test_checkpoint2( )
	mission_set_checkpoint( "cp beta" )
end

function coop_test_checkpoint3( )
	mission_set_checkpoint( "cp charlie" )
end

function coop_test_vehicle_flag( )
	set_player_can_enter_exit_vehicles( "#PLAYER1#", true )
end

function coop_test_lock_vehicle( )
	set_unjackable_flag( "coop_test_$v000", true )
	set_unjackable_flag( "coop_test_$v001", true )
end

	PLANT_BOMB_MAX_DISTANCE =	3.0		-- Maximum distance from car center to keep planting bomb
	STATE_PLANT_BOMB =			"crouch plant bomb"		-- Bomb planting animation state
function coop_test_pathfind( )
	--while (true) do
	--	move_to( "coop_test_$c002", "coop_test_$n000", "coop_test_$n001", 2 )
	--end
	local donnie = "coop_test_$c002"
	local Current_bomb_target = "coop_test_$v000"
	local Current_target_seat = 0
	
	while true do
		thread_yield()
		if get_dist(donnie, Current_bomb_target) > PLANT_BOMB_MAX_DISTANCE or not check_animation_state(donnie, STATE_PLANT_BOMB) then
			if crouch_is_crouching(donnie) then
				crouch_stop(donnie)
			end		
			move_to_vehicle_entry_point(donnie, Current_bomb_target, Current_target_seat, 3, true)
			crouch_start(donnie)
			delay(1)
			set_animation_state(donnie, STATE_PLANT_BOMB)
		else
			if not crouch_is_crouching(donnie) then
				crouch_start(donnie)
				delay(1)
			end

			if not check_animation_state(donnie, STATE_PLANT_BOMB) then
				set_animation_state(donnie, STATE_PLANT_BOMB)
			end

		end
	end
	
end

function coop_test_mover1( )
	mesh_mover_play_action( "coop_test_GarDoorPanelA100", "start1" )
end

function coop_test_mover2( )
	mesh_mover_play_action( "coop_test_GarDoorPanelA100", "start2" )
end

Audio_handle = -1
function coop_test_audio_nav( )
	Audio_handle = audio_play_for_navpoint("SFX_ALARM_5", "coop_test_$n000", "foley")
end

function coop_test_audio_char( )
	Audio_handle = audio_play_for_character("SFX_ALARM_5", "coop_test_$c001", "foley")
end

function coop_test_audio_2d( )
	Audio_handle = audio_play( "SFX_ALARM_5", "foley" )
end

function coop_test_audio_stop( )
	audio_stop( Audio_handle )
end

function coop_test_customization_local()
	customization_item_wear(FREE_CLOTHING_NAME,FREE_CLOTHING_WEAR_OPTION,FREE_CLOTHING_VARIANT_NAME, SYNC_LOCAL)
end

function coop_test_customization_remote()
	customization_item_wear(FREE_CLOTHING_NAME,FREE_CLOTHING_WEAR_OPTION,FREE_CLOTHING_VARIANT_NAME, SYNC_REMOTE)
end

function coop_test_revert_local()
	customization_item_revert( SYNC_LOCAL )
end

function coop_test_revert_remote()
	customization_item_revert( SYNC_REMOTE )
end

function coop_test_nav_path( )
	vehicle_enter_group_teleport( "coop_test_$c000", "coop_test_$v000" )

	vehicle_pathfind_to( "coop_test_$v000", {"coop_test_$n000", "coop_test_$n001"}, true, true, false )
end