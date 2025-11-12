
---Groups
guns = {"sh_bh_airport_WH_069CaseGunA010", "sh_bh_airport_WH_070CaseGunA020", "sh_bh_airport_WH_071CaseGunA030", "sh_bh_airport_WH_072CaseGunA040"}
planes = {"sh_bh_airport_$v000 (1)", "sh_bh_airport_$v000 (2)", "sh_bh_airport_$v000", "sh_bh_airport_$v000 (0)"}
trucks = {"sh_bh_airport_$v001 (3)", "sh_bh_airport_$v001 (4)", "sh_bh_airport_$v001 (5)", "sh_bh_airport_$v001 (6)"}
taxione = {"sh_bh_airport_$n000", "sh_bh_airport_$n001", "sh_bh_airport_$n002", "sh_bh_airport_$n003", "sh_bh_airport_$n004", "sh_bh_airport_$n005",}
groupone = {"sh_bh_airport_$c006", "sh_bh_airport_$c006 (0)", "sh_bh_airport_$c006 (1)", "sh_bh_airport_$c006 (2)", "sh_bh_airport_$c006 (3)", "sh_bh_airport_$c006 (4)", "sh_bh_airport_$c006 (5)", "sh_bh_airport_$c006 (6)"} 
grouptwo = {"sh_bh_airport_$c006 (8)", "sh_bh_airport_$c006 (9)", "sh_bh_airport_$c006 (10)", "sh_bh_airport_$c006 (11)", "sh_bh_airport_$c006 (18)", "sh_bh_airport_$c006 (19)",  "sh_bh_airport_$c006 (7)", "sh_bh_airport_$c006 (16)"}
drivers = {"sh_bh_airport_$cpilot", "sh_bh_airport_$cpilot (0)", "sh_bh_airport_$cpilot (1)", "sh_bh_airport_$cpilot (2)", "sh_bh_airport_$c002 (2)"}
groups = {"sh_bh_airport_$Gone", "sh_bh_airport_$Gairthings", "sh_bh_airport_$Greinf", "sh_bh_airport_$Gpilots", "sh_bh_airport_$Greinf1"}



--Tables
guns_total = sizeof_table( guns )
guns_count = 0
planes_total = sizeof_table( planes )
planes_count = 0
trucks_count = 0
trucks_total = sizeof_table( trucks )
--Variables
is_computer_destoyed = false
thread_handle = ""
in_area = false
in_areatwo = false
transfer_complete = false
groupone_count = 0
groupone_total = sizeof_table( groupone )
hud_remainder = 60000
groups_total = sizeof_table( groups )
audio_thread = ""
planes_active = false
computer_radius_on_local = false
computer_radius_on_remote = false
computer_radius_count_local = 0
computer_radius_count_remote = 0
taxi_index = 0
current_driver = ""
computer_arrow_local = 1
computer_arrow_remote = 1
stronghold_complete = false
grouptwo_total = sizeof_table ( grouptwo )
groupone_count = 0
grouptwo_count = 0


