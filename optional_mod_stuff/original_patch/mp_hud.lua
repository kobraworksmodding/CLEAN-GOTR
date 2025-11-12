----------
-- Globals
----------
Mp_hud_debug_mode = false

Mp_hud_teamscore = {
	init = false
}
Mp_hud_activity = {
	init = false
}
Mp_hud_perks = {
	init = false
}

Tagging_progress_info = {}


FOF_NEUTRAL 		= -1
FOF_FRIEND			= 0
FOF_FOE				= 1


GAMETYPE_BRAWL = 0
GAMETYPE_TEAM_BRAWL = 1
GAMETYPE_STRONGARM = 2

STATUSTYPE_NO_LIMIT		= 0
STATUSTYPE_TIMER			= 1
STATUSTYPE_ROUNDS			= 2
STATUSTYPE_SUDDEN_DEATH	= 3

-- Colors need to be specified from 0 to 1
Mp_hud_colors = {
	[FOF_NEUTRAL] 	= 	{ r = 1, g = 1, b = 1 },
	[FOF_FRIEND] 	= 	{ r =  68/255, g = 129/255, b = 213/255 },
	[FOF_FOE] 		=	{ r = 175/255, g =  0/255, b =  0/255 }
}

Mp_perk_enum_bitmaps = {
	[-1] 	= "ui_blank"	,					--"none",
	[0] 	= "ui_mp_tag_cash",				--"PERK_TYPE_SCORE",
	[1] 	= "ui_mp_tag_police",			--"PERK_TYPE_POLICE",
	[2] 	= "ui_mp_tag_sprint",			--"PERK_TYPE_SPRINT",
	[3] 	= "ui_mp_tag_kill_bonus",		--"PERK_TYPE_KILL_BONUS",
	[4] 	= "ui_mp_tag_nitro",				--"PERK_TYPE_NITRO",
	[5] 	= "ui_mp_tag_slap",				--"PERK_TYPE_SLAP",
	[6] 	= "ui_mp_tag_stealth",			--"PERK_TYPE_STEALTH",
	[7] 	= "ui_mp_tag_ammo",				--"PERK_TYPE_AMMO",!!!!!
	[8] 	= "ui_mp_tag_health",			--"PERK_TYPE_HEALTH",
	[9] 	= "ui_mp_tag_accuracy",			--"PERK_TYPE_ACCURACY",
	[10]	= "ui_mp_tag_smokescreen",		--"PERK_TYPE_SMOKESCREEN",
}

function create_tween(name, target_h, target_prop, duration)
	local tween_h = vint_object_create(name, "tween", vint_object_find("root_animation"))
	vint_set_property(tween_h, "duration", duration)
	vint_set_property(tween_h, "target_handle", target_h)
	vint_set_property(tween_h, "target_property", target_prop)
	vint_set_property(tween_h, "start_time",	vint_get_time_index())
	vint_set_property(tween_h, "state", "disabled")
	return tween_h
end

-- Given a score and the score limit, finds a percentage between 0 and 1
--
function mp_hud_percent_from_score(score, score_limit)
	if score_limit <= 0 then
		return 0
	end
	
	local percent = score / score_limit
	if percent > 1 then
		percent = 1
	elseif percent < 0 then
		percent = 0
	end
	
	return percent
end

-- Given a boolean value, returns TRUE or FALSE as text (for debugging)
--
function bool_to_text(bool_var)
	if bool_var then
		return "TRUE"
	else
		return "FALSE"
	end
end

---------------
-- Scoreboard
---------------
function mp_hud_teamscore_init()
	Mp_hud_teamscore.init = true

	--Find objects and store handles
	Mp_hud_teamscore.handles = {}
	Mp_hud_teamscore.handles.teamscore_grp = vint_object_find("teamscore_grp")
	
	-- Match status items
	local h = Mp_hud_teamscore.handles.teamscore_grp 
	Mp_hud_teamscore.handles.game_status_txt = vint_object_find("game_status_txt", h)
	Mp_hud_teamscore.handles.unlimited_bm = vint_object_find("unlimited_bm", h)
	Mp_hud_teamscore.handles.sudden_death_bm = vint_object_find("sudden_death_bm", h)
	
	--Blue meter
	Mp_hud_teamscore.handles.blue_meter_label = vint_object_find("label_blue_txt", h)
	Mp_hud_teamscore.handles.blue_meter = vint_object_find("meter_blue", h)
	Mp_hud_teamscore.handles.blue_meter_bg = vint_object_find("bg", Mp_hud_teamscore.handles.blue_meter)
	Mp_hud_teamscore.handles.blue_meter_fill = vint_object_find("fill", Mp_hud_teamscore.handles.blue_meter)
	
	--Red meter
	Mp_hud_teamscore.handles.red_meter_label = vint_object_find("label_red_txt", h)
	Mp_hud_teamscore.handles.red_meter = vint_object_find("meter_red", h)
	Mp_hud_teamscore.handles.red_meter_bg = vint_object_find("bg", Mp_hud_teamscore.handles.red_meter)
	Mp_hud_teamscore.handles.red_meter_fill = vint_object_find("fill", Mp_hud_teamscore.handles.red_meter)
	
	--Frame
	Mp_hud_teamscore.frame = mp_hud_teamscore_frame_find(vint_object_find("standard_box", Mp_hud_teamscore.handles.teamscore_grp))

	Mp_hud_teamscore.score_limit = 0				--Total Amount of score to win the game
	Mp_hud_teamscore.game_type = -1				--Game Type
	Mp_hud_teamscore.status_type = 0				--Status type 0 = No Limit, 1 = Timer, 2 = Rounds
	Mp_hud_teamscore.cur_round = -1				--Current Round
	Mp_hud_teamscore.max_rounds = -1				--Maximum Rounds
	Mp_hud_teamscore.cur_time = -1				--Current Game Time
	
	--Max size of bar
	Mp_hud_teamscore.meter_fill_width, Mp_hud_teamscore.meter_fill_height = vint_get_property(Mp_hud_teamscore.handles.blue_meter_fill, "source_se")

	-- Make 'em all visible
	vint_set_property(Mp_hud_teamscore.handles.teamscore_grp, "visible", true)
	
	-- ... except the Unlimited and Sudden Death images
	vint_set_property(Mp_hud_teamscore.handles.unlimited_bm, "visible", false)
	vint_set_property(Mp_hud_teamscore.handles.sudden_death_bm, "visible", false)

	--mp_game_gsi
	vint_dataitem_add_subscription("mp_game_gsi", "update", "mp_hud_teamscore_status_update")
	
	-- Add a subscription to the score limit data item
	vint_dataitem_add_subscription("sr2_score_limit_item", "update", "mp_hud_teamscore_limit_update")
	
	-- Add a subscription to the fof scores data item
	vint_dataitem_add_subscription("sr2_fof_scores_item", "update", "mp_hud_teamscore_score_update")
	
	vint_dataitem_add_subscription("sr2_sa_game_timer_item", "update", "mp_hud_teamscore_timer_update")	
