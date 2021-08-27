extends KinematicBody2D


# Declare member variables here.
var movimiento_acumulado
var orientacion_movimiento = "derecha_walk"
var orientacion_estatico = "derecha"
const VELOCIDAD = 400


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	# reiniciar movimiento acumulado
	movimiento_acumulado = Vector2()

	# detecta pulsaciones de teclas y actualiza sprites en base a ello
	if Input.is_action_pressed("ui_down"):
		movimiento_acumulado.y += 1
		orientacion_movimiento = "adelante_walk"
		orientacion_estatico = "adelante"

	if Input.is_action_pressed("ui_up"):
		movimiento_acumulado.y -= 1
		orientacion_movimiento = "detras_walk"
		orientacion_estatico = "detras"

	if Input.is_action_pressed("ui_right"):
		movimiento_acumulado.x += 1
		orientacion_movimiento = "derecha_walk"
		orientacion_estatico = "derecha"

	if Input.is_action_pressed("ui_left"):
		movimiento_acumulado.x -= 1
		orientacion_movimiento = "izquierda_walk"
		orientacion_estatico = "izquierda"

	# si hay movimiento acumulado entonces le da una velocidad determinada
	# lo limita si es necesario. Aplica el sprite
	if movimiento_acumulado.length_squared() > 0:
		movimiento_acumulado = movimiento_acumulado.normalized() * VELOCIDAD
		$AnimatedSprite.animation = orientacion_movimiento

	else:
		$AnimatedSprite.animation = orientacion_estatico

	# moverse
	move_and_slide(movimiento_acumulado)
	# position += movimiento_acumulado * delta # alternativa sin fisicas
	
	# limita hasta que pixeles puedes moverte
	# position.x = clamp(position.x, 20, 2540)
	# position.y = clamp(position.y, 150, 1730)
