extends Control


# Declare member variables here.


# Called when the node enters the scene tree for the first time.
func _ready():
	$Textbox.queue_text("Texto de la cinematica 1")
	$Textbox.queue_text("Texto de la cinematica 2")
	$Textbox.queue_text("Texto de la cinematica 3")
	$Textbox.run_textbox()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
