extends Control


# Declare member variables here.
onready var button1 = $VBoxContainer/Button_continuar
var estado_de_pausa = false


func _input(event):
	# si se presiona la tecla escape, se pausa
	if event.is_action_pressed("pause"):
		pausa()


func pausa():
	$Audio_boton.play()
	# invierte el estado de pausa de Godot
	estado_de_pausa = not get_tree().paused
	get_tree().paused = estado_de_pausa

	# vuelve el panel visible o invisible
	visible = estado_de_pausa

	# si el juego esta pausado, le da focus al boton de continuar
	if estado_de_pausa:
		button1.grab_focus()


func _on_Button_continuar_button_up():
	# despausa al presionar el boton de continuar
	pausa()


func _on_Button_restart_button_up():
	# despausa y regresa a la pantalla de titulo al darle al boton de salir
	pausa()
	get_tree().change_scene("res://Scenes/Pantalla de carga.tscn")


func _on_Button_regresa_button_up():
	# despausa y regresa a la pantalla de titulo al darle al boton de salir
	pausa()
	get_tree().change_scene("res://Scenes/Titulo.tscn")
