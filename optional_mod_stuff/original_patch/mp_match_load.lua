-- Variable section
Mp_match_load_data = {
	player_data = {},
	current_game = {},
	current_state = 0,
	handles = {},
	first_update = true,
	is_matchmaking = true,
	first_state = true,
	tip_thread = 0,
	map_thread = 0,
	old_map = -1,
	old_tip = -1,
	map_images = {},
}

-- Init and cleanup functions
function mp_match_load_init()
	-- Load Pegs
	peg_load("ui_mp_lobbywindow")
	
	-- Set up all the object handles
	Mp_match_load_data.handles.player_line = vint_object_find("player_line")
	Mp_match_load_data.handles.current_action_h = vint_object_find("current_action")
	Mp_match_load_data.handles.current_map_h = vint_object_find("current_map")
	Mp_match_load_data.handles.full_1_h = vint_object_find("full_1")
	Mp_match_load_data.handles.full_2_h = vint_object_find("full_2")
	Mp_match_load_data.handles.full_3_h = vint_object_find("full_3")
	Mp_match_load_data.handles.heading_h = vint_object_find("heading")
	Mp_match_load_data.handles.matchmaking_h = vint_object_find("matchmaking")
	Mp_match_load_data.handles.my_window_h = vint_object_find("my_window")
	Mp_match_load_data.handles.starting_game_h = vint_object_find("starting_game")
	Mp_match_load_data.handles.tips_h = vint_object_find("tips")
	Mp_match_load_data.handles.map_image_h = vint_object_find("map_image")
	
	-- Set word wrap because it doesn't work automatically for some reason
	vint_set_property(vint_object_find("tip_name"), "word_wrap", true)
	vint_set_property(vint_object_find("heading"), "word_wrap", true)
	
	-- Hold on all the animations
	Mp_match_load_data.handles.opening_match_anim = vint_object_find("opening_match_anim")
	vint_set_property(Mp_match_load_data.handles.opening_match_anim, "is_paused", true)
	vint_set_property(vint_object_find("tips_fade_in",Mp_match_load_data.handles.opening_match_anim), "end_event", "mp_match_load_start_cycle_tips")
	
	Mp_match_load_data.handles.opening_custom_anim = vint_object_find("opening_custom_anim")
	vint_set_property(Mp_match_load_data.handles.opening_custom_anim, "is_paused", true)
	
	Mp_match_load_data.handles.tips_fade_in_anim = vint_object_find("tips_fade_in_anim")
	vint_set_property(Mp_match_load_data.handles.tips_fade_in_anim, "is_paused", true)
	vint_set_property(vint_object_find("tips_fade_in",Mp_match_load_data.handles.tips_fade_in_anim), "end_event", "mp_match_load_start_cycle_tips")
	
	Mp_match_load_data.handles.tips_fade_out_anim = vint_object_find("tips_fade_out_anim")
	vint_set_property(Mp_match_load_data.handles.tips_fade_out_anim, "is_paused", true)
	
	Mp_match_load_data.handles.map_fade_in_anim = vint_object_find("map_fade_in_anim")
	vint_set_property(Mp_match_load_data.handles.map_fade_in_anim, "is_paused", true)
	vint_set_property(vint_object_find("map_image_cust_scale_in",Mp_match_load_data.handles.map_fade_in_anim), "end_event", "mp_match_load_start_cycle_map")
	
	Mp_match_load_data.handles.map_fade_out_anim = vint_object_find("map_fade_out_anim")
	vint_set_property(Mp_match_load_data.handles.map_fade_out_anim, "is_paused", true)
	
	Mp_match_load_data.handles.time_holder_anim = vint_object_find("time_holder_anim")
	vint_set_property(Mp_match_load_data.handles.time_holder_anim, "is_paused", true)
	vint_set_property(vint_object_find("time_holder_alpha_twn",Mp_match_load_data.handles.time_holder_anim), "end_event", "mp_match_load_finish_foolin")
	
	Mp_match_load_data.handles.tips_cycle_anim = vint_object_find("tips_cycle_anim")
	vint_set_property(Mp_match_load_data.handles.tips_cycle_anim, "is_paused", true)
	vint_set_property(vint_object_find("tips_cycle_fade_out",Mp_match_load_data.handles.tips_cycle_anim), "end_event", "mp_match_load_mid_cycle_tips")
	vint_set_property(vint_object_find("tips_cycle_fade_in",Mp_match_load_data.handles.tips_cycle_anim), "end_event", "mp_match_load_finish_cycle_tips")
	
	Mp_match_load_data.handles.map_cycle_anim = vint_object_find("map_cycle_anim")
	vint_set_property(Mp_match_load_data.handles.map_cycle_anim, "is_paused", true)
	vint_set_property(vint_object_find("map_cycle_fade_out",Mp_match_load_data.handles.map_cycle_anim), "end_event", "mp_match_load_mid_cycle_map")
	vint_set_property(vint_object_find("map_cycle_spin_in",Mp_match_load_data.handles.map_cycle_anim), "end_event", "mp_match_load_finish_cycle_map")
			
	-- Set up animation triggers
	Mp_match_load_data.current_state = 0
	
	-- Set up the initial screen state
	vint_dataitem_add_subscription("sr2_matchmaking_current_state_data", "update", "mp_hud_lobby_state_update")
	
	-- Get a background
	mp_match_load_set_background()
	
	-- Cancel button
	Mp_match_load_data.handles.cancel = vint_object_find("cancel")
	vint_set_property(vint_object_find("b_button", Mp_match_load_data.handles.cancel), "image", get_b_button())
	
