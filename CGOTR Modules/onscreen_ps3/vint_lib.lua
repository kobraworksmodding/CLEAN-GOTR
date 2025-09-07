GAME_BUILD_DATE = "0000-00-00 20:00:00"

MENU_NUM_SLIDER_ACCEL_REPEAT =	0.08
MENU_NUM_SLIDER_ACCEL_FACTOR =	15
MENU_NUM_SLIDER_ACCEL_LIMIT =		1000

Pcr_open_plastic_surgeon = false

COLOR_DEFAULT_TEXT = { r = 230, g = 230, b = 230 }

-- some docs need to know what menu mode we are doing
-- set this from C before loading menu docs
Menu_mode_current = ""

Main_menu_controller_selected = false
Main_menu_gameboot_complete = false
Menu_swap_in_progress = false

Main_menu_can_has_input = false

 --stored here so we know how to properly restart the clothing store
Clothing_store_name = "DEBUG_CLOTHING_STORE"
Clothing_store_display_name = 0
Clothing_store_original_name = "DEBUG_CLOTHING_STORE"
Clothing_store_original_display_name = 0
Menu_swap_interface_unload_handle = 0
Menu_swap_interface_reload_name = 0
Menu_swap_callback_function = 0
Menu_swap_hud_hidden = false;

INVALID_NUM_FRAMES = -1
Num_frames_from_switch = INVALID_NUM_FRAMES

Pause_menu_save_for_server_drop = false

DIALOG_OPEN_SOUND 		= "SYS_HUD_HELPTEXT"
DIALOG_SERIOUS_SOUND	= "SYS_HUD_CONF_SERIOUS"
Menu_sound_item_nav		= "SYS_MENU_CLICK_UD"		-- Current menu item changes
Menu_sound_value_nav	= "SYS_MENU_CLICK_LR"		-- Value of current item changes
Menu_sound_select		= "SYS_MENU_SELECT"			-- Current item selected
Menu_sound_scroll		= "SYS_MENU_TRIGGER_LR"		-- Horizontal menu changes
Menu_sound_back			= "SYS_MENU_BACK"			-- Current menu changes to previous
Menu_sound_open			= "SYS_MENU_OPEN"			-- Menu system is opened
Menu_sound_close		= "SYS_MENU_CLOSE"			-- Menu system is closed
Menu_sound_warning		= "SYS_MENU_OPEN"			-- Warning dialog opens
Menu_sound_purchase		= "SYS_MENU_PURCHASE"		-- Any item is purchased
Menu_sound_confirm		= "SYS_HUD_CONF_SERIOUS"	-- Confirmation/warning dialog opens
Menu_sound_reward		= "SYS_HUD_CONF_REWARD"		-- Reward notification dialog


function vint_init_general_audio()
	DIALOG_OPEN_SOUND 		= audio_get_audio_id(DIALOG_OPEN_SOUND)
	DIALOG_SERIOUS_SOUND	= audio_get_audio_id(DIALOG_SERIOUS_SOUND)
	Menu_sound_item_nav		= audio_get_audio_id(Menu_sound_item_nav)
	Menu_sound_value_nav	= audio_get_audio_id(Menu_sound_value_nav)
	Menu_sound_select		= audio_get_audio_id(Menu_sound_select)	
	Menu_sound_scroll		= audio_get_audio_id(Menu_sound_scroll)	
	Menu_sound_back			= audio_get_audio_id(Menu_sound_back)
	Menu_sound_open			= audio_get_audio_id(Menu_sound_open)
	Menu_sound_close		= audio_get_audio_id(Menu_sound_close)
	Menu_sound_warning		= audio_get_audio_id(Menu_sound_warning)
	Menu_sound_purchase		= audio_get_audio_id(Menu_sound_purchase)
	Menu_sound_confirm		= audio_get_audio_id(Menu_sound_confirm)
	Menu_sound_reward		= audio_get_audio_id(Menu_sound_reward)
end

function vint_menu_swap_thread()
	while true do
		if Menu_swap_interface_reload_name ~= 0 then
			if Menu_swap_hud_hidden == false then
				hud_hide(true);
				Menu_swap_hud_hidden = true
			end
			if Num_frames_from_switch ~= INVALID_NUM_FRAMES then
				Num_frames_from_switch = Num_frames_from_switch + 1
			end
			if Num_frames_from_switch > 2 then
				if Menu_swap_interface_reload_name ~= 0 then
					vint_document_load(Menu_swap_interface_reload_name)
					Menu_swap_interface_reload_name = 0
					Num_frames_from_switch = INVALID_NUM_FRAMES
					Menu_swap_in_progress = false
					if Menu_swap_callback_function ~= 0 then
						Menu_swap_callback_function()
						Menu_swap_callback_function = 0
					end
				end
			end
		end
		thread_yield()
	end
