-- tss03.lua
-- SR2 mission script
-- 03/21/08

-- Global Variables --

-- This factor is applied to player damage in single player. 
SINGLE_PLAYER_DAMAGE_MULTIPLIER = 0.50

-- This factor is applied to player damage in co-op.
COOP_DAMAGE_MULTIPLIER = 0.75

Tss03_samedi_characters					= {"tss03_$samedi001", "tss03_$samedi002", "tss03_$samedi003", "tss03_$samedi004", 
													"tss03_$samedi005", "tss03_$samedi006", "tss03_$samedi007","tss03_$samedi012", 
													"tss03_$samedi013", "tss03_$samedi014", "tss03_$samedi015", "tss03_$samedi016", 
													"tss03_$samedi017", "tss03_$samedi018"}
Num_tss03_samedi_characters			= sizeof_table(Tss03_samedi_characters)

Tss03_samedi_characters_coop			= {"tss03_$samedi008", "tss03_$samedi009", "tss03_$samedi010", "tss03_$samedi011"}
Num_tss03_samedi_characters_coop		= sizeof_table(Tss03_samedi_characters_coop)

Tss03_samedi_kill_count					= 0
Total_tss03_samedi_characters			= Num_tss03_samedi_characters

Tss03_samedi_patrol_01					= {"tss03_$n004", "tss03_$n001", "tss03_$n005", "tss03_$n007", "tss03_$n008", 
													"tss03_$n002", "tss03_$n003", "tss03_$n004", "tss03_$n001"}
Num_tss03_samedi_patrol_01				= sizeof_table(Tss03_samedi_patrol_01)

Tss03_bum_characters						= {"tss03_$bum002", "tss03_$bum003", "tss03_$bum004"}
Num_tss03_bum_characters				= sizeof_table(Tss03_bum_characters)

Tss03_bum_characters_coop				= {"tss03_$bum006", "tss03_$bum007", "tss03_$bum008"}
Num_tss03_bum_characters_coop			= sizeof_table(Tss03_bum_characters_coop)

Tss03_bum_characters_rush				= {"tss03_$bum014", "tss03_$bum016", "tss03_$bum017", "tss03_$bum018"}
Num_tss03_bum_characters_rush			= sizeof_table(Tss03_bum_characters_rush)

Tss03_bum_kill_count						= 0
Total_tss03_bum_characters				= Num_tss03_bum_characters

Tss03_shanties								= {"tss03_ShantyA080", "tss03_ShantyB070", "tss03_ShantyB050", "tss03_ShantyA070", 
													"tss03_ShantyA090", "tss03_ShantyD050", "tss03_ShantyB060"}
Num_tss03_shanties						= sizeof_table(Tss03_shanties)
Tss03_shanty_destroyed_count			= 0
Tss03_shanties_destroyed				= {}

Tss03_compliment							= {"Compliment A", "Compliment B", "Compliment C", "Compliment D"}
Num_tss03_compliment						= sizeof_table(Tss03_compliment)

Tss03_taunt									= {"Insult A", "Insult B", "Insult C", "Insult D"}
Num_tss03_taunt							= sizeof_table(Tss03_taunt)

IN_COOP										= false
CAN_TAUNT_PLAYER							= true
PERFORMING_COMPLIMENT					= false

CONVERSATION_THREAD						= INVALID_THREAD_HANDLE
PATROL_THREAD								= INVALID_THREAD_HANDLE
SEES_PLAYER_THREAD						= INVALID_THREAD_HANDLE
MOLOTOVS_THREAD							= INVALID_THREAD_HANDLE
HUMAN_SHIELD_BUMS							= INVALID_THREAD_HANDLE
HUMAN_SHIELD_BUMS_COOP					= INVALID_THREAD_HANDLE
BUMS_REGENERATE							= INVALID_THREAD_HANDLE
BUMS_REGENERATE_COOP						= INVALID_THREAD_HANDLE
SHANTIES_REGENERATE						= INVALID_THREAD_HANDLE

LOCATION_START								= "mission_start_sr2_city_$tss03"
LOCATION_START_GAT						= "tss03_$gat"
LOCATION_START_PLAYER_2					= "tss03_$player2_start"

GROUP_START									= "tss03_$group_start"
GROUP_START_VEHICLE						= "tss03_$group_start_vehicle"
GROUP_ENTRYWAY								= "tss03_$group_entryway"
GROUP_SAMEDI								= "tss03_$group_samedi"
GROUP_SAMEDI_COOP							= "tss03_$group_samedi_coop"
GROUP_BUMS_SHANTY							= "tss03_$group_pistoleros"
GROUP_BUMS_RUSH							= "tss03_$group_bumrush"

