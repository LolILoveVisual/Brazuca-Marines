/turf/closed/wall/indestructible/splashscreen
	name = "FFAA"
	icon = 'modular_brazuca/icons/misc/title.dmi'
	icon_state = "title_painting1"
//	icon_state = "title_holiday"
	layer = FLY_LAYER
	pixel_x = -64

/turf/closed/wall/indestructible/splashscreen/New()
	..()
	if(icon_state == "title_painting1")
		icon_state = "title_painting[rand(0,3)]"
