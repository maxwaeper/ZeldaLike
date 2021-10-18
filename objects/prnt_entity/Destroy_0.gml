/// @description Drop fragments and items
if (entityFragmentCount > 0)
{
	fragmentArray = array_create(entityFragmentCount, entityFragment);
	
	scr_DropItems(x,y,fragmentArray);
}	

if(entityDropList != -1)
{
	scr_DropItems(x,y,entityDropList);	
}