CHARACTER_GAT								= "tss03_$gat"
CHARACTER_SAMEDI_PATROL_01				= "tss03_$samedi006"
CHARACTER_SAMEDI_PATROL_02				= "tss03_$samedi018"

TRIGGER_ENTRY								= "tss03_$trig_entry"
TRIGGER_WAYPOINT_1						= "tss03_$t000"
TRIGGER_WAYPOINT_2						= "tss03_$t001"
TRIGGER_WAYPOINT_3						= "tss03_$t002"
TRIGGER_SHANTYTOWN						= "tss03_$trig_shanty"

NAVPOINT_LOCAL_SUCCESS					= "tss03_$Nlocal_success"
NAVPOINT_REMOTE_SUCCESS					= "tss03_$Nremote_success"

-- This needs to come after Gat being defined...
Tss03_gat_player_drive_conversation = {{"TSSP3_INTRO_L1",			CHARACTER_GAT,	0.2},
													{"PLAYER_TSSP3_INTRO_L2",	LOCAL_PLAYER,	0.2},
													{"TSSP3_INTRO_L3",			CHARACTER_GAT,	0.2},
													{"PLAYER_TSSP3_INTRO_L4",	LOCAL_PLAYER,	0.2},
													{"TSSP3_INTRO_L5",			CHARACTER_GAT,	0.2},
													{"PLAYER_TSSP3_INTRO_L6",	LOCAL_PLAYER,	0.2},
													{"TSSP3_INTRO_L7",			CHARACTER_GAT,	0.2},
													{"PLAYER_TSSP3_INTRO_L8",	LOCAL_PLAYER,	0.2},
													{"TSSP3_INTRO_L9",			CHARACTER_GAT,	0.2},
													{"PLAYER_TSSP3_INTRO_L10",	LOCAL_PLAYER,	0.2}}

-- Human shields are not allowed in some builds.
HUMAN_SHIELDS_ALLOWED					= (not human_shielding_disabled())

-- Functions --

function tss03_start(checkpoint, is_restart)

	if (checkpoint == MISSION_START_CHECKPOINT) then
		if (not is_restart) then
			cutscene_play("tssp03-01", {GROUP_START, GROUP_START_VEHICLE}, {LOCATION_START, LOCATION_START_PLAYER_2}, false)
			group_show(GROUP_START)
			group_show(GROUP_START_VEHICLE)
		end
	end

	-- Start trigger is hit...the activate button was hit
	set_mission_author("Ryan Spencer")

	-- Check for coop being active
	if (coop_is_active()) then
		IN_COOP	= true

		-- In coop we want to change some values
		Total_tss03_samedi_characters	= (Num_tss03_samedi_characters + Num_tss03_samedi_characters_coop)
		Total_tss03_bum_characters		= (Num_tss03_bum_characters + Num_tss03_bum_characters_coop)
	end

	-- Prevent accidental notoriety overload
	notoriety_set_max("Samedi", 2)
	notoriety_set_max("Police", 2)

	-- Reduce the amount of damage applied to the players
	if (IN_COOP) then
		character_set_damage_multiplier(REMOTE_PLAYER, COOP_DAMAGE_MULTIPLIER)
		character_set_damage_multiplier(LOCAL_PLAYER, COOP_DAMAGE_MULTIPLIER)
	else
		character_set_damage_multiplier(LOCAL_PLAYER, SINGLE_PLAYER_DAMAGE_MULTIPLIER)
	end

	-- The total bum characters that will need to be eliminated include the rush group of characters
	Total_tss03_bum_characters = Total_tss03_bum_characters + Num_tss03_bum_characters_rush

	-- Play the intro cutscene
	cutscene_in()

	-- Disable the controls so the player can't move
	player_controls_disable(LOCAL_PLAYER)
	if (IN_COOP) then
		player_controls_disable(REMOTE_PLAYER)
	end

	-- Checkpoint or not...we need this to be set
	on_trigger("tss03_waypoint1", TRIGGER_WAYPOINT_1)
	on_trigger("tss03_waypoint2", TRIGGER_WAYPOINT_2)
	on_trigger("tss03_waypoint3", TRIGGER_WAYPOINT_3)
	on_trigger("tss03_shantytown", TRIGGER_SHANTYTOWN)

	if (checkpoint == MISSION_START_CHECKPOINT) then

		-- Create our necessary groups
		if (is_restart) then
			group_create(GROUP_START, true)
			group_create(GROUP_START_VEHICLE, true)

			-- Teleport Gat and the player(s) to where they will need to be
			teleport_coop(LOCATION_START, LOCATION_START_PLAYER_2)
		end

		-- Teleport Gat to his starting position
		teleport(CHARACTER_GAT, LOCATION_START_GAT)

		-- Add the objective destination
		marker_add_trigger(TRIGGER_ENTRY, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_LOCATION, SYNC_ALL)
		mission_waypoint_add(TRIGGER_ENTRY)

		-- We need to remove and add another destination
		on_trigger("tss03_checkpoint", TRIGGER_ENTRY)
		trigger_enable(TRIGGER_ENTRY, true)	

		-- Prompt the user to drive to the location
		mission_help_table("tss03_drive")

		-- Spawn off the conversation thread...
		CONVERSATION_THREAD = thread_new("tss03_gat_player_intro_conversation")
	else
		-- We hit the checkpoint so we need to start from there...all handled in entry point
		tss03_entrypoint()
	end

	-- When Johnny Gat dies
	on_death("tss03_failure", CHARACTER_GAT)
	-- When Johnny Gat is dismissed as a follower
	on_dismiss("tss03_abandon_gat", CHARACTER_GAT)

	-- Put Johnny Gat in player's party
	party_add(CHARACTER_GAT, LOCAL_PLAYER)

	-- Re-enable the controls so the player can move
	player_controls_enable(LOCAL_PLAYER)
	if (IN_COOP) then
		player_controls_enable(REMOTE_PLAYER)
	end

	-- Fade back into the game...
	cutscene_out()
