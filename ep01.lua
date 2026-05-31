-- ep01.lua
-- SR2 mission script
-- 3/28/07

-- Cutscene crash fixes by IdolNinja
-- 3/12/2011


-- Global constants ( ALL_CAPS means that they shouldn't be modified in running code, except for maybe	group_create_hidden(group) in a setup function )



	-- KNOBS_TO_TURN --


			--[[ *** READ ME ***
			
				Whenever a script function looks up a wave parameter, a naming convention is used to select the appropriate value.
				Parameter values for single player missions can use any name, say "PARAMETER_1" for example. If you wish to have
				a different value for that parameter in coop, then prepend "COOP" to the parameter name. In this case, we get
				"COOP_PARAMETER_1".

				When a mission function needs to access "PARAMETER_1", it will search for the appropriate overloaded values first:

					*	Single player will use the value stored in "PARAMETER_1".
				
					*	Coop will use the value stored in "COOP_PARAMETER_1", if it exists. Otherwise it will use the
						default single player value stored in "PARAMETER_1".
			 ]]

			-- Mission parameters
			EP01_PARAMETERS	= 
				{	

					-- Stage 1, nightclub fight

						-- single-player values
							["ULTOR_BLITZ_CHANCE"]				= .5,		-- chance that Ultor will charget the player
							["ULTOR_ATTACK_NPC_CHANCE"]		= .2,		-- chance that Ultor will attack NPCs

						-- coop values

					-- Stage 2, save the ltnts
					
						-- single-player values
							["MIN_POLICE_NOTORIETY"]			= 3,		-- Min Police/Ultor notoriety after leaving the nightclub.

							["PIERCE_MAX_HIT_POINTS"]			= 3000,	-- Max # hit points for pierce
							["PIERCE_PERCENT_HEALTH"]			= 1.0,	-- Ratio of his hit points Pierce has when player(s) arrive.
							["PIERCE_SURVIVAL_TICKS"]			= 20,		-- Number of times Pierce's health will tick down before he dies.
							["PIERCE_SURVIVAL_TIME_S"]			= 90,		-- How long Pierce will survive
			
							["VAN_DRIVER_HIT_POINTS"]			= 4000,	-- Shaundi kidnapping van driver HP
							["VAN_SHOTGUN_HIT_POINTS"]			= 4000,	-- HP of ultor riding shotgun in Shaundi kidnapping van
							["VAN_HIT_POINTS"]					= 12000, -- Shaundi kidnapping van HP
							["VAN_WARN_PERCENT_HEALTH"]		= .40,	-- Warn the player that the van is almost disabled
							["VAN_DISABLED_PERCENT_HEALTH"]	= .30,	-- Van disabled @ this ratio health if not destroyed
							["VAN_TORQUE_MODIFIER"]				= 1.4,	-- Increasing torque makes the van driver more erratic

							["VAN_MAX_SPEED_INITIAL"]			= 60,		-- Van's max speed at the start of its path.
							["VAN_MAX_SPEED_DAMAGED"]			= 80,		-- Van's max speed after it takes damage.
							["VAN_OUT_OF_RANGE_SPEED_RATIO"] = .6,		-- Van travels at this portion of max speed if players out of range.
							["VAN_OUT_OF_RANGE_DIST_M"]      = 50,		-- Distance at which above ratio is applied.

						-- coop values

				}

	-- COOP MISSION? -- 
		IN_COOP	= false

	-- CHARACTERS --

		--CHARACTER_PIERCE			= "ep01_$Cpierce"
		CHARACTER_PIERCE			= "ep01_$Cpierce2"
		CHARACTER_SHAUNDI			= "ep01_$Cshaundi"

		CHARACTER_SHAUNDI_ULTOR_SHOTGUN	=	"ep01_$c031"	-- Sitting shotgun in the Shaundi-nabbing van
		CHARACTER_SHAUNDI_ULTOR_DRIVER	=	"ep01_$c032"	-- Driving the van

	-- CHECKPOINTS
		
		CHECKPOINT_START			= MISSION_START_CHECKPOINT			-- defined in ug_lib.lua
		CHECKPOINT_LEFT_CLUB		= "ep01_checkpoint_left_club"		-- player(s) made it out of the club
		CHECKPOINT_LTNT_SAVED	= "ep01_checkpoint_ltnt_saved"	-- player has saved 1 ltnt (used in single player only)
		
	-- GROUPS --

		GROUP_CLUB_ULTOR						= "ep01_$Gclub_ultor"
		GROUP_CLUB_ULTOR_COOP				= "ep01_$Gclub_ultor_coop"
		GROUP_CLUB_MASAKO_A					= "ep01_$Gmasako_team_a"
		GROUP_CLUB_MASAKO_B					= "ep01_$Gmasako_team_b"
		GROUP_CLUB_ULTOR_OUTSIDE			= "ep01_$Gclub_ultor_outside"
		GROUP_CLUB_ULTOR_OUTSIDE_COOP		= "ep01_$Gclub_ultor_outside_coop"
		GROUP_SHAUNDI							= "ep01_$Gshaundi"
		GROUP_SHAUNDI_ULTOR					= "ep01_$Gshaundi_ultor"
		GROUP_PIERCE							= "ep01_$Gpierce2"
		GROUP_PIERCE_ULTOR					= "ep01_$Gpierce_ultor2"
		GROUP_CTE								= "ep01_$GCTE"

	-- GROUP MEMBER TABLES -- 

		MEMBERS_GROUP_CLUB_ULTOR		=	{	"ep01_$c000", "ep01_$c001", "ep01_$c002", "ep01_$c003", "ep01_$c004",
														"ep01_$c005", "ep01_$c006", "ep01_$c007", "ep01_$c013", "ep01_$c014",
														"ep01_$c015", "ep01_$c045", "ep01_$c056"}

		MEMBERS_GROUP_CLUB_ULTOR_COOP =	{	"ep01_$c016", "ep01_$c017", "ep01_$c018", "ep01_$c019", "ep01_$c020"}

		MEMBERS_GROUP_PIERCE_ULTOR		=	{	"ep01_$c046", "ep01_$c047", "ep01_$c048", "ep01_$c049", "ep01_$c050",
														"ep01_$c051", "ep01_$c052", "ep01_$c053", "ep01_$c054", "ep01_$c055"}

		MASAKO_STAIRS_UNLEASH			=	{	"ep01_$c013", "ep01_$c045", "ep01_$c056"}
		MASAKO_STAIRS_UNLEASH_COOP		=	{	"ep01_$c017", "ep01_$c018", "ep01_$c019", "ep01_$c020"}

	-- HELPTEXT

		-- localized helptext messages

			-- Failure conditions
			HELPTEXT_FAILURE_SHAUNDI_ABANDONED	= "ep01_failure_shaundi_abandoned" -- "Shaundi was abandoned"
			HELPTEXT_FAILURE_SHAUNDI_DIED			= "ep01_failure_shaundi_died" -- "Shaundi died"
			HELPTEXT_FAILURE_PIERCE_ABANDONED	= "ep01_failure_pierce_abandoned"  -- "Pierce was abandoned"
			HELPTEXT_FAILURE_PIERCE_DIED			= "ep01_failure_pierce_died" -- "Pierce died"

			-- Hud
			HELPTEXT_HUD_PIERCE_HEALTH				= "ep01_hud_pierce_health" -- "Pierce's health"
			HELPTEXT_HUD_VAN_HEALTH					= "ep01_hud_van_health" -- "Van's condition"

			-- Prompts

			HELPTEXT_PROMPT_EXIT_CLUB				= "ep01_prompt_exit_club" -- "Fight your way out of the club!"
			HELPTEXT_PROMPT_CHECK_LIEUTENANTS	= "ep01_prompt_check_lieutenants" -- "Make sure that Pierce and Shaundi are ok"

			HELPTEXT_PROMPT_SAVE_SHAUNDI			= "ep01_prompt_save_shaundi" -- "Stop the van before the Ultor kill Shaundi and dump her body"
			--HELPTEXT_PROMPT_SAVE_PIERCE			= "ep01_prompt_save_pierce" -- "Save Pierce"
			HELPTEXT_PROMPT_VAN_ALMOST_DISABLED = "ep01_prompt_van_almost_disabled" -- "Careful, the van is almost disabled"
			HELPTEXT_PROMPT_KILL_ULTOR				= "ep01_prompt_kill_ultor" -- "Eliminate the Ultor before Pierce dies"

			HELPTEXT_PROMPT_CHECK_PIERCE			= "ep01_prompt_check_pierce" -- "Now check on Pierce"
			HELPTEXT_PROMPT_CHECK_SHAUNDI			= "ep01_prompt_check_shaundi" -- "Now check on Shaundi"

			-- Objectives
			HELPTEXT_OBJECTIVE_ULTOR				= "ep01_objective_ultor" -- "%s of %s Ultor remaining"	

		-- unlocalized helptext messages

	-- MOVERS
		DOOR_MASAKO_TEAM_A_1	= "ep01_DoorMM010"
		DOOR_MASAKO_TEAM_A_2	= "ep01_DoorMM020"
		DOOR_MASAKO_TEAM_B_1 = "ep01_DoorMM030"
		DOOR_IN_CLUB_1			= "ep01_$Door_in_club_1"
		DOOR_IN_CLUB_2			= "ep01_$Door_in_club_2"

	-- NAVPOINTS

		NAVPOINT_LOCAL_PLAYER_START		= "ep01_$Nlocal_player_start"
		NAVPOINT_REMOTE_PLAYER_START		= "ep01_$Nremote_player_start"

		SHAUNDI_VAN_TURRET_PATH				=	{	"ep01_$n006", "ep01_$n001"}
		SHAUNDI_VAN_NAVMESH_PATH			=	{	"ep01_$n002", "ep01_$n003", "ep01_$n004"}

		NAVPOINT_PIERCE_LOCATION			= "ep01_$n_pierce_apt2" -- Target for Ultor "shooting at Pierce"
		
		NAVPOINT_LOCAL_SUCCESS				= "ep01_$Nlocal_player_finish" -- teleport nav for the end of the mission
		NAVPOINT_REMOTE_SUCCESS				= "ep01_$Nremote_player_finish" -- teleport nav for the end of the mission

	-- TRIGGERS -- 

		TRIGGER_MASAKO_TEAM_A_1			= "ep01_$t000"
		TRIGGER_MASAKO_TEAM_A_2			= "ep01_$t001"
		TRIGGER_MASAKO_TEAM_B_1			= "ep01_$t002"
		TRIGGER_CLUB_FRONT_EXIT			= "ep01_$Tclub_front_exit"
		TRIGGER_CLUB_REAR_EXIT			= "ep01_$Tclub_rear_exit"
		TRIGGER_CLUB_FRONT_ENTRANCE	= "ep01_$Tclub_front_entrance"
		TRIGGER_CLUB_REAR_ENTRANCE		= "ep01_$Tclub_rear_entrance"
		TRIGGER_PIERCE						= "ep01_$Tnear_pierce2"
		TRIGGER_SHAUNDI					= "ep01_$Tnear_shaundi"
		-- If the player entered this area w/ a vehicle, Pierce's cutscene path may be blocked. Don't play the cutscene.
		TRIGGER_PIERCE_CUTSCENE_AREA	= "ep01_$Tpierce_cutscene_area" 

		-- List of all triggers, makes cleaning up more convenient
		TABLE_ALL_TRIGGERS		= {	TRIGGER_CLUB_FRONT_EXIT, TRIGGER_CLUB_REAR_EXIT, TRIGGER_CLUB_FRONT_ENTRANCE,
												TRIGGER_CLUB_REAR_ENTRANCE, TRIGGER_PIERCE, TRIGGER_SHAUNDI, TRIGGER_MASAKO_TEAM_A_1,
												TRIGGER_MASAKO_TEAM_A_2, TRIGGER_MASAKO_TEAM_B_1, TRIGGER_PIERCE_CUTSCENE_AREA}		

	-- VEHICLES --

		VEHICLE_SHAUNDI_VAN	=	"ep01_$v002"	-- The van which takes Shaundi off to the remote kill spot

	-- MISC CONSTANTS

		HUD_BAR = {[LOCAL_PLAYER] = 0, [REMOTE_PLAYER] = 1}

		MASAKO_TEAM_INFO = 
		{
			{	
				["group"]		= GROUP_CLUB_MASAKO_A,
				["triggers"]	= {TRIGGER_MASAKO_TEAM_A_1, TRIGGER_MASAKO_TEAM_A_2},
				["doors"]		= {DOOR_MASAKO_TEAM_A_1, DOOR_MASAKO_TEAM_A_2},
				["members"]    = {"ep01_$c008", "ep01_$c009", "ep01_$c010", "ep01_$c033", "ep01_$c035",
										"ep01_$c037", "ep01_$c039"},
				["callback"]	= "ep01_masako_team_a_attack",
			},
			{	
				["group"]		= GROUP_CLUB_MASAKO_B,
				["triggers"]	= {TRIGGER_MASAKO_TEAM_B_1},
				["doors"]		= {DOOR_MASAKO_TEAM_B_1},
				["members"]    = {"ep01_$c011", "ep01_$c012", "ep01_$c034", "ep01_$c036", "ep01_$c038",
										"ep01_$c040"},
				["callback"]	= "ep01_masako_team_b_attack",
			};
		}

		OTHER_PLAYER	=	{	[LOCAL_PLAYER]	= REMOTE_PLAYER,
									[REMOTE_PLAYER] = LOCAL_PLAYER,
								}

		PLAYER_SYNC		=	{	[LOCAL_PLAYER]	= SYNC_LOCAL,
									[REMOTE_PLAYER] = SYNC_REMOTE,
								}

		LTNT_TRIGGER_MESSAGE		=	{	[TRIGGER_PIERCE]	= "",
												[TRIGGER_SHAUNDI] = HELPTEXT_PROMPT_SAVE_SHAUNDI,
											}
		
		LTNT_TRIGGER_FUNCTIONS	=	{	[TRIGGER_PIERCE]	= "ep01_save_pierce",
												[TRIGGER_SHAUNDI] = "ep01_save_shaundi",
											}

		LTNT_SETUP_FUNCTIONS		=	{	[TRIGGER_PIERCE]	= nil,
												[TRIGGER_SHAUNDI] = "ep01_setup_shaundi",
											}

		-- The join function for the save-shaundi sequence is intentionally left empty
		-- even though there is an ep01_join_shaundi function. A separate thread is
		-- set up to handle the second player joining this sequence .
		LTNT_TRIGGER_JOIN_FUNCTIONS	=	{	[TRIGGER_PIERCE]	= "ep01_join_pierce",
														[TRIGGER_SHAUNDI] = "",
													}

		SHAUNDI_VAN_ESCORT		=	{	["ep01_$v010"]	=	{"ep01_$c043", "ep01_$c044"},
												["ep01_$v009"]	=	{"ep01_$c041", "ep01_$c042"}
											}

-- Progress flags
	Player_sequence_begun			=	{	[LOCAL_PLAYER]	= "",
													[REMOTE_PLAYER] = ""
												}
	Shaundi_van_disabled				= false
	Shaundi_van_damaged				= false -- Has the Shaundi-knapping van been damaged yet?

-- Threads
	Thread_pierce_health				= -1

-- Misc
	Shaundi_saved						= false -- Has player rescued Shaundi?
	Pierce_saved						= false -- Has player rescued Pierce?

	Pierce_cutscene_area_blocked	= false -- Did a player drive a vehicle into Pierce's cutscene area?

	Shaundi_escort_disabled	= {}
	Shaundi_escort_driver	= {}
	Num_escorts					= 0



-- CUTSCENES --
-- Added by IdolNinja. These variables are used in the script for the cutscenes for stability instead of calling them directly

CUTSCENE_IN = 		"tsse01-01"
CUTSCENE_OUT = 		"tsse01_02"
MISSION_NAME =		"ep01"


function ep01_start(ep01_checkpoint, opening_cutscene_played)

	if (ep01_checkpoint == CHECKPOINT_START) then

		-- Dismiss current party
		party_dismiss_all()

		if (not opening_cutscene_played) then
			cutscene_play(CUTSCENE_IN)
		end
		fade_out(0)
	end

	ep01_initialize(ep01_checkpoint)

	local is_restart = (ep01_checkpoint ~= CHECKPOINT_START)

	-- Restarting, remind the players what they're supposed to be doing.
	if (ep01_checkpoint == CHECKPOINT_LTNT_SAVED) then
		if (Shaundi_saved) then
			mission_help_table(HELPTEXT_PROMPT_CHECK_PIERCE)
		end
		if (Pierce_saved) then
			mission_help_table(HELPTEXT_PROMPT_CHECK_SHAUNDI)
		end
	elseif (ep01_checkpoint == CHECKPOINT_LEFT_CLUB) then
		mission_help_table(HELPTEXT_PROMPT_CHECK_LIEUTENANTS)
	end

	-- Stage 1: Players exit the club
	if(ep01_checkpoint == CHECKPOINT_START) then

		ep01_exit_club()

		-- CHECKPOINT!
		mission_set_checkpoint(CHECKPOINT_LEFT_CLUB)
		ep01_checkpoint = CHECKPOINT_LEFT_CLUB

	end -- ends CHECKPOINT_START

	-- Player rescues both Ltnts.
	if ( (ep01_checkpoint == CHECKPOINT_LTNT_SAVED) or (ep01_checkpoint == CHECKPOINT_LEFT_CLUB)) then

		ep01_prepare_ltnt_triggers(is_restart)
		if (is_restart) then
			-- Display a waypoint when needed
			thread_new("ep01_waypoint_thread")			
		end

		-- Wait for the player to save both Shaundi and Pierce
		while(not (Shaundi_saved and Pierce_saved)) do
			thread_yield()
		end
	end

	ep01_complete()
end

function ep01_initialize(checkpoint)

	mission_start_fade_out(0.0)

	ep01_initialize_common()

	ep01_initialize_checkpoint(checkpoint)

	mission_start_fade_in()

end

-- Initialization code shared by all checkpoints.
function ep01_initialize_common()

	-- Start trigger is hit...the activate button was hit
	set_mission_author("Phillip Alexander")

	if coop_is_active() then
		IN_COOP = true
	end

	-- Get police notoriety level...  
	--Ep_starting_police_notoriety = notoriety_get_decimal("Police")
	--notoriety_set_min("Police", 0)
	--notoriety_set("Police", 0)
	--notoriety_set_max("Police", 0)

	-- Disallow action node spawning throughout this mission... the framerate is
	-- just too bad near Pierce.
	action_nodes_enable(false)
	
	homie_mission_lock("Pierce")
	homie_mission_lock("Shaundi")

	-- Bump up notoriety to the minimum level
	notoriety_reset("Police")
	notoriety_set_min("Police", ep01_get_parameter_value("MIN_POLICE_NOTORIETY"))

	-- Disable police notoriety while a save-ltnt sequence is active
	thread_new("ep01_notoriety_thread")

end

-- Initialization code specific to the checkpoint.
function ep01_initialize_checkpoint(checkpoint)

	if(checkpoint == CHECKPOINT_START) then

		-- Start loading the ultor goons
		ep01_group_create_maybe_coop(GROUP_CLUB_ULTOR, GROUP_CLUB_ULTOR_COOP, true)
		ep01_group_create_maybe_coop(GROUP_CLUB_ULTOR_OUTSIDE, GROUP_CLUB_ULTOR_OUTSIDE_COOP, true)

		-- We haven't saved anybody yet.
		Ep01_lieutenant_saved = ""

		-- Teleport players to start location
		teleport_coop(NAVPOINT_LOCAL_PLAYER_START, NAVPOINT_REMOTE_PLAYER_START)

		-- Setup Ultor goons
		local blitz_chance = ep01_get_parameter_value("ULTOR_BLITZ_CHANCE")
		local attack_npc_chance = ep01_get_parameter_value("ULTOR_ATTACK_NPC_CHANCE")
		local function setup_goon(goon)
			local roll = rand_float(0.0,1.0)
			if (roll < blitz_chance) then
				set_blitz_flag(goon,true)
			end
			set_always_sees_player_flag(goon, true)
			attack(goon)
			
		end
		for i,goon in pairs(MEMBERS_GROUP_CLUB_ULTOR) do
			setup_goon(goon)				
		end
		if (IN_COOP) then
			for i,goon in pairs(MEMBERS_GROUP_CLUB_ULTOR_COOP) do
				setup_goon(goon)				
			end
		end

		-- Make sure that the double doors near the starting area are open
		door_open(DOOR_IN_CLUB_1)
		door_open(DOOR_IN_CLUB_2)

		crouch_start(LOCAL_PLAYER)
		if (IN_COOP) then
			crouch_start(REMOTE_PLAYER)
		end

		-- Give the players time to start crouching
		delay(1.0)

	end

	-- In single player only, there is a checkpoint after one ltnt has been saved.
	-- We can figure out which ltnt has been saved because they'll have been added
	-- to the player's party as a follower. In coop, if a ltnt has been saved, then
	-- we store their name in the mission_globals variable Ep01_lieutenant_saved.

	if ((checkpoint == CHECKPOINT_LTNT_SAVED) or (Ep01_lieutenant_saved ~= "")) then

		-- In coop, saved lieutenants won't have been in the player's party at the time of
		-- the last checkpoint. Therefore, we need to spawn them ourselves.
		if (IN_COOP) then
			if (Ep01_lieutenant_saved == CHARACTER_SHAUNDI) then
				Shaundi_saved = true
				group_create(GROUP_SHAUNDI,true)
				party_add(CHARACTER_SHAUNDI)
				ep01_override_shaundi_persona()
				teleport(CHARACTER_SHAUNDI, TRIGGER_CLUB_REAR_EXIT)
			elseif (Ep01_lieutenant_saved == CHARACTER_PIERCE) then
				Pierce_saved = true
				group_create(GROUP_PIERCE,true)
				party_add(CHARACTER_PIERCE)
				teleport(CHARACTER_PIERCE, TRIGGER_CLUB_REAR_EXIT)
			end
		end

		-- TODO: check to see which ltnt is in the player's party
		if (Ep01_lieutenant_saved == CHARACTER_SHAUNDI) then
			Shaundi_saved = true
			on_dismiss("ep01_failure_shaundi_abandoned",CHARACTER_SHAUNDI)
			on_death("ep01_failure_shaundi_died",CHARACTER_SHAUNDI)
		end

		if (Ep01_lieutenant_saved == CHARACTER_PIERCE) then
			Pierce_saved = true
			on_dismiss("ep01_failure_pierce_abandoned",CHARACTER_PIERCE)
			on_death("ep01_failure_pierce_died",CHARACTER_PIERCE)
		end
		
	end -- ends (checkpoint == CHECKPOINT_LTNT_SAVED) or (Ep01_lieutenant_saved ~= "")

end

-- Stage 1 functions

function ep01_setup_masako_teams()

	for i, team_info in pairs(MASAKO_TEAM_INFO) do

		-- Start loading the Masako team
		group_create(team_info["group"], false)

		-- Setup the trigger(s)
		for i,trigger in pairs(team_info["triggers"]) do
			trigger_enable(trigger, true)
			on_trigger(team_info["callback"],trigger) 
		end

		-- Make sure they don't attack
		for i,masako in pairs(team_info["members"]) do
			npc_combat_enable(masako, false)
		end

	end

end

function ep01_masako_team_a_attack()
	ep01_masako_team_attack(1)
end

function ep01_masako_team_b_attack()
	ep01_masako_team_attack(2)

	-- Also unleash the Masako near the stairs
	for i, masako in pairs(MASAKO_STAIRS_UNLEASH) do
		if(not character_is_dead(masako)) then
			set_blitz_flag(masako,true)
			npc_leash_remove(masako)
		end
	end
	if(IN_COOP) then
		for i, masako in pairs(MASAKO_STAIRS_UNLEASH_COOP) do
			if(not character_is_dead(masako)) then
				set_blitz_flag(masako,true)
				npc_leash_remove(masako)
			end
		end
	end
end

function ep01_masako_team_attack(index)

	-- disable triggers
	for i,trigger in pairs(MASAKO_TEAM_INFO[index]["triggers"]) do
		trigger_enable(trigger, false)
		on_trigger("", trigger)
	end

	-- Make sure group is loaded before doing anything else
	if(group_is_loaded(MASAKO_TEAM_INFO[index]["group"])) then
		-- Open doors
		for i,door in pairs(MASAKO_TEAM_INFO[index]["doors"]) do
			door_open(door)
		end
		-- Have team members attack
		for i,member in pairs(MASAKO_TEAM_INFO[index]["members"]) do
			npc_combat_enable(member, true)
			set_blitz_flag(member,true)
			attack(member)
		end
	end
end

Player_outside_club =	{	[LOCAL_PLAYER]	= false,
									[REMOTE_PLAYER] = false}
function ep01_exit_club()

	ep01_setup_masako_teams();

	-- Tell player(s) to exit the club
	mission_help_table(HELPTEXT_PROMPT_EXIT_CLUB)

	-- Enable exit triggers, place exits on the map
	local function ep01_setup_club_trigger(trigger,callback,on_map)
		trigger_enable(trigger,true)
		if(on_map) then
			marker_add_trigger(trigger,MINIMAP_ICON_LOCATION,INGAME_EFFECT_LOCATION)
		end
		trigger_set_delay_between_activations(trigger,0)
		on_trigger(callback,trigger)
	end
	ep01_setup_club_trigger(TRIGGER_CLUB_FRONT_EXIT, "ep01_club_exited", true)
	ep01_setup_club_trigger(TRIGGER_CLUB_REAR_EXIT, "ep01_club_exited", true)
	if (IN_COOP) then
		ep01_setup_club_trigger(TRIGGER_CLUB_FRONT_ENTRANCE, "ep01_club_entered", false)
		ep01_setup_club_trigger(TRIGGER_CLUB_REAR_ENTRANCE, "ep01_club_entered", false)
	else
		Player_outside_club[REMOTE_PLAYER] = true
	end

	while (not (Player_outside_club[LOCAL_PLAYER] and Player_outside_club[REMOTE_PLAYER])) do
		thread_yield()
	end

	-- Disable triggers, make sure that map icons aren't displayed
	local function ep01_cleanup_club_trigger(trigger)
		marker_remove_trigger(trigger)
		on_trigger("",trigger)
		trigger_enable(trigger,false)
	end
	ep01_cleanup_club_trigger(TRIGGER_CLUB_FRONT_EXIT)
	ep01_cleanup_club_trigger(TRIGGER_CLUB_REAR_EXIT)
	if (IN_COOP) then
		ep01_cleanup_club_trigger(TRIGGER_CLUB_FRONT_ENTRANCE)
		ep01_cleanup_club_trigger(TRIGGER_CLUB_REAR_ENTRANCE)
	end

	-- Release the goons
	ep01_release_to_world_maybe_coop(GROUP_CLUB_ULTOR, GROUP_CLUB_ULTOR_COOP)

	-- Start the phone call thread
	thread_new("ep01_phone_call")

end

Ep01_call_received = false
function ep01_call_received()
	Ep01_call_received = true
end

function ep01_phone_call()	

	-- register the phone call
	mid_mission_phonecall("ep01_call_received")

	-- had a player begun a sequence?
	local function sequence_triggered()
		if( (Player_sequence_begun[LOCAL_PLAYER] ~= "") or (Player_sequence_begun[REMOTE_PLAYER] ~= "") ) then
			return true			
		end
	end

	while( (not Ep01_call_received) and (not sequence_triggered()) ) do
		thread_yield()
	end

	if (not sequence_triggered()) then

		local cell_conversation = 
		{
			{ "TSSE1_TROUBLE_L1", nil, 0 },
			{ "PLAYER_TSSE1_TROUBLE_L2", LOCAL_PLAYER, 0 },
			{ "TSSE1_TROUBLE_L3", nil, 0 },
			{ "PLAYER_TSSE1_TROUBLE_L4", LOCAL_PLAYER, 0 },
		}

		audio_play_conversation( cell_conversation, INCOMING_CALL)

		mission_help_table(HELPTEXT_PROMPT_CHECK_LIEUTENANTS)

	else
		mid_mission_phonecall_reset()
	end

	-- If no ltnt sequence has begun, then add markers
	if (Player_sequence_begun[LOCAL_PLAYER] == "") then
		marker_add_trigger(TRIGGER_SHAUNDI,MINIMAP_ICON_LOCATION,"", SYNC_LOCAL)
		marker_add_trigger(TRIGGER_PIERCE,MINIMAP_ICON_LOCATION,"", SYNC_LOCAL)
	end
	if ( IN_COOP and (Player_sequence_begun[LOCAL_PLAYER] == "") ) then
		marker_add_trigger(TRIGGER_SHAUNDI,MINIMAP_ICON_LOCATION,"", SYNC_REMOTE)
		marker_add_trigger(TRIGGER_PIERCE,MINIMAP_ICON_LOCATION,"", SYNC_REMOTE)
	end

	-- Display a waypoint when needed
	thread_new("ep01_waypoint_thread")

end


-- Player has exited the club. Turn map icons off.
function ep01_club_exited(triggerer, trigger)
	Player_outside_club[triggerer] = true
	marker_remove_trigger(TRIGGER_CLUB_FRONT_EXIT, PLAYER_SYNC[triggerer])
	marker_remove_trigger(TRIGGER_CLUB_REAR_EXIT, PLAYER_SYNC[triggerer])
end

-- Player has reentered the club. Turn exit icons back on. (For coop)
function ep01_club_entered(triggerer, trigger)
	Player_outside_club[triggerer] = false
	local sync_type = PLAYER_SYNC[triggerer]
	marker_add_trigger(TRIGGER_CLUB_FRONT_EXIT,MINIMAP_ICON_LOCATION,INGAME_EFFECT_LOCATION,sync_type)
	marker_add_trigger(TRIGGER_CLUB_REAR_EXIT,MINIMAP_ICON_LOCATION,INGAME_EFFECT_LOCATION,sync_type)
end

-- Stage 2 functions
function	ep01_prepare_ltnt_triggers(add_markers)

	local function prepare_trigger(ltnt_group, ultor_group, trigger, add_markers)
		-- Load ltnt
		group_create_hidden(ltnt_group)

		if (ultor_group ~= "") then
			group_create_hidden(ultor_group)
		end

		-- Setup the trigger for the save Shaundi portion of the mission
		trigger_enable(trigger,true)
		if (add_markers) then
			marker_add_trigger(trigger,MINIMAP_ICON_LOCATION,"")
		end
		on_trigger("ep01_enter_ltnt_trigger",trigger)

		if (LTNT_SETUP_FUNCTIONS[trigger] ~= nil) then
			thread_new(LTNT_SETUP_FUNCTIONS[trigger])
		end
	end

	-- If Shaundi hasn't already been saved, then setup her part of the mission
	if(not Shaundi_saved) then
		prepare_trigger(GROUP_SHAUNDI, GROUP_SHAUNDI_ULTOR, TRIGGER_SHAUNDI, add_markers)
	end

	-- If Pierce hasn't already been saved, then setup his part of the mission
	if(not Pierce_saved) then
		prepare_trigger(GROUP_PIERCE, GROUP_PIERCE_ULTOR, TRIGGER_PIERCE, add_markers)
	end

end

function ep01_waypoint_thread()

	local Player_waypoints =	{	[LOCAL_PLAYER]	= "",
											[REMOTE_PLAYER] = ""
										}

	local new_waypoints =	{	}

	-- Get the new waypoint for this player
	local function get_new_player_waypoint(player)

		-- If the save-shaundi sequence has already been started, then the waypoint for that 
		-- sequence becomes the knappers' van.
		local shaundi_waypoint = TRIGGER_SHAUNDI
		if (Player_sequence_begun[LOCAL_PLAYER] == TRIGGER_SHAUNDI or Player_sequence_begun[REMOTE_PLAYER] == TRIGGER_SHAUNDI) then
			shaundi_waypoint = VEHICLE_SHAUNDI_VAN
		end

		-- Player isn't in the middle of saving someone, see which waypoint they are closest to
		if (Player_sequence_begun[player] == "") then

			if(Shaundi_saved and Pierce_saved) then
				return
			elseif(Shaundi_saved) then
				-- Shaundi has been saved, send to Pierce
				new_waypoints[player] = TRIGGER_PIERCE
			elseif (Pierce_saved) then
				-- Pierce has been saved, send to Shaundi
				new_waypoints[player] = shaundi_waypoint
			else
				-- No ltnts. saved yet, send to closest one
				local dist_to_pierce = get_dist(player,TRIGGER_PIERCE)
				local dist_to_shaundi = get_dist(player,shaundi_waypoint)
				if (dist_to_pierce < dist_to_shaundi) then
					new_waypoints[player] = TRIGGER_PIERCE
				else
					new_waypoints[player] = shaundi_waypoint
				end
			end -- (Shaundi_saved)	
		-- Player is saving Shaundi
		elseif (Player_sequence_begun[player] == TRIGGER_SHAUNDI) then
			new_waypoints[player] = shaundi_waypoint
		-- Player is saving Pierce, no waypoint
		elseif (Player_sequence_begun[player] == TRIGGER_PIERCE) then
			new_waypoints[player] = ""
		end -- end if (Player_sequence_begun[player] == "")

	end -- end function get_player_waypoint

	-- Shaundi has some dialogue to say if she's in a vehicle w/ a player.
	-- we keep track of the distance and only play those lines at certain
	-- intervals
	local shaundi_dialogue_dist = -1
	local shaundi_dialogue_interval = -1

	while(true) do
		
		get_new_player_waypoint(LOCAL_PLAYER)
		if (IN_COOP) then
			get_new_player_waypoint(REMOTE_PLAYER)
		end

		for player, waypoint in pairs (new_waypoints) do
			-- If needed, change waypoint

			if(waypoint ~= Player_waypoints[player]) then
				-- Waypoint has changed, remove possible old waypoint and add new one

				if(Player_waypoints[player] ~= "") then
				-- Get rid of the old waypoint
					mission_waypoint_remove(PLAYER_SYNC[player])
				end
				if(waypoint ~= "") then
					mission_waypoint_add(waypoint,PLAYER_SYNC[player])
				end
				Player_waypoints[player] = waypoint
			end
		end
		
		-- Maybe play a dialogue line for Shaundi
		if(Shaundi_saved and not Pierce_saved) then

			-- Get the current distance from Shaundi to Pierce
			local cur_dist = get_dist(CHARACTER_SHAUNDI,CHARACTER_PIERCE)

			-- Initialize the stored distance if not yet done
			if(shaundi_dialogue_dist == -1) then
				shaundi_dialogue_dist = cur_dist
				shaundi_dialogue_interval = cur_dist / 2.5
			-- Otherwise, play dialogue if we've crossed a distance barrier and Shaundi is in a vehicle
			-- w/ one of the players
			else
				if(cur_dist < shaundi_dialogue_dist - shaundi_dialogue_interval) then
					shaundi_dialogue_dist = shaundi_dialogue_dist - shaundi_dialogue_interval

					-- Only play these lines if Shaundi is in a vehicle near a player that is driving a vehicle.
					if(character_is_in_vehicle(CHARACTER_SHAUNDI)) then
						local local_driving = (character_is_in_a_driver_seat(LOCAL_PLAYER))
						local remote_driving = (IN_COOP and character_is_in_a_driver_seat(REMOTE_PLAYER))
						local near_local = (get_dist(LOCAL_PLAYER, CHARACTER_SHAUNDI) < 5.0)
						local near_remote = (IN_COOP and (get_dist(LOCAL_PLAYER, CHARACTER_SHAUNDI) < 5.0))
						if ( (local_driving and near_local) or (remote_driving and near_remote)) then
							audio_play_for_character("TSSE01_SHAUNDI_DRIVING", CHARACTER_SHAUNDI, "voice", false, false)
						end
					end

				end
			end
		end

		thread_yield()

	end -- end while(true)
	
end

-- Sets police notoriety to 0 when either of the player is working on saving a LTNT, 0 the rest of the time
function ep01_notoriety_thread()

	notoriety_reset("Police")

	local saved_notoriety_level = ep01_get_parameter_value("MIN_POLICE_NOTORIETY")
	local police_notoriety_active = true

	while (true) do
	
		-- Determine if either player is working on one of the ltnt-saving sequences
		local sequence_begun = ( Player_sequence_begun[LOCAL_PLAYER] ~= "" or Player_sequence_begun[REMOTE_PLAYER] ~= "")

		-- If a sequence has been started since the last check, save current notoriety before setting it to 0
		if (police_notoriety_active and sequence_begun) then
			saved_notoriety_level = notoriety_get_decimal("Police")
			notoriety_set_min("Police", 0)
			notoriety_set("Police", 0)
			notoriety_set_max("Police", 0)

			police_notoriety_active = false
		end

		-- If the players were in a save sequence and aren't any more, restore the police notoriety
		if ((not sequence_begun) and (not police_notoriety_active)) then
			notoriety_reset("Police")
			notoriety_set_min("Police", ep01_get_parameter_value("MIN_POLICE_NOTORIETY"))
			notoriety_set("Police", saved_notoriety_level)

			police_notoriety_active = true
		end

		thread_yield()

	end

end

-- Player has gotten near one of the ltnts, start the save-that-ltnt subsequence.
function ep01_enter_ltnt_trigger(triggerer, trigger)

	-- Player already started a sequence

	-- TODO:
	-- what happens if player 1 has already started another sequence, and triggers this 
	-- sequence while player 2 is still far off? If we don't spawn the sequence npcs,
	-- then player 1 will see them pop-in when player 2 reaches the area. grrr.

	-- has the sequence already begun?
	local sequence_begun = ((Player_sequence_begun[LOCAL_PLAYER] == trigger) or
									(Player_sequence_begun[REMOTE_PLAYER] == trigger))

	-- This player is already working on a sequence, return
	if (	Player_sequence_begun[triggerer] ~= "") then
		return
	end

	-- This function adds a player to this save-the-ltnt sequence. 
	local function player_begin_sequence(player)
		local sync_type = PLAYER_SYNC[player]

		-- Remove ltnt sequence start markers
		marker_remove_trigger(TRIGGER_PIERCE,sync_type)
		marker_remove_trigger(TRIGGER_SHAUNDI,sync_type)

		-- Either start the seqence or add the player to the sequence
		if (not sequence_begun) then

			-- Record that the player has begun this mission
			Player_sequence_begun[player] = trigger

			sequence_begun = true
			thread_new(LTNT_TRIGGER_FUNCTIONS[trigger], player, trigger)	

			-- Display the mission sequence helptext
			if (LTNT_TRIGGER_MESSAGE[trigger] ~= "") then
				mission_help_table(LTNT_TRIGGER_MESSAGE[trigger], "", "", sync_type)
			end

		else
			if (LTNT_TRIGGER_JOIN_FUNCTIONS[trigger] ~= "") then

				-- Record that the player has begun this mission
				Player_sequence_begun[player] = trigger

				thread_new(LTNT_TRIGGER_JOIN_FUNCTIONS[trigger], player)
			end
		end
	end

	player_begin_sequence(triggerer)

	-- If in COOP, other player joins the sequence as well if they are close enough
	if (IN_COOP) then

		delay(2)

		local other_player = OTHER_PLAYER[triggerer]

		if (Player_sequence_begun[other_player] == "") then

			local dist = get_dist(other_player,trigger)
			if(dist < 300) then
				if (LTNT_TRIGGER_JOIN_FUNCTIONS[trigger] ~= "") then
					player_begin_sequence(other_player)
				end

			end

		end
	end
end

-- Stage 2: save Shaundi threads

function ep01_setup_shaundi()

	-- Make sure that Shaundi isn't killed
	turn_invulnerable(CHARACTER_SHAUNDI,false)

	-- Make Shaundi a Civilian for now so that the Ultor don't attack her
	set_team(CHARACTER_SHAUNDI, "Civilian")

	-- Place Shaundi and the ultor in the van:
	vehicle_enter_teleport(CHARACTER_SHAUNDI_ULTOR_DRIVER,VEHICLE_SHAUNDI_VAN,0)
	vehicle_enter_teleport(CHARACTER_SHAUNDI_ULTOR_SHOTGUN,VEHICLE_SHAUNDI_VAN,1)
	vehicle_enter_teleport(CHARACTER_SHAUNDI,VEHICLE_SHAUNDI_VAN,2)

	-- Set max hit points for the van, its driver, and the guy riding shotgun
	set_max_hit_points(CHARACTER_SHAUNDI_ULTOR_DRIVER, ep01_get_parameter_value("VAN_DRIVER_HIT_POINTS"))
	set_max_hit_points(CHARACTER_SHAUNDI_ULTOR_SHOTGUN, ep01_get_parameter_value("VAN_SHOTGUN_HIT_POINTS"))
	set_max_hit_points(VEHICLE_SHAUNDI_VAN, ep01_get_parameter_value("VAN_HIT_POINTS"))

	-- Set a few flags on the van.
	vehicle_prevent_explosion_fling(VEHICLE_SHAUNDI_VAN,true)
	vehicle_set_allow_ram_ped(VEHICLE_SHAUNDI_VAN,true)
	vehicle_infinite_mass(VEHICLE_SHAUNDI_VAN, true)
	vehicle_suppress_npc_exit(VEHICLE_SHAUNDI_VAN, true)

	-- Put passenger into escort vehicles, setup callbacks
	for escort,passengers in pairs(SHAUNDI_VAN_ESCORT) do
		Num_escorts = Num_escorts + 1
		Shaundi_escort_disabled[escort] = false

		vehicle_suppress_npc_exit(escort, true)
		vehicle_set_allow_ram_ped(escort,true)
		vehicle_set_crazy(escort,true)
		vehicle_set_use_short_cuts(escort,true)
		vehicle_max_speed(escort, ep01_get_parameter_value("VAN_MAX_SPEED_DAMAGED")+10)

		on_vehicle_destroyed("ep01_escort_vehicle_disabled",escort)
		on_death("ep01_escort_driver_killed",passengers[1])

		for i,passenger in pairs(passengers) do
			vehicle_enter_teleport(passenger, escort, i-1)
			npc_combat_enable(passenger,true)
		end
		Shaundi_escort_driver[passengers[1]] = escort
	end

	-- If Shaundi dies, player loses the mission.
	on_death("ep01_failure_shaundi_died", CHARACTER_SHAUNDI)

end

function ep01_save_shaundi(triggerer, trigger)

	group_show(GROUP_SHAUNDI)
	group_show(GROUP_SHAUNDI_ULTOR)

	-- Players have to disable the Van before the Ultor kill Shaundi and dump her body
	-- Start a thread that will add the other player to this sequence when they get close enough
	if (IN_COOP) then
		thread_new("ep01_join_shaundi_monitor", OTHER_PLAYER[triggerer])
	end
	ep01_process_van_chase(triggerer)

	-- If Shaundi wasn't saved, ep01_process_van_chase will call a mission failure function
	-- and there is nothing to do in this function.

	if (Shaundi_saved) then
		-- Shaundi was saved

		if (not Pierce_saved) then

			-- Add Shaundi to the party
			party_add(CHARACTER_SHAUNDI)

			on_dismiss("ep01_failure_shaundi_abandoned",CHARACTER_SHAUNDI)
			on_death("ep01_failure_shaundi_died", CHARACTER_SHAUNDI)

			ep01_override_shaundi_persona()

			-- We have two conversations that seem to make sense, select one at random
			if(rand_float(0.0,1.0) < 0.5) then
				audio_play_for_character("TSSE01_SHAUNDI_RESCUED_1", CHARACTER_SHAUNDI, "voice", false, true)
				audio_play_for_character("TSSE01_SHAUNDI_FINDPIERCE_1", CHARACTER_SHAUNDI, "voice", false, false)
			else
				audio_play_for_character("TSSE1_SHAUNDI_FIRST_L1", CHARACTER_SHAUNDI, "voice", false, true)
				audio_play_for_character("TSSE1_SHAUNDI_FIRST_L2", CHARACTER_SHAUNDI, "voice", false, false)
			end

			-- Add marker for Pierce
			marker_add_trigger(TRIGGER_PIERCE,MINIMAP_ICON_LOCATION,"")

			-- Checkpoint here in single player. In COOP, just record that Sahundi was saved.
			if (not IN_COOP) then
				mission_set_checkpoint(CHECKPOINT_LTNT_SAVED)
			end
			Ep01_lieutenant_saved = CHARACTER_SHAUNDI

			local sync = ep01_get_sequence_sync(TRIGGER_SHAUNDI)
			mission_help_table(HELPTEXT_PROMPT_CHECK_PIERCE, "", "", sync)

		-- Else Pierce and Shaundi both saved., Shaundi thanks the pc(s)
		else
			audio_play_for_character("TSSE01_SHAUNDI_RESCUED_1", CHARACTER_SHAUNDI, "voice", false, true)
		end

		-- Disable Shaundi's trigger
		on_trigger("", TRIGGER_SHAUNDI)
		trigger_enable(TRIGGER_SHAUNDI, false)

		-- Nobody is working on this sequence any more
		for player, ltnt_sequence in pairs(Player_sequence_begun) do
			if (Player_sequence_begun[player] == trigger) then
				Player_sequence_begun[player] = ""
			end
		end

		marker_remove_trigger(trigger, SYNC_ALL)

		turn_vulnerable(CHARACTER_SHAUNDI)

	end
end

function ep01_join_shaundi(player)

	-- Add UI elements - van health bar and van kill markers
	if ( not Shaundi_van_disabled and not(vehicle_is_destroyed(VEHICLE_SHAUNDI_VAN)) ) then

		local sync = PLAYER_SYNC[player]
		local hud_bar = HUD_BAR[player]

		marker_remove_trigger(TRIGGER_PIERCE,sync)
		marker_remove_trigger(TRIGGER_SHAUNDI,sync)

		-- TODO: tell the player what they are supposed to be doing
		mission_help_table(HELPTEXT_PROMPT_SAVE_SHAUNDI, "", "", sync)

		marker_add_vehicle(VEHICLE_SHAUNDI_VAN,MINIMAP_ICON_KILL,INGAME_EFFECT_VEHICLE_KILL,sync)
		local van_disabled_health_percent = ep01_get_parameter_value("VAN_DISABLED_PERCENT_HEALTH")
		local van_max_hit_points = ep01_get_parameter_value("VAN_HIT_POINTS")
		hud_bar_on(hud_bar, "Health", HELPTEXT_HUD_VAN_HEALTH, van_max_hit_points, sync )
		hud_bar_set_range(hud_bar, van_disabled_health_percent * van_max_hit_points, van_max_hit_points, SYNC_ALL)
		hud_bar_set_value(hud_bar, get_current_hit_points(VEHICLE_SHAUNDI_VAN), sync)
					
	end
end

-- Track a player's distance from the Shaundi-knappers van. When the player
-- gets close enough, have them join the save-Shaundi sequence.
function ep01_join_shaundi_monitor(player) 

	-- Delay a little bit, we want to make sure that the triggering player doesn't join the sequence after
	-- the other player.
	delay(2)

	local sequence_joined = false

	local sync = PLAYER_SYNC[player]
	-- Place a location marker on the vehicle until the player is told to destroy it
	marker_remove_trigger(TRIGGER_SHAUNDI,sync)
	marker_add_vehicle(VEHICLE_SHAUNDI_VAN,MINIMAP_ICON_LOCATION,"",sync)

	while ( (not Shaundi_saved) and (not sequence_joined)) do

		-- If the player isn't already saving a ltnt., see if they are close enough
		-- to the van to join in on the save-Shaundi sequence.
		if ( (Player_sequence_begun[player] == "") and (Player_sequence_begun[OTHER_PLAYER[player]] == TRIGGER_SHAUNDI)) then

			local dist = get_dist(player,VEHICLE_SHAUNDI_VAN)
			if(dist < 250) then
				sequence_joined = true
				Player_sequence_begun[player] = TRIGGER_SHAUNDI
				-- Remove the "location" icon from the van, the join function will add the kill icon
				marker_remove_vehicle(VEHICLE_SHAUNDI_VAN, sync)
				ep01_join_shaundi(player)
			end

		end

		thread_yield()

	end

end

-- Stop the van (but don't destroy it) before the Ultor reach the beach where they will Execute Shaundi
-- and dump her body.
function ep01_process_van_chase(triggerer)

	-- Turn on the health bar hud for the player that triggered the sequence.
	local sync = PLAYER_SYNC[triggerer]
	local hud_bar = HUD_BAR[triggerer]
	local van_disabled_health_percent = ep01_get_parameter_value("VAN_DISABLED_PERCENT_HEALTH")
	local van_hit_points = ep01_get_parameter_value("VAN_HIT_POINTS")

	hud_bar_on(hud_bar, "Health", HELPTEXT_HUD_VAN_HEALTH, van_hit_points, sync)
	hud_bar_set_range(hud_bar, van_disabled_health_percent * van_hit_points, van_hit_points, SYNC_ALL)
	hud_bar_set_value(hud_bar, van_hit_points, sync)

	-- Setup the van.
	marker_add_vehicle(VEHICLE_SHAUNDI_VAN,MINIMAP_ICON_KILL,INGAME_EFFECT_VEHICLE_KILL,sync)
	vehicle_suppress_npc_exit(VEHICLE_SHAUNDI_VAN, true)
	on_death("ep01_van_disabled", CHARACTER_SHAUNDI_ULTOR_DRIVER)
	on_take_damage("ep01_van_damaged",VEHICLE_SHAUNDI_VAN)
	on_vehicle_destroyed("ep01_failure_shaundi_died", VEHICLE_SHAUNDI_VAN)

	-- Start up the thread for handling the escort vehicles
	for escort,passengers in pairs(SHAUNDI_VAN_ESCORT) do
		vehicle_chase(escort, CHARACTER_SHAUNDI_ULTOR_DRIVER, false, false, true)	
	end
	local escort_thread = thread_new("ep01_process_escort_2")
	set_cops_shooting_from_vehicles(true)

	-- Have shaundi complain about being taken prisoner
	audio_play_for_character("TSSE01_SHAUNDI_CAPTURED_1", CHARACTER_SHAUNDI, "voice", false, true)

	-- Keep the van's speed up-to-date
	local van_speed_thread = thread_new("ep01_van_speed")

	-- The van follows traffic splines until it nears the beach
	vehicle_turret_base_to(VEHICLE_SHAUNDI_VAN, SHAUNDI_VAN_TURRET_PATH, false)

	if (not (Shaundi_van_disabled or vehicle_is_destroyed(VEHICLE_SHAUNDI_VAN))) then
		-- Then it tries to navmesh pathfind to the dump site
		vehicle_pathfind_to(VEHICLE_SHAUNDI_VAN, SHAUNDI_VAN_NAVMESH_PATH, true, false)
	end

	thread_kill(escort_thread)
	thread_kill(van_speed_thread)

	-- Make Shaundi a Playa once again
	set_team(CHARACTER_SHAUNDI, "Playas")


	-- Vehicle pathfinding may have ended because... 
	-- a) The vehicle reached its destination OR
	-- b) The vehicle was destroyed OR
	-- c) The vehicle's driver was killed OR
	-- d) THe vehicle's health dropped below a specified threshold

	-- if the van arrives at the beach, then Shaundi is shot, her body dumped, and the mission is lost.
	if (not Shaundi_van_disabled and not(vehicle_is_destroyed(VEHICLE_SHAUNDI_VAN))) then

		-- Get rid of the old callbacks
		on_death("", CHARACTER_SHAUNDI_ULTOR_DRIVER)
		on_take_damage("",VEHICLE_SHAUNDI_VAN)
		on_vehicle_destroyed("", VEHICLE_SHAUNDI_VAN)

		-- Make sure that the player can't kill the driver or destroy the van during this sequence
		turn_invulnerable(CHARACTER_SHAUNDI_ULTOR_DRIVER,false)
		turn_invulnerable(VEHICLE_SHAUNDI_VAN,false)

		-- Play a couple of gun shots
		audio_play("MAGNUM_FIRE_NPC")
		delay(0.4)
		audio_play("MAGNUM_FIRE_NPC")

		-- Kick Shaundi out, ragdoll her as though she is dead
		vehicle_exit_dive(CHARACTER_SHAUNDI)
		character_ragdoll(CHARACTER_SHAUNDI)
		set_ignore_ai_flag(CHARACTER_SHAUNDI, true)
		vehicle_speed_override(VEHICLE_SHAUNDI_VAN, 80)

		-- The van begins to flee
		local dist,player = get_dist_closest_player_to_object(VEHICLE_SHAUNDI_VAN)
		vehicle_flee(VEHICLE_SHAUNDI_VAN,player)

		-- Let the player see Shaundi fall from the van.
		vehicle_speed_cancel(VEHICLE_SHAUNDI_VAN)
		delay(5.0)

		-- You lose!
		ep01_failure_shaundi_died()

		Shaundi_saved =  false

	elseif(Shaundi_van_disabled) then
		-- Players must have saved Shaundi, remove map crap
		-- TODO: only remove for appropriate player in coop

		-- Get rid of the old callbacks
		on_death("", CHARACTER_SHAUNDI_ULTOR_DRIVER)
		on_take_damage("",VEHICLE_SHAUNDI_VAN)
		on_vehicle_destroyed("", VEHICLE_SHAUNDI_VAN)

		delay(1.0)

		local sync = ep01_get_sequence_sync(TRIGGER_SHAUNDI)
		if ( (sync == SYNC_LOCAL) or (sync == SYNC_ALL) ) then
			hud_bar_off(HUD_BAR[LOCAL_PLAYER])
		end
		if ( (sync == SYNC_REMOTE) or (sync == SYNC_ALL) ) then
			hud_bar_off(HUD_BAR[REMOTE_PLAYER])
		end

		marker_remove_vehicle(VEHICLE_SHAUNDI_VAN)

		-- Ultor can exit the van now.
		vehicle_suppress_npc_exit(VEHICLE_SHAUNDI_VAN, false)

		local van_speed = get_vehicle_speed(VEHICLE_SHAUNDI_VAN)
		while(van_speed > 1.0) do
			van_speed = get_vehicle_speed(VEHICLE_SHAUNDI_VAN)
			thread_yield()
		end
	
		vehicle_exit(CHARACTER_SHAUNDI)

		Shaundi_saved = true
	end

