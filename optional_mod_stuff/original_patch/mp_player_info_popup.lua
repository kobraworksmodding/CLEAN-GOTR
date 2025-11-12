-- Variable section
Mp_player_info_popup_data = {
	handles = {
					buttons = {},
					button_shine = {},
					button_fade_in = {},
					button_fade_out = {},
					},
	button_function = {},
	is_first_time = true,
	current_button = 1,
	num_buttons = 0,
	is_leaving = false,
	input_subscriptions = {},
}

-- Init and cleanup functions
function mp_player_info_popup_init()
	
	-- Set up animation handles
	Mp_player_info_popup_data.handles.start_screen_anim_h = vint_object_find("start_screen_anim")
	vint_set_property(Mp_player_info_popup_data.handles.start_screen_anim_h, "is_paused", true)
	
	Mp_player_info_popup_data.handles.end_screen_anim_h = vint_object_find("end_screen_anim")
	vint_set_property(Mp_player_info_popup_data.handles.end_screen_anim_h, "is_paused", true)
	local h = vint_object_find("background_fade_out", Mp_player_info_popup_data.handles.end_screen_anim_h)
	vint_set_property(h, "end_event", "mp_player_info_popup_exit")
	
	Mp_player_info_popup_data.handles.highlight_shine_anim_h = vint_object_find("highlight_shine_anim")
	vint_set_property(Mp_player_info_popup_data.handles.highlight_shine_anim_h, "is_paused", true)
	
	Mp_player_info_popup_data.handles.highlight_fade_in_h = vint_object_find("highlight_fade_in")
	vint_set_property(Mp_player_info_popup_data.handles.highlight_fade_in_h, "is_paused", true)
	
	Mp_player_info_popup_data.handles.highlight_fade_out_h = vint_object_find("highlight_fade_out")
	vint_set_property(Mp_player_info_popup_data.handles.highlight_fade_out_h, "is_paused", true)

	Mp_player_info_popup_data.is_first_time = true
	
	-- Set up the PS3 button
	vint_set_property(vint_object_find("select_button"), "visible", false)
	
	--Subscribe to input
	Mp_player_info_popup_data.input_subscriptions = {	
		vint_subscribe_to_input_event(nil, "nav_up",				"mp_player_info_popup_input", 100),
		vint_subscribe_to_input_event(nil, "nav_down",			"mp_player_info_popup_input", 100),
		vint_subscribe_to_input_event(nil, "select",				"mp_player_info_popup_input", 100),
		vint_subscribe_to_input_event(nil, "back",				"mp_player_info_popup_input", 100),
		vint_subscribe_to_input_event(nil, "all_unassigned",  "mp_player_info_popup_input", 100),
	}
	
	-- Start looking for data
	vint_dataitem_add_subscription("mp_player_popup_data_item", "update", "mp_popup_update_data")
	
	--If we are in main menu hide button tips
	if vint_document_find("main_menu") ~= 0 then
		main_menu_btn_tips_show(false)
	end
end

