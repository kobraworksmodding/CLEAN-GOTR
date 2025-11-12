-- tss03_demo.lua
-- SR2 mission script
-- 8/09/07

-- Global Variables --

Tss03_demo_samedi_characters				= {"tss03_demo_$samedi001", "tss03_demo_$samedi002", "tss03_demo_$samedi003", "tss03_demo_$samedi004", "tss03_demo_$samedi005", "tss03_demo_$samedi006", "tss03_demo_$samedi007","tss03_demo_$samedi012", "tss03_demo_$samedi013", "tss03_demo_$samedi014", "tss03_demo_$samedi015", "tss03_demo_$samedi016", "tss03_demo_$samedi017", "tss03_demo_$samedi018"}
Tss03_demo_samedi_characters_coop		= {"tss03_demo_$samedi008", "tss03_demo_$samedi009", "tss03_demo_$samedi010", "tss03_demo_$samedi011"}
Num_tss03_demo_samedi_characters			= sizeof_table(Tss03_demo_samedi_characters)
Num_tss03_demo_samedi_characters_coop	= sizeof_table(Tss03_demo_samedi_characters_coop)
Tss03_demo_samedi_kill_count				= 0
Total_tss03_demo_samedi_characters		= Num_tss03_demo_samedi_characters

Tss03_demo_samedi_patrol_01				= {"tss03_demo_$n004", "tss03_demo_$n001", "tss03_demo_$n005", "tss03_demo_$n007", "tss03_demo_$n008", "tss03_demo_$n002", "tss03_demo_$n003", "tss03_demo_$n004", "tss03_demo_$n001"}
Num_tss03_demo_samedi_patrol_01			= sizeof_table(Tss03_demo_samedi_patrol_01)

--Tss03_demo_bum_characters					= {"tss03_demo_$bum001", "tss03_demo_$bum002", "tss03_demo_$bum003", "tss03_demo_$bum004", "tss03_demo_$bum005", "tss03_demo_$bum011", "tss03_demo_$bum012", "tss03_demo_$bum013"}
Tss03_demo_bum_characters					= {"tss03_demo_$bum002", "tss03_demo_$bum003", "tss03_demo_$bum004", "tss03_demo_$bum005"}
Tss03_demo_bum_characters_coop			= {"tss03_demo_$bum006", "tss03_demo_$bum007", "tss03_demo_$bum008", "tss03_demo_$bum009", "tss03_demo_$bum010"}
Tss03_demo_bum_characters_rush			= {"tss03_demo_$bum014", "tss03_demo_$bum016", "tss03_demo_$bum017", "tss03_demo_$bum018"}
Num_tss03_demo_bum_characters				= sizeof_table(Tss03_demo_bum_characters)
Num_tss03_demo_bum_characters_coop		= sizeof_table(Tss03_demo_bum_characters_coop)
Num_tss03_demo_bum_characters_rush		= sizeof_table(Tss03_demo_bum_characters_rush)
Tss03_demo_bum_kill_count					= 0
Total_tss03_demo_bum_characters			= Num_tss03_demo_bum_characters

Tss03_demo_shanties							= {"tss03_demo_ShantyA080", "tss03_demo_ShantyB070", "tss03_demo_ShantyB050", "tss03_demo_ShantyA070", "tss03_demo_ShantyA090", "tss03_demo_ShantyD050", "tss03_demo_ShantyB060"}
Num_tss03_demo_shanties						= sizeof_table(Tss03_demo_shanties)
Tss03_demo_shanty_destroyed_count		= 0

Tss03_demo_compliment						= {"gml1_bs_sd_comp_a.animx",
														"gml1_bs_sd_comp_b.animx",
														"gml1_bs_sd_comp_c.animx",
														"gml1_bs_sd_comp_d.animx"}
Num_tss03_demo_compliment					= sizeof_table(Tss03_demo_compliment)

Tss03_demo_taunt								= {"gml1_bs_sd_insult_a.animx",
														"gml1_bs_sd_insult_b.animx",
														"gml1_bs_sd_insult_c.animx",
														"gml1_bs_sd_insult_d.animx"}
Num_tss03_demo_taunt							= sizeof_table(Tss03_demo_taunt)

Tss03_bumaga_yell_voice_id					= -1
Tss03_bumaga_yell_type_id					= -1

IN_COOP									= false
CAN_TAUNT_PLAYER						= true
PERFORMING_COMPLIMENT				= false

INVALID_LUA_THREAD					= 65535
PATROL_THREAD							= INVALID_LUA_THREAD
SEES_PLAYER_THREAD					= INVALID_LUA_THREAD
MOLOTOVS_THREAD						= INVALID_LUA_THREAD

LOCATION_START							= "mission_start_sr2_city_$tss03_demo"
LOCATION_START_GAT					= "tss03_demo_$gat"
LOCATION_START_PLAYER_2				= "tss03_demo_$trig_entry"

