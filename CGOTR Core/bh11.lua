-- bh11.lua
-- SR2 mission script
-- 3/28/07

	ARENA_TELE = "cribs_sr2_city_$PB_arena_out"

	CURRENT_MISSION =			"bh11"
	ENEMY_GANG =				"Brotherhood"

	-- Navpoints --
	NAV_PLAYER_START =		"bh11_$player_start"
	NAV_REMOTE_START =		"bh11_$remote_start"
	NAV_MISSION_END_RESTORE_POS = "bh11_$Mission_End_Restore_Pos"
	NAV_MISSION_END_REMOTE_RESTORE_POS = "bh11_$Mission_End_Remote_Restore_Pos"

	-- Tables --
	Bh11_maero_patrol =		"bh11_$Maero_Path"
	Bh11_tribal_vehicles =  {"bh11_$v000", "bh11_$v001", "bh11_$v002", "bh11_$v003", "bh11_$v004", "bh11_$v005", "bh11_$v006", "bh11_$v007"}
	Bh11_tribal_vehicles_coop = {"bh11_$v008", "bh11_$v009", "bh11_$v010", "bh11_$v011"}
	Bh11_all_vehicles =		{"bh11_$v000", "bh11_$v001", "bh11_$v002", "bh11_$v003", "bh11_$v004", "bh11_$v005", "bh11_$v006", "bh11_$v007", "bh11_$v008", "bh11_$v009", "bh11_$v010", "bh11_$v011"}

	Bh11_tribal_chars =     {	{"bh11_$c000", "bh11_$c001"},
										{"bh11_$c004", "bh11_$c005"},
										{"bh11_$c008", "bh11_$c009"},
										{"bh11_$c012", "bh11_$c013"},
										{"bh11_$c016", "bh11_$c017"},
										{"bh11_$c020", "bh11_$c021"},
										{"bh11_$c024", "bh11_$c025"},
										{"bh11_$c028", "bh11_$c029"}
									}

	Bh11_tribal_chars_coop = {	{"bh11_$c032", "bh11_$c033"},
										{"bh11_$c036", "bh11_$c037"},
										{"bh11_$c040", "bh11_$c041"},
										{"bh11_$c044", "bh11_$c045"}
									 }
	--Bh11_tribal_navs =		{"bh11_$n008", "bh11_$n009", "bh11_$n010", "bh11_$n011", "bh11_$n012", "bh11_$n013", "bh11_$n014", "bh11_$n015"}
	Bh11_tribal_navs =		{"bh11_$n008", "bh11_$v001", 
									 "bh11_$n009", "bh11_$v002",
									 "bh11_$n010", "bh11_$v003",
									 "bh11_$n011", "bh11_$v004",
									 "bh11_$n012", "bh11_$v005",
									 "bh11_$n013", "bh11_$v006",
									 "bh11_$n014", "bh11_$v007",
									 "bh11_$n015", "bh11_$v000"}
	Bh11_tribal_navs_coop =	{"bh11_$n008", "bh11_$n010", "bh11_$n012", "bh11_$n014"}

	-- Characters --
	CHAR_MAERO =				"bh11_$maero"

	-- Vehicles --
	MONSTER_TRUCK =			"bh11_$monster_truck"

	-- Groups --
	GROUP_MAERO =				"bh11_$maero"
	GROUP_TRIBAL =				"bh11_$tribal"
	GROUP_TRIBAL_COOP =		"bh11_$tribal_coop"
	GROUP_WEAPONS =			"bh11_$weapons"

	-- Cutscenes --
	CUTSCENE_IN =						"br11-01"
	CUTSCENE_OUT =						"br11-02"
	MISSION_NAME =						"bh11"

	-- Voice --
	VOICE_MAERO_TAKE_DAMAGE =		"MAERO_BR11_TAKEDAM"

   BH11_BROTHERHOOD_PERSONAS = {
                                 ["HM_Bro1"]	=	"HMBRO1",
                                 ["HM_Bro2"]	=	"HMBRO2",
                                 ["HM_Bro3"]	=	"HMBRO3",

                                 ["HF_Bro2"]	=	"HFBRO2",

                                 ["WM_Bro3"]	=	"WMBRO3",

                                 ["WF_Bro1"]	=	"WFBRO1",
                                 ["WF_Bro2"]	=	"WFBRO2",
                               }

	-- Threads --
	Patrol_threads =			{-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1}
	Thread_maero_patrol =			-1
	Thread_car_on_fire_watch =		{-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1}
	Thread_drivebys =					-1
	Thread_remote_drivebys =		-1
	Thread_secondary_drivebys =	-1
	Thread_secondary_remote_drivebys =		-1
	Thread_chase =						-1
	Thread_remote_chase =			-1
	Thread_secondary_chase =		-1
	Thread_secondary_remote_chase = -1
	TABLE_ALL_THREADS = {Patrol_threads[1], 
								Patrol_threads[2], 
								Patrol_threads[3], 
								Patrol_threads[4], 
								Patrol_threads[5], 
								Patrol_threads[6], 
								Patrol_threads[7], 
								Patrol_threads[8], 
								Patrol_threads[9], 
								Patrol_threads[10], 
								Patrol_threads[11], 
								Patrol_threads[12], 
								Thread_maero_patrol, 
								Thread_car_on_fire_watch[1], 
								Thread_car_on_fire_watch[2], 
								Thread_car_on_fire_watch[3], 
								Thread_car_on_fire_watch[4], 
								Thread_car_on_fire_watch[5], 
								Thread_car_on_fire_watch[6], 
								Thread_car_on_fire_watch[7], 
								Thread_car_on_fire_watch[8], 
								Thread_car_on_fire_watch[9], 
								Thread_car_on_fire_watch[10], 
								Thread_car_on_fire_watch[11], 
								Thread_car_on_fire_watch[12], 
								Thread_drivebys, 
								Thread_remote_drivebys, 
								Thread_secondary_drivebys,
								Thread_secondary_remote_drivebys,
								Thread_chase, 
								Thread_remote_chase,
								Thread_secondary_chase, 
								Thread_secondary_remote_chase}

	-- Others --
	Num_tribal_vehicles =				sizeof_table(Bh11_tribal_vehicles)
	Num_tribal_vehicles_coop =			sizeof_table(Bh11_tribal_vehicles_coop)
	Num_tribal_vehicles_total =		0
	Chaser_vehicle_id =					-1
	Remote_chaser_vehicle_id =			-1
	Secondary_chaser_vehicle_id =		-1
	Secondary_remote_chaser_vehicle_id =		-1
	Maero_truck_health_multiplier =	1.9
   Maero_truck_health_multiplier_coop = 3

   Tribal_vehicle_health_multiplier = 0.7

	IN_COOP =								false
	bh11_mission_cancelled =			true
	first_chase =							true
	TABLE_PATROL_DELAYS =				{6, 4, 2, 0, 0, 2, 4, 6}
	Maero_truck_health_decrease =		2000
	Maero_next_damage_level_voice_callback =		0.9

   Sony_PEG_Demo = false
   Sony_PEG_Damage_Multiplier = 0.5

   SONY_PEG_REGEN_RESUME_TIME_SECONDS = 3.0

