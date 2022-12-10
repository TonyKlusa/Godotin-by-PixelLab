# Sierra.gd
class_name Sierra
extends Area

## Seniales internas
func _on_body_entered(body):
	var player: Godotin = body
	player.respawn()
