with (obj_player)
{
	if (hascontrol)
	{
		hascontrol = false;
		scr_slide_transition(TRANS_MODE.GOTO, rm_level7_continue);
	}
	
}