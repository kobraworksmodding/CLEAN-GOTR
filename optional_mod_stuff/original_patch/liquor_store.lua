-----------------------
-- FOOD/LIQUOR STORE --
-----------------------
--[[	Though everything is prefixed as liquor store, 
		this is the store for all food/drug/liquor 		]]--

-- "global" variables
Liquor_store_data = { }
Liquor_store_footer = { }
Liquor_store_current_selection = 0

LIQUOR_STORE_TYPE_FOOD = 0
LIQUOR_STORE_TYPE_DRUG = 1

Liquor_store_player_cash = -1

Liquor_store_is_opening = true

----------------------
--	SYSTEM FUNCTIONS --
----------------------
--[ INITIALIZE AND SHUTDOWN ]--
-------------------------------
--	Initialize the menu
function liquor_store_init()
	vint_dataitem_add_subscription("sr2_local_player_status_infrequent", "update", "liquor_store_player_cash_update")
	menu_store_use_hud(true)
	menu_store_init(false)
	hud_fade_out()
	hud_element_fade("RADIAL", 2)
	menu_init()
	menu_show(Liquor_store_menu)
end

-- Shutdown and cleanup the menu
function liquor_store_cleanup()
	hud_fade_in()
	hud_inventory_food_hide()	
end

function liquor_store_player_cash_update(di_h)
	local cash = vint_dataitem_get(di_h)
	Liquor_store_player_cash = cash
end


--[ EXIT ]--
------------
function liquor_store_exit(menu_data)
	local body = "FOOD_STORE_EXIT_PROMPT"
	local heading = "MENU_TITLE_WARNING"
	
	dialog_box_confirmation(heading, body, "liquor_store_exit_confirm")
end
function liquor_store_exit_confirm(result, action)
	if action ~= DIALOG_ACTION_CLOSE then
		return
	end
	
	if result == 0 then
		menu_close(liquor_store_exit_final)
	end
end
function liquor_store_exit_final()
	vint_document_unload(vint_document_find("liquor_store"))	
end
--------------------------
-- FOOTER FUNCTIONALITY --
--------------------------
function liquor_store_build_footer(menu_data)
	local grp = vint_object_clone(vint_object_find("liquor_store_footer"), Menu_option_labels.control_parent)
	vint_set_property(grp, "visible", true)

	if menu_data.footer ~= nil and menu_data.footer.footer_grp ~= nil and menu_data.footer.footer_grp ~= 0 then
		vint_object_destroy(menu_data.footer.footer_grp)
	end

	menu_data.footer = { }
	menu_data.footer.footer_grp = grp
	
	Liquor_store_footer.label_h = vint_object_find("price_label", grp)
	Liquor_store_footer.price_h = vint_object_find("price_amount", grp)
	Liquor_store_footer.benefit_h = vint_object_find("benefit_label", grp)
	
	vint_set_property(Liquor_store_footer.price_h , "visible", true)
	
	--Build second horizontal rule
	local bg_h = vint_object_find("menu_bg_header_hr", Menu_option_labels.control_parent)
	local bg_h = vint_object_clone(bg_h, grp)
	vint_object_rename(bg_h, "footer_line")
	vint_set_property(bg_h, "anchor", -17, 48)
	
	Liquor_store_footer.line_h = bg_h
	
	--Attach button tips to this footer_grp
	btn_tips_footer_build(grp, -5, 57)
	
	if Liquor_store_data.type == LIQUOR_STORE_TYPE_FOOD then
		vint_set_property(Liquor_store_footer.benefit_h, "visible", true)
	else 
		vint_set_property(Liquor_store_footer.benefit_h, "visible", false)
	end
end

