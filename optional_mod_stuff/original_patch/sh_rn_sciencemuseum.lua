--Make more peds in the upstairs area

--Tables--------
servers = {"sh_rn_sciencemuseum_SM_ServerA180","sh_rn_sciencemuseum_SM_ServerA160","sh_rn_sciencemuseum_SM_ServerA140", "sh_rn_sciencemuseum_SM_ServerA120", "sh_rn_sciencemuseum_SM_ServerA100", "sh_rn_sciencemuseum_SM_ServerA080", "sh_rn_sciencemuseum_SM_ServerA060", "sh_rn_sciencemuseum_SM_ServerA040", "sh_rn_sciencemuseum_SM_ServerA020", "sh_rn_sciencemuseum_SM_ServerA200", "sh_rn_sciencemuseum_SM_ServerA220", "sh_rn_sciencemuseum_SM_ServerA240"}
lts = {"sh_rn_sciencemuseum_$cleut1","sh_rn_sciencemuseum_$cleut2","sh_rn_sciencemuseum_$cleut3","sh_rn_sciencemuseum_$cleut4","sh_rn_sciencemuseum_$cleut5", "sh_rn_sciencemuseum_$cleut6", "sh_rn_sciencemuseum_$cleut7", "sh_rn_sciencemuseum_$cleut8", "sh_rn_sciencemuseum_$cleut9", "sh_rn_sciencemuseum_$cleut10", "sh_rn_sciencemuseum_$cleut11", "sh_rn_sciencemuseum_$cleut12"}
peds = {"sh_rn_sciencemuseum_$c058", "sh_rn_sciencemuseum_$c059", "sh_rn_sciencemuseum_$c060", "sh_rn_sciencemuseum_$c061", "sh_rn_sciencemuseum_$c062", "sh_rn_sciencemuseum_$c064" }
group_one = {"sh_rn_sciencemuseum_$c000", "sh_rn_sciencemuseum_$c001", "sh_rn_sciencemuseum_$c002", "sh_rn_sciencemuseum_$c003", "sh_rn_sciencemuseum_$c004", "sh_rn_sciencemuseum_$c005", "sh_rn_sciencemuseum_$c006", "sh_rn_sciencemuseum_$c007", "sh_rn_sciencemuseum_$c008", "sh_rn_sciencemuseum_$c009", "sh_rn_sciencemuseum_$c012", "sh_rn_sciencemuseum_$c010", "sh_rn_sciencemuseum_$c011", "sh_rn_sciencemuseum_$c013"}
--Globals-------
server_total = sizeof_table(servers)
server_destroyed = 0
lt_total = sizeof_table(lts)
lt_killed = 0
peds_total = sizeof_table(peds)
group_one_total = sizeof_table(group_one)
local_inarea = false
remote_inarea = false
helipath = "sh_rn_sciencemuseum_$pathattack"
attack_in_area=false
heli_attack_thread = ""
in_attack_loop = false