GROUP_START								= "tss03_demo_$group_start"
GROUP_ENTRYWAY							= "tss03_demo_$group_entryway"
GROUP_SAMEDI							= "tss03_demo_$group_samedi"
GROUP_SAMEDI_COOP						= "tss03_demo_$group_samedi_coop"
GROUP_BUMS								= "tss03_demo_$group_bums"
GROUP_BUMS_COOP						= "tss03_demo_$group_bums_coop"
GROUP_BUMS_RUSH						= "tss03_demo_$group_bumrush"
GROUP_BUMS_SHANTY						= "tss03_demo_$group_pistoleros"
GROUP_BUMAGA							= "tss03_demo_$group_bumaga"
GROUP_BUMAGA_FAKE						= "tss03_demo_$group_bumaga_fake"

CHARACTER_GAT							= "tss03_demo_$gat"
CHARACTER_SAMEDI_PATROL_01			= "tss03_demo_$samedi006"
CHARACTER_SAMEDI_PATROL_02			= "tss03_demo_$samedi018"
CHARACTER_BUMAGA						= "tss03_demo_$bumaga"
CHARACTER_BUMAGA_GUARD1				= "tss03_demo_$bumaga_guard001"
CHARACTER_BUMAGA_GUARD2				= "tss03_demo_$bumaga_guard002"
CHARACTER_BUMAGA_GUARD3				= "tss03_demo_$bumaga_guard003"
CHARACTER_BUMAGA_GUARD4				= "tss03_demo_$bumaga_guard004"
--CHARACTER_BUM1							= "tss03_demo_$bum011"		-- Bums that will be forced to attack the player's group
--CHARACTER_BUM2							= "tss03_demo_$bum012"
--CHARACTER_BUM3							= "tss03_demo_$bum013"
CHARACTER_HUMAN_SHIELD				= "tss03_demo_$bum_human_shield"

TRIGGER_ENTRY							= "tss03_demo_$trig_entry"
TRIGGER_WAYPOINT_1					= "tss03_demo_$t000"
TRIGGER_WAYPOINT_2					= "tss03_demo_$t001"
TRIGGER_WAYPOINT_3					= "tss03_demo_$t002"
TRIGGER_HUMAN_SHIELD					= "tss03_demo_$t003"
TRIGGER_CHECK							= "tss03_demo_$trig_check"

CHECKPOINT_START_PLAYER				= "tss03_demo_$trig_entry"
CHECKPOINT_START_GAT					= "tss03_demo_$check_gat_start"
CHECKPOINT_START_PLAYER_2			= "tss03_demo_$check_player2_start"

BUM_RESPAWN_DIST						= 12.0	-- In meters
BUM_RESPAWN_TIME						= 6500	-- In milliseconds

-- Functions --

function tss03_demo_start()
	-- Start trigger is hit...the activate button was hit
	set_mission_author("Ryan Spencer")

	-- Check for coop being active
	if (coop_is_active()) then
		IN_COOP	= true

		-- In coop we want to change some values
		Total_tss03_demo_samedi_characters	= (Num_tss03_demo_samedi_characters + Num_tss03_demo_samedi_characters_coop)
		Total_tss03_demo_bum_characters		= (Num_tss03_demo_bum_characters + Num_tss03_demo_bum_characters_coop)
	end

	-- The total bum characters that will need to be eliminated include the rush group of characters
	Total_tss03_demo_bum_characters = Total_tss03_demo_bum_characters + Num_tss03_demo_bum_characters_rush

	-- Play the intro cutscene
	cutscene_in()

	-- Disable the controls so the player can't move
	player_controls_disable(LOCAL_PLAYER)
	if (IN_COOP) then
		player_controls_disable(REMOTE_PLAYER)
	end

--	cutscene_play("Fuzz_Suburbs_Fame", GROUP_START)
	group_create(GROUP_START, true)

	-- Put Johnny Gat in player's party
	party_dismiss_all()
	party_add(CHARACTER_GAT, LOCAL_PLAYER)

	-- Turn spawning off
	spawning_vehicles(false)
	spawning_pedestrians(false)

	-- Teleport the player(s) to where they will need to be
--	if (Tss03_demo_checkpoint_01_hit == false) then
--		teleport(LOCAL_PLAYER, LOCATION_START)
--		teleport(CHARACTER_GAT, LOCATION_START_GAT)
--		if (IN_COOP) then
--			teleport(REMOTE_PLAYER, LOCATION_START_PLAYER_2)
--		end
--	else
		-- We hit the checkpoint so we need to start from there
--		teleport(LOCAL_PLAYER, CHECKPOINT_START_PLAYER)
--		teleport(CHARACTER_GAT, CHECKPOINT_START_GAT)
--		if (IN_COOP) then
--			teleport(REMOTE_PLAYER, CHECKPOINT_START_PLAYER_2)
--		end
--	end

	teleport(LOCAL_PLAYER, TRIGGER_CHECK)

	-- Put Johnny Gat in player's party
