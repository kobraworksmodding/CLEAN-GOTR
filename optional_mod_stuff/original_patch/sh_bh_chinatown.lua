--Tables-------

--Storefronts should be triggers. On enter (in_area = true). On exit (in_area = false)
--storefronts = {"sh_bh_chinatown_$t_store0","sh_bh_chinatown_$t_store1","sh_bh_chinatown_$t_store2","sh_bh_chinatown_$t_store3","sh_bh_chinatown_$t_store4"} --Red markers with radii that test if the player is in the area or not
storefronts = {"sh_bh_chinatown_$t_store1","sh_bh_chinatown_$t_store2","sh_bh_chinatown_$t_store3","sh_bh_chinatown_$t_store4"} --Red markers with radii that test if the player is in the area or not
merchants = { "sh_bh_chinatown_$c001", "sh_bh_chinatown_$c002", "sh_bh_chinatown_$c003", "sh_bh_chinatown_$c004" } --on show, green/blue marker
movers = { "sh_bh_chinatown_mover000","sh_bh_chinatown_mover001","sh_bh_chinatown_mover002", "sh_bh_chinatown_mover003", "sh_bh_chinatown_mover004" }
brotherhood = { "sh_bh_chinatown_$c005","sh_bh_chinatown_$c006","sh_bh_chinatown_$c007","sh_bh_chinatown_$c008","sh_bh_chinatown_$c009","sh_bh_chinatown_$c010","sh_bh_chinatown_$c011","sh_bh_chinatown_$c012","sh_bh_chinatown_$c013","sh_bh_chinatown_$c014","sh_bh_chinatown_$c015","sh_bh_chinatown_$c016" }
peds = { "sh_bh_chinatown_$c017","sh_bh_chinatown_$c018","sh_bh_chinatown_$c019","sh_bh_chinatown_$c020","sh_bh_chinatown_$c021","sh_bh_chinatown_$c022" }
groups = { "sh_bh_chinatown_$Group2", "sh_bh_chinatown_$Group3", "sh_bh_chinatown_$Group4", "sh_bh_chinatown_$Group5"}
monster_closet =  {"sh_bh_chinatown_Closet1", "sh_bh_chinatown_Closet2", "sh_bh_chinatown_closet3", "sh_bh_chinatown_closet4"}

storefronts_total = sizeof_table(storefronts)
merchants_total = sizeof_table(merchants)
merchants_left = 0--sizeof_table(merchants) --Will be decremented through script
movers_total = sizeof_table(movers)
brotherhood_total = sizeof_table(brotherhood)
peds_total = sizeof_table(peds)

--Checks what area the player is in an area
areas = { false, false, false, false, false }
--Checks if the player shookdown the merchant yet
merchants_not_shaked = { true, true, true, true, true }
--Initializes the amount of damage needed to get a storeowner out of each store
damages = { 0, 0, 0, 0, 0 }
damage_per_mover = 10
merchantHitPoints = 1000
damage_count = 1
areatracker = 0
merch_damage = 0
total_merchants = 5
in_area = false
in_areatwo = false
last_merchant = ""
merchant_shown= false
merchant_shaked = false
near_thread = ""
area_entered_once = false
area_exit_once = false