end

-- Callback to set the score limit
function mp_hud_teamscore_limit_update(di_h, event_name)
	debug_print("vint", "Mp_hud_teamscore.score_limit: " .. Mp_hud_teamscore.score_limit .. "\n")
	Mp_hud_teamscore.score_limit = vint_dataitem_get(di_h)
end

-- Callback for an update to the respect bar scores
function mp_hud_teamscore_score_update(di_h, event_name)
--function mp_hud_teamscore_score_test(friend_score, enemy_score, friend_score_text, enemy_score_text)
	local friend_score, enemy_score, friend_score_text, enemy_score_text = vint_dataitem_get(di_h)
	local score_limit = Mp_hud_teamscore.score_limit
	
	if Mp_hud_debug_mode == true then
	end
						
	--Update Bars and Labels
	local friend_percent
	local enemy_percent	
	
	if score_limit > 0 then
		friend_percent = mp_hud_percent_from_score(friend_score, score_limit)
		enemy_percent = mp_hud_percent_from_score(enemy_score, score_limit)
	else
		-- Show the bars as a percentage of the highest score
		local highest_score = friend_score
		if enemy_score > friend_score then
			highest_score = enemy_score
		end

		friend_percent = mp_hud_percent_from_score(friend_score, highest_score)
		enemy_percent = mp_hud_percent_from_score(enemy_score, highest_score)
	end
	
	--Set Bars
	local friend_fill_width = friend_percent * Mp_hud_teamscore.meter_fill_width
	local enemy_fill_width = enemy_percent * Mp_hud_teamscore.meter_fill_width

	vint_set_property(Mp_hud_teamscore.handles.blue_meter_fill, "source_se", friend_fill_width, Mp_hud_teamscore.meter_fill_height)
	vint_set_property(Mp_hud_teamscore.handles.red_meter_fill, "source_se", enemy_fill_width, Mp_hud_teamscore.meter_fill_height)
	
	--Set Score Text
	if Mp_hud_teamscore.game_type == GAMETYPE_STRONGARM then
		--Strong arm (Format Cash)
		vint_set_property(Mp_hud_teamscore.handles.blue_meter_label, "text_tag", "$" .. format_cash(friend_score))
		vint_set_property(Mp_hud_teamscore.handles.red_meter_label, "text_tag", "$" .. format_cash(enemy_score))
	else
		--Normal
		vint_set_property(Mp_hud_teamscore.handles.blue_meter_label, "text_tag", friend_score)
		vint_set_property(Mp_hud_teamscore.handles.red_meter_label, "text_tag", enemy_score)
	end
		
	Mp_hud_teamscore.score_limit = score_limit
end

function show_teamscore_status_by_type( status_type )
	if status_type == STATUSTYPE_NO_LIMIT then
		-- Show the unlimited bitmap
		vint_set_property(Mp_hud_teamscore.handles.game_status_txt, "visible", false)
		vint_set_property(Mp_hud_teamscore.handles.unlimited_bm, "visible", true)
		vint_set_property(Mp_hud_teamscore.handles.sudden_death_bm, "visible", false)
		
	elseif status_type == STATUSTYPE_SUDDEN_DEATH then
		-- Show the sudden death bitmap
		vint_set_property(Mp_hud_teamscore.handles.game_status_txt, "visible", false)
		vint_set_property(Mp_hud_teamscore.handles.unlimited_bm, "visible", false)
		vint_set_property(Mp_hud_teamscore.handles.sudden_death_bm, "visible", true)
		
	else
		-- Timer and rounds use the game status text
		vint_set_property(Mp_hud_teamscore.handles.game_status_txt, "visible", true)
		vint_set_property(Mp_hud_teamscore.handles.unlimited_bm, "visible", false)
		vint_set_property(Mp_hud_teamscore.handles.sudden_death_bm, "visible", false)
	end
end

