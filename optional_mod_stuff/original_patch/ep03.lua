-- ep03.lua
-- SR2 mission script
-- 3/28/07

-- Groups --
GROUP_ULTOR_BOATS =		"ep03_$ultor_patrol"
GROUP_WAVECRAFT =			"ep03_$wavecraft"
GROUP_WAVECRAFT_COOP =  "ep03_$wavecraft_coop"
GROUP_ULTOR_EXECS =		"ep03_$ultor_execs"
GROUP_GETAWAY_BOAT =		"ep03_$getaway_boat"
GROUP_FINAL_EXEC =		"ep03_$final_exec"
GROUP_SECURITY =			"ep03_$security"
GROUP_PARTYGOERS =		"ep03_$partygoers"
GROUP_CUTSCENE =			"ep03_$cutscene"
GROUP_HELI_ONE =			"ep03_$heli_one"
GROUP_HELI_TWO =			"ep03_$heli_two"

HELICOPTER_GROUPS =		{ GROUP_HELI_ONE, GROUP_HELI_TWO }

-- Navpoints --
LOCAL_PLAYER_START			= "ep03_$player_start"
REMOTE_PLAYER_START			= "ep03_$remote_start"
NAV_YACHT =						"ep03_$yacht"
NAV_YACHT_ENTRY =				"ep03_$n003"
NAV_ULTOR_PATROL_1 =			"ep03_$patrol_1"
NAV_ULTOR_PATROL_2 =			"ep03_$patrol_2"
NAV_ULTOR_PATROL_3 =			"ep03_$patrol_3"
NAV_ULTOR_PATROL_4 =			"ep03_$patrol_4"
NAV_ULTOR_SAFETY =			"ep03_$n000"
NAV_ULTOR_SAFETY_HALFWAY = "ep03_$n001"
NAV_ULTOR_SAFETY_START =	"ep03_$n004"
NAV_PATROL =					{"ep03_$n005", "ep03_$n007", "ep03_$n009", "ep03_$n011", 
									"ep03_$n013", "ep03_$n015", "ep03_$n017",	"ep03_$n019", 
									"ep03_$n021",  "ep03_$n023",  "ep03_$n025", "ep03_$n027"}
YACHT_PATROL_PATHS = { "ep03_$Yacht_Patrol_01", "ep03_$Yacht_Patrol_02",
							  "ep03_$Yacht_Patrol_03", "ep03_$Yacht_Patrol_04" }

NAV_HELI_WARP =	"ep03_$heli_attack_player_warp"

NEAR_WAVECRAFT = "ep03_$Near_Wavecraft"
NEAR_WAVECRAFT_REMOTE_PLAYER = "ep03_$Near_Wavecraft_Remote"

-- Characters --
TABLE_ULTOR_EXECS =				{ "ep03_$c001", "ep03_$c002", "ep03_$c003", "ep03_$c008", "ep03_$c009" }
TABLE_ULTOR_SECURITY =			{ "ep03_$c011", "ep03_$c012", "ep03_$c013", "ep03_$c014", "ep03_$c015", "ep03_$c016", "ep03_$c017", "ep03_$c019",
										  "ep03_$c020", "ep03_$c021", "ep03_$c023", "ep03_$c024", "ep03_$c025", "ep03_$c026", "ep03_$c027", "ep03_$c028"	}
TABLE_PARTY_GOERS =				{ "ep03_$c029", "ep03_$c030", "ep03_$c031", "ep03_$c032", "ep03_$c033", "ep03_$c034" }
TABLE_ULTOR_GETAWAY_PARTY =	{ "ep03_$c010", "ep03_$c000" }
CHAR_FINAL_EXEC =					"ep03_$c000"
CHAR_ULTOR_PATROL =				{ "ep03_$c004", "ep03_$c005", "ep03_$c006", "ep03_$c007" }
CHAR_HELI_PILOTS =				{ {"ep03_$Pilot1_1", "ep03_$Pilot1_2"},
										  {"ep03_$Pilot2_1", "ep03_$Pilot2_2"} }

