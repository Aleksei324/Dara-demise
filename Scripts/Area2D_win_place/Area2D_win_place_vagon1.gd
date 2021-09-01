extends Area2D


# Declare member variables here.
onready var textbox = $"../Camera and UI/CanvasLayer/Textbox"


func _on_Area2D_win_place_body_entered(body):
	$"../Audio_level_finished".play()

	# texto que se mostrara en la textbox
	textbox.queue_text("Este sistema de seguridad es muy absurdo")
	textbox.queue_text("Aunque si no tengo cuidado puede que nunca salga de aqui")

	textbox.run_textbox()
	Global_variables.nivel_completado = true
