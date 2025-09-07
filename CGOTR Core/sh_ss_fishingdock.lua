-- Cutscene crash fixes by IdolNinja
-- 3/12/2011


---Tables

--boats = {"sh_ss_fishingdock_BoatFishingB010", "sh_ss_fishingdock_BoatFishingB020", "sh_ss_fishingdock_BoatFishingB030", "sh_ss_fishingdock_BoatFishingB040", "sh_ss_fishingdock_BoatFishingB050"}
ex_triggers = {"sh_ss_fishingdock_$tex_trig01","sh_ss_fishingdock_$tex_trig02","sh_ss_fishingdock_$tex_trig03","sh_ss_fishingdock_$tex_trig04","sh_ss_fishingdock_$tex_trig05","sh_ss_fishingdock_$tex_trig06", "sh_ss_fishingdock_$tBomb"}
explosions = {"sh_ss_fishingdock_$nexplode01","sh_ss_fishingdock_$nexplode02","sh_ss_fishingdock_$nexplode03","sh_ss_fishingdock_$nexplode04","sh_ss_fishingdock_$nexplode05","sh_ss_fishingdock_$nexplode06","sh_ss_fishingdock_$nexplode_placeholder"}
boatDefense = {"sh_ss_fishingdock_$cOne (0)", "sh_ss_fishingdock_$cOne (1)", "sh_ss_fishingdock_$cOne (2)","sh_ss_fishingdock_$cTwo (0)", "sh_ss_fishingdock_$cTwo (1)", "sh_ss_fishingdock_$cTwo (2)"}
labs = {{"sh_ss_fishingdock_1FrozenFishA180", 1},
		  {"sh_ss_fishingdock_1FrozenFishA210", 1},
		  {"sh_ss_fishingdock_1FrozenFishA190", 1},
		  {"sh_ss_fishingdock_1FrozenFishA200", 1},
		  {"sh_ss_fishingdock_1FrozenFishA170", 1},
		  {"sh_ss_fishingdock_1FrozenFishA160", 1},
		  {"sh_ss_fishingdock_2FrozenFishA010", 2},
		  {"sh_ss_fishingdock_2FrozenFishA030", 2},
		  {"sh_ss_fishingdock_2FrozenFishA020", 2},
		  {"sh_ss_fishingdock_3FrozenFishA240", 3},
		  {"sh_ss_fishingdock_3FrozenFishA270", 3},
		  {"sh_ss_fishingdock_3FrozenFishA250", 3},
		  {"sh_ss_fishingdock_3FrozenFishA260", 3},
		  {"sh_ss_fishingdock_3FrozenFishA220", 3},
		  {"sh_ss_fishingdock_3FrozenFishA230", 3},
		  {"sh_ss_fishingdock_4FrozenFishA060", 4},
		  {"sh_ss_fishingdock_4FrozenFishA040", 4},
		  {"sh_ss_fishingdock_4FrozenFishA050", 4},
		  {"sh_ss_fishingdock_5FrozenFishA150", 5},
		  {"sh_ss_fishingdock_5FrozenFishA130", 5},
		  {"sh_ss_fishingdock_5FrozenFishA120", 5},
		  {"sh_ss_fishingdock_5FrozenFishA140", 5},
		  {"sh_ss_fishingdock_6FrozenFishA090", 6},
		  {"sh_ss_fishingdock_6FrozenFishA080", 6},
		  {"sh_ss_fishingdock_6FrozenFishA070", 6}
		 }

fish_nav = {"sh_ss_fishingdock_$nfisharrow1", "sh_ss_fishingdock_$nfisharrow2", "sh_ss_fishingdock_$nfisharrow3", "sh_ss_fishingdock_$nfisharrow4", "sh_ss_fishingdock_$nfisharrow5", "sh_ss_fishingdock_$nfisharrowsix"}
real_boats =  {"sh_ss_fishingdock_$v002 (2)", "sh_ss_fishingdock_$v002 (1)", "sh_ss_fishingdock_$v002 (0)", "sh_ss_fishingdock_$v002"}

