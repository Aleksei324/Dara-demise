extends Control


# Declare member variables here.
onready var container_vagones = $MarginContainer_minimapa/VBoxContainer/HBoxContainer_vagones
onready var label = $MarginContainer_minimapa/VBoxContainer/Label_total_vagones
onready var boton1 = $MarginContainer_items/Panel_items/GridContainer/TextureButton
export (PackedScene) var vagon # añade la escena llamada "vagon minimapa.tscn" como objeto
var vagon_actual = 0
var vagones_totales
var temp # variable temporal para el bucle for
var estado_visibilidad = false


func _ready():
	# añadir vagones por defecto (5 porque tenemos 5 niveles)
	add_vagon()
	add_vagon()
	add_vagon()
	add_vagon()
	add_vagon()

	update_vagones_totales()
	update_icon_minimap()


func _input(event):
	# si se presiona la tecla X, cambia el estado de visibilidad de este menu
	if event.is_action_pressed("ex"):
		estado_visibilidad = not estado_visibilidad
		visible = estado_visibilidad

		if estado_visibilidad:
			# dar el focus al primer boton
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
		# guarda el objeto en la variable temporal
		temp = container_vagones.get_child(x)

		# si es el vagon actual, añade el icono
		if x == vagon_actual:
			temp.set_icono_activo(true)

		else:
			temp.set_icono_activo(false)
