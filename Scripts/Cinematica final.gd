extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	# texto que se mostrara en la textbox
	$Textbox/MarginContainer/Panel/MarginContainer_texto/VBoxContainer/Name_label.text = ". . ."
	$Textbox.queue_text("Dara logró rescatar a su hermana")
	$Textbox.queue_text("Por desgracia fue capturada por los guardias que rodearon el tren")
	$Textbox.queue_text("Pero puso a su hermanita a salvo, y para ella eso fue lo importante")
	$Textbox.queue_text("Le dio su manta favorita")
	
	# inicia el timer de un segundo
	$Timer.start()


func _process(delta):
	# cuando el ultimo texto acabe, iniciar el nivel 1
	if $Textbox.acabado:
		get_tree().change_scene("res://Scenes/Titulo.tscn")


func _on_Timer_timeout():
	# cuando el timer termine, empezar a mostrar el texto en queue
	$Textbox.run_textbox()
