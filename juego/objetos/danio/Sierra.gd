##Sierra.dg
class_name Sierra
extends Area


func _on_Sierra_body_entered(body: Node) -> void:
	var player: Godotin = body
	player.respawn()

	
