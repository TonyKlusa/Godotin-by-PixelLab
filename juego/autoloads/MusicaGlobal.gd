## MusicaGlobal.gd
extends Node

## Atributos onready
onready var musica: AudioStreamPlayer = $AudioStreamPlayer

## Metodos custom
func replay():
	musica.stop()
	musica.play()
