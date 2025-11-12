--[[-------------------------------------------------------------------------------
-- sh_ss_trailerpark.lua
-- sons of samedi stronghold 1 - Suburbs traler park
-- Good Stuff by David Bowring
--]]





---Tables---

trailers = {"sh_ss_trailerpark_ARNTP2A_Hull060", "sh_ss_trailerpark_ARNTP2A_Hull040", "sh_ss_trailerpark_ARNTP2A_Hull020", "sh_ss_trailerpark_ARNTP2A_Hull030", "sh_ss_trailerpark_ARNTP2A_Hull070"}
groups = {"sh_ss_trailerpark_$GroupOne", "sh_ss_trailerpark_$Greinf", "sh_ss_trailerpark_$GLts"}
boss = {"sh_ss_trailerpark_$c013", "sh_ss_trailerpark_$c013 (0)", "sh_ss_trailerpark_$c013 (1)", "sh_ss_trailerpark_$c013 (2)", "sh_ss_trailerpark_$c013 (3)", "sh_ss_trailerpark_$c013 (4)", "sh_ss_trailerpark_$c013 (5)"}
reinf = {"sh_ss_trailerpark_$c010 (2)", "sh_ss_trailerpark_$c012 (3)",  "sh_ss_trailerpark_$c012 (2)", "sh_ss_trailerpark_$c010", "sh_ss_trailerpark_$c010 (0)", "sh_ss_trailerpark_$c010 (2)"}
---globals---
trailers_destroyed = {false, false, false, false, false}
trailers_count = 0
trailers_total = sizeof_table( trailers )
boss_count = 0
boss_total = sizeof_table( boss )
Process_thread_handle = ""
reinf_total= sizeof_table( reinf )
animate=false
map_found=false