--	party_dismiss_all()
--	party_add(CHARACTER_GAT, LOCAL_PLAYER)

	-- Get the Bumaga voice id for playback
	Tss03_bumaga_yell_voice_id, Tss03_bumaga_yell_type_id = audio_get_id("BUMAGA_TSSP03_ATTACK", "voice")

	-- When Johnny Gat dies
	on_death("tss03_demo_failure", CHARACTER_GAT)
	-- When Johnny Gat is dismissed as a follower
	on_dismiss("tss03_demo_abandon_gat", CHARACTER_GAT)

	-- Lets give the player and gat some weapons
	inv_item_remove_all(LOCAL_PLAYER)
	inv_item_add("beretta", 1, LOCAL_PLAYER)
	inv_item_add("as14", 1, LOCAL_PLAYER)
	inv_item_add("pipe_bomb", 1, LOCAL_PLAYER)
	inv_item_add_ammo(LOCAL_PLAYER, "beretta", 200)
	inv_item_add_ammo(LOCAL_PLAYER, "as14", 200)
	inv_item_add_ammo(LOCAL_PLAYER, "pipe_bomb", 10)

	inv_item_add("Holt_55", 1, CHARACTER_GAT)

	-- Setup other demo data
	set_time_of_day(19, 0)

	-- Show our initial group (Vehicle and Gat)
	group_show(GROUP_START)

	-- Checkpoint or not...we need this to be set
	on_trigger("tss03_demo_waypoint1", TRIGGER_WAYPOINT_1)
	on_trigger("tss03_demo_waypoint2", TRIGGER_WAYPOINT_2)
	on_trigger("tss03_demo_waypoint3", TRIGGER_WAYPOINT_3)
	on_trigger("tss03_demo_checkpoint", TRIGGER_CHECK)

	if (IN_COOP) then
		on_trigger("tss03_demo_human_shield_coop", TRIGGER_HUMAN_SHIELD)
	else
		on_trigger("tss03_demo_human_shield_sp", TRIGGER_HUMAN_SHIELD)
	end

--	if (Tss03_demo_checkpoint_01_hit == false) then
		-- Add the objective destination
--		marker_add_trigger(TRIGGER_ENTRY, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION, SYNC_ALL)
--		mission_waypoint_add(TRIGGER_ENTRY)

		-- We need to remove and add another destination
--		on_trigger("tss03_demo_entrypoint", TRIGGER_ENTRY)
--		trigger_enable(TRIGGER_ENTRY, true)	

		--Prompt the user to drive to the location
--		mission_help_table("tss03_drive")
--	else
		-- We hit the checkpoint so we need to start from there
		tss03_demo_entrypoint()	-- Run this script so we have the objects we need...
		tss03_demo_checkpoint()	-- Run this script so that we are in the state we want to be in...
--	end

	-- DEMO
	follower_make_independent(CHARACTER_GAT, true)
	turn_to_char(CHARACTER_GAT, LOCAL_PLAYER)
	follower_make_independent(CHARACTER_GAT, false)

	-- Re-enable the controls so the player can move
	player_controls_enable(LOCAL_PLAYER)
	if (IN_COOP) then
		player_controls_enable(REMOTE_PLAYER)
	end

	-- Fade back into the game...
	cutscene_out()
end

function tss03_demo_cleanup()
	-- Cleanup mission here...

	-- Reset the spawning
	spawning_vehicles(true)
	spawning_pedestrians(true)

	-- Release the vehicle to the world
	release_to_world("tss03_demo_$vehicle")

	-- Reset the respawn distance
	npc_respawn_dist_reset()

	-- Invalidate the deaths
	on_death("", CHARACTER_GAT)
	on_death("", CHARACTER_BUMAGA)

	-- Invalidate Gat being dismissed
	on_dismiss("", CHARACTER_GAT)
	party_dismiss_all()
	group_destroy(GROUP_START)

	-- Invalidate the triggers
	on_trigger("", TRIGGER_ENTRY)
	on_trigger("", TRIGGER_WAYPOINT_1)
	on_trigger("", TRIGGER_WAYPOINT_2)
	on_trigger("", TRIGGER_WAYPOINT_3)
	on_trigger("", TRIGGER_HUMAN_SHIELD)
	on_trigger("", TRIGGER_CHECK)

	-- Remove icons and waypoint...they might still exist
	marker_remove_trigger(TRIGGER_ENTRY, SYNC_ALL)
	marker_remove_trigger(TRIGGER_CHECK, SYNC_ALL)
	mission_waypoint_remove(SYNC_ALL)

	-- Remove the icons from the Samedi characters
	for i = 1, Num_tss03_demo_samedi_characters, 1 do
		on_death("", Tss03_demo_samedi_characters[i])
		marker_remove_npc(Tss03_demo_samedi_characters[i], SYNC_ALL)
	end

	-- Remove the icons from the Samedi characters coop
	for i = 1, Num_tss03_demo_samedi_characters_coop, 1 do
		on_death("", Tss03_demo_samedi_characters_coop[i])
		marker_remove_npc(Tss03_demo_samedi_characters_coop[i], SYNC_ALL)
	end

	-- Remove the icons from the Bum characters
	for i = 1, Num_tss03_demo_bum_characters, 1 do
		on_death("", Tss03_demo_bum_characters[i])
		on_respawn("", Tss03_demo_bum_characters[i])
		marker_remove_npc(Tss03_demo_bum_characters[i], SYNC_ALL)
	end

	-- Remove the icons from the Bum characters coop
	for i = 1, Num_tss03_demo_bum_characters_coop, 1 do
		on_death("", Tss03_demo_bum_characters_coop[i])
		on_respawn("", Tss03_demo_bum_characters_coop[i])
		marker_remove_npc(Tss03_demo_bum_characters_coop[i], SYNC_ALL)
	end

	on_death("", CHARACTER_BUMAGA)
	-- Remove the icon from the Bumaga and his posse
	marker_remove_group(GROUP_BUMAGA, SYNC_ALL)

	-- Restore spawning