--Globals
--boat_total = sizeof_table( boats )
--boat_count = 0
labs_total = sizeof_table( labs )
labs_count = 0
boatDefense_total = sizeof_table ( boatDefense )
in_radius_player1 = false --Determines if the player is in the blast radius of the bomb
in_radius_player2 = false
boat_active = false
fish_done = false
boats_done = false
labs_one = 0
labs_two = 0
labs_three = 0
labs_four = 0
labs_five = 0
labs_six = 0
fish_nav_total = sizeof_table( fish_nav )
drug_level_local = 0
drug_level_remote = 0
drug_time =  0
distance_from_fish = 10
drug_handle_local =""
drug_handle_remote =""
last_fish_group = ""
real_boats_count = 0
real_boats_total = sizeof_table ( real_boats )
real_boats_hitpoints = 0
ex_triggers_total = sizeof_table ( ex_triggers )
smoke_handle1 = ""
smoke_handle2 = ""
smoke_handle3 = ""
smoke_handle4 = ""
smoke_handle5 = ""
smoke_handles = { smoke_handle1, smoke_handle2, smoke_handle3, smoke_handle4, smoke_handle5 }
smoke_handle_size = sizeof_table( smoke_handles )
hud_timer_handle = ""


-- CUTSCENES --
-- Added by IdolNinja. These variables are used in the script for the cutscenes for stability instead of calling them directly

	CUTSCENE_IN = 		"sh_ss_fishingdockct1"
	MISSION_NAME =		"sh_ss_fishingdock"
	MISSION_FAIL_BOMB =	"sh_ss_fishingdock_fail_bomb"

function sh_ss_fishingdock_start(checkpoint, is_restart)

	set_mission_author("David Bowring")	 
