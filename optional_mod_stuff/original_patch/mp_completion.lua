-- Multiplayer Completion Screen shenanigans
Mp_completion_audio = {
	top_3 = audio_get_audio_id("SYS_COMPLETION_START"),
	top_2 = audio_get_audio_id("SYS_COMPLETION_START_2"),
	cash = audio_get_audio_id("SYS_COMPLETION_CASH"),
	respect = audio_get_audio_id("SYS_COMPLETION_RESPECT"),
	image = audio_get_audio_id("SYS_COMPLETION_OBJECT"),
	text = audio_get_audio_id("SYS_COMPLETION_TEXT"),
	tips = audio_get_audio_id("SYS_COMPLETION_MENU"),
	unlock = audio_get_audio_id("SYS_COMPLETION_UNLOCK"),
	fail = audio_get_audio_id("SYS_COMPLETION_FAIL"),
	cash_count = audio_get_audio_id("SYS_COMPLETION_CASH_COUNT"),
	cash_hit = audio_get_audio_id("SYS_COMPLETION_CASH_HIT"),
	respect_count = audio_get_audio_id("SYS_COMPLETION_CASH_COUNT"),
	respect_hit = audio_get_audio_id("SYS_COMPLETION_RESPECT_HIT"),
	respect_end = audio_get_audio_id("SYS_HUD_DIVERSION_COMPLETE"),
}

Mp_completion_position_tag = {
	[0] = "MP_1",
	[1] = "MP_2",
	[2] = "MP_3",
	[3] = "MP_4",
	[4] = "MP_5",
	[5] = "MP_6",
	[6] = "MP_7",
	[7] = "MP_8",
	[8] = "MP_9",
	[9] = "MP_10",
	[10] = "MP_11",
	[11] = "MP_12",
}

Mp_completion_rank_badge_tag = {
	[0] = "MULTI_RANK_1",
	[1] = "MULTI_RANK_2",
	[2] = "MULTI_RANK_3",
	[3] = "MULTI_RANK_4",
	[4] = "MULTI_RANK_5",
	[5] = "MULTI_RANK_6",
	[6] = "MULTI_RANK_7",
	[7] = "MULTI_RANK_8",
	[8] = "MULTI_RANK_9",
	[9] = "MULTI_RANK_10",
	[10] = "MULTI_RANK_11",
	[11] = "MULTI_RANK_12",
}

Mp_completion_badge_description_tags = {
	"MULTI_BADGE_1",
	"MULTI_BADGE_2",
	"MULTI_BADGE_3",
	"MULTI_BADGE_4",
	"MULTI_BADGE_5",
	"MULTI_BADGE_6",
	"MULTI_BADGE_7",
	"MULTI_BADGE_8",
	"MULTI_BADGE_9",
	"MULTI_BADGE_10",
	"MULTI_BADGE_11",
	"MULTI_BADGE_12",
	"MULTI_BADGE_13",
	"MULTI_BADGE_14",
	"MULTI_BADGE_15",
	"MULTI_BADGE_16",
	"MULTI_BADGE_17",
	"MULTI_BADGE_18",
	"MULTI_BADGE_19",
	"MULTI_BADGE_20",
}

Mp_completion_badges_done = false -- did we create the badges yet?

Mp_completion_badges_again = false --init the global for doing the badge screen twice

Mp_completion_is_animating = true --init the global, we will be animating the first screen

MP_COMPLETION_SKIP_TIME = 60  --used to fast forward the documents

MP_COMPLETION_GAP_VERT = 60 --pixel gap between content and tips

MP_COMPLETION_RED = {["r"]=0.8, ["g"]=0, ["b"]=0}
MP_COMPLETION_BLUE = {["r"]=0.27, ["g"]=0.51, ["b"]=0.84}

MAX_MULTI_PLAYERS = 12