end

function mp_hud_lobby_state_update(di_h, event)
	-- Get the game data
	local is_matchmaking, is_ranked, state, map, mode, variant = vint_dataitem_get(di_h)

	-- Hang on to matchmaking for graphical setup later
	Mp_match_load_data.is_matchmaking = is_matchmaking
	
	-- If this is the first time, we need to run the initial animations
	if Mp_match_load_data.first_update == true then
		-- Unset the first update flag
		Mp_match_load_data.first_update = false
		
		-- Set up animation triggers
		Mp_match_load_data.current_state = state
	
		-- If we're matchmaking, start at the beginning of the screen
		if is_matchmaking == true then
			-- Set ranked text
			if is_ranked == true then 
				vint_set_property(Mp_match_load_data.handles.heading_h, "text_tag", "MULTI_GAMETYPE_3")
			else
				vint_set_property(Mp_match_load_data.handles.heading_h, "text_tag", "MULTI_GAMETYPE_2")
			end

			-- Animate in
			vint_set_property(vint_object_find("my_window_fade_in",Mp_match_load_data.handles.opening_match_anim), "end_event", "mp_match_load_start_players")
			lua_play_anim(Mp_match_load_data.handles.opening_match_anim, 1)
			
		else -- We're not in matchmaking, so fill in all the data and skip to the end
			-- Hide heading proscript text
			vint_set_property(Mp_match_load_data.handles.matchmaking_h,"visible", false)
		
			-- Set heading text
			vint_set_property(Mp_match_load_data.handles.heading_h, "text_tag", "MULTI_MENU_TITLE")

			-- Animate in
			vint_set_property(vint_object_find("my_window_cust_fade_in",Mp_match_load_data.handles.opening_custom_anim), "end_event", "mp_match_load_start_players")
			lua_play_anim(Mp_match_load_data.handles.opening_custom_anim, 1)
		end
		
		-- Adjust for possible text wrapping
		local width, height = element_get_actual_size(Mp_match_load_data.handles.heading_h)
		vint_set_property(vint_object_find("heading_subgroup"), "anchor", 0.0, height)
		
		if height > 60 then
			local map = vint_object_find("current_map")
			local x, y = vint_get_property(map, "anchor")
			vint_set_property(map, "anchor", x, y + 53)
		end
	end
	
	if state > 1 then -- We know the map info

		-- Map image
		mp_match_load_makemap(map)
		
		-- Map text
		local map_name = vint_object_find("map_name", Mp_match_load_data.handles.current_map_h)
		
		if vint_hack_is_std_res() == true then
			vint_set_property(map_name, "word_wrap", true)
			vint_set_property(map_name, "wrap_width", 425)
		end

		vint_set_property(map_name, "text_tag", map)

		-- Move the rest of the stuff down according to the text wrapping
		local x, map_text_height = element_get_actual_size(map_name)
		vint_set_property(vint_object_find("map_subgroup", Mp_match_load_data.handles.current_map_h), "anchor", 0, map_text_height)
		
		-- Mode
		vint_set_property(vint_object_find("game_mode", Mp_match_load_data.handles.current_map_h), "text_tag", mode)
		
		-- Variant
		vint_set_property(vint_object_find("variant", Mp_match_load_data.handles.current_map_h), "text_tag", variant)
	else
		-- Get us a tip
		mp_match_load_maketip()
	end
	
	-- Set up the new state
	mp_match_load_set_state(state)