--	notoriety_force_no_spawn("Samedi", false)
	notoriety_force_no_spawn("Brotherhood", false)
end

function tss03_demo_success()
	-- Called when the mission has ended with success
--	if (not IN_COOP) then
--		tutorial_start("territory_income", 2000, true)
--	end

	-- Reset the checkpoint hit flags
--	Tss03_demo_checkpoint_01_hit = false
end

function tss03_demo_complete()
	-- Don't show the success screen right away
	delay(2)
	
	-- End the mission with success
	mission_end_success("tss03_demo")
end

function tss03_demo_failure()
	-- End the mission since Gat was killed
	mission_end_failure("tss03_demo", "tss03_gat_died")
end

function tss03_demo_abandon_gat()
	-- End the mission since Gat was abandoned
	mission_end_failure("tss03_demo", "tss03_gat_abandoned")
end

function tss03_demo_entrypoint()
	-- Release the vehicle to the world
	release_to_world("tss03_demo_$vehicle")

	-- TODO: Add checkpoint capability
--	Tss03_demo_checkpoint_01_hit = true

	-- Disable the entry trigger and enable the first waypoint trigger
	trigger_enable(TRIGGER_ENTRY, false)
	trigger_enable(TRIGGER_WAYPOINT_1, true)

	-- Remove the objective destination
	marker_remove_trigger(TRIGGER_ENTRY, SYNC_ALL)
	mission_waypoint_remove(SYNC_ALL)

	-- Add the objective destination
--	marker_add_trigger(TRIGGER_WAYPOINT_1, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)
--	mission_waypoint_add(TRIGGER_WAYPOINT_1)

	-- Create our first group of enemies
	group_create_hidden(GROUP_SAMEDI)
	group_create_hidden(GROUP_BUMS)
	group_create_hidden(GROUP_BUMS_SHANTY)
--	group_create_hidden(GROUP_ENTRYWAY)

	-- If we are in coop create the coop groups too
	if (IN_COOP) then
		group_create_hidden(GROUP_SAMEDI_COOP)
		group_create_hidden(GROUP_BUMS_COOP)
	end

	-- Prompt the user to enter the underground
--	mission_help_table("tss03_enter")

	-- Show the entry way bums
--	group_show(GROUP_ENTRYWAY)
end

function tss03_demo_waypoint1()
	-- Disable the waypoint trigger and enable the next waypoint trigger
	trigger_enable(TRIGGER_WAYPOINT_1, false)
	trigger_enable(TRIGGER_WAYPOINT_2, true)

	-- Remove the objective destination
	marker_remove_trigger(TRIGGER_WAYPOINT_1, SYNC_ALL)
	mission_waypoint_remove(SYNC_ALL)

	-- Add the objective destination
	marker_add_trigger(TRIGGER_WAYPOINT_2, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)
	mission_waypoint_add(TRIGGER_WAYPOINT_2)

	-- FIXME: Allow waypoint 2 to be skipped
--	tss03_demo_waypoint2()
end

function tss03_demo_waypoint2()
	-- Disable the waypoint trigger and enable the next waypoint trigger
	trigger_enable(TRIGGER_WAYPOINT_2, false)
	trigger_enable(TRIGGER_WAYPOINT_3, true)

	-- Remove the objective destination
	marker_remove_trigger(TRIGGER_WAYPOINT_2, SYNC_ALL)
	mission_waypoint_remove(SYNC_ALL)

	-- Add the objective destination
	marker_add_trigger(TRIGGER_WAYPOINT_3, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)
	mission_waypoint_add(TRIGGER_WAYPOINT_3)
end

function tss03_demo_waypoint3()
	-- Disable the waypoint trigger and enable the checkpoint trigger
	trigger_enable(TRIGGER_WAYPOINT_3, false)
	trigger_enable(TRIGGER_CHECK, true)

	-- Remove the objective destination
	marker_remove_trigger(TRIGGER_WAYPOINT_3, SYNC_ALL)
	mission_waypoint_remove(SYNC_ALL)

	-- Add the objective destination
	marker_add_trigger(TRIGGER_CHECK, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)
	mission_waypoint_add(TRIGGER_CHECK)
end

function tss03_demo_patrol_01(name)
	local	i = 1

	SEES_PLAYER_THREAD = thread_new("tss03_demo_patrol_sees_player", name)
	MOLOTOVS_THREAD = thread_new("tss03_demo_molotovs", "tss03_demo_$samedi001")

	-- Walk this path until the character attacks or is dead
	while (1) do
		-- Yields until path is completed
		move_to(name, Tss03_demo_samedi_patrol_01[i])

		if (Tss03_demo_samedi_patrol_01[i] == "tss03_demo_$n005") then
			PERFORMING_COMPLIMENT = true
			
--			npc_go_idle(name)
			turn_to_char(name, CHARACTER_SAMEDI_PATROL_02)
			action_play_custom(name, Tss03_demo_compliment[rand_int(1, Num_tss03_demo_compliment)])
			
			PERFORMING_COMPLIMENT = false

