-- Cutscene crash fixes by IdolNinja
-- 3/12/2011


-- TABLES ------

Yakuza_1stfloor = {"sh_rn_rec_center_$c1stfloor001","sh_rn_rec_center_$c1stfloor002","sh_rn_rec_center_$c1stfloor003","sh_rn_rec_center_$c1stfloor004","sh_rn_rec_center_$c1stfloor005","sh_rn_rec_center_$c1stfloor006","sh_rn_rec_center_$c1stfloor007","sh_rn_rec_center_$c1stfloor008","sh_rn_rec_center_$c1stfloor009","sh_rn_rec_center_$c1stfloor010","sh_rn_rec_center_$c1stfloor011","sh_rn_rec_center_$c1stfloor012","sh_rn_rec_center_$c1stfloor013","sh_rn_rec_center_$c1stfloor014","sh_rn_rec_center_$c1stfloor015","sh_rn_rec_center_$c1stfloor016", "sh_rn_rec_center_GaurdDoor"}
Yakuza_Reinforcements = {"sh_rn_rec_center_$cReinf000","sh_rn_rec_center_$cReinf001","sh_rn_rec_center_$cReinf002","sh_rn_rec_center_$cReinf003","sh_rn_rec_center_$cReinf004","sh_rn_rec_center_$cReinf005","sh_rn_rec_center_$cReinf006","sh_rn_rec_center_$cReinf007","sh_rn_rec_center_$cReinf008","sh_rn_rec_center_$cReinf009","sh_rn_rec_center_$cReinf010","sh_rn_rec_center_$cReinf011"}
Ambient_NPC ={"sh_rn_rec_center_$c000", "sh_rn_rec_center_$c001", "sh_rn_rec_center_$c002", "sh_rn_rec_center_$c003"} 
doors = {"sh_rn_rec_center_FrontDoor1", "sh_rn_rec_center_FrontDoor2", "sh_rn_rec_center_DoorToBack","sh_rn_rec_center_DoorToCas1A", "sh_rn_rec_center_DoorToCas2B", "sh_rn_rec_center_ExitCas1A", "sh_rn_rec_center_ExitCas1B", "sh_rn_rec_center_DoorToJail", "sh_rn_rec_center_CellDoor", "sh_rn_rec_center_DoorCas2B", "sh_rn_rec_center_DoorToCas2B", "sh_rn_rec_center_ExitCas2", "sh_rn_rec_center_GaurdDoor"}
boxes = {"sh_rn_rec_center_SE_REC_MoneyBoxA110", "sh_rn_rec_center_SE_REC_MoneyBoxA120", "sh_rn_rec_center_SE_REC_MoneyBoxA100", "sh_rn_rec_center_SE_REC_MoneyBoxA090", "sh_rn_rec_center_SE_REC_MoneyBoxA080", "sh_rn_rec_center_SE_REC_MoneyBoxA030", "sh_rn_rec_center_SE_REC_MoneyBoxA020", "sh_rn_rec_center_SE_REC_MoneyBoxA010", "sh_rn_rec_center_SE_REC_MoneyBoxA040", "sh_rn_rec_center_SE_REC_MoneyBoxA070", "sh_rn_rec_center_SE_REC_MoneyBoxA060", "sh_rn_rec_center_SE_REC_MoneyBoxA050"}
GROUPS ={"sh_rn_rec_center_saintagent", "sh_rn_rec_center_1stfloor_guards", "sh_rn_rec_center_casino_guards1", "sh_rn_rec_center_casino_guards2", "sh_rn_rec_center_casino_patrons1", "sh_rn_rec_center_casino_patrons2", "sh_rn_rec_center_captured_saint", "sh_rn_rec_center_hos", "sh_rn_rec_center_johns", "sh_rn_rec_center_1stfloor", "sh_rn_rec_center_reinf1"}

--- GLOBAL VARIABLES ------
boxes_count = 0
boxes_total = sizeof_table( boxes )
Yakuza_1stfloor_count = 0
Yakuza_1stfloor_total = sizeof_table( Yakuza_1stfloor )
Reinforcements_count = 0
Reinforcements_total = sizeof_table( Yakuza_Reinforcements )
door_count = 0 
door_total = sizeof_table( doors )
Process_thread_handle = 0
groups_total = sizeof_table( GROUPS )
total_destroyed = 0
destroyed_value = 3473
destroyed_target = 100000


