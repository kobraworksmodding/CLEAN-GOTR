Hud_reticules = {
	configs = {
		["none"] = {
			dot = {false, false},
			ring = {false, false},
			ring_split = {false, false},
			cross = {false, false},
			cross_size = nil,
			cross_orientation = nil,
			spread = false,
			spread_style = "default",
			sniper = false,
			pressure = false,
		},
		["pistol"] = {
			dot = {true, false},
			ring = {true, true},
			ring_split = {false, false},
			cross = {false, false},
			cross_size = nil,
			cross_orientation = nil,
			spread = false,
			spread_style = "default",
			sniper = false,
			pressure = false,
		},
		["holt_55"] = {
			dot = {false, false},
			ring = {true, true},
			ring_split = {false, false},
			cross = {false, false},
			cross_size = nil,
			cross_orientation = nil,
			spread = true,
			spread_style = "default",
			sniper = false,
			pressure = false,
		},
		["shotgun"] = {
			dot = {false, false},
			ring = {true, true},
			ring_split = {false, false},
			cross = {false, false},
			cross_size = nil,
			cross_orientation = nil,
			spread = false,
			spread_style = "default",
			sniper = false,
			pressure = false,
		},
		["sub_rifle"] = {
			dot = {false, false},
			ring = {true, true},
			ring_split = {false, false},
			cross = {true, true},
			cross_size = "small",
			cross_orientation = 0,
			spread = true,
			spread_style = "smg",
			sniper = false,
			pressure = false,
		},
		["rifle"] = {
			dot = {false, false},
			ring = {false, false},
			ring_split = {false, false},
			cross = {true, true},
			cross_size = "large",
			cross_orientation = 0,
			spread = true,
			spread_style = "default",
			sniper = false,
			pressure = false,
		},
		["rpg"] = {
			dot = {false, false},
			ring = {false, false},
			ring_split = {false, false},
			cross = {true, true},
			cross_size = "large",
			cross_orientation = 1,
			spread = false,
			spread_style = "default",
			sniper = false,
			pressure = false,
		},
		["rpg_annihilator"] = {
			dot = {false, false},
			ring = {false, false},
			ring_split = {false, false},
			cross = {true, true},
			cross_size = "large",
			cross_orientation = 1,
			spread = false,
			spread_style = "default",
			sniper = false,
			pressure = false,
		},
		["thrown"] = {
			dot = {false, false},
			ring = {false, false},
			ring_split = {true, true},
			cross = {false, false},
			cross_size = nil,
			cross_orientation = nil,
			spread = false,
			spread_style = "default",
			sniper = false,
			pressure = false,
		},
		["sniper"] = {
			dot = {false, false},
			ring = {false, false},
			ring_split = {false, false},
			cross = {true, true},
			cross_size = "large",
			cross_orientation = 0,
			spread = false,
			spread_style = "sniper",
			sniper = true,
			pressure = false,
		},
		["pressure"] = {
			dot = {false, false},
			ring = {true, true},
			ring_split = {false, false},
			cross = {false, false},
			cross_size = nil,
			cross_orientation = nil,
			spread = false,
			spread_style = "default",
			sniper = false,
			pressure = true,
		}
	},
	categories = {
		["WPNCAT_MELEE"] = "none",
		["WPNCAT_PISTOL"] = "pistol",
		["WPNCAT_SHOTGUN"] = "shotgun",
		["WPNCAT_SUB_MACHINE_GUN"] = "sub_rifle",
		["WPNCAT_RIFLE"] = "rifle",
		["WPNCAT_SPECIAL"] = "shotgun",
		["WPNCAT_THROWN"] = "thrown",
		["WPNCAT_HAVOK"] = "thrown",
	},
	wpn_names = {
		["stun_gun"] = "pistol",
		["Holt_55"] = "holt_55",
		["pepper_spray"] = "shotgun",
		["fireext"] = "shotgun",
		["minigun"] = "shotgun",
		["rpg_annihilator"] = "rpg_annihilator",
		["rpg_launcher"] = "rpg",
		["mcmanus2010"] = "sniper",
		["bean_bag_gun"] = "pistol",
		["truck_2dr_septic01_Rear"] = "pressure",
		["truck_2dr_septic01_Front"] = "pressure",
		["truck_2dr_fire01"] = "pressure",
		["sp_novelty01"] = "pressure",
	},
	elements = {
		reticule_h = -1,
		dot_h = -1,
		cross_h = -1,
		cross_n_h = -1,
		cross_e_h = -1,
		cross_s_h = -1,
		cross_w_h = -1,
		ring_small_h = -1,
		ring_large_h = -1,
		ring_mask_nw_h = -1,
		ring_mask_ne_h = -1,
		ring_mask_sw_h = -1,
		ring_mask_se_h = -1,
		ring_split_h = -1,
		sniper_h = -1,
		sniper_cross_w_h = -1,
		sniper_cross_s_h = -1,
		sniper_cross_e_h = -1,
		sniper_dir_grp_h = -1,
		sniper_dir_bmp_h = -1,
		friendly_h = -1,
		pressure_grp_h = -1,
		pressure_fill_h = -1,
	},
	status = {
		wpn_name = -1,
		config = -1,
		highlight = -1,
		wpn_spread = -1,
		fine_aim = -1,
		y_screen_coord = -1,
	}, 
	spread_style = {
		["default"] = {
			cross_mag_min = 4,
			cross_mag_max = 19,
			cross_mag_fineaim_min = -1,
			cross_mag_fineaim_max = 16,
			ring_alpha = .3, 
			ring_alpha_highlight = .5,
			ring_small_min = 1,
			ring_small_max = 2.3,
			ring_small_fineaim_min = .85,
			ring_small_fineaim_max = 1.8,
			ring_large_min = 0.45,
			ring_large_max = 1,
			ring_large_fineaim_min = .27,
			ring_large_fineaim_max = 0.78,
			ring_mask_min = 0,
			ring_mask_max = 20,
			ring_mask_fineaim_min = 0,
			ring_mask_fineaim_max = 20,
		},
		["smg"] = {
			cross_mag_min = 1,
			cross_mag_max = 19,
			cross_mag_fineaim_min = -1,
			cross_mag_fineaim_max = 16,
			ring_alpha = .3, 
			ring_alpha_highlight = .5,
			ring_small_min = 1,
			ring_small_max = 2.3,
			ring_small_fineaim_min = .85,
			ring_small_fineaim_max = 1.8,
			ring_large_min = 0.45,
			ring_large_max = 1,
			ring_large_fineaim_min = .27,
			ring_large_fineaim_max = 0.78,
			ring_mask_min = 0,
			ring_mask_max = 20,
			ring_mask_fineaim_min = 0,
			ring_mask_fineaim_max = 20,
		},
		["sniper"] = {
			cross_mag_min = 15,
			cross_mag_max = 25,
			cross_mag_fineaim_min =  15,
			cross_mag_fineaim_max =  25,
			ring_alpha = .3, 
			ring_alpha_highlight = .5,
			ring_small_min = 1,
			ring_small_max = 2.3,
			ring_small_fineaim_min = .85,
			ring_small_fineaim_max = 1.8,
			ring_large_min = 0.45,
			ring_large_max = 1,
			ring_large_fineaim_min = .27,
			ring_large_fineaim_max = 0.78,
			ring_mask_min = 0,
			ring_mask_max = 20,
			ring_mask_fineaim_min = 0,
			ring_mask_fineaim_max = 20,
		}
	},
	pressure = {
		cur_value = -1,
		start_angle = 3.147,
		end_angle = 0
	}
}

