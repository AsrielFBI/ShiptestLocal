GLOBAL_LIST(labor_sheet_values)

/**********************Prisoners' Console**************************/

/obj/machinery/mineral/labor_claim_console
	name = "point claim console"
	desc = "A stacking console with an electromagnetic writer, used to track ore mined by prisoners."
	icon = 'icons/obj/machines/mining_machines.dmi'
	icon_state = "console"
	density = FALSE

	var/obj/machinery/mineral/stacking_machine/laborstacker/stacking_machine = null
	var/machinedir = SOUTH
	var/obj/machinery/door/airlock/release_door
	var/door_tag = "prisonshuttle"
	var/obj/item/radio/Radio //needed to send messages to sec radio

/obj/machinery/mineral/labor_claim_console/Initialize()
	. = ..()
	Radio = new /obj/item/radio(src)
	Radio.listening = FALSE
	locate_stacking_machine()
	//If we can't find a stacking machine end it all ok?
	if(!stacking_machine)
		return INITIALIZE_HINT_QDEL

	if(!GLOB.labor_sheet_values)
		var/sheet_list = list()
		for(var/sheet_type in subtypesof(/obj/item/stack/sheet))
			var/obj/item/stack/sheet/sheet = sheet_type
			if(!initial(sheet.point_value) || (initial(sheet.merge_type) && initial(sheet.merge_type) != sheet_type)) //ignore no-value sheets and x/fifty subtypes
				continue
			sheet_list += list(list("ore" = initial(sheet.name), "value" = initial(sheet.point_value)))
		GLOB.labor_sheet_values = sortList(sheet_list, /proc/cmp_sheet_list)

/obj/machinery/mineral/labor_claim_console/Destroy()
	QDEL_NULL(Radio)
	if(stacking_machine)
		stacking_machine.console = null
		stacking_machine = null
	return ..()

/proc/cmp_sheet_list(list/a, list/b)
	return a["value"] - b["value"]

/obj/machinery/mineral/labor_claim_console/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "LaborClaimConsole", name)
		ui.open()

/obj/machinery/mineral/labor_claim_console/ui_data(mob/user)
	var/list/data = list()
	var/can_go_home = FALSE

	data["emagged"] = (obj_flags & EMAGGED) ? 1 : 0
	if(obj_flags & EMAGGED)
		can_go_home = TRUE

	var/obj/item/card/id/I = user.get_idcard(TRUE)
	if(istype(I, /obj/item/card/id/prisoner))
		var/obj/item/card/id/prisoner/P = I
		data["id_points"] = P.points
		if(P.points >= P.goal)
			can_go_home = TRUE
			data["status_info"] = "Goal met!"
		else
			data["status_info"] = "You are [(P.goal - P.points)] points away."
	else
		data["status_info"] = "No Prisoner ID detected."
		data["id_points"] = 0

	if(stacking_machine)
		data["unclaimed_points"] = stacking_machine.points

	data["ores"] = GLOB.labor_sheet_values
	data["can_go_home"] = can_go_home

	return data

/obj/machinery/mineral/labor_claim_console/ui_act(action, params)
	. = ..()
	if(.)
		return
	switch(action)
		if("claim_points")
			var/mob/M = usr
			var/obj/item/card/id/I = M.get_idcard(TRUE)
			if(istype(I, /obj/item/card/id/prisoner))
				var/obj/item/card/id/prisoner/P = I
				P.points += stacking_machine.points
				stacking_machine.points = 0
				to_chat(usr, span_notice("Points transferred."))
				. = TRUE
			else
				to_chat(usr, span_alert("No valid id for point transfer detected."))

/obj/machinery/mineral/labor_claim_console/proc/locate_stacking_machine()
	stacking_machine = locate(/obj/machinery/mineral/stacking_machine, get_step(src, machinedir))
	if(stacking_machine)
		stacking_machine.console = src

/obj/machinery/mineral/labor_claim_console/emag_act(mob/user)
	if(!(obj_flags & EMAGGED))
		obj_flags |= EMAGGED
		to_chat(user, span_warning("PZZTTPFFFT"))

/**********************Prisoner Collection Unit**************************/

/obj/machinery/mineral/stacking_machine/laborstacker
	force_connect = TRUE
	var/points = 0 //The unclaimed value of ore stacked.
	damage_deflection = 21
/obj/machinery/mineral/stacking_machine/laborstacker/process_sheet(obj/item/stack/sheet/inp)
	points += inp.point_value * inp.amount
	..()

/obj/machinery/mineral/stacking_machine/laborstacker/attackby(obj/item/I, mob/living/user)
	if(istype(I, /obj/item/stack/sheet) && user.canUnEquip(I))
		var/obj/item/stack/sheet/inp = I
		points += inp.point_value * inp.amount
	return ..()

/**********************Point Lookup Console**************************/

/obj/machinery/mineral/labor_points_checker
	name = "points checking console"
	desc = "A console used by prisoners to check the progress on their quotas. Simply swipe a prisoner ID."
	icon = 'icons/obj/machines/mining_machines.dmi'
	icon_state = "console"
	density = FALSE

/obj/machinery/mineral/labor_points_checker/attack_hand(mob/user)
	. = ..()
	if(.)
		return
	user.examinate(src)

/obj/machinery/mineral/labor_points_checker/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/card/id))
		if(istype(I, /obj/item/card/id/prisoner))
			var/obj/item/card/id/prisoner/prisoner_id = I
			to_chat(user, span_notice("<B>ID: [prisoner_id.registered_name]</B>"))
			to_chat(user, span_notice("Points Collected:[prisoner_id.points]"))
			to_chat(user, span_notice("Point Quota: [prisoner_id.goal]"))
			to_chat(user, span_notice("Collect points by bringing smelted minerals to the Labor Shuttle stacking machine. Reach your quota to earn your release."))
		else
			to_chat(user, span_warning("Error: Invalid ID"))
	else
		return ..()
