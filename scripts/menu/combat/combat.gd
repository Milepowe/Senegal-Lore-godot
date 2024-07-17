extends Node2D

var intro_speed = 225

# Called when the node enters the scene tree for the first time.
func _ready():
	$Bilel.global_position = Vector2(-37, 153)
	$Missingno.global_position = Vector2(480, 54)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Bilel.global_position = $Bilel.global_position.move_toward($PlayerPosition.global_position, delta*intro_speed)
	$Missingno.global_position = $Missingno.global_position.move_toward($EnemyPosition.global_position, delta*intro_speed)
	pass