Hud_sniper_arrows = {}


function hud_reticules_init()
	--Reticules
	local h = vint_object_find("reticules")
	
	Hud_reticules.elements.reticule_h = h
	Hud_reticules.elements.dot_h = vint_object_find("dot", h)
	Hud_reticules.elements.ring_small_h = vint_object_find("ring_small", h)
	Hud_reticules.elements.ring_large_h = vint_object_find("ring_large", h)
	Hud_reticules.elements.ring_split_h = vint_object_find("ring_split", h)
	Hud_reticules.elements.ring_mask_nw_h  = vint_object_find("mask_nw", h)
	Hud_reticules.elements.ring_mask_ne_h  = vint_object_find("mask_ne", h)
	Hud_reticules.elements.ring_mask_sw_h  = vint_object_find("mask_sw", h)
	Hud_reticules.elements.ring_mask_se_h  = vint_object_find("mask_se", h)
	Hud_reticules.elements.cross_h = vint_object_find("cross", h)
	Hud_reticules.elements.friendly_h = vint_object_find("friendly", h)
	
	--pressure group
	Hud_reticules.elements.pressure_grp_h =  vint_object_find("pressure_grp", h)
	Hud_reticules.elements.pressure_fill_h =  vint_object_find("pressure_fill", h)
	
	h = Hud_reticules.elements.cross_h 
	Hud_reticules.elements.cross_n_h = vint_object_find("n", h)
	Hud_reticules.elements.cross_e_h = vint_object_find("e", h)
	Hud_reticules.elements.cross_s_h = vint_object_find("s", h)
	Hud_reticules.elements.cross_w_h = vint_object_find("w", h)
	
	Hud_reticules.elements.sniper_h = vint_object_find("sniper")
	Hud_reticules.elements.sniper_dir_grp_h = vint_object_find("sniper_dir_grp")
	Hud_reticules.elements.sniper_dir_bmp_h = vint_object_find("sniper_dir_bmp")
	
	h = Hud_reticules.elements.sniper_h 
	Hud_reticules.elements.sniper_cross_w_h = vint_object_find("cross_w", h)
	Hud_reticules.elements.sniper_cross_s_h = vint_object_find("cross_s", h)
	Hud_reticules.elements.sniper_cross_e_h = vint_object_find("cross_e", h)
	
	--Data subscriptions	
	
	--Sniper Directional Indicators
	vint_datagroup_add_subscription("sniper_dir_arrows", "update", "hud_sniper_dir_update")
	vint_datagroup_add_subscription("sniper_dir_arrows", "insert", "hud_sniper_dir_add")
	vint_datagroup_add_subscription("sniper_dir_arrows", "remove", "hud_sniper_dir_remove")
	
	--Hit Indicators
	vint_datagroup_add_subscription("sr2_local_player_hit_indicator", "insert", "Hud_hit_add")
