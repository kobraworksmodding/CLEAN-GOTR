----------
-- Globals
----------

Score_bars_info = {
	score_bars_group_h 			= 0,
	friend_bar_h 						= 0,
	foe_bar_h 							= 0,
	
	friend_text_h						= 0,
	foe_text_h							= 0,
	
	friend_bar_length 				= 0,
	friend_bar_width 					= 0,
	foe_bar_length 					= 0,
	foe_bar_width 						= 0,
	
	score_limit 						= 0,
}

Game_timer_h = 0

Activity_score_bar_info = {
	bar_group_h			= 0,
	split_group_h		= 0,
	
	friend_text_h		= 0,
	foe_text_h			= 0,
	
	bar_length			= 0,
}

Tagging_progress_info = {
	group_h				= 0,
	fill_h				= 0,
	
	bar_length			= 0,
}

Tagging_perk_listing_info = {
	[1] = { text_h = 0, scale_tween_h = 0, color_tween_h = 0 },
	[2] = { text_h = 0, scale_tween_h = 0, color_tween_h = 0 },
	[3] = { text_h = 0, scale_tween_h = 0, color_tween_h = 0 },
	[4] = { text_h = 0, scale_tween_h = 0, color_tween_h = 0 },
}

FOF_NEUTRAL 		= -1
FOF_FRIEND			= 0
FOF_FOE				= 1

-- Colors need to be specified from 0 to 1
NEUTRAL_COLOR =	{ r = 255/255, g = 255/255, b = 255/255 }
FRIEND_COLOR = 	{ r =  52/255, g = 167/255, b = 255/255 }
FOE_COLOR = 		{ r = 205/255, g =  29/255, b =  29/255 }

function get_color_from_fof_type(fof_type)

	if fof_type == FOF_FRIEND then
		return FRIEND_COLOR
	elseif fof_type == FOF_FOE then
		return FOE_COLOR
	else
		return NEUTRAL_COLOR	
	end

end

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
function find_score_percent(score, score_limit)
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
-- Respect Bars
---------------

function score_bars_init()
	-- Get the various interface object handles
	local group_h = vint_object_find("respect_bars")
	Score_bars_info.score_bars_group_h = group_h
	Score_bars_info.friend_bar_h = vint_object_find("friend_bar", group_h)
	Score_bars_info.foe_bar_h = vint_object_find("foe_bar", group_h)
	
	Score_bars_info.friend_text_h = vint_object_find("friend_text", group_h)
	Score_bars_info.foe_text_h = vint_object_find("foe_text", group_h)
	
	-- Get the length and width of each bar from the start of the match
	Score_bars_info.friend_bar_length, Score_bars_info.friend_bar_width = vint_get_property(Score_bars_info.friend_bar_h, "source_se")
	Score_bars_info.foe_bar_length, Score_bars_info.foe_bar_width = vint_get_property(Score_bars_info.foe_bar_h, "source_se")

	-- Set the team scores to both be zeroed out to start
	vint_set_property(Score_bars_info.friend_bar_h, "source_se", 0, Score_bars_info.friend_bar_width)
	vint_set_property(Score_bars_info.foe_bar_h, "source_se", 0, Score_bars_info.foe_bar_width)
	
	-- Make 'em all visible
	vint_set_property(Score_bars_info.score_bars_group_h, "visible", true)
	
	-- Add a subscription to the fof scores data item
	vint_dataitem_add_subscription("sr2_fof_scores_item", "update", "fof_scores_change")
	
	-- Add a subscription to the score limit data item
	vint_dataitem_add_subscription("sr2_score_limit_item", "update", "score_limit_change")
end

function score_bars_hide()
	vint_set_property( vint_object_find( "respect_bars" ), "visible", false )
end

