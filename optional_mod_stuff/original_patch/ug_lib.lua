
--------------------
-- Script Globals --
--------------------

MINIMAP_ICON_KILL								= "map_act_kill"
MINIMAP_ICON_PROTECT_ACQUIRE				= "map_act_protectacquire"
MINIMAP_ICON_LOCATION						= "map_act_location"

INGAME_EFFECT_KILL							= "icon_red"
INGAME_EFFECT_NPC_INTERACT					= "icon_blue"
INGAME_EFFECT_PROTECT_ACQUIRE				= "icon_green"
INGAME_EFFECT_LOCATION						= "mission_complete"
INGAME_EFFECT_CUTSCENE						= "mission_purchase"
INGAME_EFFECT_MP_TUTORIAL					= "mission_complete_mp"

INGAME_EFFECT_VEHICLE_INTERACT			= "Icon_lg_b"
INGAME_EFFECT_VEHICLE_PROTECT_ACQUIRE	= "Icon_lg_c"
INGAME_EFFECT_VEHICLE_KILL					= "Icon_lg_d"

INGAME_EFFECT_VEHICLE_LOCATION			= "Mission_car_a"
INGAME_EFFECT_VEHICLE_CUTSCENE			= "Mission_car_b"

SYNC_LOCAL	= 1
SYNC_REMOTE = 2
SYNC_ALL		= 3

MAX_NOTORIETY_LEVEL		= 5
INVALID_THREAD_HANDLE	= -1

MISSION_START_CHECKPOINT = "mission start"

LOCAL_PLAYER	= "#PLAYER1#"
REMOTE_PLAYER	= "#PLAYER2#"
CLOSEST_PLAYER = "#CLOSEST_PLAYER#"
CLOSEST_TEAM1	= "#CLOSEST_TEAM1#"
CLOSEST_TEAM2	= "#CLOSEST_TEAM2#"

PLAYER_TAG_LIST = {
	"#PLAYER1#",
	"#PLAYER2#",
	"#PLAYER3#",
	"#PLAYER4#",
	"#PLAYER5#",
	"#PLAYER6#",
	"#PLAYER7#",
	"#PLAYER8#"
}

WEAPON_SLOT_NONE		= -1
WEAPON_SLOT_UNARMED	= 0
WEAPON_SLOT_MELEE		= 1
WEAPON_SLOT_PISTOL	= 2
WEAPON_SLOT_SMG		= 3
WEAPON_SLOT_SHOTGUN	= 4
WEAPON_SLOT_RIFLE		= 5
WEAPON_SLOT_LAUNCHER = 6
WEAPON_SLOT_THROWN	= 7

Mission_waypoint		= -1

VT_AUTOMOBILE	= 0
VT_MOTORCYCLE	= 1
VT_AIRPLANE		= 2
VT_HELICOPTER	= 3
VT_WATERCRAFT	= 4
VT_TRAIN			= 5
-- This means the player isn't in a vehicle.
VT_NONE			= 6

IS_MOVER		= 1
IS_ITEM			= 2
INDETERMINATE	= 3

VST_AMBULANCE = 0
VST_BUS = 1
VST_FBI = 2
VST_FIRETRUCK = 3
VST_INDUSTRIAL = 4
VST_METER_MAID = 5
VST_NEWS_VAN = 6
VST_POLICE = 7
VST_SWAT_VAN = 8
VST_TAXI = 9
VST_TOW_TRUCK = 10
VST_LIMO = 11
VST_ATV = 12
-- This player's vehicle isn't special or
-- this player isn't in a vehicle.
VST_NONE = 13

-- Gender types
GT_NONE = 0
GT_MALE = 1
GT_FEMALE = 2

-- Trigger event state tracker globals
UPDATE_DEACTIVATED = 1
ALL_PLAYERS_DEACTIVATED = 2
ANY_PLAYER_DEACTIVATED = 3
UPDATE_ACTIVATED = 4
ALL_PLAYERS_ACTIVATED = 5
ALL_PLAYERS_ACTIVATED_RESET = 6
TRIGGER_MULTIPLE_TIMES = 7
TRIGGER_ONCE_FIRST_TRIGGERER = 8
TRIGGER_ONCE_PER_PLAYER = 9

-- Parameters for use with npc_set_boss_ai
AI_BOSS_JYUNICHI = "Jyunichi"
AI_BOSS_AKUJI = "Akuji"

START_FADE_OUT_TIME = 1.0
START_FADE_IN_TIME = 2.0
DEFAULT_END_DELAY_TIME = 2.0
DEFAULT_END_FADE_OUT_TIME = 3.0

-- Persona override types
POT_ATTACK				= 1
POT_TAKE_DAMAGE		= 2
-- POT_TAUNT_NEGATIVE	= 3 (PA 7-14-08. There is no longer code-side support for this override type.)
POT_CUSTOM_1			= 4
POT_CUSTOM_2			= 5
POT_PRAISED_BY_PC		= 6
POT_TAUNTED_BY_PC		= 7
POT_BARTER				= 8
POT_GRATS_PC			= 9
POT_GRATS_SELF			= 10
POT_HIT_CAR				= 11
POT_HIT_OBJ				= 12
POT_HIT_PED				= 13

-- Build types
BUILD_TYPE_NORMAL			= 1
BUILD_TYPE_AUSTRALIAN	= 2
BUILD_TYPE_GERMAN			= 3
BUILD_TYPE_JAPANESE_360	= 4
BUILD_TYPE_JAPANESE_PS3	= 5

-- Persona situations associated w/ each override type
POT_SITUATIONS = {
	[POT_ATTACK]			=	{"threat - alert (group attack)",
									 "threat - alert (solo attack)"},
	[POT_TAKE_DAMAGE]		=	{"take damage", 
									 "threat - damage received (firearm)",
									 "threat - damage received (melee)",
									 "threat - damage received (vehicle)"},
	[POT_CUSTOM_1]			=	{"custom line 1"},
	[POT_CUSTOM_2]			=	{"custom line 2"},
	[POT_PRAISED_BY_PC]	=	{"observe - praised by pc"},
	[POT_TAUNTED_BY_PC]	=	{"misc - respond to player taunt w/taunt"},
	[POT_BARTER]			=	{"hostage - barters"},
	[POT_GRATS_PC]			=	{"combat - congratulate player"},
	[POT_GRATS_SELF]		=	{"combat - congratulate self"},
	[POT_HIT_CAR]			=	{"observe - passenger when driver hits cars"},
	[POT_HIT_OBJ]			=	{"observe - passenger when driver hits object"},
	[POT_HIT_PED]			=	{"observe - passenger when driver hits peds"}
}

-- Constants use by the audio_play_conversation function.
-- These indices are the indices of each segment of a dialog stream
-- in the dialog stream table.
DIALOG_STREAM_AUDIO_NAME_INDEX = 1
DIALOG_STREAM_CHAR_NAME_INDEX = 2
DIALOG_STREAM_DELAY_SECONDS_INDEX = 3
DIALOG_STREAM_ANIM_ACTION_INDEX = 4

-- Types of conversations
NOT_CALL = 1
OUTGOING_CALL = 2
INCOMING_CALL = 3

-- Used in a dialog stream to denote that this is a character speaking through the cellphone
CELLPHONE_CHARACTER  = "cellphone character"

-- Ring sounds
CELLPHONE_INCOMING = "SYS_CELL_RING_1"
CELLPHONE_OUTGOING = "SYS_CELL_RING_OTHER"

-- Gang persona tables
--
--	The key of each entry is the persona, and the value is the tag prfix of its situation triggers.
--
-- These tables are used in conjunction with persona_override_group_start and persona_override_group_stop.

BROTHERHOOD_PERSONAS = {
	["HM_Bro1"]	=	"HMBRO1",
	["HM_Bro2"]	=	"HMBRO2",
	["HM_Bro3"]	=	"HMBRO3",

	["HF_Bro1"]	=	"HFBRO1",
	["HF_Bro2"]	=	"HFBRO2",

	["WM_Bro1"]	=	"WMBRO1",
	["WM_Bro2"]	=	"WMBRO2",
	["WM_Bro3"]	=	"WMBRO3",

	["WF_Bro1"]	=	"WFBRO1",
	["WF_Bro2"]	=	"WFBRO2",
}

RONIN_PERSONAS	= {
	["AM_Ron1"]	=	"AMRON1",
	["AM_Ron2"]	=	"AMRON2",
	["AM_Ron3"]	=	"AMRON3",

	["AF_Ron1"]	=	"AFRON1",
	["AF_Ron2"]	=	"AFRON2",
	["AF_Ron3"]	=	"AFRON3",

	["WM_Ron1"]	=	"WMRON1",
	["WM_Ron2"]	=	"WMRON2",

	["WF_Ron1"]	=	"WFRON1",
	["WF_Ron2"]	=	"WFRON2",
}

SAINTS_PERSONAS = {
	["AM_TSS1"]	=	"AMTSS1",
	["AM_TSS2"]	=	"AMTSS2",
	["AM_TSS3"]	=	"AMTSS3",

	["AF_TSS1"]	=	"AFTSS1",
	["AF_TSS2"]	=	"AFTSS2",
	["AF_TSS3"]	=	"AFTSS3",

	["BM_TSS1"]	=	"BMTSS1",
	["BM_TSS2"]	=	"BMTSS2",
	["BM_TSS3"]	=	"BMTSS3",

	["BF_TSS1"]	=	"BFTSS1",
	["BF_TSS2"]	=	"BFTSS2",
	["BF_TSS3"]	=	"BFTSS3",

	["HM_TSS1"]	=	"HMTSS1",
	["HM_TSS2"]	=	"HMTSS2",
	["HM_TSS3"]	=	"HMTSS3",

	["HF_TSS1"]	=	"HFTSS1",
	["HF_TSS2"]	=	"HFTSS2",
	["HF_TSS3"]	=	"HFTSS3",

	["WM_TSS1"]	=	"WMTSS1",
	["WM_TSS2"]	=	"WMTSS2",
	["WM_TSS3"]	=	"WMTSS3",

	["WF_TSS1"]	=	"WFTSS1",
	["WF_TSS2"]	=	"WFTSS2",
	["WF_TSS3"]	=	"WFTSS3",
}

SAMEDI_PERSONAS = {
	["BM_SoS2"]	=	"BMSOS2",

	["BF_SoS1"]	=	"BFSOS1",
	["BF_SoS2"]	=	"BFSOS2",
	["BF_SoS3"]	=	"BFSOS3",

	["WM_SoS2"]	=	"WMSOS2",

	["WF_SoS1"]	=	"WFSOS1",
}

COP_PERSONAS = {
--	["AM_Cop"]	=	"AMCOP",		Currently has no mission specific lines
	["AF_Cop"]	=	"AFCOP",
	
	["BM_Cop"]	=	"BMCOP",
	["BF_Cop"]	=	"BFCOP",
	
	["HM_Cop"]	=	"HMCOP",
	["HF_Cop"]	=	"HFCOP",
	
	["WM_Cop"]	=	"WMCOP",
	["WF_Cop"]	=	"WFCOP",
}

BUM_PERSONAS = {
	["BM_Hobo"]		=	"BMHOBO1",
	["BF_Hobo"]		=	"BFHOBO1",
	
	["HM_Hobo"]		=	"HMHOBO1",
	["HF_Hobo"]		=	"HFHOBO1",
	
	["WM_Hobo1"]	=	"WMHOBO1",
	["WM_Hobo2"]	=	"WMHOBO2",
	
	["WF_Hobo1"]	=	"WFHOBO1",
	["WF_Hobo2"]	=	"WFHOBO2",
}

