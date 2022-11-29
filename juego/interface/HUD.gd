## HUD.gd
extends Control


## Atributos Onready
onready var etiqueta_vidas = $ContenedorVidas/Cantidad
onready var etiqueta_monedas_oro = $ContenedorMonedasOro/Cantidad
onready var etiqueta_numero_nivel = $ContenedorNivel/nivel


func _ready() -> void:
	# warning-ignore:return_value_discarded
	actualizar_hud()
	Eventos.connect("actualizar_hud", self, "actualizar_hud")

func actualizar_hud() -> void:
	etiqueta_vidas.text = "%s" % DatosJuego.vidas
	etiqueta_monedas_oro.text = "%s" % DatosJuego.monedas_oro
	#etiqueta_numero_nivel.text = "%s" % DatosJuego.num_nivel_actual
	etiqueta_numero_nivel.text = "Nivel {num}".format({"num": DatosJuego.num_nivel_actual})