--			action_play_custom(CHARACTER_SAMEDI_PATROL_02, Tss03_demo_compliment[rand_int(1, Num_tss03_demo_compliment)])
		end

		i = i + 1
		if (i > Num_tss03_demo_samedi_patrol_01) then
			i = 1
		end
	end
end

function tss03_demo_patrol_sees_player(name)
	while (not character_check_resource_loaded(name)) do
		thread_yield()
	end

	while (CAN_TAUNT_PLAYER) do
		if (character_is_dead(name)) then
			return
		end

		if (not PERFORMING_COMPLIMENT and (fov_check(name, LOCAL_PLAYER) > 0.0) and los_check(name, LOCAL_PLAYER)) then
			patrol_pause(PATROL_THREAD)
			npc_go_idle(name)
			turn_to_char(name, LOCAL_PLAYER)
			action_play_custom(name, Tss03_demo_taunt[rand_int(1, Num_tss03_demo_taunt)])
			patrol_unpause(PATROL_THREAD)
		end
		delay(8)
	end
end

function tss03_demo_checkpoint()
	-- Reset the movers in case they were destroyed before this sequence
	for i = 1, Num_tss03_demo_shanties, 1 do
		mesh_mover_reset(Tss03_demo_shanties[i])
	end

	-- Disable the trigger...the action starts now!
	trigger_enable(TRIGGER_CHECK, false)

	-- Release the entry way bums to the world
	release_to_world(GROUP_ENTRYWAY)

	-- Remove the objective destination
	marker_remove_trigger(TRIGGER_CHECK, SYNC_ALL)
	mission_waypoint_remove(SYNC_ALL)

	-- No notoriety spawning
--	notoriety_force_no_spawn("Samedi", true)
	notoriety_force_no_spawn("Brotherhood", true)

	-- Show our first group of enemies
	group_show(GROUP_SAMEDI)
	-- Add markers to the Samedi
	marker_add_group(GROUP_SAMEDI, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL)

	-- Add an on death function to the Samedi NPCs...
	for i = 1, Num_tss03_demo_samedi_characters, 1 do
		on_death("tss03_demo_samedi_killer", Tss03_demo_samedi_characters[i])
	end

	-- Force a character to patrol
	PATROL_THREAD = patrol("tss03_demo_patrol_01", CHARACTER_SAMEDI_PATROL_01)

	-- If we are in coop then show the coop group too
	if (IN_COOP) then
		-- Show our first group of enemies
		group_show(GROUP_SAMEDI_COOP)
		-- Add markers to the Samedi
		marker_add_group(GROUP_SAMEDI_COOP, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL)

		-- Add an on death function to the Samedi NPCs...
		for i = 1, Num_tss03_demo_samedi_characters_coop, 1 do
			on_death("tss03_demo_samedi_killer", Tss03_demo_samedi_characters_coop[i])
		end
	end

	-- Setup the Shanties...we need to keep track of shanties destroyed before the player is instructed to do so
	for i = 1, Num_tss03_demo_shanties, 1 do
		on_mover_destroyed("tss03_demo_shanty_destroyed", Tss03_demo_shanties[i])
	end

	-- Setup the barkeeper to attack on fire...
	on_weapon_fired("tss03_demo_attack_now", LOCAL_PLAYER)

	-- Prompt the user to kill the Samedi
	mission_help_table("tss03_samedi")

	-- Lets do some persona override here...
	persona_override_character_stop_all(CHARACTER_GAT)
	persona_override_character_start(CHARACTER_GAT, "threat - alert (group attack)", "GAT_TSSP03_ATTACK")
	persona_override_character_start(CHARACTER_GAT, "threat - alert (solo attack)", "GAT_TSSP03_ATTACK")
	persona_override_character_start(CHARACTER_GAT, "threat - damage received (firearm)", "GAT_TSSP03_ATTACK")
	persona_override_character_start(CHARACTER_GAT, "threat - damage received (melee)", "GAT_TSSP03_ATTACK")
	persona_override_character_start(CHARACTER_GAT, "threat - knocked down npc/pc", "GAT_TSSP03_ATTACK")
end

function tss03_demo_attack_now(human, weapon, name)
	-- Only do this when a weapon is fired
	if (name ~= "firearm") then
		return
	end
	
	-- Do not allow this callback to happen again
	on_weapon_fired("", human)

	CAN_TAUNT_PLAYER = false

	attack(CHARACTER_SAMEDI_PATROL_01)
	attack(CHARACTER_SAMEDI_PATROL_02)
end

function tss03_demo_molotovs(human)
	inv_item_remove_all(human)
	inv_item_add("molotov", 1, human)

	while (1) do
		if (character_is_dead(human)) then
			return
		end

		if ((get_dist_char_to_char(human, LOCAL_PLAYER) < 25.0) and los_check(human, LOCAL_PLAYER)) then
			npc_go_idle(human)
			turn_to_char(human, LOCAL_PLAYER)
			npc_go_idle(human)
			force_throw_char(human, LOCAL_PLAYER)

			delay(rand_int(3, 8))
		else
			thread_yield()
		end
	end
end

function tss03_demo_throw_kill_tutorial(name)
	-- Wait until the character has a human shield
	while (not character_has_human_shield(name)) do
		thread_yield()
	end

	-- Show the human shield throw/kill tutorial