-- CUTSCENES --
-- Added by IdolNinja. These variables are used in the script for the cutscenes for stability instead of calling them directly

	CUTSCENE_IN = 		"sh_rn_rec_center_ct1"
	CUTSCENE_MID =		"strongholds_rec_scene2"
	MISSION_NAME =		"sh_rn_rec_center"
	MISSION_FAIL_BETRAY =	"MSN_SH_RN_REC_CENTER_FAIL_BETRAY"
	MISSION_FAIL =		"sh_rn_rec_center_fail"

----------------------------------------very first set of stuff to do when starting-------------------
function sh_rn_rec_center_start(checkpoint, is_restart)
	set_mission_author("David Bowring with First Pass by Scott Phillips")
	for i = 1, door_total, 1 do
		door_close(doors[i])
	end

if checkpoint == MISSION_START_CHECKPOINT	then
	door_lock("sh_rn_rec_center_LOCKTHIS", true)
	group_create("sh_rn_rec_center_1stfloor_guards", true)
	mission_start_fade_out()
	teleport_coop("sh_rn_rec_center_$nstart","sh_rn_rec_center_$nstart", true)
	on_projectile_hit("sh_rn_rec_center_satchel")
	notoriety_set("police", 0)
	notoriety_set_max("police", 0)
	notoriety_set("ronin", 0)
	notoriety_set_max("ronin", 0)
	on_trigger("sh_rn_rec_center_talk_to_agent", "sh_rn_rec_center_$t000")
--	on_trigger("sh_rn_rec_center_TEMP_TELEPORT", "sh_rn_rec_center_$tTEMP")  --!!!!TEMP!!! 
	on_trigger("sh_rn_rec_center_locker_room", "sh_rn_rec_center_$t001")
	on_trigger("sh_rn_rec_center_past_guards", "sh_rn_rec_center_$tpast_guards")
	on_trigger("sh_rn_rec_center_stairs_entrance", "sh_rn_rec_center_$tstairs_entrance")
	on_trigger("sh_rn_rec_center_casino_entrance", "sh_rn_rec_center_$tcasino_entrance")
	on_trigger("sh_rn_rec_center_open_cell", "sh_rn_rec_center_$topen_cell")
	on_trigger("sh_rn_rec_center_casino_2", "sh_rn_rec_center_$tcasino_2")
	on_trigger("sh_rn_rec_center_brothel_entrance", "sh_rn_rec_center_$tbrothel_entrance")
	on_trigger("sh_rn_rec_center_elevator", "sh_rn_rec_center_$televator")		
	--door_lock("sh_rn_rec_center_FrontDoor2", true)
	door_lock("sh_rn_rec_center_DoorToBack", true)
	door_lock("sh_rn_rec_center_GaurdDoor", true)
	--door_lock("sh_rn_rec_center_DoorToCas1A", true)
	--door_lock("sh_rn_rec_center_DoorToCas2B", true)
	door_lock("sh_rn_rec_center_ExitCas1A", true)
	door_lock("sh_rn_rec_center_ExitCas1B", true)
	door_lock("sh_rn_rec_center_DoorToJail", true)
	door_lock("sh_rn_rec_center_CellDoor", true)
	door_lock("sh_rn_rec_center_DoorCas2B", true)
	door_lock("sh_rn_rec_center_DoorToCas2A", true)
	door_lock("sh_rn_rec_center_ExitCas2", true)
	trigger_enable("sh_rn_rec_center_$t000", true)
--	trigger_enable("sh_rn_rec_center_$tTEMP", true) --!!!!TEMP!!!
--	trigger_enable("sh_rn_rec_center_$tbrothel_entrance", true) --!!!!TEMP!!! this should be called after machines are destroyed, but until they work this is here
--	trigger_enable("sh_rn_rec_center_$televator", true) --!!!!TEMP!!! this is normally called after the johns are killed	
	fade_out(.1)	

	group_create_hidden("sh_rn_rec_center_saintagent")
	if (not is_restart) then
		cutscene_play(CUTSCENE_IN)	
	end
	--
	--cutscene_play(CUTSCENE_MID)
	--delay(10)
	group_show("sh_rn_rec_center_saintagent")
