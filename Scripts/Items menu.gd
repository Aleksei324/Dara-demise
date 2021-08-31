extends Control


# Declare member variables here.
onready var container_vagones = $MarginContainer_minimapa/VBoxContainer/HBoxContainer_vagones
onready var label = $MarginContainer_minimapa/VBoxContainer/Label_total_vagones
onready var boton1 = $MarginContainer_items/VBoxContainer/Panel_items/HBoxContainer/TextureButton_taser
onready var boton2 = $MarginContainer_items/VBoxContainer/Panel_items/HBoxContainer/TextureButton2
onready var boton3 = $MarginContainer_items/VBoxContainer/Panel_items/HBoxContainer/TextureButton3
onready var label_item = $MarginContainer_items/VBoxContainer/Label_item
export (PackedScene) var vagon # añade la escena llamada "vagon minimapa.tscn" como objeto
var temp # variable temporal para el bucle for
var item_actual = "Taser"


func _ready():
	# añadir vagones, la cantidad se guarda en un script global
	for x in range(Global_variables.vagones_totales):
		add_vagon()
	
	update_vagones_totales()
	update_icon_minimap()


func _input(event):
	# si se presiona la tecla X, cambia el estado de visibilidad de este menu
	if event.is_action_pressed("ex"):
		visible = true

		if boton1.has_focus():
			$Audio_button.play()
			label_item.set_text("Boton 2")
			boton2.grab_focus()

		elif boton2.has_focus():
			$Audio_button.play()
			label_item.set_text("Boton 3")
			boton3.grab_focus()

		elif boton3.has_focus():
			$Audio_button.play()
			label_item.set_text("Taser")
			boton1.grab_focus()

		# si ninguno tiene focus, dar focus al ultimo item
		else:
			label_item.set_text(item_actual)
			
			if item_actual == "Taser":
				boton1.grab_focus()
				
			elif item_actual == "Boton 2":
				boton2.grab_focus()
				
			else:
				boton3.grab_focus()


func nivel_completado():
	Global_variables.vagon_actual += 1
	update_icon_minimap()


func nivel_fallado():
	add_vagon()
	update_vagones_totales()
	update_icon_minimap()


func update_vagones_totales():
	# actualizar numero de vagones
	Global_variables.vagones_totales = container_vagones.get_child_count()

	# actualizar label
	label.text = str(Global_variables.vagones_totales) + " vagones"


func add_vagon():
	# añadir vagon nuevo
	var v = vagon.instance()
	container_vagones.add_child(v)


func update_icon_minimap():
	for x in range(Global_variables.vagones_totales):
		# guarda el objeto en la variable temporal
		temp = container_vagones.get_child(x)

		# si es el vagon actual, añade el icono
		if x == Global_variables.vagon_actual:
			temp.set_icono_activo(true)

		else:
			temp.set_icono_activo(false)


func boton_presionado():
	item_actual = label_item.get_text()
	visible = false


func _on_TextureButton_taser_button_up():
	boton_presionado()