function bh11_sony_peg_damage_reduction( attacked_object_name, attacker_name, percent_hp_remaining_after_attack )
   -- Find out the health status before being attacked
   local pre_attack_hit_points = get_current_hit_points( attacked_object_name )
   local max_hit_points = get_max_hit_points( attacked_object_name )
   local percent_hp_before_attack = pre_attack_hit_points / max_hit_points

   -- Now, find out how much percent damage was done
   local percent_damage_done = percent_hp_before_attack - percent_hp_remaining_after_attack

   -- Reduce the damage done percent by the multiplier
   local reduced_percent_damage_done = percent_damage_done * Sony_PEG_Damage_Multiplier
   local reduced_points_damage_done = reduced_percent_damage_done * max_hit_points

	if ( reduced_points_damage_done < 1) then
		reduced_points_damage_done = 1
	end

   character_damage( attacked_object_name, reduced_points_damage_done )

   local points_damage_done = percent_damage_done * max_hit_points
   mission_debug( "Original damage: "..points_damage_done..", new damage: "..reduced_points_damage_done )
end

function bh11_start(bh11_checkpoint, is_restart)
	-- Start trigger is hit...the activate button was hit
	set_mission_author("Aaron Hanson")

   if ( Sony_PEG_Demo ) then
      turn_invulnerable( LOCAL_PLAYER )
      on_take_damage( "bh11_sony_peg_damage_reduction", LOCAL_PLAYER )

      if ( coop_is_active() ) then
         turn_invulnerable( REMOTE_PLAYER )
         on_take_damage( "bh11_sony_peg_damage_reduction", REMOTE_PLAYER )
      end
   end

   action_nodes_restrict_spawning( true )

   mission_start_fade_out()
   trigger_enable( ARENA_TELE, false )
   if (not is_restart) then
		cutscene_play( CUTSCENE_IN, "", { NAV_PLAYER_START, NAV_REMOTE_START }, false )
   else
		teleport_coop( NAV_PLAYER_START, NAV_REMOTE_START )
	end

	if coop_is_active() then
		IN_COOP = true
	end
	-- Create groups --
	group_create(GROUP_MAERO, true)
	group_create(GROUP_WEAPONS, true)
	group_create(GROUP_TRIBAL, true)
	Num_tribal_vehicles_total = Num_tribal_vehicles
	if IN_COOP then
		group_create(GROUP_TRIBAL_COOP, true)
	end

	bh11_start_persona_overrides()

	-- On Maero's vehicle destroyed, mission success --
	on_vehicle_destroyed("bh11_success_maero_vehicle_destroyed", MONSTER_TRUCK)

   mission_start_fade_in()

	delay(2)
	mission_help_table("bh11_kill_maero")

	-- Lock Brotherhood notoriety at 1 --
	notoriety_set("Brotherhood", 1) 
	notoriety_set_min("Brotherhood",1)
	notoriety_set_max("Brotherhood",1)

	-- Start gang patrol threads, and threads to allow npc's to exit their vehicle only if it's on fire --
	for i = 1, Num_tribal_vehicles, 1 do
		Thread_car_on_fire_watch[i] = thread_new("bh11_tribal_car_on_fire_watch", Bh11_tribal_vehicles[i])
		Patrol_threads[i] = thread_new("bh11_tribal_patrol", Bh11_tribal_chars[i], Bh11_tribal_vehicles[i], Bh11_tribal_navs, i)
		on_vehicle_destroyed("bh11_tribal_car_destroyed", Bh11_tribal_vehicles[i])
	end

	if IN_COOP then
		for i = 1, Num_tribal_vehicles_coop, 1 do
			Thread_car_on_fire_watch[Num_tribal_vehicles+i] = thread_new("bh11_tribal_car_on_fire_watch", Bh11_tribal_vehicles_coop[i])
			Patrol_threads[Num_tribal_vehicles+i] = thread_new("bh11_tribal_patrol", Bh11_tribal_chars_coop[i], Bh11_tribal_vehicles_coop[i], Bh11_tribal_navs_coop, 8+i)
			on_vehicle_destroyed("bh11_tribal_car_destroyed", Bh11_tribal_vehicles_coop[i])
		end
	end

	-- Begin Maero's circling of the arena
	Thread_maero_patrol = thread_new("bh11_maero_patrol")

	delay(6)

	-- Start thread to always have one Brotherhood car chasing the player --
	Thread_drivebys = thread_new("bh11_tribal_drivebys")
	Thread_secondary_drivebys = thread_new("bh11_tribal_drivebys_for_local_player_in_vehicle")

	-- if in coop, start thread to always have one Brotherhood car chasing the remote player --
	if IN_COOP then
		Thread_remote_drivebys = thread_new("bh11_tribal_drivebys_remote")
		Thread_secondary_remote_drivebys = thread_new("bh11_tribal_drivebys_for_remote_player_in_vehicle")
	end
