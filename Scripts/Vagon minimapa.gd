extends Control


# función para manejar la visibilidad del icono desde otro script
func set_icono_activo(x):
	$Panel/TextureRect_icon.visible = x
