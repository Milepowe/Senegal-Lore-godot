extends Control
# TODO - make the dialog box disappear when player leaves the zone
# so we can add any json file an it will work
@export_file("*json") var scene_text_file: String

@onready var textSection = $Dialog_Text
@onready var background = $background

var time: float
var time_factor = 8
var intensity = 2
var default_polygon_coords = ""
var scene_text: Dictionary = {} # copy paste my beloved
var selected_text: Array = []
var isDisplayed = false

# too tired to explain the code so figure it out, basically pulls text from a json file

func _ready() -> void :
	background.visible = false
	textSection.visible = false
	default_polygon_coords = $background.polygon
	scene_text = load_scene_text()
	DialogLore.connect("display_dialog", Callable(self, "on_display_dialog")) # gets the text_key from the signalBus



func _process(delta: float) -> void:
	time += delta * time_factor
	$background.polygon[1][1] = default_polygon_coords[1][1] + (sin(time) * intensity)
	$background.polygon[4][1] = default_polygon_coords[4][1] - (sin(time + 1) * intensity)

# pulls the text from the json file
func load_scene_text():
	if FileAccess.file_exists(scene_text_file):
		var file = FileAccess.open(scene_text_file, FileAccess.READ)
		var test_json_conv = JSON.new()
		test_json_conv.parse(file.get_as_text())
		return test_json_conv.get_data()
	
#changing this bottom part can cause some errors so proceed with caution because the if else statement is really doing some heavy lifting and causes a crash if not present	
func show_text():
	textSection.text = selected_text.pop_front()
	
func on_display_dialog(text_key):
	if isDisplayed:
		pass
	else:
		textSection.visible = true
		background.visible = true
		isDisplayed = true
		selected_text = scene_text[text_key]
		show_text()



		
