extends Area2D


# Declare member variables here.
var velocidad = 500
var movimiento_acumulado


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
		$AnimatedSprite.animation = "derecha_walk"

	if Input.is_action_pressed("ui_left"):
		movimiento_acumulado.x -= 1
		$AnimatedSprite.animation = "izquierda_walk"

	if Input.is_action_pressed("ui_down"):
		movimiento_acumulado.y += 1
		$AnimatedSprite.animation = "adelante"

	if Input.is_action_pressed("ui_up"):
		movimiento_acumulado.y -= 1
		$AnimatedSprite.animation = "detras"

	# si hay movimiento acumulado entonces le da una velocidad determinada
	# lo limita si es necesario
	if movimiento_acumulado.length_squared() > 0:
		movimiento_acumulado = movimiento_acumulado.normalized() * velocidad

	position += movimiento_acumulado * delta
	
	# limita hasta que pixeles puedes moverte
	position.x = clamp(position.x, 100, 900)
	position.y = clamp(position.y, 100, 500)
