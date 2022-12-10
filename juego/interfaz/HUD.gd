# HUD.gd
extends Control

## Atributos nready
onready var etiqueta_vidas = $ContenedorVidas/Cantidad
onready var etiqueta_monedas_oro = $ContenedorMonedasOro/Cantidad

## Metodos
func _ready():
# warning-ignore:return_value_discarded
	Eventos.connect("actualizar_hud", self, "actualizar_hud")
	actualizar_hud()

## Metodos custom
func actualizar_hud():
	etiqueta_vidas.text = "%s" %DatosJuego.vidas
	etiqueta_monedas_oro.text = "%s" %DatosJuego.monedas_oro
