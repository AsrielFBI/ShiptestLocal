/obj/item/circuitboard/machine/ltsrbt
	name = "LTSRBT (Machine Board)"
	icon_state = "bluespacearray"
	build_path = /obj/machinery/ltsrbt
	req_components = list(
		/obj/item/stock_parts/micro_laser = 1,
		/obj/item/stock_parts/scanning_module = 2)

/obj/machinery/ltsrbt
	name = "Long-To-Short-Range-Bluespace-Transciever"
	desc = "The LTSRBT is a compact teleportation machine for recieving and sending items across extreme distances and through reasonable interference.\nUsing teleportation frequencies stolen from NT it is near undetectable.\nEssential for any illegal market operations or off-the-book frontier settlements.\n"
	icon_state = "exonet_node"
	circuit = /obj/item/circuitboard/machine/ltsrbt
	density = TRUE

	idle_power_usage = IDLE_DRAW_LOW

	/// Divider for power_usage_per_teleport.
	var/power_efficiency = 1
	/// Power used per teleported which gets divided by power_efficiency.
	var/power_usage_per_teleport = 10000
	/// The time it takes for the machine to recharge before being able to send or recieve items.
	var/recharge_time = 0
	/// Current recharge progress.
	var/recharge_cooldown = 0
	/// Base recharge time which is used to get recharge_time.
	var/base_recharge_time = 20
	/// Current /datum/blackmarket_purchase being recieved.
	var/recieving
	/// Current /datum/blackmarket_purchase being sent to the target uplink.
	var/transmitting
	/// Queue for purchases that the machine should recieve and send.
	var/list/datum/blackmarket_purchase/queue = list()

/obj/machinery/ltsrbt/Initialize()
	. = ..()

/obj/machinery/ltsrbt/Destroy()
	// Bye bye orders.
	if(SSblackmarket.telepads.len)
		for(var/datum/blackmarket_purchase/P in queue)
			SSblackmarket.queue_item(P)
	. = ..()

/obj/machinery/ltsrbt/RefreshParts()
	recharge_time = base_recharge_time
	// On tier 4 recharge_time should be 2 and by default it is 8 as scanning modules should be tier 1.
	for(var/obj/item/stock_parts/scanning_module/scan in component_parts)
		recharge_time -= scan.rating
	recharge_cooldown = recharge_time

	power_efficiency = 0
	for(var/obj/item/stock_parts/micro_laser/laser in component_parts)
		power_efficiency += laser.rating
	// Shouldn't happen but you never know.
	if(!power_efficiency)
		power_efficiency = 1

/// Stores the LTSRBT Data in the uplink for linking
/obj/machinery/ltsrbt/attackby(obj/item/O, mob/user, params)
	if(istype(O, /obj/item/blackmarket_uplink))
		var/obj/item/blackmarket_uplink/uplink = O
		uplink.target = src
		to_chat(user, span_notice("[src] linked to [O]."))
		return TRUE

	return ..()

/// Adds /datum/blackmarket_purchase to queue unless the machine is free, then it sets the purchase to be instantly recieved
/obj/machinery/ltsrbt/proc/add_to_queue(datum/blackmarket_purchase/purchase)
	if(!recharge_cooldown && !recieving && !transmitting)
		recieving = purchase
		return
	queue += purchase

/obj/machinery/ltsrbt/process(seconds_per_tick)
	if(machine_stat & NOPOWER)
		return

	if(recharge_cooldown > 0)
		recharge_cooldown -= seconds_per_tick
		return

	var/turf/T = get_turf(src)
	if(recieving)
		var/datum/blackmarket_purchase/P = recieving

		if(!P.item || ispath(P.item))
			P.item = P.entry.spawn_item(T)
		else
			var/atom/movable/M = P.item
			M.forceMove(T)

		use_power(power_usage_per_teleport / power_efficiency)
		var/datum/effect_system/spark_spread/sparks = new
		sparks.set_up(5, 1, get_turf(src))
		sparks.attach(P.item)
		sparks.start()

		recieving = null
		transmitting = P

		recharge_cooldown = recharge_time
		return
	else if(transmitting)
		var/datum/blackmarket_purchase/P = transmitting
		if(!P.item)
			QDEL_NULL(transmitting)
		if(!(P.item in T.contents))
			QDEL_NULL(transmitting)
			return
		do_teleport(P.item, get_turf(P.uplink))
		use_power(power_usage_per_teleport / power_efficiency)
		QDEL_NULL(transmitting)

		recharge_cooldown = recharge_time
		return

	if(queue.len)
		recieving = pick_n_take(queue)

/datum/crafting_recipe/blackmarket_telepad
	name = "Black Market LTRSBT Board"
	result = /obj/item/circuitboard/machine/ltsrbt
	time = 30
	tools = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER, TOOL_MULTITOOL)
	reqs = list(
		/obj/item/stack/ore/bluespace_crystal = 2,
		/obj/item/stack/tape/industrial = 5,
		/obj/item/card/bank = 1,
		/obj/item/computer_hardware/network_card = 1,
		/obj/item/circuitboard = 1
	)
	category = CAT_MISC
