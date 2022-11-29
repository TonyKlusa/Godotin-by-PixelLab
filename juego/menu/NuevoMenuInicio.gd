#MenuInicio. gd
tool
extends Control

export (String, FILE, "*. tscn") var menu_ajustes = ""

func _on_BotonSalir_pressed () -> void:
	get_tree().quit ()


func _on_Ajustes_pressed() -> void:
	#$BotonSalir.play()
	get_tree().change_scene(menu_ajustes)
