extends Button


# Declare member variables here. Examples:


# Called when the node enters the scene tree for the first time.
func _ready():
	grab_focus()


func _on_Button_continuar_button_up():
	$AudioStreamPlayer.play()
