-- rn06.lua
-- SR2 mission script
-- 3/28/07

-- Cutscene crash fixes by IdolNinja
-- 3/11/2011


-- Global constants (All caps == GLOBAL CONSTANT)
--[[	In general, shouldn't be modified in running code, except for maybe in a setup function )

]]
	-- Coop mission?
	IN_COOP	= false

	-- GROUPS --
		GROUP_START_CAR			= "rn06_$Gstart_car"
		GROUP_CUTSCENE				= "rn06_$Gcutscene"
		GROUP_MELEE_PART1			= "rn06_$Gmelee_part1"
		GROUP_MELEE_PART2_A		= "rn06_$Gmelee_part2_a"
		GROUP_MELEE_PART2_B		= "rn06_$Gmelee_part2_b"
		GROUP_MELEE_PART2_C		= "rn06_$Gmelee_part2_c"
		GROUP_JYUNICHI				= "rn06_$Gjyunichi"

		-- List of all groups, makes cleaning up more convenient
		TABLE_ALL_GROUPS			= {	GROUP_START_CAR, GROUP_CUTSCENE, GROUP_MELEE_PART1, GROUP_MELEE_PART2_A, 
												GROUP_MELEE_PART2_B, GROUP_MELEE_PART2_C, GROUP_JYUNICHI}

		TABLE_ALL_COOP_GROUPS	= {	}
	
	-- GROUP MEMBER TABLES -- 
		MEMBERS_GROUP_MELEE_PART1 = {	"rn06_$c000", "rn06_$c001", "rn06_$c002", "rn06_$c003", "rn06_$c004",
												"rn06_$c005", "rn06_$c006", "rn06_$c007", "rn06_$c008", "rn06_$c009",
												"rn06_$c010", "rn06_$c011", "rn06_$c012"}

		MEMBERS_GROUP_MELEE_PART2_A = {	"rn06_$c023", "rn06_$c024", "rn06_$c025", "rn06_$c026", "rn06_$c027",
													"rn06_$c028", "rn06_$c029", "rn06_$c030", "rn06_$c031", "rn06_$c032",
													"rn06_$c033", "rn06_$c034"}

		MEMBERS_GROUP_MELEE_PART2_B = {	"rn06_$c036", "rn06_$c035", "rn06_$c037", "rn06_$c038", "rn06_$c039",
													"rn06_$c040", "rn06_$c041", "rn06_$c042", "rn06_$c043", "rn06_$c044",
													"rn06_$c045", "rn06_$c046"}

		MEMBERS_GROUP_MELEE_PART2_C = {	"rn06_$c047", "rn06_$c048", "rn06_$c049", "rn06_$c050", "rn06_$c051",
													"rn06_$c052", "rn06_$c053", "rn06_$c054", "rn06_$c055", "rn06_$c056",
													"rn06_$c057", "rn06_$c058"}

	-- TRIGGERS -- 
		TRIGGER_RESTAURANT_DEST	= "rn06_$Trestaurant_dest"

		-- top level entrances
		TRIGGER_ENTRANCE_NORTH	= "rn06_$Tentrance_north"
		TRIGGER_ENTRANCE_WEST	= "rn06_$Tentrance_west"
		TRIGGER_ENTRANCE_EAST	= "rn06_$Tentrance_east"
		TRIGGER_ENTRANCE_SOUTH	= "rn06_$Tentrance_south"

		TABLE_ENTRANCE_TRIGGERS = {	TRIGGER_ENTRANCE_NORTH, TRIGGER_ENTRANCE_WEST,
												TRIGGER_ENTRANCE_EAST, TRIGGER_ENTRANCE_SOUTH}	

		-- List of all triggers, makes cleaning up more convenient
		TABLE_ALL_TRIGGERS		= {	TRIGGER_RESTAURANT_DEST, TRIGGER_ENTRANCE_NORTH, TRIGGER_ENTRANCE_WEST,
												TRIGGER_ENTRANCE_EAST, TRIGGER_ENTRANCE_SOUTH}		

	-- VEHICLES --


	-- CHARACTERS --
		CHARACTER_JYUNICHI		= "rn06_$Cjyunichi"

	-- CHECKPOINTS
		
		CHECKPOINT_START						= MISSION_START_CHECKPOINT			-- defined in ug_lib.lua
		CHECKPOINT_KANTO						= "rn06_checkpoint_kanto"			-- players have arrived at the restaurant

	-- NAVPOINTS

		-- the mission start locations
		NAVPOINT_LOCAL_PLAYER_START					= "mission_start_sr2_city_$rn06"
		NAVPOINT_REMOTE_PLAYER_START					= "rn06_$Nremote_player_start"

		-- melee 1 start locations
		NAVPOINT_LOCAL_PLAYER_START_MELEE_PART1	= "rn06_$Nlocal_start_melee_part1"
		NAVPOINT_REMOTE_PLAYER_START_MELEE_PART1	= "rn06_$Nremote_start_melee_part1"

		-- Jyunichi fight start locations
		NAVPOINT_LOCAL_PLAYER_START_JYUNICHI		= "rn06_$Nlocal_start_jyunichi"
		NAVPOINT_REMOTE_PLAYER_START_JYUNICHI		= "rn06_$Nremote_start_jyunichi"

		-- If the players finish the mission inside of Kanto, they are teleported to these
		-- locations.
		NAVPOINT_LOCAL_KANTO_EXIT						= "rn06_$Nlocal_kanto_exit"
		NAVPOINT_REMOTE_KANTO_EXIT						= "rn06_$Nremote_kanto_exit"

	-- MOVERS
		MOVER_ENTRANCE_MAIN1 = "rn06_$MMdoor_main1"
		MOVER_ENTRANCE_MAIN2 = "rn06_$MMdoor_main2"

		RESTAURANT_MOVERS_TO_HIDE = 
		{
			"rn06_$MM_table_1", "rn06_$MM_table_2", "rn06_$MM_table_3", "rn06_$MM_table_4",
			"rn06_$MM_chair_1", "rn06_$MM_chair_2", "rn06_$MM_chair_3", "rn06_$MM_chair_4",
			"rn06_$MM_chair_5", "rn06_$MM_chair_6", "rn06_$MM_chair_7", "rn06_$MM_chair_8",
		}

	-- localized helptext messages
		HELPTEXT_HUD_HEALTH_JYUNICHI			= "rn06_hud_jyunichi_health"

		HELPTEXT_PROMPT_LOCATION_RESTAURANT = "rn06_prompt_location_restaurant"
		HELPTEXT_PROMPT_ENTER_RESTAURANT		= "rn06_prompt_enter_restaurant"
		HELPTEXT_PROMPT_DEFEND_YOURSELF		= "rn06_prompt_defend_yourself"
		HELPTEXT_PROMPT_SWORD_COUNTER			= "rn06_prompt_sword_counter"

	-- Possible animations for enemies who haven't entered melee combat
		TABLE_ENEMY_ANIMATIONS	= {	"react Cheer", "crouch", "stand"}
	
	-- MISC CONSTANTS
		MELEE_ENEMY_HEALTH_MULTIPLIER			= 1.5
		MAX_ENEMIES_ATTACKING					= 12
		JYUNICHI_HIT_POINTS						= 1500
		SWORD											= "samurai_sword"
		-- how long Jyunichi remains vulnerable to being grabbed before he revives
		JYUNICHI_PASSED_OUT_TIME_S				= 10	
		JYUNICHI_REVIVE_PERCENT					= .50
		NPC_MAX_CORPSES_OVERRIDE				= 40

		SWORD_COUNTER_NAG_INITIAL_DELAY_S	= 15 -- How long to wait until the first sword counter nag displays
		SWORD_COUNTER_NAG_REPEAT_DELAY_S		= 30 -- How long to wait between nags after the first one.
	
		RONIN_PERSONAS_ABBREV	= 
		{
			["AM_Ron2"]	=	"AMRON2",

			["AF_Ron1"]	=	"AFRON1",

			["WM_Ron1"]	=	"WMRON1",

			["WF_Ron1"]	=	"WFRON1",
			["WF_Ron2"]	=	"WFRON2",
		}

