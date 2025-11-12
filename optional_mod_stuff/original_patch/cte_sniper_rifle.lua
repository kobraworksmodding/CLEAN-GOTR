Cte_sniper = {}

function cte_sniper_rifle_init()
	Cte_sniper.handles = {}
	Cte_sniper.handles.sniper = vint_object_find("sniper")
end

function cte_sniper_rifle_show()
	vint_set_property(Cte_sniper.handles.sniper,"visible", true)
end

function cte_sniper_rifle_hide()
	vint_set_property(Cte_sniper.handles.sniper,"visible", false)
end

function cte_sniper_rifle_cleanup()

end