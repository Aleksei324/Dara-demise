extends Button


func _on_Button_jugar_button_up():
	$AudioStreamPlayer.play()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
