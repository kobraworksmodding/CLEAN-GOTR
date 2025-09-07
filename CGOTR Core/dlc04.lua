-- dlc04.lua
-- SR2 mission script



MISSION_NAME						= "dlc04"
ENEMY_GANG							= "Ultor"


-- Debug Crud --
START_AT_LIMO						= false
START_AT_ROADBLOCK				= false
DEBUG_LIMO_INVULNERABLE			= false
START_AT_CHECKPOINT				= false

--------------------------------------------------
-- THOSE NEED TO BE ALL SET TO FALSE EVENTUALLY --
--------------------------------------------------

-- Navpoints --
NAVPOINT_START						= "dlc04_$nav_local_start"
NAVPOINT_REMOTE_START			= "dlc04_$nav_remote_start"
NAV_HELI_START01					= "dlc04_$nav_heli_start01"
NAV_HELI_START02					= "dlc04_$nav_heli_start02"
NAV_HELI_START03					= "dlc04_$nav_heli_start03"
NAV_LIMO_START03					= "dlc04_$nav_limo_start03"
NAV_ANTI_HELI						= "dlc04_$nav_anti_heli"
NAV_ANTI_HELI2						= "dlc04_$nav_anti_heli2"
NAV_CORPSE							= "dlc04_$n119"
NAVPOINT_END						= "dlc04_$nav_local_end"
NAVPOINT_REMOTE_END				= "dlc04_$nav_remote_end"


NAV_START_CHECKPOINT				= "dlc04_$n034"
NAV_START_COOP_CHECKPOINT		= "dlc04_$n035"


-- Characters --
PILOT									= "dlc04_$npc_pilot"
GRYPHON								= "dlc04_$Gryphon"
DRIVER								= "dlc04_$driver"
ANTI_HELI_PILOT01					= "dlc04_$anti_heli_pilot01"
ANTI_HELI_PILOT02					= "dlc04_$anti_heli_pilot02"

TURNCOP01							= "dlc04_$c000 (3)"
TURNCOP02							= "dlc04_$c000 (2)"

-- Vehicles --
HELICOPTER_NAME					= "dlc04_$veh_heli"
LIMO									= "dlc04_$veh_limo"
ANTI_HELI_HELI						= "dlc04_$veh_anti_heli_heli"
HELI_CORPSE							= "dlc04_$v006"

-- Groups --
GROUP_START							= "dlc04_$start"
GROUP_PROTECT						= "dlc04_$protect"
GROUP_ULTOR_OVERPASS				= "dlc04_$ultor_overpass01"
GROUP_ULTOR_ANTI_HELI			= "dlc04_$ultor_anti_heli"
GROUP_HELI_CORPSE					= "dlc04_$group_heli_corpse"
GROUP_ULTOR_ROADBLOCK_CARS		= "dlc04_$ultor_roadblock_cars"
GROUP_ULTOR_ROADBLOCK_GUYS		= "dlc04_$ultor_roadblock_guys"
GROUP_BLOCK01						= "dlc04_$group_block01"
GROUP_BLOCK02						= "dlc04_$group_block02"

-- Dialog --
HELICOPTER_TUNNEL_LINE_NAV			= "dlc04_$n064"

-- One offs
LINE_HELICOPTER_SPOTTED  			= "PLAYER_DLC0201_AMBUSHED"		--Play this when the the player sees the attack helicopter just before crashing.  		"That's not good…"
LINE_HELICOPTER_CRASHING 			= "PLAYER_DLC0201_CRASH_1"			--Play this when the helicopter is going down. 														"This ain't how I pictured my day going!"
LINE_HELICOPTER_TUNNELS 			= "PLAYER_DLC0201_RADIO_2"			--Play when the helicopter is flying through the tunnels 										"We gotta move fast! I can't get a shot with this shit in the way!"
LINE_DRIVER_KILLED					= "GRYPHON_DLC0201_DRVRKILLED"	--Play when the Limo stops at the final roadblock.													"It appears I'm going to need a new driver…"
LINE_GRYPHON_APPRAOCH_OVERPASS	= "GRYPHON_DLC0201_DESTRB_1"		--Play when the helicopter pulls ahead of the Limo to shoot the guys on the overpass.	"Clear that roadblock!"
LINE_GRYPHON_OVERPASS 				= "GRYPHON_DLC0201_DESTRB_2"		--Play while the player is shooting the guys on the overpass									"We can't wait any longer. Kill them!"
LINE_FINAL_ROADBLOCK 				= "PLAYER_DLC0201_BETTERSHOT" 	--Play this before the helicopter starts to fly circles around the final roadblock.		"This ain't gonna work. Swing around so I can get a better shot!"

-- Conversations
CONVERSATION_MEET_LIMO 				= {		--Play about 10 seconds into the flight from the mission start over to where the helicopter meets the limo.
	{ "GRYPHON_DLC0201_START", PILOT, 0.0 },               -- Dex's team is on the way. Keep them away from me.
	{ "PLAYER_DLC0201_RADIO_1", LOCAL_PLAYER, 0.0 },           -- Just keep driving and we won't have a problem. 
}
CONVERSATION_APPROACH_ROADBLOCK 	= {		-- Play this when the Limo is approaching the final roadblock.
	{	"GRYPHON_DLC0201_ROADBLOCK", PILOT, 0.0 },			-- They've set up a road block.  We can't get through them.
	{	"PLAYER_DLC0201_ROADBLOCK", LOCAL_PLAYER, 0.0},		-- If these bitches are just gonna stand there, it's their own funeral…
}
CONVERSATION_AFTER_OVERPASS 		= { 		--Play as the helicopter swings back around to follow the limo again.
	{ "GRYPHON_DLC0201_RBDESTROYED",	PILOT, 0.0 },			-- Did you have to make such a mess?
	{ "PLAYER_DLC0201_CLEARED", LOCAL_PLAYER, 0.0 },			-- Quit your bitching, you're still alive ain't you?
}
CONVERSATION_HELICOPTER_CRASHED 	= {		--After the player has crashed and is on foot.
	{ "PLAYER_DLC0201_CRASH_2", LOCAL_PLAYER, 0.0 },         -- We're gonna do this the hard way… Keep your head down till I get us a car.
	{ "GRYPHON_DLC0201_GETINCAR", PILOT, 0.0 },           	-- Just get us out of here.
}

-- Cutscenes --
CUTSCENE_IN							= "rn04-01"
CUTSCENE_OUT						= "rn04-02"

-- Personas --

-- Checkpoints --
CHECKPOINT_START					= MISSION_START_CHECKPOINT		-- defined in ug_lib.lua
CHECKPOINT_CRASH					= "dlc04_checkpoint_crash"		-- after the helicopter crashes

-- Triggers --
TRIGGER_ROADBLOCK					= "dlc04_$trigger_roadblock"
TRIGGER_CIRCLE_ROADBLOCK		= "dlc04_$trigger_circle_roadblock"
TRIGGER_HOLY_CRAP					= "dlc04_$trigger_holy_crap"
HELI_IN_TROUBLE_TRIGGER			= "dlc04_$trigger_in_trouble"
HELI_GOING_DOWN_TRIGGER			= "dlc04_$trigger_going_down"
HELI_EJECTION_TRIGGER			= "dlc04_$trigger_ejection"
TRIGGER_ANTI_HELI					= "dlc04_$trigger_anti_heli"
TRIGGER_GRYPHON					= "dlc04_$trigger_gryphon"
TRIGGER_END							= "dlc04_$trigger_end"
TRIGGER_GO_TO_AMBUSH				= "dlc04_$trigger_go_to_ambush"
TRIGGER_START_LIMO				= "dlc04_$trigger_start_limo"

