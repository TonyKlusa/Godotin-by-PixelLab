#NuevoMenuInicio. gd
tool
extends Control

export (String, FILE, "*. tscn") var menu_ajustes = ""

func _on_BotonSalir_pressed () -> void:
	$BotonSFX.play()
	get_tree().quit ()


func _on_Ajustes_pressed() -> void:
	$BotonSFX.play()
	get_tree().change_scene(menu_ajustes)

func _on_BotonNuevo_mouse_entered() -> void:
	$BotonHover.play()

func _on_Ajustes_mouse_entered() -> void:
	$BotonHover.play()

func _on_BotonSalir_mouse_entered() -> void:
	$BotonHover.play()
