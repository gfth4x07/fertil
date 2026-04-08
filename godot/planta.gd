extends Node2D

var idade = 0

#Essas caracteristicas devem ser alteradas no Inspector para cada tipo de planta
@export var custo = 0
@export var valor = 0
@export var estagio = [0]
@export var colheita_recorrente = false
@export var estagio_pos_colheita = 4

#variáveis globais que são alteradas no _read()
var idade_colheita = len(estagio) - 2
var idade_mortis = len(estagio)

func _ready() -> void:
	idade = 0
	idade_colheita = len(estagio) - 2
	idade_mortis = len(estagio)
	$animated.set_frame_and_progress(0,1)

#função chamada pelo botão prox_dia
func CRESCER():
	idade += 1
	if idade < len(estagio):
		$animated.set_frame_and_progress(estagio[idade], 1)
	else:
		queue_free()

# COLHEITA função chamada quando clica na planta
func _on_button_button_down() -> void:
	if idade == idade_colheita:
		planta_colhida.emit(valor)
		if colheita_recorrente:
			idade = estagio_pos_colheita
			$animated.set_frame_and_progress(estagio[idade], 1)
		else:
			#A planta some quando colhida
			queue_free()
		
func MORRER():
	$animated.set_frame_and_progress(estagio[-1], 1)

signal planta_colhida(valor)