-- Booleans --
Gryphon_should_play_limo_damaged_line	= 	false

-- Threads --
Audio_thread_handle 				= INVALID_THREAD_HANDLE
Limo_damage_lines_thread		= INVALID_THREAD_HANDLE


-- Paths --
HELI_FIRST_PATH					= "dlc04_$path_heli01"
HELI_FIRST_PATH_SPEED			= 40
HELI_SECOND_PATH					= "dlc04_$path_heli02"
HELI_SECOND_PATH_SPEED			= 20
HELI_SECOND_PATH_TWO				= "dlc04_$path_heli02b"
HELI_SECOND_PATH_TWO_SPEED		= 25
HELI_THIRD_PATH_A					= "dlc04_$path_heli03a"
HELI_THIRD_PATH_B					= "dlc04_$path_heli03b"
HELI_THIRD_PATH_SPEED			= 40
HELI_FOURTH_PATH					= "dlc04_$path_heli04"
HELI_FOURTH_PATH_SPEED			= 15
HELI_FIFTH_PATH					= "dlc04_$path_heli05"
HELI_FIFTH_PATH_SPEED			= 30
HELI_SIXTH_PATH					= "dlc04_$path_heli06"
HELI_SIXTH_PATH_SPEED			= 30

LIMO_FIRST_PATH					= "dlc04_$path_limo01"
LIMO_FIRST_PATH_SPEED			= 37
LIMO_SECOND_PATH					= "dlc04_$path_limo02"
LIMO_SECOND_PATH_SPEED			= 40

PATH_HELI_PURSUIT					= "dlc04_$path_heli_pursuit"

-- Misc --
PLAYER_WEAPON						= "AR50_launcher"
HELI_HIT_POINTS					= 16000
HELI_MAX_BANK_ANGLE				= 0.3
ULTOR_VEHICLE_HEALTH				= 6000
JUMP_SPEED							= 35
LIMO_HIT_POINTS					= 23500
DEBUG_LIMO_HITPOINTS				= 23500

-- Ultor Attack Dogs and Triggers --
GROUP_ULTOR_ATTACK_01			= "dlc04_$group_ultor_attack_01"
TRIG_ULTOR_ATTACK_01				= "dlc04_$trig_ultor_attack_01"
ULTOR_VEH_01						= "dlc04_$v001"
ULTOR_DRIVER_01					= "dlc04_$c001"
ULTOR_PASS_01						= "dlc04_$c002"
ULTOR_VEH_02						= "dlc04_$v002"
ULTOR_DRIVER_02					= "dlc04_$c003"
ULTOR_PASS_02						= "dlc04_$c004"
ULTOR_VEH_09						= "dlc04_$v011"
ULTOR_DRIVER_09					= "dlc04_$c019"
ULTOR_PASS_09						= "dlc04_$c020"

GROUP_ULTOR_ATTACK_01B			= "dlc04_$group_ultor_attack_01b"
ULTOR_VEH_13						= "dlc04_$v015"
ULTOR_DRIVER_13					= "dlc04_$c027"
ULTOR_PASS_13						= "dlc04_$c028"

GROUP_ULTOR_ATTACK_02			= "dlc04_$group_ultor_attack_02"
TRIG_ULTOR_ATTACK_02				= "dlc04_$trig_ultor_attack_02"
ULTOR_VEH_03						= "dlc04_$v003"
ULTOR_DRIVER_03					= "dlc04_$c005"
ULTOR_PASS_03						= "dlc04_$c006"
ULTOR_VEH_04						= "dlc04_$v004"
ULTOR_DRIVER_04					= "dlc04_$c007"
ULTOR_PASS_04						= "dlc04_$c008"

GROUP_ULTOR_JUMP_01				= "dlc04_$group_ultor_jump_01"
ULTOR_VEH_05						= "dlc04_$v005"
ULTOR_DRIVER_05					= "dlc04_$c009"
ULTOR_PASS_05						= "dlc04_$c010"
NAV_JUMP_01							= "dlc04_$n112"

GROUP_ULTOR_ATTACK_03			= "dlc04_$group_ultor_attack_03"
TRIG_ULTOR_ATTACK_03				= "dlc04_$trig_ultor_attack_03"
ULTOR_VEH_06						= "dlc04_$v008"
ULTOR_DRIVER_06					= "dlc04_$c012"
ULTOR_PASS_06						= "dlc04_$c013"
ULTOR_VEH_07						= "dlc04_$v009"
ULTOR_DRIVER_07					= "dlc04_$c014"
ULTOR_PASS_07						= "dlc04_$c015"

TRIG_HELI_PURSUIT					= "dlc04_$trigger_heli_pursuit"
GROUP_HELI_PURSUIT				= "dlc04_$group_airpursuit"
ULTOR_VEH_08						= "dlc04_$v010"
ULTOR_DRIVER_08					= "dlc04_$c016"
ULTOR_PASS1_08						= "dlc04_$c017"
ULTOR_PASS2_08						= "dlc04_$c018"
NAV_HELI_PURSUIT					= "dlc04_$n037"

GROUP_ULTOR_ATTACK_04			= "dlc04_$group_ultor_attack_04"
TRIG_ULTOR_ATTACK_04				= "dlc04_$trig_ultor_attack_04"
ULTOR_VEH_11						= "dlc04_$v012"
ULTOR_DRIVER_11					= "dlc04_$c021"
ULTOR_PASS_11						= "dlc04_$c022"
ULTOR_VEH_10						= "dlc04_$v013"
ULTOR_DRIVER_10					= "dlc04_$c023"
ULTOR_PASS_10						= "dlc04_$c024"
ULTOR_VEH_12						= "dlc04_$v014"
ULTOR_DRIVER_12					= "dlc04_$c025"
ULTOR_PASS_12						= "dlc04_$c026"

BLOCK01_GUARDS						= {"dlc04_$c029", "dlc04_$c029 (0)", "dlc04_$c029 (1)", "dlc04_$c029 (2)"}
NUM_BLOCK01_GUARDS				= 4

BLOCK02_GUARDS						= {"dlc04_$c030", "dlc04_$c031", "dlc04_$c032", "dlc04_$c033"}
NUM_BLOCK02_GUARDS				= 4


TABLE_ALL_TRIGGERS 				= { 	TRIG_ULTOR_ATTACK_04, TRIG_ULTOR_ATTACK_03, TRIG_ULTOR_ATTACK_02, TRIG_ULTOR_ATTACK_01, TRIGGER_ROADBLOCK, TRIGGER_CIRCLE_ROADBLOCK, 
												TRIGGER_HOLY_CRAP, HELI_IN_TROUBLE_TRIGGER, HELI_GOING_DOWN_TRIGGER, HELI_EJECTION_TRIGGER, TRIGGER_ANTI_HELI, TRIGGER_GRYPHON, TRIGGER_END,
												TRIGGER_GO_TO_AMBUSH, TRIGGER_START_LIMO	}
 
