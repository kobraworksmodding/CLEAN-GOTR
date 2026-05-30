-- Cutscene crash fixes by IdolNinja
-- 3/12/2011


-- Tables
GroupOne = {"sh_rn_museum_pier_$c000", "sh_rn_museum_pier_$c001", "sh_rn_museum_pier_$c002", "sh_rn_museum_pier_$c003", "sh_rn_museum_pier_$c004", "sh_rn_museum_pier_$c005", "sh_rn_museum_pier_$c006", "sh_rn_museum_pier_$c007", "sh_rn_museum_pier_$c008"}    
GroupTwo = {"sh_rn_museum_pier_$c010", "sh_rn_museum_pier_$c011", "sh_rn_museum_pier_$c012", "sh_rn_museum_pier_$c013", "sh_rn_museum_pier_$c014", "sh_rn_museum_pier_$c015", "sh_rn_museum_pier_$c016", "sh_rn_museum_pier_$c017", "sh_rn_museum_pier_$c018", "sh_rn_museum_pier_$c019"}
GroupThree = {"sh_rn_museum_pier_$c023", "sh_rn_museum_pier_$c022", "sh_rn_museum_pier_$c021", "sh_rn_museum_pier_$c020"}
GroupFour = {"sh_rn_museum_pier_$c024", "sh_rn_museum_pier_$c025", "sh_rn_museum_pier_$c026", "sh_rn_museum_pier_$c027", "sh_rn_museum_pier_$c028", "sh_rn_museum_pier_$c029", "sh_rn_museum_pier_$c030", "sh_rn_museum_pier_$c031", "sh_rn_museum_pier_$c032", "sh_rn_museum_pier_$c033", "sh_rn_museum_pier_$c034", "sh_rn_museum_pier_$c035", "sh_rn_museum_pier_$c036", "sh_rn_museum_pier_$c037", "sh_rn_museum_pier_$c038", "sh_rn_museum_pier_$c039"}       
GroupBoats ={"sh_rn_museum_pier_$v000", "sh_rn_museum_pier_$v001", "sh_rn_museum_pier_$v002", "sh_rn_museum_pier_$v003", "sh_rn_museum_pier_$v004"}
GroupLts = {"sh_rn_museum_pier_$c040", "sh_rn_museum_pier_$c041", "sh_rn_museum_pier_$c042", "sh_rn_museum_pier_$c043", "sh_rn_museum_pier_$c044", "sh_rn_museum_pier_$c045"}
Groups = {"sh_rn_museum_pier_$GO", "sh_rn_museum_pier_$Gt", "sh_rn_museum_pier_$G3", "sh_rn_museum_pier_$Gb", "sh_rn_museum_pier_$Gboats", "sh_rn_museum_pier_$GLts"}
helipath = {"sh_rn_museum_pier_$n005", "sh_rn_museum_pier_$n006", "sh_rn_museum_pier_$n007", "sh_rn_museum_pier_$n008", "sh_rn_museum_pier_$n009", "sh_rn_museum_pier_$n010", "sh_rn_museum_pier_$n011", "sh_rn_museum_pier_$n012", "sh_rn_museum_pier_$n013", "sh_rn_museum_pier_$n014", "sh_rn_museum_pier_$n015"}
boatguards = {"sh_rn_museum_pier_$c024", "sh_rn_museum_pier_$c025", "sh_rn_museum_pier_$c026", "sh_rn_museum_pier_$c027", "sh_rn_museum_pier_$c028", "sh_rn_museum_pier_$c029", "sh_rn_museum_pier_$c032", "sh_rn_museum_pier_$c033", "sh_rn_museum_pier_$c034", "sh_rn_museum_pier_$c036"}
--Global Vaiables
GroupOneCount = 0
GroupOneTotal = sizeof_table( GroupOne )
GroupTwoCount = 0
GroupTwoTotal = sizeof_table( GroupTwo )
GroupThreeCount = 0
GroupThreeTotal = sizeof_table( GroupBoats )
GroupFourCount = 0
GroupFourTotal = sizeof_table( GroupLts )
GroupsTotal = sizeof_table( Groups )
boatguardscount =0
boatguardstotal = sizeof_table( boatguards )
areaone = false
areatwo = false
areathree = false
areaone_done = false
areatwo_done = false
areathree_done = false
marker_three = false

-- CUTSCENES --
-- Added by IdolNinja. These variables are used in the script for the cutscenes for stability instead of calling them directly

	CUTSCENE_IN = 		"sh_rn_museum_piercs3"
	MISSION_NAME =		"sh_rn_museum_pier"

