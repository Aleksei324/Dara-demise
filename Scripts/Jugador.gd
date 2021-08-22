extends Area2D


# Declare member variables here.
var movimiento_acumulado
var orientacion_movimiento = "adelante_walk"
var orientacion_estatico = "adelante"
var velocidad = 500


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	# reiniciar movimiento acumulado
	movimiento_acumulado = Vector2()

	# detecta pulsaciones de teclas
	if Input.is_action_pressed("ui_right"):
		movimiento_acumulado.x += 1
		orientacion_movimiento = "derecha_walk"
		orientacion_estatico = "derecha"

	if Input.is_action_pressed("ui_left"):
		movimiento_acumulado.x -= 1
		orientacion_movimiento = "izquierda_walk"
		orientacion_estatico = "izquierda"

	if Input.is_action_pressed("ui_down"):
		movimiento_acumulado.y += 1
		orientacion_movimiento = "adelante_walk"
		orientacion_estatico = "adelante"

	if Input.is_action_pressed("ui_up"):
		movimiento_acumulado.y -= 1
		orientacion_movimiento = "detras_walk"
		orientacion_estatico = "detras"

	# si hay movimiento acumulado entonces le da una velocidad determinada
	# lo limita si es necesario
	if movimiento_acumulado.length_squared() > 0:
		movimiento_acumulado = movimiento_acumulado.normalized() * velocidad
		$AnimatedSprite.animation = orientacion_movimiento

	else:
		$AnimatedSprite.animation = orientacion_estatico

	# moverse
	position += movimiento_acumulado * delta
	
	# limita hasta que pixeles puedes moverte
	position.x = clamp(position.x, 0, 1500)
	position.y = clamp(position.y, 0, 1000)