end

function bh11_start_persona_overrides()
	persona_override_character_start(CHAR_MAERO, POT_SITUATIONS[POT_ATTACK], "MAERO_BR11_ATTACK")
	persona_override_group_start(BH11_BROTHERHOOD_PERSONAS, POT_SITUATIONS[POT_ATTACK], "BR11_ATTACK")
end

function bh11_stop_persona_overrides()
	persona_override_group_stop(BH11_BROTHERHOOD_PERSONAS, POT_SITUATIONS[POT_ATTACK])
end

function bh11_maero_damage_voice()
	audio_play_for_character(VOICE_MAERO_TAKE_DAMAGE, CHAR_MAERO, "voice")
	Maero_next_damage_level_voice_callback = Maero_next_damage_level_voice_callback - 0.1
	if Maero_next_damage_level_voice_callback <= 0 then
		on_damage("", MONSTER_TRUCK, Maero_next_damage_level_voice_callback)
	else
		on_damage("bh11_maero_damage_voice", MONSTER_TRUCK, Maero_next_damage_level_voice_callback)
	end
end

function bh11_tribal_car_destroyed()
   bh11_reduce_maero_hp()
end

function bh11_reduce_maero_hp()
   if ( vehicle_is_destroyed( MONSTER_TRUCK ) == false ) then
      -- Reduce the max hit points by the constant value, and keep the percentage damage the same
      local cur_hp = get_current_hit_points(MONSTER_TRUCK)
      local max_hp = get_max_hit_points(MONSTER_TRUCK)
      local cur_percent = cur_hp / max_hp

      -- Calculate the new max from the old max minus the decrease, and the current from the old
      -- percent and the new max.
      local new_max_hp = max_hp - Maero_truck_health_decrease
      local new_cur_hp = cur_percent * new_max_hp

      set_max_hit_points(MONSTER_TRUCK, new_max_hp)
      set_current_hit_points(MONSTER_TRUCK, new_cur_hp)
      damage_indicator_on( 0, MONSTER_TRUCK, 0, "bh11_maeros_health" )

      mission_debug( "Reducing Maero hp, old value was"..max_hp..", new value is "..new_max_hp, 12 )
   end
