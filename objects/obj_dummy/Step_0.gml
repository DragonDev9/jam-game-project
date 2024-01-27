/// @description Insert description here
// You can write your code in this editor

event_inherited();



switch(state){

	case "parry":{
		
		xscale = sign(x - obj_player.x);
	
		spr = spr_dummy_parry;
		
		
	
	break;
	}//termina case parry

	case "idle":{
		
		xscale = sign(x - obj_player.x);
		
		spr = spr_dummy;
	
	break;
	}//termina case idle
	
	case "prepare_dash":{
	
		tempo_dash--;
		
		spr = spr_dummy_prepare_dash;
		
		destino_dash = obj_player.x;
		
		if tempo_dash <= 0 state = "dash";
	
	break;
	}//termina prepare dash
	
	case "dash":{
		
		tempo_dash = 60;
		
		spr = spr_dummy_dash;
		
		var _dir = point_direction(x,y,destino_dash,obj_player.y);
		
		hsp = lengthdir_x(max_hsp * dash_spd,_dir);
		
		var _dist = point_distance(x,y,destino_dash,obj_player.y);
		

		if _dist<16{
		
			state = "prepare_dash";
		
		}
		
		x+=hsp;
	
	break;
	}//termina case dash

}//termina switch







