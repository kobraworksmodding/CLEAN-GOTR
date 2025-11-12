--Touch_combo_data = {}


--##################################################################### 
--Touch Combo System
--#####################################################################


-- Hud_mp_snatch_elements = {
-- 	main_grp_h = -1,
-- 	head_img_bg_h = -1,
-- 	recruitment_fill_h = -1,
-- }


-- show_mode
-- 0 = Show Right stick
-- 1 = Show Both sticks
-- 2 = Show Right stick, dim left stick.


Hud_mp_snatch_info = {	
	--hos Info
	hos = { },
	johns = { },
}



function hud_mp_snatch_init()
	--Find objects
	Hud_mp_snatch_elements.main_grp_h = vint_object_find("Extra_homie")
	Hud_mp_snatch_elements.snatch_grp_h = vint_object_find("mp_snatch_john")
	local h = Hud_mp_snatch_elements.snatch_grp_h
	Hud_mp_snatch_elements.snatch_heart_1 = vint_object_find("mp_snatch_heart_1", h)
	Hud_mp_snatch_elements.snatch_heart_2 = vint_object_find("mp_snatch_heart_2", h)
	Hud_mp_snatch_elements.snatch_heart_3 = vint_object_find("mp_snatch_heart_3", h)
	Hud_mp_snatch_elements.snatch_heart_4 = vint_object_find("mp_snatch_heart_4", h)
	Hud_mp_snatch_elements.snatch_heart_5 = vint_object_find("mp_snatch_heart_5", h)
	
	vint_set_property(Hud_mp_snatch_elements.snatch_heart_1, "tint", 0.5, 0.5, 0.5)
	vint_set_property(Hud_mp_snatch_elements.snatch_heart_2, "tint", 0.5, 0.5, 0.5)
	vint_set_property(Hud_mp_snatch_elements.snatch_heart_3, "tint", 0.5, 0.5, 0.5)
	vint_set_property(Hud_mp_snatch_elements.snatch_heart_4, "tint", 0.5, 0.5, 0.5)
	vint_set_property(Hud_mp_snatch_elements.snatch_heart_5, "tint", 0.5, 0.5, 0.5)
	
	-- Touch Combo HUD
	vint_datagroup_add_subscription("mp_snatch_ho_indicator_data", "insert", "hud_mp_snatch_system_update")
	vint_datagroup_add_subscription("mp_snatch_ho_indicator_data", "update", "hud_mp_snatch_system_update")
	vint_datagroup_add_subscription("mp_snatch_ho_indicator_data", "remove", "hud_mp_snatch_system_update")
	
	vint_datagroup_add_subscription("mp_snatch_john_indicator_data", "insert", "hud_mp_john_system_update")
	vint_datagroup_add_subscription("mp_snatch_john_indicator_data", "update", "hud_mp_john_system_update")
	vint_datagroup_add_subscription("mp_snatch_john_indicator_data", "remove", "hud_mp_john_system_update")	
end



