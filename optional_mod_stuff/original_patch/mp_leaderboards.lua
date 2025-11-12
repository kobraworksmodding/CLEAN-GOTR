-- Variable section
Mp_leaderboards_data = {
	handles = {
					buttons = {},
					button_shine = {},
					button_fade_in = {},
					button_fade_out = {},
					},
	input_subscriptions = {},
	current_tab = 1,
	is_360 = false,
}

Mp_leaderboards_colors = {
	yellow = { r = 229/255, g = 191/255, b = 13/255}
}

-- Init and cleanup functions
function mp_leaderboards_init()

	-- Set up object handles
	Mp_leaderboards_data.handles.tab_group_h = vint_object_find("tab_group")
	Mp_leaderboards_data.handles.tab_text_h = vint_object_find("tab_text")
	Mp_leaderboards_data.handles.stat_headings_h = vint_object_find("stat_headings")
	Mp_leaderboards_data.handles.user_row_h = vint_object_find("user_row")
	Mp_leaderboards_data.handles.spreadsheet_row_h = vint_object_find("spreadsheet_row")
	Mp_leaderboards_data.heading_stat1_h = vint_object_find("heading_stat1")
	Mp_leaderboards_data.heading_stat2_h = vint_object_find("heading_stat2")
	Mp_leaderboards_data.heading_stat3_h = vint_object_find("heading_stat3")
	Mp_leaderboards_data.scroll_group_h = vint_object_find("scroll_group")
	Mp_leaderboards_data.scroll_bar_h = vint_object_find("scroll_bar")
	
	-- Set player name tab
	if get_platform() == "XBOX360" then
		Mp_leaderboards_data.is_360 = true
		Mp_leaderboards_btn_tips.x_button = { label = "CONTROL_SELECT", enabled = mp_leaderboards_btn_x_is_active}
		vint_set_property(vint_object_find("heading_player"), "text_tag", "MP_LB_GAMERTAG")
	end
	
	-- Set up animation handles
	Mp_leaderboards_data.handles.tab_slide_h = vint_object_find("tab_slide")
	vint_set_property(Mp_leaderboards_data.handles.tab_slide_h, "is_paused", true)
	
	Mp_leaderboards_data.handles.highlight_shine_anim_h = vint_object_find("highlight_shine_anim")
	vint_set_property(Mp_leaderboards_data.handles.highlight_shine_anim_h, "is_paused", true)
	
	Mp_leaderboards_data.handles.columns_fade_h = vint_object_find("columns_fade")
	vint_set_property(Mp_leaderboards_data.handles.columns_fade_h, "is_paused", true)

	Mp_leaderboards_data.visible_row = {}
	Mp_leaderboards_data.current_tab = 1
	
	local left_trigger_h = vint_object_find("left_trigger")
	vint_set_property(left_trigger_h, "image", get_left_trigger())
	local right_trigger_h = vint_object_find("right_trigger")
	vint_set_property(right_trigger_h, "image", get_right_trigger())
	
	Mp_leaderboards_data.top100 = true
	Mp_leaderboards_data.num_tabs = 0
	Mp_leaderboards_data.current_column = 3
	Mp_leaderboards_data.can_move = true
	
	-- All the data for the tab columns and headings
	Mp_leaderboards_data.tabs = {	[1] =	{ 	title = "MULTI_MODE_13", -- Gangsta Brawl
														column_1 = "MP_STATS_WINS", -- Wins
														column_2 = "MP_STATS_LOSSES", -- Losses
														column_3 = "+/-", -- +/-
														num_columns = 0,
														data = {[3] = "MP_GB"},
														conversion = mp_leaderboards_format_commas,
														default_column = 3,
														show_badge = true,
													},
											
											[2] =	{ 	title = "MULTI_MODE_14",  -- Team Gangsta Brawl
														column_1 = "MP_STATS_WINS", -- Wins
														column_2 = "MP_STATS_LOSSES", -- Losses
														column_3 = "+/-", -- +/-
														num_columns = 0,
														data = {[3] = "MP_TGB"},
														conversion = mp_leaderboards_format_commas,
														default_column = 3,
														show_badge = true,
													},
													
											[3] =	{	title = "MULTI_MODE_STRONGARM", -- Strong Arm
														column_1 = "MP_STATS_WINS", -- Wins
														column_2 = "MP_STATS_LOSSES", -- Losses
														column_3 = "+/-", -- +/-
														num_columns = 0,
														data = {[3] = "MP_SA"},
														conversion = mp_leaderboards_format_commas,
														default_column = 3,
														show_badge = true,
													},
											
											[4] =	{ 	title = "MP_LB_MP_KILLS", -- Multiplayer Kills
														column_1 = "STAT_MP_KILLS", -- Kills
														column_2 = "STAT_MP_DEATHS", -- Deaths
														column_3 = "+/-", -- +/-
														num_columns = 0,
														data = {[3] = "MP_KILLS"},
														conversion = mp_leaderboards_format_commas,
														default_column = 3,
														show_badge = true,
													},
											
											[5] =	{ 	title = "LEADERBOARDS_MP_EARNINGS", -- Multiplayer Earnings
														column_1 = "ACT_VANDAL_SUMMARY_TOTAL", -- Total
														num_columns = 0,
														data = {[1] = "MP_MONEY"},
														conversion = mp_leaderboards_format_money,
														default_column = 1,
														show_badge = true,
													},
											
											[6] =	{ 	title = "MULTI_LOBBY_GAME_TIME", -- Game Time
														column_1 = "LEADERBOARDS_SP", -- Single Player
														column_2 = "MULTI_MODE_17", -- Co-op
														num_columns = 2,
														data = "SP_TIME",
														data = {[1] = "SP_COL1_TIME", [2] = "SP_COL2_TIME"},
														conversion = mp_leaderboards_format_time,
														default_column = 1,
														show_badge = false,
													},
											
											[7] =	{ 	title = "MULTI_MODE_17", -- Co-op
														column_1 = "STAT_MP_KILLS", -- Kills
														num_columns = 0,
														data = {[1] = "SP_COL1_COOP"},
														conversion = mp_leaderboards_format_commas,
														default_column = 1,
														show_badge = false,
													},
											
											[8] =	{ 	title = "MP_Leaderboard_Diversion_Stars", -- Diversion Stars
														column_1 = "DIVERSION_SURVIVAL_GOAL_NAME_GOLD", -- Gold
														column_2 = "DIVERSION_SURVIVAL_GOAL_NAME_SILVER", -- Silver
														column_3 = "DIVERSION_SURVIVAL_GOAL_NAME_BRONZE", -- Bronze
														num_columns = 3,
														data = {[1] = "SP_COL1_DIVERSIONS", [2] = "SP_COL2_DIVERSIONS", [3] = "SP_COL3_DIVERSIONS"},
														conversion = mp_leaderboards_format_commas,
														default_column = 1,
														show_badge = false,
													},
											[9]=	{ 	title = "KILLING_SPREE", -- Killing Spree
														column_1 = "MP_GANGS_STATS_GANG", -- Gang
														column_2 = "MULTI_TAG_NAME_POLICE", -- Police
														column_3 = "MP_Leaderboard_Ped", -- Ped
														num_columns = 3,
														data = {[1] = "SP_COL1_KILLS", [2] = "SP_COL2_KILLS", [3] = "SP_COL3_KILLS"},
														conversion = mp_leaderboards_format_commas,
														default_column = 1,
														show_badge = false,
													},
													
											[10] =	{ 	title = "MP_Leaderboard_Max_Notoriety", -- Max Notoriety
														column_1 = "MP_GANGS_STATS_GANG", -- Gang
														column_2 = "MULTI_TAG_NAME_POLICE", -- Police
														num_columns = 2,
														data = {[1] = "SP_COL1_MAX_NOTORIETY", [2] = "SP_COL2_MAX_NOTORIETY"},
														conversion = mp_leaderboards_format_time,
														default_column = 1,
														show_badge = false,
													},
											
											[11]=	{ 	title = "MP_Leaderboard_Vehicle_Jumping", -- Vehicle Jumping
														column_1 = "MP_Leaderboard_Distance", -- Distance
														column_2 = "MP_Leaderboard_Height", -- Height
														column_3 = "MP_Leaderboard_Spin", -- Spin
														num_columns = 3,
														data = {[1] = "SP_COL1_JUMPS", [2] = "SP_COL2_JUMPS", [3] = "SP_COL3_JUMPS"},
														conversion = mp_leaderboards_format_distance,
														default_column = 1,
														show_badge = false,
													},
											
											[12]=	{ 	title = "DIVERSION_COMBAT_TRICKS_THROWING", -- Throwing
														column_1 = "MP_Leaderboard_Distance", -- Distance
														num_columns = 0,
														data = {[1] = "SP_THROW_DISTANCE"},
														conversion = mp_leaderboards_format_distance,
														default_column = 1,
														show_badge = false,
													},
										}
	
	local tab_divider = 20
	local tab_left_placer = 0
	
	for idx, val in Mp_leaderboards_data.tabs do
		-- Make a  clone of the tab heading
		Mp_leaderboards_data.tabs[idx].heading_h = vint_object_clone(Mp_leaderboards_data.handles.tab_text_h)
		
		-- Put the title name in the tab
		vint_set_property(Mp_leaderboards_data.tabs[idx].heading_h, "text_tag", Mp_leaderboards_data.tabs[idx].title)
		
		-- Get the size of the tab
		local x_size, y_size, x_anchor, y_anchor
		x_size, y_size = element_get_actual_size(Mp_leaderboards_data.tabs[idx].heading_h)
		Mp_leaderboards_data.tabs[idx].center = tab_left_placer + x_size/2
	
		-- Move the tab to the end of the list
		x_anchor, y_anchor = vint_get_property(Mp_leaderboards_data.tabs[idx].heading_h, "anchor")
		vint_set_property(Mp_leaderboards_data.tabs[idx].heading_h, "anchor", tab_left_placer, y_anchor)
		vint_set_property(Mp_leaderboards_data.tabs[idx].heading_h, "visible", true)
		
		-- Save the full size of the whole list of tabs
		Mp_leaderboards_data.tab_range = tab_left_placer + x_size
		
		-- Set up the positioning for the next space
		tab_left_placer = tab_left_placer + x_size + tab_divider
		Mp_leaderboards_data.num_tabs = Mp_leaderboards_data.num_tabs + 1
	end
	
	--Subscribe to input
	Mp_leaderboards_data.input_subscriptions = {	
		vint_subscribe_to_input_event(nil, "nav_up",				"mp_leaderboards_input", 50),
		vint_subscribe_to_input_event(nil, "nav_down",			"mp_leaderboards_input", 50),
		vint_subscribe_to_input_event(nil, "nav_left",			"mp_leaderboards_input", 50),
		vint_subscribe_to_input_event(nil, "nav_right",			"mp_leaderboards_input", 50),
		vint_subscribe_to_input_event(nil, "scroll_left",		"mp_leaderboards_input", 50),
		vint_subscribe_to_input_event(nil, "scroll_right",		"mp_leaderboards_input", 50),
		vint_subscribe_to_input_event(nil, "select",				"mp_leaderboards_input", 50),
		vint_subscribe_to_input_event(nil, "back",				"mp_leaderboards_input", 50),
		vint_subscribe_to_input_event(nil, "alt_select",		"mp_leaderboards_input", 50),
		vint_subscribe_to_input_event(nil, "exit",				"mp_leaderboards_input", 50),
		vint_subscribe_to_input_event(nil, "map",					"mp_leaderboards_input", 50),
		vint_subscribe_to_input_event(nil, "pause",				"mp_leaderboards_input", 50),
	}
	
	-- Start first spreadsheet lookup
	mp_leaderboards_change_spreadsheet(0)
	
	--Hijack button tips from previous menu
	if vint_document_find("main_menu") ~= 0 then
		--Hide previous menu
		vint_set_property(Menu_option_labels.frame, "visible", false)
		
		--Set button tips previous menu and update tips
		Menu_active.btn_tips = Mp_leaderboards_btn_tips
		mp_leaderboards_update_btn_tips()
	end
