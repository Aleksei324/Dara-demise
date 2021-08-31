extends Control


func init_timer():
	$Audio_alarm.play()
	set_visible(true)
	$Timer_lights.start()
	$Timer_sounds.start()


func stop():
	$Timer_lights.stop()
	$Timer_sounds.stop()
	set_visible(false)


func _on_Timer_lights_timeout():
	visible = not is_visible()


func _on_Timer_sounds_timeout():
	$Audio_alarm.play()