function mp_popup_update_data(di_h, event)

	-- Get the game data
	local voip, team, are_they_host, am_i_host, name, badge, earnings, kills, deaths, favorite, wins, losses, is_me, badge_description = vint_dataitem_get(di_h)
	
	-- Handles for voip
	local voip_speaker_h = vint_object_find("speaker") -- , speaker)
	local voip_speaker_on_h = vint_object_find("speaker_on") -- , speaker_on)
	
	-- Voip display can change while we look at this screen, so it accepts all updates
	if voip == 0 then -- No voip
		vint_set_property(voip_speaker_h, "visible", false)
		vint_set_property(voip_speaker_on_h, "visible", false)
		
	elseif voip == 1 then -- Plugged in
		vint_set_property(voip_speaker_h, "visible", true)
		vint_set_property(voip_speaker_on_h, "visible", false)
		
	elseif voip == 2 then -- Talking
		vint_set_property(voip_speaker_h, "visible", true)
		vint_set_property(voip_speaker_on_h, "visible", true)
	end
		
	local name_h = vint_object_find("name_text")
	local badge_h = vint_object_find("badge")
	local earnings_h = vint_object_find("earnings_value")
	local kills_h = vint_object_find("kills_value")
	local deaths_h = vint_object_find("deaths_value")
	local favorite_h = vint_object_find("favorite_value")
	local record_h = vint_object_find("record_value")

	-- Team Colors Display (handle host color)
	if are_they_host == true then
		-- Set text to yellow
		vint_set_property(name_h, "tint", 241/255, 227/255, 1/255)
	else
		if team == 0 then
			-- Set text to blue
			vint_set_property(name_h, "tint", 0, 128/255, 255/255)
		elseif team == 1 then
			-- Set text to red
			vint_set_property(name_h, "tint", 204/255, 0, 0)
		end
	end
	
	-- Text strings
	vint_set_property(name_h, "text_tag", name)
	vint_set_property(earnings_h, "text_tag", earnings)
	vint_set_property(kills_h, "text_tag", kills)
	vint_set_property(deaths_h, "text_tag", deaths)
	
	
	if favorite == 11 then
		vint_set_property(favorite_h, "text_tag", "MULTI_MODE_13")
	elseif favorite == 12 then
		vint_set_property(favorite_h, "text_tag", "MULTI_MODE_14")
	elseif favorite == 13 then
		vint_set_property(favorite_h, "text_tag", "MULTI_MODE_STRONGARM")
	else
		vint_set_property(favorite_h, "text_tag", "")
	end
	
	vint_set_property(record_h, "text_tag", wins .. "/" .. losses)

	-- Everything else is only set up and displayed the first time the data is updated
	if Mp_player_info_popup_data.is_first_time ~= false then
		
		-- Clear first time flag
		Mp_player_info_popup_data.is_first_time = false
		
		-- Play sound effect
		audio_play(DIALOG_SERIOUS_SOUND)
		
		-- Set badge here
		vint_set_property(vint_object_find("badge"), "image", badge)
		vint_set_property(vint_object_find("nickname_text"), "text_tag", badge_description)
		
		if is_me == false then
			-- Add the extra splitter
			vint_set_property(vint_object_find("splitter3"), "visible", true)
		
			-- Make main buttons
			--mp_player_info_popup_add_button("MULTI_MENU_ADD_FRIEND",mp_player_info_popup_add_friend)
			
			-- Add 360 buttons
			if get_platform() == "XBOX360" then
				mp_player_info_popup_add_button("MULTI_MENU_SHOW_GAMERCARD",mp_player_info_popup_show_gamercard)
				mp_player_info_popup_add_button("CONTROL_SUBMIT_PLAYER_REVIEW",mp_player_info_popup_submit_review)
			end
			
			-- Add the kick button
			if am_i_host == true and are_they_host == false and mp_popup_is_matchmaking() == false then
				mp_player_info_popup_add_button("MULTI_MENU_REMOVE_PLAYER",mp_player_info_popup_kick_player)
			end
		end
		
		-- Set initial cursor position
		mp_player_info_popup_move_cursor(0)
		
		-- Animate screen in
		lua_play_anim(Mp_player_info_popup_data.handles.start_screen_anim_h, 0)
	end
end