--function mp_hud_teamscore_status_test(game_type, status_type, cur_round, max_rounds)
function mp_hud_teamscore_status_update(di_h)
	local game_type, status_type, cur_round, max_rounds = vint_dataitem_get(di_h)
	
	--[[
		element 0 - game_type - int, 0 = Brawl, 1 = Team Brawl, 2 = StrongArm
		element 1 - Status type - int, 0 = No Limit, 1 = Timer, 2 = Rounds, 3 = Sudden Death
		element 2 - Current Round
		element 3 - Round Max
	]]

	--Ignore game_type
	Mp_hud_teamscore.game_type = game_type
	
	-- Only visible if we have some sort of time limit
	show_teamscore_status_by_type(status_type)
	
	-- If rounds, set the current round
	if status_type == STATUSTYPE_ROUNDS then
		local status_str = cur_round .. "/" .. max_rounds
		status_str = {[0] = status_str}
		status_str = vint_insert_values_in_string("MP_HUD_ROUND", status_str)
		vint_set_property(Mp_hud_teamscore.handles.game_status_txt, "text_tag", status_str)
		Mp_hud_teamscore.status_cur_roundpart_1 = cur_round
		Mp_hud_teamscore.max_rounds = max_rounds
	end
	
	Mp_hud_teamscore.status_type = status_type
end

function mp_hud_teamscore_timer_update(data_item_h, event_name)
	--Game Timer
	if Mp_hud_teamscore.status_type == STATUSTYPE_TIMER then
		--only do this is we are in timer mode
		local status_str = vint_dataitem_get(data_item_h)
		Mp_hud_teamscore.cur_time = status_str
		status_str = {[0] = status_str}
		status_str = vint_insert_values_in_string("MP_HUD_TIME", status_str)
		vint_set_property(Mp_hud_teamscore.handles.game_status_txt, "text_tag", status_str)
	end
end

---------------------
-- Activity Display
---------------------
function mp_hud_activity_init()
	
	Mp_hud_teamscore.init = true

	Mp_hud_activity.handles = {}
	Mp_hud_activity.handles.activity_grp = vint_object_find("activity_score_grp")
	
	local h = Mp_hud_activity.handles.activity_grp
	Mp_hud_activity.handles.icon = vint_object_find("icon", h)
	Mp_hud_activity.handles.title_txt = vint_object_find("title_txt", h)
	Mp_hud_activity.handles.time_txt = vint_object_find("time_txt", h)
	Mp_hud_activity.handles.box = vint_object_find("standard_box", h)
	
	Mp_hud_activity.handles.combo_grp = vint_object_find("combo_grp", h)
	Mp_hud_activity.handles.race_pos_grp = vint_object_find("race_pos_grp", h)
	Mp_hud_activity.handles.score_grp = vint_object_find("score_grp", h)
	
	--Score
	h = Mp_hud_activity.handles.score_grp
	Mp_hud_activity.handles.fill_blue = vint_object_find("fill_blue", h)
	Mp_hud_activity.handles.fill_blue_2 = vint_object_find("fill_blue_2", h)
	Mp_hud_activity.handles.fill_red = vint_object_find("fill_red", h)
	Mp_hud_activity.handles.text_blue = vint_object_find("txt_blue", h)
	Mp_hud_activity.handles.text_blue_2 = vint_object_find("txt_blue_2", h)
	Mp_hud_activity.handles.text_red = vint_object_find("txt_red", h)
	Mp_hud_activity.handles.line = vint_object_find("line", h)
	
	--Combo
	h = Mp_hud_activity.handles.combo_grp 
	Mp_hud_activity.handles.combo_label_txt = vint_object_find("label_txt", h)
	Mp_hud_activity.handles.combo_info_txt = vint_object_find("info_txt", h)
	Mp_hud_activity.handles.combo_meter_grp = vint_object_find("meter_grp", h)
	Mp_hud_activity.handles.combo_meter_fill = vint_object_find("fill", h)
	
	--Race position
	h = Mp_hud_activity.handles.race_pos_grp
	Mp_hud_activity.handles.race_place_bm = vint_object_find("race_place_bm", h)
	Mp_hud_activity.handles.race_total_bm = vint_object_find("race_total_bm", h)
	
	--Animations
	Mp_hud_activity.handles.blue_score_pulse = vint_object_find("fill_blue_anim_1")
	Mp_hud_activity.handles.blue_scale_twn = vint_object_find("fill_blue_scale_twn_1", Mp_hud_activity.handles.blue_score_pulse)
	vint_set_property(Mp_hud_activity.handles.blue_score_pulse, "is_paused", true)
	
	--Constants for display purposes
	Mp_hud_activity.BAR_WIDTH_MAX = 172
	Mp_hud_activity.BAR_WIDTH_MIN = 10
	Mp_hud_activity.BAR_HEIGHT = 12
	Mp_hud_activity.COMBO_BAR_WIDTH, Mp_hud_activity.COMBO_BAR_HEIGHT = vint_get_property(Mp_hud_activity.handles.combo_meter_fill, "source_se")
	
	--Variables for display
	Mp_hud_activity.timer_width = element_get_actual_size(Mp_hud_activity.handles.time_txt)
	
	--Initialize Values
	Mp_hud_activity.is_active = -1
	Mp_hud_activity.time = -1
	Mp_hud_activity.title_str = -1
	Mp_hud_activity.icon_bmp_name = -1
	Mp_hud_activity.score_blue = -1
	Mp_hud_activity.score_red = -1
	Mp_hud_activity.has_combo_bar = -1
	Mp_hud_activity.combo_meter_value = -1
	Mp_hud_activity.combo_count = -1
	Mp_hud_activity.has_race_pos = -1
	Mp_hud_activity.race_place = -1
	Mp_hud_activity.race_total = -1
	
	--Subscribe to dataitem
	vint_dataitem_add_subscription("sa_activity_gsi", "update", "mp_hud_activity_update")
end

function mp_hud_activity_update(di_h)
	local is_active, icon_bmp_name, title_str, activity_time, friendly_cash, opponent_cash, has_combo_bar, combo_count, combo_meter_value, want_race_pos, race_place, race_total, just_scored =  vint_dataitem_get(di_h)