-- Vehicles --
WAVECRAFT =					"ep03_$jetski"
TABLE_ULTOR_BOATS =		{ "ep03_$Patrol_Boat1", "ep03_$Patrol_Boat2",
								  "ep03_$Patrol_Boat3", "ep03_$Patrol_Boat4"}
GETAWAY_BOAT =				"ep03_$v000"
ULTOR_GETAWAY_BOAT =		"ep03_$v001"
ATTACK_HELICOPTERS =		{ "ep03_$heli_one", "ep03_$heli_two" }

-- Triggers --
TRIGGER_YACHT_ENTRY =				"ep03_$t000"
TRIGGER_YACHT_SECONDARY_ENTRY =	"ep03_$t002"
TRIGGER_YACHT_EXIT =					"ep03_$t001"

-- Threads --
HELI_THREADS = { -1, -1 }

-- Other --
IN_COOP =								false
YACHT_RADIUS =							50
THREAD_ENSURE_IN_WATERCRAFT =		-1
THREAD_ULTOR_GETAWAY =				-1
INITIAL_NUM_ULTOR_BOATS =			sizeof_table(TABLE_ULTOR_BOATS)
INITIAL_NUM_EXECS =					sizeof_table(TABLE_ULTOR_EXECS)
BOAT_HEALTH_THRESHOLD =				1500
BOAT_DISTANCE_THRESHOLD =			80
Num_ultor_boats_destroyed =		0
Num_execs_killed =					0
Ep03_final_chase_begun =			false

Reached_wavecraft =				  false
Mission_ended_successfully =	  false

-- Text --
TEXT_HEALTH_BAR =						"ep03_health_bar"
TEXT_GET_JET_SKI =					"ep03_get_jet_ski"
TEXT_GET_TO_YACHT =					"ep03_get_to_yacht"
TEXT_DESTROY_BOATS =					"ep03_destroy_boats"
TEXT_ENTER_YACHT =					"ep03_enter_yacht"
TEXT_KILL_EXECS =						"ep03_kill_execs"
TEXT_CHASE_EXEC =						"ep03_chase_exec"
TEXT_EXEC_ESCAPED =					"ep03_exec_escaped"
TEXT_BOATS_DESTROYED =				"ep03_boats_destroyed"
TEXT_EXECS_KILLED =					"ep03_execs_killed"
TEXT_ULTOR_SENT_HELI =				"ep03_ultor_sent_heli"

-- Cutscenes
CT_INTRO = "tsse03-01"
CT_OUTRO = "tsse03-02"

function ep03_start(ep03_checkpoint, is_restart)
	-- Start trigger is hit...the activate button was hit
--	set_mission_author("Aaron Hanson")
	set_mission_author("Ryan Spencer")

	-- interior = false, blocking = true, temporary = true
	city_chunk_swap("sr2_chunk111", "yacht", false, true, true )
	-- interior = true, blocking = true, temporary = true
	city_chunk_swap("sr2_intsrmisyacht01empty", "yacht", true, true, true )

	spawning_boats( false )

	if coop_is_active() then
		IN_COOP = true
	end

	mission_start_fade_out()

	if (not is_restart) then
		cutscene_play( CT_INTRO, "", {LOCAL_PLAYER_START, REMOTE_PLAYER_START}, false )
	else
		-- Teleport the players where they need to start
		teleport_coop( LOCAL_PLAYER_START, REMOTE_PLAYER_START )
	end

	-- Cap the notoriety to prevent attack helicopter spawning
	notoriety_set_max( "Police", 3 )

	mission_start_fade_in()

	for index, helicopter_group in pairs( HELICOPTER_GROUPS ) do
		group_create_hidden( helicopter_group )
	end
	group_create(GROUP_WAVECRAFT)
	if (IN_COOP) then
		group_create(GROUP_WAVECRAFT_COOP)
	end
	group_create_hidden( GROUP_ULTOR_EXECS )

	ep03_get_on_wavecraft()
