-- sr2_city.lua
-- Master Lua Script for Saints Row 2
-- 3/28/07


include("airport.lua")					-- DISTRICTS
include("apartments.lua")
include("arena.lua")
include("barrio.lua")
include("chinatown.lua")
include("docks.lua")
include("downtown.lua")
include("factories.lua")
include("highend.lua")
include("hotels.lua")
include("museum.lua")
include("nuke.lua")
include("prison.lua")
include("projects.lua")
include("redlight.lua")
include("saintsrow.lua")
include("suburbs.lua")
include("subexp.lua")
include("trailerpark.lua")
include("truckyard.lua")
include("ultor_base.lua")
include("underground.lua")
include("university.lua")

include("mission_globals.lua")		-- MISSIONS
include("stronghold_globals.lua")	-- STRONGHOLDS

function sr2_city_init()

-- DISTRICTS
	airport_init()
	apartments_init()
	arena_init()
	barrio_init()
	chinatown_init()
	docks_init()
	downtown_init()
	factories_init()
	highend_init()
	hotels_init()
	museum_init()
	nuke_init()
	prison_init()
	projects_init()
	redlight_init()
	saintsrow_init()
	suburbs_init()
	subexp_init()
	trailerpark_init()
	truckyard_init()
	ultor_base_init()
	underground_init()
	university_init()

-- MISSIONS
	mission_globals_init()

-- STRONGHOLDS
	stronghold_globals_init()

end

function sr2_city_main()

-- DISTRICTS
	thread_new("airport_main")
	thread_new("apartments_main")
	thread_new("arena_main")
	thread_new("barrio_main")
	thread_new("chinatown_main")
	thread_new("docks_main")
	thread_new("downtown_main")
	thread_new("factories_main")
	thread_new("highend_main")
	thread_new("hotels_main")
	thread_new("museum_main")
	thread_new("nuke_main")
	thread_new("prison_main")
	thread_new("projects_main")
	thread_new("redlight_main")
	thread_new("saintsrow_main")
	thread_new("suburbs_main")
	thread_new("subexp_main")
	thread_new("trailerpark_main")
	thread_new("truckyard_main")
	thread_new("ultor_base_main")
	thread_new("underground_main")
	thread_new("university_main")

-- MISSIONS
	thread_new("tss01_main")	-- Third Street Saints (Prologue)
	thread_new("tss02_main")
	thread_new("tss03_main")
	thread_new("tss04_main")

	thread_new("bh01_main")		-- The Brotherhood
	thread_new("bh02_main")
	thread_new("bh03_main")
	thread_new("bh04_main")
	thread_new("bh05_main")
	thread_new("bh06_main")
	thread_new("bh07_main")
	thread_new("bh08_main")
	thread_new("bh09_main")
	thread_new("bh10_main")
	thread_new("bh11_main")

	thread_new("rn01_main")		-- The Ronin
	thread_new("rn02_main")
	thread_new("rn03_main")
	thread_new("rn04_main")
	thread_new("rn05_main")
	thread_new("rn06_main")
	thread_new("rn07_main")
	thread_new("rn08_main")
	thread_new("rn09_main")
	thread_new("rn10_main")
	thread_new("rn11_main")

	thread_new("ss01_main")		-- Sons of Samedi
	thread_new("ss02_main")
	thread_new("ss03_main")
	thread_new("ss04_main")
	thread_new("ss05_main")
	thread_new("ss06_main")
	thread_new("ss07_main")
	thread_new("ss08_main")
	thread_new("ss09_main")
	thread_new("ss10_main")
	thread_new("ss11_main")

	thread_new("ep01_main")		-- Epilogue Missions
	thread_new("ep02_main")
	thread_new("ep03_main")
	thread_new("ep04_main")

	thread_new("em01_main")		-- Emergent Missions
	thread_new("em02_main")

-- STRONGHOLDS ???????

end
