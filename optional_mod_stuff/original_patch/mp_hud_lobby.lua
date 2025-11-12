-- Variable section
Mp_hud_lobby_data = {
	player_data = {},
}

-- Init and cleanup functions
function mp_hud_lobby_init()

	-- Hide the HUD map
	hud_hide_map()
	
	-- Set up some handles
	Mp_hud_lobby_data.line_h = vint_object_clone(vint_object_find("hud_player_line"))
	
	-- Subscribe to updates
	vint_datagroup_add_subscription("sr2_multi_lobby_player_data", "update", "mp_hud_lobby_data_update")
	vint_datagroup_add_subscription("sr2_multi_lobby_player_data", "insert", "mp_hud_lobby_data_update")
	vint_datagroup_add_subscription("sr2_multi_lobby_player_data", "remove", "mp_hud_lobby_data_update")
end

function mp_hud_lobby_cleanup()
	-- Unload Pegs

end

function mp_hud_lobby_data_update(di_h, event)
	
	local team, name, voip, host = vint_dataitem_get(di_h)
	
	if event == "insert" then -- Make a new line
		-- Clone up a new line
		local line_h = vint_object_clone(Mp_hud_lobby_data.line_h)
		Mp_hud_lobby_data.player_data[di_h] = {team = team, voip = voip, line_h = line_h}
		
		-- Set name text
		local name_text = vint_object_find("text", Mp_hud_lobby_data.player_data[di_h].line_h)
		vint_set_property(name_text, "text_tag", name)
		
		-- Set team color
		mp_hud_lobby_set_team(di_h, host)
		
		-- Set voip icon
		mp_hud_lobby_set_voip(di_h)
		
		-- Rebuild the line list
		mp_hud_lobby_arrange_lines()
		
	elseif event == "update" then -- Update an existing line
		if Mp_hud_lobby_data.player_data[di_h] ~= nil then
		
			-- Hang on to old values
			local team_old = Mp_hud_lobby_data.player_data[di_h].team
			local voip_old = Mp_hud_lobby_data.player_data[di_h].voip
		
			-- Update the global variables
			Mp_hud_lobby_data.player_data[di_h].team = team
			Mp_hud_lobby_data.player_data[di_h].voip = voip
		
			if voip ~= voip_old then -- Update voip icon
				mp_hud_lobby_set_voip(di_h)
			end
			
			if team ~= team_old then -- Update team
				if host == false then
					-- Change color
					mp_hud_lobby_set_team(di_h, host)
				end
				-- Rebuild the line list
				mp_hud_lobby_arrange_lines()
			end
		end
		
	elseif event == "remove" then -- Remove existing line
		if Mp_hud_lobby_data.player_data[di_h] ~= nil then
			vint_object_destroy(Mp_hud_lobby_data.player_data[di_h].line_h)
			Mp_hud_lobby_data.player_data[di_h] = nil
			
			-- Fix the rest of the lines
			mp_hud_lobby_arrange_lines()
		end
	end
	
end

function mp_hud_lobby_set_team(idx, host)
	if Mp_hud_lobby_data.player_data[idx] ~= nil then
		if host == true then -- Host, set to yellow
			vint_set_property(Mp_hud_lobby_data.player_data[idx].line_h, "tint", 0.9451, 0.8902, 0.004)
		else
			if Mp_hud_lobby_data.player_data[idx].team == 0 then -- Blue team
				vint_set_property(Mp_hud_lobby_data.player_data[idx].line_h, "tint", 0.0, 0.5, 1.0)
			elseif Mp_hud_lobby_data.player_data[idx].team == 1 then -- Red team
				vint_set_property(Mp_hud_lobby_data.player_data[idx].line_h, "tint", 0.8, 0.0, 0.0)
			end
		end
	end
end

function mp_hud_lobby_set_voip(idx)
	if Mp_hud_lobby_data.player_data[idx] ~= nil then
		local voip_speaker = vint_object_find("voip_speaker", Mp_hud_lobby_data.player_data[idx].line_h)
		local voip_speaker_on = vint_object_find("voip_speaker_on", Mp_hud_lobby_data.player_data[idx].line_h)
		
		if Mp_hud_lobby_data.player_data[idx].voip == 0 then -- No voip
			vint_set_property(voip_speaker, "visible", false)
			vint_set_property(voip_speaker_on, "visible", false)
			
		elseif Mp_hud_lobby_data.player_data[idx].voip == 1 then -- Plugged in
			vint_set_property(voip_speaker, "visible", true)
			vint_set_property(voip_speaker_on, "visible", false)
			
		elseif Mp_hud_lobby_data.player_data[idx].voip == 2 then -- Talking
			vint_set_property(voip_speaker, "visible", true)
			vint_set_property(voip_speaker_on, "visible", true)
		end
	end
end

function mp_hud_lobby_arrange_lines()

	local line_width, line_height = vint_get_property(Mp_hud_lobby_data.line_h,"screen_size")
	line_height = line_height * 0.82
	
	local current_line = 0
	local x, y = vint_get_property(Mp_hud_lobby_data.line_h, "anchor")

	 -- Draw all blue team lines
	for idx, val in Mp_hud_lobby_data.player_data do
		if Mp_hud_lobby_data.player_data[idx].team == 0 then
			
			local new_y = y + (current_line * line_height)
			vint_set_property(Mp_hud_lobby_data.player_data[idx].line_h, "anchor", x, new_y)
			vint_set_property(Mp_hud_lobby_data.player_data[idx].line_h, "visible", true)
			
			current_line = current_line + 1
		end
	end

	 -- Draw all red team lines
	for idx, val in Mp_hud_lobby_data.player_data do
		if Mp_hud_lobby_data.player_data[idx].team == 1 then
			
			local new_y = y + (current_line * line_height)
			vint_set_property(Mp_hud_lobby_data.player_data[idx].line_h, "anchor", x, new_y)
			vint_set_property(Mp_hud_lobby_data.player_data[idx].line_h, "visible", true)
			
			current_line = current_line + 1
		end
	end
end