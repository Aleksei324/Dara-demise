extends Control


# Declare member variables here.
onready var vagon15 = $MarginContainer/VBoxContainer/Panel
onready var vagon14 = $MarginContainer/VBoxContainer/Panel2
onready var vagon13 = $MarginContainer/VBoxContainer/Panel3
onready var vagon12 = $MarginContainer/VBoxContainer/Panel4
onready var vagon11 = $MarginContainer/VBoxContainer/Panel5
onready var vagon10 = $MarginContainer/VBoxContainer/Panel6
onready var vagon9 = $MarginContainer/VBoxContainer/Panel7
onready var vagon8 = $MarginContainer/VBoxContainer/Panel8
onready var vagon7 = $MarginContainer/VBoxContainer/Panel9
onready var vagon6 = $MarginContainer/VBoxContainer/Panel10
onready var vagon5 = $MarginContainer/VBoxContainer/Panel11
onready var vagon4 = $MarginContainer/VBoxContainer/Panel12
onready var vagon3 = $MarginContainer/VBoxContainer/Panel13
onready var vagon2 = $MarginContainer/VBoxContainer/Panel14
onready var vagon1 = $MarginContainer/VBoxContainer/Panel15
var num_vagones = 5


func _ready():
	update_detection()


func visibilidad(num):
	if num <= num_vagones:
		return true
	else:
		return false


func update_detection():
	num_vagones += 1
	vagon1.visible = visibilidad(1)
	vagon2.visible = visibilidad(2)
	vagon3.visible = visibilidad(3)
	vagon4.visible = visibilidad(4)
	vagon5.visible = visibilidad(5)
	vagon6.visible = visibilidad(6)
	vagon7.visible = visibilidad(7)
	vagon8.visible = visibilidad(8)
	vagon9.visible = visibilidad(9)
	vagon10.visible = visibilidad(10)
	vagon11.visible = visibilidad(11)
	vagon12.visible = visibilidad(12)
	vagon13.visible = visibilidad(13)
	vagon14.visible = visibilidad(14)
	vagon15.visible = visibilidad(15)