if checkpoint == MISSION_START_CHECKPOINT then	
	mission_start_fade_out()
	group_create_hidden("sh_ss_fishingdock_$Gbomb")
	teleport_coop("sh_ss_fishingdock_$nstart1","sh_ss_fishingdock_$nstart2")
	group_create("sh_ss_fishingdock_$Gfisingboats",true)
	
	if (not is_restart) then
		cutscene_play(CUTSCENE_IN,"sh_ss_fishingdock_$Gone")
	else
		group_create_hidden("sh_ss_fishingdock_$Gone", true)
	end
	group_show("sh_ss_fishingdock_$Gone")
	door_lock("sh_ss_fishingdock_SHIP_DOOR", true)	
	--group_create("sh_ss_fishingdock_$Gtrucks", true)
	on_trigger("sh_ss_fishingdock_timer", "sh_ss_fishingdock_$tBomb")
	on_trigger("sh_ss_fishingdock_bomb_text", "sh_ss_fishingdock_$tBombMessage")
	--on_trigger("sh_ss_fishingdock_four", "sh_ss_fishingdock_$tSafe")
	on_trigger("sh_ss_fishingdock_boat_explosions", "sh_ss_fishingdock_$tex_trig01")
	on_trigger("sh_ss_fishingdock_boat_explosions", "sh_ss_fishingdock_$tex_trig02")
	on_trigger("sh_ss_fishingdock_boat_explosions", "sh_ss_fishingdock_$tex_trig03")
	on_trigger("sh_ss_fishingdock_boat_explosions", "sh_ss_fishingdock_$tex_trig04")
	on_trigger("sh_ss_fishingdock_boat_explosions", "sh_ss_fishingdock_$tex_trig05")
	on_trigger("sh_ss_fishingdock_boat_explosions", "sh_ss_fishingdock_$tex_trig06")
	on_trigger("sh_ss_fishingdock_boat_explosions", "sh_ss_fishingdock_$tex_trig07")
	--on_trigger("sh_ss_fishingdock_boat_explosions", "sh_ss_fishingdock_$tex_trig08")
	on_trigger("sh_ss_fishingdock_boat_explosions", "sh_ss_fishingdock_$tex_trig09")
	on_trigger("sh_ss_fishingdock_alert", "sh_ss_fishingdock_$talert")
	trigger_enable("sh_ss_fishingdock_$talert",true)
	on_trigger("sh_ss_fishingdock_radius_enter","sh_ss_fishingdock_$tRadius")
	on_trigger_exit("sh_ss_fishingdock_radius_exit","sh_ss_fishingdock_$tRadius")
	drug_handle_local =thread_new("sh_ss_fishingdock_drug_effect_timer_local")
	if coop_is_active() then
		drug_handle_remote =thread_new("sh_ss_fishingdock_drug_effect_timer_remote")
	end

	for i = 1, real_boats_total, 1 do
		on_vehicle_destroyed("sh_ss_fishingdock_killcountTwo", real_boats[i])  
	end	
		sh_ss_fishingdock_one()
	else

	if group_is_loaded("sh_ss_fishingdock_$Gbomb")==false then
		group_create("sh_ss_fishingdock_$Gbomb")
	end
	group_create("sh_ss_fishingdock_$Gboatdefense")
	group_create("sh_ss_fishingdock_$Gone", true)
	fade_in(.5)
	on_trigger("sh_ss_fishingdock_timer", "sh_ss_fishingdock_$tBomb")
	on_trigger("sh_ss_fishingdock_bomb_text", "sh_ss_fishingdock_$tBombMessage")
	on_trigger("sh_ss_fishingdock_radius_enter","sh_ss_fishingdock_$tRadius")
	on_trigger_exit("sh_ss_fishingdock_radius_exit","sh_ss_fishingdock_$tRadius")
	--on_trigger("sh_ss_fishingdock_four", "sh_ss_fishingdock_$tSafe")
	on_trigger("sh_ss_fishingdock_boat_explosions", "sh_ss_fishingdock_$tex_trig01")
	on_trigger("sh_ss_fishingdock_boat_explosions", "sh_ss_fishingdock_$tex_trig02")
	on_trigger("sh_ss_fishingdock_boat_explosions", "sh_ss_fishingdock_$tex_trig03")
	on_trigger("sh_ss_fishingdock_boat_explosions", "sh_ss_fishingdock_$tex_trig04")
	on_trigger("sh_ss_fishingdock_boat_explosions", "sh_ss_fishingdock_$tex_trig05")
	on_trigger("sh_ss_fishingdock_boat_explosions", "sh_ss_fishingdock_$tex_trig06")
	on_trigger("sh_ss_fishingdock_boat_explosions", "sh_ss_fishingdock_$tex_trig07")
	--on_trigger("sh_ss_fishingdock_boat_explosions", "sh_ss_fishingdock_$tex_trig08")
	on_trigger("sh_ss_fishingdock_boat_explosions", "sh_ss_fishingdock_$tex_trig09")
	on_trigger("sh_ss_fishingdock_alert", "sh_ss_fishingdock_$talert")
	trigger_enable("sh_ss_fishingdock_$tBomb", false)
	trigger_enable("sh_ss_fishingdock_$tBombMessage", false)
	trigger_enable("sh_ss_fishingdock_$tSafe", false)
	sh_ss_fishingdock_three()
	end
end

function sh_ss_fishingdock_alert()

notoriety_set_max("samedi", 3)
notoriety_set_min("samedi", 3)
if coop_is_active() then
	notoriety_set_max("samedi", 4)
	notoriety_set_min("samedi", 4)
end
on_trigger("", "sh_ss_fishingdock_$talert")
trigger_enable("sh_ss_fishingdock_$talert",false)

end


function sh_ss_fishingdock_radius_enter(triggerer_name, trigger_name)
	if (triggerer_name == LOCAL_PLAYER) then
		in_radius_player1 = true
	elseif (triggerer_name == REMOTE_PLAYER) then
		in_radius_player2 = true
	end
end

function sh_ss_fishingdock_radius_exit(triggerer_name, trigger_name)
	if (triggerer_name == LOCAL_PLAYER and character_is_dead(LOCAL_PLAYER)==false) then
		in_radius_player1 = false
		mission_debug("RADIUS EXIT")
	elseif  coop_is_active() and triggerer_name == REMOTE_PLAYER and character_is_dead(REMOTE_PLAYER)==false  then
		in_radius_player2 = false
	end
end