-- Global Variables (First letter caps == Global Variable)

	Location_reached					= false
	Restaurant_entered				= false
	Enemy_set_cleared					= false
	Enemy_set_objective_helptext	= ""
	Sword_loaned						= false
	Jyunichi_revived					= false
	Rn06_inside_kanto					= false

	-- THREADS
	--Thread_dealer						= -1
	Table_all_threads					= {	}
	THREAD_SWORD_COUNTER_NAG		= INVALID_THREAD_HANDLE


-- CUTSCENES --
-- Added by IdolNinja. These variables are used in the script for the cutscenes for stability instead of calling them directly

CUTSCENE_IN = 		"ro06-01"
CUTSCENE_OUT = 		"ro06-02"
MISSION_NAME =		"rn06"


-- TEMPORARY Global Variables

-- REQUIRED MISSION FUNCTIONS -------------------------------

function rn06_start(rn06_checkpoint, is_restart)

	if (rn06_checkpoint == CHECKPOINT_START) then
		if (not is_restart) then
			cutscene_play(CUTSCENE_IN)
		end
		fade_out(0)
	end

	rn06_initialize(rn06_checkpoint)

	if (rn06_checkpoint == CHECKPOINT_START) then

		-- Send player(s) to the restaurant's driveway
		rn06_send_to_location(TRIGGER_RESTAURANT_DEST, HELPTEXT_PROMPT_LOCATION_RESTAURANT, SYNC_ALL)

		-- Now send them inside
		rn06_enter_restaurant()

		-- Prepare for the restaurant fight
		fade_out(1.0,{0,0,0}, SYNC_ALL)
		fade_out_block()

		-- Disable action nodes and ped spawning
		action_nodes_enable(false)
		spawning_pedestrians(false, true)

		rn06_cleanup_drive()
		rn06_teleport_players_inside()

		for i, mover in pairs(RESTAURANT_MOVERS_TO_HIDE) do
			mesh_mover_hide(mover)
		end

		cutscene_play("IG_rn06_scene1")
		group_destroy(GROUP_CUTSCENE)

		rn06_setup_restaurant(true)
		fade_in(1.0,SYNC_ALL)

		mission_set_checkpoint(CHECKPOINT_KANTO)
		rn06_checkpoint = CHECKPOINT_KANTO

	-- end of CHECKPOINT_START, begining of CHECKPOINT_KANTO
	elseif (rn06_checkpoint == CHECKPOINT_KANTO) then
		-- Intentionally not doing anything here
	end -- ends CHECKPOINT_KANTO		

	tutorial_start("combat_swords", 1000, true)

	-- Wait a bit, then have all civilians flee
	delay(1.0)
		
	-- Delay a bit more, then have Jyunichi attack
	delay(2.0)
	thread_new("rn06_jyunichi_defend_thread")

	THREAD_SWORD_COUNTER_NAG = thread_new("rn06_sword_counter_nag")

