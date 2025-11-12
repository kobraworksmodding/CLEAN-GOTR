

--[[
You should be able to just drop
]]

Hud_coop_div_audio = {
	top_2 = audio_get_audio_id("SYS_COMPLETION_START_2"),
	text = audio_get_audio_id("SYS_COMPLETION_TEXT"),
	cash = audio_get_audio_id("SYS_COMPLETION_CASH"),
	respect = audio_get_audio_id("SYS_COMPLETION_RESPECT"),
	image = audio_get_audio_id("SYS_COMPLETION_OBJECT"),
	tips = audio_get_audio_id("SYS_COMPLETION_MENU"),
}

function hud_coop_div_audio_top_2()
	audio_play(Hud_coop_div_audio.top_2)
end

function hud_coop_div_audio_text()
	audio_play(Hud_coop_div_audio.text)
end

function hud_coop_div_audio_cash()
	audio_play(Hud_coop_div_audio.cash)
end

function hud_coop_div_audio_respect()
	audio_play(Hud_coop_div_audio.respect)
end

function hud_coop_div_audio_image()
	audio_play(Hud_coop_div_audio.image)
end

function hud_coop_div_audio_tips()
	audio_play(Hud_coop_div_audio.tips)
end

Hud_coop_div = {}

function hud_coop_div_init()

	--Find and store objects
	Hud_coop_div.handles = {}
	Hud_coop_div.handles.title_txt = vint_object_find("title_txt")
	Hud_coop_div.handles.subtitle_txt = vint_object_find("subtitle_txt")
	
	--Player
	Hud_coop_div.handles.player_grp = vint_object_find("player_grp")
	Hud_coop_div.handles.player_name_txt = vint_object_find("player_name_txt")
	Hud_coop_div.handles.player_score_grp = vint_object_find("player_score_grp")
	Hud_coop_div.handles.player_score_txt = vint_object_find("player_score_txt")
	Hud_coop_div.handles.player_score_type_txt = vint_object_find("player_score_type_txt")
	Hud_coop_div.handles.player_score_anim_grp = vint_object_find("player_score_anim_grp")
	
	--Enemy
	Hud_coop_div.handles.enemy_grp = vint_object_find("enemy_grp")
	Hud_coop_div.handles.enemy_name_txt = vint_object_find("enemy_name_txt")
	Hud_coop_div.handles.enemy_score_grp = vint_object_find("enemy_score_grp")
	Hud_coop_div.handles.enemy_score_txt = vint_object_find("enemy_score_txt")
	Hud_coop_div.handles.enemy_score_type_txt = vint_object_find("enemy_score_type_txt")
	Hud_coop_div.handles.enemy_score_anim_grp = vint_object_find("enemy_score_anim_grp")
	
	--Cash
	Hud_coop_div.handles.cash_grp = vint_object_find("cash_grp")
	Hud_coop_div.handles.cash_amount_txt = vint_object_find("cash_amount_txt")
	
	--Controls
	Hud_coop_div.handles.options_grp = vint_object_find("options_grp")
	
	--Hide for pre-animation
	vint_set_property(Hud_coop_div.handles.enemy_grp, "alpha", 0)
	vint_set_property(Hud_coop_div.handles.player_grp, "alpha", 0)
	
	--Hide Cash
	vint_set_property(Hud_coop_div.handles.cash_amount_txt, "alpha", 0)
	vint_set_property(vint_object_find("cash_txt"), "alpha", 0)
	
	--Title
	vint_set_property(Hud_coop_div.handles.title_txt, "alpha", 0)
	vint_set_property(Hud_coop_div.handles.subtitle_txt, "alpha", 0)
	
	--Hide Ornate
	local ornate_left = vint_object_find("ornate_left")
	local ornate_right = vint_object_find("ornate_right")
	local se_x, se_y = vint_get_property(ornate_left, "source_se")
	vint_set_property(ornate_left, "source_se", 0, se_y)
	vint_set_property(ornate_right, "source_se", 0, se_y)
	
	--Misc
	vint_set_property(vint_object_find("options_grp"), "alpha", 0)
	vint_set_property(vint_object_find("background"), "alpha", 0)
		
	--Animation Callbacks
	local in_anim_twn = vint_object_find("options_grp_alpha_twn_1")
	vint_set_property(in_anim_twn, "start_event", "hud_coop_div_in_anim_end")
	
	--Sound Callbacks
	local twn = vint_object_find("title_txt_alpha_twn_1")
	vint_set_property(twn, "start_event", "hud_coop_div_audio_top_2")
	
	twn = vint_object_find("enemy_score_anim_grp_alpha_twn")
	vint_set_property(twn, "start_event", "hud_coop_div_audio_text")
	
	twn = vint_object_find("cash_txt_anchor_twn_1")
	vint_set_property(twn, "start_event", "hud_coop_div_audio_cash")
	
	twn = vint_object_find("cash_amount_txt_scale_twn_1")
	vint_set_property(twn, "start_event", "hud_coop_div_audio_respect")
	
	--General Data
	Hud_coop_div.is_host = false
	Hud_coop_div.animation_finished = false
	
	--Animations play
	lua_play_anim(vint_object_find("cash_amount_anim"), .25)
	lua_play_anim(vint_object_find("options_grp_anim"), .25)
	lua_play_anim(vint_object_find("ornate_anim"), .25)
	lua_play_anim(vint_object_find("player_score_anim"), .25)
	lua_play_anim(vint_object_find("title_anim"), .25)
	
	vint_dataresponder_request("coop_diversion_success_responder", "hud_coop_div_data_populate", 0, 0)
	--hud_coop_div_data_populate(0, 1, true, 0, "JAGERBOMSSS!", 3, "DA", 4, 400000)
	
	hud_coop_div_input_subscribe()
	
	--Fade out hud
	hud_fade_out()
