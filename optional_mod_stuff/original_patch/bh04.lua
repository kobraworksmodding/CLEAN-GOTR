-- bh04.lua
-- SR2 mission script
-- 3/28/07

-- Groups --
	GROUP_COURTESY_CAR =			"bh04_$courtesy_car"
	GROUP_COURTESY_CAR_COOP =	"bh04_$courtesy_car_coop"
	GROUP_RAGDOLL =				"bh04_$ragdoll"
	GROUP_DONNIE =					"bh04_$donnie"
	GROUP_DONNIE_CAR =			"bh04_$donnie_car"
	GROUP_DONNIE_COOP	=			"bh04_$donnie_coop"

-- Navpoints --
	NAV_LOCAL_START =		"bh04_$n047"
	NAV_REMOTE_START =	"bh04_$n049"
	NAV_MECHANIC_CAR =	"bh04_$n000"
	NAV_DONNIE_FLEE =		{"bh04_$n045", "bh04_$n046", "bh04_$n048"}
	NAV_DRAG_ROUTE =		
		{	{"bh04_$n001", "bh04_$n002", "bh04_$n003", "bh04_$n004"},
			{"bh04_$n005", "bh04_$n006", "bh04_$n007", "bh04_$n008"},
			{"bh04_$n009", "bh04_$n010", "bh04_$n011", "bh04_$n012"},
			{"bh04_$n013", "bh04_$n014", "bh04_$n015", "bh04_$n016"},
			{"bh04_$n017", "bh04_$n018", "bh04_$n019", "bh04_$n020"},
			{"bh04_$n021", "bh04_$n022", "bh04_$n023", "bh04_$n024"},
			{"bh04_$n025", "bh04_$n026", "bh04_$n027", "bh04_$n028"},
			{"bh04_$n029", "bh04_$n030", "bh04_$n031", "bh04_$n032"},
			{"bh04_$n033", "bh04_$n034", "bh04_$n035", "bh04_$n036"},
			{"bh04_$n037", "bh04_$n038", "bh04_$n039", "bh04_$n040"},
			{"bh04_$n041", "bh04_$n042", "bh04_$n043", "bh04_$n044"},
		}
	NAV_GARAGE_LOCATION = "bh04_$Ngarage_location"

-- Triggers --

-- Characters --
	CHAR_DRIVER =			"bh04_$c000"
	CHAR_PASSENGERS =		{"bh04_$c000", "bh04_$c008", "bh04_$c011"}
	CHAR_CARLOS =			"bh04_$c001"
	CHAR_DONNIE =			"bh04_$c002"
	CHAR_GUARDS =			{"bh04_$c003", "bh04_$c004", "bh04_$c005", "bh04_$c006"}

-- Vehicles --
	BERGEN =					"bh04_$v000"
	MECHANIC_CAR =			"bh04_$v001"

-- Mesh Movers --
	DOOR_1 =					"bh04_Door01b0"
	DOOR_2 =					"bh04_Door010"
	BOX_1 =					"bh04_boxCardBoardA07_21020"
	BOX_2 =					"bh04_boxCardBoardA07_21050"
	TRASHCAN =				"bh04_trashCanC01_20310"
	--WIELDABLE_MOVERS =	{BOX_1, BOX_2, TRASHCAN}
	WIELD_LOCATIONS = 
		{	"bh04_$n048", "bh04_$n050", "bh04_$n051", "bh04_$n052", "bh04_$n053", 
			"bh04_$n054", "bh04_$n055", "bh04_$n056"			
		}
	WIELDABLE_MOVERS =	
		{	"bh04_$MM_donnie_weapon_1", "bh04_$MM_donnie_weapon_2", "bh04_$MM_donnie_weapon_3",
			"bh04_$MM_donnie_weapon_4", "bh04_$MM_donnie_weapon_5", "bh04_$MM_donnie_weapon_6",
			"bh04_$MM_donnie_weapon_7", "bh04_$MM_donnie_weapon_8", "bh04_$MM_donnie_weapon_9",
			"bh04_$MM_donnie_weapon_10"
		}
	UNLIKELY_WIELDABLE_MOVERS = 
		{	"bh04_$MM_donnie_unlikely_weapon_1", "bh04_$MM_donnie_unlikely_weapon_2", "bh04_$MM_donnie_unlikely_weapon_3"
		}