end

function mp_match_load_start_players()
	vint_datagroup_add_subscription("sr2_matchmaking_player_data", "update", "mp_match_load_player_update")
	vint_datagroup_add_subscription("sr2_matchmaking_player_data", "insert", "mp_match_load_player_update")
	vint_datagroup_add_subscription("sr2_matchmaking_player_data", "remove", "mp_match_load_player_update")
end

function mp_match_load_player_update(di_h, event)
	
	local team, name, voip, host, in_party, badge, nickname = vint_dataitem_get(di_h)
	if event == "insert" then -- Make a new line
		-- Clone up a new line
		local line_h = vint_object_clone(vint_object_find("player_line"))
		Mp_match_load_data.player_data[di_h] = {team = team, voip = voip, host = host, in_party = in_party, line_h = line_h}
		
		-- Set name text
		local name_h = vint_object_find("name", Mp_match_load_data.player_data[di_h].line_h)
		vint_set_property(name_h, "text_tag", name)
		
		-- Set icon
		local badge_h = vint_object_find("badge", Mp_match_load_data.player_data[di_h].line_h)
		vint_set_property(badge_h, "image", badge)
		
		-- Set nickname
		local nickname_h = vint_object_find("nickname", Mp_match_load_data.player_data[di_h].line_h)
		vint_set_property(nickname_h, "text_tag", nickname)
		
		-- Set voip icon
		mp_match_load_set_voip(di_h)
		
		-- Rebuild the line list
		mp_match_load_arrange_lines()
		
	elseif event == "update" then -- Update an existing line (voip)
		-- Adjust teams if they changed
		local old_team = Mp_match_load_data.player_data[di_h].team
		Mp_match_load_data.player_data[di_h].team = team
		
		if team ~= old_team then
			mp_match_load_arrange_lines()
		end
		
		-- Change voip icon
		local old_voip = Mp_match_load_data.player_data[di_h].voip
		Mp_match_load_data.player_data[di_h].voip = voip
		
		if voip ~= old_voip then
			mp_match_load_set_voip(di_h)
		end
		
	elseif event == "remove" then -- Remove existing line
		vint_object_destroy(Mp_match_load_data.player_data[di_h].line_h)
		Mp_match_load_data.player_data[di_h] = nil
		
		-- Fix the rest of the lines
		mp_match_load_arrange_lines()
	end
end

function mp_match_load_set_voip(idx)
	if Mp_match_load_data.player_data[idx] ~= nil then
		local voip_speaker = vint_object_find("speaker", Mp_match_load_data.player_data[idx].line_h)
		local voip_speaker_on = vint_object_find("speaker_on", Mp_match_load_data.player_data[idx].line_h)
		
		if Mp_match_load_data.player_data[idx].voip == 0 then -- No voip
			vint_set_property(voip_speaker, "visible", false)
			vint_set_property(voip_speaker_on, "visible", false)
			
		elseif Mp_match_load_data.player_data[idx].voip == 1 then -- Plugged in
			vint_set_property(voip_speaker, "visible", true)
			vint_set_property(voip_speaker_on, "visible", false)
			
		elseif Mp_match_load_data.player_data[idx].voip == 2 then -- Talking
			vint_set_property(voip_speaker, "visible", true)
			vint_set_property(voip_speaker_on, "visible", true)
		end
	end
