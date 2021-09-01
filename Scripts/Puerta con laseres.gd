extends Node2D


# Declare member variables here.
export (bool) var habilited = true # to use with taser hability
onready var sprite = $StaticBody2D/AnimatedSprite
onready var collision = $StaticBody2D/CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Laser")
	habilitacion()


func cambiar_habilitacion():
	habilited = not habilited
	habilitacion()


func habilitacion():
	if habilited:
		$Audio_laser.play()
		sprite.animation = "on"
		# la forma recomendada
		collision.set_deferred("disabled", false)
	else:
		$Audio_laser.stop()
		sprite.animation = "off"
		# la forma recomendada
		collision.set_deferred("disabled", true)
