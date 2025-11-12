-----------------------
--  MISSION REPLAY   --
-----------------------

MISSION_REPLAY_SWATCH_HEIGHT = 125
MISSION_REPLAY_SWATCH_WIDTH = 190
MISSION_REPLAY_SWATCH_COLS = 4
MISSION_REPLAY_SWATCH_HL_SCALE = 1
MISSION_REPLAY_SWATCH_UHL_SCALE = .8

Mission_replay_building_menu = 0

Mission_replay_loaded_pegs = { }
Mission_replay_clip_peg = 0
Mission_replay_gang_peg = 0

Mission_replay_input_subs = { }

Mission_replay = { handles = {}, }

Mission_replay_cur_swatch = 0

----------------------
--	SYSTEM FUNCTIONS --
----------------------

--	Initialize the menu
function mission_replay_init()
	Menu_swap_center = true			--Change menubase to use center swappin	g style
	
	Mission_replay.handles.mission_details_slide_in = vint_object_find("mission_details_slide_in")
	Mission_replay.handles.mission_details_slide_out = vint_object_find("mission_details_slide_out")
	
	--check marks for the completion strings
	Mission_replay.handles.mission_check_sp = vint_object_find("mission_check_sp")
	Mission_replay.handles.mission_check_coop = vint_object_find("mission_check_coop")
	
	vint_set_property(Mission_replay.handles.mission_details_slide_in, "is_paused", true)
	vint_set_property(Mission_replay.handles.mission_details_slide_out, "is_paused", true)
	
	--Event Tracking
	event_tracking_interface_enter("Mission Replay")
	
	menu_store_use_hud(false)
	menu_init()
	Menu_active_anchor_end_x, Menu_active_anchor_end_y = vint_get_property(vint_object_find("menu_center"), "anchor")
	menu_horz_init(Mission_replay_horz)
	interface_effect_begin("pause")
end

-- Shutdown and cleanup the menu
function mission_replay_cleanup()
	for k, v in Mission_replay_loaded_pegs do
		peg_unload(k)
	end
	interface_effect_end()
end

function mission_replay_exit()
	dialog_box_confirmation("MENU_TITLE_WARNING", "STORE_EXIT_CLIPBOARD", "mission_replay_exit_confirm")
end

function mission_replay_exit_confirm(result, action)
	if action == DIALOG_ACTION_CLOSE and result == 0 then
		menu_close(mission_replay_exit_final)
	end
end

function mission_replay_exit_final()
	mission_replay_unload_details()
	vint_document_unload(vint_document_find("mission_replay"))	
end

------------------------
--	MENU FUNCTIONALITY --
------------------------

-- Scroll bar

Mission_replay_scroll_data = 0
Mission_replay_text_clip_height = 0
Mission_replay_story_text_height = 0
Mission_replay_story_text_pos = 0

function mission_replay_scroll_bar_init(bar_grp)
	vint_set_property(bar_grp, "visible", false)
	
	local scroll_data = {
		visible =			false,
		bar_grp =			bar_grp,
		bg_n_h =			vint_object_find("menu_scroll_bg_n", bar_grp),
		bg_c_h =			vint_object_find("menu_scroll_bg_c", bar_grp),
		bg_s_h =			vint_object_find("menu_scroll_bg_s", bar_grp),
		thumb_n_h =			vint_object_find("menu_scroll_thumb_n", bar_grp),
		thumb_s_h =			vint_object_find("menu_scroll_thumb_s", bar_grp),
		thumb_blend_h =		vint_object_find("menu_scroll_thumb_blend", bar_grp),
		thumb_pos =			0,
		bar_height =		332,
		thumb_height =		332,
	}

	return scroll_data
end

function mission_replay_scroll_bar_update(scroll_data)
	if scroll_data.visible == false then
		return
	end

	-- update the thumb pos
	local thumb_offset = scroll_data.thumb_pos * scroll_data.bar_height + 10
	
	if thumb_offset > scroll_data.bar_height - 50 then
		thumb_offset = scroll_data.bar_height - 50
	end
	
	vint_set_property(scroll_data.thumb_n_h,		"anchor", 3, thumb_offset)
	vint_set_property(scroll_data.thumb_s_h,		"anchor", 3, thumb_offset + scroll_data.thumb_height - 20) --Magic Number represents the offset from the thumb height
	vint_set_property(scroll_data.thumb_blend_h,	"anchor", 3, thumb_offset + scroll_data.thumb_height - 63) --Magic Number represents the offset from the thumb height