end

function rn06_sword_counter_nag()
	delay(SWORD_COUNTER_NAG_INITIAL_DELAY_S)
	while(true) do
		mission_help_table_nag(HELPTEXT_PROMPT_SWORD_COUNTER)
		delay(SWORD_COUNTER_NAG_REPEAT_DELAY_S)
	end
end

function rn06_initialize(checkpoint)

	mission_start_fade_out(0.0)

	rn06_initialize_common()
	rn06_initialize_checkpoint(checkpoint)

	mission_start_fade_in()
end

function	rn06_initialize_common()

	set_mission_author("Phillip Alexander")

	if (coop_is_active()) then
		IN_COOP	= true
	end

end

function	rn06_initialize_checkpoint(checkpoint)

	if (checkpoint == CHECKPOINT_START) then

		-- Create a vehicle for the player(s) to use
		group_create(GROUP_START_CAR, true)

		-- Teleport the player(s) to where they will need to be
		teleport_coop(NAVPOINT_LOCAL_PLAYER_START, NAVPOINT_REMOTE_PLAYER_START)
	else	

		-- Disable action nodes and ped spawning
		action_nodes_enable(false)
		spawning_pedestrians(false, true)

		rn06_players_inside_restaurant()
		rn06_setup_restaurant(false)
	end

end

function rn06_enter_restaurant()
	mission_help_table(HELPTEXT_PROMPT_ENTER_RESTAURANT)
	for i, entrance in pairs(TABLE_ENTRANCE_TRIGGERS) do
		on_trigger("rn06_restaurant_entered", entrance)
		trigger_enable(entrance,true)
	end
	marker_add_trigger(TRIGGER_ENTRANCE_SOUTH,MINIMAP_ICON_LOCATION,INGAME_EFFECT_LOCATION,SYNC_ALL)

	while( not Restaurant_entered) do
		thread_yield()
	end
