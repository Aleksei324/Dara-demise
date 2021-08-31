extends Node2D


# Declare member variables here.
onready var player = $Jugador/KinematicBody2D
onready var camera = $"Camera and UI/Camera2D"
onready var failed_screen = $"Camera and UI/CanvasLayer/Mission failed"
var failed = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# esta constantemente moviendo la camara a la posición del jugador
	# usa la posición global ya que la camara y el jugador tienen (0,0) en sitios distintos
	camera.set_position(player.get_global_position())
	
	# Obtiene todos los nodos de tipo enemigo
	for node in get_tree().get_nodes_in_group("Enemies"):
		if node.detected:
			# se desactiva para evitar un bucle
			node.detected = false
			failed = true
			failed_screen.init_timer()


func _on_Area2D_win_place_body_entered(body):
	if failed:
		failed = false
		failed_screen.stop()
		$Audio_level_finished.play()