end

-- Continuously adjusts the kidnappers' van's speed.
--
-- A base speed is determined based on whether the van has been damaged yet or not.
-- If the players are too far from the van, then adjust the base speed downward so they can catch up.
-- At first we only adjust max speed. After the van is damaged we start overriding the speed as well...
-- this makes it act a bit more reckless. We can't just throw it in chase mode as it needs to follow a path.
function ep01_van_speed()

	local speed_initial = ep01_get_parameter_value("VAN_MAX_SPEED_INITIAL")
	local speed_damaged = ep01_get_parameter_value("VAN_MAX_SPEED_DAMAGED")
	local range_ratio   = ep01_get_parameter_value("VAN_OUT_OF_RANGE_SPEED_RATIO")
	local range_dist_m  = ep01_get_parameter_value("VAN_OUT_OF_RANGE_DIST_M")

	local overriding_speed = false	-- Have we started overriding the van's speed yet?
	local current_speed = 0				-- The speed that we've set for the van, probably not the speed at which it is moving.

	while( not (Shaundi_van_disabled or vehicle_is_destroyed(VEHICLE_SHAUNDI_VAN)) ) do

		-- Get the base speed for the van
		local base_speed = speed_initial
		if(Shaundi_van_damaged) then
			base_speed = speed_damaged
		end
		local new_speed = base_speed

		-- Modify the speed if the players are too far from the van
		local dist,player = get_dist_closest_player_to_object(VEHICLE_SHAUNDI_VAN)
		if (dist > range_dist_m) then
			new_speed = new_speed * range_ratio
		end

		-- Update the van's max speed if it has changed.
		local speed_changed = (new_speed ~= current_speed)
		if (speed_changed) then
			vehicle_max_speed(VEHICLE_SHAUNDI_VAN, new_speed)
			current_speed = new_speed
		end
		
		-- Override the vehicle's speed if
		-- 1) (speed changed and van has been damaged) AND/OR
		-- 2) van was just damaged - we need to make sure that the speed is overriden even if the
		-- new speed hasn't changed.
		local start_override = (Shaundi_van_damaged ~= overriding_speed)
		if ( (speed_changed and Shaundi_van_damaged) or start_override ) then
			vehicle_speed_override(VEHICLE_SHAUNDI_VAN, new_speed)			
			overriding_speed = true			
		end

		thread_yield()
	end

	-- After vehicle is destroyed, set its speed to 0 and exit.
	if ( not vehicle_is_destroyed(VEHICLE_SHAUNDI_VAN) ) then
		vehicle_speed_override(VEHICLE_SHAUNDI_VAN, 0)
		vehicle_stop(VEHICLE_SHAUNDI_VAN,true)
	end
