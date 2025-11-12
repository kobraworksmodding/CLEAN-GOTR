--[[-------------------------------------------------------------------------------
-- sh_ss_crackhouse.lua
-- sons of samedi stronghold 2 - redlight crackhouse
--  First pass by alvan "traitor" monje
-- Good Stuff by David Bowring

   
NOTES
- when aircraft pathfinding is in w/necessary script support, change end objective to shooting chopper as it takes off

- BUGS
	- cover should go in district!
	- vehicle_enter_teleport causing an assert
		- unjackable flag not working; related to above?
----------------------------------------------------------------------------------]]

 

--Globals-------
johns = {"sh_ss_crackhouse_$c-john1", "sh_ss_crackhouse_$c-john2", "sh_ss_crackhouse_$c-john3", "sh_ss_crackhouse_$c-john4",
			"sh_ss_crackhouse_$c-john5", "sh_ss_crackhouse_$c-john6", "sh_ss_crackhouse_$c-john7"}

drug_equipment = {"sh_ss_crackhouse_RLMisCRACK_DrugStillA070", "sh_ss_crackhouse_RLMisCRACK_DrugStillA020","sh_ss_crackhouse_RLMisCRACK_DrugStillA030","sh_ss_crackhouse_RLMisCRACK_DrugStillA040"}
--Mover name changed 7 times - last change 3/28/2007

loaders = {"sh_ss_crackhouse_$c-loader1", "sh_ss_crackhouse_$c-loader2", "sh_ss_crackhouse_$c-loader3", "sh_ss_crackhouse_$c-loader4"}
load_handles ={0,0,0,0}
num_johns = sizeof_table(johns)
num_equipment = sizeof_table(drug_equipment)
num_loaders = sizeof_table(loaders)

johns_killed = 0
equipment_killed = 0
boxes_loaded = 0
boxes_target = 15
loaders_killed = 0
Handle_load_boxes = 0
Helicopter = false
load = true
crack_labs_destroyed = false
DOOR_TO_ROOF="sh_ss_crackhouse_DoorMM110"
DOOR_TO_BACK="sh_ss_crackhouse_frontdoor"
DOOR_TO_UPSTAIRS="sh_ss_crackhouse__doormm18000"
heli_destroyed = false

--Functions-------
function sh_ss_crackhouse_start(checkpoint, is_restart)
	set_mission_author("David Bowring")
	if checkpoint == MISSION_START_CHECKPOINT then
		mission_start_fade_out()
		notoriety_force_no_spawn("samedi", true)

		-- On first runs, only play the cutscene - it does group creation and player positioning
		if (not is_restart) then
			cutscene_play( "sh_ss_crackhouse_ct1", { "sh_ss_crackhouse_$G-flr1-gang", "sh_ss_crackhouse_$G-flr1-civ",
																  "sh_ss_crackhouse_$G-flr1-johns", "sh_ss_crackhouse_$G-roof-gang" },
								{ "sh_ss_crackhouse_$nstart","sh_ss_crackhouse_$nstart (0)" }, false )
		-- Otherwise, teleport the players and create the groups
		else
			teleport_coop( "sh_ss_crackhouse_$nstart","sh_ss_crackhouse_$nstart (0)" )
			group_create_hidden( "sh_ss_crackhouse_$G-flr1-gang", true )
			group_create_hidden( "sh_ss_crackhouse_$G-flr1-civ", true )
			group_create_hidden( "sh_ss_crackhouse_$G-flr1-johns", true )
			group_create_hidden( "sh_ss_crackhouse_$G-roof-gang", true )
		end
		-- Show the groups that were created
		group_show( "sh_ss_crackhouse_$G-flr1-gang" )
		group_show(	"sh_ss_crackhouse_$G-flr1-civ" )
		group_show( "sh_ss_crackhouse_$G-flr1-johns" )
		group_show( "sh_ss_crackhouse_$G-roof-gang" )

		door_lock(DOOR_TO_BACK,true)
		door_lock(DOOR_TO_UPSTAIRS,true)
		door_lock(DOOR_TO_ROOF,true)

		on_door_opened("sh_ss_crackhouse_open_frontdoor_opened", "sh_ss_crackhouse_frontdoor")
		on_trigger("sh_ss_crackhouse_open_frontdoor", "sh_ss_crackhouse_$tfront")
		trigger_enable("sh_ss_crackhouse_$tfront", true)
		marker_add_navpoint("sh_ss_crackhouse_$tfront", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)

		set_unjackable_flag("sh_ss_crackhouse_$v000", true) 
		on_vehicle_destroyed("sh_ss_crackhouse_heli_destroyed", "sh_ss_crackhouse_$v000")
		mission_help_table("sh_ss_crackhouse_start")  -- "Find the backroom and kill the customers."
		objective_text(0, "sh_ss_crackhouse_customers_left", johns_killed, num_johns)
		mission_start_fade_in()
	else
		for i = 1, num_equipment, 1 do
			mesh_mover_hide(drug_equipment[i])
		end
	fade_in(1)
	sh_ss_crackhouse_phase_three()
	end	
