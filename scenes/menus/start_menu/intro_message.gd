extends Node2D

signal pressedConfirm

func _input(event):
	if event.is_action_pressed("confirm"):
		pressedConfirm.emit()

# Called when the node enters the scene tree for the first time.
func _ready():
	$message.visible = false
	
	$menu_woosh.play()
	$Background/AnimationPlayer.play("in")
	
	await $Background/AnimationPlayer.animation_finished
	$message.visible = true
	
	
	await pressedConfirm
	$message.visible = false
	$Background/AnimationPlayer.play("out")
	
	await $Background/AnimationPlayer.animation_finished
	get_tree().change_scene_to_file("res://scenes/menus/start_menu/main.tscn")