end

function ep03_boat_jacked(boat)
	on_vehicle_enter("", boat)
	on_vehicle_destroyed("", boat)
	Num_ultor_boats_destroyed = Num_ultor_boats_destroyed + 1
	marker_remove_vehicle(boat, SYNC_ALL)
end

function ep03_character_in_vehicle_of_correct_type( character_name )
	if ( get_char_vehicle_type(character_name) == VT_WATERCRAFT or
		  get_char_vehicle_type(character_name) == VT_HELICOPTER or
		  get_char_vehicle_type(character_name) == VT_AIRPLANE ) then
		return true
	end
	return false
end

function ep03_get_on_wavecraft()
	marker_add_vehicle(WAVECRAFT, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_INTERACT, SYNC_ALL)
	waypoint_add(WAVECRAFT, SYNC_ALL)
	mission_help_table(TEXT_GET_JET_SKI)

	repeat
		thread_yield()
	until( vehicle_is_destroyed( WAVECRAFT ) or
			 ep03_character_in_vehicle_of_correct_type( LOCAL_PLAYER ) or
			 ( coop_is_active() and ep03_character_in_vehicle_of_correct_type( REMOTE_PLAYER ) ) )

	waypoint_remove( SYNC_ALL )
	Reached_wavecraft = true

	ep03_get_to_the_yacht()
end

function ep03_get_to_the_yacht()
	marker_remove_vehicle(WAVECRAFT)
	mission_waypoint_remove()
	marker_add_navpoint(NAV_YACHT, MINIMAP_ICON_LOCATION, "", SYNC_ALL)

	delay(2)
	mission_help_table(TEXT_GET_TO_YACHT)

	group_create(GROUP_ULTOR_BOATS, true)
	for i, boat in pairs(TABLE_ULTOR_BOATS) do
		on_vehicle_destroyed("ep03_boat_destroyed", boat)
	end

	group_create(GROUP_SECURITY, true)
	group_create(GROUP_PARTYGOERS, true)
	
	ep03_send_attack_helicopter( 1 )
	delay(5)
	 mission_help_table_nag( TEXT_ULTOR_SENT_HELI )

	for i = 1, 4 do
		vehicle_enter_teleport(CHAR_ULTOR_PATROL[i], TABLE_ULTOR_BOATS[i])
		set_unjackable_flag( TABLE_ULTOR_BOATS[i], true )
		npc_combat_enable(CHAR_ULTOR_PATROL[i], true)
		vehicle_disable_flee( TABLE_ULTOR_BOATS[i], true )
		thread_new("ep03_yacht_patrol", i )
		on_vehicle_enter("ep03_boat_jacked", TABLE_ULTOR_BOATS[i] )
	end

	 	while ( get_dist_closest_player_to_object( NAV_YACHT ) > YACHT_RADIUS ) do
		thread_yield()
	end
	if (THREAD_ENSURE_IN_WATERCRAFT ~= -1) then
		thread_kill(THREAD_ENSURE_IN_WATERCRAFT)
	end

	ep03_kill_ultor_execs()
		
end

function ep03_send_attack_helicopter( helicopter_index )
	group_show( HELICOPTER_GROUPS[helicopter_index] )
	vehicle_enter_group_teleport( CHAR_HELI_PILOTS[helicopter_index], ATTACK_HELICOPTERS[helicopter_index])

	for index, npc in pairs( CHAR_HELI_PILOTS[helicopter_index] ) do
		npc_combat_enable(npc, true)
		set_attack_player_flag(npc, true)
		attack_closest_player( npc )
	end
	HELI_THREADS[helicopter_index] = thread_new("ep03_heli_chase", ATTACK_HELICOPTERS[helicopter_index])
	thread_new("ep03_heli_watch", ATTACK_HELICOPTERS[1], HELI_THREADS[helicopter_index])
end