end

function bh11_tribal_car_on_fire_watch(vehicle)
	-- Check for vehicles on fire, and allow npc's to exit the vehicle if on fire --
	while(not vehicle_is_destroyed(vehicle)) do
		local Vehicle_smoke, Vehicle_fire = vehicle_get_smoke_and_fire_state(vehicle)
		if Vehicle_fire then
			vehicle_suppress_npc_exit(vehicle, false)
		end
		thread_yield()
	end
end


function bh11_tribal_patrol(chars, vehicle, navs, vehicle_id)
	vehicle_suppress_npc_exit(vehicle,true)

	-- setup npc weapons --
	for i = 1, sizeof_table(chars), 1 do
		npc_combat_enable(chars[i],true)
		npc_unholster_best_weapon(chars[i])
	end

   local new_hp = get_max_hit_points( vehicle ) * Tribal_vehicle_health_multiplier
   set_max_hit_points( vehicle, new_hp )
   set_current_hit_points( vehicle, new_hp )

	vehicle_enter_group_teleport(chars, vehicle)
	-- This prevents this vehicle from transitioning to ambient and then teleporting out
	-- of the arena.
	vehicle_prevent_transition_to_ambient( vehicle, true )

	delay(TABLE_PATROL_DELAYS[vehicle_id])

	-- while this vehicle is not selected as a "chaser", patrol the navpoint path --
	while (not bh11_vehicle_destroyed_or_unoccupied(vehicle)) 
			and (Chaser_vehicle_id ~= vehicle_id) 
			and (Remote_chaser_vehicle_id ~= vehicle_id)
			and (Secondary_chaser_vehicle_id ~= vehicle_id) 
			and (Secondary_remote_chaser_vehicle_id ~= vehicle_id) do
		for i = 1, 16, 1 do
			local navoffset = (vehicle_id - 1) * 2
			local navid = i + navoffset
			if navid > 16 then
				navid = navid - 16
			end
			if ( bh11_vehicle_destroyed_or_unoccupied(vehicle) == false and
              Chaser_vehicle_id ~= vehicle_id and
              Remote_chaser_vehicle_id ~= vehicle_id and
				  Secondary_chaser_vehicle_id ~= vehicle_id and
				  Secondary_remote_chaser_vehicle_id ~= vehicle_id ) then
				vehicle_pathfind_to(vehicle, navs[navid], true, true)
			end
			thread_yield()
		end
	end

   bh11_cleanup_vehicle_on_destroyed_or_abandoned( vehicle, chars )
