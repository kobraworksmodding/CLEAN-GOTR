Menu_style_dialog_flair_thread = 0

function menu_style_dialog_init()
	local inserts = {[0] = Style_cluster_player_style.level, [1] = Style_cluster_player_style.bonus}
	local body = "MENU_STYLE_DIALOG_BODY"
	local body_string = vint_insert_values_in_string(body, inserts)
	local body_text_h = vint_object_find("body_text")
	vint_set_property(body_text_h, "text_tag", body_string)
	
	vint_subscribe_to_input_event(nil, "select",				"menu_style_dialog_input", 50)
	vint_subscribe_to_input_event(nil, "all_unassigned",	"menu_style_dialog_input", 50)
	
	--Resize textbox if the words get too big
	local body_text_width, body_text_height = element_get_actual_size(body_text_h)
	if body_text_height > 90 then
		vint_set_property(body_text_h, "wrap_width", 345)
	end
	
	vint_set_property(vint_object_find("style_flair_rotation_twn_1"), "end_event", "menu_style_dialog_flair")
	audio_play(audio_get_audio_id("SYS_HUD_CONF_REWARD"))
end

function menu_style_dialog_input(target, event, accelleration)
	if event == "select" then
		vint_document_unload()
	end
end

function menu_style_dialog_flair()
	if Menu_style_dialog_flair_thread == 0 then
		Menu_style_dialog_flair_thread = thread_new("menu_style_dialog_flair2")
	end
end
	
function menu_style_dialog_flair2()
	delay(rand_float(2, 5))
	
	vint_set_property(vint_object_find("style_flair_anim_0"), "start_time", vint_get_time_index())
	Menu_style_dialog_flair_thread = 0
end
