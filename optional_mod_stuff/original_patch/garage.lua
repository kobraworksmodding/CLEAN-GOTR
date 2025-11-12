----------------------
-- GARAGE INTERFACE --
----------------------
-- "global" variables


----------------------
--	SYSTEM FUNCTIONS --
----------------------
--[ INITIALIZE AND SHUTDOWN ]--
-------------------------------
--	Initialize the menu
function garage_init()
	--Event Tracking
	event_tracking_interface_enter("Garage")

	menu_store_init(false)
	menu_init()
	menu_horz_init(Garage_vehicle_horz_menu)
end

-- Shutdown and cleanup the menu
function garage_cleanup()
	
end

--[ EXIT ]--
------------
function garage_exit(menu_data)
	local body = "GARAGE_EXIT_PROMPT"
	local heading = "MENU_TITLE_WARNING"
	
	dialog_box_confirmation(heading, body, "garage_exit_confirm")
end
function garage_exit_confirm(result, action)
	if action ~= DIALOG_ACTION_CLOSE then
		return
	end
	
	if result == 0 then
		menu_close(garage_exit_final)
	end
end
function garage_exit_final()
	vint_document_unload(vint_document_find("garage"))	
end

------------------------
--	MENU FUNCTIONALITY --
------------------------

function garage_show(menu_data)
	menu_data.num_items = 0
	
	vint_dataresponder_request("garage_populate", "garage_populate", 0)

	if menu_data.num_items == 0 then
		menu_data.num_items = 1
		menu_data.nothing = true
		menu_data[0] = { label = "GARAGE_NONE", type = MENU_ITEM_TYPE_SELECTABLE }
	end
end

function garage_post_show(menu_data)
	if menu_data.nothing == true then
		return
	end
	
	garage_preview_vehicle(menu_data[menu_data.highlighted_item].index)
end

function garage_populate(vehicle_name, repair_cost, reward_vehicle, vehicle_index)
	local num_items = Garage_menu.num_items
	Garage_menu[num_items] = { label = vehicle_name, type = MENU_ITEM_TYPE_SELECTABLE, on_select = garage_show_vehicle_menu, repair_cost = repair_cost, reward_vehicle = reward_vehicle, index = vehicle_index }
	Garage_menu.num_items = num_items + 1
end

function garage_show_vehicle_menu()
	if garage_get_repair_cost() == false then
		return
	end
	
	Garage_vehicle_menu.parent_menu = Menu_active
	menu_show(Garage_vehicle_menu, MENU_TRANSITION_SWEEP_LEFT)
	
end

function garage_nav(menu_data)
	if menu_data.nothing == true then
		return
	end

	local hl_item = menu_data.highlighted_item
	garage_preview_vehicle(menu_data[hl_item].index)
end

function garage_vehicle_show(menu_data)
	local last_data = Menu_active[Menu_active.highlighted_item]
	menu_data.header_label_str = last_data.label
	local repair_cost = garage_get_repair_cost()
	
	if repair_cost ~= 0 then
		local insert_values = { [0] = repair_cost }
		local tag = vint_insert_values_in_string("GARAGE_REPAIR_RETRIEVE", insert_values)
		menu_data[0].label = tag
		menu_data[0].on_select = garage_repair_retrieve
		menu_data[0].repair_cost = repair_cost
	else
		menu_data[0].label = "GARAGE_RETRIEVE_VEHICLE"
		menu_data[0].on_select = garage_retrieve
	end

	menu_data.highlighted_item = 0
end	

function garage_retrieve_unrepaired(result, action)
	if action ~= DIALOG_ACTION_CLOSE then
		return
	end
	
	if result == 0 then
		garage_retrieve_vehicle()
		menu_close(garage_exit_final)
	else
		menu_show(Garage_menu, MENU_TRANSITION_SWEEP_RIGHT)
		audio_play(Menu_sound_back)
	end	
end

function garage_repair_retrieve(menu_label, menu_data)
	if Style_cluster_player_cash < menu_data.repair_cost then
		dialog_box_confirmation("STORE_TITLE_INSUFFICIENT_FUNDS", "GARAGE_TEXT_INSUFFICIENT_FUNDS", "garage_retrieve_unrepaired")
		return
	end
	
--[[
	local insert_values = { [0] = menu_data.repair_cost }
	local tag = vint_insert_values_in_string("GARAGE_REPAIR_PROMPT", insert_values)
	
	dialog_box_confirmation("GARAGE_REPAIR", tag, "garage_repair_confirm") 
]]
	garage_repair_vehicle()
	garage_retrieve(menu_label, menu_data)
end

function garage_retrieve(menu_label, menu_data)
	garage_retrieve_vehicle()
	menu_close(garage_exit_final)
end 

function garage_remove(menu_label, menu_data)
	dialog_box_confirmation("MENU_TITLE_WARNING", "GARAGE_REMOVE_PROMPT", "garage_remove_confirm")
end
	
function garage_remove_confirm(result, action)
	if action ~= DIALOG_ACTION_CLOSE then
		return
	end
	
	if result == 0 then
		garage_remove_vehicle()
		menu_show(Garage_menu, MENU_TRANSITION_SWEEP_RIGHT)
		audio_play(Menu_sound_back)
	end	
end

---------------
--Button Tips
--------------
Garage_btn_tips = {
	a_button 	= 	{ label = "CONTROL_SELECT", 	enabled = btn_tips_default_a, },
	b_button 	= 	{ label = "MENU_RESUME", 			enabled = btn_tips_default_a, },
}

Garage_inner_btn_tips = {
	a_button 	= 	{ label = "CONTROL_SELECT", 	enabled = btn_tips_default_a, },
	b_button 	= 	{ label = "MENU_BACK", 			enabled = btn_tips_default_a, },
}


---------------
-- MENU DATA --
---------------
Garage_vehicle_menu = {
	header_label_str = "NONE",
	on_show = garage_vehicle_show,
	btn_tips = Garage_inner_btn_tips,
	num_items = 2,

	[0] = { label = "GARAGE_REPAIR_RETRIEVE", type = MENU_ITEM_TYPE_SELECTABLE, on_select = garage_repair_retrieve },
	[1] = { label = "GARAGE_REMOVE_VEHICLE", type = MENU_ITEM_TYPE_SELECTABLE, on_select = garage_remove },
}

Garage_menu = {
	header_label_str = "GARAGE_CRIB_NAME",
	on_show 	  		= garage_show,
	on_post_show 	= garage_post_show,
	on_nav			= garage_nav, 
	on_back			= garage_exit,
	btn_tips			= Garage_btn_tips,
	num_items  		= 0,
}

Garage_vehicle_horz_menu = {
	num_items = 1,
	current_selection = 0,
	on_back = garage_exit,

	[0] = { label = "GARAGE_CRIB_NAME",	sub_menu = Garage_menu	},
}
