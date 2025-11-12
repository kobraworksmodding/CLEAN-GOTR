-- Cutscene crash fixes by IdolNinja
-- 3/12/2011


--[[--------------------------------------------------------------
-- sh_rn_stripclub.lua
-- ronin stronghold 1 - suburbs strip club "Technically Legal"
-- alvan monje

TO DO:
	- phone cutscene?
	X	- for reinf cutscene, destroy cutscene group after
	X	- add recurring attack function for reinf group, and triggers?
	X	- add no flee flags for reinf group
	X	- adjust sword reinf guys
	- some weapon pickups don't work
		- if i have ar50, can't get sniper and vice versa
		- ar50 didn't have grenades in it
		- couldn't drop more than one qty of satchel
		- no respawning
	X	- make RPGer attack more
	- lower wall
	- reinf cutscene -- sometimes guys crash into each other, go super fast, don't break soon enough


UNUSED:
reinforce_old = {"sh_rn_stripclub_$c-bike1", "sh_rn_stripclub_$c-bike2", "sh_rn_stripclub_$c-sedan1-1", "sh_rn_stripclub_$c-sedan1-2", "sh_rn_stripclub_$c008",
					"sh_rn_stripclub_$c008 (0)", "sh_rn_stripclub_$c008 (1)", "sh_rn_stripclub_$c008 (2)", "sh_rn_stripclub_$c008 (3)",
					"sh_rn_stripclub_$c008 (4)", "sh_rn_stripclub_$c008 (5)", "sh_rn_stripclub_$c008 (6)", "sh_rn_stripclub_$c008 (7)",
					"sh_rn_stripclub_$c-sedan5", "sh_rn_stripclub_$c-bike6", "sh_rn_stripclub_$c008 (8)", "sh_rn_stripclub_$c008 (9)",
					"sh_rn_stripclub_$c008 (10)", "sh_rn_stripclub_$c008 (11)"}
----------------------------------------------------------------]]



--Globals-------
floor1_gang = {"sh_rn_stripclub_$c002", "sh_rn_stripclub_$c003", "sh_rn_stripclub_$c010", "sh_rn_stripclub_$c010 (0)", "sh_rn_stripclub_$c010 (1)",
						"sh_rn_stripclub_$c010 (2)", "sh_rn_stripclub_$c010 (3)", "sh_rn_stripclub_$c010 (4)", "sh_rn_stripclub_$c010 (5)", "sh_rn_stripclub_$c010 (6)"}
floor2_gang = {"sh_rn_stripclub_$c011", "sh_rn_stripclub_$c011 (0)", "sh_rn_stripclub_$c011 (1)", "sh_rn_stripclub_$c011 (2)"}
floor1_civ = {"sh_rn_stripclub_$c004", "sh_rn_stripclub_$c005", "sh_rn_stripclub_$c006", "sh_rn_stripclub_$c007", "sh_rn_stripclub_$c005 (0)",
						"sh_rn_stripclub_$c005 (1)", "sh_rn_stripclub_$c005 (2)", "sh_rn_stripclub_$c005 (3)", "sh_rn_stripclub_$c009", "sh_rn_stripclub_$c009 (0)",
						"sh_rn_stripclub_$c009 (1)"}
floor2_civ = {"sh_rn_stripclub_$c006 (0)", "sh_rn_stripclub_$c006 (1)", "sh_rn_stripclub_$c006 (2)", "sh_rn_stripclub_$c006 (3)"}
reinforce1 = {"sh_rn_stripclub_$c008", "sh_rn_stripclub_$c008 (0)", "sh_rn_stripclub_$c008 (1)", "sh_rn_stripclub_$c008 (2)", "sh_rn_stripclub_$c008 (3)",
					"sh_rn_stripclub_$c008 (4)", "sh_rn_stripclub_$c008 (5)", "sh_rn_stripclub_$c008 (6)", "sh_rn_stripclub_$c008 (7)",
					"sh_rn_stripclub_$c008 (8)", "sh_rn_stripclub_$c008 (9)", "sh_rn_stripclub_$c008 (10)", "sh_rn_stripclub_$c008 (11)"}
num_gang_flr1 = sizeof_table(floor1_gang)
num_gang_flr2 = sizeof_table(floor2_gang)
num_gang_reinforce = sizeof_table(reinforce1)
gang_flr1_killed = 0
gang_flr2_killed = 0
gang_reinf_killed = 0
player_used_exit_trigger = false

-- CUTSCENES --
-- Added by IdolNinja. These variables are used in the script for the cutscenes for stability instead of calling them directly

	CUTSCENE_IN = 		"sh_rn_stripclub_ct1"
	CUTSCENE_MID =		"sh_rn_stripclub_ct2"
	MISSION_NAME =		"sh_rn_stripclub"

