extends Node2D


# Declare member variables here.
onready var player = $Jugador/KinematicBody2D
onready var camera = $"Camera and UI/Camera2D"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# esta constantemente moviendo la camara a la posición del jugador
	# usa la posición global ya que la camara y el jugador tienen (0,0) en sitios distintos
	camera.set_position(player.get_global_position())