end

function ep01_van_disabled()
	Shaundi_van_disabled = true;
end

-- Escort vehicles follow the Shaundi-knappers until a player approaches too close.
-- At this point, one of the vans will start chasing the player and not stop.
function ep01_process_escort_2()

	local attack_dist = 50
	local total_num_escorts = Num_escorts
	local escort_targets = {}		-- maps from escort -> player the escort is targeting
	local player_attackers = {}	-- maps from player -> the escort currently attacking the player

	-- Make sure that at escort is attacking the player
	local function escort_attack(player)

		-- See which escort is currently attacking the player
		local current_attacker = player_attackers[player]

		-- Is a new attacker neeeded?
		local need_attacker = false

		if( current_attacker == nil) then
			-- No one is attacking this player yet
			need_attacker = true	
		elseif (Shaundi_escort_disabled[current_attacker]) then
			-- The player's previous attacker was disabled
			need_attacker = true
		end

		if (need_attacker) then
			-- Find a new escort to attack the player
			local closest = 0
			local new_attacker = ""
			for escort,disabled in pairs(Shaundi_escort_disabled) do

				if (	(not disabled) and 
						(player_attackers[OTHER_PLAYER[player]] ~= escort) ) then
					-- This escort is not disabled or attacking anyone

					local dist = get_dist(escort,player)

					if( (new_attacker == "") or (dist < closest)) then
						-- This escort is the best one we've found so far.
						new_attacker = escort
						closest = dist
					end							
				end
			end

			if ((new_attacker ~= "") and (closest < attack_dist)) then
				-- We found a new escort to attack the player

				player_attackers[player] = new_attacker
				-- Stop chasing the knapper mobile and start chasing the player
				vehicle_chase(new_attacker, player, false, true, true)
			end

		end
	end

	while(Num_escorts > 0) do

		-- For each player in range, have an escort attack them
		local local_dist = get_dist(LOCAL_PLAYER,VEHICLE_SHAUNDI_VAN)
		if(local_dist < attack_dist) then
			escort_attack(LOCAL_PLAYER)
		end

		if(IN_COOP) then
			local remote_dist = get_dist(REMOTE_PLAYER,VEHICLE_SHAUNDI_VAN)
			if(remote_dist < attack_dist) then
				escort_attack(REMOTE_PLAYER)
			end
		end

		thread_yield()

	end

