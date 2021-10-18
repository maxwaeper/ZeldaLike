
function PurchaseItem(_item, _amount, _cost)
{
	if (global.playerMoney >= _cost)
	{
		global.playerHasAnyItems = true;
		global.playerItemUnlocked[_item] = true;
		global.playerAmmo[_item] += _amount;
		global.playerMoney -= _cost;
		global.playerEquipped = _item;
		instance_destroy(activate);
	}
	
	else
	{
		scr_NewTextBox("Not enough money",1);	
	}
}