end

function tss03_cleanup()

	-- Cleanup mission here...

	-- Reset IN_COOP in case mission end was triggered by a disconnect
	IN_COOP = coop_is_active()

	-- Reset the amount of damage applied to the players
	character_set_damage_multiplier(LOCAL_PLAYER, 1.0)
	if (IN_COOP) then
		character_set_damage_multiplier(REMOTE_PLAYER, 1.0)
	end

	on_weapon_fired("", LOCAL_PLAYER)


	-- Kill any active threads
	thread_kill(CONVERSATION_THREAD)
	thread_kill(PATROL_THREAD)
	thread_kill(SEES_PLAYER_THREAD)
	thread_kill(MOLOTOVS_THREAD)
	thread_kill(HUMAN_SHIELD_BUMS)
	thread_kill(HUMAN_SHIELD_BUMS_COOP)
	thread_kill(BUMS_REGENERATE)
	thread_kill(BUMS_REGENERATE_COOP)
	thread_kill(SHANTIES_REGENERATE)

	-- Just reset all of the persona overrides...
	if (character_exists(CHARACTER_GAT)) then
		persona_override_character_stop_all(CHARACTER_GAT)
	end

	-- Reset the spawning
	spawning_vehicles(true)
	spawning_pedestrians(true)
	-- Restore notoriety spawning
	notoriety_force_no_spawn("Samedi", false)

	-- Invalidate the deaths
	on_death("", CHARACTER_GAT)

	-- Invalidate Gat being dismissed
	on_dismiss("", CHARACTER_GAT)
	party_dismiss(CHARACTER_GAT)

	-- Invalidate the triggers
	on_trigger("", TRIGGER_ENTRY)
	on_trigger("", TRIGGER_WAYPOINT_1)
	on_trigger("", TRIGGER_WAYPOINT_2)
	on_trigger("", TRIGGER_WAYPOINT_3)
	on_trigger("", TRIGGER_SHANTYTOWN)

	-- Remove icons and waypoint...they might still exist
	marker_remove_trigger(TRIGGER_ENTRY, SYNC_ALL)
	marker_remove_trigger(TRIGGER_WAYPOINT_1, SYNC_ALL)
	marker_remove_trigger(TRIGGER_WAYPOINT_2, SYNC_ALL)
	marker_remove_trigger(TRIGGER_WAYPOINT_3, SYNC_ALL)
	marker_remove_trigger(TRIGGER_SHANTYTOWN, SYNC_ALL)
	mission_waypoint_remove(SYNC_ALL)

	-- Remove the icons from the Samedi characters
	for i = 1, Num_tss03_samedi_characters, 1 do
		tss03_cleanup_on_death_callback(Tss03_samedi_characters[i])
		marker_remove_npc(Tss03_samedi_characters[i], SYNC_ALL)
	end

	-- Remove the icons from the Samedi characters coop
	for i = 1, Num_tss03_samedi_characters_coop, 1 do
		tss03_cleanup_on_death_callback(Tss03_samedi_characters_coop[i])
		marker_remove_npc(Tss03_samedi_characters_coop[i], SYNC_ALL)
	end

	-- Remove the icons from the Bum characters
	for i = 1, Num_tss03_bum_characters, 1 do
		tss03_cleanup_on_death_callback(Tss03_bum_characters[i])
		marker_remove_npc(Tss03_bum_characters[i], SYNC_ALL)
	end

	-- Remove the icons from the Bum characters coop
	for i = 1, Num_tss03_bum_characters_coop, 1 do
		tss03_cleanup_on_death_callback(Tss03_bum_characters_coop[i])
		marker_remove_npc(Tss03_bum_characters_coop[i], SYNC_ALL)
	end

	-- Remove the icons from the bum rush characters
	for i,bum in pairs (Tss03_bum_characters_rush) do
		tss03_cleanup_on_death_callback(bum)
		marker_remove_npc(bum)
	end

	-- Remove icons from the shanties
	for i = 1, Num_tss03_shanties, 1 do
		if (not mesh_mover_destroyed(Tss03_shanties[i])) then
			marker_remove_mover(Tss03_shanties[i])
			on_mover_destroyed("", Tss03_shanties[i])
		end
	end