end

function hud_coop_div_cleanup()
	hud_fade_in()
	hud_coop_div_input_unsubscribe()
end

function hud_coop_div_data_populate(diversion_type, win_status, is_host, points_type, my_name, my_points, enemy_name, enemy_points, reward)
--[[
	Kevin Hassett: 5/13/08 11:18 PM 
	The data responder is called coop_diversion_success_responder, 
	and the vint_document coop_diversion_success_doc. 

	// Param 0: Diversion type (0 = Death Tag, 1 = Cat & Mouse, 2 = Co-op Survival)
	// Param 1: Win status (0 = Win, 1 = Lose, 2 = Tie)
	// Param 2: Am I the host? (used for determining whether or not to let the player "retry")
	// Param 3: Points type (0 = Points, 1 = Kills)
	// Param 4: My name
	// Param 5: My points
	// Param 6: Partner's name
	// Param 7: Partner's points
	// Param 8: Reward
	--]]


	--Set Screen Title
	local title_string = ""
	if diversion_type == 0 then
		-- Death Tag
		title_string = "DIVERSION_COOP_DEATH_TAG_TITLE"
	elseif diversion_type == 1 then
		--Cat And Mouse
		title_string = "DIVERSION_COOP_CAT_AND_MOUSE_TITLE"
	elseif diversion_type == 2 then
		--survivale mode
		title_string = "DIVERSION_COOP_SURVIVAL_TITLE"
	end
	
	vint_set_property(Hud_coop_div.handles.title_txt, "text_tag", title_string)

	--Win Status
	if win_status == 0 then
		--Win
		vint_set_property(Hud_coop_div.handles.subtitle_txt, "text_tag", "MP_WINNERS_YOU_WIN")	--"You Win"
	elseif win_status == 1 then
		--Lose
		vint_set_property(Hud_coop_div.handles.subtitle_txt, "text_tag", "MP_WINNERS_YOU_LOSE")	--"You Lose"
		vint_set_property(Hud_coop_div.handles.subtitle_txt, "tint", 0.666, 0, 0.004)
	elseif win_status == 2 then
		--Tie
		vint_set_property(Hud_coop_div.handles.subtitle_txt, "text_tag", "MP_WINNERS_TIE")	--"Game Tie"
		vint_set_property(Hud_coop_div.handles.subtitle_txt, "tint", 0.623, 0.635, 0.644)
	end
	
	--Button Input and Controls are different depending on the client/host situation
	local option_1_txt = vint_object_find("option_1_txt")
	local option_2_txt = vint_object_find("option_2_txt")
	if is_host == true then
		--Adjust control displays
		vint_set_property(option_1_txt, "text_tag", "DIVERSION_COOP_HOST_PLAY_AGAIN")	--"{MENU_SELECT_IMG} Play Another Match"
		vint_set_property(option_2_txt, "text_tag", "DIVERSION_COOP_HOST_QUIT")			--"{MENU_ABORT_IMG} Quit Co-op Diversion"		
	else
		--Client is only (a) Continue
		local option_1_txt = vint_object_find("option_1_txt")
		local option_2_txt = vint_object_find("option_2_txt")
		vint_set_property(option_2_txt, "visible", false)
		vint_set_property(option_1_txt, "text_tag", "DIVERSION_COOP_CLIENT_CONTINUE")	--"{MENU_SELECT_IMG} Continue"
	end
	
	Hud_coop_div.is_host = is_host
	
	--Set points Description string for scores
	local points_string = ""
	if points_type == 0 then
		points_string = "HUD_DIVERSION_POINTS"
	elseif points_type == 1 then
		points_string = "MULTI_MENU_STATS_KILLS"
	end
	
	vint_set_property(Hud_coop_div.handles.player_score_type_txt, "text_tag", points_string)
	vint_set_property(Hud_coop_div.handles.enemy_score_type_txt, "text_tag", points_string)
	
	--My Points
	vint_set_property(Hud_coop_div.handles.player_name_txt, "text_tag", my_name)
	vint_set_property(Hud_coop_div.handles.player_score_txt, "text_tag", format_cash(my_points))
	
	--Enemy Points
	vint_set_property(Hud_coop_div.handles.enemy_name_txt, "text_tag", enemy_name)
	vint_set_property(Hud_coop_div.handles.enemy_score_txt, "text_tag", format_cash(enemy_points))
		
	--Center Points with names
	local largest_width = 0
	local center_pad = 20
	for i = 0, 1 do 
		local name_txt
		local score_txt
		local score_type_txt
		local score_grp
		
		if i == 0 then
			name_txt = Hud_coop_div.handles.player_name_txt
			score_txt = Hud_coop_div.handles.player_score_txt
			score_type_txt = Hud_coop_div.handles.player_score_type_txt
			score_grp = Hud_coop_div.handles.player_score_grp
			
		elseif i == 1 then
			score_txt = Hud_coop_div.handles.enemy_score_txt
			name_txt = Hud_coop_div.handles.enemy_name_txt
			score_type_txt = Hud_coop_div.handles.enemy_score_type_txt
			score_grp = Hud_coop_div.handles.enemy_score_grp
		end
		
		--Re-align scores so they are centered with the names
		local padding = 10
		local x_1, y_1 = vint_get_property(score_txt, "anchor")
		local x_2, y_2 = vint_get_property(score_type_txt, "anchor")
		local width_1, height_1 = element_get_actual_size(score_txt)
		local width_2, height_2 = element_get_actual_size(score_type_txt)
		x_2 = padding + width_1 
		vint_set_property(score_type_txt, "anchor", x_2, y_2)
		local new_score_width = x_2 + width_2
		local score_grp_x, score_grp_y = vint_get_property(score_grp, "anchor")
		score_grp_x = -(new_score_width * .5)
		vint_set_property(score_grp, "anchor", score_grp_x, score_grp_y)
		
		local name_width, name_height = element_get_actual_size(name_txt)
		
		if largest_width < name_width then
			largest_width = name_width
		end
		if largest_width < new_score_width then
			largest_width = new_score_width
		end
	end
	
	--Align scores/names vertically so they aren't too far apart
	local base_x = (largest_width * .5) + center_pad
	local x, y = vint_get_property(Hud_coop_div.handles.player_grp, "anchor")
	vint_set_property(Hud_coop_div.handles.player_grp, "anchor", -base_x, y)
	x, y = vint_get_property(Hud_coop_div.handles.enemy_grp, "anchor")
	vint_set_property(Hud_coop_div.handles.enemy_grp, "anchor", base_x, y)
	
	--My Reward
	if reward > 0 then
		vint_set_property(Hud_coop_div.handles.cash_amount_txt, "text_tag", "$" .. format_cash(reward))
	else
		--No reward hide it, move button tips and adjust animation timing
		vint_set_property(Hud_coop_div.handles.cash_grp, "visible", false)
		local x, y = vint_get_property(Hud_coop_div.handles.cash_grp, "anchor")
		vint_set_property(Hud_coop_div.handles.options_grp, "anchor", x, y)
		
		--Destroy cash anim
		local anim_h = vint_object_find("cash_amount_anim")
		vint_object_destroy(anim_h)
		
		--Speed up text tag anim_h
		local twn_h = vint_object_find("options_grp_alpha_twn_1")
		vint_set_property(twn_h, "start_time", 1.33)
	end

