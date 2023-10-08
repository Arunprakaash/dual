extends Node2D

@onready var tilemap = $TileMap

const MAP_SIZE = Vector2(128,128)
const LAND_CAP = 0.3

func _ready():
	generate_world()
	tilemap.force_update()

func generate_world():
	var noise = FastNoiseLite.new()
	noise.seed = 100
	
	var dirt = []
	var grass = []
	for x in MAP_SIZE.x:
		for y in MAP_SIZE.y:
			var a = noise.get_noise_2d(x, y)
			if a < LAND_CAP:
				dirt.append(Vector2(x, y))
			else:
				grass.append(Vector2(x,y))
				dirt.append(Vector2(x, y))

	var placed_tiles = []
	var atlas_coords = [Vector2(1,1),Vector2(2,1),Vector2(3,1),Vector2(6,1),Vector2(1,3),Vector2(1,4),Vector2(2,3),Vector2(4,3),Vector2(5,3)]
	for i in range(0,len(grass)/8):
		var rand_value = grass[randi() % grass.size()]
		placed_tiles.append(rand_value)
		var props = atlas_coords[randi() % atlas_coords.size()]
		tilemap.set_cell(1,rand_value,1,props,0)
	
	
	tilemap.set_cells_terrain_connect(0, dirt, 0, 0)
	tilemap.set_cells_terrain_connect(0, grass, 0, 1)
