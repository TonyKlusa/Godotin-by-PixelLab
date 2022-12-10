# MenuPresentacion.gd
tool
extends Control

## Atributos export
export(String, FILE, "*.tscn") var menu_inicial = ""

## Metodos
func _ready() -> void:
	var cargar: GuardarCargar = GuardarCargar.new()
	cargar.cargar_datos_configuracion()
	if cargar.chequear_existencia_archivo():
		cargar.cargar_datos_juego()

func _get_configuration_warning() -> String:
	if menu_inicial == "":
		return "No hay menu inicial asignado"
	return ""

## Metodos custom
func cargar_menu() -> void:
	get_tree().change_scene(menu_inicial)