end

function ep01_escort_driver_killed(driver)
	ep01_escort_vehicle_disabled(Shaundi_escort_driver[driver])
end

function ep01_escort_vehicle_disabled(vehicle)
	Num_escorts = Num_escorts - 1
	Shaundi_escort_disabled[vehicle] = true
end

-- Called when the Shaundinapping van is damaged.
-- damage_percent is the van's health fraction on (0,1) after the attack
function ep01_van_damaged(van, attacker, damage_percent)

	-- Once the van has taken damage for the first time, the driver goes into crazy
	-- driver mode. They enjoy running over peds and are just all around
	-- bad drivers with no respect for your lawn.
	if (not Shaundi_van_damaged) then
		vehicle_set_allow_ram_ped(VEHICLE_SHAUNDI_VAN,true)
		vehicle_set_crazy(VEHICLE_SHAUNDI_VAN,true)
		vehicle_set_use_short_cuts(VEHICLE_SHAUNDI_VAN,true)
		vehicle_set_torque_multiplier(VEHICLE_SHAUNDI_VAN, ep01_get_parameter_value("VAN_TORQUE_MODIFIER"))
		Shaundi_van_damaged = true
	end

	if (damage_percent <= 0) then
		-- van has been destroyed with Shaundi still inside ... failure!
		ep01_failure_shaundi_died()
	else
		
		-- Update the health bar:
		local van_max_hit_points = ep01_get_parameter_value("VAN_HIT_POINTS")
		local van_disabled_health_percent = ep01_get_parameter_value("VAN_DISABLED_PERCENT_HEALTH")
		local van_hit_points = ep01_get_parameter_value("VAN_HIT_POINTS")		

		local van_cur_hit_points = van_max_hit_points * damage_percent		
		local van_min_hit_points = van_disabled_health_percent * van_hit_points

		if (van_cur_hit_points <= van_min_hit_points) then
			van_cur_hit_points = van_min_hit_points + 1
		end

		local sync = ep01_get_sequence_sync(TRIGGER_SHAUNDI)
		if ( (sync == SYNC_LOCAL) or (sync == SYNC_ALL) ) then
			hud_bar_set_value(HUD_BAR[LOCAL_PLAYER],van_cur_hit_points, SYNC_LOCAL)
		end
		if ( (sync == SYNC_REMOTE) or (sync == SYNC_ALL) ) then
			hud_bar_set_value(HUD_BAR[REMOTE_PLAYER],van_cur_hit_points, SYNC_REMOTE)
		end		

		if (damage_percent <= van_disabled_health_percent) then
			ep01_van_disabled()
		end

	end
