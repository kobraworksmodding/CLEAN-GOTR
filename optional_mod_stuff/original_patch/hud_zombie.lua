Hud_zombie = {
	handles = {},
}
--
function hud_zombie_init()
	local h = -1
	
	peg_load("ui_hud_zombie")
	
	--players
	Hud_zombie.handles.players = vint_object_find("players")
	
		--player 1
		Hud_zombie.handles.player_1 = vint_object_find("player_1")
		h = Hud_zombie.handles.player_1
		Hud_zombie.handles.health_1 = vint_object_find("health_1", h)
		Hud_zombie.handles.head_1 = vint_object_find("head_1", h)
		
		--player 2
		Hud_zombie.handles.player_2 = vint_object_find("player_2")
		h = Hud_zombie.handles.player_2
		Hud_zombie.handles.health_2 = vint_object_find("health_2", h)
		Hud_zombie.handles.head_2 = vint_object_find("head_2", h)
		
	--score grp
	Hud_zombie.handles.score_grp = vint_object_find("score_grp")
	h = Hud_zombie.handles.score_grp
	Hud_zombie.handles.main_score_num = vint_object_find("main_score_num", h)
	Hud_zombie.handles.high_score_num = vint_object_find("high_score_num", h)
	
	--STATS zombies left + killed
	Hud_zombie.handles.stats = vint_object_find("stats")
	h = Hud_zombie.handles.stats
	Hud_zombie.handles.zombies_killed_num = vint_object_find("zombies_killed_num", h)
	Hud_zombie.handles.zombies_left_num = vint_object_find("zombies_left_num", h)
	
	vint_dataitem_add_subscription("sr2_local_player_hud_zombie", "update", "hud_zombie_update")

end

function hud_zombie_cleanup()
	peg_unload("ui_hud_zombie")
end

function hud_zombie_update(di_h, event)
	
	local score, high_score, health_1, health_2, zombies_left, zombies_killed = vint_dataitem_get(di_h)
	
	local p1 = Hud_zombie.handles.player_1
	local p1_health = Hud_zombie.handles.health_1
	local p2 = Hud_zombie.handles.player_2
	local p2_health = Hud_zombie.handles.health_2

	--current score
	vint_set_property(Hud_zombie.handles.main_score_num, "text_tag", format_cash(score))
	
	--high score
	vint_set_property(Hud_zombie.handles.high_score_num, "text_tag", format_cash(high_score))
	
	--zombies
	vint_set_property(Hud_zombie.handles.zombies_killed_num, "text_tag", format_cash(zombies_killed))
	vint_set_property(Hud_zombie.handles.zombies_left_num, "text_tag", format_cash(zombies_left))

	--player 1
	vint_set_property(p1_health, "text_tag", ceil(health_1 * 100))
	
	--player 2 
	if health_2 == -1 or health_2 < 0 then
		vint_set_property(p2, "visible", false)
	else
		vint_set_property(p2, "visible", true)
		vint_set_property(p2_health, "text_tag", ceil(health_2 * 100))
	end
end