end

--####################################################################
--Reticules
--####################################################################
function Hud_reticule_update(wpn_name, wpn_category, reticule_highlight) 
	
	local reticule_layout_type = "none"
	
	if wpn_name == nil then
		--Use default layout type 
	else
		--Check weapon name first
		reticule_layout_type = Hud_reticules.wpn_names[wpn_name]
	
		--If we didn't find a match then use default category
		if reticule_layout_type == nil then
			reticule_layout_type = Hud_reticules.categories[wpn_category]
		end
	end

	local reticule_layout = Hud_reticules.configs[reticule_layout_type]
	local spread_style = Hud_reticules.spread_style[Hud_reticules.configs[reticule_layout_type].spread_style]
	
	--Error Check
 	if reticule_layout == nil then
		return
	end

	--Process reticule highlighting
	if reticule_highlight == "friendly" then

		--Tint Sniper reticules for friendly
		vint_set_property(Hud_reticules.elements.sniper_cross_w_h, "tint", .164, .63, .18)
		vint_set_property(Hud_reticules.elements.sniper_cross_s_h, "tint", .164, .63, .18)
		vint_set_property(Hud_reticules.elements.sniper_cross_e_h, "tint", .164, .63, .18)
		
	elseif reticule_highlight == "enemy" then
		
		local r_0 = .89
		if reticule_layout.dot[2] == true then
			vint_set_property(Hud_reticules.elements.dot_h, "tint", r_0, 0, 0)
		else
			vint_set_property(Hud_reticules.elements.dot_h, "tint", 1, 1, 1)
		end
		
		if reticule_layout.ring[2] == true then
			vint_set_property(Hud_reticules.elements.ring_small_h, "tint", r_0, 0, 0)
			vint_set_property(Hud_reticules.elements.ring_large_h, "tint", r_0, 0, 0)
			
			vint_set_property(Hud_reticules.elements.ring_small_h, "alpha", spread_style.ring_alpha_highlight)
			vint_set_property(Hud_reticules.elements.ring_large_h, "alpha", spread_style.ring_alpha_highlight)
			
		else
			vint_set_property(Hud_reticules.elements.ring_small_h, "tint", 1, 1, 1)
			vint_set_property(Hud_reticules.elements.ring_large_h, "tint", 1, 1, 1)
			
			vint_set_property(Hud_reticules.elements.ring_small_h, "alpha", spread_style.ring_alpha)
			vint_set_property(Hud_reticules.elements.ring_large_h, "alpha", spread_style.ring_alpha)
			
		end
				
		if reticule_layout.ring_split[2] == true then
			vint_set_property(Hud_reticules.elements.ring_split_h, "tint", r_0, 0, 0)
		else
			vint_set_property(Hud_reticules.elements.ring_split_h, "tint", 1, 1, 1)
		end
		
		if reticule_layout.cross[2] == true then
			vint_set_property(Hud_reticules.elements.cross_h, "tint", r_0, 0, 0)
		else
			vint_set_property(Hud_reticules.elements.cross_h, "tint", 1, 1, 1)
		end
		
		--Tint Sniper reticules for Enemy
		vint_set_property(Hud_reticules.elements.sniper_cross_w_h, "tint", r_0, 0, 0)
		vint_set_property(Hud_reticules.elements.sniper_cross_s_h, "tint", r_0, 0, 0)
		vint_set_property(Hud_reticules.elements.sniper_cross_e_h, "tint", r_0, 0, 0)
		
	elseif reticule_highlight == "none" then
	
		vint_set_property(Hud_reticules.elements.dot_h, "tint", 1, 1, 1)
		vint_set_property(Hud_reticules.elements.ring_small_h, "tint", 1, 1, 1)
		vint_set_property(Hud_reticules.elements.ring_large_h, "tint", 1, 1, 1)
		vint_set_property(Hud_reticules.elements.ring_split_h, "tint", 1, 1, 1)
		vint_set_property(Hud_reticules.elements.cross_h, "tint", 1, 1, 1)
		
		--Tint Sniper reticules
		vint_set_property(Hud_reticules.elements.sniper_cross_w_h, "tint", .25, .25, .25)
		vint_set_property(Hud_reticules.elements.sniper_cross_s_h, "tint", .25, .25, .25)
		vint_set_property(Hud_reticules.elements.sniper_cross_e_h, "tint", .25, .25, .25)
	end	
	
	--Toggle between friendly reticule and standard reticule parts
	if reticule_highlight == "friendly" and reticule_layout_type ~= "none" then
		--Display friendly reticule and hide other parts
		vint_set_property(Hud_reticules.elements.friendly_h, "visible", true) 
		vint_set_property(Hud_reticules.elements.dot_h, "visible", false)
		vint_set_property(Hud_reticules.elements.ring_small_h, "visible",false)
		vint_set_property(Hud_reticules.elements.ring_large_h, "visible", false)
		vint_set_property(Hud_reticules.elements.ring_split_h, "visible", false)
		vint_set_property(Hud_reticules.elements.cross_h, "visible", false)
	
	else
		--Hide friendly reticule and display the proper parts
		vint_set_property(Hud_reticules.elements.friendly_h, "visible", false) 	
		vint_set_property(Hud_reticules.elements.dot_h, "visible", reticule_layout.dot[1])
		vint_set_property(Hud_reticules.elements.ring_small_h, "visible", reticule_layout.ring[1])
		vint_set_property(Hud_reticules.elements.ring_large_h, "visible", reticule_layout.ring[1])
		vint_set_property(Hud_reticules.elements.ring_split_h, "visible", reticule_layout.ring_split[1])
		vint_set_property(Hud_reticules.elements.cross_h, "visible", reticule_layout.cross[1])

		--Cross Size
		if reticule_layout.cross_size == "large" then
			--Set all bitmaps to the large size
			vint_set_property(Hud_reticules.elements.cross_n_h, "image", "ui_hud_reticule_cross_large")
			vint_set_property(Hud_reticules.elements.cross_e_h, "image", "ui_hud_reticule_cross_large")
			vint_set_property(Hud_reticules.elements.cross_s_h, "image", "ui_hud_reticule_cross_large")
			vint_set_property(Hud_reticules.elements.cross_w_h, "image", "ui_hud_reticule_cross_large")
			vint_set_property(Hud_reticules.elements.cross_n_h, "offset", -8, -24)
			vint_set_property(Hud_reticules.elements.cross_e_h, "offset", -8, -24)
			vint_set_property(Hud_reticules.elements.cross_s_h, "offset", -8, -24)
			vint_set_property(Hud_reticules.elements.cross_w_h, "offset", -8, -24)
			
		elseif reticule_layout.cross_size == "small" then
			--Set all bitmaps to small size
			vint_set_property(Hud_reticules.elements.cross_n_h, "image", "ui_hud_reticule_cross_small")
			vint_set_property(Hud_reticules.elements.cross_e_h, "image", "ui_hud_reticule_cross_small")
			vint_set_property(Hud_reticules.elements.cross_s_h, "image", "ui_hud_reticule_cross_small")
			vint_set_property(Hud_reticules.elements.cross_w_h, "image", "ui_hud_reticule_cross_small")
			vint_set_property(Hud_reticules.elements.cross_n_h, "offset", -8, -19)
			vint_set_property(Hud_reticules.elements.cross_e_h, "offset", -8, -19)
			vint_set_property(Hud_reticules.elements.cross_s_h, "offset", -8, -19)
			vint_set_property(Hud_reticules.elements.cross_w_h, "offset", -8, -19)
		end                                                        
		
		--Cross Orientation
		if reticule_layout.cross_orientation == 0 then
			--Standard Orientation
			vint_set_property(Hud_reticules.elements.cross_h, "rotation", 0)
		elseif reticule_layout.cross_orientation == 1 then
			--45 Degree Rotation
			vint_set_property(Hud_reticules.elements.cross_h, "rotation", 0.785398163)
		end
		
	end

	
	--Show pressure gauge?
	if reticule_layout.pressure == true then
		vint_set_property(Hud_reticules.elements.pressure_grp_h, "visible", true)
	else
		vint_set_property(Hud_reticules.elements.pressure_grp_h, "visible", false)
	end
	
	--Store reticule status to internal data sets
	Hud_reticules.status.wpn_name = wpn_name
	Hud_reticules.status.highlight = reticule_highlight
	Hud_reticules.status.config = reticule_layout_type
