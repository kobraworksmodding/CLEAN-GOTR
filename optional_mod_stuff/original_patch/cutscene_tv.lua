Cutscene_tv_anims = {	
								anim_1_h = -1, 
								anim_2_h = -1, 
								anim_3_h = -1
}

function cutscene_tv_init()
	--Load Pegs
	peg_load("ui_cutscene")
	
	--Find Animations, pause and store to globals
	local anim_1_h = vint_object_find("static_1_2_scale")
	local anim_2_h = vint_object_find("static_1_alpha")
	local anim_3_h = vint_object_find("static_3_scale")
	vint_set_property(anim_1_h, "is_paused", true)
	vint_set_property(anim_2_h, "is_paused", true)
	vint_set_property(anim_3_h, "is_paused", true)
	Cutscene_tv_anims.anim_1_h = anim_1_h
	Cutscene_tv_anims.anim_2_h = anim_2_h
	Cutscene_tv_anims.anim_3_h = anim_3_h
end



function cutscene_tv_cleanup()
	--Unload Pegs
	peg_unload("ui_cutscene")
end

function play_static()
	--Play all anims at once
	lua_play_anim(Cutscene_tv_anims.anim_1_h, 0)
	lua_play_anim(Cutscene_tv_anims.anim_2_h, 0)
	lua_play_anim(Cutscene_tv_anims.anim_3_h, 0)
end


function shot_start()
	--Just to debug with
	debug_print("test", "Shot is now starting!\n")
end