end

function tss03_cleanup_on_death_callback(npc)

	if (	character_exists(npc) ) then
		on_death("", npc)
	end

end

function tss03_success()
	-- Called when the mission has ended with success

	-- Post the news event
	radio_post_event("JANE_NEWS_TSSP03", true)

end

function tss03_complete()
	-- End the mission with success
	mission_end_success("tss03", "tssp03-02", {NAVPOINT_LOCAL_SUCCESS, NAVPOINT_REMOTE_SUCCESS})
end

function tss03_failure()
	-- End the mission since Gat was killed
	mission_end_failure("tss03", "tss03_gat_died")
end

function tss03_abandon_gat()
	-- End the mission since Gat was abandoned
	mission_end_failure("tss03", "tss03_gat_abandoned")
end

function tss03_checkpoint()
	-- Checkpoint
	mission_set_checkpoint("shantytown")

	-- Kill the conversation thread
	thread_kill(CONVERSATION_THREAD)

	-- Start the next section
	tss03_entrypoint()
end

function tss03_gat_player_intro_conversation()
	-- Play the conversation table
	audio_play_conversation_in_vehicle(Tss03_gat_player_drive_conversation)
end

function tss03_entrypoint()
	-- Disable the entry trigger and enable the first waypoint trigger
	trigger_enable(TRIGGER_ENTRY, false)
	trigger_enable(TRIGGER_WAYPOINT_1, true)

	-- Remove the objective destination
	marker_remove_trigger(TRIGGER_ENTRY, SYNC_ALL)
	mission_waypoint_remove(SYNC_ALL)

	-- Add the objective destination
	marker_add_trigger(TRIGGER_WAYPOINT_1, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)

	-- Create our first group of enemies
	-- group_create_hidden(GROUP_ENTRYWAY)
	group_create_hidden(GROUP_SAMEDI)
	group_create_hidden(GROUP_BUMS_SHANTY)

	-- Create the bum groups...
	for i = 1, Num_tss03_bum_characters, 1 do
		group_create_hidden(Tss03_bum_characters[i])
	end

	-- If we are in coop create the coop groups too
	if (IN_COOP) then
		group_create_hidden(GROUP_SAMEDI_COOP)
		
		for i = 1, Num_tss03_bum_characters_coop, 1 do
			group_create_hidden(Tss03_bum_characters_coop[i])
		end
	end

	-- Prompt the user to enter the underground
	mission_help_table("tss03_enter")

	-- Show the entry way bums
	-- group_show(GROUP_ENTRYWAY)

	-- Lets do some persona override here...
	persona_override_character_stop_all(CHARACTER_GAT)
	persona_override_character_start(CHARACTER_GAT, POT_SITUATIONS[POT_ATTACK],		"GAT_TSSP03_ATTACK")
	persona_override_character_start(CHARACTER_GAT, POT_SITUATIONS[POT_TAKE_DAMAGE], "GAT_TSSP03_TAKEDAM")

end

function tss03_waypoint1()
	-- Disable the waypoint trigger and enable the next waypoint trigger
	trigger_enable(TRIGGER_WAYPOINT_1, false)
	trigger_enable(TRIGGER_WAYPOINT_2, true)

	-- Remove the objective destination
	marker_remove_trigger(TRIGGER_WAYPOINT_1, SYNC_ALL)
	-- Add the objective destination
	marker_add_trigger(TRIGGER_WAYPOINT_2, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)

end

function tss03_waypoint2()
	-- Disable the waypoint trigger and enable the next waypoint trigger
	trigger_enable(TRIGGER_WAYPOINT_2, false)
	trigger_enable(TRIGGER_WAYPOINT_3, true)

	-- Remove the objective destination
	marker_remove_trigger(TRIGGER_WAYPOINT_2, SYNC_ALL)
	-- Add the objective destination
	marker_add_trigger(TRIGGER_WAYPOINT_3, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)
end