end

function mp_leaderboards_cleanup()

	-- Blow away all the objects and animations
	for idx, val in Mp_leaderboards_data.visible_row do
		vint_object_destroy(Mp_leaderboards_data.visible_row[idx].pulsate)
		vint_object_destroy(Mp_leaderboards_data.visible_row[idx].line_h)
	end
	
	-- Blow away all the data
	for idx, val in Mp_leaderboards_data.list_data do
		Mp_leaderboards_data.list_data[idx] = nil
	end
	
	-- Kill subscriptions
	for idx, val in Mp_leaderboards_data.input_subscriptions do
		vint_unsubscribe_to_input_event(idx)
	end
	Mp_leaderboards_data.input_subscriptions = nil
	
	
	--Show button tips on main menu
	if vint_document_find("main_menu") ~= 0 and Menu_active ~= 0 then
		--reset button tips
		Menu_active.btn_tips = nil
		btn_tips_update()
		vint_set_property(Menu_option_labels.frame, "visible", true)
	end	
end

function mp_leaderboards_input(target, event, accelleration)

	-- Make sure button presses are ok first
	if Mp_leaderboards_data.can_move == true then
	
		if event == "nav_up" then
			-- Up button pressed
			audio_play(Menu_sound_item_nav)
			mp_leaderboards_change_row(-1)
			
		elseif event == "nav_down" then
			-- Down button presses
			audio_play(Menu_sound_item_nav)
			mp_leaderboards_change_row(1)
			
		elseif event == "scroll_left" then
			-- Left button pressed
			audio_play(Menu_sound_scroll)
			mp_leaderboards_change_spreadsheet(-1)
			
		elseif event == "scroll_right" then
			-- Right button presses
			audio_play(Menu_sound_scroll)
			mp_leaderboards_change_spreadsheet(1)
			
		elseif event == "nav_left" then
			-- Resort
			if Mp_leaderboards_data.tabs[Mp_leaderboards_data.current_tab].num_columns > 1 then
				audio_play(Menu_sound_value_nav)
				mp_leaderboards_change_column(-1)
			end
			
		elseif event == "nav_right" then
			-- Resort
			if Mp_leaderboards_data.tabs[Mp_leaderboards_data.current_tab].num_columns > 1 then
				audio_play(Menu_sound_value_nav)
				mp_leaderboards_change_column(1)
			end
			
		elseif event == "select" then
			if Mp_leaderboards_data.list_data[Mp_leaderboards_data.current_virtual_row] ~= nil then
				-- Bring up player info
				mp_popup_open(Mp_leaderboards_data.list_data[Mp_leaderboards_data.current_virtual_row].index, 2)
			end
			
		elseif event == "back" then
			-- Animate out
			vint_document_unload(vint_document_find("mp_leaderboards"))
			audio_play(Menu_sound_back)
			menu_input_block(false)
		
		elseif event == "alt_select" then
			if Mp_leaderboards_data.is_360 then
				-- Toggle friends
				if Mp_leaderboards_data.top100 then
					Mp_leaderboards_data.top100 = false
				else
					Mp_leaderboards_data.top100 = true
				end
				audio_play(Menu_sound_select)
				
				--Update hints
				mp_leaderboards_update_btn_tips()

				-- Refresh the leaderboard
				thread_new("mp_leaderboards_refresh_data")
			end
		
		elseif event == "exit" then
			-- Do nothing, just block menu base from seeing this
		end
	end