function ep03_heli_watch(heli, thread)
	while (thread ~= -1) do
		thread_yield()
		local Vehicle_smoke, Vehicle_fire = vehicle_get_smoke_and_fire_state(heli)
		if Vehicle_fire or Vehicle_smoke or vehicle_is_destroyed(heli) then
			thread_kill(thread)
			thread = -1
		end
	end
end

function ep03_heli_chase(heli)
	while (not vehicle_is_destroyed(heli)) do
		vehicle_chase(heli, LOCAL_PLAYER, false, false, false, false)
		delay( 10.0 )
	end
end

function ep03_kill_ultor_execs()
	group_show( GROUP_ULTOR_EXECS )

	marker_remove_navpoint(NAV_YACHT, SYNC_ALL)

	for i, npc in pairs(TABLE_ULTOR_EXECS) do
		npc_combat_enable(npc, true)
		marker_add_npc(npc, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL)
		on_death("ep03_exec_killed", npc)
		set_attack_player_flag(npc, false)
		flee(npc, LOCAL_PLAYER, true, true)
	end
	
	for i, npc in pairs(TABLE_ULTOR_SECURITY) do
		attack(npc)
	end

	for i, npc in pairs(TABLE_PARTY_GOERS) do
		npc_combat_enable(npc, true)
		set_attack_player_flag(npc, false)
		flee(npc, LOCAL_PLAYER, false, true)
	end
	
	mission_help_table(TEXT_KILL_EXECS)

	while ((INITIAL_NUM_EXECS - Num_execs_killed) > 0) do
		thread_yield()
		objective_text(0, TEXT_EXECS_KILLED, Num_execs_killed, INITIAL_NUM_EXECS)
	end

	objective_text(0, TEXT_EXECS_KILLED, Num_execs_killed, INITIAL_NUM_EXECS)

	ep03_mid_mission_cutscene()
end

function ep03_exec_flee(npc)
	set_attack_player_flag(npc, false)
	flee(npc, LOCAL_PLAYER, false, true)
end

function ep03_mid_mission_cutscene()
	objective_text_clear(0)
	delay(2)
	fade_out(3.0)
	cutscene_play("IG_ep03_scene1")
	group_hide(GROUP_CUTSCENE)

	ep03_board_getaway_boat()
end

function ep03_board_getaway_boat()
	delay(2)
	mission_help_table(TEXT_CHASE_EXEC)

	trigger_enable(TRIGGER_YACHT_EXIT, true)
	marker_add_trigger(TRIGGER_YACHT_EXIT, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)
	on_trigger("ep03_kill_final_exec", TRIGGER_YACHT_EXIT)

	while (not Ep03_final_chase_begun) do
		thread_yield()
	end
end