end

function mp_match_load_arrange_lines()
	local LINE_HEIGHT = 40 -- Distance between lines of text
	local current_line = 0
	local x, y = vint_get_property(Mp_match_load_data.handles.player_line, "anchor")
	
	 -- Set the colors and states of all team lines
	for idx, val in Mp_match_load_data.player_data do
		
		-- Set player color
		local name_h = vint_object_find("name", Mp_match_load_data.player_data[idx].line_h)
		local hidden_name_h = vint_object_find("hidden_name", Mp_match_load_data.player_data[idx].line_h)
		
		if Mp_match_load_data.current_state < 2 then
			--Everybody is yellow when players are being found
			vint_set_property(name_h, "tint", 160/255, 160/255, 160/255)
			vint_set_property(hidden_name_h, "tint", 160/255, 160/255, 160/255)
		else
			if Mp_match_load_data.player_data[idx].host == true and Mp_match_load_data.is_matchmaking == false then -- Host is yellow in non-matchmaking
				vint_set_property(name_h, "tint", 241/255, 227/255, 1/255)
				vint_set_property(hidden_name_h, "tint", 241/255, 227/255, 1/255)
			else
				if Mp_match_load_data.player_data[idx].team == 0 then -- Blue team
					vint_set_property(name_h, "tint", 0, 128/255, 255/255)
					vint_set_property(hidden_name_h, "tint", 0, 128/255, 255/255)
				elseif Mp_match_load_data.player_data[idx].team == 1 then -- Red team
					vint_set_property(name_h, "tint", 204/255, 0, 0)
					vint_set_property(hidden_name_h, "tint", 204/255, 0, 0)
				end
			end
		end
	
		-- Show/hide real name and badge based on party and current state
		local shown_h = vint_object_find("shown", Mp_match_load_data.player_data[idx].line_h)
		local hidden_h = vint_object_find("hidden", Mp_match_load_data.player_data[idx].line_h)
		
		if Mp_match_load_data.current_state < 2 then
			if Mp_match_load_data.player_data[idx].in_party == true then
				vint_set_property(shown_h, "visible", true)
				vint_set_property(hidden_h, "visible", false)
			else
				vint_set_property(shown_h, "visible", false)
				vint_set_property(hidden_h, "visible", true)
			end
		else
			vint_set_property(shown_h, "visible", true)
			vint_set_property(hidden_h, "visible", false)
		end
	end
	
	-- Place the blue team lines
	for idx, val in Mp_match_load_data.player_data do
		if Mp_match_load_data.player_data[idx].team == 0 then
			local new_y = y + (current_line * LINE_HEIGHT)
			vint_set_property(Mp_match_load_data.player_data[idx].line_h, "anchor", x, new_y)
			vint_set_property(Mp_match_load_data.player_data[idx].line_h, "visible", true)
			current_line = current_line + 1
		end
	end
	
	-- Place the red team lines
	for idx, val in Mp_match_load_data.player_data do
		if Mp_match_load_data.player_data[idx].team == 1 then
			local new_y = y + (current_line * LINE_HEIGHT)
			vint_set_property(Mp_match_load_data.player_data[idx].line_h, "anchor", x, new_y)
			vint_set_property(Mp_match_load_data.player_data[idx].line_h, "visible", true)
			current_line = current_line + 1
		end
	end
end

