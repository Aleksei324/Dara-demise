extends Control


# Declare member variables here.
var estado_de_pausa = false


func _input(event):
	if event.is_action_pressed("pause"):
		pausa()


func pausa():
	$Audio_boton.play()
	estado_de_pausa = not get_tree().paused

	get_tree().paused = estado_de_pausa
	visible = estado_de_pausa
	if estado_de_pausa:
		$VBoxContainer/Button_continuar.grab_focus()


func _on_Button_continuar_button_up():
	pausa()


func _on_Button_regresa_button_up():
	pausa()
	get_tree().change_scene("res://Scenes/Titulo.tscn")
