extends Node2D

#let me cook

var coords_player_infos_box : Array = [
	[ 0, 0 ], [ 7, -32 ], [ 110, -32 ], [ 103, 0 ]
]
var player_infos_box : PackedVector2Array

func float_array_to_Vector2Array(coords : Array) -> PackedVector2Array:
	# Convert the array of floats into a PackedVector2Array.
	var array : PackedVector2Array = []
	for coord in coords:
		array.append(Vector2(coord[0], coord[1]))
	return array

# Called when the node enters the scene tree for the first time.
func _ready():
	player_infos_box = float_array_to_Vector2Array(coords_player_infos_box)
	pass

func _draw():
	draw_polygon(player_infos_box, [ Color("000000") ])
	print("tesr")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