function tss03_waypoint3()
	-- Disable the waypoint trigger and enable the shantytown trigger
	trigger_enable(TRIGGER_WAYPOINT_3, false)
	trigger_enable(TRIGGER_SHANTYTOWN, true)

	-- Remove the objective destination
	marker_remove_trigger(TRIGGER_WAYPOINT_3, SYNC_ALL)
	-- Add the objective destination
	marker_add_trigger(TRIGGER_SHANTYTOWN, MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION, SYNC_ALL)
end

function tss03_patrol_01(name)
	local	i = 1

	SEES_PLAYER_THREAD = thread_new("tss03_patrol_sees_player", name)
	MOLOTOVS_THREAD = thread_new("tss03_molotovs", "tss03_$samedi001")

	-- Walk this path until the character attacks or is dead
	while (1) do
		-- Yields until path is completed
		move_to(name, Tss03_samedi_patrol_01[i])

		if (Tss03_samedi_patrol_01[i] == "tss03_$n005") then
			PERFORMING_COMPLIMENT = true
			
			turn_to_char(name, CHARACTER_SAMEDI_PATROL_02)
			action_play(name, Tss03_compliment[rand_int(1, Num_tss03_compliment)], nil, true, 0.95, true)
			
			PERFORMING_COMPLIMENT = false
		end

		i = i + 1
		if (i > Num_tss03_samedi_patrol_01) then
			i = 1
		end
	end
end

function tss03_patrol_sees_player(name)
	-- The patrol needs to be loaded
	while (not character_check_resource_loaded(name)) do
		thread_yield()
	end

	-- As long as the player can be taunted
	while (CAN_TAUNT_PLAYER) do
		-- Make sure the patrol is still alive
		if (character_is_dead(name)) then
			return
		end

		-- Taunt the player if possible
		if (not PERFORMING_COMPLIMENT and (fov_check(name, LOCAL_PLAYER) > 0.0) and los_check(name, LOCAL_PLAYER)) then
			patrol_pause(PATROL_THREAD)
			npc_go_idle(name)
			turn_to_char(name, LOCAL_PLAYER)
			action_play(name, Tss03_taunt[rand_int(1, Num_tss03_taunt)], nil, true, .95, true)
			patrol_unpause(PATROL_THREAD)
		end

		delay(8)
	end
end

function tss03_shantytown()
	-- Reset the movers in case they were destroyed before this sequence
	for i = 1, Num_tss03_shanties, 1 do
		mesh_mover_reset(Tss03_shanties[i])
	end

	-- Disable the trigger...the action starts now!
	trigger_enable(TRIGGER_SHANTYTOWN, false)

	-- Release the entry way bums to the world
	-- release_to_world(GROUP_ENTRYWAY)

	-- Remove the objective destination
	marker_remove_trigger(TRIGGER_SHANTYTOWN, SYNC_ALL)

	-- No notoriety spawning
	notoriety_force_no_spawn("Samedi", true)

	-- Show our first group of enemies
	group_show(GROUP_SAMEDI)
	-- Add markers to the Samedi
	marker_add_group(GROUP_SAMEDI, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL)

	-- Add an on death function to the Samedi NPCs...
	for i = 1, Num_tss03_samedi_characters, 1 do
		on_death("tss03_samedi_killer", Tss03_samedi_characters[i])
	end

	-- Force a character to patrol
	PATROL_THREAD = patrol("tss03_patrol_01", CHARACTER_SAMEDI_PATROL_01)

	-- If we are in coop then show the coop group too
	if (IN_COOP) then
		-- Show our first group of enemies
		group_show(GROUP_SAMEDI_COOP)
		-- Add markers to the Samedi
		marker_add_group(GROUP_SAMEDI_COOP, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL)

		-- Add an on death function to the Samedi NPCs...
		for i = 1, Num_tss03_samedi_characters_coop, 1 do
			on_death("tss03_samedi_killer", Tss03_samedi_characters_coop[i])
		end
	end

	-- Setup the Shanties...we need to keep track of shanties destroyed before the player is instructed to do so
	for i = 1, Num_tss03_shanties, 1 do
		on_mover_destroyed("tss03_shanty_destroyed", Tss03_shanties[i])
		if (not HUMAN_SHIELDS_ALLOWED) then
			set_current_hit_points(Tss03_shanties[i], 375)
		end
	end

	-- Show the bums with pistols in the shanty area...currently don't regenerate if killed early
	group_show(GROUP_BUMS_SHANTY)

	-- Setup the barkeeper to attack on fire...
	on_weapon_fired("tss03_attack_now", LOCAL_PLAYER)

	-- Prompt the user to kill the Samedi
	mission_help_table("tss03_samedi")

	-- Show the objective text on the HUD
	objective_text(0, "tss03_samedi_left", Tss03_samedi_kill_count, Total_tss03_samedi_characters)
end

function tss03_attack_now(human, weapon, name)
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