--function mp_hud_activity_test(is_active, icon_bmp_name, title_str, activity_time, friendly_cash, opponent_cash, has_combo_bar, combo_meter_value, combo_count, just_scored)
	
	
	if Mp_hud_debug_mode == true then
		debug_print("vint", "is_active " .. var_to_string(is_active) .. "\n")
		debug_print("vint", "icon_bmp_name: " .. var_to_string(icon_bmp_name) .. "\n")
		debug_print("vint", "title_str: " .. var_to_string(title_str) .. "\n")
		debug_print("vint", "activity_time: " .. var_to_string(activity_time) .. "\n")
		debug_print("vint", "friendly_cash: " .. var_to_string(friendly_cash) .. "\n")
		debug_print("vint", "opponent_cash: " .. var_to_string(opponent_cash) .. "\n")
		debug_print("vint", "combo_count " .. var_to_string(combo_count) .. "\n")
		debug_print("vint", "combo_meter_value " .. var_to_string(combo_meter_value) .. "\n")
		debug_print("vint", "race_place" .. var_to_string(race_place) .. "\n")
		debug_print("vint", "race_total" .. var_to_string(race_total) .. "\n\n\n")
		debug_print("vint", "just_scored " .. var_to_string(just_scored) .. "\n\n\n")
	end	
	
	--Is activity indicator active?
	if is_active ~= Mp_hud_activity.is_active then
		if is_active == true then
			--Show indicator
			vint_set_property(Mp_hud_activity.handles.activity_grp, "visible", true)
		else 
			--Hide indicator
			vint_set_property(Mp_hud_activity.handles.activity_grp, "visible", false)
		end
		Mp_hud_activity.is_active = is_active 
	end

	--Bitmap Name
	if icon_bmp_name ~= Mp_hud_activity.icon_bmp_name then
		vint_set_property(Mp_hud_activity.handles.icon, "image", icon_bmp_name)
		Mp_hud_activity.icon_bmp_name = icon_bmp_name 
	end

	--Activity Name
	if title_str ~= Mp_hud_activity.title_str then
		vint_set_property(Mp_hud_activity.handles.title_txt, "text_tag", title_str)
		Mp_hud_activity.title_str = title_str 
	end
	
	--Timer
	if activity_time ~= Mp_hud_activity.time then
		vint_set_property(Mp_hud_activity.handles.time_txt, "text_tag", format_clock(activity_time))
		Mp_hud_activity.time = activity_time
	end
	
	--Scores
	local update_meter = false
	if friendly_cash ~= Mp_hud_activity.score_blue then
		local cash_str = "$" .. format_cash(friendly_cash)
		vint_set_property(Mp_hud_activity.handles.text_blue, "text_tag", cash_str)
		vint_set_property(Mp_hud_activity.handles.text_blue_2, "text_tag", cash_str)
		Mp_hud_activity.score_blue = friendly_cash 
		update_meter = true
	end
	
	if opponent_cash ~= Mp_hud_activity.score_red then
		local cash_str = "$" .. format_cash(opponent_cash)
		vint_set_property(Mp_hud_activity.handles.text_red, "text_tag", cash_str)
		Mp_hud_activity.score_red = opponent_cash 
		update_meter = true
	end

	--Meter (Only update if scores have changed)
	if update_meter == true then
		local total_score = opponent_cash + friendly_cash
		local friendly_width, opponent_width
		
		if total_score == 0 then
			friendly_width = Mp_hud_activity.BAR_WIDTH_MAX * .5
			opponent_width = Mp_hud_activity.BAR_WIDTH_MAX * .5
		else
			local scale_factor = Mp_hud_activity.BAR_WIDTH_MAX/total_score 
			friendly_width = friendly_cash * scale_factor
			opponent_width = opponent_cash * scale_factor
		end
		
		if friendly_width < Mp_hud_activity.BAR_WIDTH_MIN then
			--Friendly Bar is smaller than our minimum so we just need to force it to display something
			friendly_width = Mp_hud_activity.BAR_WIDTH_MIN
			opponent_width = Mp_hud_activity.BAR_WIDTH_MAX - Mp_hud_activity.BAR_WIDTH_MIN
		elseif opponent_width < Mp_hud_activity.BAR_WIDTH_MIN then
			--Opponent Bar is smaller than our minimum so we just need to force it to display something
			opponent_width = Mp_hud_activity.BAR_WIDTH_MIN
			friendly_width = Mp_hud_activity.BAR_WIDTH_MAX - Mp_hud_activity.BAR_WIDTH_MIN
		end
		
		vint_set_property(Mp_hud_activity.handles.fill_blue, "source_se", floor(friendly_width), Mp_hud_activity.BAR_HEIGHT)
		vint_set_property(Mp_hud_activity.handles.fill_blue_2, "source_se", floor(friendly_width), Mp_hud_activity.BAR_HEIGHT)
		vint_set_property(Mp_hud_activity.handles.fill_red, "source_se", floor(opponent_width), Mp_hud_activity.BAR_HEIGHT)
		
		--Update Line
		local x, y = element_get_actual_size(Mp_hud_activity.handles.fill_blue)
		local x_d = x/Mp_hud_activity.BAR_WIDTH_MAX
		vint_set_property(Mp_hud_activity.handles.line, "anchor", floor(x_d * friendly_width), 5)
	end
	
	--Combo Bar Updates
	local combo_is_dirty
	
	--Combo meter fill update
	if combo_meter_value ~= Mp_hud_activity.combo_meter_value then
		local target_width = Mp_hud_activity.COMBO_BAR_WIDTH * combo_meter_value
		vint_set_property(Mp_hud_activity.handles.combo_meter_fill, "source_se", target_width, Mp_hud_activity.COMBO_BAR_HEIGHT)
		Mp_hud_activity.combo_meter_value = combo_meter_value 
	end
	
	--Combo Count Update
	if combo_count ~= Mp_hud_activity.combo_count then
		--Set value
		vint_set_property(Mp_hud_activity.handles.combo_info_txt, "text_tag", combo_count)
		combo_is_dirty = true
		Mp_hud_activity.combo_count = combo_count
	end
	
	--Is combo bar visible
	if has_combo_bar ~= Mp_hud_activity.has_combo_bar then
		if has_combo_bar == true then
			--show combo bar
			vint_set_property(Mp_hud_activity.handles.combo_grp, "visible", true) 
			combo_is_dirty = true
		else
			--hide combo bar
			vint_set_property(Mp_hud_activity.handles.combo_grp, "visible", false) 
		end
		Mp_hud_activity.has_combo_bar = has_combo_bar 
	end
	
	--Format Combo bar
	if combo_is_dirty == true then
		local new_width = element_get_actual_size(Mp_hud_activity.handles.combo_info_txt)
	
		--Scale\Align combo meter
		local label_width, label_height = element_get_actual_size(Mp_hud_activity.handles.title_txt)
		local label_x, label_y = vint_get_property(Mp_hud_activity.handles.title_txt, "anchor")
		local combo_padding_left = 15
		
		local combo_grp_x, combo_grp_y = vint_get_property(Mp_hud_activity.handles.combo_grp, "anchor")
		combo_grp_x = label_x + label_width + combo_padding_left + new_width
		vint_set_property(Mp_hud_activity.handles.combo_grp, "anchor", combo_grp_x, combo_grp_y)
		
		local max_width = 302
		
		local bg_1 = vint_object_find("bg_1", Mp_hud_activity.handles.combo_grp)
		local bg_2 = vint_object_find("bg_2", Mp_hud_activity.handles.combo_grp)
		local fill = vint_object_find("fill", Mp_hud_activity.handles.combo_grp)
		
		local target_width = max_width - combo_grp_x + 8
		
		local bg_1_width, bg_1_height = element_get_actual_size(bg_1)
		local bg_2_width, bg_2_height = element_get_actual_size(bg_2)
		local fill_width, fill_height = element_get_actual_size(fill)
		
		element_set_actual_size(bg_1, target_width, bg_1_height)
		element_set_actual_size(bg_2, target_width, bg_2_height)
		element_set_actual_size(fill, target_width - 4, fill_height)
	end
	
	-- Validate whether we have valid values before showing the race position
	local has_race_pos = want_race_pos and race_place >= 1 and race_total >= 1 and race_place <= 8 and race_total <= 8
	
	if has_race_pos ~= Mp_hud_activity.has_race_pos then
		vint_set_property( Mp_hud_activity.handles.race_pos_grp, "visible", has_race_pos )
		
		Mp_hud_activity.has_race_pos = has_race_pos
	end

	if has_race_pos then
		-- Update the place and total bitmaps
		local bitmap_prefix = "ingame_race_position_"
		
		if race_place ~= Mp_hud_activity.race_place then
			vint_set_property( Mp_hud_activity.handles.race_place_bm, "image", bitmap_prefix .. race_place )
			Mp_hud_activity.race_place = race_place
		end
		
		if race_total ~= Mp_hud_activity.race_total then
			vint_set_property( Mp_hud_activity.handles.race_total_bm, "image", bitmap_prefix .. race_total )
			Mp_hud_activity.race_total = race_total
		end
	end
	
	if just_scored == true then
		--Pulse Team score
		--Center bar so when we scale it scales from center
		local start_x, start_y = vint_get_property(Mp_hud_activity.handles.fill_blue, "anchor")
		
		local source_se_x, source_se_y = vint_get_property(Mp_hud_activity.handles.fill_blue, "source_se")
		local width, height = element_get_actual_size(Mp_hud_activity.handles.fill_blue)
		local real_width = width/Mp_hud_activity.BAR_WIDTH_MAX
		
		real_width = floor(real_width * source_se_x)
	
		local anchor_x = real_width
		local anchor_y = height
		local offset_x = 0 - anchor_x /2
		local offset_y = 0 - anchor_y/2
		
		vint_set_property(Mp_hud_activity.handles.fill_blue_2, "anchor", anchor_x, anchor_y)
		vint_set_property(Mp_hud_activity.handles.fill_blue_2, "offset", offset_x, offset_y)
		
		--TODO: Edit tween so scale is close to the original
		local target_scale_x, target_scale_y = vint_get_property(Mp_hud_activity.handles.blue_scale_twn, "end_value")
		local cur_scale_x, cur_scale_y = vint_get_property(Mp_hud_activity.handles.fill_blue, "scale")

		--Center Text
		local width, height = element_get_actual_size(Mp_hud_activity.handles.text_blue)
		local x, y = vint_get_property(Mp_hud_activity.handles.text_blue, "anchor")

		anchor_x = x + width/2
		anchor_y = y + height/2
		offset_x = 0 - width/2
		offset_y = 0 - height/2
		
		vint_set_property(Mp_hud_activity.handles.text_blue_2, "anchor", anchor_x, anchor_y) 
		vint_set_property(Mp_hud_activity.handles.text_blue_2, "offset", offset_x, offset_y) 
		
		local depth = vint_get_property(Mp_hud_activity.handles.text_blue_2, "depth")
		depth = depth - 100
		vint_set_property(Mp_hud_activity.handles.text_blue_2, "depth ", depth) 
		
		vint_set_property(Mp_hud_activity.handles.blue_scale_twn, "end_value", target_scale_x, target_scale_y)
		lua_play_anim(Mp_hud_activity.handles.blue_score_pulse)
	end