-- Human teams ( gangs )
HUMAN_TEAM_BROTHERHOOD		= 1
HUMAN_TEAM_RONIN				= 2
HUMAN_TEAM_SAMEDI				= 3

-- Global Variables --
Player_controls_disabled_by_mission_start_fadeout = false

--------------------
-- Script Actions --
--------------------

function action_or_state_play( npc, name )
	if (animation_is_state( name )) then
		set_animation_state( npc, name )
		
		while (not(action_play_is_finished(npc, 1))) do
			thread_yield()
		end
	else
		action_play( npc, name )
	end
end

-- Make a human play an animation, blocking until the animation is done
--
-- name:			name of human
-- anim_name:		name of animation to play
-- morph_name:		(optional) name of morph to use
-- force_play:		(optional) if true, force play
-- percentage:		percentage done to check for (defaults to .8)
-- stand_still:	(optional) if true, human's movement mode set to none before playing
function action_play(name, anim_name, morph_name, force_play, percentage, stand_still)

	action_play_non_blocking(name, anim_name, morph_name, force_play, stand_still)
	repeat
		thread_yield()
	until action_play_is_finished(name, percentage)
end

-- Make a human play a custom animation, blocking until the animation is done
--
-- name:			name of human
-- anim_name:	filename of animation to play
--
function action_play_custom(name, anim_name, percentage)

	while not action_play_custom_do(name, anim_name) do
		thread_yield()
	end

	repeat
		thread_yield()
	until action_play_is_finished(name, percentage)
end

-- Make a human play an animation without blocking
-- This function will still block until the animation STARTS playing
--
-- name:			name of human
-- anim_name:		name of animation to play
-- morph_name:		(optional) name of morph to use
-- force_play:		(optional) if true, force play
-- stand_still:	(optional) if true, human's movement mode set to none before playing
function action_play_non_blocking(name, anim_name, morph_name, force_play, stand_still)
	while not action_play_do(name, anim_name, morph_name, force_play, stand_still) do
		thread_yield()
	end
end

function action_sequence_play( name, ... )
	action_sequence_table_play( name, arg )
end

function action_sequence_table_play( name, table )

	local size = table.n
	
	if (size == nil) then
		size = sizeof_table( table )
	end
	
	for x=1, size, 1 do
		local data = table[x]
		local typename = type(data)
		
		if (typename == "number") then
			delay( data )
		elseif (typename == "table") then
			action_sequence_table_play( data )
		else
			action_or_state_play( name, data )
		end
	end

end

function action_sequence_play_thread( name, ... )
	thread_new( "action_sequence_table_play", name, arg )
end

-- Make a helicopter go to a series of navpoints (could just be 1)
-- 
-- name:		name of the helicopter
-- dest:		name of destination navpoint(s)
--
function airplane_fly_to(name, speed, ...)
	local num_args, use_navmesh, force_path

	-- Wait until the resource is loaded.
	-- character_wait_for_loaded_resource(name)
			
	num_args = arg.n

	local arg_type = type(arg[1])
	
	if (arg_type == "table") then
		num_args = sizeof_table(arg[1])
		if (airplane_fly_to_do(name, speed, num_args, arg[1])) then
			local check_done = vehicle_pathfind_check_done(name)
			
			while ( check_done == 0) do
				thread_yield()
				check_done = vehicle_pathfind_check_done(name)
			end
			
			return check_done == 1
		else
			return false
		end
	elseif (arg_type == "string") then
		if (airplane_fly_to_do(name, speed, num_args, arg)) then
			local check_done = vehicle_pathfind_check_done(name)
			
			while ( check_done == 0) do
				thread_yield()
				check_done = vehicle_pathfind_check_done(name)
			end
			
			return check_done == 1
		else
			return false
		end
	end
end

-- make an airplane land on a runway specified by 2 navpoints
-- Plane should already be heading in approximately the correct direction
-- Name:			name of the airplane
-- runway_start:	navpoint for the start of the runway, the plane will land after this position
--					should be oriented in the direction of the runway
function airplane_land(name, runway_start)
	if (not airplane_land_do( name, runway_start )) then
		return
	end
	
	while( vehicle_pathfind_check_done(name) == 0) do
		thread_yield()
	end

end

-- Make an airplane takeoff straight infront of them
-- name:		name of the airplane
--
function airplane_takeoff(name)
	if (not airplane_takeoff_do( name )) then
		return
	end
	
	while( vehicle_pathfind_check_done(name) == 0) do
		thread_yield()
	end

end

-- Cause a character to attack another character
--
-- attacker:	name of attacker
-- target:		(optional) name of target (if not specified, player is the target)
-- yield:		(optional) set to true to yield until attack is finished
--
function attack(attacker, target, yield)
	attack_do(attacker, target)
end

-- Checks whether the npc or target is dead before attacking
--
function attack_safe( npc_name, target, yield )
	if target == nil then
		target = CLOSEST_PLAYER
	end

	if ( ( not character_is_dead( npc_name ) ) and ( ( not character_is_dead( target ) ) ) ) then
		attack( npc_name, target, yield ) 
	end
end

function attack_closest_player( npc_name, yield )
   local distance, closest_player = get_dist_closest_player_to_object( npc_name )
   attack_safe( npc_name, closest_player, yield )
end

function character_is_ready_to_speak( speaking_character )
   -- Check for a character that does not exist first
   if (not character_exists(speaking_character)) then
		return false
	end

	if (character_is_dead(speaking_character)) then
		return false
	end

	if (character_is_ragdolled(speaking_character)) then
		return false
	end
	
	if (character_is_on_fire(speaking_character)) then
      return false
   end

	-- The character can speak
   return true
end

-- Plays a conversation, which consists of a series
-- of lines played by characters.
--
-- dialog_stream: A table containing dialog stream segments.
--                Each segment has a speaking character name,
--                the name of the audio to play, and a delay in
--                seconds after the audio is played for the
--                next one to be played.
--                For cellphone calls, the character name isn't
--                necessary.
--
-- cellphone_call: (optional, default NOT_CALL) If this is a
--                 cellphone call, pass in the type of call here:
--                   NOT_CALL
--                   OUTGOING_CALL
--                   INCOMING_CALL
--
function audio_play_conversation( dialog_stream, cellphone_call )
   if ( cellphone_call == nil ) then
      cellphone_call = NOT_CALL
   end

   -- Open with the cellphone, if this is a cellphone
   -- conversation
   if ( cellphone_call == INCOMING_CALL ) then
      cellphone_animate_start_do()
      delay(0.5)
   elseif ( cellphone_call == OUTGOING_CALL ) then
      cellphone_animate_start_do()
      audio_play( CELLPHONE_OUTGOING, "foley", true )
      delay(0.5)
   end

	-- Build a list of characters that will be tested for readyness before any line in the
	-- conversation is played. We only use this list for NOT_CALL conversations.
	local character_list = {}
	if (cellphone_call == NOT_CALL) then
		for segment_index, dialog_segment in pairs( dialog_stream ) do
			local speaking_character = dialog_segment[DIALOG_STREAM_CHAR_NAME_INDEX]
			character_list[speaking_character] = speaking_character
		end
	end

	local function dialog_characters_ready()
		for i,character in pairs(character_list) do
			if (not character_is_ready_to_speak(character)) then
				return false
			end
		end
		return true
	end

   for segment_index, dialog_segment in pairs( dialog_stream ) do
      local audio_name = dialog_segment[DIALOG_STREAM_AUDIO_NAME_INDEX]
      local speaking_character = dialog_segment[DIALOG_STREAM_CHAR_NAME_INDEX]
      local delay_seconds = dialog_segment[DIALOG_STREAM_DELAY_SECONDS_INDEX]
		local anim_action = dialog_segment[DIALOG_STREAM_ANIM_ACTION_INDEX]

      -- Play the dialog stream for each character
      if ( cellphone_call == NOT_CALL ) then
         repeat
            thread_yield()
         until ( dialog_characters_ready() )

			local playing_action = (	(anim_action ~= nil)
												and (not character_is_in_vehicle(speaking_character)) 
												and (not character_is_combat_ready(speaking_character))
												and (not mesh_mover_wielding(speaking_character))
												and (vehicle_exit_check_done(speaking_character))
												and (vehicle_enter_check_done(speaking_character))
											)

			if (playing_action ) then	
				inv_item_equip(nil,speaking_character)
				action_play(speaking_character, anim_action, anim_action, true, 0.0, true)
			end
         audio_play_for_character( audio_name, speaking_character, "voice", false, true)
         delay( delay_seconds )
      -- Cellphone calls are different - just play the audio, don't use the character function unless
      -- it's the player.
      else
         -- For players, use audio_play_for_character so that the tag can be correctly translated
         if (	speaking_character ~= nil and character_is_player( speaking_character ) ) then
            -- Don't play lines unless and until the player is alive and in a state to deliver them
            repeat
               thread_yield()
            until ( character_is_ready_to_speak( speaking_character ) )
            audio_play_for_character( audio_name, speaking_character, "voice", false, true)
         elseif ( speaking_character == CELLPHONE_CHARACTER or speaking_character == nil ) then
            -- for_cutscene = false, blocking = true, variant = nil, voice_distance = nil, cellphone_line = true
            audio_play_for_character( audio_name, LOCAL_PLAYER, "voice", false, true, nil, nil, true )
         else
            script_assert( false, "You must specify CELLPHONE_CHARACTER as the speaking character ( or leave it at nil ) for the other side of a cellphone conversation." )
         	audio_play( audio_name, "voice", true )
         end
         delay( delay_seconds )
      end
   end

   -- Close the cellphone, if this was a cellphone
   -- conversation
   if ( cellphone_call ~= NOT_CALL ) then
      cellphone_animate_stop_do()
   end
end

-- Plays a conversation, which consists of a series of lines played by characters.
--
-- dialog_stream: A table containing dialog stream segments. Each segment has a speaking character name,
--                the name of the audio to play, and a delay in seconds after the audio is played for the
--                next one to be played. Conversation will not exectute unless the speaker is in a vehicle.
--
function audio_play_conversation_in_vehicle(dialog_stream)
	-- Loop through the table conversation...
   for segment_index, dialog_segment in pairs( dialog_stream ) do
      local audio_name = dialog_segment[DIALOG_STREAM_AUDIO_NAME_INDEX]
      local speaking_character = dialog_segment[DIALOG_STREAM_CHAR_NAME_INDEX]
      local delay_seconds = dialog_segment[DIALOG_STREAM_DELAY_SECONDS_INDEX]

		-- Conversation requires them to be in a vehicle
		while (not character_is_in_vehicle(speaking_character)) do
			thread_yield()
		end

      -- Play the dialog stream for each character
		audio_play_for_character(audio_name, speaking_character, "voice", false, true)
		delay(delay_seconds)
   end
end

-- Play 2D audio
--
-- audio_name:		name of audio to play
-- type_name:		(optional) name of audio type
--										foley
--										voice
--										music
--										ambient
-- blocking:		(optional) true or false
--
-- returns:			audio instance handle
--
function audio_play(audio_name, type_name, blocking, ignore_fade)
	local handle = audio_play_do(audio_name, type_name, ignore_fade)
	
	if (not blocking) then
		return handle;
	end
	
	while (audio_is_playing(handle)) do
		thread_yield()
	end
	
	return -1;
end