function liquor_store_update_footer(idx)
	local swatch = Liquor_store_menu[0].swatches[idx]
	if Liquor_store_player_cash < swatch.price then
		vint_set_property(Liquor_store_footer.price_h, "tint", 1, 0, 0)
	else
		vint_set_property(Liquor_store_footer.price_h, "tint", 0.88, 0.749, 0.05)
	end

	vint_set_property(Liquor_store_footer.price_h, "text_tag", "$" .. format_cash(swatch.price))
	
	if Liquor_store_data.type == LIQUOR_STORE_TYPE_FOOD then
		local values = { [0] = swatch.benefit .. "%%"}
		local tag = vint_insert_values_in_string("FOOD_STORE_BENEFIT", values)
		vint_set_property(Liquor_store_footer.benefit_h, "text_tag", tag)
	end
	vint_set_property(Liquor_store_footer.label_h, "text_tag_crc", swatch.label_crc)
	
	local slot_highlight = liquor_store_check_slots(swatch.id, true)
		if slot_highlight == -1 then
			slot_highlight = nil
		end
	
	if Liquor_store_is_opening == true then
		thread_new("liquor_store_delayed_food_highlight", slot_highlight)
	else
		hud_inventory_food_highlight_slot(slot_highlight)		
	end
end

function liquor_store_delayed_food_highlight(slot_highlight)
	delay(.2)
	Liquor_store_is_opening = false
	hud_inventory_food_show()
	hud_inventory_food_highlight_slot(slot_highlight)
end

function liquor_store_finalize_footer(menu_data)
	vint_set_property(Liquor_store_footer.price_h, "anchor", menu_data.menu_width - 10, 0)
	
	--Scale extra line for button tips
	local source_x, source_y = vint_get_property(Liquor_store_footer.line_h, "source_se")
	vint_set_property(Liquor_store_footer.line_h, "source_se", menu_data.menu_width + 10, source_y)
end

function	liquor_store_release(menu_data)
	if menu_data.footer ~= nil then
		vint_set_property(menu_data.footer.footer_grp, "visible", false)
		vint_object_destroy(menu_data.footer.footer_grp)
	end
	menu_grid_release(menu_data[0])
end

------------------------
--	MENU FUNCTIONALITY --
------------------------
function liquor_store_init_store(menu_data)
	local menu_item = menu_data[0]
	
	menu_item.swatches = { num_swatches = 0 }
	menu_item.cur_idx = 0
	
	vint_dataresponder_request("liquor_store_setup_menu", "liquor_store_get_menu_data", 0)
	vint_dataresponder_request("liquor_store_populate_menu", "liquor_store_add_items", 0)
	
	menu_data.header_label_crc = Liquor_store_data.title_crc
	local master_swatch = vint_object_find("swatch_general", nil, MENU_BASE_DOC_HANDLE)
	
	--Event Tracking 
	if menu_data.store_type == LIQUOR_STORE_TYPE_FOOD then
		event_tracking_interface_enter("Food Store")
	else
		event_tracking_interface_enter("Liqour Store")
	end
	
	liquor_store_sort_swatches(menu_item.swatches)
	menu_grid_show(menu_data, menu_item, master_swatch)	
	liquor_store_build_footer(menu_data)
	liquor_store_update_footer(0)
end

function liquor_store_sort_swatches(swatches)
	local temp
	local flag = false
	
	while flag == false do
		flag = true
		for i = 0, swatches.num_swatches - 2 do
			if swatches[i].price > swatches[i + 1].price then
				temp = swatches[i]
				swatches[i] = swatches[i + 1]
				swatches[i + 1] = temp
				flag = false
				i = swatches.num_swatches
			end
		end
	end
end

function liquor_store_update_swatch(swatch)
	local icon_h = vint_object_find("icon", swatch.swatch_h)
	local icon_highlight_h = vint_object_find("icon_highlight", swatch.swatch_h)
	local icon_select_h = vint_object_find("icon_select", swatch.swatch_h)
	vint_set_property(icon_h, "image", swatch.bitmap_name)
	vint_set_property(icon_highlight_h, "image", swatch.bitmap_name)
	vint_set_property(icon_select_h, "image", swatch.bitmap_name)
end

function liquor_store_get_menu_data(store_title_crc, store_type)
	Liquor_store_data = { title_crc = store_title_crc, type = store_type }