end

--------------------------------------------------------------------


function mp_hud_teamscore_frame_find(frame_grp_h)
	local frame = {}
	frame.nw = vint_object_find("bg_nw",	frame_grp_h)
	frame.n = vint_object_find("bg_n", 		frame_grp_h)
	frame.ne = vint_object_find("bg_ne", 	frame_grp_h)
	frame.e = vint_object_find("bg_e", 		frame_grp_h)
	frame.se = vint_object_find("bg_se",	frame_grp_h)
	frame.s = vint_object_find("bg_s", 		frame_grp_h)
	frame.sw = vint_object_find("bg_sw", 	frame_grp_h)
	frame.w = vint_object_find("bg_w", 		frame_grp_h)
	frame.c = vint_object_find("bg_c", 		frame_grp_h)
	return frame
end

function mp_hud_frame_resize(active_frame, width, height)
	width = floor(width)
	height = floor(height)
	
	debug_print("vint", "width:   " .. width .. "\n")
	debug_print("vint", "height:   " .. height .. "\n")
	--setup limits	
	local source_se_x, source_se_y, anchor_x, anchor_y, c_anchor_y, c_anchor_x, target_x, target_y

	--North
	source_se_x, source_se_y = vint_get_property(active_frame.n,"source_se")
	vint_set_property(active_frame.n, "source_se", width, source_se_y)
	
	--West
	source_se_x, source_se_y = vint_get_property(active_frame.w,"source_se")
	vint_set_property(active_frame.w, "source_se", source_se_x, height)
	
	--Center
	vint_set_property(active_frame.c, "source_se", width, height)
	c_anchor_y, c_anchor_x = vint_get_property(active_frame.c, "anchor")
	
	target_x = c_anchor_x + width - 1
	target_y = c_anchor_y + height + 1
	
	--North East
	anchor_x, anchor_y = vint_get_property(active_frame.ne, "anchor")
	vint_set_property(active_frame.ne, "anchor", target_x , anchor_y)
		
	--East
	anchor_x, anchor_y = vint_get_property(active_frame.e, "anchor")
	source_se_x, source_se_y = vint_get_property(active_frame.e, "source_se")
	vint_set_property(active_frame.e, "anchor", target_x , anchor_y)
	vint_set_property(active_frame.e, "source_se", source_se_x, height)
	
	--South West
	anchor_x, anchor_y = vint_get_property(active_frame.sw, "anchor")
	vint_set_property(active_frame.sw, "anchor", anchor_x, target_y)
	
	--South 
	anchor_x, anchor_y = vint_get_property(active_frame.s, "anchor")
	vint_set_property(active_frame.s, "anchor", anchor_x, target_y)
	source_se_x, source_se_y = vint_get_property(active_frame.s, "source_se")
	vint_set_property(active_frame.s, "source_se", width, source_se_y)
	
	--South East
	vint_set_property(active_frame.se, "anchor", target_x, target_y)	