end

-- Setup Shaundi's persona overrides
function ep01_override_shaundi_persona()
	persona_override_character_start(CHARACTER_SHAUNDI, POT_SITUATIONS[POT_ATTACK], "TSSE01_SHAUNDI_ATTACK")
	persona_override_character_start(CHARACTER_SHAUNDI, POT_SITUATIONS[POT_PRAISED_BY_PC], "TSSE01_SHAUNDI_PRAISED")
	persona_override_character_start(CHARACTER_SHAUNDI, POT_SITUATIONS[POT_TAUNTED_BY_PC], "TSSE01_SHAUNDI_TAUNT")
end

-- Stage 2, "Save Pierce" functions
function ep01_save_pierce(triggerer, trigger)

	-- Start checking for players driving vehicles into Pierce's cutscene area.
	on_trigger("ep01_player_entered_pierce_cutscene_area",TRIGGER_PIERCE_CUTSCENE_AREA) 
	trigger_enable(TRIGGER_PIERCE_CUTSCENE_AREA, true)

	--group_show(GROUP_PIERCE)
	group_show(GROUP_PIERCE_ULTOR)

	-- When not in coop, we can also disallow ped spawning
	if (not IN_COOP) then
		spawning_pedestrians(false, false)
	end

	-- Have existing peds flee
	city_chunk_set_all_civilians_fleeing("sr2_chunk104", true)
	city_chunk_set_all_civilians_fleeing("sr2_chunk105", true)

	-- Display Pierce's health trickling away
	Thread_pierce_health = thread_new("ep01_display_pierce_health")

	-- Wait for the player(s) to kill off the Ultor goons
	for i,goon in pairs(MEMBERS_GROUP_PIERCE_ULTOR) do
		attack(goon)
	end

	vehicle_set_sirens("ep01_$v016",true)
	vehicle_set_sirenlights("ep01_$v016",true)
	vehicle_set_sirens("ep01_$v017",true)
	vehicle_set_sirenlights("ep01_$v017",true)

	ep01_process_enemy_set(	MEMBERS_GROUP_PIERCE_ULTOR, 
									HELPTEXT_PROMPT_KILL_ULTOR,
									HELPTEXT_OBJECTIVE_ULTOR, 
									PLAYER_SYNC[triggerer])

	-- Stop displaying Pierce's health
	thread_kill(Thread_pierce_health)

	-- Pierce has been saved!
	Pierce_saved = true;

	-- Stop displaying Pierce's health
	local sync = ep01_get_sequence_sync(TRIGGER_PIERCE)
	if ( (sync == SYNC_LOCAL) or (sync == SYNC_ALL) ) then
		hud_bar_off(HUD_BAR[LOCAL_PLAYER])
	end
	if ( (sync == SYNC_REMOTE) or (sync == SYNC_ALL) ) then
		hud_bar_off(HUD_BAR[REMOTE_PLAYER])
	end

	-- Reallow ped spawning
	spawning_pedestrians(true)

	-- Stop having existing peds flee
	city_chunk_set_all_civilians_fleeing("sr2_chunk104", false)
	city_chunk_set_all_civilians_fleeing("sr2_chunk105", false)

	-- No point in adding Pierce to the party if the mission is complete
	if(not Shaundi_saved) then

		-- Fade out of the game
		local fade_out_dist = 100
		local fade_local = ((not IN_COOP) or (get_dist(CHARACTER_PIERCE, LOCAL_PLAYER) < fade_out_dist) )
		local fade_remote = (IN_COOP and (get_dist(CHARACTER_PIERCE, LOCAL_PLAYER) < fade_out_dist))
		if(fade_local) then
			fade_out(1.0,{0,0,0}, SYNC_LOCAL)
		end
		if(fade_remote) then
			fade_out(1.0,{0,0,0}, SYNC_REMOTE)
		end
		delay(1)

		-- Determine if we should play the cutscene
		local play_cutscene = true
		if (Pierce_cutscene_area_blocked) then
			-- Don't play the cutscene if the area is blocked.
			play_cutscene = false
		end
		if ( IN_COOP and (not (fade_local and fade_remote)) ) then
			-- Don't play the cutscene in Coop unless all players are being faded out. (No way to play for just one person)
			play_cutscene = false
		end

		-- Maybe play the cutscene
		if (play_cutscene) then
			cutscene_play("IG_ep01_scene1", "", "", false)
			group_destroy(GROUP_CTE)
		end

		-- Add pierce to the closest player's party.
		character_show(CHARACTER_PIERCE)
		party_add(CHARACTER_PIERCE)
		on_dismiss("ep01_failure_pierce_abandoned",CHARACTER_PIERCE)
		on_death("ep01_failure_pierce_died", CHARACTER_PIERCE)

		-- Reset Pierce's health to full
		set_current_hit_points(CHARACTER_PIERCE, ep01_get_parameter_value("PIERCE_MAX_HIT_POINTS"))

		if(fade_local) then
			fade_in(1.0, SYNC_LOCAL)
		end
		if(fade_remote) then
			fade_in(1.0, SYNC_REMOTE)
		end

		delay(1)
		clear_animation_state(CHARACTER_PIERCE)

		-- Add marker for Shaundi
		marker_add_trigger(TRIGGER_SHAUNDI,MINIMAP_ICON_LOCATION,"")

		-- Checkpoint here in single player. In COOP, just record that Pierce was saved.
		if (not IN_COOP) then
			mission_set_checkpoint(CHECKPOINT_LTNT_SAVED)
		end	
		Ep01_lieutenant_saved = CHARACTER_PIERCE

		local sync = ep01_get_sequence_sync(TRIGGER_PIERCE)
		mission_help_table(HELPTEXT_PROMPT_CHECK_SHAUNDI, "", "", sync)

		audio_play_for_character("TSSE1_PIERCE_FIRST_L1", CHARACTER_PIERCE, "voice", false, true)
		audio_play_for_character("TSSE1_PIERCE_FIRST_L2", LOCAL_PLAYER, "voice", false, false)		

	else
		if(get_dist(CHARACTER_SHAUNDI, CHARACTER_PIERCE) < 10) then
			audio_play_for_character("TSSE01_SHAUNDI_SEESPIERCE_1", CHARACTER_SHAUNDI, "voice", false, false)
		end
	end

	-- Nobody is working on this sequence any more
	trigger_enable(trigger,false)
	on_trigger("",trigger)
	for player, ltnt_sequence in pairs(Player_sequence_begun) do
		if (Player_sequence_begun[player] == trigger) then
			Player_sequence_begun[player] = ""
		end
	end

	marker_remove_trigger(trigger, SYNC_ALL)