---------------------------------
-- Initialization of the vint doc
function mp_completion_init()
	local h = -1
	local h2 = -1
	local tween_h = -1
	
	--#####################
	--GENERIC SHIT
	--#####################
	
	--safe frame
	Mp_completion.handles.safe_frame = vint_object_find("safe_frame")
	
	--black backgrounds
	Mp_completion.handles.black_1 = vint_object_find("black_1")
	Mp_completion.handles.black_2 = vint_object_find("black_2")
	
	--Tips
	Mp_completion.handles.tips = vint_object_find("tips")
	h = Mp_completion.handles.tips
	Mp_completion.handles.btn_1 = vint_object_find("btn_1", h)
	vint_set_property(Mp_completion.handles.btn_1, "image", get_a_button())
	Mp_completion.handles.btn_2 = vint_object_find("btn_2", h)
	vint_set_property(Mp_completion.handles.btn_2, "image", get_x_button())
	Mp_completion.handles.btn_3 = vint_object_find("btn_3", h)
	vint_set_property(Mp_completion.handles.btn_3, "image", get_b_button())
	
	Mp_completion.handles.tip_1 = vint_object_find("tip_1", h)
	Mp_completion.handles.tip_2 = vint_object_find("tip_2", h)
	Mp_completion.handles.tip_3 = vint_object_find("tip_3", h)
	
	--Top Group of location, name, level
	Mp_completion.handles.top_grp = vint_object_find("top_grp")
	h = Mp_completion.handles.top_grp
	Mp_completion.handles.top_1 = vint_object_find("top_1", h)
	Mp_completion.handles.top_2 = vint_object_find("top_2", h)
	Mp_completion.handles.top_3 = vint_object_find("top_3", h)
		
	--Wall
	Mp_completion.handles.wall_h = vint_object_find("wall")
	
	--Column headings
	Mp_completion.handles.headings_sa_h = vint_object_find("heading_sa")
	Mp_completion.handles.headings_gb_h = vint_object_find("heading_gb")

	--#####################
	--PAGE 1
	--#####################
	Mp_completion.handles.page_1 = vint_object_find("page_1")
	
		--AWARDS
		Mp_completion.handles.awards = vint_object_find("awards")
	
		--..award 1
		Mp_completion.handles.award_1 = vint_object_find("award_1")
		h = Mp_completion.handles.award_1
		Mp_completion.handles.a = { }
		Mp_completion.handles.a[0] = { 
			grp = h,
			handle_1 = vint_object_find("a_1_1", h),
			handle_2 = vint_object_find("a_1_2", h),
			handle_3 = vint_object_find("a_1_3", h),
		}
		
		--..award 2
		Mp_completion.handles.award_2 = vint_object_find("award_2")
		h = Mp_completion.handles.award_2
		Mp_completion.handles.a[1] = { 
			grp = h,
			handle_1 = vint_object_find("a_2_1", h),
			handle_2 = vint_object_find("a_2_2", h),
			handle_3 = vint_object_find("a_2_3", h),
		}
		
		--..award 3
		Mp_completion.handles.award_3 = vint_object_find("award_3")
		h = Mp_completion.handles.award_3
		Mp_completion.handles.a[2] = { 
			grp = h,
			handle_1 = vint_object_find("a_3_1", h),
			handle_2 = vint_object_find("a_3_2", h),
			handle_3 = vint_object_find("a_3_3", h),
		}
		
		--..score blue
		Mp_completion.handles.team_blue = vint_object_find("team_blue")
		h = Mp_completion.handles.team_blue
		Mp_completion.handles.blue_name = vint_object_find("blue_name", h)
		Mp_completion.handles.blue_score = vint_object_find("blue_score", h)
		Mp_completion.handles.blue_rank = vint_object_find("blue_rank", h)
		Mp_completion.handles.blue_kills = vint_object_find("blue_kills", h)
		
		--..score red
		Mp_completion.handles.team_red = vint_object_find("team_red")
		h = Mp_completion.handles.team_red
		Mp_completion.handles.red_name = vint_object_find("red_name", h)
		Mp_completion.handles.red_score = vint_object_find("red_score", h)
		Mp_completion.handles.red_rank = vint_object_find("red_rank", h)
		Mp_completion.handles.red_kills = vint_object_find("red_kills", h)
	
	
	--#####################
	--PAGE 2
	--#####################
	
	--page 2 group
	Mp_completion.handles.page_2 = vint_object_find("page_2")
	
		--..unlocked_rewards
		Mp_completion.handles.unlock = vint_object_find("unlock")
		h = Mp_completion.handles.unlock
		Mp_completion.handles.t_unlocked = vint_object_find("t_unlocked", h)
		Mp_completion.handles.t_rewards = vint_object_find("t_rewards", h)
					
		--..badges: otherwise here's a group of 10
		Mp_completion.handles.badges = vint_object_find("badges")
		h = Mp_completion.handles.badges
			
		Mp_completion.handles.bdg = { }
		Mp_completion.handles.bdg[0] = {
			handle_1 =  vint_object_find("rwd_1", h),
			handle_2 =  vint_object_find("txt_1", h),
		}
		
		Mp_completion.handles.bdg[1] = {
			handle_1 =  vint_object_find("rwd_2", h),
			handle_2 =  vint_object_find("txt_2", h),
		}
		
		Mp_completion.handles.bdg[2] = {
			handle_1 =  vint_object_find("rwd_3", h),
			handle_2 =  vint_object_find("txt_3", h),
		}
		
		Mp_completion.handles.bdg[3] = {
			handle_1 =  vint_object_find("rwd_4", h),
			handle_2 =  vint_object_find("txt_4", h),
		}
		
		Mp_completion.handles.bdg[4] = {
			handle_1 =  vint_object_find("rwd_5", h),
			handle_2 =  vint_object_find("txt_5", h),
		}
		
		Mp_completion.handles.bdg[5] = {
			handle_1 = vint_object_find("rwd_6", h) ,
			handle_2 =  vint_object_find("txt_6", h),
		}
		
		Mp_completion.handles.bdg[6] = {
			handle_1 =  vint_object_find("rwd_7", h),
			handle_2 =  vint_object_find("txt_7", h),
		}
		
		Mp_completion.handles.bdg[7] = {
			handle_1 =  vint_object_find("rwd_8", h),
			handle_2 =  vint_object_find("txt_8", h),
		}
		
		Mp_completion.handles.bdg[8] = {
			handle_1 =  vint_object_find("rwd_9", h),
			handle_2 =  vint_object_find("txt_9", h),
		}
		
		Mp_completion.handles.bdg[9] = {
			handle_1 =  vint_object_find("rwd_10", h),
			handle_2 =  vint_object_find("txt_10", h),
		}
		
		
		--badges 11 - 20 
		Mp_completion.handles.bdg[10] = {
			handle_1 =  vint_object_find("rwd_1", h),
			handle_2 =  vint_object_find("txt_1", h),
		}
		
		Mp_completion.handles.bdg[11] = {
			handle_1 =  vint_object_find("rwd_2", h),
			handle_2 =  vint_object_find("txt_2", h),
		}
		
		Mp_completion.handles.bdg[12] = {
			handle_1 =  vint_object_find("rwd_3", h),
			handle_2 =  vint_object_find("txt_3", h),
		}
		
		Mp_completion.handles.bdg[13] = {
			handle_1 =  vint_object_find("rwd_4", h),
			handle_2 =  vint_object_find("txt_4", h),
		}
		
		Mp_completion.handles.bdg[14] = {
			handle_1 =  vint_object_find("rwd_5", h),
			handle_2 =  vint_object_find("txt_5", h),
		}
		
		Mp_completion.handles.bdg[15] = {
			handle_1 = vint_object_find("rwd_6", h) ,
			handle_2 =  vint_object_find("txt_6", h),
		}
		
		Mp_completion.handles.bdg[16] = {
			handle_1 =  vint_object_find("rwd_7", h),
			handle_2 =  vint_object_find("txt_7", h),
		}
		
		Mp_completion.handles.bdg[17] = {
			handle_1 =  vint_object_find("rwd_8", h),
			handle_2 =  vint_object_find("txt_8", h),
		}
		
		Mp_completion.handles.bdg[18] = {
			handle_1 =  vint_object_find("rwd_9", h),
			handle_2 =  vint_object_find("txt_9", h),
		}
		
		Mp_completion.handles.bdg[19] = {
			handle_1 =  vint_object_find("rwd_10", h),
			handle_2 =  vint_object_find("txt_10", h),
		}

		
	--#####################
	--PAGE 3
	--#####################
	
	--page 3 group
	Mp_completion.handles.page_3 = vint_object_find("page_3")
	
	--..scoreboard top text
	Mp_completion.handles.scoreboard_top = vint_object_find("scoreboard_top")
	h = Mp_completion.handles.scoreboard_top
	Mp_completion.handles.results = vint_object_find("results", h)
	Mp_completion.handles.sb_1 = vint_object_find("sb_1", h)
	Mp_completion.handles.sb_2 = vint_object_find("sb_2", h)
	Mp_completion.handles.sb_3 = vint_object_find("sb_3", h)
	
	--..scoreboard background
	Mp_completion.handles.scoreboard_bg = vint_object_find("scoreboard_bg")
	
	--..stash
	Mp_completion.handles.stash_h = vint_object_find("stash")
	
	--..player template
	Mp_completion.handles.player = vint_object_find("player")
	h = Mp_completion.handles.player
	Mp_completion.handles.badge = vint_object_find("badge", h)
	Mp_completion.handles.hr = vint_object_find("hr", h)
	Mp_completion.handles.speaker = vint_object_find("speaker", h)
		
	--..stripe
	Mp_completion.handles.stripe = vint_object_find("stripe", h)
	
	--..UNDER text
	Mp_completion.handles.under = vint_object_find("under")
	h = Mp_completion.handles.under
	Mp_completion.handles.name = vint_object_find("name", h)
	Mp_completion.handles.badge_name = vint_object_find("badge_name", h)
	Mp_completion.handles.amt_1 = vint_object_find("amt_1", h)
	Mp_completion.handles.amt_2 = vint_object_find("amt_2", h)
	Mp_completion.handles.amt_3 = vint_object_find("amt_3", h)
	Mp_completion.handles.amt_4 = vint_object_find("amt_4", h)
	vint_set_property(Mp_completion.handles.amt_4, "text_tag", " ")
	
	--..OVER text
	Mp_completion.handles.over = vint_object_find("over")
	h = Mp_completion.handles.over
	Mp_completion.handles.name_over = vint_object_find("name_over", h)
	Mp_completion.handles.badge_name_over = vint_object_find("badge_name_over", h)
	Mp_completion.handles.amt_1_over = vint_object_find("amt_1_over", h)
	Mp_completion.handles.amt_2_over = vint_object_find("amt_2_over", h)
	Mp_completion.handles.amt_3_over = vint_object_find("amt_3_over", h)
	Mp_completion.handles.amt_4_over = vint_object_find("amt_4_over", h)
	vint_set_property(Mp_completion.handles.amt_4_over, "text_tag", " ")
	
	Mp_completion.results = { data = { }, num_players = 0, cur_idx = 0 }
	vint_set_property(Mp_completion.handles.player, "visible", false)
	vint_set_property(Mp_completion.handles.under, "visible", false)
	vint_set_property(Mp_completion.handles.over, "visible", false)

	for i = 0, MAX_MULTI_PLAYERS - 1 do   -- Max players: 12
		Mp_completion.results[i] = { }
		Mp_completion.results.data[i] = { enabled = false }
		
		Mp_completion.results[i].player 	= vint_object_clone(Mp_completion.handles.player)
		Mp_completion.results[i].badge 	= vint_object_find("badge", Mp_completion.results[i].player)
		Mp_completion.results[i].hr 		= vint_object_find("hr", Mp_completion.results[i].player)
		Mp_completion.results[i].speaker = vint_object_find("speaker", Mp_completion.results[i].player)
		Mp_completion.results[i].stripe 	= vint_object_find("stripe", Mp_completion.results[i].player)

		Mp_completion.results[i].under = { }
		Mp_completion.results[i].over = { }

		Mp_completion.results[i].under.grp_h = vint_object_find("under", Mp_completion.results[i].player)
		Mp_completion.results[i].over.grp_h = vint_object_find("over", Mp_completion.results[i].player)
		
		if i ~= 0 then
			local x, y = vint_get_property(Mp_completion.results[i - 1].player, "anchor")
			local w, h = element_get_actual_size(Mp_completion.results[i - 1].under.amt_1)
			
			vint_set_property(Mp_completion.results[i].player, "anchor", x, y + h + 12)		
			vint_set_property(Mp_completion.results[i].hr, "visible", true)
			
		end
		
		--Find and assign objects within highlight line
		Mp_completion.results[i].under.name = vint_object_find("name", Mp_completion.results[i].under.grp_h)
		Mp_completion.results[i].under.badge_name = vint_object_find("badge_name", Mp_completion.results[i].under.grp_h)
		Mp_completion.results[i].under.amt_1 = vint_object_find("amt_1", Mp_completion.results[i].under.grp_h)
		Mp_completion.results[i].under.amt_2 = vint_object_find("amt_2", Mp_completion.results[i].under.grp_h)
		Mp_completion.results[i].under.amt_3 = vint_object_find("amt_3", Mp_completion.results[i].under.grp_h)
		Mp_completion.results[i].under.amt_4 = vint_object_find("amt_4", Mp_completion.results[i].under.grp_h)
		
		--..OVER text
		Mp_completion.results[i].over.name = vint_object_find("name_over", Mp_completion.results[i].over.grp_h)
		Mp_completion.results[i].over.badge_name = vint_object_find("badge_name_over", Mp_completion.results[i].over.grp_h)
		Mp_completion.results[i].over.amt_1 = vint_object_find("amt_1_over", Mp_completion.results[i].over.grp_h)
		Mp_completion.results[i].over.amt_2 = vint_object_find("amt_2_over", Mp_completion.results[i].over.grp_h)
		Mp_completion.results[i].over.amt_3 = vint_object_find("amt_3_over", Mp_completion.results[i].over.grp_h)
		Mp_completion.results[i].over.amt_4 = vint_object_find("amt_4_over", Mp_completion.results[i].over.grp_h)
	end

	
	--#####################
	--ANIMATIONS
	--#####################
	Mp_completion.handles.awards_anim = vint_object_find("awards_anim")
	Mp_completion.handles.badges_anim = vint_object_find("badges_anim")
	Mp_completion.handles.black_1_anim = vint_object_find("black_1_anim")
	Mp_completion.handles.black_2_anim = vint_object_find("black_2_anim")
	Mp_completion.handles.page_1_fade_out = vint_object_find("page_1_fade_out")
	Mp_completion.handles.page_1_skip_2_fade_out = vint_object_find("page_1_skip_2_fade_out")
	Mp_completion.handles.page_2_fade_out = vint_object_find("page_2_fade_out")
	Mp_completion.handles.page_2_badges_fade_out = vint_object_find("page_2_badges_fade_out")
	Mp_completion.handles.page_3_anim = vint_object_find("page_3_anim")
	Mp_completion.handles.screen_shake = vint_object_find("screen_shake")
	Mp_completion.handles.team_blue_anim = vint_object_find("team_blue_anim")
	Mp_completion.handles.team_blue_slam_anim = vint_object_find("team_blue_slam_anim")
	Mp_completion.handles.team_red_anim = vint_object_find("team_red_anim")
	Mp_completion.handles.team_red_slam_anim = vint_object_find("team_red_slam_anim")
	Mp_completion.handles.tips_fade_in_anim = vint_object_find("tips_fade_in_anim")
	Mp_completion.handles.tips_fade_out_anim = vint_object_find("tips_fade_out_anim")
	Mp_completion.handles.top_grp_anim = vint_object_find("top_grp_anim")
	Mp_completion.handles.top_grp_fade_out_anim = vint_object_find("top_grp_fade_out_anim")
	Mp_completion.handles.unlocked_rewards_anim = vint_object_find("unlocked_rewards_anim")
	Mp_completion.handles.wall_anim_h = vint_object_find("wall_anim")
	Mp_completion.handles.tip_1_pulsate_h = vint_object_find("tip_1_pulsate")
	
	vint_set_property(Mp_completion.handles.awards_anim, "is_paused", true)
	vint_set_property(Mp_completion.handles.badges_anim, "is_paused", true)
	vint_set_property(Mp_completion.handles.black_1_anim, "is_paused", true)
	vint_set_property(Mp_completion.handles.black_2_anim, "is_paused", true)
	vint_set_property(Mp_completion.handles.page_1_fade_out, "is_paused", true)
	vint_set_property(Mp_completion.handles.page_1_skip_2_fade_out, "is_paused", true)
	vint_set_property(Mp_completion.handles.page_2_fade_out, "is_paused", true)
	vint_set_property(Mp_completion.handles.page_2_badges_fade_out, "is_paused", true)
	vint_set_property(Mp_completion.handles.page_3_anim, "is_paused", true)
	vint_set_property(Mp_completion.handles.team_blue_anim, "is_paused", true)
	vint_set_property(Mp_completion.handles.team_blue_slam_anim, "is_paused", true)
	vint_set_property(Mp_completion.handles.team_red_anim, "is_paused", true)
	vint_set_property(Mp_completion.handles.team_red_slam_anim, "is_paused", true)
	vint_set_property(Mp_completion.handles.screen_shake, "is_paused", true)
	vint_set_property(Mp_completion.handles.tips_fade_in_anim , "is_paused", true)
	vint_set_property(Mp_completion.handles.tips_fade_out_anim, "is_paused", true)
	vint_set_property(Mp_completion.handles.top_grp_anim , "is_paused", true)
	vint_set_property(Mp_completion.handles.top_grp_fade_out_anim, "is_paused", true)
	vint_set_property(Mp_completion.handles.unlocked_rewards_anim, "is_paused", true)
	vint_set_property(Mp_completion.handles.wall_anim , "is_paused", true)
	vint_set_property(Mp_completion.handles.tip_1_pulsate_h, "is_paused", true)
	
	--#####################
	--SCREEN SHAKE
	--#####################

	--SHAKERS WOOT WOOT
	--the top stuff
	--line 1
	tween_h = vint_object_find("top_1_pos", Mp_completion.handles.top_grp_anim)
	vint_set_property(tween_h, "end_event", "mp_completion_screen_shake")
	
	--line 2
	tween_h = vint_object_find("top_2_pos", Mp_completion.handles.top_grp_anim)
	vint_set_property(tween_h, "end_event", "mp_completion_screen_shake")
	
	--line 3
	tween_h = vint_object_find("top_3_pos", Mp_completion.handles.top_grp_anim)
	vint_set_property(tween_h, "end_event", "mp_completion_screen_shake")
		
	--page 1 stuff
	tween_h = vint_object_find("blue_score_scale", Mp_completion.handles.team_blue_anim)
	vint_set_property(tween_h, "end_event", "mp_completion_screen_shake")
	
	tween_h = vint_object_find("red_score_scale", Mp_completion.handles.team_red_anim)
	vint_set_property(tween_h, "end_event", "mp_completion_screen_shake")
	
	tween_h = vint_object_find("blue_score_scale", Mp_completion.handles.team_blue_slam_anim)
	vint_set_property(tween_h, "end_event", "mp_completion_screen_shake")
	
	tween_h = vint_object_find("red_score_scale", Mp_completion.handles.team_red_slam_anim)
	vint_set_property(tween_h, "end_event", "mp_completion_screen_shake")
		
	--unlock
	tween_h = vint_object_find("rewards_scale", Mp_completion.handles.unlocked_rewards_anim)
	vint_set_property(tween_h, "end_event", "mp_completion_screen_shake")
		
	--mp_completion_shut_off_all_layers()
	mp_completion_grab_input()
	
	-- Initialize the data
	mp_completion_initialize()

