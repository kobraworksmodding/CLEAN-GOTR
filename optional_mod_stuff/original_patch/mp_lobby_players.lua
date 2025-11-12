-- Variable section
Mp_lobby_players_data = {
	player_data = {},
}

-- Init and cleanup functions
function mp_lobby_players_init()

	-- Set current line
	Mp_lobby_players_data.current_line = 1

	-- Find elements
	Mp_lobby_players_data.line_h = vint_object_find("mp_lobby_line")
	Mp_lobby_players_data.pulsate_anim_h = vint_object_find("player_pulsate_anim")
	vint_set_property(Mp_lobby_players_data.pulsate_anim_h,"is_paused", true)

	Mp_lobby_players_data.fade_in_anim_h = vint_object_find("highlight_fade_in")
	vint_set_property(Mp_lobby_players_data.fade_in_anim_h,"is_paused", true)
	
	Mp_lobby_players_data.fade_out_anim_h = vint_object_find("highlight_fade_out")
	vint_set_property(Mp_lobby_players_data.fade_out_anim_h,"is_paused", true)
	
	-- Subscribe to updates
	vint_datagroup_add_subscription("sr2_multi_lobby_player_data", "update", "mp_lobby_players_data_update")
	vint_datagroup_add_subscription("sr2_multi_lobby_player_data", "insert", "mp_lobby_players_data_update")
	vint_datagroup_add_subscription("sr2_multi_lobby_player_data", "remove", "mp_lobby_players_data_update")
	
	Mp_lobby_players_data.input_subs = {
		vint_subscribe_to_input_event(nil, "nav_up",		"mp_lobby_players_nav_up", 50),
		vint_subscribe_to_input_event(nil, "nav_down", 	"mp_lobby_players_nav_down", 50),
		vint_subscribe_to_input_event(nil, "select",		"mp_lobby_players_select", 50)
	}
end

function mp_lobby_players_cleanup()
	
	--Cleanup cloned animations
	for idx, val in Mp_lobby_players_data.player_data do
		vint_object_destroy(val.pulsate_anim_h)
		vint_object_destroy(val.fade_in_anim_h)
		vint_object_destroy(val.fade_out_anim_h)
	end
	
	-- Unsubscribt to updates
	vint_datagroup_remove_subscription("sr2_multi_lobby_player_data", "update", "mp_lobby_players_data_update")
	vint_datagroup_remove_subscription("sr2_multi_lobby_player_data", "insert", "mp_lobby_players_data_update")
	vint_datagroup_remove_subscription("sr2_multi_lobby_player_data", "remove", "mp_lobby_players_data_update")

	-- Kill the player info popup
	if vint_document_find("mp_player_info_popup") ~= nil then
		vint_document_unload(vint_document_find("mp_player_info_popup"))
	end
	
	-- Unsubscribe to input events
	for idx, val in Mp_lobby_players_data.input_subs do
		vint_unsubscribe_to_input_event(val)
	end
end

function mp_lobby_players_nav_up(target, event, accelleration)
	-- Move cursor up
	mp_lobby_players_update_highlight(-1)
	
	if Mp_lobby_players_data.num_lines > 1 then
		audio_play(Menu_sound_item_nav)
	end
end

function mp_lobby_players_nav_down(target, event, accelleration)
	-- Move cursor down
	mp_lobby_players_update_highlight(1)
	
	if Mp_lobby_players_data.num_lines > 1 then
		audio_play(Menu_sound_item_nav)
	end
end

function mp_lobby_players_select(target, event, accelleration)
	-- Select current player
	for idx, val in Mp_lobby_players_data.player_data do
		if Mp_lobby_players_data.player_data[idx].physical_line == Mp_lobby_players_data.current_line then
			if get_platform() == "PC" then
				if get_is_matchmaking() == true then
					mp_popup_open(Mp_lobby_players_data.player_data[idx].handle)
				end
			else
				if get_is_syslink() == false then
					mp_popup_open(Mp_lobby_players_data.player_data[idx].handle)
				end
			end
			
			break
		end
	end
