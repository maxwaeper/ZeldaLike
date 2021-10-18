function HurtPlayer(_direction,_force,_damage)
{
	if (obj_player.invulnerable <= 0)
	{
		global.playerHealth = max(0, global.playerHealth - _damage);
		
		if (global.playerHealth > 0)
		{
			with (obj_player)
			{
				state = scr_PlayerStateBonk;
				direction = _direction - 180;
				moveDistanceRemaining = _force;
				scr_ScreenShake(2,10);
				flash = 0.7;
				invulnerable = 60;
			}
		}
		
		else
		{
			//Kill the player
			with (obj_player) state = PlayerStateDead;
		}
	}
}