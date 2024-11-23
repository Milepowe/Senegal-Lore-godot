extends Node2D

signal pressedConfirm
var transition = false
var target_line_size = 0
var increment = 30
var line_width

const select_menu = preload("res://scenes/start_menu/select_menu.tscn")

func _input(event):
	if event.is_action_pressed("ui_confirm"):
		pressedConfirm.emit()
		AudioPlayer.toggle_reverb_effect()
		
		
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AudioPlayer.test_musik()
	
	line_width = $ColorRect.material.get("shader_parameter/line_width") # Set to the current shader line_widht
	
	await pressedConfirm
	transition = true
	
	var tween = create_tween().set_parallel(true)
	tween.tween_property($Sprite2D, "self_modulate", Color(1, 1, 1, 0), 0.3)
	tween.tween_property($RichTextLabel, "self_modulate", Color(1, 1, 1, 0), 0.3)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if transition :
		line_width -= increment * delta
		$ColorRect.material.set("shader_parameter/line_width", line_width)
		
		if line_width <= target_line_size :
			transition = false
			get_tree().change_scene_to_packed(select_menu)
			
	pass