end

function mp_leaderboards_cleanup_hints()
	local bx = 17
	local gap = 36
	
	-- Clean up their positions (lots of nasty magic numbers here because I copy/pasted it - jhg)
	local t1a, t1b = vint_get_property(Mp_leaderboards_data.handles.A_text_h, "anchor")
	local t1x, t1y = element_get_actual_size(Mp_leaderboards_data.handles.A_text_h)
	vint_set_property(Mp_leaderboards_data.handles.X_btn_h, "anchor", t1a + t1x + gap, 498.0)
	
	local b2a, b2b = vint_get_property(Mp_leaderboards_data.handles.X_btn_h, "anchor")
	vint_set_property(Mp_leaderboards_data.handles.X_text_h, "anchor", bx + b2a + 16, t1b)
	
	local t2x, t2y = element_get_actual_size(Mp_leaderboards_data.handles.X_text_h)
	local t2a, t2b = vint_get_property(Mp_leaderboards_data.handles.X_text_h, "anchor")
	vint_set_property(Mp_leaderboards_data.handles.B_btn_h, "anchor", t2a + t2x + gap, 498.0)	

	local b3a, b3b = vint_get_property(Mp_leaderboards_data.handles.B_btn_h, "anchor")
	vint_set_property(Mp_leaderboards_data.handles.B_text_h, "anchor", b3a + bx + 16, t1b)
	
