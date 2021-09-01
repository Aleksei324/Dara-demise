extends Node2D


# Declare member variables here.
export (bool) var hacia_adelante = true # determinar si va hacia delante o atras
export (bool) var hacia_arriba = true # para la rotacion
const VELOCIDAD = 300
var adelante
var atras


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Dron")
	
	if hacia_arriba:
		adelante = Vector2(0.0, -VELOCIDAD)
		atras = Vector2(0.0, VELOCIDAD)
	else:
		adelante = Vector2(VELOCIDAD, 0.0)
		atras = Vector2(-VELOCIDAD, 0.0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if hacia_adelante:
		$KinematicBody2D.move_and_slide(adelante)

	else:
		$KinematicBody2D.move_and_slide(atras)


func activar_controller(vector_player):
	# animación que mueve el dron al sitio
	$Tween.interpolate_property(
			$KinematicBody2D, "global_position", $KinematicBody2D.global_position,
			vector_player, 5, Tween.TRANS_EXPO, Tween.EASE_IN_OUT)

	$Tween.start()


func _on_Timer_timeout():
	hacia_adelante = not hacia_adelante


func _on_Area2D_body_entered(body):
	Global_variables.nivel_fallido = true