-- Text --
	TEXT_TALK_TO_DONNIE =	"bh04_talk_to_donnie"
	TEXT_PUSH_DONNIE =		"bh04_push_donnie"
	TEXT_STOP_TRUCK =			"bh04_stop_truck"
	TEXT_DAMAGE_TRUCK =		"bh04_damage_truck"
	TEXT_CARLOS_HEALTH =		"bh04_carlos_health"
	TEXT_HURRY =				"bh04_hurry"
	TEXT_DONNIE_DIED =		"bh04_donnie_died"
	TEXT_CARLOS_DIED =		"bh04_carlos_died"
	TEXT_HELP_CARLOS =		"bh04_help_carlos"

-- Threads --
	THREAD_RAGDOLL =				-1
	THREAD_CARLOS_TIMER =		-1
	THREAD_FLEE =					-1
	THREAD_NO_SHIELD =			-1
	THREAD_NOTORIETY =			-1
	THREAD_COLLISION_PENALTY = -1

-- Checkpoints --
	CHECKPOINT_START	=		MISSION_START_CHECKPOINT			-- defined in ug_lib.lua
	CHECKPOINT_DONNIE =		"bh04_checkpoint_donnie"

-- Cutscenes --
	CUTSCENE_IN =						"br04-1.bik"
	CUTSCENE_OUT =						"br04-2.bik"

-- Other --
	IN_COOP =						false
	Carlos_health_pct =			75.0
	Bh04_donnie_initial_hp =	-1
	DONNIE_HEALTH_MULTIPLIER = 8
	MAX_BH_NOTORIETY =			2
	BERGEN_STOPPED_SPEED =		10
	BERGEN_STOPPED_TIME =		5
	CARLOS_DEATH_SPEED =			0.2166666666
	STATE_WORK_ON_CAR =			"crouch plant bomb"
	BERGEN_SPEED =	65
	BERGEN_HEALTH_MULTIPLIER =	1.3
	DONNIE_REACT_DISTANCE =		40
	Carlos_being_dragged =		false
	MAX_WIELD_DIST = 1.5

	local INTERROGATION_CONVERSATIONS = 
	{	
		{
			.96,
			{
				{ "BR04_SHOVED_L1", CHAR_DONNIE, 1 },
			},
		},
		{
			.92,
			{
				{ "PLAYER_BR04_SHOVED_L2", LOCAL_PLAYER, 0 },
				{ "BR04_SHOVED_L3", CHAR_DONNIE, 0.5 },
			},
		},
		{
			.86,
			{
				{ "PLAYER_BR04_SHOVED_L4", LOCAL_PLAYER, 0 },
				{ "BR04_SHOVED_L5", CHAR_DONNIE, 1 },
			},
		},
		{
			.82,
			{
				{ "PLAYER_BR04_SHOVED_L6", LOCAL_PLAYER, 0 },
				{ "BR04_SHOVED_L7", CHAR_DONNIE, 1 },
			},
		},
		{
			.78,
			{
				{ "PLAYER_BR04_SHOVED_L8", LOCAL_PLAYER, 0 },
				{ "BR04_SHOVED_L9", CHAR_DONNIE, 1 },
			},
		},
		{
			.75,
			{
				{ "PLAYER_BR04_SHOVED_L10", LOCAL_PLAYER, 0 },
				{ "BR04_SHOVED_L11", CHAR_DONNIE, 1 },
			},
		},
		{
			.72,
			{
				{ "PLAYER_BR04_SHOVED_L12", LOCAL_PLAYER, 0 },
				{ "BR04_SHOVED_L13", CHAR_DONNIE, 1 },
			},
		},
		{
			.68,
			{
				{ "PLAYER_BR04_SHOVED_L14", LOCAL_PLAYER, 0 },
				{ "BR04_SHOVED_L15", CHAR_DONNIE, 1 },
			},
		},
	}

	PLAYER_SYNC = {[LOCAL_PLAYER] = SYNC_LOCAL, [REMOTE_PLAYER] = SYNC_ALL}

	BH04_BROTHERHOOD_ATTACK_PERSONAS = {
		["HM_Bro1"]	=	"HMBRO1",
		["HM_Bro2"]	=	"HMBRO2",
		["HM_Bro3"]	=	"HMBRO3",

		["HF_Bro2"]	=	"HFBRO2",

		["WM_Bro3"]	=	"WMBRO3",

		["WF_Bro1"]	=	"WFBRO1",
		["WF_Bro2"]	=	"WFBRO2",
	}

