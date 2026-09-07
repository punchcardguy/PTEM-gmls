gml
with obj_player savedmove = 1;
with (instance_create(0, 0, obj_custom_object_ext))
{
	persistent = true;
	image_alpha = 0;
	download_queue = ds_queue_create();
	
	enum asset_type_dl
	{
		sprite,
		sound,
		replace
	}
	downloading = false;
	
	downloadFile = function(_file, _filename, _frames = 1, xorigin = 0, yorigin = 0) // i stole this from soy
	{
		var q =
		{
			file : _file, 
			name : _filename,
			frames : _frames,
			xo : xorigin,
			yo : yorigin,
			type : asset_type_dl.sprite,
		};
		
		ds_queue_enqueue(download_queue, q);
	}
	
	downloadFileSound = function(_file, _filename) // i also stole this from soy
	{
		var q =
		{
			file : _file, 
			name : _filename,
			type : asset_type_dl.sound,
		};
		
		ds_queue_enqueue(download_queue, q);
	}
	
	downloadFile_replace = function(_file, _filename, _frames = 1, xorigin = 0, yorigin = 0, _replace) // i coded this using soys downloadfile as a base
	{
		var q =
		{
			file : _file, 
			name : _filename,
			frames : _frames,
			xo : xorigin,
			yo : yorigin,
			type : asset_type_dl.replace,
			replacement : _replace,
		};
		
		ds_queue_enqueue(download_queue, q);
	}
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_Timesup.png?raw=true", "playerMS_Timesup.png", 11, 100, 100, "spr_Timesup");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_backslide.png?raw=true", "playerMS_backslide.png", 7, 100, 100, "spr_backslide");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_backslide.png?raw=true", "playerMS_backslide.png", 7, 100, 100, "spr_backslidestart");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_backslide.png?raw=true", "playerMS_backslide.png", 7, 100, 100, "spr_machroll");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_bodyslamfall.png?raw=true", "playerMS_bodyslamfall.png", 8, 100, 100, "spr_bodyslamfall");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_bodyslamland.png?raw=true", "playerMS_bodyslamland.png", 5, 100, 100, "spr_bodyslamland");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_crawl.png?raw=true", "playerMS_crawl.png", 6, 100, 100, "spr_crawl");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_crazyrun.png?raw=true", "playerMS_crazyrun.png", 6, 100, 100, "spr_crazyrun");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_crouch.png?raw=true", "playerMS_crouch.png", 3, 100, 100, "spr_crouch");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_crouchfall.png?raw=true", "playerMS_crouchfall.png", 6, 100, 100, "spr_crouchfall");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_crouchfall.png?raw=true", "playerMS_crouchfall.png", 6, 100, 100, "spr_crouchjump");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_crouchstart.png?raw=true", "playerMS_couchstart.png", 5, 97, 73, "spr_couchstart");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_dashpad.png?raw=true", "playerMS_dashpad.png", 3, 100, 100, "spr_dashpad");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_deathend.png?raw=true", "playerMS_deathend.png", 3, 100, 100, "spr_deathend");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_dive.png?raw=true", "playerMS_dive.png", 3, 100, 100, "spr_dive");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_fall.png?raw=true", "playerMS_fall.png", 3, 100, 100, "spr_fall");
	downloadFile("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_fly.png?raw=true", "playerMS_fly.png", 3, 97, 73);
	downloadFile("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_flybump.png?raw=true", "playerMS_flybump.png", 4, 140, 154);
	downloadFile("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_flystart.png?raw=true", "playerMS_flystart.png", 9, 97, 73);
	downloadFile("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_flyturn.png?raw=true", "playerMS_flyturn.png", 18, 110, 100);
	downloadFileSound("https://github.com/punchcardguy/PTEM-gmls/raw/refs/heads/main/mrstick/You%20Know%20You%20Want%20It!%20-%20Pizza%20Tower%20UST%20but%20amplified%20to%20hell.ogg", "youknowyouwant_it.ogg");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_hurt.png?raw=true", "playerMS_hurt.png", 3, 100, 100, "spr_hurt");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_idle.png?raw=true", "playerMS__idle.png", 18, 100, 100, "spr_idle");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_jump.png?raw=true", "playerMS_jump.png", 6, 100, 100, "spr_jump");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_land.png?raw=true", "playerMS_land.png", 4, 100, 100, "spr_land");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_land2.png?raw=true", "playerMS_land2.png", 3, 100, 100, "spr_land2");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_mach12.png?raw=true", "playerMS_mach.png", 6, 100, 100, "spr_mach");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_mach12.png?raw=true", "playerMS_mach.png", 6, 100, 100, "spr_mach1");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_mach3.png?raw=true", "playerMS_mach3.png", 3, 100, 100, "spr_mach4");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_mach3hit.png?raw=true", "playerMS_mach3hit.png", 6, 182, 97, "spr_mach3hit");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_mach3hitwall.png?raw=true", "playerMS_mach3hitwall.png", 8, 100, 100, "spr_hitwall");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_mach3jump.png?raw=true", "playerMS_machjump.png", 5, 100, 100, "spr_mach3jump");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_machpunch1.png?raw=true", "playerMS_machpunch1.png", 2, 182, 97, "spr_machpunch1");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_machslide.png?raw=true", "playerMS_machslide.png", 3, 100, 100, "spr_machslide");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_machslideboost.png?raw=true", "playerMS_machslideboost.png", 13, 100, 100, "spr_machslideboost");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_machslideboost3.png?raw=true", "playerMS_machslideboost3.png", 13, 100, 100, "spr_mach3boost");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_machslideend.png?raw=true", "playerMS_machslideend.png", 6, 100, 100, "spr_machslideend");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_machslidestart.png?raw=true", "playerMS_machslidestart.png", 5, 100, 100, "spr_machslidestart");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_move.png?raw=true", "playerMS_move.png", 19, 100, 100, "spr_move");
	downloadFile("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_nohat.png?raw=true", "playerMS_nohat.png", 3, 97, 82);
	downloadFile("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_nohatstart.png?raw=true", "playerMS_nohatstart.png", 8, 97, 82);
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_panic.png?raw=true", "playerMS_panic.png", 3, 50, 50, "spr_panic");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_parry.png?raw=true", "playerMS_parry.png", 11, 100, 100, "spr_parry");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_rockethitwall.png?raw=true", "playerMS_rockethitwall.png", 4, 219, 176, "spr_rockethitwall");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_rollgetup.png?raw=true", "playerMS_rollgetup.png", 10, 182, 97, "spr_rollgetup");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_secondjump1.png?raw=true", "playerMS_secondjump1.png", 4, 110, 100, "spr_secondjump1");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_secondjump1.png?raw=true", "playerMS_secondjump1.png", 4, 110, 100, "spr_secondjump2");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_slipbanan1.png?raw=true", "playerMS_slipbanan1.png", 4, 110, 100, "spr_slipbanan1");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_slipbanan2.png?raw=true", "playerMS_slipbanan2.png", 8, 110, 100, "spr_slipbanan2");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_superjump.png?raw=true", "playerMS_superjump.png", 14, 133, 195, "spr_superjump");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_superjumpprep.png?raw=true", "playerMS_superjumpprep.png", 4, 100, 100, "spr_superjumpprep");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_superspring.png?raw=true", "playerMS_superspring.png", 3, 133, 195, "spr_superspring");
	downloadFile("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_swimming.png?raw=true", "playerMS_swimming.png", 7, 110, 100);
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_taunt.png?raw=true", "playerMS_taunt.png", 12, 110, 100, "spr_taunt");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_walkfront.png?raw=true", "playerMS_walkfront.png", 13, 110, 100, "spr_walkfront");
	event.step[0] = @'
	if !ds_queue_empty(download_queue) && !downloading
	{
		var d = ds_queue_head(download_queue);

		if !file_exists(d.name)
		{
			downloading = true;
		    req = http_get_file(d.file, d.name);
		} 
		else
		{
			if d.type == 0
			{
				var _spr = sprite_add(d.name, d.frames, false, false, d.xo, d.yo);
				sprite_set_speed(_spr, 1, spritespeed_framespergameframe);
				variable_global_set(string_replace_all(d.name, ".png", ""), _spr);
			}
			else if d.type == 1
				variable_global_set(string_replace_all(d.name, ".ogg", ""), audio_create_stream(d.name));
			else if d.type == 2
			{
				var _spr = sprite_add(d.name, d.frames, false, false, d.xo, d.yo);
				var _name = string_replace_all(d.name, ".png", "")
				if d.replacement != "spr_taunt"
					sprite_set_speed(_spr, 1, spritespeed_framespergameframe);
				else
					sprite_set_speed(_spr, 1, 0);
				variable_global_set(_name, _spr);
				with obj_player variable_instance_set(id, d.replacement, variable_global_get(_name))
			}
			
			ds_queue_dequeue(download_queue);
		} 
	}
	with(obj_player)
	{
		var _delay = 0;
		switch(state)
		{
			case 37:
				image_speed = 0.5
				state = 5001
				image_index = 0;
				sprite_index = global.playerMS_flystart
				delay = 10;
			break;
			
			case 5000:
				move = key_left+key_right
				movespeed = abs(hsp)
				scr_destroy_destructibles(hsp, vsp);
				image_speed = 0.5
				
				if (move != 0)
					savedmove = move;
				
				vsp -= grav
				
				if sprite_index != global.playerMS_flyturn && sprite_index != spr_superjump
				{
					if key_down || key_up
						vsp = Approach(vsp, (key_down + -key_up)*12, 1);
					else
						vsp = Approach(vsp, 0, 0.35);
					
					if move != 0
						hsp = Approach(hsp, move*12, 1);
					else
						hsp = Approach(hsp, 0, 0.35);
					
					if hsp != 0 && movespeed != 0
						xscale = sign(hsp)
					
					if key_slap2 && !key_up
					{
						xscale = savedmove;
						sprite_index = global.playerMS_flyturn
						hsp = 12*xscale
						image_index = 0
						vsp = 0
					}
					else if key_slap2
					{
						xscale = 1
						state = 80;
						image_index = 0;
						sprite_index = spr_breakdanceuppercut;
						sfx_gain(audio_play_sound(sfx_uppercut2, 1, false))
						vsp = -10;
						movespeed = hsp;
						particle_set_scale(4, xscale, 1);
						create_particle(x, y, 4, 0);
					}
					
					if key_jump
					{
						movespeed = hsp
						state = 306;
						sprite_index = global.playerMS_nohatstart
						if !grounded
							vsp -= 4
						image_index = 0;
					}
					
					if(sprite_index == global.playerMS_swimming || sprite_index == global.playerMS_fly)
					{
						if movespeed < 8
							sprite_index = global.playerMS_fly
						else
							sprite_index = global.playerMS_swimming
					}
				}
				
				if sprite_index == global.playerMS_flyturn
				{
					if floor(image_index) == (image_number - 1)
						sprite_index = global.playerMS_fly
					
					hsp = 12*xscale
					
					instakillmove = true;
					
					if !grounded && key_down
						state = 108;
				}
				
				if sprite_index == spr_superjump
				{
					if floor(image_index) == (image_number - 1)
						sprite_index = global.playerMS_fly
				}
				
				if (scr_solid(x + sign(hsp), y) && !place_meeting(x + sign(hsp), y, obj_mach3solid) && !scr_slope() && (scr_solid_slope(x + sign(hsp), y) || place_meeting(x + sign(hsp), y, obj_solid)) && !(place_meeting(x + sign(hsp), y, obj_metalblock)) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_climbablewall))
				{
					var _bump = ledge_bump((vsp >= 0) ? 32 : 22);
					if (_bump)
					{
						hsp = -3*sign(prevhsp)
						sprite_index = global.playerMS_flybump
						image_index = 0;
					}
				}
				
				if sprite_index == global.playerMS_flybump && floor(image_index) == (image_number - 1)
				{
					sprite_index = global.playerMS_fly
				}
			break;
			
			case 5001:
				delay--;
				vsp = -6-grav
				hsp = 3*-xscale
				
				if delay == 0
				{
					state = 5000
					sprite_index = global.playerMS_fly
				}
				
				if key_slap2
				{
					move = key_right + key_left;
					delay = 0
					state = 5000
					sprite_index = global.playerMS_flyturn
					image_index = 0
					vsp = 0
					
					if (move != 0)
						savedmove = move;
						
					xscale = savedmove;
					
					if movespeed < 12
					{
						hsp = 12*xscale;
						movespeed = 12;
					}
				}
				
			break;
			
			case 108:
				freefallsmash = 12;
				if vsp < 10
					vsp = 10
				hsp = 0
				movespeed = 0;
				sprite_index = spr_bodyslamfall
			break;
			
			case 306:
				hsp = movespeed;
				move = key_right + key_left;
				
				instakillmove = true;
				
				if (move != 0)
					savedmove = move;
					
				image_speed = 0.5;
				
				if sprite_index == global.playerMS_nohatstart && floor(image_index) == image_number - 1
					sprite_index = global.playerMS_nohat
				if (move != 0)
					movespeed = Approach(movespeed, move * 8, 1);
				else
					movespeed = Approach(movespeed, 0, 0.5);
				if grounded
				{
					if key_attack
					{
						if move != 0
							xscale = move;
						
						else if savedmove != 0
							xscale = savedmove;
						
						jumpstop = true;
						state = 121;
						if abs(movespeed) < 12
							movespeed = 12;
						
						sprite_index = spr_mach4;
						
						flash = true;
						
						with (instance_create(x, y, obj_crazyrunothereffect))
							image_xscale = other.xscale;
						image_index = 0;
					}
					else
					{
						state = 0;
						movespeed = abs(hsp);
					}
				}
			break;
			
			case 42:
				state = 5000
				sprite_index = global.playerMS_flyturn
				image_index = 0
				vsp = 0
				
				if movespeed < 12
				{
					hsp = 12*xscale;
					movespeed = 12;
				}
			break;
			
			case 99:
				vsp = -35
				sprite_index = spr_superjump
				scr_soundeffect(sfx_superjumprelease)
				state = 5000
			break;
			
			case 80:
				if place_meeting(x, y+15, obj_solid) && sprite_index = spr_breakdanceuppercut && image_index < 1
				{
					vsp = -35
					sprite_index = spr_superjump
					scr_soundeffect(sfx_superjumprelease)
					state = 5000
				}
			break;
		}
	}
	with(obj_music)
	{
		if variable_global_exists("youknowyouwant_it")
		{
			if escapemusic == mu_pizzatime && !global.lap
				escapemusic = global.youknowyouwant_it
		}
	}
	';
	event.http[0] = @'
	if async_load[? "id"] == req
	{
		if async_load[? "status"] == 0
		{
			var d = ds_queue_head(download_queue);
			
			if file_exists(d.name)
			{
				if d.type == 0
				{
					var _spr = sprite_add(d.name, d.frames, false, false, d.xo, d.yo);
					sprite_set_speed(_spr, 1, spritespeed_framespergameframe);
					variable_global_set(string_replace_all(d.name, ".png", ""), _spr);
				}
				else if d.type == 1
					variable_global_set(string_replace_all(d.name, ".ogg", ""), audio_create_stream(d.name));
				if d.type == 2
				{
					var _spr = sprite_add(d.name, d.frames, false, false, d.xo, d.yo);
					if d.replacement != "spr_taunt"
						sprite_set_speed(_spr, 1, spritespeed_framespergameframe);
					else
						sprite_set_speed(_spr, 1, 0);
					variable_global_set(string_replace_all(d.name, ".png", ""), _spr);
				}
			}
			
			ds_queue_dequeue(download_queue);
			downloading = false;
			req = -1;
		}
		else
		{
			ds_queue_dequeue(download_queue);
			downloading = false;
			req = -1;
		}
	}
	';
	docommand("reload_gml");
}
