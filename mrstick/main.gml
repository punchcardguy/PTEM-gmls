gml
with(obj_player)
{
	savedmove = 1;
	lavatime = 0;
	sticktransfo = 0;
}
with (instance_create(0, 0, obj_custom_object_ext))
{
	persistent = true;
	image_alpha = 0;
	download_queue = ds_queue_create();
	global.cashmode = 0;
	fakeobjects = [];
	
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
	
	downloadFile_replace = function(_file, _filename, _frames = 1, xorigin = 0, yorigin = 0, _replace, _spritespeed = undefined) // i coded this using soys downloadfile as a base
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
			spritespeed : _spritespeed
		};
		
		ds_queue_enqueue(download_queue, q);
	}
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_Timesup.png", "playerMS_Timesup.png", 11, 100, 100, "spr_Timesup");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_backslide.png", "playerMS_backslide.png", 7, 100, 100, "spr_backslide");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_backslide.png", "playerMS_backslide.png", 7, 100, 100, "spr_backslideland");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_backslide.png", "playerMS_backslide.png", 7, 100, 100, "spr_machroll");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_bodyslamfall.png", "playerMS_bodyslamfall.png", 8, 100, 100, "spr_bodyslamfall");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_bodyslamland.png", "playerMS_bodyslamland.png", 5, 100, 100, "spr_bodyslamland");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_crawl.png", "playerMS_crawl.png", 6, 100, 100, "spr_crawl");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_crazyrun.png", "playerMS_crazyrun.png", 6, 110, 100, "spr_crazyrun");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_crouch.png", "playerMS_crouch.png", 3, 100, 100, "spr_crouch");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_crouchfall.png", "playerMS_crouchfall.png", 6, 100, 100, "spr_crouchfall");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_crouchfall.png", "playerMS_crouchfall.png", 6, 100, 100, "spr_crouchjump");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_crouchstart.png", "playerMS_couchstart.png", 5, 97, 73, "spr_couchstart");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_dashpad_real_real.png", "playerMS_dashpad_real_real.png", 4, 100, 100, "spr_dashpadmach", 40);
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_deathend.png", "playerMS_deathend.png", 3, 100, 100, "spr_deathend");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_dive.png", "playerMS_dive.png", 3, 100, 100, "spr_dive");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_fall.png", "playerMS_fall.png", 3, 100, 100, "spr_fall");
	downloadFile("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_fly.png", "playerMS_fly.png", 3, 97, 73);
	downloadFile("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_flystart.png", "playerMS_flystart.png", 9, 97, 73);
	downloadFile("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_flyturn.png", "playerMS_flyturn.png", 18, 110, 100);
	downloadFile("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_flybump.png", "playerMS_flybumped.png", 4, 140, 154); // please pig
	downloadFile("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_flybump_up.png", "playerMS_flybumped_up.png", 4, 140, 154); // thank you pig
	downloadFileSound("https://github.com/punchcardguy/PTEM-gmls/raw/refs/heads/main/mrstick/You%20Know%20You%20Want%20It!%20-%20Pizza%20Tower%20UST%20but%20amplified%20to%20hell.ogg", "youknowyouwant_it.ogg");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_hurt.png", "playerMS_hurt.png", 3, 100, 100, "spr_hurt");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_idle.png", "playerMS__idle.png", 18, 100, 100, "spr_idle");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_jump.png", "playerMS_jump.png", 6, 100, 100, "spr_jump");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_land.png", "playerMS_land.png", 4, 100, 100, "spr_land");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_land2.png", "playerMS_land2.png", 3, 100, 100, "spr_land2");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_mach12.png", "playerMS_mach.png", 6, 100, 100, "spr_mach");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_mach12.png", "playerMS_mach.png", 6, 100, 100, "spr_mach1");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_mach3.png", "playerMS_mach3.png", 3, 100, 100, "spr_mach4");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_mach3hit.png", "playerMS_mach3hit.png", 6, 182, 97, "spr_mach3hit");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_mach3hitwall.png", "playerMS_mach3hitwall.png", 8, 100, 100, "spr_hitwall", 30);
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_mach3jump.png", "playerMS_machjump.png", 5, 100, 100, "spr_mach3jump");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_machpunch1.png", "playerMS_machpunch1.png", 2, 182, 97, "spr_machpunch1");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_machslide.png", "playerMS_machslide.png", 3, 100, 100, "spr_machslide");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_machslideboost.png", "playerMS_machslideboost.png", 13, 100, 100, "spr_machslideboost");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_machslideboost3.png", "playerMS_machslideboost3.png", 13, 100, 100, "spr_mach3boost");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_machslideend.png", "playerMS_machslideend.png", 6, 100, 100, "spr_machslideend");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_machslidestart.png", "playerMS_machslidestart.png", 5, 100, 100, "spr_machslidestart");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_move.png", "playerMS_move.png", 19, 100, 100, "spr_move");
	downloadFile("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_nohat.png", "playerMS_nohat.png", 3, 97, 82);
	downloadFile("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_nohatstart.png", "playerMS_nohatstart.png", 8, 97, 82);
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_panic.png", "playerMS_panic.png", 3, 50, 50, "spr_panic");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_parry.png", "playerMS_parry.png", 11, 65, 60, "spr_parry1");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_parry.png", "playerMS_parry.png", 11, 65, 60, "spr_parry2");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_parry.png", "playerMS_parry.png", 11, 65, 60, "spr_parry3");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_rockethitwall.png", "playerMS_rockethitwall.png", 5, 219, 176, "spr_rockethitwall");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_rollgetup.png", "playerMS_rollgetup.png", 10, 182, 97, "spr_rollgetup");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_secondjump1.png", "playerMS_secondjump1.png", 4, 110, 100, "spr_secondjump1");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_secondjump1.png", "playerMS_secondjump1.png", 4, 110, 100, "spr_secondjump2");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_slipbanan1.png", "playerMS_slipbanan1.png", 4, 110, 100, "spr_slipbanan1");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_slipbanan2.png", "playerMS_slipbanan2.png", 8, 110, 100, "spr_slipbanan2");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_superjump.png", "playerMS_superjump.png", 14, 133, 195, "spr_superjump");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_superjumpprep.png", "playerMS_superjumpprep.png", 4, 100, 100, "spr_superjumpprep");
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_superspring.png", "playerMS_superspring.png", 3, 133, 195, "spr_superspring");
	downloadFile("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_swimming.png", "playerMS_swimming.png", 7, 110, 100);
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_taunt.png", "playerMS_taunt.png", 12, 110, 100, "spr_taunt", 0);
	downloadFile_replace("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_walkfront.png", "playerMS_walkfront.png", 13, 110, 100, "spr_walkfront");
	downloadFileSound("https://github.com/punchcardguy/PTEM-gmls/raw/refs/heads/main/mrstick/mrstickhat.ogg", "mrstickhat.ogg");
	downloadFile("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_coin.png", "coin.png", 1, 0, 0);
	downloadFile("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_money.png", "money.png", 1, 0, 0);
	downloadFile("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_money_big.png", "money_big.png", 1, 20, 5);
	downloadFile("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_stickchest.png", "stickchest.png", 1, 0, 0);
	downloadFile("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_stickchest_destroy.png", "stickchest__destroy.png", 16, 16, 16);
	downloadFile("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_stickchest_big.png", "stickchest_big.png", 1, 0, 0);
	downloadFile("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_stickchest_big_destroy.png", "stickchest_big_destroy.png", 15, 32, 32);
	downloadFileSound("https://github.com/punchcardguy/PTEM-gmls/raw/refs/heads/main/mrstick/mach2bump4.ogg", "mach2bump4.ogg");
	downloadFileSound("https://github.com/punchcardguy/PTEM-gmls/raw/refs/heads/main/mrstick/sfx_getguitar.ogg", "getguitar.ogg");
	downloadFile("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_stickguitar.png", "stickguitar.png", 1, 50, 50);
	downloadFile("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_stickhat.png", "stickhat.png", 5, 25, 25);
	downloadFile("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_guitareffect.png", "guitareffect.png", 7, 50, 50);
	downloadFile("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_guitar.png", "playerMS_guitar.png", 1, 100, 100);
	downloadFile("https://raw.githubusercontent.com/punchcardguy/PTEM-gmls/main/mrstick/spr_playerMS_guitarland.png", "playerMS_guitarland.png", 6, 100, 100);
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

				if d[$ "spritespeed"] == undefined 
					sprite_set_speed(_spr, 1, spritespeed_framespergameframe);
				else
					sprite_set_speed(_spr, d.spritespeed, d.spritespeed);
				variable_global_set(_name, _spr); 
				with obj_player variable_instance_set(id, d.replacement, variable_global_get(_name))
			}
			
			ds_queue_dequeue(download_queue);
		} 
	}
	with(obj_player)
	{
		idle = 69;
		windingAnim = 0;
		
		if room == rm_levelselect || ds_list_empty(global.saveroom)
			sticktransfo = 0;
		
		if(place_meeting(x+hsp,y+vsp, obj_ratblock) && (global.leveltosave != "medieval" || sticktransfo == 1 && state == 198))
			instance_destroy(instance_place(x+hsp,y+vsp, obj_ratblock));
		
		if lavatime > 0
			lavatime--;
			
		if lavatime > 60 && state != 3 && state != 89 && state != 31 && state != 186
		{
			if (state != 9)
				tv_push_prompt_once(tv_create_prompt("This is the fireass transformation text", 2, _spr_tv_fireass, 3), "fireass");
			state = 9
			vsp = -20
			sprite_index = spr_fireass
			image_index = 0
			movespeed = hsp
			if (!audio_is_playing(sfx_scream5))
				scr_soundeffect(sfx_scream5)
			lavatime = 0;
		}
		
		var _b = instance_place(x + hsp, y + vsp, obj_bigcollect)
		
		if (_b && _b.object_index != obj_escapecollectbig || _b && global.panic)
		{
			with _b
			{
				if !place_meeting(x,y, obj_solid)
					instance_destroy()
				else
					exit;
				
				array_push(obj_custom_object_ext.fakeobjects, 
				{
					_object : 1,
					collected : heat_calculate(25),
					duration : 0,
					_x : x,
					_y : y,
				})
			}
		}
		
		switch(state)
		{
			case 37:
				image_speed = 0.25
				state = 5000
				image_index = 0;
				sprite_index = global.playerMS_flystart
			break;
			
			case 92:
				if image_index == 0 && sprite_index == spr_jump
					vsp = -15;
			break;
			
			case 84:
				if tauntstoredsprite = spr_jump // no flying allowed as the flying character
				{
					tauntstoredsprite = spr_fall;
					tauntstoredvsp /= 2;
				}
			break;
			
			case 5000:
				move = key_left+key_right
				movespeed = abs(hsp)
				// scr_destroy_destructibles(hsp, vsp);
				
				if !audio_is_playing(global.mrstickhat)
					scr_soundeffect(global.mrstickhat)
				
				if (move != 0)
					savedmove = move;
				
				if (scr_solid(x, y - 1) && sprite_index != global.playerMS_flybumped && !place_meeting(x, y - 1, obj_destructibles))
				{	
					vsp = 6;
					sprite_index = global.playerMS_flybumped_up;
					image_index = 0;
					scr_soundeffect(global.mach2bump4)
				}
				
				if (!scr_slope() && place_meeting(x + hsp, y, obj_solid) && !place_meeting(x + hsp, y, obj_destructibles) && sprite_index != global.playerMS_flybumped_up)
				{
					image_index = 0;
					sprite_index = global.playerMS_flybumped;
					hsp /= -1.5
					movespeed /= 2
					scr_soundeffect(global.mach2bump4)
				}
				
				vsp -= grav
				
				if(sprite_index != global.playerMS_flyturn && sprite_index != spr_superjump && sprite_index != spr_superjumpprep && sprite_index != global.playerMS_flystart)
				{
					if key_down || key_up
						vsp = Approach(vsp, (key_down + -key_up)*12, 1);
					else
						vsp = Approach(vsp, 0, 0.35);
					
					if move != 0
						hsp = Approach(hsp, 12*move, 1);
					else
						hsp = Approach(hsp, 0, 0.35);
					
					if hsp != 0
						xscale = sign(hsp)
					
					if(sprite_index == global.playerMS_swimming || sprite_index == global.playerMS_fly)
					{
						if movespeed < 8
						{
							sprite_index = global.playerMS_fly
							image_speed = 0.25
						}
						else
						{
							sprite_index = global.playerMS_swimming
							image_speed = 0.2
						}
					}
				}
				
				if key_slap2 && sprite_index != global.playerMS_flyturn
				{
					xscale = savedmove;
					sprite_index = global.playerMS_flyturn
					image_index = 0
					vsp = 0
					suplexdashsnd = audio_play_sound(sfx_suplexdash, 1, false);
					sfx_gain(suplexdashsnd);
				}
				
				if sprite_index == global.playerMS_flyturn
				{
					if key_up
						vsp = Approach(vsp, -key_up*2, 0.35);
					
					image_speed = 0.5
					
					if floor(image_index) == (image_number - 1)
						sprite_index = global.playerMS_fly
					
					if abs(hsp) < 12
						hsp = 12*xscale
					
					instakillmove = true;
					
					if !grounded && key_down
					{
						audio_stop_sound(global.mrstickhat)
						state = 108;
					}
				}
				
				if key_jump && sprite_index != spr_superjumpprep
				{
					image_speed = 0.1
					array_push(other.fakeobjects, 
					{
						_object : 4,
						sprite_index : global.stickhat,
						image_index : 0,
						x : x,
						y : y - 16
					});
					movespeed = hsp
					state = 306;
					sprite_index = global.playerMS_nohatstart
					if !grounded
						vsp -= 4
					else
						vsp = -4
					image_index = 0;
					audio_stop_sound(global.mrstickhat)
					scr_soundeffect(sfx_fakepepheadthrow)
				}
				
				if sprite_index == spr_superjump
				{
					image_speed = 0.2
					if floor(image_index) == (image_number - 1)
						sprite_index = global.playerMS_fly
					
					vsp = -20;
					instakillmove = true;
				}
				
				if sprite_index == spr_superjumpprep
				{
					image_speed = 0.25
					
					if (!place_meeting(x, y, obj_doorblocked) && place_meeting(x, y, obj_door))
						state = 99
					
					if floor(image_index) == (image_number - 1)
					{
						sprite_index = spr_superjump
						scr_soundeffect(sfx_superjumprelease)
					}
				}
				
				if sprite_index == global.playerMS_flybumped || sprite_index == global.playerMS_flybumped_up
				{
					if floor(image_index) == (image_number - 1)
						sprite_index = global.playerMS_fly
				}
				
				if sprite_index == global.playerMS_flystart
				{
					wallspeed = clamp(wallspeed, 6, 12)
					vsp = -wallspeed
					hsp = 3*-xscale
					
					if floor(image_index) == image_number - 1
						sprite_index = global.playerMS_fly
						
					image_speed = 0.25
				}
				
				var _box = instance_place(x + hsp, y + vsp, obj_boxofpizza)
				if _box
				{
					if _box.image_yscale == -1
						state = 97;
					else
						state = 108;
					x = _box.x
					y = _box.y
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
					movespeed = Approach(movespeed, move * 12, 0.25);
				else
					movespeed = Approach(movespeed, 0, 0.25);
				if grounded && vsp >= 0
				{
					if key_attack
					{
						xscale = savedmove;
						
						jumpstop = true;
						if !key_down
							state = 121;
						else
							state = 5
						if abs(movespeed) < 12
							movespeed = 12;
						else
							movespeed = abs(movespeed)
						
						sprite_index = state == 5 ? spr_machroll : spr_dashpadmach;
						
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
				switch(sticktransfo)
				{
					case 0:
						move = key_left + key_right
						state = 5000
						flash = 0;
						sprite_index = global.playerMS_flyturn
						image_index = 0
						vsp = 0
						if move != 0
							xscale = move;
						
						if movespeed < 12
							hsp = 12*xscale;
						else
							hsp = movespeed*xscale
					break;
					case 1:
						movespeed = hsp
						state = 198;
						sprite_index = global.playerMS_guitar;
						image_index = 0;
						vsp = -16;
					break;
				}
			break;
			
			case 99:
				if(!place_meeting(x+hsp, y, obj_door))
					state = 5000
			break;
			
			case 80:
				audio_stop_sound(sfx_uppercut2)
				vsp = 0;
				sprite_index = spr_superjumpprep
				state = 5000
				hsp = 0;
				movespeed = 0;
			break;
			case 198: // wait what fucking state is this
			if(sprite_index == global.playerMS_guitarland) // dosent matter im reusing doodoo noise code lmfao
			{
				hsp = 0;
				vsp = 0;
				movespeed = 0;
				
				if(image_index >= (image_number - 2))
					state = 0;
			}
			if(sprite_index == global.playerMS_guitar)
			{
				instakillmove = true;
				hsp = movespeed*xscale;
				move = key_left + key_right;
				scr_destroy_destructibles(hsp, vsp);
				
				var _b = instance_place(x, y + 1, obj_metalblock)
				
				if _b
					instance_destroy(_b)
				
				if (vsp > 0)
					vsp += 0.5;
				if (move != 0 && movespeed < 12)
					movespeed = Approach(movespeed, move * 12, 1);
				else if move == 0
					movespeed = Approach(movespeed, 0, 0.5);
				
				if key_slap2
				{
					move = key_left + key_right
					state = 5000
					flash = 0;
					sprite_index = global.playerMS_flyturn
					image_index = 0
					vsp = 0
					if move != 0
						xscale = move;
					
					if movespeed < 12
						hsp = 12*xscale;
					else
						hsp = movespeed*xscale|
					
					suplexdashsnd = audio_play_sound(sfx_suplexdash, 1, false);
					sfx_gain(suplexdashsnd);
				}
				
				if key_jump && vsp < -4
				{
					vsp = -3
					movespeed = 16*xscale
					scr_soundeffect(sfx_superjumprelease)
				}
		
				if (sprite_index != global.playerMS_guitarland && sprite_index != global.playerMS_guitar && sprite_index != global.playerMS_flyturn)
				{
					sprite_index = global.playerMS_guitar;
					image_index = 0;
				}
				
				 if (grounded && !place_meeting(x, y + vsp, obj_destructibles) && !place_meeting(x, y + 15, obj_destructibles) && !place_meeting(x, y + 15, obj_metalblock) && !place_meeting(x, y + vsp + 5, obj_metalblock) && !place_meeting(x, y + 15, obj_grindrail))
				{
					with (instance_create(x + 40, y, obj_parryeffect))
					{
						hspeed = 5;
						sprite_index = global.guitareffect;
					}
			
					with (instance_create(x - 40, y, obj_parryeffect))
					{
						image_xscale = -1;
						hspeed = -5;
						sprite_index = global.guitareffect;
					}
        
					with (obj_baddie)
					{
						if (shakestun && grounded && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0 && !invincible && groundpound)
						{
							state = 138;
                
							if (stunned < 60)
								stunned = 60;
                
							vsp = -11;
							image_xscale *= -1;
							hsp = 0;
							momentum = 0;
						}
					}
					with (obj_camera)
					{
						shake_mag = 10;
						shake_mag_acc = 30 / room_speed;
					}
        
					scr_soundeffect(sfx_groundpound)
					sprite_index = global.playerMS_guitarland;
					image_index = 0;
					create_particle(x, y + 3, 14, 0);
				}
    
				scr_dotaunt();
			}
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
	with(obj_parryeffect)
	{
		if sprite_index == spr_pizzablockdead
		{
			var _c = heat_calculate(5)
			global.collect -= _c
			
			array_push(other.fakeobjects, 
			{
				_object : 1,
				collected : _c,
				duration : 0,
				_x : x,
				_y : y
			});
			
			sprite_index = global.stickchest__destroy
		}
		if sprite_index == spr_bigpizzablockdead
		{
			var _c = heat_calculate(50)
			global.collect -= _c
			
			array_push(other.fakeobjects, 
			{
				_object : 1,
				collected : _c,
				duration : 0,
				_x : x - 16,
				_y : y - 16
			});
			
			sprite_index = global.stickchest_big_destroy
		}
		
		if sprite_index == global.guitareffect
		{
			if(place_meeting(x+hspeed,y+vspeed, obj_ratblock))
				instance_destroy(instance_place(x+hspeed,y+vspeed, obj_ratblock));
			
			if(place_meeting(x+hspeed,y+vspeed, obj_baddie))
				instance_destroy(instance_place(x+hspeed,y+vspeed, obj_baddie));
			
			scr_destroy_destructibles(hspeed, vspeed)
		}
	}
	
	if room == rm_levelselect
	{
		if obj_player.key_taunt2
		{
			global.cashmode = !global.cashmode
			instance_destroy(obj_transfotip)
			instance_create(0, 0, obj_transfotip).text = global.cashmode ? "/{u} Cash mode on /" : "/{u} Cash mode off /";
		}
	}
	
	for(var len = array_length(fakeobjects), i = len - 1; i >= 0; i--)
	{
		switch(fakeobjects[i]._object)
		{
			case 1: // obj_moneypool
				if fakeobjects[i].duration > 0
				fakeobjects[i].duration--;
				
				if fakeobjects[i].collected > 0 && fakeobjects[i].duration <= 0
				{
					create_collect(fakeobjects[i]._x, fakeobjects[i]._y, global.money)
					fakeobjects[i].collected--;
					global.collect += heat_calculate(4)
					fakeobjects[i].duration = 3
					global.heattime += 10
					global.heattime = clamp(global.heattime, 0, 60)
					global.combotime += 10
					global.combotime = clamp(global.combotime, 0, 60)
					if audio_is_playing(sfx_collecttopping)
						audio_stop_sound(sfx_collecttopping)
					scr_soundeffect(sfx_collecttopping)
				}
				else if fakeobjects[i].collected <= 0
					array_delete(fakeobjects, i, 1);
			break;
			
			case 2: // lava spelled correctly
				with fakeobjects[i]
				{
					var img_number = sprite_get_number(sprite_index)
					if image_index != img_number
						image_index += 0.35
					else
						fakeobjects[i].image_index = 0;
					
					var bbox_left = x + (sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index)) * image_xscale;
					var bbox_top = y + (sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index)) * image_yscale;
					var bbox_right = x + (sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index)) * image_xscale;
					var bbox_bottom = y + (sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index)) * image_yscale;
		
					if (rectangle_in_rectangle(obj_player1.bbox_left, obj_player1.bbox_top, obj_player1.bbox_right, obj_player1.bbox_bottom, bbox_left, bbox_top, bbox_right, bbox_bottom) && obj_player.state != 9)
						obj_player.lavatime+=2;
				}
			break;
			case 3:
				with fakeobjects[i]
				{
					var bbox_left = x + (sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index))
					var bbox_top = y + (sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index))
					var bbox_right = x + (sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index))
					var bbox_bottom = y + (sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index))
				
					if (rectangle_in_rectangle(obj_player1.bbox_left, obj_player1.bbox_top, obj_player1.bbox_right, obj_player1.bbox_bottom, bbox_left, bbox_top, bbox_right, bbox_bottom))
					{
						obj_player.sticktransfo = 1;
						scr_soundeffect(global.getguitar);
						instance_create(x, y, obj_bumpeffect);
						array_delete(other.fakeobjects, i, 1)
					}
				}
			break;
			
			case 4:
				with fakeobjects[i]
				{
					var img_number = sprite_get_number(sprite_index)
					if image_index != img_number
						image_index += 0.35
					else
						fakeobjects[i].image_index = 0;
					y -= 1;
					if obj_player.state != 306 && obj_player.state != 61
					{
						instance_create(x,y,obj_genericpoofeffect)
						array_delete(other.fakeobjects, i, 1);
					}
				}
			break;
			
			case 5:
				with fakeobjects[i]
				{
					var bbox_left = x + (sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index))
					var bbox_top = y + (sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index))
					var bbox_right = x + (sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index))
					var bbox_bottom = y + (sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index))
					if obj_player1.sprite_index != obj_player1.spr_walkfront
						image_index = global.collect > global.arank ? 1 : 0;
					else
						image_index = 1;
				
					if (rectangle_in_rectangle(obj_player1.bbox_left, obj_player1.bbox_top, obj_player1.bbox_right, obj_player1.bbox_bottom, bbox_left, bbox_top, bbox_right, bbox_bottom))
					{
						with(obj_player1)
						{
							if (floor(image_index) == (image_number - 1) && sprite_index == spr_Timesup)
								state = 0;
							
							if (global.collect > global.arank && (!instance_exists(obj_uparrow)) && scr_solid(x, (y + 1)) && state == 0 && spotlight == 1)
							{
								with (instance_create(x, y, obj_uparrow))
									playerid = obj_player1
							}
							
							if (state == 95 && floor(image_index) == (image_number - 2) && sprite_index != spr_Timesup)
							{
								scr_soundeffect(sfx_groundpound);
								GamepadSetVibration(0, 1, 1, 0.9);
								GamepadSetVibration(1, 1, 1, 0.9);
								
								with (obj_player1)
								{
									lastroom = room;
									sprite_index = spr_Timesup;
									image_index = 0;
									
									with (obj_camera)
									{
										shake_mag = 10;
										shake_mag_acc = 30 / room_speed;
									}
								}
								
								ds_list_add(global.saveroom, other.id);
							}
							
							if (grounded && x > (other.x - 160) && x < (other.x + 160) && key_up && (state == 0 || state == 104 || state == 121) && global.collect > global.arank)
							{
								var ex = x
								var ey = y
								var cx = camera_get_view_x(view_camera[0])
								var cy = camera_get_view_y(view_camera[0])
								rankpos_x = (ex - cx)
								rankpos_y = (ey - cy)
								if (global.timeattack == 1)
									obj_timeattack.stop = 1
								targetDoor = "none"
								if (global.combo > 0)
								{
									global.combotime = 0;
									global.combo = 0;
									obj_camera.alarm[4] = -1;
									global.comboscore = 0;
								}
								obj_camera.alarm[2] = -1
								var roomname = room_get_name(room)
								var namestring = string_letters(roomname)
								scr_savescore(global.leveltosave)
								if (!instance_exists(obj_endlevelfade))
									instance_create(x, y, obj_endlevelfade)
								state = 112
								sprite_index = spr_lookdoor
								obj_endlevelfade.alarm[0] = 235
								image_index = 0
								global.panic = false
								global.snickchallenge = 0
								gamesave_async_save()
							}
						}
					}
				}
			break;
		}
	}
	
	with (obj_camera)
		collect_shake = 0
		
	with(obj_destructibles)
	{
		var _p = obj_player
		if(_p.state == 5000 && distance_to_point(_p.x + _p.hsp, _p.y + _p.vsp) < 25) // i love doing fuck all
			instance_destroy()
	}
		
	instance_destroy(obj_grabmarker)
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
					if d[$ "spritespeed"] == undefined 
						sprite_set_speed(_spr, 1, spritespeed_framespergameframe);
					else
						sprite_set_speed(_spr, d.spritespeed, d.spritespeed);
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
	event.room_start[0] = @'
	for(var len = array_length(fakeobjects), i = len - 1; i >= 0; i--)
	{
		switch(fakeobjects[i]._object)
		{
			case 1:
				if fakeobjects[i].collected > 0
				{
					if room != rm_levelselect && !ds_list_empty(global.saveroom)
						global.collect += heat_calculate(4)*fakeobjects[i].collected
					
					fakeobjects[i].collected = 0;
				}
			break;
			case 2:
			case 3:
			case 5:
				array_delete(fakeobjects, i, 1);
			break;
		}
	}
	with(obj_destroyable2)
		sprite_index = global.stickchest
	with(obj_destroyable2_big)
		sprite_index = global.stickchest_big
	with(obj_collect)
		sprite_index = global.coin
	with(obj_bigcollect)
		sprite_index = global.money_big
	with(obj_boilingsauce)
	{
		array_push(other.fakeobjects, 
		{
			_object : 2,
			sprite_index : sprite_index,
			image_index : 0,
			x : x,
			y : y,
			image_yscale : image_yscale,
			image_xscale : image_xscale,
			image_blend : image_blend,
			image_alpha :image_alpha,
			image_angle : image_angle
		})
		
		instance_destroy()
	}
	with(obj_swordstone)
	{
		if obj_player.sticktransfo != 1
		{
			array_push(other.fakeobjects, 
			{
				_object : 3,
				sprite_index : global.stickguitar,
				image_index : 0,
				x : x,
				y : y
			})
		}
		
		instance_destroy()
	}
	
	instance_destroy(obj_shotgunblock)
	
	if global.leveltosave == "medieval"
		instance_destroy(obj_priest)
	
	if(global.cashmode)
	{
		with(obj_hungrypillar)
		{
			ds_list_add(global.saveroom, id)
			instance_destroy()
		}
		
		instance_destroy(obj_minipillar)
		instance_destroy(obj_reverseminipillar)
		instance_destroy(obj_lapportal)
		
		if ds_list_size(global.baddieroom) >= 20 && global.collect > global.arank
			ds_list_clear(global.baddieroom)
			
		instance_destroy(obj_escapespawn)
		instance_activate_object(obj_baddie)
		
		with(obj_exitgate)
		{
			array_push(other.fakeobjects, 
			{
				_object : 5,
				sprite_index : sprite_index,
				image_index : image_index,
				id : id,
				x : x,
				y : y
			})
			
			instance_destroy()
		}
		
		if room != rm_levelselect && !global.panic && room != timesuproom && room != rank_room
		{
			with(obj_music)
			{
				if(!audio_is_playing(escapemusicID))
				{
					music = escapemusicID;
					audio_stop_sound(musicID);
					musicID = scr_music(music);
				}
			}
			
			global.fill = 4000;
    
			with (obj_tv)
				chunkmax = global.fill;
			
			global.panic = true;
			switch(room)
			{
				case entrance_10:
					global.minutes = 2;
					global.seconds = 30;
					break;
				
				case medieval_10:
					global.minutes = 2;
					global.seconds = 15;
					break;
				
				case ruin_11:
					global.minutes = 2;
					global.seconds = 59;
					break;
				
				case dungeon_10:
					global.minutes = 4;
					global.seconds = 30;
					break;
				
				case chateau_6:
					global.minutes = 3;
					global.seconds = 15;
					break;
				
				case strongcold_1:
					global.minutes = 4;
					global.seconds = 0;
					break;
				
				case dragonlair_1:
					global.minutes = 0;
					global.seconds = 59;
					break;
				
				case desert_16:
					global.minutes = 2;
					global.seconds = 30;
					break;
				
				case graveyard_6:
					global.minutes = 3;
					global.seconds = 59;
					break;
				
				case farm_11:
					global.minutes = 3;
					global.seconds = 59;
					break;
				
				case pinball_17:
					global.minutes = 3;
					global.seconds = 12;
					break;
				
				case beach_13:
					global.minutes = 3;
					global.seconds = 30;
					break;
				
				case forest_5:
					global.minutes = 3;
					global.seconds = 30;
					break;
				
				case minigolf_8:
					global.minutes = 7;
					global.seconds = 30;
					break;
				
				case space_9:
					global.minutes = 5;
					global.seconds = 30;
					break;
				
				case sewer_8:
					global.minutes = 5;
					global.seconds = 30;
					break;
				
				case city_11:
					global.minutes = 5;
					global.seconds = 30;
					break;
				
				case mansion_7:
					global.minutes = 5;
					global.seconds = 30;
					break;
				
				case factory_10:
					global.minutes = 6;
					global.seconds = 30;
					break;
				
				case freezer_3:
					global.minutes = 5;
					global.seconds = 30;
					break;
				
				case war_1:
					global.minutes = 6;
					global.seconds = 30;
					break;
				
				case exit_1:
					global.minutes = 9;
					global.seconds = 59;
					break;
				
				case kidsparty_lastroom:
					global.minutes = 3;
					global.seconds = 30;
					break;
				
				case custom_lvl_room:
					global.minutes = 2;
					global.seconds = 15;
					break;
				
				default:
					global.minutes = 5;
					global.seconds = 30;
					break;
			}
		}
	}
	';
	event.draw[0] = @'
	for(var len = array_length(fakeobjects), i = len - 1; i >= 0; i--)
	{
		switch(fakeobjects[i]._object)
		{
			case 2: // lalva FUCK
			with fakeobjects[i]
			{
				for (var xx = 0; xx < abs(image_xscale); xx++)
					draw_sprite_ext(sprite_index, image_index, (x + (xx * 32)), y, 1, image_yscale, image_angle, image_blend, image_alpha)
			}

			break;
			
			case 3: // guitar
			case 4: // hat
			case 5: // fake exitgate
				draw_sprite(fakeobjects[i].sprite_index, fakeobjects[i].image_index, fakeobjects[i].x, fakeobjects[i].y)
			break;
		}
	}
	';
	
	event.draw_gui[0] = @'
	if(global.cashmode)
	{
		draw_set_halign(fa_middle);
		draw_set_valign(fa_top);
		draw_set_font(font1);
		draw_set_color(c_white);
		
		draw_text(75, 500, string(global.collect) + "/" + string(global.arank))
	}
	';
	docommand("reload_gml");
}