-- Callback for an update to the respect bar scores
--
function fof_scores_change(data_item_h, event_name)
	local friend_score, foe_score, friend_text, foe_text = vint_dataitem_get(data_item_h)
	
	local percent
	
	-- Readjust the score visibility based on the size of the bar
	if Score_bars_info.score_limit > 0 then
		-- Show the bars as a percentage of the score limit
		percent = find_score_percent(friend_score, Score_bars_info.score_limit)
		vint_set_property(Score_bars_info.friend_bar_h, "source_se", percent * Score_bars_info.friend_bar_length, Score_bars_info.friend_bar_width)
		debug_print("mpvint", "Friend bar set to " .. friend_score .. "/" .. Score_bars_info.score_limit .. "\n")
		
		percent = find_score_percent(foe_score, Score_bars_info.score_limit)
		vint_set_property(Score_bars_info.foe_bar_h, "source_se", percent * Score_bars_info.foe_bar_length, Score_bars_info.foe_bar_width)
		debug_print("mpvint", "Foe bar set to " .. foe_score .. "/" .. Score_bars_info.score_limit .. "\n")
	else
		-- Show the bars as a percentage of the highest score
		local highest_score = friend_score
		if foe_score > friend_score then
			highest_score = foe_score
		end

		percent = find_score_percent(friend_score, highest_score)
		vint_set_property(Score_bars_info.friend_bar_h, "source_se", percent * Score_bars_info.friend_bar_length, Score_bars_info.friend_bar_width)
		debug_print("mpvint", "Friend bar set to " .. friend_score .. "/" .. highest_score .. "\n")
		
		percent = find_score_percent(foe_score, highest_score)
		vint_set_property(Score_bars_info.foe_bar_h, "source_se", percent * Score_bars_info.foe_bar_length, Score_bars_info.foe_bar_width)
		debug_print("mpvint", "Foe bar set to " .. foe_score .. "/" .. highest_score .. "\n")
	end
	
	vint_set_property(Score_bars_info.friend_text_h, "text_tag", friend_text)
	vint_set_property(Score_bars_info.foe_text_h, "text_tag", foe_text)
end

-- Callback to set the score limit
--
function score_limit_change(data_item_h, event_name)
	Score_bars_info.score_limit = vint_dataitem_get(data_item_h)
	debug_print("mpvint", "Setting score limit to " .. Score_bars_info.score_limit .. "\n")
end

-------------
-- Game Timer
-------------

-- Clears out the timer object and adds a subscription to the mode timestamp
--
function game_timer_init()
	Game_timer_h = vint_object_find("timer")
	vint_set_property(Game_timer_h, "text_tag", "")
	vint_set_property(Game_timer_h, "visible", true )
	
	vint_dataitem_add_subscription("sr2_sa_game_timer_item", "update", "game_timer_change")
end

function game_timer_hide()
	vint_set_property( vint_object_find( "timer" ), "visible", false )
end

-- Callback when the timer value changes (currently every frame), changes the timer string
--
function game_timer_change(data_item_h, event_name)
	local timer_string = vint_dataitem_get(data_item_h)
	vint_set_property(Game_timer_h, "text_tag", timer_string)
end

---------------------
-- Activity Score Bar
---------------------

function activity_score_bar_init()
	debug_print("mpvint", "initing activity score bar\n")

	local group_h = vint_object_find("activity_score_bar_group")
	Activity_score_bar_info.bar_group_h = group_h
	local split_h = vint_object_find("act_bar_split_group", group_h)
	Activity_score_bar_info.split_group_h = split_h
	Activity_score_bar_info.friend_text_h = vint_object_find("act_bar_friend_text", split_h)
	Activity_score_bar_info.foe_text_h = vint_object_find("act_bar_foe_text", split_h)
	
	-- Find the width of the bar (clip region)
	local x, y = vint_get_property(group_h, "clip_size")
	Activity_score_bar_info.bar_length = x
	
	-- Add a subscription to the score bar item for Strong Arm
	vint_dataitem_add_subscription("sr2_sa_score_bar_item", "update", "activity_score_bar_change")
	
	-- Hide the bar for now
	vint_set_property(group_h, "visible", false)
end

function activity_score_bar_hide()
	vint_set_property( vint_object_find( "activity_score_bar_group" ), "visible", false )
end