end

function mp_completion_cleanup()

	-- Get rid of the player info popup if possible
	local info_popup = vint_document_find("mp_player_info_popup")
	if info_popup ~= nil then
		vint_document_unload(info_popup)
	end

	if Mp_completion.general.winner == true then
		peg_unload("ui_c_wall_mp")
	else
		peg_unload("ui_c_wall_mp_red")
	end
end

-- End all function to close it
function mp_completion_exit()
	mp_completion_release_input()
	--fade out
	screen_fx_fadeout(0)
	-- Get rid of this screen
	vint_document_unload(vint_document_find("mp_completion"))
end

------------------
-- Input Handling
function mp_completion_grab_input()
	Mp_completion.input[0] = vint_subscribe_to_input_event(nil, "select", 			"mp_completion_process_input")
	Mp_completion.input[1] = vint_subscribe_to_input_event(nil, "back", 				"mp_completion_process_input")
	Mp_completion.input[2] = vint_subscribe_to_input_event(nil, "alt_select", 		"mp_completion_process_input")
	Mp_completion.input[3] = vint_subscribe_to_input_event(nil, "nav_up", 			"mp_completion_process_input")
	Mp_completion.input[4] = vint_subscribe_to_input_event(nil, "nav_down", 		"mp_completion_process_input")
	Mp_completion.input[5] = vint_subscribe_to_input_event(nil, "all_unassigned", "mp_completion_process_input")
end

function mp_completion_finish_quit(result, action)
	
	if action ~= DIALOG_ACTION_CLOSE then
		return
	end
	
	if result == 0 then
		mp_completion_quit_game()
		mp_completion_exit()
	end
end

function mp_completion_process_input(target, event, accel)

	if Mp_completion.input_block == true then
		return;
	end

	local show_screen = false
	
	if Mp_completion_is_animating == false then
		if event == "select" then
			-- Progress to next screen (for now?)
			if Mp_completion.screen_idx >= Mp_completion.num_screens - 1 then
				if mp_completion_is_party_host() == true then
					mp_completion_return_to_lobby()
					mp_completion_exit()
				else
					if mp_completion_host_left() and mp_completion_is_party_client() then
						dialog_box_message("MENU_TITLE_WARNING", "MP_DISCONNECT_HOST_LEFT")
					elseif mp_completion_is_party_client() == false then
						mp_completion_exit()
					end
					show_screen = false
				end
			else 
				Mp_completion.screen_idx = Mp_completion.screen_idx + 1
				show_screen = true
			end
		elseif event == "back" then
		-- B Button
			if Mp_completion.screen_idx >= Mp_completion.num_screens - 1 then
				-- Double check that they want to quit
				dialog_box_confirmation("PAUSE_MENU_QUIT_TITLE", "QUIT_GAME_TEXT_SHORT", "mp_completion_finish_quit")
			end
		elseif event == "alt_select" then
		-- X Button
			if Mp_completion.screen_idx == 2 then
				if get_is_syslink() == false then
					mp_popup_open(Mp_completion.results[Mp_completion.results.cur_idx].handle, 1)
				end
			end
		elseif event == "nav_up" then
			if Mp_completion.screen_idx == 2 then
				local old_idx = Mp_completion.results.cur_idx
				Mp_completion.results.cur_idx = Mp_completion.results.cur_idx  - 1
				
				if Mp_completion.results.cur_idx < 0 then
					Mp_completion.results.cur_idx = Mp_completion.results.num_players - 1
				end
				
				mp_completion_update_result_selection(old_idx)
			end
		elseif event == "nav_down" then
			if Mp_completion.screen_idx == 2 then
				local old_idx = Mp_completion.results.cur_idx
				Mp_completion.results.cur_idx = Mp_completion.results.cur_idx + 1
				
				if Mp_completion.results.cur_idx >= Mp_completion.results.num_players then
					Mp_completion.results.cur_idx = 0
				end

				mp_completion_update_result_selection(old_idx)
			end
		end
		
		if show_screen == true then
			if Mp_completion.screen_idx >= Mp_completion.num_screens then
				mp_completion_exit()
			else
				if Mp_completion_badges_again == true then
					Mp_completion_badges_done = false
					Mp_completion.screen_idx = 1
				end
				Mp_completion.screen_show_function[Mp_completion.screen_idx]()
			end
		end
		return
		
	end
	
	
	--set up the animation skipping
	if Mp_completion_is_animating == true then
		
		if event == "select" or event == "back" then	
			--set up var to kill threads
			mp_completion_anim_threads_kill()

			if Mp_completion.handles.screen == "general" then
				--do page 1 stuff
				mp_completion_do_team_scores()
				mp_completion_do_awards()
				
				--cancel any callbacks
				local tween_h = vint_object_find("team_red_ender", Mp_completion.handles.team_red_anim)
				vint_set_property(tween_h, "end_event", nil)

				local tween_h = vint_object_find("awards_ender", Mp_completion.handles.awards_anim)
				vint_set_property(tween_h, "end_event", nil)
				
				--play all animations at once, so we can skip to end
				--the top and blue score are already playing, no need to call again
				mp_completion_team_red_anim()
				mp_completion_awards_anim()
				
				--set the cash
				if Mp_completion.general.gametype == "Braveheart" then
					vint_set_property(Mp_completion.handles.blue_score, "text_tag", "$" .. format_cash(Mp_completion.general.player_score))
					vint_set_property(Mp_completion.handles.red_score, "text_tag", "$" .. format_cash(Mp_completion.general.other_score))
					
				elseif Mp_completion.general.gametype == "Team Gangsta Brawl" then
					vint_set_property(Mp_completion.handles.blue_score, "text_tag", format_cash(Mp_completion.general.player_score))
					vint_set_property(Mp_completion.handles.red_score, "text_tag", format_cash(Mp_completion.general.other_score))
					
				elseif Mp_completion.general.gametype == "Gangsta Brawl" then
					vint_set_property(Mp_completion.handles.blue_score, "text_tag", format_cash(Mp_completion.general.player_score))
					vint_set_property(Mp_completion.handles.blue_rank, "text_tag", Mp_completion.general.player_position)
					vint_set_property(Mp_completion.handles.red_score, "text_tag", format_cash(Mp_completion.general.other_score))
					vint_set_property(Mp_completion.handles.red_rank, "text_tag", Mp_completion.general.other_position)
				end
				
				mp_completion_move_page_1_tips()

			elseif Mp_completion.handles.screen == "badges" then
				local tween = vint_object_find("unlock_scale", Mp_completion.handles.unlocked_rewards_anim)
				vint_set_property(tween, "start_event", nil)

				local tween = vint_object_find("badges_alpha", Mp_completion.handles.badges_anim)
				vint_set_property(tween, "start_event", nil)
				
				mp_completion_unlock_fade_in(0)
				mp_completion_badges_anim(0)
				mp_completion_move_page_2_tips()
				mp_completion_do_badges()
			elseif Mp_completion.handles.screen == "badges" and Mp_completion.screen_idx > 1 then
				mp_completion_page_2_fade_out()				
			elseif Mp_completion.handles.screen == "results" then

			end
			
			mp_completion_tips_fade_in()
			
			show_screen = false
			Mp_completion_is_animating = false
			
			--give em some audio feedback, let em know they did something
			mp_completion_text_sound()
			
			--time fast forward
			Mp_completion_current_time = vint_get_time_index()
			local current_time = Mp_completion_current_time
			local future_time = current_time + MP_COMPLETION_SKIP_TIME
			vint_set_time_index(future_time)
		end
	end
