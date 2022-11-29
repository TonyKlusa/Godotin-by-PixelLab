extends Control
#menuAjustes.gd

export (String, FILE, "*. tscn") var menu_inicial = "res://juego/menu/NuevoMenuInicio.tscn"

func _on_BotonRegresar_pressed() -> void:
	get_tree().change_scene (menu_inicial)
