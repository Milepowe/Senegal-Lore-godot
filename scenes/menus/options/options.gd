extends Node2D

signal pressedConfirm

func _input(event):
	if event.is_action_pressed("confirm"):
		pressedConfirm.emit()

# Called when the node enters the scene tree for the first time.
func _ready():
	#en gros c'est juste pour retourner en arrière car j'ai la flemme de coder un vrai menu mdr
	await pressedConfirm
	to_options.transition_back()
	await to_options.transition_finished


func _process(_delta):
	if $menu_music.playing == false :
		$menu_music.play()
	
	pass