function mp_match_load_set_state(state)
	
	--[[  States:
			0 = Searching for games
			1 = Finding players
			2 = Configuring game (loading)
		]]
		
	local old_state = Mp_match_load_data.current_state
	Mp_match_load_data.current_state = state
	
	-- Open up new state
	if state == 0 then
		
		-- Cancel button
		vint_set_property(Mp_match_load_data.handles.cancel, "visible", true)
	
		-- Searching for games
		vint_set_property(Mp_match_load_data.handles.full_1_h, "tint", 229/255, 191/255,  13/255)
		vint_set_property(Mp_match_load_data.handles.full_2_h, "tint", 128/255, 128/255, 128/255)
		vint_set_property(Mp_match_load_data.handles.full_3_h, "tint", 128/255, 128/255, 128/255)
		vint_set_property(Mp_match_load_data.handles.full_1_h, "visible", true)
		vint_set_property(Mp_match_load_data.handles.full_2_h, "visible", true)
		vint_set_property(Mp_match_load_data.handles.full_3_h, "visible", true)
		
		vint_set_property(Mp_match_load_data.handles.current_action_h, "text_tag", "MULTI_MATCHMAKING_STEP_1")
		vint_set_property(Mp_match_load_data.handles.current_action_h, "visible", true)
		
		if old_state > 1 then
			-- Animate out the map image
			lua_play_anim(Mp_match_load_data.handles.map_fade_out_anim, 0)
			
			-- Animate in the tips
			mp_match_load_maketip()
			lua_play_anim(Mp_match_load_data.handles.tips_fade_in_anim, 0)
		end
			
		-- Fun hacky stuff for if somebody yanks their controller
		if Mp_match_load_data.is_matchmaking == false then 
			if Mp_match_load_data.first_state then
				Mp_match_load_data.first_state = false
			
				mp_match_load_maketip()
				
				mp_match_load_start_fool_testers(Mp_match_load_data.handles.starting_game_h)
				vint_set_property(Mp_match_load_data.handles.starting_game_h, "visible", true)
				
				lua_play_anim(Mp_match_load_data.handles.tips_fade_in_anim, 2)
			end
		else
			vint_set_property(Mp_match_load_data.handles.starting_game_h, "visible", false)
		end
		
	elseif state == 1 then
	
		-- Cancel button
		vint_set_property(Mp_match_load_data.handles.cancel, "visible", true)
	
		-- Searching for players
		vint_set_property(Mp_match_load_data.handles.full_1_h, "tint", 128/255, 128/255, 128/255)
		vint_set_property(Mp_match_load_data.handles.full_2_h, "tint", 229/255, 191/255,  13/255)
		vint_set_property(Mp_match_load_data.handles.full_3_h, "tint", 128/255, 128/255, 128/255)
		vint_set_property(Mp_match_load_data.handles.full_1_h, "visible", true)
		vint_set_property(Mp_match_load_data.handles.full_2_h, "visible", true)
		vint_set_property(Mp_match_load_data.handles.full_3_h, "visible", true)
		
		vint_set_property(Mp_match_load_data.handles.current_action_h, "text_tag", "MULTI_MATCHMAKING_STEP_2")		
		vint_set_property(Mp_match_load_data.handles.current_action_h, "visible", true)
		
		if old_state > 1 then
			-- Animate out the map image
			lua_play_anim(Mp_match_load_data.handles.map_fade_out_anim, 0)
			
			-- Animate in the tips
			mp_match_load_maketip()
			lua_play_anim(Mp_match_load_data.handles.tips_fade_in_anim, 0)
		end
		
		-- Fun hacky stuff for if somebody yanks their controller
		if Mp_match_load_data.is_matchmaking then
			vint_set_property(Mp_match_load_data.handles.starting_game_h, "visible", false)
		end
		
	elseif state == 2 then
	
		-- Cancel button
		vint_set_property(Mp_match_load_data.handles.cancel, "visible", false)
	
		if Mp_match_load_data.is_matchmaking then
			-- Configuring game
			vint_set_property(Mp_match_load_data.handles.full_1_h, "tint", 128/255, 128/255, 128/255)
			vint_set_property(Mp_match_load_data.handles.full_2_h, "tint", 128/255, 128/255, 128/255)
			vint_set_property(Mp_match_load_data.handles.full_3_h, "tint", 229/255, 191/255,  13/255)
			vint_set_property(Mp_match_load_data.handles.full_1_h, "visible", true)
			vint_set_property(Mp_match_load_data.handles.full_2_h, "visible", true)
			vint_set_property(Mp_match_load_data.handles.full_3_h, "visible", true)
			
			vint_set_property(Mp_match_load_data.handles.starting_game_h, "visible", false)
			
			mp_match_load_start_fool_testers(Mp_match_load_data.handles.current_action_h)
			vint_set_property(Mp_match_load_data.handles.current_action_h, "visible", true)
		else
			-- Configuring custom game
			vint_set_property(Mp_match_load_data.handles.full_1_h, "visible", false)
			vint_set_property(Mp_match_load_data.handles.full_2_h, "visible", false)
			vint_set_property(Mp_match_load_data.handles.full_3_h, "visible", false)

			vint_set_property(Mp_match_load_data.handles.current_action_h, "visible", false)
		end
		
		if old_state < 2 then
			-- Animate out the tips
			vint_set_property(Mp_match_load_data.handles.tips_fade_in_anim, "is_paused", true)
			local tips_alpha = vint_get_property(Mp_match_load_data.handles.tips_h, "alpha")
			vint_set_property(vint_object_find("tips_fade_out",Mp_match_load_data.handles.tips_fade_out_anim), "start_value", tips_alpha)
			
			vint_set_property(Mp_match_load_data.handles.tips_cycle_anim, "is_paused", true)
			thread_kill(Mp_match_load_data.tip_thread)
			lua_play_anim(Mp_match_load_data.handles.tips_fade_out_anim, 0)
			
			-- Animate in the map image
			lua_play_anim(Mp_match_load_data.handles.map_fade_in_anim, 0)
		end
	end
	
	-- Make sure the names are hidden correctly
	mp_match_load_arrange_lines()