function tss03_molotovs(human)
	-- Make sure this human has the molotov
	inv_item_remove_all(human)
	inv_item_add("molotov", 1, human)

	while (1) do
		-- If the human is dead just exit
		if (character_is_dead(human)) then
			return
		end

		-- Make sure the player is close enough and is in line of sight
		if ((get_dist_char_to_char(human, LOCAL_PLAYER) < 25.0) and los_check(human, LOCAL_PLAYER)) then
			-- Turn to and throw a molotov
			npc_go_idle(human)
			turn_to_char(human, LOCAL_PLAYER)
			npc_go_idle(human)
			force_throw_char(human, LOCAL_PLAYER)

			delay(rand_int(3, 8))
		elseif (IN_COOP) then
			-- Time to check the remote player
			if ((get_dist_char_to_char(human, REMOTE_PLAYER) < 25.0) and los_check(human, REMOTE_PLAYER)) then
				-- Turn to and throw a molotov
				npc_go_idle(human)
				turn_to_char(human, REMOTE_PLAYER)
				npc_go_idle(human)
				force_throw_char(human, REMOTE_PLAYER)

				delay(rand_int(3, 8))
			else
				-- Can't throw at anyone so just yield
				thread_yield()
			end
		else
			-- Not in coop so just yield
			thread_yield()
		end
	end
end

function tss03_throw_kill_tutorial()

	local function tss03_wait_for_human_shield()
		local		local_has_human_shield = false
		local		remote_has_human_shield = false
		while (not local_has_human_shield and (not remote_has_human_shield)) do
			-- Do any of the player(s) have a human shield
			local_has_human_shield = character_has_human_shield(LOCAL_PLAYER)
			if (IN_COOP) then
				remote_has_human_shield = character_has_human_shield(REMOTE_PLAYER)
			end

			thread_yield()
		end
	end

	-- Wait until a player has a human shield
	tss03_wait_for_human_shield()

	-- Show the human shield throw/kill help text
	tutorial_start("throw_kill", 0, true)

	-- Delay a bit before showing the next messgae
	delay(15)

	-- Tell the player that they can use human shields to destroy the shanties
	-- Only show this message if shanties remain.
	if (Tss03_shanty_destroyed_count < Num_tss03_shanties) then
		mission_help_table_nag("tss03_toss")
	end

	-- Delay a bit before showing the next messgae
	delay(15)

	-- Tell the player that they can use LB to quick toss humans
	-- Only show this message if shanties remain.
	if (Tss03_shanty_destroyed_count < Num_tss03_shanties) then
		mission_help_table_nag("tss01_push_throw")
	end

	-- Wait a bit longer
	delay(15)

	-- Wait until a player has a human shield
	tss03_wait_for_human_shield()

	-- Tell the player to hold RB to sprint. This is displayed while they're holding a humah shield
	-- so that they'll realize that they can still use the sprint meter in this state.
	mission_help_table_nag("TUT_SPRINT")

end

function tss03_human_shield_bums()
	local		local_player_close_enough = false
	local		remote_player_close_enough = false

	-- Wait until either player is close enough to a bum
	while ( (not local_player_close_enough) and (not remote_player_close_enough) ) do
		for i = 1, Num_tss03_bum_characters, 1 do
			local_player_close_enough = local_player_close_enough or (get_dist(LOCAL_PLAYER, Tss03_bum_characters[i]) < 5.0)

			if (not local_player_close_enough and IN_COOP) then
				remote_player_close_enough = remote_player_close_enough or (get_dist(REMOTE_PLAYER, Tss03_bum_characters[i]) < 5.0)
			end
		end

		thread_yield()
	end

	-- Kill the other thread
	thread_kill(HUMAN_SHIELD_BUMS_COOP)

	-- Show the human shield help text
	tutorial_start("human_shield", 0, true)


	-- Show the throw tutorial once a human shield has been taken
	thread_new("tss03_throw_kill_tutorial")
end

function tss03_human_shield_bums_coop()
	local		local_player_close_enough = false
	local		remote_player_close_enough = false

	-- Wait until either player is close enough to a bum
	while ( (not local_player_close_enough) and (not remote_player_close_enough)) do
		for i = 1, Num_tss03_bum_characters_coop, 1 do
			local_player_close_enough = local_player_close_enough or (get_dist(LOCAL_PLAYER, Tss03_bum_characters_coop[i]) < 5.0)

			if (not local_player_close_enough and IN_COOP) then
				remote_player_close_enough = remote_player_close_enough or (get_dist(REMOTE_PLAYER, Tss03_bum_characters_coop[i]) < 5.0)
			end
		end

		thread_yield()
	end

	-- Kill the other thread
	thread_kill(HUMAN_SHIELD_BUMS)

	-- Show the human shield help text
	tutorial_start("human_shield", 0, true)

	-- Show the throw tutorial once a human shield has been taken
	thread_new("tss03_throw_kill_tutorial")
