#MenuPresentacion-gd
tool
extends Control

export (String, FILE, "*.tscn") var menu_inicial = ""

func get_configuration_warning () -> String :
	if menu_inicial == "":
		return "No hay menu inicial asignado"
	return ""

func etiqueta_numero_nivel() -> void:
	get_tree().change_scene(menu_inicial)

## Metodos custom
func cargar_menu() -> void:
	get_tree().change_scene(menu_inicial)
