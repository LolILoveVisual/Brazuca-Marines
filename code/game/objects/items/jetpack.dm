#define FUEL_USE 5
#define FUEL_INDICATOR_FULL 35
#define FUEL_INDICATOR_HALF_FULL 20
#define JETPACK_COOLDOWN_TIME 10 SECONDS

/obj/item/jetpack_marine
	name = "marine jetpack"
	desc = "A high powered jetpack with enough fuel to send a person flying for a short while. It allows for fast and agile movement on the battlefield. <b>Alt right click or middleclick to fly to a destination when the jetpack is equipped.</b>"
	icon = 'icons/obj/items/jetpack.dmi'
	icon_state = "jetpack_marine"
	item_icons = list(
		slot_l_hand_str = 'icons/mob/inhands/equipment/backpacks_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/equipment/backpacks_right.dmi',
	)
	w_class = WEIGHT_CLASS_BULKY
	flags_equip_slot = ITEM_SLOT_BACK
	obj_flags = CAN_BE_HIT
	///maximum amount of fuel in the jetpack
	var/fuel_max = 75
	///current amount of fuel in the jetpack
	var/fuel_left = 75
	///threshold to change the jetpack fuel indicator
	var/fuel_indicator = FUEL_INDICATOR_FULL
	///How quick you will fly (warning, it rounds up to the nearest integer)
	var/speed = 1
	///How long the jetpack allows you to fly over things
	var/hovering_time = 1 SECONDS
	///True when jetpack has flame overlay
	var/lit = FALSE
	///True if you can use shift click/middle click to use it
	var/selected = FALSE

/obj/item/jetpack_marine/Initialize(mapload)
	. = ..()
	update_icon()

/obj/item/jetpack_marine/examine(mob/user, distance, infix, suffix)
	. = ..()
	if(!ishuman(user))
		return
	if(fuel_left == 0)
		. += "The fuel gauge is beeping, it has no fuel left!"
	else
		. += "The fuel gauge meter indicates it has [fuel_left/FUEL_USE] uses left."

/obj/item/jetpack_marine/equipped(mob/user, slot)
	. = ..()
	if(slot == SLOT_BACK)
		var/datum/action/item_action/toggle/action = new(src)
		action.give_action(user)

/obj/item/jetpack_marine/dropped(mob/user)
	. = ..()
	UnregisterSignal(user, list(COMSIG_MOB_MIDDLE_CLICK, COMSIG_MOB_CLICK_ALT_RIGHT, COMSIG_ITEM_EXCLUSIVE_TOGGLE))
	selected = FALSE
	LAZYCLEARLIST(actions)

/obj/item/jetpack_marine/ui_action_click(mob/user, datum/action/item_action/action)
	if(selected)
		UnregisterSignal(user, list(COMSIG_MOB_MIDDLE_CLICK, COMSIG_MOB_CLICK_ALT_RIGHT, COMSIG_ITEM_EXCLUSIVE_TOGGLE))
		action.set_toggle(FALSE)
	else
		RegisterSignals(user, list(COMSIG_MOB_MIDDLE_CLICK, COMSIG_MOB_CLICK_ALT_RIGHT), PROC_REF(can_use_jetpack))
		SEND_SIGNAL(user, COMSIG_ITEM_EXCLUSIVE_TOGGLE, user)
		RegisterSignal(user, COMSIG_ITEM_EXCLUSIVE_TOGGLE, PROC_REF(unselect))
		action.set_toggle(TRUE)
	selected = !selected

///Signal handler for making it impossible to use middleclick to use the jetpack
/obj/item/jetpack_marine/proc/unselect(datum/source, mob/user)
	SIGNAL_HANDLER
	if(!selected)
		return
	selected = FALSE
	UnregisterSignal(user, list(COMSIG_MOB_MIDDLE_CLICK, COMSIG_MOB_CLICK_ALT_RIGHT, COMSIG_ITEM_EXCLUSIVE_TOGGLE))
	for(var/action in user.actions)
		if (!istype(action, /datum/action/item_action))
			continue
		var/datum/action/item_action/iaction = action
		if(iaction?.holder_item == src)
			iaction.set_toggle(FALSE)


///remove the flame overlay
/obj/item/jetpack_marine/proc/reset_flame(mob/living/carbon/human/human_user)
	lit = FALSE
	update_icon()
	human_user.update_inv_back()

