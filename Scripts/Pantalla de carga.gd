extends Control


# Declare member variables here.
onready var bar = $Panel_fondo/MarginContainer/ProgressBar


# Called when the node enters the scene tree for the first time.
func _ready():
	bar.value = 0.0
	$Audio_train.play()
	
	# animación que va mostrando el texto poco a poco
	$Tween.interpolate_property(
			bar, "value", 0.0, 100.0, 2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)

	$Tween.start()


func _on_Tween_tween_completed(object, key):
	pass # Replace with function body.