end

function liquor_store_add_items(display_name, display_name_crc, bitmap_name, price, benefit)
	local swatches = Liquor_store_menu[0].swatches
	
	swatches[swatches.num_swatches] = 
	{ label_str = display_name, label_crc = display_name_crc, bitmap_name = bitmap_name, price = price, benefit = benefit, id = swatches.num_swatches }
	swatches.num_swatches = swatches.num_swatches + 1	
end

function liquor_store_select_item(menu_label, menu_data)
	local swatches = menu_data.swatches
	
	if Liquor_store_current_selection < swatches.num_swatches then
		local body = ""
		local heading = ""
		
		if Liquor_store_player_cash > swatches[Liquor_store_current_selection].price then
			local inv_full, drug_name, bitmap_name = liquor_store_check_slots(swatches[Liquor_store_current_selection].id)
			if inv_full == 1 then
				local price = format_cash(swatches[Liquor_store_current_selection].price) 
				local insert_values = { 
					[0] = drug_name, 
					[1] = bitmap_name, 
					[2] = swatches[Liquor_store_current_selection].label_crc, 
					[3] = swatches[Liquor_store_current_selection].bitmap_name, 
					[4] = price,
				}
				body = vint_insert_values_in_string("FOOD_STORE_REPLACE_DRUG_PROMPT", insert_values)
				heading = "MENU_TITLE_CONFIRM"
				dialog_box_confirmation(heading, body, "liquor_store_confirm_selection")
			elseif inv_full == 0 then
				local price = format_cash(swatches[Liquor_store_current_selection].price)
				local insert_values = { 
					[0] = swatches[Liquor_store_current_selection].label_crc, 
					[1] = swatches[Liquor_store_current_selection].bitmap_name, 
					[2] = price, 
				} 
				body = vint_insert_values_in_string("FOOD_STORE_PURCHASE_DRUG_PROMPT", insert_values)
				heading = "MENU_TITLE_CONFIRM"
				dialog_box_confirmation(heading, body, "liquor_store_confirm_selection")
			else
				heading = "MENU_TITLE_NOTICE"
				body = "STORE_CANNOT_CARRY_ANYMORE_HEADING"
				dialog_box_message(heading, body)
			end
		else
			heading = "MENU_TITLE_NOTICE"
			body = "HUD_SHOP_INSUFFICIENT_FUNDS"
			dialog_box_message(heading, body)
		end
	end
end

function liquor_store_confirm_selection(result, action)
	if action ~= DIALOG_ACTION_CLOSE then
		return
	end
	
	if result == 0 then
		liquor_store_make_purchase(Liquor_store_menu[0].swatches[Liquor_store_current_selection].id)
		audio_play(Menu_sound_purchase)
		liquor_store_update_footer(Liquor_store_current_selection)
	end
end

function liquor_store_nav_item(menu_label, menu_data)
	local swatches = menu_data.swatches
	local idx = menu_data.cur_row * menu_data.num_cols + menu_data.cur_col
	
	if idx < swatches.num_swatches then
		Liquor_store_current_selection = idx
		liquor_store_update_footer(idx)
	end
end

---------------
-- MENU DATA --
---------------
Liquor_store_menu = {
	header_str = "NONE",
	on_show 	  = liquor_store_init_store,
	on_back 	  = liquor_store_exit,
	on_release = liquor_store_release,
	on_post_show = liquor_store_finalize_footer,

	num_items = 1,
	[0] = { label = "", type = MENU_ITEM_TYPE_GRID, on_select = liquor_store_select_item, on_nav = liquor_store_nav_item,
		row_height = MENU_SWATCH_DEFAULT_ROW_HEIGHT, num_cols = 4, col_width = MENU_SWATCH_DEFAULT_COL_WIDTH, highlight_scale = 1, unhighlight_scale = 0.8, update_swatch=liquor_store_update_swatch 
	},

	footer_height = 83,
}