end

function rn06_players_inside_restaurant()
	Rn06_inside_kanto = true
	set_player_can_enter_exit_vehicles(LOCAL_PLAYER, false)
	if(IN_COOP) then
		set_player_can_enter_exit_vehicles(REMOTE_PLAYER, false)
	end
end

function rn06_cleanup_drive()
	-- Destroy the vehicle, get rid of vehice and ped spawns
	group_destroy(GROUP_START_CAR)
	spawning_vehicles(false)	
end

function rn06_teleport_players_inside()

	party_dismiss_all()

	if (character_is_in_vehicle(LOCAL_PLAYER)) then
		vehicle_exit_teleport(LOCAL_PLAYER)
	end

	-- The teleport coop function handles teleporting the coop player out of the vehicle
	teleport_coop(NAVPOINT_LOCAL_PLAYER_START_MELEE_PART1, NAVPOINT_REMOTE_PLAYER_START_MELEE_PART1, true)

	rn06_players_inside_restaurant()

end

jyunichi_battle_audio_id = 0

function rn06_setup_restaurant(disable_controls)
	
	-- Disable player controls
	if(disable_controls) then
		player_controls_disable(LOCAL_PLAYER)
		if (IN_COOP) then
			player_controls_disable(REMOTE_PLAYER)
		end
	end

	for i, mover in pairs(RESTAURANT_MOVERS_TO_HIDE) do
		mesh_mover_hide(mover)
	end

	-- Remove all followers
	party_dismiss_all()


	-- Give the players swords
	inv_weapon_add_temporary(LOCAL_PLAYER, SWORD, 1, true)
	inv_item_equip("samurai_sword",LOCAL_PLAYER)
	party_use_melee_weapons_only(true)
	if (IN_COOP) then
		inv_weapon_add_temporary(REMOTE_PLAYER, SWORD, 1, true)
		inv_item_equip("samurai_sword",REMOTE_PLAYER)
	end
	Sword_loaned	= true

	-- Override Ronin Attack peronas
	persona_override_group_start(RONIN_PERSONAS_ABBREV,POT_SITUATIONS[POT_ATTACK], "RO06_ATTACK")

	-- Shut, lock doors
	door_close(MOVER_ENTRANCE_MAIN1)
	door_close(MOVER_ENTRANCE_MAIN2)
	door_lock(MOVER_ENTRANCE_MAIN1, true)
	door_lock(MOVER_ENTRANCE_MAIN2, true)

	-- Load or start loading Ronin groups
	group_create(GROUP_JYUNICHI,true)
	group_create_hidden(GROUP_MELEE_PART1, true)
	
	for i,enemy in pairs(MEMBERS_GROUP_MELEE_PART1) do
		local enemy_hit_points = get_max_hit_points(enemy)
		set_max_hit_points(enemy,enemy_hit_points * MELEE_ENEMY_HEALTH_MULTIPLIER)
		set_always_sees_player_flag(enemy, true) 
	end

	-- Allow a larger than normal number of npcs corpses
	npc_max_corpses_override(NPC_MAX_CORPSES_OVERRIDE)

	-- Prepare jyunichi
	rn06_setup_jyunichi()

	-- Have the first set of Ronin attack
	rn06_ronin_group_attack(MEMBERS_GROUP_MELEE_PART1)

	-- Enable sword combat
	rn06_enable_sword_combat(true)
	audio_throttle_type("Music", 0)

	--Only play the boss battle music if the player isn't already playing his/her own music
	if (not audio_is_xmp_playing()) then
		jyunichi_battle_audio_id = audio_play_do("JYUNICHI_BATTLE")
	end

	notoriety_set("Ronin",3)	
	notoriety_set_min("Ronin",3)	

	-- Reenable player controls
	if (disable_controls) then
		player_controls_enable(LOCAL_PLAYER)
		if (IN_COOP) then
			player_controls_enable(REMOTE_PLAYER)
		end
	end

end

function rn06_enable_sword_combat(enable)
	combat_enable_sword_parries(enable)
	combat_enable_sword_strafing(enable)

	local take_damage_callback = ""
	if (enable) then
		take_damage_callback = "rn06_player_damaged"
		thread_new("rn06_always_ready")
	end

	on_take_damage(take_damage_callback, LOCAL_PLAYER)
	if(IN_COOP) then
		on_take_damage(take_damage_callback, REMOTE_PLAYER)
	end

	character_set_cannot_wield_havok_weapon(LOCAL_PLAYER, enable)
	if (IN_COOP) then
		character_set_cannot_wield_havok_weapon(REMOTE_PLAYER, enable)
	end