function sh_ss_trailerpark_start(checkpoint, is_restart)
	set_mission_author("David Bowring")
	
	if checkpoint == MISSION_START_CHECKPOINT then
	mission_start_fade_out()
	teleport_coop("sh_ss_trailerpark_$nstart","sh_ss_trailerpark_$nstart (0)")
	group_create("sh_ss_trailerpark_$Gweapons", true)
	notoriety_set_max("police", 1)
	notoriety_set("samedi", 0)	
	mission_debug("Mission Start")
	sh_ss_trailerpark_trailer_blown()
	if (not coop_is_active()) then
		notoriety_force_no_spawn("samedi", true)
	end
	animate=true
	if (not is_restart) then
		cutscene_play("sh_ss_trailerpark_ct2")
	end
	door_lock("sh_ss_trailerpark_LM_DoorExtMM010", true)
	door_lock("sh_ss_trailerpark_LM_MeshMover020", true)
	on_trigger("sh_ss_trailerpark_set_alert", "sh_ss_trailerpark_$talert")
	on_trigger("sh_ss_trailerpark_checkpoint", "sh_ss_trailerpark_$tmap")
	--on_trigger("sh_ss_trailerpark_animate", "sh_ss_trailerpark_$tanimate")
	--trigger_enable("sh_ss_trailerpark_$tanimate", true)
	trigger_enable("sh_ss_trailerpark_$talert", true)
	trigger_enable("sh_ss_trailerpark_$tmap", true)
	marker_add_navpoint("sh_ss_trailerpark_$tmap",MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
	
	--group_create("sh_ss_trailerpark_$GSaintAgent", true)
	
	
	mission_debug("creating groups")
	if group_is_loaded("sh_ss_trailerpark_$GroupFour") == false then
	group_create("sh_ss_trailerpark_$GroupFour",true)
	end
	delay(.25)
	if group_is_loaded("sh_ss_trailerpark_$GroupOne") == false then
	group_create("sh_ss_trailerpark_$GroupOne",true)
	end
	delay(.25)
	if group_is_loaded("sh_ss_trailerpark_$GroupOne") == false then
	group_create("sh_ss_trailerpark_$GroupTwo",true)
	end
	delay(.25)
	if group_is_loaded("sh_ss_trailerpark_$GroupThree") == false then
	group_create("sh_ss_trailerpark_$GroupThree",true)
	end
	--If the player attacks then bad guys will respond!
 sh_ss_trailerpark_reinforcments()
	mission_start_fade_in()
	 delay(.25)
	 sh_ss_trailerpark_phasetwo()
else
fade_in(1)
group_create("sh_ss_trailerpark_$Gweapons", true)
sh_ss_trailerpark_blow()

end

	

end


function sh_ss_trailerpark_satchel()		
	on_pickup("sh_ss_trailerpark_checkpoint", "sh_ss_trailerpark_$isatchel") 
end



function sh_ss_trailerpark_trailer_blown()
	for i = 1 , trailers_total, 1 do	
		on_mover_destroyed("sh_ss_trailerpark_killcount", trailers[i])
	end
end

function sh_ss_trailerpark_checkpoint()
	mission_set_checkpoint("blow")
	delay(.2)
	sh_ss_trailerpark_blow()
end

function sh_ss_trailerpark_blow()
	
	objective_text_clear(0)
	marker_remove_navpoint("sh_ss_trailerpark_$tmap")
	trigger_enable("sh_ss_trailerpark_$tmap",false)
	on_trigger("", "sh_ss_trailerpark_$tmap")
	door_lock("sh_ss_trailerpark_LM_DoorExtMM010", false)
	door_lock("sh_ss_trailerpark_LM_MeshMover020", false)
	if	(trailers_count == trailers_total) then
	--log that we've destroyed all of the trailers
	--gamelog_log_event("STRONGHOLD_EVENT", "trailers all destroyed", 0)
	objective_text_clear(0)
	delay(3)
	--sh_ss_trailerpark_demo()
	mission_end_success("sh_ss_trailerpark")	
	end
	--on_vehicle_enter("sh_ss_trailerpark_player_in_car", LOCAL_PLAYER) 
	--marker_remove_item("sh_ss_trailerpark_$isatchel")
	delay(3)
	mission_help_table("sh_ss_trailer_trailer_give_instructtwo")
	objective_text(0, "sh_ss_trailer_trailer_count",trailers_count , trailers_total)
	map_found=true
	for i = 1 , trailers_total, 1 do
		if mesh_mover_destroyed(trailers[i]) == false then
		--turn_vulnerable(trailers[i]) 		
		mission_debug("Draw Markers")
		mesh_mover_reset(trailers[i])
		marker_add_mover(trailers[i], MINIMAP_ICON_KILL,  INGAME_EFFECT_VEHICLE_KILL)
		on_mover_destroyed("sh_ss_trailerpark_killcount", trailers[i])
		end
	end 	 
end


function sh_ss_trailerpark_player_in_car()
	group_create("sh_ss_trailerpark_$Gculled")
end

function sh_ss_trailerpark_set_alert()
	on_trigger("", "sh_ss_trailerpark_$talert")
	trigger_enable("sh_ss_trailerpark_$talert", false)
	--trigger_enable("sh_ss_trailerpark_$tanimate", false)
	if notoriety_get("samedi") <= 2 then
		notoriety_set_max("samedi", 2)
		notoriety_set_min("samedi", 2)
	end
	for i = 1, reinf_total, 1 do	
		attack(reinf[i])
		delay(.8)
	end


end


function sh_ss_trailerpark_talk_to_agent()
	marker_add_npc("sh_ss_trailerpark_$cSaintAgent", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_PROTECT_ACQUIRE)	
	move_to("sh_ss_trailerpark_$cSaintAgent","sh_ss_trailerpark_$n000", 3, true)
	on_death("sh_ss_trailerpark_agentkill","sh_ss_trailerpark_$cSaintAgent")
	delay(3)	
	marker_remove_npc("sh_ss_trailerpark_$cSaintAgent")
	turn_to_char("sh_ss_trailerpark_$cSaintAgent","#PLAYER#")
	mission_help_table("sh_ss_trailer_trailer_give_instruct")
	action_play("sh_ss_trailerpark_$cSaintAgent", "compliment b")
	delay(5)
	mission_help_table("sh_ss_trailer_trailer_give_instructtwo")
	action_play("sh_ss_trailerpark_$cSaintAgent", "compliment b")
	delay(5)
	mission_help_table("sh_ss_trailer_trailer_give_instructthree")
	on_death("","sh_ss_trailerpark_$cSaintAgent")  --turn off death failure for agent
end



function sh_ss_trailerpark_killcount(mesh)
	trailers_count = trailers_count + 1	
	--log that we've destroyed a trailer
	--gamelog_log_event("STRONGHOLD_EVENT", "trailer destroyed", trailers_count)
	if map_found then
		marker_remove_mover(mesh)
		objective_text(0, "sh_ss_trailer_trailer_count",trailers_count , trailers_total)
	end

	if	(trailers_count == 1) then
		mission_help_table_nag("sh_ss_trailer_conformation")
		notoriety_set_max("samedi", 3)
		notoriety_set_min("samedi", 3)
		notoriety_force_no_spawn("samedi", true)
	end


	if	(trailers_count == 3) then
		notoriety_set_max("samedi", 4)
		notoriety_set_min("samedi", 4)	
		notoriety_force_no_spawn("samedi", false)
	end

	if	(trailers_count == trailers_total) then
	--log that we've destroyed all of the trailers
	--gamelog_log_event("STRONGHOLD_EVENT", "trailers all destroyed", 0)
	objective_text_clear(0)
	delay(3)
	--sh_ss_trailerpark_demo()
	mission_end_success("sh_ss_trailerpark")
	--sh_ss_trailerpark_reinforcments()
	end

end


function sh_ss_trailerpark_phasetwo()
		delay(.25)
		--[[disabling until support for this can be coded
		for i = 1 , trailers_total, 1 do	
			mission_debug("invulnerable="..trailers[i])
			turn_invulnerable(trailers[i], false) 
		end 
		--]]		
		mission_help_table("sh_ss_trailerpark_instruct_one")
		group_create("sh_ss_trailerpark_$GLts")
		delay(.25)
end

function sh_ss_trailerpark_reinforcments()
	mission_debug("reinforcments create")
	animate=false
	group_create("sh_ss_trailerpark_$Greinf", true)
	delay(.25)	
	for i = 1, reinf_total, 1 do
		thread_new("sh_ss_trailerpark_animate", reinf[i])
		on_take_damage("sh_ss_trailerpark_set_alert", reinf[i])
	end		
end

function sh_ss_trailerpark_animate(char)
	--while(animate) do
		mission_debug("char="..char)
		delay(3)
		npc_use_closest_action_node_of_type(char, "Blunt_Smoker")		
	--end	
	return
end



function sh_ss_trailerpark_killcount_boss(char)
	boss_count = boss_count + 1
	--log that we've killed a lieutenant
	--gamelog_log_event("STRONGHOLD_EVENT", "lieutenant killed", boss_count)
	marker_remove_npc(char)
	objective_text(0, "sh_ss_trailer_lt_count", boss_count, boss_total)
	if	(boss_count == boss_total) then
		objective_text_clear(0)
		delay(3)		
		mission_end_success("sh_ss_trailerpark")
	end
end


function sh_ss_trailerpark_demo()
	group_create("sh_ss_trailerpark_$Gdemo")	
	vehicle_enter_teleport("#PLAYER#", "sh_ss_trailerpark_$v002", 0)	
	if (coop_is_active()) then
		vehicle_enter_teleport("#PLAYER2#","sh_ss_trailerpark_$v002 (0)", 0)
	end
	release_to_world("sh_ss_trailerpark_$Gdemo")
end


function sh_ss_trailerpark_agentkill()
	mission_end_failure("sh_ss_trailerpark")
end


function sh_ss_trailerpark_failure()
	mission_end_failure("sh_ss_trailerpark")
end


function sh_ss_trailerpark_cleanup()
	notoriety_force_no_spawn("samedi", false)
	on_trigger("", "sh_ss_trailerpark_$talert")
	on_trigger("", "sh_ss_trailerpark_$tmap")
	marker_remove_navpoint("sh_ss_trailerpark_$tmap")
	on_vehicle_enter("", LOCAL_PLAYER)
	on_pickup("", "sh_ss_trailerpark_$isatchel")
	door_lock("sh_ss_trailerpark_LM_DoorExtMM010", false)
	door_lock("sh_ss_trailerpark_LM_MeshMover020", false)
	for i = 1 , trailers_total, 1 do			
		marker_remove_mover(trailers[i])
		on_mover_destroyed("", trailers[i])
	end 		
end



function sh_ss_trailerpark_success()



end