Hud_race_start = {	

	handles = {},

}


Hud_race_start_sound = {

	one = "SFX_DEMODERBY_1",
	two = "SFX_DEMODERBY_2",
	three = "SFX_DEMODERBY_3",
	go = "SFX_DEMODERBY_GO",

}

AUDIO_COUNTDOWN_3_ID = 0
AUDIO_COUNTDOWN_2_ID = 0
AUDIO_COUNTDOWN_1_ID = 0
AUDIO_COUNTDOWN_GO_ID = 0

function hud_race_start_init()
	debug_print("vint", "HUD_RACE_START init\n")
	
	--elements
	Hud_race_start.handles.n1_grp_h = vint_object_find("n1_grp")
	Hud_race_start.handles.n2_grp_h = vint_object_find("n2_grp")
	Hud_race_start.handles.n3_grp_h = vint_object_find("n3_grp")
	Hud_race_start.handles.go_grp_h = vint_object_find("go_grp")
	
	--anims
	Hud_race_start.handles.n1_anim_h = vint_object_find("n1_anim")
	Hud_race_start.handles.n2_anim_h = vint_object_find("n2_anim")
	Hud_race_start.handles.n3_anim_h = vint_object_find("n3_anim")
	Hud_race_start.handles.go_anim_h = vint_object_find("go_anim")
	
	--pause em
	vint_set_property(Hud_race_start.handles.n1_anim_h, "is_paused", true)
	vint_set_property(Hud_race_start.handles.n2_anim_h, "is_paused", true)
	vint_set_property(Hud_race_start.handles.n3_anim_h, "is_paused", true)
	vint_set_property(Hud_race_start.handles.go_anim_h, "is_paused", true)

	--initialize our audio ids
	AUDIO_COUNTDOWN_3_ID = 0
	AUDIO_COUNTDOWN_2_ID = 0
	AUDIO_COUNTDOWN_1_ID = 0
	AUDIO_COUNTDOWN_GO_ID = 0
	
	local twn_h = 0
	
	--twns
	twn_h = vint_object_find("go_scale", Hud_race_start.handles.go_anim_h)			
	vint_set_property(twn_h, "end_event", "hud_race_start_invisible")
	vint_set_property(twn_h, "start_event",  "hud_race_start_sound_go");

	twn_h = vint_object_find("3_anchor_twn_2", Hud_race_start.handles.n3_anim_h)			
	vint_set_property(twn_h, "start_event",  "hud_race_start_sound_3");

	twn_h = vint_object_find("2_anchor_twn_2", Hud_race_start.handles.n2_anim_h)			
	vint_set_property(twn_h, "start_event",  "hud_race_start_sound_2");

	twn_h = vint_object_find("1_anchor_twn_2", Hud_race_start.handles.n1_anim_h)			
	vint_set_property(twn_h, "start_event",  "hud_race_start_sound_1");
	
	Hud_race_start.handles.current_num = -1

	AUDIO_COUNTDOWN_3_ID = audio_prepare("SFX_DEMODERBY_3")
end


function hud_race_start_1()
	vint_set_property(Hud_race_start.handles.n1_grp_h, "visible", true)
	lua_play_anim(Hud_race_start.handles.n1_anim_h, 0)
	Hud_race_start.handles.current_num = 1
--	local twn_h = vint_object_find("1_anchor_twn_3", Hud_race_start.handles.n1_anim_h)			
--	vint_set_property(twn_h, "end_event", "hud_race_start_go")
end

function hud_race_start_2()
	vint_set_property(Hud_race_start.handles.n2_grp_h, "visible", true)
	lua_play_anim(Hud_race_start.handles.n2_anim_h, 0)
	Hud_race_start.handles.current_num = 2
--	local twn_h = vint_object_find("2_anchor_twn_3", Hud_race_start.handles.n2_anim_h)			
--	vint_set_property(twn_h, "end_event", "hud_race_start_1")

end

function hud_race_start_3()
	vint_set_property(Hud_race_start.handles.n3_grp_h, "visible", true)
	lua_play_anim(Hud_race_start.handles.n3_anim_h, 0)
	Hud_race_start.handles.current_num = 3
	
--	local twn_h = vint_object_find("3_anchor_twn_3", Hud_race_start.handles.n3_anim_h)			
--	vint_set_property(twn_h, "end_event", "hud_race_start_2")
end

function hud_race_start_go()
	vint_set_property(Hud_race_start.handles.go_grp_h, "visible", true)
	lua_play_anim(Hud_race_start.handles.go_anim_h, 0)
	Hud_race_start.handles.current_num = 0
end


function hud_race_start_invisible()
	vint_set_property(Hud_race_start.handles.n1_grp_h, "visible", false)
	vint_set_property(Hud_race_start.handles.n2_grp_h, "visible", false)
	vint_set_property(Hud_race_start.handles.n3_grp_h, "visible", false)
	vint_set_property(Hud_race_start.handles.go_grp_h, "visible", false)	
