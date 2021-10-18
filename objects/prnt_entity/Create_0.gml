/// @desc Entity Essentials
lifted = 0;

flash = 0;

flashShader = shd_whiteFlash
uFlash = shader_get_uniform(flashShader, "flash");

thrown = false;

// Every item could get an array of items, that are dropped on death
entityDropList = -1;
// We do it two times so that created entites mid game would have a collision
// map for the room
collisionMap = layer_tilemap_get_id(layer_get_id("Collision"));