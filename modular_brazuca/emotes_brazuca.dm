/datum/emote/bandoleira
	key = "bandoleira" //What calls the emote
	key_third_person = "band" //This will also call the emote
	message = "Ta sem bandoleira?" //Message displayed when emote is used
	message_alien = "Ta sem bandoleira?" //Message displayed if the user is a grown alien
	message_larva = "Ta sem bandoleira?" //Message displayed if the user is an alien larva
	message_AI = "" //Message displayed if the user is an AI
	message_monkey = "" //Message displayed if the user is a monkey
	message_simple = "" //Message to display if the user is a simple_animal
	message_param = "" //Message to display if a param was given
	emote_type = EMOTE_VISIBLE //Whether the emote is visible or audible
	list/mob_type_allowed_typecache = /mob //Types that are allowed to use that emote
	list/mob_type_blacklist_typecache //Types that are NOT allowed to use that emote
	list/mob_type_ignore_stat_typecache
	stat_allowed = CONSCIOUS
	sound = 'modular_brazuca/sounds/bandoleira.ogg'
	flags_emote = NONE
	/// Cooldown between two uses of that emote. Every emote has its own coodldown
	cooldown = 2 SECONDS

/datum/emote/dedo
	key = "dedo" //What calls the emote
	key_third_person = "dedo" //This will also call the emote
	message = "Senta o dedo nessa porra" //Message displayed when emote is used
	message_alien = "Senta o dedo nessa porra" //Message displayed if the user is a grown alien
	message_larva = "Senta o dedo nessa porra" //Message displayed if the user is an alien larva
	message_AI = "" //Message displayed if the user is an AI
	message_monkey = "" //Message displayed if the user is a monkey
	message_simple = "" //Message to display if the user is a simple_animal
	message_param = "" //Message to display if a param was given
	emote_type = EMOTE_VISIBLE //Whether the emote is visible or audible
	list/mob_type_allowed_typecache = /mob //Types that are allowed to use that emote
	list/mob_type_blacklist_typecache //Types that are NOT allowed to use that emote
	list/mob_type_ignore_stat_typecache
	stat_allowed = CONSCIOUS
	sound = 'modular_brazuca/sounds/dedo.ogg'
	flags_emote = NONE
	/// Cooldown between two uses of that emote. Every emote has its own coodldown
	cooldown = 2 SECONDS

/datum/emote/papa
	key = "papa" //What calls the emote
	key_third_person = "papa" //This will also call the emote
	message = "Bota na conta do papa" //Message displayed when emote is used
	message_alien = "Bota na conta do papa" //Message displayed if the user is a grown alien
	message_larva = "Bota na conta do papa" //Message displayed if the user is an alien larva
	message_AI = "" //Message displayed if the user is an AI
	message_monkey = "" //Message displayed if the user is a monkey
	message_simple = "" //Message to display if the user is a simple_animal
	message_param = "" //Message to display if a param was given
	emote_type = EMOTE_VISIBLE //Whether the emote is visible or audible
	list/mob_type_allowed_typecache = /mob //Types that are allowed to use that emote
	list/mob_type_blacklist_typecache //Types that are NOT allowed to use that emote
	list/mob_type_ignore_stat_typecache
	stat_allowed = CONSCIOUS
	sound = 'modular_brazuca/sounds/papa.ogg'
	flags_emote = NONE
	/// Cooldown between two uses of that emote. Every emote has its own coodldown
	cooldown = 2 SECONDS