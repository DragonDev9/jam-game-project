/// @description Insert description here
// You can write your code in this editor

event_inherited();

#region variaveis

max_hsp = 7;
max_vsp = 15;

//sprites
sprites = [

	//idle
	[spr_player_idle],
	
	//andando
	[spr_player_moving],
	
	//light attack
	[spr_player_punch],
	
	//heavy attack
	[spr_player_heavy_punch],
	
	//parried
	[spr_player_parried]
];

spr = spr_player_idle;

#endregion


attacks = function(){

	var _light, _heavy;
	
	_light = keyboard_check_pressed(ord("A"));
	_heavy = keyboard_check_pressed(ord("D"));
	
	if _light && !_heavy state = "light";
	if _heavy && !_light state = "heavy";
	
}//termina attacks

////////////////////////////////////////////////////////////////////////

mov = function(){

	
	var _left, _right;
	
	_left = keyboard_check(vk_left);
	_right = keyboard_check(vk_right);


	hsp = (_right-_left) * max_hsp;
	
	if _left || _right{
		state = "moving";
		
	}else{
		state = "idle";
		
	}

	if _left xscale = -1;
	if _right xscale = 1;

}//termina mov

//////////////////////////////////////////////////////////////////////
	
pulo = function(){

	var _pulo = keyboard_check_pressed(vk_up);
	
	if _pulo vsp-=max_vsp;

}//termina pulo

//////////////////////////////////////////////////////////////////////////


	
muda_estado = function(){


	switch(state){
	
		case "idle": {
		
			
		
			mov();
			
			mov_state = 0;
			
			muda_sprite(0);
			
			attacks();
			
			pulo();
		
		break;
		}//termina case idle
	
		case "moving":{
		
			
			mov();
			
			mov_state = 1;
		
			muda_sprite(0);
		
			attacks();
			
			pulo();
		
		break;
		}//termina case moving
	
	
		case "jumping":{
		
			if place_meeting(x,y+1,obj_col){
			
				state = "idle";
			
			}
		
		break;
		}//termina jumping
	
		case "light":{
		
			hsp = 0;
			vsp = 0;
		
			mov_state = 2;
			
			muda_sprite(0);
			
			//criando o hitbox do ataque
			
			var _xx = x + (xscale * sprite_get_width(spr_col)/2);
			var _yy = y - sprite_get_height(spr)*.2;
			
			
			
			////////////////////
			
			termina_animacao(true,_xx,_yy,1, obj_player);
		
		break;
		}//termina light
		
		case "heavy":{
			
			hsp = 0;
			vsp = 0;
			
			mov_state = 3;
			
			muda_sprite(0);
			
			
			var _xx = x + (xscale * sprite_get_width(spr_col)/2);
			var _yy = y - sprite_get_height(spr)*.2;
			
			
			termina_animacao(true, _xx, _yy, 2, obj_player);
		
		break;
		}//termina heavy 
	
		case "parried":{
		
			mov_state = 4;
			
			muda_sprite(0);
			
			termina_animacao();
		
		}
	
	}//termina swtich state



}//termina muda estado