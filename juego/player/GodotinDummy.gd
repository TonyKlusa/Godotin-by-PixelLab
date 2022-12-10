# GodotinDummy.gd
extends KinematicBody

export var cantidad_rotacion: int = 20

func _ready():
	$Animaciones.play("run-cycle")

func _process(delta: float) -> void:
	$Armadura.rotation_degrees.y += cantidad_rotacion * delta