end

-- A second player is joining the save-Pierce sequence.
function ep01_join_pierce(triggerer)
	-- Setup HUD:
		local sync = PLAYER_SYNC[triggerer]

		-- Objective display handled by ep01_process_enemy_set
		objective_text(0, ep01_enemy_set_objective_helptext, ep01_enemies_to_kill - ep01_enemies_living, ep01_enemies_to_kill, sync)

		-- Add markers to living goons
		for i,goon in pairs(MEMBERS_GROUP_PIERCE_ULTOR) do
			if	(not character_is_dead(goon)) then
				marker_add_npc(goon, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, PLAYER_SYNC[triggerer]) 
			end
		end

		-- Place Pierce's health on the hud.
		local pierce_max_hit_points = ep01_get_parameter_value("PIERCE_MAX_HIT_POINTS")
		local hud_bar = HUD_BAR[triggerer]
		hud_bar_on(hud_bar, "Health", HELPTEXT_HUD_PIERCE_HEALTH, pierce_max_hit_points, sync)
		local hit_points = Ep01_pierce_current_health
		if (hit_points == -1) then
			hit_points = pierce_max_hit_points * ep01_get_parameter_value("PIERCE_PERCENT_HEALTH")
		end
		hud_bar_set_value(hud_bar, hit_points, sync )

	-- Tell the player what to do
	mission_help_table(HELPTEXT_PROMPT_KILL_ULTOR)