end

function mp_match_load_start_fool_testers(handle)
	vint_set_property(handle, "text_tag", "MM_LOAD_LOADING")
	Mp_match_load_data.handles.foolin = handle
	lua_play_anim(Mp_match_load_data.handles.time_holder_anim,0)
end

function mp_match_load_finish_foolin()
	if Mp_match_load_data.current_state == 2 then
		vint_set_property(Mp_match_load_data.handles.foolin, "text_tag", "MULTI_MATCHMAKING_STEP_3")
	end
end

function mp_match_load_set_background()
	local rand_background = rand_int(2,3)
	local backdrop_h = vint_object_find("backdrop")
	
	if rand_background == 2 then
		peg_load("ui_matchmaking_bkgnd02")
		vint_set_property(backdrop_h, "image", "mp_lobby02_background.tga")
	elseif rand_background == 3 then
		peg_load("ui_matchmaking_bkgnd03")
		vint_set_property(backdrop_h, "image", "mp_lobby03_background.tga")
	end
end

function mp_match_load_start_cycle_tips()
	Mp_match_load_data.tip_thread = thread_new("mp_match_load_cycle_tips")
end

function mp_match_load_cycle_tips()
	lua_play_anim(Mp_match_load_data.handles.tips_cycle_anim, 12)
end

function mp_match_load_mid_cycle_tips()
	mp_match_load_maketip()
end

function mp_match_load_finish_cycle_tips()
	Mp_match_load_data.tip_thread = thread_new("mp_match_load_cycle_tips")
end

function mp_match_load_start_cycle_map()
	Mp_match_load_data.map_thread = thread_new("mp_match_load_cycle_map")
end

function mp_match_load_cycle_map()
	lua_play_anim(Mp_match_load_data.handles.map_cycle_anim, 12)
end

function mp_match_load_mid_cycle_map()
	mp_match_load_random_map()
end

function mp_match_load_finish_cycle_map()
	Mp_match_load_data.map_thread = thread_new("mp_match_load_cycle_map")
end

function mp_match_load_clear_pegs()
	peg_unload("ui_ml_car_show")
	peg_unload("ui_ml_chinatown")
	peg_unload("ui_ml_hangar")
	peg_unload("ui_ml_north_shore")
	peg_unload("ui_ml_nuke_plant")
	peg_unload("ui_ml_oldtown")
	peg_unload("ui_ml_parthenon")
	peg_unload("ui_ml_poseidons_palace")
	peg_unload("ui_ml_shantytown")
	peg_unload("ui_ml_stilwater_science")
	peg_unload("ui_ml_the_pyramid")
	peg_unload("ui_ml_wharfside")
