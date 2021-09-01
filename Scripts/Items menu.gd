extends Control


# Declare member variables here.
onready var container_vagones = $MarginContainer_minimapa/VBoxContainer/HBoxContainer_vagones
onready var label = $MarginContainer_minimapa/VBoxContainer/Label_total_vagones
onready var boton1 = $MarginContainer_items/VBoxContainer/Panel_items/HBoxContainer/TextureButton_pulso
onready var boton2 = $MarginContainer_items/VBoxContainer/Panel_items/HBoxContainer/TextureButton_controller
onready var boton3 = $MarginContainer_items/VBoxContainer/Panel_items/HBoxContainer/TextureButton_extra
onready var label_item = $MarginContainer_items/VBoxContainer/Label_item
onready var label_municion = $MarginContainer_items/VBoxContainer/Label_municion
export (PackedScene) var vagon # añade la escena llamada "vagon minimapa.tscn" como objeto
var temp # variable temporal para el bucle for
var item_actual = "Pulso electromagnetico"


func _ready():
	# añadir vagones, la cantidad se guarda en un script global
	for x in range(Global_variables.vagones_totales):
		add_vagon()
	
	update_vagones_totales()
	update_icon_minimap()


func _input(event):
	# si se presiona la tecla X, se activa este menu
	if event.is_action_pressed("ex") and not Global_variables.textbox_activo:
		Global_variables.items_menu_activo = true
		visible = true

		if boton1.has_focus():
			$Audio_button.play()
			label_item.set_text("Corruptor de comandos")
			boton2.grab_focus()

		elif boton2.has_focus():
			$Audio_button.play()
			label_item.set_text("Manta")
			boton3.grab_focus()

		elif boton3.has_focus():
			$Audio_button.play()
			label_item.set_text("Pulso electromagnetico")
			boton1.grab_focus()

		# si ninguno tiene focus, dar focus al ultimo item
		else:
			label_item.set_text(item_actual)

			if item_actual == "Pulso electromagnetico":
				boton1.grab_focus()

			elif item_actual == "Corruptor de comandos":
				boton2.grab_focus()

			else:
				boton3.grab_focus()


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


func actualizar_label_municion():
	label_municion.text = str(Global_variables.municion) + " usos"


func boton_presionado():
	item_actual = label_item.get_text()
	visible = false
	Global_variables.items_menu_activo = false


func _on_TextureButton_taser_button_up():
	Global_variables.gun_mode = 0
	boton_presionado()


func _on_TextureButton_controller_button_up():
	Global_variables.gun_mode = 1
	boton_presionado()


func _on_TextureButton_extra_button_up():
	Global_variables.gun_mode = 2
	boton_presionado()
