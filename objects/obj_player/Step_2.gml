/// @description Insert description here
// You can write your code in this editor



repeat(abs(hsp)){

	var _hsp = sign(hsp);
	
	if place_meeting(x+_hsp,y,obj_col){
	
		hsp = 0;
		break;
		
	}else{
		
		x+=_hsp;
	
	}


}//termina repeat hsp


repeat(abs(vsp)){

	var _vsp = sign(vsp);

	if place_meeting(x,y+_vsp,obj_col){
	
		vsp = 0;
		break;
	}else{
	
		y += _vsp;
	
	}
	

}//termina repeat vsp