end


function sh_ss_crackhouse_cleanup()
	-- disable and unregister all triggers
	trigger_enable("sh_ss_crackhouse_$t-window", false)
	on_trigger("", "sh_ss_crackhouse_$t-window")
	mesh_mover_reset(DOOR_TO_BACK)
	mesh_mover_reset(DOOR_TO_UPSTAIRS)
	mesh_mover_reset(DOOR_TO_ROOF)
	set_player_can_enter_exit_vehicles(LOCAL_PLAYER, true)	
	if coop_is_active then
		set_player_can_enter_exit_vehicles(REMOTE_PLAYER, true)
	end	
	-- remove markers on johns; unregister on_ functions
	for i = 1, num_johns, 1 do
		marker_remove_npc(johns[i])
		on_death("", johns[i])
	end
	-- remove markers on drug equipment; unregister on_ functions
	for i = 1, num_equipment, 1 do
		marker_remove_mover(drug_equipment[i])
		on_mover_destroyed("", drug_equipment[i])
	end
	-- remove markers on loader NPCs; unregister on_ functions
	for i = 1, num_loaders, 1 do
		marker_remove_npc(loaders[i])
		on_death("", loaders[i])
	end
	marker_remove_navpoint("sh_ss_crackhouse_$tupper_door")
	marker_remove_navpoint("sh_ss_crackhouse_$t-flr1-stairs")
	marker_remove_navpoint("sh_ss_crackhouse_$tfront")
	marker_remove_vehicle("sh_ss_crackhouse_$v000")
	-- release all groups (but destroy helicopter)
	release_to_world("sh_ss_crackhouse_$G-flr1-gang")
	release_to_world("sh_ss_crackhouse_$G-flr1-civ")
	release_to_world("sh_ss_crackhouse_$G-flr1-johns")
	release_to_world("sh_ss_crackhouse_$G-flr2-gang")
	release_to_world("sh_ss_crackhouse_$G-roof-gang")
end


function sh_ss_crackhouse_success()
end

function sh_ss_crackhouse_open_frontdoor_opened()
	notoriety_set("samedi", 3)
	on_door_opened("", "sh_ss_crackhouse_frontdoor") 
end

