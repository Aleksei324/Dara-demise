extends Control


# Declare member variables here.


# Called when the node enters the scene tree for the first time.
func _ready():
	$Textbox.queue_text("Texto de la cinematica 1")
	$Textbox.queue_text("Texto de la cinematica 2")
	$Textbox.queue_text("Texto de la cinematica 3")
	$Textbox.queue_text("Texto de la cinematica 4")
	$Textbox.queue_text("Texto de la cinematica 5")
	$Timer.start()


func _process(delta):
	if $Textbox.acabado:
		get_tree().change_scene("res://Scenes/Vagones/Vagon1.tscn")


func _on_Timer_timeout():
	$Textbox.run_textbox()
