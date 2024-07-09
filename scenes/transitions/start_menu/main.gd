extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if $menu_music.playing == false :
		$menu_music.play()
	
	pass

func _on_options_pressed() :
	$menu_confirm.play()
	await $menu_confirm.finished
	
	to_options.transition_options()
	await to_options.transition_finished
	get_tree().change_scene_to_file("res://scenes/menus/options/options.tscn")
	
func _on_quitter_pressed():
	$menu_confirm.play()
	await $menu_confirm.finished
	get_tree().quit()