end

function mp_leaderboards_change_spreadsheet(idir)

	-- Set up new tab index
	Mp_leaderboards_data.current_tab = Mp_leaderboards_data.current_tab + idir
	
	-- Wrap index if necessary
	if Mp_leaderboards_data.current_tab < 1 then
		Mp_leaderboards_data.current_tab = Mp_leaderboards_data.num_tabs
		
	elseif Mp_leaderboards_data.current_tab > Mp_leaderboards_data.num_tabs then
		Mp_leaderboards_data.current_tab = 1
	end

	-- Blank out colors on all tabs
	for idx, val in Mp_leaderboards_data.tabs do
		local clear_tab = Mp_leaderboards_data.tabs[idx].heading_h
		vint_set_property(clear_tab, "tint",95/255,95/255,95/255)
	end
	
	-- Make new tab yellow
	local new_tab_h = Mp_leaderboards_data.tabs[Mp_leaderboards_data.current_tab].heading_h
	vint_set_property(new_tab_h, "tint", Mp_leaderboards_colors.yellow.r, Mp_leaderboards_colors.yellow.g, Mp_leaderboards_colors.yellow.b)

	-- Set up animation to move the tabs
	local tab_tween_h = vint_object_find("tab_text_translate",Mp_leaderboards_data.handles.tab_slide_h)
	local x, y = vint_get_property(Mp_leaderboards_data.handles.tab_group_h,"anchor")
	vint_set_property(tab_tween_h, "start_value", x, 0.0)
	vint_set_property(Mp_leaderboards_data.handles.stat_headings_h, "alpha", 0.0)
	
	if Mp_leaderboards_data.num_tabs == 0 then
		debug_print("vint", "Should not be changing the spreadsheet when there are no tabs set!\n")
	else
		local frame_size = vint_get_property(vint_object_find("tab_clip"),"clip_size")
		frame_size = frame_size - 4 -- Safety buffer to make sure we don't accidentally cut the edges of any text
		local destination = 0
		
		-- Are we already showing all options to the left?
		if Mp_leaderboards_data.tabs[Mp_leaderboards_data.current_tab].center < frame_size/2 then
			destination = 0
		-- Are we already showing all options to the right?
		elseif Mp_leaderboards_data.tabs[Mp_leaderboards_data.current_tab].center > Mp_leaderboards_data.tab_range - frame_size/2 then
			destination = - Mp_leaderboards_data.tab_range + frame_size
		-- We're somewhere in the middle, just peg the current selection in the center
		else
			destination = - Mp_leaderboards_data.tabs[Mp_leaderboards_data.current_tab].center + frame_size/2
		end

		vint_set_property(tab_tween_h, "end_value", destination, 0.0)
	end
	
	-- Move the tabs
	lua_play_anim(Mp_leaderboards_data.handles.tab_slide_h,0)
	lua_play_anim(Mp_leaderboards_data.handles.columns_fade_h,0)
	
	-- Set the column texts
	local heading_1 = Mp_leaderboards_data.tabs[Mp_leaderboards_data.current_tab].column_1
	local heading_2 = Mp_leaderboards_data.tabs[Mp_leaderboards_data.current_tab].column_2
	local heading_3 = Mp_leaderboards_data.tabs[Mp_leaderboards_data.current_tab].column_3
	
	if heading_2 == nil then
		heading_2 = " "
	end
	
	if heading_3 == nil then
		heading_3 = " "
	end
	
	vint_set_property(Mp_leaderboards_data.heading_stat1_h, "text_tag", heading_1)
	vint_set_property(Mp_leaderboards_data.heading_stat2_h, "text_tag", heading_2)
	vint_set_property(Mp_leaderboards_data.heading_stat3_h, "text_tag", heading_3)

	-- Zero out the spreadsheet cursors
	Mp_leaderboards_data.current_virtual_row = 1
	Mp_leaderboards_data.current_column = Mp_leaderboards_data.tabs[Mp_leaderboards_data.current_tab].default_column
	
	-- Refresh the column (which automatically refreshes the spreadsheet)
	mp_leaderboards_change_column(0)
end

