extends CharacterBody2D

var baseSpeed = 120
var axis = Vector2.ZERO
var last_axis = "down"
var runSpeed = 140

func _physics_process(_delta: float) -> void:
	move()
	sprite_animation()

func get_input_axis() -> Vector2:
	axis.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left")) # right : 1, left : -1
	axis.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up")) # up : -1, down : 1
	return axis.normalized() # BONJOUR aujourd'hui nous allons faire le cours sur le théorème de pythagore

func move() -> void:
	axis = get_input_axis()
	
	# Time is money and running saves time
	if Input.is_action_just_pressed("run"):
		baseSpeed = runSpeed + baseSpeed	
	if Input.is_action_just_released("run"):
		baseSpeed = baseSpeed - runSpeed
	if axis != Vector2.ZERO:
		velocity = axis * baseSpeed
	else:
		velocity = Vector2.ZERO
		
	move_and_slide()


func sprite_animation() -> void:
	if axis != Vector2.ZERO:
		if axis.x != 0:
			if axis.x < 0:
				$Sprite2D/AnimationPlayer.play("default_left")
				last_axis = "left"
			elif axis.x > 0:
				$Sprite2D/AnimationPlayer.play("default_right")
				last_axis = "right"
		elif axis.y != 0:
			if axis.y < 0:
				$Sprite2D/AnimationPlayer.play("default_up")
				last_axis = "up"
			elif axis.y > 0:
				$Sprite2D/AnimationPlayer.play("default_down")
				last_axis = "down"
	else:
		$Sprite2D/AnimationPlayer.stop()
		match last_axis:
			"up": $Sprite2D.frame = 7
			"down": $Sprite2D.frame = 1
			"left": $Sprite2D.frame = 4
			"right": $Sprite2D.frame = 10