end

-- Highlight
function mp_lobby_players_update_highlight(idir)
	
	local old_physical_line = {}
	local new_physical_line = {}
	
	local old_line = Mp_lobby_players_data.current_line
	
	-- Find old line object
	for idx, val in Mp_lobby_players_data.player_data do
		if Mp_lobby_players_data.player_data[idx].physical_line == Mp_lobby_players_data.current_line then
			old_physical_line.fade_in_anim_h = Mp_lobby_players_data.player_data[idx].fade_in_anim_h
			old_physical_line.fade_out_anim_h = Mp_lobby_players_data.player_data[idx].fade_out_anim_h
			old_physical_line.pulsate_anim_h = Mp_lobby_players_data.player_data[idx].pulsate_anim_h
		end
	end
	
	-- Set new line value
	Mp_lobby_players_data.current_line = Mp_lobby_players_data.current_line + idir
	
	if Mp_lobby_players_data.current_line > Mp_lobby_players_data.num_lines then
		Mp_lobby_players_data.current_line = 1
	elseif Mp_lobby_players_data.current_line < 1 then
		Mp_lobby_players_data.current_line = Mp_lobby_players_data.num_lines
	end	

	-- Find new line object
	for idx, val in Mp_lobby_players_data.player_data do
		if Mp_lobby_players_data.player_data[idx].physical_line == Mp_lobby_players_data.current_line then
			new_physical_line.fade_in_anim_h = Mp_lobby_players_data.player_data[idx].fade_in_anim_h
			new_physical_line.fade_out_anim_h = Mp_lobby_players_data.player_data[idx].fade_out_anim_h
			new_physical_line.pulsate_anim_h = Mp_lobby_players_data.player_data[idx].pulsate_anim_h
		end
	end

	if old_line ~= Mp_lobby_players_data.current_line then
		--Pause all related animations
		vint_set_property(old_physical_line.fade_in_anim_h, "is_paused", true)
		vint_set_property(old_physical_line.fade_out_anim_h, "is_paused", true)
		
		vint_set_property(new_physical_line.fade_in_anim_h, "is_paused", true)
		vint_set_property(new_physical_line.fade_out_anim_h, "is_paused", true)
		
		-- Fade out old highlight
		lua_play_anim(old_physical_line.fade_out_anim_h,0)
	end

	-- Fade in new highlight
	lua_play_anim(new_physical_line.fade_in_anim_h,0)
	lua_play_anim(new_physical_line.pulsate_anim_h,0)

end