end

-------------------
-- Tagging Progress
-------------------
Mp_hud_tagging_process = {}
function mp_hud_tagging_progress_init()
	Mp_hud_tagging_process.handles = {}
	Mp_hud_tagging_process.handles.meter = vint_object_find("tagging_progress_grp")
	Mp_hud_tagging_process.handles.fill = vint_object_find( "tagging_progress_fill" )
	local x, y = vint_get_property(Mp_hud_tagging_process.handles.fill, "source_se" )
	
	Tagging_progress_info.bar_length = x
	Tagging_progress_info.bar_height = y
	
	-- Hide progress until we need it
	vint_set_property(Mp_hud_tagging_process.handles.meter, "visible", false )
	vint_dataitem_add_subscription("sr2_sa_tagging_progress_item", "update", "mp_hud_tagging_progress_update" )
end

function mp_hud_tagging_progress_update(data_item_h, event_name)
	local percent = vint_dataitem_get(data_item_h)
	percent = min( percent, 1 )
	if percent > 0 then
		vint_set_property(Mp_hud_tagging_process.handles.meter, "visible", true)
		
		local fill_position = percent * Tagging_progress_info.bar_length
		
		vint_set_property(Mp_hud_tagging_process.handles.fill, "source_se", fill_position, Tagging_progress_info.bar_height)
	else
		vint_set_property(Mp_hud_tagging_process.handles.meter, "visible", false)
	end
end

