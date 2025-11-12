---- MP Scoreboard

MP_Scoreboard = { handles = { }, cur_idx = 0}
MP_SCOREBOARD_MAX_PLAYERS = 12

-- Initialize and Clean up 
function mp_scoreboard_init()

	local grp_h = vint_object_find("mp_scoreboard")
	vint_set_property(grp_h, "visible", false)	
	
	local line_grp_h = vint_object_find("mp_scoreboard_line", grp_h)
	vint_set_property(line_grp_h, "visible", false)
	
	-- Handles for the column headings
	MP_Scoreboard.handles.headings_sa_h = vint_object_find("headings_sa")
	MP_Scoreboard.handles.headings_gb_h = vint_object_find("headings_gb")
	
	-- Handles for the highlight
	MP_Scoreboard.handles.highlight_h = vint_object_find("mp_scoreboard_highlight")
	MP_Scoreboard.handles.highlight = {}
	MP_Scoreboard.handles.highlight.player_name_h = vint_object_find("player_name",MP_Scoreboard.handles.highlight_h)
	MP_Scoreboard.handles.highlight.column1_h = vint_object_find("column1",MP_Scoreboard.handles.highlight_h)
	MP_Scoreboard.handles.highlight.column2_h = vint_object_find("column2",MP_Scoreboard.handles.highlight_h)
	MP_Scoreboard.handles.highlight.column3_h = vint_object_find("column3",MP_Scoreboard.handles.highlight_h)
	MP_Scoreboard.handles.highlight.column4_h = vint_object_find("column4",MP_Scoreboard.handles.highlight_h)
	
	MP_Scoreboard.handles.highlight.pulsate_h = vint_object_find("scoreboard_pulsate_anim")
	vint_set_property(MP_Scoreboard.handles.highlight.pulsate_h,"is_paused", true)
	
	MP_Scoreboard.handles.highlight.fade_in_h = vint_object_find("scoreboard_highlight_fade_in")
	vint_set_property(MP_Scoreboard.handles.highlight.fade_in_h,"is_paused", true)

	--Set up animation
	MP_Scoreboard.handles.highlight.pulsate_h = vint_object_find("scoreboard_pulsate_anim")
	vint_set_property(MP_Scoreboard.handles.highlight.pulsate_h,"is_paused", true)
	
	MP_Scoreboard.handles.highlight.fade_in_h = vint_object_find("scoreboard_highlight_fade_in")
	vint_set_property(MP_Scoreboard.handles.highlight.fade_in_h,"is_paused", true)
	
	--Re-parent animation 
	vint_object_set_parent(MP_Scoreboard.handles.highlight.pulsate_h, vint_object_find("root_animation", nil, vint_document_find("pause_menu")))
	vint_object_set_parent(MP_Scoreboard.handles.highlight.fade_in_h, vint_object_find("root_animation", nil, vint_document_find("pause_menu")))
	
	--Re-target animation
	vint_set_property(MP_Scoreboard.handles.highlight.pulsate_h, "target_handle", vint_object_find("scoreboard_pulsate", MP_Scoreboard.handles.highlight_h))
	vint_set_property(MP_Scoreboard.handles.highlight.fade_in_h, "target_handle", MP_Scoreboard.handles.highlight_h)
	
	MP_Scoreboard.handles.grp_h = grp_h
	MP_Scoreboard.handles.master_line = line_grp_h
	
	MP_Scoreboard.handles.lines = { }
	MP_Scoreboard.data = { }
	
	for i = 0, MP_SCOREBOARD_MAX_PLAYERS - 1 do 
		MP_Scoreboard.data[i] = { enabled = false }
		MP_Scoreboard.handles.lines[i] = { }
		MP_Scoreboard.handles.lines[i].highlight = { }
		MP_Scoreboard.handles.lines[i].normal = { }

		MP_Scoreboard.handles.lines[i].grp_h = vint_object_clone(line_grp_h)
		
		MP_Scoreboard.handles.lines[i].normal.grp_h = vint_object_find("normal", MP_Scoreboard.handles.lines[i].grp_h)
		
		grp_h = MP_Scoreboard.handles.lines[i].normal.grp_h	
		MP_Scoreboard.handles.lines[i].normal.player_name_h = vint_object_find("player_name", grp_h)
		MP_Scoreboard.handles.lines[i].normal.column1_h = vint_object_find("column1", grp_h)
		MP_Scoreboard.handles.lines[i].normal.column2_h = vint_object_find("column2", grp_h)
		MP_Scoreboard.handles.lines[i].normal.column3_h = vint_object_find("column3", grp_h)
		MP_Scoreboard.handles.lines[i].normal.column4_h = vint_object_find("column4", grp_h)
		
		MP_Scoreboard.handles.lines[i].badge = vint_object_find("player_badge", grp_h)
		MP_Scoreboard.handles.lines[i].speaker_h = vint_object_find("speaker", grp_h)
		MP_Scoreboard.handles.lines[i].sound_h = vint_object_find("sound", grp_h)
		
		if i ~= 0 then
			local x, y = vint_get_property(MP_Scoreboard.handles.lines[i - 1].grp_h, "anchor")
			local w, h = element_get_actual_size(MP_Scoreboard.handles.lines[i - 1].normal.player_name_h)
			
			vint_set_property(MP_Scoreboard.handles.lines[i].grp_h, "anchor", x, y + h + 1)		
		end
	end

	if vint_document_find("pause_menu") ~= 0 then
		mp_scoreboard_pause_menu_show()
	else
		mp_scoreboard_completion_show()
	end