function sh_bh_chinatown_start(checkpoint, is_restart)

	set_mission_author("David Bowring")	
	notoriety_set_min("brotherhood", 2)
	notoriety_set_max("brotherhood", 2)
	notoriety_force_no_spawn("brotherhood", true)
	ambient_gang_spawn_enable(false)
	on_random_ods_killed("sh_bh_chinatown_mover_death", "sh_bh_chinatown")

	if (checkpoint == MISSION_START_CHECKPOINT) then		
		mission_start_fade_out()
		teleport_coop("sh_bh_chinatown_$nstart","sh_bh_chinatown_$nstart (0)")
		if (not is_restart) then
			cutscene_play("sh_bh_chinatown_ct1")
		end
		if group_is_loaded("sh_bh_chinatown_$GCTE") then
			release_to_world("sh_bh_chinatown_$GCTE")
		end
		objective_text(0, "sh_bh_chinatown_shopsleft", merchants_left, 4)
		mission_help_table("sh_bh_chinatown_setup")
		group_create_hidden("sh_bh_chinatown_$Gshopkeepers")		
		for i = 1, storefronts_total, 1 do
			on_take_damage("sh_bh_chinatown_merch", merchants[i]) 
			on_damage("sh_bh_chinatown_shakedown", merchants[i], 0.7)
			on_death("sh_bh_chinatown_merchant_death", merchants[i])				
			on_trigger("sh_bh_chinatown_in_area", storefronts[i])
			on_trigger_exit("sh_bh_chinatown_not_area", storefronts[i])
			marker_add_navpoint(storefronts[i],MINIMAP_ICON_LOCATION,"")
			set_max_hit_points(merchants[i], merchantHitPoints)
			set_max_hit_points("sh_bh_chinatown_$cPagoda", merchantHitPoints)	
		end
		mission_start_fade_in()
		mission_debug("MARK IS WRONG")
		near_thread = thread_new("sh_bh_chinatown_nearest")		
	else
		if group_is_loaded("sh_bh_chinatown_$Gshopkeepers") then
			release_to_world("sh_bh_chinatown_$Gshopkeepers")
		end	
		group_create_hidden("sh_bh_chinatown_$Gshopkeepers")		
		
		fade_in(1)
		sh_bh_chinatown_phase_two()	
	end
end


function sh_bh_chinatown_not_area(char, trigger_name)
	--hud_remainder = hud_timer_get_remainder(0)
	
	--on_random_ods_killed("", "sh_bh_chinatown")
	on_trigger_exit("", trigger_name)
	on_trigger("sh_bh_chinatown_in_area", trigger_name)	
	
	for i = 1, storefronts_total, 1 do
		if ((trigger_name == storefronts[i]))then
				mission_debug("Player exits area")
				mission_debug("check merchant shown")
			if merchant_shown == true then
				mission_debug("merchant uber")
				--turn_invulnerable(merchants[i], false) 
			end
			areas[i] = false
			--sh_bh_chinatown_timer(char)
			if merchant_shown==false then
				if area_exit_once == false then
					mission_help_table("sh_bh_chinatown_setup")
				else
					mission_help_table_nag("sh_bh_chinatown_setup")
				end
			area_exit_once = true
			end
		end
	end	
end



function sh_bh_chinatown_timer(char)

	
	
	in_area = false		
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
			while(in_area==false and in_areatwo==false) do
				
				time = time + get_frame_time()

				if(in_area==true and in_areatwo==false or merchant_shaked) then
				return
				end

				if (time > 15) then					
					mission_help_table_nag("sh_bh_chinatown_warning_one")		
				end
				

				if (time > 10) then				
					if (messone == true) then
					mission_help_table_nag("sh_bh_chinatown_warning_three")
					messone = false
					end
				end


				if (time > 5) then
					-- Second message (10 seconds left)
					if (messtwo == true) then
						mission_help_table_nag("sh_bh_chinatown_warning_two")						
						messtwo = false
					end				
				end
				
				if (time == 0) then
					-- Fail if timer runs out
					if (messtwo == true) then
						messtwo = false
						sh_bh_chinatown_timeout()						
					end				
				end
				thread_yield()	
			end				

			else

			while(in_area==false) do
				
				time = time + get_frame_time()

				if(in_area==true or merchant_shaked) then
				return
				end


				if (time > 15) then					
					--mission_help_table_nag("sh_bh_chinatown_warning_one")
					mission_end_failure("sh_bh_chinatown", "msn_sh_bh_chinatown_warning_fail")
				end				

				if (time > 10) then				
					if (messone == true) then
						mission_help_table_nag("sh_bh_chinatown_warning_three")
						messone = false
					end
				end


				if (time > 5) then
					-- Second message (10 seconds left)
					if (messtwo == true) then
						mission_help_table_nag("sh_bh_chinatown_warning_two")
						messtwo = false
					end
				end

				if (time == 0) then
					-- Fail if timer runs out
					if (messtwo == true) then
						sh_bh_chinatown_timeout()				
						messtwo = false
					end				
				end
				thread_yield()
		end				
	end				
end


--When the player enters a shop area, turn on the damage HUD and help text



