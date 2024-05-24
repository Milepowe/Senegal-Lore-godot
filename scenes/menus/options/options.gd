extends Node2D

signal pressedConfirm

const main_menu = preload("res://scenes/menus/start_menu/main.tscn")

func _input(event):
	if event.is_action_pressed("confirm"):
		pressedConfirm.emit()

# Called when the node enters the scene tree for the first time.
func _ready():
	await pressedConfirm
	to_options.transition_back()
	await to_options.transition_finished
	get_tree().change_scene_to_packed(main_menu)


func _process(_delta):
	if $menu_music.playing == false :
		$menu_music.play()
	
	pass