end

function hud_race_start_visible()
	vint_set_property(Hud_race_start.handles.n1_grp_h, "visible", true)
	vint_set_property(Hud_race_start.handles.n2_grp_h, "visible", true)
	vint_set_property(Hud_race_start.handles.n3_grp_h, "visible", true)
	vint_set_property(Hud_race_start.handles.go_grp_h, "visible", true)	
end


function hud_race_start_cleanup()
	debug_print("vint", "HUD_RACE_START cleanup\n")

	--make sure all of the audio stops
	if AUDIO_COUNTDOWN_3_ID ~= 0 then
		audio_fade_out(AUDIO_COUNTDOWN_3_ID, 0)
		AUDIO_COUNTDOWN_3_ID = 0
	end
	if AUDIO_COUNTDOWN_2_ID ~= 0 then
		audio_fade_out(AUDIO_COUNTDOWN_2_ID, 0)
		AUDIO_COUNTDOWN_2_ID = 0
	end
	if AUDIO_COUNTDOWN_1_ID ~= 0 then
		audio_fade_out(AUDIO_COUNTDOWN_1_ID, 0)
		AUDIO_COUNTDOWN_1_ID = 0
	end
	if AUDIO_COUNTDOWN_GO_ID ~= 0 then
		audio_fade_out(AUDIO_COUNTDOWN_GO_ID, 0)
		AUDIO_COUNTDOWN_GO_ID = 0
	end

	--just in case, turn all invisible
	vint_set_property(Hud_race_start.handles.n1_anim_h, "visible", false)
	vint_set_property(Hud_race_start.handles.n2_anim_h, "visible", false)
	vint_set_property(Hud_race_start.handles.n3_anim_h, "visible", false)
	vint_set_property(Hud_race_start.handles.go_anim_h, "visible", false)	
end

--my fake test function
function hud_race_start_fake()
	hud_race_start_3()
end

function hud_race_start_sound_3()
	if AUDIO_COUNTDOWN_2_ID == 0 then
		AUDIO_COUNTDOWN_2_ID = audio_prepare("SFX_DEMODERBY_2")
	end
	audio_play_prepared(AUDIO_COUNTDOWN_3_ID)
	AUDIO_COUNTDOWN_3_ID = 0
	--audio_play(Hud_race_start_sound.three)
end

function hud_race_start_sound_2()
	if AUDIO_COUNTDOWN_1_ID == 0 then
		AUDIO_COUNTDOWN_1_ID = audio_prepare("SFX_DEMODERBY_1")
	end
	audio_play_prepared(AUDIO_COUNTDOWN_2_ID)
	AUDIO_COUNTDOWN_2_ID = 0
	--audio_play(Hud_race_start_sound.two)
end

function hud_race_start_sound_1()
	if AUDIO_COUNTDOWN_GO_ID == 0 then
		AUDIO_COUNTDOWN_GO_ID = audio_prepare("SFX_DEMODERBY_GO")
	end
	audio_play_prepared(AUDIO_COUNTDOWN_1_ID)
	AUDIO_COUNTDOWN_1_ID = 0
	--audio_play(Hud_race_start_sound.one)
end

function hud_race_start_sound_go()
	audio_play_prepared(AUDIO_COUNTDOWN_GO_ID)
	AUDIO_COUNTDOWN_GO_ID = 0
	--audio_play(Hud_race_start_sound.go)
end

function hud_race_start_pause_all()
	hud_race_start_invisible()
	vint_set_property(Hud_race_start.handles.n1_anim_h, "is_paused", true)
	vint_set_property(Hud_race_start.handles.n2_anim_h, "is_paused", true)
	vint_set_property(Hud_race_start.handles.n3_anim_h, "is_paused", true)
	vint_set_property(Hud_race_start.handles.go_anim_h, "is_paused", true)	
end

function hud_race_start_unpause_all()
	if Hud_race_start.handles.current_num == 0 then
		vint_set_property(Hud_race_start.handles.go_grp_h, "visible", true)
		vint_set_property(Hud_race_start.handles.go_anim_h, "is_paused", false)	
	elseif Hud_race_start.handles.current_num == 1 then
		vint_set_property(Hud_race_start.handles.n1_grp_h, "visible", true)
		vint_set_property(Hud_race_start.handles.n1_anim_h, "is_paused", false)	
	elseif Hud_race_start.handles.current_num == 2 then
		vint_set_property(Hud_race_start.handles.n2_grp_h, "visible", true)
		vint_set_property(Hud_race_start.handles.n2_anim_h, "is_paused", false)	
	elseif Hud_race_start.handles.current_num == 3 then
		vint_set_property(Hud_race_start.handles.n3_grp_h, "visible", true)
		vint_set_property(Hud_race_start.handles.n3_anim_h, "is_paused", false)	
	end
end

