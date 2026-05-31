-- sr2_city.lua: Master Lua Script for Saints Row 2 (3/28/07) with Sandbox++

-- Sandbox++ Options [nclok1405]

-- Enable cops shooting from vehicle by default
SPP_OPTIONS_COP_DRIVEBY = true
-- Show lightcone for CD Finder
SPP_OPTIONS_SHOW_LIGHTCONE_FOR_CD_FINDER = true

--[[

How the new key sequences work in-game:

The player presses 888 which displays a message on the HUD that it is ready for input (a 3 digit code)
The player then enters a 3 digit code and presto change-o it will run whatever commands are there for the section
of the conditional block that resolves. If it fails to resolve, it will show a message on the HUD that it failed
and reset the input sequence so the user has to start again with 111 and then his 3 digit code.

Yes, the code is a bit messy. But it's the only way I could think of to make it work with player_button_just_pressed()
which seems to be the only function that's available to capture input in the open world. I would much rather have done
a toggle/pivot like the SRTT Sandbox+ but we're kind of stuck with a sequenced code (at least for now.) -IdolNinja

]]

-- New thread to grab keyboard input for Sandbox+
Keycombo_Handle = INVALID_THREAD_HANDLE

-- Key bind variables
PC_BTN_MOVE_UP = 0
PC_BTN_MOVE_DOWN = 1
PC_BTN_MOVE_LEFT = 2
PC_BTN_MOVE_RIGHT = 3
PC_BTN_ACTION = 4
PC_BTN_JUMP = 5
PC_BTN_RADIAL = 6
PC_BTN_BREAK = 7
PC_DPAD_RIGHT = 8
PC_DPAD_UP = 9
PC_DPAD_LEFT = 10
PC_DPAD_DOWN = 11
PC_BTN_START = 12
PC_BTN_BACK = 13
PC_BTN_RELOAD = 14
PC_BTN_CROUCH = 15
PC_BTN_FINE_AIM = 16
PC_BTN_GRAB_HUMAN = 17
PC_BTN_SPRINT = 18
PC_BTN_BLOCK = 19
PC_BTN_MAP = 20
PC_BTN_PAUSE = 21
PC_BTN_HORN = 26
PC_BTN_CRUISE = 27
PC_BTN_RESET_CAMERA = 28
PC_BTN_RADIO_PREV = 29
PC_BTN_RADIO_NEXT = 30
PC_BTN_LOOK_RIGHT = 31
PC_BTN_LOOK_LEFT = 32
PC_WPN_SWITCH_UP = 33
PC_WPN_SWITCH_DOWN = 34
PC_BTN_ATTACK = 35
PC_BTN_ATTACK2 = 36
PC_BTN_ACCELERATE = 37
PC_BTN_REVERSE = 38
PC_BTN_SELECT_WEAPON_1 = 39
PC_BTN_SELECT_WEAPON_2 = 40
PC_BTN_SELECT_WEAPON_3 = 41
PC_BTN_SELECT_WEAPON_4 = 42
PC_BTN_SELECT_WEAPON_5 = 43
PC_BTN_SELECT_WEAPON_6 = 44
PC_BTN_SELECT_WEAPON_7 = 45
PC_BTN_SELECT_WEAPON_8 = 46
PC_BTN_HELI_TURN_LEFT = 47
PC_BTN_HELI_TURN_RIGHT = 48
PC_BTN_VEHICLE_LOOK_BEHIND = 49
PC_BTN_AIR_ACCELERATE = 50
PC_BTN_AIR_DECELERATE = 51
PC_BTN_RECRUIT = 52
PC_BTN_CANCEL = 53
PC_BTN_TAUNT = 54
PC_BTN_COMPLIMENT = 55
PC_BTN_HYDRAULICS = 56
PC_BTN_NITRO = 57
PC_BTN_FIGHT_CLUB_MASH_1 = 58
PC_BTN_FIGHT_CLUB_MASH_2 = 59
PC_BTN_FIGHT_CLUB_MASH_3 = 60
PC_BTN_FIGHT_CLUB_MASH_4 = 61
PC_BTN_PAD_MENU_SELECT = 62
PC_BTN_WALK = 63
PC_BTN_MOTO_PITCH_UP = 64
PC_BTN_MOTO_PITCH_DOWN = 65
PC_BTN_ZOOM_IN = 66
PC_BTN_ZOOM_OUT = 67
PC_BTN_MENU_SCROLL_LEFT = 68
PC_BTN_MENU_SCROLL_RIGHT = 69
PC_BTN_MENU_DPAD_UP = 70
PC_BTN_MENU_DPAD_DOWN = 71
PC_BTN_MENU_DPAD_LEFT = 72
PC_BTN_MENU_DPAD_RIGHT = 73
PC_BTN_MENU_ALT_SELECT = 74
PC_BTN_X = 75
PC_BTN_PAD_BACK = 76
PC_PAD_DPAD_RIGHT = 77
PC_PAD_DPAD_UP = 78
PC_PAD_DPAD_LEFT = 79
PC_PAD_DPAD_DOWN = 80
PC_BTN_PAD_START = 81
PC_BTN_PAD_LS_PRESS = 82
PC_BTN_PAD_RS_PRESS = 83
PC_BTN_CHAT_ALL = 84
PC_BTN_CHAT_TEAM = 85


-- input code entry variables
CODEONE = false
CODETWO = false
CODETHREE = false
INPUT_CODE_ONE = false
INPUT_CODE_TWO = false
INPUT_CODE_THREE = false
codestring = ""
INPUT_CODE_READY = false

-- Zone State variables
Riot_State = true
Ship_State = true
Hospital_State = true
Festival_State = true
Yacht_State = true
Burning_State = 0
Barn_State = true

--Special Command vars
COOP_COMMANDS_ACTIVE = false
SANDBOX_MESSAGES = true
WEAPON_SWAP_DISABLED = false

--Sandbox++ Variables [nclok1405]
SPP_COP_DRIVEBY = false			-- Cop Driveby
SPP_SPAWNING_PEDS = 0		-- Spawn peds
SPP_SPAWNING_ACTION_NODE_PEDS = true	-- Spawn non-walking civilians
SPP_SPAWNING_VEHICLES = true		-- Spawn vehicles
SPP_ENABLE_TRAFFIC = 0		-- Enable civilian traffic
SPP_ENABLE_AMBIENT_COP_SPAWNS = true	-- Enable ambient cops
SPP_ENABLE_AMBIENT_GANG_SPAWNS = true	-- Enable ambient gangs
SPP_ENABLE_ROADBLOCKS = true		-- Enable roadblocks
SPP_PED_BUMS = false			-- Spawn Bum Peds
SPP_INDOOR_GANG = false			-- Enable indoor notoriety gang spawns
SPP_RESTRICTED_ZONES = true		-- Notoriety for restricted zones
SPP_ENABLE_BOATS = true			-- Enable boats
SPP_CD_FINDER = 0				-- CD Finder
SPP_HEALTH_REGEN = true			-- Enable health regeneration
SPP_FORCE_PASSENGER_SEAT = false	-- Force passenger seat
SPP_INVERTED_SONG_OF_TIME = 0	-- Time Speed
SPP_HOUR = 0	-- Hour
SPP_WEATHER = 0	-- Weather
SPP_RAGDOLL = true	-- Player Ragdoll
SPP_VEHICLE_ENTER_EXIT = true -- Allow Vehicle Enter/Exit
SPP_VEHICLE_INFINITE_MASS = true	-- Infinite Mass
SPP_VEHICLE_SUPPRESS_FLIPPING = true	-- Suppress Vehicle Flipping
SPP_INVULNERABLE = true -- Player Invulnerable
SPP_DAMAGE_MULTIPLIER = 0	-- Damage Multiplier
SPP_SWORD_COMBAT = true	-- Sword Combat Mode
SPP_ACTION_NODES = false	-- All Action Nodes
SPP_AMBIENT_BROTHERHOOD = false	-- Ambient Enemy Gang Spawns
SPP_AMBIENT_RONIN = false
SPP_AMBIENT_SAMEDI = false
SPP_CRIB_TRIGGERS = false	-- Crib Triggers

SPP_SAINTS_HQ_LEVEL = 0	-- Saints HQ status
SPP_PHILLIPS_BUILDING = true	-- Phillips Building status

SPP_ON_HOOD_CHANGED = true	-- on_hood_changed
SPP_ON_DISTRICT_CHANGED = true	-- on_district_changed
SPP_ON_PURCHASE = true	-- on_purchase
SPP_ON_NOTORIETY_EVENT = true	-- on_notoriety_event
SPP_ON_PROJECTILE_HIT = true	-- on_projectile_hit
SPP_ON_HIT_PED = true	-- on_hit_ped
SPP_ON_RANDOM_HUMAN_KILLED = true	-- on_random_human_killed
SPP_ON_RANDOM_MOVER_KILLED = true	-- on_random_mover_killed
SPP_ON_RANDOM_VEHICLE_KILLED = true	-- on_random_vehicle_killed
SPP_ON_TAKE_DAMAGE = true	-- on_take_damage
SPP_ON_COLLISION = true	-- on_collision
SPP_ON_VEHICLE_STUNT = true	-- on_vehicle_stunt

-- Mission IDs
SPP_MISSION_ID_LIST = {
	"tss01","tss02","tss03","tss04",
	"sh_tss_caverns",
	"bh01","bh02","bh03","bh04","bh05","bh06","bh07","bh08","bh09","bh10","bh11",
	"sh_bh_airport","sh_bh_apartments","sh_bh_chinatown","sh_bh_docks",
	"rn01","rn02","rn03","rn04","rn05","rn06","rn07","rn08","rn09","rn10","rn11",
	"sh_rn_museum_pier","sh_rn_rec_center","sh_rn_sciencemuseum","sh_rn_stripclub",
	"ss01","ss02","ss03","ss04","ss05","ss06","ss07","ss08","ss09","ss10","ss11",
	"sh_ss_crackhouse","sh_ss_fishingdock","sh_ss_student_union","sh_ss_trailerpark",
	"ep01","ep02","ep03","ep04",
	"sh_tss_ugmall",
	"em01",
	"dlc04","dlc05",
	"crowd_ht","crowd_su","drug_ai","drug_ht","escort_rl","escort_un","snatch_ct","snatch_dt",
	"fight_ar","fight_pr","fraud_fc","fraud_mu","mayhem_st","mayhem_nu","heli_br","heli_tp",
	"torch_dt","torch_ap","fuzz_pj","fuzz_sx","sewage_sx","sewage_rl","demoderby_un","demoderby_sp",
	"zombie",
	"mm_evilgat",
}

Spp_stink_thread_handle = INVALID_THREAD_HANDLE	-- Peds run away thread
Spp_auto_repair_thread_handle = INVALID_THREAD_HANDLE	-- Auto Vehicle Repair thread
Spp_nitro_thread_handle = INVALID_THREAD_HANDLE	-- Nitro thread
Spp_walking_bomb_thread_handle = INVALID_THREAD_HANDLE	-- Walking bomb thread

Spp_jyunichi_battle_audio_id = 0	-- Jyunichi Boss Music handle

Spp_last_command_code = "None"	-- Last activated code number
Spp_last_command_text = ""	-- Last activated code description

-- VANILLA STUFF
include("airport.lua")					-- DISTRICTS
include("apartments.lua")
include("arena.lua")
include("barrio.lua")
include("chinatown.lua")
include("docks.lua")
include("downtown.lua")
include("factories.lua")
include("highend.lua")
include("hotels.lua")
include("museum.lua")
include("nuke.lua")
include("prison.lua")
include("projects.lua")
include("redlight.lua")
include("saintsrow.lua")
include("suburbs.lua")
include("subexp.lua")
include("trailerpark.lua")
include("truckyard.lua")
include("ultor_base.lua")
include("underground.lua")
include("university.lua")

include("mission_globals.lua")		-- MISSIONS
include("stronghold_globals.lua")	-- STRONGHOLDS

-- Get player sync constant [nclok1405]
function sandbox_get_sync(player)
	local sync = SYNC_ALL
	if (player == LOCAL_PLAYER) or (player == SYNC_LOCAL) then
		sync = SYNC_LOCAL
	elseif (player == REMOTE_PLAYER) or (player == SYNC_REMOTE) then
		sync = SYNC_REMOTE
	end
	return sync
end

function reset_input_sequence()
	--debug_print("RESET INPUT SEQUENCE")
	CODEONE = false
	CODETWO = false
	CODETHREE = false
	INPUT_CODE_ONE = false
	INPUT_CODE_TWO = false
	INPUT_CODE_THREE = false
	codestring = ""
	INPUT_CODE_READY = false
end

function input_code_one_activated()
	INPUT_CODE_ONE = true
	debug_print("CODESTRING: "..codestring)
	--mission_help_table("CODESTRING: "..codestring, LOCAL_PLAYER)

	if SANDBOX_MESSAGES and CODETHREE then
		mission_help_clear(SYNC_LOCAL)
		mission_help_table_nag(codestring.."**", "", "", SYNC_LOCAL)
	end
end

function input_code_two_activated()
	INPUT_CODE_TWO = true
	debug_print("CODESTRING: "..codestring)
	--mission_help_table("CODESTRING: "..codestring, LOCAL_PLAYER)

	if SANDBOX_MESSAGES and CODETHREE then
		mission_help_clear(SYNC_LOCAL)
		mission_help_table_nag(codestring.."*", "", "", SYNC_LOCAL)
	end
end

function input_code_three_activated()
	INPUT_CODE_THREE = true
	INPUT_CODE_READY = true
	debug_print("CODESTRING: "..codestring)
	--mission_help_table("CODESTRING: "..codestring, LOCAL_PLAYER)
end


function sandbox_message(text,player)
	if SANDBOX_MESSAGES == true then
		--objective_text_clear(0)
		--mission_help_table("CODE ENTRY: "..codestring.."\n"..text, player)
		Spp_last_command_code = codestring
		Spp_last_command_text = text

		local msg = "CODE ENTRY: "..codestring.."\n"..text
		local sync = sandbox_get_sync(player)

		mission_help_clear(sync)
		mission_help_table_nag(msg, "", "", sync)
	end
end

-- Change player's animation [nclok1405]
function spp_set_animation(anim_name)
	set_animation_state(LOCAL_PLAYER, anim_name)
	if COOP_COMMANDS_ACTIVE then
		set_animation_state(REMOTE_PLAYER, anim_name)
	end
	sandbox_message("Player animation "..anim_name)
	reset_input_sequence()
end

-- Change player's outfit [nclok1405]
function spp_outfit_wear(outfit_name, display_name)
	if (display_name == nil) then
		display_name = outfit_name
	end

	customization_outfit_wear( outfit_name, 0, SYNC_LOCAL )
	customization_item_revert(SYNC_LOCAL)	-- Re-enable access to wardrobe, which will restore the player's original outfit
	if COOP_COMMANDS_ACTIVE then
		customization_outfit_wear( outfit_name, 0, SYNC_REMOTE )
		customization_item_revert(SYNC_REMOTE)
	end

	sandbox_message("Outfit changed to "..display_name)
	reset_input_sequence()
end

-- A thread that makes nearby peds run away [nclok1405]
function spp_stink_thread()
	while true do
		character_set_all_civilians_fleeing(LOCAL_PLAYER, 50)
		
		if COOP_COMMANDS_ACTIVE then
			character_set_all_civilians_fleeing(REMOTE_PLAYER, 50)
		end
		
		thread_yield()	-- Let other threads run (the game freezes otherwise)
		-- This thread is killed here when thread_kill is used
	end
end

-- A thread that constantly repairs player's vehicle [nclok1405]
function spp_auto_repair_thread()
	while true do
		local player_vehicle, partner_vehicle = spp_get_player_vehicle_names()
		
		if player_vehicle ~= "" then
			vehicle_repair(player_vehicle)
		end
		if partner_vehicle ~= "" then
			vehicle_repair(partner_vehicle)
		end
		
		thread_yield()	-- Let other threads run (the game freezes otherwise)
	end
end

-- Walking Bomb [nclok1405]
function spp_walking_bomb()
	while true do
		explosion_create("Tanker", LOCAL_PLAYER, "", true)
		if COOP_COMMANDS_ACTIVE then
			explosion_create("Tanker", REMOTE_PLAYER, "", true)
		end
		delay(5)
	end
end

-- Nitro Thread [nclok1405]
function spp_nitro_thread()
	while true do
		if character_is_in_a_driver_seat(LOCAL_PLAYER) and character_is_ready(LOCAL_PLAYER) and player_button_just_pressed(PC_BTN_NITRO) then
			local myride = get_char_vehicle_name(LOCAL_PLAYER)
			local nitro = vehicle_get_nitro_state(myride)
			local vehicle_type = get_char_vehicle_type(LOCAL_PLAYER)
			
			if (not nitro) and ((vehicle_type == VT_AUTOMOBILE) or (vehicle_type == VT_MOTORCYCLE) or (vehicle_type == VT_TRAIN)) then
				vehicle_set_nitro_state(myride, true)
				
				nitro = vehicle_get_nitro_state(myride)
				if nitro then
					audio_play("SFX_GRENADE_EXP")
				end
			end
		end
		thread_yield()
	end
end

-- Teleport to specified location [nclok1405]
-- navpoint_name: Navpoint
-- location_name: (optional) Location Name displayed to the player
function spp_teleport(navpoint_name, location_name)
	teleport(LOCAL_PLAYER, navpoint_name)
	if COOP_COMMANDS_ACTIVE then
		teleport(REMOTE_PLAYER, navpoint_name)
	end
	if (location_name ~= nil) and (location_name ~= "") then
		-- Set which player to show the message
		local sync = SYNC_ALL
		if not COOP_COMMANDS_ACTIVE then
			sync = SYNC_LOCAL
		end
		sandbox_message("Teleported to "..location_name, sync)
	end
