extends Node2D


# Declare member variables here.
onready var player = $Jugador/KinematicBody2D
onready var camera = $"Camera and UI/Camera2D"
onready var ui = $"Camera and UI/CanvasLayer"
onready var minimapa = $"Camera and UI/CanvasLayer/Items menu/MarginContainer_minimapa/VBoxContainer/HBoxContainer"


func _ready():
	$"Camera and UI".set_position(player.get_position())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	camera.set_position(player.get_global_position())