end

-- This function is called when a player enters the area where Pierce's cutscene will take place. If they're
-- driving a vehicle, it may be blocking Pierce's path so don't play the cutscene.
function ep01_player_entered_pierce_cutscene_area(triggerer, trigger)
	if (character_is_in_vehicle(triggerer)) then
		Pierce_cutscene_area_blocked = true
		on_trigger("", trigger)
		trigger_enable(trigger, false)
	end
end

-- The goon wanders around and occasionally takes a shot at Pierce
function ep01_pierce_ultor_patrol(goon)

	local next_action_cumulative_chances = {
		["wander"]			= 0.3,	-- Goon wanders around a bit
		["attack player"]	= 0.55,	-- Goon attacks the player
		["taunt"]			= 0.80,	-- Goon taunts Pierce; says something or makes a rude gesture.
		["attackpierce"]	= 1.0,	-- Goon attacks Pierce 
	}

	local taunt_actions = {	"talk yell", "Insult A", "Insult B"}

	while(1) do
		local roll = rand_float(0.0,1.0)
		local attack_player_range = 50.0

		local dist,player = get_dist_closest_player_to_object(goon)

		-- Goon might wander around a bit as long as the player isn't too close
		if (	(roll < next_action_cumulative_chances["wander"]) and
				(dist >= attack_player_range)
			) then
			-- Goon wanders around a bit

			-- Looks odd because I use the goon's starting navpoint, which has the same
			-- name as the goon itself.
			wander_start(goon,goon,rand_float(6,12))
			delay(rand_float(4,8))
			wander_stop(goon)
		elseif (roll < next_action_cumulative_chances["attack player"]) then
			-- Have the npc attack the player as long as the player is close to the
			-- goon. If the player gets too far away, then go back
			-- and attack Pierce before getting back into the normal routine.
			if (dist < attack_player_range) then
				while (dist < attack_player_range) do
					npc_combat_enable(goon,true)
					attack(goon,player)
					delay(rand_int(10,15))
					dist,player = get_dist_closest_player_to_object(goon)
				end
				-- Start moving back to original spot... can still attack 
				move_to(goon,goon,2,false, false)
				-- Attack Pierce once
				force_fire(goon, NAVPOINT_PIERCE_LOCATION, true)
				--ep01_pierce_maybe_damaged()

				-- Remove from combat, go back into the normal loop
				npc_combat_enable(goon,false)
			end

		elseif (roll < next_action_cumulative_chances["taunt"]) then
			-- Goon engages in rudeness

			-- Put up weapon so taunt doesn't look dumb
			npc_holster(goon)
			turn_to(goon, NAVPOINT_PIERCE_LOCATION, false)
			local insult = taunt_actions[rand_int(1,sizeof_table(taunt_actions))]
			action_play(goon, insult, nil, true, nil, true)
			npc_unholster_best_weapon(goon)
		else
			-- Fire once at Pierce's location
			npc_combat_enable(goon,true)
			force_fire(goon, NAVPOINT_PIERCE_LOCATION, true)
			npc_combat_enable(goon,false)
			--ep01_pierce_maybe_damaged()
		end
		thread_yield()
	end
end

