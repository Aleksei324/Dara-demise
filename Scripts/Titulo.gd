extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$VBoxContainer/Button_jugar.grab_focus()


func _on_Button_jugar_button_up():
	$Audio_boton.play()
	get_tree().change_scene("res://Scenes/Cinematica inicial.tscn")


func _on_Button_creditos_button_up():
	$Audio_boton.play()
	$Creditos.visible = true
	$Creditos/Button_regresar.grab_focus()


func _on_Button_salir_button_up():
	get_tree().quit()


func _on_Creditos_visibility_changed():
	if $Creditos.visible:
		$VBoxContainer/Button_jugar.set_focus_mode(Control.FOCUS_NONE)
		$VBoxContainer/Button_creditos.set_focus_mode(Control.FOCUS_NONE)
		$VBoxContainer/Button_salir.set_focus_mode(Control.FOCUS_NONE)
		
		$Creditos/Button_regresar.grab_focus()
	
	else:
		$VBoxContainer/Button_jugar.set_focus_mode(Control.FOCUS_ALL)
		$VBoxContainer/Button_creditos.set_focus_mode(Control.FOCUS_ALL)
		$VBoxContainer/Button_salir.set_focus_mode(Control.FOCUS_ALL)
		
		$VBoxContainer/Button_jugar.grab_focus()