--	tutorial_start("throw_kill", 200, true)

	-- We only want to show this message if the shanties weren't destroyed before hand
	if (Tss03_demo_shanty_destroyed_count < Num_tss03_demo_shanties) then
		-- Prompt the user to destroy the Shanties
		mission_help_table("tss03_toss")
	end
end

function tss03_demo_human_shield_sp(name)
	-- Disable the human shield trigger
	trigger_enable(TRIGGER_HUMAN_SHIELD, false)

	-- Remove the objective destination
	marker_remove_trigger(TRIGGER_HUMAN_SHIELD, SYNC_ALL)
	mission_waypoint_remove(SYNC_ALL)

	-- Show the human shield tutorial
--	tutorial_start("human_shield", 200, true)

	thread_new("tss03_demo_throw_kill_tutorial", name)
end

function tss03_demo_human_shield_coop(name)
	-- Disable the human shield trigger
	trigger_enable(TRIGGER_HUMAN_SHIELD, false)

	-- Remove the objective destination
	marker_remove_trigger(TRIGGER_HUMAN_SHIELD, SYNC_ALL)
	mission_waypoint_remove(SYNC_ALL)

	-- We only want to show this message if the shanties weren't destroyed before hand
	if (Tss03_demo_shanty_destroyed_count < Num_tss03_demo_shanties) then
		-- Prompt the user to destroy the Shanties
		mission_help_table("tss03_toss")
	end
end

function tss03_demo_samedi_killer(name)
	-- Remove the marker
	marker_remove_npc(name, SYNC_ALL)
	Tss03_demo_samedi_kill_count = Tss03_demo_samedi_kill_count + 1

	if (name == CHARACTER_SAMEDI_PATROL_01) then
		thread_kill(SEES_PLAYER_THREAD)
	end

	if (name == "tss03_demo_$samedi001") then
		thread_kill(MOLOTOVS_THREAD)
	end

	-- If all the Samedi are killed activate the bum sequence and destroy the shanties
	if (Tss03_demo_samedi_kill_count == Total_tss03_demo_samedi_characters) then
		-- Delay for a moment before this is setup
		delay(1)
		tss03_demo_destroy_the_shanties()
	end
end

function tss03_demo_shanty_destroyer(mover, human)
	-- Remove the marker
	marker_remove_mover(mover, SYNC_ALL)
	Tss03_demo_shanty_destroyed_count = Tss03_demo_shanty_destroyed_count + 1

	-- Remove the on death callback for this shanty
	on_mover_destroyed("", mover)

	-- Check to see if a human destroyed it
	if (not (human == nil) and not (human == CHARACTER_GAT)) then
		-- We know the human is valid and is not Gat
		if (not (human == LOCAL_PLAYER) and not (human == REMOTE_PLAYER)) then
			-- The human is not either the local or remote player so kill him!
			character_kill(human)
		end
	end

	objective_text(0, "tss03_shanties_left", Tss03_demo_shanty_destroyed_count, Num_tss03_demo_shanties)

	-- Do not show the tutorial if we are in coop
	if ((not IN_COOP) and (Tss03_demo_shanty_destroyed_count == 1)) then
		-- Show the human shield throw/kill tutorial
--		tutorial_start("push_throw", 500, true)

		-- Disable the human shield trigger...it is possible to skip it
		trigger_enable(TRIGGER_HUMAN_SHIELD, false)
	end

	-- If all the shanties are destroyed activate the bum sequence
	if (Tss03_demo_shanty_destroyed_count == Num_tss03_demo_shanties) then
		-- Delay for a moment before this is setup
		delay(1)
		tss03_demo_eliminate_bums()
	end
end

function tss03_demo_shanty_destroyed(name)
	-- Decrease the shanty count left to destroy
	Tss03_demo_shanty_destroyed_count = Tss03_demo_shanty_destroyed_count + 1

	-- Remove the on death callback for this shanty
	on_mover_destroyed("", name)
end

function tss03_demo_bum_killer(name)
	-- Remove the marker
	marker_remove_npc(name, SYNC_ALL)
	Tss03_demo_bum_kill_count = Tss03_demo_bum_kill_count + 1

	objective_text(0, "tss03_bums_left", Tss03_demo_bum_kill_count, Total_tss03_demo_bum_characters)

	if (Tss03_demo_bum_kill_count == 1) then
		-- Disable the human shield trigger...it is possible to skip it and the shanty portion
		trigger_enable(TRIGGER_HUMAN_SHIELD, false)
	end

	-- If all the Bums are killed activate the bumaga sequence
	if (Tss03_demo_bum_kill_count == Total_tss03_demo_bum_characters) then
		tss03_demo_bumaga_showdown()
	end
end

function tss03_demo_bum_died(name)
	-- Only increase the kill count when the bums are not the target
	Tss03_demo_bum_kill_count = Tss03_demo_bum_kill_count + 1

--	minimap_icon_remove_npc(name, SYNC_ALL)
end

function tss03_demo_bum_respawn(name)
	-- Only decrease the kill count when the bums are not the target
	Tss03_demo_bum_kill_count = Tss03_demo_bum_kill_count - 1

	-- Force the bums to attack your party
	if (mod(Tss03_demo_bum_kill_count, 2) == 0) then
		attack(name, LOCAL_PLAYER)
	else
		if (IN_COOP) then
			if (Tss03_demo_bum_kill_count > (Total_tss03_demo_bum_characters / 2)) then
				attack(name, REMOTE_PLAYER)
			else
				attack(name, CHARACTER_GAT)
			end
		else
			attack(name, CHARACTER_GAT)
		end
	end

	-- The icon is removed on death so we need to add one when the bum respawns
