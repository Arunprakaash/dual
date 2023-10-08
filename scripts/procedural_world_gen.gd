extends Node2D

@onready var tilemap = $TileMap

const MAP_SIZE = Vector2(512, 512)
const LAND_CAP = 0.3

func _ready():
	generate_world()

func generate_world():
	var noise = FastNoiseLite.new()
	noise.seed = 100 #randi()
	
	var dirt = []
	var grass = []
	for x in MAP_SIZE.x:
		for y in MAP_SIZE.y:
			var a = noise.get_noise_2d(x, y)
			if a < LAND_CAP:
				dirt.append(Vector2(x, y))
			else:
				grass.append(Vector2(x,y))

	tilemap.set_cells_terrain_connect(0, dirt, 0, 0)
	tilemap.set_cells_terrain_connect(0, grass, 0, 1)
