function scr_CalculateAttack(argument0) 
{
	//Use attack hitbox and check for hits
	//So for collision detection we change our hitbox to collision one and after we done we switch back to normal one
	mask_index = argument0;
	var _hitByAttackNow = ds_list_create();

	//This function can check for collision a whole list of entities
	var _hits = instance_place_list(x,y,prnt_entity,_hitByAttackNow,false);

	if (_hits > 0)
	{
		for (var i = 0; i < _hits; i++)
		{
			//If this instance has not yet been hit by this attack then we hit it
			var _hitID = _hitByAttackNow[|i]; //By referring like that [|i] to a list we will be adressing directly to this entry
		
			//CHeck to see if the hitID already in the list of staff the have been hit
			if (ds_list_find_index(hitByPlayerAttack, _hitID) == -1)
			{
				ds_list_add(hitByPlayerAttack, _hitID);
			
				with (_hitID)
				{
					if (object_is_ancestor(object_index, prnt_enemy))
					{
						HurtEnemy(id, 5, other.id, 10);	
					}
					
					else
					{	
					if (entityHitScript != -1) script_execute(entityHitScript);
					}
				}
			}
		
		}
	}	
	ds_list_destroy(_hitByAttackNow);

	mask_index = spr_player;


}

function HurtEnemy(enemy, damage, source, knockback)
{
	with (enemy)
	{
		if (state != ENEMYSTATE.DIE)
		{
			enemyHP -= damage;
			flash = 1;
			
			//Hurt or dead? 
			if (enemyHP <= 0) state = ENEMYSTATE.DIE;	
			
			else 
			{
				if (state != ENEMYSTATE.HURT) statePrevious = state;
				
				state = ENEMYSTATE.HURT;
			}	
			
			image_index = 0;
			
			if (knockback != 0)
			{
				var _knockDirection = point_direction(x,y,(source).x,(source).y);
				xTo = x - lengthdir_x(knockback, _knockDirection);
				yTo = y - lengthdir_y(knockback, _knockDirection);
			}
		}
	}
}