function mp_leaderboards_change_row(idir)

	-- Set up virtual row
	Mp_leaderboards_data.current_virtual_row = Mp_leaderboards_data.current_virtual_row + idir
	
	-- Wrap virtual row
	if Mp_leaderboards_data.current_virtual_row < 1 then
		Mp_leaderboards_data.current_virtual_row = Mp_leaderboards_data.num_virtual_rows
	elseif Mp_leaderboards_data.current_virtual_row > Mp_leaderboards_data.num_virtual_rows then
		Mp_leaderboards_data.current_virtual_row = 1
	end
	
	-- Set up visible row
	if Mp_leaderboards_data.num_virtual_rows > 10 then

		-- If we're at the top of the list, clamp things down and move the highlight toward the top
		if Mp_leaderboards_data.current_virtual_row <= 5 then
			Mp_leaderboards_data.top_virtual_row = 1
			Mp_leaderboards_data.current_visible_row = Mp_leaderboards_data.current_virtual_row
			
		-- If we're at the bottom of the list, clamp things and move the highlight toward the bottom
		elseif Mp_leaderboards_data.current_virtual_row > Mp_leaderboards_data.num_virtual_rows - 5 then
			Mp_leaderboards_data.top_virtual_row = Mp_leaderboards_data.num_virtual_rows - 9
			Mp_leaderboards_data.current_visible_row = Mp_leaderboards_data.current_virtual_row - Mp_leaderboards_data.num_virtual_rows + 10
			
		-- We're scrolling somewhere in the middle, clamp the highlight and move the virtual list around it
		else
			Mp_leaderboards_data.top_virtual_row = Mp_leaderboards_data.current_virtual_row - 4
			Mp_leaderboards_data.current_visible_row = 5
		end
		
		-- Redraw the row text
		mp_leaderboards_redraw_rows()
	
	else
		-- No chance of scrolling, so just modify the highlight
		Mp_leaderboards_data.current_visible_row = Mp_leaderboards_data.current_virtual_row
	end
	
	-- Draw in the highlight
	for i = 1, Mp_leaderboards_data.num_visible_rows do
		if i == Mp_leaderboards_data.current_visible_row then
			vint_set_property(Mp_leaderboards_data.visible_row[i].highlight_h, "visible", true)
		else
			vint_set_property(Mp_leaderboards_data.visible_row[i].highlight_h, "visible", false)
		end
	end
	
end

function mp_leaderboards_change_column(idir)

	local num_columns = Mp_leaderboards_data.tabs[Mp_leaderboards_data.current_tab].num_columns

	-- Blank out old column
	vint_set_property(Mp_leaderboards_data.heading_stat1_h, "tint",160/255,160/255,160/255)
	vint_set_property(Mp_leaderboards_data.heading_stat2_h, "tint",160/255,160/255,160/255)
	vint_set_property(Mp_leaderboards_data.heading_stat3_h, "tint",160/255,160/255,160/255)
	
	if num_columns ~= 0 then
		-- Set up new column index
		Mp_leaderboards_data.current_column = Mp_leaderboards_data.current_column + idir
		
		-- Wrap if necessary
		if Mp_leaderboards_data.current_column < 1 then
			Mp_leaderboards_data.current_column = num_columns
		elseif Mp_leaderboards_data.current_column > num_columns then
			Mp_leaderboards_data.current_column = 1
		end
		
		-- Color in new column
		if Mp_leaderboards_data.current_column == 1 then
			vint_set_property(Mp_leaderboards_data.heading_stat1_h, "tint", Mp_leaderboards_colors.yellow.r, Mp_leaderboards_colors.yellow.g, Mp_leaderboards_colors.yellow.b)
		elseif Mp_leaderboards_data.current_column == 2 then
			vint_set_property(Mp_leaderboards_data.heading_stat2_h, "tint", Mp_leaderboards_colors.yellow.r, Mp_leaderboards_colors.yellow.g, Mp_leaderboards_colors.yellow.b)
		elseif Mp_leaderboards_data.current_column == 3 then
			vint_set_property(Mp_leaderboards_data.heading_stat3_h, "tint", Mp_leaderboards_colors.yellow.r, Mp_leaderboards_colors.yellow.g, Mp_leaderboards_colors.yellow.b)
		end
	end
	
	-- Refresh all the stuff inside the spreadsheet
	thread_new("mp_leaderboards_refresh_data")
end

function mp_leaderboards_new_record(rank, badge, name, stat1, stat2, stat3, is_friend, is_player, index)

	-- Increment the virtual row
	local i = Mp_leaderboards_data.num_virtual_rows + 1
	
	-- Format the values (commas, $, distance)
	stat1 = Mp_leaderboards_data.tabs[Mp_leaderboards_data.current_tab].conversion(stat1)
	
	if stat2 ~= nil then
		stat2 = Mp_leaderboards_data.tabs[Mp_leaderboards_data.current_tab].conversion(stat2)
	else
		stat2 = " "
	end
	
	-- HACK TO ADD ° TO SPINS
	if Mp_leaderboards_data.current_tab == 11 then
		stat3 = stat3 .. "°"
	else
	
		-- END HACK
		if stat3 ~= nil then
			stat3 = Mp_leaderboards_data.tabs[Mp_leaderboards_data.current_tab].conversion(stat3)
		else
			stat3 = " "
		end
	end
	
	-- Format data
	local d = {
		rank = rank,
		badge = badge,
		name = name,
		stat1 = stat1,
		stat2 = stat2,
		stat3 = stat3,
		is_friend = 0, -- Throw away friend variable because we couldn't use it the way we wanted to
		is_player = is_player,
		index = index,
	}
	
	-- Assign the data to the local variable
	Mp_leaderboards_data.list_data[i] = d
	Mp_leaderboards_data.num_virtual_rows = i
end

