extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	# texto que se mostrara en la textbox
	$Textbox.queue_text("Texto de la cinematica 1")
	$Textbox.queue_text("Texto de la cinematica 2")
	$Textbox.queue_text("Texto de la cinematica 3")
	$Textbox.queue_text("Texto de la cinematica 4")
	$Textbox.queue_text("Texto de la cinematica 5")
	
	# inicia el timer de un segundo
	$Timer.start()


func _process(delta):
	# cuando el ultimo texto acabe, iniciar el nivel 1
	if $Textbox.acabado:
		get_tree().change_scene("res://Scenes/Vagones/Vagon1.tscn")


func _on_Timer_timeout():
	# cuando el timer termine, empezar a mostrar el texto en queue
	$Textbox.run_textbox()
