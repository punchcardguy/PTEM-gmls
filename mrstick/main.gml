gml
with obj_player savedmove = move;
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
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_bodyslamfall.png?raw=true", "playerMS_bodyslamfall.png", 8, 100, 100, "spr_bodyslamfall");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_bodyslamland.png?raw=true", "playerMS_bodyslamland.png", 5, 100, 100, "spr_bodyslamland");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_crawl.png?raw=true", "playerMS_crawl.png", 6, 100, 100, "spr_crawl");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_crazyrun.png?raw=true", "playerMS_crazyrun.png", 6, 100, 100, "spr_crazyrun");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_crouch.png?raw=true", "playerMS_crouch.png", 6, 100, 100, "spr_crouch");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_crouchfall.png?raw=true", "playerMS_crouchfall.png", 6, 100, 100, "spr_crouchfall");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_crouchstart.png?raw=true", "playerMS_couchstart.png", 5, 100, 100, "spr_couchstart");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_dashpad.png?raw=true", "playerMS_dashpad.png", 3, 100, 100, "spr_dashpad");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_deathend.png?raw=true", "playerMS_deathend.png", 3, 100, 100, "spr_deathend");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_dive.png?raw=true", "playerMS_dive.png", 3, 100, 100, "spr_dive");
	downloadFile_replace("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_fall.png?raw=true", "playerMS_fall.png", 3, 100, 100, "spr_fall");
	downloadFile("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_fly.png?raw=true", "playerMS_fly.png", 3, 100, 100);
	downloadFile("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_flybump.png?raw=true", "playerMS_flybump.png", 4, 100, 100);
	downloadFile("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_flystart.png?raw=true", "playerMS_flystart.png", 9, 100, 100);
	downloadFile("https://github.com/punchcardguy/PTEM-gmls/blob/main/mrstick/spr_playerMS_flyturn.png?raw=true", "playerMS_flyturn.png", 18, 100, 100);
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
				sprite_set_speed(_spr, 1, spritespeed_framespergameframe);
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
				state = 5001
				image_index = 0;
				sprite_index = spr_mrstick_panic
				delay = 30;
			break;
			
			case 5000:	// placeholder sprites
				move = key_left+key_right
				movespeed = abs(hsp)
				image_speed = 0.5
				scr_destroy_destructibles(hsp, vsp);
				
				if (move != 0)
					savedmove = move;
				
				if sprite_index != spr_superjump
					vsp -= grav
				
				if sprite_index != global.playerMS_flyturn && sprite_index != spr_superjump
				{
					sprite_index = spr_mrstick_helicopterhat
					
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
					
					if key_jump2
					{
						movespeed = hsp
						state = 306;
						sprite_index = spr_mach4
						if !grounded
							vsp -= 4
					}
					
					scr_dotaunt();
				}
				
				if sprite_index == global.playerMS_flyturn
				{
					if floor(image_index) == (image_number - 1)
						sprite_index = spr_mrstick_helicopterhat
					
					hsp = 12*xscale
					
					instakillmove = true;
					
					if !grounded && key_down
						state = 108;
				}
				
				if sprite_index == spr_superjump
				{
					if vsp > -5
						sprite_index = spr_mrstick_helicopterhat
				}
				
				if (scr_solid(x + sign(hsp), y) && !place_meeting(x + sign(hsp), y, obj_mach3solid) && !scr_slope() && (scr_solid_slope(x + sign(hsp), y) || place_meeting(x + sign(hsp), y, obj_solid)) && !(place_meeting(x + sign(hsp), y, obj_metalblock)) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_climbablewall))
				{
					var _bump = ledge_bump((vsp >= 0) ? 32 : 22);
					if (_bump)
					{
						hsp = -3*sign(prevhsp)
						sprite_index = spr_mrstick_helicopterhat
					}
				}
			break;
			
			case 5001:
				delay--;
				vsp = -6-grav
				hsp = 3*-xscale
				
				if delay == 0
					state = 5000
				
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
				sprite_index = spr_bodyslamfall
			break;
			
			case 306:
				hsp = movespeed;
				move = key_right + key_left;
				
				instakillmove = true;
				
				if (move != 0)
					savedmove = move;
					
				image_speed = 0.5;
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
	';
	event.http[0] = @'
	if async_load[? "id"] == req
	{
		if async_load[? "status"] == 0
		{
			var d = ds_queue_head(download_queue);
			
			if file_exists(d.name)
			{
				if d.type == 0 || d.type == 2
				{
					var _spr = sprite_add(d.name, d.frames, false, false, d.xo, d.yo);
					sprite_set_speed(_spr, 1, spritespeed_framespergameframe);
					variable_global_set(string_replace_all(d.name, ".png", ""), _spr);
				}
				else if d.type == 1
					variable_global_set(string_replace_all(d.name, ".ogg", ""), audio_create_stream(d.name));
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