function bh04_start(bh04_checkpoint, is_restart)

	if (bh04_checkpoint == CHECKPOINT_START) then
		if (not is_restart) then
			cutscene_play("br04-01")
		end
		fade_out(0)
	end

	bh04_initialize(bh04_checkpoint)

	if bh04_checkpoint == CHECKPOINT_DONNIE then
		bh04_save_carlos()
	else
		bh04_get_to_mechanic_shop()
	end
end

function bh04_initialize(checkpoint)

	mission_start_fade_out(0.0)

	-- Start trigger is hit...the activate button was hit
	set_mission_author("Phillip Alexander and Aaron Hanson (aka Father Zucosos)")

	bh04_initialize_common()

	bh04_initialize_checkpoint(checkpoint)

	mission_start_fade_in()

end

-- Initialization code shared by all checkpoints.
function bh04_initialize_common()

	notoriety_set_max("Brotherhood", MAX_BH_NOTORIETY)

	if coop_is_active() then
		IN_COOP = true
	end

	set_weather(4,false)

	bh04_start_persona_overrides()

end

-- Initialization code specific to the checkpoint.
function bh04_initialize_checkpoint(checkpoint)

	bh04_door_open(DOOR_2, true)

	if (checkpoint == CHECKPOINT_DONNIE) then
		group_create(GROUP_DONNIE_CAR, true)
		teleport_vehicle(MECHANIC_CAR, NAV_MECHANIC_CAR)
		bh04_door_open(DOOR_1, false)
		delay(1.0)
	else
		
		group_create(GROUP_COURTESY_CAR, true)
		if (IN_COOP) then
			group_create(GROUP_COURTESY_CAR_COOP, true)
		end

		teleport_coop(NAV_LOCAL_START, NAV_REMOTE_START)

	end

end

function bh04_start_persona_overrides()
	persona_override_group_start(BH04_BROTHERHOOD_ATTACK_PERSONAS, POT_SITUATIONS[POT_ATTACK], "BR04_ATTACK")
end

function bh04_stop_persona_overrides()
	persona_override_group_stop(BROTHERHOOD_PERSONAS, POT_SITUATIONS[POT_ATTACK])
end

function bh04_get_to_mechanic_shop()
	group_create(GROUP_DONNIE, true)
	turn_invulnerable(CHAR_DONNIE)
	group_create(GROUP_DONNIE_CAR, true)
	if IN_COOP then
		group_create(GROUP_DONNIE_COOP, true)
	end
	Bh04_donnie_initial_hp = get_current_hit_points(CHAR_DONNIE)
	Bh04_donnie_initial_hp = Bh04_donnie_initial_hp * DONNIE_HEALTH_MULTIPLIER
	set_max_hit_points(CHAR_DONNIE, Bh04_donnie_initial_hp)
	set_current_hit_points(CHAR_DONNIE, Bh04_donnie_initial_hp)
	inv_item_equip("tire_iron", CHAR_DONNIE)
	crouch_start(CHAR_DONNIE)
	set_animation_state(CHAR_DONNIE, STATE_WORK_ON_CAR)
	set_ignore_ai_flag(CHAR_DONNIE, true)

	thread_new("bh04_donnie_truck_audio")

	for i, npc in pairs(CHAR_GUARDS) do
		set_attack_player_flag(npc, true)
	end

	mission_help_table(TEXT_TALK_TO_DONNIE)

	marker_add_navpoint(NAV_GARAGE_LOCATION, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION, SYNC_ALL)
	mission_waypoint_add(CHAR_DONNIE)

	teleport_vehicle(MECHANIC_CAR, NAV_MECHANIC_CAR)

	on_death("bh04_failure_donnie_died", CHAR_DONNIE)
	on_take_damage("bh04_donnie_damaged", CHAR_DONNIE)
	on_take_damage("bh04_car_damaged", MECHANIC_CAR)

	local local_far_away = get_dist_char_to_char(LOCAL_PLAYER, CHAR_DONNIE) > DONNIE_REACT_DISTANCE
	local remote_far_away = ( (not IN_COOP) or (IN_COOP and get_dist_char_to_char(REMOTE_PLAYER, CHAR_DONNIE) > DONNIE_REACT_DISTANCE) )

	while (local_far_away and remote_far_away and Bh04_donnie_healthy and Bh04_car_healthy) do
		local_far_away = get_dist_char_to_char(LOCAL_PLAYER, CHAR_DONNIE) > DONNIE_REACT_DISTANCE
		remote_far_away = ( (not IN_COOP) or (IN_COOP and get_dist_char_to_char(REMOTE_PLAYER, CHAR_DONNIE) > DONNIE_REACT_DISTANCE) )
		thread_yield()
	end
	marker_remove_navpoint(NAV_GARAGE_LOCATION, SYNC_ALL)

	bh04_interrogate_donnie()