end

function mission_replay_scroll_bar_show(scroll_data)
	vint_set_property(scroll_data.bar_grp, "visible", true)
	scroll_data.visible = true
end

function mission_replay_scroll_bar_set_bar_height(scroll_data, new_height)
	--This magic number will allow you to change the base height of the scrollbar
	scroll_data.bar_height = new_height - 54

	vint_set_property(scroll_data.bg_s_h, "anchor", 38, new_height - 10)
	vint_set_property(scroll_data.bg_c_h, "source_se", 10, new_height - 28)

	menu_scroll_bar_update(scroll_data)
end

function mission_replay_scroll_bar_set_thumb_size(scroll_data, height)
	scroll_data.thumb_height = height * scroll_data.bar_height
	
	if scroll_data.thumb_height < 60 then
		scroll_data.thumb_height = 60
	end
	
	vint_set_property(scroll_data.thumb_n_h, "source_se", 32, scroll_data.thumb_height - 20)
	menu_scroll_bar_update(scroll_data)
end

function mission_replay_scroll_bar_set_thumb_pos(scroll_data, value)
	if scroll_data.thumb_pos ~= value then
		scroll_data.thumb_pos = value
		menu_scroll_bar_update(scroll_data)
	end
end

function mission_replay_scroll_bar_hide(scroll_data)
	vint_set_property(scroll_data.bar_grp, "visible", false)
	scroll_data.visible = false
end

-- support

function mission_replay_load_peg(peg_name)
	peg_load(peg_name)
	Mission_replay_loaded_pegs[peg_name] = true
end

function mission_replay_unload_peg(peg_name)
	peg_unload(peg_name)
	Mission_replay_loaded_pegs[peg_name] = nil
end

function mission_detail_replay_response(success)
	if success == true then
		vint_set_property(vint_object_find("mission_details"), "visible", false)
		
		menu_close(mission_replay_exit_final)
	end
end

-- swatches

function mission_replay_mission_select()
	local swatches = Menu_active[0].swatches
	local swatch = swatches[Menu_active[0].cur_idx]
	
	if swatch.is_unlocked ~= true then
		return
	end
	
	--Hide swatch controls
	vint_set_property(Menu_option_labels.control_parent, "visible", false)
	
	local detail_frame = vint_object_find("mission_details")
	vint_set_property(vint_object_find("display_line_1", detail_frame), "text_tag", swatch.display_line_1)
	vint_set_property(vint_object_find("display_line_2", detail_frame), "text_tag", swatch.display_line_2)
	vint_set_property(vint_object_find("gang_name", detail_frame), "text_tag", swatch.gang_name)
	
	Mission_replay_clip_peg = "ui_c_news_"..swatch.internal_name
	mission_replay_load_peg(Mission_replay_clip_peg)
	
	vint_set_property(vint_object_find("clipping", detail_frame), "image", "ui_ct_news_"..swatch.internal_name)
	vint_set_property(vint_object_find("clipping", detail_frame), "scale", 0.75, 0.75)
	
	Mission_replay_gang_peg = "ui_crib_news_image_"..swatch.gang_code
	mission_replay_load_peg(Mission_replay_gang_peg)

	vint_set_property(vint_object_find("gang_watermark", detail_frame), "image", "ui_crib_news_img_"..swatch.gang_code..".tga")
	
	local story_text = vint_object_find("story_text", detail_frame)
	vint_set_property(story_text, "text_tag", swatch.internal_name.."_HEADLINE_TEXT")
	vint_set_property(story_text, "offset", 0, 0)
	
	vint_set_property(vint_object_find("mission_check_coop", detail_frame), "visible", swatch.coop_complete == true)
	
	local dummy
	dummy, Mission_replay_story_text_height = element_get_actual_size(story_text)
	dummy, Mission_replay_text_clip_height = vint_get_property(vint_object_find("story_clip"), "clip_size")
	Mission_replay_scroll_data = mission_replay_scroll_bar_init(vint_object_find("replay_scroll_bar"))
	Mission_replay_story_text_pos = 0
	
	if Mission_replay_story_text_height > Mission_replay_text_clip_height then
		mission_replay_scroll_bar_show(Mission_replay_scroll_data)
		mission_replay_scroll_bar_set_bar_height(Mission_replay_scroll_data, Mission_replay_text_clip_height + 15)
		mission_replay_scroll_bar_set_thumb_size(Mission_replay_scroll_data, Mission_replay_text_clip_height / Mission_replay_story_text_height)
	end
	
	Menu_active.btn_tips = Mission_replay_details_btn_tips
	btn_tips_update()
		
	local subs_h = vint_subscribe_to_input_event(nil, "select", "mission_replay_detail_input", 500)
	Mission_replay_input_subs[subs_h] = true
	subs_h = vint_subscribe_to_input_event(nil, "back", "mission_replay_detail_input", 500)
	Mission_replay_input_subs[subs_h] = true
	subs_h = vint_subscribe_to_input_event(nil, "nav_up", "mission_replay_detail_input", 500)
	Mission_replay_input_subs[subs_h] = true
	subs_h = vint_subscribe_to_input_event(nil, "nav_down", "mission_replay_detail_input", 500)
	Mission_replay_input_subs[subs_h] = true
	subs_h = vint_subscribe_to_input_event(nil, "pause", "mission_replay_detail_input", 500)
	Mission_replay_input_subs[subs_h] = true

	subs_h = vint_subscribe_to_input_event(nil, "all_unassigned", "mission_replay_detail_input", 500)
	Mission_replay_input_subs[subs_h] = true
	
	vint_set_property(detail_frame, "visible", true)
	
	lua_play_anim(Mission_replay.handles.mission_details_slide_in)
	
	--Hide triggers
	mission_replay_menu_triggers_show(false)
