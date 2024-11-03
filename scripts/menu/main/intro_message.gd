# je vais faire genre j'ai compris gdscript mais bel il gere je pense -milepower 2024
# j'ai enfin compris -milepower 2024
extends Node2D

const main_menu = preload("res://scenes/menus/start_menu/main.tscn")

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
	
	intro_msg_to_main_transition.transition()
	await intro_msg_to_main_transition.transition_finished
	get_tree().change_scene_to_packed(main_menu)
