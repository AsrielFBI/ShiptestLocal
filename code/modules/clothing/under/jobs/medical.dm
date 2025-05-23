/obj/item/clothing/under/rank/medical
	icon = 'icons/obj/clothing/under/medical.dmi'
	mob_overlay_icon = 'icons/mob/clothing/under/medical.dmi'
	supports_variations = DIGITIGRADE_VARIATION | VOX_VARIATION
	roll_down = TRUE

/obj/item/clothing/under/rank/medical/chief_medical_officer
	desc = "It's a jumpsuit worn by those with the experience to be \"Chief Medical Officer\". It provides minor biological protection."
	name = "chief medical officer's jumpsuit"
	icon_state = "cmo"
	item_state = "w_suit"
	permeability_coefficient = 0.5
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 10, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/under/rank/medical/chief_medical_officer/cybersun
	desc = "It's a jumpsuit worn by those with the experience to be a \"Medical Director\" for Cybersun. It provides minor biological protection."
	name = "medical director's jumpsuit"
	icon_state = "cybersun_md"
	item_state = "w_suit"
	icon = 'icons/obj/clothing/under/syndicate.dmi'
	mob_overlay_icon = 'icons/mob/clothing/under/syndicate.dmi'
	roll_down = FALSE
	supports_variations = DIGITIGRADE_VARIATION

/obj/item/clothing/under/rank/medical/chief_medical_officer/skirt
	name = "chief medical officer's jumpskirt"
	desc = "It's a jumpskirt worn by those with the experience to be \"Chief Medical Officer\". It provides minor biological protection."
	icon_state = "cmo_skirt"
	item_state = "w_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	roll_down = FALSE
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON | VOX_VARIATION

/obj/item/clothing/under/rank/medical/geneticist
	desc = "It's made of a special fiber that gives special protection against biohazards. It has a genetics rank stripe on it."
	name = "geneticist's jumpsuit"
	icon = 'icons/obj/clothing/under/rnd.dmi'
	mob_overlay_icon = 'icons/mob/clothing/under/rnd.dmi'
	icon_state = "genetics"
	item_state = "w_suit"
	permeability_coefficient = 0.5
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 10, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/under/rank/medical/geneticist/skirt
	name = "geneticist's jumpskirt"
	desc = "It's made of a special fiber that gives special protection against biohazards. It has a genetics rank stripe on it."
	icon_state = "geneticswhite_skirt"
	item_state = "w_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	roll_down = FALSE
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON | VOX_VARIATION

/obj/item/clothing/under/rank/medical/virologist
	desc = "It's made of a special fiber that gives special protection against biohazards. It has a virologist rank stripe on it."
	name = "virologist's jumpsuit"
	icon_state = "virology"
	item_state = "w_suit"
	permeability_coefficient = 0.5
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 10, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/under/rank/medical/virologist/skirt
	name = "virologist's jumpskirt"
	desc = "It's made of a special fiber that gives special protection against biohazards. It has a virologist rank stripe on it."
	icon_state = "virology_skirt"
	item_state = "w_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	roll_down = FALSE
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON | VOX_VARIATION

/obj/item/clothing/under/rank/medical/doctor/nurse
	desc = "It's a jumpsuit commonly worn by nursing staff in the medical department."
	name = "nurse's suit"
	icon_state = "nursesuit"
	item_state = "w_suit"
	permeability_coefficient = 0.5
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 10, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = CHEST|GROIN|ARMS
	roll_down = FALSE
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON | VOX_VARIATION

/obj/item/clothing/under/rank/medical/doctor
	desc = "It's made of a special fiber that provides minor protection against biohazards. It has a cross on the chest denoting that the wearer is trained medical personnel."
	name = "medical doctor's jumpsuit"
	icon_state = "medical"
	item_state = "w_suit"
	permeability_coefficient = 0.5
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 10, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/under/rank/medical/doctor/blue
	name = "medical scrubs"
	desc = "It's made of a special fiber that provides minor protection against biohazards. This one is in baby blue."
	icon_state = "scrubsblue"
	roll_down = FALSE