function mp_lobby_players_data_update(di_h, event)
	
	local team, name, voip, host, handle, badge_bmp = vint_dataitem_get(di_h)
	local team_old = -1
	local voip_old = -1
	
	-- Save old voip and team values if this is a state change
	if Mp_lobby_players_data.player_data[di_h] ~= nil then
		team_old = Mp_lobby_players_data.player_data[di_h].team
		voip_old = Mp_lobby_players_data.player_data[di_h].voip
	end
	
	if event == "insert" then -- Make a new line
		-- Clone up a new line
		local line_h = vint_object_clone(Mp_lobby_players_data.line_h)
		Mp_lobby_players_data.player_data[di_h] = {team = team, voip = voip, line_h = line_h, handle = handle, physical_line = 0}

		-- Clone all the animations and pause them
		Mp_lobby_players_data.player_data[di_h].pulsate_anim_h = vint_object_clone(Mp_lobby_players_data.pulsate_anim_h)
		vint_set_property(Mp_lobby_players_data.player_data[di_h].pulsate_anim_h, "is_paused", true)
		
		Mp_lobby_players_data.player_data[di_h].fade_in_anim_h = vint_object_clone(Mp_lobby_players_data.fade_in_anim_h)
		vint_set_property(Mp_lobby_players_data.player_data[di_h].fade_in_anim_h, "is_paused", true)
		
		Mp_lobby_players_data.player_data[di_h].fade_out_anim_h = vint_object_clone(Mp_lobby_players_data.fade_out_anim_h)
		vint_set_property(Mp_lobby_players_data.player_data[di_h].fade_out_anim_h, "is_paused", true)
		
		local pause_menu_anim_root_h = vint_object_find("root_animation", nil, PAUSE_MENU_DOC_HANDLE)
		local grp_h = vint_object_find("highlight", Mp_lobby_players_data.player_data[di_h].line_h)
		
		--Re-parent animation 
		vint_object_set_parent(Mp_lobby_players_data.player_data[di_h].pulsate_anim_h, pause_menu_anim_root_h)
		vint_object_set_parent(Mp_lobby_players_data.player_data[di_h].fade_in_anim_h, pause_menu_anim_root_h)
		vint_object_set_parent(Mp_lobby_players_data.player_data[di_h].fade_out_anim_h, pause_menu_anim_root_h)
		
		--Re-target animation
		vint_set_property(Mp_lobby_players_data.player_data[di_h].pulsate_anim_h, "target_handle", vint_object_find("player_pulsate", grp_h))
		vint_set_property(Mp_lobby_players_data.player_data[di_h].fade_in_anim_h, "target_handle", grp_h)
		vint_set_property(Mp_lobby_players_data.player_data[di_h].fade_out_anim_h, "target_handle", grp_h)

		-- Set name text
		vint_set_property(vint_object_find("normal_name", Mp_lobby_players_data.player_data[di_h].line_h), "text_tag", name)
		vint_set_property(vint_object_find("highlight_name", Mp_lobby_players_data.player_data[di_h].line_h), "text_tag", name)
		
		-- Set badge
		local badge_icon_h = vint_object_find("player_badge", Mp_lobby_players_data.player_data[di_h].line_h)
		vint_set_property(badge_icon_h, "image", badge_bmp)
		vint_set_property(badge_icon_h, "scale", 0.6, 0.6)
		
		-- Set team color
		mp_lobby_players_set_team(di_h, host)
		
		-- Set voip icon
		mp_lobby_players_set_voip(di_h)
		
		-- Rebuild the line list
		mp_lobby_players_arrange_lines()
		
	elseif event == "update" then -- Update an existing line
		if Mp_lobby_players_data.player_data[di_h] ~= nil then
		
			-- Update the global variables
			Mp_lobby_players_data.player_data[di_h].team = team
			Mp_lobby_players_data.player_data[di_h].voip = voip
		
			if voip ~= voip_old then -- Update voip icon
				mp_lobby_players_set_voip(di_h)
			end
			
			if host == false then
				if team ~= team_old then -- Update team
					-- Change color
					mp_lobby_players_set_team(di_h, host)
				
					-- Rebuild the line list
					mp_lobby_players_arrange_lines()
				end
			end
		end
		
	elseif event == "remove" then -- Remove existing line
		if Mp_lobby_players_data.player_data[di_h] ~= nil then
		
			-- Destroy the animations
			vint_object_destroy(Mp_lobby_players_data.player_data[di_h].pulsate_anim_h)
			vint_object_destroy(Mp_lobby_players_data.player_data[di_h].fade_in_anim_h)
			vint_object_destroy(Mp_lobby_players_data.player_data[di_h].fade_out_anim_h)
		
			-- Destroy graphics and all variables
			vint_object_destroy(Mp_lobby_players_data.player_data[di_h].line_h)
			Mp_lobby_players_data.player_data[di_h] = nil
			
			-- Fix the rest of the lines
			mp_lobby_players_arrange_lines()
		end
	end
	
end