--Functions-------
function sh_rn_stripclub_start(checkpoint, is_restart)
	set_mission_author("David Bowring")
	notoriety_force_no_spawn("ronin", true) 	
	--group_create_hidden("sh_rn_stripclub_$G-flr1-gang")
	--group_create_hidden("sh_rn_stripclub_$G-flr1-civ")
	--fade_out(.5)
	delay(.6)
	mission_start_fade_out()

	teleport_coop("sh_rn_stripclub_$nstart","sh_rn_stripclub_$nstart (0)")
	door_lock("sh_rn_stripclub_SD_WRCN_doorMM070", true)
	door_lock("sh_rn_stripclub_SD_WRCN_doorMM080", true)
	if (not is_restart) then
		cutscene_play(CUTSCENE_IN,"sh_rn_stripclub_$G-flr1-gang")
		group_show("sh_rn_stripclub_$G-flr1-gang")
		group_destroy("sh_rn_stripclub_$G-newcut")
	else
		group_create("sh_rn_stripclub_$G-flr1-gang",true)
	end
	trigger_enable("sh_rn_stripclub_$tfront-doortwo", true)
	on_trigger("sh_rn_stripclub_secondfloor", "sh_rn_stripclub_$tsecond")
	on_trigger("sh_rn_stripclub_frontdoor", "sh_rn_stripclub_$tfront-doortwo")
	marker_add_navpoint("sh_rn_stripclub_$tfront-doortwo", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
	group_create("sh_rn_stripclub_$G-flr1-civ")
	release_to_world("sh_rn_stripclub_$G-flr1-civ")		
	door_lock("sh_rn_stripclub_SD_WRCN_doorMM091", true)
	--while ( (not group_is_loaded("sh_rn_stripclub_$G-flr1-gang")) or (not group_is_loaded("sh_rn_stripclub_$G-flr1-civ")) ) do
	--	thread_yield()
	--end
	delay(2)
	mission_help_table("sh_rn_stripclub_start") -- "Kill all the Ronin lieutenants!"
	objective_text(0, "sh_rn_stripclub_lts_left", gang_flr1_killed, num_gang_flr1)
	mission_start_fade_in()
end

function sh_rn_stripclub_frontdoor()
	trigger_enable("sh_rn_stripclub_$tfront-doortwo", false)
	on_trigger("", "sh_rn_stripclub_$tfront-doortwo")
	marker_remove_navpoint("sh_rn_stripclub_$tfront-doortwo")	
	for i = 1, num_gang_flr1, 1 do
		if character_is_dead(floor1_gang[i])==false then
			marker_add_npc(floor1_gang[i], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
			on_death("sh_rn_stripclub_killcount_gang_flr1", floor1_gang[i])
		end
	end
end

function sh_rn_stripclub_player_outside()
player_used_exit_trigger = true
marker_remove_navpoint("sh_rn_stripclub_$t-upper-roof")
trigger_enable("sh_rn_stripclub_$t-lower-roof", false)
trigger_enable("sh_rn_stripclub_$t-upper-roof", false)
trigger_enable("sh_rn_stripclub_$t-front-door", false)
--trigger_enable("sh_rn_stripclub_$t-reinf-attack1", true)		
on_trigger("", "sh_rn_stripclub_$t-lower-roof")
on_trigger("", "sh_rn_stripclub_$t-upper-roof")
on_trigger("", "sh_rn_stripclub_$t-front-door")
	
	for i = 1, num_gang_reinforce, 1 do
		if character_is_dead(reinforce1[i]) == false then
			marker_add_npc(reinforce1[i], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
			on_death("sh_rn_stripclub_killcount_gang_reinf", reinforce1[i])
		end
	end
end



function sh_rn_stripclub_secondfloor()
	trigger_enable("sh_rn_stripclub_$tsecond", false)
	on_trigger("", "sh_rn_stripclub_$tsecond")
	marker_remove_navpoint("sh_rn_stripclub_$tsecond")	
	for i = 1, num_gang_flr2, 1 do
		if  character_is_dead(floor2_gang[i]) == false then
			marker_add_npc(floor2_gang[i], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
			on_death("sh_rn_stripclub_killcount_gang_flr2", floor2_gang[i])
		end
	end
end

function sh_rn_stripclub_cleanup()
	-- disable and unregister triggers
	spawning_pedestrians(true)
	marker_remove_navpoint("sh_rn_stripclub_$tfront-doortwo")
	marker_remove_navpoint("sh_rn_stripclub_$t-upper-roof")
	marker_remove_navpoint("sh_rn_stripclub_$tsecond")
	trigger_enable("sh_rn_stripclub_$t-reinf-attack1", false)
	trigger_enable("sh_rn_stripclub_$t-lower-roof", false)
	trigger_enable("sh_rn_stripclub_$t-upper-roof", false)
	trigger_enable("sh_rn_stripclub_$t-front-door", false)
	on_trigger("", "sh_rn_stripclub_$tsecond")
	on_trigger("", "sh_rn_stripclub_$tfront-doortwo")
	on_trigger("", "sh_rn_stripclub_$t-reinf-attack1")
	on_trigger("", "sh_rn_stripclub_$t-lower-roof")
	on_trigger("", "sh_rn_stripclub_$t-upper-roof")
	on_trigger("", "sh_rn_stripclub_$t-front-door")
	trigger_enable("sh_rn_stripclub_$tfront-doortwo", false)
	on_trigger("", "sh_rn_stripclub_$tfront-doortwo")
	spawning_vehicles(true)
	-- remove icons, unregister on_death functions
	for i = 1, num_gang_flr1, 1 do
		if group_is_loaded("sh_rn_stripclub_$G-flr1-gang") then
			if character_is_dead(floor1_gang[i])== false then
				marker_remove_npc(floor1_gang[i])
				on_death("", floor1_gang[i])
			end
		end
	end

	for i = 1, num_gang_flr2, 1 do
		if group_is_loaded("sh_rn_stripclub_$G-flr2-gang") then
			if character_is_dead(floor1_gang[i])== false then
				marker_remove_npc(floor2_gang[i])
				on_death("", floor2_gang[i])
			end
		end
	end

	for i = 1, num_gang_reinforce, 1 do
		if group_is_loaded("sh_rn_stripclub_$G-reinforce-game") then
			if character_is_dead(reinforce1[i])== false then
				marker_remove_npc(reinforce1[i])
				on_death("", reinforce1[i])
			end
		end
	end
	
	notoriety_set_min("ronin", 0)
	notoriety_set_max("ronin", 5)
	notoriety_set("ronin", 0)
	notoriety_force_no_spawn("ronin", false)
	-- release groups
	release_to_world("sh_rn_stripclub_$G-flr1-gang")
	release_to_world("sh_rn_stripclub_$G-flr1-civ")
	release_to_world("sh_rn_stripclub_$G-reinforce-game")
	release_to_world("sh_rn_stripclub_$G-reinforce-cutscene")
	release_to_world("sh_rn_stripclub_$G-flr2-gang")
	release_to_world("sh_rn_stripclub_$G-flr2-civ")
end



function sh_rn_stripclub_success()

end



function sh_rn_stripclub_killcount_gang_flr1(npc)
	gang_flr1_killed = gang_flr1_killed + 1
	marker_remove_npc(npc)
	objective_text(0, "sh_rn_stripclub_lts_left", gang_flr1_killed, num_gang_flr1)
	release_to_world(npc)
	
	
	if gang_flr1_killed == 1 then

	notoriety_set_max("ronin", 2)
	notoriety_set_min("ronin", 2) 
	end

	if (gang_flr1_killed == num_gang_flr1) then
		group_create("sh_rn_stripclub_$G-flr2-gang", true)
		group_create("sh_rn_stripclub_$G-flr2-civ", true)

		for i = 1, num_gang_flr2, 1 do
			--marker_add_npc(floor2_gang[i], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
			on_death("sh_rn_stripclub_killcount_gang_flr2", floor2_gang[i])
		end

		delay(2)
		mission_help_table("sh_rn_stripclub_upstairs")  -- "Head upstairs and finish off the rest of the Ronin lieutenants."
		objective_text(0, "sh_rn_stripclub_lts_left2", gang_flr2_killed, num_gang_flr2)
		trigger_enable("sh_rn_stripclub_$tsecond", true)
		door_lock("sh_rn_stripclub_SD_WRCN_doorMM091", false)
		marker_add_navpoint("sh_rn_stripclub_$tsecond", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
	end
end



function sh_rn_stripclub_killcount_gang_flr2(npc)
	gang_flr2_killed = gang_flr2_killed + 1
	marker_remove_npc(npc)
	objective_text(0, "sh_rn_stripclub_lts_left2", gang_flr2_killed, num_gang_flr2)

	if (gang_flr2_killed == num_gang_flr2) then
		group_destroy("sh_rn_stripclub_$G-flr1-civ") -- destroy previous civilian group so we don't run out of slots for new groups
		group_create_hidden("sh_rn_stripclub_$G-reinforce-game")
		door_open("sh_rn_stripclub_SD_WRCN_doorMM091")

		
			
		--cutscene_play(CUTSCENE_MID)
		door_lock("sh_rn_stripclub_SD_WRCN_doorMM080", false)
		-- destroy group used in cutscene
		--if group_is_loaded("sh_rn_stripclub_$G-reinforce-cutscene") then
			group_destroy("sh_rn_stripclub_$G-reinforce-cutscene")
		--end

		-- make sure new group is loaded before proceeding
		while (  not group_is_loaded("sh_rn_stripclub_$G-reinforce-game")  ) do
			thread_yield()
		end
			group_show("sh_rn_stripclub_$G-reinforce-game")
		
		for i = 1, num_gang_reinforce, 1 do
			if character_is_dead(reinforce1[i]) == false then
			--marker_add_npc(reinforce1[i], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
			on_death("sh_rn_stripclub_killcount_gang_reinf", reinforce1[i])
			end
		end

		-- setup triggers
		trigger_enable("sh_rn_stripclub_$t-lower-roof", true)
		trigger_enable("sh_rn_stripclub_$t-upper-roof", true)
		trigger_enable("sh_rn_stripclub_$t-front-door", true)
		--trigger_enable("sh_rn_stripclub_$t-reinf-attack1", true)		
		on_trigger("sh_rn_stripclub_recurring_attack", "sh_rn_stripclub_$t-lower-roof")
		on_trigger("sh_rn_stripclub_recurring_attack", "sh_rn_stripclub_$t-upper-roof")
		on_trigger("sh_rn_stripclub_recurring_attack", "sh_rn_stripclub_$t-front-door")
		--on_trigger("sh_rn_stripclub_reinf_attack1", "sh_rn_stripclub_$t-reinf-attack1")
		
		--marker_add_navpoint("sh_rn_stripclub_$t-lower-roof",MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
		delay(2)
		sh_rn_stripclub_ctplay()		
	end
end



function sh_rn_stripclub_killcount_gang_reinf(npc)
	gang_reinf_killed = gang_reinf_killed + 1
	if player_used_exit_trigger == false then
		sh_rn_stripclub_player_outside()
	end
	
	marker_remove_npc(npc)
	objective_text(0, "sh_rn_stripclub_reinforce_left", gang_reinf_killed, num_gang_reinforce)
	release_to_world(npc)

	if (gang_reinf_killed == num_gang_reinforce) then
		delay(3)
		mission_end_success(MISSION_NAME)
	end
end



-- after reinforcements cutscene, if player goes back downstairs, make sword guys in long hallway attack player
function sh_rn_stripclub_reinf_attack1()
	trigger_enable("sh_rn_stripclub_$t-reinf-attack1", false)
	trigger_enable("sh_rn_stripclub_$t-lower-roof", false)
	trigger_enable("sh_rn_stripclub_$t-upper-roof", false)
	trigger_enable("sh_rn_stripclub_$t-front-door", false)
	--marker_remove_navpoint("sh_rn_stripclub_$t-lower-roof")
	marker_remove_navpoint("sh_rn_stripclub_$t-upper-roof")		
	for i = 1, num_gang_reinforce, 1 do			
		marker_add_npc(reinforce1[i], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
		on_death("sh_rn_stripclub_killcount_gang_reinf", reinforce1[i])
	end
	attack("sh_rn_stripclub_$c-reinf-in (1)")
	attack("sh_rn_stripclub_$c-reinf-in (2)")
	attack("sh_rn_stripclub_$c-reinf-in (5)")
end



-- when player goes to either rooftop/outside, periodically call attack() on reinforce dudes, otherwise they might "time out" and forget about the PC/wander off somewhere and get lost
function sh_rn_stripclub_recurring_attack()
	player_used_exit_trigger = true
	trigger_enable("sh_rn_stripclub_$t-lower-roof", false)
	trigger_enable("sh_rn_stripclub_$t-upper-roof", false)
	trigger_enable("sh_rn_stripclub_$t-front-door", false)
	marker_remove_navpoint("sh_rn_stripclub_$t-lower-roof")
	marker_remove_navpoint("sh_rn_stripclub_$t-upper-roof")
		
	for i = 1, num_gang_reinforce, 1 do
		marker_add_npc(reinforce1[i], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
		on_death("sh_rn_stripclub_killcount_gang_reinf", reinforce1[i])
	end

	for i = 1, num_gang_reinforce, 1 do
		set_always_sees_player_flag(reinforce1[i], true)
	end
	
	while (1) do
		delay(5)

		for i = 1, num_gang_reinforce, 1 do
			attack(reinforce1[i])
			delay(1)
		end
	end
end


-- Real function
function sh_rn_stripclub_ctplay()	
	if coop_is_active() then	
	fade_out(.5)
	fade_out_block()
	teleport_coop("sh_rn_stripclub_$nSecond_Tele", "sh_rn_stripclub_$tsecond", true)
	fade_in(.5)
	end	
	spawning_pedestrians(false)
	spawning_vehicles(false)
	cutscene_play(CUTSCENE_MID)
	mission_help_table("sh_rn_stripclub_reinforce")  -- "Eliminate the Ronin reinforcements!"
	objective_text(0, "sh_rn_stripclub_reinforce_left", gang_reinf_killed, num_gang_reinforce)
	marker_add_navpoint("sh_rn_stripclub_$t-upper-roof",MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
end