end

function mp_completion_release_input()
	for idx, val in Mp_completion.input do
		vint_unsubscribe_to_input_event(val)
	end
	Mp_completion.input = { }
end

---------------------------
-- Retrieve necessary data
function mp_completion_initialize()
	Mp_completion.general = { }
	Mp_completion.awards = { num_awards = 0 }
	Mp_completion.badges = { num_badges = 0 }
	Mp_completion.screen_idx = 0
	
	vint_dataresponder_request("mp_completion_populate", "mp_completion_populate_general", 0, "mp_completion_general")
	vint_dataresponder_request("mp_completion_populate", "mp_completion_populate_awards", 0, "mp_completion_awards")
	vint_dataresponder_request("mp_completion_populate", "mp_completion_populate_badges", 0, "mp_completion_badges")
	
	Mp_completion.screen_show_function[Mp_completion.screen_idx]()
end

function mp_completion_load_wall()
	--Mp_completion.general.winner = true
	if Mp_completion.general.winner == true then
		peg_load("ui_c_wall_mp")
		vint_set_property(Mp_completion.handles.wall_h, "image", "ui_ct_wall_mp.tga")
	else
		peg_load("ui_c_wall_mp_red")
		vint_set_property(Mp_completion.handles.wall_h, "image", "ui_ct_wall_mp_red.tga")
	end

end


function mp_completion_populate_general(winner, opponents_left, player_score, other_score, gametype, map, player_name, position, other_name, cash_awarded)
	Mp_completion.general.gametype = gametype
	Mp_completion.general.map = map
	Mp_completion.general.winner = winner					--	bool for if the player won
	Mp_completion.general.opponents_left = opponents_left
	
	if cash_awarded == 0 then
		vint_set_property(Mp_completion.handles.stash_h, "visible", false)
	else
		cash_awarded = "$" .. format_cash(cash_awarded)
		cash_awarded = {[0] = cash_awarded}
		cash_awarded = vint_insert_values_in_string("MULTI_CASH_AWARD", cash_awarded)
		vint_set_property(Mp_completion.handles.stash_h, "text_tag", cash_awarded)
	end
	
	if gametype == "Gangsta Brawl" then
		vint_set_property(Mp_completion.handles.headings_gb_h, "visible", true)
	
		Mp_completion.general.player_position = Mp_completion_position_tag[position] --Mp_completion_rank_badge_tag[other_score]  --player's rank
		Mp_completion.general.player_score = player_score --kills
		Mp_completion.general.player_name = player_name

		if winner == true then -- If you won this is the second place
			Mp_completion.general.other_position = Mp_completion_position_tag[1]
		else	--	If you didn't win, this is the first place
			Mp_completion.general.other_position = Mp_completion_position_tag[0]
		end
		
		Mp_completion.general.other_score = other_score
		Mp_completion.general.other_name = other_name
	else 
		if gametype == "Team Gangsta Brawl" then
			vint_set_property(Mp_completion.handles.headings_gb_h, "visible", true)
		else
			vint_set_property(Mp_completion.handles.headings_sa_h, "visible", true)
		end
	
		Mp_completion.general.player_score = player_score	-- player's team score
		Mp_completion.general.other_score = other_score		-- other team's score
	end
			
	--load the wall
	mp_completion_load_wall()
end


function mp_completion_populate_awards(player, award_text, award_description, team)	
	local num_awards = Mp_completion.awards.num_awards
	Mp_completion.awards[num_awards] = { player = player, text = award_text, description = award_description, team = team }		-- Both lines
	Mp_completion.awards.num_awards = num_awards + 1 
end

function mp_completion_populate_badges(badge_image, badge_description, rank_badge, rank)
	local num_badges = Mp_completion.badges.num_badges
	Mp_completion.badges[num_badges] = { image = badge_image } 	-- image and description for the badges to display
		
	if rank_badge == true then
		Mp_completion.badges[num_badges].description = Mp_completion_rank_badge_tag[rank]
	else
		Mp_completion.badges[num_badges].description = Mp_completion_badge_description_tags[badge_description]
	end
	
	Mp_completion.badges.num_badges = num_badges + 1
end

function mp_completion_populate_results(name, badge_description, badge_image, rank, team, handle, index, score, kills, deaths, suicides, disconnected)
	local num_players = Mp_completion.results.num_players
	local current = Mp_completion.results[num_players]
	
	current.sort_value = score
	current.team = team
	current.badge_image = badge_image
	
	if badge_description == 0 then
		current.badge_name = Mp_completion_rank_badge_tag[rank]
	else
		current.badge_name = Mp_completion_badge_description_tags[badge_description]
	end

	current.name = name
	
	current.score = format_cash(score)
	
	if Mp_completion.general.gametype == "Braveheart" then
		current.score = "$" .. current.score
	end
	
	current.kills = format_cash(kills)
	current.deaths = format_cash(deaths)
	
	if suicides ~= nil then
		current.suicides = format_cash(suicides)
	end

	current.enabled = true
	current.handle = handle
	current.index = index
	
	current.disconnected = disconnected
	
	Mp_completion.results.num_players = num_players + 1
end

function mp_completion_update_result_selection(old_idx)
	vint_set_property(Mp_completion.results[old_idx].over.grp_h, "visible", false)
	vint_set_property(Mp_completion.results[old_idx].stripe, "visible", false)
	vint_set_property(Mp_completion.results[Mp_completion.results.cur_idx].over.grp_h, "visible", true)
	vint_set_property(Mp_completion.results[Mp_completion.results.cur_idx].stripe, "visible", true)
end

function mp_completion_swap_result(item1, item2)
	local temp	

	temp = item2.sort_value
	item2.sort_value = item1.sort_value
	item1.sort_value = temp

	temp = item2.team
	item2.team = item1.team
	item1.team = temp

	temp = item2.badge_image
	item2.badge_image = item1.badge_image
	item1.badge_image = temp

	temp = item2.badge_name
	item2.badge_name = item1.badge_name
	item1.badge_name = temp

	temp = item2.name
	item2.name = item1.name
	item1.name = temp

	temp = item2.score
	item2.score = item1.score
	item1.score = temp

	temp = item2.kills
	item2.kills = item1.kills
	item1.kills = temp

	temp = item2.deaths
	item2.deaths = item1.deaths
	item1.deaths = temp

	temp = item2.suicides
	item2.suicides = item1.suicides
	item1.suicides = temp
	
	temp = item2.enabled
	item2.enabled = item1.enabled
	item1.enabled = temp
	
	temp = item2.handle
	item2.handle = item1.handle
	item1.handle = temp

	temp = item2.index
	item2.index = item1.index
	item1.index = temp
	
	temp = item2.disconnected
	item2.disconnected = item1.disconnected
	item1.disconnected = temp

end

function mp_completion_sort_results()
	local to_sort = Mp_completion.results
	
	local temp
	local flag = false
	
	if Mp_completion.general.gametype ~= "Braveheart" then
		while flag == false do
			flag = true
			for i = 0, Mp_completion.results.num_players - 2 do
				if to_sort[i].sort_value < to_sort[i + 1].sort_value or (to_sort[i].sort_value == to_sort[i + 1].sort_value and  to_sort[i].deaths > to_sort[i + 1].deaths) then
					mp_completion_swap_result(to_sort[i], to_sort[i + 1])
					flag = false
					i = Mp_completion.results.num_players
				end
			end
		end
	else
		local team
		for i = 0, 1 do
			if i == 0 then
				team = true
			else
				team = false
			end
		
			flag = false
			while flag == false do
				flag = true
				for j = 0, Mp_completion.results.num_players - 2 do
					if to_sort[j].team == team and to_sort[j + 1].team == team then
						if to_sort[j].sort_value < to_sort[j + 1].sort_value or (to_sort[j].sort_value == to_sort[j + 1].sort_value and  to_sort[j].deaths > to_sort[j + 1].deaths) then
							mp_completion_swap_result(to_sort[j], to_sort[j + 1])
							flag = false
							j = Mp_completion.results.num_players
						end
					end
				end
			end
		end
	end
	
	mp_completion_set_result_properties()
end