end

function vint_menu_swap_invalidate()
	Menu_swap_interface_reload_name = 0
	Num_frames_from_switch = INVALID_NUM_FRAMES
	Clothing_store_name = "DEBUG_CLOTHING_STORE"
	Clothing_store_display_name = 0
	Clothing_store_original_name = "DEBUG_CLOTHING_STORE"
	Clothing_store_original_display_name = 0
	Menu_swap_interface_unload_handle = 0
	Menu_swap_interface_reload_name = 0
	Menu_swap_in_progress = false
	hud_hide(false);
	Menu_swap_hud_hidden = false
end

function vint_menu_swap_unload()
	vint_document_unload(Menu_swap_interface_unload_handle)
	Num_frames_from_switch = 0
end

function argument_unwrapper(arguments, start)
	if start < arguments.n then
		return arguments[start + 1], argument_unwrapper(arguments, start + 1)
	end	
end

function vint_dataresponder_request(data_responder_name, callback_function_name, max_records_to_return, ...)
	vint_internal_dataresponder_request(data_responder_name, callback_function_name, max_records_to_return, argument_unwrapper(arg, 0))
	while(vint_dataresponder_finished(data_responder_name) ~= true) do
		thread_yield()
		vint_internal_dataresponder_request(data_responder_name, callback_function_name, max_records_to_return, argument_unwrapper(arg, 0))
	end
end

--[[
#########################################################################
UTILITY FUNCTIONS 
#########################################################################
]]

function set_text_tag(text_element_h, text_crc, text_string)
	--Set Label
	if text_crc == 0 and text_string == nil then
		--no string
		vint_set_property(text_element_h,"text_tag", "")
	elseif text_crc == 0 then
		--use string
		vint_set_property(text_element_h, "text_tag", text_string)
	elseif text_crc == nil then
		--Label crc invalid
		vint_set_property(text_element_h,"text_tag", "")
	else
		--use crc
		vint_set_property(text_element_h, "text_tag_crc",text_crc)
	end
end

--Easy Start Anim
function lua_play_anim(anim_h, start_time_offset, doc)
	if start_time_offset == nil then
		start_time_offset = 0
	end
	
	local start_time = vint_get_time_index(doc) + start_time_offset
	
	vint_set_property(anim_h, "is_paused", false)
	vint_set_property(anim_h, "start_time", start_time)
end

--Easy Play tween method
function lua_play_tween(tween_handle, target_handle, start_time_offset)
	vint_set_property(tween_handle, "target_handle",	target_handle)
	vint_set_property(tween_handle, "start_time",		vint_get_time_index() + start_time_offset)
	vint_set_property(tween_handle, "state",				"running")
end

function var_to_string(var)
	if type(var) == "table" then
		return "{table}"
	elseif var == nil then
		return "nil"
	elseif var == true then
		return "true"
	elseif var == false then
		return "false"
	else
		return var
	end
end

--Sets actual size of the element. This is independant of the parent scaler values.
function element_set_actual_size(element_h, width, height)
	local current_width, current_height = vint_get_property(element_h, "unscaled_size")
	if current_width == nil or current_height == nil then
		debug_print("vint", "Can't set actual size, element handle: " .. element_h .. " does not exist.\n")
		return
	end
	local scale_x = width/current_width
	local scale_y = height/current_height
	vint_set_property(element_h, "scale", scale_x, scale_y)
end

--Returns actual size of the element, indpendant from the parent scaler values.
function element_get_actual_size(element_h)
	local width, height = vint_get_property(element_h, "unscaled_size")
	local scale_x, scale_y = vint_get_property(element_h, "scale")
	width = width * scale_x
	height = height * scale_y
	return width, height
end

--Useful Mod function
function mod(number, divisor)
	return number - (divisor * floor(number/divisor))
end

-- Support for hud monkey business
Hud_has_focus = true

-- Math stuffs
PI = 3.1415
PI2 = 6.283

--=======================================
--MP Utilities
--=======================================
MP_gameplay_mode_names = {
	"Pre-game lobby",
	"Gangsta Brawl",
	"Team Gangsta Brawl",
	"Braveheart",
	"Multiplayer Creation",
	"Multiplayer Customization",
	"Multiplayer Game Results",
	"Multiplayer Scoreboard",
	"Multiplayer Tutorial",
}

