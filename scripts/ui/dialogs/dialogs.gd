extends Control

var time: float
var time_factor = 8
var intensity = 2
var default_polygon_coords = ""


var dialog_example = [
	{
		'character' : 'Akechi',
		'text' : 'My n why is she talking about viktor like a fan girl',
		'question' : [
			{ 'label' : 'efihazeoif', 'value' : 0 },
			{ 'label' : 'efihseff', 'value' : 1 }
		]
	},
	{
		'character' : 'Akechi',
		'text' : 'ATTIC !!'
	}
]


func _ready() -> void :
	default_polygon_coords = $background.polygon
	$RichTextLabel.text = dialog_example[0]['text']



func _process(delta: float) -> void:
	time += delta * time_factor
	$background.polygon[1][1] = default_polygon_coords[1][1] + (sin(time) * intensity)
	$background.polygon[4][1] = default_polygon_coords[4][1] - (sin(time + 1) * intensity)