end

function bh11_cleanup_vehicle_on_destroyed_or_abandoned( vehicle, passengers )
   bh11_abandon_vehicle( vehicle, passengers )

   if ( vehicle_exists( vehicle ) and vehicle_is_destroyed( vehicle ) == false ) then
      on_vehicle_destroyed( "", vehicle )
      bh11_reduce_maero_hp()
   end
end

function bh11_abandon_vehicle( vehicle, passengers )
	vehicle_suppress_npc_exit(vehicle, false)
   for index, passenger_name in pairs( passengers ) do
      if ( character_exists( passenger_name ) and character_is_dead( passenger_name ) == false ) then
         thread_new( "bh11_tribal_abandon_car", passenger_name )
      end
   end
end

function bh11_tribal_abandon_car( name )
   vehicle_exit( name )
   attack_closest_player( name )
end

function bh11_tribal_drivebys()
	local temp_chaser_id
	temp_chaser_id = rand_int(1,Num_tribal_vehicles_total)

	while(1) do
		-- find vehicle that is not destroyed and not chasing remote player --
		if first_chase then
			temp_chaser_id = 8
			first_chase = false
		else
			while bh11_vehicle_destroyed_or_unoccupied(Bh11_all_vehicles[temp_chaser_id]) 
					or temp_chaser_id == Remote_chaser_vehicle_id 
					or temp_chaser_id == Secondary_chaser_vehicle_id
					or temp_chaser_id == Secondary_remote_chaser_vehicle_id do
				temp_chaser_id = rand_int(1,Num_tribal_vehicles_total)
				thread_yield()
			end
		end

		-- kill the selected vehicle's patrol thread --
		Chaser_vehicle_id = temp_chaser_id
		thread_kill(Patrol_threads[Chaser_vehicle_id])
		delay(2)

		-- start thread to make vehicle chase the player --
		Thread_chase = thread_new("bh11_driveby", Bh11_all_vehicles[Chaser_vehicle_id], LOCAL_PLAYER, false, true, true)

		-- continue chase until vehicle is destroyed --
		while not bh11_vehicle_destroyed_or_unoccupied(Bh11_all_vehicles[Chaser_vehicle_id]) do
			thread_yield()
		end

      bh11_cleanup_vehicle_on_destroyed_or_abandoned( Bh11_all_vehicles[Chaser_vehicle_id], Bh11_tribal_chars[Chaser_vehicle_id] )

		-- kill the chasing vehicle thread
		thread_kill(Thread_chase)

		thread_yield()
	end
end

function bh11_driveby(veh, target, b1, b2, b3)
	vehicle_chase(veh, target, b1, b2, b3)
end

