-- Cutscene crash fixes by IdolNinja
-- 3/12/2011


--Tables--

--ShantiesOne ={"sh_tss_caverns_UGCV_H2_ShantyC020", "sh_tss_caverns_UGCV_H2_ShantyC030", "sh_tss_caverns_UGCV_H2_ShantyB030", "sh_tss_caverns_UGCV_H2_ShantyB010", "sh_tss_caverns_UGCV_H2_ShantyB020", "sh_tss_caverns_UGCV_H2_ShantyD010", "sh_tss_caverns_UGCV_H2_ShantyD030","sh_tss_caverns_UGCV_H2_ShantyB040", "sh_tss_caverns_UGCV_H2_ShantyC010", "sh_tss_caverns_UGCV_H2_ShantyD020"}
ShantiesTwo ={"sh_tss_caverns_CV_H1_shanty_030", "sh_tss_caverns_CV_H1_shanty_070", "sh_tss_caverns_CV_H1_shanty_040", "sh_tss_caverns_CV_H1_shanty_080", "sh_tss_caverns_CV_H1_shanty_060", "sh_tss_caverns_CV_H1_shanty_050"} 
--goods = {"sh_tss_caverns_CVH1boxCardBoardB110", "sh_tss_caverns_CVH1CrateShippingC090", "sh_tss_caverns_CVH1boxCardBoardB120", "sh_tss_caverns_CVH1CrateShippingC080", "sh_tss_caverns_CVH1CrateShippingC070", "sh_tss_caverns_CVH1CrateShippingC020", "sh_tss_caverns_CVH1boxCardBoardB060", "sh_tss_caverns_CVH1CrateShippingC030", "sh_tss_caverns_CVH1boxCardBoardB050", "sh_tss_caverns_CVH1boxCardBoardB070", "sh_tss_caverns_CVH1boxCardBoardB200", "sh_tss_caverns_CVH1boxCardBoardB080", "sh_tss_caverns_CVH1CrateShippingC060", "sh_tss_caverns_CVH1CrateShippingC150", "sh_tss_caverns_CVH1CrateShippingC130", "sh_tss_caverns_CVH1CrateShippingC140", "sh_tss_caverns_CVH1boxCardBoardB020", "sh_tss_caverns_CVH1boxCardBoardB040", "sh_tss_caverns_CVH1CrateShippingC040", "sh_tss_caverns_CVH1CrateShippingC050", "sh_tss_caverns_CVH1CrateShippingC100", "sh_tss_caverns_CVH1boxCardBoardB140","sh_tss_caverns_CVH1CrateShippingC110", "sh_tss_caverns_CVH1boxCardBoardB160", "sh_tss_caverns_CVH1boxCardBoardB150", "sh_tss_caverns_CVH1CrateShippingC120", "sh_tss_caverns_CVH1boxCardBoardB130"}
--ShantiesOne ={"sh_tss_caverns_ShantyC040", "sh_tss_caverns_ShantyC030", "sh_tss_caverns_ShantyB040", "sh_tss_caverns_ShantyD020", "sh_tss_caverns_ShantyB050", "sh_tss_caverns_ShantyD040", "sh_tss_caverns_ShantyA030", "sh_tss_caverns_ShantyC020", "sh_tss_caverns_ShantyD030", "sh_tss_caverns_ShantyB020", "sh_tss_caverns_ShantyB030", "sh_tss_caverns_ShantyA020"}
--ShantiesTwo ={"sh_tss_caverns_CV069_roughs520", "sh_tss_caverns_CV069_roughs560", "sh_tss_caverns_CV069_roughs700", "sh_tss_caverns_CV069_roughs660", "sh_tss_caverns_CV069_roughs770", "sh_tss_caverns_CV069_roughs610"} 
HomelessOne ={"sh_tss_caverns_$c000", "sh_tss_caverns_$c005", "sh_tss_caverns_$c006", "sh_tss_caverns_$c007", "sh_tss_caverns_$c008"}
HomelessTwo ={"sh_tss_caverns_$c001", "sh_tss_caverns_$c002", "sh_tss_caverns_$c003", "sh_tss_caverns_$c004", "sh_tss_caverns_$c009", "sh_tss_caverns_$c010", "sh_tss_caverns_$c011", "sh_tss_caverns_$c012", "sh_tss_caverns_$c013", "sh_tss_caverns_$c015", "sh_tss_caverns_$c016", "sh_tss_caverns_$c017", "sh_tss_caverns_$c018", "sh_tss_caverns_$c019", "sh_tss_caverns_$c020", "sh_tss_caverns_$c021", "sh_tss_caverns_$c022", "sh_tss_caverns_$c023"} 
HomelessRe ={"sh_tss_caverns_$c042", "sh_tss_caverns_$c042 (0)","sh_tss_caverns_$c042 (1)", "sh_tss_caverns_$c042 (2)", "sh_tss_caverns_$c042 (3)"}
--goods = {"sh_tss_caverns_CrateShippingC130", "sh_tss_caverns_boxCardBoardB050", "sh_tss_caverns_boxCardBoardB070", "sh_tss_caverns_boxCardBoardB200", "sh_tss_caverns_boxCardBoardB080", "sh_tss_caverns_CrateShippingC060", "sh_tss_caverns_CrateShippingC150", "sh_tss_caverns_CrateShippingC140", "sh_tss_caverns_boxCardBoardB170", "sh_tss_caverns_CrateShippingC010", "sh_tss_caverns_CrateShippingC030", "sh_tss_caverns_boxCardBoardB010", "sh_tss_caverns_CrateShippingC020", "sh_tss_caverns_boxCardBoardB060", "sh_tss_caverns_CrateShippingC050", "sh_tss_caverns_CrateShippingC040", "sh_tss_caverns_boxCardBoardB180", "sh_tss_caverns_CrateShippingC110", "sh_tss_caverns_boxCardBoardB160", "sh_tss_caverns_boxCardBoardB150", "sh_tss_caverns_CrateShippingC120", "sh_tss_caverns_CrateShippingC100", "sh_tss_caverns_CrateShippingC070", "sh_tss_caverns_CrateShippingC090", "sh_tss_caverns_boxCardBoardB090", "sh_tss_caverns_boxCardBoardB120", "sh_tss_caverns_CrateShippingC080", "sh_tss_caverns_boxCardBoardB110", "sh_tss_caverns_boxCardBoardB100", "sh_tss_caverns_boxCardBoardB140"}
goods = {"sh_tss_caverns_boxCardBoardB120", "sh_tss_caverns_boxCardBoardB090", "sh_tss_caverns_CrateShippingC070", "sh_tss_caverns_CrateShippingC090", "sh_tss_caverns_boxCardBoardB110", "sh_tss_caverns_CrateShippingC080", "sh_tss_caverns_CrateShippingC020", "sh_tss_caverns_CrateShippingC030", "sh_tss_caverns_boxCardBoardB040", "sh_tss_caverns_boxCardBoardB030", "sh_tss_caverns_CrateShippingC050", "sh_tss_caverns_boxCardBoardB010", "sh_tss_caverns_CrateShippingC040", "sh_tss_caverns_CrateShippingC060", "sh_tss_caverns_boxCardBoardB180", "sh_tss_caverns_CrateShippingC130", "sh_tss_caverns_CrateShippingC140", "sh_tss_caverns_boxCardBoardB080", "sh_tss_caverns_boxCardBoardB200", "sh_tss_caverns_boxCardBoardB170", "sh_tss_caverns_boxCardBoardB070", "sh_tss_caverns_CrateShippingC100", "sh_tss_caverns_CrateShippingC110", "sh_tss_caverns_boxCardBoardB140", "sh_tss_caverns_boxCardBoardB160", "sh_tss_caverns_boxCardBoardB130", "sh_tss_caverns_boxCardBoardB150", "sh_tss_caverns_CrateShippingC120", "sh_tss_caverns_CrateShippingC150", "sh_tss_caverns_boxCardBoardB050", "sh_tss_caverns_boxCardBoardB190", "sh_tss_caverns_boxCardBoardB100"}