function activity_score_bar_change(data_item_h, event_name)
	local friend_score, foe_score, friend_string, foe_string, visible_flag = vint_dataitem_get(data_item_h)
	
	-- Set visibility
	vint_set_property(Activity_score_bar_info.bar_group_h, "visible", visible_flag)
	
	-- Debug spew
	debug_print("mpvint", "Setting activity score bar visibility to be " .. bool_to_text(visible_flag) .. "\n")
	
	-- If it's visible, we have more to do
	if visible_flag then
		-- Calculate the ratio to show
		local ratio = 0.5
		
		-- If no one's scored yet, show an even match
		local total_score = friend_score + foe_score
		if total_score > 0 then
			ratio = friend_score / total_score
		end
		debug_print("mpvint", "score bar ratio is " .. ratio .. "\n")
		
		-- Position the split based on the ratio
		local position = ratio * Activity_score_bar_info.bar_length
		debug_print("mpvint", "split position is " .. position .. " out of " .. Activity_score_bar_info.bar_length .. "\n")
		
		-- Set the split group position
		vint_set_property(Activity_score_bar_info.split_group_h, "anchor", position, 0)
		
		-- Update the text
		vint_set_property(Activity_score_bar_info.friend_text_h, "text_tag", friend_string)
		vint_set_property(Activity_score_bar_info.foe_text_h, "text_tag", foe_string)
	end
end

-------------------
-- Tagging Progress
-------------------

function tagging_progress_init()
	local group_h = vint_object_find( "tagging_progress_group" )
	Tagging_progress_info.group_h = group_h
	Tagging_progress_info.fill_h = vint_object_find( "tagging_progress_fill", group_h )
	
	local x, y = vint_get_property( group_h, "clip_size" )
	Tagging_progress_info.bar_length = x
	
	-- Hide progress until we need it
	vint_set_property( group_h, "visible", false )
	
	vint_dataitem_add_subscription( "sr2_sa_tagging_progress_item", "update", "tagging_progress_change" )
end

function tagging_progress_hide()
	vint_set_property( vint_object_find( "tagging_progress_group" ), "visible", false )
end

function tagging_progress_change( data_item_h, event_name )
	local percent = vint_dataitem_get( data_item_h )
	
	percent = min( percent, 1 )
	
	if percent > 0 then
		vint_set_property( Tagging_progress_info.group_h, "visible", true )
		
		local fill_position = ( percent - 1 ) * Tagging_progress_info.bar_length
		vint_set_property( Tagging_progress_info.fill_h, "anchor", fill_position, 0 )
	else
		vint_set_property( Tagging_progress_info.group_h, "visible", false )
	end
end

-----------------------
-- Tagging Perk Listing
-----------------------

function tagging_perk_listing_init()
	-- Find the overall status grouping
	local group_h = vint_object_find( "tagging_perk_listing" )
	vint_set_property( group_h, "visible", true )

	-- Initialize the first perk text field
	local text_h = vint_object_find( "perk_text1", group_h )
	local info = Tagging_perk_listing_info[ 1 ]
	info.text_h = text_h
	vint_set_property( text_h, "visible", false )

	-- Clone the second text field and change its position	
	text_h = vint_object_clone( text_h )
	info = Tagging_perk_listing_info[ 2 ]
	info.text_h = text_h
	vint_set_property( text_h, "visible", false )

	-- Move the clone
	local point_h = vint_object_find( "perk_pt2", group_h )
	local x, y = vint_get_property( point_h, "anchor" )
	vint_set_property( text_h, "anchor", x, y )

	-- Clone the third text field and change its position	
	text_h = vint_object_clone( text_h )
	info = Tagging_perk_listing_info[ 3 ]
	info.text_h = text_h
	vint_set_property( text_h, "visible", false )

	-- Move the clone
	local point_h = vint_object_find( "perk_pt3", group_h )
	local x, y = vint_get_property( point_h, "anchor" )
	vint_set_property( text_h, "anchor", x, y )

	-- Clone the fourth text field and change its position	
	text_h = vint_object_clone( text_h )
	info = Tagging_perk_listing_info[ 4 ]
	info.text_h = text_h
	vint_set_property( text_h, "visible", false )

	-- Move the clone
	local point_h = vint_object_find( "perk_pt4", group_h )
	local x, y = vint_get_property( point_h, "anchor" )
	vint_set_property( text_h, "anchor", x, y )

	for i, perk_info in pairs(Tagging_perk_listing_info) do
		Tagging_perk_listing_info[i].scale_tween_h = create_tween("tagging_perk_scale_tween"..i, perk_info.text_h, "scale", .25)
		Tagging_perk_listing_info[i].color_tween_h = create_tween("tagging_perk_color_tween"..i, perk_info.text_h, "tint", .25)
		vint_set_property(Tagging_perk_listing_info[i].scale_tween_h, "state", "disabled")
		vint_set_property(Tagging_perk_listing_info[i].color_tween_h, "state", "disabled")
	end

   vint_datagroup_add_subscription("sr2_sa_tagging_perk_listing_group", "insert", "tagging_perk_listing_change")
	vint_datagroup_add_subscription("sr2_sa_tagging_perk_listing_group", "update", "tagging_perk_listing_change")