Temp_weapons_removed				= false

-- Ignore This Stuff --
GROUP_MYSTERY						= "dlc04_$group_mystery"
V_UFO									= "dlc04_$v_ufo"
C_ALIEN								= "dlc04_$c_alien"
MYSTERY_PATH						= "dlc04_$path_ufo"

Mission_won = false

---------------------------------
-- Start Actual Functions Here --
---------------------------------

function dlc04_start(checkpoint_name, is_restart)
	-- Some damned fool paid money for this and they demand some form of entertainment.
	set_mission_author("None Yet")
	notoriety_force_no_spawn( "Police", true )
	set_cops_shooting_from_vehicles( true )
   set_player_can_enter_exit_vehicles( LOCAL_PLAYER, false )
   if ( coop_is_active() ) then
      set_player_can_enter_exit_vehicles( REMOTE_PLAYER, false )
   end

	mission_start_fade_out()
	
   -- Don't play the intro cutscene when restarting the mission.
	--if (is_restart) then
		teleport_coop( NAVPOINT_START, NAVPOINT_REMOTE_START ) 
	--else
		-- Play the intro cutscene
		--cutscene_play( CUTSCENE_IN, "", { NAVPOINT_START, NAVPOINT_REMOTE_START }, false)
	--end

	-- Create the helicopter and limo protect groups
	group_create_hidden( GROUP_START, true )

	if START_AT_CHECKPOINT == true then
		checkpoint_name = CHECKPOINT_CRASH
	end
	
	if ( checkpoint_name == MISSION_START_CHECKPOINT ) then
		group_create_hidden( GROUP_PROTECT, true )
		-- Add and equip the appropriate weapons
		inv_weapon_add_temporary( LOCAL_PLAYER, PLAYER_WEAPON, 1, true, true )
		inv_weapon_add_temporary( LOCAL_PLAYER, "grenade", 1, true)
		if ( coop_is_active() ) then
			inv_weapon_add_temporary( REMOTE_PLAYER, PLAYER_WEAPON, 1, true, true ) 
			inv_weapon_add_temporary( REMOTE_PLAYER, "grenade", 1, true)
		end
		Temp_weapons_removed = false
		group_show( GROUP_START )
		party_dismiss_all()
		dlc04_board_helicopter()		
	elseif ( checkpoint_name == CHECKPOINT_CRASH ) then
		Temp_weapons_removed = true
		dlc04_crash_checkpoint_start()
	end
end

function dlc04_board_helicopter()
	repeat
		thread_yield()	
	until ( inv_item_is_equipped( PLAYER_WEAPON, LOCAL_PLAYER ) )
   if ( coop_is_active() ) then
		repeat
			thread_yield()	
		until ( inv_item_is_equipped( PLAYER_WEAPON, REMOTE_PLAYER ) )
   end

	-- Wait until both players are in the vehicle before continuing
   vehicle_enter_teleport( LOCAL_PLAYER, HELICOPTER_NAME, 2, true )
	if ( coop_is_active() ) then
      vehicle_enter_teleport( REMOTE_PLAYER, HELICOPTER_NAME, 3, true )
   end
	
   while ( character_is_in_vehicle( LOCAL_PLAYER, HELICOPTER_NAME ) == false ) do
      thread_yield( )
   end
	if ( coop_is_active() ) then
      while ( character_is_in_vehicle( REMOTE_PLAYER, HELICOPTER_NAME ) == false ) do
         thread_yield( 0 )
      end
   end

   -- Finally, teleport the pilot into the helicopter
   vehicle_enter_teleport( PILOT, HELICOPTER_NAME, 0, true )
	repeat
		thread_yield()	
	until ( character_is_in_vehicle( PILOT, HELICOPTER_NAME ) )
	
	-- Only allow the rifle slot
	inv_weapon_disable_all_but_this_slot(WEAPON_SLOT_RIFLE)

	-- Do miscellaneous things to the helicopter to make it ready for the trip
	dlc04_heli_prepare_for_launch()
	thread_new("dlc04_should_play_tunnel_line")
	
	-- Launch the heli
	if ( START_AT_LIMO ) then
		mission_start_fade_in()
		dlc04_start_at_limo()
	elseif ( START_AT_ROADBLOCK ) then
		mission_start_fade_in()	
		dlc04_start_at_roadblock()
	else
		dlc04_heli_do_path()
	end
end

function dlc04_heli_prepare_for_launch()
   vehicle_prevent_explosion_fling( HELICOPTER_NAME, true )
   set_max_hit_points( HELICOPTER_NAME, HELI_HIT_POINTS )
   set_current_hit_points( HELICOPTER_NAME, HELI_HIT_POINTS )
	set_unrecruitable_flag( PILOT, true )
	on_death( "dlc04_pilot_killed", PILOT )
   helicopter_set_max_bank_angle( HELICOPTER_NAME, HELI_MAX_BANK_ANGLE )
end

---------------------------
-- Helicopter Path Stuff --
---------------------------

function dlc04_heli_do_path()
	
	on_vehicle_destroyed( "dlc04_helicopter_destroyed", HELICOPTER_NAME )
	group_create( GROUP_BLOCK01 )
	thread_new("dlc04_starting_objective")
	trigger_enable( TRIGGER_START_LIMO, true )
	on_trigger( "dlc04_start_limo", TRIGGER_START_LIMO )
	on_trigger( "dlc04_ultor_attack_01", TRIG_ULTOR_ATTACK_01 )
	teleport_vehicle( HELICOPTER_NAME, NAV_HELI_START01 )
	mission_start_fade_in()	
	mission_help_table("TEXT_WIP_DISCLAIMER", SYNC_ALL)	
   helicopter_fly_to_direct( HELICOPTER_NAME, HELI_FIRST_PATH_SPEED, HELI_FIRST_PATH )
	-- Setup next section's ultor
	
	delay(10)
	dlc04_play_voice(CONVERSATION_MEET_LIMO)	--	Play this about 10 seconds in...

end

function dlc04_start_limo()
	dlc04_setup_protect_target()
	thread_new( "dlc04_start_limo_path" )
end

function dlc04_heli_path_part_two()
	group_create( GROUP_ULTOR_OVERPASS )
	trigger_enable( TRIGGER_GO_TO_AMBUSH, true )
	on_trigger( "dlc04_heli_path_part_two_too", TRIGGER_GO_TO_AMBUSH )
	helicopter_fly_to_direct_follow( HELICOPTER_NAME, HELI_SECOND_PATH_SPEED, LIMO, HELI_SECOND_PATH )
end

function dlc04_heli_path_part_two_too()
	release_to_world( GROUP_ULTOR_ATTACK_01B )
	trigger_enable( TRIGGER_GO_TO_AMBUSH, false )
	helicopter_fly_to_direct( HELICOPTER_NAME, HELI_SECOND_PATH_TWO_SPEED, HELI_SECOND_PATH_TWO )
	-- Have some of the Ultor turn around when the heli shows up.
	thread_new("dlc04_overpass_turn_to")

	trigger_enable( TRIG_ULTOR_ATTACK_02, true )
	on_trigger( "dlc04_ultor_attack_02", TRIG_ULTOR_ATTACK_02 )

	delay ( 4 )
	thread_new( "dlc04_mystery" )
	-- Line while shooting on said overpass
	dlc04_play_voice(LINE_GRYPHON_OVERPASS, PILOT)
	delay ( 4 )
	thread_new( "dlc04_start_limo_path_two" )
	delay ( 4 )
	dlc04_heli_path_part_three()
