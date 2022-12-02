# Nivel.gd
tool
#class_name Nivel
extends Node


## Atributos Export
##export var numero_nivel: int = 0
export var numero_nivel: int = 0
export(String, FILE, "*.tscn") var proximo_nivel = ""
##menu game over
export var menu_game_over = "res://juego/menu/MenuGameOver.tscn"
export var nivel_actual = ""


## Metodos
func _ready() -> void:
	#DatosJuego.nivel_actual = get_tree().current_scene.filename #verificar error
	DatosJuego.num_nivel_actual = numero_nivel
	DatosJuego.nivel_proximo = proximo_nivel



func _get_configuration_warning() -> String:
	if numero_nivel == 0 or proximo_nivel == "":
		return "Chequear valores del nivel"
	
	return ""

func game_over():
	DatosJuego.nivel_actual = nivel_actual
	get_tree().change_scene(menu_game_over)
	DatosJuego.reset()
	
