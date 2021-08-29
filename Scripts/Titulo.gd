extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	# esconde el raton
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

	# le da focus al boton de jugar
	$VBoxContainer/Button_jugar.grab_focus()


func _on_Button_jugar_button_up():
	# inicia la cinematica al darle al boton de jugar
	$Audio_boton.play()
	get_tree().change_scene("res://Scenes/Cinematica inicial.tscn")


func _on_Button_creditos_button_up():
	# muestra los creditos al darle al boton de creditos
	$Audio_boton.play()
	$Creditos.visible = true


func _on_Button_salir_button_up():
	# cierra el juego al darle al boton de salir
	get_tree().quit()


func _on_Creditos_visibility_changed():
	# cuando se muestre o desaparezca la sección de creditos,
	# maneja que botones pueden tener focus
	if $Creditos.visible:
		$VBoxContainer/Button_jugar.set_focus_mode(Control.FOCUS_NONE)
		$VBoxContainer/Button_creditos.set_focus_mode(Control.FOCUS_NONE)
		$VBoxContainer/Button_salir.set_focus_mode(Control.FOCUS_NONE)

		# le da focus
		$Creditos/Button_regresar.grab_focus()

	else:
		$VBoxContainer/Button_jugar.set_focus_mode(Control.FOCUS_ALL)
		$VBoxContainer/Button_creditos.set_focus_mode(Control.FOCUS_ALL)
		$VBoxContainer/Button_salir.set_focus_mode(Control.FOCUS_ALL)

		# le da focus
		$VBoxContainer/Button_jugar.grab_focus()