end

function rn06_always_ready()

	local function combat_ready(character)
		if (	character_exists(character) and 
				(not character_is_dead(character)) and 
				(not character_is_ragdolled(character)) 
			) then
			character_set_combat_ready(character, true, 1.0)
		end
	end

	while(true) do
		thread_yield()
		combat_ready(LOCAL_PLAYER)
		combat_ready(REMOTE_PLAYER)
		combat_ready(CHARACTER_JYUNICHI)
	end

end

function rn06_player_damaged(player, attacker, damage_percent)

	if (attacker == CHARACTER_JYUNICHI) then
		character_ragdoll(player, 1000)
		audio_play_persona_line(CHARACTER_JYUNICHI, "threat - alert (solo attack)")
	end

end

function rn06_setup_jyunichi()

	inv_item_remove_all(CHARACTER_JYUNICHI)
	set_max_hit_points(CHARACTER_JYUNICHI,JYUNICHI_HIT_POINTS)
	--on_finished("rn06_complete", CHARACTER_JYUNICHI)
	--on_death("rn06_jyunichi_passed_out", CHARACTER_JYUNICHI)
	on_death("rn06_complete", CHARACTER_JYUNICHI)
	damage_indicator_on(0, CHARACTER_JYUNICHI,0.0, HELPTEXT_HUD_HEALTH_JYUNICHI)
	npc_set_boss_type(CHARACTER_JYUNICHI, AI_BOSS_JYUNICHI)

	persona_override_character_start(CHARACTER_JYUNICHI, POT_SITUATIONS[POT_ATTACK], "JYUNICHI_RON06_ATTACK")
	persona_override_character_start(CHARACTER_JYUNICHI, POT_SITUATIONS[POT_TAKE_DAMAGE], "JYUNICHI_RON06_TAKEDAM")

	inv_item_add("dual_swords", 1, CHARACTER_JYUNICHI) 
	inv_item_equip("dual_swords",CHARACTER_JYUNICHI)

	on_take_damage("rn06_jyunichi_damaged", CHARACTER_JYUNICHI)
	marker_add_npc(CHARACTER_JYUNICHI, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL)
--	character_allow_ragdoll(CHARACTER_JYUNICHI, false)
--	attack(CHARACTER_JYUNICHI)
end

rn06_current_wave = 1

-- Called when Jyunichi is damaged
-- damage_percent is Jyunichi's health percentage after the attack
function rn06_jyunichi_damaged(jyunichi, attacker, damage_percent)

	local wave_damage_thresholds = {.650, .300}
	local wave_group = {GROUP_MELEE_PART2_A, GROUP_MELEE_PART2_B, GROUP_MELEE_PART2_C}
	local wave_group_members = 
		{	MEMBERS_GROUP_MELEE_PART2_A, MEMBERS_GROUP_MELEE_PART2_B, MEMBERS_GROUP_MELEE_PART2_C
		}
	local wave_group_doors =	
		{	{"rn06_$MM_door_1_left", "rn06_$MM_door_1_right"},
			{"rn06_$MM_door_2"},
			{"rn06_$MM_door_3"}
		}	

	if (rn06_current_wave <= sizeof_table(wave_damage_thresholds)) then

		if (damage_percent < wave_damage_thresholds[rn06_current_wave]) then

			rn06_current_wave = rn06_current_wave + 1

			thread_new("rn06_ronin_group_attack", wave_group_members[rn06_current_wave], wave_group[rn06_current_wave], 
							wave_group_doors[rn06_current_wave][1],wave_group_doors[rn06_current_wave][2])

		end
		
	end

	audio_play_persona_line(CHARACTER_JYUNICHI, "takes damage")
end

function rn06_jyunichi_defend_thread()

	local is_attacking = false
	npc_set_boss_always_defend(CHARACTER_JYUNICHI, true)

	while(not character_is_dead(CHARACTER_JYUNICHI)) do

		thread_yield()

		local should_attack = (rn06_living_enemies <= 2)
		if (should_attack ~= is_attacking) then

			npc_set_boss_always_defend(CHARACTER_JYUNICHI, (not should_attack))
			if (should_attack) then
				attack(CHARACTER_JYUNICHI)
			end

			is_attacking = should_attack

		end
	end
