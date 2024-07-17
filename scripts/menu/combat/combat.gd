extends Node2D

var intro_speed = 225


# Called when the node enters the scene tree for the first time.
func _ready():
	# Set default positions
	$Bilel.global_position = Vector2(-37, 153)
	$Missingno.global_position = Vector2(480, 54)
	
	# Hide buttons
	# Set all polygons points in one place
	for i in $SelectedPlayerButtons.get_children():
		if not "AnimationPlayer" in str(i) : # Everything except that one random animation player
			var first_polygon_point: Vector2 = i.polygon[0]
			i.polygon = PackedVector2Array([first_polygon_point, first_polygon_point, first_polygon_point])
			
			# Make everything transparent EXCEPT polygons
			for j in i.get_children():
				j.self_modulate = Color(1, 1, 1, 0)
	
	# This is temporary i'll change it later like everything i code 
	await get_tree().create_timer(0.7).timeout
	$SelectedPlayerButtons/AnimationPlayer.play("in")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Bilel.global_position = $Bilel.global_position.move_toward($PlayerPosition.global_position, delta*intro_speed)
	$Missingno.global_position = $Missingno.global_position.move_toward($EnemyPosition.global_position, delta*intro_speed)
	pass
