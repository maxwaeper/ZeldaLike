{
  "spriteId": {
    "name": "spr_pot",
    "path": "sprites/spr_pot/spr_pot.yy",
  },
  "solid": false,
  "visible": true,
  "spriteMaskId": {
    "name": "spr_pot",
    "path": "sprites/spr_pot/spr_pot.yy",
  },
  "persistent": false,
  "parentObjectId": {
    "name": "prnt_entity",
    "path": "objects/prnt_entity/prnt_entity.yy",
  },
  "physicsObject": false,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsGroup": 0,
  "physicsDensity": 0.5,
  "physicsRestitution": 0.1,
  "physicsLinearDamping": 0.1,
  "physicsAngularDamping": 0.1,
  "physicsFriction": 0.2,
  "physicsStartAwake": true,
  "physicsKinematic": false,
  "physicsShapePoints": [],
  "eventList": [
    {"isDnD":false,"eventNum":0,"eventType":0,"collisionObjectId":null,"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
  ],
  "properties": [],
  "overriddenProperties": [
    {"propertyId":{"name":"entityActivateScript","path":"objects/prnt_entity/prnt_entity.yy",},"objectId":{"name":"prnt_entity","path":"objects/prnt_entity/prnt_entity.yy",},"value":"scr_ActivateLiftable","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"entityActivateArguments","path":"objects/prnt_entity/prnt_entity.yy",},"objectId":{"name":"prnt_entity","path":"objects/prnt_entity/prnt_entity.yy",},"value":"[id]","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"entityHitScript","path":"objects/prnt_entity/prnt_entity.yy",},"objectId":{"name":"prnt_entity","path":"objects/prnt_entity/prnt_entity.yy",},"value":"scr_EntityHitDestroy","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"entityThrowBreak","path":"objects/prnt_entity/prnt_entity.yy",},"objectId":{"name":"prnt_entity","path":"objects/prnt_entity/prnt_entity.yy",},"value":"True","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"entityFragment","path":"objects/prnt_entity/prnt_entity.yy",},"objectId":{"name":"prnt_entity","path":"objects/prnt_entity/prnt_entity.yy",},"value":"obj_potFragment","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"entityFragmentCount","path":"objects/prnt_entity/prnt_entity.yy",},"objectId":{"name":"prnt_entity","path":"objects/prnt_entity/prnt_entity.yy",},"value":"2+irandom(3)","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
  ],
  "parent": {
    "name": "Objects",
    "path": "folders/Objects.yy",
  },
  "resourceVersion": "1.0",
  "name": "obj_pot",
  "tags": [],
  "resourceType": "GMObject",
}