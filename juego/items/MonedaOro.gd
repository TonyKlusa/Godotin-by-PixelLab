# MonedaDorada.gd
class_name Moneda
extends Area


## Señales Internas


func _on_MonedaOro_body_entered(body: Node) -> void:
	DatosJuego.sumar_monedas()
	$Colisionador.set_deferred("disabled", true)
	$AnimationPlayer.play("consumida")
