extends Node2D

const Nabo = preload("res://nabo.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$rita.position = Vector2(229,122)
	$fala.position = Vector2(63,157)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func atualizar_texto():
	if global.tutorial_mode == "como_jogar":
		$fala.text = texto_como_jogar[global.etapa_tutorial]
	elif global.tutorial_mode == "financas":
		$fala.text = texto_financas[global.etapa_tutorial]
	elif global.tutorial_mode == "sequencias":
		$fala.text = texto_sequencias[global.etapa_tutorial]
	else:
		$fala.text = "ERRO TUTORIAL MODE"
	


func tutorial():
	print("OIOIOI ",global.etapa_tutorial," # ",$fala.text)
	if global.etapa_tutorial == 0:
		$rita_smile.hide()
		$seta.hide()
		$".".show()
		$"../background/jardim/CollisionPolygon2D".disabled = true
		$"../prox_dia".disabled = true
		#TODO FAZER UM LOOP
		$"../menu_loja/Loja".set_item_disabled(0,true)
		$"../menu_loja/Loja".set_item_disabled(1,true)
		$"../menu_loja/Loja".set_item_disabled(2,true)
		$"../menu_loja/Loja".set_item_disabled(3,true)
	
	if global.tutorial_mode == "como_jogar":
		if global.etapa_tutorial == 2:
			$rita.position = Vector2(55,255)
			$fala.position = Vector2(111,213)
			$seta.position = Vector2(400,24)
			$seta.show()
		if global.etapa_tutorial == 3:
			$seta.position = Vector2(400,70)
			$seta.show()
		if global.etapa_tutorial == 4:
			$proximo.hide()
			$"../menu_loja/Loja".set_item_disabled(1,false)
		if global.etapa_tutorial == 5:
			$seta.hide()
			$"../menu_loja/Loja".set_item_disabled(1,true)
			$"../background/jardim/CollisionPolygon2D".disabled = false
		if global.etapa_tutorial == 6:
			$"../background/jardim/CollisionPolygon2D".disabled = true
			$proximo.show()
		if global.etapa_tutorial == 7: # Clique em prox dia
			$proximo.hide()
			$"../prox_dia".disabled = false
			$seta.position = Vector2(400,280)
			$seta.show()
		if global.etapa_tutorial == 8: # Plantou o nabo
			var nabo = get_tree().get_nodes_in_group("plantas")[0]
			nabo.get_child(0).disabled = true
		if global.etapa_tutorial == 10: 
			$"../prox_dia".disabled = true
			$proximo.show()
			$seta.hide()
		if global.etapa_tutorial == 11: # Clique para colher
			$proximo.hide()
			var nabo = get_tree().get_nodes_in_group("plantas")[0]
			nabo.get_child(0).disabled = false
		if global.etapa_tutorial == 12: #Colheu o nabo
			$proximo.show()
		if global.etapa_tutorial == 13: #Aviso não colheita
			pass
		if global.etapa_tutorial == 14: #Animação não colheita
			var nova_planta = Nabo.instantiate()
			nova_planta.position = Vector2(120,120)
			$proximo.hide()
			$"../background/jardim/CollisionPolygon2D".add_child(nova_planta)
			
			await get_tree().create_timer(2).timeout
			$"../"._on_prox_dia_button_up()
			await get_tree().create_timer(2).timeout
			$"../"._on_prox_dia_button_up()
			await get_tree().create_timer(2).timeout
			$"../"._on_prox_dia_button_up()
			await get_tree().create_timer(2).timeout
			$"../"._on_prox_dia_button_up()
			$proximo.show()
		if global.etapa_tutorial == 15: #Explicação de sem dinheiro = perder
			pass
		if global.etapa_tutorial == 16: # 30 dias -> fim do jogo.
			pass
		if global.etapa_tutorial == 17: # Tente fazer o máximo de dinheiro até lá
			pass
		if global.etapa_tutorial == 18: #FIM
			$proximo.hide()
			$rita.hide()
			$rita_smile.show()
			$rita.position = Vector2(229,122)
			$fala.position = Vector2(63,157)
			$"../voltar_menu".position = Vector2(176,256)
			$"../voltar_menu".show()
	
	if global.tutorial_mode == "financas":
		if global.etapa_tutorial == 2: 
			$seta.position = Vector2(400,24)
			$seta.show()
		if global.etapa_tutorial == 3:
			$seta.position = Vector2(400,73)
		if global.etapa_tutorial == 4:
			print("$$$$$$")
			$proximo.hide()
			$"../menu_loja/Loja".set_item_disabled(1,false)
		if global.etapa_tutorial == 5:
			$seta.hide()
			$"../menu_loja/Loja".set_item_disabled(1,true) 
			$"../background/jardim/CollisionPolygon2D".disabled = false
		if global.etapa_tutorial == 6:
			$seta.position = Vector2(400,24)
			$seta.show()
			$proximo.show()
			$"../background/jardim/CollisionPolygon2D".disabled = true
		if global.etapa_tutorial == 7:
			$proximo.hide()
			$seta.hide()
			$"../prox_dia".disabled = false
		if global.etapa_tutorial == 10:
			$"../prox_dia".disabled = true
		if global.etapa_tutorial == 11:
			$proximo.show()
		if global.etapa_tutorial == 16: #FIM
			$proximo.hide()
			$rita.hide()
			$rita_smile.show()
			$rita.position = Vector2(229,122)
			$fala.position = Vector2(63,157)
			$"../voltar_menu".position = Vector2(176,256)
			$"../voltar_menu".show()
	
	if global.tutorial_mode == "sequencias":
		pass
		if global.etapa_tutorial == 18: #FIM
			$proximo.hide()
			$rita.hide()
			$rita_smile.show()
			$rita.position = Vector2(229,122)
			$fala.position = Vector2(63,157)
			$"../voltar_menu".position = Vector2(176,256)
			$"../voltar_menu".show()
	
	atualizar_texto()
	$Label.text = str(global.etapa_tutorial)
	global.etapa_tutorial += 1


func _on_tutorial_proximo_pressed() -> void:
	tutorial()


func _on_loja_item_clicked(index: int, at_position: Vector2, mouse_button_index: int) -> void:
	if(global.game_mode == "tutorial"):
		tutorial()

func _on_jardim_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		if(global.game_mode == "tutorial"):
			tutorial()

func _on_prox_dia_button_up() -> void:
	if(global.game_mode == "tutorial"):
		tutorial()

func _on_voltar_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://menu_modos.tscn")

##########################
## TEXTOS DOS TUTORIAIS ##
##########################

var texto_como_jogar = [
	"Olá! Seja bem vindo ao f(e)rtil!
Um jogo onde se deve plantar para conseguir a maior quantidade de dinheiro e aprender enquanto se diverte!",
	"Bem vindo ao tutorial.
Aqui você aprenderá como jogar.",
	"Aqui mostra o dinheiro que você tem.",
	"Aqui você pode selecionar o tipo de planta que irá plantar",
	"Selecione o nabo",
	"Agora aperte em algum lugar da terra.",
	"Parabéns, você plantou um nabo.",
	"Agora clique em próximo dia.",
	"O Nabo cresceu!
Continue passando os dias até que ele cresça completamente.",
	"O Nabo cresceu!
Continue passando os dias até que ele cresça completamente.",
	"O Nabo está pronto para ser colhido.",
	"Clique nele para colher.",
	"Parabéns, você colheu!",
	"Cuidado pois se você não colher sua planta morre.
Dessa vez a planta será por minha conta.",
	"Cuidado pois se você não colher sua planta morre.
Que triste a planta morreu.",
	"Se você ficar sem dinheiro para plantare todas as suas plantas morrerem você perde o jogo.",
	"Outra coisa, a primavera tem 30 dias, no dia seguinte todas as plantas morrerão e o jogo termina.",
	"Tente fazer o máximo possível de dinheiro até lá.",
	"FIM DO TUTORIAL"]


var texto_financas = [ #PLANTAR MORANGO
	"Olá! Seja bem vindo ao f(e)rtil!
Um jogo onde se deve plantar para conseguir a maior quantidade de dinheiro e aprender enquanto se diverte!",
	"Bem-vindo ao tutorial de finanças",
	"Esse dinheiro que você tem é chamado de [color='black']caixa[/color].
	Então temos em caixa 300G", # Dinheiro em caixa
	"Agora veja que para plantar um nabo você precisará comprar a semente.
Esse valor será gasto por você, por isso chamamos ele de [color='red']gasto[/color] ou [color='red']custo[/color].", # Gasto
	"Plante um nabo.",
	"Plante um nabo.",
	"Veja que o seu dinheiro diminuiu.
Agora você só tem 180G",
	"Agora avance os dias para colher o nabo.",
	"Agora avance os dias para colher o nabo.",
	"Agora avance os dias para colher o nabo.",
	"Agora avance os dias para colher o nabo.",
	"Veja, seu dinheiro aumentou.
Você tinha 180G e agora têm 320, ou seja, ganhou 140G!
Esse valor é o que chamamos de [color='yellow']receita[/color].",
	"Mas pense bem, se considerar que para plantar o nabo foi [color='red']gasto 120G[/color] e quando colheu você [color='yellow']recebeu 140G[/color].
Então  na verdade você ficou com 20G a mais.",
	"A essa diferença de [color='yellow']receita[/color] - [color='red']gasto[/color] damos o nome de [color='green']lucro[/color]
Então seu [color='green']lucro[/color] foi de 20G.",
	"Também podemos pensar no lucro como tinhamos 300G e depois 320G.
Veja que o aumentou 20G",
	"A diferença do [color='green']lucro[/color] para a [color='yellow']receita[/color] é que o [color='green']lucro[/color] considera o [color='red']gasto[/color] envolvido, já a [color='yellow']receita[/color] [b]não[/b] considera.",
	"FIM DO TUTORIAL"]


var texto_sequencias = [
	"Olá! Seja bem vindo ao f(e)rtil!
Um jogo onde se deve plantar para conseguir a maior quantidade de dinheiro e aprender enquanto se diverte!",
	"SEQ 1",
	"SEQ 2",
	"SEQ 3",
	"SEQ 4",
	"FIM DO TUTORIAL"]