end

function hud_reticule_spread_update(wpn_spread, show_spread)

	--debug_print("vint", "show_spread" .. var_to_string(show_spread) .. "\n")
	
	local fine_aim = Hud_weapon_status.fine_aim_transition
	local spread_style = Hud_reticules.spread_style[Hud_reticules.configs[Hud_reticules.status.config].spread_style]
	
	if spread_style == nil then
		--debug_print("vint", "Spread Style \"" .. Hud_reticules.configs[Hud_reticules.status.config].spread_style .. "\" not found in Hud_reticules.spread_style\n")
		spread_style = Hud_reticules.spread_style["default"]
	end
	
	--debug_print("vint", "spread_style" .. Hud_reticules.configs[Hud_reticules.status.config].spread_style ..  "\n")
	
	--Spread for to calculate crosshairs
	local pixel_spread
	
	local cross_mag_min = spread_style.cross_mag_min
	local cross_mag_max = spread_style.cross_mag_max
	
	cross_mag_min = cross_mag_min - ((cross_mag_min - spread_style.cross_mag_fineaim_min) * fine_aim)
	cross_mag_max = cross_mag_max - ((cross_mag_max - spread_style.cross_mag_fineaim_max) * fine_aim)
	
	--debug_print("vint", "fine_aim: " .. fine_aim .. "\n")
	--debug_print("vint", "cross_mag_min: " .. cross_mag_min .. "\n")
	--debug_print("vint", "cross_mag_max: " .. cross_mag_max .. "\n")
	
	if show_spread == true then
		pixel_spread = wpn_spread * cross_mag_max + cross_mag_min
	else
		pixel_spread = cross_mag_min
	end
	
	vint_set_property(Hud_reticules.elements.cross_n_h, "anchor", 0, -pixel_spread)
	vint_set_property(Hud_reticules.elements.cross_e_h, "anchor", pixel_spread, 0)
	vint_set_property(Hud_reticules.elements.cross_s_h, "anchor", 0, pixel_spread)
	vint_set_property(Hud_reticules.elements.cross_w_h, "anchor", -pixel_spread, 0)
	
	--If the reticule is highlighted over an enemy then the ring alpha is stronger
	local ring_alpha = 0
	if Hud_reticules.status.highlight == "enemy" then
		ring_alpha = spread_style.ring_alpha_highlight
	else
		ring_alpha = spread_style.ring_alpha
	end

	local ring_small_min = spread_style.ring_small_min 
	local ring_small_max = spread_style.ring_small_max
	local ring_large_min = spread_style.ring_large_min
	local ring_large_max = spread_style.ring_large_max
	local ring_mask_min = spread_style.ring_mask_min
	local ring_mask_max = spread_style.ring_mask_max
	
	local ring_small_min = spread_style.ring_small_min 
	local ring_small_max = spread_style.ring_small_max
	local ring_large_min = spread_style.ring_large_min
	local ring_large_max = spread_style.ring_large_max
	local ring_mask_min = spread_style.ring_mask_min
	local ring_mask_max = spread_style.ring_mask_max
	
	--Fine aim calculations
	ring_small_min = ring_small_min  - ((ring_small_min 	- spread_style.ring_small_fineaim_min) * fine_aim)
	ring_small_max = ring_small_max  - ((ring_small_max 	- spread_style.ring_small_fineaim_max) * fine_aim)
	ring_large_min = ring_large_min  - ((ring_large_min 	- spread_style.ring_large_fineaim_min) * fine_aim)
	ring_large_max = ring_large_max  - ((ring_large_max 	- spread_style.ring_large_fineaim_max) * fine_aim)
	ring_mask_min 	= ring_mask_min 	- ((ring_mask_min 	- spread_style.ring_mask_fineaim_min ) * fine_aim)
	ring_mask_max 	= ring_mask_max  	- ((ring_mask_max 	- spread_style.ring_mask_fineaim_max ) * fine_aim)
	                                                      
	local ring_small_scale, ring_small_alpha, ring_large_scale, ring_large_alpha, ring_mask_offset
	
	if show_spread == true then
		ring_small_scale = ring_small_min + wpn_spread * (ring_small_max - ring_small_min)
		ring_small_alpha = ring_alpha - (wpn_spread * 1.5) * ring_alpha
	
		if ring_small_alpha < 0 then
			ring_small_alpha = 0
		end

		ring_large_scale = ring_large_min + wpn_spread * (ring_large_max - ring_large_min)
		ring_large_alpha = (wpn_spread * 1.5) * ring_alpha
		
		if ring_large_alpha > ring_alpha then
			ring_large_alpha = ring_alpha
		end
		
		ring_mask_offset = ring_mask_min + wpn_spread * (ring_mask_max - ring_mask_min)
		
	else
		--No Spread
		ring_small_scale = ring_small_min
		ring_small_alpha = ring_alpha
		ring_large_scale = ring_large_min
		ring_large_alpha = 0
		ring_mask_offset = 0 
	end
	
	--Ring Cropping		
	vint_set_property(Hud_reticules.elements.ring_mask_nw_h, "anchor", -ring_mask_offset, -ring_mask_offset)
	vint_set_property(Hud_reticules.elements.ring_mask_ne_h, "anchor", ring_mask_offset, -ring_mask_offset)
	vint_set_property(Hud_reticules.elements.ring_mask_sw_h, "anchor", -ring_mask_offset, ring_mask_offset)
	vint_set_property(Hud_reticules.elements.ring_mask_se_h, "anchor", ring_mask_offset, ring_mask_offset)		
	
	--Ring Scaling
	vint_set_property(Hud_reticules.elements.ring_small_h, "scale", ring_small_scale, ring_small_scale)
	vint_set_property(Hud_reticules.elements.ring_small_h, "alpha", ring_small_alpha)
	vint_set_property(Hud_reticules.elements.ring_large_h, "scale", ring_large_scale, ring_large_scale)
	vint_set_property(Hud_reticules.elements.ring_large_h, "alpha", ring_large_alpha)
	
	--Dim for fine aim
	--No more dimming because the vignette has been altered
