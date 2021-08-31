extends Node2D


# Declare member variables here.
onready var player = $Jugador/KinematicBody2D
onready var camera = $"Camera and UI/Camera2D"
onready var failed_screen = $"Camera and UI/CanvasLayer/Mission failed"
var primera_vez_detectado = true


func _ready():
	Global_variables.nivel_fallido = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# esta constantemente moviendo la camara a la posición del jugador
	# usa la posición global ya que la camara y el jugador tienen (0,0) en sitios distintos
	camera.set_position(player.get_global_position())
	
	# si el nivel esta en estado fallido,
	# activa todos los metodos de distintos nodos que se requieran
	if Global_variables.nivel_fallido and primera_vez_detectado:
		failed_screen.init_timer()
		primera_vez_detectado = false


func _on_Area2D_win_place_body_entered(body):
	$Audio_level_finished.play()
	get_tree().change_scene("res://Scenes/UI/Pantalla de carga.tscn")
