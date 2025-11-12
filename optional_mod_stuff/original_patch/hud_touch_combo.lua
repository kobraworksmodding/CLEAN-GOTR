--##################################################################### 
--Touch Combo System
--#####################################################################

-- show_mode
-- 0 = Show Right stick
-- 1 = Show Both sticks
-- 2 = Show Right stick, dim left stick.

Sexy_time_tween = -1

Hud_combo_elements = {
	main_grp_h = -1,
	left_grp_h = -1, 
	left_stick_h = -1,
	left_highlight = -1,
	hud_left_stick_highlight = {
		[1] = -1,
		[2] = -1,
		[3] = -1,
		[4] = -1,
	},
	right_grp_h = -1,
	right_stick_h = -1,
	right_highlight = -1,
	target_dot_h = -1,
}

Hud_touch_combo_status = {
	combo_active = false,
	show_mode = false,
	left_stick_x = 0.0,
	left_stick_x = 0.0,
	right_stick_x = 0.0,
	right_stick_y = 0.0,
	rumble_level = -1,
	grp_x = 640,
	grp_y = 360,
}

function hud_touch_combo_init()
	--Find objects
	Hud_combo_elements.main_grp_h = vint_object_find("combo_grp")
	
	local x, y = vint_get_property(Hud_combo_elements.main_grp_h, "anchor")
	Hud_touch_combo_status.grp_x = x
	Hud_touch_combo_status.grp_y = y
	
	
	local bmp_h = vint_object_find("left_stick")
	Hud_combo_elements.left_grp_h = bmp_h 																		--Left Stick Group
	Hud_combo_elements.left_stick_h = vint_object_find("stick_l", bmp_h)
	Hud_combo_elements.left_stick_hl_h = vint_object_find("stick_l_hl", bmp_h)	--Left Stick 
	Hud_combo_elements.left_circle_h = vint_object_find("l_bg", bmp_h)
	
	-- fix the image.
	if (get_platform() == "PS3") then 
		local stick_bmp_h = vint_object_find("stick_bmp", Hud_combo_elements.left_stick_h)
		vint_set_property(stick_bmp_h, "image", "ui_hud_combo_thumb_ps3")
		local stick_txt_h = vint_object_find("stick_txt", Hud_combo_elements.left_stick_h )
		vint_set_property(stick_txt_h, "text_tag", "L")
	end
	
	if (get_platform() == "PC") then 
		local stick_txt_h = vint_object_find("stick_txt", Hud_combo_elements.left_stick_h )
		vint_set_property(stick_txt_h, "text_tag", "")
	end

	
	Hud_combo_elements.hud_left_stick_highlight[1] = vint_object_find("combo_arrow_n", bmp_h)	--Left Highlight North
	Hud_combo_elements.hud_left_stick_highlight[2] = vint_object_find("combo_arrow_s", bmp_h)	--Left Highlight South
	Hud_combo_elements.hud_left_stick_highlight[3] = vint_object_find("combo_arrow_w", bmp_h)	--Left Highlight West
	Hud_combo_elements.hud_left_stick_highlight[4] = vint_object_find("combo_arrow_e", bmp_h)	--Left Highlight East

	local bmp_h = vint_object_find("right_stick")
	Hud_combo_elements.right_grp_h = bmp_h															--Right Stick Group
	Hud_combo_elements.right_stick_h = vint_object_find("stick_r", bmp_h)					--Right Stick 
	Hud_combo_elements.right_stick_hl_h = vint_object_find("stick_r_hl", bmp_h)
	Hud_combo_elements.right_circle_h = vint_object_find("r_bg", bmp_h)
	
	-- fix the image
	if (get_platform() == "PS3") then 
		local stick_bmp_h = vint_object_find("stick_bmp", Hud_combo_elements.right_stick_h )								--Left Stick 
		vint_set_property(stick_bmp_h, "image", "ui_hud_combo_thumb_ps3")
		local stick_txt_h = vint_object_find("stick_txt", Hud_combo_elements.right_stick_h )								--Left Stick 
		vint_set_property(stick_txt_h, "text_tag", "R")
	end

	if (get_platform() == "PC") then 
		local stick_txt_h = vint_object_find("stick_txt", Hud_combo_elements.right_stick_h )								--Left Stick 
		vint_set_property(stick_txt_h, "text_tag", "")
	end

	Hud_combo_elements.target_dot_h = vint_object_find("marker", bmp_h)	--Right marker
	Hud_combo_elements.target_dot_big_h = vint_object_find("marker_big", bmp_h) --right big glow
	
	--animations, rumble
	Hud_combo_elements.right_stick_rumble_light = vint_object_find("combo_stick_shake_light")
	Hud_combo_elements.right_stick_rumble_heavy = vint_object_find("combo_stick_shake_heavy")
	vint_set_property(Hud_combo_elements.right_stick_rumble_light, "is_paused", true)
	vint_set_property(Hud_combo_elements.right_stick_rumble_heavy, "is_paused", true)
	--stick blink
	Hud_combo_elements.combo_stick_hl_l = vint_object_find("combo_stick_hl_l")
	Hud_combo_elements.combo_stick_hl_r = vint_object_find("combo_stick_hl_r")
	vint_set_property(Hud_combo_elements.combo_stick_hl_l, "is_paused", true)
	vint_set_property(Hud_combo_elements.combo_stick_hl_r, "is_paused", true)
	--fade in
	Hud_combo_elements.combo_sticks_fade_in = vint_object_find("combo_sticks_fade_in")
	vint_set_property(Hud_combo_elements.combo_sticks_fade_in, "is_paused", true)
	--fade out
	Hud_combo_elements.combo_sticks_fade_out = vint_object_find("combo_sticks_fade_out")
	vint_set_property(Hud_combo_elements.combo_sticks_fade_out, "is_paused", true)
	
	
	-- Touch Combo HUD
	vint_dataitem_add_subscription("touch_combo_info", "update", "hud_touch_combo_system_update")
	vint_dataitem_add_subscription("sexy_time_move_list", "update", "hud_sexy_time_move_list_update")