--- Start Function
function sh_rn_museum_pier_start(checkpoint, is_restart)
	set_mission_author("David Bowring")
	mission_start_fade_out()
	teleport_coop("sh_rn_museum_pier_$nstart","sh_rn_museum_pier_$nstart2")	
	if (not is_restart) then
		cutscene_play(CUTSCENE_IN)
	end

	character_slots_cap_for_team("police", 0)
	group_destroy("sh_rn_museum_pier_$GCTE")
	thread_new("sh_rn_museum_pier_trigger")
	notoriety_set_max("police", 0)
	notoriety_set_max("ronin", 0)	
	--added delay to make more network friendly
	group_create("sh_rn_museum_pier_$GO")
	delay(.5)	
	--atempting to spawn all
	group_create("sh_rn_museum_pier_$Gt", true)
	delay(.5)
	group_create("sh_rn_museum_pier_$Gb")
	delay(.5)
	group_create("sh_rn_museum_pier_$Gboats")
	--notoriety_force_no_spawn("ronin", true) 
	ambient_cop_spawn_enable(false) 
	ambient_gang_spawn_enable(false) 
	spawning_pedestrians(false) 
	--end spawn all
	group_create("sh_rn_museum_pier_$GRoad")
	mission_help_table_nag("sh_rn_museum_pier_setup")
	--delay(5)
	--objective_text(0, "sh_rn_museum_pier_GroupOneCount",   GroupOneCount, GroupOneTotal)
	--cutscene_play("sh_rn_museum_pier_cs2", "sh_rn_museum_pier_$Gb")	
	--delay(3)

		for i = 1, GroupOneTotal, 1 do			
			on_death("sh_rn_museum_pier_killcount", GroupOne[i])
			set_always_sees_player_flag(GroupOne[i], true)
		end

		for i = 1, GroupTwoTotal, 1 do
			if not character_is_dead(GroupTwo[i]) then
				on_death("sh_rn_museum_pier_killcountTwo", GroupTwo[i])
				wander_start(GroupTwo[i], GroupTwo[i], 10)
			end
		end

		for i = 1, GroupThreeTotal, 1 do
				if not vehicle_is_destroyed(GroupBoats[i]) then
					--marker_add_vehicle(GroupBoats[i], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
					set_current_hit_points( GroupBoats[i], 1000) 
					turn_invulnerable(GroupBoats[i], true)
					--attack(GroupBoats[i], "#PLAYER#") 
					on_vehicle_destroyed("sh_rn_museum_pier_killcountThree", GroupBoats[i])
				end
		end
		mission_start_fade_in()
end




function sh_rn_museum_pier_trigger()
	mission_debug("Thread active")
	mission_help_table("sh_rn_museum_pier_instructtwo")
	marker_add_navpoint("sh_rn_museum_pier_$tareaone", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
	trigger_enable("sh_rn_museum_pier_$tareaone", true)
	on_trigger("sh_rn_museum_pier_areaone", "sh_rn_museum_pier_$tareaone")
	on_trigger("sh_rn_museum_pier_areatwo", "sh_rn_museum_pier_$tareatwo")
	on_trigger("sh_rn_museum_pier_areathree", "sh_rn_museum_pier_$tareathree")
end



function sh_rn_museum_pier_areaone()
		mission_debug("trigger")		
		notoriety_set_max("ronin", 2)
		notoriety_set_min("ronin", 2)
		objective_text(0, "sh_rn_museum_pier_GroupOneCount",   GroupOneCount, GroupOneTotal)
		trigger_enable("sh_rn_museum_pier_$tareaone", false)
		marker_remove_navpoint("sh_rn_museum_pier_$tareaone")
	for i = 1, GroupOneTotal, 1 do
		marker_add_npc(GroupOne[i], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
		attack(GroupOne[i], LOCAL_PLAYER)
	end
end




function sh_rn_museum_pier_areatwo()
if coop_is_active() then
	sh_rn_museum_pier_heli()
end

	objective_text_clear(0)	
	areatwo=true
		if (GroupTwoCount == GroupTwoTotal)  and areatwo then
			--debug_message("GROUP TWO")
			release_to_world("sh_rn_museum_pier_$Gt")
			marker_add_navpoint("sh_rn_museum_pier_$tareathree", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
			trigger_enable("sh_rn_museum_pier_$tareathree", true)
			objective_text_clear(0)
			areathree=true
		end
	if areatwo then
		sh_rn_museum_pier_group_two()
	elseif areathree then
		sh_rn_museum_pier_areathree()
	end
end


function sh_rn_museum_pier_areathree()
	
	objective_text_clear(0)
	areathree=true
	trigger_enable("sh_rn_museum_pier_$tareathree", false)
	mission_debug("remove navpoint")
	marker_remove_navpoint("sh_rn_museum_pier_$tareathree")
		
		if GroupThreeCount == GroupThreeTotal and areathree then
			--debug_message("GROUP TWO")
			release_to_world("sh_rn_museum_pier_$Gb")
			--sh_rn_museum_pier_group_three()
			delay(3)
			mission_end_success(MISSION_NAME) 
			--sh_rn_museum_pier_group_Four()			
		end

	sh_rn_museum_pier_group_three()

end


function sh_rn_museum_pier_killcount(char)

	GroupOneCount = GroupOneCount + 1
	
	
	marker_remove_npc(char)
	objective_text(0, "sh_rn_museum_pier_GroupOneCount",  GroupOneCount, GroupOneTotal)
	notoriety_set_max("police", 0)

		if GroupOneCount == GroupOneTotal then
			--debug_message("GROUP TWO")
			release_to_world("sh_rn_museum_pier_$GO")
			marker_add_navpoint("sh_rn_museum_pier_$tareatwo", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)			
			mission_help_table("sh_rn_museum_pier_instructone")
			objective_text_clear(0)
			areaone_done = true
			areatwo = true
			trigger_enable("sh_rn_museum_pier_$tareatwo", true)
		end


		if (GroupOneCount == 1) then
			for i = 1, GroupOneTotal, 1 do
				set_always_sees_player_flag(GroupOne[i], true)
				attack(GroupOne[i], LOCAL_PLAYER)
			end			
		end
		
	
end


function sh_rn_museum_pier_group_two()

	trigger_enable("sh_rn_museum_pier_$tareatwo", false)
	marker_remove_navpoint("sh_rn_museum_pier_$tareatwo")
	objective_text_clear(0)
	--group_create("sh_rn_museum_pier_$Gt", true)
	
	
	if (GroupTwoCount == GroupTwoTotal)  and areatwo then
			--debug_message("GROUP TWO")
			release_to_world("sh_rn_museum_pier_$Gt")
			marker_add_navpoint("sh_rn_museum_pier_$tareathree", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
			trigger_enable("sh_rn_museum_pier_$tareathree", true)
			objective_text_clear(0)
			areathree=true
	end
	
	objective_text(0, "sh_rn_museum_pier_GroupTwoCount", GroupTwoCount, GroupTwoTotal)

		
		
		for i = 1, GroupTwoTotal, 1 do
			if not character_is_dead(GroupTwo[i]) then
				marker_add_npc(GroupTwo[i], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
				on_death("sh_rn_museum_pier_killcountTwo", GroupTwo[i])
			end
		end
	
 	notoriety_set_max("ronin", 2)
	notoriety_set_min("ronin", 2)


end

function sh_rn_museum_pier_killcountTwo(char)

	GroupTwoCount = GroupTwoCount + 1
	
	if areatwo then
	marker_remove_npc(char)
	objective_text(0, "sh_rn_museum_pier_GroupTwoCount", GroupTwoCount, GroupTwoTotal)
	end
	
	if (GroupTwoCount == GroupTwoTotal)  and areatwo then
		--debug_message("GROUP TWO")
		release_to_world("sh_rn_museum_pier_$Gt")
		if marker_three == false then
		marker_add_navpoint("sh_rn_museum_pier_$tareathree", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
		end
		trigger_enable("sh_rn_museum_pier_$tareathree", true)
		objective_text_clear(0)
		areathree=true
		mission_help_table("sh_rn_museum_pier_instructthree")
		areatwo_done = true
	end
end


function sh_rn_museum_pier_group_three()
		
	delay(3)		
	if areathree then
	mission_help_table_nag("sh_rn_museum_pier_instructthree")
	objective_text(0, "sh_rn_museum_pier_GroupThreeCount",  GroupThreeCount, GroupThreeTotal )
	end

	marker_remove_navpoint("sh_rn_museum_pier_$tareathree")
	marker_remove_navpoint("sh_rn_museum_pier_$tareathree")
	
	if GroupThreeCount == GroupThreeTotal and areathree then
		--debug_message("GROUP TWO")
		release_to_world("sh_rn_museum_pier_$Gb")
		delay(3)
		mission_end_success(MISSION_NAME) 
	end
	
	
		
	for i = 1, boatguardstotal, 1 do			
		if character_is_dead(boatguards[i])==false then 
			on_death( "sh_rn_museum_pier_boatguards", boatguards[i])
		end
	end
	
		
	for i = 1, GroupThreeTotal, 1 do
		if not vehicle_is_destroyed(GroupBoats[i]) then
			marker_add_vehicle(GroupBoats[i], MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
			set_current_hit_points( GroupBoats[i], 1000) 
			turn_invulnerable(GroupBoats[i], true)
			--attack(GroupBoats[i], "#PLAYER#") 
			on_vehicle_destroyed("sh_rn_museum_pier_killcountThree", GroupBoats[i])
		end
	end
end


function sh_rn_museum_pier_boatguards(char)
boatguardscount = boatguardscount + 1
-- Make the boat guards attack the players
	if boatguardscount == 1 then
		for i = 1, boatguardstotal, 1 do
			if not character_is_dead(boatguards[i]) then					
				set_always_sees_player_flag(boatguards[i], true)				
				attack(boatguards[i])
			end
		end
	end
end









function sh_rn_museum_pier_killcountThree(vehicle)

	GroupThreeCount = GroupThreeCount + 1
	if areathree then
		marker_remove_vehicle(vehicle)
		objective_text(0, "sh_rn_museum_pier_GroupThreeCount",  GroupThreeCount, GroupThreeTotal )
	end

		if GroupThreeCount == GroupThreeTotal and areathree then
			--debug_message("GROUP TWO")
			release_to_world("sh_rn_museum_pier_$Gb")
			--sh_rn_museum_pier_group_three()
			delay(3)
			mission_end_success(MISSION_NAME)
			areathree_done = false
			--sh_rn_museum_pier_group_Four()			
		end

end


--[[ --All this was cut

function sh_rn_museum_pier_group_Four()

		mission_help_table("sh_rn_museum_pier_instructfour")
		group_create("sh_rn_museum_pier_$GLts", true)
		objective_text(0, "sh_rn_museum_pier_GroupThreeCount", GroupFourCount, GroupFourTotal )

			for i = 1, GroupFourTotal, 1 do
			marker_add_npc(GroupLts[i], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
			on_death("sh_rn_museum_pier_killcountFour", GroupLts[i])  
			end

end

function sh_rn_museum_pier_killcountFour(char)

	GroupFourCount = GroupFourCount + 1
	marker_remove_npc(char)
	objective_text(0, "sh_rn_museum_pier_GroupThreeCount", GroupFourCount, GroupFourTotal )


	if GroupFourCount == GroupFourTotal then
			release_to_world("sh_rn_museum_pier_$GLts")
			mission_end_success(MISSION_NAME) 			
	end

end
--]]

function sh_rn_museum_pier_success()


end


function sh_rn_museum_pier_heli()
	group_create("sh_rn_museum_pier_$Gchopper")
	vehicle_enter_teleport("sh_rn_museum_pier_$c031", "sh_rn_museum_pier_$v006", 0)
	vehicle_enter_teleport("sh_rn_museum_pier_$c031 (0)", "sh_rn_museum_pier_$v006", 2)
	helicopter_fly_to("sh_rn_museum_pier_$v006", helipath)
	vehicle_chase("sh_rn_museum_pier_$v006", LOCAL_PLAYER)
end



function sh_rn_museum_pier_cleanup()
	notoriety_set_min("ronin", 0)
	notoriety_set_max("ronin", 5)
	notoriety_set("ronin", 0)	
	notoriety_force_no_spawn("ronin", false) 
	ambient_cop_spawn_enable(true) 
	ambient_gang_spawn_enable(true) 
	spawning_pedestrians(true)
	trigger_enable("sh_rn_museum_pier_$tareaone", false)
	trigger_enable("sh_rn_museum_pier_$tareatwo", false)
	trigger_enable("sh_rn_museum_pier_$tareathree", false)
	on_trigger("", "sh_rn_museum_pier_$tareaone")
	on_trigger("", "sh_rn_museum_pier_$tareatwo")
	on_trigger("", "sh_rn_museum_pier_$tareathree")
	marker_remove_navpoint("sh_rn_museum_pier_$tareaone")
	marker_remove_navpoint("sh_rn_museum_pier_$tareatwo")
	marker_remove_navpoint("sh_rn_museum_pier_$tareathree")
	
	if(group_is_loaded("sh_rn_museum_pier_$GO")) then
	for i = 1, GroupOneTotal, 1 do
			marker_remove_npc(GroupOne[i])
			on_death("", GroupOne[i])
		end
	end

	if(group_is_loaded("sh_rn_museum_pier_$Gt")) then
		for i = 1, GroupTwoTotal, 1 do
			marker_remove_npc(GroupTwo[i])
			on_death("", GroupTwo[i])  
		end
	end

	if(group_is_loaded("sh_rn_museum_pier_$GLts")) then
		for i = 1, GroupFourTotal, 1 do
			marker_remove_npc(GroupLts[i])
			on_death("", GroupLts[i])  
		end
	end
	
	if(group_is_loaded("sh_rn_museum_pier_$Gboats")) then
		for i = 1, GroupThreeTotal, 1 do
			marker_remove_vehicle(GroupBoats[i])
			on_vehicle_destroyed("", GroupBoats[i])  
		end
	end	
	
	for i = 1, GroupsTotal, 1 do		
		if(group_is_loaded(Groups[i])) then		
		release_to_world(Groups[i])		
		end
	end
end