function mp_completion_set_result_properties()
	for i = 0, Mp_completion.results.num_players - 1 do
		local current = Mp_completion.results[i]
		vint_set_property(current.badge, "image", current.badge_image)
		
		vint_set_property(current.under.badge_name, "text_tag", current.badge_name)
		vint_set_property(current.over.badge_name, "text_tag", current.badge_name)
	
		vint_set_property(current.under.name, "text_tag", current.name)
		vint_set_property(current.over.name, "text_tag", current.name)	

		if Mp_completion.general.gametype ~= "Braveheart" then
			-- Show 4 columns (everything)
			vint_set_property(current.under.amt_1, "text_tag",  current.kills)
			vint_set_property(current.over.amt_1, "text_tag",  current.kills)

			vint_set_property(current.under.amt_2, "text_tag", current.deaths)
			vint_set_property(current.over.amt_2, "text_tag", current.deaths)
		
			vint_set_property(current.under.amt_3, "text_tag", current.suicides)
			vint_set_property(current.over.amt_3, "text_tag", current.suicides)

			vint_set_property(current.under.amt_4, "text_tag", current.score)
			vint_set_property(current.over.amt_4, "text_tag", current.score)

		else
			-- Strong Arm
			vint_set_property(current.under.amt_1, "text_tag",  current.score)
			vint_set_property(current.over.amt_1, "text_tag",  current.score)

			vint_set_property(current.under.amt_2, "text_tag", current.kills)
			vint_set_property(current.over.amt_2, "text_tag", current.kills)
		
			vint_set_property(current.under.amt_3, "text_tag", current.deaths)
			vint_set_property(current.over.amt_3, "text_tag", current.deaths)
		end

		if current.team == true then
			vint_set_property(current.under.name, "tint", .27, .51, .84)
			vint_set_property(current.speaker, "tint", .27, .51, .84)
		else
			vint_set_property(current.under.name, "tint", .71, 0, 0)
			vint_set_property(current.speaker, "tint", .71, 0, 0)
		end
		
		vint_set_property(Mp_completion.results[i].player, "visible", true)
		vint_set_property(Mp_completion.results[i].under.grp_h, "visible", true)
		
		if current.disconnected == true then
			vint_set_property(current.badge, "visible", false)
			local insert = { [0] = "MULTI_LOBBY_DISCONNECTED" }
			local text = vint_insert_values_in_string("({0})", insert)
			vint_set_property(current.under.badge_name, "text_tag", text)
			vint_set_property(current.over.badge_name, "text_tag", text)

			vint_set_property(Mp_completion.results[i].under.grp_h, "alpha", 0.7)
		else
			vint_set_property(Mp_completion.results[i].under.grp_h, "alpha", 1)
		end
	end
end

------------------------
-- Screen Management
function mp_completion_show_general()
	vint_set_property(Mp_completion.handles.tip_2, "visible", false)
	vint_set_property(Mp_completion.handles.btn_2, "visible", false)
	vint_set_property(Mp_completion.handles.tip_3, "visible", false)
	vint_set_property(Mp_completion.handles.btn_3, "visible", false)

	Mp_completion.handles.screen = "general"
	vint_set_property(Mp_completion.handles.page_1, "visible", true)
	
	Mp_completion_is_animating = true
	Mp_completion_force_skip = false
	
	
	--#################
	--BUTTON INPUTS HERE
	--#################
	
	if Mp_completion_is_animating == false then
		-- place button inputs here plskthxbye
	end

	--#################
	--top stuff and scores
	--#################

	mp_completion_do_team_scores()
	
	--#################
	--awards
	--#################

	mp_completion_do_awards()
	
	--#################
	--placement
	--#################	
	
	--Mp_completion.handles.award_1
	--Mp_completion.handles.team_blue
	--Mp_completion.handles.blue_score
	--Mp_completion.handles.tips
	
	--Mp_completion.awards.num_awards = 4
	
	--set the awards
	local awardsx, awardsy = vint_get_property(Mp_completion.handles.awards, "anchor")
	
	if Mp_completion.general.gametype == "Gangsta Brawl" then
		vint_set_property(Mp_completion.handles.awards, "anchor", 0, awardsy + 20)
	else
		vint_set_property(Mp_completion.handles.blue_rank, "visible", false)
		vint_set_property(Mp_completion.handles.red_rank, "visible", false)
	end
	
	--move the 'kills' text next to the number
	mp_completion_move_kill_text()
	
	if Mp_completion.general.gametype == "Braveheart" then
		vint_set_property(Mp_completion.handles.blue_kills, "visble", false)
		vint_set_property(Mp_completion.handles.red_kills, "visble", false)
	end
	
	--move the tips based on the heights and anchors of the awards
	mp_completion_move_page_1_tips()
	
	
	--#################
	--animations
	--#################
	mp_completion_fade_in_wall_and_top()
	
	if Mp_completion.general.gametype == "Braveheart" then
		mp_completion_team_blue_anim(2)
		local tween_h = vint_object_find("team_blue_ender", Mp_completion.handles.team_blue_anim)
		vint_set_property(tween_h, "end_event", "mp_completion_animate_blue_cash")
	elseif Mp_completion.general.gametype == "Team Gangsta Brawl" then
		mp_completion_team_blue_slam_anim(2)
		if Mp_completion.general.opponents_left == false then
			mp_completion_team_red_slam_anim(2.75)
			mp_completion_awards_anim(3.25)
		else
			mp_completion_awards_anim(2.75)
		end
		local tween_h = vint_object_find("awards_ender", Mp_completion.handles.awards_anim)
		vint_set_property(tween_h, "end_event", "mp_completion_tips_fade_in")
	elseif Mp_completion.general.gametype == "Gangsta Brawl" then
		mp_completion_team_blue_slam_anim(2)
		if Mp_completion.general.opponents_left == false then
			mp_completion_team_red_slam_anim(2.75)
			mp_completion_awards_anim(3.25)
		else
			mp_completion_awards_anim(2.75)
		end
		
		local tween_h = vint_object_find("awards_ender", Mp_completion.handles.awards_anim)
		vint_set_property(tween_h, "end_event", "mp_completion_tips_fade_in")
	end
	
	if Mp_completion.badges.num_badges == 0 then
		--skip the badges screen if i don't have any badges
		Mp_completion.screen_idx = Mp_completion.screen_idx + 1
	end
	
end

function mp_completion_move_kill_text()
	local rsx, rsy = vint_get_property(Mp_completion.handles.red_score, "anchor") --red score anchor
	local rsw, rsh = element_get_actual_size(Mp_completion.handles.red_score, "screen_size")	--red score size
	local bsx, bsy = vint_get_property(Mp_completion.handles.blue_score, "anchor") --blue score anchor
	local bsw, bsh = element_get_actual_size(Mp_completion.handles.blue_score, "screen_size") --blue score size
	local gap = 14
	
	local bkw, bkh = vint_get_property(Mp_completion.handles.blue_kills, "screen_size")
	
--	debug_print("vint", "bsx,bsy : " .. var_to_string(bsx) .. ", " .. var_to_string(bsy) .. "\n")
--	debug_print("vint", "bsw,bsh : " .. var_to_string(bkw) .. ", " .. var_to_string(bkh) .. "\n")
	
	--set blue kills position
	vint_set_property(Mp_completion.handles.blue_kills, "anchor", bsx + bsw + gap, bsy)
	
	--set red kils position
	vint_set_property(Mp_completion.handles.red_kills, "anchor", rsx + rsw + gap, rsy)
	
end



function mp_completion_move_page_1_tips()

	--figure out all the positions and sizes
	local page1y = 246
	local page1h = 294
	local awards_y = 116
	local basic_gap = 30
	local awards_gap = 58
	local btn_h = 17
	local tipsx, tipsy = vint_get_property(Mp_completion.handles.tips, "anchor")
	
	--here's the equation of the X anchor to use for the tips placement
	local contentheight = page1y + awards_y + basic_gap + btn_h + (awards_gap * Mp_completion.awards.num_awards)
	--debug_print("vint", "y: " .. var_to_string(page1y) .. ", h: " .. var_to_string(page1h)	.. "\n")
	vint_set_property(Mp_completion.handles.tips, "anchor", tipsx, contentheight)

end

function mp_completion_do_team_scores()
	--enter the gametype
	local game_type_display_name = 0
	
	if Mp_completion.general.gametype == "Braveheart" then
		game_type_display_name = "MULTI_MODE_STRONGARM_ALL_CAPS"
	elseif Mp_completion.general.gametype == "Team Gangsta Brawl" then
		game_type_display_name = "MULTI_MODE_ALL_CAPS_14"
	else
		game_type_display_name = "MULTI_MODE_ALL_CAPS_13"
	end
	