--	minimap_icon_add_npc(name, "map_other_blip_human", false, "", SYNC_ALL)

	-- Some data gets reset so we just need to set this data each time the bum respawns
	npc_respawn_after_death(name, true)
	npc_respawn_after_death_time_override(name, BUM_RESPAWN_TIME, true)

	-- TEMP: remove all the weapons for the bums
	inv_item_remove_all(name)
end

function tss03_demo_destroy_the_shanties()
	-- Release any Samedi bodies to the world
	release_to_world(GROUP_SAMEDI)
	marker_remove_group(GROUP_SAMEDI, SYNC_ALL)

	-- Show our second group of enemies
	group_show(GROUP_BUMS)
	group_show(GROUP_BUMS_SHANTY)
--	minimap_icon_add_group(GROUP_BUMS, "map_other_blip_human", false, "", SYNC_ALL)

	-- Add an on death function to the Bum NPCs...
	for i = 1, Num_tss03_demo_bum_characters, 1 do
		on_death("tss03_demo_bum_died", Tss03_demo_bum_characters[i])
		on_respawn("tss03_demo_bum_respawn", Tss03_demo_bum_characters[i])
		npc_respawn_after_death(Tss03_demo_bum_characters[i], true)
		npc_respawn_after_death_time_override(Tss03_demo_bum_characters[i], BUM_RESPAWN_TIME, true)

		-- TEMP: remove all the weapons for the bums
		inv_item_remove_all(Tss03_demo_bum_characters[i])
	end

	-- If we are in coop then do this for the coop group
	if (IN_COOP) then
		-- Release any Samedi coop bodies to the world
		release_to_world(GROUP_SAMEDI_COOP)
		marker_remove_group(GROUP_SAMEDI_COOP, SYNC_ALL)

		-- Show our second group of enemies for coop
		group_show(GROUP_BUMS_COOP)
--		minimap_icon_add_group(GROUP_BUMS_COOP, "map_other_blip_human", false, "", SYNC_ALL)
		
		-- Add an on death function to the coop Bum NPCs...
		for i = 1, Num_tss03_demo_bum_characters_coop, 1 do
			on_death("tss03_demo_bum_died", Tss03_demo_bum_characters_coop[i])
			on_respawn("tss03_demo_bum_respawn", Tss03_demo_bum_characters_coop[i])
			npc_respawn_after_death(Tss03_demo_bum_characters_coop[i], true)
			npc_respawn_after_death_time_override(Tss03_demo_bum_characters_coop[i], BUM_RESPAWN_TIME, true)
		end
	end

	-- Override the respawn distance
	npc_respawn_dist_override(BUM_RESPAWN_DIST)

	-- Setup the Shanties
	for i = 1, Num_tss03_demo_shanties, 1 do
		if (not mesh_mover_destroyed(Tss03_demo_shanties[i])) then
			marker_add_mover(Tss03_demo_shanties[i], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL)
			on_mover_destroyed("tss03_demo_shanty_destroyer", Tss03_demo_shanties[i])
			set_current_hit_points(Tss03_demo_shanties[i], 2)
		end
	end

	-- Force a couple of bums to attack
--	attack(CHARACTER_BUM1, LOCAL_PLAYER)
--	attack(CHARACTER_BUM2, CHARACTER_GAT)
--	if (IN_COOP) then
--		attack(CHARACTER_BUM3, REMOTE_PLAYER)
--	else
--		attack(CHARACTER_BUM3, LOCAL_PLAYER)
--	end

	-- Enable the human shield trigger if not in coop
--	if (not IN_COOP) then
		-- This will run the human shield tutorial
--		trigger_enable(TRIGGER_HUMAN_SHIELD, true)
--	else
		-- Attack the closest player...the default is "#PLAYER#"
		attack(CHARACTER_HUMAN_SHIELD)
--	end

	-- Add the objective destination
	marker_add_trigger(TRIGGER_HUMAN_SHIELD, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)
	mission_waypoint_add(TRIGGER_HUMAN_SHIELD)

	-- If all the Shanties were killed before hand, activate the bum sequence
	if (Tss03_demo_shanty_destroyed_count == Num_tss03_demo_shanties) then
		tss03_demo_eliminate_bums()
	else
		-- Prompt the user to destroy the Shanties
		mission_help_table("tss03_shanties")
		-- Show the objective text on the HUD
		objective_text(0, "tss03_shanties_left", Tss03_demo_shanty_destroyed_count, Num_tss03_demo_shanties)
	end

	-- Create the Bumaga
--	group_create_hidden(GROUP_BUMAGA)
	group_create_hidden(GROUP_BUMAGA_FAKE)
end

function tss03_demo_eliminate_bums()
	-- Create the bum rush group
	group_create_hidden(GROUP_BUMS_RUSH)

	-- Remove any icons from the bum group
--	minimap_icon_remove_group(GROUP_BUMS, SYNC_ALL)
	-- If we are in coop then do this for the coop group