end

rn06_max_enemies = 4
rn06_living_enemies = 0
function rn06_ronin_group_attack(group_members, group_name, door1,door2)

	if (group_name ~= nil) then
		group_create_hidden(group_name, true)
	end

	local num_to_spawn = rn06_max_enemies - rn06_living_enemies

	for i=1, num_to_spawn, 1 do
		local ronin = group_members[i]
		character_show(ronin)
		on_death("rn06_ronin_killed",ronin)
		rn06_living_enemies = rn06_living_enemies + 1
	end

	if(door1) then
		door_open(door1)
	end

	if(door2) then
		door_open(door2)
	end

	-- Send the Ronin out one at a time so that they don't bunch up and get stuck in a doorway.
	for i=1, num_to_spawn, 1 do
		attack(group_members[i])
		delay(0.4)
	end
	
end

function rn06_ronin_killed()
	rn06_living_enemies = rn06_living_enemies - 1
end

-- Cleanup mission
function rn06_cleanup()

	-- Check if the remote player has dropped
	IN_COOP = coop_is_active()

	-- Turn off the Jyunichi boss-fight music
	audio_stop(jyunichi_battle_audio_id)
	audio_throttle_type("Music", 1)

	-- Disable sword combat
	rn06_enable_sword_combat(false)

	-- Reenable action nodes and ped spawning
	action_nodes_enable(true)
	spawning_pedestrians(true)

	-- Unlock doors
	door_lock(MOVER_ENTRANCE_MAIN1, false)
	door_lock(MOVER_ENTRANCE_MAIN2, false)

	-- Remove Persona overrides
	persona_override_group_stop(RONIN_PERSONAS,POT_SITUATIONS[POT_ATTACK])

	-- Clean up spawning
	npc_max_corpses_reset()
	spawning_vehicles(true)

	-- Kill all secondary threads
	for i, thread in pairs(Table_all_threads) do
		thread_kill(thread)
	end

	damage_indicator_off(0)

	-- Remove npc triggers, arrows
	for i,enemy in pairs(MEMBERS_GROUP_MELEE_PART1) do
		on_death("",enemy)
		marker_remove_npc(enemy)
	end
	for i,enemy in pairs(MEMBERS_GROUP_MELEE_PART2_A) do
		on_death("",enemy)
		marker_remove_npc(enemy)
	end	
		for i,enemy in pairs(MEMBERS_GROUP_MELEE_PART2_B) do
		on_death("",enemy)
		marker_remove_npc(enemy)
	end
	for i,enemy in pairs(MEMBERS_GROUP_MELEE_PART2_C) do
		on_death("",enemy)
		marker_remove_npc(enemy)
	end

	-- disable all triggers, remove callbacks
	for i, trigger in pairs(TABLE_ALL_TRIGGERS) do
		on_trigger("",trigger)
		trigger_enable(trigger,false)
	end

	-- destroy Jyunichi, don't need unique characters wandering around the city.
	--persona_override_character_stop(CHARACTER_JYUNICHI, POT_SITUATIONS[POT_ATTACK])
	--persona_override_character_stop(CHARACTER_JYUNICHI, POT_SITUATIONS[POT_TAKE_DAMAGE])
	marker_remove_npc(CHARACTER_JYUNICHI)
	group_destroy(GROUP_JYUNICHI)

	-- also destroy the starting vehicle, just so they don't pile up
	group_destroy(GROUP_START_CAR)

	-- release all groups
	for i, group in pairs(TABLE_ALL_GROUPS) do
		group_destroy(group)
	end
	if (IN_COOP) then
		for i, group in pairs(TABLE_ALL_COOP_GROUPS) do
		group_destroy(group)
		end
	end

	-- remove temporary weapons
	if (Sword_loaned) then
		inv_weapon_remove_temporary(LOCAL_PLAYER, SWORD)
		party_use_melee_weapons_only(false)
		if (IN_COOP) then
			inv_weapon_remove_temporary(REMOTE_PLAYER, SWORD)
		end
	end

	-- remove vehicle transition callbacks
	on_vehicle_enter("",LOCAL_PLAYER)
	on_vehicle_exit("",LOCAL_PLAYER)
	if (IN_COOP) then
		on_vehicle_enter("",REMOTE_PLAYER)
		on_vehicle_exit("",REMOTE_PLAYER)
	end

	-- If the players finish the mission inside of Kanto, teleport them outside and make sure that they
	-- can enter vehicles.
	if (Rn06_inside_kanto) then
		set_player_can_enter_exit_vehicles(LOCAL_PLAYER, true)
		teleport( LOCAL_PLAYER, NAVPOINT_LOCAL_KANTO_EXIT)
		if (IN_COOP) then
			teleport( REMOTE_PLAYER, NAVPOINT_REMOTE_KANTO_EXIT)
			set_player_can_enter_exit_vehicles(REMOTE_PLAYER, true)
		end
	end