-- Play a cellphone ring... and conversation
--		doesn't put put a "press Y to..." message
--    rings 2* and then plays conversation.
--    Also animates the player
-- ring_name:		name of ring tone from foley.xtbl
-- conv_name:		name of the conversation from the voice.xtbl
--
function audio_play_for_cellphone_force(ring_name, conv_name )

	audio_play(ring_name, "foley", false, true)
	delay(0.5)
	audio_play(ring_name, "foley", false, true)
	delay(0.5)
	cellphone_animate_start_do()

	-- RCS: I think these should probably play in 2D...so audio_play would be more appropriate...
	audio_play_for_character(conv_name, LOCAL_PLAYER, "voice", false, true)
	cellphone_animate_stop_do()

end

-- Play a riff of 3D audio on a character
--
-- audio_name:		name of audio to play
-- human_name:		name of character to play audio on
-- type_name:		(optional) name of audio type
--										foley
--										voice
--										music
--										ambient
-- for_cutscene:	play for a cutscene
-- blocking: function blocks until line is played
-- variant: ???
-- voice_distance: ???
-- cellphone_line: (optional, default false)
--                 if this is a line coming from a cellphone
-- ignore_fade: (optional, default false)
--						 if true, the audio will ignore the screen fade's volume multiplier
--
-- returns:			audio instance handle
--
function audio_play_for_character(audio_name, human_name, type_name, for_cutscene, blocking, variant, voice_distance, cellphone_line, ignore_fade)	
	if (character_is_dead(human_name)) then
		return -1, 0
	end
   if ( cellphone_line == nil ) then
      cellphone_line = false
   end

	-- If we're playing a voice line, update the audio name to reflect the player's persona.
	local new_audio_name = audio_name
	if ( (type_name == "voice") and (character_is_player(human_name)) and cellphone_line == false ) then
		new_audio_name = persona_trigger_get_player_prefix(human_name) .. audio_name
	end

	local handle, play_time = audio_play_for_character_do(new_audio_name, human_name, type_name, blocking, variant, voice_distance, cellphone_line, ignore_fade)

	if (not(blocking)) then
		return handle, play_time;
	end

	-- While playing blocking audio, prevent random persona lines from playing
	if (character_is_player(human_name)) then
		audio_suppress_ambient_player_lines(true)
	else
		npc_suppress_persona(human_name, true)
	end
	
	if (handle > 0) then
		while (audio_is_playing(handle)) do
			thread_yield()
		end
	else
		delay( play_time )
	end

	-- Allow random persona lines to play again
	if (character_is_player(human_name)) then
		audio_suppress_ambient_player_lines(false)
	else
		npc_suppress_persona(human_name, true)
	end	

	return -1, 0
end

function audio_play_for_character_weapon( audio_name, character, type_name, blocking)	
	local handle = audio_play_for_character_weapon_do( audio_name, character, type_name)
	
	if not blocking then
		return handle
	end
	
	if handle >= 0 then
		repeat 
			thread_yield()
		until not audio_is_playing(handle)
		return 0
	end

	return -1
end

function audio_play_for_mover( audio_name, script_mover, type_name, blocking )

	local handle = audio_play_for_mover_do( audio_name, script_mover, type_name )
	
	if (not blocking) then
		return handle
	end
	
	if (handle > 0) then
		while (audio_is_playing(handle)) do
			thread_yield()
		end
	end
	
	return -1
end

-- Play 2D audio
--
-- audio_id:		id of audio to play
-- type:				type of audio id
-- blocking:		(optional)
--
-- returns:			audio instance handle
--
function audio_play_id(audio_id, type, blocking)
	local handle = audio_play_id_do(audio_id, type)
	
	if (not blocking) then
		return handle;
	end
	
	while (audio_is_playing(handle)) do
		thread_yield()
	end
	
	return -1;
end

-- Play a riff of 3D audio on a character
--
-- human_name:		name of character to play audio on
-- audio_id:		the id of the audio to play
-- type:				the type id of the audio_id to play
-- blocking:		(optional) wait for the audio to finish playing...if this is a voice, then it will play even if it is out of range
-- variant:			(optional) the variant to play
-- distance:		(optional) the distance override
--
-- returns:			audio instance handle
--
function audio_play_id_for_character(human_name, audio_id, type, blocking, variant, voice_distance)
	if (character_is_dead(human_name)) then
		return -1
	end
	
	local	handle = audio_play_id_for_character_do(human_name, audio_id, type, blocking, variant, voice_distance)

	if (not blocking) then
		return handle
	end
	
	while (audio_is_playing(handle)) do
		thread_yield()
	end
	
	return -1
end

-- Play 3D audio at a navpoint
--
-- navpoint_name:	name of navpoint to play sound at
-- audio_id:		id of audio to play
-- type:				type of audio id
-- blocking:		(optional)
--
-- returns:			audio instance handle
--
--
function audio_play_id_for_navpoint(navpoint_name, audio_id, type, blocking)
	local handle = audio_play_id_for_navpoint_do(navpoint_name, audio_id, type)

	if (not blocking) then
		return handle
	end

	while (audio_is_playing(handle)) do
		thread_yield()
	end

	return -1
end

-- Return when the bink movie is done playing
--
function bink_play_movie(filename)
	if (coop_is_active()) then
		return
	end

	-- Play the movie
	bink_play_movie_do(filename)

	-- Block until it is finished
	while (not bink_movie_done()) do
		thread_yield()
	end
end

-- Return camera movement to default behavior
--
-- snap:	(optional) set to true to jump directly to default position, else set to false
--
function camera_begin_script(script_name, ...)
	local yield

	if (arg.n > 0) then
		yield = arg[1]
	else
		yield = false
	end

	camera_begin_script_do(script_name)

	if (yield) then	
		while (not(camera_script_is_finished())) do
			thread_yield()
		end
	end
end

-- Smoothly move the camera to look through the specified navpoint
--
-- navp:			navpoint to look through
-- duration:	duration of movement
--
function camera_look_through(navp, duration, yield)
	camera_look_through_do(navp, duration)

	if (yield) then	
		while (not(camera_script_is_finished())) do
			thread_yield()
		end
	end
end

function character_take_human_shield( character, victim )
   character_take_human_shield_do( character, victim )

   -- loop as long as grabber and grabee are alive until we've succeeded
   while ( character_is_dead( character ) == false and
           character_is_dead( victim ) == false and
	   character_take_human_shield_check_done( character, victim) == false) do
      thread_yield();
   end
end

function character_voice_block(char)
	while (character_void_is_playing(char)) do
		thread_yield()
	end
end

-- Wait for the human's resources to be loaded.
--
-- name:	Name of the human.
--
function character_wait_for_loaded_resource(name)
	while (not(character_check_resource_loaded(name))) do
		thread_yield()
	end
end

function console_wrapper( function_name )
	_UGGlobals[function_name]()
end

-- Intro for a cutscene
--
function cutscene_in()

	if ( character_is_dead(LOCAL_PLAYER) ) then
		return
	end

	fade_out(1.0)
	fade_out_block()
end

-- Play a cutscene
--
-- name:				name of cutscene to play
-- group_name:		group for the cutscene to load before returning.
-- teleport_name:	name of script_navpoint cutscene will position player at.
--
function cutscene_play(name, group_name, teleport_name, fade_in_after)
	cutscene_in() -- ScottP wants all cutscenes to fade in.
	
	local function convert_to_table( var )
		if (var == "" or var == nil) then
			return nil
		elseif (type(var) == "table") then		
			return var
		else
			return { var, n = 1 }
		end
	end
	
	local converted_group = convert_to_table( group_name )
	local converted_teleports = convert_to_table( teleport_name )
	
	cutscene_play_do(name, converted_group, converted_teleports, fade_in_after)

	while (not(cutscene_play_check_done())) do
		thread_yield()
	end
end

-- Outtro from a cutscene
--
function cutscene_out()
	fade_in(0.5)
	fade_in_block()
end

function cutscene_tester( cutscene_name )
	cutscene_in( cutscene_name )
	cutscene_play( cutscene_name )
end

-- Returns an event state tracker for use by the trigger_event_state_tracker
-- function using all legal player tags.  If nothing is sent in, then the 
-- states default to false.
--
-- starting_state: Initial state for all players, true or false.  For example, 
-- if the event state is "players in car," then set this to false if the players
--  start outside the car.
--
function event_state_tracker_create(starting_state)
	if starting_state == nil then
		starting_state = false
	end
	
	local tracker = {}
	for i, p in pairs(PLAYER_TAG_LIST) do
		tracker[p] = starting_state
	end
	
	return tracker
end

-- Gets the value of the state for a particular player, given
-- that player and the event state tracker.
--
function event_state_tracker_get_state( event_state_tracker, player )
	return event_state_tracker[player]
end

function fade_in_block()
	while( fade_get_percent() > 0.0 ) do
		thread_yield()
	end
	
	thread_yield()
end

function fade_out_block()
	while( fade_get_percent() < 1.0 ) do
		thread_yield()
	end
	
	thread_yield()
end

-- Make a NPC fire at a navpoint
--
-- name:					NPC that is firing
-- fire_at_navpoint:	navpoint to fire at
-- fire_once:			(optional) set to true to only fire once at the navpoint
--
function force_fire(name, fire_at_navpoint, fire_once)
	if (force_fire_do(name, fire_at_navpoint, fire_once)) then
		while (not(force_ai_mode_check_done(name))) do
			thread_yield()
		end
	end
end

-- Make a NPC fire at an object's position
--
-- name:					NPC that is firing
-- fire_at_object:	object to fire at
-- fire_once:			(optional) set to true to only fire once at the object
--
function force_fire_object_position( name, fire_at_object, fire_once )
   if ( force_fire_object_position_do( name, fire_at_object, fire_once ) ) then
      while ( not ( force_ai_mode_check_done( name ) ) ) do
         thread_yield()
      end
   end
end

-- Make a NPC fire at a target
--
-- name:					NPC that is firing
-- fire_at_target:	target to fire at
-- fire_once:			(optional) set to true to only fire once at the target
--
function force_fire_target(name, fire_at_target, fire_once)
	if (force_fire_target_do(name, fire_at_target, fire_once)) then
		while (not(force_ai_mode_check_done(name))) do
			thread_yield()
		end
	end
end

-- Make a NPC throw a grenade at a navpoint
--
-- name:					NPC that is throwing
-- target_navp:		navpoint to throw at
-- throw_pitch:		(optional) pitch to throw at
-- throw_speed:		(optional) speed to throw at
--
function force_throw(name, target_navp, throw_pitch, throw_speed)
	if (force_throw_do(name, target_navp, throw_pitch, throw_speed)) then
		while (not(force_ai_mode_check_done(name))) do
			thread_yield()
		end
	end
end

-- Make an NPC throw a grenade at a character
--
-- name:				NPC that is throwing
-- target:			Target NPC or Player
function force_throw_char(name, target)
	if (force_throw_char_do(name, target)) then
		while (not(force_ai_mode_check_done(name))) do
			thread_yield()
		end
	end
end

function get_dist_char_to_char(obj1, obj2)
	return get_dist(obj1, obj2)
end

function get_dist_char_to_nav(obj1, obj2)
	return get_dist(obj1, obj2)
end

function get_dist_char_to_vehicle(obj1, obj2)
	return get_dist(obj1, obj2)
end

-- Gets the distance of the closest player to the given object, and returns that
-- distance along with whichever player is closest
--
-- object: object to find distance from
-- player_list: (optional) list of players to test, defaults to all players
--
-- NOTE: This function is returning two values!
function get_dist_closest_player_to_object(object, player_list)
	if player_list == nil then
		player_list = player_names_get_all()
	end
	
	if sizeof_table( player_list ) == 0 then
		return
	end
	
	local closest_dist = get_dist(player_list[1], object)
	local closest_player = player_list[1]
	
	-- Spin through the available players
	for i, p in pairs(player_list) do
		local current_dist = get_dist(p, object)
		if current_dist < closest_dist then
			closest_dist = current_dist
			closest_player = p
		end
	end
	
	return closest_dist, closest_player
