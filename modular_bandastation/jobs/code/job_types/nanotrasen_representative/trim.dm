/datum/id_trim/job/nanotrasen_representative
	assignment = JOB_NANOTRASEN_REPRESENTATIVE
	trim_icon = 'modular_bandastation/jobs/icons/obj/card.dmi'
	trim_state = "trim_nanotrasen_representative"
	department_color = COLOR_CENTCOM_BLUE
	subdepartment_color = "#FFD700"
	sechud_icon_state = SECHUD_NANOTRASEN_REPRESENTATIVE
	minimal_access = list(
		ACCESS_AI_UPLOAD,
		ACCESS_ALL_PERSONAL_LOCKERS,
		ACCESS_AUX_BASE,
		ACCESS_BAR,
		ACCESS_BRIG_ENTRANCE,
		ACCESS_CARGO,
		ACCESS_CHAPEL_OFFICE,
		ACCESS_CHANGE_IDS,
		ACCESS_CREMATORIUM,
		ACCESS_COMMAND,
		ACCESS_COURT,
		ACCESS_ENGINEERING,
		ACCESS_EVA,
		ACCESS_GATEWAY,
		ACCESS_HYDROPONICS,
		ACCESS_JANITOR,
		ACCESS_KEYCARD_AUTH,
		ACCESS_KITCHEN,
		ACCESS_LAWYER,
		ACCESS_LIBRARY,
		ACCESS_MAINT_TUNNELS,
		ACCESS_MEDICAL,
		ACCESS_MINERAL_STOREROOM,
		ACCESS_MORGUE,
		ACCESS_MORGUE_SECURE,
		ACCESS_NANOTRASEN_REPRESENTATIVE,
		ACCESS_PSYCHOLOGY,
		ACCESS_RC_ANNOUNCE,
		ACCESS_SCIENCE,
		ACCESS_SERVICE,
		ACCESS_TELEPORTER,
		ACCESS_THEATRE,
		ACCESS_WEAPONS,
	)
	template_access = list(
		ACCESS_CAPTAIN,
		ACCESS_CHANGE_IDS
	)
	job = /datum/job/nanotrasen_representative
	big_pointer = TRUE
	pointer_color = COLOR_CENTCOM_BLUE
