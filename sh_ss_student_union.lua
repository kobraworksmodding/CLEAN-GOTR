-- Cutscene crash fixes by IdolNinja
-- 3/12/2011


---Tables
recruiters = {"sh_ss_student_union_$c000","sh_ss_student_union_$c001","sh_ss_student_union_$c002","sh_ss_student_union_$c004", "sh_ss_student_union_$c005"}
boss = {"sh_ss_student_union_$c023", "sh_ss_student_union_$c022", "sh_ss_student_union_$c021", "sh_ss_student_union_$c020", "sh_ss_student_union_$c019", "sh_ss_student_union_$c018", "sh_ss_student_union_$c017", "sh_ss_student_union_$c016", "sh_ss_student_union_$c015"}
guards = {"sh_ss_student_union_$c003", "sh_ss_student_union_$c024", "sh_ss_student_union_$c025", "sh_ss_student_union_$c026", "sh_ss_student_union_$c028", "sh_ss_student_union_$c029", "sh_ss_student_union_$c030", "sh_ss_student_union_$c031", "sh_ss_student_union_$c032", "sh_ss_student_union_$c033", "sh_ss_student_union_$c034", "sh_ss_student_union_$c035", "sh_ss_student_union_$c036", "sh_ss_student_union_$c037", "sh_ss_student_union_$c038", "sh_ss_student_union_$c039", "sh_ss_student_union_$c040", "sh_ss_student_union_$c041", "sh_ss_student_union_$c042", "sh_ss_student_union_$c043", "sh_ss_student_union_$c044", "sh_ss_student_union_$c045", "sh_ss_student_union_$c046", "sh_ss_student_union_$c047", "sh_ss_student_union_$c048", "sh_ss_student_union_$c049"}
groups = {"sh_ss_student_union_$GRecruiters", "sh_ss_student_union_$GGuards", "sh_ss_student_union_$GUnion", "sh_ss_student_union_$GSUGUARDS", "sh_ss_student_union_$GSUPEDS", "sh_ss_student_union_$GTruckNDriver", "sh_ss_student_union_$Gfodder"}

--Global Varibles
recruiters_count = 0
recruiters_total = sizeof_table( recruiters )
boss_count = 0
boss_total = sizeof_table( boss )
guards_count = 0
guards_total = sizeof_table ( guards )
groups_total = sizeof_table(groups)
thrower_two = "sh_ss_student_union_$c023"
DOOR_LOCK1="sh_ss_student_union_UnionDoorMM060"
DOOR_LOCK2="sh_ss_student_union_UnionDoorMM050"
DOOR_LOCK3="sh_ss_student_union_UnionDoorMM030"
DOOR_LOCK4="sh_ss_student_union_UnionDoorMM040"

-- CUTSCENES --
-- Added by IdolNinja. These variables are used in the script for the cutscenes for stability instead of calling them directly

	CUTSCENE_IN = 		"sh_ss_student_union_ct1"
	MISSION_NAME =		"sh_ss_student_union"
	MISSION_FAIL =		"sh_ss_student_union_fail"