/obj/item/clothing/under/rank/medical/doctor/green
	name = "medical scrubs"
	desc = "It's made of a special fiber that provides minor protection against biohazards. This one is in dark green."
	icon_state = "scrubsgreen"
	roll_down = FALSE

/obj/item/clothing/under/rank/medical/doctor/purple
	name = "medical scrubs"
	desc = "It's made of a special fiber that provides minor protection against biohazards. This one is in deep purple."
	icon_state = "scrubspurple"
	roll_down = FALSE

/obj/item/clothing/under/rank/medical/doctor/red
	name = "medical scrubs"
	desc = "It's made of a special fiber that provides minor protection against biohazards. This one is in dark red."
	icon_state = "scrubsred"
	roll_down = FALSE

/obj/item/clothing/under/rank/medical/doctor/skirt
	name = "medical doctor's jumpskirt"
	desc = "It's made of a special fiber that provides minor protection against biohazards. It has a cross on the chest denoting that the wearer is trained medical personnel."
	icon_state = "medical_skirt"
	item_state = "w_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON | VOX_VARIATION

/obj/item/clothing/under/rank/medical/chemist
	desc = "It's made of a special fiber that gives special protection against biohazards. It has a chemist rank stripe on it."
	name = "chemist's jumpsuit"
	icon_state = "chemistry"
	item_state = "w_suit"
	permeability_coefficient = 0.5
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 10, "rad" = 0, "fire" = 50, "acid" = 65)

/obj/item/clothing/under/rank/medical/chemist/skirt
	name = "chemist's jumpskirt"
	desc = "It's made of a special fiber that gives special protection against biohazards. It has a chemist rank stripe on it."
	icon_state = "chemistrywhite_skirt"
	item_state = "w_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON | VOX_VARIATION

/obj/item/clothing/under/rank/medical/paramedic
	desc = "It's made of a special fiber that provides minor protection against biohazards. It has a dark blue cross on the chest denoting that the wearer is a trained paramedic."
	name = "paramedic jumpsuit"
	icon_state = "pmedic"
	item_state = "w_suit"
	permeability_coefficient = 0.5
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 10, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/under/rank/medical/paramedic/skirt
	name = "paramedic jumpskirt"
	desc = "It's made of a special fiber that provides minor protection against biohazards. It has a dark blue cross on the chest denoting that the wearer is a trained paramedic."
	icon_state = "pmedic_skirt"
	item_state = "w_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON | VOX_VARIATION

/obj/item/clothing/under/rank/medical/psychiatrist
	name = "white psychiatrist's suit"
	desc = "A turtleneck for personnel trained to deal with psychological issues, such as terrible work place incidents or the clown's bad jokes. This one has a white turtleneck."
	icon_state = "psychiatrist-white"
	roll_down = FALSE
	permeability_coefficient = 0.5
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 10, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/under/rank/medical/paramedic/emt
	name = "emergency medical technician jumpsuit"
	desc = "It's made of a special fiber that provides minor protection against biohazards. It has shorts, allowing ease of movement for EMTs."
	icon_state = "emt"
	body_parts_covered = CHEST|GROIN|ARMS

/obj/item/clothing/under/rank/medical/paramedic/emt/skirt
	name = "emergency medical technician jumpskirt"
	desc = "It's made of a special fiber that provides minor protection against biohazards."
	icon_state = "emt_skirt"
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON | VOX_VARIATION

/obj/item/clothing/under/rank/medical/gown //Clothing for medical ships
	name = "patient gown"
	desc = "A light white gown that allows easy access to any patient who wears this."
	icon_state = "gownwhite"
	item_state = "gownwhite"
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON | VOX_VARIATION
	roll_down = FALSE

/obj/item/clothing/under/rank/medical/gown/green
	desc = "A mint green gown that allows medics to save time."
	icon_state = "gowngreen"
	item_state = "gowngreen"

/obj/item/clothing/under/rank/medical/gown/blue
	desc = "A baby blue gown medics give to their patients. For when the patient wants to be EXTRA manly."
	icon_state = "gownblue"
	item_state = "gownblue"

/obj/item/clothing/under/rank/medical/gown/pink
	desc = "Hospital grade pink garments. For when the patient wants to feel pretty in pink."
	icon_state = "gownpink"
	icon_state = "gownpink"
