-- sr2_city.lua
-- Master Lua Script for Saints Row 2
-- 3/28/07

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
Burning_State = true
Barn_State = true

--Special Command vars
VEHICLE_INVULNERABLE = false
COOP_COMMANDS_ACTIVE = false
SANDBOX_MESSAGES = true
WEAPON_SWAP_DISABLED = false

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


function reset_input_sequence()
	debug_print("RESET INPUT SEQUENCE")
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
end

function input_code_two_activated()
	INPUT_CODE_TWO = true
	debug_print("CODESTRING: "..codestring)
	--mission_help_table("CODESTRING: "..codestring, LOCAL_PLAYER)
end

function input_code_three_activated()
	INPUT_CODE_THREE = true
	INPUT_CODE_READY = true
	debug_print("CODESTRING: "..codestring)
	--mission_help_table("CODESTRING: "..codestring, LOCAL_PLAYER)
end


function sandbox_message(text,player)
	if SANDBOX_MESSAGES == true then
		objective_text_clear(0)
		mission_help_table("CODE ENTRY: "..codestring.."\n"..text, player)
	end
end

function keycombo_thread()
	while (1) do

		-- Reset everything if normal keys other than 888 are hit. This cancels the sequence
		if player_button_just_pressed(PC_BTN_ATTACK) or player_button_just_pressed(PC_BTN_SPRINT) or player_button_just_pressed(PC_BTN_ACTION) or player_button_just_pressed(PC_BTN_MOVE_UP) then 
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

				mission_help_table("READY FOR CODE ENTRY", LOCAL_PLAYER)
			end
		elseif CODETHREE == true and INPUT_CODE_ONE == false then
			if player_button_just_pressed(PC_BTN_SELECT_WEAPON_1) and CODETHREE == true then
				codestring = (codestring.."1")
				input_code_one_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_2) and CODETHREE == true then
				codestring = (codestring.."2")
				input_code_one_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_3) and CODETHREE == true then
				codestring = (codestring.."3")
				input_code_one_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_4) and CODETHREE == true then
				codestring = (codestring.."4")
				input_code_one_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_5) and CODETHREE == true then
				codestring = (codestring.."5")
				input_code_one_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_6) and CODETHREE == true then
				codestring = (codestring.."6")
				input_code_one_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_7) and CODETHREE == true then
				codestring = (codestring.."7")
				input_code_one_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_8) and CODETHREE == true then
				codestring = (codestring.."8")
				input_code_one_activated()
			end
		elseif INPUT_CODE_ONE == true and INPUT_CODE_TWO == false then
			if player_button_just_pressed(PC_BTN_SELECT_WEAPON_1) and CODETHREE == true then
				codestring = (codestring.."1")
				input_code_two_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_2) and CODETHREE == true then
				codestring = (codestring.."2")
				input_code_two_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_3) and CODETHREE == true then
				codestring = (codestring.."3")
				input_code_two_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_4) and CODETHREE == true then
				codestring = (codestring.."4")
				input_code_two_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_5) and CODETHREE == true then
				codestring = (codestring.."5")
				input_code_two_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_6) and CODETHREE == true then
				codestring = (codestring.."6")
				input_code_two_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_7) and CODETHREE == true then
				codestring = (codestring.."7")
				input_code_two_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_8) and CODETHREE == true then
				codestring = (codestring.."8")
				input_code_two_activated()
			end
		elseif INPUT_CODE_TWO == true and INPUT_CODE_THREE == false then
			if player_button_just_pressed(PC_BTN_SELECT_WEAPON_1) and CODETHREE == true then
				codestring = (codestring.."1")
				input_code_three_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_2) and CODETHREE == true then
				codestring = (codestring.."2")
				input_code_three_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_3) and CODETHREE == true then
				codestring = (codestring.."3")
				input_code_three_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_4) and CODETHREE == true then
				codestring = (codestring.."4")
				input_code_three_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_5) and CODETHREE == true then
				codestring = (codestring.."5")
				input_code_three_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_6) and CODETHREE == true then
				codestring = (codestring.."6")
				input_code_three_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_7) and CODETHREE == true then
				codestring = (codestring.."7")
				input_code_three_activated()
			elseif player_button_just_pressed(PC_BTN_SELECT_WEAPON_8) and CODETHREE == true then
				codestring = (codestring.."8")
				input_code_three_activated()
			end
		end

		if INPUT_CODE_READY == true then
			if codestring == "111" then
				teleport(LOCAL_PLAYER, "airport_$nav-warp")
				if COOP_COMMANDS_ACTIVE then
					teleport(REMOTE_PLAYER, "airport_$nav-warp")
				end
				sandbox_message("Teleported to Airport", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "112" then
				teleport(LOCAL_PLAYER, "apartments_$nav-warp")
				if COOP_COMMANDS_ACTIVE then
					teleport(REMOTE_PLAYER, "apartments_$nav-warp")
				end
				sandbox_message("Teleported to Apartments district", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "113" then
				teleport(LOCAL_PLAYER, "arena_$nav-warp")
				if COOP_COMMANDS_ACTIVE then
					teleport(REMOTE_PLAYER, "arena_$nav-warp")
				end
				sandbox_message("Teleported to Arena district", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "114" then
				teleport(LOCAL_PLAYER, "barrio_$nav-warp")
				if COOP_COMMANDS_ACTIVE then
					teleport(REMOTE_PLAYER, "barrio_$nav-warp")
				end
				sandbox_message("Teleported to Barrio district", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "115" then
				teleport(LOCAL_PLAYER, "chinatown_$nav-warp")
				if COOP_COMMANDS_ACTIVE then
					teleport(REMOTE_PLAYER, "chinatown_$nav-warp")
				end
				sandbox_message("Teleported to Chinatown district", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "116" then
				teleport(LOCAL_PLAYER, "docks_$nav-warp")
				if COOP_COMMANDS_ACTIVE then
					teleport(REMOTE_PLAYER, "docks_$nav-warp")
				end
				sandbox_message("Teleported to Docks district", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "117" then
				teleport(LOCAL_PLAYER, "downtown_$nav-warp")
				if COOP_COMMANDS_ACTIVE then
					teleport(REMOTE_PLAYER, "downtown_$nav-warp")
				end
				sandbox_message("Teleported to Downtown district", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "118" then
				teleport(LOCAL_PLAYER, "factories_$nav-warp")
				if COOP_COMMANDS_ACTIVE then
					teleport(REMOTE_PLAYER, "factories_$nav-warp")
				end
				sandbox_message("Teleported to Factories district", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "121" then
				teleport(LOCAL_PLAYER, "highend_$nav-warp")
				if COOP_COMMANDS_ACTIVE then
					teleport(REMOTE_PLAYER, "highend_$nav-warp")
				end
				sandbox_message("Teleported to Highend district", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "122" then
				teleport(LOCAL_PLAYER, "hotels_$nav-warp")
				if COOP_COMMANDS_ACTIVE then
					teleport(REMOTE_PLAYER, "hotels_$nav-warp")
				end
				sandbox_message("Teleported to Hotel and Marina district", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "123" then
				teleport(LOCAL_PLAYER, "museum_$nav-warp")
				if COOP_COMMANDS_ACTIVE then
					teleport(REMOTE_PLAYER, "museum_$nav-warp")
				end
				sandbox_message("Teleported to Museum district", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "124" then
				teleport(LOCAL_PLAYER, "nuke_$nav-warp")
				if COOP_COMMANDS_ACTIVE then
					teleport(REMOTE_PLAYER, "nuke_$nav-warp")
				end
				sandbox_message("Teleported to Nuke Plant", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "125" then
				teleport(LOCAL_PLAYER, "prison_$nav-warp")
				if COOP_COMMANDS_ACTIVE then
					teleport(REMOTE_PLAYER, "prison_$nav-warp")
				end
				sandbox_message("Teleported to Prison island", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "126" then
				teleport(LOCAL_PLAYER, "projects_$nav-warp")
				if COOP_COMMANDS_ACTIVE then
					teleport(REMOTE_PLAYER, "projects_$nav-warp")
				end
				sandbox_message("Teleported to Projects district", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "127" then
				teleport(LOCAL_PLAYER, "redlight_$nav-warp")
				if COOP_COMMANDS_ACTIVE then
					teleport(REMOTE_PLAYER, "redlight_$nav-warp")
				end
				sandbox_message("Teleported to Redlight district", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "128" then
				teleport(LOCAL_PLAYER, "saintsrow_$nav-warp")
				if COOP_COMMANDS_ACTIVE then
					teleport(REMOTE_PLAYER, "saintsrow_$nav-warp")
				end
				sandbox_message("Teleported to Saints Row district", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "131" then
				teleport(LOCAL_PLAYER, "suburbs_$nav-warp")
				if COOP_COMMANDS_ACTIVE then
					teleport(REMOTE_PLAYER, "suburbs_$nav-warp")
				end
				sandbox_message("Teleported to Suburbs district", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "132" then
				teleport(LOCAL_PLAYER, "subexp_$nav-warp")
				if COOP_COMMANDS_ACTIVE then
					teleport(REMOTE_PLAYER, "subexp_$nav-warp")
				end
				sandbox_message("Teleported to Suburbs Expansion district", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "133" then
				teleport(LOCAL_PLAYER, "trailerpark_$nav-warp")
				if COOP_COMMANDS_ACTIVE then
					teleport(REMOTE_PLAYER, "trailerpark_$nav-warp")
				end
				sandbox_message("Teleported to Trailer Park district", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "134" then
				teleport(LOCAL_PLAYER, "truckyard_$nav-warp")
				if COOP_COMMANDS_ACTIVE then
					teleport(REMOTE_PLAYER, "truckyard_$nav-warp")
				end
				sandbox_message("Teleported to Truckyard district", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "135" then
				teleport(LOCAL_PLAYER, "university_$nav-warp")
				if COOP_COMMANDS_ACTIVE then
					teleport(REMOTE_PLAYER, "university_$nav-warp")
				end
				sandbox_message("Teleported to Stilwater University district", LOCAL_PLAYER)
				reset_input_sequence()

			elseif codestring == "141" then
				teleport(LOCAL_PLAYER, "cribs_sr2_city_$HE_crib_clothing")
				if COOP_COMMANDS_ACTIVE then
					teleport(REMOTE_PLAYER, "cribs_sr2_city_$HE_crib_clothing")
				end
				sandbox_message("Teleported to Penthouse Loft crib", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "142" then
				teleport(LOCAL_PLAYER, "cribs_sr2_city_$PI_crib_clothes")
				if COOP_COMMANDS_ACTIVE then
					teleport(REMOTE_PLAYER, "cribs_sr2_city_$PI_crib_clothes")
				end
				sandbox_message("Teleported to Prison Lighthouse crib", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "143" then
				teleport(LOCAL_PLAYER, "cribs_sr2_city_$SR_crib_clothes")
				if COOP_COMMANDS_ACTIVE then
					teleport(REMOTE_PLAYER, "cribs_sr2_city_$SR_crib_clothes")
				end
				sandbox_message("Teleported to Saints Row Mega Condo", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "144" then
				teleport(LOCAL_PLAYER, "cribs_sr2_city_$RL_crib_clothes")
				if COOP_COMMANDS_ACTIVE then
					teleport(REMOTE_PLAYER, "cribs_sr2_city_$RL_crib_clothes")
				end
				sandbox_message("Teleported to Red Light Loft crib", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "145" then
				teleport(LOCAL_PLAYER, "cribs_sr2_city_$SU_crib_clothes")
				if COOP_COMMANDS_ACTIVE then
					teleport(REMOTE_PLAYER, "cribs_sr2_city_$SU_crib_clothes")
				end
				sandbox_message("Teleported to University Loft crib", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "146" then
				teleport(LOCAL_PLAYER, "cribs_sr2_city_$SHQ_clothes")
				if COOP_COMMANDS_ACTIVE then
					teleport(REMOTE_PLAYER, "cribs_sr2_city_$SHQ_clothes")
				end
				sandbox_message("Teleported to Saints HQ crib", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "147" then
				teleport(LOCAL_PLAYER, "cribs_sr2_city_$DT_crib_clothes")
				if COOP_COMMANDS_ACTIVE then
					teleport(REMOTE_PLAYER, "cribs_sr2_city_$DT_crib_clothes")
				end
				sandbox_message("Teleported to Downtown Loft crib", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "148" then
				teleport(LOCAL_PLAYER, "cribs_sr2_city_$AI_wardrobe")
				if COOP_COMMANDS_ACTIVE then
					teleport(REMOTE_PLAYER, "cribs_sr2_city_$AI_wardrobe")
				end
				sandbox_message("Teleported to Hotel Penthouse crib", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "151" then
				teleport(LOCAL_PLAYER, "cribs_sr2_city_$AI_Hangar")
				if COOP_COMMANDS_ACTIVE then
					teleport(REMOTE_PLAYER, "cribs_sr2_city_$AI_Hangar")
				end
				sandbox_message("Teleported to Airplane Hangar", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "152" then
				teleport(LOCAL_PLAYER, "cribs_sr2_city_$SU_Dock")
				if COOP_COMMANDS_ACTIVE then
					teleport(REMOTE_PLAYER, "cribs_sr2_city_$SU_Dock")
				end
				sandbox_message("Teleported to University Dock", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "153" then
				teleport(LOCAL_PLAYER, "cribs_sr2_city_$SB_Dock")
				if COOP_COMMANDS_ACTIVE then
					teleport(REMOTE_PLAYER, "cribs_sr2_city_$SB_Dock")
				end
				sandbox_message("Teleported to Suburbs Dock", LOCAL_PLAYER)
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
				if Burning_State then
					--city_chunk_swap("sr2_intprmismethlab01", "burned", true, true, false )
					--city_chunk_swap("sr2_intprmismethlab03", "Burned", true, true, false )
					--city_chunk_swap("sr2_intprmismethlab04", "Burned", true, true, false )
					city_chunk_swap("sr2_chunk093", "Burned", true, true, false )
					city_chunk_swap("sr2_chunk104", "Burned", true, true, false )
					sandbox_message("Projects and meth labs burning", LOCAL_PLAYER)
				else
					--city_chunk_swap("sr2_intprmismethlab01", "normal", true, true, false )
					--city_chunk_swap("sr2_intprmismethlab03", "normal", true, true, false )
					--city_chunk_swap("sr2_intprmismethlab04", "normal", true, true, false )
					city_chunk_swap("sr2_chunk093", "normal", true, true, false )
					city_chunk_swap("sr2_chunk104", "normal", true, true, false )
					sandbox_message("Projects returned to normal", LOCAL_PLAYER)
				end
				Burning_State = not Burning_State
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



			elseif codestring == "411" then
				clear_animation_state(LOCAL_PLAYER)
				sandbox_message("Current player animation cleared", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "412" then
				set_animation_state(LOCAL_PLAYER, "Arcade Stand")
				sandbox_message("Player animation Arcade Stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "413" then
				set_animation_state(LOCAL_PLAYER, "arrest cuffed")
				sandbox_message("Player animation arrest cuffed", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "414" then
				set_animation_state(LOCAL_PLAYER, "atm using")
				sandbox_message("Player animation atm using", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "415" then
				set_animation_state(LOCAL_PLAYER, "back liedown")
				sandbox_message("Player animation back liedown", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "416" then
				set_animation_state(LOCAL_PLAYER, "BeachChair Sit")
				sandbox_message("Player animation BeachChair Sit", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "417" then
				set_animation_state(LOCAL_PLAYER, "BeachTowel Lay A")
				sandbox_message("Player animation BeachTowel Lay A", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "418" then
				set_animation_state(LOCAL_PLAYER, "BeachTowel Lay B")
				sandbox_message("Player animation BeachTowel Lay B", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "421" then
				set_animation_state(LOCAL_PLAYER, "Begger Stand")
				sandbox_message("Player animation Begger Stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "422" then
				set_animation_state(LOCAL_PLAYER, "Bench Beverage")
				sandbox_message("Player animation Bench Beverage", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "423" then
				set_animation_state(LOCAL_PLAYER, "Bench Cellphone")
				sandbox_message("Player animation Bench Cellphone", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "424" then
				set_animation_state(LOCAL_PLAYER, "Bench Laptop")
				sandbox_message("Player animation Bench Laptop", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "425" then
				set_animation_state(LOCAL_PLAYER, "Bench Lean")
				sandbox_message("Player animation Bench Lean", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "426" then
				set_animation_state(LOCAL_PLAYER, "Bench Newspaper")
				sandbox_message("Player animation Bench Newspaper", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "427" then
				set_animation_state(LOCAL_PLAYER, "BlackJack Sit")
				sandbox_message("Player animation BlackJack Sit", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "428" then
				set_animation_state(LOCAL_PLAYER, "blunt smoking B")
				sandbox_message("Player animation blunt smoking B", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "431" then
				set_animation_state(LOCAL_PLAYER, "blunt smoking")
				sandbox_message("Player animation blunt smoking", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "432" then
				set_animation_state(LOCAL_PLAYER, "Bum sleep")
				sandbox_message("Player animation Bum sleep", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "433" then
				set_animation_state(LOCAL_PLAYER, "cell stand txt")
				sandbox_message("Player animation cell stand txt", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "434" then
				set_animation_state(LOCAL_PLAYER, "cell stand")
				sandbox_message("Player animation cell stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "435" then
				set_animation_state(LOCAL_PLAYER, "Chair Beverage")
				sandbox_message("Player animation Chair Beverage", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "436" then
				set_animation_state(LOCAL_PLAYER, "Chair Cellphone")
				sandbox_message("Player animation Chair Cellphone", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "437" then
				set_animation_state(LOCAL_PLAYER, "Chair Cower A")
				sandbox_message("Player animation Chair Cower A", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "438" then
				set_animation_state(LOCAL_PLAYER, "Chair Cower B")
				sandbox_message("Player animation Chair Cower B", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "441" then
				set_animation_state(LOCAL_PLAYER, "Chair Cower C")
				sandbox_message("Player animation Chair Cower C", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "442" then
				set_animation_state(LOCAL_PLAYER, "Chair Drink")
				sandbox_message("Player animation Chair Drink", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "443" then
				set_animation_state(LOCAL_PLAYER, "Chair Eat")
				sandbox_message("Player animation Chair Eat", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "444" then
				set_animation_state(LOCAL_PLAYER, "Chair Laptop")
				sandbox_message("Player animation Chair Laptop", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "445" then
				set_animation_state(LOCAL_PLAYER, "Chair Newspaper")
				sandbox_message("Player animation Chair Newspaper", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "446" then
				set_animation_state(LOCAL_PLAYER, "Chair Sit")
				sandbox_message("Player animation Chair Sit", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "447" then
				set_animation_state(LOCAL_PLAYER, "Clipboard Stand")
				sandbox_message("Player animation Clipboard Stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "448" then
				set_animation_state(LOCAL_PLAYER, "Construction Hammer Kneel")
				sandbox_message("Player animation Construction Hammer Kneel", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "451" then
				set_animation_state(LOCAL_PLAYER, "Construction Jackhammer")
				sandbox_message("Player animation Construction Jackhammer", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "452" then
				set_animation_state(LOCAL_PLAYER, "Construction RoadSign Stand")
				sandbox_message("Player animation Construction RoadSign Stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "453" then
				set_animation_state(LOCAL_PLAYER, "Construction Saw Stand")
				sandbox_message("Player animation Construction Saw Stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "454" then
				set_animation_state(LOCAL_PLAYER, "cower run variant 1")
				sandbox_message("Player animation cower run variant 1", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "455" then
				set_animation_state(LOCAL_PLAYER, "cower run variant 2")
				sandbox_message("Player animation cower run variant 2", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "456" then
				set_animation_state(LOCAL_PLAYER, "cower run variant 3")
				sandbox_message("Player animation cower run variant 3", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "457" then
				set_animation_state(LOCAL_PLAYER, "cower run variant 4")
				sandbox_message("Player animation cower run variant 4", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "458" then
				set_animation_state(LOCAL_PLAYER, "cower run variant 5")
				sandbox_message("Player animation cower run variant 5", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "461" then
				set_animation_state(LOCAL_PLAYER, "cower run")
				sandbox_message("Player animation cower run", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "462" then
				set_animation_state(LOCAL_PLAYER, "cower stand variant 1")
				sandbox_message("Player animation cower stand variant 1", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "463" then
				set_animation_state(LOCAL_PLAYER, "cower stand variant 2")
				sandbox_message("Player animation cower stand variant 2", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "464" then
				set_animation_state(LOCAL_PLAYER, "cower stand variant 3")
				sandbox_message("Player animation cower stand variant 3", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "465" then
				set_animation_state(LOCAL_PLAYER, "cower stand")
				sandbox_message("Player animation cower stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "466" then
				set_animation_state(LOCAL_PLAYER, "cpr crouch pressing")
				sandbox_message("Player animation cpr crouch pressing", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "467" then
				set_animation_state(LOCAL_PLAYER, "cpr crouch state 1")
				sandbox_message("Player animation cpr crouch state 1", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "468" then
				set_animation_state(LOCAL_PLAYER, "cpr crouch state 2")
				sandbox_message("Player animation cpr crouch state 2", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "471" then
				set_animation_state(LOCAL_PLAYER, "cpr liedown")
				sandbox_message("Player animation cpr liedown", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "472" then
				set_animation_state(LOCAL_PLAYER, "CRIB Sit Ground")
				sandbox_message("Player animation CRIB Sit Ground", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "473" then
				set_animation_state(LOCAL_PLAYER, "CRIB Steel Drums")
				sandbox_message("Player animation CRIB Steel Drums", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "474" then
				set_animation_state(LOCAL_PLAYER, "crouch eat")
				sandbox_message("Player animation crouch eat", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "475" then
				set_animation_state(LOCAL_PLAYER, "crouch plant bomb")
				sandbox_message("Player animation crouch plant bomb", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "476" then
				set_animation_state(LOCAL_PLAYER, "dance a")
				sandbox_message("Player animation Dance A", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "477" then
				set_animation_state(LOCAL_PLAYER, "dance b")
				sandbox_message("Player animation Dance B", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "478" then
				set_animation_state(LOCAL_PLAYER, "dance c")
				sandbox_message("Player animation Dance C", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "481" then
				set_animation_state(LOCAL_PLAYER, "dance d")
				sandbox_message("Player animation Dance D", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "482" then
				set_animation_state(LOCAL_PLAYER, "defib crouch charging")
				sandbox_message("Player animation defib crouch charging", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "483" then
				set_animation_state(LOCAL_PLAYER, "defib flinch facedown")
				sandbox_message("Player animation defib flinch facedown", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "484" then
				set_animation_state(LOCAL_PLAYER, "defib flinch faceup")
				sandbox_message("Player animation defib flinch faceup", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "485" then
				set_animation_state(LOCAL_PLAYER, "dial safe combo")
				sandbox_message("Player animation dial safe combo", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "486" then
				set_animation_state(LOCAL_PLAYER, "drunk flee walk A")
				sandbox_message("Player animation drunk flee walk A", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "487" then
				set_animation_state(LOCAL_PLAYER, "drunk flee walk B")
				sandbox_message("Player animation drunk flee walk B", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "488" then
				set_animation_state(LOCAL_PLAYER, "drunk run")
				sandbox_message("Player animation drunk run", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "511" then
				set_animation_state(LOCAL_PLAYER, "drunk stand")
				sandbox_message("Player animation drunk stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "512" then
				set_animation_state(LOCAL_PLAYER, "drunk walk")
				sandbox_message("Player animation drunk walk", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "513" then
				set_animation_state(LOCAL_PLAYER, "fall dead")
				sandbox_message("Player animation fall dead", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "514" then
				set_animation_state(LOCAL_PLAYER, "Fishing Stand")
				sandbox_message("Player animation Fishing Stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "515" then
				set_animation_state(LOCAL_PLAYER, "FlashBanged")
				sandbox_message("Player animation FlashBanged", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "516" then
				set_animation_state(LOCAL_PLAYER, "flashing open stand")
				sandbox_message("Player animation flashing open stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "517" then
				set_animation_state(LOCAL_PLAYER, "Flee Walk A")
				sandbox_message("Player animation Flee Walk A", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "518" then
				set_animation_state(LOCAL_PLAYER, "flip fall")
				sandbox_message("Player animation flip fall", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "521" then
				set_animation_state(LOCAL_PLAYER, "Flyer Stand")
				sandbox_message("Player animation Flyer Stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "522" then
				set_animation_state(LOCAL_PLAYER, "forty drinking")
				sandbox_message("Player animation forty drinking", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "523" then
				set_animation_state(LOCAL_PLAYER, "forty drinking B")
				sandbox_message("Player animation forty drinking B", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "524" then
				set_animation_state(LOCAL_PLAYER, "forty drinking walk")
				sandbox_message("Player animation forty drinking walk", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "525" then
				set_animation_state(LOCAL_PLAYER, "GroundReading Sit")
				sandbox_message("Player animation GroundReading Sit", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "526" then
				set_animation_state(LOCAL_PLAYER, "guitar stand")
				sandbox_message("Player animation guitar stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "527" then
				set_animation_state(LOCAL_PLAYER, "Gurney Sleep A")
				sandbox_message("Player animation Gurney Sleep A", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "528" then
				set_animation_state(LOCAL_PLAYER, "Gurney Sleep B")
				sandbox_message("Player animation Gurney Sleep B", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "531" then
				set_animation_state(LOCAL_PLAYER, "Head Cover Run")
				sandbox_message("Player animation Head Cover Run", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "532" then
				set_animation_state(LOCAL_PLAYER, "Head Cover Stand")
				sandbox_message("Player animation Head Cover Stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "533" then
				set_animation_state(LOCAL_PLAYER, "Head Cover Walk")
				sandbox_message("Player animation Head Cover Walk", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "534" then
				set_animation_state(LOCAL_PLAYER, "HedgeTrimmer Stand")
				sandbox_message("Player animation HedgeTrimmer Stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "535" then
				set_animation_state(LOCAL_PLAYER, "Helmet Sit")
				sandbox_message("Player animation Helmet Sit", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "536" then
				set_animation_state(LOCAL_PLAYER, "hose sprayed")
				sandbox_message("Player animation hose sprayed", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "537" then
				set_animation_state(LOCAL_PLAYER, "Inmate Bang Cup")
				sandbox_message("Player animation Inmate Bang Cup", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "538" then
				set_animation_state(LOCAL_PLAYER, "Inmate Bars Stand")
				sandbox_message("Player animation Inmate Bars Stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "541" then
				set_animation_state(LOCAL_PLAYER, "Inmate Curl Stand")
				sandbox_message("Player animation Inmate Curl Stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "542" then
				set_animation_state(LOCAL_PLAYER, "Inmate Harmonica Stand")
				sandbox_message("Player animation Inmate Harmonica Stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "543" then
				set_animation_state(LOCAL_PLAYER, "Inmate Scrub Kneel")
				sandbox_message("Player animation Inmate Scrub Kneel", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "544" then
				set_animation_state(LOCAL_PLAYER, "Inmate Write Sit")
				sandbox_message("Player animation Inmate Write Sit", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "545" then
				set_animation_state(LOCAL_PLAYER, "Juggle")
				sandbox_message("Player animation Juggle", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "546" then
				set_animation_state(LOCAL_PLAYER, "Junkie Ground")
				sandbox_message("Player animation Junkie Ground", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "547" then
				set_animation_state(LOCAL_PLAYER, "Lapdance Sit Get")
				sandbox_message("Player animation Lapdance Sit Get", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "548" then
				set_animation_state(LOCAL_PLAYER, "Lapdance Stand Give")
				sandbox_message("Player animation Lapdance Stand Give", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "551" then
				set_animation_state(LOCAL_PLAYER, "Laptop Ground")
				sandbox_message("Player animation Laptop Ground", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "552" then
				set_animation_state(LOCAL_PLAYER, "Lawnchair Lounge")
				sandbox_message("Player animation Lawnchair Lounge", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "553" then
				set_animation_state(LOCAL_PLAYER, "Lawnchair Sit")
				sandbox_message("Player animation Lawnchair Sit", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "554" then
				set_animation_state(LOCAL_PLAYER, "Lean")
				sandbox_message("Player animation Lean", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "555" then
				set_animation_state(LOCAL_PLAYER, "Lifeguard Sit")
				sandbox_message("Player animation Lifeguard Sit", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "556" then
				set_animation_state(LOCAL_PLAYER, "Limbo Dance A")
				sandbox_message("Player animation Limbo Dance A", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "557" then
				set_animation_state(LOCAL_PLAYER, "Limbo Dance B")
				sandbox_message("Player animation Limbo Dance B", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "558" then
				set_animation_state(LOCAL_PLAYER, "Limbo Pole Stand Left")
				sandbox_message("Player animation Limbo Pole Stand Left", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "561" then
				set_animation_state(LOCAL_PLAYER, "Limbo Pole Stand Right")
				sandbox_message("Player animation Limbo Pole Stand Right", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "562" then
				set_animation_state(LOCAL_PLAYER, "Lookout Stand")
				sandbox_message("Player animation Lookout Stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "563" then
				set_animation_state(LOCAL_PLAYER, "Lounge")
				sandbox_message("Player animation Lounge", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "564" then
				set_animation_state(LOCAL_PLAYER, "Lover Sit A")
				sandbox_message("Player animation Lover Sit A", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "565" then
				set_animation_state(LOCAL_PLAYER, "Lover Sit B")
				sandbox_message("Player animation Lover Sit B", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "566" then
				set_animation_state(LOCAL_PLAYER, "Megaphone Stand")
				sandbox_message("Player animation Megaphone Stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "567" then
				set_animation_state(LOCAL_PLAYER, "Metal Detector Stand")
				sandbox_message("Player animation Metal Detector Stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "568" then
				set_animation_state(LOCAL_PLAYER, "Mourn Crouch")
				sandbox_message("Player animation Mourn Crouch", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "571" then
				set_animation_state(LOCAL_PLAYER, "Nose Dive")
				sandbox_message("Player animation Nose Dive", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "572" then
				set_animation_state(LOCAL_PLAYER, "panic fall")
				sandbox_message("Player animation panic fall", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "573" then
				set_animation_state(LOCAL_PLAYER, "pant")
				sandbox_message("Player animation pant", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "574" then
				set_animation_state(LOCAL_PLAYER, "Piano Sit")
				sandbox_message("Player animation Piano Sit", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "575" then
				set_animation_state(LOCAL_PLAYER, "Picnic Sit A")
				sandbox_message("Player animation Picnic Sit A", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "576" then
				set_animation_state(LOCAL_PLAYER, "Picnic Sit B")
				sandbox_message("Player animation Picnic Sit B", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "577" then
				set_animation_state(LOCAL_PLAYER, "PicnicTable Drink")
				sandbox_message("Player animation PicnicTable Drink", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "578" then
				set_animation_state(LOCAL_PLAYER, "PicnicTable Eat")
				sandbox_message("Player animation PicnicTable Eat", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "581" then
				set_animation_state(LOCAL_PLAYER, "PicnicTable Sit")
				sandbox_message("Player animation PicnicTable Sit", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "582" then
				set_animation_state(LOCAL_PLAYER, "Pinball Stand")
				sandbox_message("Player animation Pinball Stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "583" then
				set_animation_state(LOCAL_PLAYER, "Poker Sit")
				sandbox_message("Player animation Poker Sit", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "584" then
				set_animation_state(LOCAL_PLAYER, "pole stand")
				sandbox_message("Player animation pole stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "585" then
				set_animation_state(LOCAL_PLAYER, "police call talk")
				sandbox_message("Player animation police call talk", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "586" then
				set_animation_state(LOCAL_PLAYER, "Pond Scoop Stand")
				sandbox_message("Player animation Pond Scoop Stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "587" then
				set_animation_state(LOCAL_PLAYER, "Pool Stand")
				sandbox_message("Player animation Pool Stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "588" then
				set_animation_state(LOCAL_PLAYER, "Pool Watch")
				sandbox_message("Player animation Pool Watch", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "611" then
				set_animation_state(LOCAL_PLAYER, "protest Stand")
				sandbox_message("Player animation protest Stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "612" then
				set_animation_state(LOCAL_PLAYER, "Quartet Stand")
				sandbox_message("Player animation Quartet Stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "613" then
				set_animation_state(LOCAL_PLAYER, "Rap Stand")
				sandbox_message("Player animation Rap Stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "614" then
				set_animation_state(LOCAL_PLAYER, "react car wreck")
				sandbox_message("Player animation react car wreck", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "615" then
				set_animation_state(LOCAL_PLAYER, "react Cheer")
				sandbox_message("Player animation react Cheer", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "616" then
				set_animation_state(LOCAL_PLAYER, "react Cheer 2")
				sandbox_message("Player animation react Cheer 2", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "617" then
				set_animation_state(LOCAL_PLAYER, "react Over Body")
				sandbox_message("Player animation react Over Body", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "618" then
				set_animation_state(LOCAL_PLAYER, "react PepperSpray Stand")
				sandbox_message("Player animation react PepperSpray Stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "621" then
				set_animation_state(LOCAL_PLAYER, "Security Scan Stand")
				sandbox_message("Player animation Security Scan Stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "622" then
				set_animation_state(LOCAL_PLAYER, "ShoppingBag Stand")
				sandbox_message("Player animation ShoppingBag Stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "623" then
				set_animation_state(LOCAL_PLAYER, "Singer Stand")
				sandbox_message("Player animation Singer Stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "624" then
				set_animation_state(LOCAL_PLAYER, "Sketchpad Sit")
				sandbox_message("Player animation Sketchpad Sit", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "625" then
				set_animation_state(LOCAL_PLAYER, "sleep")
				sandbox_message("Player animation sleep", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "626" then
				set_animation_state(LOCAL_PLAYER, "sleep b")
				sandbox_message("Player animation sleep b", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "627" then
				set_animation_state(LOCAL_PLAYER, "Slot Machine Sit")
				sandbox_message("Player animation Slot Machine Sit", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "628" then
				set_animation_state(LOCAL_PLAYER, "Smoking B")
				sandbox_message("Player animation Smoking B", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "631" then
				set_animation_state(LOCAL_PLAYER, "Sofa Cower A")
				sandbox_message("Player animation Sofa Cower A", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "632" then
				set_animation_state(LOCAL_PLAYER, "Sofa Cower B")
				sandbox_message("Player animation Sofa Cower B", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "633" then
				set_animation_state(LOCAL_PLAYER, "Sofa Sit")
				sandbox_message("Player animation Sofa Sit", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "634" then
				set_animation_state(LOCAL_PLAYER, "Stool Beer")
				sandbox_message("Player animation Stool Beer", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "635" then
				set_animation_state(LOCAL_PLAYER, "Stool Cig")
				sandbox_message("Player animation Stool Cig", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "636" then
				set_animation_state(LOCAL_PLAYER, "Stool Sit")
				sandbox_message("Player animation Stool Sit", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "637" then
				set_animation_state(LOCAL_PLAYER, "streaking run")
				sandbox_message("Player animation streaking run", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "638" then
				set_animation_state(LOCAL_PLAYER, "streaking sprint")
				sandbox_message("Player animation streaking sprint", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "641" then
				set_animation_state(LOCAL_PLAYER, "streaking stand")
				sandbox_message("Player animation streaking stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "642" then
				set_animation_state(LOCAL_PLAYER, "Suicide Stand")
				sandbox_message("Player animation Suicide Stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "643" then
				set_animation_state(LOCAL_PLAYER, "surrender")
				sandbox_message("Player animation surrender", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "644" then
				set_animation_state(LOCAL_PLAYER, "swim surface")
				sandbox_message("Player animation swim surface", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "645" then
				set_animation_state(LOCAL_PLAYER, "swim_slow")
				sandbox_message("Player animation swim_slow", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "646" then
				set_animation_state(LOCAL_PLAYER, "tag stand")
				sandbox_message("Player animation tag stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "647" then
				set_animation_state(LOCAL_PLAYER, "TaiChi Stand")
				sandbox_message("Player animation TaiChi Stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "648" then
				set_animation_state(LOCAL_PLAYER, "Tap Dancer Stand")
				sandbox_message("Player animation Tap Dancer Stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "651" then
				set_animation_state(LOCAL_PLAYER, "Tourist Stand")
				sandbox_message("Player animation Tourist Stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "652" then
				set_animation_state(LOCAL_PLAYER, "tread")
				sandbox_message("Player animation tread", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "653" then
				set_animation_state(LOCAL_PLAYER, "Umbrella Run")
				sandbox_message("Player animation Umbrella Run", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "654" then
				set_animation_state(LOCAL_PLAYER, "Umbrella Stand")
				sandbox_message("Player animation Umbrella Stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "655" then
				set_animation_state(LOCAL_PLAYER, "Umbrella Walk")
				sandbox_message("Player animation Umbrella Walk", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "656" then
				set_animation_state(LOCAL_PLAYER, "vehicle surf handstand")
				sandbox_message("Player animation vehicle surf handstand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "657" then
				set_animation_state(LOCAL_PLAYER, "vehicle surf lean left")
				sandbox_message("Player animation vehicle surf lean left", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "658" then
				set_animation_state(LOCAL_PLAYER, "vehicle surf lean right")
				sandbox_message("Player animation vehicle surf lean right", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "661" then
				set_animation_state(LOCAL_PLAYER, "vehicle surf stand")
				sandbox_message("Player animation vehicle surf stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "662" then
				set_animation_state(LOCAL_PLAYER, "Warmhands Stand")
				sandbox_message("Player animation Warmhands Stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "663" then
				set_animation_state(LOCAL_PLAYER, "Watch Rain")
				sandbox_message("Player animation Watch Rain", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "664" then
				set_animation_state(LOCAL_PLAYER, "worried fall")
				sandbox_message("Player animation worried fall", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "665" then
				set_animation_state(LOCAL_PLAYER, "YKZA Sword Stand")
				sandbox_message("Player animation YKZA Sword Stand", LOCAL_PLAYER)
				reset_input_sequence()
			elseif codestring == "666" then
				set_animation_state(LOCAL_PLAYER, "Yoga Sit")
				sandbox_message("Player animation Yoga Sit", LOCAL_PLAYER)
				reset_input_sequence()







			elseif codestring == "811" then
				if not SANDBOX_MESSAGES then
					objective_text_clear(0)
					mission_help_table("CODE ENTRY: "..codestring.."\n".."Sandbox+ messages toggled on in HUD", LOCAL_PLAYER)
				else
					objective_text_clear(0)
					mission_help_table("CODE ENTRY: "..codestring.."\n".."Sandbox+ messages toggled off in HUD", LOCAL_PLAYER)
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
				local player_vehicle = get_char_vehicle_name(LOCAL_PLAYER)
				if (player_vehicle ~= "") then
					vehicle_repair( player_vehicle )
					sandbox_message("Player vehicle repaired", LOCAL_PLAYER)
				else
					sandbox_message("Repair player vehicle FAILED", LOCAL_PLAYER)
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






			-- The following 88 commands are commented out and are just wip testing
			elseif codestring == "888" then
				--[[
				local player_vehicle = get_char_vehicle_name(LOCAL_PLAYER)
				debug_print(tostring(player_vehicle))
				if (player_vehicle ~= "") then
					if not VEHICLE_INVULNERABLE then
						sandbox_message("Player vehicle invulnerable", LOCAL_PLAYER)
						turn_invulnerable(player_vehicle, false)
					else
						turn_vulnerable(player_vehicle)
						sandbox_message("Player vehicle vulnerable", LOCAL_PLAYER)
							
					end
					VEHICLE_INVULNERABLE = not VEHICLE_INVULNERABLE
				else
					sandbox_message("Toggle vehicle invulnerability FAILED")
				end	
				reset_input_sequence()]]
			elseif codestring == "887" then
				--[[audio_play( "JYUNICHI_BATTLE" )
				audio_play( "Ride of the Valkyries", music )
				sandbox_message("audio play test")
				reset_input_sequence()]]






			else
				sandbox_message("FAILED", LOCAL_PLAYER)
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
end

function sr2_city_init()

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

	thread_new("dlc04_main")	-- Custom Missions
	thread_new("dlc05_main")

-- STRONGHOLDS ???????


	load_chunky() -- Loads yacht chunks for crib
	Keycombo_Handle = thread_new("keycombo_thread") -- Sandbox+ thread

end