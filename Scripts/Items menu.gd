extends Control


# Declare member variables here.
onready var container_vagones = $MarginContainer_minimapa/VBoxContainer/HBoxContainer
onready var label = $MarginContainer_minimapa/VBoxContainer/Label
onready var boton1 = $MarginContainer_items/Panel/GridContainer/TextureButton
export (PackedScene) var vagon
var vagon_actual = 0
var vagones_totales
var temp
var estado_visibilidad = false


func _ready():
	add_vagon()
	add_vagon()
	add_vagon()
	add_vagon()
	add_vagon()
	add_vagon()

	update_vagones_totales()
	update_icon_minimap()


func _input(event):
	if event.is_action_pressed("ex"):
		estado_visibilidad = not estado_visibilidad
		visible = estado_visibilidad

		if estado_visibilidad:
			boton1.grab_focus()


func nivel_completado():
	vagon_actual += 1
	update_icon_minimap()


func nivel_fallado():
	add_vagon()
	update_vagones_totales()
	update_icon_minimap()


func update_vagones_totales():
	# actualizar numero de vagones
	vagones_totales = container_vagones.get_child_count()

	# actualizar label
	label.text = str(vagones_totales) + " vagones"


func add_vagon():
	# añadir vagon nuevo
	var v = vagon.instance()
	container_vagones.add_child(v)


func update_icon_minimap():
	for x in range(vagones_totales):
		temp = container_vagones.get_child(x)

		if x == vagon_actual:
			temp.set_icono_activo(true)

		else:
			temp.set_icono_activo(false)