function ep03_kill_final_exec()
	Ep03_final_chase_begun = true
	
	on_trigger("",TRIGGER_YACHT_EXIT)
	trigger_enable(TRIGGER_YACHT_EXIT,false)
	marker_remove_trigger(TRIGGER_YACHT_EXIT, SYNC_ALL)

	player_controls_disable(LOCAL_PLAYER)
	if ( coop_is_active() ) then
		player_controls_disable(REMOTE_PLAYER)
	end
	
	fade_out(2.0)

	while (fade_get_percent() < 1.0) do
		thread_yield()
	end

	group_create(GROUP_FINAL_EXEC, true)
	
	for i, npc in pairs(TABLE_ULTOR_GETAWAY_PARTY) do
		vehicle_enter_teleport(npc, ULTOR_GETAWAY_BOAT, (i-1))
		npc_combat_enable(npc, true)
	end
	
	on_death("ep03_success_final_exec_killed", CHAR_FINAL_EXEC)
	on_vehicle_destroyed("ep03_getaway_boat_destroyed", ULTOR_GETAWAY_BOAT)
	
	group_create(GROUP_GETAWAY_BOAT, true)	
		
	vehicle_enter_teleport(LOCAL_PLAYER, GETAWAY_BOAT, 0)
	if ( coop_is_active() ) then
		vehicle_enter_teleport(REMOTE_PLAYER, GETAWAY_BOAT, 1)
	end

	marker_add_npc( CHAR_FINAL_EXEC, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL )
	--marker_add_vehicle(ULTOR_GETAWAY_BOAT, MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL, SYNC_ALL)

	local Current_hit_points = get_current_hit_points(ULTOR_GETAWAY_BOAT)
	local New_hit_points = Current_hit_points * 2
	set_max_hit_points(ULTOR_GETAWAY_BOAT, New_hit_points)
	set_current_hit_points(ULTOR_GETAWAY_BOAT, New_hit_points)
	vehicle_disable_chase( ULTOR_GETAWAY_BOAT )
	vehicle_disable_flee( ULTOR_GETAWAY_BOAT )
	vehicle_suppress_npc_exit( ULTOR_GETAWAY_BOAT, true )

	damage_indicator_on( 0, ULTOR_GETAWAY_BOAT, 0, TEXT_HEALTH_BAR, get_current_hit_points(ULTOR_GETAWAY_BOAT) )
	
	fade_in(2.0)
	
	while (fade_get_percent() > 0.5) do
		thread_yield()
	end

	player_controls_enable(LOCAL_PLAYER)
	if ( coop_is_active() ) then
		player_controls_enable(REMOTE_PLAYER)
	end

	delay(2)

	THREAD_ULTOR_GETAWAY = thread_new("ep03_ultor_getaway")

	-- If the first attack helicopter is dead, send a replacement
	if ( vehicle_is_destroyed( ATTACK_HELICOPTERS[1] ) ) then
		ep03_send_attack_helicopter( 2 )
		delay( 2.0 )
		teleport_vehicle( ATTACK_HELICOPTERS[2], NAV_HELI_WARP )
	end

	while ((get_dist_vehicle_to_nav(ULTOR_GETAWAY_BOAT, NAV_ULTOR_SAFETY) > 10) and not character_is_dead(CHAR_FINAL_EXEC)) do
		thread_yield()
	end

	if (THREAD_ULTOR_GETAWAY ~= -1) then
		thread_kill(THREAD_ULTOR_GETAWAY)
	end

	if (not character_is_dead(CHAR_FINAL_EXEC)) then
		ep03_failure_ultor_safety()
	end
end

function ep03_getaway_boat_destroyed()
	delay(1)
	character_kill(CHAR_FINAL_EXEC)
end

function ep03_ultor_getaway()
	vehicle_speed_override(ULTOR_GETAWAY_BOAT, 30)

	while (1) do
		thread_yield()
		
		vehicle_pathfind_to(ULTOR_GETAWAY_BOAT, NAV_ULTOR_SAFETY_START, NAV_ULTOR_SAFETY_HALFWAY, NAV_ULTOR_SAFETY, true, true)
	end
end

function ep03_exec_killed(npc)
	on_death("", npc)
	
	Num_execs_killed = Num_execs_killed + 1
	
	marker_remove_npc(npc)
end

function ep03_boat_destroyed(boat)
	on_vehicle_destroyed("", boat)
	on_vehicle_enter("", boat)
	
	Num_ultor_boats_destroyed = Num_ultor_boats_destroyed + 1
	
	marker_remove_vehicle(boat, SYNC_ALL)
end

function ep03_yacht_patrol(boat_index)
	local boat = TABLE_ULTOR_BOATS[boat_index]

	local THREAD_PATROL = thread_new("ep03_yacht_patrol_pathfind", boat, YACHT_PATROL_PATHS[boat_index] )

	while ( vehicle_is_destroyed( boat ) == false and
			  ( get_current_hit_points(boat) > BOAT_HEALTH_THRESHOLD or get_dist_char_to_vehicle(LOCAL_PLAYER, boat) > BOAT_DISTANCE_THRESHOLD ) ) do
		thread_yield()
	end

	thread_kill(THREAD_PATROL)
	
	while (not vehicle_is_destroyed(boat)) do
		thread_yield()
		vehicle_chase(boat, LOCAL_PLAYER, false, false, true, false)
	end
end

