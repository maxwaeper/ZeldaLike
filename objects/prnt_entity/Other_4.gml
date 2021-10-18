/// @description Get New Tilemap
// We get new tilemap fo each new room, so we can update our entities that followed us from other rooms with the current room collision layer

collisionMap = layer_tilemap_get_id(layer_get_id("Collision"));