end

function dlc04_overpass_turn_to()
	if( character_exists(TURNCOP01) and (not character_is_dead(TURNCOP01)) ) then
		turn_to_char(TURNCOP01, LOCAL_PLAYER)
	end
	if( character_exists(TURNCOP02) and (not character_is_dead(TURNCOP02)) ) then
		turn_to_char(TURNCOP02, LOCAL_PLAYER)
	end
end

function dlc04_heli_path_part_three()
	dlc04_play_voice(CONVERSATION_AFTER_OVERPASS)
	helicopter_fly_to_direct( HELICOPTER_NAME, HELI_THIRD_PATH_SPEED, HELI_THIRD_PATH_A )
	helicopter_fly_to_direct_follow( HELICOPTER_NAME, HELI_THIRD_PATH_SPEED, LIMO, HELI_THIRD_PATH_B )
end

function dlc04_setup_protect_target()
	-- TODO:  Make the Limo appear as a green X under the reticule.
	group_show( GROUP_PROTECT )
	group_create_hidden( GROUP_ULTOR_ATTACK_01 )
	vehicle_enter_teleport( DRIVER, LIMO, 0, true )
	vehicle_enter_teleport( GRYPHON, LIMO, 2, true )
	vehicle_infinite_mass( LIMO, true ) 
   turn_invulnerable( GRYPHON )
	turn_invulnerable( DRIVER )
	turn_invulnerable( PILOT )
   set_max_hit_points( LIMO, LIMO_HIT_POINTS )
	damage_indicator_on(0, LIMO, 0.0, "TEXT_HUD_LIMO_HEALTH_LABEL")
	marker_add_vehicle( LIMO, MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE, SYNC_ALL )
	vehicle_set_crazy( LIMO, false )
	vehicle_set_explosion_damage_multiplier( LIMO, 0.25 )
   vehicle_suppress_npc_exit( LIMO, true )
	vehicle_never_flatten_tires( LIMO, true )
	set_unjackable_flag( LIMO, true )
	vehicle_disable_flee( LIMO, true )
	vehicle_disable_chase( LIMO, true )
   set_cant_flee_flag( DRIVER, true )	
	set_cant_flee_flag( GRYPHON, true )	
	
	on_take_damage( "dlc04_limo_take_damage", LIMO )
	on_vehicle_destroyed( "dlc04_limo_destroyed", LIMO )
	on_death( "dlc04_gryphon_died", GRYPHON )

	Limo_damage_lines_thread = thread_new("dlc04_limo_damage_lines")

	if ( DEBUG_LIMO_INVULNERABLE ) then
		turn_invulnerable( LIMO )
	end
end

function dlc04_starting_objective()
	delay(5)
	mission_help_table("TEXT_PROTECT_THE_LIMO", SYNC_ALL)
end

function dlc04_start_limo_path()
	vehicle_max_speed( LIMO, LIMO_FIRST_PATH_SPEED )
	vehicle_speed_override( LIMO, LIMO_FIRST_PATH_SPEED )
   vehicle_pathfind_to( LIMO, LIMO_FIRST_PATH, true, true )
	-- Line for approaching the overpass.. this may need to be moved
	vehicle_speed_cancel( LIMO )
	dlc04_play_voice(LINE_GRYPHON_APPRAOCH_OVERPASS, PILOT)
	turn_invulnerable( LIMO )
end

function dlc04_start_limo_path_two()
	
	if DEBUG_LIMO_INVULNERABLE == false then
		turn_vulnerable( LIMO )
	end
	
	vehicle_max_speed( LIMO, LIMO_SECOND_PATH_SPEED )
	vehicle_speed_override( LIMO, LIMO_SECOND_PATH_SPEED )
   vehicle_pathfind_to( LIMO, LIMO_SECOND_PATH, true, true )
	vehicle_speed_cancel( LIMO )
	vehicle_exit( DRIVER, true)
	turn_vulnerable( DRIVER )
	delay(1)
	dlc04_play_voice(LINE_DRIVER_KILLED, PILOT)
	character_kill( DRIVER )
	
	dlc04_circle_the_roadblock()
end


function dlc04_should_play_tunnel_line()
	while true do
		local current_dist = get_dist(HELICOPTER_NAME, HELICOPTER_TUNNEL_LINE_NAV)

		-- Play the line when we get close to this nav point on the path
		if (not vehicle_is_destroyed(HELICOPTER_NAME)) and (current_dist < 20) then
			if thread_check_done(Audio_thread_handle) then
				dlc04_play_voice(LINE_HELICOPTER_TUNNELS, LOCAL_PLAYER)
				return
			end
		end

		thread_yield()
	end
end


-- Random Vehicle Damage line --
function dlc04_limo_damage_lines()
	--Play these when the Limo takes damage but no more than one every 20-30 seconds.
	local Gryphon_taking_damage_lines = "GRYPHON_DLC0201_TAKEDAM"
	
	-- Don't play any lines for a bit
	delay(15)
	
	local health_ratio = 0
	while(true) do
		health_ratio = get_current_hit_points(LIMO)/get_max_hit_points(LIMO)

		if health_ratio < .9 and thread_check_done(Audio_thread_handle) == true then
			if Gryphon_should_play_limo_damaged_line == true then
 				dlc04_play_voice(Gryphon_taking_damage_lines, PILOT)
				Gryphon_should_play_limo_damaged_line = false
				delay(20 + rand_int(0, 10))	-- Play one every 20 - 30 seconds
			end
		end
		
		Gryphon_should_play_limo_damaged_line = false
		thread_yield()		
	end
	
end

function dlc04_limo_take_damage()
	Gryphon_should_play_limo_damaged_line = true 	-- How ya doin' thread
end

-----------------------------------
-- Ultor Attack Vehicle Triggers --
-----------------------------------

function dlc04_ultor_attack_01( activator )
	if ( not ( activator == GRYPHON )) then
		return
	end
	thread_new( "dlc04_update_limo_hitpoints" )
	trigger_enable( TRIG_ULTOR_ATTACK_01, false )

	for i = 1, NUM_BLOCK01_GUARDS, 1 do
		thread_new( "dlc04_blockade_guard_attack", BLOCK01_GUARDS[i] ) 
	end

	-- This time only, set the helicopter in motion once again.
	thread_new( "dlc04_heli_path_part_two" )
	delay(3)
	group_show( GROUP_ULTOR_ATTACK_01 )
	thread_new( "dlc04_ultor_chasify", ULTOR_VEH_01, ULTOR_DRIVER_01, ULTOR_PASS_01 )
	thread_new( "dlc04_ultor_chasify", ULTOR_VEH_09, ULTOR_DRIVER_09, ULTOR_PASS_09 )
	thread_new( "dlc04_ultor_chasify", ULTOR_VEH_02, ULTOR_DRIVER_02, ULTOR_PASS_02 )
	-- Get the next group ready
	group_create_hidden( GROUP_ULTOR_ATTACK_02 )
	group_create_hidden( GROUP_ULTOR_JUMP_01 )
	-- Get the extra vehicle ready
	group_create( GROUP_ULTOR_ATTACK_01B )
	vehicle_enter_teleport( ULTOR_DRIVER_13, ULTOR_VEH_13, 0, true )
	vehicle_enter_teleport( ULTOR_PASS_13, ULTOR_VEH_13, 1, true )
	vehicle_suppress_npc_exit( ULTOR_VEH_13, true ) 
	set_max_hit_points( ULTOR_VEH_13, ULTOR_VEHICLE_HEALTH )
	thread_new( "dlc04_ultor_attack_01b" )