function sh_rn_sciencemuseum_start(checkpoint, is_restart)
	
	set_mission_author("David Bowring")
	--checkpoint="heli"
	character_slots_cap_for_team("police", 0)
	if checkpoint==MISSION_START_CHECKPOINT then
	mission_start_fade_out()
	teleport_coop("sh_rn_sciencemuseum_$nstart1","sh_rn_sciencemuseum_$nstart2")	
	door_lock("sh_rn_sciencemuseum_a0", true)
	door_lock("sh_rn_sciencemuseum_060", true)
	notoriety_set_max("police", 0)
	notoriety_set_max("ronin", 3)
	group_create("sh_rn_sciencemuseum_$GroupOne", true)
	--group_create("sh_rn_sciencemuseum_$Gpeds", true)
	if (not is_restart) then
		cutscene_play("sh_rn_sciencemuseumct1")
	end

	--set on trigger callbacks
	on_trigger("sh_rn_sciencemuseum_objectiveone", "sh_rn_sciencemuseum_$trigger1")
	on_trigger("sh_rn_sciencemuseum_spawntwo", "sh_rn_sciencemuseum_$trigger2") --Spawns group 2
	on_trigger("sh_rn_sciencemuseum_spawnthree", "sh_rn_sciencemuseum_$trigger3")	--Spawns group 3
	on_trigger("sh_rn_sciencemuseum_spawnthree", "sh_rn_sciencemuseum_$theli")
	on_trigger("sh_rn_sciencemuseum_objectivetwo", "sh_rn_sciencemuseum_$trigger4a") --Spawns group 4
	on_trigger("sh_rn_sciencemuseum_objectivetwo", "sh_rn_sciencemuseum_$trigger4b") --Spawns group 4
	on_trigger("sh_rn_sciencemuseum_objectivetwo", "sh_rn_sciencemuseum_$trigger4b") --Spawns group 4
	on_trigger("sh_rn_sciencemuseum_heli_attack", "sh_rn_sciencemuseum_$heliattack")	
	marker_add_navpoint("sh_rn_sciencemuseum_$trigger1", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
	trigger_enable("sh_rn_sciencemuseum_$trigger1", true)
	mission_start_fade_in()

	for i = 1, group_one_total, 1 do
		wander_start(group_one[i], group_one[i], 40)
	end

	else
		---sh_rn_sciencemuseum_heli_attack()
		fade_in(1)
		on_trigger("sh_rn_sciencemuseum_heli_attack", "sh_rn_sciencemuseum_$heliattack")
		sh_rn_sciencemuseum_objectivethree()

	end

		--[[
		--Stop the first floor peds from just leaving the museum at will
		for i = 1, peds_total, 1 do	
			wander_start(peds[i], peds[i], 20)
		end
		--]]

end



function sh_rn_sciencemuseum_objectiveone() --Get to the museum

	delay(5) 
	trigger_enable("sh_rn_sciencemuseum_$trigger1", false)
	trigger_enable("sh_rn_sciencemuseum_$trigger2", true)	
	marker_remove_navpoint("sh_rn_sciencemuseum_$trigger1")
	--marker_add_navpoint("sh_rn_sciencemuseum_$tservers", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
	mission_help_table("sh_rn_sciencemuseum_instruct_one") -- "Get to the servers!" (needs to change)
	marker_add_navpoint("sh_rn_sciencemuseum_$navServers", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
	notoriety_set_min("ronin", 3)
	notoriety_set_max("ronin", 3)

end



function sh_rn_sciencemuseum_spawntwo()
	trigger_enable("sh_rn_sciencemuseum_$trigger2", false)
	trigger_enable("sh_rn_sciencemuseum_$trigger3", true)
	trigger_enable("sh_rn_sciencemuseum_$theli", true)
	group_create("sh_rn_sciencemuseum_$GroupTwo", true)
	group_create("sh_rn_sciencemuseum_$Gpeds2", true)
	release_to_world("sh_rn_sciencemuseum_$Gpeds")
	release_to_world("sh_rn_sciencemuseum_$Gpeds2")
	release_to_world("sh_rn_sciencemuseum_$GroupOne")
	
end



function sh_rn_sciencemuseum_spawnthree()	
	trigger_enable("sh_rn_sciencemuseum_$theli", false)
	trigger_enable("sh_rn_sciencemuseum_$trigger3", false)
	trigger_enable("sh_rn_sciencemuseum_$trigger4a", true)
	trigger_enable("sh_rn_sciencemuseum_$trigger4b", true)
	door_lock("sh_rn_sciencemuseum_a0", false)
	door_lock("sh_rn_sciencemuseum_060", false)
	group_create("sh_rn_sciencemuseum_$GroupThree", true)
	--group_create("sh_rn_sciencemuseum_$Gpeds3", true)
	--release_to_world("sh_rn_sciencemuseum_$Gpeds3")
	release_to_world("sh_rn_sciencemuseum_$GroupTwo")	
end



function sh_rn_sciencemuseum_objectivetwo() --Destroy the Servers


	trigger_enable("sh_rn_sciencemuseum_$trigger4a", false)
	trigger_enable("sh_rn_sciencemuseum_$trigger4b", false)

	group_create("sh_rn_sciencemuseum_$GroupFour", true)
	group_create("sh_rn_sciencemuseum_$Gpeds4", true)
	release_to_world("sh_rn_sciencemuseum_$Gpeds4")
	--release_to_world("sh_rn_sciencemuseum_$GroupTwo")
	notoriety_set_min("ronin", 3)
	marker_remove_navpoint("sh_rn_sciencemuseum_$navServers")
	mission_help_table("sh_rn_sciencemuseum_instruct_two") --"Destroy the Ronin Servers"
	objective_text(0, "sh_rn_sciencemuseum_serversleft", server_destroyed, server_total) --"Servers Left: %s/%s"
	mission_debug("objective two enabled")	

		for i = 1, server_total, 1 do
			marker_add_mover(servers[i], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
			on_mover_destroyed("sh_rn_sciencemuseum_killcount_server", servers[i])
		end


end



function sh_rn_sciencemuseum_objectivethree() --Kill the Reinforcements
	
	marker_add_navpoint("sh_rn_sciencemuseum_$trigger4a", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
	marker_add_navpoint("sh_rn_sciencemuseum_$trigger4b", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
	trigger_enable("sh_rn_sciencemuseum_$heliattack", true)
	mission_help_table("MSN_SH_RN_SCIENCEMUSEUM_INSTRUCT_GETOUT")
	
	
	--[[
	group_create("sh_rn_sciencemuseum_$GReinforcements", true)	
	objective_text(0, "sh_rn_sciencemuseum_roninleft", lt_killed, lt_total) --"Reinforcements Left: %s/%s"

	
		for i = 1, lt_total, 1 do
			marker_add_npc(lts[i], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
			attack(lts[i],LOCAL_PLAYER)
			on_death("sh_rn_sciencemuseum_killcount_lt", lts[i])
		end

	--]]
	
	
end



--using meshes for servers
function sh_rn_sciencemuseum_killcount_server(mesh)

	
	server_destroyed = server_destroyed + 1
	marker_remove_mover(mesh)
	objective_text(0, "sh_rn_sciencemuseum_serversleft", server_destroyed, server_total )
	
		if (server_destroyed == server_total) then
			objective_text_clear(0)
			delay(1)
			--sh_rn_sciencemuseum_heli_attack()
			sh_rn_sciencemuseum_objectivethree()
		end

end



function sh_rn_sciencemuseum_killcount_lt(char)
	lt_killed = lt_killed + 1
	marker_remove_npc(char)
	objective_text(0, "sh_rn_sciencemuseum_roninleft",lt_killed, lt_total )
	if (lt_killed == lt_total) then
		group_destroy("sh_rn_sciencemuseum_$GReinforcements")
		objective_text_clear(0)
		delay(3)
		mission_end_success("sh_rn_sciencemuseum")
	end
end





function sh_rn_sciencemuseum_success()	
	--mission_end_success("sh_rn_sciencemuseum_success") 
end

function sh_rn_sciencemuseum_success_heli()
	on_take_damage("", "sh_rn_sciencemuseum_$vAttackHeli") 
	mission_debug("Success Called")
	mission_end_success("sh_rn_sciencemuseum") 
end

function sh_rn_sciencemuseum_cleanup()
	on_trigger("", "sh_rn_sciencemuseum_$trigger1")
	on_trigger("", "sh_rn_sciencemuseum_$trigger2") --Spawns group 2
	on_trigger("", "sh_rn_sciencemuseum_$trigger3")	--Spawns group 3
	on_trigger("", "sh_rn_sciencemuseum_$theli")
	on_trigger("", "sh_rn_sciencemuseum_$trigger4a") --Spawns group 4
	on_trigger("", "sh_rn_sciencemuseum_$trigger4b") --Spawns group 4
	on_trigger("", "sh_rn_sciencemuseum_$trigger4b") --Spawns group 4
	on_trigger("", "sh_rn_sciencemuseum_$heliattack")
	marker_remove_navpoint("sh_rn_sciencemuseum_$trigger1")
	marker_remove_navpoint("sh_rn_sciencemuseum_$heliattack")
	marker_remove_navpoint("sh_rn_sciencemuseum_$navServers")
	marker_remove_navpoint("sh_rn_sciencemuseum_$trigger4a")
	marker_remove_navpoint("sh_rn_sciencemuseum_$trigger4b")
	for i = 1, server_total, 1 do			
		marker_remove_mover(servers[i])
		on_mover_destroyed("", servers[i])
	end
end



function sh_rn_sciencemuseum_heli_attack()
	attack_in_area=true
	mission_set_checkpoint("heli")
	marker_remove_navpoint("sh_rn_sciencemuseum_$trigger4a")
	marker_remove_navpoint("sh_rn_sciencemuseum_$trigger4b")
	mission_help_table("sh_rn_sciencemuseum_instruct_three") --"Kill all Ronin reinforcements!"
	trigger_enable("sh_rn_sciencemuseum_$heliattack", false)
	group_create("sh_rn_sciencemuseum_$Gheli", true)	
	mission_debug("heli created")
	turn_invulnerable("sh_rn_sciencemuseum_$c098", false)
	vehicle_enter_teleport("sh_rn_sciencemuseum_$c098", "sh_rn_sciencemuseum_$vAttackHeli", 0) 
	vehicle_enter_teleport("sh_rn_sciencemuseum_$c098 (0)", "sh_rn_sciencemuseum_$vAttackHeli", 1)
	delay(.5)
	mission_debug("Drivers Seated")
	set_unjackable_flag("sh_rn_sciencemuseum_$vAttackHeli", true)
	helicopter_fly_to("sh_rn_sciencemuseum_$vAttackHeli", -1, "sh_rn_sciencemuseum_$nhover1")
	--trigger_enable("sh_rn_sciencemuseum_$heliattack", true)
	heli_attack_thread = thread_new("sh_rn_sciencemuseum_heli_attack_pattern")
end


function sh_rn_sciencemuseum_heli_attack_enter()
	attack_in_area=true
	helicopter_set_dont_move_in_combat("sh_rn_sciencemuseum_$vAttackHeli", true)	
	helicopter_fly_to("sh_rn_sciencemuseum_$vAttackHeli", -1, "sh_rn_sciencemuseum_$nhover1")
	heli_attack_thread = thread_new("sh_rn_sciencemuseum_heli_attack_pattern")
end

function sh_rn_sciencemuseum_heli_attack_exit()
	thread_kill(heli_attack_thread)
	helicopter_set_dont_move_in_combat("sh_rn_sciencemuseum_$vAttackHeli", false)	
	vehicle_chase("sh_rn_sciencemuseum_$vAttackHeli", LOCAL_PLAYER)
end


function sh_rn_sciencemuseum_heli_attack_pattern()
	mission_debug("Fly to about to begin")	
	on_vehicle_destroyed("sh_rn_sciencemuseum_success_heli","sh_rn_sciencemuseum_$vAttackHeli")
	--helicopter_fly_to_direct("sh_rn_sciencemuseum_$vAttackHeli", "sh_rn_sciencemuseum_$nhover1", -1)
	marker_add_vehicle("sh_rn_sciencemuseum_$vAttackHeli",MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
	helicopter_set_dont_move_in_combat("sh_rn_sciencemuseum_$vAttackHeli", true)	
	helicopter_fly_to_direct("sh_rn_sciencemuseum_$vAttackHeli", -1, "sh_rn_sciencemuseum_$nattack3")
	helicopter_set_missile_chance("sh_rn_sciencemuseum_$vAttackHeli", 0.3)	
	vehicle_chase("sh_rn_sciencemuseum_$vAttackHeli", LOCAL_PLAYER)
	on_take_damage("sh_rn_sciencemuseum_heli_attack_closest", "sh_rn_sciencemuseum_$vAttackHeli") 
	on_trigger("sh_rn_sciencemuseum_heli_attack_enter","sh_rn_sciencemuseum_$heliattack")
	on_trigger_exit("sh_rn_sciencemuseum_heli_attack_exit","sh_rn_sciencemuseum_$heliattack")	
   --teleport_vehicle("sh_rn_sciencemuseum_$vAttackHeli","sh_rn_sciencemuseum_$nhover1")	
end


-- Handle a helicopter taking damage
function sh_rn_sciencemuseum_heli_attack_closest(attacked_object, char, percent_health_remaining)

	-- Determine if the helicopter is even functioning any more.
	local heli_is_operational = ( vehicle_exists(attacked_object) and (not vehicle_is_destroyed(attacked_object)))
	if (not heli_is_operational) then
		return		
	end

	if (percent_health_remaining < .5) then
		helicopter_set_missile_chance("sh_rn_sciencemuseum_$vAttackHeli", .99)	
		mission_debug("damage %50")
	end

	-- Determine if the damage source is a valid target for retribution. If it isn't, then return.
	local is_valid_target = ( (char ~= nil) and character_exists(char) and (not character_is_dead(char)) )
	if (not is_valid_target) then
		return
	end
	
	if in_attack_loop==false then
		in_attack_loop=true
		
		mission_debug("helicopte target is"..char,5)

		vehicle_chase("sh_rn_sciencemuseum_$vAttackHeli", char)
		delay(15)
		in_attack_loop = false
	end
end