function mp_player_info_popup_add_button(text, button_function)

	-- Get placement stuff
	local button_spacing = 32
	local x, y = vint_get_property(vint_object_find("button"), "anchor")
	x = x - 16

	-- Increment number of buttons
	Mp_player_info_popup_data.num_buttons = Mp_player_info_popup_data.num_buttons + 1
	
	-- Create a new button clone
	Mp_player_info_popup_data.handles.buttons[Mp_player_info_popup_data.num_buttons] = vint_object_clone(vint_object_find("button"))
	
	-- Add function for the button
	Mp_player_info_popup_data.button_function[Mp_player_info_popup_data.num_buttons] = button_function
	
	-- Assign animations
	Mp_player_info_popup_data.handles.button_shine[Mp_player_info_popup_data.num_buttons] = vint_object_clone(Mp_player_info_popup_data.handles.highlight_shine_anim_h)
	vint_set_property(Mp_player_info_popup_data.handles.button_shine[Mp_player_info_popup_data.num_buttons], "is_paused", true)
	vint_set_property(vint_object_find("highlight_shine_fade",Mp_player_info_popup_data.handles.button_shine[Mp_player_info_popup_data.num_buttons]),"target_handle",
							vint_object_find("highlight_back_shine",Mp_player_info_popup_data.handles.buttons[Mp_player_info_popup_data.num_buttons]))
	
	Mp_player_info_popup_data.handles.button_fade_in[Mp_player_info_popup_data.num_buttons] = vint_object_clone(Mp_player_info_popup_data.handles.highlight_fade_in_h)
	vint_set_property(Mp_player_info_popup_data.handles.button_fade_in[Mp_player_info_popup_data.num_buttons], "is_paused", true)
	vint_set_property(vint_object_find("highlight_alpha_in",Mp_player_info_popup_data.handles.button_fade_in[Mp_player_info_popup_data.num_buttons]),"target_handle",
							vint_object_find("highlight",Mp_player_info_popup_data.handles.buttons[Mp_player_info_popup_data.num_buttons]))
	
	Mp_player_info_popup_data.handles.button_fade_out[Mp_player_info_popup_data.num_buttons] = vint_object_clone(Mp_player_info_popup_data.handles.highlight_fade_out_h)
	vint_set_property(Mp_player_info_popup_data.handles.button_fade_out[Mp_player_info_popup_data.num_buttons], "is_paused", true)
	vint_set_property(vint_object_find("highlight_alpha_out",Mp_player_info_popup_data.handles.button_fade_out[Mp_player_info_popup_data.num_buttons]),"target_handle",
							vint_object_find("highlight",Mp_player_info_popup_data.handles.buttons[Mp_player_info_popup_data.num_buttons]))

	-- Set text labels
	vint_set_property(vint_object_find("normal_label", Mp_player_info_popup_data.handles.buttons[Mp_player_info_popup_data.num_buttons]), "text_tag", text)
	vint_set_property(vint_object_find("highlight_label", Mp_player_info_popup_data.handles.buttons[Mp_player_info_popup_data.num_buttons]), "text_tag", text)
	
	-- Position and draw new button
	vint_set_property(Mp_player_info_popup_data.handles.buttons[Mp_player_info_popup_data.num_buttons], "anchor", x, y + button_spacing * (Mp_player_info_popup_data.num_buttons - 1))
	vint_set_property(Mp_player_info_popup_data.handles.buttons[Mp_player_info_popup_data.num_buttons], "visible", true)
	
	-- Adjust window size to hold new button
	local window_h = vint_object_find("window")
	local window_clip_h = vint_object_find("window_clip")
	local btm_line_h = vint_object_find("btm_line")
	
	x, y = vint_get_property(window_h, "anchor")
	y = y - 13
	vint_set_property(window_h, "anchor", x, y)
	
	x, y = vint_get_property(window_clip_h, "clip_size")
	y = y + 32.5
	vint_set_property(window_clip_h, "clip_size", x, y)
	
	x, y = vint_get_property(btm_line_h, "anchor")
	y = y + 32.5
	vint_set_property(btm_line_h, "anchor", x, y)
end

function mp_player_info_popup_remove_button()
	
	-- Make sure we have buttons to remove
	if Mp_player_info_popup_data.num_buttons > 0 then
	
		-- Destroy the last button
		vint_object_destroy(Mp_player_info_popup_data.handles.button_shine[Mp_player_info_popup_data.num_buttons])
		vint_object_destroy(Mp_player_info_popup_data.handles.button_fade_in[Mp_player_info_popup_data.num_buttons])
		vint_object_destroy(Mp_player_info_popup_data.handles.button_fade_out[Mp_player_info_popup_data.num_buttons])
		vint_object_destroy(Mp_player_info_popup_data.handles.buttons[Mp_player_info_popup_data.num_buttons])
	
		-- Decrement number of buttons
		Mp_player_info_popup_data.num_buttons = Mp_player_info_popup_data.num_buttons - 1
		
		-- Move the cursor back to the top
		Mp_player_info_popup_data.current_button = 1
		
		-- Redraw the cursor
		mp_player_info_popup_move_cursor(0)
	end