end

function dlc04_ultor_attack_01b()
	release_to_world( GROUP_BLOCK01 )
	-- Wait until the Limo is driving by this vehicle before launching it
	repeat
		delay(.25)
	until get_dist( ULTOR_VEH_13, GRYPHON ) < 10
	vehicle_chase( ULTOR_VEH_13, GRYPHON, true, true, true ) 
end

function dlc04_ultor_attack_02( activator )
	if ( not ( activator == GRYPHON )) then
		return
	end
	trigger_enable( TRIG_ULTOR_ATTACK_02, false )
	group_show( GROUP_ULTOR_ATTACK_02 )
	thread_new( "dlc04_ultor_chasify", ULTOR_VEH_03, ULTOR_DRIVER_03, ULTOR_PASS_03 )
	thread_new( "dlc04_ultor_chasify", ULTOR_VEH_04, ULTOR_DRIVER_04, ULTOR_PASS_04 )
	-- Add the jumper

	thread_new( "dlc04_ultor_jumper02" )
	trigger_enable( TRIGGER_ROADBLOCK, true )
   on_trigger( "dlc04_prep_for_roadblock", TRIGGER_ROADBLOCK )

	trigger_enable( TRIG_HELI_PURSUIT, true )
   on_trigger( "dlc04_ultor_heli_pursuit", TRIG_HELI_PURSUIT )
	
	trigger_enable( TRIG_ULTOR_ATTACK_03, true )
   on_trigger( "dlc04_ultor_attack_03", TRIG_ULTOR_ATTACK_03 )

	group_create_hidden( GROUP_HELI_PURSUIT )
end

function dlc04_ultor_jumper02()
	delay(1)
	group_show( GROUP_ULTOR_JUMP_01 )
	vehicle_enter_teleport( ULTOR_DRIVER_05, ULTOR_VEH_05, 0, true )
	vehicle_enter_teleport( ULTOR_PASS_05, ULTOR_VEH_05, 1, true )
	vehicle_suppress_npc_exit( ULTOR_VEH_05, true ) 
	set_max_hit_points( ULTOR_VEH_05, ULTOR_VEHICLE_HEALTH )

	thread_new( "dlc04_vehicle_jump", ULTOR_VEH_05, NAV_JUMP_01 )
	delay(5)
	group_create_hidden( GROUP_ULTOR_ATTACK_03 )
end

function dlc04_ultor_attack_03( activator )
	if ( not ( activator == GRYPHON )) then
		return
	end
	trigger_enable( TRIG_ULTOR_ATTACK_03, false )
	group_show( GROUP_ULTOR_ATTACK_03 )
	thread_new( "dlc04_ultor_chasify", ULTOR_VEH_06, ULTOR_DRIVER_06, ULTOR_PASS_06 )
	thread_new( "dlc04_ultor_chasify", ULTOR_VEH_07, ULTOR_DRIVER_07, ULTOR_PASS_07 )
end

function dlc04_ultor_heli_pursuit()
	-- This time only, set the helicopter in motion once again.
	trigger_enable(TRIG_HELI_PURSUIT, false)
	
	group_show( GROUP_HELI_PURSUIT )
	vehicle_enter_teleport( ULTOR_DRIVER_08, ULTOR_VEH_08, 0, true )
	vehicle_enter_teleport( ULTOR_PASS1_08, ULTOR_VEH_08, 4, true )
	vehicle_enter_teleport( ULTOR_PASS2_08, ULTOR_VEH_08, 5, true )
	vehicle_suppress_npc_exit( ULTOR_VEH_08, true ) 
	
	inv_item_remove_all(ULTOR_PASS1_08)
	inv_item_remove_all(ULTOR_PASS2_08)
	inv_item_add("m16", 0, ULTOR_PASS1_08, true) 	
	inv_item_add("m16", 0, ULTOR_PASS2_08, true) 	

	teleport_vehicle( ULTOR_VEH_08, NAV_HELI_PURSUIT )
	group_create_hidden( GROUP_ULTOR_ATTACK_04 )
	group_create_hidden( GROUP_BLOCK02 )
	trigger_enable( TRIG_ULTOR_ATTACK_04, true )
	on_trigger( "dlc04_ultor_attack_04", TRIG_ULTOR_ATTACK_04 )
	helicopter_fly_to_direct_follow( ULTOR_VEH_08, HELI_THIRD_PATH_SPEED, LIMO, PATH_HELI_PURSUIT )
end

function dlc04_ultor_attack_04( activator )
	if ( not ( activator == GRYPHON )) then
		return
	end
	trigger_enable( TRIG_ULTOR_ATTACK_04, false )
	group_show( GROUP_BLOCK02 )
	group_show( GROUP_ULTOR_ATTACK_04 )
	thread_new( "dlc04_ultor_chasify", ULTOR_VEH_11, ULTOR_DRIVER_11, ULTOR_PASS_11 )
	thread_new( "dlc04_ultor_chasify", ULTOR_VEH_10, ULTOR_DRIVER_10, ULTOR_PASS_10 )
	thread_new( "dlc04_ultor_chasify", ULTOR_VEH_12, ULTOR_DRIVER_12, ULTOR_PASS_12 )

	for i = 1, NUM_BLOCK02_GUARDS, 1 do
		thread_new( "dlc04_blockade_guard_attack", BLOCK02_GUARDS[i] )  
	end

end

function dlc04_blockade_guard_attack( guard )

	attack_safe( guard, GRYPHON, true )
end

-----------------------------------
-- Roadblock Setup and Execution --
-----------------------------------

function dlc04_prep_for_roadblock( activator )
	if ( not ( activator == GRYPHON )) then
		return
	end

	thread_new("dlc04_make_limo_invulnerable_for_roadblock")

	group_create( GROUP_ULTOR_ROADBLOCK_CARS )
	group_create( GROUP_ULTOR_ROADBLOCK_GUYS )
	-- trigger_enable( TRIGGER_CIRCLE_ROADBLOCK, true )
   -- on_trigger( "dlc04_circle_the_roadblock", TRIGGER_CIRCLE_ROADBLOCK )
	
	dlc04_play_voice(CONVERSATION_APPROACH_ROADBLOCK)
	
	delay(1)

	-- Make a bunch of Masako attack the limo
	for i = 0, 8 do
		attack_safe("dlc04_$c011 (" .. i .. ")", GRYPHON, false)
	end
	
	-- Make the rest attack the player
	attack_safe("dlc04_$c011", LOCAL_PLAYER, false)
	attack_safe("dlc04_$c012", LOCAL_PLAYER, false)
	attack_safe("dlc04_$c013", LOCAL_PLAYER, false)
	attack_safe("dlc04_$c014", LOCAL_PLAYER, false)
	attack_safe("dlc04_$c015", LOCAL_PLAYER, false)