function ep03_yacht_patrol_pathfind( boat, path )
	while (1) do
		thread_yield()
		vehicle_pathfind_to(boat, path, true, false)
	end
end

function ep03_end_patrol_start_chase(boat)
	vehicle_chase(boat, LOCAL_PLAYER, false, false, true, false)
end

function ep03_failure_ultor_safety()
	mission_end_failure("ep03", TEXT_EXEC_ESCAPED)
end

function ep03_success_final_exec_killed()
	damage_indicator_off( 0 )
	on_death("", CHAR_FINAL_EXEC)
	if (THREAD_ULTOR_GETAWAY ~= -1) then
		thread_kill(THREAD_ULTOR_GETAWAY)
	end
--	delay(3)
	Mission_ended_successfully = true
	local all_groups_minus_getaway_boat = { GROUP_ULTOR_BOATS, GROUP_WAVECRAFT, GROUP_WAVECRAFT_COOP,
														 GROUP_ULTOR_EXECS, GROUP_FINAL_EXEC, GROUP_SECURITY,
														 GROUP_PARTYGOERS, GROUP_CUTSCENE, GROUP_HELI_ONE,
														 GROUP_HELI_TWO }

	for index, group_name in pairs( all_groups_minus_getaway_boat ) do
		if ( group_is_loaded( group_name ) ) then
			release_to_world( group_name )
		end
	end
	mission_end_success("ep03", "tsse03-02")
end

function ep03_cleanup()
	-- Cleanup mission here
	if THREAD_ULTOR_GETAWAY ~= -1 then
		thread_kill(THREAD_ULTOR_GETAWAY)
	end

	if THREAD_ENSURE_IN_WATERCRAFT ~= -1 then
		thread_kill(THREAD_ENSURE_IN_WATERCRAFT)
	end

	marker_remove_npc( CHAR_FINAL_EXEC, SYNC_ALL )
	--marker_remove_vehicle(ULTOR_GETAWAY_BOAT, SYNC_ALL)

	on_death("", CHAR_FINAL_EXEC)

	for i, boat in pairs(TABLE_ULTOR_BOATS) do
		on_vehicle_destroyed("", boat)
		on_vehicle_enter("", boat)
		marker_remove_vehicle(boat, SYNC_ALL)
	end

	for i, npc in pairs(TABLE_ULTOR_EXECS) do
		on_death("", npc)
		marker_remove_npc(npc, SYNC_ALL)
	end

	spawning_boats( true )

	-- Teleport players who are near the yachts back to the wavecraft
	if ( get_dist(LOCAL_PLAYER, NAV_YACHT) < 300 ) then
		if ( group_is_loaded( GROUP_GETAWAY_BOAT ) and character_is_in_vehicle( LOCAL_PLAYER, GETAWAY_BOAT ) ) then
			group_destroy( GROUP_GETAWAY_BOAT )
		end
		teleport( LOCAL_PLAYER, NEAR_WAVECRAFT, true )
	end
	if ( coop_is_active() and (get_dist(REMOTE_PLAYER, NAV_YACHT) < 300) ) then
		if ( group_is_loaded( GROUP_GETAWAY_BOAT ) and character_is_in_vehicle( REMOTE_PLAYER, GETAWAY_BOAT ) ) then
			group_destroy( GROUP_GETAWAY_BOAT )
		end
		teleport( REMOTE_PLAYER, NEAR_WAVECRAFT_REMOTE_PLAYER, true )
	end

	-- Remove the notoriety cap
	notoriety_set_max( "Police", MAX_NOTORIETY_LEVEL )

	-- interior = false, blocking = true, temporary = true
	city_chunk_swap("sr2_chunk111", "normal", false, true, true )
	-- interior = true, blocking = true, temporary = true
	city_chunk_swap("sr2_intsrmisyacht01empty", "normal", true, true, true )
end

function ep03_success()
	-- Called when the mission has ended with success
	-- Post the news event
	radio_post_event("JANE_NEWS_TSSE03", true)
end