function hud_mp_snatch_system_update(di_h, event)
	
	
	local index, screen_x, screen_y, z_depth, distance, recruit_pct, follower_index, contested, friendly_recruiting, is_visible, bitmap_head  = vint_dataitem_get(di_h)
	
	if event == "insert"  or event == "update" then

		--check to see if there is a ho indicator for the index
		if Hud_mp_snatch_info.hos[index] == nil then
			
			
			--Doesn't currently exist so create the ho indicator
			local grp_h = vint_object_clone(Hud_mp_snatch_elements.main_grp_h)
			local head_h = vint_object_find("Follower_head", grp_h)
			local fill_h = vint_object_find("Follower_health_fill", grp_h)			
			
			local end_angle = 1.57
			vint_set_property(fill_h, "end_angle", end_angle )
						
			-- record everything here for later. 
			Hud_mp_snatch_info.hos[index] = {
				grp_h = grp_h,
				head_h = head_h,
				fill_h = fill_h,
				screen_x = screen_x,
				screen_y = screen_y,
				z_depth = z_depth,
				distance = distance,
				recruit_pct = recruit_pct,
				follower_index = follower_index,
				contested = contested,
				friendly_recruiting = friendly_recruiting,
				is_visible = is_visible,
				bitmap_head = bitmap_head,
			}			
			
			
			-- initialize it
			if contested then
				vint_set_property(fill_h,  "image", "ui_hud_base_smcirc_ammo")
			else 
				if friendly_recruiting then
					vint_set_property(fill_h,  "image", "ui_hud_base_smcirc_mp_ho")
				else 
					vint_set_property(fill_h,  "image", "ui_hud_base_smcirc_health")
				end
			end	
			
			vint_set_property(head_h, "image", bitmap_head)
					
			if follower_index ~= 0  then
			
				local follower_master_obj_h = vint_object_find("followers");
				local main_x, main_y = vint_get_property(follower_master_obj_h, "anchor")
				local anchor_x, anchor_y = vint_get_property(Hud_followers.slot_objects[follower_index].group_h, "anchor")
					
				main_x = main_x + anchor_x
				main_y = main_y + anchor_y
				
				
				vint_set_property(grp_h, "anchor", main_x, main_y)	

				vint_set_property(grp_h, "scale", 1.0, 1.0)
					
				vint_set_property(grp_h, "depth", z_depth)
			end 
			
			--Update Health
			local end_angle = 1.57 + (1.57 * recruit_pct)
			vint_set_property(fill_h, "end_angle", end_angle )
			
		end
		
		
		--Shorter name for ease of use
		local ho = Hud_mp_snatch_info.hos[index]
	
		
		if is_visible == false then
		--visible false
		vint_set_property(ho.grp_h, "visible", false)
		else
		--visible true
		vint_set_property(ho.grp_h, "visible", true)
		end
		
		--Update Health
		if recruit_pct ~= ho.recruit_pct then
			local end_angle = 1.57 + (1.57 * recruit_pct)
			vint_set_property(ho.fill_h, "end_angle", end_angle )
			ho.recruit_pct = recruit_pct
		end
		
		if bitmap_head ~= ho.bitmap_head then
			vint_set_property(ho.head_h, "image", bitmap_head)
			ho.bitmap_head = bitmap_head
		end
				
		if follower_index ~= 0  then
			local follower_master_obj_h = vint_object_find("followers");
			local main_x, main_y = vint_get_property(follower_master_obj_h, "anchor")
			local anchor_x, anchor_y = vint_get_property(Hud_followers.slot_objects[follower_index].group_h, "anchor")
				
			main_x = main_x + anchor_x
			main_y = main_y + anchor_y
			
			
			vint_set_property(ho.grp_h, "anchor", main_x, main_y)	

			vint_set_property(ho.grp_h, "scale", 1.0, 1.0)
					
			vint_set_property(ho.grp_h, "depth", z_depth)
				
			
		else
			--Screen Position
			-- ummm?
			
			local grp_width = 64			
			local x = screen_x -- (grp_width * 0.5)
			local y = screen_y
			vint_set_property(ho.grp_h, "anchor", x, y)	

			--Scale
			local maxclamp = 0.40
			local minclamp = 0.1
			
			local maxscale = 1
			local minscale = 0.5
			
			--Clamp the distances
			if distance <= minclamp then
				distance = minclamp 
				elseif distance >= maxclamp then
				distance = maxclamp
			end

			local newdist = (distance - minclamp)
			local ratio = 1 - (newdist / (maxclamp - minclamp))
			local scale = (ratio * (maxscale-minscale)) + minscale
		

			vint_set_property(ho.grp_h, "scale", scale, scale)
			--vint_set_property(ho.grp_h, "alpha", scale)
				
			--Z Depth
			if z_depth ~= ho.z_depth then
				vint_set_property(ho.grp_h,  "depth", z_depth)
			end
			
		end
	
		if contested then
			if not ho.contested then
				-- set the punk yellow!
				vint_set_property(ho.fill_h,  "image", "ui_hud_base_smcirc_ammo")
				ho.contested = contested
			end
		else 
			if friendly_recruiting then
				if (not ho.friendly_recruiting) or ho.contested then
					-- set the ho green
					vint_set_property(ho.fill_h,  "image", "ui_hud_base_smcirc_mp_ho")
					ho.friendly_recruiting = friendly_recruiting
				end
			else 
				-- got this far, your unfriendly!
				if ho.friendly_recruiting or ho.contested then
					vint_set_property(ho.fill_h,  "image", "ui_hud_base_smcirc_health")
					ho.friendly_recruiting = friendly_recruiting
				end
			end
		end	
		
		ho.recruit_pct = recruit_pct
		ho.screen_x = screen_x 		
		ho.screen_y = screen_y 		
		ho.z_depth = z_depth
		ho.distance = distance
		ho.follower_index = follower_index
		ho.contested = contested
		ho.friendly_recruiting = friendly_recruiting
		ho.is_visible = is_visible
		

	end
	
	--If you got a remove event, remove the clones	
	if event == "remove" and Hud_mp_snatch_info.hos[index] ~= nil then
		local ho = Hud_mp_snatch_info.hos[index]
		vint_object_destroy(ho.grp_h)
		Hud_mp_snatch_info.hos[index] = nil
	end
			
end

			
--#########################################
-------------------------------------------
-- JOHN METER
-------------------------------------------
--#########################################