end

function dlc04_make_limo_invulnerable_for_roadblock()

	while( vehicle_exists(LIMO) and (not vehicle_is_destroyed(LIMO)) and (get_dist(LIMO, "dlc04_$n111") > 50) ) do
		thread_yield()
	end

	if (vehicle_exists(LIMO) and (not vehicle_is_destroyed(LIMO))) then
		turn_invulnerable(LIMO)
	end

end

function dlc04_circle_the_roadblock()
	-- trigger_enable( TRIGGER_CIRCLE_ROADBLOCK, false )
	turn_invulnerable( LIMO )
	group_create_hidden( GROUP_ULTOR_ANTI_HELI )
	dlc04_play_voice(LINE_FINAL_ROADBLOCK, LOCAL_PLAYER)	--	 "We need to swing around" or whatever

	-- Don't allow the damage lines to play anymore
	on_take_damage( "", LIMO )
	thread_kill(Limo_damage_lines_thread)
	
	helicopter_fly_to_direct( HELICOPTER_NAME, HELI_FOURTH_PATH_SPEED, HELI_FOURTH_PATH )
	-- We're going to circle this twice but this time add the trigger to get us out of this loop.
	--	trigger_enable( TRIGGER_ANTI_HELI, true )
	-- on_trigger( "dlc04_anti_heli_path", TRIGGER_ANTI_HELI )
	helicopter_fly_to_direct( HELICOPTER_NAME, HELI_FOURTH_PATH_SPEED, HELI_FOURTH_PATH )
-- end

-- function dlc04_anti_heli_path()
	--	trigger_enable( TRIGGER_ANTI_HELI, false )
	group_show( GROUP_ULTOR_ANTI_HELI )
	vehicle_enter_teleport( ANTI_HELI_PILOT01, ANTI_HELI_HELI, 0, true )
	vehicle_enter_teleport( ANTI_HELI_PILOT02, ANTI_HELI_HELI, 1, true )
	teleport_vehicle( ANTI_HELI_HELI, NAV_ANTI_HELI )
	helicopter_fly_to_direct( ANTI_HELI_HELI, 10, NAV_ANTI_HELI2 )
	turn_invulnerable( ANTI_HELI_HELI )
	turn_invulnerable( ANTI_HELI_PILOT01 )
	turn_invulnerable( ANTI_HELI_PILOT02 )
	trigger_enable( TRIGGER_HOLY_CRAP, true )
   on_trigger( "dlc04_holy_crap", TRIGGER_HOLY_CRAP )
	helicopter_fly_to_direct( HELICOPTER_NAME, HELI_FIFTH_PATH_SPEED, HELI_FIFTH_PATH )
end

-------------------------------
-- Helicopter Crash Sequence --
-------------------------------

function dlc04_holy_crap()
	debug_print("HOLY CRAP START")
	turn_invulnerable( HELICOPTER_NAME )
	debug_print("TURN INVULNERABLE")
	vehicle_prevent_explosion_fling( HELICOPTER_NAME, true )
	debug_print("PREVENT EXPLOSION FLING")
	vehicle_set_explosion_damage_multiplier( HELICOPTER_NAME, .01 ) 
	debug_print("EXPLOSION DAMAGE MULTIPLIER")

   trigger_enable( HELI_IN_TROUBLE_TRIGGER, true )
	debug_print("ENABLE TROUBLE TRIGGER")
   on_trigger( "dlc04_helicopter_alarm_smoke_and_shake", HELI_IN_TROUBLE_TRIGGER )
	debug_print("POST ON TRIGGER ALARM")

   trigger_enable( HELI_GOING_DOWN_TRIGGER, true )
   on_trigger( "dlc04_helicopter_going_down", HELI_GOING_DOWN_TRIGGER )

   trigger_enable( HELI_EJECTION_TRIGGER, true )
   on_trigger( "dlc04_helicopter_ejection_and_crash", HELI_EJECTION_TRIGGER )

	-- Create the Corpse Helicopter to blow up later
	group_create( GROUP_HELI_CORPSE )
	--helicopter_shoot_vehicle( ANTI_HELI_HELI, HELICOPTER_NAME, 0, 0 )
	vehicle_chase( ANTI_HELI_HELI, LOCAL_PLAYER )
	turn_vulnerable( ANTI_HELI_HELI )
	turn_vulnerable( ANTI_HELI_PILOT01 )
	turn_vulnerable( ANTI_HELI_PILOT02 )
	vehicle_set_explosion_damage_multiplier( ANTI_HELI_HELI, 1 ) 
	helicopter_fly_to_direct( HELICOPTER_NAME, HELI_SIXTH_PATH_SPEED, HELI_SIXTH_PATH )
  	vehicle_exit_teleport( LOCAL_PLAYER )

end

function dlc04_helicopter_alarm_smoke_and_shake()
debug_print("ALARM SMOKE SHAKE")
   trigger_enable( HELI_IN_TROUBLE_TRIGGER, false )
	local max_hp = get_max_hit_points( HELICOPTER_NAME )
   set_current_hit_points( HELICOPTER_NAME, max_hp * 0.2 )
   
	-- smoke = true, fire = false
   vehicle_set_smoke_and_fire_state( HELICOPTER_NAME, true, false )
   delay( 1.0 )
   camera_shake_start( 0.00015, 14000, 14000, 0.003 )
end

function dlc04_helicopter_going_down()
   trigger_enable( HELI_GOING_DOWN_TRIGGER, false )
	-- unleash that attack helicopter if it is still around
	release_to_world( GROUP_ULTOR_ANTI_HELI )
end