function sh_ss_fishingdock_one() --Destroy all the labs
mission_help_table("sh_ss_fishingdock_instruct_one")
objective_text(0, "sh_ss_fishingdock_objective_one", labs_count, fish_nav_total)
for i = 1, labs_total, 1 do
	mission_debug("on destroyed set".. labs[i][1])			
	on_mover_destroyed("sh_ss_fishingdock_killcountOne", labs[i][1])
	mission_debug("labs count="..labs_total)
end

for i = 1, fish_nav_total, 1 do
	marker_add_navpoint(fish_nav[i], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
end
mission_start_fade_in()
end


function sh_ss_fishingdock_killcountOne(mesh, who_killed)
local labs_one_total = 6	
local labs_two_total = 3
local labs_three_total = 6
local labs_four_total = 3
local labs_five_total = 4
local labs_six_total = 3

-- over complicated function to process groups of destroyed fish
on_mover_destroyed("",mesh)

	for i=1, labs_total, 1 do
		
		if mesh == labs[i][1] then			
			if labs[i][2] == 1 then
				labs_one = labs_one +1
				last_fish_group = fish_nav[1]
				mission_debug("One="..mesh)
				if labs_one==labs_one_total then
					labs_count = labs_count + 1
					marker_remove_navpoint(fish_nav[1])
				end
			elseif labs[i][2] == 2 then
				labs_two = labs_two +1
				mission_debug("two="..mesh)
				last_fish_group = fish_nav[2]
				if labs_two == labs_two_total then
					labs_count = labs_count + 1
					marker_remove_navpoint(fish_nav[2])
				end			
			elseif labs[i][2] == 3 then
				labs_three = labs_three +1
				mission_debug("three="..mesh)
				last_fish_group = fish_nav[3]
				if labs_three==labs_three_total then
					labs_count = labs_count + 1
					marker_remove_navpoint(fish_nav[3])
				end
			elseif labs[i][2] == 4 then
				labs_four = labs_four +1
				mission_debug("four="..mesh)
				last_fish_group = fish_nav[4]
				if labs_four==labs_four_total then
					labs_count = labs_count + 1
					marker_remove_navpoint(fish_nav[4])
				end
			elseif labs[i][2] == 5 then
				labs_five = labs_five +1
				mission_debug("five="..mesh)
				last_fish_group = fish_nav[5]
				if labs_five == labs_five_total then
					labs_count = labs_count + 1
					marker_remove_navpoint(fish_nav[5])
				end					
			elseif labs[i][2] == 6 then
				labs_six = labs_six +1
				mission_debug("six="..mesh)
				last_fish_group = fish_nav[6]
				if labs_six==labs_six_total then
					labs_count = labs_count + 1
					marker_remove_navpoint(fish_nav[6])
				end			
			end
		end
	end
	
	--call drug effect
sh_ss_fishingdock_drug_effect()
	mission_debug("update gsi")
	objective_text(0, "sh_ss_fishingdock_objective_one", labs_count, fish_nav_total)	
	--check to see if things are blown up 
	if labs_count == fish_nav_total then
		fish_done=true
		if boats_done and fish_done then
			sh_ss_fishingdock_three()
		else			
			sh_ss_fishingdock_two()
		end
	end
end

function sh_ss_fishingdock_drug_effect()	
	mission_debug("drug_effect")
	---function to apply drug effect	
	drug_enable_disable_effect_override( true, SYNC_ALL )
	if get_dist_char_to_nav(LOCAL_PLAYER, last_fish_group) < distance_from_fish then
		drug_level_local=1
		drug_effect_set_override_values(0, drug_level_local, SYNC_LOCAL)
		mission_debug("drug_effect"..drug_level_local)
	end
	if coop_is_active() then
		if get_dist_char_to_nav(REMOTE_PLAYER, last_fish_group) < distance_from_fish then
			drug_level_remote=1
			drug_effect_set_override_values(0, drug_level_remote, SYNC_REMOTE)
		end
	end
end

function sh_ss_fishingdock_drug_effect_timer_local()
	mission_debug("drug_effect_decrease enter ="..drug_level_local)
	while drug_level_local > 0 or fish_done == false do
		mission_debug("drug_effect"..drug_level_local)
		drug_level_local = drug_level_local - .1
		drug_effect_set_override_values(0, drug_level_local, SYNC_LOCAL)
		delay(3)
	end
end

function sh_ss_fishingdock_drug_effect_timer_remote()
	while drug_level_remote > 0 or fish_done == false do		
		drug_level_remote = drug_level_remote - .1
		drug_effect_set_override_values(0, drug_level_remote, SYNC_REMOTE)
		delay(3)
	end
end


function sh_ss_fishingdock_two() --Destroy the fishing boats
	mission_help_table("sh_ss_fishingdock_instruct_two")
	objective_text(0, "sh_ss_fishingdock_objective_two", real_boats_count, real_boats_total)
	boat_active = true	
	for i = 1, real_boats_total, 1 do
		if vehicle_is_destroyed(real_boats[i]) == false then
			marker_add_vehicle(real_boats[i], MINIMAP_ICON_KILL, INGAME_EFFECT_VEHICLE_KILL)
			real_boats_hitpoints = get_max_hit_points(real_boats[i])/5
			set_max_hit_points(real_boats[i], real_boats_hitpoints)
		end
	end
end


function sh_ss_fishingdock_killcountTwo(vehicle)

	real_boats_count = real_boats_count + 1
	marker_remove_vehicle(vehicle)
	release_to_world(vehicle)	
	if boat_active and fish_done then
		objective_text(0, "sh_ss_fishingdock_objective_two", real_boats_count, real_boats_total)
	end
		
		--Spawn a wave to attack player
		if real_boats_count == 2 then
			mission_debug("Defense coming", 30)
			group_create("sh_ss_fishingdock_$Gboatdefense")
			vehicle_enter_group_teleport("sh_ss_fishingdock_$cOne (0)", "sh_ss_fishingdock_$cOne (1)", "sh_ss_fishingdock_$cOne (2)", "sh_ss_fishingdock_$vOne") 		
			vehicle_enter_group_teleport("sh_ss_fishingdock_$cTwo (0)", "sh_ss_fishingdock_$cTwo (1)", "sh_ss_fishingdock_$cTwo (2)", "sh_ss_fishingdock_$vTwo") 
			for i = 1, boatDefense_total, 1 do
				set_blitz_flag(boatDefense[i], true)
				set_always_sees_player_flag(boatDefense[i], true)
				set_attack_player_flag(boatDefense[i], true)
				attack(boatDefense[i], "#CLOSEST_PLAYER#")
			end
		end
		
		if real_boats_count == real_boats_total then
			boats_done=true
			mission_debug("boats done")
		end
		--Send the player into the ship
	if real_boats_count == real_boats_total and fish_done then
		delay(3)
		sh_ss_fishingdock_three_set_checkpoint()
	end
end

function sh_ss_fishingdock_three_set_checkpoint() --Blow up the fuel chute
	mission_set_checkpoint("chute")
	sh_ss_fishingdock_three()	
end

function sh_ss_fishingdock_three() --Blow up the fuel chute	
	if group_is_loaded("sh_ss_fishingdock_$Gtwo") == false then
	group_create("sh_ss_fishingdock_$Gtwo")
	end
	objective_text_clear(0)
	trigger_enable("sh_ss_fishingdock_$tBomb", true)
	trigger_enable("sh_ss_fishingdock_$tBombMessage", true)
	mission_help_table("sh_ss_fishingdock_instruct_three")
	marker_add_navpoint("sh_ss_fishingdock_$tBomb", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
	door_lock("sh_ss_fishingdock_SHIP_DOOR", false)
	door_open("sh_ss_fishingdock_SHIP_DOOR")
end


function sh_ss_fishingdock_bomb_text( triggerer_name, trigger_name ) --Press Y to blow up the ship
	
	if ( triggerer_name == LOCAL_PLAYER ) then
		mission_help_table_nag( "sh_ss_fishingdock_bomb_message", "", "", SYNC_LOCAL )		
	elseif ( triggerer_name == REMOTE_PLAYER ) then
		mission_help_table_nag( "sh_ss_fishingdock_bomb_message", "", "", SYNC_REMOTE )		
	end
end

 

function sh_ss_fishingdock_timer( triggerer_name, trigger_name ) --Escape the ship	
	if group_is_loaded("sh_ss_fishingdock_$Gone") then
	release_to_world("sh_ss_fishingdock_$Gone")
	end
	--objective_text(0, "sh_ss_fishingdock_objective_three")
	mission_help_table("sh_ss_fishingdock_instruct_four")
	marker_remove_navpoint("sh_ss_fishingdock_$tBomb")
	trigger_enable("sh_ss_fishingdock_$tBomb", false)
	trigger_enable("sh_ss_fishingdock_$tBombMessage", false)
	--trigger_enable("sh_ss_fishingdock_$tSafe", true)
	character_release_human_shield(triggerer_name)
	--item_drop(nil,triggerer_name)
	mesh_mover_wield_stop(triggerer_name)
	action_play(triggerer_name,"bomb plant","bomb plant",true,.80,true)
	trigger_enable("sh_ss_fishingdock_$tRadius", true)
	group_show("sh_ss_fishingdock_$Gbomb")
	if get_dist_char_to_nav(LOCAL_PLAYER, "sh_ss_fishingdock_$tRadius") < 60 then
		in_radius_player1 = true
	end
	
	if (coop_is_active()) then
		if get_dist_char_to_nav(REMOTE_PLAYER, "sh_ss_fishingdock_$tRadius") < 60 then		
			in_radius_player2 = true
		end
	end
	mission_help_clear()
	hud_timer_set(0, 180000,"sh_ss_fishingdock_end")
	--marker_add_navpoint("sh_ss_fishingdock_$tSafe", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
	minimap_icon_add_navpoint_radius("sh_ss_fishingdock_$tRadius", MINIMAP_ICON_LOCATION, 63, nil, SYNC_ALL)
	group_create("sh_ss_fishingdock_$Gthree")
	trigger_enable("sh_ss_fishingdock_$tex_trig01", true)
	trigger_enable("sh_ss_fishingdock_$tex_trig02", true)
	trigger_enable("sh_ss_fishingdock_$tex_trig03", true)
	trigger_enable("sh_ss_fishingdock_$tex_trig04", true)
	trigger_enable("sh_ss_fishingdock_$tex_trig05", true)
	trigger_enable("sh_ss_fishingdock_$tex_trig06", true)
	trigger_enable("sh_ss_fishingdock_$tex_trig07", true)
	trigger_enable("sh_ss_fishingdock_$tex_trig09", true)
end

function sh_ss_fishingdock_end() --Failed to escape

	hud_timer_stop(0)
	objective_text_clear(0)
	trigger_enable("sh_ss_fishingdock_$tSafe", false)
	--marker_remove_navpoint("sh_ss_fishingdock_$tSafe")
	trigger_enable("sh_ss_fishingdock_$tRadius", false)

	--big boom
	explosion_create("Tanker", "sh_ss_fishingdock_$nexplode04", "", true)
	explosion_create("Car Bomb", "sh_ss_fishingdock_$nexplode04", "", true)
	explosion_create("Big Bang", "sh_ss_fishingdock_$nexplode04", "", true)	
	explosion_create("Tanker", "sh_ss_fishingdock_$nexplode02b", "", true)
	explosion_create("Tanker", "sh_ss_fishingdock_$nexplode05", "", true)
	explosion_create("Big Bang", "sh_ss_fishingdock_$nexplode02b", "", true)
	delay(1)
	explosion_create("Car Bomb", "sh_ss_fishingdock_$nexplode05", "", true)
	explosion_create("Tanker", "sh_ss_fishingdock_$nexplode02a", "", true)
	explosion_create("Car Bomb", "sh_ss_fishingdock_$nexplode02a", "", true)
	explosion_create("Car Bomb Big", "sh_ss_fishingdock_$nexplode03", "", true)
	explosion_create("Tanker", "sh_ss_fishingdock_$nexplode05", "", true)
	delay(1)

	--Kill players that are in the bomb radius

	if (coop_is_active()) then --Checks that if either player dies the mission fails, else success
		if (in_radius_player1 and in_radius_player2) then
			character_kill( LOCAL_PLAYER )
			character_ragdoll( LOCAL_PLAYER, 100 )			
			character_kill( REMOTE_PLAYER )
			character_ragdoll( REMOTE_PLAYER, 100 )
			mission_end_failure(MISSION_NAME, MISSION_FAIL_BOMB)

		elseif (in_radius_player1) then
			character_kill( LOCAL_PLAYER )
			character_ragdoll( LOCAL_PLAYER, 100 )	
			mission_end_failure(MISSION_NAME, MISSION_FAIL_BOMB)
		
		elseif (in_radius_player2) then
			character_kill( REMOTE_PLAYER )
			character_ragdoll( REMOTE_PLAYER, 100 )
			mission_end_failure(MISSION_NAME, MISSION_FAIL_BOMB)
		
		else
			--delay(6)
			mission_end_success(MISSION_NAME)		
		end
	
	elseif (in_radius_player1) then --Checks if player 1 dies
		mission_debug("Player is being killed")
		character_ignite(LOCAL_PLAYER, true)
		--character_kill( LOCAL_PLAYER )
		character_ragdoll( LOCAL_PLAYER, 100 )
		mission_end_failure(MISSION_NAME, MISSION_FAIL_BOMB)	
	else
		--delay(3)
		mission_end_success(MISSION_NAME)
	end
end
	



function sh_ss_fishingdock_boat_explosions(triggerer, trigger_name) 
--Sets up explosions to go off in places that won't kill the player

	if (trigger_name == "sh_ss_fishingdock_$tex_trig01") then
		mission_debug("explosion play")
		hud_timer_stop(0)
		objective_text_clear(0)
		trigger_enable(trigger_name, false)
		explosion_create("Tanker", "sh_ss_fishingdock_$nexplode01", "", true)
		explosion_create("Small Bang", "sh_ss_fishingdock_$nexplode01", "", true)
		mission_help_table("sh_ss_fishingdock_instruct_five") --The bomb malfunctioned and went off early!
		--objective_text(0, "sh_ss_fishingdock_objective_three")
		hud_timer_set(0, 30000,"sh_ss_fishingdock_end")	
	end



	if (trigger_name == "sh_ss_fishingdock_$tex_trig02") then
		mission_debug("explosion play")
		trigger_enable(trigger_name, false)
		explosion_create("Tanker", "sh_ss_fishingdock_$nexplode02b", "", false)
		explosion_create("Small Bang", "sh_ss_fishingdock_$nexplode02b", "", false)
		delay(1)
		smoke_handle1 = effect_play("exp_nuclear_fueltank", "sh_ss_fishingdock_$nexplode02b",true)
		explosion_create("Tanker", "sh_ss_fishingdock_$nexplode02a", "", true)
		explosion_create("Small Bang", "sh_ss_fishingdock_$nexplode02a", "", true)	
	end


	if (trigger_name == "sh_ss_fishingdock_$tex_trig03") then
		mission_debug("explosion play")
		trigger_enable(trigger_name, false)
		explosion_create("Tanker", "sh_ss_fishingdock_$nexplode03", "", false)
		explosion_create("Medium Bang", "sh_ss_fishingdock_$nexplode03", "", false)
		delay(1)
		explosion_create("Tanker", "sh_ss_fishingdock_$nexplode03", "", true)
		explosion_create("Small Bang", "sh_ss_fishingdock_$nexplode03", "", true)

	end

	
	if (trigger_name == "sh_ss_fishingdock_$tex_trig04") then
		mission_debug("explosion play")
		trigger_enable(trigger_name, false)
		explosion_create("Tanker", "sh_ss_fishingdock_$nexplode04", "", false)
		smoke_handle2= effect_play("exp_nuclear_fueltank", "sh_ss_fishingdock_$nexplode04",true)
	
	end

	if (trigger_name == "sh_ss_fishingdock_$tex_trig05") then
		mission_debug("explosion play")
		trigger_enable(trigger_name, false)
		smoke_handle3 = effect_play("exp_nuclear_fueltank", "sh_ss_fishingdock_$nexplode03", false)
		smoke_handle4 = effect_play("exp_nuclear_fueltank", "sh_ss_fishingdock_$nexplode02b",false)
		explosion_create("Tanker", "sh_ss_fishingdock_$nexplode05", "", false)
		explosion_create("Car Bomb", "sh_ss_fishingdock_$nexplode05", "", false)
		delay(1)
		smoke_handle5 = effect_play("exp_nuclear_fueltank", "sh_ss_fishingdock_$nexplode05", true)
	
	end

	if (trigger_name == "sh_ss_fishingdock_$tex_trig06") then	
		trigger_enable(trigger_name, false)
		explosion_create("Tanker", "sh_ss_fishingdock_$nexplode06", "", false)
	end

	if (trigger_name == "sh_ss_fishingdock_$tex_trig07") then	
		trigger_enable(trigger_name, false)
		explosion_create("Tanker", "sh_ss_fishingdock_$nexplode06", "", false)
	end



	if (trigger_name == "sh_ss_fishingdock_$tex_trig09") then	
		trigger_enable(trigger_name, false)
		explosion_create("Tanker", "sh_ss_fishingdock_$nexplode09", "", false)
		explosion_create("Car Bomb", "sh_ss_fishingdock_$nexplode09", "", false)
	end

end


       

function sh_ss_fishingdock_cleanup()	
	in_radius_player1 = false --Determines if the player is in the blast radius of the bomb
	in_radius_player2 = false
	on_trigger("", "sh_ss_fishingdock_$talert")
	on_trigger("", "sh_ss_fishingdock_$tBomb")
	on_trigger("", "sh_ss_fishingdock_$tBombMessage")
	--on_trigger("sh_ss_fishingdock_four", "sh_ss_fishingdock_$tSafe")
	on_trigger("", "sh_ss_fishingdock_$tex_trig01")
	on_trigger("", "sh_ss_fishingdock_$tex_trig02")
	on_trigger("", "sh_ss_fishingdock_$tex_trig03")
	on_trigger("", "sh_ss_fishingdock_$tex_trig04")
	on_trigger("", "sh_ss_fishingdock_$tex_trig05")
	on_trigger("", "sh_ss_fishingdock_$tex_trig06")
	on_trigger("", "sh_ss_fishingdock_$tex_trig07")
	--on_trigger("sh_ss_fishingdock_boat_explosions", "sh_ss_fishingdock_$tex_trig08")
	on_trigger("", "sh_ss_fishingdock_$tex_trig09")
	on_trigger("","sh_ss_fishingdock_$tRadius")
	on_trigger_exit("","sh_ss_fishingdock_$tRadius")
	trigger_enable("sh_ss_fishingdock_$talert",false)
	trigger_enable("sh_ss_fishingdock_$tBomb", false)
	trigger_enable("sh_ss_fishingdock_$tBombMessage", false)
	trigger_enable("sh_ss_fishingdock_$tSafe", false)
	--marker_remove_navpoint("sh_ss_fishingdock_$tSafe")
	trigger_enable("sh_ss_fishingdock_$tRadius", false)
	drug_enable_disable_effect_override( false, SYNC_ALL )
	marker_remove_navpoint("sh_ss_fishingdock_$tBomb")
	hud_timer_stop(0)

	if group_is_loaded("sh_ss_fishingdock_$Gbomb") then
		group_destroy("sh_ss_fishingdock_$Gbomb")
	end



	if drug_handle_local ~= "" then
	thread_kill(drug_handle_local)
	end
	if coop_is_active() then
	if drug_handle_remote ~= "" then
	thread_kill(drug_handle_remote)
	end
	end

	for i = 1, real_boats_total, 1 do
		if vehicle_is_destroyed(real_boats[i])== false then
			marker_remove_vehicle(real_boats[i])
			on_vehicle_destroyed("", real_boats[i])  
		end
	end

	for i = 1, ex_triggers_total, 1 do
		trigger_enable(ex_triggers[i], false)
	end

	for i = 1, fish_nav_total, 1 do
		marker_remove_navpoint(fish_nav[i])
	end

	for i = 1, labs_total, 1 do
		on_mover_destroyed("", labs[i][1])
	end

	for i=1, smoke_handle_size, 1 do 
		if smoke_handles[i] ~= "" then
			effect_stop(smoke_handles[i])
		end
	end

end


function sh_ss_fishingdock_success()


end