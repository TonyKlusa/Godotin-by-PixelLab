# MenuVictoria.gd
extends Control

## Metodos
func _ready():
	MusicaGlobal.musica.stop()
	$VictoriaSFX.play()
	$Label.text += "%s" %DatosJuego.puntaje

## Seniales internas
func _on_BotonMenuPrincipal_pressed():
	$BotonPress.play()
	get_tree().change_scene("res://juego/menus/MenuInicio.tscn")

func _on_BotonSalir_pressed():
	$BotonPress.play()
	get_tree().quit()



func _on_BotonMenuPrincipal_mouse_entered() -> void:
	$BotonHover.play()

func _on_BotonSalir_mouse_entered() -> void:
	$BotonHover.play()
