extends Node2D


# Declare member variables here. Examples:
onready var botones_ui = $"CanvasLayer/Botones interfaz"
onready var menu_ui = $"CanvasLayer/Items menu"


func _on_Items_menu_visibility_changed():
	# desaparecer botones de la IU cuando el menu esta visible y viceversa
	botones_ui.set_visible(not menu_ui.is_visible())