end

function tss03_samedi_killer(name)
	-- Remove the marker
	marker_remove_npc(name, SYNC_ALL)
	Tss03_samedi_kill_count = Tss03_samedi_kill_count + 1

	if (name == CHARACTER_SAMEDI_PATROL_01) then
		thread_kill(SEES_PLAYER_THREAD)
	end

	if (name == "tss03_$samedi001") then
		thread_kill(MOLOTOVS_THREAD)
	end

	-- Show the objective text on the HUD
	objective_text(0, "tss03_samedi_left", Tss03_samedi_kill_count, Total_tss03_samedi_characters)

	-- If all the Samedi are killed activate the bum sequence and destroy the shanties
	if (Tss03_samedi_kill_count == Total_tss03_samedi_characters) then
		-- Delay for a moment before this is setup
		delay(1)
		tss03_destroy_the_shanties()
	end
end

function tss03_shanty_destroyer(mover, human)
	-- Remove the marker
	marker_remove_mover(mover, SYNC_ALL)
	Tss03_shanty_destroyed_count = Tss03_shanty_destroyed_count + 1

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

	objective_text(0, "tss03_shanties_left", Tss03_shanty_destroyed_count, Num_tss03_shanties)

	-- If all the shanties are destroyed activate the bum sequence
	if (Tss03_shanty_destroyed_count == Num_tss03_shanties) then
		-- Delay for a moment before this is setup
		delay(1)
		tss03_eliminate_bums()
	end
end

function tss03_shanty_destroyed(name)
	-- Decrease the shanty count left to destroy
	Tss03_shanty_destroyed_count = Tss03_shanty_destroyed_count + 1
	Tss03_shanties_destroyed[name] = true

	-- Remove the on death callback for this shanty
	on_mover_destroyed("", name)
end

function tss03_bum_killer(name)
	-- Remove the marker
	marker_remove_npc(name, SYNC_ALL)
	Tss03_bum_kill_count = Tss03_bum_kill_count + 1

	objective_text(0, "tss03_bums_left", Tss03_bum_kill_count, Total_tss03_bum_characters)

	-- If all the Bums are killed, the mission is complete
	if (Tss03_bum_kill_count == Total_tss03_bum_characters) then
		tss03_complete()
	end
end

function tss03_bum_died(name)

	-- Remove the death callback
	on_death("", name)
	-- Release this bum (his group) to the world
	release_to_world(name)
end

function tss03_destroy_the_shanties()
	-- Release any Samedi bodies to the world
	release_to_world(GROUP_SAMEDI)
	marker_remove_group(GROUP_SAMEDI, SYNC_ALL)

	-- Add an on death function to the Bum NPCs...
	for i = 1, Num_tss03_bum_characters, 1 do
		on_death("tss03_bum_died", Tss03_bum_characters[i])
	end

	-- If we are in coop then do this for the coop group
	if (IN_COOP) then
		-- Release any Samedi coop bodies to the world
		release_to_world(GROUP_SAMEDI_COOP)
		marker_remove_group(GROUP_SAMEDI_COOP, SYNC_ALL)
		
		-- Add an on death function to the coop Bum NPCs...
		for i = 1, Num_tss03_bum_characters_coop, 1 do
			on_death("tss03_bum_died", Tss03_bum_characters_coop[i])
		end
	end

	-- Setup the Shanties
	for i = 1, Num_tss03_shanties, 1 do
		if (not Tss03_shanties_destroyed[Tss03_shanties[i]]) then
			marker_add_mover(Tss03_shanties[i], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL)
			on_mover_destroyed("tss03_shanty_destroyer", Tss03_shanties[i])
			if (HUMAN_SHIELDS_ALLOWED) then
				set_current_hit_points(Tss03_shanties[i], 2)
			else
				-- In builds which don't allow human shields
				set_current_hit_points(Tss03_shanties[i], 375)
			end
		end
	end

	if (HUMAN_SHIELDS_ALLOWED) then

		-- Look to show the human shield help text
		HUMAN_SHIELD_BUMS = thread_new("tss03_human_shield_bums")
		if (IN_COOP) then
			HUMAN_SHIELD_BUMS_COOP = thread_new("tss03_human_shield_bums_coop")
		end


	end

	-- Let the regenerate script initially reveal and recreate the bums when they are killed
	BUMS_REGENERATE = thread_new("tss03_regenerate_bums")
	if (IN_COOP) then
		BUMS_REGENERATE_COOP = thread_new("tss03_regenerate_bums_coop")
	end


	-- If all the Shanties were killed before hand, activate the bum sequence
	if (Tss03_shanty_destroyed_count == Num_tss03_shanties) then
		tss03_eliminate_bums()
	else
		-- Prompt the user to destroy the Shanties
		mission_help_table("tss03_shanties")
		-- Show the objective text on the HUD
		objective_text(0, "tss03_shanties_left", Tss03_shanty_destroyed_count, Num_tss03_shanties)
	end