function mp_lobby_players_set_team(idx, host)
	if Mp_lobby_players_data.player_data[idx] ~= nil then

		if host == true then -- Host, set to yellow
			vint_set_property(vint_object_find("normal_name", Mp_lobby_players_data.player_data[idx].line_h), "tint", 0.9451, 0.8902, 0.004)
		else
			if Mp_lobby_players_data.player_data[idx].team == 0 then -- Blue team
				vint_set_property(vint_object_find("normal_name", Mp_lobby_players_data.player_data[idx].line_h), "tint", 0.0, 0.5, 1.0)
			elseif Mp_lobby_players_data.player_data[idx].team == 1 then -- Red team
				vint_set_property(vint_object_find("normal_name", Mp_lobby_players_data.player_data[idx].line_h), "tint", 0.8, 0.0, 0.0)
			end
		end
	end
end

function mp_lobby_players_set_voip(idx)
	if Mp_lobby_players_data.player_data[idx] ~= nil then
		local voip_speaker = vint_object_find("speaker", Mp_lobby_players_data.player_data[idx].line_h)
		local voip_speaker_on = vint_object_find("sound", Mp_lobby_players_data.player_data[idx].line_h)
		
		if Mp_lobby_players_data.player_data[idx].voip == 0 then -- No voip
			vint_set_property(voip_speaker, "visible", false)
			vint_set_property(voip_speaker_on, "visible", false)
			
		elseif Mp_lobby_players_data.player_data[idx].voip == 1 then -- Plugged in
			vint_set_property(voip_speaker, "visible", true)
			vint_set_property(voip_speaker_on, "visible", false)
			
		elseif Mp_lobby_players_data.player_data[idx].voip == 2 then -- Talking
			vint_set_property(voip_speaker, "visible", true)
			vint_set_property(voip_speaker_on, "visible", true)
		end
	end
end

function mp_lobby_players_arrange_lines()

	local LINE_HEIGHT = 32 -- Distance between lines of text
	local current_line = 0
	local x = 2.0 -- X position of the top option (hard wired to get around some bug)
	local y = 51.0 -- Y position of the top option (hard wired to get around some bug)
	
	 -- Draw all blue team lines
	for idx, val in Mp_lobby_players_data.player_data do
		if Mp_lobby_players_data.player_data[idx].team == 0 then
			
			local new_y = y + (current_line * LINE_HEIGHT)
			vint_set_property(Mp_lobby_players_data.player_data[idx].line_h, "anchor", x, new_y)
			vint_set_property(Mp_lobby_players_data.player_data[idx].line_h, "visible", true)
			
			Mp_lobby_players_data.player_data[idx].physical_line = current_line + 1
			current_line = current_line + 1
		end
	end

	 -- Draw all red team lines
	for idx, val in Mp_lobby_players_data.player_data do
		if Mp_lobby_players_data.player_data[idx].team == 1 then
			
			local new_y = y + (current_line * LINE_HEIGHT)
			vint_set_property(Mp_lobby_players_data.player_data[idx].line_h, "anchor", x, new_y)
			vint_set_property(Mp_lobby_players_data.player_data[idx].line_h, "visible", true)
			
			local text = vint_object_find("text", Mp_lobby_players_data.player_data[idx].line_h)
			local width, height = vint_get_property(text, "screen_size")
			
			Mp_lobby_players_data.player_data[idx].physical_line = current_line + 1
			current_line = current_line + 1
		end
	end
	
	-- Set the number of lines
	Mp_lobby_players_data.num_lines = current_line
	
	-- Clear out the old highlight
	for idx, val in Mp_lobby_players_data.player_data do
		local highlight_h = vint_object_find("highlight", Mp_lobby_players_data.player_data[idx].line_h)
		vint_set_property(Mp_lobby_players_data.player_data[idx].fade_in_anim_h, "is_paused", true)
		vint_set_property(highlight_h, "alpha", 0.0)
	end
	
	-- Draw the new highlight at the top of the list
	Mp_lobby_players_data.current_line = 1
	mp_lobby_players_update_highlight(0)
end