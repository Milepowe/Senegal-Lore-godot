extends CanvasLayer

signal transition_finished

# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect.visible = false
	$ColorRect/AnimationPlayer.animation_finished.connect(_on_animation_finished)
	
func _on_animation_finished(current_animation) :
	if current_animation == "in" :
		transition_finished.emit()
		$ColorRect/AnimationPlayer.play("out")
	elif current_animation == "out" :
		$ColorRect.visible = false
		
func transition() :
	$ColorRect.visible = true
	$ColorRect/AnimationPlayer.play("in")
