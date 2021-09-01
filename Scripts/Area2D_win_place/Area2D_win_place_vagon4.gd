extends Area2D


# Declare member variables here.
onready var textbox = $"../Camera and UI/CanvasLayer/Textbox"


func _on_Area2D_win_place_body_entered(body):
	$"../Audio_level_finished".play()

	# texto que se mostrara en la textbox
	textbox.queue_text("Hermana, vengo a por ti")

	textbox.run_textbox()
	Global_variables.nivel_completado = true