end

function get_dist_mover_to_nav(obj1, obj2)
	return get_dist(obj1, obj2)
end

function get_dist_vehicle_to_nav(obj1, obj2)
	return get_dist(obj1, obj2)
end

function get_dist_vehicle_to_mover(obj1, obj2)
	return get_dist(obj1, obj2)
end

function get_other_sync_type( sync_type )
   if ( sync_type == SYNC_LOCAL ) then
      return SYNC_REMOTE
   elseif ( sync_type == SYNC_REMOTE ) then
      return SYNC_LOCAL
   end

   return SYNC_ALL
end

function get_other_coop_player(player_name)
   if ( player_name == LOCAL_PLAYER ) then
      return REMOTE_PLAYER
   elseif ( player_name == REMOTE_PLAYER ) then
      return LOCAL_PLAYER
   end

   return REMOTE_PLAYER
end

-- Spawn a group
--
-- name: Name of the group to spawn
-- block (optional, default false): Don't continue this thread until they're all streamed in.  Yield to other threads.
--
function group_create(name, block)
	if (block == nil) then
		block = false
	end
	
	group_create_do(name)

	local handle = thread_new("group_create_check_done_loop",name)

	while(block and not thread_check_done(handle)) do
		thread_yield()
	end
end

function group_create_check_done_loop(name)
	while (not(group_create_check_done(name))) do
		thread_yield()
	end
end

-- Spawn a group as hidden
--
-- name: Name of the group to spawn
--
function group_create_hidden(name, block)
	group_create_hidden_do(name)

	local handle = thread_new("group_create_check_done_loop", name)

	if (block) then
		while (not thread_check_done(handle)) do
			thread_yield()
		end
	end
end

-- Internal use: generalized helicopter_fly_to function
--
-- name:		name of the helicopter
-- dest:		name of destination navpoint(s)
-- direct:		if true, move directly, ignoring heightmap
-- follow:		if non-empty, target vehicle to follow
-- continue_at_goal:	if true, continue forward at goal
-- path:		list of navpoints to use for path
--
function helicopter_fly_to_internal(name, speed, direct, follow, continue_at_goal, path)
	local num_args
	num_args = path.n

	local arg_type = type(path[1])
	
	if (arg_type == "table") then
		num_args = sizeof_table(path[1])
		if (helicopter_fly_to_do(name, speed, direct, follow, continue_at_goal, num_args, path[1])) then
			local check_done = vehicle_pathfind_check_done(name)
			
			while ( check_done == 0) do
				thread_yield()
				check_done = vehicle_pathfind_check_done(name)
			end
			
			return check_done == 1
		else
			return false
		end
	elseif (arg_type == "string") then
		if (helicopter_fly_to_do(name, speed, direct, follow, continue_at_goal, num_args, path)) then
			local check_done = vehicle_pathfind_check_done(name)
			
			while ( check_done == 0) do
				thread_yield()
				check_done = vehicle_pathfind_check_done(name)
			end
			
			return check_done == 1
		else
			return false
		end
	end
end

-- Make a helicopter go to a series of navpoints (could just be 1)
-- 
-- name:		name of the helicopter
-- dest:		name of destination navpoint(s)
--
function helicopter_fly_to(name, speed, ...)
	return helicopter_fly_to_internal(name, speed, false, "", false, arg);
end

-- Make a helicopter go to a series of navpoints (could just be 1)
-- ignores heightmap and uses points directly as control points for the path
-- WARNING BE CAREFUL USING THIS!!!! HELICOPTER WILL NOT AVOID ANYTHING!!!
-- 
-- name:		name of the helicopter
-- dest:		name of destination navpoint(s)
--
function helicopter_fly_to_direct(name, speed, ...)
	return helicopter_fly_to_internal(name, speed, true, "", false, arg)
end

-- Make a helicopter go to a series of navpoints (could just be 1) while following a target
-- ignores heightmap and uses points directly as control points for the path
-- WARNING BE CAREFUL USING THIS!!!! HELICOPTER WILL NOT AVOID ANYTHING!!!
-- 
-- name:		name of the helicopter
-- dest:		name of destination navpoint(s)
-- target:		name of target to follow
--
function helicopter_fly_to_direct_follow(name, speed, target, ...)
	return helicopter_fly_to_internal(name, speed, true, target, false, arg)
end

-- Make a helicopter go to a series of navpoints (could just be 1) while following a target
-- 
-- name:		name of the helicopter
-- dest:		name of destination navpoint(s)
-- target:		name of target to follow
--
function helicopter_fly_to_follow(name, speed, target, ...)
	return helicopter_fly_to_internal(name, speed, false, target, false, arg)
end

-- Make a helicopter go to a series of navpoints (could just be 1) without stopping
-- 
-- name:		name of the helicopter
-- dest:		name of destination navpoint(s)
--
function helicopter_fly_to_dont_stop(name, speed, ...)
	return helicopter_fly_to_internal(name, speed, false, "", true, arg);
end

-- Make a helicopter go to a series of navpoints (could just be 1) without stopping
-- ignores heightmap and uses points directly as control points for the path
-- WARNING BE CAREFUL USING THIS!!!! HELICOPTER WILL NOT AVOID ANYTHING!!!
-- 
-- name:		name of the helicopter
-- dest:		name of destination navpoint(s)
--
function helicopter_fly_to_direct_dont_stop(name, speed, ...)
	return helicopter_fly_to_internal(name, speed, true, "", true, arg)
end

-- Make a helicopter go to a series of navpoints (could just be 1) while following a target without stopping
-- ignores heightmap and uses points directly as control points for the path
-- WARNING BE CAREFUL USING THIS!!!! HELICOPTER WILL NOT AVOID ANYTHING!!!
-- 
-- name:		name of the helicopter
-- dest:		name of destination navpoint(s)
-- target:		name of target to follow
--
function helicopter_fly_to_direct_follow_dont_stop(name, speed, target, ...)
	return helicopter_fly_to_internal(name, speed, true, target, true, arg)
end

-- Make a helicopter go to a series of navpoints (could just be 1) while following a target without stopping
-- 
-- name:		name of the helicopter
-- dest:		name of destination navpoint(s)
-- target:		name of target to follow
--
function helicopter_fly_to_follow_dont_stop(name, speed, target, ...)
	return helicopter_fly_to_internal(name, speed, false, target, true, arg)
end

-- Add an item to the player's inventory
--
-- item_name:	name of item to give
-- count:		(optional) number of the item to give (default = 1)
-- player:		(optional) player to add item to (default = LOCAL_PLAYER)
-- equip_now:	(optional) forces item to become the currently equipped one (default = false)
--
function inv_item_add(item_name, count, player, equip_now)	
	if (type(item_name) == "table" ) then
		local size = sizeof_table(item_name)
		
		for x=1, size, 1 do
			inv_item_add_do(item_name[x], count[x], player, equip_now)
		end	
	else
		inv_item_add_do(item_name, count, player, equip_now)
	end
end

function inv_item_get_all(char_name)
	return inv_item_get_all_do(char_name), inv_item_get_all_ammo_do(char_name)
end

function is_hood_owner( hood_name, ... )

	if( arg.n > 0 ) then
		return is_hood_owner_do( hood_name, arg[1] )
	end
		
	return is_hood_owner_do( hood_name, "Playas" )
end

function is_player_tag(tag)
	-- Search the "closest" tags
	if tag == CLOSEST_PLAYER or tag == CLOSEST_TEAM1 or tag == CLOSEST_TEAM2 then
		return true
	end
	
	-- Loop through the player tags
	for i, player in pairs(PLAYER_TAG_LIST) do
		if tag == player then
			return true
		end
	end
	
	return false
end

-- Check line of sight between two human-types
--
-- name_one, name_two:  Names of the people to check los between
--
function los_check(name_one, name_two)
	local retval = false
	local current_los_result = -1
	local num_retries = 0
	-- It's possible for the los check to continually get deleted intead of processed
	-- For example, if one of the humans is hidden.  So only try re-issuing 100 times.
	while (current_los_result == -1 and num_retries < 100) do
		current_los_result = los_check_do(name_one, name_two)
		thread_yield()
		num_retries = num_retries + 1
	end
	if (current_los_result == 0) then
		return false
	end
	if (current_los_result == 1) then
		return true
	end
	return false
end

-- Object marking functions ----------------------------------------------------------

function marker_add_group(group_name, minimap_icon_name, ingame_effect_name, sync_type)
	if (sync_type == nil) then
		sync_type = SYNC_ALL
	end

	minimap_icon_add_group( group_name, minimap_icon_name, "", sync_type )
	ingame_effect_add_group( group_name, ingame_effect_name, sync_type )
end

function marker_add_item( item_name, minimap_icon_name, ingame_icon_name, sync_type )
	if (sync_type == nil) then
		sync_type = SYNC_ALL
	end

	minimap_icon_add_item( item_name, minimap_icon_name, "", sync_type )
	ingame_effect_add_item( item_name, ingame_icon_name, sync_type )
end

function marker_add_mover( mover_name, minimap_icon_name, ingame_icon_name, sync_type )
	if (sync_type == nil) then
		sync_type = SYNC_ALL
	end

	minimap_icon_add_mover( mover_name, minimap_icon_name, "", sync_type )
	ingame_effect_add_mover( mover_name, ingame_icon_name, sync_type )
end

function marker_add_navpoint(nav_name, minimap_icon_name, ingame_icon_name, sync_type)
	if (sync_type == nil) then
		sync_type = SYNC_ALL
	end

	minimap_icon_add_navpoint(nav_name, minimap_icon_name, "", sync_type)
	ingame_effect_add_navpoint(nav_name, ingame_icon_name, sync_type)
end

function marker_add_npc(char_name, minimap_icon_name, ingame_icon_name, sync_type)
	if (not character_is_dead(char_name)) then

		if (sync_type == nil) then
			sync_type = SYNC_ALL
		end
	
		minimap_icon_add_npc(char_name, minimap_icon_name, "", sync_type)
		ingame_effect_add_npc(char_name, ingame_icon_name, sync_type)
	end
end

function marker_add_player( player_name, minimap_icon_name, ingame_icon_name, sync_type )
	if not character_is_dead( player_name ) then

		if sync_type == nil then
			sync_type = SYNC_ALL
		end
	
		minimap_icon_add_player( player_name, minimap_icon_name, "", sync_type )
		ingame_effect_add_player( player_name, ingame_icon_name, sync_type )
	end
end

function marker_add_trigger(trigger_name, minimap_icon_name, ingame_effect_name, sync_type)
	if (sync_type == nil) then
		sync_type = SYNC_ALL
	end

	minimap_icon_add_trigger(trigger_name, minimap_icon_name, "", sync_type)
	ingame_effect_add_trigger(trigger_name, ingame_effect_name, sync_type)
end

function marker_add_vehicle(vehicle_name, minimap_icon_name, ingame_icon_name, sync_type)
	if (not vehicle_is_destroyed(vehicle_name)) then

	if (sync_type == nil) then
		sync_type = SYNC_ALL
	end

		minimap_icon_add_vehicle(vehicle_name, minimap_icon_name, "", sync_type)
		ingame_effect_add_vehicle(vehicle_name, ingame_icon_name, sync_type)
	end
end