--	local fine_aim_alpha =  fine_aim * .2 + .3
--	vint_set_property(Hud_vignettes.fine_aim_dim.grp_h, "alpha", fine_aim_alpha)
	
	Hud_reticules.status.fine_aim = fine_aim
end

--##################################################################### 
--Sniper Directional Indicators
--#####################################################################
function hud_sniper_dir_update(di_h)
	local rotation = vint_dataitem_get(di_h)
	
	--Find the arrow to update
	for index, value in Hud_sniper_arrows do
		if index == di_h then
			--Found now update the rotation
			vint_set_property(value.arrow_h, "rotation", rotation)
			break
		end
	end
end

function hud_sniper_dir_add(di_h)
	
	--TODO: look through the table to make sure we don't have one already
	--Clone bitmap
	local arrow_clone_h = vint_object_clone(Hud_reticules.elements.sniper_dir_bmp_h)
	
	vint_set_property(arrow_clone_h, "visible", true)
	
	--Add handle to data object
	Hud_sniper_arrows[di_h] = {
		arrow_h = arrow_clone_h
	}
	
	--update the sniper arrow
	hud_sniper_dir_update(di_h)
end

function hud_sniper_dir_remove(di_h)
	--Find the arrow to remove
	for index, value in Hud_sniper_arrows do
		if index == di_h then
			vint_object_destroy(value.arrow_h)
			Hud_sniper_arrows[index] = nil
			break
		end
	end
end

function hud_reticule_update_pressure(pressure_value)
	if pressure_value == nil then
		return
	end
	--invert value
	pressure_value = 1 - pressure_value
	--TODO: Update pressure
	if pressure_value ~= Hud_reticules.pressure.cur_value then
		--calculate angle and set property
		local angle = Hud_reticules.pressure.start_angle * pressure_value
		vint_set_property(Hud_reticules.elements.pressure_fill_h, "start_angle", angle)
		Hud_reticules.pressure.cur_value = pressure_value
	end
end

function hud_reticule_change_position(y_screen_coord)
	--Change the y screen anchor of the reticule
	if Hud_reticules.status.y_screen_coord ~= y_screen_coord then
		local x, y = vint_get_property(Hud_reticules.elements.reticule_h, "anchor")
		vint_set_property(Hud_reticules.elements.reticule_h, "anchor", x, y_screen_coord)
		hud_cruise_control_update_pos(y_screen_coord)
		hud_hits_updates_pos(y_screen_coord)
		Hud_reticules.status.y_screen_coord = y_screen_coord 
	end
end