end

Bh04_donnie_healthy = true
function bh04_donnie_damaged(donnie, attacker, damage_percent)
	Bh04_donnie_healthy = false
end

Bh04_car_healthy = true
function bh04_car_damaged(donnie, attacker, damage_percent)

	if (damage_percent < .60) then
		Bh04_car_healthy = false
	end
	
end


function bh04_donnie_truck_audio()
	while (get_dist_char_to_char(LOCAL_PLAYER, CHAR_DONNIE) > 90)	
			and ((not IN_COOP) or (IN_COOP and get_dist_char_to_char(REMOTE_PLAYER, CHAR_DONNIE) > 90)) do
		thread_yield()
	end

	local audio_truck_work = audio_play_for_character("SFX_DONNIE_TRUCK_WORK", CHAR_DONNIE)

	while (get_dist_char_to_char(LOCAL_PLAYER, CHAR_DONNIE) > DONNIE_REACT_DISTANCE)	
			and ((not IN_COOP) or (IN_COOP and get_dist_char_to_char(REMOTE_PLAYER, CHAR_DONNIE) > DONNIE_REACT_DISTANCE)) do
		thread_yield()
	end

	audio_stop(audio_truck_work)
	delay(1)
	audio_play_for_character("DONNIE_BR04_SEEPLAYER", CHAR_DONNIE, "voice")
end

Bh04_interrogation_started = false
function bh04_interrogate_donnie()

	if (Bh04_interrogation_started) then
		return
	end

	marker_add_npc(CHAR_DONNIE, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL)	

	Bh04_interrogation_started = true
	mission_waypoint_remove(SYNC_ALL)

	clear_animation_state(CHAR_DONNIE)
	npc_weapon_pickup_override(CHAR_DONNIE, false)
	set_dont_attack_me_on_sight_flag(CHAR_DONNIE, true)
	set_attack_player_flag(CHAR_DONNIE, false)

	thread_new("bh04_make_donnie_vulnerable")
	THREAD_FLEE = thread_new("bh04_donnie_flee")
	THREAD_NO_SHIELD = thread_new("bh04_donnie_cant_be_shielded")

	-- Tell the player to lay the smack down on Donnie
	mission_help_table(TEXT_PUSH_DONNIE)

	local function get_conversation()

		local health_ratio = get_current_hit_points(CHAR_DONNIE) / Bh04_donnie_initial_hp
		for i=sizeof_table(INTERROGATION_CONVERSATIONS), 1, -1 do
			if(health_ratio <= INTERROGATION_CONVERSATIONS[i][1]) then
				return i
			end
		end

		return nil

	end

	local prev_conversation = nil
	local final_conversation = sizeof_table(INTERROGATION_CONVERSATIONS)
	while(not (prev_conversation == final_conversation) ) do
		local new_conversation = get_conversation()
		if (new_conversation ~= prev_conversation) then

			local local_close_enough = get_dist(LOCAL_PLAYER, CHAR_DONNIE) < 10
			local remote_close_enough = false
			if (IN_COOP and (get_dist(REMOTE_PLAYER, CHAR_DONNIE) < 10)) then
				remote_close_enough = true
			end

			-- Play the line for the remote player if only the remote playeor is close enough, or 50%
			-- of the time if both players are close enough
			local play_for_remote = (	remote_close_enough and 
												( (not local_close_enough) or (rand_int(1,2) == 1) )
											)

			local conversation = INTERROGATION_CONVERSATIONS[new_conversation][2]
			if (play_for_remote) then
				conversation[1][2] = REMOTE_PLAYER
			end

			bh04_play_interrogation_conversation(conversation)
			prev_conversation = new_conversation
		end
		thread_yield()
	end

	thread_kill(THREAD_FLEE)
	thread_kill(THREAD_NO_SHIELD)

	marker_remove_npc(CHAR_DONNIE, SYNC_ALL)

	if not character_is_dead(CHAR_DONNIE) then
		on_death("", CHAR_DONNIE)
		turn_invulnerable(CHAR_DONNIE)

		mission_set_checkpoint(CHECKPOINT_DONNIE)
		bh04_save_carlos()
	end

end

function bh04_make_donnie_vulnerable()

	delay(5)
	turn_vulnerable(CHAR_DONNIE)
	
end


