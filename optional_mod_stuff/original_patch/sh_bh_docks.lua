-----tables
convoy={ "sh_bh_docks_$c004", "sh_bh_docks_$c004 (0)", "sh_bh_docks_$c004 (1)", "sh_bh_docks_$c004 (2)", "sh_bh_docks_$c004 (3)", "sh_bh_docks_$c004 (4)", "sh_bh_docks_$c004 (5)", "sh_bh_docks_$c004 (6)", "sh_bh_docks_$c005", "sh_bh_docks_$c005 (0)", "sh_bh_docks_$c005 (1)", "sh_bh_docks_$c005 (2)"} 
convoy_one = { "sh_bh_docks_$c004", "sh_bh_docks_$c004 (0)", "sh_bh_docks_$c004 (1)","sh_bh_docks_$c004 (2)"}
convoy_one_navs = {"sh_bh_docks_$nconvoy_one_path_find", "sh_bh_docks_$nconvoy_one_path_find (0)", "sh_bh_docks_$nconvoy_one_path_find (1)", "sh_bh_docks_$nconvoy_one_path_find (2)"}
hijackpeds={{"sh_bh_docks_$c000", 1},
				{"sh_bh_docks_$c001", 1},
				{"sh_bh_docks_$c002", 2},
				{"sh_bh_docks_$c003", 2}}
buyers= {"sh_bh_docks_$c006 (0)", "sh_bh_docks_$c006", "sh_bh_docks_$c006 (1)", "sh_bh_docks_$c006 (2)", "sh_bh_docks_$c006 (3)"}
follow_car={"sh_bh_docks_$c004", "sh_bh_docks_$c004 (0)", "sh_bh_docks_$c004 (1)", "sh_bh_docks_$c004 (2)"}
action={{"sh_bh_docks_$c004 (2)" , 1},
		  {"sh_bh_docks_$c004 (3)" , 1}, 
		  {"sh_bh_docks_$c004 (4)" , 1},
		  {"sh_bh_docks_$c004 (5)" , 1}, 
		  {"sh_bh_docks_$c004 (6)" , 2},
		  {"sh_bh_docks_$c005" , 2},
		  {"sh_bh_docks_$c005 (0)", 2}, 
		  {"sh_bh_docks_$c005 (1)" , 3}, 
		  {"sh_bh_docks_$c005 (2)" , 3}} 

thread_handles = {"", "", "", ""}
  
---variables
convoy1=false
convoy2=false
convoy3=false
incar=false
incar_timer=true
incar_timer_coop=true
convoy_count = 0
convoy_total = sizeof_table( convoy )
hijackpeds_count=0
hijackpeds_total=sizeof_table( hijackpeds )
buyers_count=0
times_damaged = 0
follow_count = sizeof_table( follow_car )
action_total = sizeof_table( action )
convoy_one_total = sizeof_table ( convoy_one )
message_playing = false



 

function sh_bh_docks_start(checkpoint, is_restart)
set_mission_author("David Bowring")
notoriety_set_max("brotherhood", 0)
notoriety_set_max("police", 0)	
	
	if checkpoint == MISSION_START_CHECKPOINT then
	
	sh_bh_docks_hijack(is_restart)
	else
	fade_in(1)
	sh_bh_docks_hijack(is_restart)
	--sh_bh_docks_boat()
	end


end


function sh_bh_docks_hijack(is_restart)
	mission_start_fade_out()	
	teleport_coop("sh_bh_docks_$nstart","sh_bh_docks_$nstart (0)")
	
	if (not is_restart) then
	cutscene_play("sh_bh_docksct1")
	else
	group_create_hidden("sh_bh_docks_$Ghijack")
	end
	group_show("sh_bh_docks_$Ghijack")
	
	--[[ Chris Uncomment this block and comment out the line above this and your in bussines!
	group_create("sh_bh_docks_$Ghijack")
	mission_start_fade_in()
	for i = 1, hijackpeds_total, 1 do
			sh_bh_docks_nodes(hijackpeds[i][1],hijackpeds[i][2])
	end
	--]]
	
	while group_is_loaded("sh_bh_docks_$Ghijack")==false  do
	thread_yield()
	end
	on_trigger("sh_bh_docks_roadblock" ,"sh_bh_docks_$troadblock")
	on_vehicle_enter("sh_bh_docks_hijack_handler", "sh_bh_docks_$v000")
	on_take_damage("sh_bh_docks_hijack_warning", "sh_bh_docks_$v000") 	
	ambient_gang_spawn_enable(false)
	notoriety_force_no_spawn("brotherhood", true) 	
	objective_text_clear(0)
	mission_help_table("sh_bh_docks_instruct_one")
	on_vehicle_destroyed("sh_bh_docks_vehicle_destroyed_fail","sh_bh_docks_$v000")
	marker_add_vehicle("sh_bh_docks_$v000", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE)
	mission_start_fade_in()
