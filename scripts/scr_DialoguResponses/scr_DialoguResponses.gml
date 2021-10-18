/// @arg Response
function scr_DialoguResponses(argument0) {

	switch(argument0)
	{
		case 0: break; //Always end with break;
	
		case 1: scr_NewTextBox("You gave first response",1); break;

		case 2: scr_NewTextBox("Wanna add smth else?",1,["3:Yeah!","0:No."]); break;
	
		case 3: scr_NewTextBox("Sike, you can't yet",0); break;
		
		case 4:
		{
			scr_NewTextBox("Alriiight! Go to the cave then",2);
			global.questStatus[? "TheHatQuest"] = 1;
		}break;
		
		case 5: scr_NewTextBox("Well then piss off!",2); break;
		
		case 6: PurchaseItem(activate.item, activate.itemAmount, activate.itemCost); break;
	
		//default: show_debug; break; Use that so that you can catch unwanted results
	}


}