end

function hud_touch_combo_system_update(di_h)
	local combo_active, show_mode, right_stick_x, right_stick_y, left_stick_x, left_stick_y, target_x, target_y, rumble_level= vint_dataitem_get(di_h)
	
	
	if combo_active ~= Hud_touch_combo_status.combo_active then
		--debug_print("vint", "combo_active " .. var_to_string(combo_active) .. "\n")
		Hud_touch_combo_status.combo_active = combo_active
		
		if combo_active == true then 
			debug_print("vint", "*** sexy time fade in *** \n")
			hud_touch_combo_fade_in()
			vint_set_property(Hud_combo_elements.main_grp_h, "visible", true)                                 
			vint_set_property(Hud_combo_elements.target_dot_h, "visible", false)
			vint_set_property(Hud_combo_elements.hud_left_stick_highlight[1], "visible", true)
			vint_set_property(Hud_combo_elements.hud_left_stick_highlight[2], "visible", true)
			vint_set_property(Hud_combo_elements.hud_left_stick_highlight[3], "visible", true)
			vint_set_property(Hud_combo_elements.hud_left_stick_highlight[4], "visible", true)
		else
			debug_print("vint", "*** sexy time fade out *** \n")
			hud_touch_combo_fade_out()
			hud_touch_combo_rumble_none()
			vint_set_property(Hud_combo_elements.main_grp_h, "anchor", Hud_touch_combo_status.grp_x, Hud_touch_combo_status.grp_y)
			vint_set_property(Hud_combo_elements.target_dot_big_h, "visible", false)
			vint_set_property(Hud_combo_elements.target_dot_h, "visible", false)
			vint_set_property(Hud_combo_elements.left_grp_h, "alpha", 1) 
			vint_set_property(Hud_combo_elements.right_grp_h, "alpha", 1) 
			vint_set_property(Hud_combo_elements.hud_left_stick_highlight[1], "visible", false)
			vint_set_property(Hud_combo_elements.hud_left_stick_highlight[2], "visible", false)
			vint_set_property(Hud_combo_elements.hud_left_stick_highlight[3], "visible", false)
			vint_set_property(Hud_combo_elements.hud_left_stick_highlight[4], "visible", false)
			return
		end
	end

	
	if combo_active then
		--which stick should we show
		
		local stick_radius = 15
		local stick_grp_mult = 7
		
		if left_stick_x ~= Hud_touch_combo_status.left_stick_x  or  left_stick_y ~= Hud_touch_combo_status.left_stick_y then 
			vint_set_property(Hud_combo_elements.left_stick_h, "anchor", stick_radius * left_stick_x, stick_radius * -left_stick_y)			
		end
				
		if right_stick_x ~= Hud_touch_combo_status.right_stick_x  or  right_stick_y ~= Hud_touch_combo_status.right_stick_y then 
			vint_set_property(Hud_combo_elements.right_stick_h, "anchor", stick_radius * right_stick_x, stick_radius * -right_stick_y)
		end
	
		Hud_touch_combo_status.left_stick_x = left_stick_x 
		Hud_touch_combo_status.left_stick_y = left_stick_y

		Hud_touch_combo_status.right_stick_x = right_stick_x 
		Hud_touch_combo_status.right_stick_y = right_stick_y
		
		if target_x ~= Hud_touch_combo_status.target_x  or  target_y ~= Hud_touch_combo_status.target_y then 
			vint_set_property(Hud_combo_elements.target_dot_h, "anchor", stick_radius * target_x, stick_radius * -target_y)
		end
		
		Hud_touch_combo_status.target_x = target_x 
		Hud_touch_combo_status.target_y = target_y
		
		--jiggle the group if using left stick
		if show_mode == 1 then
			local new_x = Hud_touch_combo_status.grp_x + (stick_grp_mult * left_stick_x)
			local new_y = Hud_touch_combo_status.grp_y + (stick_grp_mult * -left_stick_y)
			vint_set_property(Hud_combo_elements.main_grp_h, "anchor", new_x, new_y)			
		else
			vint_set_property(Hud_combo_elements.main_grp_h, "anchor", Hud_touch_combo_status.grp_x, Hud_touch_combo_status.grp_y)
		end
		
		debug_print("vint", "rumble " .. var_to_string(rumble_level) .. ", show " .. var_to_string(show_mode) .. "\n")

		--how much rumble do we have
		if Hud_touch_combo_status.rumble_level ~= rumble_level then	
			--note: i look for rumble 0 farther down
			if rumble_level == 1 then
				--cancel the heavy stuff
				vint_set_property(Hud_combo_elements.right_stick_rumble_heavy, "is_paused", true)
				--play the light stuff
				hud_touch_combo_rumble_light()
			elseif rumble_level == 2 then
				--cancel the light stuff
				vint_set_property(Hud_combo_elements.right_stick_rumble_light, "is_paused", true)
				--play the heavy stuff
				hud_touch_combo_rumble_heavy()
			end
		end
		
		--find mode, turn off the correct shit
		if show_mode ~= Hud_touch_combo_status.show_mode then
			if show_mode == 0 then 
				-- show the right stick
				vint_set_property(Hud_combo_elements.left_grp_h, "alpha", .25) 
				vint_set_property(Hud_combo_elements.right_grp_h, "alpha", 1) 
				vint_set_property(Hud_combo_elements.target_dot_h, "visible", false)
				vint_set_property(Hud_combo_elements.target_dot_big_h, "visible", true)
				hud_touch_combo_blink_right()
				
			elseif show_mode == 1 then
				--show the left stick
				vint_set_property(Hud_combo_elements.left_grp_h, "alpha", 1) 
				vint_set_property(Hud_combo_elements.right_grp_h, "alpha", 0.25) 
				vint_set_property(Hud_combo_elements.target_dot_h, "visible", true)
				vint_set_property(Hud_combo_elements.target_dot_big_h, "visible", false)
				hud_touch_combo_blink_left()
			elseif show_mode == 2 then
				--show the right stick
				vint_set_property(Hud_combo_elements.left_grp_h, "alpha", 0) 
				vint_set_property(Hud_combo_elements.right_grp_h, "alpha", 1) 
				hud_touch_combo_blink_right()
			end
		end
		
		--hide the small dot, or the big dot...
		if show_mode == 0 then
			vint_set_property(Hud_combo_elements.target_dot_h, "visible", false)
			vint_set_property(Hud_combo_elements.target_dot_big_h, "visible", true)
		else
			vint_set_property(Hud_combo_elements.target_dot_h, "visible", true)
			vint_set_property(Hud_combo_elements.target_dot_big_h, "visible", false)
		end	
		
		if rumble_level == 0 then
			hud_touch_combo_rumble_none()	
		end
		
		Hud_touch_combo_status.rumble_level = rumble_level
		Hud_touch_combo_status.show_mode = show_mode
	end	