end

function sh_bh_docks_hijack_warning()
	
	if message_playing then
		return
	else
		message_playing=true
		mission_help_table_nag("sh_bh_docks_fail_warning_four")
		delay(10)
		message_playing=false  
	end
end



function sh_bh_docks_hijack_handler(char)	
	incar_timer=false
	incar=true
	mission_debug("hijackhandler="..hijackpeds_count)
	on_take_damage("", "sh_bh_docks_$v000") 	
	if (incar) then
	-- on_vehicle_exit("sh_bh_docks_get_back", "sh_bh_docks_$v000")
	 on_vehicle_destroyed("","sh_bh_docks_$v000")
	 --on_vehicle_enter("sh_bh_docks_get_back_in", "sh_bh_docks_$v000")
	 objective_text_clear(0)
	 sh_bh_docks_convoy(char)
	end
end

function sh_bh_docks_nodes(char, index)
local action_node

--function to put NPC into action nodes
--mission_debug("Nodes Used"..char..index)
 
if index == 1 then
	
	action_node = "BH_RandomAction"

	elseif index == 2 then

	action_node = "BH_DrinkBeer"

	elseif index == 3 then

	action_node = "Blunt_Smoker"

	else

	action_node = "BH_RandomAction"

	end	

mission_debug("Nodes Used"..action_node)
npc_use_closest_action_node_of_type(char, action_node,100)
end

function sh_bh_docks_get_back_in()	
	incar_timer=true
	incar=true
	marker_remove_vehicle("sh_bh_docks_$v000")
	hud_timer_stop(0)
end

function sh_bh_docks_get_back()
incar=false
mission_help_table("MSN_SH_BH_DOCKS_GETBACK")
--hud_timer_set(0,15000, "sh_bh_docks_get_back_fail")
marker_add_vehicle("sh_bh_docks_$v000", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE)
sh_bh_docks_timer()
	while (incar==false) do
		thread_yield()		
	end
	return
end

function sh_bh_docks_get_back_fail()
mission_end_failure("sh_bh_docks", "MSN_SH_BH_DOCKS_GETBACK_FAIL") 
end


function sh_bh_docks_killcount1(human)
hijackpeds_count = hijackpeds_count+1
objective_text(0, "sh_bh_docks_gangleft", hijackpeds_count,hijackpeds_total, SYNC_ALL)
marker_remove_npc(human)
--release_to_world(char)
on_death("", human)
	if (hijackpeds_count == hijackpeds_total) then
	objective_text_clear(0)
	mission_help_table("sh_bh_docks_instruct_one")
	marker_add_vehicle("sh_bh_docks_$v000", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE)
	sh_bh_docks_convoy(LOCAL_PLAYER)	
	end

end

