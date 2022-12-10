# MenuInicio.gd
tool
extends Control

## Atributos export
export(String, FILE, "*.tscn") var menu_ajustes = ""
export(String, FILE, "*.tscn") var nivel_inicial = ""
export(String, FILE, "*.tscn") var pantalla_carga = ""

## Metodos
func _ready() -> void:
	var cargar: GuardarCargar = GuardarCargar.new()
	if MusicaGlobal.musica.playing == false:
		MusicaGlobal.replay()
	if cargar.chequear_existencia_archivo():
		$ContenedorPrincipal/BotonCargar.disabled = false
	else:
		$ContenedorPrincipal/BotonCargar.disabled = true

func _get_configuration_warning() -> String:
	if menu_ajustes == "":
		return "Chequear rutas"
	return ""

## Seniales internas
func _on_BotonSalir_pressed() -> void:
	get_tree().quit()

func _on_BotonOpciones_pressed() -> void:
	$BotonSFX.play()
	get_tree().change_scene(menu_ajustes)

func _on_BotonNuevo_pressed() -> void:
	var borrar: GuardarCargar = GuardarCargar.new()
	borrar.borrar_datos_juego() #
	DatosJuego.nivel_actual = nivel_inicial
	DatosJuego.num_nivel_actual = 1
	DatosJuego.reset()
	get_tree().change_scene(pantalla_carga)


#Funciones para sonido al pasar sobre el mouse

func _on_BotonCargar_mouse_entered() -> void:
	$BotonHover.play()


func _on_BotonNuevo_mouse_entered() -> void:
	$BotonHover.play()

func _on_BotonOpciones_mouse_entered() -> void:
	$BotonHover.play()

func _on_BotonSalir_mouse_entered() -> void:
	$BotonHover.play()

func _on_BotonCargar_pressed() -> void:
	var cargar: GuardarCargar = GuardarCargar.new()
	cargar.cargar_datos_juego()
	get_tree().change_scene(pantalla_carga)
