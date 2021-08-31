extends Node2D


# Declare member variables here.
onready var area = $Area2D_detection_area
export (float) var orientacion = 0.0
var mueve_a_derecha = true # true si rota hacia la derecha
var detected = false # si detecta al jugador


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Enemies")
	set_rotation(orientacion)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if mueve_a_derecha:
		if area.get_rotation() < orientacion + PI/6:
			area.rotation += 0.1 * delta

		else:
			mueve_a_derecha = false

	elif area.get_rotation() > orientacion - PI/6:
		area.rotation -= 0.1 * delta

	else:
		mueve_a_derecha = true


func _on_Area2D_detection_area_body_entered(body):
	detected = true