rone = {"sh_tss_caverns_$c014", "sh_tss_caverns_$c025", "sh_tss_caverns_$c026", "sh_tss_caverns_$c027", "sh_tss_caverns_$c028", "sh_tss_caverns_$c029", "sh_tss_caverns_$c030"}
rtwo = {"sh_tss_caverns_$c035", "sh_tss_caverns_$c034", "sh_tss_caverns_$c033", "sh_tss_caverns_$c032", "sh_tss_caverns_$c031"}
rthree = {"sh_tss_caverns_$c040", "sh_tss_caverns_$c039", "sh_tss_caverns_$c038", "sh_tss_caverns_$c037", "sh_tss_caverns_$c036"}

	---Global variables--
--Shantie_One_Count = 0
--Shantie_One_Count_Total =sizeof_table( ShantiesOne  )
Shantie_Two_Count = 0
Shantie_Two_Count_Total =sizeof_table( ShantiesTwo )
HomelessOne_Total = sizeof_table( HomelessOne )
Homeless_One_Count = 0
Homeless_Two_Total = sizeof_table( HomelessTwo )  
Homeless_Two_Count = 0
HomelessRe_Count = 0
HomelessRe_Total = sizeof_table( HomelessRe )
--Goods_Count = 0
Goods_Total = sizeof_table( goods )
rone_count = 0
rone_total = sizeof_table( rone )
rtwo_total = sizeof_table( rtwo )
rthree_total = sizeof_table( rthree )
damage = 100
damage_Max = sizeof_table( goods )
damage_min = 0
rail_done = false