function mp_is_enabled()
	--Get some multiplayer Data
	local gp_mode = get_pending_game_play_mode()
	for i, m in pairs( MP_gameplay_mode_names ) do
		if gp_mode == m then
			--found a match
			return true
		end
	end
	
	gp_mode = get_game_play_mode()
	for i, m in pairs( MP_gameplay_mode_names ) do
		if gp_mode == m then
			--found a match
			return true
		end
	end
	return false
end



--#######################################
--Audio Delay
--#######################################
function audio_play_delayed(sound_id, offset)
	thread_new("audio_play_delayed_thread", sound_id, offset)
end

function audio_play_delayed_thread(sound_id, offset)
	delay(offset)
	audio_play(sound_id)
end

function format_cash(cash)
	return format_int_to_string(cash)
end

function format_cash_add_padding(c)
	if c < 10 then
		return "00" .. c
	elseif c < 100 then
		return "0" .. c
	else 
		return c
	end
end

function format_clock(time_in_seconds)

	local neg_symbol = ""
	
	if time_in_seconds < 0 then
		time_in_seconds = abs(time_in_seconds)
		neg_symbol  = "-"
	end

	---Format the time
	local minutes = floor(time_in_seconds / 60)
	local seconds =  mod(time_in_seconds, 60)
	--Pad the seconds for the timer
	if seconds < 10 then
		seconds = "0" .. seconds
	end
	return neg_symbol .. minutes .. ":" .. seconds
end

-- this is now unofficially get_confirm_button!
function get_a_button()
	local button
	if get_platform() == "XBOX360" then
		button = "ui_ctrl_360_btn_a"
	elseif get_platform() == "PS3" then
		local button_swap = get_ps3_button_swap()
		if button_swap == true then
			button = "ui_ctrl_ps3_btn_circle"
		else 
		-- old standard
			button = "ui_ctrl_ps3_btn_cross"
		end
	elseif get_platform() == "PC" then
		button = "ui_ctrl_ps3_btn_cross"
	end
	
	return button
end

function get_x_button()
	local button
	if get_platform() == "XBOX360" then
		button = "ui_ctrl_360_btn_x"
	elseif get_platform() == "PS3" then
		button = "ui_ctrl_ps3_btn_square"
	elseif get_platform() == "PC" then
		button = "ui_ctrl_ps3_btn_square"
	end
	return button
end

-- this is now unofficially get_back_button!
function get_b_button()
	local button
	if get_platform() == "XBOX360" then
		button = "ui_ctrl_360_btn_b"
	elseif get_platform() == "PS3" then
			local button_swap = get_ps3_button_swap()
		if button_swap == true then
			button = "ui_ctrl_ps3_btn_cross"
		else 
			button = "ui_ctrl_ps3_btn_circle"
		end
	elseif get_platform() == "PC" then
		button = "ui_ctrl_ps3_btn_circle"
	end
	return button
end

function get_y_button()
	local button
	if get_platform() == "XBOX360" then
		button = "ui_ctrl_360_btn_y"
	elseif get_platform() == "PS3" then
		button = "ui_ctrl_ps3_btn_triangle"
	elseif get_platform() == "PC" then
		button = "ui_ctrl_ps3_btn_triangle"
	end
	return button
end

function get_right_stick()
	local button
	if get_platform() == "XBOX360" then
		button = "ui_ctrl_360_btn_rs"
	elseif get_platform() == "PS3" then
		button = "ui_ctrl_ps3_btn_r3"
	elseif get_platform() == "PC" then
		button = "ui_ctrl_ps3_btn_r3"
	end
	return button
end

function get_lt_button()
	local button
	if get_platform() == "XBOX360" then
		button = "ui_ctrl_360_btn_lt"
	elseif get_platform() == "PS3" then
		button = "ui_ctrl_ps3_btn_l1"
	elseif get_platform() == "PC" then
		button = "ui_ctrl_ps3_btn_l2"
	end
	return button
end

function get_rt_button()
	local button
	if get_platform() == "XBOX360" then
		button = "ui_ctrl_360_btn_rt"
	elseif get_platform() == "PS3" then
		button = "ui_ctrl_ps3_btn_r1"
	elseif get_platform() == "PC" then
		button = "ui_ctrl_ps3_btn_r2"
	end
	return button
end

function get_lb_button()
	local button
	if get_platform() == "XBOX360" then
		button = "ui_ctrl_360_btn_lb"
	elseif get_platform() == "PS3" then
		button = "ui_ctrl_ps3_btn_l2"
	elseif get_platform() == "PC" then
		button = "ui_ctrl_ps3_btn_l1"
	end
	return button
end

