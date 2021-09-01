extends Area2D


# Declare member variables here.
onready var textbox = $"../Camera and UI/CanvasLayer/Textbox"


func _on_Area2D_win_place_body_entered(body):
	$"../Audio_level_finished".play()

	# texto que se mostrara en la textbox
	textbox.queue_text("Este atuendo es genial, puedo llevar de todo")
	textbox.queue_text("No se que hubiese podido hacer sin ese mapache")
	textbox.queue_text("Fue muy bonito de su parte darme esta mochila")

	textbox.run_textbox()
	Global_variables.nivel_completado = true