end

function mp_scoreboard_pause_menu_show()

	vint_datagroup_add_subscription("mp_scoreboard_data_group", "insert", "mp_scoreboard_populate")
	vint_datagroup_add_subscription("mp_scoreboard_data_group", "remove", "mp_scoreboard_populate")
	vint_datagroup_add_subscription("mp_scoreboard_data_group", "update", "mp_scoreboard_populate")
	
	MP_Scoreboard.input_subs = {
		vint_subscribe_to_input_event(nil, "nav_up",		"mp_scoreboard_nav_up", 50),
		vint_subscribe_to_input_event(nil, "nav_down", 	"mp_scoreboard_nav_down", 50),
		vint_subscribe_to_input_event(nil, "select",		"mp_scoreboard_select", 50)
	}	
	
	lua_play_anim(MP_Scoreboard.handles.highlight.pulsate_h, 0)
	mp_scoreboard_update_highlight(-1)
end

function mp_scoreboard_completion_show()
	
end

function mp_scoreboard_cleanup()
	for i = 0, MP_SCOREBOARD_MAX_PLAYERS - 1 do 
		vint_object_destroy(MP_Scoreboard.handles.lines[i].grp_h)
	end
	
	vint_set_property(MP_Scoreboard.handles.grp_h, "visible", true)	
	vint_object_destroy(MP_Scoreboard.handles.grp_h)
	
	-- Kill the player info popup
	if vint_document_find("mp_player_info_popup") ~= nil then
		vint_document_unload(vint_document_find("mp_player_info_popup"))
	end

	for idx, val in MP_Scoreboard.input_subs do
		vint_unsubscribe_to_input_event(val)
	end

	vint_datagroup_remove_subscription("mp_scoreboard_data_group", "insert", "mp_scoreboard_populate")
	vint_datagroup_remove_subscription("mp_scoreboard_data_group", "remove", "mp_scoreboard_populate")
	vint_datagroup_remove_subscription("mp_scoreboard_data_group", "update", "mp_scoreboard_populate")
	
	MP_Scoreboard.input_subs = { }
end

-- Input
function mp_scoreboard_nav_up()
	local old_idx = MP_Scoreboard.cur_idx
	MP_Scoreboard.cur_idx = MP_Scoreboard.cur_idx - 1
	audio_play(Menu_sound_item_nav)
	
	if MP_Scoreboard.cur_idx < 0 then
		for i = 0, MP_SCOREBOARD_MAX_PLAYERS - 1 do
			if MP_Scoreboard.data[i].enabled == true then
				MP_Scoreboard.cur_idx = i
			end
		end
	end

	mp_scoreboard_update_highlight(old_idx)
end

