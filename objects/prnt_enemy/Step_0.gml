//Execute State Machine
if (!global.gamePaused)
{
	if (enemyScript[state] != -1) script_execute(enemyScript[state]);
	depth = -bbox_bottom; // So objects lower on the screen show in the front first
}