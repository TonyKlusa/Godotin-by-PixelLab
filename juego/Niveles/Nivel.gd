# Nivel.gd
tool
extends Node

## Atributos export
export var numero_nivel: int = 0
export(String, FILE, "*.tscn") var proximo_nivel = ""
export(String, FILE, "*.tscn") var menu_game_over = ""

## Metodos
func _ready():
	if DatosJuego.primera_vez_nivel:
		$ColorRect/Label.text = "Nivel %s" %DatosJuego.num_nivel_actual
		$ColorRect/AnimationPlayer.play("fade_out")
		DatosJuego.primera_vez_nivel = false
		yield(get_tree().create_timer(4.0), "timeout")
	$ColorRect.queue_free()
	Eventos.connect("game_over", self, "game_over")
	actualizar_datos()
	var guardar: GuardarCargar = GuardarCargar.new() #
	guardar.guardar_datos_juego() #

func _get_configuration_warning() -> String:
	if numero_nivel == 0 or proximo_nivel == "":
		return "Chequear valores de nivel"
	
	return ""

## Metodos custom
func actualizar_datos() -> void:
	DatosJuego.nivel_actual = get_tree().current_scene.filename
	DatosJuego.num_nivel_actual = numero_nivel
	DatosJuego.nivel_proximo = proximo_nivel

func game_over():
# warning-ignore:return_value_discarded
	get_tree().current_scene.queue_free()
	get_tree().current_scene = null
	get_tree().change_scene(menu_game_over)