function sh_ss_crackhouse_open_frontdoor()
	door_lock("sh_ss_crackhouse_frontdoor",false)
	marker_remove_navpoint("sh_ss_crackhouse_$tfront")
	on_trigger("", "sh_ss_crackhouse_$tfront")
	trigger_enable("sh_ss_crackhouse_$tfront", false)
	for i = 1, num_johns, 1 do
		marker_add_npc(johns[i], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
		on_death("sh_ss_crackhouse_killcount_johns", johns[i])
	end	
end




function sh_ss_crackhouse_killcount_johns(npc)
	johns_killed = johns_killed + 1
	marker_remove_npc(npc)
	objective_text(0, "sh_ss_crackhouse_customers_left", johns_killed, num_johns)
	if (johns_killed == num_johns) then
		delay(2)
		mission_help_table("sh_ss_crackhouse_drugs")  -- "Now head upstairs and destroy the drug equipment!"
		on_trigger("sh_ss_crackhouse_floor_two_minmap", "sh_ss_crackhouse_$t-flr1-stairs")
		trigger_enable("sh_ss_crackhouse_$t-flr1-stairs", true)
		marker_add_navpoint("sh_ss_crackhouse_$t-flr1-stairs", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
	end
end

function sh_ss_crackhouse_floor_two_minmap()
	marker_remove_navpoint("sh_ss_crackhouse_$t-flr1-stairs")
	trigger_enable("sh_ss_crackhouse_$t-flr1-stairs", false)
	on_trigger("sh_ss_crackhouse_floor_two",	"sh_ss_crackhouse_$tupper_door")
	trigger_enable("sh_ss_crackhouse_$tupper_door", true)
	group_create("sh_ss_crackhouse_$G-flr2-gang", true)
	door_lock(DOOR_TO_UPSTAIRS,false)
	marker_add_navpoint("sh_ss_crackhouse_$tupper_door", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
end

function sh_ss_crackhouse_floor_two()	
	trigger_enable("sh_ss_crackhouse_$tupper_door", false)
	marker_remove_navpoint("sh_ss_crackhouse_$tupper_door")
	on_trigger("", "sh_ss_crackhouse_$t-flr1-stairs")		
	objective_text(0, "sh_ss_crackhouse_drugs_left", equipment_killed, num_equipment)
	for i = 1, num_equipment, 1 do
		mesh_mover_reset(drug_equipment[i])
		marker_add_mover(drug_equipment[i], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
		on_mover_destroyed("sh_ss_crackhouse_killcount_drugs", drug_equipment[i])
	end
end


function sh_ss_crackhouse_killcount_drugs(drug)
	equipment_killed = equipment_killed + 1
	marker_remove_mover(drug)
	objective_text(0, "sh_ss_crackhouse_drugs_left", equipment_killed, num_equipment)
	if (equipment_killed == num_equipment) then
		mission_set_checkpoint("roof")
		crack_labs_destroyed = true
		if crack_labs_destroyed and heli_destroyed then	
			mission_end_success("sh_ss_crackhouse")	
		else
		sh_ss_crackhouse_phase_three()
		end
	end
end


function sh_ss_crackhouse_phase_three()
	crack_labs_destroyed = true	
	on_trigger("sh_ss_crackhouse_setup_rooftop", "sh_ss_crackhouse_$t-setup-roof")
	trigger_enable("sh_ss_crackhouse_$t-setup-roof", true)
	marker_add_trigger("sh_ss_crackhouse_$t-setup-roof", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
	objective_text_clear(0)
	mission_help_table("sh_ss_crackhouse_fire_escape")  -- "Head to the fire escape."
end

function sh_ss_crackhouse_setup_rooftop()
	on_vehicle_enter("sh_ss_crackhouse_heli_stolen", "sh_ss_crackhouse_$v000")
	--[[
	set_player_can_enter_exit_vehicles(LOCAL_PLAYER, false)
	if coop_is_active then
		set_player_can_enter_exit_vehicles(REMOTE_PLAYER, false)
	end
	trigger_enable("sh_ss_crackhouse_$t-setup-roof", false)
	--]]
	marker_remove_trigger("sh_ss_crackhouse_$t-setup-roof")
	--door_lock("sh_ss_crackhouse_DoorMM180", false)
	door_lock(DOOR_TO_ROOF, false)
	release_to_world("sh_ss_crackhouse_$G-flr1-gang") -- release old groups so we don't run out of slots for the new group
	release_to_world("sh_ss_crackhouse_$G-flr1-civ")

	if group_is_loaded("sh_ss_crackhouse_$G-roof-gang")== false then
		group_create("sh_ss_crackhouse_$G-roof-gang", true)
	end
	trigger_enable("sh_ss_crackhouse_$t-window", true)
	on_trigger("", "sh_ss_crackhouse_$t-window")
	-- setup heli and pilot
	if character_is_dead("sh_ss_crackhouse_$c-heli-driver") == false then 
		vehicle_enter_teleport("sh_ss_crackhouse_$c-heli-driver", "sh_ss_crackhouse_$v000", 0)
	end

	if character_is_dead("sh_ss_crackhouse_$c-heli-driver (0)") == false then 
		vehicle_enter_teleport("sh_ss_crackhouse_$c-heli-driver (0)", "sh_ss_crackhouse_$v000", 4)
	end

	if character_is_dead("sh_ss_crackhouse_$c-heli-driver (1)") == false then 
		vehicle_enter_teleport("sh_ss_crackhouse_$c-heli-driver (1)", "sh_ss_crackhouse_$v000", 5)
	end
	npc_go_idle("sh_ss_crackhouse_$c-heli-driver") 
	--set_unjackable_flag("sh_ss_crackhouse_$c-heli-driver", true)
	--set_unjackable_flag("sh_ss_crackhouse_$c-heli-driver (0)", true)
	--set_unjackable_flag("sh_ss_crackhouse_$c-heli-driver (1)", true)

	if vehicle_is_destroyed("sh_ss_crackhouse_$v000") == false then
		on_vehicle_destroyed("sh_ss_crackhouse_heli_destroyed", "sh_ss_crackhouse_$v000")
	end
	
	
	--Script Function to make strippers use poles. 
	--npc_use_closest_action_node_of_type(char, "Blunt_Smoker")

	-- setup loaders
	--[[
	for i = 1, num_loaders, 1 do
		marker_add_npc(loaders[i], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
		on_death("sh_ss_crackhouse_killcount_loaders", loaders[i])
	end
	--]]
	mission_help_table("sh_ss_crackhouse_rooftop")  -- "Head to the rooftop and stop the helicopter from taking off with the merchandise!"
	--objective_text(0, "sh_ss_crackhouse_crates", boxes_loaded, boxes_target)
		 -- make loaders load
		--Handle_load_boxes = thread_new("sh_ss_crackhouse_load_boxes")		
		delay(5)
		sh_ss_crackhouse_heli_takeoff()	
end


function sh_ss_crackhouse_killcount_loaders(npc)
	loaders_killed = loaders_killed + 1	
	marker_remove_npc(npc)
	if (loaders_killed == num_loaders) then
		delay(3)
		release_to_world("sh_ss_crackhouse_$v000")
		mission_end_success("sh_ss_crackhouse")
	end
end


function sh_ss_crackhouse_heli_destroyed()
	--thread_kill(Handle_load_boxes) -- kill box loading thread so player doesn't fail during the oncoming 3 second delay even though technically he's won already
	heli_destroyed = true
	if crack_labs_destroyed then
	delay(3)	
	mission_end_success("sh_ss_crackhouse")
	end
end


function sh_ss_crackhouse_load_boxes()
	-- load 1st box, then...
	
	--store proccess handles in a table for later killing
	for i = 1, num_loaders, 1 do
		load_handles[i] = thread_new("sh_ss_crackhouse_load_handler", loaders[i])			
	end

	while (1) do
		thread_yield()

		if (load == false) then
			for i = 1, num_loaders, 1 do
			
				if character_is_dead(loaders[i]) == false then
					thread_kill(load_handles[i])
				end
			end

			-- We are done
			return
		end
	end
end

function sh_ss_crackhouse_load_handler(npc)	
	while (1) do
		if (boxes_loaded >= boxes_target) then
				if Helicopter == false then
					attack(npc)
					thread_new("sh_ss_crackhouse_heli_takeoff")
				end
			--set load to false and then kill the thread
			load = false
			return
		end
		move_to(npc, "sh_ss_crackhouse_$n001")
		delay(1) --play anim		
		if Helicopter == false and boxes_loaded <= 15 then
			boxes_loaded = boxes_loaded + 1 -- increment counter
		end
		objective_text(0, "sh_ss_crackhouse_crates", boxes_loaded, boxes_target) -- display new crate total
		move_to_safe(npc, "sh_ss_crackhouse_$n000", 2)
		delay(1) --play anim
	end
end

function sh_ss_crackhouse_heli_stolen()

	for i = 1, num_loaders, 1 do
		if (character_is_dead(loaders[i]) == false) then
			marker_remove_npc(loaders[i])
			on_death("", loaders[i])
		end
	end

	for i = 1, num_loaders, 1 do
		if character_is_dead(loaders[i]) == false then			
			thread_kill(load_handles[i])
		end
	end
mission_end_success("function sh_ss_crackhouse")
end

function sh_ss_crackhouse_heli_takeoff()
local count = 0
Helicopter = true
load = false
--thread_kill(Handle_load_boxes)
objective_text_clear(0)

if character_is_dead("sh_ss_crackhouse_$c-heli-driver (0)")== false then
	attack("sh_ss_crackhouse_$c-heli-driver (0)")
end

if character_is_dead("sh_ss_crackhouse_$c-heli-driver (1)")== false then
	attack("sh_ss_crackhouse_$c-heli-driver (1)")
end

if vehicle_is_destroyed("sh_ss_crackhouse_$v000") == false then
	marker_add_vehicle("sh_ss_crackhouse_$v000", MINIMAP_ICON_KILL,  INGAME_EFFECT_VEHICLE_KILL)
	
	vehicle_chase("sh_ss_crackhouse_$v000", LOCAL_PLAYER, false, false, true)
end



-- add text "Destory the Helicopter"
delay(10)
mission_help_table("sh_ss_crackhouse_fail")
mission_debug("attack")

while vehicle_is_destroyed("sh_ss_crackhouse_$v000") == false do
	helicopter_fly_to("sh_ss_crackhouse_$v000", -1, "sh_ss_crackhouse_$nHeliAttack")
	delay(1)
	helicopter_fly_to("sh_ss_crackhouse_$v000", -1, "sh_ss_crackhouse_$nHeliAttack (0)")
	delay(1)
	helicopter_fly_to("sh_ss_crackhouse_$v000", -1, "sh_ss_crackhouse_$nHeliAttack (1)")
	delay(1)
	vehicle_chase("sh_ss_crackhouse_$v000", LOCAL_PLAYER, false, false, true)
	delay(30)
end

end