end

function rn06_success()
end


-- MISSION FUNCTIONS ----------------------------------------

function rn06_jyunichi_passed_out()
	Jyunichi_revived = false
	on_game_time_trigger("rn06_jyunichi_maybe_revive", JYUNICHI_PASSED_OUT_TIME_S * 40, 0, 0, 0, 0, 0)
end

function rn06_jyunichi_maybe_revive()
	if (not Jyunichi_revived) then
		npc_revive(CHARACTER_JYUNICHI)	
		-- Reset the revived flag
		Jyunichi_revived = false
		local max_hp = get_max_hit_points(CHARACTER_JYUNICHI)
		set_current_hit_points(CHARACTER_JYUNICHI,JYUNICHI_REVIVE_PERCENT * max_hp)
	end
end

function rn06_jyunichi_revived()
	Jyunichi_revived = true
end

function rn06_restaurant_entered()
	marker_remove_trigger(TRIGGER_ENTRANCE_SOUTH)
	for i, entrance in pairs(TABLE_ENTRANCE_TRIGGERS) do
		on_trigger("", entrance)
		trigger_enable(entrance,false)
	end
	Restaurant_entered = true;
end

function rn06_complete()
	-- Stop the nag thread
	if (THREAD_SWORD_COUNTER_NAG ~= INVALID_THREAD_HANDLE) then
		thread_kill(THREAD_SWORD_COUNTER_NAG)
	end
	-- End the mission with success
	inv_item_remove_all(CHARACTER_JYUNICHI)
	mission_end_success(MISSION_NAME, CUTSCENE_OUT)
end

-- UTILITY FUNCTIONS ----------------------------------------

function rn06_send_to_location(trigger, helptext)

	Location_reached = false

	-- enable the trigger, add a minimap icon, glow effect, waypoint, and callback
	trigger_enable(trigger,true)
	marker_add_trigger(trigger,MINIMAP_ICON_LOCATION,INGAME_EFFECT_VEHICLE_LOCATION,SYNC_ALL)
	on_trigger("rn06_location_reached",trigger)
	mission_waypoint_add( trigger, SYNC_ALL )

	-- display helptext
	mission_help_table(helptext)

	-- wait for player to arrive at the dealer
	while (not Location_reached) do
		thread_yield()
	end

	mission_help_clear(SYNC_ALL)

end

function rn06_location_reached(triggerer,trigger)
	Location_reached = true		
	trigger_enable(trigger, false)
	marker_remove_trigger(trigger, SYNC_ALL)
	on_trigger("",trigger)
	mission_waypoint_remove()
end

MAX_VISIBLE_NPCS					= 24
Enemies_reserved					= 0
Enemies_attacking					= 0
Enemies_total						= 0
Next_wave_size						= 0