function bh04_play_interrogation_conversation( dialog_stream)

   for segment_index, dialog_segment in pairs( dialog_stream ) do
      local audio_name = dialog_segment[DIALOG_STREAM_AUDIO_NAME_INDEX]
      local speaking_character = dialog_segment[DIALOG_STREAM_CHAR_NAME_INDEX]
      local delay_seconds = dialog_segment[DIALOG_STREAM_DELAY_SECONDS_INDEX]

		repeat
			thread_yield()
		until ( bh04_character_is_ready_to_speak( speaking_character ) )

		audio_play_for_character( audio_name, speaking_character, "voice", false, true)
		delay( delay_seconds )
   end

end

function bh04_character_is_ready_to_speak( speaking_character )
   -- Check for a character that does not exist first
   if (not character_exists(speaking_character)) then
		return false
	end

	if (character_is_dead(speaking_character)) then
		return false
	end

	if (character_is_ragdolled(speaking_character) and (speaking_character ~= CHAR_DONNIE)) then
		return false
	end
	
	if (character_is_on_fire(speaking_character)) then
      return false
   end

	-- The character can speak
   return true
end

function bh04_donnie_cant_be_shielded()

	while(true) do
		
		if(character_has_specific_human_shield(LOCAL_PLAYER, CHAR_DONNIE)) then
			character_release_human_shield(LOCAL_PLAYER)
		elseif (IN_COOP and character_has_specific_human_shield(REMOTE_PLAYER, CHAR_DONNIE)) then
			character_release_human_shield(REMOTE_PLAYER)
		end
		thread_yield()
	end

end

function bh04_donnie_flee()
	
	move_to(CHAR_DONNIE, NAV_DONNIE_FLEE[1], 2, true)
	bh04_door_open(DOOR_1, false)
	move_to(CHAR_DONNIE, NAV_DONNIE_FLEE[2], 2, true)

	local donnie_use_mover_dist = 75

	while(1) do
		thread_yield()

		-- If the server isn't near donnie, all the mesh mover code won't work, just have donnie attack
		if (get_dist(LOCAL_PLAYER, CHAR_DONNIE) > donnie_use_mover_dist) then
		
			if (IN_COOP) then
				set_dont_attack_me_on_sight_flag(CHAR_DONNIE, false)
				set_attack_player_flag(CHAR_DONNIE, true)
				set_ignore_ai_flag(CHAR_DONNIE, false)
				attack(CHAR_DONNIE)
			end
			delay(5)

		else

			set_dont_attack_me_on_sight_flag(CHAR_DONNIE, true)
			set_attack_player_flag(CHAR_DONNIE, false)
			set_ignore_ai_flag(CHAR_DONNIE, true)
			while ( not (mesh_mover_wielding(CHAR_DONNIE) or (get_dist(LOCAL_PLAYER, CHAR_DONNIE) > donnie_use_mover_dist)) ) do
				thread_yield()

				local weapon, location = bh04_donnie_select_weapon_and_location()

				if ( (weapon ~= "") and (location ~= nil) and (not mesh_mover_wielding(CHAR_DONNIE))) then

					-- Only move to a new location if Donnie can't reach the item from where he's standing
					if (get_dist(CHAR_DONNIE, weapon) > MAX_WIELD_DIST) then
						move_to(CHAR_DONNIE, location, 2, true)
					end

					-- Make sure that no one else picked up the weapon
					if ( (get_dist(CHAR_DONNIE, weapon) < MAX_WIELD_DIST) and (not mesh_mover_being_wielded(weapon))) then
						mesh_mover_wield(weapon, CHAR_DONNIE, false)
					end

					turn_to(CHAR_DONNIE, NAV_DONNIE_FLEE[2], false)
					delay(0.1)
				end

			end

			local dist,player = get_dist_closest_player_to_object(CHAR_DONNIE)
			while (dist > 7) do
				dist,player = get_dist_closest_player_to_object(CHAR_DONNIE)
				thread_yield()
			end

			if (get_dist(LOCAL_PLAYER, CHAR_DONNIE) < donnie_use_mover_dist) then
				delay(0.5)
				turn_to(CHAR_DONNIE, player, false)
				mesh_mover_throw(CHAR_DONNIE)
				delay(0.75)
			end
		end

	end
end

