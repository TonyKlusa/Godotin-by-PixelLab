# MonedaDorada.gd
class_name MonedaDorada
extends Area

## Seniales internas
func _on_body_entered(_body: Node) -> void:
	DatosJuego.sumar_monedas()
	$Colisionador.set_deferred("disabled", true)
	$AnimationPlayer.play("consumida")