--local insertion_text2 	= { [0] = mission_name }
--local subtitle = vint_insert_values_in_string("COMPLETION_MISSION_COMPLETE", insertion_text2 )
	
	vint_set_property(Mp_completion.handles.top_1, "text_tag", game_type_display_name) --fake data
	
	--enter the map name
	vint_set_property(Mp_completion.handles.top_2, "text_tag", Mp_completion.general.map) --fake data

	--who won?
	if Mp_completion.general.gametype == "Braveheart" or Mp_completion.general.gametype == "Team Gangsta Brawl" then
		--STRONG ARM, or TEAM GANGSTA BRAWL
		if Mp_completion.general.winner == true then
			local insertion_text2 	= { [0] = "MULTI_MATCHMAKING_YOUR_TEAM" }
			local subtitle = vint_insert_values_in_string("MP_GAME_WON_ICASE", insertion_text2 )
			vint_set_property(Mp_completion.handles.top_3, "text_tag", subtitle)
			vint_set_property(Mp_completion.handles.top_3, "tint", MP_COMPLETION_BLUE.r, MP_COMPLETION_BLUE.g, MP_COMPLETION_BLUE.b)
		else
			local insertion_text2 	= { [0] = "MULTI_MATCHMAKING_OPPONENTS" }
			local subtitle = vint_insert_values_in_string("MP_GAME_WON_ICASE", insertion_text2 )
			vint_set_property(Mp_completion.handles.top_3, "text_tag", subtitle)
			vint_set_property(Mp_completion.handles.top_3, "tint", MP_COMPLETION_RED.r, MP_COMPLETION_RED.g, MP_COMPLETION_RED.b)
		end
	else
		--FREE FOR ALL
		if Mp_completion.general.winner == true then
			local insertion_text2 	= { [0] = "GENERAL_YOU" }
			local subtitle = vint_insert_values_in_string("MP_GAME_WON_ICASE", insertion_text2 )
			vint_set_property(Mp_completion.handles.top_3, "text_tag", subtitle)
			vint_set_property(Mp_completion.handles.top_3, "tint", MP_COMPLETION_BLUE.r, MP_COMPLETION_BLUE.g, MP_COMPLETION_BLUE.b)
		else
			local insertion_text2 	= { [0] = "GENERAL_YOU" }
			local subtitle = vint_insert_values_in_string("MP_GAME_LOST_ICASE", insertion_text2 )
			vint_set_property(Mp_completion.handles.top_3, "text_tag", subtitle)
			vint_set_property(Mp_completion.handles.top_3, "tint", MP_COMPLETION_RED.r, MP_COMPLETION_RED.g, MP_COMPLETION_RED.b)
		end

	end
	
	--set up team score name tags
	if Mp_completion.general.gametype == "Braveheart" then	
		--format blue team score
		vint_set_property(Mp_completion.handles.blue_name, "text_tag", "MULTI_MATCHMAKING_YOUR_TEAM")
		vint_set_property(Mp_completion.handles.blue_score, "text_tag", "$0")

		--format red team score
		vint_set_property(Mp_completion.handles.red_name, "text_tag", "MULTI_MATCHMAKING_OPPONENTS")
		vint_set_property(Mp_completion.handles.red_score, "text_tag", "$0")
		
	elseif Mp_completion.general.gametype == "Team Gangsta Brawl" then		
		vint_set_property(Mp_completion.handles.blue_name, "text_tag", "MULTI_MATCHMAKING_YOUR_TEAM")
		vint_set_property(Mp_completion.handles.blue_score, "text_tag", format_cash(Mp_completion.general.player_score))
		vint_set_property(Mp_completion.handles.red_name, "text_tag", "MULTI_MATCHMAKING_OPPONENTS")
		vint_set_property(Mp_completion.handles.red_score, "text_tag", format_cash(Mp_completion.general.other_score))
		
	elseif Mp_completion.general.gametype == "Gangsta Brawl" then	
		vint_set_property(Mp_completion.handles.blue_name, "text_tag", Mp_completion.general.player_name)
		vint_set_property(Mp_completion.handles.blue_score, "text_tag", format_cash(Mp_completion.general.player_score))
		vint_set_property(Mp_completion.handles.blue_rank, "text_tag", Mp_completion.general.player_position)
		
		vint_set_property(Mp_completion.handles.red_name, "text_tag", Mp_completion.general.other_name)
		vint_set_property(Mp_completion.handles.red_score, "text_tag", format_cash(Mp_completion.general.other_score))
		vint_set_property(Mp_completion.handles.red_rank, "text_tag", Mp_completion.general.other_position)
	--	vint_set_property(Mp_completion.handles.team_red, "visible", true)
	end
end

function mp_completion_do_awards()
	local awards = Mp_completion.awards
	for i = 0, awards.num_awards - 1 do
		vint_set_property(Mp_completion.handles.a[i].grp, "visible", true)
		
		--enter the text
		vint_set_property(Mp_completion.handles.a[i].handle_1, "text_tag", awards[i].player)
		vint_set_property(Mp_completion.handles.a[i].handle_2, "text_tag", awards[i].text)
		vint_set_property(Mp_completion.handles.a[i].handle_3, "text_tag", awards[i].description)
		
		--color the player name
		if awards[i].team == true then
			vint_set_property(Mp_completion.handles.a[i].handle_1, "tint", MP_COMPLETION_BLUE.r, MP_COMPLETION_BLUE.g, MP_COMPLETION_BLUE.b)
		else
			vint_set_property(Mp_completion.handles.a[i].handle_1, "tint", MP_COMPLETION_RED.r, MP_COMPLETION_RED.g, MP_COMPLETION_RED.b)
		end
		
		--adjust the text position
		local x, y =  element_get_actual_size(Mp_completion.handles.a[i].handle_1)
		vint_set_property(Mp_completion.handles.a[i].handle_2, "anchor", x + 7, 0)
	end
end

function mp_completion_animate_blue_cash()
   thread_new("mp_completion_animate_blue_cash_thread")
end

function mp_completion_animate_blue_cash_thread()
	
	--Are we going to skip this?
	if Mp_completion_force_skip == true then
		Mp_completion_force_skip = false
		return
	end
		
	--init stuff
	local start_cash = 0
	local cash_this_frame = -1
	local is_complete = false

	--get the variables from the global
	local cash = Mp_completion.general.player_score
	
	local amt_min = 0
	local amt_max = 0
	
	--figure out whose score is higher
	if Mp_completion.general.player_score > Mp_completion.general.other_score then
		amt_max = Mp_completion.general.player_score
	else
		amt_max = Mp_completion.general.other_score
	end
	
	local time_min = 300
	local time_max = 2999
	local init_time = floor(vint_get_time_index() * 1000)
	local cur_time = init_time
	local time_to_count = floor(time_max * (cash / amt_max))
	
	if time_to_count > time_max then
		time_to_count = time_max
	end

	--init sound IDs
	local activity_cash_count = 0
	local activity_cash_hit = 0
	
	if cash > 0 then
		activity_cash_count = audio_play(Mp_completion_audio.cash_count)
	end
	
	while is_complete == false do
		local cur_time = floor(vint_get_time_index() * 1000) - init_time
		
		--Are we going to skip this?
		if Mp_completion_force_skip == true then
			Mp_completion_force_skip = false
			audio_fade_out(activity_cash_count, 50)
			audio_fade_out(activity_cash_hit, 50)
			return
		end
		
		cash_this_frame = cash * (cur_time / time_to_count)
		vint_set_property(Mp_completion.handles.blue_score, "text_tag", "$" .. format_cash(cash_this_frame))
		
		if cur_time >= time_to_count then
			is_complete = true
			audio_fade_out(activity_cash_count, 50)
			activity_cash_hit = audio_play(Mp_completion_audio.cash_hit)
			vint_set_property(Mp_completion.handles.blue_score, "text_tag", "$" .. format_cash(cash))
					
			if Mp_completion.general.opponents_left == false then
				mp_completion_team_red_anim()
				local tween_h = vint_object_find("team_red_ender", Mp_completion.handles.team_red_anim)
				vint_set_property(tween_h, "end_event", "mp_completion_animate_red_cash")
			else
				mp_completion_awards_anim()
				local tween_h = vint_object_find("awards_ender", Mp_completion.handles.awards_anim)
				vint_set_property(tween_h, "end_event", "mp_completion_tips_fade_in")
			
				mp_completion_tips_fade_in_offset(.5)
			end
		end
		thread_yield()
	end		
end

function mp_completion_animate_red_cash()
   thread_new("mp_completion_animate_red_cash_thread")
end

function mp_completion_animate_red_cash_thread()
	
	--Are we going to skip this?
	if Mp_completion_force_skip == true then
		Mp_completion_force_skip = false
		return
	end
		
	--init stuff
	local start_cash = 0
	local cash_this_frame = -1
	local is_complete = false

	--get the variables from the global
	local cash = Mp_completion.general.other_score
	
	local amt_min = 0
	local amt_max = 0
	
	--figure out whose score is higher
	if Mp_completion.general.player_score > Mp_completion.general.other_score then
		amt_max = Mp_completion.general.player_score
	else
		amt_max = Mp_completion.general.other_score
	end
	
	local time_min = 300
	local time_max = 2999
	local init_time = floor(vint_get_time_index() * 1000)
	local cur_time = init_time
	local time_to_count = floor(time_max * (cash / amt_max))
	
	if time_to_count > time_max then
		time_to_count = time_max
	end

	--init sound IDs
	local activity_cash_count = 0
	local activity_cash_hit = 0
	
	if cash > 0 then
		activity_cash_count = audio_play(Mp_completion_audio.cash_count)
	end
	
	while is_complete == false do
		local cur_time = floor(vint_get_time_index() * 1000) - init_time
		
		--Are we going to skip this?
		if Mp_completion_force_skip == true then
			Mp_completion_force_skip = false
			audio_fade_out(activity_cash_count, 50)
			audio_fade_out(activity_cash_hit, 50)
			return
		end
		
		cash_this_frame = cash * (cur_time / time_to_count)
		vint_set_property(Mp_completion.handles.red_score, "text_tag", "$" .. format_cash(cash_this_frame))
		
		if  cur_time >= time_to_count then
			vint_set_property(Mp_completion.handles.red_score, "text_tag", "$" .. format_cash(cash))
			is_complete = true
			
			mp_completion_awards_anim()
			local tween_h = vint_object_find("awards_ender", Mp_completion.handles.awards_anim)
			vint_set_property(tween_h, "end_event", "mp_completion_tips_fade_in")
		end
		thread_yield()
	end	
end


function mp_completion_show_badges()

	vint_set_property(Mp_completion.handles.tip_2, "visible", false)
	vint_set_property(Mp_completion.handles.btn_2, "visible", false)
	vint_set_property(Mp_completion.handles.tip_3, "visible", false)
	vint_set_property(Mp_completion.handles.btn_3, "visible", false)
	
	Mp_completion.handles.screen = "badges"
	
	vint_set_property(Mp_completion.handles.page_2, "visible", true)
	
	Mp_completion_is_animating = true
	Mp_completion_force_skip = false

	if Mp_completion.start_idx == 0 then
	--fade out page 1
		mp_completion_page_1_fade_out()
	elseif Mp_completion_badges_again == true then
		mp_completion_turn_off_badges()
	end

	Mp_completion.input_block = true
	
	--do the badges
	if Mp_completion.badges.num_badges > 9 and Mp_completion_badges_again == false then
		Mp_completion.end_idx = 9
	else
		Mp_completion.end_idx = Mp_completion.badges.num_badges - 1
	end
	
	local start_idx = Mp_completion.start_idx
	local end_idx = Mp_completion.end_idx
	
	--fade in the unlocks
	mp_completion_unlock_fade_in(.25)
	mp_completion_badges_anim(.75)
	mp_completion_tips_fade_in_offset(1.25)
	
	
	local tween = vint_object_find("unlock_alpha", Mp_completion.handles.unlocked_rewards_anim)
	vint_set_property(tween, "start_event", "mp_completion_input_unblock")
	
	local tween = vint_object_find("badges_alpha", Mp_completion.handles.badges_anim)
	vint_set_property(tween, "start_event", "mp_completion_do_badges")
	
	local tween = vint_object_find("unlock_scale", Mp_completion.handles.unlocked_rewards_anim)
	vint_set_property(tween, "start_event", "mp_completion_move_page_2_tips")
	

	
