--Tables
targets =	{
			"sh_bh_apartments_$c001","sh_bh_apartments_$c001 (0)","sh_bh_apartments_$c001 (1)",
			"sh_bh_apartments_$c002","sh_bh_apartments_$c002 (0)","sh_bh_apartments_$c002 (1)",
			"sh_bh_apartments_$c004","sh_bh_apartments_$c004 (0)","sh_bh_apartments_$c004 (1)"
				}

waveOne = {"sh_bh_apartments_$cW00","sh_bh_apartments_$cW01","sh_bh_apartments_$cW02","sh_bh_apartments_$cW03","sh_bh_apartments_$cW00 (0)","sh_bh_apartments_$cW01 (0)","sh_bh_apartments_$cW02 (0)","sh_bh_apartments_$cW03 (0)"}
waveTwo = {"sh_bh_apartments_$cW01 (1)","sh_bh_apartments_$cW02 (1)","sh_bh_apartments_$cW03 (1)"}

groupone = {"sh_bh_apartments_$c001 (1)", "sh_bh_apartments_$c001 (0)", "sh_bh_apartments_$c001"} 
grouptwo = {"sh_bh_apartments_$c002", "sh_bh_apartments_$c002 (0)", "sh_bh_apartments_$c002 (1)"}
groupfour = {"sh_bh_apartments_$c004", "sh_bh_apartments_$c004 (0)", "sh_bh_apartments_$c004 (1)"}
area_done = {false, false, false}
areas =	{"sh_bh_apartments_$tgoto_one", "sh_bh_apartments_$tgoto_two", "sh_bh_apartments_$tgoto_four"}
groups = {groupone,grouptwo, groupfour}
group_names = {"sh_bh_apartments_$Gone", "sh_bh_apartments_$GTwo", "sh_bh_apartments_$Gfour"}
door_triggers = {"sh_bh_apartments_$tDoor_one", "sh_bh_apartments_$tDoor_two", "sh_bh_apartments_$tDoor_three"}

-- door variables and table
DOOR_ONE="sh_bh_apartments_APT083_P_MM_Door010"
DOOR_TWO="sh_bh_apartments_APT083_G_MM_Door010"
DOOR_THREE="sh_bh_apartments_APT083_D_moverDoor010"
doors={DOOR_ONE,DOOR_TWO,DOOR_THREE}
--Globals
door_triggers_size = sizeof_table(door_triggers)
targets_total = 0
targets_left = sizeof_table(areas)
in_area = false
in_area_remote = false
waveOne_total = sizeof_table(waveOne)
waveTwo_total = sizeof_table(waveTwo)
groupone_total = sizeof_table(groupone)
groupone_count = 0
grouptwo_total = sizeof_table(grouptwo)
groupfour_total = sizeof_table(groupfour)
--groupfive_total = sizeof_table(groupfive)
grouptwo_count = 0
groupfour_count = 0
groupfive_count = 0
areas_total = sizeof_table(areas)
areas_count = 0
groups_total = sizeof_table(groups)
group_names_total = sizeof_table(group_names)
groups_count = 0
areatracker = 0
groups_size = {groupone_total, grouptwo_total, groupfour_total}
groups_count = {groupone_count, grouptwo_count, groupfour_count} 
temp_point = ""
closest_point = 0
operations_done = false
methvan_active = false
nav_set = false
nav_thread_handle =""
current_waypoint = ""


function sh_bh_apartments_start(checkpoint, is_restart)

	set_mission_author("David Bowring")
	notoriety_set_max("brotherhood", 2)
	notoriety_set_min("brotherhood", 2)
	notoriety_set_max("police", 0)
	if checkpoint == MISSION_START_CHECKPOINT then
	mission_start_fade_out()
	teleport_coop("sr2_city_$sh_bh_apartments","sh_bh_apartments_$nplayer2")
	group_create("sh_bh_apartments_$Gguards")
	--cutscene_play("sh_bh_apartmentsct1")
	if (not is_restart) then
		cutscene_play("sh_bh_apartmentsct2")
	end
	sh_bh_apartments_one()
	else		
		fade_in(1)
		sh_bh_apartments_methvan()
	end