function bh04_donnie_select_weapon_and_location()

	local objects_examined = 0
	while(objects_examined < 10) do

		objects_examined = objects_examined + 1

		local weapon = ""
		if ((rand_int(1,6) == 1)) then
			weapon = UNLIKELY_WIELDABLE_MOVERS[rand_int(1,sizeof_table(UNLIKELY_WIELDABLE_MOVERS))]
		else
			weapon = WIELDABLE_MOVERS[rand_int(1,sizeof_table(WIELDABLE_MOVERS))]
		end

		if (not mesh_mover_being_wielded(weapon) ) then

			for i, location in pairs(WIELD_LOCATIONS) do
				if (get_dist(weapon, location) < MAX_WIELD_DIST) then
					return weapon, location
				end
			end

		end

	end

	return "", nil

end

function bh04_save_carlos()
	group_create(GROUP_RAGDOLL, true)
	local Bergen_hp = get_current_hit_points(BERGEN)
	Bergen_hp = Bergen_hp * BERGEN_HEALTH_MULTIPLIER
	set_max_hit_points(BERGEN, Bergen_hp)
	set_current_hit_points(BERGEN, Bergen_hp)
	vehicle_set_untowable(BERGEN, true)
	vehicle_max_speed(BERGEN, BERGEN_SPEED)
	set_unjackable_flag(BERGEN, true)
	set_ignore_ai_flag(CHAR_CARLOS, true)
	turn_invulnerable(CHAR_CARLOS, false)
	vehicle_enter_group_teleport(CHAR_PASSENGERS, BERGEN)
	vehicle_suppress_npc_exit(BERGEN, true)
	for i, npc in pairs(CHAR_PASSENGERS) do
		set_attack_player_flag(npc, true)
	end

	marker_add_vehicle(BERGEN, MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL, SYNC_ALL)
	mission_waypoint_add(BERGEN, SYNC_ALL)

	hud_bar_on(0, "Health", TEXT_CARLOS_HEALTH, 1.0)
	hud_bar_set_range(0, 0.0, 100.0, SYNC_ALL)
	hud_bar_set_value(0, 75.0, SYNC_ALL)

	THREAD_CARLOS_TIMER = thread_new("bh04_carlos_slow_death")
	vehicle_drag_ragdoll_start(BERGEN, CHAR_CARLOS)
	Carlos_being_dragged = true
	THREAD_RAGDOLL = thread_new("bh04_pathfind")
	THREAD_COLLISION_PENALTY = thread_new("bh04_collision_penalty")

	delay(4)
	mission_help_table(TEXT_STOP_TRUCK)

	THREAD_NOTORIETY = thread_new("bh04_raise_tribal_notoriety")

	bh04_watch_truck()
end

function bh04_collision_penalty()
	while 1 do
		thread_yield()
		if ((get_dist_char_to_char(LOCAL_PLAYER, CHAR_CARLOS) < 2) and character_is_in_vehicle(LOCAL_PLAYER))
		   or (IN_COOP and (get_dist_char_to_char(REMOTE_PLAYER, CHAR_CARLOS) < 2) and character_is_in_vehicle(REMOTE_PLAYER)) then
			Carlos_health_pct = Carlos_health_pct - 5.0
			delay(2)
		end
	end
end

