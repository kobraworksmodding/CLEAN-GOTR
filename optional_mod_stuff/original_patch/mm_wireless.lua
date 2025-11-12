Mm_wireless = {}

Mm_wireless_valid_pegs = {

}

Mm_wireless_regions = {
	[24] = "DE", --XONLINE_COUNTRY_GERMANY
	[103] = "US", --XONLINE_COUNTRY_UNITED_STATES
}

function mm_wireless_init()
	Mm_wireless.handles = {}
	Mm_wireless.handles.background = vint_object_find("background")
	
	--Grab input
	Mm_wireless.input = {}
	Mm_wireless.input[0] = vint_subscribe_to_input_event(nil, "select", 			"mm_wireless_input")
	Mm_wireless.input[1] = vint_subscribe_to_input_event(nil, "back", 				"mm_wireless_input")
	Mm_wireless.input[2] = vint_subscribe_to_input_event(nil, "alt_select", 		"mm_wireless_input")
	Mm_wireless.input[3] = vint_subscribe_to_input_event(nil, "all_unassigned", "mm_wireless_input")
	
	
	local language = get_language()
	local screen_res = "1280"
	
	if vint_hack_is_std_res() then
		screen_res = "640"
	end
	
	local base_peg_name = "ui_mm_ad_"
	local base_tga_name = "ui_mainmenu_ad_"
	
	Mm_wireless.peg_name = base_peg_name .. language .. "_" .. screen_res .. ".tga"
	Mm_wireless.tga_name = base_tga_name .. language .. "_" .. screen_res .. ".tga"
	
	peg_load(Mm_wireless.peg_name)
	
	vint_set_property(Mm_wireless.handles.background, "image", Mm_wireless.tga_name )
	
end

function mm_wireless_input(target, event, accel)
	if event == "select" or event == "back" then
		vint_document_unload(vint_document_find("mm_wireless"))
	end
end

function mm_wireless_cleanup()
	peg_unload(Mm_wireless.peg_name)
	--Unsubscribe input
	for idx, val in Mm_wireless.input do
		vint_unsubscribe_to_input_event(val)
	end
	--Callback to 
	main_menu_wireless_complete()
	Mm_wireless.input = { }
end