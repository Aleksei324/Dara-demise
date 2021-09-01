extends Node2D


# Declare member variables here.
onready var player = $Jugador/KinematicBody2D
onready var camera = $"Camera and UI/Camera2D"
onready var failed_screen = $"Camera and UI/CanvasLayer/Mission failed"
onready var items_menu = $"Camera and UI/CanvasLayer/Items menu"
onready var textbox = $"Camera and UI/CanvasLayer/Textbox"
var primera_vez_detectado = true
var drones # para buscar el dron más cercano
var dron_cercano


func _ready():
	$Audio_fondo.play(2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if textbox.acabado:
		get_tree().change_scene("res://Scenes/Pantalla de carga.tscn")
	
	# esta constantemente moviendo la camara a la posición del jugador
	# usa la posición global ya que la camara y el jugador tienen (0,0) en sitios distintos
	camera.set_position(player.get_global_position())
	
	# si el nivel esta en estado fallido,
	# activa todos los metodos de distintos nodos que se requieran
	if Global_variables.nivel_fallido and primera_vez_detectado:
		failed_screen.init_timer()
		primera_vez_detectado = false

	# activa la habilidad del item Taser
	if Global_variables.taser_activado:
		$Audio_habilidad_activa.play()
		get_tree().call_group("Laser", "cambiar_habilitacion")
		Global_variables.municion -= 1
		Global_variables.taser_activado = false
	
	if Global_variables.controller_activado:
		$Audio_habilidad_activa.play()
		drones = get_tree().get_nodes_in_group("Dron")
		dron_cercano = drones[0]
		
		for x in drones:
			
			if x.global_position.distance_to(player.global_position) < (
					dron_cercano.global_position.distance_to(player.global_position)):

				dron_cercano = x

		dron_cercano.activar_controller(player.global_position)

		Global_variables.municion -= 1
		Global_variables.controller_activado = false

	items_menu.actualizar_label_municion()