end

function mission_replay_mission_nav()
end

function mission_replay_mission_enter(swatch)
	-- select the thumbnail, make it bright
	vint_set_property(swatch.txt_grp, "visible", true)
	vint_set_property(vint_object_find("clipping", swatch.swatch_h), "tint", 1, 1, 1)
	Mission_replay_cur_swatch = swatch
end

function mission_replay_mission_leave(swatch)
	-- unselect the thumbnail, tint it dark
	vint_set_property(swatch.txt_grp, "visible", false)
	vint_set_property(vint_object_find("clipping", swatch.swatch_h), "tint", 0.5, 0.5, 0.5)
end

function mission_replay_update_swatch(swatch, row, col)
	-- update newspaper icon
	local clipping = vint_object_find("clipping", swatch.swatch_h)
	
	if swatch.is_unlocked == false then
		vint_set_property(clipping, "image", "ui_crib_news_locked_t")
	else
		vint_set_property(clipping, "image", "ui_crib_news_"..swatch.internal_name.."_t")
	end
	
	vint_set_property(clipping, "rotation", rand_float(-0.075, 0.075))
	vint_set_property(clipping, "scale", 1.5, 1.5)
	
	local visible_text, hidden_text
	if col < 2 then
		visible_text = vint_object_find("right_text", swatch.swatch_h)
		hidden_text = vint_object_find("left_text", swatch.swatch_h)
	else
		hidden_text = vint_object_find("right_text", swatch.swatch_h)
		visible_text = vint_object_find("left_text", swatch.swatch_h)
	end
	
	vint_set_property(hidden_text, "visible", false)
	vint_set_property(visible_text, "visible", false)
	
	vint_set_property(vint_object_find("locked", swatch.swatch_h), "visible", swatch.is_unlocked == false)
	vint_set_property(vint_object_find("locked_coop", swatch.swatch_h), "visible", swatch.buddy_complete == false)
	
	swatch.txt_grp = visible_text
	
	vint_set_property(vint_object_find("display_line_1", visible_text), "text_tag", swatch.display_line_1)
	vint_set_property(vint_object_find("display_line_2", visible_text), "text_tag", swatch.display_line_2)
	vint_set_property(vint_object_find("gang_name", visible_text), "text_tag", swatch.gang_name)
end

function mission_replay_consume_data(internal_name, display_line_1, display_line_2, gang_name, gang_code, is_unlocked, is_mission, coop_complete, buddy_complete)
	local item = {
		type = MENU_ITEM_TYPE_SELECTABLE,
		internal_name = internal_name,
		display_line_1 = display_line_1,
		display_line_2 = display_line_2,
		is_unlocked = is_unlocked,
		coop_complete = coop_complete,
		buddy_complete = buddy_complete,
		gang_name = gang_name,
		gang_code = gang_code,
		is_mission = is_mission,
		on_select = mission_replay_mission_select,
	}

	local swatches = Mission_replay_building_menu[0].swatches
	swatches[swatches.num_swatches] = item
	swatches.num_swatches = swatches.num_swatches + 1
