##PantallaCerga.gd

extends Control

func _on_Timer_timeout () -> void:
	if OS.get_name() in DatosConfiguracion.OS_ADMITIDOS_THREADS:
		##Cargamos en segundo plano
		pass
	else:
		get_tree().change_scene(DatosJuego.nivel_actual)