end

function mp_completion_input_unblock()
	Mp_completion.input_block = false
end

function mp_completion_do_badges(start_idx, end_idx)
	if Mp_completion_badges_done == false then

		local badges = Mp_completion.badges
		local start_idx = Mp_completion.start_idx
		local end_idx = Mp_completion.end_idx
		
		for i = start_idx, end_idx do
			vint_set_property(Mp_completion.handles.bdg[i].handle_1, "visible", true)
			vint_set_property(Mp_completion.handles.bdg[i].handle_2, "visible", true)
			
			--enter the image and text
			vint_set_property(Mp_completion.handles.bdg[i].handle_1, "image", badges[i].image)
			vint_set_property(Mp_completion.handles.bdg[i].handle_2, "text_tag", badges[i].description)
		end
		
		Mp_completion_badges_done = true

		if Mp_completion_badges_again == true then
			--Mp_completion_badges_again = false
			Mp_completion.badges.num_badges = 1
		end
		
		if Mp_completion.badges.num_badges > 10 then
			Mp_completion.start_idx = 10
			Mp_completion.end_idx = Mp_completion.badges.num_badges - 1
			Mp_completion_badges_again = true
		else
			Mp_completion_badges_again = false
		end
	
	end

end

function mp_completion_move_page_2_tips()
	--figure out all the positions and sizes
	local page2x, page2y = vint_get_property(Mp_completion.handles.page_2, "anchor")
	local page2w, page2h = vint_get_property(Mp_completion.handles.page_2, "screen_size")
	local tipsx, tipsy = vint_get_property(Mp_completion.handles.tips, "anchor")
	local badge_places = Mp_completion.end_idx + 1
	
	if badge_places < 6 then
		--do nothing :D
	elseif badge_places > 10 and badge_places < 16 then
		badge_places = badge_places - 10
	else
		badge_places = 5
	end
	
	--here's the equation of the X anchor to use for the tips placement
	local contentheight = 597 - ((5 - badge_places) * 60)
	
	vint_set_property(Mp_completion.handles.tips, "anchor", tipsx, contentheight)
end

function mp_completion_show_voip(di_h, event)
	
	local player_index, voip_state = vint_dataitem_get(di_h)
	
	local result = nil
	
	for i = 0, Mp_completion.results.num_players - 1 do
		if Mp_completion.results[i].index == player_index then
			result = Mp_completion.results[i]
			i = Mp_completion.results.num_players
		end
	end
	
	-- How'd this happen?
	if result == nil then
		return
	end
	
	if voip_state == 0 then
		vint_set_property(result.speaker, "visible", false)
	elseif voip_state == 1 then
		vint_set_property(result.speaker, "visible", true)
		vint_set_property(result.speaker, "image", "mp_speaker_off")
	elseif voip_state == 2 then
		vint_set_property(result.speaker, "visible", true)
		vint_set_property(result.speaker, "image", "mp_speaker_on")
	end
end

function mp_completion_show_results()

	Mp_completion.handles.screen = "results"
	vint_dataresponder_request("mp_completion_populate", "mp_completion_populate_results", 0, "mp_completion_results")
	vint_datagroup_add_subscription("mp_completion_voice", "insert", "mp_completion_show_voip")
	vint_datagroup_add_subscription("mp_completion_voice", "update", "mp_completion_show_voip")
	vint_datagroup_add_subscription("mp_completion_voice", "remove", "mp_completion_show_voip")
	
	mp_completion_sort_results()
	
	--local results_w, results_h = element_get_actual_size(Mp_completion.handles.page_3)
	vint_set_property(Mp_completion.handles.page_3, "visible", true)
	
	local num_players = Mp_completion.results.num_players
	local new_y = 320 - (22 * num_players)
	vint_set_property(Mp_completion.handles.page_3, "anchor", 184, new_y - 30)
	
	Mp_completion.input_block = true
	
	mp_completion_update_result_selection(0)
	Mp_completion_is_animating = true
	Mp_completion_force_skip = false

	--fade out page 1 or 2?
	if Mp_completion.badges.num_badges == 0 then
		mp_completion_page_1_skip_2_fade_out()
	else
		mp_completion_page_2_fade_out()
	end
		
	mp_completion_page_3_anim(.25)
	mp_completion_tips_fade_in_offset(.5)
	
	--move the tips when the screen fades in
	local tween_h = vint_object_find("page_3_alpha", Mp_completion.handles.page_3_anim)
	vint_set_property(tween_h, "end_event", "mp_completion_tips_horizontal")
	
	local tween_h = vint_object_find("page_3_alpha", Mp_completion.handles.page_3_anim)
	vint_set_property(tween_h, "start_event", "mp_completion_input_unblock")
	
end

--------------------
-- Button Placement

function mp_completion_tips_horizontal()
	
	--###############################################################
	--this is used to format the buttons for the results screen
	--###############################################################

	vint_set_property(Mp_completion.handles.tip_2, "visible", true)
	vint_set_property(Mp_completion.handles.btn_2, "visible", true)
	vint_set_property(Mp_completion.handles.tip_3, "visible", true)
	vint_set_property(Mp_completion.handles.btn_3, "visible", true)
	
	Mp_copmletion_isfinal = true
	
	local bx, by = 19, 17
	local gap = 36
	local text_y_offset = -1
	local is_client = mp_completion_is_party_client()
	
	vint_set_property(Mp_completion.handles.tip_1, "anchor", bx, 0 + text_y_offset)

	if is_client then
		-- Hide the Continue button
		vint_set_property(Mp_completion.handles.btn_1, "visible", false)
		
		-- Move the "waiting for host" text over to the left edge, change the color, and make it pulsate
		local b1a, b1b = vint_get_property(Mp_completion.handles.btn_1, "anchor")
		vint_set_property(Mp_completion.handles.tip_1, "anchor", b1a, text_y_offset)
		lua_play_anim(Mp_completion.handles.tip_1_pulsate_h)
		vint_set_property(Mp_completion.handles.tip_1, "text_tag", "MP_COMPLETION_WAITING")
	end
	
	if get_is_syslink() then
		-- Hide the middle tip
		vint_set_property(Mp_completion.handles.btn_2, "visible", false)
		vint_set_property(Mp_completion.handles.tip_2, "visible", false)
	
		-- Display the two other tips one line highter
		local t1a, t1b = vint_get_property(Mp_completion.handles.tip_1, "anchor")
		local t1x, t1y = element_get_actual_size(Mp_completion.handles.tip_1)
		vint_set_property(Mp_completion.handles.btn_3, "anchor", t1a + t1x + gap, 0)
		
		local b2a, b2b = vint_get_property(Mp_completion.handles.btn_3, "anchor")
		vint_set_property(Mp_completion.handles.tip_3, "anchor", bx + b2a, text_y_offset)
	else
		-- Show all 3 tips
		local t1a, t1b = vint_get_property(Mp_completion.handles.tip_1, "anchor")
		local t1x, t1y = element_get_actual_size(Mp_completion.handles.tip_1)
		vint_set_property(Mp_completion.handles.btn_2, "anchor", t1a + t1x + gap, -2 )
		
		local b2a, b2b = vint_get_property(Mp_completion.handles.btn_2, "anchor")
		vint_set_property(Mp_completion.handles.tip_2, "anchor", 43 + b2a, text_y_offset)
		
		local t2x, t2y = element_get_actual_size(Mp_completion.handles.tip_2)
		local t2a, t2b = vint_get_property(Mp_completion.handles.tip_2, "anchor")
		vint_set_property(Mp_completion.handles.btn_3, "anchor", t2a + t2x + gap, -2 )	

		local b3a, b3b = vint_get_property(Mp_completion.handles.btn_3, "anchor")
		vint_set_property(Mp_completion.handles.tip_3, "anchor", b3a + bx, text_y_offset)
	end
	
	local p3x, p3y = vint_get_property(Mp_completion.handles.page_3, "anchor")
	vint_set_property(Mp_completion.handles.tips, "anchor", p3x + 60, 388 + (22 * Mp_completion.results.num_players))
end




---------------
-- Animations
function mp_completion_shut_off_all_layers()
	--turn off all layers

	vint_set_property(Mp_completion.handles.tips, "visible", false)
	vint_set_property(Mp_completion.handles.unlock, "visible", false)	
	vint_set_property(Mp_completion.handles.page_1, "visible", false)	
	vint_set_property(Mp_completion.handles.page_2, "visible", false)	
	vint_set_property(Mp_completion.handles.page_3, "visible", false)	

	--[[
	if Mp_completion.exiting == true then
		vint_set_property(Mp_completion.handles.top_grp, "visible", false)
		vint_set_property(Mp_completion.handles.black_1, "visible", true)	
		vint_set_property(Mp_completion.handles.wall, "visible", false)	
		completion_finish()
	end
	]]
end

function mp_completion_screen_shake()
	if Mp_completion_force_skip == false then
		lua_play_anim(Mp_completion.handles.screen_shake, 0)
	end
end

function mp_completion_fade_in_wall_and_top()

	vint_set_property(Mp_completion.handles.top_grp, "visible", true)
	vint_set_property(Mp_completion.handles.wall, "visible", true)	
	--set up the sound stuff
	local tween_h = vint_object_find("top_1_pos", Mp_completion.handles.top_grp_anim)
	
	if Mp_completion_force_skip == false then
		if Mp_completion.general.winner == true then
			--play all top 3 sound
			vint_set_property(tween_h, "start_event", "mp_completion_top_3_sound")
			
		else
			--play the fail sound
			vint_set_property(tween_h, "start_event", "mp_completion_top_fail_sound")
		end
		
		--do the animations
		lua_play_anim(Mp_completion.handles.black_1_anim, 0)
		lua_play_anim(Mp_completion.handles.wall_anim, 0.33)
		lua_play_anim(Mp_completion.handles.top_grp_anim, 1)
	end
end

function mp_completion_fade_out_all()
	lua_play_anim(Mp_completion.handles.black_2_anim, 0)
end