end

function mission_replay_mission_show(menu_data)
	-- load relavent peg
	mission_replay_load_peg(menu_data.peg)
	
	-- build swatch list
	local menu_item = menu_data[0]

	menu_item.swatches = { num_swatches = 0 }
	Mission_replay_building_menu = menu_data
	vint_dataresponder_request("mission_replay", "mission_replay_consume_data", 0, "list_missions", menu_data.mission_group)

	local swatch_template = vint_object_find("swatch_clipping", nil)
	menu_grid_show(menu_data, menu_item, swatch_template)
	
	mission_replay_menu_triggers_show(true)
end	

function mission_replay_mission_release(menu)
	mission_replay_unload_peg(menu.peg)
	menu_grid_release(menu[0])
end

function mission_replay_mission_back()
	mission_replay_exit()
end

-- details

function mission_replay_detail_scroll_up()
	if Mission_replay_story_text_pos <= 0 then
		return
	end
	
	Mission_replay_story_text_pos = Mission_replay_story_text_pos - Mission_replay_text_clip_height
	
	if Mission_replay_story_text_pos < 0 then
		Mission_replay_story_text_pos = 0
	end
	
	vint_set_property(vint_object_find("story_text"), "offset", 0, -Mission_replay_story_text_pos)
	mission_replay_scroll_bar_set_thumb_pos(Mission_replay_scroll_data, Mission_replay_story_text_pos / Mission_replay_story_text_height)
end

function mission_replay_detail_scroll_down()
	if Mission_replay_story_text_pos + Mission_replay_text_clip_height >= Mission_replay_story_text_height then
		return
	end
	
	Mission_replay_story_text_pos = Mission_replay_story_text_pos + Mission_replay_text_clip_height
	
	if Mission_replay_story_text_pos + Mission_replay_text_clip_height > Mission_replay_story_text_height then
		Mission_replay_story_text_pos = Mission_replay_story_text_height - Mission_replay_text_clip_height
	end
	
	vint_set_property(vint_object_find("story_text"), "offset", 0, -Mission_replay_story_text_pos)
	mission_replay_scroll_bar_set_thumb_pos(Mission_replay_scroll_data, Mission_replay_story_text_pos / Mission_replay_story_text_height)
end

function mission_detail_replay_confirm(mission_name)
	-- this could invoke a series of dialogs on local and remote coop player so it's blocking
	vint_dataresponder_request("mission_replay", "mission_detail_replay_response", 0, "mission_start", mission_name)
end

function mission_replay_detail_input(target, event, accelleration)
	if menu_input_is_blocked() == true then
		return
	end
	
	if event == "nav_up" then
		mission_replay_detail_scroll_up()
	elseif event == "nav_down" then
		mission_replay_detail_scroll_down()
	elseif event == "select" then
		local menu_item = Menu_active[0]
		local swatch = menu_item.swatches[menu_item.cur_idx]
		
		if swatch.is_unlocked == true then
			thread_new("mission_detail_replay_confirm", swatch.internal_name)
		end
	elseif event == "back" then
			
		for k, v in Mission_replay_input_subs do
			vint_unsubscribe_to_input_event(k)
		end
		Mission_replay_input_subs = { }
		
		Menu_active.btn_tips = nil
		btn_tips_update()
		
		--Slide out frame for missions
		lua_play_anim(Mission_replay.handles.mission_details_slide_out)
		local tween_h = vint_object_find("slide_out_ender", Mission_replay.handles.mission_details_slide_out)
		vint_set_property(tween_h, "end_event", "mission_replay_unload_details")
	
		--Show swatches again
		vint_set_property(Menu_option_labels.control_parent, "visible", true)
	
		--Block input until peg is unloaded
		menu_input_block(true)
		
		--Show triggers
		mission_replay_menu_triggers_show(true)
		
	elseif event == "pause" then
		--Cause special pause
		dialog_open_pause_display()
	end
end


function mission_replay_unload_details()
	vint_set_property(vint_object_find("mission_details"), "visible", false)
	if Mission_replay_clip_peg ~= nil then
		mission_replay_unload_peg(Mission_replay_clip_peg)
	end 
	
	if Mission_replay_gang_peg ~= nil then
		mission_replay_unload_peg(Mission_replay_gang_peg)
	end
	
	--Pegs are unloaded now unblock input
	menu_input_block(false)