function marker_remove_group( group_name, sync_type )
	if (sync_type == nil) then
		sync_type = SYNC_ALL
	end
	
	minimap_icon_remove_group( group_name, sync_type )
	ingame_effect_remove_group( group_name, sync_type )
end

function marker_remove_item( item_name, sync_type )
	if (sync_type == nil) then
		sync_type = SYNC_ALL
	end
	
	minimap_icon_remove_item( item_name, sync_type )
	ingame_effect_remove_item( item_name, sync_type )
end

function marker_remove_mover( mover_name, sync_type )
	if (sync_type == nil) then
		sync_type = SYNC_ALL
	end
	
	minimap_icon_remove_mover( mover_name, sync_type )
	ingame_effect_remove_mover( mover_name, sync_type )
end

function marker_remove_navpoint(nav_name, sync_type)
	if (sync_type == nil) then
		sync_type = SYNC_ALL
	end
	
	minimap_icon_remove_navpoint(nav_name, sync_type)
	ingame_effect_remove_navpoint(nav_name, sync_type)
end

function marker_remove_npc(char_name, sync_type)
	if (sync_type == nil) then
		sync_type = SYNC_ALL
	end

	minimap_icon_remove_npc(char_name, sync_type)
	ingame_effect_remove_npc(char_name, sync_type)
end

function marker_remove_player( player_name, sync_type )
	if (sync_type == nil) then
		sync_type = SYNC_ALL
	end

	minimap_icon_remove_player( player_name, sync_type )
	ingame_effect_remove_player( player_name, sync_type )
end

function marker_remove_trigger(trigger_name, sync_type)
	if (sync_type == nil) then
		sync_type = SYNC_ALL
	end
	
	minimap_icon_remove_trigger(trigger_name, sync_type)
	ingame_effect_remove_trigger(trigger_name, sync_type)
end

function marker_remove_vehicle(vehicle_name, sync_type)
	if (sync_type == nil) then
		sync_type = SYNC_ALL
	end
	
	minimap_icon_remove_vehicle(vehicle_name, sync_type)
	ingame_effect_remove_vehicle(vehicle_name, sync_type)
end

-- Adds a minimap icon to all members of a group
--
-- name: name of group
-- bitmap_name: name of minimap icon file
-- bitmap_glow_name: (optional) name of minimap icon glow file
-- sync_type: (optional) sync type
--
function minimap_icon_add_group(name, bitmap_name, bitmap_glow_name, sync_type)
	minimap_icon_add_group_do(name, bitmap_name, bitmap_glow_name, nil, sync_type)
end 

-- Adds a minimap icon to an item
--
-- name: name of item
-- bitmap_name: name of minimap icon file
-- bitmap_glow_name: (optional) name of minimap icon glow file
-- sync_type: (optional) sync type
--
function minimap_icon_add_item(name, bitmap_name, bitmap_glow_name, sync_type)
	minimap_icon_add_item_do(name, bitmap_name, bitmap_glow_name, nil, sync_type)
end 

-- Adds a minimap icon to a mover
--
-- name: name of vehicle
-- bitmap_name: name of minimap icon file
-- bitmap_glow_name: (optional) name of minimap icon glow file
-- sync_type: (optional) sync type
--
function minimap_icon_add_mover(name, bitmap_name, bitmap_glow_name, sync_type)
	minimap_icon_add_mover_do(name, bitmap_name, bitmap_glow_name, nil, sync_type)
end

-- Adds a minimap icon to a navpoint
--
-- name: name of navpoint
-- bitmap_name: name of minimap icon file
-- bitmap_glow_name: (optional) name of minimap icon glow file
-- sync_type: (optional) sync type
--
function minimap_icon_add_navpoint(name, bitmap_name, bitmap_glow_name, sync_type)
	minimap_icon_add_navpoint_do(name, bitmap_name, bitmap_glow_name, nil, sync_type)
end 

-- Adds a minimap icon to an NPC
--
-- name: name of NPC
-- bitmap_name: name of minimap icon file
-- bitmap_glow_name: (optional) name of minimap icon glow file
-- sync_type: (optional) sync type
--
function minimap_icon_add_npc(name, bitmap_name, bitmap_glow_name, sync_type)
	minimap_icon_add_npc_do(name, bitmap_name, bitmap_glow_name, nil, sync_type)
end 

-- Adds a minimap icon to a player
--
-- name: name of player
-- bitmap_name: name of minimap icon file
-- bitmap_glow_name: (optional) name of minimap icon glow file
-- sync_type: (optional) sync type
--
function minimap_icon_add_player( name, bitmap_name, bitmap_glow_name, sync_type )
	minimap_icon_add_player_do( name, bitmap_name, bitmap_glow_name, nil, sync_type )
end 

-- Adds a minimap icon to a trigger
--
-- name: name of trigger
-- bitmap_name: name of minimap icon file
-- bitmap_glow_name: (optional) name of minimap icon glow file
-- sync_type: (optional) sync type
--
function minimap_icon_add_trigger(name, bitmap_name, bitmap_glow_name, sync_type)
	minimap_icon_add_trigger_do(name, bitmap_name, bitmap_glow_name, nil, sync_type)
end 

-- Adds a minimap icon to a vehicle
--
-- name: name of vehicle
-- bitmap_name: name of minimap icon file
-- bitmap_glow_name: (optional) name of minimap icon glow file
-- sync_type: (optional) sync type
--
function minimap_icon_add_vehicle(name, bitmap_name, bitmap_glow_name, sync_type)
	minimap_icon_add_vehicle_do(name, bitmap_name, bitmap_glow_name, nil, sync_type)
end 

------------------------------------
-- The below are the same as the above, only with a radius
------------------------------------

-- Adds a minimap icon to all members of a group
--
-- name: name of group
-- bitmap_name: name of minimap icon file
-- radius: radius of the minimap icon
-- bitmap_glow_name: (optional) name of minimap icon glow file
-- sync_type: (optional) sync type
--
function minimap_icon_add_group_radius(name, bitmap_name, radius, bitmap_glow_name, sync_type)
	minimap_icon_add_group_do(name, bitmap_name, bitmap_glow_name, radius, sync_type)
end 

-- Adds a minimap icon to an item
--
-- name: name of item
-- bitmap_name: name of minimap icon file
-- radius: radius of the minimap icon
-- bitmap_glow_name: (optional) name of minimap icon glow file
-- sync_type: (optional) sync type
--
function minimap_icon_add_item_radius(name, bitmap_name, radius, bitmap_glow_name, sync_type)
	minimap_icon_add_item_do(name, bitmap_name, bitmap_glow_name, radius, sync_type)
end 

-- Adds a minimap icon to a navpoint
--
-- name: name of navpoint
-- bitmap_name: name of minimap icon file
-- radius: radius of the minimap icon
-- bitmap_glow_name: (optional) name of minimap icon glow file
-- sync_type: (optional) sync type
--
function minimap_icon_add_navpoint_radius(name, bitmap_name, radius, bitmap_glow_name, sync_type)
	minimap_icon_add_navpoint_do(name, bitmap_name, bitmap_glow_name, radius, sync_type)
end 

-- Adds a minimap icon to an NPC
--
-- name: name of NPC
-- bitmap_name: name of minimap icon file
-- radius: radius of the minimap icon
-- bitmap_glow_name: (optional) name of minimap icon glow file
-- sync_type: (optional) sync type
--
function minimap_icon_add_npc_radius(name, bitmap_name, radius, bitmap_glow_name, sync_type)
	minimap_icon_add_npc_do(name, bitmap_name, bitmap_glow_name, radius, sync_type)
end 

-- Adds a minimap icon to a player
--
-- name: name of player
-- bitmap_name: name of minimap icon file
-- radius: radius of the minimap icon
-- bitmap_glow_name: (optional) name of minimap icon glow file
-- sync_type: (optional) sync type
--
function minimap_icon_add_player_radius( name, bitmap_name, radius, bitmap_glow_name, sync_type )
	minimap_icon_add_player_do( name, bitmap_name, bitmap_glow_name, radius, sync_type )
end 

-- Adds a minimap icon to a trigger
--
-- name: name of trigger
-- bitmap_name: name of minimap icon file
-- radius: radius of the minimap icon
-- bitmap_glow_name: (optional) name of minimap icon glow file
-- sync_type: (optional) sync type
--
function minimap_icon_add_trigger_radius(name, bitmap_name, radius, bitmap_glow_name, sync_type)
	minimap_icon_add_trigger_do(name, bitmap_name, bitmap_glow_name, radius, sync_type)
end 

-- Adds a minimap icon to a vehicle
--
-- name: name of vehicle
-- bitmap_name: name of minimap icon file
-- radius: radius of the minimap icon
-- bitmap_glow_name: (optional) name of minimap icon glow file
-- sync_type: (optional) sync type
--
function minimap_icon_add_vehicle_radius(name, bitmap_name, radius, bitmap_glow_name, sync_type)
	minimap_icon_add_vehicle_do(name, bitmap_name, bitmap_glow_name, radius, sync_type)
end 

-- Adds a minimap icon to a mover
--
-- name: name of vehicle
-- bitmap_name: name of minimap icon file
-- radius: radius of the minimap icon
-- bitmap_glow_name: (optional) name of minimap icon glow file
-- sync_type: (optional) sync type
--
function minimap_icon_add_mover_radius(name, bitmap_name, radius, bitmap_glow_name, sync_type)
	minimap_icon_add_mover_do(name, bitmap_name, bitmap_glow_name, radius, sync_type)
end

-- Generates a mission help message from string table
-- Also updates Objectives screen
--
function mission_help_table(tag, string1, string2, sync)
	mission_help_table_do(tag, true, false, string1, string2, sync, 0)
end

-- Generates a mission help nag message from string table
-- Doesn't update Objectives screen
--
function mission_help_table_nag(tag, string1, string2, sync)
	mission_help_table_do(tag, false, false, string1, string2, sync, 0)
end

-- Generates a mission help nag message from string table
-- Doesn't update Objectives screen
--
function mission_help_table_repeating(tag, string1, string2, sync, repeat_delay)	
	mission_help_table_do(tag, true, true, string1, string2, sync, repeat_delay)
end

-- Companion to mission_start_fade_in. This function disables player
-- controls and instantly fades out the screen.
--
-- Intended to be used when the mission is loading groups at start -
-- prevents the player from moving or seeing anything happening.
--
function mission_start_fade_out()
   chunk_enable_ambient_streaming( false )

   fade_out( START_FADE_OUT_TIME )
   player_controls_disable( LOCAL_PLAYER )
   if ( coop_is_active() ) then
      player_controls_disable( REMOTE_PLAYER )
   end
   Player_controls_disabled_by_mission_start_fadeout = true
	fade_out_block()
end

-- Companion to mission_start_fade_out. This function enables player
-- controls and fades in the screen.
--
-- Intended to be used when the mission is loading groups at start -
-- prevents the player from moving or seeing anything happening.
--
function mission_start_fade_in( fade_in_time_seconds )
   chunk_enable_ambient_streaming( true )

   fade_in( START_FADE_IN_TIME )
	fade_in_block()
   player_controls_enable( LOCAL_PLAYER )
   if ( coop_is_active() ) then
      player_controls_enable( REMOTE_PLAYER )
   end
   Player_controls_disabled_by_mission_start_fadeout = false
end