end

function tagging_perk_listing_hide()
	vint_set_property( vint_object_find( "tagging_perk_listing" ), "visible", false )
end

function tagging_perk_listing_change( data_item_h, event_name )

	local id, perk_name, owner_team, current_tagger_team = vint_dataitem_get( data_item_h )
	
	-- Find the right perk info to edit
	local info = Tagging_perk_listing_info[ id ]
	if info == nil then
		debug_print( "mpvint", "ERROR!  Tagging perk listing " .. id .. " not found\n" )
		return
	end
	
	local visible = ( perk_name ~= "" )
	vint_set_property( info.text_h, "visible", visible )
	
	if visible then
		vint_set_property( info.text_h, "text_tag", perk_name )
	else
		return
	end

	-- The current tag is no longer being tagged. Return the perk text to the new owner.
	if current_tagger_team == FOF_NEUTRAL then
	
		vint_set_property(info.color_tween_h, "state", "disabled")

		local new_color = get_color_from_fof_type(owner_team)

		vint_set_property(info.text_h, "tint", new_color.r, new_color.g, new_color.b)

		local scale_tween_state = vint_get_property(info.scale_tween_h, "state")
		
		if scale_tween_state ~= 3 then -- 3 is the state value of "disabled"
			local start_scale = {}
			start_scale.x, start_scale.y = vint_get_property(info.scale_tween_h, "start_value")
			vint_set_property(info.text_h, "scale", start_scale.x, start_scale.y)
			vint_set_property(info.scale_tween_h, "state", "disabled")
		end

	else

		local start_color = get_color_from_fof_type(owner_team)

		local end_color = get_color_from_fof_type(current_tagger_team)

		vint_set_property(info.color_tween_h, "start_value", start_color.r, start_color.g, start_color.b)
		vint_set_property(info.color_tween_h, "end_value", end_color.r, end_color.g, end_color.b)
		vint_set_property(info.color_tween_h, "loop_mode", "bounce")
		vint_set_property(info.color_tween_h, "max_loops", 0)
		
		vint_set_property(info.color_tween_h, "start_time", vint_get_time_index())
		vint_set_property(info.color_tween_h, "state", "running")
		
		local start_size = {}
		start_size.width, start_size.length = vint_get_property( info.text_h, "scale" )
		local zoom_size = {}
		zoom_size.width = start_size.width * 1.25
		zoom_size.length = start_size.length * 1.25

		vint_set_property(info.scale_tween_h, "start_value", start_size.width, start_size.length)
		vint_set_property(info.scale_tween_h, "end_value", zoom_size.width, zoom_size.length)
		vint_set_property(info.scale_tween_h, "loop_mode", "bounce")
		vint_set_property(info.scale_tween_h, "max_loops", 0)

		vint_set_property(info.scale_tween_h, "start_time", vint_get_time_index())
		vint_set_property(info.scale_tween_h, "state", "running")
	
	end

end

-------------------
-- Init and Cleanup
-------------------

function hud_multi_prototype_init()
	local gp_mode = get_game_play_mode()
	debug_print( "mpvint", "Game play mode is " .. gp_mode .. "\n" )
	
	-- Hide everything to start
	score_bars_hide()
	game_timer_hide()
	activity_score_bar_hide()
	tagging_progress_hide()
	tagging_perk_listing_hide()
	
	if gp_mode == "Braveheart" then
		score_bars_init()
		game_timer_init()
		activity_score_bar_init()
		tagging_progress_init()
		tagging_perk_listing_init()
		
	elseif gp_mode == "Gangsta Brawl" or gp_mode == "Team Gangsta Brawl" then
		score_bars_init()
		game_timer_init()
	end
end

function hud_multi_prototype_cleanup()


end