end

-- Play keypad sound [nclok1405]
function spp_play_keypad_sound(num)
	if not SANDBOX_MESSAGES then
		return
	end
	audio_play("SYS_CELL_"..tostring(num))
end

-- Get Player Vehicle Names [nclok1405]
function spp_get_player_vehicle_names()
	local player_vehicle = get_char_vehicle_name(LOCAL_PLAYER)
	local partner_vehicle = ""
	if COOP_COMMANDS_ACTIVE then
		partner_vehicle = get_char_vehicle_name(REMOTE_PLAYER)
	end
	return player_vehicle, partner_vehicle
end

-- Get the currently active mission name
function spp_get_active_mission_name()
	if not mission_is_active() then
		return ""
	end
	
	for index, mission in pairs(SPP_MISSION_ID_LIST) do
		if mission_is_active(mission) then
			return mission
		end
	end
	
	return "unknown"
end

-- Remove all markers from collectibles [nclok1405]
function spp_remove_collectible_markers()
	debug_print("Removing CD locations")
	for i = 1, 50, 1 do
		local cd_navpoint_name	-- CD Navpoint Name
		if i >= 10 then
			cd_navpoint_name = "cds_sr2_city_"..i
		else
			cd_navpoint_name = "cds_sr2_city_0"..i	-- Append 0 in front of the number in 0-9
		end
		marker_remove_navpoint(cd_navpoint_name, SYNC_ALL)
	end
	
	debug_print("Removing Jump locations")
	for i = 0, 79, 1 do
		local stunt_jump_navpoint_name
		if i >= 10 then
			stunt_jump_navpoint_name = "stunt_jumps_$t0"..i
		else
			stunt_jump_navpoint_name = "stunt_jumps_$t00"..i
		end
		marker_remove_navpoint(stunt_jump_navpoint_name, SYNC_ALL)
	end
	
	debug_print("Removing Barnstorming locations")
	for i = 1, 35, 1 do
		local barnstorming_navpoint_name
		if i >= 10 then
			barnstorming_navpoint_name = "barnstorming_stunt"..i
		else
			barnstorming_navpoint_name = "barnstorming_stunt0"..i
		end
		marker_remove_navpoint(barnstorming_navpoint_name, SYNC_ALL)
	end
end

-- Add CD markers [nclok1405]
function spp_add_cd_markers()
	local sync = SYNC_LOCAL	-- Which player is affected
	if COOP_COMMANDS_ACTIVE then
		sync = SYNC_ALL
	end

	local ingame_effect = ""	-- Ingame Effect
	if SPP_OPTIONS_SHOW_LIGHTCONE_FOR_CD_FINDER then
		ingame_effect = INGAME_EFFECT_LOCATION
	end

	for i = 1, 50, 1 do
		local cd_navpoint_name	-- CD Navpoint Name
		if i >= 10 then
			cd_navpoint_name = "cds_sr2_city_"..i
		else
			cd_navpoint_name = "cds_sr2_city_0"..i	-- Append 0 in front of the number in 0-9
		end
		marker_add_navpoint(cd_navpoint_name, MINIMAP_ICON_LOCATION, ingame_effect, sync)
	end
end

-- Add Stunt Jump markers (second_half: Mark jumps 40-79 if true) [nclok1405]
function spp_add_stunt_jump_markers(second_half)
	local sync = SYNC_LOCAL	-- Which player is affected
	if COOP_COMMANDS_ACTIVE then
		sync = SYNC_ALL
	end

	local ingame_effect = ""	-- Ingame Effect
	if SPP_OPTIONS_SHOW_LIGHTCONE_FOR_CD_FINDER then
		ingame_effect = INGAME_EFFECT_LOCATION
	end

	local num_start = 0
	local num_end = 39
	if second_half then
		num_start = 40
		num_end = 79
	end
	
	for i = num_start, num_end, 1 do
		local stunt_jump_navpoint_name
		if i >= 10 then
			stunt_jump_navpoint_name = "stunt_jumps_$t0"..i
		else
			stunt_jump_navpoint_name = "stunt_jumps_$t00"..i
		end
		marker_add_navpoint(stunt_jump_navpoint_name, MINIMAP_ICON_LOCATION, ingame_effect, sync)
	end
end

-- Add Barnstorming markers [nclok1405]
function spp_add_barnstorming_markers()
	local sync = SYNC_LOCAL	-- Which player is affected
	if COOP_COMMANDS_ACTIVE then
		sync = SYNC_ALL
	end

	local ingame_effect = ""	-- Ingame Effect
	if SPP_OPTIONS_SHOW_LIGHTCONE_FOR_CD_FINDER then
		ingame_effect = INGAME_EFFECT_LOCATION
	end

	for i = 1, 35, 1 do
		local barnstorming_navpoint_name
		if i >= 10 then
			barnstorming_navpoint_name = "barnstorming_stunt"..i
		else
			barnstorming_navpoint_name = "barnstorming_stunt0"..i
		end
		marker_add_navpoint(barnstorming_navpoint_name, MINIMAP_ICON_LOCATION, ingame_effect, sync)
	end
end

-- on_hood_changed callback [nclok1405]
function spp_on_hood_changed(player, hood, previous_hood)
	mission_help_table("[format][color:cyan]on_hood_changed[/format] "..tostring(player).." Hood:\""..tostring(hood).."\" Prev:\""..tostring(previous_hood).."\"")
end

-- on_district_changed callback [nclok1405]
function spp_on_district_changed(player, new_district, prev_district)
	mission_help_table("[format][color:cyan]on_district_changed[/format] "..tostring(player).." District:\""..tostring(new_district).."\" Prev:\""..tostring(prev_district).."\"")
end

-- on_purchase callback [nclok1405]
function spp_on_purchase(store_type, item_purchased, player)
	mission_help_table("[format][color:cyan]on_purchase[/format] "..tostring(player).." Store:\""..tostring(store_type).."\" Item:\""..tostring(item_purchased).."\"")
end

-- on_notoriety_event callback [nclok1405]
function spp_on_notoriety_event(event, police, gang, team)
	mission_help_table("[format][color:cyan]on_notoriety_event[/format] \""..tostring(event).."\" Team:\""..tostring(team).."\" Police:"..tostring(police).." Gang:"..tostring(gang))
end

-- on_projectile_hit callback [nclok1405]
function spp_on_projectile_hit(objtype, objname, weapon)
	mission_help_table("[format][color:cyan]on_projectile_hit[/format] Type:\""..tostring(objtype).."\" Name:\""..tostring(objname).."\" Weapon:\""..tostring(weapon).."\"")
end

-- on_hit_ped callback [nclok1405]
function spp_on_hit_ped(vehicle)
	mission_help_table("[format][color:cyan]on_hit_ped[/format] \""..tostring(vehicle).."\"")
end

-- on_random_human_killed callback [nclok1405]
function spp_on_random_human_killed(attacker, victim)
	mission_help_table("[format][color:cyan]on_random_human_killed[/format] "..tostring(attacker).." \""..tostring(victim).."\"")
end

-- on_random_mover_killed callback [nclok1405]
function spp_on_random_mover_killed(attacker, victim)
	mission_help_table("[format][color:cyan]on_random_mover_killed[/format] "..tostring(attacker).." \""..tostring(victim).."\"")
end

-- on_random_vehicle_killed callback [nclok1405]
function spp_on_random_vehicle_killed(attacker, victim)
	mission_help_table("[format][color:cyan]on_random_vehicle_killed[/format] "..tostring(attacker).." \""..tostring(victim).."\"")
end

-- on_take_damage [nclok1405]
function spp_on_take_damage(victim, attacker, hp, explosion)
	mission_help_table("[format][color:cyan]on_take_damage[/format] Victim:\""..tostring(victim).."\" Attacker:\""..tostring(attacker).."\" HP:"..tostring(hp).." Explosion:"..tostring(explosion))
end

-- on_collision [nclok1405]
function spp_on_collision(vehicle, victim, speed)
	mission_help_table("[format][color:cyan]on_collision[/format] \""..tostring(vehicle).."\" Victim:\""..tostring(victim).."\" Speed:"..tostring(speed))
end

-- on_vehicle_stunt [nclok1405]
function spp_on_vehicle_stunt(vehicle, respect)
	if respect == 0 then
		return
	end
	mission_help_table("[format][color:cyan]on_vehicle_stunt[/format] \""..tostring(vehicle).."\" Respect:"..tostring(respect))
end

