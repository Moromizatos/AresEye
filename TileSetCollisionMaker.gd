extends Node2D

export(String) var rename
export(TileSet) var tileset
export(Vector2) var tile_size = Vector2(16,16)
export(Texture) var texture

# mapped_bitmask stores the values of every tile according to
# exported png image (Wang tiles) from the third party app:
# "Tilesetter"

var mapped_bitmask : Array = [
	[432, 504, 216, 144, 176, 248, 440, 152, 184, 443,   0],
	[438, 511, 219, 146, 182, 255, 447, 155, 191, 254,   0],
	[54,  63,  27,  18,  434, 507, 510, 218, 506, 442, 250],
	[48,  56,  24,  16,  50,  59,  62,  26,  58,  190, 187],
	[0,    0,   0,   0, 178, 251, 446, 154, 186,    0,   0]
]

var collision_shape = ConvexPolygonShape2D.new()


func _ready():
	_generate_autotile_properties()
	
func _generate_autotile_properties():
	if tileset != null:
		tileset.clear()
		tileset.create_tile(0)
		tileset.tile_set_texture(0, texture)
		tileset.tile_set_tile_mode(0, TileSet.AUTO_TILE)
		tileset.tile_set_region(0, Rect2(0,0,texture.get_width(),texture.get_height()))
		tileset.autotile_clear_bitmask_map(0)
		tileset.autotile_set_bitmask_mode(0, TileSet.BITMASK_3X3_MINIMAL)
		tileset.autotile_set_icon_coordinate(0, Vector2(3,3))
		collision_shape.points = [Vector2.ZERO, Vector2(0,tile_size.y), Vector2(tile_size.x,tile_size.y),Vector2(tile_size.x,0)]
		# LOOPS THROUGH THE ARRAY OF TILES, SET THE NAME AS ITS ID AND PRINTS
		for id in tileset.get_tiles_ids().size():
			tileset.autotile_set_size(id,tile_size)
			if tileset.tile_get_tile_mode(id) == TileSet.AUTO_TILE:
				var region = tileset.tile_get_region(id)
				for y in region.size.y/tile_size.y:
					for x in region.size.x/tile_size.x:
						tileset.autotile_set_bitmask(id, Vector2(x,y), mapped_bitmask[y][x])
						if mapped_bitmask[y][x] != 0:
							tileset.tile_add_shape(id, collision_shape, Transform2D(0.0,Vector2.ZERO), false, Vector2(x,y))
				print(tileset.tile_get_name(id))
			else:
				print("The TileSet \""+tileset.tile_get_name(id)+"\" has no autotile setup")

	#### TRY TO SAVE THE RESOURCE IF IT CAN'T RETURNS THE ERROR ####
	var err : int = ResourceSaver.save(tileset.get_path(),tileset)
	if err != 0:
		print(err)
	####