Ep01_pierce_current_health = -1
function ep01_display_pierce_health()

	-- Set and display Pierce's health

		local pierce_max_hit_points = ep01_get_parameter_value("PIERCE_MAX_HIT_POINTS")
		local pierce_percent_health = ep01_get_parameter_value("PIERCE_PERCENT_HEALTH")
		local pierce_start_hit_points = pierce_max_hit_points * pierce_percent_health

		-- Set Pierce's max and current hit points
		set_max_hit_points(CHARACTER_PIERCE, pierce_max_hit_points)
		set_current_hit_points(CHARACTER_PIERCE, pierce_start_hit_points)

		-- Turn on the health bar hud
		local sync = ep01_get_sequence_sync(TRIGGER_PIERCE)
		local sync = ep01_get_sequence_sync(TRIGGER_PIERCE)
		if ( (sync == SYNC_LOCAL) or (sync == SYNC_ALL) ) then
			local hud_bar = HUD_BAR[LOCAL_PLAYER]
			hud_bar_on(hud_bar, "Health", HELPTEXT_HUD_PIERCE_HEALTH, pierce_max_hit_points, SYNC_LOCAL)
			hud_bar_set_range(hud_bar, 0, pierce_max_hit_points, SYNC_ALL)
			hud_bar_set_value(hud_bar, pierce_start_hit_points, SYNC_LOCAL)
		end
		if ( (sync == SYNC_REMOTE) or (sync == SYNC_ALL) ) then
			local hud_bar = HUD_BAR[REMOTE_PLAYER]
			hud_bar_on(hud_bar, "Health", HELPTEXT_HUD_PIERCE_HEALTH, pierce_max_hit_points, SYNC_REMOTE)
			hud_bar_set_range(hud_bar, 0, pierce_max_hit_points, SYNC_ALL)
			hud_bar_set_value(hud_bar, pierce_start_hit_points, SYNC_REMOTE)
		end

	-- Initialize time and damage dividers for health ticks
	local tick_time		=	{}
	local tick_amount		=	{}

	-- Grab some mission parameter values
	local survival_ticks = ep01_get_parameter_value("PIERCE_SURVIVAL_TICKS")
	local survival_time_s= ep01_get_parameter_value("PIERCE_SURVIVAL_TIME_S")

	-- Determine when to apply damage
	tick_time[100]	= true	-- always have the last interval end after the last segment
	local num_dividers	=	1
	while(num_dividers < survival_ticks) do
		local rand_divider = rand_int(1,99)
		if(tick_time[rand_divider] == nil) then
			tick_time[rand_divider] = 1
			num_dividers = num_dividers+1
		end
	end

	-- Determine amount of damage to apply
	tick_amount[100]	= true;
	num_dividers				= 1
	while(num_dividers < survival_ticks) do
		local rand_divider = rand_int(1,99)
		if(tick_amount[rand_divider] == nil) then
			tick_amount[rand_divider] = 1
			num_dividers = num_dividers+1
		end
	end
	
	local summed_damage = 0	-- cumulative damage percent (relative to starting health)
	local summed_time	  = 0 -- cumulative time

	for i=1, num_dividers, 1 do

		summed_damage = summed_damage +1
		summed_time	= summed_time + 1
		local tick_duration = 1

		-- Calculate the percent of time before damage is applied during this tick
		while(tick_time[summed_time] == nil) do
			tick_duration = tick_duration + 1
			summed_time = summed_time + 1
		end		

		-- Calculate the cumulative damage total after this tick is applied
		while(tick_amount[summed_damage] == nil) do
			summed_damage = summed_damage + 1
		end

		-- Delay until the interval has passed
		delay (.01 * tick_duration * survival_time_s)

		local new_health = pierce_start_hit_points * (100 - summed_damage)/100
		if (i ~= num_dividers and new_health < 1) then
			new_healh = 1
		end
		if (i == num_dividers) then
			new_health = 0
		end

		Ep01_pierce_current_health = new_health

		set_current_hit_points(CHARACTER_PIERCE,new_health)


		local sync = ep01_get_sequence_sync(TRIGGER_PIERCE)
		if ( (sync == SYNC_LOCAL) or (sync == SYNC_ALL) ) then
			hud_bar_set_value(HUD_BAR[LOCAL_PLAYER], new_health, SYNC_LOCAL )
		end
		if ( (sync == SYNC_REMOTE) or (sync == SYNC_ALL) ) then
			hud_bar_set_value(HUD_BAR[REMOTE_PLAYER], new_health, SYNC_REMOTE )
		end

	end

	-- If we've gotten here, all intervals are processed. Pierce is dead!
	local sync = ep01_get_sequence_sync(TRIGGER_PIERCE)
	if ( (sync == SYNC_LOCAL) or (sync == SYNC_ALL) ) then
		hud_bar_off(HUD_BAR[LOCAL_PLAYER])
	end
	if ( (sync == SYNC_REMOTE) or (sync == SYNC_ALL) ) then
		hud_bar_off(HUD_BAR[REMOTE_PLAYER])
	end
	ep01_failure_pierce_died()
end

function ep01_pierce_maybe_damaged()
	local damaged_chance = .6
	local min_damage = 60
	local max_damage = 100
	local roll = rand_float(0.0,1.0)
	if (roll <= damaged_chance) then
		local new_health = get_current_hit_points(CHARACTER_PIERCE) - rand_int(min_damage, max_damage)
		if (new_health < 0) then
			ep01_failure_pierce_died()
		else
			set_current_hit_points(CHARACTER_PIERCE,new_health)
			local sync = ep01_get_sequence_sync(TRIGGER_PIERCE)
			if ( (sync == SYNC_LOCAL) or (sync == SYNC_ALL) ) then
				hud_bar_set_value(HUD_BAR[LOCAL_PLAYER], new_health, SYNC_LOCAL )
			end
			if ( (sync == SYNC_REMOTE) or (sync == SYNC_ALL) ) then
				hud_bar_set_value(HUD_BAR[REMOTE_PLAYER], new_health, SYNC_REMOTE )
			end
		end
	end
end

ep01_enemies_to_kill = 0
ep01_enemies_living = 0
ep01_enemy_set_objective_helptext = ""

-- Wait for the player to kill a group of enemies
-- 
-- enemy_table				A table containing the names of the enemies that need to be killed
-- mission_helptext		The helptext message that will prompt the player(s) to kill the enemies
-- objective_helptext	The objective text displayed in the hud, needs to be in the format %s of %s remaining
-- sync						The initial sync type for hud elements
function ep01_process_enemy_set(enemy_table, mission_helptext, objective_helptext, sync)

	-- Assign enemy callbacks, add markers
	for i, enemy in pairs(enemy_table) do
		on_death("ep01_enemy_killed", enemy)
		marker_add_npc(enemy, MINIMAP_ICON_KILL, INGAME_EFFECT_KILL, sync) 
	end

	-- Setup kill tracking numbers
	ep01_enemies_to_kill = sizeof_table(enemy_table)
	ep01_enemies_living =  ep01_enemies_to_kill

	-- Display the objective text
	if(objective_helptext) then
		ep01_enemy_set_objective_helptext = objective_helptext
		objective_text(0, ep01_enemy_set_objective_helptext, ep01_enemies_to_kill - ep01_enemies_living, ep01_enemies_to_kill, sync)
	end

	-- Display the help text
	if(mission_helptext) then
		mission_help_table(mission_helptext, "", "", sync)
	end

	while (ep01_enemies_living > 0) do
		thread_yield()
	end

end

function ep01_enemy_killed(enemy)
	marker_remove_npc(enemy)
	on_death("",enemy)
	ep01_enemies_living = ep01_enemies_living - 1
	if (ep01_enemies_living < 1) then
		objective_text_clear(0)
		ep01_enemy_set_objective_helptext = ""
	else
		if (ep01_enemy_set_objective_helptext ~= "") then
			local sync = ep01_get_sequence_sync(TRIGGER_PIERCE)
			objective_text(0, ep01_enemy_set_objective_helptext, ep01_enemies_to_kill - ep01_enemies_living, ep01_enemies_to_kill, sync)
		end
	end
end

-- Other functions

function ep01_cleanup()

	IN_COOP = coop_is_active()

	hud_bar_off(HUD_BAR[LOCAL_PLAYER])
	if (IN_COOP) then
		hud_bar_off(HUD_BAR[REMOTE_PLAYER])
	end

	-- Reallow action spawning
	action_nodes_enable(true)

	-- Reallow ped spawning (may be disabled in single-player)
	spawning_pedestrians(true)

	-- Stop having existing peds flee
	city_chunk_set_all_civilians_fleeing("sr2_chunk104", false)
	city_chunk_set_all_civilians_fleeing("sr2_chunk105", false)

	-- Allow Shaundi and Pierce to be summoned via the cell phone again.
	homie_mission_unlock("Pierce")
	homie_mission_unlock("Shaundi")

	-- Get rid of the any mid-mission phone calls
	mid_mission_phonecall_reset()

	-- Make the players vulnerable again
	turn_vulnerable(LOCAL_PLAYER)
	if (IN_COOP) then
		turn_vulnerable(REMOTE_PLAYER)
	end

	-- Kill threads
		thread_kill(Thread_pierce_health)

	-- reset global variables

	-- reset notoriety
		
		-- Reset min/max Police notoriety
		notoriety_reset("Police")

		-- Set player's police notoriety back to the level it was at when the mission started.
		--notoriety_set("Police", Ep_starting_police_notoriety)

	-- remove markers

	-- remove callbacks

		-- disable all triggers, remove callbacks, remove from map
		for i, trigger in pairs(TABLE_ALL_TRIGGERS) do
			on_trigger("",trigger)
			trigger_enable(trigger,false)
			marker_remove_trigger(trigger)
		end
	
end

function ep01_success()
	-- Called when the mission has ended with success
end

function ep01_complete()

	-- End the mission with success
	mission_end_success(MISSION_NAME, CUTSCENE_OUT, {NAVPOINT_LOCAL_SUCCESS,NAVPOINT_REMOTE_SUCCESS})
end

-- Get the value of the sync type for a sequence
--
-- sequence The name of the sequence (name of the start trigger)
--
-- Returns mission paramater value.
function ep01_get_sequence_sync(sequence)

	local should_sync_local		= (Player_sequence_begun[LOCAL_PLAYER] == sequence)
	local should_sync_remote	= (Player_sequence_begun[REMOTE_PLAYER] == sequence)

	if(should_sync_local and should_sync_remote) then
		return SYNC_ALL
	elseif (should_sync_remote) then
		return SYNC_REMOTE
	else
		return SYNC_LOCAL
	end

end

-- Get the value of the mission parameter.
--
-- parameter	Mission parameter whose value the function should return
--	i				If the parameter is a table, then i indexes the entry that should be returned
--
-- Returns mission paramater value.
function ep01_get_parameter_value(parameter, i)

	local return_val = nil

	-- Check for a coop value:
	if (IN_COOP) then
		if (i) then
			if (EP01_PARAMETERS["COOP_" .. parameter] ~= nil) then
				return_val = EP01_PARAMETERS["COOP_" .. parameter][i]
			end
		else
			return_val = EP01_PARAMETERS["COOP_" .. parameter]
		end
	end

	-- Get the standard value
	if (return_val == nil) then
		if (i) then
			if (EP01_PARAMETERS[parameter] ~= nil) then
				return_val = EP01_PARAMETERS[parameter][i]
			end
		else
			return_val = EP01_PARAMETERS[parameter]
		end
	end

	return return_val
end

function ep01_group_create_maybe_coop(group_always, group_coop, blocking)
	group_create(group_always, blocking)
	if (IN_COOP) then
		group_create(group_coop, blocking)
	end
end

function ep01_release_to_world_maybe_coop(always, coop)
	release_to_world(always)
	if (IN_COOP) then
		release_to_world(coop)
	end
end

-- MISSION FAILURE FUNCTIONS --------------------------------

function ep01_failure_shaundi_abandoned()
	-- End the mission, Shaundi abandoned
	mission_end_failure(MISSION_NAME, HELPTEXT_FAILURE_SHAUNDI_ABANDONED)
end

function ep01_failure_shaundi_died()
	-- End the mission, Shaundi died
	mission_end_failure(MISSION_NAME, HELPTEXT_FAILURE_SHAUNDI_DIED)
end

function ep01_failure_pierce_abandoned()
	-- End the mission, Pierce abandoned
	mission_end_failure(MISSION_NAME, HELPTEXT_FAILURE_PIERCE_ABANDONED)
end

function ep01_failure_pierce_died()
	-- End the mission, Pierce died
	mission_end_failure(MISSION_NAME, HELPTEXT_FAILURE_PIERCE_DIED)
end