-- Formats a distance string given an initial value in meters
function mp_leaderboards_format_distance(value)

	if use_imperial_units() then
		-- Convert to feet
		value = floor(value * 3.2808399)
		
		-- Format the feet string and display
		value = mp_leaderboards_format_commas(value)
		value = {[0] = value}
		return vint_insert_values_in_string("LUA_DISTANCE_FEET", value)
	else
		-- Format the meters string and display
		value = mp_leaderboards_format_commas(value)
		value = {[0] = value}
		return vint_insert_values_in_string("LUA_DISTANCE_METERS", value)
	end
end

-- Formats a time string given an intial value in seconds
function mp_leaderboards_format_time(time_in_seconds)
	
	-- Pull out hours, minutes, and seconds
	local hours = floor(time_in_seconds / 3600)
	local minutes = floor(time_in_seconds / 60) - (hours * 60)
	local seconds =  mod(time_in_seconds, 60)

	-- Pad minutes if less than 10 and there are hours
	if hours > 0 and minutes < 10 then
		minutes = "0" .. minutes
	end
	
	-- Pad seconds if needed
	if seconds < 10 then
		seconds = "0" .. seconds
	end
	
	-- Build the string
	if hours > 0 then
		return hours .. ":" .. minutes .. ":" .. seconds
	else
		return minutes .. ":" .. seconds
	end
end

-- Formats a given value into money with commas
function mp_leaderboards_format_money(value)
	return "$" .. format_cash(value)
end

-- Adds commas to a numerical value
function mp_leaderboards_format_commas(value)
	return format_cash(value)
end

function mp_leaderboards_my_record(rank, badge, name, stat1, stat2, stat3, is_friend, is_player, index)

	local user_rank_h = vint_object_find("user_rank", Mp_leaderboards_data.handles.user_row_h)
	local user_badge_h = vint_object_find("user_badge", Mp_leaderboards_data.handles.user_row_h)
	local user_name_h = vint_object_find("user_name", Mp_leaderboards_data.handles.user_row_h)
	local user_stat1_h = vint_object_find("user_stat1", Mp_leaderboards_data.handles.user_row_h)
	local user_stat2_h = vint_object_find("user_stat2", Mp_leaderboards_data.handles.user_row_h)
	local user_stat3_h = vint_object_find("user_stat3", Mp_leaderboards_data.handles.user_row_h)

	-- Format the values (commas, $, distance)
	stat1 = Mp_leaderboards_data.tabs[Mp_leaderboards_data.current_tab].conversion(stat1)
	
	if stat2 ~= nil then
		stat2 = Mp_leaderboards_data.tabs[Mp_leaderboards_data.current_tab].conversion(stat2)
	else
		stat2 = " "
	end
	
	-- HACK TO ADD ° TO SPINS
	if Mp_leaderboards_data.current_tab == 11 then
		stat3 = stat3 .. "°"
	else
	
		if stat3 ~= nil then
			stat3 = Mp_leaderboards_data.tabs[Mp_leaderboards_data.current_tab].conversion(stat3)
		else
			stat3 = " "
		end
	end
	
	if rank ~= 0 then
		vint_set_property(user_rank_h, "text_tag", rank)
		vint_set_property(user_badge_h, "image", badge)
		vint_set_property(user_name_h, "text_tag", name)
		vint_set_property(user_stat1_h, "text_tag", stat1)
		vint_set_property(user_stat2_h, "text_tag", stat2)
		vint_set_property(user_stat3_h, "text_tag", stat3)

		vint_set_property(user_badge_h, "visible", Mp_leaderboards_data.tabs[Mp_leaderboards_data.current_tab].show_badge)
		vint_set_property(Mp_leaderboards_data.handles.user_row_h, "visible", true)
	end
end