function sh_bh_docks_convoy(human)
	if (not human == LOCAL_PLAYER) then
		mission_debug("returning")
		return	
	end

		if (hijackpeds_count == hijackpeds_total) then
			objective_text_clear(0)
		end
		

		if (incar) then			
		mission_debug("convoy_begin")
		on_projectile_hit("sh_bh_docks_satchel")
		
		marker_remove_vehicle("sh_bh_docks_$v000")
		on_vehicle_enter("", "sh_bh_docks_$v000") 
		trigger_enable("sh_bh_docks_$troadblock", true)
		--Creating groups for later 
		mission_debug("creating groups")
		group_create("sh_bh_docks_$Gconvoy", true)
		group_create("sh_bh_docks_$GCone", true)
		group_create("sh_bh_docks_$GCtwo", true)
		group_create("sh_bh_docks_$Gthree", true)
		group_create("sh_bh_docks_$Graodblock", true)

		for i = 1, convoy_total, 1 do
			mission_debug("on death called")
			on_death("sh_bh_docks_vehicle_destroyed_fail_passenger", convoy[i])
		end
		on_vehicle_destroyed("sh_bh_docks_fail_convoy","sh_bh_docks_$v001")
		vehicle_set_untowable("sh_bh_docks_$v001", true)
		mission_debug("groups created")
		turn_invulnerable("sh_bh_docks_$v001", false)
		--put guys in cars
		mission_debug("get yo ass in car")
		vehicle_enter_group_teleport("sh_bh_docks_$croad2", "sh_bh_docks_$croad2 (0)" , "sh_bh_docks_$v001 (2)")
		vehicle_enter_group_teleport("sh_bh_docks_$croad1", "sh_bh_docks_$croad1 (0)" , "sh_bh_docks_$v001 (3)")
		vehicle_enter_group_teleport("sh_bh_docks_$c004", "sh_bh_docks_$c004 (0)", "sh_bh_docks_$c004 (1)", "sh_bh_docks_$c004 (2)", "sh_bh_docks_$v001")
		--vehicle_enter_group_teleport("sh_bh_docks_$c004 (3)", "sh_bh_docks_$c004 (4)", "sh_bh_docks_$c004 (5)", "sh_bh_docks_$c004 (6)", "sh_bh_docks_$v001 (0)")
		--vehicle_enter_group_teleport("sh_bh_docks_$c005", "sh_bh_docks_$c005 (0)", "sh_bh_docks_$c005 (1)", "sh_bh_docks_$c005 (2)", "sh_bh_docks_$v001 (1)")
		for i = 1, follow_count, 1 do
			on_death("sh_bh_docks_vehicle_destroyed_fail_passenger",follow_car[i])
		end
		mission_debug("ass in cars")
		marker_add_vehicle("sh_bh_docks_$v001", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE)		
		mission_debug("starting convoy")
		thread_new("sh_bh_docks_convoy1")
		mission_help_table("sh_bh_docks_instruct_three")
		delay(12)
		mission_help_table("sh_bh_docks_instruct_two")
		distance_display_on("sh_bh_docks_$v001", 0, 60, 0, 60, SYNC_ALL) 
		on_tailing_too_far("sh_bh_docks_follow_bad") 
		on_tailing_good("sh_bh_docks_follow_good")		
		if(get_dist_char_to_vehicle(LOCAL_PLAYER,"sh_bh_docks_$v001") > 60) then
			sh_bh_docks_follow_bad()
		end
		if coop_is_active() then
			if(get_dist_char_to_vehicle(REMOTE_PLAYER,"sh_bh_docks_$v001") > 60) then
				sh_bh_docks_follow_bad()
			end
		end
		delay(.5)		
				while (not convoy1) do 
					thread_yield()
				end		
			else	
				return
			end	
	--mission_debug("done yeilding")
	if (convoy1) then
		hud_timer_stop(0) 
		on_projectile_hit("")
		marker_remove_vehicle("sh_bh_docks_$v001")
		objective_text(0, "sh_bh_docks_gangleft",  convoy_count, convoy_total, SYNC_ALL)
		on_take_damage("", "sh_bh_docks_$v001") 
		on_tailing_too_far("") 
		on_tailing_good("")
		on_vehicle_destroyed("","sh_bh_docks_$v001")		
	end	
	sh_bh_docks_getout()
end

--Give convoy infinite life (i.e. once at 50% he can never go below 50%)

function sh_bh_docks_convoy1()
	mission_debug("Convoy now")
	vehicle_set_allow_ram_ped("sh_bh_docks_$v001", true) 
	vehicle_never_flatten_tires("sh_bh_docks_$v001", true) 
	vehicle_set_script_hard_goto("sh_bh_docks_$v001", true)
	on_take_damage("sh_bh_docks_fail_take_damage", "sh_bh_docks_$v001") 
	vehicle_ignore_repulsors("sh_bh_docks_$v001", true)
	vehicle_infinite_mass("sh_bh_docks_$v001", true)
	vehicle_speed_override("sh_bh_docks_$v001", 50)
	vehicle_pathfind_to("sh_bh_docks_$v001", "sh_bh_docks_$pathConvoy", true, false)
	vehicle_pathfind_to("sh_bh_docks_$v001", "sh_bh_docks_$pathConvoy1", true, false)
	vehicle_pathfind_to("sh_bh_docks_$v001", "sh_bh_docks_$pathconvoyint", true, false)
	vehicle_pathfind_to("sh_bh_docks_$v001", "sh_bh_docks_$pathconvoyint1", true, false)
	vehicle_pathfind_to("sh_bh_docks_$v001", "sh_bh_docks_$pathConvoy2", true, false)
	vehicle_pathfind_to("sh_bh_docks_$v001", "sh_bh_docks_$npath1", true, true)
	hud_timer_stop(0)
	distance_display_off(SYNC_ALL)
	mission_debug("convoy true")
	convoy1=true