function sh_ss_student_union_start(checkpoint, is_restart)
	set_mission_author("David Bowring")

	--set character slots cap so that stream resource limits are not breached
	character_slots_cap_for_team( "samedi", 1 )
   character_slots_cap_for_team( "police", 1 )


	if checkpoint == MISSION_START_CHECKPOINT then
		mission_start_fade_out()
		teleport_coop("sh_ss_student_union_$nstart","sh_ss_student_union_$nstart")
		notoriety_set("police", 0)
		notoriety_set_min("samedi", 0)
		notoriety_set_max("samedi", 2)
		notoriety_force_no_spawn("samedi", true)
		--notoriety_set("samedhi", 0)	
		door_lock("sh_ss_student_union_UnionDoorMM010", true)
		door_lock("sh_ss_student_union_UnionDoorMM020", true)
		door_lock("shops_sr2_city_UN_gift_door1", true)
		door_lock("shops_sr2_city_UN_gift_door2", true)
		door_lock(DOOR_LOCK1, true)
		door_lock(DOOR_LOCK2, true)
		door_lock(DOOR_LOCK3, true)
		door_lock(DOOR_LOCK4, true)
		group_create_hidden("sh_ss_student_union_$GRecruiters")
		if (not is_restart) then
			cutscene_play(CUTSCENE_IN)
		end

		group_show("sh_ss_student_union_$GRecruiters")
		--teleport("#PLAYER#","sh_ss_student_union_$nstart")
		--teleport("#PLAYER2#","sh_ss_student_union_$nstart")
		on_trigger("sh_ss_student_union_frontdoor", "sh_ss_student_union_$tfrontdoor")
		on_trigger("sh_ss_student_union_fire", "sh_ss_student_union_$tfire")
		on_trigger("sh_ss_student_union_fire_two", "sh_ss_student_union_$t000")
		trigger_enable("sh_ss_student_union_$tfire", true)
		--group_create("sh_ss_student_union_$GRecruiters", true)
		--release_to_world("sh_ss_student_union_$GRecruiters")

	for i = 1, recruiters_total, 1 do
		marker_add_npc(recruiters[i], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
		on_death("sh_ss_student_union_killcount", recruiters[i])
	end

	--group_create("sh_ss_student_union_$GSUPEDS", true)	
	group_create("sh_ss_student_union_$GGuards", true)
	release_to_world("sh_ss_student_union_$GGuards")

	--removed this group to make sure the stream resource limits are not breached
	--if not group_is_loaded("sh_ss_student_union_$Gfodder") and coop_is_active()== false then
	--	group_create("sh_ss_student_union_$Gfodder", true)
	--end

	if group_is_loaded("sh_ss_student_union_$Gfodder") then
		release_to_world("sh_ss_student_union_$Gfodder")		
	end
	mission_start_fade_in()
	mission_help_table("sh_ss_student_union_Instruct_One")
	objective_text(0, "sh_ss_student_union_Recruiters_Left", recruiters_count, recruiters_total)		
	else
	 fade_in(.2)
	on_trigger("sh_ss_student_union_frontdoor", "sh_ss_student_union_$tfrontdoor")
	on_trigger("sh_ss_student_union_fire", "sh_ss_student_union_$tfire")
	on_trigger("sh_ss_student_union_fire_two", "sh_ss_student_union_$t000")
	for i = 1, boss_total, 1 do
			on_death("sh_ss_student_union_killcount_boss", boss[i])
	end
	sh_ss_student_union_SU()
	end
end


function sh_ss_student_union_fire()
local loop = 1
	
	
	if not character_is_dead("sh_ss_student_union_$c018") then
		move_to_safe("sh_ss_student_union_$c018", "sh_ss_student_union_$n000", 2, true, true)
	end

	if not character_is_dead("sh_ss_student_union_$c037") then
		move_to_safe("sh_ss_student_union_$c037", "sh_ss_student_union_$n037", 2, true, true)
	end

	if not character_is_dead("sh_ss_student_union_$c035") then
		move_to_safe("sh_ss_student_union_$c035", "sh_ss_student_union_$nmove1", 2, true, true)
	end
	
	
	while (character_is_dead("sh_ss_student_union_$c044") == false) do
		--loop = loop +1	
		force_throw_char("sh_ss_student_union_$c044", "#PLAYER#", 0)
		delay(4)
	end
end

function sh_ss_student_union_fire_two()
local loop = 1

	while (character_is_dead("sh_ss_student_union_$c044") == false) do
	--loop = loop +1	
	force_throw_char("sh_ss_student_union_$c023", "#PLAYER#", 0)
	delay(7)
	end
end

function sh_ss_student_union_killcount(char)
	recruiters_count = recruiters_count + 1
	marker_remove_npc(char)
	objective_text_clear(0)
	objective_text(0, "sh_ss_student_union_Recruiters_Left", recruiters_count, recruiters_total)	
	on_death("", char)
	release_to_world(char)

	
	if	(recruiters_count == recruiters_total - 3) then
		--group_create("sh_ss_student_union_$GSUGUARDS", true)
		spawning_pedestrians(false,false) 
		notoriety_set_max("samedi", 3)
		notoriety_set_min("samedi", 3)		
		for i = 1, boss_total, 1 do
			on_death("sh_ss_student_union_killcount_boss", boss[i])
		end	
	end
	
	
	if	(recruiters_count == recruiters_total) then
		--group_create("sh_ss_student_union_$GUnion", false)
		objective_text_clear(0)
		--delay(1)
		mission_set_checkpoint("front")
		sh_ss_student_union_SU()	
	end
end

function	sh_ss_student_union_car()	
	group_create("sh_ss_student_union_$GTruckNDriver")
	vehicle_enter("sh_ss_student_union_$c062", "sh_ss_student_union_$v000", 0)
	vehicle_set_allow_ram_ped("sh_ss_student_union_$v000", true) 
	attack("sh_ss_student_union_$c062")
end



function sh_ss_student_union_swarm(CHAR)	
	move_to(CHAR, "sh_ss_student_union_$nflood", 3)
	attack(CHAR)
	delay(1)
end

function sh_ss_student_union_SU()
	--code for short bus attack	
	group_create("sh_ss_student_union_$GSUGUARDS", true)
	delay(3)
	door_lock("sh_ss_student_union_UnionDoorMM010", false)
	door_lock("sh_ss_student_union_UnionDoorMM020", false)
	door_open("sh_ss_student_union_UnionDoorMM010")
	door_open("sh_ss_student_union_UnionDoorMM020")	
	for i = 1, guards_total, 1 do			
			thread_new("sh_ss_student_union_swarm",guards[i])
	end

	--group_create("sh_ss_student_union_$GSUGUARDS", true)
	group_create("sh_ss_student_union_$Gboss", true)
	delay(3)
	group_create("sh_ss_student_union_$GSUPEDS", true)
	release_to_world("sh_ss_student_union_$GSUPEDS")	
	mission_help_table("sh_ss_student_union_Instruct_Two")
	delay(.5)	
	trigger_enable("sh_ss_student_union_$t000", true)
	trigger_enable("sh_ss_student_union_$tfrontdoor", true)
	marker_add_navpoint("sh_ss_student_union_$nfrontdoor", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)	
	notoriety_set_min("samedi", 3)
	notoriety_set_max("samedi", 3)
	notoriety_force_no_spawn("samedi", false)	
		
	for i = 1, guards_total, 1 do			
		attack(guards[i])
		--move_to(guards[i], "sh_ss_student_union_$nflood", 3)
	end		
end


function sh_ss_student_union_killcount_boss(char)
	boss_count = boss_count + 1
	marker_remove_npc(char)
	objective_text(0, "sh_ss_student_union_Leaders_Left",boss_count, boss_total)
	delay(3)
	--[[
	if char ~= thrower_two then
	release_to_world(char)
	end
	--]]
	if	(boss_count == boss_total) then
		objective_text_clear(0)
		delay(3)
		mission_end_success(MISSION_NAME)
		delay(3)
	end
end


----------------------------------------if you fail, you fail----------------------------------------
function sh_ss_student_union_failure()
	mission_end_failure(MISSION_NAME,MISSION_FAIL)
end

function sh_ss_student_union_success()	
	release_to_world("sh_ss_student_union_$GSUGUARDS")
	--release_to_world("sh_ss_student_union_$GSUPEDS")
	release_to_world("sh_ss_student_union_$GUnion")	
	-- mission_end_success(MISSION_NAME)
end

function sh_ss_student_union_fail()

	

end


function sh_ss_student_union_frontdoor()
	
	--door_open("sh_ss_student_union_MS_C32_FDoor_Store")
	--delay(10)
	door_lock("shops_sr2_city_UN_gift_door1", false)
	door_lock("shops_sr2_city_UN_gift_door2", false)
	door_open("shops_sr2_city_UN_gift_door1")
	door_open("shops_sr2_city_UN_gift_door2")
	--delay(10)
	marker_remove_navpoint("sh_ss_student_union_$nfrontdoor")
	mission_help_table("sh_ss_student_union_Instruct_Three")
	objective_text(0,"sh_ss_student_union_Leaders_Left",boss_count, boss_total)
	group_create("sh_ss_student_union_$GUnion", false)	
	for i = 1, boss_total, 1 do
		marker_add_npc(boss[i], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
		--on_death("sh_ss_student_union_killcount_boss", boss[i])
	end
end

function sh_ss_student_union_cleanup()

	--teleport("#PLAYER#","sh_ss_student_union_$nstart")

	notoriety_set_min("samedi", 0)
	notoriety_set_max("samedi", 5)
	notoriety_set("samedi", 0)
	notoriety_force_no_spawn("samedi", false)
	marker_remove_navpoint("sh_ss_student_union_$nfrontdoor")
	trigger_enable("sh_ss_student_union_$t000", false)
	trigger_enable("sh_ss_student_union_$tfrontdoor", false)
	on_trigger("", "sh_ss_student_union_$tfrontdoor")
	on_trigger("", "sh_ss_student_union_$tfire")
	on_trigger("", "sh_ss_student_union_$t000")
	trigger_enable("sh_ss_student_union_$tfire", false)

	
	for i = 1, boss_total, 1 do
		marker_remove_npc(boss[i], SYNC_ALL)				
	end

	for i = 1, recruiters_total, 1 do
		marker_remove_npc(recruiters[i], SYNC_ALL)			
	end	

	for i=1, groups_total, 1 do
		if(group_is_loaded(groups[i])) then
			release_to_world(groups[i])
		end
	end
	character_slots_clear_caps()
	door_close("sh_ss_student_union_UnionDoorMM010")
	door_close("sh_ss_student_union_UnionDoorMM020")	
	objective_text_clear(0)
end