-- Companion to mission_start_fade_out/in: This function potentially
-- reenables player controls if they've been disabled by the start fade in
-- function. Should be called in mission cleanup by all missions that use
-- these two functions.
--
function mission_cleanup_maybe_reenable_player_controls()
   if ( Player_controls_disabled_by_mission_start_fadeout ) then
      player_controls_enable( LOCAL_PLAYER )
      if ( coop_is_active() ) then
         player_controls_enable( REMOTE_PLAYER )
      end
      Player_controls_disabled_by_mission_start_fadeout = false
   end
end

function mission_waypoint_add(navpoint, sync_type)
	mission_waypoint_remove(sync_type)
	Mission_waypoint = waypoint_add(navpoint, sync_type)
end

function mission_waypoint_remove(sync_type)
	if (Mission_waypoint ~= -1) then	
		waypoint_remove(sync_type)
		Mission_waypoint = -1
	end
end

-- Make a human move to a destination
-- 
-- name:					name of the human
-- dest:					name of destination navpoint(s)
-- speed:				(optional) movement speed (1 = walk, 2 = run, 3 = sprint; default = 1)
-- retry_on_failure:	(optional) set to true to keep retrying if path calculation fails (default = false)
-- move_and_fire:		(optional) set to true to allow the NPC to fire on the move (default = false)
--
function move_to(name, ...)
	local num_args, speed, retry_on_failure, move_and_fire, path_index

	-- Wait until the resource is loaded.
	character_wait_for_loaded_resource(name)
			
	num_args = arg.n

	-- get move and fire
	if ( (num_args > 3) and (type(arg[num_args]) == "boolean") ) then
		move_and_fire = arg[num_args]
		num_args = num_args - 1
	else
		move_and_fire = false
	end

	-- get retry
	if ( (num_args > 2) and (type(arg[num_args]) == "boolean") ) then
		retry_on_failure = arg[num_args]
		num_args = num_args - 1
	else
		retry_on_failure = false
	end
	
	-- get speed
	if ( (num_args > 1) and (type(arg[num_args]) == "number") ) then
		speed = arg[num_args]
		num_args = num_args - 1
	else
		speed = 1
	end
	
	while( not character_is_ready( name ) ) do
		thread_yield()
	end
	
	-- for each argument (not including the optional speed argument)
	for i = 1, num_args, 1 do
		local arg_val, arg_type
		
		arg_val = arg[i]
		arg_type = type(arg_val)
		if (arg_type == "table") then
			local j
			
			j = 1
			while (arg_val[j] ~= nil) do
				path_index = move_to_do(name, arg_val[j], speed, retry_on_failure, move_and_fire, false, 0)
				if (not (path_index == 0)) then
                -- Keep checking for done until the character dies or reaches the destination
 					while ( character_is_dead( name ) == false and
			 not( move_to_check_done(path_index,  name, arg_val[j], speed, retry_on_failure, move_and_fire, false, 0 ) ) ) do
                        thread_yield()
                    end

					j = j + 1
				else
					return false
				end
			end					
		elseif (arg_type == "string") then
			-- Is it a path list of navpoints are a single navpoint?
			if ( path_name_is_path(arg_val)) then
				local	idx

				idx = 0
				while (1) do
					path_index = move_to_do(name, arg_val, speed, retry_on_failure, move_and_fire, true, idx)
					if (not (path_index == 0)) then
						-- Keep checking for done until the character dies or reaches the destination
						while ( character_is_dead( name ) == false and
							not( move_to_check_done(path_index,  name, arg_val, speed, retry_on_failure, move_and_fire, true, idx ) ) ) do
							thread_yield()
						end

						idx = idx + 1
					else
						return false
					end
				end
			else
				path_index = move_to_do(name, arg_val, speed, retry_on_failure, move_and_fire, false, 0)
				if (not (path_index == 0)) then
				-- Keep checking for done until the character dies or reaches the destination
					while ( character_is_dead( name ) == false and
						not( move_to_check_done(path_index,  name, arg_val, speed, retry_on_failure, move_and_fire, false, 0 ) ) ) do
						thread_yield()
					end
				else
					return false
				end
			end
		end
	end
	
	return (not character_is_dead( name ))
end

-- Make a human move to a destination...if the human no longer exists during execution, it will safely exit
-- 
-- name:					name of the human
-- dest:					name of destination navpoint(s)
-- speed:				(optional) movement speed (1 = walk, 2 = run, 3 = sprint; default = 1)
-- retry_on_failure:	(optional) set to true to keep retrying if path calculation fails (default = false)
-- move_and_fire:		(optional) set to true to allow the NPC to fire on the move (default = false)
--
function move_to_safe(name, ...)

   -- If the character is dead, then forget about pathfinding
   if ( character_is_dead( name ) == true ) then
      return false
   end

	local num_args, speed, retry_on_failure, move_and_fire, path_index

	-- Wait until the resource is loaded.
	character_wait_for_loaded_resource(name)
			
	num_args = arg.n

	-- get move and fire
	if ( (num_args > 3) and (type(arg[num_args]) == "boolean") ) then
		move_and_fire = arg[num_args]
		num_args = num_args - 1
	else
		move_and_fire = false
	end

	-- get retry
	if ( (num_args > 2) and (type(arg[num_args]) == "boolean") ) then
		retry_on_failure = arg[num_args]
		num_args = num_args - 1
	else
		retry_on_failure = false
	end
	
	-- get speed
	if ( (num_args > 1) and (type(arg[num_args]) == "number") ) then
		speed = arg[num_args]
		num_args = num_args - 1
	else
		speed = 1
	end
	
	while( not character_is_ready( name )) do
		thread_yield()

		-- Don't pathfind if character is dead or entered a vehicle
		if (character_is_dead(name) or character_is_in_vehicle( name )) then
			return false
		end
	end

	-- Character may have entered a vehicle in the same frame that it became ready.
		if (character_is_in_vehicle( name )) then
			return false
		end

	-- for each argument (not including the optional speed argument)
	for i = 1, num_args, 1 do
		local arg_val, arg_type
		
		arg_val = arg[i]
		arg_type = type(arg_val)
		if (arg_type == "table") then
			local j
			
			j = 1
			while (arg_val[j] ~= nil) do
				path_index = move_to_do(name, arg_val[j], speed, retry_on_failure, move_and_fire, false, 0)
				if (not (path_index == 0)) then
					while(not(move_to_check_done(path_index, name, arg_val[j], speed, retry_on_failure, move_and_fire, false, 0))) do
						thread_yield()

						-- Don't pathfind if character is dead or entered a vehicle
						if (character_is_dead(name) or character_is_in_vehicle( name )) then
							return false
						end
					end
					
					j = j + 1
				else
					return false
				end
			end					
		elseif (arg_type == "string") then
			-- Is it a path list of navpoints are a single navpoint?
			if (path_name_is_path(arg_val)) then
				local	idx

				idx = 0
				while (1) do
					path_index = move_to_do(name, arg_val, speed, retry_on_failure, move_and_fire, true, idx)
					if (not (path_index == 0)) then
						while(not(move_to_check_done(path_index, name, arg_val, speed, retry_on_failure, move_and_fire, true, idx))) do
							thread_yield()

							-- Don't pathfind if character is dead or entered a vehicle
							if (character_is_dead(name) or character_is_in_vehicle( name )) then
								return false
							end
						end

						idx = idx + 1
					else
						return false
					end
				end
			else
				path_index = move_to_do(name, arg_val, speed, retry_on_failure, move_and_fire, false, 0)
				if (not (path_index == 0)) then
					while(not(move_to_check_done(path_index, name, arg_val, speed, retry_on_failure, move_and_fire, false, 0))) do
						thread_yield()

						-- Don't pathfind if character is dead or entered a vehicle
						if (character_is_dead(name) or character_is_in_vehicle( name )) then
							return false
						end
					end
				else
					return false
				end
			end
		end
	end
	
	return true
end

-- Make a human move to a vehicle entry point without getting into the vehicle
-- 
-- name:				name of the human
-- vehicle:				name of destination vehicle
-- entry_point:			(optional) car door entry point to use (default = 0; driver side)
-- speed:				(optional) movement speed (1 = walk, 2 = run, 3 = sprint; default = 1)
-- retry_on_failure:	(optional) set to true to keep retrying if path calculation fails (default = false)
-- move_and_fire:		(optional) set to true to allow the NPC to fire on the move (default = false)
--
function move_to_vehicle_entry_point(name, vehicle, entry_point, speed, retry_on_failure, move_and_fire)
	-- Wait until the resource is loaded.
	character_wait_for_loaded_resource(name)
	
	while( not character_is_ready( name ) ) do
		thread_yield()
	end
	
	if move_to_vehicle_entry_point_do(name, vehicle, entry_point, speed, retry_on_failure, move_and_fire) then
		repeat
			thread_yield()
		until move_to_vehicle_entry_point_check_done(name, vehicle, entry_point, speed, retry_on_failure, move_and_fire)
	end
	
	return true
end

function notoriety_reset_vehicle_count( gang_name )
	notoriety_set_desired_vehicle_count( gang_name, -1 )
end

function on_random_human_killed( function_name, mission_name )
	on_random_obj_killed( function_name, mission_name, 1 )
end

function on_random_mover_killed( function_name, mission_name )
	on_random_obj_killed( function_name, mission_name, 2 )
end

function on_random_vehicle_killed( function_name, mission_name )
	on_random_obj_killed( function_name, mission_name, 3 )
end

-- Callback for when an object in the object destroyed script is killed
--
-- This is a file that is generated by Art...it contains the chunk number (all three digits, even leading zeros)
--	and the object name. The file is named exactly the same as the mission, stronghold, and activity and has the
-- file extension "ods".
function on_random_ods_killed( function_name, mission_name )
	on_random_obj_killed( function_name, mission_name, 4 )
end

function open_vint_dialog(title_tag, body_tag, tag1, tag2)
	open_vint_dialog_do(title_tag, body_tag, tag1, tag2)

	local		check_value = open_vint_dialog_check_done()

	while (check_value == -1) do
		thread_yield()
		check_value = open_vint_dialog_check_done()
	end

	return check_value
end

-- Add members to the player's party
--
-- name:	name of NPC to add to player's party
--
function party_add(...)
	local player = CLOSEST_PLAYER
	
	if is_player_tag(arg[arg.n]) then
		player = arg[arg.n]
		arg.n = arg.n - 1
	end
		
	party_add_do(player, arg, false)
end

function party_add_optional(...)
	local player = CLOSEST_PLAYER
	
	if is_player_tag(arg[arg.n]) then
		player = arg[arg.n]
		arg.n = arg.n - 1
	end
		
	party_add_do(player, arg, true)
end

-- Dismiss members from the player party
--
-- name:	name of NPC to dismiss from player party
--
function party_dismiss(...)
	party_dismiss_do(arg)
end

-- Get the prefix that should be prepended to the character's persona triggers.
--
-- name:	player's name
--
--	returns: string to append to the trigger
-- 
function persona_trigger_get_player_prefix(name)

	local voice_prefixes = {[0] = "WM", [1] = "BM", [2] = "HM", [3] = "WF", [4] = "BF", [5] = "HF"}
	local trigger_prefix = ""

	if(character_is_player(name)) then
		local player_voice_prefix = voice_prefixes[player_get_custom_voice(name)]
		if(player_voice_prefix ~= nil) then
			trigger_prefix = player_voice_prefix
		end
	end

	return trigger_prefix

end

function persona_override_character_start(character, situation, trigger, count)

	if type(situation) == "table" then
		for i, persona_situation in pairs(situation) do
			local trigger_prefix = persona_trigger_get_player_prefix(character)
			persona_override_character_start_do(character, persona_situation, trigger_prefix .. trigger, count)
		end
	else
		local trigger_prefix = persona_trigger_get_player_prefix(character)
		persona_override_character_start_do(character, situation, trigger_prefix .. trigger, count)
	end