end

function tss03_regenerate_bums()
	-- While in this mission
	while (1) do
		-- Loop through the zombies and check for revival
		for i = 1, Num_tss03_bum_characters, 1 do
			-- When a group is no longer loaded and is dead, recreate the group
			if (not group_is_loaded(Tss03_bum_characters[i])) then
				-- Create the group, hidden
				group_create_hidden(Tss03_bum_characters[i])
			end

			-- If the current bum is hidden then see if we can reveal it
			if (character_hidden(Tss03_bum_characters[i])) then

				if (tss03_can_show_bum(Tss03_bum_characters[i])) then
					tss03_regenerate_bum(Tss03_bum_characters[i])
				end
			end

			-- Yield and check the next bum in the next frame
			thread_yield()
		end
	end
end

function tss03_regenerate_bums_coop()
	-- While in this mission
	while (1) do
		-- Loop through the zombies and check for revival
		for i = 1, Num_tss03_bum_characters_coop, 1 do
			-- When a group is no longer loaded and is dead, recreate the group
			if (not group_is_loaded(Tss03_bum_characters_coop[i])) then
				-- Create the group, hidden
				group_create_hidden(Tss03_bum_characters_coop[i])
			end

			-- If the current bum is hidden then see if we can reveal it
			if (character_hidden(Tss03_bum_characters_coop[i])) then

				if (tss03_can_show_bum(Tss03_bum_characters_coop[i])) then
					tss03_regenerate_bum(Tss03_bum_characters_coop[i])
				end
			end

			-- Yield and check the next bum in the next frame
			thread_yield()
		end
	end
end

function tss03_regenerate_bum(bum)
	-- Wait for the resources to be loaded
	character_wait_for_loaded_resource(bum)
	-- Show the bum
	group_show(bum)
	-- Setup the death callback
	on_death("tss03_bum_died", bum)
end

function tss03_eliminate_bums()
	-- Create the bum rush group
	group_create_hidden(GROUP_BUMS_RUSH)

	-- Kill the regenerate threads
	thread_kill(BUMS_REGENERATE)
	thread_kill(BUMS_REGENERATE_COOP)

	-- Add markers to the bums
	for i = 1, Num_tss03_bum_characters, 1 do
		if (not character_is_dead(Tss03_bum_characters[i]) and not character_hidden(Tss03_bum_characters[i])) then
			marker_add_npc(Tss03_bum_characters[i], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL)
			on_death("tss03_bum_killer", Tss03_bum_characters[i])
		else
			Tss03_bum_kill_count = Tss03_bum_kill_count + 1
		end
	end

	-- If we are in coop then do this for the coop bums
	if (IN_COOP) then
		-- Add markers to the coop bums
		for i = 1, Num_tss03_bum_characters_coop, 1 do
			if (not character_is_dead(Tss03_bum_characters_coop[i]) and not character_hidden(Tss03_bum_characters_coop[i])) then
				marker_add_npc(Tss03_bum_characters_coop[i], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL)
				on_death("tss03_bum_killer", Tss03_bum_characters_coop[i])
			else
				Tss03_bum_kill_count = Tss03_bum_kill_count + 1
			end
		end
	end

	-- Add markers to the rush bums
	for i,bum in pairs (Tss03_bum_characters_rush) do
		if (tss03_can_show_bum(bum)) then
			character_show(bum)
			marker_add_npc(bum, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, SYNC_ALL)
			on_death("tss03_bum_killer", bum)
			attack(bum)
		else
			Tss03_bum_kill_count = Tss03_bum_kill_count + 1
		end
	end

	-- If all the Bums are killed, the mission is complete
	if (Tss03_bum_kill_count == Total_tss03_bum_characters) then
		tss03_complete()
	else
		-- Prompt the user to kill the bums
		mission_help_table("tss03_bums")
		-- Show the objective text on the HUD
		objective_text(0, "tss03_bums_left", Tss03_bum_kill_count, Total_tss03_bum_characters)
	end
end

function tss03_can_show_bum(bum)

	local local_can_show		= not npc_in_player_fov(bum, LOCAL_PLAYER)
	local remote_can_show	= true

	if (IN_COOP) then
		remote_can_show = not npc_in_player_fov(bum, REMOTE_PLAYER)
	end
	
	local dist_can_show = get_dist_closest_player_to_object(bum) > 8

	if (local_can_show and remote_can_show and dist_can_show) then
		return true
	end

end

