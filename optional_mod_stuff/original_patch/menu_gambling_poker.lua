function menu_gambling_poker_init()
	peg_load("ui_gambling")
	--bitmap_sheets_update()
	local safe_frame_h = vint_object_find("safe_frame")
	vint_set_property(safe_frame_h, "anchor", 0.5,0.5)
	--debug_print("vint", "menu_gambling_init()\n")
end

function menu_gambling_poker_cleanup()
	peg_unload("ui_gambling")
	--bitmap_sheets_update()
end

function shot_start()
	debug_print("test", "Shot is now starting!\n")
end