function sh_bh_chinatown_in_area( triggerer_name, trigger_name )	
	mission_debug("IN area called")
	
	if merchant_shown==false then
	merchant_shaked = false

	if area_entered_once==false then
		objective_text_clear(0) --Clear out the "Shop Owners Left:" line
		mission_help_table("sh_bh_chinatown_damage")
	else
	--objective_text_clear(0) --Clear out the "Shop Owners Left:" line
	mission_help_table_nag("sh_bh_chinatown_damage")
	end
	--mission_help_table("sh_bh_chinatown_instruct_one") --Destroy the storefronts to get the shopkeepers to come out
	on_random_ods_killed("sh_bh_chinatown_mover_death", "sh_bh_chinatown")		--Set HUD range	
	hud_bar_on(0, "Damage", "MSN_SH_BH_CHINATOWN_DESTRUCTION_BAR", 100) --Turn on the damage meter
	hud_bar_set_range(0, 0, 100, SYNC_ALL)	
	end

	area_entered_once = true
	in_area = true
	mission_debug("In area True")
	if coop_is_active() then
		if triggerer_name == REMOTE_PLAYER then
			in_areatwo = true
		end
	end
	thread_kill(near_thread)
	mission_waypoint_remove(SYNC_ALL) 
	mission_debug("waypoint removed")
	
	for i = 1, storefronts_total, 1 do			
		marker_remove_navpoint(storefronts[i])	--remove area markers		
	end
	
		for i = 1, storefronts_total, 1 do
		
			if merchant_shown then
			turn_invulnerable(merchants[i], true) 
			end

			if (storefronts[i] == trigger_name) then
				areatracker = i
				areas[i] = true
				damage_count = i
				in_area = true

			

				if coop_is_active() then
					if triggerer_name == REMOTE_PLAYER then
						hud_timer_stop(0)
						in_areatwo = true
					else
						hud_timer_stop(0)
					end
				end
				--minimap_icon_add_navpoint_radius(storefronts[i], MINIMAP_ICON_LOCATION, 45, true, nil, SYNC_ALL )
				render_script_trigger_on_minimap_add(storefronts[i], {250, 81, 81}, false,SYNC_ALL)
				--minimap_icon_add_navpoint_radius(storefronts[i],MINIMAP_ICON_LOCATION, 45, nil, SYNC_ALL ) -- add radius marker			
				on_trigger("", trigger_name)
				on_trigger_exit("sh_bh_chinatown_not_area", trigger_name)
				mission_debug("Player enters area")
				if merchant_shown== false then
				hud_bar_set_value(0, damages[damage_count], SYNC_ALL)			
				--mission_help_table("sh_bh_chinatown_damage")
				end

			if(not group_is_loaded(groups[i])) then	
				group_create(groups[i], true)
			end

			if (damages[damage_count] >= 100) and merchant_shown == false then			
				sh_bh_chinatown_show_merchant(merchants[areatracker])				
			end
		end
	end

	for i = 1, storefronts_total, 1 do
		if (trigger_name ~= storefronts[i] ) then
			--marker_add_navpoint(storefronts[i],MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION) --add marker to remaining stores
			thread_new("sh_bh_chinatown_trigger", storefronts[i], false)
			on_trigger("", storefronts[i])
		end
	end
end



function sh_bh_chinatown_trigger(name, switch)
trigger_enable(name, switch)
end

--After something is destroyed at a storefront, it adds to the total damage
function sh_bh_chinatown_mover_death(attacker, mover_type, X, Y, Z)	
	
	if (damages[damage_count] >= 100) then		
			return	
	else
		for i = 1, storefronts_total, 1 do			
			if position_is_in_trigger(storefronts[i], X, Y, Z) then
				damages[i] = (damages[i]) + damage_per_mover --add damage to that area's total damage			
				if damage_count == i then
				--mission_debug("mover destroyed"..damages[i]..storefronts[i], 5)
				hud_bar_set_value(0, damages[i], SYNC_ALL)
					if (damages[damage_count] == 100) then
						--on_random_ods_killed("", "sh_bh_chinatown")
						--mission_debug("ods removed")
						delay(5)
						sh_bh_chinatown_show_merchant(merchants[areatracker])
					end
				end
			end
		end
	end	
end








 