function bh04_watch_truck()

	local Stopped = false
	local Bergen_slowed_time = 0.0
	local Message_displayed = {[LOCAL_PLAYER] = false, [REMOTE_PLAYER] = false}
	local Next_los_check		= {[LOCAL_PLAYER] = 0.0, [REMOTE_PLAYER] = 0.5}
	local Bergen_gear_speeds = {20, 45, BERGEN_SPEED}
	local Bergen_gear = 3

	-- Kill the threads associated with this sequence, maybe have npcs exit the vehicle
	local function stop_bergen(exit)
		Stopped = true
		thread_kill(THREAD_RAGDOLL)
		thread_kill(THREAD_CARLOS_TIMER)
		thread_kill(THREAD_COLLISION_PENALTY)
		vehicle_suppress_npc_exit(BERGEN, false)
		set_unjackable_flag(BERGEN, true)
		if(exit) then
			bh04_exit_bergen()
		end
	end

	-- Display "Damage the truck and force it to stop!" when Carlos first enters player's LOS
	local function update_message(player)

		if ( not Message_displayed[player] ) then

			-- Only do LOS checks once per second
			if(Next_los_check[player] <= 0.0) then
				Next_los_check[player] = 1.0				

				if(los_check(player, CHAR_CARLOS)) then
					Message_displayed[player] = true
					mission_help_table(TEXT_DAMAGE_TRUCK, "", "", PLAYER_SYNC[player])
				end				
			else
				-- Otherwise update the time til the next los check.
				Next_los_check[player] = Next_los_check[player] - get_frame_time()
			end
			
		end
	end

	while(not Stopped) do
		thread_yield()

		if(vehicle_is_destroyed(BERGEN)) then
		-- Stop Bergen if destroyed
			stop_bergen(false)
		else
			-- Get closest player to truck
			local dist,player = get_dist_closest_player_to_object(BERGEN)

			-- Display message if we've gotten close enough
			update_message(LOCAL_PLAYER)
			if ( IN_COOP ) then 
				update_message(REMOTE_PLAYER)
			end

			-- Stop bergen if it is on fire or smoking or its driver is dead.
			local Vehicle_smoke, Vehicle_fire = vehicle_get_smoke_and_fire_state(BERGEN)
			if (	Vehicle_smoke or Vehicle_fire or character_is_dead(CHAR_DRIVER)) then
				stop_bergen(true)
			elseif ( (dist <= 30) and get_vehicle_speed(CHAR_DRIVER) <= BERGEN_STOPPED_SPEED) then
			-- Stop Bergen if physically stopped/slowed for enough time
				Bergen_slowed_time = Bergen_slowed_time + get_frame_time()
				if Bergen_slowed_time >= BERGEN_STOPPED_TIME then
					stop_bergen(true)
				end
			else
				Bergen_slowed_time = 0.0

			-- The Bergen isn't stopped... slow it down if far enough from the players
				local new_gear = 3
				if(dist > 200 ) then
					new_gear = 1
				elseif(dist > 100 ) then
					new_gear = 2
				end
				if (Bergen_gear ~= new_gear) then
					Bergen_gear = new_gear
					vehicle_max_speed(BERGEN, Bergen_gear_speeds[Bergen_gear])
				end

			end
		end
	end

	bh04_get_to_carlos()
end

function bh04_exit_bergen()
	turn_invulnerable(BERGEN, false)
	for i, npc in pairs(CHAR_PASSENGERS) do
		if not character_is_dead(npc) then
			thread_new("vehicle_exit", npc, false)
			if IN_COOP and mod(i,2) == 0 then
				attack(npc, REMOTE_PLAYER)
			else
				attack(npc, LOCAL_PLAYER)
			end
		end
	end

end

function bh04_get_to_carlos()

	mission_help_table_nag(TEXT_HELP_CARLOS)
	turn_invulnerable(CHAR_CARLOS)
	set_unjackable_flag(BERGEN, true)
	--npc_revive(CHAR_CARLOS)
	thread_new("bh04_ragdoll_carlos")

	marker_remove_vehicle(BERGEN, SYNC_ALL)
	mission_waypoint_remove(SYNC_ALL)
	marker_add_npc(CHAR_CARLOS, MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_PROTECT_ACQUIRE, SYNC_ALL)

	if THREAD_FLEE ~= -1 then
		thread_kill(THREAD_FLEE)
	end
	if THREAD_NO_SHIELD ~= -1 then
		thread_kill(THREAD_NO_SHIELD)
	end

	delay(3)

	while (get_dist_char_to_char(LOCAL_PLAYER, CHAR_CARLOS) > 3) and ((not IN_COOP) or (IN_COOP and get_dist_char_to_char(REMOTE_PLAYER, CHAR_CARLOS) > 3)) do
		thread_yield()
	end

	marker_remove_npc(CHAR_CARLOS, SYNC_ALL)

	--cutscene_out()
	turn_invulnerable(LOCAL_PLAYER)
	if (IN_COOP) then
		turn_invulnerable(REMOTE_PLAYER)
	end

	if (vehicle_exists(BERGEN) and (not vehicle_is_destroyed(BERGEN))) then
		-- Make suree that Carlos doesn't get up.
		character_kill(CHAR_CARLOS)
		vehicle_drag_ragdoll_stop(BERGEN, CHAR_CARLOS)
	end

	bh04_success_carlos_saved()
end

function bh04_ragdoll_carlos()
	while (true) do
		if (character_exists(CHAR_CARLOS) and (not character_is_dead(CHAR_CARLOS)) ) then
			character_ragdoll(CHAR_CARLOS)
		end
		thread_yield()
	end
end