--	if (IN_COOP) then
--		minimap_icon_remove_group(GROUP_BUMS_COOP, SYNC_ALL)
--	end

	-- Reset the respawn distance
	npc_respawn_dist_reset()

	-- Add markers to the bums
	for i = 1, Num_tss03_demo_bum_characters, 1 do
		npc_respawn_after_death(Tss03_demo_bum_characters[i], false)
		if (not character_is_dead(Tss03_demo_bum_characters[i])) then
			marker_add_npc(Tss03_demo_bum_characters[i], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL)
			on_death("tss03_demo_bum_killer", Tss03_demo_bum_characters[i])
		end
	end

	-- If we are in coop then do this for the coop bums
	if (IN_COOP) then
		-- Add markers to the coop bums
		for i = 1, Num_tss03_demo_bum_characters_coop, 1 do
			npc_respawn_after_death(Tss03_demo_bum_characters_coop[i], false)
			if (not character_is_dead(Tss03_demo_bum_characters_coop[i])) then
				marker_add_npc(Tss03_demo_bum_characters_coop[i], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL)
				on_death("tss03_demo_bum_killer", Tss03_demo_bum_characters_coop[i])
			end
		end
	end

	-- Show the bum rush group
	group_show(GROUP_BUMS_RUSH)
	-- Add markers to the rush bums
	for i = 1, Num_tss03_demo_bum_characters_rush, 1 do
		marker_add_npc(Tss03_demo_bum_characters_rush[i], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL)
		on_death("tss03_demo_bum_killer", Tss03_demo_bum_characters_rush[i])
		attack(Tss03_demo_bum_characters_rush[i])
	end

	-- If all the Bums were killed before hand activate the bumaga sequence
	if (Tss03_demo_bum_kill_count == Total_tss03_demo_bum_characters) then
		tss03_demo_bumaga_showdown()
	else
		-- Prompt the user to kill the bums
		mission_help_table("tss03_bums")
		-- Show the objective text on the HUD
		objective_text(0, "tss03_bums_left", Tss03_demo_bum_kill_count, Total_tss03_demo_bum_characters)
	end
end

function tss03_demo_bumaga_showdown()
	-- Clear the objective text
	objective_text_clear(0)

	-- Release any Bum bodies to the world
	release_to_world(GROUP_BUMS)
	marker_remove_group(GROUP_BUMS, SYNC_ALL)

	-- If we are in coop then do this for the coop group
	if (IN_COOP) then
		-- Release any Bum coop bodies to the world
		release_to_world(GROUP_BUMS_COOP)
		marker_remove_group(GROUP_BUMS_COOP, SYNC_ALL)
	end

	-- Show our second group of enemies
--	group_show(GROUP_BUMAGA)
	delay(2.0)
	cutscene_play("tss_03_demo_boss")

	-- Add markers to the bums
	marker_add_npc(CHARACTER_BUMAGA, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL)
	-- Add an on death function to the Bumaga
	on_death("tss03_demo_complete", CHARACTER_BUMAGA)
	-- Set the bumaga hit points
	set_max_hit_points(CHARACTER_BUMAGA, 2500, true)
	-- Don't allow bumaga to flinch
	character_prevent_flinching(CHARACTER_BUMAGA, true)

	-- Give player help text
	mission_help_table("tss03_bumaga")

	-- The bumaga has a couple of body guards
--	minimap_icon_add_npc(CHARACTER_BUMAGA_GUARD1, "map_other_blip_human", false, "", SYNC_ALL)
--	minimap_icon_add_npc(CHARACTER_BUMAGA_GUARD2, "map_other_blip_human", false, "", SYNC_ALL)
	
	mesh_mover_reset("tss03_demo_ShantStreetB010")
	-- Force the bumaga to wield the stop sign
	mesh_mover_wield("tss03_demo_ShantStreetB010", CHARACTER_BUMAGA, true)
	-- We need to release the stop sign to the world
	release_to_world("tss03_demo_ShantStreetB010")

	attack(CHARACTER_BUMAGA_GUARD1, LOCAL_PLAYER, false)
	attack(CHARACTER_BUMAGA_GUARD3, LOCAL_PLAYER, false)
	if (IN_COOP) then
		attack(CHARACTER_BUMAGA_GUARD2, REMOTE_PLAYER, false)
		attack(CHARACTER_BUMAGA_GUARD4, REMOTE_PLAYER, false)
	else
		attack(CHARACTER_BUMAGA_GUARD2, CHARACTER_GAT, false)
		attack(CHARACTER_BUMAGA_GUARD4, CHARACTER_GAT, false)
	end

	-- Add an on weapon fire function to the Bumaga
	on_weapon_fired("tss03_demo_bumaga_attack", CHARACTER_BUMAGA)

	-- Wait to send the bumaga after the player
	delay(2)

	-- Move the Bumaga down the hall way to attack the player
	attack(CHARACTER_BUMAGA, "#PLAYER#", false)
end

function tss03_demo_bumaga_attack(human, weapon, tag)
	-- If the Bumaga is attacking with a havok weapon we want to play some audio for him
	if ((weapon == "havok") and (tag == "melee")) then
		audio_play_id_for_character(human, Tss03_bumaga_yell_voice_id, Tss03_bumaga_yell_type_id)
	end
end