end

function mission_replay_menu_triggers_show(is_visible)
	local h = vint_object_find("upper_nav_trigger_right", nil, MENU_BASE_DOC_HANDLE)
	vint_set_property(h, "visible", is_visible)
	h = vint_object_find("upper_nav_trigger_right_hl", nil, MENU_BASE_DOC_HANDLE)
	vint_set_property(h, "visible", is_visible)
	h = vint_object_find("upper_nav_trigger_left", nil, MENU_BASE_DOC_HANDLE)
	vint_set_property(h, "visible", is_visible)
	h = vint_object_find("upper_nav_trigger_left_hl", nil, MENU_BASE_DOC_HANDLE)
	vint_set_property(h, "visible", is_visible)
end

---------------
-- MENU DATA --
---------------
Mission_replay_details_btn_tips = {
	a_button = { label = "MISSION_COOP_REPLAY_PROMPT",	enabled = true, },
	b_button = { label = "MENU_BACK",						enabled = true, },
	-- this seem to want to put it in the extra tab but there's not room
--	right_stick = { label = "MENU_SCROLL", enabled = true},
}

Mission_replay_prologue_menu = {
--	btn_tips = Pcr01_untop_btn_tips,
	on_show = mission_replay_mission_show,
	on_release = mission_replay_mission_release,
	on_back = mission_replay_mission_back,
	
	mission_group = "prologue",
	peg = "ui_crib_news_tss",
	hide_header = true,
	hide_frame = true,
	max_height = 500,
	
	num_items = 1,
	[0] = {
		label = "",
		type = MENU_ITEM_TYPE_GRID,
		on_select = mission_replay_mission_select,
		on_nav = mission_replay_mission_nav,
		on_leave = mission_replay_mission_leave,
		on_enter = mission_replay_mission_enter,
		update_swatch = mission_replay_update_swatch,
		row_height = MISSION_REPLAY_SWATCH_HEIGHT,
		num_cols = MISSION_REPLAY_SWATCH_COLS,
		col_width = MISSION_REPLAY_SWATCH_WIDTH,
		highlight_scale = MISSION_REPLAY_SWATCH_HL_SCALE,
		unhighlight_scale = MISSION_REPLAY_SWATCH_UHL_SCALE,
		hide_arrows = true,
	}
}

Mission_replay_bh_menu = {
--	btn_tips = Pcr01_untop_btn_tips,
	on_show = mission_replay_mission_show,
	on_release = mission_replay_mission_release,
	on_back = mission_replay_mission_back,
	
	mission_group = "brotherhood",
	peg = "ui_crib_news_bh",
	hide_header = true,
	hide_frame = true,
	max_height = 500,
	
	num_items = 1,
	[0] = {
		label = "",
		type = MENU_ITEM_TYPE_GRID,
		on_select = mission_replay_mission_select,
		on_nav = mission_replay_mission_nav,
		on_leave = mission_replay_mission_leave,
		on_enter = mission_replay_mission_enter,
		update_swatch = mission_replay_update_swatch,
		row_height = MISSION_REPLAY_SWATCH_HEIGHT,
		num_cols = MISSION_REPLAY_SWATCH_COLS,
		col_width = MISSION_REPLAY_SWATCH_WIDTH,
		highlight_scale = MISSION_REPLAY_SWATCH_HL_SCALE,
		unhighlight_scale = MISSION_REPLAY_SWATCH_UHL_SCALE,
		hide_arrows = true,
	}
}

Mission_replay_rn_menu = {
--	btn_tips = Pcr01_untop_btn_tips,
	on_show = mission_replay_mission_show,
	on_release = mission_replay_mission_release,
	on_back = mission_replay_mission_back,
	
	mission_group = "ronin",
	peg = "ui_crib_news_rn",
	hide_header = true,
	hide_frame = true,
	max_height = 500,

	num_items = 1,
	[0] = {
		label = "",
		type = MENU_ITEM_TYPE_GRID,
		on_select = mission_replay_mission_select,
		on_nav = mission_replay_mission_nav,
		on_leave = mission_replay_mission_leave,
		on_enter = mission_replay_mission_enter,
		update_swatch = mission_replay_update_swatch,
		row_height = MISSION_REPLAY_SWATCH_HEIGHT,
		num_cols = MISSION_REPLAY_SWATCH_COLS,
		col_width = MISSION_REPLAY_SWATCH_WIDTH,
		highlight_scale = MISSION_REPLAY_SWATCH_HL_SCALE,
		unhighlight_scale = MISSION_REPLAY_SWATCH_UHL_SCALE,
		hide_arrows = true,
	}
}

