# Portal.gd
class_name PortalNivel
extends Area

## Atributos export
export(String, FILE, "*.tscn") var proximo_nivel = ""

## Seniales internas
func _on_body_entered(_body):
	if proximo_nivel != "":
# warning-ignore:return_value_discarded
		get_tree().change_scene(proximo_nivel)