function bh04_raise_tribal_notoriety()
	--[[
	while(1) do
		thread_yield()
		delay(10)
		local new_bh_notoriety = notoriety_get("Brotherhood") + 1
		if new_bh_notoriety <= MAX_BH_NOTORIETY then
			notoriety_set_max("Brotherhood", new_bh_notoriety)
			notoriety_set("Brotherhood", new_bh_notoriety)
			notoriety_set_min("Brotherhood", new_bh_notoriety)
		end
	end
	]]--

	while(1) do
		thread_yield()
		while (notoriety_get_decimal("Brotherhood") < MAX_BH_NOTORIETY) do
			thread_yield()
			local notoriety = notoriety_get_decimal("Brotherhood")
			local new_notoriety = notoriety + 0.02
			if new_notoriety > MAX_BH_NOTORIETY then
				new_notoriety = MAX_BH_NOTORIETY
			end
			notoriety_set("Brotherhood", new_notoriety)
			delay(0.5)
		end
	end
end

function bh04_carlos_slow_death()
	local Warning_displayed = false
	Carlos_health_pct = 75.0
	while(Carlos_health_pct > 0.0) do
		thread_yield()
		Carlos_health_pct = Carlos_health_pct - (CARLOS_DEATH_SPEED * get_frame_time())
		if Carlos_health_pct <= 0.0 then
			Carlos_health_pct = 0.0
		end
		hud_bar_set_value(0, Carlos_health_pct, SYNC_ALL)
		if Carlos_health_pct <= 20.0 and not Warning_displayed then
			mission_help_table(TEXT_HURRY)
			Warning_displayed = true
		end
	end
	character_kill(CHAR_CARLOS)
	bh04_failure_carlos_died()
end

function bh04_pathfind()
	while(1) do
		thread_yield()
		for i,path_segment in pairs(NAV_DRAG_ROUTE) do
		vehicle_pathfind_to(BERGEN, path_segment, true, false)
		end
	end
end

function bh04_door_open(door, reverse)
	thread_new("bh04_door_keep_open", door, reverse)
end

function bh04_door_keep_open(door, reverse)

	while(true) do
		if(not door_is_open(door)) then
			door_open(door, reverse)
		end
		delay(1.0)
		thread_yield()
	end

end

function bh04_success_carlos_saved()
	marker_remove_npc(CHAR_CARLOS, SYNC_ALL)
	hud_bar_off(0)
	delay(2)
	mission_end_success("bh04", "br04-02")
end

function bh04_failure_donnie_died()
	on_death("", CHAR_DONNIE)
	delay(3)
	mission_end_failure("bh04", TEXT_DONNIE_DIED)
end

function bh04_failure_carlos_died()
	delay(3)
	mission_end_failure("bh04", TEXT_CARLOS_DIED)
end

function bh04_cleanup()

	set_weather(-1)

	-- Cleanup mission here

	if (Carlos_being_dragged and vehicle_exists(BERGEN) and (not vehicle_is_destroyed(BERGEN))) then
		vehicle_drag_ragdoll_stop(BERGEN, CHAR_CARLOS)
	end

	hud_bar_off(0)

	for i, mover in pairs(WIELDABLE_MOVERS) do
		mesh_mover_reset(mover)
	end
	for i, mover in pairs(UNLIKELY_WIELDABLE_MOVERS) do
		mesh_mover_reset(mover)
	end

	door_lock(DOOR_1, false)
	door_open(DOOR_1)
	door_lock(DOOR_2, false)
	door_open(DOOR_2)

	if THREAD_RAGDOLL ~= -1 then
		thread_kill(THREAD_RAGDOLL)
	end
	if THREAD_CARLOS_TIMER ~= -1 then
		thread_kill(THREAD_CARLOS_TIMER)
	end
	if THREAD_FLEE ~= -1 then
		thread_kill(THREAD_FLEE)
	end
	if THREAD_NOTORIETY ~= -1 then
		thread_kill(THREAD_NOTORIETY)
	end
	if THREAD_NO_SHIELD ~= -1 then
		thread_kill(THREAD_NO_SHIELD)
	end
	if THREAD_COLLISION_PENALTY ~= -1 then
		thread_kill(THREAD_COLLISION_PENALTY)
	end

	mission_waypoint_remove(SYNC_ALL)
	marker_remove_vehicle(BERGEN, SYNC_ALL)
	marker_remove_npc(CHAR_CARLOS, SYNC_ALL)
	marker_remove_navpoint(NAV_GARAGE_LOCATION, SYNC_ALL)

	on_death("", CHAR_DONNIE)

	bh04_stop_persona_overrides()
	
	turn_vulnerable(LOCAL_PLAYER)
	if (coop_is_active()) then
		turn_vulnerable(REMOTE_PLAYER)
	end

	group_destroy(GROUP_DONNIE_CAR)

end

function bh04_success()
	-- Called when the mission has ended with success
--	bink_play_movie(CUTSCENE_OUT)
end