function mp_scoreboard_nav_down()
	local old_idx = MP_Scoreboard.cur_idx
	MP_Scoreboard.cur_idx = MP_Scoreboard.cur_idx + 1
	audio_play(Menu_sound_item_nav)
	
	if MP_Scoreboard.cur_idx >= MP_SCOREBOARD_MAX_PLAYERS then
		MP_Scoreboard.cur_idx = 0
	elseif MP_Scoreboard.data[MP_Scoreboard.cur_idx].enabled ~= true then
		MP_Scoreboard.cur_idx = 0
	end
	
	mp_scoreboard_update_highlight(old_idx)
end

function mp_scoreboard_select()
	if get_is_syslink() == false then
		mp_popup_open(MP_Scoreboard.data[MP_Scoreboard.cur_idx].handle)
	end
end

-- Highlight
function mp_scoreboard_update_highlight(old_idx)
	if old_idx == MP_Scoreboard.cur_idx then
		return
	end

	-- Hide the highlight
	vint_set_property(MP_Scoreboard.handles.highlight.fade_in_h,"is_paused", true)
	vint_set_property(MP_Scoreboard.handles.highlight_h, "alpha", 0.0)
	
	-- Update the text
	mp_scoreboard_highlight_text()
	
	-- Move the highlight and animate it in
	local x, y = vint_get_property(MP_Scoreboard.handles.lines[MP_Scoreboard.cur_idx].grp_h, "anchor")
	vint_set_property(MP_Scoreboard.handles.highlight_h, "anchor", x, y)
	lua_play_anim(MP_Scoreboard.handles.highlight.fade_in_h,0)
end

function mp_scoreboard_highlight_text()

	if MP_Scoreboard.data[MP_Scoreboard.cur_idx].suicides == nil then
		-- Make sure the data is clear, this is usually only gonna happen when the screen starts up
		vint_set_property(MP_Scoreboard.handles.highlight.player_name_h, "text_tag", " ")
		vint_set_property(MP_Scoreboard.handles.highlight.column1_h, "text_tag", " ")
		vint_set_property(MP_Scoreboard.handles.highlight.column2_h, "text_tag", " ")
		vint_set_property(MP_Scoreboard.handles.highlight.column3_h, "text_tag", " ")
		vint_set_property(MP_Scoreboard.handles.highlight.column4_h, "text_tag", " ")
	else
		-- Show the data
		vint_set_property(MP_Scoreboard.handles.highlight.player_name_h, "text_tag", MP_Scoreboard.data[MP_Scoreboard.cur_idx].player_name)
	
		-- Format according to game mode
		if MP_Scoreboard.data[MP_Scoreboard.cur_idx].suicides == -1 then
			vint_set_property(MP_Scoreboard.handles.highlight.column1_h, "text_tag", " ")
			vint_set_property(MP_Scoreboard.handles.highlight.column2_h, "text_tag", "$" .. format_cash(MP_Scoreboard.data[MP_Scoreboard.cur_idx].score))
			vint_set_property(MP_Scoreboard.handles.highlight.column3_h, "text_tag", format_cash(MP_Scoreboard.data[MP_Scoreboard.cur_idx].kills))
			vint_set_property(MP_Scoreboard.handles.highlight.column4_h, "text_tag", format_cash(MP_Scoreboard.data[MP_Scoreboard.cur_idx].deaths))
		else
			vint_set_property(MP_Scoreboard.handles.highlight.column1_h, "text_tag", format_cash(MP_Scoreboard.data[MP_Scoreboard.cur_idx].score))
			vint_set_property(MP_Scoreboard.handles.highlight.column2_h, "text_tag", format_cash(MP_Scoreboard.data[MP_Scoreboard.cur_idx].kills))
			vint_set_property(MP_Scoreboard.handles.highlight.column3_h, "text_tag", format_cash(MP_Scoreboard.data[MP_Scoreboard.cur_idx].deaths))
			vint_set_property(MP_Scoreboard.handles.highlight.column4_h, "text_tag", format_cash(MP_Scoreboard.data[MP_Scoreboard.cur_idx].suicides))
		end	
	end
end