end

function mp_player_info_popup_input(target, event, accelleration)
	if Mp_player_info_popup_data.is_first_time == true then
		return
	end
	
	if Mp_player_info_popup_data.is_leaving == true then
		return
	end
	
	if event == "nav_up" then
		-- Up button pressed
		if Mp_player_info_popup_data.num_buttons > 1 then
			audio_play(Menu_sound_item_nav)
		end
		mp_player_info_popup_move_cursor(-1)
		
	elseif event == "nav_down" then
		-- Down button presses
		if Mp_player_info_popup_data.num_buttons > 1 then
			audio_play(Menu_sound_item_nav)
		end
		mp_player_info_popup_move_cursor(1)
		
	elseif event == "select" then
		-- Do stuff based on the current button
		if Mp_player_info_popup_data.button_function[Mp_player_info_popup_data.current_button] ~= nil then
			audio_play(Menu_sound_select)
			Mp_player_info_popup_data.button_function[Mp_player_info_popup_data.current_button]()
		end
		
	elseif event == "back" then
		-- Animate out
		Mp_player_info_popup_data.is_leaving = true
		audio_play(Menu_sound_back)
		lua_play_anim(Mp_player_info_popup_data.handles.end_screen_anim_h, 0)
	end
end

function mp_player_info_popup_add_friend()
	-- Add player to friends
	mp_popup_add_friend()
end

function mp_player_info_popup_show_gamercard()
	-- Show player's gamer card
	mp_popup_show_gamercard()
end

function mp_player_info_popup_submit_review()
	-- Submit player review
	mp_popup_submit_player_review()
end

function mp_player_info_popup_kick_player()
	-- Kick player
	mp_popup_kick_player()
	mp_player_info_popup_remove_button()
end

function mp_player_info_popup_move_cursor(dir)

	if dir ~= 0 then
		-- Hide the old button
		vint_set_property(Mp_player_info_popup_data.handles.button_shine[Mp_player_info_popup_data.current_button], "is_paused", true)
		lua_play_anim(Mp_player_info_popup_data.handles.button_fade_out[Mp_player_info_popup_data.current_button], 0)
	
		-- Do the math to figure out where the button is next
		if dir == 1 then -- Move down 1
			if Mp_player_info_popup_data.current_button < Mp_player_info_popup_data.num_buttons then
				Mp_player_info_popup_data.current_button = Mp_player_info_popup_data.current_button + 1
			else
				Mp_player_info_popup_data.current_button = 1
			end
		elseif dir == -1 then -- Move up 1
			if Mp_player_info_popup_data.current_button > 1 then
				Mp_player_info_popup_data.current_button = Mp_player_info_popup_data.current_button - 1
			else
				Mp_player_info_popup_data.current_button = Mp_player_info_popup_data.num_buttons
			end
		end
	end
	
	-- Show the new button
	lua_play_anim(Mp_player_info_popup_data.handles.button_shine[Mp_player_info_popup_data.current_button], 0)
	lua_play_anim(Mp_player_info_popup_data.handles.button_fade_in[Mp_player_info_popup_data.current_button], 0)
end
	
function mp_player_info_popup_exit()
	vint_document_unload(vint_document_find("mp_player_info_popup"))	
end	
	
function mp_player_info_popup_cleanup()

	-- Kill subscriptions
	for idx, val in Mp_player_info_popup_data.input_subscriptions do
		vint_unsubscribe_to_input_event(val)
	end
	Mp_player_info_popup_data.input_subscriptions = nil
	
	
	--If we are in main menu show button tips
	if vint_document_find("main_menu") ~= 0 then
		main_menu_btn_tips_show(true)
	end
end