end

function hud_touch_combo_blink_left()
	--blink left
	lua_play_anim(Hud_combo_elements.combo_stick_hl_l, 0)
	vint_set_property(Hud_combo_elements.combo_stick_hl_r, "is_paused", true)
	vint_set_property(Hud_combo_elements.right_stick_hl_h, "alpha", 0)
end

function hud_touch_combo_blink_right()
	--blink right
	lua_play_anim(Hud_combo_elements.combo_stick_hl_r, 0)
	vint_set_property(Hud_combo_elements.combo_stick_hl_l, "is_paused", true)
	vint_set_property(Hud_combo_elements.right_stick_hl_h, "alpha", 0)
end

function hud_touch_combo_rumble_light()
	lua_play_anim(Hud_combo_elements.right_stick_rumble_light, 0)
end

function hud_touch_combo_rumble_heavy()
	lua_play_anim(Hud_combo_elements.right_stick_rumble_heavy, 0)
end

function hud_touch_combo_rumble_none()
	vint_set_property(Hud_combo_elements.target_dot_big_h, "alpha", 0)
	vint_set_property(Hud_combo_elements.target_dot_big_h, "visible", false)
	lua_play_anim(Hud_combo_elements.right_stick_rumble_light, 0)
	lua_play_anim(Hud_combo_elements.right_stick_rumble_heavy, 0)
	vint_set_property(Hud_combo_elements.right_stick_rumble_light, "is_paused", true)
	vint_set_property(Hud_combo_elements.right_stick_rumble_heavy, "is_paused", true)
	vint_set_property(Hud_combo_elements.right_circle_h, "scale", 1, 1)
