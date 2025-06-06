/obj/item/virgin_mary
	name = "\proper a picture of the virgin mary"
	desc = "A small, cheap icon depicting the virgin mother."
	icon = 'icons/obj/devices/blackmarket.dmi'
	icon_state = "madonna"
	resistance_flags = FLAMMABLE
	///Has this item been used already.
	var/used_up = FALSE

/obj/item/virgin_mary/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/burn_on_item_ignition, bypass_clumsy = TRUE)
	RegisterSignal(src, COMSIG_ATOM_IGNITED_BY_ITEM, PROC_REF(induct_new_initiate))

#define NICKNAME_CAP (MAX_NAME_LEN/2)

/obj/item/virgin_mary/proc/induct_new_initiate(datum/source, mob/living/user, obj/item/burning_tool)
	SIGNAL_HANDLER

	INVOKE_ASYNC(src, PROC_REF(induct_new_initiate_async), user, burning_tool)

/obj/item/virgin_mary/proc/induct_new_initiate_async(mob/living/user, obj/item/burning_tool)
	if(isnull(user.mind))
		return
	if(HAS_TRAIT(user, TRAIT_MAFIAINITIATE)) //Only one nickname fuckhead
		to_chat(user, span_warning("You have already been initiated into the mafioso life."))
		return
	if(used_up)
		return

	ADD_TRAIT(user, TRAIT_MAFIAINITIATE, TRAIT_GENERIC) // Adding the trait early because you could burn multiple at once for a very long name
	to_chat(user, span_notice("As you burn the picture, a nickname comes to mind..."))
	var/nickname = tgui_input_text(user, "Pick a nickname", "Mafioso Nicknames", max_length = NICKNAME_CAP)
	nickname = reject_bad_name(nickname, allow_numbers = FALSE, max_length = NICKNAME_CAP, ascii_only = TRUE)
	if(!nickname)
		REMOVE_TRAIT(user, TRAIT_MAFIAINITIATE, TRAIT_GENERIC)
		return
	var/new_name
	var/space_position = findtext(user.real_name, " ")
	if(space_position)//Can we find a space?
		new_name = "[copytext(user.real_name, 1, space_position)] \"[nickname]\" [copytext(user.real_name, space_position)]"
	else //Append otherwise
		new_name = "[user.real_name] \"[nickname]\""
	user.real_name = new_name
	used_up = TRUE
	user.say("Как горит этот святой, так будет гореть и моя душа. Я вхожу живым, и мне придётся выйти мертвым.", forced = /obj/item/virgin_mary)
	to_chat(user, span_userdanger("Being inducted into the mafia does not grant antagonist status."))

#undef NICKNAME_CAP

/obj/item/virgin_mary/suicide_act(mob/living/user)
	user.visible_message(span_suicide("[user] starts saying their Hail Mary's at a terrifying pace! It looks like [user.p_theyre()] trying to enter the afterlife!"))
	user.say("Радуйся, Мария, благодати полная! Господь с Тобою. Благословенна Ты между жёнами, и благословен плод чрева Твоего Иисус. Святая Мария, Матерь Божия, молись о нас, грешных, ныне и в час смерти нашей. Аминь.", forced = /obj/item/virgin_mary)
	addtimer(CALLBACK(src, PROC_REF(manual_suicide), user), 7.5 SECONDS)
	addtimer(CALLBACK(user, TYPE_PROC_REF(/atom/movable, say), "О Матерь моя, сохрани меня в этот день от смертного греха..."), 5 SECONDS)
	return MANUAL_SUICIDE

/obj/item/virgin_mary/proc/manual_suicide(mob/living/user)
	user.adjustOxyLoss(200)
	user.death(FALSE)