function dlc04_helicopter_ejection_and_crash()
   trigger_enable( HELI_EJECTION_TRIGGER, false )
   -- No more failure on pilot death - the escape flight is ended
   on_death( "", PILOT )
   turn_vulnerable( PILOT )

   -- Throw the players in random directions so it seems they were blown out of the helicopter
   if ( coop_is_active() ) then
      turn_invulnerable( REMOTE_PLAYER )
      vehicle_exit_dive( REMOTE_PLAYER )
   end
   turn_invulnerable( LOCAL_PLAYER )
   vehicle_exit_dive( LOCAL_PLAYER )

   vehicle_exit_teleport( LOCAL_PLAYER )
	inv_weapon_enable_or_disable_all_slots(true)
	
   if ( coop_is_active() ) then
      character_ragdoll( REMOTE_PLAYER, 5000 )
   end
   character_ragdoll( LOCAL_PLAYER, 5000 )

   on_vehicle_destroyed( "", HELICOPTER_NAME )
   on_take_damage( "", HELICOPTER_NAME )
	group_hide( GROUP_START	 )
	group_destroy( GROUP_START	 )

	group_show( GROUP_HELI_CORPSE )

   vehicle_enter_teleport( PILOT, HELI_CORPSE, 0 )
	teleport_vehicle( HELI_CORPSE, NAV_CORPSE )
	vehicle_detonate( HELI_CORPSE )

   inv_weapon_enable_or_disable_all_slots( true )
	
	Temp_weapons_removed = true
	
	release_to_world( GROUP_ULTOR_ATTACK_02 )
	release_to_world( GROUP_ULTOR_ATTACK_03 )
	release_to_world( GROUP_ULTOR_ATTACK_04 )
	release_to_world( GROUP_ULTOR_ATTACK_01 )
	release_to_world( GROUP_ULTOR_ATTACK_01B	)
	release_to_world( GROUP_HELI_PURSUIT )
	release_to_world( GROUP_ULTOR_OVERPASS )
	release_to_world( GROUP_ULTOR_ROADBLOCK_CARS )
	
   inv_weapon_remove_temporary( LOCAL_PLAYER, PLAYER_WEAPON )
	inv_weapon_remove_temporary( LOCAL_PLAYER, "grenade" )
   if ( coop_is_active() ) then
      inv_weapon_remove_temporary( REMOTE_PLAYER, PLAYER_WEAPON )
		inv_weapon_remove_temporary( REMOTE_PLAYER, "grenade" )
   end
	set_player_can_enter_exit_vehicles( LOCAL_PLAYER, true )
   if ( coop_is_active() ) then
      set_player_can_enter_exit_vehicles( REMOTE_PLAYER, true )
   end

   -- Now, make the players vulnerable again. Give them a few seconds to recover,
   -- and make sure they're up and about
   turn_vulnerable( LOCAL_PLAYER )
   if ( coop_is_active() ) then
      turn_vulnerable( REMOTE_PLAYER )
   end
	
	dlc04_play_voice(CONVERSATION_HELICOPTER_CRASHED)
	dlc04_go_back_to_gryphon()

	-- Checkpoint here.
	mission_set_checkpoint(CHECKPOINT_CRASH, true)
end

function dlc04_crash_checkpoint_start()
   set_player_can_enter_exit_vehicles( LOCAL_PLAYER, true )
   if ( coop_is_active() ) then
      set_player_can_enter_exit_vehicles( REMOTE_PLAYER, true )
   end

	GROUP_PROTECT = "dlc04_$checkpoint_protect"
	LIMO = "dlc04_$veh_limo_cp"
	DRIVER =  "dlc04_$driver_cp"
	GRYPHON = "dlc04_$Gryphon_cp"
	
	spawning_vehicles( false )
	group_create( GROUP_PROTECT )
	group_create( GROUP_ULTOR_ROADBLOCK_CARS )

	teleport_coop( NAV_START_CHECKPOINT, NAV_START_COOP_CHECKPOINT )
	thread_new("dlc04_spawning_vehicles_on")
	vehicle_enter_teleport( DRIVER, LIMO, 0, true )
	vehicle_enter_teleport( GRYPHON, LIMO, 2, true )
	vehicle_infinite_mass( LIMO, true ) 
	turn_invulnerable( LIMO )
	damage_indicator_on(0, LIMO, 0.0, "TEXT_HUD_LIMO_HEALTH_LABEL") -- TDL 294900
	teleport_vehicle( LIMO, NAV_LIMO_START03 )
	set_unjackable_flag(LIMO, true)

   turn_invulnerable( GRYPHON )
	on_death( "dlc04_gryphon_died", GRYPHON )

	dlc04_go_back_to_gryphon(true)
end

function dlc04_spawning_vehicles_on()
	delay(2)	-- Give it a second, jeez
	while not vehicle_exists(LIMO) do
		thread_yield()		
	end
	
	spawning_vehicles(true)
end

function dlc04_go_back_to_gryphon(restarted_at_checkpoint)
	trigger_enable( TRIG_ULTOR_ATTACK_01, false )
	trigger_enable( TRIG_ULTOR_ATTACK_02, false )
	trigger_enable( TRIG_ULTOR_ATTACK_03, false )
	trigger_enable( TRIG_ULTOR_ATTACK_04, false )
	trigger_enable( TRIG_HELI_PURSUIT, false)

	marker_remove_vehicle( LIMO, SYNC_ALL ) 
	on_take_damage( "", LIMO )
	on_vehicle_destroyed( "", LIMO )
	set_unjackable_flag(LIMO, true)
	thread_kill(Limo_damage_lines_thread)
	
	notoriety_set_min( "Police", 3 )
	notoriety_set_max( "Police", 4 )
	trigger_enable( TRIGGER_GRYPHON, true )
	mission_help_table("TEXT_OBJECTIVE_GET_GRYPHON", SYNC_ALL)
   on_trigger( "dlc04_come_with_me_if_you_want_to_live", TRIGGER_GRYPHON )
	-- TODO: This marker should be centered on the vehicle, right now its on a navpoint where the vehicle should be.
	marker_add_navpoint( TRIGGER_GRYPHON, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION, SYNC_ALL )
   waypoint_add( TRIGGER_GRYPHON, SYNC_ALL )
	if restarted_at_checkpoint == true then 
		-- It appears I'm going to need a new driver.
		mission_start_fade_in()
		vehicle_exit_teleport( DRIVER, true )
		character_kill( DRIVER )
	end
	delay(5)
	
	if vehicle_is_destroyed(ANTI_HELI_HELI) == false then 
		vehicle_chase( ANTI_HELI_HELI, LOCAL_PLAYER, false, true, false )
	end
end

--------------------------------------------
-- Grab Gryphon and take him to Saints HQ --
--------------------------------------------

function dlc04_come_with_me_if_you_want_to_live(activator)
	if coop_is_active() == true then
		if activator ~= LOCAL_PLAYER and activator ~= REMOTE_PLAYER then
			return
		end
	elseif activator ~= LOCAL_PLAYER then
		return
	end
	
	-- TODO: Add objecive text here to take Gryphon to Saints HQ
	marker_remove_navpoint( TRIGGER_GRYPHON )
	damage_indicator_off(0) 
	notoriety_force_no_spawn( "Police", false )
	waypoint_remove( SYNC_ALL )
   trigger_enable( TRIGGER_END, true )
	trigger_enable( TRIGGER_GRYPHON, false )
	vehicle_exit( GRYPHON, true )

	marker_remove_navpoint( TRIGGER_GRYPHON )
	waypoint_remove( SYNC_ALL )
	party_add( GRYPHON, activator )
	turn_vulnerable( GRYPHON )
	turn_vulnerable( LIMO )
	on_dismiss( "dlc04_fail_gryphon_abandoned", GRYPHON )  
   on_trigger( "dlc04_reached_the_end", TRIGGER_END )
	marker_add_navpoint( TRIGGER_END, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION, SYNC_ALL )
   waypoint_add( TRIGGER_END, SYNC_ALL )
end

function dlc04_reached_the_end( activator )
	-- Make sure Gryphon is the one activating the trigger
	if ( not ( activator == GRYPHON )) then
		return
	end
   -- Stop the players' vehicles when they reach the HQ trigger
	notoriety_set( "Police", 0 )
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
	marker_remove_navpoint( TRIGGER_END )
	waypoint_remove( SYNC_ALL )
	
	Mission_won = true
	mission_end_success( MISSION_NAME, CUTSCENE_OUT, { NAVPOINT_END, NAVPOINT_REMOTE_END } )