function rn06_process_enemy_set_in_waves(wave_size_min, wave_size_max, mission_helptext, objective_helptext, ...)

	local cur_enemy_pool_ind	= 2
	local enemy_pool = arg[cur_enemy_pool_ind]
	local cur_enemy_pool_size	= sizeof_table(enemy_pool)
	local group_show_ind	=	{}
	local next_enemy_ind	= 1

	Enemies_total	= 0
	Enemies_attacking = 0

	for i = 2, arg.n, 3 do
		Enemies_total = Enemies_total + sizeof_table(arg[i])
	end

	Enemy_set_cleared = false

	Enemies_reserved = Enemies_total
	Next_wave_size = MAX_ENEMIES_ATTACKING
	if (Next_wave_size > Enemies_reserved) then
		Next_wave_size = Enemies_reserved
	end

	-- Display the help text
	if(mission_helptext) then
		mission_help_table(mission_helptext)
	end

	-- Display the objective text
	if(objective_helptext) then
		Enemy_set_objective_helptext = objective_helptext
		objective_text(0, Enemy_set_objective_helptext, 0, Enemies_total)
	end
	
	-- assign non-combat callbacks for the first pool
	for i=1, cur_enemy_pool_size, 1 do
		--character_set_cannot_be_grabbed(enemy_pool[i],true)
		npc_combat_enable(enemy_pool[i],false)
		on_death("rn06_other_enemy_killed", enemy_pool[i])
	end

	while (not Enemy_set_cleared) do
		-- See if we have room for a new wave of attackers
		if (Next_wave_size > 0 and (Enemies_attacking + Next_wave_size) <= MAX_ENEMIES_ATTACKING) then
			-- We have room, make them attack
			for i= 1, Next_wave_size, 1 do

				-- if we aren't on the last enemy pool
				if (cur_enemy_pool_ind < arg.n -1) then

					-- see if we need to start drawing from the next enemy pool
					if (next_enemy_ind > cur_enemy_pool_size) then
	
						-- update the enemy pool index and size
						cur_enemy_pool_ind = cur_enemy_pool_ind + 3
						enemy_pool = arg[cur_enemy_pool_ind]
						cur_enemy_pool_size	= sizeof_table(enemy_pool)
	
						-- reset the next_enemy_ind
						next_enemy_ind = 1
	
						-- assign non-combat callbacks
						for ii=1, cur_enemy_pool_size, 1 do
							--character_set_cannot_be_grabbed(enemy_pool[ii],true)
							npc_combat_enable(enemy_pool[ii],false)
							on_death("rn06_other_enemy_killed", enemy_pool[ii])
						end

						-- make the enemy pool's group visible
						group_show(arg[cur_enemy_pool_ind -1])

						-- see if we need to open a door to release this group
						local group_door = arg[cur_enemy_pool_ind +1]
						if (group_door ~= "") then
							door_open(group_door)
						end
					end
				end

				while(character_is_dead(enemy_pool[next_enemy_ind])) do
					next_enemy_ind = next_enemy_ind +1
				end

				-- make the next npc attack: assign callback, add marker and make combat ready
				on_death("rn06_attacking_enemy_killed", enemy_pool[next_enemy_ind])
				marker_add_npc(enemy_pool[next_enemy_ind], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL)
				npc_combat_enable(enemy_pool[next_enemy_ind],true)

				next_enemy_ind = next_enemy_ind +1
			end
			-- update the number of npcs in various pools
			Enemies_attacking = Enemies_attacking + Next_wave_size
			Enemies_reserved = Enemies_reserved - Next_wave_size
			-- Get the size of the next wave
			Next_wave_size = rand_int(wave_size_min, wave_size_max)
			if (Next_wave_size > Enemies_reserved) then
				Next_wave_size = Enemies_reserved
			end
		end
		thread_yield()
	end

end

function rn06_attacking_enemy_killed(enemy)
	marker_remove_npc(enemy)
	on_death("",enemy)
	--character_set_cannot_be_grabbed(enemy,true)
	Enemies_attacking = Enemies_attacking - 1
	if (Enemies_attacking == 0 and Next_wave_size == 0) then
		Enemy_set_cleared = true
		objective_text_clear(0)
		Enemy_set_objective_helptext = ""
	else
		if (Enemy_set_objective_helptext ~= "") then
			objective_text(0, Enemy_set_objective_helptext, Enemies_total - Enemies_reserved - Enemies_attacking, Enemies_total)
		end
	end
end

function rn06_other_enemy_killed(enemy)
	marker_remove_npc(enemy)
	on_death("",enemy)
	--character_set_cannot_be_grabbed(enemy,true)
	-- Update the next wave size
	Enemies_reserved = Enemies_reserved - 1
	if(Next_wave_size > Enemies_reserved) then
		Next_wave_size = Enemies_reserved
	end
	-- update the objective
	if (Enemy_set_objective_helptext ~= "") then
		objective_text(0, Enemy_set_objective_helptext, Enemies_total - Enemies_reserved - Enemies_attacking, Enemies_total)
	end
end

-- MISSION FAILURE FUNCTIONS --------------------------------