--------------------------------------------
-- Tagging Perks
--------------------------------------------
function mp_hud_perks_init()

	Mp_hud_teamscore.init = true

	--Find objects
	Mp_hud_perks.handles = {}
	Mp_hud_perks.handles.perks = vint_object_find("perk_grp")
	vint_set_property(Mp_hud_perks.handles.perks, "visible", true)

	Mp_hud_perks.slots = {}
	
	Mp_hud_perks.twn_cb_data = {}
	--Clone template object into slots
	local perk_template_h = vint_object_find("perk_template")
	local perk_anim_h = vint_object_find("perk_anim_2")
	
	local h, ico_pulse_h, ico_static_h, anim_h, twn_1_h, twn_2_h, x, y
	local highlight_1_h, highlight_2_h
	for i = 1, 4 do
		--Find position of perk
		h = vint_object_find("perk_" .. i, Mp_hud_perks.handles.perks)
		x, y = vint_get_property(h, "anchor")
		vint_object_destroy(h)
		
		--Clone Perk into destination
		h = vint_object_clone(perk_template_h)
		vint_object_set_parent(h, Mp_hud_perks.handles.perks)
		vint_set_property(h, "anchor", x, y)
		
		--Icon
		ico_pulse_h = vint_object_find("ico_pulse", h)
		ico_static_h = vint_object_find("ico_static", h)
		
		--Highlights
		highlight_1_h = vint_object_find("highlight_bmp", h)
		highlight_2_h = vint_object_find("highlight_normal_bmp", h)
		
		--Clone and target animations
		local anim_h = vint_object_clone(perk_anim_h)
		vint_set_property(anim_h, "target_handle", h)
		vint_set_property(anim_h, "is_paused", true)
		lua_play_anim(anim_h)
		
		--Find Tweens
		twn_1_h = vint_object_find("ico_tint_twn_1", anim_h)
		twn_2_h = vint_object_find("highlight_bmp_alpha_twn_1", anim_h)
		
		--Set end event for end tween loopage
		vint_set_property(twn_2_h, "end_event", "mp_hud_perks_anim_loop")
		Mp_hud_perks.twn_cb_data[twn_2_h] = anim_h
		
		Mp_hud_perks.slots[i] = {
			grp_h = h,
			ico_pulse_h = ico_pulse_h,
			ico_static_h = ico_static_h,
			highlight_1_h = highlight_1_h,
			highlight_2_h = highlight_2_h,
			anim_h = anim_h,
			twn_1_h = twn_1_h,
			twn_2_h = twn_2_h,
		}
	end
	
	--Destroy template objects
	vint_object_destroy(perk_template_h)
	vint_object_destroy(perk_anim_h)	
	
	--Subscribe to events
	vint_datagroup_add_subscription("sr2_sa_tagging_perk_listing_group", "insert", "mp_hud_perks_update")
	vint_datagroup_add_subscription("sr2_sa_tagging_perk_listing_group", "update", "mp_hud_perks_update")
end

function mp_hud_perks_anim_loop(twn_h)
	lua_play_anim(Mp_hud_perks.twn_cb_data[twn_h], 0)
end

function mp_hud_perks_update(di_h, event_name)

	local id, perk_name, owner_team, current_tagger_team, bmp_index = vint_dataitem_get(di_h)
--function mp_hud_perks_test(id, perk_name, owner_team, current_tagger_team, bmp_index)	
 -- Find the right perk info to edit
	
	debug_print("vint", "id: " .. var_to_string(id) .. "\n")
	debug_print("vint", "perk_name: " .. var_to_string(perk_name) .. "\n")
	debug_print("vint", "perk_name: " .. var_to_string(current_tagger_team) .. "\n")
	debug_print("vint", "owner_team: " .. var_to_string(bmp_index) .. "\n")
 
	local slot = Mp_hud_perks.slots[id]
	if slot == nil then
		debug_print( "mpvint", "ERROR!  Tagging perk listing " .. id .. " not found\n" )
		return
	end
	
	local visible = ( perk_name ~= "" )
	vint_set_property(slot.grp_h, "visible", visible)
	
	if visible then
		--Set bitmap information
		vint_set_property(slot.ico_static_h, "image", Mp_perk_enum_bitmaps[bmp_index])
		vint_set_property(slot.ico_pulse_h, "image", Mp_perk_enum_bitmaps[bmp_index])
	else
		return
	end

	-- The current tag is no longer being tagged. Return the perk text to the new owner.
	if current_tagger_team == FOF_NEUTRAL then
		local new_color = Mp_hud_colors[owner_team]
		
		--Stop any animations from going on
		--vint_set_property(slot.anim_h, "is_paused", true)
		
		vint_set_property(slot.ico_static_h , "visible", true)
		vint_set_property(slot.ico_pulse_h , "visible", false)
		vint_set_property(slot.highlight_1_h , "visible", false)
		vint_set_property(slot.highlight_2_h , "visible", false)
		
		--Tint and showBMP
		vint_set_property(slot.ico_static_h, "tint", new_color.r, new_color.g, new_color.b)
		vint_set_property(slot.ico_pulse_h, "tint", new_color.r, new_color.g, new_color.b)	
		vint_set_property(slot.ico_static_h, "visible", true)
		vint_set_property(slot.ico_pulse_h, "visible", false)
		
	else
		local start_color = Mp_hud_colors[owner_team]
		local end_color = Mp_hud_colors[current_tagger_team]

		vint_set_property(slot.ico_static_h , "visible", false)
		vint_set_property(slot.ico_pulse_h , "visible", true)
		
		vint_set_property(slot.highlight_1_h , "visible", true)
		vint_set_property(slot.highlight_2_h , "visible", true)
		vint_set_property(slot.highlight_1_h , "tint", end_color.r, end_color.g, end_color.b)
		vint_set_property(slot.highlight_2_h , "tint", end_color.r, end_color.g, end_color.b)
		vint_set_property(slot.ico_pulse_h, "tint", start_color.r, start_color.g, start_color.b)
		vint_set_property(slot.ico_static_h, "tint", start_color.r, start_color.g, start_color.b)
		
		--[[
		--1 is the color flashing thing... (start = og, end = new)
		vint_set_property(slot.twn_1_h, "start_value", start_color.r, start_color.g, start_color.b)
		vint_set_property(slot.twn_1_h, "end_value", end_color.r, end_color.g, end_color.b)
		
		--2 is the original color(start/end = og)
		vint_set_property(slot.twn_2_h, "start_value", start_color.r, start_color.g, start_color.b)
		vint_set_property(slot.twn_2_h, "end_value", start_color.r, start_color.g, start_color.b)
		]]
		--lua_play_anim(slot.anim_h, 0)
	end	