function bh11_tribal_drivebys_remote()
	local temp_remote_chaser_id
	temp_remote_chaser_id = rand_int(1,Num_tribal_vehicles_total)

	while(1) do
		-- find vehicle that is not destroyed and not chasing local player --
		while bh11_vehicle_destroyed_or_unoccupied(Bh11_all_vehicles[temp_remote_chaser_id]) 
				or temp_remote_chaser_id == Chaser_vehicle_id 
				or temp_remote_chaser_id == Secondary_chaser_vehicle_id
				or temp_remote_chaser_id == Secondary_remote_chaser_vehicle_id do
			temp_remote_chaser_id = rand_int(1,Num_tribal_vehicles_total)
			thread_yield()
		end

		-- kill the selected vehicle's patrol thread --
		Remote_chaser_vehicle_id = temp_remote_chaser_id
		thread_kill(Patrol_threads[Remote_chaser_vehicle_id])
		delay(2)

		-- start thread to make vehicle chase the player --
		Thread_remote_chase = thread_new("bh11_driveby", Bh11_all_vehicles[Remote_chaser_vehicle_id], REMOTE_PLAYER, false, true, true)

		-- continue chase until vehicle is destroyed --
		while not bh11_vehicle_destroyed_or_unoccupied(Bh11_all_vehicles[Remote_chaser_vehicle_id]) do
			thread_yield()
		end
      bh11_cleanup_vehicle_on_destroyed_or_abandoned( Bh11_all_vehicles[Remote_chaser_vehicle_id], Bh11_tribal_chars[Remote_chaser_vehicle_id] )

		-- kill the chasing vehicle thread
		thread_kill(Thread_remote_chase)

		thread_yield()
	end
end

function bh11_tribal_drivebys_for_local_player_in_vehicle()
	local temp_chaser_id
	temp_chaser_id = rand_int(1,Num_tribal_vehicles_total)

	while(1) do
		while (not character_is_in_vehicle(LOCAL_PLAYER)) do
			thread_yield()
		end

		-- find vehicle that is not destroyed and not chasing remote player and isnt the other chaser of the local_player --
		while bh11_vehicle_destroyed_or_unoccupied(Bh11_all_vehicles[temp_chaser_id]) 
				or temp_chaser_id == Chaser_vehicle_id 
				or temp_chaser_id == Remote_chaser_vehicle_id
				or temp_chaser_id == Secondary_remote_chaser_vehicle_id do
			temp_chaser_id = rand_int(1,Num_tribal_vehicles_total)
			thread_yield()
		end

		-- kill the selected vehicle's patrol thread --
		Secondary_chaser_vehicle_id = temp_chaser_id
		thread_kill(Patrol_threads[Secondary_chaser_vehicle_id])
		delay(2)

		-- start thread to make vehicle chase the player --
		Thread_secondary_chase = thread_new("bh11_driveby", Bh11_all_vehicles[Secondary_chaser_vehicle_id], LOCAL_PLAYER, false, true, true)

		-- continue chase until vehicle is destroyed --
		while (not bh11_vehicle_destroyed_or_unoccupied(Bh11_all_vehicles[Secondary_chaser_vehicle_id]))
				and (character_is_in_vehicle(LOCAL_PLAYER)) do
			thread_yield()
		end

      bh11_cleanup_vehicle_on_destroyed_or_abandoned( Bh11_all_vehicles[Secondary_chaser_vehicle_id], Bh11_tribal_chars[Secondary_chaser_vehicle_id] )

		-- kill the chasing vehicle thread
		thread_kill(Thread_secondary_chase)
		Secondary_chaser_vehicle_id = -1

		thread_yield()
	end
end

