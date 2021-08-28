extends Node2D


# Declare member variables here. Examples:
onready var botones_ui = $"CanvasLayer/Botones interfaz"
onready var menu_ui = $"CanvasLayer/Items menu"


func _on_Items_menu_visibility_changed():
	botones_ui.set_visible(not menu_ui.is_visible())