function get_rb_button()
	local button
	if get_platform() == "XBOX360" then
		button = "ui_ctrl_360_btn_rb"
	elseif get_platform() == "PS3" then
		button = "ui_ctrl_ps3_btn_r1"
	elseif get_platform() == "PC" then
		button = "ui_ctrl_ps3_btn_r1"
	end
	return button
end

function get_left_right()
	local button
	if get_platform() == "XBOX360" then
		button = "ui_ctrl_360_dpad_lr"
	elseif get_platform() == "PS3" then
		button = "ui_ctrl_ps3_dapd_lr"
	elseif get_platform() == "PC" then
		button = "ui_ctrl_ps3_dapd_lr"
	end
	return button
end

function get_up_down()
	local button
	if get_platform() == "XBOX360" then
		button = "ui_ctrl_360_dpad_ud"
	elseif get_platform() == "PS3" then
		button = "ui_ctrl_ps3_dpad_ud"
	elseif get_platform() == "PC" then
		button = "ui_ctrl_ps3_dpad_ud"
	end
	return button
end

function get_left_trigger()
	local button
	if get_platform() == "XBOX360" then
		button = "ui_ctrl_360_btn_lt"
	elseif get_platform() == "PS3" then
		button = "ui_ctrl_ps3_btn_l2"
	elseif get_platform() == "PC" then
		button = "ui_ctrl_ps3_btn_l2"
	end
	return button
end

function get_right_trigger()
	local button
	if get_platform() == "XBOX360" then
		button = "ui_ctrl_360_btn_rt"
	elseif get_platform() == "PS3" then
		button = "ui_ctrl_ps3_btn_r2"
	elseif get_platform() == "PC" then
		button = "ui_ctrl_ps3_btn_r2"
	end
	return button
end

function get_control_stick_base()
	local image
	if get_platform() == "XBOX360" then
		image = "ui_hud_base_radial_base_xbox"
	elseif get_platform() == "PS3" then
		image = "ui_hud_base_radial_base_ps3"
	elseif get_platform() == "PC" then
		image = "ui_hud_base_radial_base_ps3"
	end
	return image
end

function get_control_stick_thumb()
	local image
	if get_platform() == "XBOX360" then
		image = "ui_hud_base_radial_thumb_xbox"
	elseif get_platform() == "PS3" then
		image = "ui_hud_base_radial_thumb_ps3"
	elseif get_platform() == "PC" then
		image = "ui_hud_base_radial_thumb_ps3"
	end
	return image
end

function get_control_stick_text()
	local text
	
	if pause_menu_is_using_southpaw_control_scheme() == true and is_local_player_in_vehicle() == false then
		if get_platform() == "XBOX360" then
			text = "RS"
		elseif get_platform() == "PS3" then
			text = "R3"
		elseif get_platform() == "PC" then
			text = "R"
		end	
	else 
		if get_platform() == "XBOX360" then
			text = "LS"
		elseif get_platform() == "PS3" then
			text = "L3"
		elseif get_platform() == "PC" then
			text = "L"
		end
	end 
	return text
end

function get_dpad_image()
	local image
	if get_platform() == "XBOX360" then
		image = "ui_hud_base_radial_dpad_xbox"
	elseif get_platform() == "PS3" then
		image = "ui_hud_base_radial_dpad_ps3"
	elseif get_platform() == "PC" then
		image = "ui_hud_base_radial_dpad_ps3"
	end
	return image
end

function get_dpad_lr_image()
	local image
	if get_platform() == "XBOX360" then
		image = "ui_ctrl_360_dpad_lr"
	elseif get_platform() == "PS3" then
		image = "ui_ctrl_ps3_dpad_lr"
	elseif get_platform() == "PC" then
		image = "ui_ctrl_ps3_dpad_lr"
	end
	return image
end

function get_dpad_ud_image()
	local image
	if get_platform() == "XBOX360" then
		image = "ui_ctrl_360_dpad_ud"
	elseif get_platform() == "PS3" then
		image = "ui_ctrl_ps3_dpad_ud"
	elseif get_platform() == "PC" then
		image = "ui_ctrl_ps3_dpad_ud"
	end
	return image
end

function table_clone(src)
	local dst = { }
	
	for k, v in src do
--		if type(v) == "table" then
--			dst[k] = table_clone(v)
--		else
			dst[k] = v
--		end
	end
	
	return dst
end

-- convert anything to a bool
function var_to_bool(var)
	if var == true then
		return true
	elseif var == false then
		return false
	elseif var == nil then
		return false
	elseif type(var) == "function" then
		return var()
	else
		return false
	end
end
