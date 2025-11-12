function ss_grid_init()
end

function ss_grid_cleanup()
end


function ss_grid_golden_ratio()
	local thirds = vint_object_find("thirds")
	vint_set_property(thirds, "visible", false)
	local golden_ratio = vint_object_find("golden_ratio")
	vint_set_property(golden_ratio, "visible", true)
end

function ss_grid_thirds()
	local thirds = vint_object_find("thirds")
	vint_set_property(thirds, "visible", true)
	local golden_ratio = vint_object_find("golden_ratio")
	vint_set_property(golden_ratio, "visible", false)
end

function ss_grid_hide()
	local thirds = vint_object_find("thirds")
	vint_set_property(thirds, "visible", false)
	local golden_ratio = vint_object_find("golden_ratio")
	vint_set_property(golden_ratio, "visible", false)
end