-------create agent and if the player kills her before she's in the party the player fails	
--	group_create("")
	npc_suppress_persona("sh_rn_rec_center_$cSaintAgent", true)
	on_death("sh_rn_rec_center_failure","sh_rn_rec_center_$cSaintAgent")
	set_unrecruitable_flag("sh_rn_rec_center_$cSaintAgent", true)
	mission_help_table("sh_rn_rec_center_meet_agent")  --TEXT: Meet the 3rd Street Saint agent
	marker_add_npc("sh_rn_rec_center_$cSaintAgent", MINIMAP_ICON_PROTECT_ACQUIRE, INGAME_EFFECT_PROTECT_ACQUIRE)	
	if (not character_is_dead("sh_rn_rec_center_$cSaintAgent")) then
		move_to("sh_rn_rec_center_$cSaintAgent","sh_rn_rec_center_$t000", 1, true)
	end
	mission_start_fade_in()
	else
		sh_rn_rec_center_elevator()
	end
end


function sh_rn_rec_center_satchel(type, name, weapon)
--mission_debug("type=  "..type)
--mission_debug("name=  "..name)
--mission_debug("weapon=  "..weapon)

	if type == "human" and name == "sh_rn_rec_center_$cSaintAgent" and weapon == "satchel" then
	mission_end_failure(MISSION_NAME,MISSION_FAIL_BETRAY)
	end

end
----------------------------------------TEMP FUNCTION TO TELEPORT PAST THE SCREWED UP COLLISION IN LOBBY ----------------------------------------
function sh_rn_rec_center_TEMP_TELEPORT()
	teleport(LOCAL_PLAYER,"sh_rn_rec_center_$t001")
end

----------------------------------------after talking to agent-------------------
function sh_rn_rec_center_talk_to_agent()
	trigger_enable("sh_rn_rec_center_$t001", true)
	marker_remove_npc("sh_rn_rec_center_$cSaintAgent")
	turn_to_char("sh_rn_rec_center_$cSaintAgent","#PLAYER#")
	Process_thread_handle = thread_new("sh_rn_rec_center_saint_dialog")
	action_play("sh_rn_rec_center_$cSaintAgent", "compliment d")	
	set_unrecruitable_flag("sh_rn_rec_center_$cSaintAgent", false)	
end


