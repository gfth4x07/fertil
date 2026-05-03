extends Node2D

var gold = 300
var dia = 1
var dias_mes = 31  # 1ºdia do outono
var tomate_on = false  #Habilita o tomate na loja
var tomate_click = 0  # Cliques para adicionar o tomate

var plantas = []
var planta_sel = null
const Planta = preload("res://planta.tscn")
const Nabo = preload("res://nabo.tscn")
const Morango = preload("res://morango.tscn")
const Abacaxi = preload("res://abacaxi.tscn")
const Tomate = preload("res://tomate.tscn")

@onready var HS_screen = preload("res://high_score.tscn")

# Major bug fix: As plantas podem ficar muito juntas (aumentar o tamanho do button)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gold = 300
	dia = 1
	dias_mes = 31
	
	#game_mode = "debug"
	if global.game_mode == "debug":
		dias_mes = 5
	
	$prox_dia.disabled = false
	$jardim/CollisionPolygon2D.disabled = false
	$fim_de_jogo.hide()
	$Dia.text = "Dia: "+str(dia)
	$Gold.text = "Gold: "+str(gold)+"G"
	$menu_loja/Loja.select(0,true)
	#$tree_spring.show()
	$tree_aut.hide()
	
	if global.game_mode == "tutorial":
		global.etapa_tutorial = 0
		$tutorial.tutorial()
	else:
		$tutorial.hide()

#Adicionar o tomate
func _on_tomato_button_pressed():
	tomate_click += 1
	if tomate_click == 7:
		$menu_loja/Loja.add_item('TOMATE         300G',null,true)
		tomate_on = true

# Seleção da planta no menu lateral
func _on_as_item_selected(index: int) -> void:
	if index == 0:
		planta_sel = null
	if index == 1:
		planta_sel = Nabo
	if index == 2:
		planta_sel = Morango
	if index == 3:
		planta_sel = Abacaxi
	if index == 4:
		planta_sel = Tomate


# Planta no jardim
func _on_jardim_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if planta_sel == null:
		return

	if event is InputEventMouseButton and event.is_pressed():
		var nova_planta = planta_sel.instantiate()
		if gold >= nova_planta.custo:
			gold -= nova_planta.custo
			$Gold.text = "Gold: "+str(gold)+"G"
			nova_planta.position = event.position
			nova_planta.position.y -= 45
			$jardim/CollisionPolygon2D.add_child(nova_planta)
			nova_planta.planta_colhida.connect(colheu_planta)


# BOTÃO PROXIMO DIA
func _on_prox_dia_button_up() -> void:
	dia += 1
	$Dia.text = "Dia: "+str(dia)
	get_tree().call_group("plantas","CRESCER")
	
	
	 # Termina o jogo se acaba o dinhreiro
	if(gold<120 and get_tree().get_nodes_in_group("plantas").is_empty()):
		fim_de_jogo()
	
	if dia == dias_mes:
		inicia_outono()
	
	if dia > dias_mes:
		fim_de_jogo()


func colheu_planta(valor: int):
	gold += valor
	$Gold.text = "Gold: "+str(gold)+"G"
	if(global.game_mode == "tutorial"):
		$tutorial.tutorial()
		
func inicia_outono():
	get_tree().call_group("plantas","MORRER")
	$jardim/CollisionPolygon2D.disabled = true
	$tree_aut.show()

func fim_de_jogo():
	$fim_de_jogo/dia.text = "Você chegou no dia "+str(dia)
	if dia > dias_mes:
		$fim_de_jogo/dia.text = "A primavera acabou."
	$fim_de_jogo/pontuação.text = "Você terminou com "+str(gold)+"G"
	global.score = gold
	$fim_de_jogo.show()
	$prox_dia.disabled = true
	get_tree().call_group("plantas","queue_free")
	#get_tree().paused = true



func _on_novo_jogo_pressed() -> void:
	_ready()

func _on_placar_pressed() -> void:
	get_tree().change_scene_to_file("res://high_score.tscn")
