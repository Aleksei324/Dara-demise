extends Control


# Declare member variables here.
onready var bar = $Panel_fondo/MarginContainer_progress/ProgressBar
onready var texto = $Panel_fondo/MarginContainer_text/Label
var textos_predefinidos = ["El corruptor mueve drones a tu posición",
		"El pulso electromagnetico invierte los lasers",
		"La manta es el mejor item del juego",
		"Cuidado con que el tren se vuelva demasiado largo",
		"Hazlo por ella",
		"Te necesita"]


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	texto.text = textos_predefinidos[randi() % textos_predefinidos.size()]
	
	bar.value = 0.0
	
	# animación que mueve la progress bar
	$Tween.interpolate_property(
			bar, "value", 0.0, 100.0, 2, Tween.TRANS_EXPO, Tween.EASE_IN_OUT)

	$Tween.start()

	# si se activo el estado fallido en algun momento
	# aumenta todo pero sigue en el mismo nivel
	if Global_variables.nivel_fallido:
		Global_variables.vagon_actual += 1
		Global_variables.vagones_totales += 1

	# si el nivel fue completado sin fallos sigue al siguiente nivel
	elif Global_variables.nivel_completado:
		Global_variables.vagon_actual += 1
		Global_variables.nivel_actual += 1

	# si no hubo ninguno (por ejemplo en un reinicio sin fallos)
	# entonces no realiza nada de lo anterior
	
	Global_variables.nivel_fallido = false
	Global_variables.nivel_completado = false
	Global_variables.taser_activado = false
	Global_variables.controller_activado = false
	Global_variables.municion = 5


func _on_Tween_tween_completed(object, key):
	if Global_variables.nivel_actual == 0:
		get_tree().change_scene("res://Scenes/Vagones/Vagon1.tscn")
	elif Global_variables.nivel_actual == 1:
		get_tree().change_scene("res://Scenes/Vagones/Vagon2.tscn")
	elif Global_variables.nivel_actual == 2:
		get_tree().change_scene("res://Scenes/Vagones/Vagon3.tscn")
	elif Global_variables.nivel_actual == 3:
		get_tree().change_scene("res://Scenes/Vagones/Vagon4.tscn")
	elif Global_variables.nivel_actual == 4:
		get_tree().change_scene("res://Scenes/Cinematica final.tscn")