end

--------------------------------------------
-- Vehicle Jumping onto the Freeway Stuff --
--------------------------------------------

function dlc04_vehicle_jump( vehicle, jump_nav )
	-- Override the speed, ignore repulsors if we're jumping
	vehicle_speed_override( vehicle, JUMP_SPEED )
	vehicle_ignore_repulsors( vehicle, true )

	-- Pathfind to the start of the chase (on navmesh, don't stop at path end)
	vehicle_pathfind_to( vehicle, jump_nav, true, false )
	-- Wait for take off
	while (not vehicle_in_air(vehicle)) do
		thread_yield()
	end

	-- Wait for landing
	while (vehicle_in_air(vehicle)) do
		thread_yield()
	end

	-- Cancel vehicle speed override, stop ignoring repulsors
	vehicle_speed_cancel( vehicle )
	vehicle_ignore_repulsors( vehicle, false )
	
	-- Have the vehicle chase Gryphon
	-- exit_on_stop = false, allow_ram = false, allow_lateral_chase = false, no_sirens = true
	vehicle_chase( vehicle, GRYPHON, false, false, false, true )
end

----------------------------------
-- Ultor Vehicle Chase Function --
----------------------------------

function dlc04_ultor_chasify( vehicle, driver, passenger )
	vehicle_enter_teleport( driver, vehicle, 0, true )
	vehicle_enter_teleport( passenger, vehicle, 1, true )
	vehicle_suppress_npc_exit( vehicle, true ) 
	set_max_hit_points( vehicle, ULTOR_VEHICLE_HEALTH )
	vehicle_chase( vehicle, GRYPHON, true, true, true ) 
end

---------------------------
-- Debug and Test Starts --
---------------------------

function dlc04_start_at_limo()
	teleport_vehicle( HELICOPTER_NAME, NAV_HELI_START02 )
	helicopter_fly_to( HELICOPTER_NAME, HELI_FOURTH_PATH_SPEED, "dlc04_$n024" )
	on_vehicle_destroyed( "dlc04_helicopter_destroyed", HELICOPTER_NAME )
	dlc04_setup_protect_target()
	-- Setup next section's ultor
	on_trigger( "dlc04_ultor_attack_01", TRIG_ULTOR_ATTACK_01 )
	thread_new( "dlc04_start_limo_path" )
end

function dlc04_start_at_roadblock()
	teleport_vehicle( HELICOPTER_NAME, NAV_HELI_START03 )
	helicopter_fly_to( HELICOPTER_NAME, HELI_FOURTH_PATH_SPEED, NAV_HELI_START03 )
	on_vehicle_destroyed( "dlc04_helicopter_destroyed", HELICOPTER_NAME )
	dlc04_setup_protect_target()
	teleport_vehicle( LIMO, NAV_LIMO_START03 )
	group_create( GROUP_ULTOR_ROADBLOCK_CARS )
	group_create( GROUP_ULTOR_ROADBLOCK_GUYS )
	dlc04_circle_the_roadblock()
end

-- This function is solely for helping me balance the helath of the Limo and shouldnt exist in the final version of the mission.
function dlc04_update_limo_hitpoints()
	while ( DEBUG_LIMO_HITPOINTS > 0 ) do
		DEBUG_LIMO_HITPOINTS = ( get_current_hit_points( LIMO ) )
		delay(.25)
	end
end
-------------------------------
-- Mission Failure Functions --
-------------------------------

function dlc04_helicopter_destroyed()
   mission_end_failure( MISSION_NAME, "TEXT_FAIL_HELICOPTER_DESTROYED" )
end

function dlc04_limo_destroyed()
   mission_end_failure( MISSION_NAME, "TEXT_FAIL_LIMO_DESTROYED" )
end

function dlc04_gryphon_died()
   mission_end_failure( MISSION_NAME, "TEXT_FAIL_GRYPHON_DIED ")
end

function dlc04_pilot_killed()
   mission_end_failure( MISSION_NAME, "TEXT_FAIL_PILOT_KILLED ")
end

function dlc04_fail_gryphon_abandoned()
   mission_end_failure( MISSION_NAME, "TEXT_FAIL_GRYPHON_ABANDONED ")
end
	
-----------------------
-- Utility Functions --
-----------------------
function dlc04_play_voice(line, param2)
	if thread_check_done(Audio_thread_handle) == true then
		if param2 == nil then
			Audio_thread_handle = thread_new("dlc04_play_conversation_audio", line)
		else
			Audio_thread_handle = thread_new("dlc04_play_single_audio_line_do", line, param2)
		end
		return true
	end
	
	return false
end

function dlc04_play_single_audio_line_do(line, character)
	audio_play_for_character(line, character, "voice", false, true)	
end

function dlc04_play_conversation_audio(conversation)
	audio_play_conversation(conversation)
end

-----------------
-- Cleaning Up --
-----------------

function dlc04_cleanup()
	-- Cleanup mission here
	notoriety_reset( "Police" )
	notoriety_force_no_spawn( "Police", false )

	set_cops_shooting_from_vehicles( false )
	
	if Temp_weapons_removed == false then
		inv_weapon_remove_temporary( LOCAL_PLAYER, PLAYER_WEAPON )
		inv_weapon_remove_temporary( LOCAL_PLAYER, "grenade" )
	   if ( coop_is_active() ) then
	      inv_weapon_remove_temporary( REMOTE_PLAYER, PLAYER_WEAPON ) 
			inv_weapon_remove_temporary( REMOTE_PLAYER, "grenade" )
	   end
	end
	
	set_player_can_enter_exit_vehicles( LOCAL_PLAYER, true )
   if ( coop_is_active() ) then
      set_player_can_enter_exit_vehicles( REMOTE_PLAYER, true )
   end
   inv_weapon_enable_or_disable_all_slots( true )
	
	if ( not Mission_won ) then

		-- Make sure that players arnen't in the heli and teleport them back to the start
		group_destroy( GROUP_START )

		teleport( LOCAL_PLAYER, NAVPOINT_START, true )
		if ( coop_is_active() ) then
			teleport( REMOTE_PLAYER, NAVPOINT_REMOTE_START, true )
		end

	end

	-- remove minimap icons and ingame effects
	mission_waypoint_remove(SYNC_ALL)
	marker_remove_vehicle(LIMO, SYNC_ALL)
	marker_remove_navpoint( TRIGGER_GRYPHON, SYNC_ALL )
	marker_remove_navpoint( TRIGGER_END, SYNC_ALL )

	-- disable all triggers, remove callbacks
	for i, trigger in pairs(TABLE_ALL_TRIGGERS) do
		on_trigger("",trigger)
		on_trigger_exit("", trigger)
		trigger_enable(trigger,false)
	end
	
end

function dlc04_success()
	
end

----------------------------------
-- Ignore Everything Below Here --
----------------------------------

function dlc04_mystery()
	group_create( GROUP_MYSTERY, true )
	vehicle_enter_teleport( C_ALIEN, V_UFO, 0 )
	delay(.5)
	teleport_vehicle( V_UFO, "dlc04_$n020" )
	helicopter_fly_to_direct( V_UFO, 45, MYSTERY_PATH )
	group_destroy( GROUP_MYSTERY )
end
