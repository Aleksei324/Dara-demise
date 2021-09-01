extends Node2D


# Declare member variables here.
export (float) var orientacion = 0.0
export (bool) var mueve_a_derecha = true # true si rota hacia la derecha


# Called when the node enters the scene tree for the first time.
func _ready():
	set_rotation(orientacion)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# se encarga de rotar la camara correctamente
	if mueve_a_derecha:
		if get_rotation() < orientacion + PI/6:
			rotation += 0.1 * delta

		else:
			mueve_a_derecha = false

	elif get_rotation() > orientacion - PI/6:
		rotation -= 0.1 * delta

	else:
		mueve_a_derecha = true


func _on_Area2D_detection_area_body_entered(body):
	Global_variables.nivel_fallido = true
