gml
with(instance_create(x,y, obj_custom_object))
{
	persistent = 1;
	image_alpha = 0;
	global.entered_rooms = ds_list_create();
	seconds = 10;
	minutes = 0;
	oldsavedshit = [ds_list_create(), ds_list_create(), ds_list_create()];
	shittosave = [global.saveroom, global.escaperoom, global.baddieroom];
	toppins = ["shroomfollow", "cheesefollow", "tomatofollow", "sausagefollow", "pineapplefollow"];
	gameoveroption_names = ["CONTINUE LAP", "EXIT LEVEL"];
	selectedgameover = 0;
	global.lunge = sprite_add_gif("sprites/spr_snick_exe_lunge.gif", 50, 50);
	sprite_set_speed(global.lunge,60,60)
	global.lap3 = sprite_add("sprites/spr_lap3.png", 1, false, false, 123, 0);
	global.lap4 = sprite_add("sprites/spr_lap4.png", 1, false, false, 123, 0);
	global.lap3song = audio_create_stream("music\lap3_2.ogg");
	global.lap4song = audio_create_stream("music\lap4.ogg");
	step_event = @'
	with(epicboogaloo)
	{
		var maxspeed = 9;
		if(obj_player.state != 112)
		{
			if(distance_to_point(obj_player.x, obj_player.y) > 300)
			{
				sprite_index = global.lunge;
				if(!place_meeting(x,y, obj_afterimage))
				{
					with(instance_create(x,y, obj_afterimage))
					{
						sprite_index = other.sprite_index;
						image_xscale = epicboogaloo.image_xscale;
					}
				}
				maxspeed = 15;
			}
			else if(distance_to_point(obj_player.x, obj_player.y) < 300)
			{
				sprite_index = spr_snick_exe;
				maxspeed = 9;
			}
		}
		else
			maxspeed = 0;
		move_towards_point(obj_player.x, obj_player.y, maxspeed);
		if -sign(x-obj_player.x) != 0
			image_xscale = -sign(x-obj_player.x);
		if(place_meeting(x,y,obj_player) && obj_player.instakillmove == false && obj_player.state != 42)
		{
			with(instance_create(obj_player.x,obj_player.y, obj_forkhitbox))
			{
				image_xscale = epicboogaloo.image_xscale;
				ID = other.id;
			}
			instance_create(x,y, obj_genericpoofeffect);
			instance_destroy();
		}
		if(place_meeting(x,y,obj_player) && (obj_player.instakillmove == true || obj_player.state == 42) || (place_meeting(x,y, obj_baddie) && instance_place(x,y,obj_baddie).sprite_index == obj_baddie.spr_dead))
		{
			instance_create(x,y, obj_genericpoofeffect);
			instance_destroy();
		}
		if(place_meeting(x,y, obj_parryhitbox) && obj_player.state != 147)
		{
			instance_create(x,y, obj_genericpoofeffect);
			with(obj_player)
			{
				instance_create(x,y,obj_parryeffect);
				state=147;
				movespeed=10;
				sprite_index=choose(spr_player_parry1,spr_player_parry2,spr_player_parry3);
				flash=1;
				image_index=0;
			}
			instance_destroy();
		}
	}
	if(room != timesuproom)
	{
		if(global.laps >= 1)
		{
			if(global.fill>0)
			{
				global.fill = 0;
				global.panic = true;
			}
			with(obj_music)
			{
				if(!audio_is_playing(global.lap3song) && global.laps == 1)
				{
					audio_stop_sound(musicID);
					musicID = scr_music(global.lap3song);
				}
				if(!audio_is_playing(global.lap4song) && global.laps >= 2)
				{
					audio_stop_sound(musicID);
					musicID = scr_music(global.lap4song);
				}
			}
		}
		if(global.laps >= 2)
		{
			if(!instance_exists(epicboogaloo))
			{
				with(instance_create(x,y, epicboogaloo))
				{
					persistent = 1;
					x = room_width / 2;
					if(distance_to_point(obj_player.x, obj_player.y) > 300)
						y = -10;
					else
						y = -400;
				}
			}
			if(!instance_exists(obj_wartimer) && !instance_exists(obj_lapportal))
			{
				with(instance_create(x,y, obj_wartimer))
				{
					seconds = 10;
				}
			}
			if(ds_list_find_index(global.entered_rooms, room) == -1 && !instance_exists(obj_lapportal))
			{
				ds_list_add(global.entered_rooms, room);
				with (obj_wartimer)
				{
					for (addseconds += other.seconds; other.minutes > 0; addseconds += 60)
						other.minutes--;
					
					alarm[0] = -1;
					alarm[2] = 1;
				}
			}
			else if instance_exists(obj_lapportal)
			{
				instance_destroy(obj_wartimer);
				ds_list_clear(global.entered_rooms);
			}
		}
	}
	else if(room == timesuproom)
	{
		if(global.laps>0)
			gameoveroption_names = ["CONTINUE LAP" + string(saveddata.savedlaps+2), "EXIT LEVEL"];
		instance_destroy(epicboogaloo);
		instance_destroy(obj_pizzaface);
		instance_destroy(obj_wartimer)
		ds_list_clear(global.entered_rooms);
		instance_destroy(obj_timesupwar)
		scr_getinput();
		if key_jump
		{
			switch(selectedgameover)
			{
				case 0:
					selectedgameover = 0;
					global.collect = saveddata.savedscore;
					global.combo = saveddata.savedcombo;
					global.comboscore = saveddata.savedcomboscore;
					global.combotime = saveddata.savedcombotime;
					global.laps = saveddata.savedlaps;
					obj_player.targetRoom = saveddata.savedroom;
					obj_player.targetDoor = "LAP";
					global.panic = true;
					global.fill = 9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999;
					obj_player.isgustavo = false;
					for (var k = 0;k < array_length(saveddata.savedtoppins);k++)
						variable_global_set(toppins[k], saveddata.savedtoppins[k]);
					for (var i = 0;i < array_length(shittosave);i++) 
					{
						ds_list_clear(shittosave[i]);
						ds_list_copy(shittosave[i], oldsavedshit[i]);
					} 
					instance_create(0, 0, obj_fadeout);
					obj_tv.state = 0;
					obj_player.cutscene = false;
					instance_destroy(obj_combotitle);
					instance_destroy(obj_comboend);
					instance_destroy(obj_sandparticle);
				break;
				case 1:
					if (room == hub_room1 || room == characterselect || room == cowboytask || room == Titlescreen || room == Scootertransition || room == rm_levelselect || string_copy(room_get_name(room), 1, 3) == "hub")
						{
							selectedgameover = 0;
							instance_activate_all();
							room = Realtitlescreen; 
							with (obj_player1)
							{
								character = "P";
								scr_characterspr();
							}  
							scr_playerreset();
							obj_player1.state = 18;
							obj_player2.state = 18;
							obj_player1.targetDoor = "A"; 
							if (instance_exists(obj_player2))
								obj_player2.targetDoor = "A";
								global.cowboyhat = 0;
								global.coop = false;
						}
						else
						{
							selectedgameover = 0;
							instance_activate_all();
							scr_playerreset();
							global.levelreset = 1;
							obj_player1.targetDoor = "D";
							if (instance_exists(obj_player2))
								obj_player2.targetDoor = "D";
							room = global.hubroom;
						}
				break;
			}
		}
		if(key_up2 || key_down2)
		{
			switch(selectedgameover)
			{
				case 0:
					selectedgameover=1
				break;
				case 1:
					selectedgameover = 0;
				break;
			}
		}
	}
	with(obj_player)
	{
		if room = rm_levelselect && y != -100 && x != -100
		{
			state = 18;
			x = -100;
			y = -100;
		}
		if(room == timesuproom)
		{
			image_speed = 0.35
			cutscene = 1
			flash = 0
			alarm[0] = -1
			alarm[1] = -1
			alarm[3] = -1
			alarm[4] = -1
			alarm[5] = -1
			alarm[6] = -1
			alarm[7] = -1
			alarm[8] = -1
			alarm[9] = -1
			sprite_index = spr_Timesup
			image_index = image_number - 1
			hurted = 0
			inv_frames = 0
			y = 276
			x = 480
			state = 299329292;
		}
	}
	with(obj_lap2visual)
	switch(global.laps)
	{
		case 1:
			sprite_index = global.lap3;
		break;
		case 2:
			sprite_index = global.lap4;
		break;
	}
	';
	roomstart_event = @'
	if(global.laps >= 2)
	{
		with(epicboogaloo)
		{
			x = room_width / 2;
			y = -10;
		}
	}
	if instance_exists(obj_lapportalentrance) && global.laps >= 1
	{
		saveddata =
		{
			savedscore : global.collect, 
			savedcomboscore : global.comboscore,
			savedcombo : global.combo, 
			savedcombotime : global.combotime, 
			savedlaps : global.laps, 
			savedroom : room, 
			savedtoppins : [global.shroomfollow, global.cheesefollow, global.tomatofollow, global.sausagefollow, global.pineapplefollow], 
		}
		for (var i = 0;i < array_length(shittosave);i++) 
		{
			ds_list_clear(oldsavedshit[i]);
			ds_list_copy(oldsavedshit[i], shittosave[i]);
		} 
		global.fill = 0;
	}
	// room handler code below
	if(global.laps>0)
	{
		switch(room)
		{
			case farm_4:
			with(obj_platform)
			{
				if(id == 116798)
				{
					instance_destroy()
				}
			}
			break;
			case sewer_12:
				with(obj_tubeexitmach)
				{
					if(id = 147382)
					{
						instance_destroy()
					}
				}
				with(obj_tubeenter)
				{
					if(id = 147381)
					{
						instance_destroy()
					}
				}
				with(obj_solid)
				{
					if(id = 147379)
					{
						instance_destroy()
					}
					if(id = 147380)
					{
						image_yscale = 10;
					}
				}
			break;
			case graveyard_7:
			with(obj_platform)
				instance_destroy();
			break;
		}
	}
	';
	drawgui_event = @'
	if(room == timesuproom)
	{
		draw_set_font(global.bigfont);
		draw_set_halign(fa_middle);
		draw_set_valign(fa_center);
		for (var i = 0; i < array_length(gameoveroption_names); i++)
		{
			draw_set_color(i == selectedgameover ? c_white : c_gray);
			draw_text(display_get_gui_width() / 2, (display_get_gui_height()/1.5) + (50 * i), gameoveroption_names[i])
		}
	}
	';
	docommand("reload_gml")
}