function bh11_tribal_drivebys_for_remote_player_in_vehicle()
	local temp_chaser_id
	temp_chaser_id = rand_int(1,Num_tribal_vehicles_total)

	while(1) do
		while (not character_is_in_vehicle(REMOTE_PLAYER)) do
			thread_yield()
		end

		-- find vehicle that is not destroyed and not chasing remote player and isnt the other chaser of the local_player --
		while bh11_vehicle_destroyed_or_unoccupied(Bh11_all_vehicles[temp_chaser_id]) 
				or temp_chaser_id == Chaser_vehicle_id 
				or temp_chaser_id == Remote_chaser_vehicle_id 
				or temp_chaser_id == Secondary_chaser_vehicle_id do
			temp_chaser_id = rand_int(1,Num_tribal_vehicles_total)
			thread_yield()
		end

		-- kill the selected vehicle's patrol thread --
		Secondary_remote_chaser_vehicle_id = temp_chaser_id
		thread_kill(Patrol_threads[Secondary_remote_chaser_vehicle_id])
		delay(2)

		-- start thread to make vehicle chase the player --
		Thread_secondary_remote_chase = thread_new("bh11_driveby", Bh11_all_vehicles[Secondary_remote_chaser_vehicle_id], REMOTE_PLAYER, false, true, true)

		-- continue chase until vehicle is destroyed --
		while (not bh11_vehicle_destroyed_or_unoccupied(Bh11_all_vehicles[Secondary_remote_chaser_vehicle_id]))
				and (character_is_in_vehicle(REMOTE_PLAYER)) do
			thread_yield()
		end

		-- kill the chasing vehicle thread
		thread_kill(Thread_secondary_remote_chase)
		Secondary_remote_chaser_vehicle_id = -1

		thread_yield()
	end
end

function bh11_vehicle_destroyed_or_unoccupied(vehicle)
	if ( vehicle_is_destroyed(vehicle) ) then
      return true
   end

   local character_driving = get_char_in_vehicle(vehicle, 0)

   if ( character_driving == nil ) then
      return true
   elseif ( character_is_player( character_driving ) ) then
      return true
   end

   return false
end

function bh11_maero_shot( attacker_name, attacked_name, percent_hp_remaining_after_attack )
   if ( coop_is_active() == false ) then
      local percent_damage_done = 1.0 - percent_hp_remaining_after_attack

      local hit_points_damage_done = percent_damage_done * get_max_hit_points( CHAR_MAERO )

      local new_truck_hp = get_current_hit_points( MONSTER_TRUCK ) - hit_points_damage_done
      set_current_hit_points( MONSTER_TRUCK, new_truck_hp )
   end
end

function bh11_maero_patrol()
	marker_add_vehicle(MONSTER_TRUCK, MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL, SYNC_ALL)

	-- increase Maero's truck's hit points
	local standard_hit_points = get_max_hit_points(MONSTER_TRUCK)
   local starting_hp = Maero_truck_health_multiplier * standard_hit_points
   if ( coop_is_active() ) then
      starting_hp = Maero_truck_health_multiplier_coop * standard_hit_points
   end

	set_max_hit_points( MONSTER_TRUCK, starting_hp )
	set_current_hit_points( MONSTER_TRUCK, starting_hp )
   damage_indicator_on( 0, MONSTER_TRUCK, 0, "bh11_maeros_health" )

	vehicle_max_speed(MONSTER_TRUCK, 35)
	vehicle_enter_teleport(CHAR_MAERO, MONSTER_TRUCK)
	set_unjackable_flag(MONSTER_TRUCK, true)
	-- This prevents the monster truck from transitioning to ambient and then teleporting out
	-- of the arena.
	vehicle_prevent_transition_to_ambient( MONSTER_TRUCK, true )
	vehicle_set_allow_ram_ped(MONSTER_TRUCK, true)

	-- setup Maero's behaviour
   turn_invulnerable( CHAR_MAERO )
   on_take_damage( "bh11_maero_shot", CHAR_MAERO )
	set_seatbelt_flag(CHAR_MAERO, true)
	vehicle_suppress_npc_exit(MONSTER_TRUCK,true)

	on_damage("bh11_maero_damage_voice", MONSTER_TRUCK, Maero_next_damage_level_voice_callback)

	-- make Maero circle the arena while more than three Brotherhood vehicles exist --
	while(bh11_num_tribal_drivers_driving() > 3 and not player_is_in_vehicle("#PLAYER1#")) do
		vehicle_pathfind_to(MONSTER_TRUCK, Bh11_maero_patrol, true, false)
		thread_yield()
	end

	-- when three or less Brotherhood vehicles exist, have Maero chase the player --
   vehicle_disable_flee( MONSTER_TRUCK, true )

	-- 
	while ( true ) do
		-- Find the closest living player to chase
		local distance, target_player = get_dist_closest_player_to_object( MONSTER_TRUCK )
		if ( character_is_dead( target_player ) ) then
			-- If we're in coop, there's potentially another target
			if ( coop_is_active() ) then
				if ( target_player == LOCAL_PLAYER ) then
					target_player = REMOTE_PLAYER
				else
					target_player = LOCAL_PLAYER
				end

				-- If the other potential target is dead, the mission is over
				if ( character_is_dead( target_player ) ) then
					return
				end
			else -- local player is dead and coop is inactive - the mission is over
				return
			end
		end

		-- Chase the player until he is dead
		vehicle_chase(MONSTER_TRUCK, target_player, false, true, true)
		mission_debug( "Maero chasing "..target_player )
		repeat
			thread_yield()
		until ( character_is_dead( target_player ) )

		-- Path back to the arena's center in case we're stuck on a wall
		mission_debug( "Maero pathing to center" )
		vehicle_pathfind_to( MONSTER_TRUCK, "bh11_$n011", true, false )
		mission_debug( "Maero done pathing to center" )
	end
