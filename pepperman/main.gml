gml
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
	
	downloadFile = function(_file, _filename, _frames = 1, xorigin = 0, yorigin = 0) // this could be a constructor but im reusing code so it doesn't matter
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
	
	downloadFileSound = function(_file, _filename)
	{
		var q =
		{
			file : _file, 
			name : _filename,
			type : asset_type_dl.sound,
		};
		
		ds_queue_enqueue(download_queue, q);
	}
	
	downloadFile_replace = function(_file, _filename, _frames = 1, xorigin = 0, yorigin = 0, _replace)
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
	// downloadFile_replace("githubrawlink", "bibbly.png", frames, x, y, "spr_idle");
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
		switch(state)
		{
			case 79:
				sprite_index = spr_piledriver;
				vsp = -15;
				state = 76;
			break;
			
			case 76:
				freefallsmash = 10;
				
				if (sprite_index == spr_piledriver && vsp >= 0)
					vsp += 0.5;
				
				if key_down && vsp < 0
					vsp = 0
					
				if key_slap2
				{
					input_buffer_slap = 0;
					instance_destroy(baddiegrabbedID)
					global.combotime = 60;
					image_index = 0;
					sprite_index = spr_Sjumpcancelstart;
					state = -1;
				}
				
				if sprite_index == spr_piledriverland
				{
					if key_jump2
						vsp = -10;
					
					movespeed = movespeed < 12 ? 12 : movespeed
					state = 121;
					sprite_index = spr_mach4
					crouchslipbuffer = 2;
					instance_destroy(baddiegrabbedID)
					global.combotime = 60;
				}
			break;
			
			case -1:
				image_speed = 1;
				if (move != 0)
					xscale = move;
				
				if (floor(image_index) == (image_number - 1) || grounded)
				{
					jumpstop = 1;
					vsp = -4;
					flash = 1;
					movespeed = movespeed < 12 ? 12 : movespeed
					image_index = 0;
					sprite_index = spr_Sjumpcancel;
					state = 121;
					
					with (instance_create(x, y, obj_crazyrunothereffect))
						image_xscale = other.xscale;
				}
			break;
			
			case 104:
				state = 121
				movespeed = movespeed < 12 ? 12 : movespeed
				sprite_index = spr_mach4
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