///Make the user fly toward the target atom
/obj/item/jetpack_marine/proc/use_jetpack(atom/A, mob/living/carbon/human/human_user)
	if(human_user.buckled)
		balloon_alert(human_user, "Cannot fly while buckled")
		return
	if(human_user.do_actions)
		return
	if(!do_after(user = human_user, delay = 0.3 SECONDS, needhand = FALSE, target = A, ignore_turf_checks = TRUE))
		return
	TIMER_COOLDOWN_START(src, COOLDOWN_JETPACK, JETPACK_COOLDOWN_TIME)
	lit = TRUE
	playsound(human_user,'sound/items/jetpack_sound.ogg',45)
	fuel_left -= FUEL_USE
	change_fuel_indicator()
	human_user.update_inv_back()
	update_icon()
	new /obj/effect/temp_visual/smoke(get_turf(human_user))
	human_user.fly_at(A, calculate_range(human_user), speed, hovering_time)
	addtimer(CALLBACK(src,PROC_REF(reset_flame), human_user), hovering_time)

///Calculate the max range of the jetpack, changed by some item slowdown
/obj/item/jetpack_marine/proc/calculate_range(mob/living/carbon/human/human_user)
	var/range_limiting_factor = human_user.additive_flagged_slowdown(SLOWDOWN_IMPEDE_JETPACK)
	switch(range_limiting_factor)
		if(0 to 0.35) //light armor or above
			return 7
		if(0.35 to 0.75)//medium armor with shield
			return 5
		if(0.75 to 1.2)//heavy armor with shield
			return 3
		if(1.2 to INFINITY)//heavy armor with shield and tyr mk2
			return 2

///Check if we can use the jetpack and give feedback to the users
/obj/item/jetpack_marine/proc/can_use_jetpack(datum/source, atom/A)
	SIGNAL_HANDLER
	var/mob/living/carbon/human/human_user = usr
	if(human_user.incapacitated() || human_user.lying_angle)
		return
	if(TIMER_COOLDOWN_CHECK(src, COOLDOWN_JETPACK))
		to_chat(human_user,span_warning("You cannot use the jetpack yet!"))
		return
	if(fuel_left < FUEL_USE)
		balloon_alert(human_user, "No fuel")
		return
	INVOKE_ASYNC(src, PROC_REF(use_jetpack), A, human_user)

/obj/item/jetpack_marine/update_overlays()
	. = ..()
	switch(fuel_indicator)
		if(FUEL_INDICATOR_FULL)
			. += image('icons/obj/items/jetpack.dmi', src, "+jetpackfull")
		if(FUEL_INDICATOR_HALF_FULL)
			. += image('icons/obj/items/jetpack.dmi', src, "+jetpackhalffull")
		if(FUEL_USE)
			. += image('icons/obj/items/jetpack.dmi', src, "+jetpackalmostempty")
		else
			. += image('icons/obj/items/jetpack.dmi', src, "+jetpackempty")

/obj/item/jetpack_marine/apply_custom(mutable_appearance/standing)
	. = ..()
	if(lit)
		standing.overlays += mutable_appearance('icons/mob/clothing/back.dmi',"+jetpack_lit")

///Manage the fuel indicator overlay
/obj/item/jetpack_marine/proc/change_fuel_indicator()
	if(fuel_left-fuel_indicator > 0)
		return
	if (fuel_left >= FUEL_INDICATOR_FULL)
		fuel_indicator = FUEL_INDICATOR_FULL
		return
	if (fuel_left >= FUEL_INDICATOR_HALF_FULL)
		fuel_indicator = FUEL_INDICATOR_HALF_FULL
		return
	if (fuel_left >= FUEL_USE)
		fuel_indicator = FUEL_USE
		return
	fuel_indicator = 0

/obj/item/jetpack_marine/afterattack(obj/target, mob/user, proximity_flag) //refuel at fueltanks when we run out of fuel
	if(!istype(target, /obj/structure/reagent_dispensers/fueltank) || !proximity_flag)
		return ..()
	var/obj/structure/reagent_dispensers/fueltank/FT = target
	if(FT.reagents.total_volume == 0)
		balloon_alert(user, "No fuel")
		return

	var/fuel_transfer_amount = min(FT.reagents.total_volume, (fuel_max - fuel_left))
	FT.reagents.remove_reagent(/datum/reagent/fuel, fuel_transfer_amount)
	fuel_left += fuel_transfer_amount
	fuel_indicator = FUEL_INDICATOR_FULL
	change_fuel_indicator()
	update_icon()
	playsound(loc, 'sound/effects/refill.ogg', 30, 1, 3)
	balloon_alert(user, "Refilled")

/obj/item/jetpack_marine/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(!istype(I, /obj/item/ammo_magazine/flamer_tank))
		return
	var/obj/item/ammo_magazine/flamer_tank/FT = I
	if(FT.current_rounds == 0)
		balloon_alert(user, "No fuel")
		return

	var/fuel_transfer_amount = min(FT.current_rounds, (fuel_max - fuel_left))
	FT.current_rounds -= fuel_transfer_amount
	fuel_left += fuel_transfer_amount
	fuel_indicator = FUEL_INDICATOR_FULL
	change_fuel_indicator()
	playsound(loc, 'sound/effects/refill.ogg', 25, 1, 3)
	balloon_alert(user, "Refilled")
	update_icon()