-- CUTSCENES --
-- Added by IdolNinja. These variables are used in the script for the cutscenes for stability instead of calling them directly

	CUTSCENE_IN = 		"sh_tss_caverns_ct1"
	MISSION_NAME =		"sh_tss_caverns"
	MISSION_FAIL =		"sh_tss_caverns_fail"
   
function sh_tss_caverns_start(checkpoint, is_restart)
	set_mission_author("David Bowring")
	--teleport("#PLAYER2#","sh_tss_caverns_$nstart")
	mission_start_fade_out()
	teleport_coop("sh_tss_caverns_$nstart","sh_tss_caverns_$nstart (0)")
	notoriety_set("police", 0)
	set_time_of_day(12, 00)
	mission_debug("START override", 30)
	spawning_pedestrians(false)
	spawn_override_set_category("SH - UGCaverns - Bums")
	spawning_pedestrians(true)
	group_create("sh_tss_caverns_$GWave")
	if (not is_restart) then
		cutscene_play(CUTSCENE_IN)
	end
	mission_start_fade_in()
	mission_help_table("sh_tss_caverns_setup") 
	on_trigger("sh_tss_caverns_breadcrumb_two", "sh_tss_caverns_$tBreadcrumb1")
	on_trigger("sh_tss_caverns_phase_one", "sh_tss_caverns_$tBreadcrumb2")
	on_trigger("sh_tss_caverns_breadcrumb_three", "sh_tss_caverns_$tBreadcrumbStart")
	on_trigger("sh_tss_caverns_breadcrumb_four", "sh_tss_caverns_$tBreadcrumb3")
	on_trigger("sh_tss_caverns_breadcrumb_five", "sh_tss_caverns_$tBreadcrumb4")
	on_trigger("sh_tss_caverns_phase_two", "sh_tss_caverns_$tBreadcrumb5")
	on_trigger("sh_tss_caverns_phase_two", "sh_tss_caverns_$twaterway1")
	on_trigger("sh_tss_caverns_phase_two", "sh_tss_caverns_$twaterway2")
	trigger_enable( "sh_tss_caverns_$twaterway1", true)
	trigger_enable( "sh_tss_caverns_$twaterway2", true)
	--mission_help_table("sh_tss_caverns_Instruct_Three")
	
	--sh_tss_caverns_rail()
	--while( not rail_done ) do
	--	thread_yield()
	--end
	--mission_debug("PATHFIND DONE")
	--vehicle_exit("sh_tss_caverns_$cdriver")
	--party_add_optional("sh_tss_caverns_$cdriver", LOCAL_PLAYER)
	--sh_tss_caverns_breadcrumb_one()
	sh_tss_caverns_breadcrumb_start()
end


	---CutScene---
function sh_tss_caverns_phonecall()


end



function sh_tss_caverns_rail()
	fade_out(1)
	vehicle_enter_teleport("sh_tss_caverns_$cdriver", "sh_tss_caverns_$v000 (0)", 0)
	vehicle_enter_teleport(LOCAL_PLAYER, "sh_tss_caverns_$v000 (0)", 1)
	vehicle_speed_override("sh_tss_caverns_$v000 (0)", 15)
	--vehicle_pathfind_to("sh_tss_caverns_$v000 (0)", "sh_tss_caverns_$pathrail1", true, true)
	fade_in(1)
	vehicle_pathfind_to("sh_tss_caverns_$v000 (0)", "sh_tss_caverns_$pathwave2", true, true)
	vehicle_speed_override("sh_tss_caverns_$v000 (0)", 0)
	rail_done = true
