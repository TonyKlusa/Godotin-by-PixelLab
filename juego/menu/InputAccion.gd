#InputAccion.gd
extends Button

export var accion: String

var traducciones: Dictionary = {
	"Space" : "espacio",
	"Up": "flecha arriba",
	"Down": "flecha abajo",
	"Left": "flecha izquierda",
	"Rigth": "flecha derecha",
	"Caps Lock": "Bloq Mayus"
}
func _ready() -> void:
	assert(InputMap.has_action(accion))
	mostrar_input_actual()
	set_process_unhandled_input(false)

func _unhandled_input(evento: InputEvent) -> void:
	remapear_accion(evento)
	pressed = false
		
	
func mostrar_input_actual() -> void:
	var input_actual: String = InputMap.get_action_list(accion)[0].as_text()
	if input_actual in traducciones:
		input_actual= traducciones[input_actual]
		
	text = input_actual

func remapear_accion(evento: InputEvent) ->void:
	InputMap.action_erase_events(accion)
	InputMap.action_add_event(accion, evento)
	text = traducir_input(evento.as_text())

func traducir_input(input_actual: String) -> String:
	if input_actual in traducciones:
		return traducciones[input_actual]
	return input_actual


func _get_configuracion_warning() -> String:
	if accion == "":
		return "No hay accion asignada"
	return ""
	



func _on_toggled(boton_presionado: bool) -> void:
	set_process_unhandled_input(boton_presionado)
	if boton_presionado:
		text = "Asignar input..."
		release_focus()
	else:
		mostrar_input_actual()