end

function hud_coop_div_input_subscribe()
	Hud_coop_div.input_subs = {
		vint_subscribe_to_input_event(nil, "pause",				"hud_coop_div_input_event", 50),
		vint_subscribe_to_input_event(nil, "select",			"hud_coop_div_input_event", 50),
		vint_subscribe_to_input_event(nil, "back",				"hud_coop_div_input_event", 50),
		vint_subscribe_to_input_event(nil, "all_unassigned",	"hud_coop_div_input_event", 50),
	}	
end

function hud_coop_div_input_event(target, event, accelleration)

	if Hud_coop_div.animation_finished == false then
		local current_time = vint_get_time_index()
		vint_set_time_index(current_time + 10)
		Hud_coop_div.animation_finished = true
		return
	end

	if event == "select" then
		if Hud_coop_div.is_host == true then
			--Retry
			vint_dataresponder_request("coop_diversion_success_responder", "hud_coop_div_dummy_cb", 0, 1)
		else
			--Quit
			vint_dataresponder_request("coop_diversion_success_responder", "hud_coop_div_dummy_cb", 0, 2)
		end
		hud_coop_div_exit()
	elseif event == "back" or event == "pause" then
		if Hud_coop_div.is_host == true then
			--Quit
			vint_dataresponder_request("coop_diversion_success_responder", "hud_coop_div_dummy_cb", 0, 2)
			hud_coop_div_exit()
		end
	end
end

function hud_coop_div_dummy_cb()
	--Dummy CB that does nothing
end

function hud_coop_div_input_unsubscribe()
	if Hud_coop_div.input_subs == nil then
		return
	end
	
	for idx, val in Hud_coop_div.input_subs do
		vint_unsubscribe_to_input_event(val)
	end
	Hud_coop_div.input_subs = nil
end

function hud_coop_div_exit()
	--When the screen exits, fade in the hud, unsubscribe events, and unload the documnet
	vint_document_unload(vint_document_find("hud_coop_div"))
end

function hud_coop_div_in_anim_end()
	Hud_coop_div.animation_finished = true
	hud_coop_div_audio_tips()
end