function mp_leaderboards_refresh_data()
	-- Lock out changing
	Mp_leaderboards_data.can_move = false

	-- Blow away old physical lines
	for idx, val in Mp_leaderboards_data.visible_row do
		vint_object_destroy(Mp_leaderboards_data.visible_row[idx].pulsate)
		vint_object_destroy(Mp_leaderboards_data.visible_row[idx].line_h)
	end
	
	-- Hide the player data
	vint_set_property(Mp_leaderboards_data.handles.user_row_h, "visible", false)
	
	-- Get rid of the scroll bar
	vint_set_property(Mp_leaderboards_data.scroll_group_h, "visible", false)
	
	-- Show the spinner
	local spinner = vint_object_find("spinner")
	vint_set_property(spinner, "visible", true)
	
	-- Blow away any old player data
	-- Zero out the number of vitual rows
	Mp_leaderboards_data.top_virtual_row = 1
	Mp_leaderboards_data.current_virtual_row = 1
	Mp_leaderboards_data.current_visible_row = 1
	Mp_leaderboards_data.num_virtual_rows = 0
	Mp_leaderboards_data.list_data = { }
	
	-- Get the data name we're using
	local data = Mp_leaderboards_data.tabs[Mp_leaderboards_data.current_tab].data[Mp_leaderboards_data.current_column]

	-- Show either to 100 players or friends
	if Mp_leaderboards_data.top100 then
		vint_dataresponder_request("leaderboards", "mp_leaderboards_new_record", 100, "general", data, 1)
	else
		vint_dataresponder_request("leaderboards", "mp_leaderboards_new_record", 100, "friends", data, 1) 
	end
	
	-- Show player data no matter where they are in the main list
	vint_dataresponder_request("leaderboards", "mp_leaderboards_my_record", 1, "player", data, 1)

	-- Set up number of visible rows
	Mp_leaderboards_data.num_visible_rows = Mp_leaderboards_data.num_virtual_rows
	
	-- We have more virtual rows than we can display
	if Mp_leaderboards_data.num_visible_rows > 10 then
	
		-- Clamp visible rows to 10
		Mp_leaderboards_data.num_visible_rows = 10
		
		-- Set up scroll bar translation scaler
		Mp_leaderboards_data.scroll_bar_scaler =  18 + 185 * ((Mp_leaderboards_data.num_virtual_rows - 11)/89)
		
		-- Set up scroll bar size
		local scale_y = 65 + 185 * ((100 - Mp_leaderboards_data.num_virtual_rows)/89)
		local bar_h = vint_object_find("scroll_bar", Mp_leaderboards_data.scroll_group_h)
		local bottom_h = vint_object_find("scroll_bar_bottom", bar_h)
		vint_set_property(bar_h, "source_se", 32.0, scale_y)
		vint_set_property(bottom_h, "anchor", 0.0, scale_y)

		-- Display the scroll bar
		vint_set_property(Mp_leaderboards_data.scroll_group_h, "visible", true)
	else
		-- Declare anyway just in case
		Mp_leaderboards_data.scroll_bar_scaler =  0
	end
	
	-- Hang on to position of top row
	local x,y = vint_get_property(Mp_leaderboards_data.handles.spreadsheet_row_h, "anchor")

	-- Make all the new visible rows and set them up for code reference
	for i = 1, Mp_leaderboards_data.num_visible_rows do
	
		-- Clone row and animation
		local line_h = vint_object_clone(Mp_leaderboards_data.handles.spreadsheet_row_h)
		local pulsate = vint_object_clone(Mp_leaderboards_data.handles.highlight_shine_anim_h)
		
		-- Apply animation
		local pulsate_tween = vint_object_find("highlight_shine_fade", pulsate)
		vint_set_property(pulsate_tween, "target_handle", vint_object_find("highlight_back_shine", line_h))
		
		-- Set all new handles
		local highlight_h = vint_object_find("highlight", line_h)
		local highlight_name_h = vint_object_find("highlight_name", line_h)
		local highlight_stat1_h = vint_object_find("highlight_stat1", line_h)
		local highlight_stat2_h = vint_object_find("highlight_stat2", line_h)
		local highlight_stat3_h = vint_object_find("highlight_stat3", line_h)
		local normal_rank_h = vint_object_find("normal_rank", line_h)
		local normal_badge_h = vint_object_find("normal_badge", line_h)
		local normal_name_h = vint_object_find("normal_name", line_h)
		local normal_stat1_h = vint_object_find("normal_stat1", line_h)
		local normal_stat2_h = vint_object_find("normal_stat2", line_h)
		local normal_stat3_h = vint_object_find("normal_stat3", line_h)
		
		-- Save everything in a nice table
		Mp_leaderboards_data.visible_row[i] = {line_h = line_h,
															pulsate = pulsate,
															highlight_h = highlight_h,
															highlight_name_h = highlight_name_h,
															highlight_stat1_h = highlight_stat1_h,
															highlight_stat2_h = highlight_stat2_h,
															highlight_stat3_h = highlight_stat3_h,
															normal_rank_h = normal_rank_h,
															normal_badge_h = normal_badge_h,
															normal_name_h = normal_name_h,
															normal_stat1_h = normal_stat1_h,
															normal_stat2_h = normal_stat2_h,
															normal_stat3_h = normal_stat3_h,
															}
		
		-- Draw the row
		vint_set_property(Mp_leaderboards_data.visible_row[i].line_h, "anchor", x, y + (32 * (i - 1)))
		vint_set_property(Mp_leaderboards_data.visible_row[i].line_h, "visible", true)
	end
	
	-- Hide the spinner
	vint_set_property(spinner, "visible", false)
	
	-- Fill in the lines based on position
	mp_leaderboards_redraw_rows()
	
	-- Return the cursor
	mp_leaderboards_change_row(0)
	
	-- Unlock changing
	Mp_leaderboards_data.can_move = true
end