end

function persona_override_character_stop(character, situation)

	if type(situation) == "table" then
		for i, persona_situation in pairs(situation) do
			persona_override_character_stop_do(character, persona_situation)
		end
	else
		persona_override_character_stop_do(character, situation)
	end

end

-- Override a group of personas 
--
--	The following 3 lines:
--
--		EX_PERSONAS	=	{	["AM_Gang1"]	=	"AMGNG1";
--								["AM_Gang2"]	=	"AMGNG2";
--							}
--		persona_override_group(EX_PERSONAS, POT_SITUATIONS[POT_ATTACK], "EX01_ATTACK")
--
--	Are equivalent to:
--
--		persona_override_persona_start(“AM_Gang1”, "threat - alert (group attack)",	"AMGNG1_EX01_ATTACK")
--		persona_override_persona_start(“AM_Gang1”, "threat - alert (solo attack)",		"AFGNG1_EX01_ATTACK")
--		persona_override_persona_start(“AM_Gang2", "threat - alert (group attack)",	"AMGNG2_EX01_ATTACK")
--		persona_override_persona_start(“AM_Gang2”, "threat - alert (solo attack)",		"AFGNG2_EX01_ATTACK")
--
-- Generally this function will be used with one of 4 predefined gang persona tables:
--		BROTHERHOOD_PERSONAS
--		RONIN_PERSONAS
--		SAINTS_PERSONAS
--		SAMEDI_PERSONAS
--
-- persona_list: Table w/ persona names as keys to the corresponding tag_prefix value.
--		see BROTHERHOOD_PERSONAS defined in this file for an example.
-- situation: Persona situation(s) to override - may be a scalar or a table value.
--	tag_suffix: The common trigger suffix.
--
function persona_override_group_start(persona_list, situation, tag_suffix)
	for persona, tag_prefix in pairs(persona_list) do
		persona_override_persona_start(persona, situation, tag_prefix .. "_" .. tag_suffix)
	end
end

-- Stop the overrides for a group of personas 
--
--	See persona_override_group_start() for a more detailed description of the parameters
--
-- persona_list: Table w/ persona names as keys to the corresponding tag_prefix value.
--		see BROTHERHOOD_PERSONAS defined in this file for an example.
-- situation: Persona situation(s) to stop overriding - may be a scalar or a table value.
--
function persona_override_group_stop(persona_list, situation)
	for persona, tag_prefix in pairs(persona_list) do
		persona_override_persona_stop(persona, situation)
	end
end

function persona_override_persona_start(persona, situation, trigger, count)

	if type(situation) == "table" then
		for i, persona_situation in pairs(situation) do
			persona_override_persona_start_do(persona, persona_situation, trigger, count)
		end
	else
		persona_override_persona_start_do(persona, situation)
	end

end

function persona_override_persona_stop(persona, situation)

	if type(situation) == "table" then
		for i, persona_situation in pairs(situation) do
			persona_override_persona_stop_do(persona, persona_situation)
		end
	else
		persona_override_persona_stop_do(persona, situation)
	end

end

function player_is_targeting( char, player )
	if player == nil then
		for i, p in pairs(player_names_get_all()) do
			if player_is_targeting_do(char, p) then
				return true
			end
		end
	
		return false
	end
	
	return player_is_targeting_do(char, player)	
end

function player_creation_open()
	player_creation_open_do()
	
	while (player_creation_is_open_do()) do
		thread_yield()
	end
end

-- Takes a table and returns a random key and value
-- NOTE: Use this for tables that have non-numerical or non-sequential keys.  
-- Otherwise, it's faster just to rand_int() the key directly.
--
-- input_table: table to choose a random entry from
--
-- returns: chosen key, value from input_table
--
function rand_table_key_value( input_table )
	local size = sizeof_table( input_table )
	if size == 0 then
		return
	end
	
	-- Choose the random entry
	local rand_idx = rand_int( 1, size )
	
	local idx = 1
	for k, v in pairs( input_table ) do
		if idx == rand_idx then
			return k, v
		end
		
		idx = idx + 1
	end
end

-- Take a screenshot (file is stored on the kit)
--
-- filename:	(optional) filename to use for screenshot (do not include extension)
--
function screenshot(...)
	if (arg.n > 0) then
		screenshot_do(arg[1])
	else
		screenshot_do("")
	end

	while (not(screenshot_check_done())) do
		thread_yield()
	end
end

function scripted_cutscene_play( cutscene_func, abort_func )
	scripted_cutscene_playing( true )

	thread_new_block( cutscene_func )
	
	thread_new_block( abort_func )
	
	scripted_cutscene_playing( false )
end

function subgroup_create( group_name, count, ... )

	subgroup_create_do( group_name, count )
	
	local handle = thread_new("create_group_check_done_loop",group_name)

	while((arg.n>0 and arg[1]) and not thread_check_done(handle)) do
		thread_yield()
	end
end

-- Make a human turn a certain amount
--
-- name:		name of character that is turning
-- angle:	relative angle to turn, in degrees
--
function turn_angle(name, angle)

	while (not(character_is_ready(name))) do
		thread_yield()
	end

	turn_angle_do(name, angle)

	while (not(turn_to_check_done(name))) do
		thread_yield()
	end

end

function sync_from_player(player_name)
	if player_name == REMOTE_PLAYER then
		return SYNC_REMOTE
	end
	if player_name == LOCAL_PLAYER then
		return SYNC_LOCAL
	end
	
	return SYNC_ALL
end

function teleport_coop( local_player_nav, remote_player_nav, exit_vehicles )

	if (coop_is_active()) then
		teleport( REMOTE_PLAYER, remote_player_nav, exit_vehicles )
	end

	teleport( LOCAL_PLAYER, local_player_nav, exit_vehicles )

	if (coop_is_active()) then
		waiting_for_player_dialog( true )

		while( not teleport_check_done(REMOTE_PLAYER)) do
			thread_yield()
		end
		waiting_for_player_dialog( false )
	end		
end

-- Trigger Event State Tracker
-- Function to deal with trigger events for multiple players
--
-- player_name: The name of the human that triggered the
--	event. Nothing happens if it's not a player.
-- event_state_tracker: A global variable that should
--	only be changed by this function.
--	Assign the return value of the function
--	event_state_tracker_create to setup this value.
--
-- trigger_option: Changes the behavior of the function.
--	Defaults to UPDATE_ACTIVATED.

-- Trigger Option Values:
-- UPDATE_ACTIVATED: Doesn't do anything but update the
--	event_state_tracker, and assumes that the
--	passed-in player name is the player that just
--	activated the state.
--
-- UPDATE_DEACTIVATED: Same as UPDATE_ACTIVATED, but
--	assumes that the player deactivated the state.
--
-- ALL_PLAYERS_DEACTIVATED: Assumes the passed-in
--	player just deactivated the state, and returns
--	true if all players have done so.
--
-- ANY_PLAYER_DEACTIVATED: Assumes the passed-in
--	player just deactivated the state, and returns
--	true if indeed player_name is a player.
--
-- ALL_PLAYERS_ACTIVATED: Assumes the passed-in player
--	just activated the state. Returns true if all
--	players have triggered the state, false otherwise.
--	Will continue to trigger if either player
--	activates the trigger a second time.
--
-- ALL_PLAYERS_ACTIVATED_RESET: Just like
--	ALL_PLAYERS_ACTIVATED, only it sets the trackers
--	to false after both are triggered before
--	returning true.
--
-- TRIGGER_MULTIPLE_TIMES: Returns true if either of
--	the players triggered.
--
-- TRIGGER_ONCE_FIRST_ACTIVATION: Returns true for the
--	first player to trigger the trigger, false
--	afterward and otherwise.
--
-- TRIGGER_ONCE_PER_PLAYER: Returns true one for each
--	player's first triggering of the trigger.
--
function trigger_event_state_tracker( player_name, event_state_tracker, track_option )

	-- First check whether the player_name is valid
	local current_players = player_names_get_all()
	local player_found = false
	for i, player in pairs(current_players) do
		if player_name == player then
			player_found = true
			break
		end
	end
	
	if not player_found then
		return false
	end

	-- Use default track option
	if track_option == nil then
		track_option = UPDATE_ACTIVATED
	end
	
	-- UPDATE_DEACTIVATED, ALL_PLAYERS_DEACTIVATED, and ANY_PLAYER_DEACTIVATED
	if track_option >= UPDATE_DEACTIVATED and track_option <= ANY_PLAYER_DEACTIVATED then
		event_state_tracker[player_name] = false
		
		if track_option == ALL_PLAYERS_DEACTIVATED then
			-- Spin through all the current players looking for an active trigger
			for i, player in pairs(current_players) do
				if event_state_tracker[player] == true then
					return false
				end
			end
			
			-- Trigger when all players have deactivated
			return true
		
		elseif track_option == ANY_PLAYER_DEACTIVATED then
			-- Return true if any deactivated the state
			return true
		end
	
	-- UPDATE_ACTIVATED, ALL_PLAYERS_ACTIVATED, ALL_PLAYERS_ACTIVATED_RESET, and TRIGGER_MULTIPLE_TIMES
	elseif track_option >= UPDATE_ACTIVATED and track_option <= TRIGGER_MULTIPLE_TIMES then
		event_state_tracker[player_name] = true
		
		if track_option == ALL_PLAYERS_ACTIVATED or track_option == ALL_PLAYERS_ACTIVATED_RESET then
			-- Spin through all the current players looking for an inactive trigger
			for i, player in pairs(current_players) do
				if event_state_tracker[player] == false then
					return false
				end
			end
			
			if track_option == ALL_PLAYERS_ACTIVATED_RESET then
				-- Reset everyone, including inactive players, just in case
				for i, player in pairs(PLAYER_TAG_LIST) do
					event_state_tracker[player] = false
				end
			end
			
			-- Trigger when all players have activated the event
			return true
			
		elseif track_option == TRIGGER_MULTIPLE_TIMES then
			-- Trigger when any player hits the trigger
			return true
		end
		
	elseif track_option == TRIGGER_ONCE_FIRST_TRIGGERER then
		-- If any of the state triggers are set, this event has already been triggered
		for i, player in pairs(current_players) do
			if event_state_tracker[player] == true then
				return false
			end
		end
		
		-- Trigger once for the first person that activates the event
		event_state_tracker[player_name] = true
		return true
		
	elseif track_option == TRIGGER_ONCE_PER_PLAYER then
		-- Check if this player's already fired the event
		if event_state_tracker[player] == true then
			return false
		end
		
		-- Trigger once for each player
		event_state_tracker[player_name] = true
		return true
	end
	
	-- Unrecognized track_option?
	return false
end

-- Make a human turn to face an arbitrary object or navpoint
--
-- name:		name of character that is turning
-- target:		name of target object
-- orient:		if true, turn to same direction as target's orient instead (default: false)
--
function turn_to(name, target, orient)
	while (not(character_is_ready(name))) do
		thread_yield()
	end

	turn_to_do(name, target, orient)

	while (not(turn_to_check_done(name))) do
		thread_yield()
	end
end

-- Make a human turn to face a character
--
-- name:		name of character that is turning
-- target:		name of target character
--
function turn_to_char(name, target)
	turn_to(name, target)
end

-- Make a human turn to face a navpoint
--
-- name:			name of character that is turning
-- nav_name:		name of target navpoint
--
function turn_to_nav(name, nav_name)
	turn_to(name, nav_name)
end

-- Make a human turn to face in the same direction as an arbitrary object
--
-- name:			name of character that is turning
-- target:			name of target to get orientation from
--
function turn_to_orient(name, target)
	turn_to(name, target, true)
end

-- Make a npc enter a vehicle
--
-- name:			name of character that is entering the vehicle
-- vehicle_name:	name of vehicle to enter
-- seat:			specific seat to enter (default: 0)
-- block:			if true, block until done (default: true)
-- force_hijack_success: if true, forces any hijack attempts resulting from this
--                       call to succeed.
--
function vehicle_enter(name, vehicle_name, seat, block, force_hijack_success)
   if ( force_hijack_success == nil ) then
      force_hijack_success = false
   end
	local s = vehicle_enter_do(name, vehicle_name, false, seat, force_hijack_success)
	local r
	
	if (block or (block == nil)) then
		repeat
			thread_yield()
			r = vehicle_enter_check_done(name)
		until r ~= 0
	else
		return s
	end
	
	if r == 2 then
		return false
	else
		return true
	end
end

-- Make a npc teleport into a vehicle
--
-- name:			name of character that is entering the vehicle
-- vehicle_name:	name of vehicle to enter
-- seat:			specific seat to enter (default: 0)
-- block:			if true, block until done (default: true)
--
function vehicle_enter_teleport(name, vehicle_name, seat, block)
	local s = vehicle_enter_do(name, vehicle_name, true, seat)
	local r
	
	if (block or (block == nil)) then
		repeat
			thread_yield()
			r = vehicle_enter_check_done(name)
		until r ~= 0
	else
		return s
	end
	
	if r == 2 then
		return false
	else
		return true
	end
end

-- Make a group of NPCs enter a vehicle
--
-- names:			names of characters entering the vehicle
-- vehicle_name:	name of vehicle to enter
-- 
function vehicle_enter_group(...)
	local npcs = {}
	local vehicle_name

	if type(arg[1]) == "table" then
		npcs = arg[1]
		npcs[ "n" ] = sizeof_table( npcs )
		
		vehicle_name = arg[2]
	else		
		vehicle_name = arg[ arg.n ]
		
		npcs = arg;
		npcs.n = npcs.n - 1
	end

	if (vehicle_enter_group_do(vehicle_name, false, npcs)) then
		while (not(vehicle_enter_group_check_done(vehicle_name, false, npcs))) do
			thread_yield()
		end
	end

	-- remove the appended entry from the table
	npcs.n = nil
end

-- Make a group of NPCs teleport into a vehicle
--
-- names:			names of characters entering the vehicle
-- vehicle_name:	name of vehicle to enter
-- 
function vehicle_enter_group_teleport(...)
	local npcs = {}
	local vehicle_name

	if type(arg[1]) == "table" then
		npcs = arg[1]
		npcs[ "n" ] = sizeof_table( npcs )
		
		vehicle_name = arg[2]
	else		
		vehicle_name = arg[ arg.n ]
		
		npcs = arg;
		npcs.n = npcs.n - 1
	end
	
	if (vehicle_enter_group_do(vehicle_name, true, npcs)) then
		while (not(vehicle_enter_group_check_done(vehicle_name, true, npcs))) do
			thread_yield()
		end
	end

	--remove the appended entry from the table
	npcs.n = nil
end

-- Make a npc exit a vehicle
--
-- name:	name of character to exit a vehicle
--
function vehicle_exit(name, not_enterable)
	if (vehicle_exit_do(name, false, not_enterable, false)) then
		while (not(vehicle_exit_check_done(name))) do
			thread_yield()
		end
	end
end

-- Make a npc exit a vehicle by diving
--
-- name:	name of character to exit a vehicle
--
function vehicle_exit_dive(name, not_enterable)
	if (vehicle_exit_do(name, true, not_enterable, true)) then
		while (not(vehicle_exit_check_done(name))) do
			thread_yield()
		end
	end
end


-- Make a npc exit a vehicle by teleporting
--
-- name:	name of character to exit a vehicle
--
function vehicle_exit_teleport(name, not_enterable)
	if (vehicle_exit_do(name, true, not_enterable, false)) then
		while (not(vehicle_exit_check_done(name))) do
			thread_yield()
		end
	end
end

-- Make a vehicle navmesh pathfind to a series of navpoints, starting from a specific point along the path
-- 
-- name: name of the vehicle
-- start_index: index into the path to start from
-- path: either a script path or a list of script navpoints
-- stop_at_goal:	(optional) whether vehicle should stop at end of goal (default true)
-- force_path:		(optional) whether to ignore current position to support looping (defualt false)
-- suppress_errors: (optional, default false)
--
function vehicle_navmesh_pathfind_to_starting_from(name, start_index, ...)
	local num_args, stop_at_goal, force_path, suppress_errors

	stop_at_goal = true
	force_path = false
	suppress_errors = false

	num_args = arg.n
	
	local bool_count = 0;
	local index = num_args;
	
	while (type(arg[num_args]) == "boolean") do
		bool_count = bool_count + 1
		num_args = num_args - 1
	end

	if (bool_count >= 3) then
		suppress_errors = arg[num_args + 3]
	end

	if (bool_count >= 2) then
		force_path = arg[num_args + 2]
	end

	if (bool_count >= 1) then
		stop_at_goal = arg[num_args + 1]
	end

	local arg_type = type(arg[1])

	if (arg_type == "table") then
		num_args = sizeof_table(arg[1])
		if (vehicle_pathfind_navmesh_do(name, force_path, stop_at_goal, suppress_errors, start_index, num_args, arg[1])) then
			local check_done = vehicle_pathfind_check_done(name)
			
			while ( check_done == 0) do
				thread_yield()
				check_done = vehicle_pathfind_check_done(name)
			end
			
			return check_done == 1
		else
			return false
		end
	elseif (arg_type == "string") then
		if (vehicle_pathfind_navmesh_do(name, force_path, stop_at_goal, suppress_errors, start_index, num_args, arg)) then
			local check_done = vehicle_pathfind_check_done(name)
			
			while ( check_done == 0) do
				thread_yield()
				check_done = vehicle_pathfind_check_done(name)
			end
			
			return check_done == 1
		else
			return false
		end
	end

end

-- Make a vehicle go to a series of navpoints (could just be 1)
-- 
-- name: name of the vehicle
-- path: either a script path or a list of script navpoints
-- use_navmesh:	if the car should use navmesh or traffic splines(default normal)
-- stop_at_goal:	(optional) whether vehicle should stop at end of goal (default true)
-- force_path:		(optional) whether to ignore current position to support looping (defualt false)
-- suppress_errors: (optional, default false)
--
function vehicle_pathfind_to(name, ...)
	local num_args, use_navmesh, stop_at_goal, force_path, suppress_errors
	
	stop_at_goal = true
	force_path = false
	suppress_errors = false;
	use_navmesh = false;

	-- Wait until the resource is loaded.
	-- character_wait_for_loaded_resource(name)
			
	num_args = arg.n
	
	local bool_count = 0;
	local index = num_args;
	
	while (type(arg[num_args]) == "boolean") do
		bool_count = bool_count + 1
		num_args = num_args - 1
	end

	if (bool_count >= 4) then
		suppress_errors = arg[num_args + 4]
	end

	if (bool_count >= 3) then
		force_path = arg[num_args + 3]
	end

	if (bool_count >= 2) then
		stop_at_goal = arg[num_args + 2]
	end

	if (bool_count >= 1) then
		use_navmesh = arg[num_args + 1]
	end

	local arg_type = type(arg[1])
	if (use_navmesh) then

		if (arg_type == "table") then
			num_args = sizeof_table(arg[1])
			if (vehicle_pathfind_navmesh_do(name, force_path, stop_at_goal, suppress_errors, 0, num_args, arg[1])) then
				local check_done = vehicle_pathfind_check_done(name)
				
				while ( check_done == 0) do
					thread_yield()
					check_done = vehicle_pathfind_check_done(name)
				end
				
				return check_done == 1
			else
				return false
			end
		elseif (arg_type == "string") then
			if (vehicle_pathfind_navmesh_do(name, force_path, stop_at_goal, suppress_errors, 0, num_args, arg)) then
				local check_done = vehicle_pathfind_check_done(name)
				
				while ( check_done == 0) do
					thread_yield()
					check_done = vehicle_pathfind_check_done(name)
				end
				
				return check_done == 1
			else
				return false
			end
		end
	else
		if (arg_type == "table") then
			local table_size = sizeof_table(arg[1])
			if (vehicle_pathfind_to_do(name, stop_at_goal, suppress_errors, table_size, arg[1])) then
				local check_done = vehicle_pathfind_check_done(name)
				
				while ( check_done == 0) do
					thread_yield()
					check_done = vehicle_pathfind_check_done(name)
				end
				
				return check_done == 1
			else
				return false
			end
		elseif (arg_type == "string") then
			if (vehicle_pathfind_to_do(name, stop_at_goal, suppress_errors, num_args, arg)) then
				local check_done = vehicle_pathfind_check_done(name)
				
				while ( check_done == 0) do
					thread_yield()
					check_done = vehicle_pathfind_check_done(name)
				end
				
				return check_done == 1
			else
				return false
			end
		end
	end
end

-- Make a vehicle use turret mode to move througha series of navpoints (could just be 1)
-- 
-- name:		name of the vehicle
-- dest:		name of destination navpoint(s)
-- stop_at_goal:	(optional) whether vehicle should stop at end of goal (default true)
--
function vehicle_turret_base_to(name, ...)
	local num_args, stop_at_goal
	
	-- Wait until the resource is loaded.
	-- character_wait_for_loaded_resource(name)
			
	num_args = arg.n
	
	-- get whether to stop_at_goal is passed in...
	local last_arg_bool = type(arg[num_args]) == "boolean"
	
	if (last_arg_bool == true) then
		stop_at_goal = arg[num_args]
		num_args = num_args - 1
	else
		stop_at_goal = true
		num_args = num_args
	end
	
	local arg_type = type(arg[1])

	if (arg_type == "table") then
		num_args = sizeof_table(arg[1])
		if (vehicle_turret_base_to_do(name, stop_at_goal, num_args, arg[1])) then
			local check_done = vehicle_pathfind_check_done(name)
			
			while ( check_done == 0) do
				thread_yield()
				check_done = vehicle_pathfind_check_done(name)
			end
			
			return check_done == 1
		else
			return false
		end
	elseif (arg_type == "string") then
		if (vehicle_turret_base_to_do(name, stop_at_goal, num_args, arg)) then
			local check_done = vehicle_pathfind_check_done(name)
			
			while ( check_done == 0) do
				thread_yield()
				check_done = vehicle_pathfind_check_done(name)
			end
			
			return check_done == 1
		else
			return false
		end
	end
end

function vehicle_stop( name, dont_block )

	if( (name == nil) or (not vehicle_exists(name)) or  (vehicle_is_destroyed(name)) ) then
		return
	end

	vehicle_stop_do( name )
	
	while( (not dont_block) and get_vehicle_speed(name) > 0 ) do
		thread_yield()
	end
end


 -- Between projects these 4 function can be removed and scripting can instead use the general character functions
function item_throw( human_name, nav_name )
	character_throw_havok_weapon( human_name, nav_name )
end

function mesh_mover_throw( human_name )
	character_throw_havok_weapon( human_name, nil )
end

function mesh_mover_wield( mover_name, human_name, instant )
	return character_wield_havok_weapon( human_name, mover_name, instant, IS_MOVER )
end

function item_wield( item_name, human_name, instant )
	return character_wield_havok_weapon( human_name, item_name, instant, IS_ITEM )
end