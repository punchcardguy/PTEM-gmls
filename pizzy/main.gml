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
}
	sprite_replace(spr_pizzascore, "sprites/spr_pizzascore.png", 1, false, false, 135.5, 87.5);
	sprite_replace(spr_exitgate, "sprites/spr_exitgate_ss.png", 2, false, false, 73, 189);
	sprite_replace(spr_font, "sprites/spr_font.png", 39, false, false, 16, 16);
	sprite_replace(spr_font_collect, "sprites/spr_font_collect.png", 10, false, false, 20, 26.5);
with(instance_create(x,y, obj_custom_object))
{
    persistent = 1;
    visible = 0;
    step_event = @'
    with(obj_player)
    {
		if(character == "PZ")
		{
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
				audio_stop_sound(global.mach2snd);
				audio_stop_sound(global.mach3snd);
			}
			var scr_player_mach2 = function()
			{
				if (!key_attack && movespeed >= 8 && grounded && skateboarding == 0)
				{
					image_index = 0;
					state = 105;
					scr_soundeffect(89);
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
						scr_soundeffect(129);
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
					scr_soundeffect(89);
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
					scr_soundeffect(193);
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
			var scr_player_fastfall = function()
			{
				if(sprite_index == spr_bodyslamstart && image_index<1 && key_slap)
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
			}
			var scr_player_grab = function()
			{
				switch(sprite_index)
				{
					case spr_suplexdashjumpstart:
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
					break;
					case spr_suplexdashjump:
						if(floor(image_index) >= (image_number - 1))
							sprite_index = global.suplexdashjumploop;
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
				}
			}
			var scr_player_wallkick = function()
			{
				image_speed = 0.35;
				move = key_left + key_right;
				hsp = movespeed;
				scr_destroy_destructibles(hsp, vsp);
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
					else if(key_jump && sprite_index == global.walljumpfastfall)
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
					}
				}
				if (key_slap2)
				{
					input_buffer_slap = finalmoveset ? 0 : 8;
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
						scr_soundeffect(sfx_cowkick);
					}
					else
					{
						state = 80;
						image_index = 0;
						sprite_index = spr_breakdanceuppercut;
						vsp = -14;
						movespeed = hsp;
						particle_set_scale(4, xscale, 1);
						create_particle(x, y, 4, 0);
					}
				}
				if (grounded && vsp >= 0)
				{
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
					scr_player_fastfall();
				break;
				case 5:
					scr_player_sliding();
				break;
				case 1000:
					scr_player_wallkick();
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
    ';
    docommand("reload_gml")
}