function hud_mp_john_system_update(di_h, event)
	
	
	local index, screen_x, screen_y, z_depth, distance, recruit_pct, contested, is_visible = vint_dataitem_get(di_h)
	

	if event == "insert"  or event == "update" then

		if Hud_mp_snatch_info.johns[index] == nil then
			
			--Doesn't currently exist so create the ho indicator
			local grp_h = vint_object_clone(Hud_mp_snatch_elements.snatch_grp_h)
			local heart_1_h = vint_object_find("mp_snatch_heart_1", grp_h)	
			local heart_2_h = vint_object_find("mp_snatch_heart_2", grp_h)	
			local heart_3_h = vint_object_find("mp_snatch_heart_3", grp_h)	
			local heart_4_h = vint_object_find("mp_snatch_heart_4", grp_h)	
			local heart_5_h = vint_object_find("mp_snatch_heart_5", grp_h)				
						
			-- record everything here for later. 
			Hud_mp_snatch_info.johns[index] = {
				grp_h = grp_h,
				heart_1_h = heart_1_h,
				heart_2_h = heart_2_h,
				heart_3_h = heart_3_h,
				heart_4_h = heart_4_h,
				heart_5_h = heart_5_h,
				screen_x = screen_x,
				screen_y = screen_y,
				z_depth = z_depth,
				distance = distance,
				recruit_pct = recruit_pct,
				is_visible = is_visible,
			}			
			
		end


		--Shorter name for ease of use
		local john = Hud_mp_snatch_info.johns[index]

		vint_set_property(john.grp_h, "visible", is_visible)

		local grp_width = 97		
		local x = screen_x -- (grp_width * 0.5)
		local y = screen_y
		vint_set_property(john.grp_h, "anchor", x, y)	

		--Scale
		local maxclamp = 0.40
		local minclamp = 0.1

		local maxscale = 1
		local minscale = 0.5

		if recruit_pct > .2 then
			vint_set_property(john.heart_1_h, "tint", .86, 0, 0)
			vint_set_property(john.heart_2_h, "tint", 0.5, 0.5, 0.5)
			vint_set_property(john.heart_3_h, "tint", 0.5, 0.5, 0.5)
			vint_set_property(john.heart_4_h, "tint", 0.5, 0.5, 0.5)
			vint_set_property(john.heart_5_h, "tint", 0.5, 0.5, 0.5)
		end
		if recruit_pct > .4 then
			vint_set_property(john.heart_1_h, "tint", .86, 0, 0)
			vint_set_property(john.heart_2_h, "tint", .86, 0, 0)
			vint_set_property(john.heart_3_h, "tint", 0.5, 0.5, 0.5)
			vint_set_property(john.heart_4_h, "tint", 0.5, 0.5, 0.5)
			vint_set_property(john.heart_5_h, "tint", 0.5, 0.5, 0.5)
		end
		if recruit_pct > .6 then
			vint_set_property(john.heart_1_h, "tint", .86, 0, 0)
			vint_set_property(john.heart_2_h, "tint", .86, 0, 0)
			vint_set_property(john.heart_3_h, "tint", .86, 0, 0)
			vint_set_property(john.heart_4_h, "tint", 0.5, 0.5, 0.5)
			vint_set_property(john.heart_5_h, "tint", 0.5, 0.5, 0.5)
		end
		if recruit_pct > .8 then
			vint_set_property(john.heart_1_h, "tint", .86, 0, 0)
			vint_set_property(john.heart_2_h, "tint", .86, 0, 0)
			vint_set_property(john.heart_3_h, "tint", .86, 0, 0)
			vint_set_property(john.heart_4_h, "tint", .86, 0, 0)
			vint_set_property(john.heart_5_h, "tint", 0.5, 0.5, 0.5)
		end
		if recruit_pct >= 1 then
			vint_set_property(john.heart_1_h, "tint", .86, 0, 0)
			vint_set_property(john.heart_2_h, "tint", .86, 0, 0)
			vint_set_property(john.heart_3_h, "tint", .86, 0, 0)
			vint_set_property(john.heart_4_h, "tint", .86, 0, 0)
			vint_set_property(john.heart_5_h, "tint", .86, 0, 0)
		end
		if recruit_pct == 0 then
			vint_set_property(john.heart_1_h, "tint", 0.5, 0.5, 0.5)
			vint_set_property(john.heart_2_h, "tint", 0.5, 0.5, 0.5)
			vint_set_property(john.heart_3_h, "tint", 0.5, 0.5, 0.5)
			vint_set_property(john.heart_4_h, "tint", 0.5, 0.5, 0.5)
			vint_set_property(john.heart_5_h, "tint", 0.5, 0.5, 0.5)
		end

		--Clamp the distances
		if distance <= minclamp then
			distance = minclamp 
		elseif distance >= maxclamp then
			distance = maxclamp
		end

		local newdist = (distance - minclamp)
		local ratio = 1 - (newdist / (maxclamp - minclamp))
		local scale = (ratio * (maxscale-minscale)) + minscale

		vint_set_property(john.grp_h, "scale", scale, scale)
		--vint_set_property(john.grp_h, "alpha", scale)
			
		--Z Depth
		if z_depth ~= john.z_depth then
			vint_set_property(john.grp_h,  "depth", z_depth)
		end

		john.recruit_pct = recruit_pct
		john.screen_x = screen_x 		
		john.screen_y = screen_y 		
		john.z_depth = z_depth
		john.distance = distance
		john.is_visible = is_visible

	end
	
	if event == "remove" and Hud_mp_snatch_info.johns[index] ~= nil then
		local john = Hud_mp_snatch_info.johns[index]
		vint_object_destroy(john.grp_h)
		Hud_mp_snatch_info.johns[index] = nil
	end
end