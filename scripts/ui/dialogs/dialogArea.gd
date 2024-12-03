extends Area2D

@export var text_key: String = "" # look at the json to understand 

var area_active = false

func _input(event):
	if area_active and event.is_action_pressed("ui_accept"):
		print_debug("Event is met in the zone")
		DialogLore.emit_signal("display_dialog", text_key) # sends a signal to the signalBus and does stuff that is too long to explain

# checks if the player is inside the zone for the dialog	
func _on_dialogarea_entered(area):
	area_active = true


func _on_dialogarea_exited(area):
	area_active = false