----------------------------------------while talking to agent-------------------
function sh_rn_rec_center_saint_dialog()
	local saint_talking
	saint_talking = audio_play_for_character("AMTSS3_RN_STRONG_REC_01","sh_rn_rec_center_$cSaintAgent", "voice", false, false) --VOICE: Hey Boss. I think the Yakuza are set up somewhere in the Sauna room. Yakuza go in, but nobody comes out.

	while (audio_is_playing(saint_talking)) do
		thread_yield()
	end
	
	if (not character_is_dead("sh_rn_rec_center_$cSaintAgent")) then
		party_add("sh_rn_rec_center_$cSaintAgent")
		marker_add_navpoint("sh_rn_rec_center_$t001", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
		mission_help_table("MSN_SH_RN_REC_CENTER_BACK_ROOM")
		npc_suppress_persona("sh_rn_rec_center_$cSaintAgent", false)
		npc_unholster_best_weapon("sh_rn_rec_center_$cSaintAgent")	
		--audio_play_for_character("FRANK_SHPLACEHOLDER_2","#PLAYER#", "foley", false, false)  --VOICE: Alright, let's mount up.
		on_death("","sh_rn_rec_center_$cSaintAgent")  --turn off death failure for agent
	end
	
	
	
end


----------------------------------------at the entrance to the locker room-------------------
function sh_rn_rec_center_locker_room()
--unlock rec locker rooms doors
	door_lock("sh_rn_rec_center_DoorToBack",false)
	door_lock("sh_rn_rec_center_GaurdDoor",false)
	marker_remove_navpoint("sh_rn_rec_center_$t001")
	trigger_enable("sh_rn_rec_center_$t001", false)	
	npc_unholster_best_weapon("sh_rn_rec_center_$cyak1-1")
	npc_unholster_best_weapon("sh_rn_rec_center_$cyak1-2")
	--npc_suppress_persona("sh_rn_rec_center_$cyak1-1", true)
	--npc_suppress_persona("sh_rn_rec_center_$cyak1-2", true)	
	--audio_play_for_character("sh_rn_rec_center_$cyak1-1", "threat - alert (solo attack)") 
	trigger_enable("sh_rn_rec_center_$tstairs_entrance", true)
	marker_add_navpoint("sh_rn_rec_center_$tstairs_entrance", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
	mission_help_table("sh_rn_rec_center_locker_room")  --TEXT: Find the underground Yakuza racket.
end



----------------------------------------at the door to the basement stairs with 2 guards they tell player to get lost-------------------
function sh_rn_rec_center_stairs_entrance()
	marker_remove_navpoint("sh_rn_rec_center_$tstairs_entrance")
	trigger_enable("sh_rn_rec_center_$tcasino_entrance", true)
	trigger_enable("sh_rn_rec_center_$tpast_guards", true)
	audio_play_for_character("AMRON1_RN_STRONG_REC","sh_rn_rec_center_$cyak1-1", "voice", false, false)
	turn_to_char("sh_rn_rec_center_$cyak1-1","#PLAYER#")
	audio_play_for_character("AMRON1_RN_STRONG_REC","sh_rn_rec_center_$cyak1-1", "foley", false, false) --VOICE: Get Lost
	action_play("sh_rn_rec_center_$cyak1-1", "insult a")
end


----------------------------------------if player passes the 2 guards at top of basement stairs they attack and set notoriety to 2-------------------
function sh_rn_rec_center_past_guards()
	npc_suppress_persona("sh_rn_rec_center_$cyak1-1", false)
	npc_suppress_persona("sh_rn_rec_center_$cyak1-2", false)
	attack("sh_rn_rec_center_$cyak1-1","sh_rn_rec_center_$cSaintAgent") --set the first two guards to attack if they haven't already
	attack("sh_rn_rec_center_$cyak1-2",LOCAL_PLAYER)--	delay(2)
end 


----------------------------------------at the entrance to the casino everything gets set up and player gets objectives-------------------
function sh_rn_rec_center_casino_entrance()
	
	
		
	--Spawn casino patrons 
	group_create("sh_rn_rec_center_casino_patrons1")
	mission_help_table("sh_rn_rec_center_casino_entrance")  --TEXT: Destroy the Yakuza casino machines. -- replace with TEXT: DESTROY 100,000 Dollars worth of stuff
	objective_text(0, "sh_rn_rec_center_casino",total_destroyed, destroyed_target)
	--objective_text(0, "sh_rn_rec_center_casino", Casino_machines_count, Casino_machines_total)
	trigger_enable("sh_rn_rec_center_$tstairs_entrance", false)
	trigger_enable("sh_rn_rec_center_$tcasino_2", false)	
	--marker_add_trigger("sh_rn_rec_center_$topen_jail", ,INGAME_EFFECT_LOCATION)
	on_trigger("sh_rn_rec_center_open_cell", "sh_rn_rec_center_$topen_jail")
	group_create("sh_rn_rec_center_captured_saint")
	set_unrecruitable_flag("sh_rn_rec_center_$ccaptured_saint", true)
	delay(1)	
	trigger_enable("sh_rn_rec_center_$topen_cell", true) 
	---adding this for mayhem gameplay
	mission_debug("ods called")
	on_random_ods_killed("sh_rn_rec_center_casino_killcount", MISSION_NAME)	
	while total_destroyed < destroyed_target do	
		thread_yield()	
	end		
		on_random_ods_killed("", MISSION_NAME)
		mission_debug("PROCEED")
		objective_text_clear(0)
		delay(1)
		--trigger_enable("sh_rn_rec_center_$tbrothel_entrance", true)		
		--objective_text_clear(0)
		sh_rn_rec_center_casinoTwo()	
end




function sh_rn_rec_center_casino_killcount(attacker, mover_type, X, Y, Z)
	local part_one_done =false
	local groupone = {"sh_rn_rec_center_$ccasino_guard008", "sh_rn_rec_center_$ccasino_guard004", "sh_rn_rec_center_$ccasino_guard001", "sh_rn_rec_center_$ccasino_guard003",  "sh_rn_rec_center_$ccasino_guard005", "sh_rn_rec_center_$ccasino_guard002"}
	local groupone_total = sizeof_table( groupone )
	mission_debug("Kill Called")
	--Casino_machines_count = Casino_machines_count + 1
	--marker_remove_mover(mesh)

	
	if	(total_destroyed >= destroyed_target) then
		part_one_done = true
		--objective_text_clear(0)
		--delay(1)
		--trigger_enable("sh_rn_rec_center_$tbrothel_entrance", true)
		--on_random_ods_killed("", MISSION_NAME)
		--objective_text_clear(0)
		--sh_rn_rec_center_casinoTwo()	
	end

	if part_one_done == false then
		total_destroyed = total_destroyed+destroyed_value 
		objective_text(0, "sh_rn_rec_center_casino",total_destroyed, destroyed_target)
	end
	
	
	
	--wait until player starts busting up shit to spawn bad guys
	if (total_destroyed == (destroyed_value*2)) then 
	group_create("sh_rn_rec_center_$Gjail_guards")
	group_create("sh_rn_rec_center_casino_guards1", true)		
	npc_suppress_persona("sh_rn_rec_center_$ccaptured_saint", true)	
	notoriety_set_max("ronin",2)
	notoriety_set_min("ronin",2)
	notoriety_set("ronin",2)
	
	--notoriety_set_desired_vehicle_count("0", "ronin")
	--Open doors for guards to charge out
	door_open("sh_rn_rec_center_ExitCas1A")
	door_open("sh_rn_rec_center_ExitCas1B")
	--Move gang members into the room
		if (group_is_loaded("sh_rn_rec_center_casino_guards1")) then
			for i = 1, groupone_total, 1 do			
				if   character_is_dead(groupone[i]) ~= true then					
					thread_new("sh_rn_rec_center_movenattack", groupone[i])
				end
			end
		end
	end

	

	
	--mesh_mover_hide(mesh)
end

function sh_rn_rec_center_movenattack(char)
	move_to_safe(char,"sh_rn_rec_center_$nCasone", 3)
	attack(char)
	return
end

function sh_rn_rec_center_casinoTwo()	
	total_destroyed = 0
	destroyed_value = 0
	trigger_enable("sh_rn_rec_center_$tcasino_2", true)	
	mission_help_table("sh_rn_rec_center_casino_nextroom")  --TEXT: Conintue on to the next room.
	door_lock("sh_rn_rec_center_DoorCas2B",false)
	door_lock("sh_rn_rec_center_DoorToCas2A",false)	
end






function sh_rn_rec_center_casino_killcountTwo(attacker, mover_type, X, Y, Z)		
	objective_text(0, "sh_rn_rec_center_casinoTwo", total_destroyed, destroyed_target)
	
	if position_is_in_trigger("sh_rn_rec_center_$tAreaTwo", X, Y, Z) then
		total_destroyed = total_destroyed+destroyed_value
		if	(total_destroyed >= destroyed_target) then
			on_random_ods_killed("", MISSION_NAME)
			objective_text_clear(0)
			delay(1)
			trigger_enable("sh_rn_rec_center_$tbrothel_entrance", true)
			marker_add_navpoint("sh_rn_rec_center_$tbrothel_entrance", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
			mission_help_table("sh_rn_rec_center_brothel_goto")  --TEXT: Continue on to the Brothel.
		---keep the brothel door locked until this is true
			door_lock("sh_rn_rec_center_ExitCas2",false)
		end	
	end
end









----------------------------------------prison cell with saint----------------------------------------
function sh_rn_rec_center_open_cell(name)
--unlock the cell door meshmover
	marker_remove_navpoint("sh_rn_rec_center_$topen_jail")
	trigger_enable("sh_rn_rec_center_$topen_jail", false)
	trigger_enable("sh_rn_rec_center_$topen_cell", false)
	door_lock("sh_rn_rec_center_CellDoor",false)
	door_open("sh_rn_rec_center_CellDoor")
	npc_suppress_persona("sh_rn_rec_center_$ccaptured_saint", false)
	set_unrecruitable_flag("sh_rn_rec_center_$ccaptured_saint", false)
	party_add_optional("sh_rn_rec_center_$ccaptured_saint", name)
	door_lock("sh_rn_rec_center_DoorToJail",false)
	door_open("sh_rn_rec_center_DoorToJail")
end

----------------------------------------spawn groups in second casino area----------------------------------------
function sh_rn_rec_center_casino_2()
	destroyed_value = 3973
	group_create("sh_rn_rec_center_casino_guards2")
	group_create("sh_rn_rec_center_casino_patrons2")
	trigger_enable("sh_rn_rec_center_$tcasino_2", false)
	on_random_ods_killed("sh_rn_rec_center_casino_killcountTwo", MISSION_NAME)
	objective_text(0, "sh_rn_rec_center_casinoTwo", total_destroyed, destroyed_target)
end


----------------------------------------just inside the brothel area----------------------------------------
function sh_rn_rec_center_brothel_entrance()

	marker_remove_navpoint("sh_rn_rec_center_$tbrothel_entrance")
	group_create("sh_rn_rec_center_johns")
	group_create("sh_rn_rec_center_hos")	
	mission_help_table("sh_rn_rec_center_brothel_entrance")  --TEXT: Kill the johns visiting the prostitutes.
	objective_text(0, "sh_rn_rec_center_johns",boxes_count, boxes_total )

	for i = 1, boxes_total, 1 do
		marker_add_mover(boxes[i], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
		on_mover_destroyed("sh_rn_rec_center_boxes_killcount", boxes[i])
	end
end

function sh_rn_rec_center_boxes_killcount(mesh)
	boxes_count = boxes_count + 1
	marker_remove_mover(mesh)
	objective_text(0, "sh_rn_rec_center_johns",boxes_count, boxes_total )

	if (boxes_count == boxes_total) then
	--keep the elevator door locked until this happens
	objective_text_clear(0)
	delay(3)
	trigger_enable("sh_rn_rec_center_$televator", true)
	marker_add_navpoint("sh_rn_rec_center_$televator", MINIMAP_ICON_LOCATION, INGAME_EFFECT_LOCATION)
	mission_help_table("sh_rn_rec_center_elevator") -- TEXT: Take the elevator back to the 1st floor
   mission_set_checkpoint("rec 2")
	end
end





----------------------------------------inside the elevator spawn reinforcements-------------------
function sh_rn_rec_center_elevator()
	marker_remove_navpoint("sh_rn_rec_center_$televator")
	marker_remove_navpoint("sh_rn_rec_center_$topen_jail")
	local groups_to_destroy = {"sh_rn_rec_center_$Gjail_guards", "sh_rn_rec_center_casino_guards1", "sh_rn_rec_center_casino_guards2", "sh_rn_rec_center_casino_patrons1", "sh_rn_rec_center_casino_patrons2", "sh_rn_rec_center_hos", "sh_rn_rec_center_johns"}
	local groups_to_destroy_total = sizeof_table(groups_to_destroy)
	delay(1)
	--Cleaning up previous groups to clear spots for next round 
	
	for i = 1, groups_to_destroy_total, 1 do
		if group_is_loaded(groups_to_destroy[i]) then
			release_to_world(groups_to_destroy[i])		
		end
	end

	mission_start_fade_out(.5)
	group_create("sh_rn_rec_center_reinf1",true)	
	teleport_coop("sh_rn_rec_center_$nelevator_teleport","sh_rn_rec_center_$nelevator_teleport (0)", true)
	sh_rn_rec_center_reinforcement_cutscene()
	while group_is_loaded("sh_rn_rec_center_reinf1") == false do
	thread_yield()
	end
	mission_start_fade_in(.5)
	objective_text(0, "sh_rn_rec_center_reinforcements_killcount", Reinforcements_count, Reinforcements_total)
	mission_help_table("sh_rn_rec_center_reinforcements")  --TEXT: Kill all Yakuza reinforcements!

		-------add markers and decrement the counter when one is killed
	for i = 1, Reinforcements_total, 1 do
		marker_add_npc(Yakuza_Reinforcements[i], MINIMAP_ICON_KILL, INGAME_EFFECT_KILL)
		on_death("sh_rn_rec_center_killcount", Yakuza_Reinforcements[i])
	end

end


----------------------------------------Reinforcements objective text kill counter----------------------------------------
function sh_rn_rec_center_killcount(char)
	Reinforcements_count = Reinforcements_count + 1
	marker_remove_npc(char)
	on_death("",char)
	release_to_world(char)
	objective_text(0, "sh_rn_rec_center_reinforcements_killcount", Reinforcements_count, Reinforcements_total)

	if (Reinforcements_count == Reinforcements_total) then
	delay(3)
	mission_end_success(MISSION_NAME)	
	end
end

----------------------------------------Reinforcements arrival cutscene----------------------------------------
function sh_rn_rec_center_reinforcement_cutscene()
	
	thread_new("sh_rn_rec_center_exit_car_run", "sh_rn_rec_center_$cReinf000", "sh_rn_rec_center_$nreinf_move1")
	thread_new("sh_rn_rec_center_exit_car_run", "sh_rn_rec_center_$cReinf001", "sh_rn_rec_center_$nreinf_move2")
	thread_new("sh_rn_rec_center_exit_car_run", "sh_rn_rec_center_$cReinf002", "sh_rn_rec_center_$nreinf_move3")
	thread_new("sh_rn_rec_center_exit_car_run", "sh_rn_rec_center_$cReinf003", "sh_rn_rec_center_$nreinf_move4")
	thread_new("sh_rn_rec_center_exit_car_run", "sh_rn_rec_center_$cReinf004", "sh_rn_rec_center_$nreinf_move5")
	thread_new("sh_rn_rec_center_exit_car_run", "sh_rn_rec_center_$cReinf005", "sh_rn_rec_center_$nreinf_move6")
	thread_new("sh_rn_rec_center_exit_car_run", "sh_rn_rec_center_$cReinf006", "sh_rn_rec_center_$nreinf_move7")
	thread_new("sh_rn_rec_center_exit_car_run", "sh_rn_rec_center_$cReinf007", "sh_rn_rec_center_$nreinf_move8")
	thread_new("sh_rn_rec_center_exit_car_run", "sh_rn_rec_center_$cReinf008", "sh_rn_rec_center_$nreinf_move9")
	thread_new("sh_rn_rec_center_exit_car_run", "sh_rn_rec_center_$cReinf009", "sh_rn_rec_center_$nreinf_move10")
	thread_new("sh_rn_rec_center_exit_car_run", "sh_rn_rec_center_$cReinf010", "sh_rn_rec_center_$nreinf_move11")
	thread_new("sh_rn_rec_center_exit_car_run", "sh_rn_rec_center_$cReinf011", "sh_rn_rec_center_$nreinf_move12")

end


----------------------------------------Final reinforcements that arrive in vehicles/on foot-------------------
function sh_rn_rec_center_reinforcements()
	--spawn reinforcements, drive car to location, get out and attack
	
--[[	
	character_add_vehicle("sh_rn_rec_center_$cReinf000", "sh_rn_rec_center_$v000", 0)
	character_add_vehicle("sh_rn_rec_center_$cReinf001", "sh_rn_rec_center_$v000", 1)
	character_add_vehicle("sh_rn_rec_center_$cReinf002", "sh_rn_rec_center_$v001", 0)
	character_add_vehicle("sh_rn_rec_center_$cReinf003", "sh_rn_rec_center_$v001", 1)
	character_add_vehicle("sh_rn_rec_center_$cReinf004", "sh_rn_rec_center_$vbike04", 0)
	character_add_vehicle("sh_rn_rec_center_$cReinf005", "sh_rn_rec_center_$vbike05", 0)
	character_add_vehicle("sh_rn_rec_center_$cReinf006", "sh_rn_rec_center_$vbike06", 0)
	character_add_vehicle("sh_rn_rec_center_$cReinf007", "sh_rn_rec_center_$vbike07", 0)
	character_add_vehicle("sh_rn_rec_center_$cReinf008", "sh_rn_rec_center_$vbike08", 0)
	character_add_vehicle("sh_rn_rec_center_$cReinf009", "sh_rn_rec_center_$vbike09", 0)
	character_add_vehicle("sh_rn_rec_center_$cReinf010", "sh_rn_rec_center_$vbike010", 0)
	character_add_vehicle("sh_rn_rec_center_$cReinf011", "sh_rn_rec_center_$vbike011", 0)

	thread_new("sh_rn_rec_center_vehicle_go","sh_rn_rec_center_$v000", "sh_rn_rec_center_$nyak_carstop")
	thread_new("sh_rn_rec_center_vehicle_go","sh_rn_rec_center_$v001", "sh_rn_rec_center_$nyak_carstop2")
	thread_new("sh_rn_rec_center_vehicle_go","sh_rn_rec_center_$vbike04", "sh_rn_rec_center_$nyak_carstop3")
	thread_new("sh_rn_rec_center_vehicle_go","sh_rn_rec_center_$vbike05", "sh_rn_rec_center_$nyak_carstop3")
	thread_new("sh_rn_rec_center_vehicle_go","sh_rn_rec_center_$vbike06", "sh_rn_rec_center_$nyak_carstop3")
	thread_new("sh_rn_rec_center_vehicle_go","sh_rn_rec_center_$vbike07", "sh_rn_rec_center_$nyak_carstop3")
	thread_new("sh_rn_rec_center_vehicle_go","sh_rn_rec_center_$vbike08", "sh_rn_rec_center_$nyak_carstop3")
	thread_new("sh_rn_rec_center_vehicle_go","sh_rn_rec_center_$vbike09", "sh_rn_rec_center_$nyak_carstop3")
	thread_new("sh_rn_rec_center_vehicle_go","sh_rn_rec_center_$vbike010", "sh_rn_rec_center_$nyak_carstop3")
	thread_new("sh_rn_rec_center_vehicle_go","sh_rn_rec_center_$vbike011", "sh_rn_rec_center_$nyak_carstop3")
--]]
end

----------------------------------------Force all vehicles to pathfind at the same time for cutscene----------------------------------------
function sh_rn_rec_center_vehicle_go(car, nav)
	vehicle_pathfind_to(car, nav, true, true)
end


----------------------------------------Everybody teleport out of your vehicle and engage----------------------------------------
function sh_rn_rec_center_exit_car_run(npc, nav)
	--vehicle_exit(npc)	
	teleport(npc, nav)
	turn_vulnerable(npc)
	npc_unholster_best_weapon(npc)
	npc_combat_enable(npc, true)
	set_always_sees_player_flag(npc, true)
end



----------------------------------------if you fail, you fail----------------------------------------
function sh_rn_rec_center_failure()
	mission_end_failure(MISSION_NAME,MISSION_FAIL)
end

function sh_rn_rec_center_success()
	--release_to_world("sh_rn_rec_center_reinf_vehicles")
end

----------------------------------------stuff to do when winning/losing/quitting the mission----------------------------------------
function sh_rn_rec_center_cleanup()
	teleport("#PLAYER#","sh_rn_rec_center_$nstart")
	notoriety_set_min("ronin", 0)
	notoriety_set("police", 0)
	notoriety_set("ronin", 0)
	party_dismiss_all()
	marker_remove_npc("sh_rn_rec_center_$cSaintAgent")
	on_death("","sh_rn_rec_center_$cSaintAgent")
	door_lock("sh_rn_rec_center_LOCKTHIS",false)
	marker_remove_navpoint("sh_rn_rec_center_$tstairs_entrance")
	marker_remove_navpoint("sh_rn_rec_center_$televator")
	marker_remove_navpoint("sh_rn_rec_center_$topen_jail")
	marker_remove_navpoint("sh_rn_rec_center_$t001")
	on_trigger("", "sh_rn_rec_center_$t000")
	on_trigger("", "sh_rn_rec_center_$t001")
	on_trigger("", "sh_rn_rec_center_$tpast_guards")
	on_trigger("", "sh_rn_rec_center_$tstairs_entrance")
	on_trigger("", "sh_rn_rec_center_$tcasino_entrance")
	on_trigger("", "sh_rn_rec_center_$topen_cell")
	on_trigger("", "sh_rn_rec_center_$tcasino_2")
	on_trigger("sh_rn_rec_center_brothel_entrance", "sh_rn_rec_center_$tbrothel_entrance")
	on_trigger("sh_rn_rec_center_elevator", "sh_rn_rec_center_$televator")
	door_lock("sh_rn_rec_center_LOCKTHIS", false)
	--persona_override_group_stop(RONIN_PERSONAS,POT_SITUATIONS[POT_ATTACK])
	on_projectile_hit("")
	for i = 1, door_total, 1 do
		door_close(doors[i])
	end
	objective_text_clear(0)
	spawning_vehicles(true)		
	--Casino_machines_count = 0
	Reinforcements_count = 0	
	for i = 1, boxes_total, 1 do
		marker_remove_mover(boxes[i])
	end

	for i = 1, Reinforcements_total, 1 do
		marker_remove_npc(Yakuza_Reinforcements[i])
	end

	
	for i = 1, groups_total, 1 do
		 if ( group_is_loaded( GROUPS[i] ) ) then
			release_to_world( GROUPS[i] )
		end
	end

	if Process_thread_handle ~= "" then
	thread_kill( Process_thread_handle )
	end
	on_random_ods_killed("", MISSION_NAME)
end

function sh_rn_rec_center_unlock()

	

end



	