end
	
	-----Lead the Player to Goal 1-----
function sh_tss_caverns_breadcrumb_one()
	trigger_enable("sh_tss_caverns_$tBreadcrumb1", true)
	marker_add_trigger("sh_tss_caverns_$tBreadcrumb1", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
	for i = 1, Shantie_One_Count_Total, 1 do
			--marker_add_mover(ShantiesOne[i], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
			on_mover_destroyed("sh_tss_caverns__killcount", ShantiesOne[i])
	end
end

function sh_tss_caverns_breadcrumb_two()
	marker_remove_trigger("sh_tss_caverns_$tBreadcrumb1")
	trigger_enable("sh_tss_caverns_$tBreadcrumb1", false)
	trigger_enable("sh_tss_caverns_$tBreadcrumb2", true)
	marker_add_trigger("sh_tss_caverns_$tBreadcrumb2", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
end



	-----First Goal- Destroy shanties in area one-----
function sh_tss_caverns_phase_one()
	marker_remove_trigger("sh_tss_caverns_$tBreadcrumb2")
	trigger_enable("sh_tss_caverns_$tBreadcrumb2", false)
	mission_debug("PHASE ONE", 30)
	notoriety_set("police", 0)
--	group_create("sh_tss_caverns_$GroupOne", true)
	--release_to_world("sh_tss_caverns_$GroupOne")
	mission_help_table("sh_tss_caverns_Instruct_One") 
	sh_tss_caverns_breadcrumb_start()
	sh_tss_caverns_breadcrumb_four()
	--[[
	for i = 1, Shantie_One_Count_Total, 1 do
			marker_add_mover(ShantiesOne[i], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
			on_mover_destroyed("sh_tss_caverns__killcount", ShantiesOne[i])
	end
	--]]
end

function sh_tss_caverns_damage_sort(object, damager)
local shack_hp = get_max_hit_points(object)
mission_debug("Shack HP="..shack_hp)
	if damager == LOCAL_PLAYER or damager == REMOTE_PLAYER then
		return
	else
		set_current_hit_points(object, shack_hp) 
	end
end         


function sh_tss_caverns__killcount(mesh)
	Shantie_One_Count = Shantie_One_Count + 1
	marker_remove_mover(mesh)
	objective_text(0, "sh_tss_caverns_Shanties_left", Shantie_One_Count, Shantie_One_Count_Total)
	if (Shantie_One_Count == Shantie_One_Count_Total-7) then
	 group_create("sh_tss_caverns_$GReOne")
		for i =1, HomelessRe_Total, 1 do
			attack(HomelessRe[i])
		end		
	end

	if (Shantie_One_Count == Shantie_One_Count_Total) then
		objective_text_clear(0)
		delay(1)		
		mission_help_table("sh_tss_caverns_Instruct_Two") --Continue on to the next homeless area
	end
end


	-----Lead player to the second set of shanties
function sh_tss_caverns_breadcrumb_start()
	group_create("sh_tss_caverns_$GRandom")
	force_throw_char("sh_tss_caverns_$c002 (0)","#PLAYER#", 45, 4)
	trigger_enable("sh_tss_caverns_$tBreadcrumbStart", true)
	marker_add_trigger("sh_tss_caverns_$tBreadcrumbStart", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
	for i = 1, Shantie_Two_Count_Total, 1 do
		on_mover_destroyed("sh_tss_caverns__killcountTwo", ShantiesTwo[i])
	end
end

function sh_tss_caverns_breadcrumb_three()	
	marker_remove_trigger("sh_tss_caverns_$tBreadcrumbStart")
	trigger_enable("sh_tss_caverns_$tBreadcrumbStart", false)
	trigger_enable("sh_tss_caverns_$tBreadcrumb3", true)
	marker_add_trigger("sh_tss_caverns_$tBreadcrumb3", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
end

function sh_tss_caverns_breadcrumb_four()
	--marker_remove_trigger("sh_tss_caverns_$tBreadcrumb3")
	trigger_enable("sh_tss_caverns_$tBreadcrumb3", false)
	trigger_enable("sh_tss_caverns_$tBreadcrumb4", true)
	marker_add_trigger("sh_tss_caverns_$tBreadcrumb4", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
end

function sh_tss_caverns_breadcrumb_five()
	marker_remove_trigger("sh_tss_caverns_$tBreadcrumb4")
	trigger_enable("sh_tss_caverns_$tBreadcrumb4", false)
	trigger_enable("sh_tss_caverns_$tBreadcrumb5", true)
	marker_add_trigger("sh_tss_caverns_$tBreadcrumb5", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
	group_create("sh_tss_caverns_$GroupTwo")
	--release_to_world("sh_tss_caverns_$GroupTwo")
end



	----Second Goal - Destroy Shanties in area two ---
function sh_tss_caverns_phase_two()
	if group_is_loaded("sh_tss_caverns_$GroupTwo") == false then
		group_create("sh_tss_caverns_$GroupTwo")
	end
	marker_remove_trigger("sh_tss_caverns_$tBreadcrumb5")
	trigger_enable("sh_tss_caverns_$tBreadcrumb5", false)
	trigger_enable("sh_tss_caverns_$tBreadcrumb4", false)
	trigger_enable("sh_tss_caverns_$tBreadcrumb3", false)
	trigger_enable("sh_tss_caverns_$tBreadcrumbStart", false)
	mission_debug("PHASE ONE", 5)
	notoriety_set("police", 0)
	on_trigger("", "sh_tss_caverns_$twaterway1")
	on_trigger("", "sh_tss_caverns_$twaterway2")
	on_trigger("", "sh_tss_caverns_$tBreadcrumb1")
	on_trigger("", "sh_tss_caverns_$tBreadcrumb2")
	on_trigger("", "sh_tss_caverns_$tBreadcrumbStart")
	on_trigger("", "sh_tss_caverns_$tBreadcrumb3")
	on_trigger("", "sh_tss_caverns_$tBreadcrumb4")
	on_trigger("", "sh_tss_caverns_$tBreadcrumb5")
	trigger_enable( "sh_tss_caverns_$twaterway1", false)
	trigger_enable( "sh_tss_caverns_$twaterway2", false)
	mission_help_table("sh_tss_caverns_Instruct_One")	
	objective_text(0, "sh_tss_caverns_Shanties_left",Shantie_Two_Count, Shantie_Two_Count_Total )

	for i = 1, Shantie_Two_Count_Total, 1 do
	  	marker_add_mover(ShantiesTwo[i], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
		on_take_damage("sh_tss_caverns_damage_sort", ShantiesTwo[i])
		mission_debug("on take damage set="..ShantiesTwo[i])
		--on_mover_destroyed("sh_tss_caverns__killcountTwo", ShantiesTwo[i])
	end
end

	
function sh_tss_caverns__killcountTwo(mesh)

	Shantie_Two_Count = Shantie_Two_Count + 1
	marker_remove_mover(mesh)
	objective_text(0, "sh_tss_caverns_Shanties_left",Shantie_Two_Count, Shantie_Two_Count_Total )
	if (Shantie_Two_Count == Shantie_Two_Count_Total) then
		objective_text_clear(0)
		delay(3)
		--mission_help_table("sh_tss_caverns_Instruct_Four")
		sh_tss_caverns_end()
		--sh_tss_caverns_phase_Three()
	end

end





	----Third Goal - Defend merchandise ---
function sh_tss_caverns_phase_Three()
	hud_timer_set(0, 1000 * 120, "sh_tss_caverns_end")
	minimap_icon_add_navpoint("sh_tss_caverns_$tGoods", MINIMAP_ICON_PROTECT_ACQUIRE, nil, SYNC_ALL )
	hud_bar_on(0,"Damage", "", 0)--Turn on the damage meter
	hud_bar_set_range(0,damage, damage_Max, SYNC_ALL) --0 to 30
	hud_bar_set_value(0,damage, SYNC_ALL)
	for i = 1, Goods_Total, 1 do
		mesh_mover_reset(goods[i]) 
		on_mover_destroyed("sh_tss_caverns_killcountThree", goods[i])
	end
	sh_tss_caverns_spawn_timer_groups()
end


function sh_tss_caverns_killcountThree(mesh)
	damage = damage - 5
	hud_bar_set_value(0,damage, SYNC_ALL)

--	Goods_Count = Goods_Count + 1
	--objective_text("sh_tss_caverns_goods_left", Goods_Total - Goods_Count)

--	if	(Goods_Count < Goods_Total/2) then

	if (damage > damage_min/2) then
--		objective_text_clear()
--		delay(1)
		mission_help_table("sh_tss_caverns_Instruct_Five")
	end
	
	
--	if	(Goods_Count < Goods_Total) then
	if (damage == damage_min) then
		hud_bar_off(0)
		objective_text_clear(0)
		delay(1)
		mission_end_failure(MISSION_NAME, MISSION_FAIL)
	end

end


function sh_tss_caverns_yield_group_wave(time_left)
	while (hud_timer_get_remainder() > time_left) do
		thread_yield()
	end
end

function sh_tss_caverns_spawn_timer_groups()

	if  (not group_is_loaded("sh_tss_caverns_$GR1")) then
		group_create("sh_tss_caverns_$GR1")
	end
	
		for i = 1, rone_total, 1 do			
			
			--if (!coop_is_active)
			set_always_sees_player_flag(rone[i], true)
			set_blitz_flag(rone[i], true)
			--move_to(rone[i], "sh_tss_caverns_$nattack1", true, true)
			attack(rone[i] )
		end

	
	sh_tss_caverns_yield_group_wave(1.5 * 60 * 1000)

	if  (not group_is_loaded("sh_tss_caverns_$GR2")) then

		group_create("sh_tss_caverns_$GR2", true)

		for i = 1, rtwo_total, 1 do			
			
			--if (!coop_is_active)
			set_always_sees_player_flag(rtwo[i], true)
			set_blitz_flag(rtwo[i], true)
			--move_to(rone[i], "sh_tss_caverns_$nattack1 (0)", true, true)
			attack(rtwo[i])
		end

	move_to("sh_tss_caverns_$c036", "sh_tss_caverns_$nattack1", true, true)
	force_throw("sh_tss_caverns_$c036", "sh_tss_caverns_$nattack1 (0)", 45, 4) 
		
	end

	sh_tss_caverns_yield_group_wave(60 * 1000)
	
	if  (not group_is_loaded("sh_tss_caverns_$GR3")) then

		group_create("sh_tss_caverns_$GR3")

		for i = 1, rthree_total, 1 do			
			--if (!coop_is_active)
			set_always_sees_player_flag(rthree[i], true)
			set_blitz_flag(rthree[i], true)
			move_to(rthree[i], "sh_tss_caverns_$nattack1 (1)", true, true)
			attack(rthree[i])
		end
	end
end







function sh_tss_caverns_success()
	teleport_coop( "sh_tss_caverns_$nend","sh_tss_caverns_$nend (0)"  )
	
end

function sh_tss_caverns_cleanup()
	spawn_override_set_category("")
	spawning_pedestrians(true)
	on_trigger("", "sh_tss_caverns_$twaterway1")
	on_trigger("", "sh_tss_caverns_$twaterway2")
	trigger_enable( "sh_tss_caverns_$twaterway1", false)
	trigger_enable( "sh_tss_caverns_$twaterway2", false)
	trigger_enable("sh_tss_caverns_$tBreadcrumb5", false)
	trigger_enable("sh_tss_caverns_$tBreadcrumb4", false)
	trigger_enable("sh_tss_caverns_$tBreadcrumb3", false)
	trigger_enable("sh_tss_caverns_$tBreadcrumbStart", false)
	on_trigger("", "sh_tss_caverns_$tBreadcrumb1")
	on_trigger("", "sh_tss_caverns_$tBreadcrumb2")
	on_trigger("", "sh_tss_caverns_$tBreadcrumbStart")
	on_trigger("", "sh_tss_caverns_$tBreadcrumb3")
	on_trigger("", "sh_tss_caverns_$tBreadcrumb4")
	on_trigger("", "sh_tss_caverns_$tBreadcrumb5")
	marker_remove_trigger("sh_tss_caverns_$tBreadcrumb1")
	marker_remove_trigger("sh_tss_caverns_$tBreadcrumb2")
	marker_remove_trigger("sh_tss_caverns_$tBreadcrumbStart")
	marker_remove_trigger("sh_tss_caverns_$tBreadcrumb4")
	marker_remove_trigger("sh_tss_caverns_$tBreadcrumb5")
	marker_remove_trigger("sh_tss_caverns_$tBreadcrumb3")
end

function sh_tss_caverns_failure()

end

function sh_tss_caverns_end()
	--fade_out(.1)
	--teleport_coop("sh_tss_caverns_$nstart","sh_tss_caverns_$nstart (0)")
	--fade_in(3)
	mission_end_success(MISSION_NAME)
end












