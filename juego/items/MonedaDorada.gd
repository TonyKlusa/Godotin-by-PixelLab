# MonedaDorada.gd
class_name MonedaDorada
extends Area



func _on_MonedaDorada_body_entered(body: Node) -> void:
	#DatosJuego.sumar_monedas()
	$Colisionador.set_deferred("disabled", true)
	$AnimationPlayer.play("consumida")