--Once the player damages enough goods, the merchant shows up
function sh_bh_chinatown_show_merchant(merchant_name)
	
	if merchant_shown then
		return
	end
		
	for i = 1, merchants_total, 1 do --For each area value
		if (merchants[i] == merchant_name) then
			if group_is_loaded(groups[i]) then
			release_to_world(groups[i])
			mission_debug("Group released = ".. groups[i])
			end
			--set_max_hit_points(merchants[i], merchantHitPoints)
			--trigger_enable(storefronts[i], false)
			mission_debug("Merchant appears="..merch_damage)
			--marker_remove_navpoint(storefronts[i]) --take away markers for area 
			objective_text_clear(0)
			--objective_text("sh_bh_chinatown_shopsleft", merchants_left)			
			set_unrecruitable_flag(merchants[i], true)
			character_show(merchants[i])
			--door_open(monster_closet[i])			
			mission_debug("closet opened =  "..monster_closet[i],15)
			turn_invulnerable(merchant_name, true)
			mission_debug("Merchant Marked"..merchant_name,10)
			marker_add_npc(merchants[i], MINIMAP_ICON_KILL,  INGAME_EFFECT_KILL)--add marker to merchant			
			set_always_sees_player_flag(merchants[i], true)
			set_attack_player_flag(merchants[i], true)
			set_cant_flee_flag(merchants[i], true)
			attack(merchants[i], LOCAL_PLAYER)
			mesh_mover_play_action(monster_closet[i], "start2")
			LAST_DOOR_OPENED = monster_closet[i]
			mission_help_table("sh_bh_chinatown_help") --"Shakedown the storeowners but dont kill them"
			hud_bar_off(0)
			merch_damage = merchantHitPoints			
			if merch_damage > 1000 then
				merch_damage = 1000
			elseif merch_damage < 0 then
				merch_damage = 0
			end
			--mission_debug("Merchant appears="..merch_damage)
			--hud_bar_on(0,"Health", "MSN_SH_BH_CHINATOWN_SHOP_OWNER_BAR", 1000)--Turn on the damage meter	
			--hud_bar_set_range(0,0, 1000, SYNC_ALL)			
			--hud_bar_set_value(0,merch_damage, SYNC_ALL)
			damage_indicator_on(0, merchants[i], 0, "MSN_SH_BH_CHINATOWN_SHOP_OWNER_BAR")
			on_take_damage("sh_bh_chinatown_merch", merchants[i]) 
			on_damage("sh_bh_chinatown_shakedown", merchants[i], 0.7)
			on_death("sh_bh_chinatown_merchant_death", merchants[i])	
		end
	end
merchant_shown= true
end

function sh_bh_chinatown_merchant_death()
	mission_end_failure("sh_bh_chinatown", "sh_bh_chinatown_failure") 
end



function sh_bh_chinatown_merch(npc_name, attacker)	
	
	if merchant_shaked then
		return
	end
	
	if merch_damage > 1000 then
		merch_damage = 1000
	elseif merch_damage < 0 then
		merch_damage = 0
	end
	merch_damage = get_current_hit_points(npc_name)
	mission_debug("Merchant is damaged=  "..merch_damage)
	--hud_bar_set_value(0,merch_damage, SYNC_ALL) 
end


function sh_bh_chinatown_shakedown(npc_name, attacker) --When a merchant reaches 20% health, do this
	mission_debug("Shakedown success!")
	local count = true
	merchant_shown= true
	merchant_shaked = true
	area_entered_once = false
	area_exit_once = false
	
	for i = 1, merchants_total, 1 do		
		if (get_current_hit_points(merchants[i]) < get_max_hit_points(merchants[i])) then 
			if (not character_is_dead(merchants[i])) then --CRASH
				if (merchants_not_shaked[i]) then
					trigger_enable(storefronts[i], false)
					audio_play_for_character("AMELD_BR_STRONG_CHINA", merchants[i], "voice", false, false)
					on_take_damage("", merchants[i]) 
					mission_debug("not_shaked == true")
					merchants_not_shaked[i] = false
					areas[i] = true
					marker_remove_navpoint(storefronts[i]) --take away markers for area
					marker_remove_npc(merchants[i])
					render_script_trigger_on_minimap_remove()
					mission_debug("marker Removed from=  "..merchants[i], 5)
					set_team (merchants[i], "playas")
					set_unrecruitable_flag(merchants[i], true)					
					merchants_left = merchants_left + 1
					if merchants_left < 4 then
					mission_help_table("sh_bh_chinatown_instruct_three")
					end
					damage_indicator_off(0)
					--hud_bar_off(0)	
					near_thread = thread_new("sh_bh_chinatown_nearest")
					if (merchants_left ~= 4) then
						objective_text(0, "sh_bh_chinatown_shopsleft", merchants_left, 4)
					end
					thread_new("sh_bh_chinatown_merchant_timer", merchants[i])			
					--on_damage("", merchants[i], 0.7)
					--release_to_world(merchants[i])
				end
			end			

			if (merchants_left == 1) then
				notoriety_set_min("brotherhood", 2)
				notoriety_set_max("brotherhood", 2)
			end

			if (merchants_left == 4 and count == true) then
				count=false
				mission_set_checkpoint("phase two")
				mission_waypoint_remove()
				sh_bh_chinatown_phase_two()
			end
		end
	end

	
	for i = 1, storefronts_total, 1 do
		if (merchants_not_shaked[i] == true) then
			marker_add_navpoint(storefronts[i],MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION) --add marker to remaining stores
			trigger_enable( storefronts[i], true)
			on_trigger("sh_bh_chinatown_in_area", storefronts[i])
			--on_trigger_exit("sh_bh_chinatown_not_area", storefronts[i])
		end		
	end
	in_area= false
	near_thread = thread_new("sh_bh_chinatown_nearest")	
