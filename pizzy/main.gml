gml
with(obj_player)
{
	character = "PZ";
	spr_suplexdash = sprite_add("sprites/spr_pizzelle_suplexdash.png", 10, false, false, 50, 50)
	sprite_set_speed(spr_suplexdash,60,60)
	spr_suplexdashjump = sprite_add("sprites/spr_pizzelle_suplexdashjumpstart.png", 2, false, false, 80, 50)
	sprite_set_speed(spr_suplexdashjump,60,60)
	spr_suplexdashjumpstart = sprite_add("sprites/spr_pizzelle_airstart.png", 7, false, false, 50, 50)
	sprite_set_speed(spr_suplexdash,60,60)
	global.suplexdashjumploop = sprite_add("sprites/spr_pizzelle_suplexdashjump.png", 3, false, false, 80, 50)
	sprite_set_speed(global.suplexdashjumploop,60,60)
	spr_idle = sprite_add("sprites/spr_pizzelle_idle.png", 33, false, false, 50, 50)
	sprite_set_speed(spr_idle,60,60)
	spr_idle1 = sprite_add("sprites/spr_pizzelle_idle1.png", 69, false, false, 50, 50)
	sprite_set_speed(spr_idle1,60,60)
	spr_idle2 = sprite_add("sprites/spr_pizzelle_idle2.png", 47, false, false, 50, 50)
	sprite_set_speed(spr_idle2,60,60)
	spr_idle3 = sprite_add("sprites/spr_pizzelle_idle3.png", 36, false, false, 50, 50)
	sprite_set_speed(spr_idle3,60,60)
	spr_idle4 = sprite_add("sprites/spr_pizzelle_idle4.png", 39, false, false, 50, 50)
	sprite_set_speed(spr_idle4,60,60)
	spr_idle5 = sprite_add("sprites/spr_pizzelle_idle5.png", 23, false, false, 50, 50)
	sprite_set_speed(spr_idle5,60,60)
	spr_idle6 = sprite_add("sprites/spr_pizzelle_idle6.png", 34, false, false, 50, 50)
	sprite_set_speed(spr_idle6,60,60)
	tauntsound = audio_create_stream("sfx/TauntLonger.ogg");
	spr_taunt = sprite_add("sprites/spr_pizzelle_taunt.png", 12, false, false, 85, 50)
	sprite_set_speed(spr_taunt,0,0)
	spr_mach1 = sprite_add("sprites/spr_pizzelle_mach1.png", 7, false, false, 56, 50)
	sprite_set_speed(spr_mach1,60,60)
	spr_mach = sprite_add("sprites/spr_pizzelle_mach2.png", 3, false, false, 61.5, 50)
	sprite_set_speed(spr_mach,60,60)
	spr_mach4 = sprite_add("sprites/spr_pizzelle_mach3.png", 4, false, false, 61.5, 50)
	sprite_set_speed(spr_mach4,60,60)
	global.mach1snd = audio_create_stream("sfx/pz_mach1.ogg");
	global.mach2snd = audio_create_stream("sfx/pz_mach2.ogg");
	global.mach3snd = audio_create_stream("sfx/pz_mach3.ogg");
	global.mach4snd = audio_create_stream("sfx/pz_mach4.ogg");
	sfx_mach1snd = global.mach1snd;
	sfx_mach2snd = global.mach2snd;
	sfx_mach3snd = global.mach3snd;
	sfx_mach4snd = global.mach4snd;
	spr_crazyrun = sprite_add("sprites/spr_pizzelle_crazyrun.png", 5, false, false, 100, 50)
	sprite_set_speed(spr_crazyrun,60,60)
	spr_mach3boost = sprite_add("sprites/spr_pizzelle_mach3boost.png", 15, false, false, 61.5, 50)
	sprite_set_speed(spr_mach3boost,60,60)
	spr_machclimbwall = sprite_add("sprites/spr_pizzelle_machclimbwall2.png", 5, false, false, 61.5, 85)
	sprite_set_speed(spr_machclimbwall,60,60)
	global.machclimbwall3 = sprite_add("sprites/spr_pizzelle_machclimbwall3.png", 4, false, false, 61.5, 85)
	sprite_set_speed(global.machclimbwall3,60,60)
	global.machslideboost = audio_create_stream("sfx/pz_machdrift-converted.ogg");
	global.walljumpcancel = sprite_add("sprites/spr_pizzelle_walljumpcancel.png", 3, false, false, 67.5, 62.5)
	sprite_set_speed(global.walljumpcancel,60,60)
	global.walljumpcancelstart = sprite_add("sprites/spr_pizzelle_walljumpcancelstart.png", 5, false, false, 67.5, 62.5)
	sprite_set_speed(global.walljumpcancelstart,60,60)
	global.walljumpstart = sprite_add("sprites/spr_pizzelle_walljumpstart.png", 5, false, false, 72.5, 62.5)
	sprite_set_speed(global.walljumpstart,60,60)
	global.walljumpend = sprite_add("sprites/spr_pizzelle_walljumpend.png", 4, false, false, 67.5, 57.5)
	sprite_set_speed(global.walljumpend,60,60)
	global.walljumpfastfallstart = sprite_add("sprites/spr_pizzelle_walljumpfastfallstart.png", 4, false, false, 67.5, 57.5)
	sprite_set_speed(global.walljumpfastfallstart,60,60)
	global.walljumpfastfall = sprite_add("sprites/spr_pizzelle_walljumpfastfall.png", 3, false, false, 67.5, 57.5)
	sprite_set_speed(global.walljumpfastfall,60,60)
	savedmove = 1;
	spr_backslide = sprite_add("sprites/spr_pizzelle_backslide.png", 8, false, false, 68.5, 50)
	sprite_set_speed(spr_backslide,60,60)
	spr_backslideland = sprite_add("sprites/spr_pizzelle_backslideland.png", 6, false, false, 68.5, 50)
	sprite_set_speed(spr_backslideland,60,60)
	spr_rollgetup = sprite_add("sprites/spr_pizzelle_rollgetup.png", 9, false, false, 70, 52.5)
	sprite_set_speed(spr_rollgetup,60,60)
	spr_machroll = sprite_add("sprites/spr_pizzelle_machroll.png", 4, false, false, 62.5, 50)
	sprite_set_speed(spr_machroll,60,60)
	spr_jump = sprite_add("sprites/spr_pizzelle_jump.png", 8, false, false, 50, 50)
	sprite_set_speed(spr_jump,60,60)
	spr_fall = sprite_add("sprites/spr_pizzelle_fall.png", 3, false, false, 50, 50)
	sprite_set_speed(spr_fall,60,60)
	spr_land = sprite_add("sprites/spr_pizzelle_land.png", 6, false, false, 50, 50)
	sprite_set_speed(spr_land,60,60)
	spr_land2 = sprite_add("sprites/spr_pizzelle_land2.png", 6, false, false, 50, 50)
	sprite_set_speed(spr_land2,60,60)
	spr_walkfront = sprite_add("sprites/spr_pizzelle_walkfront.png", 18, false, false, 50, 50)
	sprite_set_speed(spr_walkfront,60,60)
	spr_Timesup = sprite_add("sprites/spr_pizzelle_timesup.png", 17, false, false, 50, 50)
	sprite_set_speed(spr_Timesup,60,60)
	_spr_tv_exprcollect = sprite_add("sprites/spr_tv_exprcollect.png", 12, false, false, 139, 134)
	sprite_set_speed(_spr_tv_exprcollect,60,60)
	_spr_tv_exprcombo = sprite_add("sprites/spr_tv_exprcombo.png", 78, false, false, 139, 134)
	sprite_set_speed(_spr_tv_exprcombo,60,60)
	_spr_tv_empty = sprite_add("sprites/spr_tv_empty.png", 1, false, false, 139, 134)
	_spr_tv_exprhurt = sprite_add("sprites/spr_tv_exprhurt.png", 6, false, false, 139, 134)
	sprite_set_speed(_spr_tv_exprhurt,60,60)
	_spr_tv_exprmach3 = sprite_add("sprites/spr_tv_exprmach3.png", 3, false, false, 139, 134)
	sprite_set_speed(_spr_tv_exprmach3,60,60)
	_spr_tv_exprmach4 = sprite_add("sprites/spr_tv_exprmach4.png", 3, false, false, 139, 134)
	sprite_set_speed(_spr_tv_exprmach4,60,60)
	_spr_tv_idle = sprite_add("sprites/spr_tv_idle.png", 3, false, false, 139, 134)
	sprite_set_speed(_spr_tv_idle,60,60)
	_spr_tv_idleanim1 = sprite_add("sprites/spr_tv_idleanim1.png", 33, false, false, 139, 134)
	sprite_set_speed(_spr_tv_idleanim1,60,60)
	_spr_tv_idleanim2 = sprite_add("sprites/spr_tv_idleanim2.png", 25, false, false, 139, 134)
	sprite_set_speed(_spr_tv_idleanim2,60,60)
	_spr_tv_off = sprite_add("sprites/spr_tv_off.png", 1, false, false, 139, 134)
	_spr_tv_open = sprite_add("sprites/spr_tv_open.png", 18, false, false, 139, 134)
	sprite_set_speed(_spr_tv_open,60,60)
	_spr_tv_whitenoise = sprite_add("sprites/spr_tv_whitenoise.png", 5, false, false, 139, 134)
	sprite_set_speed(_spr_tv_whitenoise,60,60)
	global.entryway = audio_create_stream("music/entryway_NEW.ogg");
	global.entrywaysecret = audio_create_stream("music/mu_wafflesecret.ogg");
	spr_dive = sprite_add("sprites/spr_pizzelle_dive.png", 3, false, false, 50, 50)
	sprite_set_speed(spr_dive,60,60)
	spr_crouchslip = sprite_add("sprites/spr_pizzelle_crouchslip.png", 3, false, false, 50, 50)
	sprite_set_speed(spr_crouchslip,60,60)
	spr_bodyslamstart = sprite_add("sprites/spr_pizzelle_bodyslamstart.png", 9, false, false, 72, 83)
	sprite_set_speed(spr_bodyslamstart,60,60)
	spr_bodyslamfall = sprite_add("sprites/spr_pizzelle_bodyslamfall.png", 3, false, false, 56, 75)
	sprite_set_speed(spr_bodyslamfall,60,60)
	spr_bodyslamland = sprite_add("sprites/spr_pizzelle_bodyslamland.png", 4, false, false, 56, 75)
	sprite_set_speed(spr_bodyslamland,60,60)
	spr_crouch = sprite_add("sprites/spr_pizzelle_crouch.png", 24, false, false, 50, 50)
	sprite_set_speed(spr_crouch,60,60)
	spr_crouchfall = sprite_add("sprites/spr_pizzelle_crouchfall.png", 3, false, false, 50, 50)
	sprite_set_speed(spr_crouchfall,60,60)
	spr_crouchjump = sprite_add("sprites/spr_pizzelle_crouchjump.png", 3, false, false, 50, 50)
	sprite_set_speed(spr_crouchjump,60,60)
	spr_facehurtup = sprite_add("sprites/spr_pizzelle_facehurtup.png", 23, false, false, 56, 75)
	sprite_set_speed(spr_facehurtup,60,60)
	spr_facehurt = sprite_add("sprites/spr_pizzelle_facehurt.png", 10, false, false, 56, 67)
	sprite_set_speed(spr_facehurt,60,60)
	spr_hitwall = sprite_add("sprites/spr_pizzelle_hitwall.png", 13, false, false, 59, 50)
	sprite_set_speed(spr_hitwall,60,60)
	spr_machslideboost = sprite_add("sprites/spr_pizzelle_machslideboost.png", 13, false, false, 61.5, 50)
	sprite_set_speed(spr_machslideboost,60,60)
	spr_machslidestart = sprite_add("sprites/spr_pizzelle_machslidestart.png", 3, false, false, 50, 50)
	sprite_set_speed(spr_machslidestart,60,60)
	spr_machslide = sprite_add("sprites/spr_pizzelle_machslide.png", 3, false, false, 50, 50)
	sprite_set_speed(spr_machslide,60,60)
	spr_machslideend = sprite_add("sprites/spr_pizzelle_machslideend.png", 6, false, false, 50, 50)
	sprite_set_speed(spr_machslideend,60,60)
	spr_move = sprite_add("sprites/spr_pizzelle_move.png", 12, false, false, 50, 50)
	sprite_set_speed(spr_move,60,60)
	global.poundcancelstart = sprite_add("sprites/spr_pizzelle_poundcancelstart.png", 9, false, false, 50, 50)
	sprite_set_speed(global.poundcancelstart,60,60)
	spr_poundcancel1 = sprite_add("sprites/spr_pizzelle_poundcancel1.png", 3, false, false, 50, 50)
	sprite_set_speed(spr_poundcancel1,60,60)
	spr_poundcancel2 = sprite_add("sprites/spr_pizzelle_poundcancel2.png", 5, false, false, 50, 50)
	sprite_set_speed(spr_poundcancel2,60,60)
	spr_superjump = sprite_add("sprites/spr_pizzelle_superjump.png", 6, false, false, 50, 75)
	sprite_set_speed(spr_superjump,60,60)
	spr_superjumpland = sprite_add("sprites/spr_pizzelle_superjumpland.png", 8, false, false, 50, 50)
	sprite_set_speed(spr_superjumpland,60,60)
	spr_superjumpleft = sprite_add("sprites/spr_pizzelle_superjumpleft.png", 8, false, false, 50, 50)
	sprite_set_speed(spr_superjumpleft,60,60)
	spr_superjumpright = sprite_add("sprites/spr_pizzelle_superjumpright.png", 8, false, false, 50, 50)
	sprite_set_speed(spr_superjumpright,60,60)
	spr_superjumpprep = sprite_add("sprites/spr_pizzelle_superjumpprep.png", 6, false, false, 50, 50)
	sprite_set_speed(spr_superjumpprep,60,60)
	spr_superjumppreplight = sprite_add("sprites/spr_pizzelle_superjumppreplight.png", 2, false, false, 50, 50)
	sprite_set_speed(spr_superjumppreplight,60,60)
	spr_mach3hit = sprite_add("sprites/spr_pizzelle_mach3hit.png", 7, false, false, 78, 50)
	sprite_set_speed(spr_mach3hit,60,60)
	spr_mach3jump = sprite_add("sprites/spr_pizzelle_mach3jump.png", 9, false, false, 72, 66)
	sprite_set_speed(spr_mach3jump,60,60)
	spr_couchstart = sprite_add("sprites/spr_pizzelle_couchstart.png", 3, false, false, 50, 50)
	sprite_set_speed(spr_couchstart,60,60)
	floatygrab = 0;
	global.faceplant = sprite_add("sprites/spr_pizzelle_faceplant.png", 10, false, false, 62.5, 50)
	sprite_set_speed(global.faceplant,60,60)
	spr_longjump = sprite_add("sprites/spr_pizzelle_longjump.png", 12, false, false, 63, 50)
	sprite_set_speed(spr_longjump,60,60)
	spr_longjumpend = sprite_add("sprites/spr_pizzelle_longjumpend.png", 2, false, false, 63, 50)
	sprite_set_speed(spr_longjumpend,60,60)
	spr_suplexcancel = sprite_add("sprites/spr_pizzelle_suplexcancel.png", 7, false, false, 80, 50)
	sprite_set_speed(spr_suplexcancel,60,60)
	spr_secondjump1 = sprite_add("sprites/spr_pizzelle_secondjump1.png", 6, false, false, 64, 52.5)
	sprite_set_speed(spr_secondjump1,60,60)
	spr_secondjump2 = sprite_add("sprites/spr_pizzelle_secondjump2.png", 3, false, false, 64, 52.5)
	sprite_set_speed(spr_secondjump2,60,60)
	spr_mach2jump = sprite_add("sprites/spr_pizzelle_mach2jump.png", 7, false, false, 50, 50)
	sprite_set_speed(spr_mach2jump,60,60)
	spr_hurtwalk = spr_move;
	spr_haulingidle = sprite_add("sprites/spr_pizzelle_haulingidle.png", 10, false, false, 50, 50)
	sprite_set_speed(spr_haulingidle,60,60)
	spr_haulingjump = sprite_add("sprites/spr_pizzelle_haulingjump.png", 4, false, false, 50, 50)
	sprite_set_speed(spr_haulingjump,60,60)
	spr_haulingland = sprite_add("sprites/spr_pizzelle_haulingland.png", 4, false, false, 50, 50)
	sprite_set_speed(spr_haulingland,60,60)
	spr_haulingstart = sprite_add("sprites/spr_pizzelle_haulingstart.png", 5, false, false, 50, 50)
	sprite_set_speed(spr_haulingstart,60,60)
	spr_haulingwalk = sprite_add("sprites/spr_pizzelle_haulingwalk.png", 13, false, false, 50, 50)
	sprite_set_speed(spr_haulingwalk,60,60)
	spr_haulingfall = sprite_add("sprites/spr_pizzelle_haulingfall.png", 3, false, false, 50, 50)
	sprite_set_speed(spr_haulingfall,60,60)
	global.boomboxsong = audio_create_stream("music/boombox.ogg");
	global.pz_jump = audio_create_stream("sfx/pz_jump.ogg");
	global.sfx_wallkick = audio_create_stream("sfx/sfx_wallkick.ogg");
	global.sfx_wallkickloop = audio_create_stream("sfx/sfx_wallkickloop.ogg");
	global.sfx_wallkickcancel = audio_create_stream("sfx/sfx_wallkickcancel.ogg");
	spr_breakdanceuppercut = sprite_add("sprites/spr_pizzelle_breakdanceuppercut.png", 13, false, false, 86.5, 86)
	sprite_set_speed(spr_breakdanceuppercut,60,60)
	spr_breakdanceuppercutend = sprite_add("sprites/spr_pizzelle_breakdanceuppercutend.png", 3, false, false, 86.5, 86)
	sprite_set_speed(spr_breakdanceuppercutend,60,60)
	spr_breakdance = sprite_add("sprites/spr_pizzelle_breakdance.png", 60, false, false, 50, 50)
	sprite_set_speed(spr_breakdance,60,60)
}
sprite_replace(spr_pizzascore, "sprites/spr_pizzascore.png", 1, false, false, 135.5, 87.5);
sprite_replace(spr_exitgate, "sprites/spr_exitgate_ss.png", 2, false, false, 73, 189);
sprite_replace(spr_font, "sprites/spr_font.png", 39, false, false, 16, 16);
sprite_replace(spr_font_collect, "sprites/spr_font_collect.png", 10, false, false, 20, 26.5);
sprite_replace(spr_pizzascore_pepper, "sprites/spr_cranktopping.png", 1, false, false, 67.75, 33);
sprite_replace(spr_pizzascore_pepperoni, "sprites/spr_branktopping.png", 1, false, false, 67.75, 33);
sprite_replace(spr_pizzascore_olive, "sprites/spr_aranktopping.png", 1, false, false, 67.75, 33);
sprite_replace(spr_pizzascore_shroom, "sprites/spr_sranktopping.png", 1, false, false, 67.75, 33);
sprite_replace(spr_beatbox, "sprites/spr_beatbox.png", 1, false, false, 50, 50);
with(obj_music)
{
	room_arr = 
	[
		[Realtitlescreen, mu_title, mu_medievalsecret, false], 
		[rm_levelselect, mu_title, mu_medievalsecret, false], 
		[entrance_1, global.entryway, global.entrywaysecret, false], 
		[dungeon_1, mu_dungeon, mu_dungeonsecret, false], 
		[dungeon_8, mu_dungeon, mu_dungeonsecret, true], 
		[dungeon_9, mu_dungeondepth, mu_dungeonsecret, true],
		[strongcold_1, mu_chateau, mu_medievalsecret, false], 
		[strongcold_2, mu_strongcold, mu_medievalsecret, false], 
		[strongcold_8, mu_strongcold, mu_medievalsecret, false], 
		[strongcold_9, mu_dungeondepth, mu_medievalsecret, false], 
		[strongcold_10, mu_dungeondepth, mu_medievalsecret, false], 
		[medieval_1, mu_medievalentrance, mu_medievalsecret, false], 
		[medieval_2, mu_medievalentrance, mu_medievalsecret, true], 
		[medieval_3, mu_medievalremix, mu_medievalsecret, true], 
		[medieval_5, mu_medievalremix, mu_medievalsecret, true], 
		[medieval_6, mu_medieval, mu_medievalsecret, true],
		[ruin_1, mu_ruin, mu_ruinsecret, false], 
		[ruin_6, mu_ruin, mu_ruinsecret, true], 
		[ruin_7, mu_ruinremix, mu_ruinsecret, true],
		[badland_1, mu_desert, mu_desertsecret, false], 
		[badland_8, mu_desert, mu_desertsecret, true], 
		[badland_9, mu_ufo, mu_desertsecret, true], 
		[badland_mart4, mu_ufo, mu_desertsecret, true], 
		[badland_10, mu_desert, mu_desertsecret, true], 
		[forest_1, mu_forest, mu_medievalsecret, false], 
		[forest_G1, mu_forest, mu_medievalsecret, true], 
		[forest_G1b, mu_gustavo, mu_medievalsecret, false], 
		[forest_5, mu_forest, mu_medievalsecret, true], 
		[chateau_1, mu_chateau, mu_medievalsecret, false], 
		[sewer_1, mu_sewer, mu_medievalsecret, false], 
		[freezer_1, mu_freezer, mu_medievalsecret, false], 
		[kidsparty_1, mu_kidsparty, mu_medievalsecret, false], 
		[minigolf_1, mu_minigolf, mu_medievalsecret, false], 
		[industrial_1, mu_industrial, mu_medievalsecret, false], 
		[street_intro, mu_street, mu_medievalsecret, false], 
		[farm_2, mu_farm, mu_farmsecret, false], 
		[space_1, mu_pinball, mu_pinballsecret, false], 
		[graveyard_1, mu_graveyard, mu_medievalsecret, false], 
		[saloon_1, mu_saloon, mu_saloonsecret, false], 
		[ufo_1, mu_pinball, mu_pinballsecret, false], 
		[plage_entrance, mu_beach, mu_medievalsecret, false], 
		[war_1, mu_war, mu_medievalsecret, false], 
		[characterselect, mu_characterselect, mu_medievalsecret, false],
		[rm_swedish, mu_ufo, mu_pinballsecret, false], 
		[tower_tutorial1, mu_funiculi, mu_funiculi, false], 
		[boss_fakepep, mu_fakepep, mu_fakepep, false], 
		[boss_fakepephallway, mu_PIZZA_TOWER_THyrzzryzryEME_SONG, mu_PIZZA_TOWER_THyrzzryzryEME_SONG, false], 
		[rm_editor_big, mu_snickchallenge, mu_medievalsecret, false], 
		[dragonlair_1, mu_dungeondepth, mu_medievalsecret, false], 
		[tutorial_room1, mu_tutorial, mu_medievalsecret, false], 
		[normalT_room1, mu_ruin, mu_medievalsecret, false], 
		[normalT_bonus1, mu_dungeondepth, mu_medievalsecret, false], 
		[normalT_room3, mu_ruin, mu_medievalsecret, false], 
		[normalT_bonus2, mu_dungeondepth, mu_medievalsecret, false], 
		[normalT_room5, mu_ruin, mu_medievalsecret, false], 
		[desert_1, mu_desert, mu_desertsecret, false], 
	]
}
with(instance_create(x,y, obj_custom_object))
{
    persistent = 1;
    visible = 0;
    step_event = @'
    with(obj_player)
    {
		if(character == "PZ")
		{
			if grounded && state != 1001
				floatygrab = 0;
			if audio_is_playing(sfx_jump)
			{
				scr_soundeffect(global.pz_jump);
				audio_stop_sound(sfx_jump);
			}
			var scr_player_normal = function()
			{
				if (key_attack && state != 42 && !place_meeting(x + xscale, y, obj_solid) && (!place_meeting(x, y + 1, obj_iceblockslope) || !place_meeting(x + (xscale * 5), y, obj_solid)))
				{
					image_index = 0;
					state = 104;
					if (movespeed < 6)
					{
						movespeed = 6;
						sprite_index = spr_mach1;
					}
				}
				if !obj_music.pillar_on_camera
				{
					if instance_exists(obj_beatbox)
					{
						audio_sound_gain(obj_music.musicID, lerp(audio_sound_get_gain(obj_music.musicID), global.option_music_volume * 0.25, 0.1), 0); 
						if !audio_is_playing(global.boomboxsong)
						{
							global.boomboxsong = audio_play_sound(global.boomboxsong, 1, true);
							sfx_gain(global.boomboxsong);
						} 
					} 
					else
					{
						audio_sound_gain(obj_music.musicID, lerp(audio_sound_get_gain(obj_music.musicID), global.option_music_volume, 0.1), 0);
						audio_stop_sound(global.boomboxsong);
					}
				}
				else
					audio_stop_sound(global.boomboxsong);
				audio_stop_sound(global.mach2snd);
				audio_stop_sound(global.mach3snd);
			}
			var scr_player_jump = function()
			{
				if (key_attack && state != 42 && grounded)
				{
					sprite_index = spr_mach1;
					image_index = 0;
					state = 104;
					if (movespeed < 6)
						movespeed = 6;
				}
				if sprite_index = spr_suplexcancel
					floatygrab = 1;
				audio_stop_sound(global.mach2snd);
				audio_stop_sound(global.mach3snd);
			}
			var scr_player_mach2 = function()
			{
				if (!key_attack && movespeed >= 8 && grounded && skateboarding == 0)
				{
					image_index = 0;
					state = 105;
					scr_soundeffect(sfx_break);
					sprite_index = spr_machslidestart;
				}
				else if (!key_attack && movespeed < 8 && grounded && skateboarding == 0)
				{
					state = 0;
				}
				if (move == -xscale && movespeed >= 8 && grounded && skateboarding == 0)
				{
					scr_soundeffect(global.machslideboost);
					image_index = 0;
					state = 105;
					sprite_index = spr_machslideboost;
				}
				else if (move == -xscale && movespeed < 8 && grounded && skateboarding == 0)
				{
					xscale *= -1;
					movespeed = 6;
				}
				if sprite_index = spr_longjump && image_index<1 && move == -xscale
					xscale *= -1;
				if sfx_mach2snd != global.mach2snd
					sfx_mach2snd = global.mach2snd;
			}
			var scr_player_climbwall = function()
			{
				sfx_mach2snd = mu_empty;
				sfx_mach3snd = mu_empty;
				if (windingAnim < 200)
                windingAnim++;
				move = key_left + key_right;
				suplexmove = 0;
				vsp = -wallspeed;
				if (wallspeed < 20)
					wallspeed += 0.15;
				if (wallspeed < 0)
				{
					if (mach4mode == 0)
						movespeed += 0.2;
					else
						movespeed += 0.4;
				}
				crouchslideAnim = 1;
				if(wallspeed<12)
				{
					sprite_index = spr_machclimbwall;
					if(!audio_is_playing(global.mach2snd))
						scr_soundeffect(global.mach2snd);
				}
				else
				{
					sprite_index = global.machclimbwall3;
					if(!audio_is_playing(global.mach3snd))
						scr_soundeffect(global.mach3snd);
					ratmount_movespeed = 13;
					if(!instance_exists(obj_chargeeffect))
					{	
						with(instance_create(x,y, obj_chargeeffect))
						{
							image_xscale = playerid.xscale;
							image_angle = 90*playerid.xscale;
						}
					}
					if(place_meeting(x+hsp,y+vsp, obj_metalblock))
						instance_destroy(instance_place(x+hsp,y+vsp, obj_metalblock));
					instakillmove = true;
				}
				if (!finalmoveset)
				{
					if (!key_attack && !skateboarding)
					{
						state = 0;
						movespeed = 0;
						railmovespeed = 6;
						raildir = -xscale;
						audio_stop_sound(global.mach2snd);
						audio_stop_sound(global.mach3snd);
					}
					else if (!key_attack && !skateboarding && move != xscale && move != 0)
					{
						state = 0;
						movespeed = 0;
						railmovespeed = 6;
						raildir = -xscale;
						audio_stop_sound(global.mach2snd);
						audio_stop_sound(global.mach3snd);
					}
				}
				else
				{
					if (grabclimbbuffer > 0)
					{
						grabclimbbuffer--;
						audio_stop_sound(global.mach2snd);
						audio_stop_sound(global.mach3snd);
					}
				}
                if (!key_attack && !skateboarding && grabclimbbuffer == 0)
                {
                    state = 0;
                    movespeed = 0;
                    railmovespeed = 6;
                    raildir = -xscale;
					audio_stop_sound(global.mach2snd);
					audio_stop_sound(global.mach3snd);
                }
				if (verticalbuffer <= 0 && place_meeting(x, y - 1, obj_solid) && !place_meeting(x, y - 1, obj_verticalhallway) && !place_meeting(x, y - 1, obj_destructibles) && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid_slope(x + sign(hsp), y)) && !place_meeting(x - sign(hsp), y, obj_slope))
				{
					if (!skateboarding)
					{
						sprite_index = spr_superjumpland;
						scr_soundeffect(sfx_groundpound);
						image_index = 0;
						state = 123;
						machhitAnim = 0;
						audio_stop_sound(global.mach2snd);
						audio_stop_sound(global.mach3snd);
					}
					else if (!key_jump)
					{
						state = 106;
						hsp = -2.5 * xscale;
						vsp = -3;
						mach2 = 0;
						image_index = 0;
						audio_stop_sound(global.mach2snd);
						audio_stop_sound(global.mach3snd);
					}
				}
				if (verticalbuffer <= 0 && !scr_solid(x + xscale, y) && !place_meeting(x, y, obj_verticalhallway) && !place_meeting(x, y - 12, obj_verticalhallway))
				{
					instance_create(x, y, obj_jumpdust);
					vsp = 0;
					ledge_bump(32);
					
					if (wallspeed < 6)
						wallspeed = 6;
					
					if ((wallspeed >= 6 && wallspeed < 12) || skateboarding)
					{
						state = 104;
						movespeed = wallspeed;
					}
					else if (wallspeed >= 12)
					{
						state = 121;
						sprite_index = spr_mach4;
						movespeed = wallspeed;
					}
					audio_stop_sound(global.mach2snd);
					audio_stop_sound(global.mach3snd);
				}
				if (wallspeed < 0 && place_meeting(x, y + 12, obj_solid))
                wallspeed = 0;
				if (key_jump)
				{
					key_jump = 0;
					image_index = 0;
					sprite_index = global.walljumpstart;
					state = 1000;
					xscale*=-1;
					vsp = -14;
					scr_soundeffect(global.sfx_wallkick);
					audio_stop_sound(global.mach2snd);
					audio_stop_sound(global.mach3snd);
				}
				image_speed = 0.6;
				if (!instance_exists(obj_cloudeffect))
					instance_create(x, y + 43, obj_cloudeffect);
			}
			var scr_player_mach3 = function()
			{
				if (!key_attack && fightball == 0 && !launched && sprite_index != spr_dashpadmach && grounded && fightball == 0)
				{
					sprite_index = spr_machslidestart;
					scr_soundeffect(sfx_break);
					state = 105;
					image_index = 0;
					launched = 0;
				}
				
				if (move == -xscale && grounded && !launched && fightball == 0 && sprite_index != spr_dashpadmach)
				{
					scr_soundeffect(global.machslideboost);
					sprite_index = spr_mach3boost;
					state = 105;
					image_index = 0;
				}
				if(key_up && grounded)
				{
					image_index = 0;
					state = 99;
					sprite_index = spr_player_superjumpprep;
				}
				if sfx_mach3snd != global.mach3snd
					sfx_mach3snd = global.mach3snd;
				if sprite_index = global.walljumpcancelstart && floor(image_index) == (image_number - 1)
					sprite_index = global.walljumpcancel
				if (sprite_index = global.walljumpcancelstart || sprite_index = global.walljumpcancel) && grounded
					sprite_index = spr_mach4;
			}
			var scr_player_Sjumpprep = function()
			{
				if (sprite_index == spr_superjumppreplight || sprite_index == spr_superjumpright || sprite_index == spr_superjumpleft)
					move = key_left + key_right;
				else
					move = xscale;
				
				if (!place_meeting(x, y + 1, obj_railparent))
				{
					hsp = move * movespeed;
				}
				else
				{
					var _railinst = instance_place(x, y + 1, obj_railparent);
					hsp = (move * movespeed) + (_railinst.movespeed * _railinst.dir);
				}
				
				if (sprite_index == spr_superjumpprep && movespeed > 0)
					movespeed -= 1;
				
				if (floor(image_index) == (image_number - 1) && sprite_index == spr_superjumpprep)
					sprite_index = spr_superjumppreplight;
				
				if (sprite_index == spr_superjumppreplight)
					movespeed = 2;
				
				if (sprite_index != spr_superjumpprep)
				{
					if (move != 0 && (sprite_index == spr_superjumppreplight || sprite_index == spr_superjumpright || sprite_index == spr_superjumpleft))
					{
						if (xscale == 1)
						{
							if (key_right)
								sprite_index = spr_superjumpright;
							
							if (-key_left)
								sprite_index = spr_superjumpleft;
						}
						
						if (xscale == -1)
						{
							if (key_right)
								sprite_index = spr_superjumpleft;
							
							if (-key_left)
								sprite_index = spr_superjumpright;
						}
					}
					else
					{
						sprite_index = spr_superjumppreplight;
					}
				}
				if (!key_up && grounded && (sprite_index == spr_superjumppreplight || sprite_index == spr_superjumpleft || sprite_index == spr_superjumpright) && !scr_solid(x, y - 16) && !scr_solid(x, y - 32))
				{
					scr_soundeffect(sfx_superjumprelease);
					instance_create(x, y, obj_explosioneffect);
					sprite_index = spr_superjump;
					state = 97;
					vsp = -17;
					image_index = 0;
				}
				image_speed = 0.35;
			}
			var scr_player_Sjump = function()
			{
				if (sprite_index == spr_superjump || sprite_index == spr_superspringplayer)
					vsp = sjumpvsp;
				sjumpvsp -= 0.1;
				if (key_slap2 && sprite_index != spr_superspringplayer && sprite_index != spr_Sjumpcancelstart)
				{
					image_index = 0;
					sprite_index = spr_Sjumpcancelstart;
				}
				if move != 0 && !place_meeting(x+3*move,y, obj_solid) && sprite_index == spr_superjump
				{
					x += move*3;
				}
			}
			var scr_high_jump_check = function()
			{
				if(sprite_index = spr_breakdanceuppercut && key_attack2 && place_meeting(x, y+15, obj_solid))
				{
					state = 104;
					if(xscale != 1 || movespeed < 6)
						movespeed = 6;
				}
			}
			var scr_player_groundpound = function()
			{
				if(sprite_index == spr_bodyslamstart && image_index<1 && key_slap2)
				{
					sprite_index = spr_suplexdashjump;
					suplexmove = 1;
					scr_soundeffect(sfx_suplexdash);
					state = 42;
					movespeed = 8;
					image_index = 0;
					flash = 1;
					vsp = 10;
					instance_create(x,y,obj_crazyrunothereffect);
				}
				if(sprite_index == spr_poundcancel1 && prevstate != 108)
					sprite_index = global.poundcancelstart;
				if(sprite_index = global.poundcancelstart && floor(image_index) >= (image_number - 1))
					sprite_index = spr_poundcancel1;
			}
			var scr_player_grab = function()
			{
				switch(sprite_index)
				{
					case spr_suplexdashjumpstart:
						if(!floatygrab)
						{
							image_index+=0.15;
							vsp = 0;
							if(image_index<3)
								flash = 1;
							if key_down
							{
								sprite_index = spr_suplexdashjump;
								vsp = 5;
							}
							if(image_index==0.15)
								instance_create(x,y,obj_crazyrunothereffect);
						}
						else
							sprite_index = spr_suplexdashjump
					break;
					case spr_suplexdashjump:
						if(floatygrab && image_index<1)
							vsp = 0;
						if(floor(image_index) >= (image_number - 1))
							sprite_index = global.suplexdashjumploop;
						floatygrab = 1;
					break;
					case global.suplexdashjumploop:
						image_index+=0.15;
						if grounded
						{
							if(!key_down)
							{
								state = 0;
								if (move != xscale)
									movespeed = 2;
							}
							else if(key_down)
							{
								with (instance_create(x, y, obj_jumpdust))
									image_xscale = other.xscale;
								movespeed = 11;
								crouchslipbuffer = 25;
								grav = 0.5;
								sprite_index = spr_crouchslip;
								image_index = 0;
								machhitAnim = 0;
								state = 5;
							}
						}
					break;
				}
				if(key_slap2 && image_index > 1)
				{
					state = 1001;
					sprite_index = global.faceplant;
					image_index = 0;
				}
			}
			var scr_player_sliding = function()
			{
				if sprite_index == spr_crouchslip && movespeed > 11
					movespeed = 11;
				if movespeed > 12 && (sprite_index == spr_backslide || sprite_index == spr_backslideland)
				{
					ratmount_movespeed = 13;
					if(!instance_exists(obj_chargeeffect))
					{	
						with(instance_create(x,y, obj_chargeeffect))
							image_xscale = playerid.xscale;
					}
					if(place_meeting(x+hsp,y+vsp, obj_metalblock))
						instance_destroy(instance_place(x+hsp,y+vsp, obj_metalblock));
					instakillmove = true;
				}
			}
			var scr_player_wallkick = function()
			{
				image_speed = 0.35;
				move = key_left + key_right;
				hsp = movespeed;
				scr_destroy_destructibles(hsp, vsp);
				scr_dotaunt();
				if (move != 0)
					savedmove = move;
				if (move != 0)
				{
					movespeed = Approach(movespeed, 10 * move, 0.8);
				}
				else
				{
					movespeed = Approach(movespeed, 0, 0.45);
				}
				if(!audio_is_playing(global.sfx_wallkickloop))
					scr_soundeffect(global.sfx_wallkickloop);
				if(sprite_index == global.walljumpstart && floor(image_index) == (image_number - 1))
				{
					image_index = 0;
					sprite_index = global.walljumpend;
				}
				if (scr_solid(x + sign(movespeed), y) && !place_meeting(x + sign(movespeed), y, obj_destructibles))
					movespeed = 0;
					
				if (!grounded && (key_down || sprite_index == global.walljumpfastfall || sprite_index == global.walljumpfastfallstart))
				{	
					vsp = max(vsp, 14);
					if (sprite_index != global.walljumpfastfallstart && sprite_index != global.walljumpfastfall)
					{
						sprite_index = global.walljumpfastfallstart;
						image_index = 0;
						scr_soundeffect(sfx_dive);
					}
					if(sprite_index == global.walljumpfastfallstart && floor(image_index) == (image_number - 1))
					{
						image_index = 0;
						sprite_index = global.walljumpfastfall;
					}
					else if(key_jump && (sprite_index == global.walljumpfastfall || sprite_index == global.walljumpfastfallstart))
					{
						state = 108;
						image_index = 0;
						sprite_index = spr_poundcancel1;
						dir = xscale;
						hsp = movespeed * xscale;
						movespeed = abs(movespeed);
						vsp = -6;
						wallspeed = vsp;
						freeFallSmash = 0;
						audio_stop_sound(global.sfx_wallkickloop);
					}
				}
				if (key_slap2)
				{
					input_buffer_slap = finalmoveset ? 0 : 8;
					audio_stop_sound(global.sfx_wallkickloop);
					jumpstop = true;
					if move != 0
						xscale = move;
					else
						xscale = savedmove;
					if (!key_up)
					{
						sprite_index = global.walljumpcancelstart;
						image_index = 0;
						movespeed = 12;
						hsp = movespeed * xscale;
						vsp = -5;
						state = 121;
						scr_soundeffect(global.sfx_wallkickcancel);
					}
					else
					{
						scr_soundeffect(sfx_uppercut2);
						state = 80;
						image_index = 0;
						sprite_index = spr_breakdanceuppercut;
						vsp = -14;
						movespeed = hsp;
						particle_set_scale(particle.highjumpcloud2, xscale, 1);
						create_particle(x, y, particle.highjumpcloud2, 0);
					}
				}
				if (grounded && vsp >= 0)
				{
					audio_stop_sound(global.sfx_wallkickloop);
					flash = true;
					if move != 0
						xscale = move;
					else
						xscale = savedmove;
					
					if (key_attack)
					{
						movespeed = 12;
						hsp = movespeed * dir;
						state = 121;
						image_index = 0;
						sprite_index = spr_rollgetup;
					}
					else
					{
						landAnim = true;
						movespeed = 8;
						hsp = movespeed * dir;
						state = 0;
						instance_create(x, y, obj_landcloud);
						scr_soundeffect(sfx_step);
					}
				}
			}
			var scr_player_faceplant = function()
			{
				var i = 0;
				mask_index = spr_crouchmask;
				image_speed = 0.3;
				instakillmove = true;
				hsp = (movespeed*xscale)+(railmovespeed*raildir);
				scr_destroy_destructibles(hsp, vsp);
				if (!grounded)
					movespeed = min(movespeed, 11);
				if (movespeed < 11)
					movespeed += 0.5;
				if key_slap2
					i = 1;
				if(!floatygrab && !grounded)
				{
					vsp = -5;
					floatygrab = 1;
				}
				if(key_jump)
				{
					jumpstop = 0;
					image_index = 0;
					vsp = -11;
					state = 104;
					sprite_index = spr_longjump;
				}
				if(key_down)
				{
					if(grounded)
					{
						with (instance_create(x, y, obj_jumpdust))
							image_xscale = other.xscale;
						crouchslipbuffer = 25;
						grav = 0.5;
						sprite_index = spr_crouchslip;
						image_index = 0;
						machhitAnim = 0;
						state = 5;
					}
					else if(!grounded)
						vsp = 10;
				}
				if(floor(image_index) == (image_number - 1))
				{
					if(i != 1)
					{
						if(key_attack)
						{
							if movespeed<12
								state = 104;
							else
							{
								state = 121;
								sprite_index = spr_mach4
							}
						}
						else
							state = 0;
					}
					else if i == 1
					{
						i = 0;
						image_index = 0;
					}
				}
				if grounded
					floatygrab = 1;
				if(place_meeting(x+(10*xscale),y, obj_solid))
				{
					sprite_index = spr_wallsplat;
					state = 106;
					image_index = 0;
				}
			}
			switch(state)
			{
				case 92:
					scr_player_jump();
				break;
				case 37:
					scr_player_climbwall();
				break;
				case 0:
					scr_player_normal();
				break;
				case 104:
					scr_player_mach2();
				break;
				case 121:
					scr_player_mach3();
				break;
				case 99:
					scr_player_Sjumpprep();
				break;
				case 97:
					scr_player_Sjump();
				break;
				case 80:
					scr_high_jump_check();
				break;
				case 42:
					scr_player_grab();
				break;
				case 108:
					scr_player_groundpound();
				break;
				case 5:
					scr_player_sliding();
				break;
				case 1000:
					scr_player_wallkick();
				break;
				case 1001:
					scr_player_faceplant();
				break;
			}
		}
    }
	with(obj_chargeeffect)
	{
		if(image_angle = 90*playerid.xscale && playerid.state != 37 || image_angle != 90*playerid.xscale && playerid.state = 37)
			instance_destroy();
	}
	with(obj_music)
	{
		if lap2music != audio_create_stream("music/lap2.ogg")
			lap2music = audio_create_stream("music/lap2.ogg");
		if escapemusic != audio_create_stream("music/glucodetry4.ogg")
			escapemusic = audio_create_stream("music/glucodetry4.ogg");
	}
	with(obj_tvtrigger)
		instance_destroy();
    ';
	drawgui_event = @'
	with(obj_tv)
	{
		var barxx = -26;
        var baryy = 30;
        draw_sprite(spr_barpop, 0, 832 + barxx, 250 + baryy);
        var sw = sprite_get_width(spr_barpop);
        var sh = sprite_get_height(spr_barpop);
        var b = global.combotime / 61;
        draw_sprite_part(spr_barpop, 1, 0, 0, sw * b, sh, 832 + barxx, 250 + baryy);
	}
	';
    docommand("reload_gml")
}
