Tutorial_subtitles_data = {}

-- Run that animation fun time action
function tutorial_subtitles_init()

	-- Set up handle for text
	Tutorial_subtitles_data.text_h = vint_object_find("subtitle_text")
	vint_set_property(Tutorial_subtitles_data.text_h, "word_wrap", true)
	
	-- Set up fade in animation
	Tutorial_subtitles_data.fade_in_h = vint_object_find("subtitle_text_fade_in")
	vint_set_property(Tutorial_subtitles_data.fade_in_h, "is_paused", true)
	
	-- Set up fade out animation
	Tutorial_subtitles_data.fade_out_h = vint_object_find("subtitle_text_fade_out")
	vint_set_property(Tutorial_subtitles_data.fade_out_h, "is_paused", true)
	
	-- Give fade out a callback so we can trigger the fade in when it's finished
	vint_set_property(vint_object_find("subtitle_text_alpha_out",Tutorial_subtitles_data.fade_out_h), "end_event", "finish_new_line")
	
	-- Start the party
	thread_new("run_subtitles")
end

function run_subtitles()
	delay(0.5)
	new_line("ULTOR_TUTORIAL_01") -- Welcome to the Strong Arm tutorial, sponsored by Ultor.
	delay(4.5)
	new_line(" ")
	delay(7)
	new_line("ULTOR_TUTORIAL_02") -- In Stong Arm two teams vie for control of a neighborhood.  To ensure your survival, it is vital that you and your associates work as a team.
	delay(14)
	new_line(" ")
	delay(3.5)
	new_line("ULTOR_TUTORIAL_03") -- To win Strong Arm, a team must generate enough income to buy-out the neighborhood.
	delay(5)
	new_line("ULTOR_TUTORIAL_04") -- By participating in Activities and killing your opponents your team earns money.
	delay(5.2)
	new_line("ULTOR_TUTORIAL_05") -- When an Activity begins, complete the objectives to earn money.  Activities change as the match progresses.
	delay(7)
	new_line("ULTOR_TUTORIAL_06") -- Everyone competes in the Activity together.  The scoring meter... shows which team is winning the Activity.
	delay(6.8)
	new_line("ULTOR_TUTORIAL_07") -- All money earned in Activities is added to your teams total.  However, when a team wins an Activity they are awarded an additional cash bonus.
	delay(9.8)
	new_line("ULTOR_TUTORIAL_08") -- Complete the objectives, win the Activity.  Win the Activity, win the Money.
	delay(6)
	new_line(" ")
	delay(4.7)
	new_line("ULTOR_TUTORIAL_09") -- Controling tagging spots helps your team complete these goals.
	delay(4.2)
	new_line("ULTOR_TUTORIAL_10") -- Each tag provides an important team bonus.
	delay(3.4)
	new_line("ULTOR_TUTORIAL_11") -- These bonuses can tip the scales in activities and combat.
	delay(4.1)
	new_line("ULTOR_TUTORIAL_13") -- The bonus is in effect for as long as your team holds the tagging spot.  Steal your opponents’ tags to claim their bonuses, but don’t forget to protect your own. 
	delay(10.2)
	new_line("ULTOR_TUTORIAL_14") -- Remember, teamwork is the key to success.
	delay(3)
	new_line(" ")
end

function new_line(next_line)
	-- Hang on to new text
	Tutorial_subtitles_data.next_line = next_line
	
	-- Fade out old line of text
	lua_play_anim(Tutorial_subtitles_data.fade_out_h)
end

function finish_new_line()
	-- Put new text into the graphic
	vint_set_property(Tutorial_subtitles_data.text_h, "text_tag", Tutorial_subtitles_data.next_line)
	
	-- Fade in new line of text
	lua_play_anim(Tutorial_subtitles_data.fade_in_h)
end

-- Clean up any pegs or subscriptions
function tutorial_subtitles_cleanup()

end