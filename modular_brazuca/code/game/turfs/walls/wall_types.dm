/turf/closed/wall/indestructible/splashscreen
	name = "Space Station 13"
	icon = 'modular_brazuca/icons/misc/title.dmi'
	icon_state = "title_painting1"
//	icon_state = "title_holiday"
	layer = FLY_LAYER
	pixel_x = -64

/turf/closed/wall/indestructible/splashscreen/New()
	..()
	icon_state = "title_painting[rand(0,3)]"