end

function bh11_num_tribal_drivers_driving()
	local count = 0
	for i, vehicle in pairs(Bh11_all_vehicles) do
		if not bh11_vehicle_destroyed_or_unoccupied(vehicle) then
			count = count + 1
		end
	end
	return count
end

function bh11_success_maero_vehicle_destroyed()
	-- kill Maero --
   on_take_damage( "", CHAR_MAERO )
   turn_vulnerable( CHAR_MAERO )
	character_kill(CHAR_MAERO)
   damage_indicator_off( 0 )

	mission_end_success(MISSION_NAME, CUTSCENE_OUT, { NAV_MISSION_END_RESTORE_POS, NAV_MISSION_END_REMOTE_RESTORE_POS } )
end														  

function bh11_cleanup()
	-- Cleanup mission here

	trigger_enable( ARENA_TELE, true )

	marker_remove_vehicle(MONSTER_TRUCK, SYNC_ALL)

	on_death("", LOCAL_PLAYER)
	on_vehicle_destroyed("", MONSTER_TRUCK)
	for i = 1, 8, 1 do
		on_vehicle_destroyed("", Bh11_tribal_vehicles[i])
	end

	for i, thread in pairs(TABLE_ALL_THREADS) do
		if thread ~= -1 then
			thread_kill(thread)
		end
	end
   if ( coop_is_active() ) then
      if ( character_is_dead( REMOTE_PLAYER ) == false ) then
			teleport(REMOTE_PLAYER, NAV_MISSION_END_REMOTE_RESTORE_POS )
      end
   end
	if ( character_is_dead(LOCAL_PLAYER) == false ) then
		teleport(LOCAL_PLAYER, NAV_MISSION_END_RESTORE_POS)
	end

	bh11_stop_persona_overrides()

	group_destroy(GROUP_TRIBAL)
	group_destroy(GROUP_TRIBAL_COOP)
	group_destroy(GROUP_MAERO)
	group_destroy(GROUP_WEAPONS)
	release_to_world(GROUP_TRIBAL)
	release_to_world(GROUP_TRIBAL_COOP)
	release_to_world(GROUP_MAERO)
	release_to_world(GROUP_WEAPONS)
   action_nodes_restrict_spawning( false )

   if ( Sony_PEG_Demo ) then
      turn_vulnerable( LOCAL_PLAYER )
      on_take_damage( "", LOCAL_PLAYER )
      if ( coop_is_active() ) then
         turn_vulnerable( REMOTE_PLAYER )
         on_take_damage( "", REMOTE_PLAYER )
      end
   end
end

function bh11_success()
	-- Called when the mission has ended with success
	-- Unlock story arc complete rewards
end