function mp_completion_team_blue_anim(offset)
	lua_play_anim(Mp_completion.handles.team_blue_anim, offset)
	if Mp_completion_force_skip == false then
		local tween_h = vint_object_find("blue_name_alpha", Mp_completion.handles.team_blue_anim)
		vint_set_property(tween_h, "start_event", "mp_completion_respect_sound")
	end
end

function mp_completion_team_blue_slam_anim(offset)
	lua_play_anim(Mp_completion.handles.team_blue_slam_anim, offset)
	if Mp_completion_force_skip == false then
		local tween_h = vint_object_find("blue_name_alpha", Mp_completion.handles.team_blue_slam_anim)
		vint_set_property(tween_h, "start_event", "mp_completion_top_2_sound")
	end
end

function mp_completion_team_red_anim()
	lua_play_anim(Mp_completion.handles.team_red_anim, .5)
	if Mp_completion_force_skip == false then
		local tween_h = vint_object_find("red_name_alpha", Mp_completion.handles.team_red_anim)
		vint_set_property(tween_h, "start_event", "mp_completion_respect_sound")
	end
end

function mp_completion_team_red_slam_anim(offset)
	lua_play_anim(Mp_completion.handles.team_red_slam_anim, offset)
	if Mp_completion_force_skip == false then
		local tween_h = vint_object_find("red_name_alpha", Mp_completion.handles.team_red_slam_anim)
		vint_set_property(tween_h, "start_event", "mp_completion_top_2_sound")
	end
end


function mp_completion_awards_anim(offset)
	if offset == nil then
		offset = 0
	end
	lua_play_anim(Mp_completion.handles.awards_anim, offset)
	local tween_h = vint_object_find("award_1_alpha", Mp_completion.handles.awards_anim)
	if Mp_completion_force_skip == false then
		vint_set_property(tween_h, "start_event", "mp_completion_text_sound")
	end
	--vint_set_property(tween_h, "end_event", "mp_completion_anim_false")
end

function mp_completion_page_1_fade_out()
	lua_play_anim(Mp_completion.handles.page_1_fade_out, 0)
end

function mp_completion_page_1_skip_2_fade_out()
	lua_play_anim(Mp_completion.handles.page_1_skip_2_fade_out, 0)
end

function mp_completion_unlock_fade_in(offset)
	vint_set_property(Mp_completion.handles.unlock, "visible", true)
	vint_set_property(Mp_completion.handles.t_unlocked, "visible", true)	
	vint_set_property(Mp_completion.handles.t_rewards, "visible", true)	

	lua_play_anim(Mp_completion.handles.unlocked_rewards_anim, offset)
	local tween_h = vint_object_find("unlock_offset", Mp_completion.handles.unlocked_rewards_anim)
	vint_set_property(tween_h, "start_event", "mp_completion_top_2_sound")
	
	if Mp_completion_force_skip == false then
	--	vint_set_property(tween_h, "start_event", "mp_completion_top_2_sound")
	end
end

function mp_completion_badges_anim(offset)
	lua_play_anim(Mp_completion.handles.badges_anim, offset)
	local tween_h = vint_object_find("badges_alpha", Mp_completion.handles.badges_anim)
	if Mp_completion_force_skip == false then
		vint_set_property(tween_h, "start_event", "mp_completion_image_sound")
	end
	--vint_set_property(tween_h, "end_event", "mp_completion_anim_false")
end

function mp_completion_page_2_fade_out()
	lua_play_anim(Mp_completion.handles.page_2_fade_out, 0)
end

function mp_completion_page_2_badges_fade_out()
	lua_play_anim(Mp_completion.handles.page_2_badges_fade_out, 0)
	local tween_h = vint_object_find("page_2_alpha_out", Mp_completion.handles.page_2_badges_fade_out)
	vint_set_property(tween_h, "end_event", "mp_completion_turn_off_badges")
	
end

function mp_completion_turn_off_badges()
	vint_set_property(Mp_completion.handles.t_unlocked, "alpha", 0)
	vint_set_property(Mp_completion.handles.t_rewards, "alpha", 0)
	vint_set_property(Mp_completion.handles.tips, "alpha", 0)

	--1
	vint_set_property(Mp_completion.handles.bdg[0].handle_1, "visible", false)
	vint_set_property(Mp_completion.handles.bdg[0].handle_2, "visible", false)
	--2
	vint_set_property(Mp_completion.handles.bdg[1].handle_1, "visible", false)
	vint_set_property(Mp_completion.handles.bdg[1].handle_2, "visible", false)
	--3
	vint_set_property(Mp_completion.handles.bdg[2].handle_1, "visible", false)
	vint_set_property(Mp_completion.handles.bdg[2].handle_2, "visible", false)
	--4
	vint_set_property(Mp_completion.handles.bdg[3].handle_1, "visible", false)
	vint_set_property(Mp_completion.handles.bdg[3].handle_2, "visible", false)
	--5
	vint_set_property(Mp_completion.handles.bdg[4].handle_1, "visible", false)
	vint_set_property(Mp_completion.handles.bdg[4].handle_2, "visible", false)
	--6
	vint_set_property(Mp_completion.handles.bdg[5].handle_1, "visible", false)
	vint_set_property(Mp_completion.handles.bdg[5].handle_2, "visible", false)
	--7
	vint_set_property(Mp_completion.handles.bdg[6].handle_1, "visible", false)
	vint_set_property(Mp_completion.handles.bdg[6].handle_2, "visible", false)
	--8
	vint_set_property(Mp_completion.handles.bdg[7].handle_1, "visible", false)
	vint_set_property(Mp_completion.handles.bdg[7].handle_2, "visible", false)
	--9
	vint_set_property(Mp_completion.handles.bdg[8].handle_1, "visible", false)
	vint_set_property(Mp_completion.handles.bdg[8].handle_2, "visible", false)
	--10
	vint_set_property(Mp_completion.handles.bdg[9].handle_1, "visible", false)
	vint_set_property(Mp_completion.handles.bdg[9].handle_2, "visible", false)	
end

function mp_completion_page_3_anim(offset)
	vint_set_property(Mp_completion.handles.page_3, "visible", true)
	
	lua_play_anim(Mp_completion.handles.page_3_anim, offset)
	
	local tween_h = vint_object_find("page_3_ender", Mp_completion.handles.page_3_anim)
	if Mp_completion_force_skip == false then
		vint_set_property(tween_h, "start_event", "mp_completion_text_sound")
	end
	vint_set_property(tween_h, "end_event", "mp_completion_anim_false")
end

function mp_completion_tips_fade_in()
	vint_set_property(Mp_completion.handles.tips, "visible", true)
	lua_play_anim(Mp_completion.handles.tips_fade_in_anim, 0)
	local tween_h = vint_object_find("tips_fade_in", Mp_completion.handles.tips_fade_in_anim)
	if Mp_completion_force_skip == false then
		vint_set_property(tween_h, "start_event", "mp_completion_tips_sound")
	end
	vint_set_property(tween_h, "end_event", "mp_completion_anim_false")
end

function mp_completion_tips_fade_in_offset(offset)
	vint_set_property(Mp_completion.handles.tips, "visible", true)
	lua_play_anim(Mp_completion.handles.tips_fade_in_anim, offset)
	local tween_h = vint_object_find("tips_fade_in", Mp_completion.handles.tips_fade_in_anim)
	if Mp_completion_force_skip == false then
		vint_set_property(tween_h, "start_event", "mp_completion_tips_sound")
	end
	vint_set_property(tween_h, "end_event", "mp_completion_anim_false")
end

---------------
--AUDIO
function mp_completion_image_sound()
	audio_play(Mp_completion_audio.image)
end

function mp_completion_text_sound()
	audio_play(Mp_completion_audio.text)
end

function mp_completion_respect_sound()
	audio_play(Mp_completion_audio.respect)
end

function mp_completion_cash_sound()
	audio_play(Mp_completion_audio.cash)
end

function mp_completion_tips_sound()
	audio_play(Mp_completion_audio.tips)
end

function mp_completion_top_3_sound()
	audio_play(Mp_completion_audio.top_3)
end

function mp_completion_top_2_sound()
	audio_play(Mp_completion_audio.top_2)
end

function mp_completion_top_fail_sound()
	audio_play(Mp_completion_audio.fail)
end


------------------------
--thread killing

Mp_completion_anim_thread_count = 0
Mp_completion_force_skip = false
Mp_completion_current_time = 0
Mp_completion_cancelled_waiting = false
Mp_copmletion_isfinal = false

function mp_completion_anim_threads_is_killed()
	return Mp_completion_force_skip
end

function mp_completion_anim_false()
	Mp_completion_is_animating = false
end

function mp_completion_anim_threads_kill()
	Mp_completion_force_skip = true
end

function mp_completion_anim_threads_unkill()
	
end

function mp_completion_cancel_wait()
	if Mp_completion_cancelled_waiting == false then
		Mp_completion_cancelled_waiting = true
		
		-- Only show stuff if the host left while the client was in the final screen
		if Mp_copmletion_isfinal then
			vint_set_property(Mp_completion.handles.tip_1_pulsate_h, "is_paused", true)
			vint_set_property(Mp_completion.handles.tip_1, "text_tag", " ")
			dialog_box_message("MENU_TITLE_WARNING", "MP_DISCONNECT_HOST_LEFT")
		end
	end
end

-------- THANK YOU GOODNIGHT! --------
Mp_completion = {	
	handles = {},
	input = { },
	
	general = { },						--	Heading, team scores, etc
	awards = { num_awards = 0 },	--	Awards, i.e., "Noosh was the Ho's favorite" - Damn right, JHG
	badges = { num_badges =  0 },	--	Badges, i.e., "Brain Surgeon"

	input_block = false,
	
	num_screens = 3,
	screen_idx = 0,
	
	start_idx = 0,
	end_idx = 9,
	
	a_available = false,
	b_available = false,
	x_available = false,
	
	screen_show_function = { 
		[0] = mp_completion_show_general,
		[1] = mp_completion_show_badges,
		[2] = mp_completion_show_results,	
	},
}


