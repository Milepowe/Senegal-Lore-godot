extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var default_buttons_position = $MarginContainer.position
	$MarginContainer.position += Vector2(-500, 0)
	
	var tween = create_tween()
	tween.tween_property($MarginContainer, "position", default_buttons_position, 0.35).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	pass # Replace with function body.
