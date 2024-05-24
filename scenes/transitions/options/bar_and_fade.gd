extends CanvasLayer

signal transition_finished

# Called when the node enters the scene tree for the first time.
func _ready():
	$".".visible = false
	$AnimationPlayer.animation_finished.connect(_on_animation_finished)
	
func _on_animation_finished(current_animation) :
	if current_animation == "in_options" :
		transition_finished.emit()
		$AnimationPlayer.play("out_options")
		
	elif current_animation == "in_back" :
		transition_finished.emit()
		$AnimationPlayer.play("out_back")
		
	elif current_animation == "out_back" or current_animation == "out_options":
		$".".visible = false
		
func transition_options() :
	$".".visible = true
	$AnimationPlayer.play("in_options")

func transition_back() :
	$".".visible = true
	$AnimationPlayer.play("in_back")
