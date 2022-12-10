extends Control

## Atributos export
export(String, FILE, "*.tscn") var menu_ajustes = ""
export(String, FILE, "*.tscn") var menu_inicio = ""

## Metodos
func _ready():
	visible = false

func _input(event):
	if event.is_action_pressed("pausa"):
		visible = not visible
		get_tree().paused = not get_tree().paused
		if visible:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

## Seniales internas
func _on_BotonContinuar_pressed():
	$BotonPress.play()
	get_tree().paused = false
	visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _on_BotonMenu_pressed() -> void:
	$BotonPress.play()
# warning-ignore:return_value_discarded
	get_tree().paused = false
	get_tree().change_scene(menu_inicio)

func _on_BotonSalir_pressed() -> void:
	$BotonPress.play()
	get_tree().quit()

#Sonidos al pasar el mouse
func _on_BotonContinuar_mouse_entered() -> void:
	$BotonHover.play()

func _on_BotonMenu_mouse_entered() -> void:
	$BotonHover.play()

func _on_BotonSalir_mouse_entered() -> void:
	$BotonHover.play()