function mp_leaderboards_redraw_rows()

	-- Fill data into all the spreadsheet based on how many visible rows there are
	for i = 1, Mp_leaderboards_data.num_visible_rows do
		-- Hang on to virtualized number of the row
		local virtual = Mp_leaderboards_data.top_virtual_row + i - 1
	
		-- Set all the graphics
		vint_set_property(Mp_leaderboards_data.visible_row[i].highlight_name_h, "text_tag", Mp_leaderboards_data.list_data[virtual].name)
		vint_set_property(Mp_leaderboards_data.visible_row[i].highlight_stat1_h, "text_tag", Mp_leaderboards_data.list_data[virtual].stat1)
		vint_set_property(Mp_leaderboards_data.visible_row[i].highlight_stat2_h, "text_tag", Mp_leaderboards_data.list_data[virtual].stat2)
		vint_set_property(Mp_leaderboards_data.visible_row[i].highlight_stat3_h, "text_tag", Mp_leaderboards_data.list_data[virtual].stat3)
		vint_set_property(Mp_leaderboards_data.visible_row[i].normal_rank_h, "text_tag", Mp_leaderboards_data.list_data[virtual].rank)
		vint_set_property(Mp_leaderboards_data.visible_row[i].normal_badge_h, "image", Mp_leaderboards_data.list_data[virtual].badge)
		vint_set_property(Mp_leaderboards_data.visible_row[i].normal_name_h, "text_tag", Mp_leaderboards_data.list_data[virtual].name)
		vint_set_property(Mp_leaderboards_data.visible_row[i].normal_stat1_h, "text_tag", Mp_leaderboards_data.list_data[virtual].stat1)
		vint_set_property(Mp_leaderboards_data.visible_row[i].normal_stat2_h, "text_tag", Mp_leaderboards_data.list_data[virtual].stat2)
		vint_set_property(Mp_leaderboards_data.visible_row[i].normal_stat3_h, "text_tag", Mp_leaderboards_data.list_data[virtual].stat3)
		
		-- Set badge visibility
		vint_set_property(Mp_leaderboards_data.visible_row[i].normal_badge_h, "visible", Mp_leaderboards_data.tabs[Mp_leaderboards_data.current_tab].show_badge)
		
		-- Set name and badge colors
		if Mp_leaderboards_data.list_data[virtual].is_player == true then
			vint_set_property(Mp_leaderboards_data.visible_row[i].normal_rank_h, "tint", Mp_leaderboards_colors.yellow.r, Mp_leaderboards_colors.yellow.g, Mp_leaderboards_colors.yellow.b)
			vint_set_property(Mp_leaderboards_data.visible_row[i].normal_name_h, "tint", Mp_leaderboards_colors.yellow.r, Mp_leaderboards_colors.yellow.g, Mp_leaderboards_colors.yellow.b)
		else
			vint_set_property(Mp_leaderboards_data.visible_row[i].normal_rank_h, "tint", 95/255,95/255,95/255)
			vint_set_property(Mp_leaderboards_data.visible_row[i].normal_name_h, "tint", 95/255,95/255,95/255)
		end
		
		-- Start with blank column colors
		if Mp_leaderboards_data.list_data[virtual].is_player == true then
			vint_set_property(Mp_leaderboards_data.visible_row[i].normal_stat1_h, "tint", Mp_leaderboards_colors.yellow.r, Mp_leaderboards_colors.yellow.g, Mp_leaderboards_colors.yellow.b)
			vint_set_property(Mp_leaderboards_data.visible_row[i].normal_stat2_h, "tint", Mp_leaderboards_colors.yellow.r, Mp_leaderboards_colors.yellow.g, Mp_leaderboards_colors.yellow.b)
			vint_set_property(Mp_leaderboards_data.visible_row[i].normal_stat3_h, "tint", Mp_leaderboards_colors.yellow.r, Mp_leaderboards_colors.yellow.g, Mp_leaderboards_colors.yellow.b)
			
		else
			vint_set_property(Mp_leaderboards_data.visible_row[i].normal_stat1_h, "tint", 95/255,95/255,95/255)
			vint_set_property(Mp_leaderboards_data.visible_row[i].normal_stat2_h, "tint", 95/255,95/255,95/255)
			vint_set_property(Mp_leaderboards_data.visible_row[i].normal_stat3_h, "tint", 95/255,95/255,95/255)
		end
	
		local num_columns = Mp_leaderboards_data.tabs[Mp_leaderboards_data.current_tab].num_columns
		
		if num_columns > 0 then
			-- Add column highlight color
			if Mp_leaderboards_data.current_column == 1 then
				vint_set_property(Mp_leaderboards_data.visible_row[i].normal_stat1_h, "tint", Mp_leaderboards_colors.yellow.r, Mp_leaderboards_colors.yellow.g, Mp_leaderboards_colors.yellow.b)
			elseif Mp_leaderboards_data.current_column == 2 then
				vint_set_property(Mp_leaderboards_data.visible_row[i].normal_stat2_h, "tint", Mp_leaderboards_colors.yellow.r, Mp_leaderboards_colors.yellow.g, Mp_leaderboards_colors.yellow.b)
			elseif Mp_leaderboards_data.current_column == 3 then
				vint_set_property(Mp_leaderboards_data.visible_row[i].normal_stat3_h, "tint", Mp_leaderboards_colors.yellow.r, Mp_leaderboards_colors.yellow.g, Mp_leaderboards_colors.yellow.b
)
			end
		end
	end
	
	-- Set up destination for scroll bar
	local bar_y = 202 + (Mp_leaderboards_data.scroll_bar_scaler * (Mp_leaderboards_data.current_virtual_row - 1)/(Mp_leaderboards_data.num_virtual_rows - 1))
	vint_set_property(Mp_leaderboards_data.scroll_bar_h, "anchor", 991.0, bar_y)
end


function mp_leaderboards_update_btn_tips()

	-- Set hint text
	if Mp_leaderboards_data.is_360 then
		if Mp_leaderboards_data.top100 then
			Mp_leaderboards_btn_tips.x_button.label = "MULTI_LOBBY_FRIENDS_ONLY"
		else
			Mp_leaderboards_btn_tips.x_button.label = "LEADERBOARDS_TOP100"
		end
	end
	
	--Call to menubase to update the button tips
	btn_tips_update()
end

function mp_leaderboards_btn_x_is_active()
	return true
end

Mp_leaderboards_btn_tips = {
	a_button 	= 	{ label = "CONTROL_SELECT", 	enabled = mp_leaderboards_btn_x_is_active},
	b_button 	= 	{ label = "MENU_BACK", 			enabled = mp_leaderboards_btn_x_is_active},
}

Mp_leaderboards_btn_temp_tips = {}