-- on_tagged (unused, doesn't get called)
--[[
function spp_on_tagged(param1, param2, param3)
	mission_help_table("[format][color:cyan]on_tagged[/format] \""..tostring(param1).."\" \""..tostring(param2).."\" \""..tostring(param3).."\"")
end
--]]

-- Add marker to a vehicle for specified number of seconds
function spp_add_temp_vehicle_marker(vehicle, duration)
	marker_add_vehicle(vehicle, MINIMAP_ICON_LOCATION, INGAME_EFFECT_VEHICLE_INTERACT, SYNC_ALL)
	delay(duration)
	marker_remove_vehicle(vehicle)
end

function keycombo_thread()
	while (1) do
		-- If the co-op parner quits, reset the co-op flag [nclok1405]
		if not coop_is_active() then
			COOP_COMMANDS_ACTIVE = false
		end
		
		-- Reset everything if normal keys other than 888 are hit. This cancels the sequence
		if player_button_just_pressed(PC_BTN_ATTACK) or player_button_just_pressed(PC_BTN_SPRINT) or player_button_just_pressed(PC_BTN_ACTION) or player_button_just_pressed(PC_BTN_MOVE_UP) then 
			-- Cancel Message
			if SANDBOX_MESSAGES and CODETHREE then
				audio_play("SYS_MENU_BACK")	-- Play "Back" sound
				mission_help_clear(SYNC_LOCAL)
				mission_help_table_nag("CODE ENTRY CANCELLED", "", "", SYNC_LOCAL)
			end
			reset_input_sequence()
		end


		if player_button_just_pressed(PC_BTN_SELECT_WEAPON_8) and CODEONE == false and CODETWO == false and CODETHREE == false then
			CODEONE = true
			debug_print("CODEONE READY")
		elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_8) and CODEONE == true and CODETWO == false and CODETHREE == false then
			CODETWO = true
			debug_print("CODETWO READY")
		elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_8) and CODEONE == true and CODETWO == true and CODETHREE == false then
			CODETHREE = true
			debug_print("CODETHREE READY")
			if SANDBOX_MESSAGES then
				audio_play("SYS_OBJECTIVE_COMPLETE")	-- Play "Ding" sound
				mission_help_table_nag("READY FOR CODE ENTRY", "", "", SYNC_LOCAL)
			end
		elseif CODETHREE == true and INPUT_CODE_ONE == false then
			if player_button_just_pressed(PC_BTN_SELECT_WEAPON_1) and CODETHREE == true then
				spp_play_keypad_sound(1)
				codestring = (codestring.."1")
				input_code_one_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_2) and CODETHREE == true then
				spp_play_keypad_sound(2)
				codestring = (codestring.."2")
				input_code_one_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_3) and CODETHREE == true then
				spp_play_keypad_sound(3)
				codestring = (codestring.."3")
				input_code_one_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_4) and CODETHREE == true then
				spp_play_keypad_sound(4)
				codestring = (codestring.."4")
				input_code_one_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_5) and CODETHREE == true then
				spp_play_keypad_sound(5)
				codestring = (codestring.."5")
				input_code_one_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_6) and CODETHREE == true then
				spp_play_keypad_sound(6)
				codestring = (codestring.."6")
				input_code_one_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_7) and CODETHREE == true then
				spp_play_keypad_sound(7)
				codestring = (codestring.."7")
				input_code_one_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_8) and CODETHREE == true then
				spp_play_keypad_sound(8)
				codestring = (codestring.."8")
				input_code_one_activated()
			end
		elseif INPUT_CODE_ONE == true and INPUT_CODE_TWO == false then
			if player_button_just_pressed(PC_BTN_SELECT_WEAPON_1) and CODETHREE == true then
				spp_play_keypad_sound(1)
				codestring = (codestring.."1")
				input_code_two_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_2) and CODETHREE == true then
				spp_play_keypad_sound(2)
				codestring = (codestring.."2")
				input_code_two_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_3) and CODETHREE == true then
				spp_play_keypad_sound(3)
				codestring = (codestring.."3")
				input_code_two_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_4) and CODETHREE == true then
				spp_play_keypad_sound(4)
				codestring = (codestring.."4")
				input_code_two_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_5) and CODETHREE == true then
				spp_play_keypad_sound(5)
				codestring = (codestring.."5")
				input_code_two_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_6) and CODETHREE == true then
				spp_play_keypad_sound(6)
				codestring = (codestring.."6")
				input_code_two_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_7) and CODETHREE == true then
				spp_play_keypad_sound(7)
				codestring = (codestring.."7")
				input_code_two_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_8) and CODETHREE == true then
				spp_play_keypad_sound(8)
				codestring = (codestring.."8")
				input_code_two_activated()
			end
		elseif INPUT_CODE_TWO == true and INPUT_CODE_THREE == false then
			if player_button_just_pressed(PC_BTN_SELECT_WEAPON_1) and CODETHREE == true then
				spp_play_keypad_sound(1)
				codestring = (codestring.."1")
				input_code_three_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_2) and CODETHREE == true then
				spp_play_keypad_sound(2)
				codestring = (codestring.."2")
				input_code_three_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_3) and CODETHREE == true then
				spp_play_keypad_sound(3)
				codestring = (codestring.."3")
				input_code_three_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_4) and CODETHREE == true then
				spp_play_keypad_sound(4)
				codestring = (codestring.."4")
				input_code_three_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_5) and CODETHREE == true then
				spp_play_keypad_sound(5)
				codestring = (codestring.."5")
				input_code_three_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_6) and CODETHREE == true then
				spp_play_keypad_sound(6)
				codestring = (codestring.."6")
				input_code_three_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_7) and CODETHREE == true then
				spp_play_keypad_sound(7)
				codestring = (codestring.."7")
				input_code_three_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_8) and CODETHREE == true then
				spp_play_keypad_sound(8)
				codestring = (codestring.."8")
				input_code_three_activated()
			end
		end

		if INPUT_CODE_READY == true then
			if codestring == "111" then
				spp_teleport("airport_$nav-warp", "Airport")
				reset_input_sequence()
			elseif codestring == "112" then
				spp_teleport("apartments_$nav-warp", "Apartments")
				reset_input_sequence()
			elseif codestring == "113" then
				spp_teleport("arena_$nav-warp", "Arena")
				reset_input_sequence()
			elseif codestring == "114" then
				spp_teleport("barrio_$nav-warp", "Barrio")
				reset_input_sequence()
			elseif codestring == "115" then
				spp_teleport("chinatown_$nav-warp", "Chinatown")
				reset_input_sequence()
			elseif codestring == "116" then
				spp_teleport("docks_$nav-warp", "Docks & Warehouses")
				reset_input_sequence()
			elseif codestring == "117" then
				spp_teleport("downtown_$nav-warp", "Downtown")
				reset_input_sequence()
			elseif codestring == "118" then
				spp_teleport("factories_$nav-warp", "Factories")
				reset_input_sequence()
			elseif codestring == "121" then
				spp_teleport("highend_$nav-warp", "High End Retail")
				reset_input_sequence()
			elseif codestring == "122" then
				spp_teleport("hotels_$nav-warp", "Hotels & Marina")
				reset_input_sequence()
			elseif codestring == "123" then
				spp_teleport("museum_$nav-warp", "Museum")
				reset_input_sequence()
			elseif codestring == "124" then
				spp_teleport("nuke_$nav-warp", "Nuclear Power Plant")
				reset_input_sequence()
			elseif codestring == "125" then
				spp_teleport("prison_$nav-warp", "Stilwater Prison")
				reset_input_sequence()
			elseif codestring == "126" then
				spp_teleport("projects_$nav-warp", "Projects")
				reset_input_sequence()
			elseif codestring == "127" then
				spp_teleport("redlight_$nav-warp", "Red Light")
				reset_input_sequence()
			elseif codestring == "128" then
				spp_teleport("saintsrow_$nav-warp", "Saint's Row")
				reset_input_sequence()
			elseif codestring == "131" then
				spp_teleport("suburbs_$nav-warp", "Suburbs")
				reset_input_sequence()
			elseif codestring == "132" then
				spp_teleport("subexp_$nav-warp", "Suburbs Expansion")
				reset_input_sequence()
			elseif codestring == "133" then
				spp_teleport("trailerpark_$nav-warp", "Trailer Park")
				reset_input_sequence()
			elseif codestring == "134" then
				spp_teleport("truckyard_$nav-warp", "Truck Yard")
				reset_input_sequence()
			elseif codestring == "135" then
				spp_teleport("university_$nav-warp", "Stilwater University")
				reset_input_sequence()
			elseif codestring == "136" then
				spp_teleport("sr2_city_$sh_tss_ugmall", "Rounds Square Shopping Center")
				reset_input_sequence()
			elseif codestring == "137" then
				spp_teleport("sr2_city_$sh_tss_caverns", "Stilwater Caverns Entrance")
				reset_input_sequence()
			elseif codestring == "138" then
				spp_teleport("ultor_base_$i000", "The Pyramid")
				reset_input_sequence()


			elseif codestring == "141" then
				spp_teleport("cribs_sr2_city_$HE_crib_clothing", "Penthouse Loft")
				reset_input_sequence()
			elseif codestring == "142" then
				spp_teleport("cribs_sr2_city_$PI_crib_clothes", "Prison Lighthouse")
				reset_input_sequence()
			elseif codestring == "143" then
				spp_teleport("cribs_sr2_city_$SR_crib_clothes", "Saints Row Mega Condo")
				reset_input_sequence()
			elseif codestring == "144" then
				spp_teleport("cribs_sr2_city_$RL_crib_clothes", "Red Light Loft")
				reset_input_sequence()
			elseif codestring == "145" then
				spp_teleport("cribs_sr2_city_$SU_crib_clothes", "University Loft")
				reset_input_sequence()
			elseif codestring == "146" then
				spp_teleport("cribs_sr2_city_$SHQ_clothes", "Saints Hideout")
				reset_input_sequence()
			elseif codestring == "147" then
				spp_teleport("cribs_sr2_city_$DT_crib_clothes", "Downtown Loft")
				reset_input_sequence()
			elseif codestring == "148" then
				spp_teleport("cribs_sr2_city_$AI_wardrobe", "Hotel Penthouse")
				reset_input_sequence()
			elseif codestring == "151" then
				spp_teleport("cribs_sr2_city_$AI_Hangar", "Airport Hangar")
				reset_input_sequence()
			elseif codestring == "152" then
				spp_teleport("cribs_sr2_city_$SU_Dock", "University Dock")
				reset_input_sequence()
			elseif codestring == "153" then
				spp_teleport("cribs_sr2_city_$SB_Dock", "Suburbs Dock")
				reset_input_sequence()
			elseif codestring == "154" then
				spp_teleport("cribs_sr2_city_$SB_Aisha_clothes", "Aisha's House")
				reset_input_sequence()
			elseif codestring == "155" then
				spp_teleport("cribs_sr2_city_$YT_ultor_clothes", "Ultor Yacht")
				reset_input_sequence()
			elseif codestring == "156" then
				spp_teleport("cribs_sr2_city_$PB_clothes", "Phillips Building")
				reset_input_sequence()

			elseif codestring == "158" then
				spp_teleport("hoing_suburbs1", "Ho-ing Technically Legal")
				reset_input_sequence()
			elseif codestring == "161" then
				spp_teleport("activity_start_sr2_city_mayhem_nu", "Mayhem Nuclear Plant (Before/After Completion)")
				reset_input_sequence()
			elseif codestring == "162" then
				spp_teleport("activity_start_sr2_city_mayhem_nu_alternate", "Mayhem Nuclear Plant (In-Progress marker in Apartments)")
				reset_input_sequence()
			elseif codestring == "163" then
				spp_teleport("activity_start_sr2_city_mayhem_st", "Mayhem Red Light")
				reset_input_sequence()
			elseif codestring == "164" then
				spp_teleport("activity_start_sr2_city_demoderby_un", "Demolition Derby")
				reset_input_sequence()
			elseif codestring == "165" then
				spp_teleport("activity_start_sr2_city_crowd_ht", "Crowd Control Hotels & Marina")
				reset_input_sequence()
			elseif codestring == "166" then
				spp_teleport("activity_start_sr2_city_crowd_su", "Crowd Control Suburbs")
				reset_input_sequence()
			elseif codestring == "167" then
				spp_teleport("activity_start_sr2_city_drug_ai", "Drug Trafficking Airport")
				reset_input_sequence()
			elseif codestring == "168" then
				spp_teleport("activity_start_sr2_city_drug_ht", "Drug Trafficking Hotels & Marina")
				reset_input_sequence()
			elseif codestring == "171" then
				spp_teleport("activity_start_sr2_city_escort_un", "Escort Stilwater University")
				reset_input_sequence()
			elseif codestring == "172" then
				spp_teleport("activity_start_sr2_city_escort_rl", "Escort Red Light")
				reset_input_sequence()
			elseif codestring == "173" then
				spp_teleport("activity_start_sr2_city_fight_pr", "Fight Club Prison")
				reset_input_sequence()
			elseif codestring == "174" then
				spp_teleport("activity_start_sr2_city_fight_ar", "Fight Club Arena")
				reset_input_sequence()
			elseif codestring == "175" then
				spp_teleport("activity_start_sr2_city_fuzz_sx", "FUZZ Suburbs")
				reset_input_sequence()
			elseif codestring == "176" then
				spp_teleport("activity_start_sr2_city_fuzz_pj", "FUZZ Projects")
				reset_input_sequence()
			elseif codestring == "177" then
				spp_teleport("activity_start_sr2_city_heli_tp", "Heli Assault Trailer Park")
				reset_input_sequence()
			elseif codestring == "178" then
				spp_teleport("activity_start_sr2_city_heli_br", "Heli Assault Barrio")
				reset_input_sequence()
			elseif codestring == "181" then
				spp_teleport("activity_start_sr2_city_fraud_fc", "Insurance Fraud Factory")
				reset_input_sequence()
			elseif codestring == "182" then
				spp_teleport("activity_start_sr2_city_fraud_mu", "Insurance Fraud Museum")
				reset_input_sequence()
			elseif codestring == "183" then
				spp_teleport("activity_start_sr2_city_sewage_sx", "Septic Avenger Suburbs")
				reset_input_sequence()
			elseif codestring == "184" then
				spp_teleport("activity_start_sr2_city_sewage_rl", "Septic Avenger Red Light")
				reset_input_sequence()
			elseif codestring == "185" then
				spp_teleport("activity_start_sr2_city_snatch_ct", "Snatch Chinatown")
				reset_input_sequence()
			elseif codestring == "186" then
				spp_teleport("activity_start_sr2_city_snatch_dt", "Snatch Downtown")
				reset_input_sequence()
			elseif codestring == "187" then
				spp_teleport("activity_start_sr2_city_torch_dt", "Trail Blazing Downtown")
				reset_input_sequence()
			elseif codestring == "188" then
				spp_teleport("activity_start_sr2_city_torch_ap", "Trail Blazing Apartments")
				reset_input_sequence()


			elseif codestring == "211" then
				if Riot_State then
					city_chunk_swap( "sr2_intsrmisprison02", "riot", true, true, false )
					sandbox_message("Prison Riot swapped in", LOCAL_PLAYER)
				else
					city_chunk_swap( "sr2_intsrmisprison02", "normal", true, true, false )
					sandbox_message("Prison returned to normal", LOCAL_PLAYER)
				end
				Riot_State = not Riot_State
				reset_input_sequence()
			elseif codestring == "212" then
				if Ship_State then
					city_chunk_swap("sr2_chunk012", "ship", false, true, false )
					sandbox_message("Brotherhood tanker swapped in", LOCAL_PLAYER)
				else
					city_chunk_swap("sr2_chunk012", "normal", false, true, false )
					sandbox_message("Brotherhood tanker removed", LOCAL_PLAYER)
				end
				Ship_State = not Ship_State
				reset_input_sequence()
			elseif codestring == "213" then
				if Festival_State then
					city_chunk_swap("sr2_chunk179", "festival", false, true, false)
					city_chunk_swap("sr2_intmamis3junksempty", "festival", true, true, false)
					sandbox_message("Heritage Festival swapped in", LOCAL_PLAYER)
				else
					city_chunk_swap("sr2_chunk179", "normal", false, true, false)
					city_chunk_swap("sr2_intmamis3junksempty", "normal", true, true, false)

					sandbox_message("Heritage Festival removed", LOCAL_PLAYER)
				end
				Festival_State = not Festival_State
				reset_input_sequence()
			elseif codestring == "214" then
				if Yacht_State then
					city_chunk_swap("sr2_chunk111", "yacht", false, true, false )
					city_chunk_swap("sr2_intsrmisyacht01empty", "yacht", true, true, false )
					sandbox_message("Ultor Yacht swapped in", LOCAL_PLAYER)
				else
					city_chunk_swap("sr2_chunk111", "normal", false, true, false )
					city_chunk_swap("sr2_intsrmisyacht01empty", "normal", true, true, false )
					sandbox_message("Ultor Yacht removed", LOCAL_PLAYER)
				end
				Yacht_State = not Yacht_State
				reset_input_sequence()
			elseif codestring == "215" then
				if Burning_State == 0 then
					-- interior = true, blocking = true, temporary = false
					city_chunk_swap("sr2_intprmismethlab01", "Burned", true, true, false )
					city_chunk_swap("sr2_intprmismethlab03", "Burned", true, true, false )
					city_chunk_swap("sr2_intprmismethlab04", "Burned", true, true, false )
					-- interior = false, blocking = true, temporary = false
					city_chunk_swap("sr2_chunk093", "Burned", false, true, false )
					city_chunk_swap("sr2_chunk104", "Burned", false, true, false )
					sandbox_message("Projects and meth labs burning")
					Burning_State = 1
				elseif Burning_State == 1 then
					-- interior = true, blocking = true, temporary = false
					city_chunk_swap("sr2_intprmismethlab01", "Burned", true, true, false )
					city_chunk_swap("sr2_intprmismethlab03", "Burned", true, true, false )
					city_chunk_swap("sr2_intprmismethlab04", "Burned", true, true, false )
					-- interior = false, blocking = true, temporary = false
					city_chunk_swap("sr2_chunk093", "Burned", false, true, false )
					city_chunk_swap("sr2_chunk104", "Finish", false, true, false )
					sandbox_message("Projects and meth labs burned")
					Burning_State = 2
				else
					-- interior = true, blocking = true, temporary = false
					city_chunk_swap("sr2_intprmismethlab01", "normal", true, true, false )
					city_chunk_swap("sr2_intprmismethlab03", "normal", true, true, false )
					city_chunk_swap("sr2_intprmismethlab04", "normal", true, true, false )
					-- interior = false, blocking = true, temporary = false
					city_chunk_swap("sr2_chunk093", "normal", false, true, false )
					city_chunk_swap("sr2_chunk104", "normal", false, true, false )
					sandbox_message("Projects and meth labs returned to normal", LOCAL_PLAYER)
					Burning_State = 0
				end
				reset_input_sequence()
			elseif codestring == "216" then
				if Hospital_State then
					city_chunk_swap("SR2_IntDTMisHospital", "blackout", true, true, false)
					city_chunk_swap("SR2_IntDTMisHospital02", "blackout", false, true, false)
					city_chunk_swap("SR2_IntDTMisHospital03", "blackout", true, true, false)
					sandbox_message("Hospital now in blackout", LOCAL_PLAYER)
				else
					city_chunk_swap("SR2_IntDTMisHospital", "normal", true, true, false)
					city_chunk_swap("SR2_IntDTMisHospital02", "normal", false, true, false)
					city_chunk_swap("SR2_IntDTMisHospital03", "normal", true, true, false)
					sandbox_message("Hospital returned to normal", LOCAL_PLAYER)
				end
				Hospital_State = not Hospital_State
				reset_input_sequence()
			elseif codestring == "217" then
				if Barn_State then
					city_chunk_swap("sr2_chunk128", "destroyable_barn", false, true, false )
					sandbox_message("Samedi drug farm barn now destroyed", LOCAL_PLAYER)
				else
					city_chunk_swap("sr2_chunk128", "normal", false, true, false )
					sandbox_message("Samedi drug farm barn now intact", LOCAL_PLAYER)
				end
				Barn_State = not Barn_State
				reset_input_sequence()
			elseif codestring == "218" then
				-- Saints Hideout Status [nclok1405]
				-- interior = false, blocking = true, temporary = false
				if SPP_SAINTS_HQ_LEVEL == 0 then
					city_chunk_swap("sr2_ug_chunk104_ST_HQ", "level1", false, true, false)
					sandbox_message("Saints Hideout set to Level 1")
					SPP_SAINTS_HQ_LEVEL = 1
				elseif SPP_SAINTS_HQ_LEVEL == 1 then
					city_chunk_swap("sr2_ug_chunk104_ST_HQ", "level2", false, true, false)
					sandbox_message("Saints Hideout set to Level 2")
					SPP_SAINTS_HQ_LEVEL = 2
				elseif SPP_SAINTS_HQ_LEVEL == 2 then
					city_chunk_swap("sr2_ug_chunk104_ST_HQ", "level3", false, true, false)
					sandbox_message("Saints Hideout set to Level 3")
					SPP_SAINTS_HQ_LEVEL = 0
				end
				reset_input_sequence()

			elseif codestring == "221" then
				spp_teleport("garage_sr2_city_$TY_semi_store", "Semi Broken")
				reset_input_sequence()
			elseif codestring == "222" then
				spp_teleport("garage_sr2_city_$NU_mech_store", "Rim Jobs Nuclear Power Plant")
				reset_input_sequence()
			elseif codestring == "223" then
				spp_teleport("shops_sr2_city_$SX_plas_store", "Image as Designed Suburbs Expansion")
				reset_input_sequence()
			elseif codestring == "224" then
				spp_teleport("shops_sr2_city_$HER_plas_store", "Image as Designed Suburbs")
				reset_input_sequence()
			elseif codestring == "225" then
				spp_teleport("shops_sr2_city_$DT_plas_store", "Image as Designed Downtown")
				reset_input_sequence()
			elseif codestring == "226" then
				spp_teleport("shops_sr2_city_$SR_plas_store", "Image as Designed Saint's Row")
				reset_input_sequence()
			elseif codestring == "227" then
				spp_teleport("shops_sr2_city_$SU_gun_store", "Friendly Fire Suburbs")
				reset_input_sequence()
			elseif codestring == "228" then
				spp_teleport("shops_sr2_city_$AP_gun_store", "Friendly Fire Apartments")
				reset_input_sequence()
			elseif codestring == "231" then
				spp_teleport("shops_sr2_city_$DK_gun_store", "Friendly Fire Docks & Warehouses")
				reset_input_sequence()
			elseif codestring == "232" then
				spp_teleport("shops_sr2_city_$DT_gun_store", "Friendly Fire Downtown")
				reset_input_sequence()
			elseif codestring == "233" then
				spp_teleport("shops_sr2_city_$MA_gun_store", "Friendly Fire RSSC")
				reset_input_sequence()
			elseif codestring == "234" then
				spp_teleport("shops_sr2_city_$BAR_brass_store", "Brass Knuckles Barrio")
				reset_input_sequence()
			elseif codestring == "235" then
				spp_teleport("shops_sr2_city_$MU_brass_store", "Brass Knuckles Museum")
				reset_input_sequence()
			elseif codestring == "236" then
				spp_teleport("shops_sr2_city_$MA_brass_store", "Brass Knuckles RSSC")
				reset_input_sequence()
			elseif codestring == "237" then
				spp_teleport("shops_sr2_city_$DT_brass_store", "Brass Knuckles Downtown")
				reset_input_sequence()
			elseif codestring == "238" then
				spp_teleport("shops_sr2_city_$SX_music_store", "Scratch That Suburbs Expansion")
				reset_input_sequence()
			elseif codestring == "241" then
				spp_teleport("shops_sr2_city_$UN_music_store", "Scratch That University")
				reset_input_sequence()
			elseif codestring == "242" then
				spp_teleport("shops_sr2_city_$BAR_music_store", "Scratch That Barrio")
				reset_input_sequence()
			elseif codestring == "243" then
				spp_teleport("shops_sr2_city_$SR_music_store", "Scratch That Saint's Row")
				reset_input_sequence()
			elseif codestring == "244" then
				spp_teleport("shops_sr2_city_$AP_music_store", "Scratch That Apartments")
				reset_input_sequence()
			elseif codestring == "245" then
				spp_teleport("shops_sr2_city_$SU_car", "Foreign Power Suburbs")
				reset_input_sequence()
			elseif codestring == "246" then
				spp_teleport("shops_sr2_city_$MU_car_store", "Foreign Power Museum")
				reset_input_sequence()
			elseif codestring == "247" then
				spp_teleport("shops_sr2_city_$SR_car_store", "Foreign Power Saint's Row")
				reset_input_sequence()
			elseif codestring == "248" then
				spp_teleport("shops_sr2_city_$AR_car_store", "Foreign Power Arena")
				reset_input_sequence()
			elseif codestring == "251" then
				spp_teleport("shops_sr2_city_$SU_bike", "Cycles Suburbs")
				reset_input_sequence()
			elseif codestring == "252" then
				spp_teleport("shops_sr2_city_$AR_bike_store", "Cycles Arena")
				reset_input_sequence()
			elseif codestring == "253" then
				spp_teleport("shops_sr2_city_$MU_bike_store", "Cycles Museum")
				reset_input_sequence()
			elseif codestring == "254" then
				spp_teleport("shops_sr2_city_$SU_boat", "Ship It Suburbs")
				reset_input_sequence()
			elseif codestring == "255" then
				spp_teleport("shops_sr2_city_$MAR_boat_store", "Ship It Hotels & Marina")
				reset_input_sequence()
			elseif codestring == "256" then
				spp_teleport("shops_sr2_city_$FCT_bluecollar_store", "Blue Collar Supply")
				reset_input_sequence()
			elseif codestring == "257" then
				spp_teleport("shops_sr2_city_$SR_impound_store", "S.P.D. Impound")
				reset_input_sequence()
			elseif codestring == "258" then
				spp_teleport("shops_sr2_city_$AIR_sparrow_store", "Sparrow Aircraft")
				reset_input_sequence()
			elseif codestring == "261" then
				spp_teleport("shops_sr2_city_$DK_scrapyard_store", "Stilwater Scrapyard")
				reset_input_sequence()
			elseif codestring == "262" then
				spp_teleport("shops_sr2_city_$MU_volition_store", "Volition Gift Shop")
				reset_input_sequence()
			elseif codestring == "263" then
				spp_teleport("shops_sr2_city_$SU_fb", "Freckle Bitch's Suburbs")
				reset_input_sequence()
			elseif codestring == "264" then
				spp_teleport("shops_sr2_city_$MU_fb_store", "Freckle Bitch's Museum")
				reset_input_sequence()
			elseif codestring == "265" then
				spp_teleport("shops_sr2_city_$AP_fb_store", "Freckle Bitch's Apartments")
				reset_input_sequence()
			elseif codestring == "266" then
				spp_teleport("shops_sr2_city_$BAR_fb_store", "Freckle Bitch's Barrio")
				reset_input_sequence()
			elseif codestring == "267" then
				spp_teleport("shops_sr2_city_$MA_freckle_store", "Freckle Bitch's RSSC")
				reset_input_sequence()
			elseif codestring == "268" then
				spp_teleport("shops_sr2_city_$AIR_hard_store", "Charred Hard Burgers Airport")
				reset_input_sequence()
			elseif codestring == "271" then
				spp_teleport("shops_sr2_city_$MAR_hard_store", "Charred Hard Burgers Hotels & Marina")
				reset_input_sequence()
			elseif codestring == "272" then
				spp_teleport("shops_sr2_city_$UN_hard_store", "Charred Hard Burgers University")
				reset_input_sequence()
			elseif codestring == "273" then
				spp_teleport("shops_sr2_city_$MU_hard_store", "Charred Hard Burgers Museum")
				reset_input_sequence()
			elseif codestring == "274" then
				spp_teleport("shops_sr2_city_$MA_appolo_store", "Apollo's RSSC")
				reset_input_sequence()
			elseif codestring == "275" then
				spp_teleport("shops_sr2_city_$DK_apollo_store", "Apollo's Docks & Warehouses")
				reset_input_sequence()
			elseif codestring == "276" then
				spp_teleport("shops_sr2_city_$AP_apollo_store", "Apollo's Apartments")
				reset_input_sequence()
			elseif codestring == "277" then
				spp_teleport("shops_sr2_city_$DT_apollo_store", "Apollo's Downtown")
				reset_input_sequence()
			elseif codestring == "278" then
				spp_teleport("shops_sr2_city_$MAR_phuc_store", "Phuc Mi Phuc Yue Hotels & Marina")
				reset_input_sequence()
			elseif codestring == "281" then
				spp_teleport("shops_sr2_city_$MA_phuc_store", "Phuc Mi Phuc Yue RSSC")
				reset_input_sequence()
			elseif codestring == "282" then
				spp_teleport("shops_sr2_city_$CT_phuc_store", "Phuc Mi Phuc Yue Chinatown")
				reset_input_sequence()
			elseif codestring == "283" then
				spp_teleport("shops_sr2_city_$MA_gyros_store", "Company of Gyros RSSC")
				reset_input_sequence()
			elseif codestring == "284" then
				spp_teleport("shops_sr2_city_$SU_gyros_store", "Company of Gyros Suburbs")
				reset_input_sequence()
			elseif codestring == "285" then
				spp_teleport("shops_sr2_city_$TY_liq_store", "Brown Baggers Truckyard")
				reset_input_sequence()
			elseif codestring == "286" then
				spp_teleport("shops_sr2_city_$MA_lace_store", "Leather & Lace")
				reset_input_sequence()
			elseif codestring == "287" then
				spp_teleport("shops_sr2_city_$MA_nobody_store", "Nobody Loves Me")
				reset_input_sequence()
			elseif codestring == "288" then
				spp_teleport("shops_sr2_city_$MA_pretend_store", "Let's Pretend")
				reset_input_sequence()


			elseif codestring == "311" then
				if notoriety_get("Samedi") == 5 then
					sandbox_message("Notoriety Sons of Samedi reset")
					notoriety_set("Samedi",0)
				else
					notoriety_set("Samedi",(notoriety_get("Samedi") +1))
					sandbox_message("Notoriety Sons of Samedi +1")
				end
				reset_input_sequence()
			elseif codestring == "312" then
				if notoriety_get("Ronin") == 5 then
					sandbox_message("Notoriety Ronin reset")
					notoriety_set("Ronin",0)
				else
					notoriety_set("Ronin",(notoriety_get("Ronin") +1))
					sandbox_message("Notoriety Ronin +1")
				end
				reset_input_sequence()
			elseif codestring == "313" then
				if notoriety_get("Brotherhood") == 5 then
					sandbox_message("Notoriety Brotherhood reset")
					notoriety_set("Brotherhood",0)
				else
					notoriety_set("Brotherhood",(notoriety_get("Brotherhood") +1))
					sandbox_message("Notoriety Brotherhood +1")
				end
				reset_input_sequence()
			elseif codestring == "314" then
				if notoriety_get("Police") == 5 then
					sandbox_message("Notoriety Police reset")
					notoriety_set("Police",0)
				else
					notoriety_set("Police",(notoriety_get("Police") +1))
					sandbox_message("Notoriety Police +1")
				end
				reset_input_sequence()
			elseif codestring == "315" then
				clear_other_gang_notoriety("Samedi")
				notoriety_set("Samedi",0)
				notoriety_set_min("Samedi", 0)
				notoriety_set_max("Samedi", 0)
				sandbox_message("Notoriety Samedi locked at 0")
				reset_input_sequence()
			elseif codestring == "316" then
				clear_other_gang_notoriety("Samedi")
				notoriety_set("Samedi",1)
				notoriety_set_min("Samedi", 1)
				notoriety_set_max("Samedi", 1)
				sandbox_message("Notoriety Samedi locked at 1")
				reset_input_sequence()
			elseif codestring == "317" then
				clear_other_gang_notoriety("Samedi")
				notoriety_set("Samedi",2)
				notoriety_set_min("Samedi", 2)
				notoriety_set_max("Samedi", 2)
				sandbox_message("Notoriety Samedi locked at 2")
				reset_input_sequence()
			elseif codestring == "318" then
				clear_other_gang_notoriety("Samedi")
				notoriety_set("Samedi",3)
				notoriety_set_min("Samedi", 3)
				notoriety_set_max("Samedi", 3)
				sandbox_message("Notoriety Samedi locked at 3")
				reset_input_sequence()
			elseif codestring == "321" then
				clear_other_gang_notoriety("Samedi")
				notoriety_set("Samedi",4)
				notoriety_set_min("Samedi", 4)
				notoriety_set_max("Samedi", 4)
				sandbox_message("Notoriety Samedi locked at 4")
				reset_input_sequence()
			elseif codestring == "322" then
				clear_other_gang_notoriety("Samedi")
				notoriety_set("Samedi",5)
				notoriety_set_min("Samedi", 5)
				notoriety_set_max("Samedi", 5)
				sandbox_message("Notoriety Samedi locked at 5")
				reset_input_sequence()
			elseif codestring == "323" then
				clear_other_gang_notoriety("Ronin")
				notoriety_set("Ronin",0)
				notoriety_set_min("Ronin", 0)
				notoriety_set_max("Ronin", 0)
				sandbox_message("Notoriety Ronin locked at 0")
				reset_input_sequence()
			elseif codestring == "324" then
				clear_other_gang_notoriety("Ronin")
				notoriety_set("Ronin",1)
				notoriety_set_min("Ronin", 1)
				notoriety_set_max("Ronin", 1)
				sandbox_message("Notoriety Ronin locked at 1")
				reset_input_sequence()
			elseif codestring == "325" then
				clear_other_gang_notoriety("Ronin")
				notoriety_set("Ronin",2)
				notoriety_set_min("Ronin", 2)
				notoriety_set_max("Ronin", 2)
				sandbox_message("Notoriety Ronin locked at 2")
				reset_input_sequence()
			elseif codestring == "326" then
				clear_other_gang_notoriety("Ronin")
				notoriety_set("Ronin",3)
				notoriety_set_min("Ronin", 3)
				notoriety_set_max("Ronin", 3)
				sandbox_message("Notoriety Ronin locked at 3")
				reset_input_sequence()
			elseif codestring == "327" then
				clear_other_gang_notoriety("Ronin")
				notoriety_set("Ronin",4)
				notoriety_set_min("Ronin", 4)
				notoriety_set_max("Ronin", 4)
				sandbox_message("Notoriety Ronin locked at 4")
				reset_input_sequence()
			elseif codestring == "328" then
				clear_other_gang_notoriety("Ronin")
				notoriety_set("Ronin",5)
				notoriety_set_min("Ronin", 5)
				notoriety_set_max("Ronin", 5)
				sandbox_message("Notoriety Ronin locked at 5")
				reset_input_sequence()
			elseif codestring == "331" then
				clear_other_gang_notoriety("Brotherhood")
				notoriety_set("Brotherhood",0)
				notoriety_set_min("Brotherhood", 0)
				notoriety_set_max("Brotherhood", 0)
				sandbox_message("Notoriety Brotherhood locked at 0")
				reset_input_sequence()
			elseif codestring == "332" then
				clear_other_gang_notoriety("Brotherhood")
				notoriety_set("Brotherhood",1)
				notoriety_set_min("Brotherhood", 1)
				notoriety_set_max("Brotherhood", 1)
				sandbox_message("Notoriety Brotherhood locked at 1")
				reset_input_sequence()
			elseif codestring == "333" then
				clear_other_gang_notoriety("Brotherhood")
				notoriety_set("Brotherhood",2)
				notoriety_set_min("Brotherhood", 2)
				notoriety_set_max("Brotherhood", 2)
				sandbox_message("Notoriety Brotherhood locked at 2")
				reset_input_sequence()
			elseif codestring == "334" then
				clear_other_gang_notoriety("Brotherhood")
				notoriety_set("Brotherhood",3)
				notoriety_set_min("Brotherhood", 3)
				notoriety_set_max("Brotherhood", 3)
				sandbox_message("Notoriety Brotherhood locked at 3")
				reset_input_sequence()
			elseif codestring == "335" then
				clear_other_gang_notoriety("Brotherhood")
				notoriety_set("Brotherhood",4)
				notoriety_set_min("Brotherhood", 4)
				notoriety_set_max("Brotherhood", 4)
				sandbox_message("Notoriety Brotherhood locked at 4")
				reset_input_sequence()
			elseif codestring == "336" then
				clear_other_gang_notoriety("Brotherhood")
				notoriety_set("Brotherhood",5)
				notoriety_set_min("Brotherhood", 5)
				notoriety_set_max("Brotherhood", 5)
				sandbox_message("Notoriety Brotherhood locked at 5")
				reset_input_sequence()
			elseif codestring == "337" then
				notoriety_set("Police",0)
				notoriety_set_min("Police", 0)
				notoriety_set_max("Police", 0)
				sandbox_message("Notoriety Police locked at 0")
				reset_input_sequence()
			elseif codestring == "338" then
				notoriety_set("Police",1)
				notoriety_set_min("Police", 1)
				notoriety_set_max("Police", 1)
				sandbox_message("Notoriety Police locked at 1")
				reset_input_sequence()
			elseif codestring == "341" then
				notoriety_set("Police",2)
				notoriety_set_min("Police", 2)
				notoriety_set_max("Police", 2)
				sandbox_message("Notoriety Police locked at 2")
				reset_input_sequence()
			elseif codestring == "342" then
				notoriety_set("Police",3)
				notoriety_set_min("Police", 3)
				notoriety_set_max("Police", 3)
				sandbox_message("Notoriety Police locked at 3")
				reset_input_sequence()
			elseif codestring == "343" then
				notoriety_set("Police",4)
				notoriety_set_min("Police", 4)
				notoriety_set_max("Police", 4)
				sandbox_message("Notoriety Police locked at 4")
				reset_input_sequence()
			elseif codestring == "344" then
				notoriety_set("Police",5)
				notoriety_set_min("Police", 5)
				notoriety_set_max("Police", 5)
				sandbox_message("Notoriety Police locked at 5")
				reset_input_sequence()
			elseif codestring == "345" then
				remove_all_notoriety_locks()
				sandbox_message("All notoriety locks removed")
				reset_input_sequence()
			elseif codestring == "346" then
				remove_all_notoriety_locks()
				clear_all_notoriety()
				sandbox_message("All notoriety cleared")
				reset_input_sequence()
			elseif codestring == "347" then
				set_team( LOCAL_PLAYER , "Samedi")
				if COOP_COMMANDS_ACTIVE then
					set_team( REMOTE_PLAYER , "Samedi")
				end
				sandbox_message("Player team set to Samedi")
				reset_input_sequence()
			elseif codestring == "348" then
				set_team( LOCAL_PLAYER , "Ronin")
				if COOP_COMMANDS_ACTIVE then
					set_team( REMOTE_PLAYER , "Ronin")
				end
				sandbox_message("Player team set to Ronin")
				reset_input_sequence()
			elseif codestring == "351" then
				set_team( LOCAL_PLAYER , "Brotherhood")
				if COOP_COMMANDS_ACTIVE then
					set_team( REMOTE_PLAYER , "Brotherhood")
				end
				sandbox_message("Player team set to Brotherhood")
				reset_input_sequence()
			elseif codestring == "352" then
				set_team( LOCAL_PLAYER , "Police")
				if COOP_COMMANDS_ACTIVE then
					set_team( REMOTE_PLAYER , "Police")
				end
				sandbox_message("Player team set to Police")
				reset_input_sequence()
			elseif codestring == "353" then
				set_team( LOCAL_PLAYER , "Playas")
				if COOP_COMMANDS_ACTIVE then
					set_team( REMOTE_PLAYER , "Playas")
				end
				sandbox_message("Player team set to Saints")
				reset_input_sequence()
			elseif codestring == "354" then
				if not SPP_RESTRICTED_ZONES then
					notoriety_restricted_zones_enable(true)
					sandbox_message("Restricted zones enabled")
				else
					notoriety_restricted_zones_enable(false)
					sandbox_message("Restricted zones disabled")
				end
				SPP_RESTRICTED_ZONES = not SPP_RESTRICTED_ZONES
				reset_input_sequence()
			elseif codestring == "355" then
				if not SPP_INDOOR_GANG then
					notoriety_allow_indoor_gang_spawning(true)
					sandbox_message("RSSC notoriety gang spawn enabled")
				else
					notoriety_allow_indoor_gang_spawning(false)
					sandbox_message("RSSC notoriety gang spawn disabled")
				end
				SPP_INDOOR_GANG = not SPP_INDOOR_GANG
				reset_input_sequence()
			elseif codestring == "356" then
				local local_warped = false
				local remote_warped = false
				
				local player_vehicle, partner_vehicle = spp_get_player_vehicle_names()
				if player_vehicle ~= "" then
					teleport_vehicle_notoriety_pos(player_vehicle)
					local_warped = true
				end
				if partner_vehicle ~= "" then
					teleport_vehicle_notoriety_pos(partner_vehicle)
					remote_warped = true
				end
				
				if local_warped and remote_warped then
					sandbox_message("Notoriety Warp: Warped both players to a notoriety spawn location")
				elseif local_warped then
					sandbox_message("Notoriety Warp: Warped the player to a notoriety spawn location")
				elseif remote_warped then
					sandbox_message("Notoriety Warp: Warped the partner to a notoriety spawn location")
				else
					sandbox_message("Notoriety Warp: Player is not in a vehicle")
				end
				
				reset_input_sequence()
			elseif codestring == "361" then
				local mission_id = spp_get_active_mission_name()
				if mission_id == "" then
					sandbox_message("Mission is not active")
				elseif mission_id == "unknown" then
					sandbox_message("An unknown mission or diversion is active")
				elseif mission_is_complete(mission_id) then
					sandbox_message("Active Mission (Completed) : "..mission_id)
				else
					sandbox_message("Active Mission : "..mission_id)
				end
				reset_input_sequence()
			elseif codestring == "362" then
				if not SPP_ON_HOOD_CHANGED then
					on_hood_changed("", LOCAL_PLAYER)
					if COOP_COMMANDS_ACTIVE then
						on_hood_changed("", REMOTE_PLAYER)
					end
					sandbox_message("on_hood_changed disabled")
				else
					on_hood_changed("spp_on_hood_changed", LOCAL_PLAYER)
					if COOP_COMMANDS_ACTIVE then
						on_hood_changed("spp_on_hood_changed", REMOTE_PLAYER)
					end
					sandbox_message("on_hood_changed enabled")
				end
				SPP_ON_HOOD_CHANGED = not SPP_ON_HOOD_CHANGED
				reset_input_sequence()
			elseif codestring == "363" then
				if not SPP_ON_DISTRICT_CHANGED then
					on_district_changed("", LOCAL_PLAYER)
					if COOP_COMMANDS_ACTIVE then
						on_district_changed("", REMOTE_PLAYER)
					end
					sandbox_message("on_district_changed disabled")
				else
					on_district_changed("spp_on_district_changed", LOCAL_PLAYER)
					if COOP_COMMANDS_ACTIVE then
						on_district_changed("spp_on_district_changed", REMOTE_PLAYER)
					end
					sandbox_message("on_district_changed enabled")
				end
				SPP_ON_DISTRICT_CHANGED = not SPP_ON_DISTRICT_CHANGED
				reset_input_sequence()
			elseif codestring == "364" then
				if not SPP_ON_PURCHASE then
					on_purchase("")
					sandbox_message("on_purchase disabled")
				else
					on_purchase("spp_on_purchase")
					sandbox_message("on_purchase enabled")
				end
				SPP_ON_PURCHASE = not SPP_ON_PURCHASE
				reset_input_sequence()
			elseif codestring == "365" then
				if not SPP_ON_NOTORIETY_EVENT then
					on_notoriety_event("", LOCAL_PLAYER)
					if COOP_COMMANDS_ACTIVE then
						on_notoriety_event("", REMOTE_PLAYER)
					end
					sandbox_message("on_notoriety_event disabled")
				else
					on_notoriety_event("spp_on_notoriety_event", LOCAL_PLAYER)
					if COOP_COMMANDS_ACTIVE then
						on_notoriety_event("spp_on_notoriety_event", REMOTE_PLAYER)
					end
					sandbox_message("on_notoriety_event enabled")
				end
				SPP_ON_NOTORIETY_EVENT = not SPP_ON_NOTORIETY_EVENT
				reset_input_sequence()
			elseif codestring == "366" then
				if not SPP_ON_PROJECTILE_HIT then
					on_projectile_hit("")
					sandbox_message("on_projectile_hit disabled")
				else
					on_projectile_hit("spp_on_projectile_hit")
					sandbox_message("on_projectile_hit enabled")
				end
				SPP_ON_PROJECTILE_HIT = not SPP_ON_PROJECTILE_HIT
				reset_input_sequence()
			elseif codestring == "367" then
				if not SPP_ON_HIT_PED then
					on_hit_ped("", LOCAL_PLAYER)
					if COOP_COMMANDS_ACTIVE then
						on_hit_ped("", REMOTE_PLAYER)
					end
					sandbox_message("on_hit_ped disabled")
				else
					on_hit_ped("spp_on_hit_ped", LOCAL_PLAYER)
					if COOP_COMMANDS_ACTIVE then
						on_hit_ped("spp_on_hit_ped", REMOTE_PLAYER)
					end
					sandbox_message("on_hit_ped enabled")
				end
				SPP_ON_HIT_PED = not SPP_ON_HIT_PED
				reset_input_sequence()
			elseif codestring == "368" then
				local mission_id = spp_get_active_mission_name()
				if mission_id == "" then
					sandbox_message("on_random_human_killed can only be enabled in known missions")
				elseif mission_id == "unknown" then
					sandbox_message("on_random_human_killed cannot be enabled because this mission's ID is unknown")
				else
					if not SPP_ON_RANDOM_HUMAN_KILLED then
						on_random_human_killed("", mission_id)
						sandbox_message("on_random_human_killed disabled")
					else
						on_random_human_killed("spp_on_random_human_killed", mission_id)
						sandbox_message("on_random_human_killed enabled")
					end
					SPP_ON_RANDOM_HUMAN_KILLED = not SPP_ON_RANDOM_HUMAN_KILLED
				end
				reset_input_sequence()
			elseif codestring == "371" then
				local mission_id = spp_get_active_mission_name()
				if mission_id == "" then
					sandbox_message("on_random_mover_killed can only be enabled in known missions")
				elseif mission_id == "unknown" then
					sandbox_message("on_random_mover_killed cannot be enabled because this mission's ID is unknown")
				else
					if not SPP_ON_RANDOM_MOVER_KILLED then
						on_random_mover_killed("", mission_id)
						sandbox_message("on_random_mover_killed disabled")
					else
						on_random_mover_killed("spp_on_random_mover_killed", mission_id)
						sandbox_message("on_random_mover_killed enabled")
					end
					SPP_ON_RANDOM_MOVER_KILLED = not SPP_ON_RANDOM_MOVER_KILLED
				end
				reset_input_sequence()
			elseif codestring == "372" then
				local mission_id = spp_get_active_mission_name()
				if mission_id == "" then
					sandbox_message("on_random_vehicle_killed can only be enabled in known missions")
				elseif mission_id == "unknown" then
					sandbox_message("on_random_vehicle_killed cannot be enabled because this mission's ID is unknown")
				else
					if not SPP_ON_RANDOM_VEHICLE_KILLED then
						on_random_vehicle_killed("", mission_id)
						sandbox_message("on_random_vehicle_killed disabled")
					else
						on_random_vehicle_killed("spp_on_random_vehicle_killed", mission_id)
						sandbox_message("on_random_vehicle_killed enabled")
					end
					SPP_ON_RANDOM_VEHICLE_KILLED = not SPP_ON_RANDOM_VEHICLE_KILLED
				end
				reset_input_sequence()
			elseif codestring == "373" then
				if not SPP_ON_TAKE_DAMAGE then
					on_take_damage("", LOCAL_PLAYER)
					if COOP_COMMANDS_ACTIVE then
						on_take_damage("", REMOTE_PLAYER)
					end
					sandbox_message("on_take_damage disabled")
				else
					on_take_damage("spp_on_take_damage", LOCAL_PLAYER)
					if COOP_COMMANDS_ACTIVE then
						on_take_damage("spp_on_take_damage", REMOTE_PLAYER)
					end
					sandbox_message("on_take_damage enabled")
				end
				SPP_ON_TAKE_DAMAGE = not SPP_ON_TAKE_DAMAGE
				reset_input_sequence()
			elseif codestring == "374" then
				if not SPP_ON_COLLISION then
					on_collision("", LOCAL_PLAYER)
					if COOP_COMMANDS_ACTIVE then
						on_collision("", REMOTE_PLAYER)
					end
					sandbox_message("on_collision disabled")
				else
					on_collision("spp_on_collision", LOCAL_PLAYER)
					if COOP_COMMANDS_ACTIVE then
						on_collision("spp_on_collision", REMOTE_PLAYER)
					end
					sandbox_message("on_collision enabled")
				end
				SPP_ON_COLLISION = not SPP_ON_COLLISION
				reset_input_sequence()
			elseif codestring == "375" then
				if not SPP_ON_VEHICLE_STUNT then
					on_vehicle_stunt("", LOCAL_PLAYER)
					if COOP_COMMANDS_ACTIVE then
						on_vehicle_stunt("", REMOTE_PLAYER)
					end
					sandbox_message("on_vehicle_stunt disabled")
				else
					on_vehicle_stunt("spp_on_vehicle_stunt", LOCAL_PLAYER)
					if COOP_COMMANDS_ACTIVE then
						on_vehicle_stunt("spp_on_vehicle_stunt", REMOTE_PLAYER)
					end
					sandbox_message("on_vehicle_stunt enabled")
				end
				SPP_ON_VEHICLE_STUNT = not SPP_ON_VEHICLE_STUNT
				reset_input_sequence()
			elseif codestring == "376" then
				if coop_is_active() then
					local v1 = get_char_vehicle_type_name(LOCAL_PLAYER)
					local v2 = get_char_vehicle_type_name(REMOTE_PLAYER)
					if v1 == "" then
						v1 = "(none)"
					end
					if v2 == "" then
						v2 = "(none)"
					end
					sandbox_message("Vehicle Type Host:"..tostring(v1)..", Partner:"..tostring(v2))
				else
					if character_is_in_vehicle(LOCAL_PLAYER) then
						local v = get_char_vehicle_type_name(LOCAL_PLAYER)
						sandbox_message("Vehicle Type: "..tostring(v))
					else
						sandbox_message("Vehicle Type: Player is not in a vehicle")
					end
				end
				reset_input_sequence()
				
			elseif codestring == "411" then
				clear_animation_state(LOCAL_PLAYER)
				if COOP_COMMANDS_ACTIVE then
					clear_animation_state(REMOTE_PLAYER)
				end
				sandbox_message("Current player animation cleared")
				reset_input_sequence()
			elseif codestring == "412" then
				spp_set_animation("Arcade Stand")
			elseif codestring == "413" then
				spp_set_animation("arrest cuffed")
			elseif codestring == "414" then
				spp_set_animation("atm using")
			elseif codestring == "415" then
				spp_set_animation("back liedown")
			elseif codestring == "416" then
				spp_set_animation("BeachChair Sit")
			elseif codestring == "417" then
				spp_set_animation("BeachTowel Lay A")
			elseif codestring == "418" then
				spp_set_animation("BeachTowel Lay B")
			elseif codestring == "421" then
				spp_set_animation("Begger Stand")
			elseif codestring == "422" then
				spp_set_animation("Bench Beverage")
			elseif codestring == "423" then
				spp_set_animation("Bench Cellphone")
			elseif codestring == "424" then
				spp_set_animation("Bench Laptop")
			elseif codestring == "425" then
				spp_set_animation("Bench Lean")
			elseif codestring == "426" then
				spp_set_animation("Bench Newspaper")
			elseif codestring == "427" then
				spp_set_animation("BlackJack Sit")
			elseif codestring == "428" then
				spp_set_animation("blunt smoking B")
			elseif codestring == "431" then
				spp_set_animation("blunt smoking")
			elseif codestring == "432" then
				spp_set_animation("Bum sleep")
			elseif codestring == "433" then
				spp_set_animation("cell stand txt")
			elseif codestring == "434" then
				spp_set_animation("cell stand")
			elseif codestring == "435" then
				spp_set_animation("Chair Beverage")
			elseif codestring == "436" then
				spp_set_animation("Chair Cellphone")
			elseif codestring == "437" then
				spp_set_animation("Chair Cower A")
			elseif codestring == "438" then
				spp_set_animation("Chair Cower B")
			elseif codestring == "441" then
				spp_set_animation("Chair Cower C")
			elseif codestring == "442" then
				spp_set_animation("Chair Drink")
			elseif codestring == "443" then
				spp_set_animation("Chair Eat")
			elseif codestring == "444" then
				spp_set_animation("Chair Laptop")
			elseif codestring == "445" then
				spp_set_animation("Chair Newspaper")
			elseif codestring == "446" then
				spp_set_animation("Chair Sit")
			elseif codestring == "447" then
				spp_set_animation("Clipboard Stand")
			elseif codestring == "448" then
				spp_set_animation("Construction Hammer Kneel")
			elseif codestring == "451" then
				spp_set_animation("Construction Jackhammer")
			elseif codestring == "452" then
				spp_set_animation("Construction RoadSign Stand")
			elseif codestring == "453" then
				spp_set_animation("Construction Saw Stand")
			elseif codestring == "454" then
				spp_set_animation("cower run variant 1")
			elseif codestring == "455" then
				spp_set_animation("cower run variant 2")
			elseif codestring == "456" then
				spp_set_animation("cower run variant 3")
			elseif codestring == "457" then
				spp_set_animation("cower run variant 4")
			elseif codestring == "458" then
				spp_set_animation("cower run variant 5")
			elseif codestring == "461" then
				spp_set_animation("cower run")
			elseif codestring == "462" then
				spp_set_animation("cower stand variant 1")
			elseif codestring == "463" then
				spp_set_animation("cower stand variant 2")
			elseif codestring == "464" then
				spp_set_animation("cower stand variant 3")
			elseif codestring == "465" then
				spp_set_animation("cower stand")
			elseif codestring == "466" then
				spp_set_animation("cpr crouch pressing")
			elseif codestring == "467" then
				spp_set_animation("cpr crouch state 1")
			elseif codestring == "468" then
				spp_set_animation("cpr crouch state 2")
			elseif codestring == "471" then
				spp_set_animation("cpr liedown")
			elseif codestring == "472" then
				spp_set_animation("CRIB Sit Ground")
			elseif codestring == "473" then
				spp_set_animation("CRIB Steel Drums")
			elseif codestring == "474" then
				spp_set_animation("crouch eat")
			elseif codestring == "475" then
				spp_set_animation("crouch plant bomb")
			elseif codestring == "476" then
				spp_set_animation("dance a")
			elseif codestring == "477" then
				spp_set_animation("dance b")
			elseif codestring == "478" then
				spp_set_animation("dance c")
			elseif codestring == "481" then
				spp_set_animation("dance d")
			elseif codestring == "482" then
				spp_set_animation("defib crouch charging")
			elseif codestring == "483" then
				spp_set_animation("defib flinch facedown")
			elseif codestring == "484" then
				spp_set_animation("defib flinch faceup")
			elseif codestring == "485" then
				spp_set_animation("dial safe combo")
			elseif codestring == "486" then
				spp_set_animation("drunk flee walk A")
			elseif codestring == "487" then
				spp_set_animation("drunk flee walk B")
			elseif codestring == "488" then
				spp_set_animation("drunk run")
			elseif codestring == "511" then
				spp_set_animation("drunk stand")
			elseif codestring == "512" then
				spp_set_animation("drunk walk")
			elseif codestring == "513" then
				spp_set_animation("fall dead")
			elseif codestring == "514" then
				spp_set_animation("Fishing Stand")
			elseif codestring == "515" then
				spp_set_animation("FlashBanged")
			elseif codestring == "516" then
				spp_set_animation("flashing open stand")
			elseif codestring == "517" then
				spp_set_animation("Flee Walk A")
			elseif codestring == "518" then
				spp_set_animation("flip fall")
			elseif codestring == "521" then
				spp_set_animation("Flyer Stand")
			elseif codestring == "522" then
				spp_set_animation("forty drinking")
			elseif codestring == "523" then
				spp_set_animation("forty drinking B")
			elseif codestring == "524" then
				spp_set_animation("forty drinking walk")
			elseif codestring == "525" then
				spp_set_animation("GroundReading Sit")
			elseif codestring == "526" then
				spp_set_animation("guitar stand")
			elseif codestring == "527" then
				spp_set_animation("Gurney Sleep A")
			elseif codestring == "528" then
				spp_set_animation("Gurney Sleep B")
			elseif codestring == "531" then
				spp_set_animation("Head Cover Run")
			elseif codestring == "532" then
				spp_set_animation("Head Cover Stand")
			elseif codestring == "533" then
				spp_set_animation("Head Cover Walk")
			elseif codestring == "534" then
				spp_set_animation("HedgeTrimmer Stand")
			elseif codestring == "535" then
				spp_set_animation("Helmet Sit")
			elseif codestring == "536" then
				spp_set_animation("hose sprayed")
			elseif codestring == "537" then
				spp_set_animation("Inmate Bang Cup")
			elseif codestring == "538" then
				spp_set_animation("Inmate Bars Stand")
			elseif codestring == "541" then
				spp_set_animation("Inmate Curl Stand")
			elseif codestring == "542" then
				spp_set_animation("Inmate Harmonica Stand")
			elseif codestring == "543" then
				spp_set_animation("Inmate Scrub Kneel")
			elseif codestring == "544" then
				spp_set_animation("Inmate Write Sit")
			elseif codestring == "545" then
				spp_set_animation("Juggle")
			elseif codestring == "546" then
				spp_set_animation("Junkie Ground")
			elseif codestring == "547" then
				spp_set_animation("Lapdance Sit Get")
			elseif codestring == "548" then
				spp_set_animation("Lapdance Stand Give")
			elseif codestring == "551" then
				spp_set_animation("Laptop Ground")
			elseif codestring == "552" then
				spp_set_animation("Lawnchair Lounge")
			elseif codestring == "553" then
				spp_set_animation("Lawnchair Sit")
			elseif codestring == "554" then
				spp_set_animation("Lean")
			elseif codestring == "555" then
				spp_set_animation("Lifeguard Sit")
			elseif codestring == "556" then
				spp_set_animation("Limbo Dance A")
			elseif codestring == "557" then
				spp_set_animation("Limbo Dance B")
			elseif codestring == "558" then
				spp_set_animation("Limbo Pole Stand Left")
			elseif codestring == "561" then
				spp_set_animation("Limbo Pole Stand Right")
			elseif codestring == "562" then
				spp_set_animation("Lookout Stand")
			elseif codestring == "563" then
				spp_set_animation("Lounge")
			elseif codestring == "564" then
				spp_set_animation("Lover Sit A")
			elseif codestring == "565" then
				spp_set_animation("Lover Sit B")
			elseif codestring == "566" then
				spp_set_animation("Megaphone Stand")
			elseif codestring == "567" then
				spp_set_animation("Metal Detector Stand")
			elseif codestring == "568" then
				spp_set_animation("Mourn Crouch")
			elseif codestring == "571" then
				spp_set_animation("Nose Dive")
			elseif codestring == "572" then
				spp_set_animation("panic fall")
			elseif codestring == "573" then
				spp_set_animation("pant")
			elseif codestring == "574" then
				spp_set_animation("Piano Sit")
			elseif codestring == "575" then
				spp_set_animation("Picnic Sit A")
			elseif codestring == "576" then
				spp_set_animation("Picnic Sit B")
			elseif codestring == "577" then
				spp_set_animation("PicnicTable Drink")
			elseif codestring == "578" then
				spp_set_animation("PicnicTable Eat")
			elseif codestring == "581" then
				spp_set_animation("PicnicTable Sit")
			elseif codestring == "582" then
				spp_set_animation("Pinball Stand")
			elseif codestring == "583" then
				spp_set_animation("Poker Sit")
			elseif codestring == "584" then
				spp_set_animation("pole stand")
			elseif codestring == "585" then
				spp_set_animation("police call talk")
			elseif codestring == "586" then
				spp_set_animation("Pond Scoop Stand")
			elseif codestring == "587" then
				spp_set_animation("Pool Stand")
			elseif codestring == "588" then
				spp_set_animation("Pool Watch")
			elseif codestring == "611" then
				spp_set_animation("protest Stand")
			elseif codestring == "612" then
				spp_set_animation("Quartet Stand")
			elseif codestring == "613" then
				spp_set_animation("Rap Stand")
			elseif codestring == "614" then
				spp_set_animation("react car wreck")
			elseif codestring == "615" then
				spp_set_animation("react Cheer")
			elseif codestring == "616" then
				spp_set_animation("react Cheer 2")
			elseif codestring == "617" then
				spp_set_animation("react Over Body")
			elseif codestring == "618" then
				spp_set_animation("react PepperSpray Stand")
			elseif codestring == "621" then
				spp_set_animation("Security Scan Stand")
			elseif codestring == "622" then
				spp_set_animation("ShoppingBag Stand")
			elseif codestring == "623" then
				spp_set_animation("Singer Stand")
			elseif codestring == "624" then
				spp_set_animation("Sketchpad Sit")
			elseif codestring == "625" then
				spp_set_animation("sleep")
			elseif codestring == "626" then
				spp_set_animation("sleep b")
			elseif codestring == "627" then
				spp_set_animation("Slot Machine Sit")
			elseif codestring == "628" then
				spp_set_animation("Smoking B")
			elseif codestring == "631" then
				spp_set_animation("Sofa Cower A")
			elseif codestring == "632" then
				spp_set_animation("Sofa Cower B")
			elseif codestring == "633" then
				spp_set_animation("Sofa Sit")
			elseif codestring == "634" then
				spp_set_animation("Stool Beer")
			elseif codestring == "635" then
				spp_set_animation("Stool Cig")
			elseif codestring == "636" then
				spp_set_animation("Stool Sit")
			elseif codestring == "637" then
				spp_set_animation("streaking run")
			elseif codestring == "638" then
				spp_set_animation("streaking sprint")
			elseif codestring == "641" then
				spp_set_animation("streaking stand")
			elseif codestring == "642" then
				spp_set_animation("Suicide Stand")
			elseif codestring == "643" then
				spp_set_animation("surrender")
			elseif codestring == "644" then
				spp_set_animation("swim surface")
			elseif codestring == "645" then
				spp_set_animation("swim_slow")
			elseif codestring == "646" then
				spp_set_animation("tag stand")
			elseif codestring == "647" then
				spp_set_animation("TaiChi Stand")
			elseif codestring == "648" then
				spp_set_animation("Tap Dancer Stand")
			elseif codestring == "651" then
				spp_set_animation("Tourist Stand")
			elseif codestring == "652" then
				spp_set_animation("tread")
			elseif codestring == "653" then
				spp_set_animation("Umbrella Run")
			elseif codestring == "654" then
				spp_set_animation("Umbrella Stand")
			elseif codestring == "655" then
				spp_set_animation("Umbrella Walk")
			elseif codestring == "656" then
				spp_set_animation("vehicle surf handstand")
			elseif codestring == "657" then
				spp_set_animation("vehicle surf lean left")
			elseif codestring == "658" then
				spp_set_animation("vehicle surf lean right")
			elseif codestring == "661" then
				spp_set_animation("vehicle surf stand")
			elseif codestring == "662" then
				spp_set_animation("Warmhands Stand")
			elseif codestring == "663" then
				spp_set_animation("Watch Rain")
			elseif codestring == "664" then
				spp_set_animation("worried fall")
			elseif codestring == "665" then
				spp_set_animation("YKZA Sword Stand")
			elseif codestring == "666" then
				spp_set_animation("Yoga Sit")


			elseif codestring == "671" then
				spp_outfit_wear("Police Outfit")
			elseif codestring == "672" then
				spp_outfit_wear("Suit 1", "Crowd Control Outfit")
			elseif codestring == "673" then
				spp_outfit_wear("Sexy 1")
			elseif codestring == "674" then
				spp_outfit_wear("Street 1")
			elseif codestring == "675" then
				spp_outfit_wear("Crazy 1")
			elseif codestring == "676" then
				spp_outfit_wear("Repair", "Video Repair")
			elseif codestring == "677" then
				spp_outfit_wear("Streaker")
			elseif codestring == "678" then
				spp_outfit_wear("Suit purple man")
			elseif codestring == "681" then
				spp_outfit_wear("Suit purple woman")
			elseif codestring == "682" then
				spp_outfit_wear("Fire Fighter")
			elseif codestring == "683" then
				spp_outfit_wear("Pimp 1")
			elseif codestring == "684" then
				spp_outfit_wear("Fire Suit", "Fire Suit (Immune to Fire Damage)")
			elseif codestring == "685" then
				spp_outfit_wear("Prison")
			elseif codestring == "686" then
				spp_outfit_wear("Pirate")
			elseif codestring == "687" then
				spp_outfit_wear("Cat")
			elseif codestring == "688" then
				spp_outfit_wear("Evil Doctor")
			elseif codestring == "711" then
				spp_outfit_wear("Slasher 1")
			elseif codestring == "712" then
				spp_outfit_wear("Hippie")
			elseif codestring == "713" then
				spp_outfit_wear("Barbershop")
			elseif codestring == "714" then
				spp_outfit_wear("Construction")
			elseif codestring == "715" then
				spp_outfit_wear("Hazmat")
			elseif codestring == "716" then
				spp_outfit_wear("Clown")
			elseif codestring == "717" then
				spp_outfit_wear("Mime")
			elseif codestring == "718" then
				spp_outfit_wear("Japanese Streaker Female")
			elseif codestring == "721" then
				spp_outfit_wear("Japanese Streaker Male")
			elseif codestring == "722" then
				spp_outfit_wear("Indy")
			elseif codestring == "723" then
				spp_outfit_wear("Shaundi")
			elseif codestring == "724" then
				spp_outfit_wear("Gyros")
			elseif codestring == "725" then
				spp_outfit_wear("Tobias")
			elseif codestring == "726" then
				spp_outfit_wear("Veteran Child")
			elseif codestring == "727" then
				spp_outfit_wear("Mr Sunshine")
			elseif codestring == "728" then
				spp_outfit_wear("The General")
			elseif codestring == "731" then
				spp_outfit_wear("Donnie")
			elseif codestring == "732" then
				spp_outfit_wear("Jessica")
			elseif codestring == "733" then
				spp_outfit_wear("Matt")
			elseif codestring == "734" then
				spp_outfit_wear("Carlos")
			elseif codestring == "735" then
				spp_outfit_wear("Maero")
			elseif codestring == "736" then
				spp_outfit_wear("Jyunichi")
			elseif codestring == "737" then
				spp_outfit_wear("Shogo")
			elseif codestring == "738" then
				spp_outfit_wear("Pierce")
			elseif codestring == "741" then
				spp_outfit_wear("Wong")
			elseif codestring == "742" then
				spp_outfit_wear("Kazuo")
			elseif codestring == "743" then
				spp_outfit_wear("Gat")
			elseif codestring == "744" then
				spp_outfit_wear("Dane Vogel")
			elseif codestring == "745" then
				spp_outfit_wear("Julius")
			elseif codestring == "746" then
				spp_outfit_wear("Lara")
			elseif codestring == "747" then
				spp_outfit_wear("Solo")
			elseif codestring == "748" then
				spp_outfit_wear("Lara2")
			elseif codestring == "751" then
				spp_outfit_wear("Agent47")
			elseif codestring == "752" then
				spp_outfit_wear("Riddler")
			elseif codestring == "753" then
				spp_outfit_wear("Tommy")
			elseif codestring == "754" then
				spp_outfit_wear("Funkmaster")
			elseif codestring == "755" then
				spp_outfit_wear("Clockwork")
			elseif codestring == "756" then
				spp_outfit_wear("Pancho")
			elseif codestring == "757" then
				spp_outfit_wear("Zangief")
			elseif codestring == "758" then
				spp_outfit_wear("Diver")
			elseif codestring == "761" then
				spp_outfit_wear("Cage")
			elseif codestring == "762" then
				spp_outfit_wear("Devil Girl")
			elseif codestring == "763" then
				spp_outfit_wear("Joker")
			elseif codestring == "764" then
				spp_outfit_wear("OKUSA")
			elseif codestring == "765" then
				spp_outfit_wear("Fancy")
			elseif codestring == "766" then
				spp_outfit_wear("SamLunch")
			elseif codestring == "767" then
				spp_outfit_wear("Guile")
			elseif codestring == "768" then
				spp_outfit_wear("Firespite")
			elseif codestring == "771" then
				spp_outfit_wear("TC")
			elseif codestring == "772" then
				spp_outfit_wear("Mordrack")
			elseif codestring == "773" then
				spp_outfit_wear("Aisha")
			elseif codestring == "774" then
				spp_outfit_wear("Luz")
			elseif codestring == "775" then
				spp_outfit_wear("GatSuit")
			elseif codestring == "776" then
				spp_outfit_wear("Masako")
			elseif codestring == "777" then
				spp_outfit_wear("Swat")
			elseif codestring == "778" then
				spp_outfit_wear("FBI")
			elseif codestring == "781" then
				spp_outfit_wear("Goon")
			elseif codestring == "782" then
				spp_outfit_wear("LukeFighter")
			elseif codestring == "783" then
				spp_outfit_wear("Hulkster")
			elseif codestring == "784" then
				spp_outfit_wear("LupinGreen")
			elseif codestring == "785" then
				spp_outfit_wear("LupinRed")
			elseif codestring == "786" then
				spp_outfit_wear("Jigen")



			elseif codestring == "811" then
				if not SANDBOX_MESSAGES then
					mission_help_clear(SYNC_ALL)
					mission_help_table_nag("CODE ENTRY: "..codestring.."\n".."Sandbox+ messages toggled on in HUD", "", "", SYNC_ALL)
				else
					mission_help_clear(SYNC_ALL)
					mission_help_table_nag("CODE ENTRY: "..codestring.."\n".."Sandbox+ messages toggled off in HUD", "", "", SYNC_ALL)
				end
				SANDBOX_MESSAGES = not SANDBOX_MESSAGES		
				reset_input_sequence()
			elseif codestring == "812" then
				--toggle if coop commands are active (off by default)
				if coop_is_active() then
					if not COOP_COMMANDS_ACTIVE then
						sandbox_message("Sandbox+ commands now affect both host and remote player", LOCAL_PLAYER)
					else
						sandbox_message("Sandbox+ commands now only affect the host", LOCAL_PLAYER)
					end
					COOP_COMMANDS_ACTIVE = not COOP_COMMANDS_ACTIVE
				else
					sandbox_message("Coop is currently not active", LOCAL_PLAYER)
				end
				reset_input_sequence()
			elseif codestring == "813" then
				cash_add( 100000, LOCAL_PLAYER )
				if COOP_COMMANDS_ACTIVE then
					cash_add( 100000, REMOTE_PLAYER )
				end
				sandbox_message("Player received $100,000")
				reset_input_sequence()
			elseif codestring == "814" then
				local player_repaired = false
				local partner_repaired = false
				
				-- Repair Host Player's Vehicle
				local player_vehicle, partner_vehicle = spp_get_player_vehicle_names()
				if (player_vehicle ~= "") then
					vehicle_repair( player_vehicle )
					player_repaired = true
				end
				-- Repair Co-op Player's vehicle [nclok1405]
				if (partner_vehicle ~= "") then
					vehicle_repair( partner_vehicle )
					partner_repaired = true
				end
				
				if player_repaired and partner_repaired then
					sandbox_message("Both player's vehicles repaired")
				elseif player_repaired then
					sandbox_message("Player's vehicle repaired")
				elseif partner_repaired then
					sandbox_message("Partner's vehicle repaired")
				else
					sandbox_message("Player is not in a vehicle")
				end
				
				reset_input_sequence()
			elseif codestring == "815" then
				if not WEAPON_SWAP_DISABLED then
					inv_weapon_disable_all_but_this_slot( WEAPON_SLOT_UNARMED )
					sandbox_message("Player weapons are disabled", LOCAL_PLAYER)
				else
					inv_weapon_enable_or_disable_all_slots( true )
					sandbox_message("Player weapons are enabled", LOCAL_PLAYER)
				end
				WEAPON_SWAP_DISABLED = not WEAPON_SWAP_DISABLED
				reset_input_sequence()

			elseif codestring == "816" then
				if not SPP_COP_DRIVEBY then
					set_cops_shooting_from_vehicles(true)
					sandbox_message("Cops shooting from vehicles enabled")
				else
					set_cops_shooting_from_vehicles(false)
					sandbox_message("Cops shooting from vehicles disabled")
				end
				SPP_COP_DRIVEBY = not SPP_COP_DRIVEBY
				reset_input_sequence()
			elseif codestring == "817" then
				if SPP_SPAWNING_PEDS == 0 then
					set_ped_density(0)
					spawning_pedestrians(false)
					sandbox_message("Walking pedestrians spawn: Disabled")
					SPP_SPAWNING_PEDS = 1
				elseif SPP_SPAWNING_PEDS == 1 then
					set_ped_density(0.1)
					spawning_pedestrians(true)
					sandbox_message("Walking pedestrians spawn: 0.1")
					SPP_SPAWNING_PEDS = 2
				elseif SPP_SPAWNING_PEDS == 2 then
					set_ped_density(0.5)
					spawning_pedestrians(true)
					sandbox_message("Walking pedestrians spawn: 0.5")
					SPP_SPAWNING_PEDS = 3
				elseif SPP_SPAWNING_PEDS == 3 then
					set_ped_density(1)
					spawning_pedestrians(true)
					sandbox_message("Walking pedestrians spawn: 1.0")
					SPP_SPAWNING_PEDS = 4
				elseif SPP_SPAWNING_PEDS == 4 then
					set_ped_density(2)
					spawning_pedestrians(true)
					sandbox_message("Walking pedestrians spawn: 2.0")
					SPP_SPAWNING_PEDS = 0
				end
				reset_input_sequence()
			elseif codestring == "818" then
				if not SPP_SPAWNING_ACTION_NODE_PEDS then
					action_nodes_restrict_spawning(false)
					sandbox_message("Action-node (non-walking) pedestrians spawn enabled")
				else
					action_nodes_restrict_spawning(true)
					sandbox_message("Action-node (non-walking) pedestrians spawn disabled")
				end
				SPP_SPAWNING_ACTION_NODE_PEDS = not SPP_SPAWNING_ACTION_NODE_PEDS
				reset_input_sequence()
			elseif codestring == "821" then
				if not SPP_SPAWNING_VEHICLES then
					spawning_vehicles(true)
					sandbox_message("Traffic enabled")
				else
					spawning_vehicles(false)
					sandbox_message("Traffic disabled")
				end
				SPP_SPAWNING_VEHICLES = not SPP_SPAWNING_VEHICLES
				reset_input_sequence()
			elseif codestring == "822" then
				if SPP_ENABLE_TRAFFIC == 0 then
					set_traffic_density(0)
					sandbox_message("Civilian Traffic: Disabled")
					SPP_ENABLE_TRAFFIC = 1
				elseif SPP_ENABLE_TRAFFIC == 1 then
					set_traffic_density(0.1)
					sandbox_message("Civilian Traffic: 0.1")
					SPP_ENABLE_TRAFFIC = 2
				elseif SPP_ENABLE_TRAFFIC == 2 then
					set_traffic_density(0.5)
					sandbox_message("Civilian Traffic: 0.5")
					SPP_ENABLE_TRAFFIC = 3
				elseif SPP_ENABLE_TRAFFIC == 3 then
					set_traffic_density(1)
					sandbox_message("Civilian Traffic: 1.0")
					SPP_ENABLE_TRAFFIC = 4
				elseif SPP_ENABLE_TRAFFIC == 4 then
					set_traffic_density(2)
					sandbox_message("Civilian Traffic: 2.0")
					SPP_ENABLE_TRAFFIC = 0
				end
				reset_input_sequence()
			elseif codestring == "823" then
				if not SPP_ENABLE_AMBIENT_COP_SPAWNS then
					ambient_cop_spawn_enable(true)
					spawning_allow_cop_ambient_spawns(true)
					sandbox_message("Ambient Cop Spawn enabled")
				else
					ambient_cop_spawn_enable(false)
					spawning_allow_cop_ambient_spawns(false)
					sandbox_message("Ambient Cop Spawn disabled")
				end
				SPP_ENABLE_AMBIENT_COP_SPAWNS = not SPP_ENABLE_AMBIENT_COP_SPAWNS
				reset_input_sequence()
			elseif codestring == "824" then
				if not SPP_ENABLE_AMBIENT_GANG_SPAWNS then
					ambient_gang_spawn_enable(true)
					spawning_allow_gang_ambient_spawns(true)
					sandbox_message("Ambient Gang Spawn enabled")
				else
					ambient_gang_spawn_enable(false)
					spawning_allow_gang_ambient_spawns(false)
					sandbox_message("Ambient Gang Spawn disabled")
				end
				SPP_ENABLE_AMBIENT_GANG_SPAWNS = not SPP_ENABLE_AMBIENT_GANG_SPAWNS
				reset_input_sequence()
			elseif codestring == "825" then
				if not SPP_ENABLE_ROADBLOCKS then
					roadblocks_enable(true)
					sandbox_message("Roadblocks enabled")
				else
					roadblocks_enable(false)
					sandbox_message("Roadblocks disabled")
				end
				SPP_ENABLE_ROADBLOCKS = not SPP_ENABLE_ROADBLOCKS
				reset_input_sequence()
			elseif codestring == "826" then
				if not SPP_PED_BUMS then
					spawn_override_set_category("SH - UGCaverns - Bums")
					sandbox_message("Bum pedestrians enabled")
				else
					spawn_override_set_category("")
					sandbox_message("Bum pedestrians disabled")
				end
				SPP_PED_BUMS = not SPP_PED_BUMS
				reset_input_sequence()
			elseif codestring == "827" then
				if not SPP_ENABLE_BOATS then
					spawning_boats(true)
					sandbox_message("Boat spawning enabled")
				else
					spawning_boats(false)
					sandbox_message("Boat spawning disabled")
				end
				SPP_ENABLE_BOATS = not SPP_ENABLE_BOATS
				reset_input_sequence()
			elseif codestring == "828" then
				-- Collectibles Finder
				spp_remove_collectible_markers()
				
				if SPP_CD_FINDER == 0 then
					spp_add_cd_markers()
					sandbox_message("Collectibles Finder: CD")
					SPP_CD_FINDER = SPP_CD_FINDER + 1
				elseif SPP_CD_FINDER == 1 then
					spp_add_stunt_jump_markers(false)
					sandbox_message("Collectibles Finder: Stunt Jump 1-40")
					SPP_CD_FINDER = SPP_CD_FINDER + 1
				elseif SPP_CD_FINDER == 2 then
					spp_add_stunt_jump_markers(true)
					sandbox_message("Collectibles Finder: Stunt Jump 41-80")
					SPP_CD_FINDER = SPP_CD_FINDER + 1
				elseif SPP_CD_FINDER == 3 then
					spp_add_barnstorming_markers()
					sandbox_message("Collectibles Finder: Barnstorming")
					SPP_CD_FINDER = SPP_CD_FINDER + 1
				else
					sandbox_message("Collectibles Finder: Disabled")
					SPP_CD_FINDER = 0
				end
				
				reset_input_sequence()
			elseif codestring == "831" then
				if not SPP_HEALTH_REGEN then
					character_dont_regenerate(LOCAL_PLAYER, false)
					if COOP_COMMANDS_ACTIVE then
						character_dont_regenerate(REMOTE_PLAYER, false)
					end
					sandbox_message("Health regeneration enabled")
				else
					character_dont_regenerate(LOCAL_PLAYER, true)
					if COOP_COMMANDS_ACTIVE then
						character_dont_regenerate(REMOTE_PLAYER, true)
					end
					sandbox_message("Health regeneration disabled")
				end
				SPP_HEALTH_REGEN = not SPP_HEALTH_REGEN
				reset_input_sequence()
			elseif codestring == "832" then
				if Spp_stink_thread_handle == INVALID_THREAD_HANDLE then
					Spp_stink_thread_handle = thread_new("spp_stink_thread")	-- Peds run away thread
					sandbox_message("Pedestrians Run Away enabled")
				else
					thread_kill(Spp_stink_thread_handle)
					Spp_stink_thread_handle = INVALID_THREAD_HANDLE
					sandbox_message("Pedestrians Run Away disabled")
				end
				reset_input_sequence()
			elseif codestring == "833" then
				if not SPP_FORCE_PASSENGER_SEAT then
					player_force_vehicle_seat(LOCAL_PLAYER, 1)
					if COOP_COMMANDS_ACTIVE then
						player_force_vehicle_seat(REMOTE_PLAYER, 2)
					end
					sandbox_message("Force Passenger Seat enabled")
				else
					player_force_vehicle_seat(LOCAL_PLAYER, -1)
					if COOP_COMMANDS_ACTIVE then
						player_force_vehicle_seat(REMOTE_PLAYER, -1)
					end
					sandbox_message("Force Passenger Seat disabled")
				end
				SPP_FORCE_PASSENGER_SEAT = not SPP_FORCE_PASSENGER_SEAT
				reset_input_sequence()
			elseif codestring == "834" then
				if not character_hidden(LOCAL_PLAYER) then
					character_hide(LOCAL_PLAYER)
					if COOP_COMMANDS_ACTIVE then
						character_hide(REMOTE_PLAYER)
					end
					sandbox_message("Player hidden")
				else
					character_show(LOCAL_PLAYER)
					if COOP_COMMANDS_ACTIVE then
						character_show(REMOTE_PLAYER)
					end
					sandbox_message("Player unhide")
				end
				reset_input_sequence()
			elseif codestring == "835" then
				if SPP_INVERTED_SONG_OF_TIME == 0 then
					set_time_of_day_scale(0)
					sandbox_message("Time Speed: 0")
					SPP_INVERTED_SONG_OF_TIME = 1
				elseif SPP_INVERTED_SONG_OF_TIME == 1 then
					set_time_of_day_scale(50)
					sandbox_message("Time Speed: 50")
					SPP_INVERTED_SONG_OF_TIME = 2
				elseif SPP_INVERTED_SONG_OF_TIME == 2 then
					set_time_of_day_scale()
					sandbox_message("Time Speed: 100")
					SPP_INVERTED_SONG_OF_TIME = 3
				elseif SPP_INVERTED_SONG_OF_TIME == 3 then
					set_time_of_day_scale(200)
					sandbox_message("Time Speed: 200")
					SPP_INVERTED_SONG_OF_TIME = 4
				elseif SPP_INVERTED_SONG_OF_TIME == 4 then
					set_time_of_day_scale(500)
					sandbox_message("Time Speed: 500")
					SPP_INVERTED_SONG_OF_TIME = 5
				elseif SPP_INVERTED_SONG_OF_TIME == 5 then
					set_time_of_day_scale(1000)
					sandbox_message("Time Speed: 1000")
					SPP_INVERTED_SONG_OF_TIME = 6
				elseif SPP_INVERTED_SONG_OF_TIME == 6 then
					set_time_of_day_scale(5000)
					sandbox_message("Time Speed: 5000")
					SPP_INVERTED_SONG_OF_TIME = 7
				elseif SPP_INVERTED_SONG_OF_TIME == 7 then
					set_time_of_day_scale(10000)
					sandbox_message("Time Speed: 10000")
					SPP_INVERTED_SONG_OF_TIME = 8
				elseif SPP_INVERTED_SONG_OF_TIME == 8 then
					set_time_of_day_scale(100000)
					sandbox_message("Time Speed: 100000")
					SPP_INVERTED_SONG_OF_TIME = 0
				end
				reset_input_sequence()
			elseif codestring == "836" then
				set_time_of_day(SPP_HOUR, 0)
				sandbox_message("Hour set to: "..tostring(SPP_HOUR))
				SPP_HOUR = SPP_HOUR + 1
				if SPP_HOUR >= 24 then
					SPP_HOUR = 0
				end
				reset_input_sequence()
			elseif codestring == "837" then
				if SPP_WEATHER == 0 then
					set_weather(0, true)
					sandbox_message("Set Weather: Clear Skies")
					SPP_WEATHER = 1
				elseif SPP_WEATHER == 1 then
					set_weather(1, true)
					sandbox_message("Set Weather: Partly Cloudy")
					SPP_WEATHER = 2
				elseif SPP_WEATHER == 2 then
					set_weather(2, true)
					sandbox_message("Set Weather: Light Rain")
					SPP_WEATHER = 3
				elseif SPP_WEATHER == 3 then
					set_weather(3, true)
					sandbox_message("Set Weather: Overcast")
					SPP_WEATHER = 4
				elseif SPP_WEATHER == 4 then
					set_weather(4, true)
					sandbox_message("Set Weather: Pre-Storm")
					SPP_WEATHER = 5
				elseif SPP_WEATHER == 5 then
					set_weather(5, true)
					sandbox_message("Set Weather: Thunderstorm")
					SPP_WEATHER = 6
				elseif SPP_WEATHER == 6 then
					set_weather(6, true)
					sandbox_message("Set Weather: Post-Storm")
					SPP_WEATHER = 7
				elseif SPP_WEATHER == 7 then
					set_weather(7, true)
					sandbox_message("Set Weather: Vibrant")
					SPP_WEATHER = 8
				elseif SPP_WEATHER == 8 then
					set_weather(-1)
					sandbox_message("Set Weather: Weather Lock Cleared")
					SPP_WEATHER = 0
				end
				reset_input_sequence()
			elseif codestring == "838" then
				if SPP_RAGDOLL then
					character_allow_ragdoll(LOCAL_PLAYER, false)
					if COOP_COMMANDS_ACTIVE then
						character_allow_ragdoll(REMOTE_PLAYER, false)
					end
					sandbox_message("Player Ragdoll Disabled")
					SPP_RAGDOLL = false
				else
					character_allow_ragdoll(LOCAL_PLAYER, true)
					if COOP_COMMANDS_ACTIVE then
						character_allow_ragdoll(REMOTE_PLAYER, true)
					end
					sandbox_message("Player Ragdoll Enabled")
					SPP_RAGDOLL = true
				end
				reset_input_sequence()
			elseif codestring == "841" then
				character_evacuate_from_all_vehicles(LOCAL_PLAYER)
				if COOP_COMMANDS_ACTIVE then
					character_evacuate_from_all_vehicles(REMOTE_PLAYER)
				end
				sandbox_message("Player evacuate from a vehicle")
				reset_input_sequence()
			elseif codestring == "842" then
				if SPP_VEHICLE_ENTER_EXIT then
					set_player_can_enter_exit_vehicles(LOCAL_PLAYER, false)
					if COOP_COMMANDS_ACTIVE then
						set_player_can_enter_exit_vehicles(REMOTE_PLAYER, false)
					end
					sandbox_message("Vehicle Enter/Exit Disabled")
					SPP_VEHICLE_ENTER_EXIT = false
				else
					set_player_can_enter_exit_vehicles(LOCAL_PLAYER, true)
					if COOP_COMMANDS_ACTIVE then
						set_player_can_enter_exit_vehicles(REMOTE_PLAYER, true)
					end
					sandbox_message("Vehicle Enter/Exit Enabled")
					SPP_VEHICLE_ENTER_EXIT = true
				end
				reset_input_sequence()
			elseif codestring == "843" then
				local player_vehicle, partner_vehicle = spp_get_player_vehicle_names()
				if player_vehicle ~= "" then
					vehicle_infinite_mass(player_vehicle, SPP_VEHICLE_INFINITE_MASS)
				end
				if partner_vehicle ~= "" then
					vehicle_infinite_mass(partner_vehicle, SPP_VEHICLE_INFINITE_MASS)
				end
				if (player_vehicle ~= "") or (partner_vehicle ~= "") then
					if SPP_VEHICLE_INFINITE_MASS then
						sandbox_message("Vehicle Infinite Mass Enabled")
					else
						sandbox_message("Vehicle Infinite Mass Disabled")
					end
					SPP_VEHICLE_INFINITE_MASS = not SPP_VEHICLE_INFINITE_MASS
				else
					sandbox_message("Vehicle Infinite Mass: Player is not in a vehicle")
				end
				reset_input_sequence()
			elseif codestring == "844" then
				local player_vehicle, partner_vehicle = spp_get_player_vehicle_names()
				if player_vehicle ~= "" then
					local smoking, fire = vehicle_get_smoke_and_fire_state(player_vehicle)
					vehicle_set_smoke_and_fire_state(player_vehicle, (not smoking), fire)
				end
				if partner_vehicle ~= "" then
					local smoking, fire = vehicle_get_smoke_and_fire_state(partner_vehicle)
					vehicle_set_smoke_and_fire_state(partner_vehicle, (not smoking), fire)
				end
				if Spp_auto_repair_thread_handle ~= INVALID_THREAD_HANDLE then
					sandbox_message("Vehicle Smoke is not usable when Auto Repair is active")
				elseif (player_vehicle ~= "") or (partner_vehicle ~= "") then
					sandbox_message("Vehicle Smoke Toggled")
				else
					sandbox_message("Vehicle Smoke: Player is not in a vehicle")
				end
				reset_input_sequence()
			elseif codestring == "845" then
				local player_vehicle, partner_vehicle = spp_get_player_vehicle_names()
				if player_vehicle ~= "" then
					local smoking, fire = vehicle_get_smoke_and_fire_state(player_vehicle)
					vehicle_set_smoke_and_fire_state(player_vehicle, smoking, (not fire))
				end
				if partner_vehicle ~= "" then
					local smoking, fire = vehicle_get_smoke_and_fire_state(partner_vehicle)
					vehicle_set_smoke_and_fire_state(partner_vehicle, smoking, (not fire))
				end
				if Spp_auto_repair_thread_handle ~= INVALID_THREAD_HANDLE then
					sandbox_message("Vehicle Fire is not usable when Auto Repair is active")
				elseif (player_vehicle ~= "") or (partner_vehicle ~= "") then
					sandbox_message("Vehicle Fire Toggled")
				else
					sandbox_message("Vehicle Fire: Player is not in a vehicle")
				end
				reset_input_sequence()
			elseif codestring == "846" then
				local player_vehicle, partner_vehicle = spp_get_player_vehicle_names()
				if player_vehicle ~= "" then
					vehicle_suppress_flipping(player_vehicle, SPP_VEHICLE_SUPPRESS_FLIPPING)
				end
				if partner_vehicle ~= "" then
					vehicle_suppress_flipping(partner_vehicle, SPP_VEHICLE_SUPPRESS_FLIPPING)
				end
				if (player_vehicle ~= "") or (partner_vehicle ~= "") then
					if SPP_VEHICLE_SUPPRESS_FLIPPING then
						sandbox_message("Vehicle Suppress Flipping Enabled")
					else
						sandbox_message("Vehicle Suppress Flipping Disabled")
					end
					SPP_VEHICLE_SUPPRESS_FLIPPING = not SPP_VEHICLE_SUPPRESS_FLIPPING
				else
					sandbox_message("Vehicle Suppress Flipping: Player is not in a vehicle")
				end
				reset_input_sequence()
			elseif codestring == "847" then
				if Spp_auto_repair_thread_handle == INVALID_THREAD_HANDLE then
					Spp_auto_repair_thread_handle = thread_new("spp_auto_repair_thread")	-- Auto repair thread
					sandbox_message("Vehicle Auto Repair enabled")
				else
					thread_kill(Spp_auto_repair_thread_handle)
					Spp_auto_repair_thread_handle = INVALID_THREAD_HANDLE
					sandbox_message("Vehicle Auto Repair disabled")
				end
				reset_input_sequence()
			elseif codestring == "848" then
				-- interior = true, blocking = true, temporary = false
				if SPP_PHILLIPS_BUILDING then
					city_chunk_swap("SR2_IntSRMisPhiltwr", "blowup", true, true, false)
					sandbox_message("Phillips Building changed to blowup")
				else
					city_chunk_swap("SR2_IntSRMisPhiltwr", "normal", true, true, false)
					sandbox_message("Phillips Building changed to normal")
				end
				SPP_PHILLIPS_BUILDING = not SPP_PHILLIPS_BUILDING
				reset_input_sequence()
			elseif codestring == "851" then
				if SPP_INVULNERABLE then
					turn_invulnerable(LOCAL_PLAYER, false)
					if COOP_COMMANDS_ACTIVE then
						turn_invulnerable(REMOTE_PLAYER, false)
					end
					sandbox_message("Player Invulnerable")
				else
					turn_vulnerable(LOCAL_PLAYER)
					if COOP_COMMANDS_ACTIVE then
						turn_vulnerable(REMOTE_PLAYER)
					end
					sandbox_message("Player Vulnerable")
				end
				SPP_INVULNERABLE = not SPP_INVULNERABLE
				reset_input_sequence()
			elseif codestring == "852" then
				local multiplier
				if SPP_DAMAGE_MULTIPLIER == 0 then
					multiplier = 0.00
				elseif SPP_DAMAGE_MULTIPLIER == 1 then
					multiplier = 0.50
				elseif SPP_DAMAGE_MULTIPLIER == 2 then
					multiplier = 0.75
				elseif SPP_DAMAGE_MULTIPLIER == 3 then
					multiplier = 1.00
				elseif SPP_DAMAGE_MULTIPLIER == 4 then
					multiplier = 1.50
				elseif SPP_DAMAGE_MULTIPLIER == 5 then
					multiplier = 2.00
				end
				
				character_set_damage_multiplier(LOCAL_PLAYER, multiplier)
				if COOP_COMMANDS_ACTIVE then
					character_set_damage_multiplier(REMOTE_PLAYER, multiplier)
				end
				
				sandbox_message("Player Damage Multiplier set to "..tostring(multiplier))
				
				SPP_DAMAGE_MULTIPLIER = SPP_DAMAGE_MULTIPLIER + 1
				if SPP_DAMAGE_MULTIPLIER > 5 then
					SPP_DAMAGE_MULTIPLIER = 0
				end
				
				reset_input_sequence()
			elseif codestring == "853" then
				combat_enable_sword_parries(SPP_SWORD_COMBAT)
				combat_enable_sword_strafing(SPP_SWORD_COMBAT)
				if SPP_SWORD_COMBAT then
					sandbox_message("Sword Combat Enabled")
				else
					sandbox_message("Sword Combat Disabled")
				end
				SPP_SWORD_COMBAT = not SPP_SWORD_COMBAT
				reset_input_sequence()
			elseif codestring == "854" then
				if Spp_jyunichi_battle_audio_id == 0 then
					audio_throttle_type("Music", 0)
					Spp_jyunichi_battle_audio_id = audio_play("JYUNICHI_BATTLE")
					sandbox_message("Jyunichi Boss Music Started")
				else
					audio_stop(Spp_jyunichi_battle_audio_id)
					audio_throttle_type("Music", 1)
					Spp_jyunichi_battle_audio_id = 0
					sandbox_message("Jyunichi Boss Music Stopped")
				end
				reset_input_sequence()
			elseif codestring == "855" then
				if Spp_nitro_thread_handle == INVALID_THREAD_HANDLE then
					Spp_nitro_thread_handle = thread_new("spp_nitro_thread")
					sandbox_message("Super Nitro Enabled")
				else
					thread_kill(Spp_nitro_thread_handle)
					Spp_nitro_thread_handle = INVALID_THREAD_HANDLE
					sandbox_message("Super Nitro Disabled")
				end
				reset_input_sequence()
			elseif codestring == "856" then
				if not SPP_ACTION_NODES then
					action_nodes_enable(false)
					sandbox_message("All Action Nodes disabled")
				else
					action_nodes_enable(true)
					sandbox_message("All Action Nodes enabled")
				end
				SPP_ACTION_NODES = not SPP_ACTION_NODES
				reset_input_sequence()
			elseif codestring == "857" then
				team_despawn("Playas")
				sandbox_message("Saints Despawned")
				reset_input_sequence()
			elseif codestring == "858" then
				team_despawn("Civilian")
				sandbox_message("Civilian Despawned")
				reset_input_sequence()
			elseif codestring == "861" then
				team_despawn("Police")
				sandbox_message("Police Despawned")
				reset_input_sequence()
			elseif codestring == "862" then
				team_despawn("Ultor")
				sandbox_message("Ultor Despawned")
				reset_input_sequence()
			elseif codestring == "863" then
				team_despawn("Brotherhood")
				sandbox_message("Brotherhood Despawned")
				reset_input_sequence()
			elseif codestring == "864" then
				team_despawn("Ronin")
				sandbox_message("Ronin Despawned")
				reset_input_sequence()
			elseif codestring == "865" then
				team_despawn("Samedi")
				sandbox_message("Samedi Despawned")
				reset_input_sequence()
			elseif codestring == "866" then
				team_despawn("Neutral Gang")
				sandbox_message("Neutral Gang Despawned")
				reset_input_sequence()
			elseif codestring == "867" then
				team_despawn("Playas")
				team_despawn("Civilian")
				team_despawn("Police")
				team_despawn("Ultor")
				team_despawn("Brotherhood")
				team_despawn("Ronin")
				team_despawn("Samedi")
				team_despawn("Neutral Gang")
				sandbox_message("All Teams Despawned")
				reset_input_sequence()
			elseif codestring == "868" then
				if not SPP_AMBIENT_BROTHERHOOD then
					spawning_allow_gang_team_ambient_spawns(HUMAN_TEAM_BROTHERHOOD, false)
					sandbox_message("Ambient Brotherhood Spawn disabled")
				else
					spawning_allow_gang_team_ambient_spawns(HUMAN_TEAM_BROTHERHOOD, true)
					sandbox_message("Ambient Brotherhood Spawn enabled")
				end
				SPP_AMBIENT_BROTHERHOOD = not SPP_AMBIENT_BROTHERHOOD
				reset_input_sequence()
			elseif codestring == "871" then
				if not SPP_AMBIENT_RONIN then
					spawning_allow_gang_team_ambient_spawns(HUMAN_TEAM_RONIN, false)
					sandbox_message("Ambient Ronin Spawn disabled")
				else
					spawning_allow_gang_team_ambient_spawns(HUMAN_TEAM_RONIN, true)
					sandbox_message("Ambient Ronin Spawn enabled")
				end
				SPP_AMBIENT_RONIN = not SPP_AMBIENT_RONIN
				reset_input_sequence()
			elseif codestring == "872" then
				if not SPP_AMBIENT_SAMEDI then
					spawning_allow_gang_team_ambient_spawns(HUMAN_TEAM_SAMEDI, false)
					sandbox_message("Ambient Samedi Spawn disabled")
				else
					spawning_allow_gang_team_ambient_spawns(HUMAN_TEAM_SAMEDI, true)
					sandbox_message("Ambient Samedi Spawn enabled")
				end
				SPP_AMBIENT_SAMEDI = not SPP_AMBIENT_SAMEDI
				reset_input_sequence()
			elseif codestring == "873" then
				if Spp_walking_bomb_thread_handle == INVALID_THREAD_HANDLE then
					Spp_walking_bomb_thread_handle = thread_new("spp_walking_bomb")
					sandbox_message("Walking Bomb enabled")
				else
					thread_kill(Spp_walking_bomb_thread_handle)
					Spp_walking_bomb_thread_handle = INVALID_THREAD_HANDLE
					sandbox_message("Walking Bomb disabled")
				end
				reset_input_sequence()
			elseif codestring == "874" then
				explosion_create("Car Bomb", LOCAL_PLAYER, "", true)
				if COOP_COMMANDS_ACTIVE then
					explosion_create("Car Bomb", REMOTE_PLAYER, "", true)
				end
				sandbox_message("Created an explosion: Car Bomb")
				reset_input_sequence()
			elseif codestring == "875" then
				explosion_create("Car Bomb Big", LOCAL_PLAYER, "", true)
				if COOP_COMMANDS_ACTIVE then
					explosion_create("Car Bomb Big", REMOTE_PLAYER, "", true)
				end
				sandbox_message("Created an explosion: Car Bomb Big")
				reset_input_sequence()
			elseif codestring == "876" then
				attack_heli_destroy(0)
				attack_heli_create("sr2_city_$player_start", 0)
				local heli = attack_heli_get_heli_name(0)
				teleport_vehicle_notoriety_pos(heli)
				thread_new("spp_add_temp_vehicle_marker", heli, 10)
				sandbox_message("Spawned a Ronin Helicopter ("..heli..")")
				reset_input_sequence()
			elseif codestring == "877" then
				trigger_enable("cribs_sr2_city_$SB_Dock_crib_cash", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$SB_Dock_crib_weapons", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$SB_Dock_crib_clothing", SPP_CRIB_TRIGGERS)
				
				trigger_enable("cribs_sr2_city_$SU_Dock_crib_cash", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$SU_Dock_crib_weapons", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$SU_Dock_crib_clothing", SPP_CRIB_TRIGGERS)
				
				trigger_enable("cribs_sr2_city_$AI_crib_cash", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$AI_crib_weapons", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$AI_crib_clothing", SPP_CRIB_TRIGGERS)
				
				trigger_enable("cribs_sr2_city_$HE_crib_customize", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$HE_crib_cash", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$HE_crib_weapons", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$HE_crib_clothing", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$HE_crib_clipboard", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$HE_crib_radio", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$HE_crib_zombie", SPP_CRIB_TRIGGERS)
				
				trigger_enable("cribs_sr2_city_$PI_crib_weapons", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$PI_crib_clothes", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$PI_crib_cash", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$PI_crib_customize", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$PI_crib_tv", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$PI_crib_clipboard", SPP_CRIB_TRIGGERS)
				
				trigger_enable("cribs_sr2_city_$SR_crib_cash", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$SR_crib_tv", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$SR_crib_clothes", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$SR_crib_weapons", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$SR_crib_clipboard", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$SR_crib_customize", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$SR_crib_radio", SPP_CRIB_TRIGGERS)
				
				trigger_enable("cribs_sr2_city_$RL_crib_weapons", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$RL_crib_clothes", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$RL_crib_cash", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$RL_crib_tv", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$RL_crib_customize", SPP_CRIB_TRIGGERS)
				
				trigger_enable("cribs_sr2_city_$SU_crib_weapons", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$SU_crib_clothes", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$SU_crib_tv", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$SU_crib_radio", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$SU_crib_clipboard", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$SU_crib_customize", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$SU_crib_cash", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$SU_crib_clothes", SPP_CRIB_TRIGGERS)
				
				trigger_enable("cribs_sr2_city_$SHQ_weapons", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$SHQ_clothes", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$SHQ_crib_clipboard", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$SHQ_tv", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$SHQ_cash", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$SHQ_gang", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$SHQ_radio", SPP_CRIB_TRIGGERS)
				trigger_enable("redlight_$SHQ_heli_elevator_down", SPP_CRIB_TRIGGERS)
				trigger_enable("redlight_$SHQ_heli_elevator_up", SPP_CRIB_TRIGGERS)

				trigger_enable("cribs_sr2_city_$DT_crib_clothes", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$DT_crib_tv", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$DT_crib_weapons", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$DT_crib_cash", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$DT_crib_customize", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$DT_crib_radio", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$DT_crib_clipboard", SPP_CRIB_TRIGGERS)

				trigger_enable("cribs_sr2_city_$AI_cash", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$AI_weapons", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$AI_wardrobe", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$AI_tv", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$AI_radio", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$AI_crib_customize", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$AI_clipboard", SPP_CRIB_TRIGGERS)
				trigger_enable("airport_$AI_crib_elevator_up", SPP_CRIB_TRIGGERS)
				trigger_enable("airport_$AI_crib_elevator_down", SPP_CRIB_TRIGGERS)

				trigger_enable("cribs_sr2_city_$SB_Aisha_tv", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$SB_Aisha_cash", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$SB_Aisha_clothes", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$SB_Aisha_weapons", SPP_CRIB_TRIGGERS)
				trigger_enable("suburbs_$SB_aisha_in", SPP_CRIB_TRIGGERS)
				trigger_enable("suburbs_$SB_aisha_out", SPP_CRIB_TRIGGERS)
				
				trigger_enable("cribs_sr2_city_$YT_ultor_weapons", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$YT_ultor_clothes", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$YT_ultor_cash", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$YT_ultor_clipboard", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$YT_ultor_tv", SPP_CRIB_TRIGGERS)
				
				trigger_enable("cribs_sr2_city_$PB_in", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$PB_out", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$PB_heli_in", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$PB_heli_out", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$PB_weapons", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$PB_clothes", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$PB_cash", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$PB_clipboard", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$PB_arena_in", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$PB_arena_out", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$PB_tohoku_in", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$PB_tohoku_out", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$PB_island_in", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$PB_island_out", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$PB_gym_in", SPP_CRIB_TRIGGERS)
				trigger_enable("cribs_sr2_city_$PB_gym_out", SPP_CRIB_TRIGGERS)
				
				door_lock("cribs_sr2_city_$HE_door1", (not SPP_CRIB_TRIGGERS))
				door_lock("cribs_sr2_city_dt_crib_door01", (not SPP_CRIB_TRIGGERS))
				door_lock("cribs_sr2_city_PI_crib_door1", (not SPP_CRIB_TRIGGERS))
				door_lock("cribs_sr2_city_PI_crib_door2", (not SPP_CRIB_TRIGGERS))
				door_lock("cribs_sr2_city_PI_crib_door3", (not SPP_CRIB_TRIGGERS))
				door_lock("cribs_sr2_city_PI_crib_door4", (not SPP_CRIB_TRIGGERS))
				door_lock("cribs_sr2_city_SR_crib_door1", (not SPP_CRIB_TRIGGERS))
				door_lock("cribs_sr2_city_$RL_crib_door1", (not SPP_CRIB_TRIGGERS))
				door_lock("cribs_sr2_city_$RL_crib_door1_alt", (not SPP_CRIB_TRIGGERS))
				door_lock("cribs_sr2_city_$SU_crib_door1", (not SPP_CRIB_TRIGGERS))
				door_lock("cribs_sr2_city_$SU_crib_door2", (not SPP_CRIB_TRIGGERS))
				door_lock("cribs_sr2_city_aicrib_door01", (not SPP_CRIB_TRIGGERS))
				
				if SPP_CRIB_TRIGGERS then
					sandbox_message("Enabled all Crib Triggers")
				else
					sandbox_message("Disabled all Crib Triggers")
				end
				
				SPP_CRIB_TRIGGERS = not SPP_CRIB_TRIGGERS
				reset_input_sequence()

			elseif codestring == "882" then
				local mission_id = spp_get_active_mission_name()
				if mission_id == "" then
					sandbox_message("Mission is not active")
				elseif mission_id == "unknown" then
					sandbox_message("An unknown mission or diversion is active")
				else
					sandbox_message("Completing Mission : "..mission_id)
					mission_end_success(mission_id)
				end
				reset_input_sequence()
			elseif codestring == "883" then
				spp_teleport("act_al_navs_fight_ar_center", "Fight Club Arena Inside Ring")
				reset_input_sequence()
			elseif codestring == "884" then
				spp_teleport("exploration_chunk542", "Super Secret Island")
				reset_input_sequence()
			elseif codestring == "885" then
				spp_teleport("cribs_sr2_city_$PB_arena_out", "Ultor Arena")
				reset_input_sequence()
			elseif codestring == "886" then
				spp_teleport("cribs_sr2_city_$PB_tohoku_out", "Tohoku Hotel")
				reset_input_sequence()
			elseif codestring == "887" then
				spp_teleport("cribs_sr2_city_$PB_gym_out", "Gymnasium")
				reset_input_sequence()
			elseif codestring == "888" then
				if SANDBOX_MESSAGES then
					mission_help_clear(SYNC_LOCAL)
					mission_help_table_nag("LAST CODE ENTERED: "..Spp_last_command_code.."\n"..Spp_last_command_text, "", "", SYNC_LOCAL)
				end
				reset_input_sequence()
			else
				if SANDBOX_MESSAGES then
					mission_help_clear(SYNC_LOCAL)
					mission_help_table_nag("CODE ENTRY: "..codestring.."\nFAILED", "", "", SYNC_LOCAL)
				end
				reset_input_sequence()
			end
		end

		thread_yield()
	end
end

function clear_other_gang_notoriety(current_gang)
	notoriety_set_min("Samedi", 0)
	notoriety_set_max("Samedi", 5)
	notoriety_set("Samedi",0)
	notoriety_set_min("Ronin", 0)
	notoriety_set_max("Ronin", 5)
	notoriety_set("Ronin",0)
	notoriety_set_min("Brotherhood", 0)
	notoriety_set_max("Brotherhood", 5)
	notoriety_set("Brotherhood",0)
end

function remove_all_notoriety_locks()
	notoriety_set_min("Police", 0)
	notoriety_set_max("Police", 5)
	notoriety_set_min("Samedi", 0)
	notoriety_set_max("Samedi", 5)
	notoriety_set_min("Ronin", 0)
	notoriety_set_max("Ronin", 5)
	notoriety_set_min("Brotherhood", 0)
	notoriety_set_max("Brotherhood", 5)
end

function clear_all_notoriety()
	notoriety_set("Police", 0)
	notoriety_set("Samedi", 0)
	notoriety_set("Ronin", 0)
	notoriety_set("Brotherhood", 0)
end

function load_chunky()
	city_chunk_swap("sr2_chunk111", "yacht", false, true, false)
	city_chunk_swap("sr2_intsrmisyacht01empty", "yacht", true, true, false)
	debug_print("Gentlemen of the Row 1.9 Loaded \n")
	
	-- Repair Phillips Building after purchased [nclok1405] 
	if crib_is_unlocked("Ultor_Phillips") then
		city_chunk_swap("SR2_IntSRMisPhiltwr", "normal", true, true, false)
		debug_print("Phillips Building changed to normal because you bought its crib")
	end
end

function sr2_city_init()
	debug_print("sr2_city_init() called")
-- DISTRICTS
	airport_init()
	apartments_init()
	arena_init()
	barrio_init()
	chinatown_init()
	docks_init()
	downtown_init()
	factories_init()
	highend_init()
	hotels_init()
	museum_init()
	nuke_init()
	prison_init()
	projects_init()
	redlight_init()
	saintsrow_init()
	suburbs_init()
	subexp_init()
	trailerpark_init()
	truckyard_init()
	ultor_base_init()
	underground_init()
	university_init()

-- MISSIONS
	mission_globals_init()

-- STRONGHOLDS
	stronghold_globals_init()

end

function sr2_city_main()
	debug_print("sr2_city_main() called")
-- DISTRICTS
	thread_new("airport_main")
	thread_new("apartments_main")
	thread_new("arena_main")
	thread_new("barrio_main")
	thread_new("chinatown_main")
	thread_new("docks_main")
	thread_new("downtown_main")
	thread_new("factories_main")
	thread_new("highend_main")
	thread_new("hotels_main")
	thread_new("museum_main")
	thread_new("nuke_main")
	thread_new("prison_main")
	thread_new("projects_main")
	thread_new("redlight_main")
	thread_new("saintsrow_main")
	thread_new("suburbs_main")
	thread_new("subexp_main")
	thread_new("trailerpark_main")
	thread_new("truckyard_main")
	thread_new("ultor_base_main")
	thread_new("underground_main")
	thread_new("university_main")

-- MISSIONS
	thread_new("tss01_main")	-- Third Street Saints (Prologue)
	thread_new("tss02_main")
	thread_new("tss03_main")
	thread_new("tss04_main")

	thread_new("bh01_main")		-- The Brotherhood
	thread_new("bh02_main")
	thread_new("bh03_main")
	thread_new("bh04_main")
	thread_new("bh05_main")
	thread_new("bh06_main")
	thread_new("bh07_main")
	thread_new("bh08_main")
	thread_new("bh09_main")
	thread_new("bh10_main")
	thread_new("bh11_main")

	thread_new("rn01_main")		-- The Ronin
	thread_new("rn02_main")
	thread_new("rn03_main")
	thread_new("rn04_main")
	thread_new("rn05_main")
	thread_new("rn06_main")
	thread_new("rn07_main")
	thread_new("rn08_main")
	thread_new("rn09_main")
	thread_new("rn10_main")
	thread_new("rn11_main")

	thread_new("ss01_main")		-- Sons of Samedi
	thread_new("ss02_main")
	thread_new("ss03_main")
	thread_new("ss04_main")
	thread_new("ss05_main")
	thread_new("ss06_main")
	thread_new("ss07_main")
	thread_new("ss08_main")
	thread_new("ss09_main")
	thread_new("ss10_main")
	thread_new("ss11_main")

	thread_new("ep01_main")		-- Epilogue Missions
	thread_new("ep02_main")
	thread_new("ep03_main")
	thread_new("ep04_main")

	thread_new("em01_main")		-- Emergent Missions
	thread_new("em02_main")

	--thread_new("dlc04_main")	-- Custom Missions
	--thread_new("dlc05_main")

-- STRONGHOLDS ???????


	load_chunky() -- Loads yacht chunks for crib
	Keycombo_Handle = thread_new("keycombo_thread") -- Sandbox+ thread
	
	-- Cop driveby [nclok1405]
	SPP_COP_DRIVEBY = SPP_OPTIONS_COP_DRIVEBY
	if SPP_COP_DRIVEBY then
		set_cops_shooting_from_vehicles(true)
		debug_print("Cop drive-by enabled by default on sr2_city.lua")
	end
end