end


function sh_bh_docks_getout()	
objective_text_clear(0)
mission_help_table("MSN_SH_BH_DOCKS_INSTRUCT_SIX")
notoriety_set_max("brotherhood", 3)
notoriety_force_no_spawn("brotherhood", false)
mission_debug("getout")
objective_text(0, "sh_bh_docks_gangleft",  convoy_count, convoy_total, SYNC_ALL)
turn_invulnerable("sh_bh_docks_$v001",true)
	for i = 1, convoy_total, 1 do
		if character_is_dead(convoy[i]) == false then
		on_death("sh_bh_docks_killcount", convoy[i])
		marker_add_npc(convoy[i], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
		--no animations for big truck		
		--vehicle_exit(convoy[i], true)
		--attack(convoy[i], LOCAL_PLAYER)
		end
	end

	for i=1, convoy_one_total, 1 do	
		if character_is_dead(convoy_one[i])== false then
			thread_handles[i]=thread_new("sh_bh_docks_pathfind",convoy_one[i],convoy_one_navs[i])
		end
	end
end

function sh_bh_docks_pathfind(char_name, nav)
	vehicle_exit(char_name, true)
	npc_combat_enable(char_name, true) 		
	move_to_safe(char_name, nav, 2, false, false)
	return
end

function sh_bh_docks_killcount(char)
convoy_count = convoy_count + 1
marker_remove_npc(char)
if convoy1 then
objective_text(0, "sh_bh_docks_gangleft",  convoy_count, convoy_total, SYNC_ALL)
end
	if convoy_count == convoy_total then
		--debug_message("GROUP TWO")
		objective_text_clear(0)
		release_to_world("sh_bh_docks_$Gconvoy")
		--mission_set_checkpoint("boat")
		mission_end_success("sh_bh_docks")					
	end
	if convoy_count == 1 then
		notoriety_set_min("brotherhood", 3)
		notoriety_force_no_spawn("brotherhood", false) 	
	end
end

function sh_bh_docks_satchel(type, name, weapon)
--mission_debug("type=  "..type)
--mission_debug("name=  "..name)
--mission_debug("weapon=  "..weapon)

	if type == "vehicle" and name == "sh_bh_docks_$v001" and weapon == "satchel" then
		mission_end_failure("sh_bh_docks","sh_bh_docks_fail_three")
	end

end


function sh_bh_docks_boat()
	group_create("sh_bh_docks_$Gwaverunner4player", true)
	turn_invulnerable("sh_bh_docks_$vplayerwave")
	marker_add_vehicle("sh_bh_docks_$vplayerwave",MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE)
	on_vehicle_enter("sh_bh_docks_wave", "sh_bh_docks_$vplayerwave")	
	mission_help_table("sh_bh_docks_instruct_four")
	--objective_text(0, "sh_bh_docks_buyersleft",  buyers_count, buyers_total)
end


function sh_bh_docks_boat_killcount(char)
	buyers_count = buyers_count + 1
	marker_remove_npc(char)
	--objective_text(0, "sh_bh_docks_buyersleft",  buyers_count, buyers_total, SYNC_ALL)
	on_death("", char)	

		--if buyers_count == buyers_total then
			--debug_message("GROUP TWO")
			
			objective_text_clear(0)			
			mission_end_success("sh_bh_docks")			
		--end


end

function sh_bh_docks_roadblock(char, trigger_name)

--mission_debug("char ="..char)

	if char == "sh_bh_docks_$c004 (2)" or "sh_bh_docks_$c004" or "sh_bh_docks_$c004 (0)" or "sh_bh_docks_$c004 (1)" or "sh_bh_docks_$v001" then
		mission_debug("EXECUTE")
		--[[
		for i = 1, action_total, 1 do
			sh_bh_docks_nodes(action[i][1],action[i][2])
		end
		--]]
		vehicle_speed_override("sh_bh_docks_$v001", 100)
		--mission_help_table_nag("sh_bh_docks_made_you")
		hud_timer_stop(0)
		delay(3)
		--thread_new("sh_bh_docks_roadblock_move_one")
		--thread_new("sh_bh_docks_roadblock_move_two")
		trigger_enable("sh_bh_docks_$troadblock", false)
		notoriety_set_max("brotherhood", 3)
		--`notoriety_set("brotherhood", 3)
		marker_remove_vehicle("sh_bh_docks_$v001")
		distance_display_off(SYNC_ALL)
		on_vehicle_destroyed("","sh_bh_docks_$v000")
		on_vehicle_destroyed("","sh_bh_docks_$v001")
		on_take_damage("", "sh_bh_docks_$v001") 
		on_tailing_too_far("") 
		on_tailing_good("") 
		on_vehicle_exit("", "sh_bh_docks_$v000")
		on_vehicle_enter("", "sh_bh_docks_$v000")
	end
end

function sh_bh_docks_roadblock_move_one()

	vehicle_pathfind_to("sh_bh_docks_$v001 (2)", "sh_bh_docks_$nroad1", true, true)
	vehicle_exit("sh_bh_docks_$croad2")
	vehicle_exit("sh_bh_docks_$croad2 (0)") 
	return

end


function sh_bh_docks_roadblock_move_two()
	vehicle_pathfind_to("sh_bh_docks_$v001 (3)", "sh_bh_docks_$nroad1 (0)", true, true)
	vehicle_exit("sh_bh_docks_$croad1")
	vehicle_exit("sh_bh_docks_$croad1 (0)") 
	return

end


function sh_bh_docks_wave()
	group_create("sh_bh_docks_$Gboats",true)	
	marker_remove_vehicle("sh_bh_docks_$vplayerwave")
	on_vehicle_enter("", "sh_bh_docks_$vplayerwave")	
	turn_vulnerable("sh_bh_docks_$vplayerwave")
	marker_add_npc("sh_bh_docks_$c006", MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
	on_death("sh_bh_docks_boat_killcount","sh_bh_docks_$c006")
	persona_override_character_start("sh_bh_docks_$c006", "threat - alert (group attack)",			"BMHUST_BR_STRONG_DOCKS")
	persona_override_character_start("sh_bh_docks_$c006", "threat - alert (solo attack)",			"BMHUST_BR_STRONG_DOCKS")
	persona_override_character_start("sh_bh_docks_$c006", "threat - damage received (firearm)",	"BMHUST_BR_STRONG_DOCKS")
	persona_override_character_start("sh_bh_docks_$c006", "threat - damage received (melee)",		"BMHUST_BR_STRONG_DOCKS")
	persona_override_character_start("sh_bh_docks_$c006", "threat - knocked down npc/pc",			"BMHUST_BR_STRONG_DOCKS")
	vehicle_enter_teleport("sh_bh_docks_$c006 (0)", "sh_bh_docks_$v002 (0)")
	vehicle_enter_teleport("sh_bh_docks_$c006", "sh_bh_docks_$v002")
	vehicle_enter_teleport("sh_bh_docks_$c006 (1)", "sh_bh_docks_$v002 (1)")
	vehicle_enter_teleport("sh_bh_docks_$c006 (2)", "sh_bh_docks_$v002 (2)")
	vehicle_enter_teleport("sh_bh_docks_$c006 (3)", "sh_bh_docks_$v002 (3)")
	thread_new("sh_bh_docks_buyer_chase")
	vehicle_chase("sh_bh_docks_$v002 (0)", LOCAL_PLAYER, true, false, true)
	vehicle_chase("sh_bh_docks_$v002 (1)", LOCAL_PLAYER, true, false, true)
	vehicle_chase("sh_bh_docks_$v002 (2)", LOCAL_PLAYER, true, false, true)
end



function sh_bh_docks_buyer_chase()
delay(7)
vehicle_speed_override("sh_bh_docks_$v002", 40)
vehicle_pathfind_to("sh_bh_docks_$v002", "sh_bh_docks_$path001", true, false)
vehicle_pathfind_to("sh_bh_docks_$v001", "sh_bh_docks_$path002", true, false)
end




function sh_bh_docks_follow_bad()		
	mission_help_table_nag("sh_bh_docks_warning_two")
	hud_timer_set(0,1000*20, "sh_bh_docks_fail_convoy") --, SYNC_ALL, true) 
end

function sh_bh_docks_follow_good()		
	hud_timer_stop(0) 	
end

function sh_bh_docks_vehicle_destroyed_fail()
	mission_end_failure("sh_bh_docks", "sh_bh_docks_fail_four") --You destroyed the truck!
end

function sh_bh_docks_vehicle_destroyed_fail_passenger()
	mission_end_failure("sh_bh_docks", "sh_bh_docks_fail") --You destroyed the truck!
end

function sh_bh_docks_fail_convoy()
	mission_end_failure("sh_bh_docks","sh_bh_docks_fail_two")
end

function sh_bh_docks_fail_take_damage(attacked_vehicle, attacker)
	
	if (attacker==LOCAL_PLAYER or attacker==REMOTE_PLAYER) then
	times_damaged = times_damaged + 1	
		if times_damaged >= 3 then		
				mission_end_failure("sh_bh_docks","sh_bh_docks_fail_three")
			else
				mission_help_table_nag("sh_bh_docks_fail_warning_four")
		end

	end
end

function sh_bh_docks_cleanup()
	--turn_invulnerable("sh_bh_docks_$vplayerwave", false)
	--release_to_world("sh_bh_docks_$vplayerwave")
	marker_remove_vehicle("sh_bh_docks_$v000")
	marker_remove_vehicle("sh_bh_docks_$v002")
	on_tailing_too_far("") 
	on_tailing_good("") 
	on_vehicle_enter("", "sh_bh_docks_$vplayerwave")
	on_take_damage("", "sh_bh_docks_$v001")
	on_vehicle_enter("", "sh_bh_docks_$v000") 
	on_take_damage("", "sh_bh_docks_$v000") 
	on_trigger("" ,"sh_bh_docks_$troadblock")
	on_projectile_hit("")
	distance_display_off() 
	on_tailing_too_far("") 
	on_tailing_good("")
	on_vehicle_destroyed("","sh_bh_docks_$v001")
	hud_timer_stop(0)
	for i = 1, convoy_total, 1 do
		if group_is_loaded("sh_bh_docks_$GCtwo") then
			if character_is_dead(convoy[i]) == false then
				on_death("", convoy[i])
				marker_remove_npc(convoy[i])
			end
		end
	end

	if group_is_loaded("sh_bh_docks_$GCone") then
		group_destroy("sh_bh_docks_$GCone")
	end
	
	if group_is_loaded("sh_bh_docks_$GCtwo") then
		group_destroy("sh_bh_docks_$GCtwo")
	end

	if group_is_loaded("sh_bh_docks_$GCthree") then
		group_destroy("sh_bh_docks_$GCthree")
	end


end



function sh_bh_docks_success()



end



function sh_bh_docks_timer()

	--hud_timer_pause(0, true)
	--hud_timer_set(0, 15000, "sh_bh_chinatown_timeout") 
	incar_timer=false
	incar_timer_coop=false
		
		if coop_is_active() then
			if char == REMOTE_PLAYER then
				in_areatwo = false
			end
		end

		local time = 0
		local messone = true
		local messtwo = true	
		mission_debug("LEAVE")
		--mission_debug(in_area)



	if coop_is_active() then

			while(incar_timer==false and incar_timer_coop==false) do
				
				time = time + get_frame_time()

				if(incar_timer==true and incar_timer_coop==false) then
				return
				end

				if (time > 15) then					
					mission_help_table_nag("MSN_SH_BH_DOCKS_WARNING_ONE")
				end
				

				if (time > 10) then				
					if (messone == true) then
					mission_help_table_nag("MSN_SH_BH_DOCKS_WARNING_THREE_TIMER")
					messone = false
					end
				end


				if (time > 5) then
					-- Second message (10 seconds left)
					if (messtwo == true) then
						mission_help_table_nag("MSN_SH_BH_DOCKS_WARNING_TWO_TIMER")						
						messtwo = false
					end				
				end
				
				if (time == 0) then
					-- Fail if timer runs out
					if (messtwo == true) then
						--put fail function here	
						messtwo = false
					end				
				end

				thread_yield()	
			end				

			else

			while(incar_timer==false) do
				
				time = time + get_frame_time()

				if(incar_timer==true) then
				return
				end


				if (time > 15) then					
					--mission_help_table_nag("sh_bh_chinatown_warning_one")
					mission_help_table_nag("MSN_SH_BH_DOCKS_WARNING_ONE")		
				end				

				if (time > 10) then				
					if (messone == true) then
						mission_help_table_nag("MSN_SH_BH_DOCKS_WARNING_THREE_TIMER")
						messone = false
					end
				end


				if (time > 5) then
					-- Second message (10 seconds left)
					if (messtwo == true) then
						mission_help_table_nag("MSN_SH_BH_DOCKS_WARNING_TWO_TIMER")
						messtwo = false
					end
				end

				if (time == 0) then
					-- Fail if timer runs out
					if (messtwo == true) then
							
						messtwo = false
					end				
				end
				thread_yield()
			end				
		end
		--hud_timer_hide(0, true) 		
		--hud_timer_stop(0, true)				
end