Mission_replay_ss_menu = {
--	btn_tips = Pcr01_untop_btn_tips,
	on_show = mission_replay_mission_show,
	on_release = mission_replay_mission_release,
	on_back = mission_replay_mission_back,
	
	mission_group = "sons of samedi",
	peg = "ui_crib_news_ss",
	hide_header = true,
	hide_frame = true,
	max_height = 500,

	num_items = 1,
	[0] = {
		label = "",
		type = MENU_ITEM_TYPE_GRID,
		on_select = mission_replay_mission_select,
		on_nav = mission_replay_mission_nav,
		on_leave = mission_replay_mission_leave,
		on_enter = mission_replay_mission_enter,
		update_swatch = mission_replay_update_swatch,
		row_height = MISSION_REPLAY_SWATCH_HEIGHT,
		num_cols = MISSION_REPLAY_SWATCH_COLS,
		col_width = MISSION_REPLAY_SWATCH_WIDTH,
		highlight_scale = MISSION_REPLAY_SWATCH_HL_SCALE,
		unhighlight_scale = MISSION_REPLAY_SWATCH_UHL_SCALE,
		hide_arrows = true,
	}
}

Mission_replay_epilogue_menu = {
--	btn_tips = Pcr01_untop_btn_tips,
	on_show = mission_replay_mission_show,
	on_release = mission_replay_mission_release,
	on_back = mission_replay_mission_back,
	
	mission_group = "epilogue",
	peg = "ui_crib_news_ep",
	hide_header = true,
	hide_frame = true,
	max_height = 500,

	num_items = 1,
	[0] = {
		label = "",
		type = MENU_ITEM_TYPE_GRID,
		on_select = mission_replay_mission_select,
		on_nav = mission_replay_mission_nav,
		on_leave = mission_replay_mission_leave,
		on_enter = mission_replay_mission_enter,
		update_swatch = mission_replay_update_swatch,
		row_height = MISSION_REPLAY_SWATCH_HEIGHT,
		num_cols = MISSION_REPLAY_SWATCH_COLS,
		col_width = MISSION_REPLAY_SWATCH_WIDTH,
		highlight_scale = MISSION_REPLAY_SWATCH_HL_SCALE,
		unhighlight_scale = MISSION_REPLAY_SWATCH_UHL_SCALE,
		hide_arrows = true,
	}
}

Mission_replay_extras_menu = {
--	btn_tips = Pcr01_untop_btn_tips,
	on_show = mission_replay_mission_show,
	on_release = mission_replay_mission_release,
	on_back = mission_replay_mission_back,
	
	mission_group = "extra",
	peg = "ui_crib_news_em",
	hide_header = true,
	hide_frame = true,
	max_height = 500,

	num_items = 1,
	[0] = {
		label = "",
		type = MENU_ITEM_TYPE_GRID,
		on_select = mission_replay_mission_select,
		on_nav = mission_replay_mission_nav,
		on_leave = mission_replay_mission_leave,
		on_enter = mission_replay_mission_enter,
		update_swatch = mission_replay_update_swatch,
		row_height = MISSION_REPLAY_SWATCH_HEIGHT,
		num_cols = MISSION_REPLAY_SWATCH_COLS,
		col_width = MISSION_REPLAY_SWATCH_WIDTH,
		highlight_scale = MISSION_REPLAY_SWATCH_HL_SCALE,
		unhighlight_scale = MISSION_REPLAY_SWATCH_UHL_SCALE,
		hide_arrows = true,
	}
}

Mission_replay_horz = {
	num_items = 6,
	[0] = {label = "HELP_CAT_PROL", sub_menu = Mission_replay_prologue_menu},
	[1] = {label = "GANG_NAME_TB", sub_menu = Mission_replay_bh_menu},
	[2] = {label = "GANG_NAME_TR", sub_menu = Mission_replay_rn_menu},
	[3] = {label = "GANG_NAME_SOS", sub_menu = Mission_replay_ss_menu},
	[4] = {label = "HELP_CAT_EPI", sub_menu = Mission_replay_epilogue_menu},
	[5] = {label = "MAINMENU_EXTRAS", sub_menu = Mission_replay_extras_menu},
}
