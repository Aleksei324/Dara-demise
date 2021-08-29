extends Control


# Declare member variables here.
onready var textbox_container = $MarginContainer
onready var textbox_text = $MarginContainer/Panel/MarginContainer_texto/VBoxContainer/Text_label
onready var audio = $Audio_avanzar_texto
const READ_RATE = 0.05 # que tan rapido aparece el texto en la textbox
var tween_finalizado = false # controla que se pueda seguir al siguiente parrafo
var acabado = false # controla que no haya más textbox
var texto_queue = []
var texto_actual = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	textbox_container.hide()


func _process(delta):
	# si se presiona la tecla z entonces continua con el siguiente dialogo
	if Input.is_action_just_pressed("zed") and tween_finalizado:
		audio.play()
		run_textbox()


func queue_text(text):
	# añade texto a mostrar
	texto_queue.push_back(text)


func run_textbox():
	tween_finalizado = false

	# si la queue esta vacia, termina y esconde la textbox
	if texto_queue.empty():
		textbox_container.hide()
		acabado = true

	# sino, muestra la textbox y saca el primer texto del array
	else:
		acabado = false
		textbox_container.show()
		texto_actual = texto_queue.pop_front()

		# coloca el texto y muestra el 0% de este
		textbox_text.percent_visible = 0.0
		textbox_text.text = texto_actual

		# animación que va mostrando el texto poco a poco
		$Tween.interpolate_property(
				textbox_text, "percent_visible", 0.0, 1.0, len(
				texto_actual) * READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)

		$Tween.start()


func _on_Tween_tween_completed(object, key):
	# cuando la animación termine, ya se puede seguir al siguiente texto
	tween_finalizado = true
