gml
with(obj_player)
{
	character = "PZ";
	spr_suplexdash = sprite_add("sprites/spr_pizzelle_suplexdash.png", 10, false, false, 50, 50)
	sprite_set_speed(spr_suplexdash,60,60)
	spr_suplexdashjump = sprite_add("sprites/spr_pizzelle_suplexdashjumpstart.png", 2, false, false, 50, 50)
	sprite_set_speed(spr_suplexdashjump,60,60)
	spr_suplexdashjumpstart = sprite_add("sprites/spr_pizzelle_airstart.png", 7, false, false, 50, 50)
	sprite_set_speed(spr_suplexdash,60,60)
	global.suplexdashjumploop = sprite_add("sprites/spr_pizzelle_suplexdashjump.png", 3, false, false, 50, 50)
	sprite_set_speed(global.suplexdashjumploop,60,60)
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
			var scr_player_normal = function()
			{
				if (key_attack && state != 42 && !place_meeting(x + xscale, y, obj_solid) && (!place_meeting(x, y + 1, obj_iceblockslope) || !place_meeting(x + (xscale * 5), y, obj_solid)) && !global.kungfu)
				{
					sprite_index = spr_mach1;
					image_index = 0;
					state = 104;
					if (movespeed < 6)
						movespeed = 6;
				}
			}
			var scr_player_jump = function()
			{
				if (key_attack && state != 42 && !global.kungfu && grounded)
				{
					sprite_index = spr_mach1;
					image_index = 0;
					state = 104;
					if (movespeed < 6)
						movespeed = 6;
				}
			}
			var scr_player_mach2 = function()
			{
				if(movespeed>7 && grounded)
				{
					if(!key_attack)
					{
						sprite_index = spr_machslidestart;
						scr_soundeffect(89);
						state = 105;
						image_index = 0;
						launched = 0;
					}
					if(move == xscale*-1)
					{
						image_index = 0;
						state = 105;
						sprite_index = spr_player_machslideboost3;
						scr_soundeffect(sfx_machslideboost);
					}
				}
			}
			var scr_player_climbwall = function()
			{
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
				if (vsp < -5)
					sprite_index = spr_machclimbwall;
				else
					sprite_index = spr_clingwall;
				if (!finalmoveset)
				{
					if (!key_attack && !skateboarding)
					{
						state = 0;
						movespeed = 0;
						railmovespeed = 6;
						raildir = -xscale;
					}
					else if (!key_attack && !skateboarding && move != xscale && move != 0)
					{
						state = 0;
						movespeed = 0;
						railmovespeed = 6;
						raildir = -xscale;
					}
				}
				else
				{
					if (grabclimbbuffer > 0)
						grabclimbbuffer--;
				}
                if (!key_attack && !skateboarding && grabclimbbuffer == 0)
                {
                    state = 0;
                    movespeed = 0;
                    railmovespeed = 6;
                    raildir = -xscale;
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
					}
					else if (!key_jump)
					{
						state = 106;
						hsp = -2.5 * xscale;
						vsp = -3;
						mach2 = 0;
						image_index = 0;
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
				}
				if (wallspeed < 0 && place_meeting(x, y + 12, obj_solid))
                wallspeed = 0;
				if (key_jump)
				{
					key_jump = 0;
					movespeed = 10;
					state = 104;
					image_index = 0;
					sprite_index = spr_walljumpstart;
					if (skateboarding)
						sprite_index = spr_clownjump;
					vsp = -11;
					xscale *= -1;
					jumpstop = 0;
					walljumpbuffer = 4;
				}
				image_speed = 0.6;
				if (!instance_exists(obj_cloudeffect))
					instance_create(x, y + 43, obj_cloudeffect);
			}
			var scr_player_mach3 = function()
			{
				if(movespeed>7 && grounded)
				{
					if(!key_attack)
					{
						sprite_index = spr_machslidestart;
						scr_soundeffect(89);
						state = 105;
						image_index = 0;
						launched = 0;
					}
					if(move == xscale*-1)
					{
						image_index = 0;
						state = 105;
						sprite_index = spr_player_machslideboost3;
						scr_soundeffect(sfx_machslideboost);
					}
					if(key_up)
					{
						image_index = 0;
						state = 99;
						sprite_index = spr_player_superjumpprep;
					}
				}
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
			var scr_sugary_spire_is_coded_like_shit = function()
			{
				if(sprite_index == spr_bodyslamstart && key_slap)
				{
					state = 42;
					sprite_index = global.suplexdashjumploop;
					vsp = 10;
					movespeed = 10;
				}
			}
			var scr_player_grab = function()
			{
				switch(sprite_index)
				{
					case spr_suplexdashjumpstart:
						vsp = 0;
					break;
					case spr_suplexdashjump:
						if(floor(image_index) >= (image_number - 1))
							sprite_index = global.suplexdashjumploop;
					break;
					case global.suplexdashjumploop:
						if grounded
						{
							state = 0;
							if (move != xscale)
								movespeed = 2;
						}
					break;
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
				case 108:
					scr_sugary_spire_is_coded_like_shit();
				break;
				case 42:
					scr_player_grab();
				break;
			}
		}
    }
    ';
    docommand("reload_gml")
}