end

function hud_touch_combo_fade_out()
	lua_play_anim(Hud_combo_elements.combo_sticks_fade_out, 0)
end

function hud_touch_combo_fade_in()
	lua_play_anim(Hud_combo_elements.combo_sticks_fade_in, 0)
end

function hud_sexy_time_move_list_update(di_h)
	-- get the data.
	local sexy_time_direction = vint_dataitem_get(di_h)
	
	hud_sexy_time_tween_cleanup()
	if sexy_time_direction ~= -1 then
		hud_sexy_time_flash_current_movement(sexy_time_direction)
	end
end

function hud_sexy_time_create_tween(name, target_h, target_prop, duration)
	local tween_h = vint_object_create(name, "tween", vint_object_find("root_animation"))
	vint_set_property(tween_h, "duration", duration)
	vint_set_property(tween_h, "target_handle", target_h)
	vint_set_property(tween_h, "target_property", target_prop)
	vint_set_property(tween_h, "max_loops", 0)  -- doing a lot so we don't run out of this stuff.
	vint_set_property(tween_h, "loop_mode", 2)
	vint_set_property(tween_h, "algorithm", 0)
	vint_set_property(tween_h, "start_time",	vint_get_time_index() )
	vint_set_property(tween_h, "state", 1)
	return tween_h
end

function hud_sexy_time_tween_cleanup()

	if Sexy_time_tween ~= -1 then
	
		-- this is a new tween.  Stop the old one.
		local target_handle = vint_get_property(Sexy_time_tween, "target_handle")
		--vint_set_property(target_handle, "tint", 1,0,1)
		vint_object_destroy(Sexy_time_tween)
		vint_set_property(target_handle, "alpha", 0)
		Sexy_time_tween = -1
	end
	
end

Sexy_time_tweens = {}

function hud_sexy_time_flash_current_movement(current_direction)
	
	
	local current_item = 1
	local continue_processing = true
	local item_h
	local tween_h
	
	if Sexy_time_tween ~= -1 then 				-- this is a new tween.  Stop the old one.
		vint_object_destroy(Sexy_time_tween)
		Sexy_time_tween = -1
	end
	
	local time_between_flashes = .25
	local flash_duration = .25
	
	--Create Tween
	item_h = Hud_combo_elements.hud_left_stick_highlight[current_direction]		
	tween_h = hud_sexy_time_create_tween("tween" .. current_item, item_h , "alpha", flash_duration)

	vint_set_property(tween_h, "start_value", .1)
	vint_set_property(tween_h, "end_value", 1)
	
	Sexy_time_tween = tween_h
	
end