-- Data
function mp_scoreboard_populate(di_h, event)
	local player_index, enabled, voice, player_name, score, kills, deaths, suicides, host, player_team, image, handle = vint_dataitem_get(di_h)
	MP_Scoreboard.data[player_index] = { player_name = player_name, enabled = enabled, score = score, kills = kills, handle = handle,
										 suicides = suicides, deaths = deaths, player_team = player_team, voice = voice, host = host, badge_image = image }

	-- Update the labels
	mp_scoreboard_update_labels(event)
end

function mp_scoreboard_update_labels(event)
	for player_index = 0, MP_SCOREBOARD_MAX_PLAYERS - 1 do
		if MP_Scoreboard.data[player_index].enabled == false then
			vint_set_property(MP_Scoreboard.handles.lines[player_index].grp_h, "visible", false)
		else
		
			-- Format all the data for the game type
			if MP_Scoreboard.data[player_index].suicides == -1 then
				vint_set_property(MP_Scoreboard.handles.headings_sa_h, "visible", true)
				vint_set_property(MP_Scoreboard.handles.lines[player_index].normal.column1_h, "text_tag", " ")
				vint_set_property(MP_Scoreboard.handles.lines[player_index].normal.column2_h, "text_tag", "$" .. format_cash(MP_Scoreboard.data[player_index].score))
				vint_set_property(MP_Scoreboard.handles.lines[player_index].normal.column3_h, "text_tag", format_cash(MP_Scoreboard.data[player_index].kills))
				vint_set_property(MP_Scoreboard.handles.lines[player_index].normal.column4_h, "text_tag", format_cash(MP_Scoreboard.data[player_index].deaths))
			else
				vint_set_property(MP_Scoreboard.handles.headings_gb_h, "visible", true)
				vint_set_property(MP_Scoreboard.handles.lines[player_index].normal.column1_h, "text_tag", format_cash(MP_Scoreboard.data[player_index].score))
				vint_set_property(MP_Scoreboard.handles.lines[player_index].normal.column2_h, "text_tag", format_cash(MP_Scoreboard.data[player_index].kills))
				vint_set_property(MP_Scoreboard.handles.lines[player_index].normal.column3_h, "text_tag", format_cash(MP_Scoreboard.data[player_index].deaths))
				vint_set_property(MP_Scoreboard.handles.lines[player_index].normal.column4_h, "text_tag", format_cash(MP_Scoreboard.data[player_index].suicides))
			end
			
			vint_set_property(MP_Scoreboard.handles.lines[player_index].normal.player_name_h, "text_tag", MP_Scoreboard.data[player_index].player_name)
			vint_set_property(MP_Scoreboard.handles.lines[player_index].badge, "image", MP_Scoreboard.data[player_index].badge_image)
			vint_set_property(MP_Scoreboard.handles.lines[player_index].grp_h, "visible", true)
			vint_set_property(MP_Scoreboard.handles.lines[player_index].normal.grp_h, "visible", true)

			if MP_Scoreboard.data[player_index].voice == 0 then
				vint_set_property(MP_Scoreboard.handles.lines[player_index].speaker_h, "visible", false)
			elseif MP_Scoreboard.data[player_index].voice == 1 then
				vint_set_property(MP_Scoreboard.handles.lines[player_index].speaker_h, "visible", true)
				vint_set_property(MP_Scoreboard.handles.lines[player_index].speaker_h, "image", "mp_speaker_off")
			elseif MP_Scoreboard.data[player_index].voice == 2 then
				vint_set_property(MP_Scoreboard.handles.lines[player_index].speaker_h, "visible", true)
				vint_set_property(MP_Scoreboard.handles.lines[player_index].speaker_h, "image", "mp_speaker_on")
			end
			
			if MP_Scoreboard.data[player_index].player_team == true then
				-- color the name blue
				vint_set_property(MP_Scoreboard.handles.lines[player_index].normal.player_name_h, "tint", .27, .51, .84)
			else
				-- color the name red
				vint_set_property(MP_Scoreboard.handles.lines[player_index].normal.player_name_h, "tint", .71, 0, 0)
			end
			
			-- Fixed the highlight
			if event == "Remove" then
				-- Update the highlight position
				mp_scoreboard_update_highlight(-1)
			else
				-- Update the highlight text
				mp_scoreboard_highlight_text()
			end
		end
	end
end
