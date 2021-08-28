extends Button


func _on_Button_creditos_button_up():
	$AudioStreamPlayer.play()
	get_tree().change_scene("res://Scenes/Creditos.tscn")