end	


function sh_bh_apartments_one()
	notoriety_force_no_spawn("brotherhood", true) 
		for i = 1, areas_total, 1 do
			marker_add_navpoint(door_triggers[i],MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
			on_trigger("sh_bh_apartments_in_area", areas[i])
			--on_trigger("sh_bh_apartments_door_triggers", door_triggers[i])
			trigger_enable(areas[i], true)
			trigger_enable(door_triggers[i], true)
			door_lock(doors[i],true)
		end		
	nav_thread_handle = thread_new("sh_bh_apartments_nearest")
	objective_text(0, "sh_bh_apartments_ltcount", areas_count, areas_total) --"Operations Left: %s" <-- Must Change
	mission_start_fade_in()
end


function sh_bh_apartments_door_triggers(char, trigger_name)
marker_remove_trigger(trigger_name)
trigger_enable(trigger_name, false)
end

function sh_bh_apartments_methvan()
	methvan_active = true
	mission_debug("Meth van activate")	
	objective_text_clear(0)
	for i =1, group_names_total, 1 do
		if group_is_loaded(group_names[i]) then
			release_to_world(group_names[i])
		end
	end
	mission_help_table("sh_bh_apartments_instruct_three")
	if  not group_is_loaded("sh_bh_apartments_$Gseven") then
		group_create("sh_bh_apartments_$Gseven", true)
	end
	vehicle_enter_group_teleport({"sh_bh_apartments_$c007", "sh_bh_apartments_$c007 (0)"}, "sh_bh_apartments_$vCar")
	set_unjackable_flag("sh_bh_apartments_$vCar", true)
	on_damage("sh_bh_apartments_methvan_damage", "sh_bh_apartments_$vCar", .90) 
	on_vehicle_destroyed("sh_bh_apartments_methvan_death", "sh_bh_apartments_$vCar")
	vehicle_suppress_npc_exit("sh_bh_apartments_$vCar", true) 
	marker_add_vehicle("sh_bh_apartments_$vCar", MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
	mission_waypoint_add("sh_bh_apartments_$vCar", SYNC_ALL)
	vehicle_pathfind_to("sh_bh_apartments_$vCar", "sh_bh_apartments_$pathcrack", false, true) --nav mesh = traffic laws
	vehicle_pathfind_to("sh_bh_apartments_$vCar", "sh_bh_apartments_$pathcrack2", false, true)
end

function sh_bh_apartments_methvan_damage(car)
vehicle_flee(car)
end



function sh_bh_apartments_methvan_death(car)
on_vehicle_destroyed("", "sh_bh_apartments_$vCar")
marker_remove_vehicle(car)
--delay(3)
sh_bh_apartments_end()
end


function sh_bh_apartments_in_area( triggerer_name, trigger_name )
	
	objective_text_clear(0) --Clear out the "Shop Owners Left:" line
	mission_help_table("sh_bh_apartments_instruct_one") --Destroy the storefronts to get the shopkeepers to come out
	in_area = true
	thread_kill(nav_thread_handle)

	if triggerer_name == REMOTE_PLAYER then
	in_area_remote = true
	end


	for i = 1, areas_total, 1 do			
		if area_done[i] == false then
			marker_remove_navpoint(areas[i])		--remove area markers
			marker_remove_navpoint(door_triggers[i])
		end
	end
	
	for i = 1, areas_total, 1 do
		if (areas[i] == trigger_name) then
				areatracker = i
				door_lock(doors[i],false)
				on_trigger("", trigger_name)
				mission_debug("Player enters area",5)
				mission_waypoint_remove(SYNC_ALL)				
				objective_text(0, "sh_bh_apartments_instruct_two", groups_count[areatracker], groups_size[areatracker])
				group_create(group_names[areatracker], true)

				for i = 1, groups_size[areatracker], 1 do					
					marker_add_npc(groups[areatracker][i], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
					on_death("sh_bh_apartments_killcount_targets", groups[areatracker][i])
				end		
			mission_debug( "created group "..group_names[areatracker].."", 15 )
		end

		if (i ~= areatracker) and (area_done[i] ~= true) then
		trigger_enable(areas[i], false)		
		end

	end

end




function sh_bh_apartments_killcount_targets(char)	
	groups_count[areatracker] = groups_count[areatracker]+1
	
	


		
	
	marker_remove_npc(char)
	objective_text(0, "sh_bh_apartments_instruct_two", groups_count[areatracker], groups_size[areatracker])
	on_death("", char)
	release_to_world(char)	
	mission_debug("kill called="..char)
	if (groups_count[areatracker] == groups_size[areatracker]) then
		areas_count = areas_count + 1
		area_done[areatracker] = true
		in_area = false
		objective_text_clear(0)
		if areas_count == areas_total then
				in_area = false
				operations_done = true
				mission_debug("areas done="..char)
				mission_set_checkpoint("van")
				sh_bh_apartments_methvan()
				--return
				--sh_bh_apartments_end()
		elseif methvan_active == false then
			nav_set= false
			nav_thread_handle = thread_new("sh_bh_apartments_nearest")
		end
		
		delay(1)
		for i = 1, areas_total, 1 do				
			if (area_done[i] == false) then
				marker_add_navpoint(door_triggers[i],MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
				--marker_add_navpoint(areas[i],MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
				on_trigger("sh_bh_apartments_in_area", areas[i])
				trigger_enable(areas[i], true)				
				objective_text(0, "sh_bh_apartments_ltcount", areas_count, areas_total)
			end
		end		
	end

	if	areas_count == 1 then
		notoriety_force_no_spawn("brotherhood", false) 
	end	

end


function sh_bh_apartments_nearest()	
		mission_debug("nearest Called")
		objective_text_clear(0)
		if operations_done==false and methvan_active == false then
		mission_help_table("MSN_SH_BH_APARTMENTS_INSTRUCT_INITIAL") -- "Kill all the BH LTs running each operation!"
		end
		while (in_area == false and methvan_active == false) do
		mission_debug("near loop")
		delay(.5)
		sh_bh_apartments_get_closest_nav_to_char( areas, LOCAL_PLAYER )
		end
end

function sh_bh_apartments_get_closest_nav_to_char( navpoint_names, character_name )
   local closest_nav_name = navpoint_names[1]
   local closest_dist = 2000 --get_dist_char_to_nav( character_name, navpoint_names[1] )
   local closest_index = 0
	local cur_dist = 0
	local new_nav_required = false

	for nav_index, nav_name in pairs( navpoint_names ) do
		 
			if area_done[nav_index] == false then
			cur_dist = get_dist_char_to_nav( character_name, nav_name )
			--mission_debug( "nav_name = "..nav_name..", cur_dist = "..cur_dist, 15 )
			
				if ( cur_dist < closest_dist ) then
					closest_nav_name = nav_name
					closest_dist = cur_dist
					closest_index = nav_index
					new_nav_required = true
				end
			
			end
	end

	if closest_index == 0 then
		return
	end

	--mission_debug( "nav_name = "..closest_nav_name..", cur_dist = "..cur_dist, 15 )
	
	
	if current_waypoint ~= closest_nav_name then
	nav_set = true
	mission_debug("waypoint set")
	current_waypoint=closest_nav_name
	mission_waypoint_add(closest_nav_name, SYNC_ALL)
	end
	 
   --return closest_nav_name, closest_index, closest_dist
end


		





function sh_bh_apartments_timer(time_left)
	while(hud_timer_get_remainder() > time_left) do
		thread_yield(0)
	end
end






function sh_bh_apartments_two()

	release_to_world("sh_bh_apartments_$Gone")
	release_to_world("sh_bh_apartments_$GTwo")
	release_to_world("sh_bh_apartments_$GThree")
	release_to_world("sh_bh_apartments_$Gfour")
	release_to_world("sh_bh_apartments_$GFive")
	release_to_world("sh_bh_apartments_$Gsix")
	release_to_world("sh_bh_apartments_$Gseven")
	notoriety_set_max("brotherhood", 3)
	notoriety_set_min("brotherhood", 3)
	minimap_icon_add_navpoint_radius( "sh_bh_apartments_$tRadius", MINIMAP_ICON_LOCATION, 50, nil, SYNC_ALL )
	on_trigger("sh_bh_apartments_back", "sh_bh_apartments_$tRadius")
	trigger_enable("sh_bh_apartments_$tRadius", true)
	on_trigger_exit("sh_bh_apartments_leave","sh_bh_apartments_$tRadius")
	
		while (not in_area) do
			--mission_help_table("The brotherhood are trying to take back the district. Go defend the apartments!")
			mission_debug("Get to the area!")
			thread_yield()
		end	
	objective_text(0, "sh_bh_apartments_instruct_two")
	hud_timer_set(0, 180000,"sh_bh_apartments_end")

	sh_bh_apartments_timer(160000)
	
	if  (not group_is_loaded("sh_bh_apartments_$GWaveOne")) then
		mission_debug("wave 1 start")
		group_create("sh_bh_apartments_$GWaveOne")
		vehicle_enter_group_teleport("sh_bh_apartments_$cW00", "sh_bh_apartments_$cW01", "sh_bh_apartments_$cW02", "sh_bh_apartments_$cW03", "sh_bh_apartments_$v000") 		
		vehicle_enter_group_teleport("sh_bh_apartments_$cW00 (0)", "sh_bh_apartments_$cW01 (0)", "sh_bh_apartments_$cW02 (0)", "sh_bh_apartments_$cW03 (0)", "sh_bh_apartments_$v000 (0)") 		

		for i = 1, waveOne_total, 1 do
			set_blitz_flag(waveOne[i], true)
			set_always_sees_player_flag(waveOne[i], true)
			attack(waveOne[i],"#PLAYER#")
		end

	end

	sh_bh_apartments_timer(110000)
	
	if  (not group_is_loaded("sh_bh_apartments_$GWaveTwo")) then
		mission_debug("wave 2 start")
		group_create("sh_bh_apartments_$GWaveTwo")
		vehicle_enter_group_teleport("sh_bh_apartments_$cW01 (1)", "sh_bh_apartments_$cW02 (1)", "sh_bh_apartments_$cW03 (1)", "sh_bh_apartments_$v000 (1)") 		
		for i = 1, waveTwo_total, 1 do
			set_blitz_flag(waveTwo[i], true)
			set_always_sees_player_flag(waveTwo[i], true)
			attack(waveTwo[i], LOCAL_PLAYER)
		end

	end
end


function sh_bh_apartments_back()
	in_area = true
end


	
function sh_bh_apartments_leave()
	local time = 0
	local messone = true
	local messtwo = true
	in_area = false
	mission_debug("LEAVE")

		while(not in_area) do
				time = time + hud_timer_get_remainder()  --get_frame_time()

				if (time > 5) then
					-- You have 15 seconds to return
					if (messone == true) then
					mission_help_table("sh_bh_airport_warning_one")
					messone = false
				end
			end

				if (time > 10) then
					if (messtwo == true) then
						--You have 10 seconds to return
						mission_help_table("sh_bh_airport_warning_two")
						messtwo = false
					end
				end

			if (time > 15) then
			--You have 5 seconds to return
				mission_help_table("sh_bh_airport_warning_three")
					sh_bh_apartments_failure()
			end
				thread_yield()
			end

end



function sh_bh_apartments_cleanup()

for i = 1, areas_total, 1 do
	marker_remove_navpoint(door_triggers[i])
	on_trigger("", areas[i])
	--on_trigger("sh_bh_apartments_door_triggers", door_triggers[i])
	trigger_enable(areas[i], false)
	trigger_enable(door_triggers[i],false)
	door_lock(doors[i],false)
end
marker_remove_vehicle("sh_bh_apartments_$vCar")
end


function sh_bh_apartments_failure()
end

function sh_bh_apartments_success()
	--mission_end_success("sh_bh_apartments")
end

function sh_bh_apartments_end()
	delay(3)
	mission_end_success("sh_bh_apartments")
end	