end


Mp_hud_voip = {}

function mp_hud_voip_init()
	vint_set_property(vint_object_find("voip_grp"), "visible", true)
	
	Mp_hud_voip.slots = {}
	local h = vint_object_find("voip_1")
	Mp_hud_voip.slots[0] = {
		grp_h = h, txt_h = vint_object_find("txt", h)
	}
	
	local h = vint_object_find("voip_2")
	Mp_hud_voip.slots[1] = {
		grp_h = h, txt_h = vint_object_find("txt", h)
	}
	
	local h = vint_object_find("voip_3")
	Mp_hud_voip.slots[2] = {
		grp_h = h, txt_h = vint_object_find("txt", h)
	}
	
	vint_datagroup_add_subscription("mp_game_voip", "insert", "mp_hud_voip_update")
	vint_datagroup_add_subscription("mp_game_voip", "update", "mp_hud_voip_update")
end

function mp_hud_voip_update(di_h)
	local index, player_name = vint_dataitem_get(di_h)
	local grp_h = Mp_hud_voip.slots[index].grp_h
	local txt_h = Mp_hud_voip.slots[index].txt_h
	
	vint_set_property(txt_h, "text_tag", player_name)
	if player_name == "" then
		--No name so hide the slot
		vint_set_property(grp_h, "visible", false)
	else
		vint_set_property(grp_h, "visible", true)
	end
end

-------------------
-- Init and Cleanup
-------------------

function mp_hud_init()
	local gp_mode = get_game_play_mode()
	
	--Hide objects
	vint_set_property(vint_object_find("teamscore_grp"), "visible", false)
	vint_set_property(vint_object_find("activity_score_grp"), "visible", false)
	vint_set_property(vint_object_find("tagging_progress_grp"), "visible", false )
	vint_set_property(vint_object_find("perk_grp"), "visible", false )
	vint_set_property(vint_object_find("voip_grp"), "visible", false )
	
	--mp_hud_teamscore_init()
	--mp_hud_activity_init()
	
	--
	
	if gp_mode == "Braveheart" then
		mp_hud_activity_init()
		mp_hud_teamscore_init()
		mp_hud_tagging_progress_init()
		mp_hud_perks_init()
		mp_hud_voip_init()

	elseif gp_mode == "Gangsta Brawl" or gp_mode == "Team Gangsta Brawl" then
		mp_hud_teamscore_init()
		mp_hud_voip_init()
	end
end

function mp_hud_clean_up()
end

function mp_test1()

--[[
	mp_hud_perks_test(1, "Perk1", FOF_NEUTRAL, FOF_FRIEND, 	5)	
	mp_hud_perks_test(2, "Perk2", FOF_NEUTRAL, FOF_FOE, 		6)	
	mp_hud_perks_test(3, "Perk4", FOF_FOE,		 FOF_NEUTRAL, 	7)	
	mp_hud_perks_test(4, "Perk5", FOF_NEUTRAL, FOF_NEUTRAL, 	8)	
	]]
	Mp_hud_teamscore.score_limit  = 20000
	mp_hud_teamscore_status_test(3, 1, 1, 2)

	mp_hud_teamscore_score_test(2000, 2000, "$22,000", "$2000")

end

function mp_test2()
--[[
  	mp_hud_perks_test(1, "Perk1", FOF_FRIEND, FOF_NEUTRAL, 9)	
	mp_hud_perks_test(2, "Perk2", FOF_NEUTRAL, FOF_NEUTRAL, 10)	
	mp_hud_perks_test(3, "Perk1", FOF_FOE, FOF_FRIEND, 4)	
	mp_hud_perks_test(4, "Perk1", FOF_FRIEND, FOF_NEUTRAL, 3)	
	]]
	--mp_hud_activity_test(true, "ui_hud_act_ico_crowdcontrol", "crowd control", 200, 0, 0, false, 0, 0, true)
	--mp_hud_teamscore_test(0, 0, 412, 421, 52324, 32, 100000)
	mp_hud_teamscore_status_test(1, 0, 1, 2)
	mp_hud_activity_test(true, "ui_hud_act_ico_crowdcontrol", "crowd control", 200, 43784, 0, false, .2, 5, true)
end

function mp_test3()
--[[
  	mp_hud_perks_test(1, "Perk1", FOF_FRIEND, FOF_NEUTRAL, 1)	
	mp_hud_perks_test(2, "Perk2", FOF_NEUTRAL, FOF_FRIEND, 2)	
	mp_hud_perks_test(3, "Perk1", FOF_NEUTRAL, FOF_FRIEND, 3)	
	mp_hud_perks_test(4, "Perk1", FOF_FRIEND, FOF_FOE, 4)	
]]
	mp_hud_teamscore_status_test(2, 0, 1, 2)
	mp_hud_activity_test(true, "ui_hud_act_ico_crowdcontrol", "crowd control", 200, 43784, 0, false, .2, 5, true)
	--mp_hud_teamscore_test(4000, 500, "$4,000", "$500")
end

function mp_test4()
--	mp_hud_activity_test(true, "ui_hud_act_ico_crowdcontrol", "crowd control", 200, 0, 53432, true, .5, 19, true)
	mp_hud_activity_test(true, "ui_hud_act_ico_mayhem", "Mayhem", 200, 43784, 0, true, .2, 5, true)
end

function mp_test5()
	mp_hud_activity_test(true, "ui_hud_act_ico_mayhem", "MayhemDESTRUC", 200, 43784, 0, true, 1, 25, true)
	--mp_hud_activity_test(true, "ui_hud_act_ico_crowdcontrol", "crowd control", 10, 5500, 9300, true, .2, 0, true)
end
