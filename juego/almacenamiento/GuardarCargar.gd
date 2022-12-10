# GuardarCargar.gd
class_name GuardarCargar
extends Node

enum {JUEGO, CONFIG}

## Guardar datos configuracion
func guardar_datos_configuracion() -> int:
	if not OS.get_name() in DatosConfiguracion.OS_ADMITIDOS_GUARDADO:
		return -1
	
	var ruta: String = seleccionar_ruta(CONFIG)
	
	var datos: DatosAjustesGuardado = DatosAjustesGuardado.new()
	datos.pantalla_completa = OS.window_fullscreen
	datos.pantalla_resolucion = OS.window_size
	datos.volumen_buses = {
		"master": AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")),
		"musica": AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Musica")),
		"sfx": AudioServer.get_bus_volume_db(AudioServer.get_bus_index("SFX"))
	}
	
	var resultado: int = ResourceSaver.save(ruta, datos)
	
	return resultado

## Guardar datos juego
func guardar_datos_juego() -> int:
	if not OS.get_name() in DatosConfiguracion.OS_ADMITIDOS_GUARDADO:
		return -1
	
	var ruta: String = seleccionar_ruta(JUEGO)
	
	var datos: DatosUsuarioGuardado = DatosUsuarioGuardado.new()
	
	datos.vidas = DatosJuego.vidas
	datos.monedas_oro = DatosJuego.monedas_oro
	datos.nivel_actual = DatosJuego.nivel_actual
	datos.num_nivel_actual = DatosJuego.num_nivel_actual
	datos.nivel_proximo = DatosJuego.nivel_proximo
	
	var resultado: int = ResourceSaver.save(ruta, datos)
	
	return resultado

## Cargar datos configuracion
func cargar_datos_configuracion() -> void:
	var ruta: String = seleccionar_ruta(CONFIG)
	var dir: Directory = Directory.new()
	if not dir.file_exists(ruta):
		guardar_datos_configuracion()
	else:
		var datos: Resource = load(ruta)
		OS.window_fullscreen = datos.pantalla_completa
		OS.window_size = datos.pantalla_resolucion
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), datos.volumen_buses.master)
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Musica"), datos.volumen_buses.musica)
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), datos.volumen_buses.sfx)
		
		var tamanio_pantalla = OS.get_screen_size()
		OS.set_window_position((tamanio_pantalla - datos.pantalla_resolucion) * 0.5)

## Cargar datos juego
func cargar_datos_juego() -> void:
	var ruta: String = seleccionar_ruta(JUEGO)
	var datos: Resource = load(ruta)
	
	DatosJuego.vidas = datos.vidas
	DatosJuego.monedas_oro = datos.monedas_oro
	DatosJuego.nivel_actual = datos.nivel_actual
	DatosJuego.num_nivel_actual = datos.num_nivel_actual
	DatosJuego.nivel_proximo = datos.nivel_proximo

## Borrar datos
func borrar_datos_juego() -> int:
	if not OS.get_name() in DatosConfiguracion.OS_ADMITIDOS_GUARDADO:
		return -1
	
	var dir = Directory.new()
	var resultado: int = dir.remove(seleccionar_ruta(JUEGO))
	
	return resultado

## Metodos custom
func seleccionar_ruta(archivo: int) -> String:
	var ruta: String
	
	if OS.is_debug_build():
		ruta = DatosConfiguracion.RUTA_GUARDADO_DEBUG
	else:
		ruta = DatosConfiguracion.RUTA_GUARDADO_RELEASE
	
	chequear_existencia_directorio(ruta)
	
	match archivo:
		JUEGO:
			ruta += DatosConfiguracion.NOMBRE_ARCHIVO_DATOS
		CONFIG:
			ruta += DatosConfiguracion.NOMBRE_ARCHIVO_CONFIG
		_:
			printerr("No existe ese tipo de archivos")
	
	return ruta

func chequear_existencia_directorio(ruta: String) -> void:
	var dir = Directory.new()
	if not dir.dir_exists(ruta):
		Directory.new().make_dir_recursive(ruta)

func chequear_existencia_archivo() -> bool:
	var ruta: String = seleccionar_ruta(JUEGO)
	var arch = File.new()
	if arch.file_exists(ruta):
		return true
	else:
		return false
