Cte_news6 = {}
CTE_NEWS6_DOC_HANDLE = -1
function cte_news6_init()
	CTE_NEWS6_DOC_HANDLE = vint_document_find("cte_news6")
	--vint_set_property(CTE_NEWS6_DOC_HANDLE, "depth", -50)
	peg_load("ui_cts_news6")

	--Store handles
	Cte_news6.handles = {}
	Cte_news6.handles.logo_grp = vint_object_find("logo_grp")
	Cte_news6.handles.main_grp = vint_object_find("main_grp")
	Cte_news6.handles.text_ticker = vint_object_find("text_ticker")
	
	local ticker_string = "Ultor Breaks New Grounds In Controling Gang Violence : Rim Jobs Offers Ways to Customize Cars : Superstar Michael Clarke Duncan set to play Benjamin King in upcoming biopic : Image As Designed in malpractice suit : Freckle Bitches Father Disowns : Elysian Fields Trailer Park host features Junk art by local residents : How safe is stilwater water to drink? : Man gets hit with bottle in a bar while watching local news : Mysterious lack of marine life in Stilwater lake :  "
	
	vint_set_property(Cte_news6.handles.text_ticker, "text_tag", ticker_string)
	
	--Hide all objects
	vint_set_property(Cte_news6.handles.logo_grp, "visible", false)
	vint_set_property(Cte_news6.handles.main_grp, "visible", false)
end

function cte_news6_show_logo()
	--show logo
	vint_set_property(Cte_news6.handles.logo_grp, "visible", true)
end

function cte_news6_hide_logo()
	--show logo
	vint_set_property(Cte_news6.handles.logo_grp, "visible", false)
end

function cte_news6_show_full()
	--show logo
	vint_set_property(Cte_news6.handles.main_grp, "visible", true)
end

function cte_news6_hide_full()
	--show logo
	vint_set_property(Cte_news6.handles.main_grp, "visible", false)
end

function cte_news6_cleanup()
	peg_unload("ui_cts_news6")
end