function sh_bh_airport_start(checkpoint, is_restart)
	set_mission_author("David Bowring")


	action_nodes_restrict_spawning( true )
	
	if checkpoint == MISSION_START_CHECKPOINT then	
		mission_start_fade_out()
		in_area = false
		notoriety_set_max("police", 0)	
		teleport_coop("sh_bh_airport_$nstart","sh_bh_airport_$nstart (0)")
		if (not is_restart) then
			cutscene_play("sh_bh_airport")
		else
			group_create_hidden("sh_bh_airport_$Gairthings")
		end

		--SP 7/19/08: stop action node spawning so we can save some framerate and stop peds from respawning behind the player
	  

		group_hide("sh_bh_airport_$Gairthings")
		notoriety_force_no_spawn("brotherhood", true)
		--mission_help_table("sh_tss_ugmall_instruct_one")
		group_create("sh_bh_airport_$Gone")
		--objective_text("sh_bh_airport_instruct_two", execs_count, execs_total)
		marker_add_navpoint("sh_bh_airport_$nObjOne", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
		on_trigger("sh_bh_airport_triggerone","sh_bh_airport_$000 (0)")
		on_trigger("sh_bh_airport_triggerone","sh_bh_airport_$t000")
		on_trigger("sh_bh_airport_timer","sh_bh_airport_$tComputer")
		on_trigger("sh_bh_airport_back","sh_bh_airport_$tComputerRadius")
		on_trigger("sh_bh_airport_phase_two","sh_bh_airport_$tgo_out")
		on_trigger("sh_bh_airport_phase_two","sh_bh_airport_$tgo_out2")
		trigger_enable("sh_bh_airport_$t000", true)
		trigger_enable("sh_bh_airport_$000 (0)", true)
		mission_help_table("sh_bh_airport_instructone")
		on_mover_destroyed( "sh_bh_airport_failure_warning","sh_bh_airport_ServerA010")
		--computer time stuff
		on_trigger_exit("sh_bh_airport_leave","sh_bh_airport_$tComputerRadius")
		on_trigger("sh_bh_airport_back","sh_bh_airport_$tComputerRadius")
		mission_start_fade_in()
	else
		on_trigger("sh_bh_airport_phase_two","sh_bh_airport_$tgo_out")
		on_trigger("sh_bh_airport_phase_two","sh_bh_airport_$tgo_out2")
		if group_is_loaded("sh_bh_airport_$Gairthings") == false then
			group_create_hidden("sh_bh_airport_$Gairthings")
		end
		fade_in(1)
		sh_bh_airport_phase_doors()
	end
		
end



function sh_bh_airport_triggerone()
	trigger_enable("sh_bh_airport_$000 (0)", false)
	trigger_enable("sh_bh_airport_$t000", false)
	marker_remove_navpoint("sh_bh_airport_$nObjOne")
	--sh_bh_airport_timer()
	trigger_enable("sh_bh_airport_$tComputer", true)
	marker_add_trigger("sh_bh_airport_$tComputer", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)	
	notoriety_set_min("brotherhood", 2)
	notoriety_set_max("brotherhood", 2)
end


function sh_bh_airport_computer()

--marker_add_trigger("sh_bh_airport_$tComputer", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)	
marker_remove_trigger("sh_bh_airport_$tComputer")
--minimap_icon_add_navpoint_radius( "sh_bh_airport_$tComputer", MINIMAP_ICON_LOCATION, 20, true, nil, SYNC_ALL )
--distance_display_on("sh_bh_airport_$tComputer", 0, 15, 0, 15, SYNC_LOCAL)
marker_add_mover("sh_bh_airport_ServerA010", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE)
on_mover_destroyed( "sh_bh_airport_failure_warning","sh_bh_airport_ServerA010")
door_open("sh_bh_airport_SR2_IAIH_oorAMM030")
door_open("sh_bh_airport_SR2_IAIH_oorAMM010")
audio_thread = audio_play_for_mover("SFX_BRSH5_DOWNLOAD_DATA_LOOP","sh_bh_airport_ServerA010", "foley", false)
trigger_enable("sh_bh_airport_$tComputer", false)
delay(3)
while in_area == false or in_areatwo == false and coop_is_active() do
thread_yield()
end
group_create("sh_bh_airport_$Greinf")
group_create("sh_bh_airport_$Greinf1")		
	
	for i=1, groupone_total, 1 do 		
		thread_new("sh_bh_airport_attack",groupone[i])
		thread_new("sh_bh_airport_attack2",grouptwo[i])
	end	
end
	

function sh_bh_airport_attack(char)		
	delay(2)
	--if coop_is_active() then
		mission_debug("on death callback set on ="..char)
		on_death("sh_bh_airport_killcount_attackers",char)	
	--end
	move_to(char, "sh_bh_airport_$pathattackpath", 3)
	set_blitz_flag(char, true)
	--set_always_sees_player_flag(groupone[i], true)
	attack(char, LOCAL_PLAYER)
	--release_to_world(char)
	thread_yield()
end

function sh_bh_airport_attack2(char)		
	delay(3)
	--if coop_is_active() then
		mission_debug("on death callback set on ="..char)
		on_death("sh_bh_airport_killcount_attackers1",char)	
	--end
	move_to(char, "sh_bh_airport_$pathreinf2", 3)
	set_blitz_flag(char, true)
	--set_always_sees_player_flag(groupone[i], true)
	attack(char, LOCAL_PLAYER)
	--release_to_world(char)	
	thread_yield()
end

function sh_bh_airport_killcount_attackers(char)

groupone_count = groupone_count + 1
mission_debug("on death call count ="..groupone_count)

	if groupone_count == groupone_total and transfer_complete == false then
		groupone_count = 0
		mission_debug("group 1 elminated")
		release_to_world("sh_bh_airport_$Greinf")
		if coop_is_active() then
		group_create("sh_bh_airport_$Greinf")
			for i=1, groupone_total, 1 do 		
				thread_new("sh_bh_airport_attack",groupone[i])
			end
		end
	end

	
end

function sh_bh_airport_killcount_attackers1(char)
	grouptwo_count = grouptwo_count + 1 

if grouptwo_count == grouptwo_total and transfer_complete == false then
		
		mission_debug("group 2 elminated")
		grouptwo_count = 0
		release_to_world("sh_bh_airport_$Greinf1")
		if coop_is_active() then
			group_create("sh_bh_airport_$Greinf1")
			for i=1, grouptwo_total, 1 do 		
				thread_new("sh_bh_airport_attack",groupone[i])
			end
		end
	end
end




function sh_bh_airport_timer(char, triggername)
	
	if char==LOCAL_PLAYER then
		in_area = true
	end
	
	if char==REMOTE_PLAYER then
		in_areatwo = true
		
	end

	if coop_is_active() and char ~= REMOTE_PLAYER then			
		in_areatwo = false
		mission_help_table("sh_bh_airport_coop")
	end
	trigger_enable("sh_bh_airport_$tComputerRadius", true)
	marker_remove_navpoint("sh_bh_airport_$tComputer")
	mission_help_table("sh_bh_airport_transferinstruct")	
	hud_timer_set(0, 60000,"sh_bh_airport_phase_doors")	
	delay(5)
	--objective_text(0, "sh_bh_airport_radio")		
	thread_new("sh_bh_airport_computer")
end




function sh_bh_airport_back(char, triggername)
	local player = ""
	mission_debug("BACK FUNCTION CALLED")


	if transfer_complete then
		return
	end
	--on_trigger_exit("sh_bh_airport_leave","sh_bh_airport_$tComputerRadius")
	--on_trigger("","sh_bh_airport_$tComputerRadius")
	
	if char == LOCAL_PLAYER then
		in_area = true
		computer_radius_on_local = false
		while computer_radius_count_local > 0 do
			minimap_icon_remove_navpoint("sh_bh_airport_$tComputerRadius", SYNC_LOCAL)
			render_script_trigger_on_minimap_remove()
			computer_radius_count_local = computer_radius_count_local -1			
			delay(1)
		end
			marker_add_mover("sh_bh_airport_ServerA010", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE,SYNC_LOCAL)
			mission_debug("BACK FUNCTION CALLED WHILE="..computer_arrow_local)
			computer_arrow_local = computer_arrow_local +1			
	end

	
	if char == REMOTE_PLAYER then
		in_areatwo = true
		computer_radius_on_remote = false
		while computer_radius_count_remote > 0 do
			minimap_icon_remove_navpoint("sh_bh_airport_$tComputerRadius", SYNC_REMOTE)
			render_script_trigger_on_minimap_remove()
			computer_radius_count_remote = computer_radius_count_remote - 1			
			delay(1)
		end
		marker_add_mover("sh_bh_airport_ServerA010", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE,SYNC_REMOTE)
		computer_arrow_remote = computer_arrow_remote + 1
	end	
	delay(3)
	if in_area==false or in_areatwo == false and coop_is_active() then			
		if in_area == false then
		player=LOCAL_PLAYER
		sh_bh_airport_leave(player, triggername)
		elseif coop_is_active() and in_areatwo == false then
		player=REMOTE_PLAYER
		sh_bh_airport_leave(player, triggername)
	end	
end	
	

	hud_timer_pause(0, false)
	hud_timer_set(0, hud_remainder,"sh_bh_airport_phase_doors")
end


	
function sh_bh_airport_leave(char, triggername)
		hud_remainder = hud_timer_get_remainder(0) 
		hud_timer_pause(0, true)
		--on_trigger_exit("","sh_bh_airport_$tComputerRadius")
		--on_trigger("sh_bh_airport_back","sh_bh_airport_$tComputerRadius")
		--hud_timer_set(0, 15000,"sh_bh_airport_failure_warning") 
		if char == LOCAL_PLAYER then
			in_area = false
			computer_radius_on_remote = true
			if computer_radius_on_remote then
			--minimap_icon_add_navpoint_radius("sh_bh_airport_$tComputerRadius", MINIMAP_ICON_LOCATION, 15, nil, SYNC_LOCAL)
			-- parameters for this function  ---- NAME OF THE TRIGGER REGION    -  { COLOR }    PULSE?
			render_script_trigger_on_minimap_add("sh_bh_airport_$tComputerRadius", {250, 81, 81}, false,SYNC_LOCAL)
			while computer_arrow_local > 0 do
			marker_remove_mover("sh_bh_airport_ServerA010",SYNC_LOCAL)
			computer_arrow_local = computer_arrow_local -1
			end
			computer_radius_count_local = computer_radius_count_local + 1
			end
		end

		if char == REMOTE_PLAYER then
			in_areatwo = false
			computer_radius_on_remote = true
			if computer_radius_on_remote then
			--minimap_icon_add_navpoint_radius("sh_bh_airport_$tComputerRadius", MINIMAP_ICON_LOCATION, 15, nil, SYNC_REMOTE)
			render_script_trigger_on_minimap_add("sh_bh_airport_$tComputerRadius", {250, 81, 81}, false,SYNC_REMOTE)
			while  computer_arrow_remote > 0 do
			marker_remove_mover("sh_bh_airport_ServerA010",SYNC_REMOTE)
			computer_arrow_remote = computer_arrow_remote -1
			end
			computer_radius_count_remote = computer_radius_count_remote +1
			end
		end
	
		local time = 0
		local messone = true
		local messtwo = true	
		mission_debug("LEAVE")
		--mission_debug(in_area)



if coop_is_active() then

		while(not in_area or not in_areatwo) do
			
			time = time + get_frame_time()
			
		
			if (time == 0) then				
				if not in_area and not in_areatwo then
				mission_help_table_nag("sh_bh_airport_warning_one","","",SYNC_ALL)
				elseif not in_areatwo then
				mission_help_table_nag("sh_bh_airport_warning_one","","",SYNC_REMOTE)
				elseif not in_area then
				mission_help_table_nag("sh_bh_airport_warning_one","","",SYNC_LOCAL)
				end			
			end
		
			if (time > 5) then
				-- Second message (10 seconds left)
				if (messtwo == true) then
					if not in_area and not in_areatwo then
					mission_help_table_nag("sh_bh_airport_warning_two","","",SYNC_ALL)
					elseif not in_area then
					mission_help_table_nag("sh_bh_airport_warning_two","","",SYNC_LOCAL)
					elseif not in_areatwo then
					mission_help_table_nag("sh_bh_airport_warning_two","","",SYNC_REMOTE)
					end
				messtwo = false
			end


			if (time > 10) then				
				if (messone == true) then
					if not in_area and not in_areatwo then
					mission_help_table_nag("sh_bh_airport_warning_three","","",SYNC_ALL)
					elseif not in_area then
					mission_help_table_nag("sh_bh_airport_warning_three","","",SYNC_LOCAL)
					elseif not in_areatwo then
					mission_help_table_nag("sh_bh_airport_warning_three","","",SYNC_REMOTE)
					end
				messone = false
				end
			end



			if ((time >= 16)) then
			-- Fail if timer reaches zero						
					sh_bh_airport_failure_warning()
			end
			thread_yield()
		end
		
		end

		else

		while(not in_area) do
			
			time = time + get_frame_time()

			if (time == 0) then
				
				mission_help_table_nag("sh_bh_airport_warning_one")
				--sh_bh_airport_phase_two()
				--sh_bh_airport_failure()

			end
			

			if (time > 10) then
			
				if (messone == true) then
					mission_help_table_nag("sh_bh_airport_warning_three")
					messone = false
				end

			end


			if (time > 5) then
				-- Second message (10 seconds left)
				if (messtwo == true) then
					mission_help_table_nag("sh_bh_airport_warning_two")
					messtwo = false
				end

			end

			if (time >= 16) then
				-- Fail
				sh_bh_airport_failure_warning()
			end
				thread_yield()
			end
	
	
		end

	end



function sh_bh_airport_phase_doors()

transfer_complete = true


while computer_arrow_local > 0 do
	marker_remove_mover("sh_bh_airport_ServerA010",SYNC_LOCAL)
	computer_arrow_local = computer_arrow_local -1
end

if coop_is_active then
	while  computer_arrow_remote > 0 do
		marker_remove_mover("sh_bh_airport_ServerA010",SYNC_REMOTE)
		computer_arrow_remote = computer_arrow_remote -1
	end
end
trigger_enable("sh_bh_airport_$tComputerRadius",false)
mission_set_checkpoint("doors")
marker_remove_mover("sh_bh_airport_ServerA010")
on_mover_destroyed( "","sh_bh_airport_ServerA010")
hud_timer_stop(0)
if audio_thread ~= "" then	
	audio_stop(audio_thread) 
end
audio_play_for_mover("SFX_BRSH5_DOWNLOAD_DATA_FINISH ","sh_bh_airport_ServerA010", "foley", false)
distance_display_off() 
marker_remove_navpoint("sh_bh_airport_$tComputer")

marker_add_navpoint("sh_bh_airport_$tgo_out", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)	
marker_add_navpoint("sh_bh_airport_$tgo_out2", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
trigger_enable("sh_bh_airport_$tgo_out", true)
trigger_enable("sh_bh_airport_$tgo_out2", true)
if coop_is_active then
	in_areatwo = true
end
in_area=true

		
		
if (in_area==true) then
	if coop_is_active then
		in_areatwo = true
		--cash_add(100000,REMOTE_PLAYER)
	end
		mission_help_table_nag("sh_bh_airport_transfercomplete")
		delay(3)
		--cash_add(100000,LOCAL_PLAYER)
	end		
	mission_help_table("MSN_SH_BH_AIRPORT_INSTRUCT_OUTSIDE")
end



	
function sh_bh_airport_phase_two()	
		local hp = 0

trigger_enable("sh_bh_airport_$tgo_out", false)
trigger_enable("sh_bh_airport_$tgo_out2", false)
marker_remove_navpoint("sh_bh_airport_$tgo_out")	
marker_remove_navpoint("sh_bh_airport_$tgo_out2")
marker_remove_mover("sh_bh_airport_ServerA010")
on_trigger("","sh_bh_airport_$tgo_out")
on_trigger("","sh_bh_airport_$tgo_out2")
marker_remove_navpoint("sh_bh_airport_$tComputer")		
objective_text_clear(0)
group_create_hidden("sh_bh_airport_$Gpilots")
objective_text(0, "sh_bh_airport_trucksleft", trucks_count, trucks_total)
group_show("sh_bh_airport_$Gairthings")
mission_help_table("sh_bh_airport_instructtwo")
group_show("sh_bh_airport_$Gpilots")


		for i=1 , planes_total, 1 do			
			turn_invulnerable(planes[i], false)
			turn_invulnerable(drivers[i], false)	
			on_vehicle_destroyed("sh_bh_airport_killcountThree", planes[i])
			vehicle_prevent_explosion_fling(planes[i], true)
			--vehicle_enter_teleport(drivers[i], planes[i],0)
			npc_go_idle(drivers[i])
			set_unjackable_flag(planes[i], true)
			vehicle_disable_chase(planes[i], true)
			vehicle_disable_flee(planes[i], true)
		end


		for b=1 , trucks_total, 1 do 
			hp = 0
			hp = get_max_hit_points(trucks[b])
			marker_add_vehicle(trucks[b], MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
			on_vehicle_destroyed("sh_bh_airport_killcountTwo", trucks[b]) 
			set_max_hit_points(trucks[b], hp/2)
		end
	end
	
	function sh_bh_airport_killcountTwo(vehicle)
		trucks_count = trucks_count + 1
		marker_remove_vehicle(vehicle)
		on_vehicle_destroyed("",vehicle)
		mission_debug(trucks_count)
		objective_text(0, "sh_bh_airport_trucksleft", trucks_count, trucks_total)
		if trucks_count == trucks_total then		
		 sh_bh_airport_phase_three()		
		end
	end
	
function sh_bh_airport_killcountThree(vehicle)
		planes_count = planes_count + 1		
		marker_remove_vehicle(vehicle)
		on_vehicle_destroyed("",vehicle)
		mission_debug(planes_count)
		
		
		if planes_active then
		objective_text(0, "sh_bh_airport_planesleft", planes_count, planes_total)
		end
		release_to_world(vehicle)		
	
		if planes_count == planes_total then
		 stronghold_complete = true	
		 delay(3)	 	
		 mission_end_success("sh_bh_airport")		
		end
end
	
	
	
	
function sh_bh_airport_phase_three()
	mission_help_table("sh_bh_airport_instructthree")
	notoriety_force_no_spawn("brotherhood", false)
	
	--[[
	vehicle_enter_group_teleport("sh_bh_airport_$cpilot", "sh_bh_airport_$v000")
	vehicle_enter_group_teleport("sh_bh_airport_$cpilot (0)", "sh_bh_airport_$v000 (0)")
	vehicle_enter_group_teleport("sh_bh_airport_$cpilot (1)", "sh_bh_airport_$v000 (1)")
	vehicle_enter_group_teleport("sh_bh_airport_$cpilot (2)", "sh_bh_airport_$v000 (2)")
	vehicle_enter_group_teleport("sh_bh_airport_$cpilot (3)", "sh_bh_airport_$v000 (3)")


	npc_go_idle("sh_bh_airport_$cpilot")
	npc_go_idle("sh_bh_airport_$cpilot (0)") 
	npc_go_idle("sh_bh_airport_$cpilot (1)") 
	npc_go_idle("sh_bh_airport_$cpilot (2)") 
	npc_go_idle("sh_bh_airport_$cpilot (3)")
	--]]
	planes_active = true
	
	for i=1 , planes_total, 1 do 			
		marker_add_vehicle(planes[i], MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
		on_vehicle_destroyed("sh_bh_airport_killcountThree", planes[i])		
		turn_invulnerable(planes[i], true)
		turn_invulnerable(drivers[i], false) 
		objective_text(0, "sh_bh_airport_planesleft", planes_count, planes_total)
		vehicle_speed_override(planes[i], 10) 
	end
	--group_show("sh_bh_airport_$Gpilots")
	thread_new("sh_bh_airport_taxi")
end





	
function sh_bh_airport_taxi()
		local plane_index = 1
		local plane_tracker = 0	
		mission_debug("START LOOP")
		while (1) do		
		plane_tracker = plane_index
			delay(1)			
			if (not vehicle_is_destroyed(planes[plane_index])) then
			set_unjackable_flag(planes[plane_index], false)			
			vehicle_enter_group_teleport(drivers[plane_index], planes[plane_index])
			current_driver = drivers[plane_index]
			vehicle_speed_override(planes[plane_index], 10) 
			set_unjackable_flag(planes[plane_index], true)
			vehicle_ignore_repulsors(planes[plane_index], true);
			vehicle_pathfind_to(planes[plane_index], taxione, true, false, false, true)
			vehicle_infinite_mass(planes[plane_index], true) 
			end

				if (not vehicle_is_destroyed(planes[plane_index])) then					
					vehicle_speed_cancel(planes[plane_index])		
					airplane_takeoff(planes[plane_index])
				end
			mission_debug(planes[plane_index])
			if (not vehicle_is_destroyed(planes[plane_index])) then
			delay(60) -- This delay is how much time after a plane starts taking off ansd its not destroyed a failure will register
			end


				if(vehicle_is_destroyed(planes[plane_tracker])) then
					if current_driver ~= "" then					
					turn_vulnerable(current_driver)
					character_kill(current_driver)
					character_hide(current_driver) 

					--group_destroy(current_driver) 
					mission_debug("Driver Killed"..current_driver)
					end
					plane_index = plane_index + 1
					--mission_debug(planes[plane_index])
					else
					mission_end_failure("sh_bh_airport","sh_bh_airport_fail_planes")
				end

			if(plane_index > planes_total) then
				break
			end		
		end
		mission_debug("EXIT")
		--plane_index = plane_index + 1
end
	
	
	
function sh_bh_airport_cleanup()
	if stronghold_complete == false and transfer_complete == true then
		--cash_remove(100000, LOCAL_PLAYER)
		if coop_is_active() then
			--cash_remove(100000, REMOTE_PLAYER)
		end
	end
	
	--SP 7/19/08: restart action node spawning when mission is over
	action_nodes_restrict_spawning( false )

	marker_remove_navpoint("sh_bh_airport_$tgo_out")	
	marker_remove_navpoint("sh_bh_airport_$tgo_out2")
	marker_remove_navpoint("sh_bh_airport_$nObjOne")
	marker_remove_trigger("sh_bh_airport_$tComputer")
	on_trigger("","sh_bh_airport_$000 (0)")
	on_trigger("","sh_bh_airport_$t000")
	on_trigger("","sh_bh_airport_$tComputer")
	on_trigger("","sh_bh_airport_$tComputerRadius")
	on_trigger("","sh_bh_airport_$tgo_out")
	on_trigger("","sh_bh_airport_$tgo_out2")
	trigger_enable("sh_bh_airport_$tComputerRadius", false)
	trigger_enable("sh_bh_airport_$t000", false)
	trigger_enable("sh_bh_airport_$000 (0)", false)	
	notoriety_set_min("brotherhood", 0)
	notoriety_set_max("brotherhood", 5)
	notoriety_set("brotherhood", 0)
	hud_timer_stop(0)
	render_script_trigger_on_minimap_remove()

	for b=1 , trucks_total, 1 do 
		if vehicle_is_destroyed(trucks[b]) == false then
			marker_remove_vehicle(trucks[b])
			on_vehicle_destroyed("", trucks[b]) 			
		end
	end	

	for i=1 , planes_total, 1 do
		if vehicle_is_destroyed(planes[i]) == false then
			marker_remove_vehicle(planes[i])
			on_vehicle_destroyed("", planes[i])
		end	
	end

	for i = 1, groups_total, 1 do		
		if group_is_loaded(groups[i]) then
			release_to_world(groups[i]) 
		end
	end
end


	
	
function sh_bh_airport_succes()


end


function sh_bh_airport_failure_warning()
	mission_end_failure("sh_bh_airport","sh_bh_airport_warning_fail") -- make failure`
end


function sh_bh_airport_failure()
	
end
