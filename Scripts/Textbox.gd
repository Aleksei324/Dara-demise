extends Control


# Declare member variables here.
onready var textbox_container = $MarginContainer
onready var textbox_text = $MarginContainer/Panel/MarginContainer/Label
var read_rate = 0.05

# Called when the node enters the scene tree for the first time.
func _ready():
	hide_textbox()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func hide_textbox():
	textbox_container.hide()


func show_textbox(the_text):
	
	textbox_container.show()
	textbox_text.text = the_text

	$Tween.interpolate_property(
			textbox_text, "percent_visible", 0.0, 1.0, len(
			the_text) * read_rate, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)

	$Tween.start()
