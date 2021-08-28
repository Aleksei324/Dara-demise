extends Button


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	grab_focus()


func _on_Button_jugar_button_up():
	$AudioStreamPlayer.play()
	get_tree().change_scene("res://Scenes/Cinematica inicial.tscn")
