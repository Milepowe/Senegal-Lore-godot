@icon("res://assets/images/icons/yapping.jpg")
class_name Dialog extends Node2D


# TODO - Load the text box if it's active and not if it's not and make it so only one dialog box can be shown at a time, make it so the text is pulled from a txt file instead of random strings in code
# TODO - Fix all of this someday including the position of the dialog box because like the textbox is somewhere random on the right of the map
# TODO - making this in C#

@onready var dialog_test = Dialog.new() # honestly this is useless

"""Lost so many hours because I thought it was a constructor: 5 hours wasted, 
really wish I was using C# but basically when the script runs it creates an instance of the dialog scene"""
func _init():
	var DialogScene = preload("res://scenes/ui/dialogs/dialogs.tscn")
	var dialogBox: Node = DialogScene.instantiate()
	add_child(dialogBox)
	var textSection = dialogBox.get_node("Dialog_Text") # Gets the Dialog_Text node in the dialogs.tscn scene 
	textSection.text = "Would I win" # Only works if Dialog.gd does not assign the content first


	
	

	
	
	

	
	
