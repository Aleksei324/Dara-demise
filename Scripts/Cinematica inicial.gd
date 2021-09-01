extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$TextureRect.set_visible(false)
	# texto que se mostrara en la textbox
	$Textbox.queue_text("Dentro de poco el tren de prisioneros pasara por aqui")
	$Textbox.queue_text("Es mi unica oportunidad, debo infiltrarme sin ser vista")
	$Textbox.queue_text("Cada vez que me descubran el tren se hara más y más largo")
	$Textbox.queue_text("No puedo permitirlo, debo llegar a ella a toda costa")
	$Textbox.queue_text("Esos imbeciles creen que pueden hacer lo que quieran")
	$Textbox.queue_text("...")
	$Textbox.queue_text("...")
	$Textbox.queue_text("Es hora")
	
	# inicia el timer de un segundo
	$Timer.start()


func _process(delta):
	# cuando el ultimo texto acabe, iniciar el nivel 1
	if $Textbox.acabado:
		get_tree().change_scene("res://Scenes/Vagones/Vagon1.tscn")


func _on_Timer_timeout():
	# cuando el timer termine, empezar a mostrar el texto en queue
	$Textbox.run_textbox()
	$TextureRect.set_visible(true)