end



--Turn the merchants invulnerable after 5 seconds
function sh_bh_chinatown_merchant_timer(merchant_name)
	
	set_team (merchant_name, "playas") 	
	while (get_current_hit_points(merchant_name) > 0) do
		set_attack_player_flag (merchant_name, false)
		set_cant_flee_flag(merchant_name, false)
		set_cower_flee_mode(merchant_name, "always flee when attacked")
		delay(5)
		thread_yield()
	end
	near_thread = thread_new("sh_bh_chinatown_nearest")	
end




function sh_bh_chinatown_phase_two()	
	delay(2)
	cutscene_play("sh_bh_chinatown_ct2")	  
	merchant_shaked = false
	mission_help_table("sh_bh_chinatown_instruct_four")	
	marker_add_trigger("sh_bh_chinatown_$t_Pagoda", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
	on_trigger("sh_bh_chinatown_show_pagoda_merchant", "sh_bh_chinatown_$t_Pagoda")
	trigger_enable("sh_bh_chinatown_$t_Pagoda", true)	
	--Create the guards and reinforcments around the pagoda
	notoriety_set_max("brotherhood", 3)
	notoriety_set_min("brotherhood", 3)
	notoriety_force_no_spawn("brotherhood", false)
	group_create("sh_bh_chinatown_$GBrotherhood")
	--Create the peds in the padoda and make them wander
	--group_create("sh_bh_chinatown_$Gpeds")
	--[[
	for i = 1, peds_total, 1 do
		wander_start(peds[i], peds[i], 15)
	end
	--]]
	mission_waypoint_add("sh_bh_chinatown_$t_Pagoda")	
	mesh_mover_play_action(LAST_DOOR_OPENED, "start2") 
end


function sh_bh_chinatown_show_pagoda_merchant()
	delay(2)
	mission_debug("FINAL MERCHANT")
	
	trigger_enable("sh_bh_chinatown_$t_Pagoda", false)
	mission_help_table("sh_bh_chinatown_instruct_two") --Shake down the owner of the pagoda hotel
	--mission_help_table("sh_bh_chinatown_instruct_two")
	character_show("sh_bh_chinatown_$cPagoda")
	marker_add_npc("sh_bh_chinatown_$cPagoda", MINIMAP_ICON_KILL,  INGAME_EFFECT_KILL)
	--set_max_hit_points("sh_bh_chinatown_$cPagoda", merchantHitPoints)	
	on_take_damage("sh_bh_chinatown_merch", "sh_bh_chinatown_$cPagoda") 
	on_damage("sh_bh_chinatown_end", "sh_bh_chinatown_$cPagoda", 0.5)
	on_death("sh_bh_chinatown_merchant_death", "sh_bh_chinatown_$cPagoda")
	attack("sh_bh_chinatown_$cPagoda")
	merch_damage = merchantHitPoints
	--Set Range
	if merch_damage > 1000 then
		merch_damage = 1000
	elseif merch_damage < 0 then
		merch_damage = 0
	end
	set_team ("sh_bh_chinatown_$cPagoda", "brotherhood") 
	damage_indicator_on(0,"sh_bh_chinatown_$cPagoda", 0, "MSN_SH_BH_CHINATOWN_HOTEL_OWNER_BAR")
	--hud_bar_on(0,"Health", "MSN_SH_BH_CHINATOWN_HOTEL_OWNER_BAR", 1000)--Turn on the damage meter
	--hud_bar_set_range(0,0, 1000, SYNC_ALL)
	--hud_bar_set_value(0,merch_damage, SYNC_ALL)	
end

function sh_bh_chinatown_end()
	set_attack_player_flag ("sh_bh_chinatown_$cPagoda", false)
	set_cant_flee_flag("sh_bh_chinatown_$cPagoda", false)
	set_cower_flee_mode("sh_bh_chinatown_$cPagoda", "cower flee normal")
	mission_end_success("sh_bh_chinatown")
end

function sh_bh_chinatown_cleanup()

--Checks what area the player is in an area
areas = { false, false, false, false, false }
--Checks if the player shookdown the merchant yet
merchants_not_shaked = { true, true, true, true, true }
--Initializes the amount of damage needed to get a storeowner out of each store
damages = { 0, 0, 0, 0, 0 }
damage_per_mover = 5
merchantHitPoints = 1000
damage_count = 0
storefronts_total = sizeof_table(storefronts)
ambient_gang_spawn_enable(true)
notoriety_set_max("brotherhood", 5)
notoriety_set_min("brotherhood", 0)
notoriety_set("brotherhood", 0)
notoriety_force_no_spawn("brotherhood", false)
--for i = 1, storefronts_total, 1 do			
--	marker_remove_navpoint(storefronts[i])	--remove area markers		
--end
	marker_remove_trigger("sh_bh_chinatown_$t_Pagoda") 
	on_random_ods_killed("", "sh_bh_chinatown")
damage_indicator_off(0)	
render_script_trigger_on_minimap_remove()
if group_is_loaded("sh_bh_chinatown_$Gshopkeepers") then
	for i = 1, merchants_total, 1 do
		if (character_is_dead(merchants[i])==false) then
			trigger_enable(storefronts[i], false)
			on_take_damage("", merchants[i]) 
			marker_remove_npc(merchants[i])
			set_unrecruitable_flag(merchants[i], false)
		
		end		
	end
end


for i = 1, merchants_total, 1 do
	trigger_enable(storefronts[i], false)
	on_trigger("",storefronts[i])
	marker_remove_navpoint(storefronts[i])
end


group_destroy("sh_bh_chinatown_$Gshopkeepers")

end

function sh_bh_chinatown_success()

end


function sh_bh_chinatown_timeout()

mission_end_failure("sh_bh_chinatown", "sh_bh_chinatown_warning_fail")

end


function  sh_bh_chinatown_nearest()	

		mission_debug("nearest Called")
		merchant_shown=false
		if last_merchant ~= "" then
			release_to_world(last_merchant)
		end
	

		while (in_area == false) do
		--mission_debug("near loop")
		delay(.5)
		sh_bh_chinatown_get_closest_nav_to_char( storefronts, LOCAL_PLAYER )
		end
end

function  sh_bh_chinatown_get_closest_nav_to_char( navpoint_names, character_name )
   local closest_nav_name = navpoint_names[1]
   local closest_dist = 2000 --get_dist_char_to_nav( character_name, navpoint_names[1] )
   local closest_index = 0
	local cur_dist = 0

	for nav_index, nav_name in pairs( navpoint_names ) do
		 
			if merchants_not_shaked[nav_index] == true then
			cur_dist = get_dist_char_to_nav( character_name, nav_name )
			

			--mission_debug( "nav_name = "..nav_name..", cur_dist = "..cur_dist, 15 )
			
				if ( cur_dist < closest_dist ) then
					closest_nav_name = nav_name
					closest_dist = cur_dist
					closest_index = nav_index
				end
			
			end
	end

	if closest_index == 0 then
		return
	end
	--mission_debug( "nav_name = "..closest_nav_name..", cur_dist = "..cur_dist, 15 )	
	mission_waypoint_add(closest_nav_name, SYNC_ALL)	 
   --return closest_nav_name, closest_index, closest_dist
end