end

function mp_match_load_makemap(map)

	-- Blow away all the old pegs
	mp_match_load_clear_pegs()
	
	-- Load up the new peg and assign the pictures
	if map == "MULTI_LEVEL_SHANTYTOWN" then
		peg_load("ui_ml_shantytown")
		Mp_match_load_data.map_images[1] = "shantytown1"
		Mp_match_load_data.map_images[2] = "shantytown2"
		Mp_match_load_data.map_images[3] = "shantytown3"

	elseif map == "MULTI_LEVEL_CHINATOWN" then
		peg_load("ui_ml_chinatown")
		Mp_match_load_data.map_images[1] = "chinatown1"
		Mp_match_load_data.map_images[2] = "chinatown2"
		Mp_match_load_data.map_images[3] = "chinatown3"
		
	elseif map == "MULTI_LEVEL_SCIENCE" then
		peg_load("ui_ml_stilwater_science")
		Mp_match_load_data.map_images[1] = "stilwater_science1"
		Mp_match_load_data.map_images[2] = "stilwater_science2"
		Mp_match_load_data.map_images[3] = "stilwater_science3"
		
	elseif map == "MULTI_LEVEL_ULTOR" then
		peg_load("ui_ml_the_pyramid")
		Mp_match_load_data.map_images[1] = "the_pyramid1"
		Mp_match_load_data.map_images[2] = "the_pyramid2"
		Mp_match_load_data.map_images[3] = "the_pyramid3"
		
	elseif map == "MULTI_LEVEL_MALL" then
		peg_load("ui_ml_car_show")
		Mp_match_load_data.map_images[1] = "car_show1"
		Mp_match_load_data.map_images[2] = "car_show2"
		Mp_match_load_data.map_images[3] = "car_show3"
		
	elseif map == "MULTI_LEVEL_HANGAR" then
		peg_load("ui_ml_hangar")
		Mp_match_load_data.map_images[1] = "hangar1"
		Mp_match_load_data.map_images[2] = "hangar2"
		Mp_match_load_data.map_images[3] = "hangar3"
		
	elseif map == "MULTI_LEVEL_SA_BARRIO" then
		peg_load("ui_ml_oldtown")
		Mp_match_load_data.map_images[1] = "oldtown1"
		Mp_match_load_data.map_images[2] = "oldtown2"
		Mp_match_load_data.map_images[3] = "oldtown3"
		
	elseif map == "MULTI_LEVEL_DOCKS" then
		peg_load("ui_ml_wharfside")
		Mp_match_load_data.map_images[1] = "wharfside1"
		Mp_match_load_data.map_images[2] = "wharfside2"
		Mp_match_load_data.map_images[3] = "wharfside3"
		
	elseif map == "MULTI_LEVEL_MUSEUM" then
		peg_load("ui_ml_parthenon")
		Mp_match_load_data.map_images[1] = "parthenon1"
		Mp_match_load_data.map_images[2] = "parthenon2"
		Mp_match_load_data.map_images[3] = "parthenon3"
		
	elseif map == "MULTI_LEVEL_MARINA" then
		peg_load("ui_ml_north_shore")
		Mp_match_load_data.map_images[1] = "north_shore1"
		Mp_match_load_data.map_images[2] = "north_shore2"
		Mp_match_load_data.map_images[3] = "north_shore3"
		
	elseif map == "MULTI_LEVEL_CASINO" then
		peg_load("ui_ml_poseidons_palace")
		Mp_match_load_data.map_images[1] = "poseidons_palace1"
		Mp_match_load_data.map_images[2] = "poseidons_palace2"
		Mp_match_load_data.map_images[3] = "poseidons_palace3"
		
	elseif map == "MULTI_LEVEL_NUKE" then
		peg_load("ui_ml_nuke_plant")
		Mp_match_load_data.map_images[1] = "nuke_plant1"
		Mp_match_load_data.map_images[2] = "nuke_plant2"
		Mp_match_load_data.map_images[3] = "nuke_plant3"
	end
	
	-- Display one of the map pics
	mp_match_load_random_map()
end

function mp_match_load_random_map()
	-- Throw up a map
	local rand_map = rand_int(1,3)
	
	-- Make sure we don't show the same one twice in a row
	while Mp_match_load_data.old_map == rand_map do
		rand_map = rand_int(1,3)
	end
	
	-- Set the map image here
	vint_set_property(Mp_match_load_data.handles.map_image_h, "image", Mp_match_load_data.map_images[rand_map])
	
	-- Set new angle for the map image just for fun
	vint_set_property(vint_object_find("map_cycle_spin_in",Mp_match_load_data.handles.map_cycle_anim), "end_value", rand_float(-0.05, 0.05))
end

function mp_match_load_maketip()
	-- Throw up a tip (just the tip)
	local rand_tip = rand_int(1,12)
	
	-- Make sure we don't show the same one twice in a row
	while Mp_match_load_data.old_tip == rand_tip do
		rand_tip = rand_int(1,12)
	end
	
	-- Hang on to this tip
	Mp_match_load_data.old_tip = rand_tip
	
	local tip_heading
	local tip_text
	
	if rand_tip == 1 then
		tip_heading = "MULTI_MODE_STRONGARM"
		tip_text = "MULTI_TIP_STRONGARM"
	elseif rand_tip == 2 then
		tip_heading = "HELP_TEXT_TAGGING_TITLE"
		tip_text = "MULTI_TIP_TAGGING"
	elseif rand_tip == 3 then
		tip_heading = "MULTI_ACTIVITY_DERBY"
		tip_text = "MULTI_TIP_DEMO_DERBY"
	elseif rand_tip == 4 then
		tip_heading = "MULTI_ACTIVITY_HITMAN"
		tip_text = "MULTI_TIP_HITMAN"
	elseif rand_tip == 5 then
		tip_heading = "MULTI_ACTIVITY_FRAUD"
		tip_text = "MULTI_TIP_FRAUD"
	elseif rand_tip == 6 then
		tip_heading = "MULTI_ACTIVITY_MAYHEM"
		tip_text = "MULTI_TIP_MAYHEM"
	elseif rand_tip == 7 then
		tip_heading = "MULTI_ACTIVITY_RACING"
		tip_text = "MULTI_TIP_RACING"
	elseif rand_tip == 8 then
		tip_heading = "MULTI_ACTIVITY_SNATCH"
		tip_text = "MULTI_TIP_SNATCH"
	elseif rand_tip == 9 then
		tip_heading = "MULTI_ACTIVITY_THEFT"
		tip_text = "MULTI_TIP_THEFT"
	elseif rand_tip == 10 then
		tip_heading = "MULTI_MENU_CUSTOMIZATION"
		tip_text = "MULTI_TIP_CUSTOMIZATION"
	elseif rand_tip == 11 then
		tip_heading = "MULTI_MENU_XBOX_CUSTOM_MATCH"
		tip_text = "MULTI_TIP_CUSTOM_MATCH"
	elseif rand_tip == 12 then
		tip_heading = "MULTI_MENU_TUTORIALS"
		tip_text = "MULTI_TIP_TUTORIAL"
	end
	
	local name_h = vint_object_find("tip_name")
	local filler_h = vint_object_find("tip_filler")
	
	vint_set_property(name_h, "text_tag", tip_heading)
	vint_set_property(filler_h, "text_tag", tip_text)
	
	local x, y = element_get_actual_size(name_h)
	debug_print("vint", "Y size value = " .. y .. "\n")

	if y < 60 then
		vint_set_property(filler_h, "anchor", -484.0, -32.0)
	else
		vint_set_property(filler_h, "anchor", -484.0, 18.0)
	end
end

function mp_match_load_cleanup()
	-- Unload Pegs
	peg_unload("ui_matchmaking_bkgnd02")
	peg_unload("ui_matchmaking_bkgnd03")
	peg_unload("ui_mp_lobbywindow")
	mp_match_load_clear_pegs()
end
