extends Node2D

var fala_texto2 = 0

const Nabo = preload("res://nabo.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$rita.position = Vector2(229,122)
	#$fala.position = Vector2(63,157)


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
		$fala.position = Vector2(25,155)
		$fala.size = Vector2(390,92)
		$rita_smile.hide()
		$seta.hide()
		$".".show()
		$bloco_de_notas.hide()
		$fala2.hide()
		$"../background/jardim/CollisionPolygon2D".disabled = true
		$"../prox_dia".disabled = true
		#TODO FAZER UM LOOP
		$"../menu_loja/Loja".set_item_disabled(0,true)
		$"../menu_loja/Loja".set_item_disabled(1,true)
		$"../menu_loja/Loja".set_item_disabled(2,true)
		$"../menu_loja/Loja".set_item_disabled(3,true)
	
	if global.tutorial_mode == "como_jogar":
		if global.etapa_tutorial == 2:
			$rita.position = Vector2(53, 231)
			$fala.position = Vector2(105, 183)
			$fala.size = Vector2(330,92)
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
			$proximo.hide()
			var nova_planta = Nabo.instantiate()
			nova_planta.position = Vector2(120,120)
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
		if global.etapa_tutorial == 1:
			pass
			#$rita.position = Vector2(55,255)
			#$fala.position = Vector2(111,213)
		if global.etapa_tutorial == 2:
			$rita.position = Vector2(53, 231)
			$fala.position = Vector2(105, 183)
			$fala.size = Vector2(330,92)
			
			$proximo.hide()
			$"../background/jardim/CollisionPolygon2D".disabled = false
			$"../menu_loja/Loja".set_item_disabled(2,false)
			
		if global.etapa_tutorial == 3:
			$rita.hide()
			$rita.position = Vector2(53, 231)
			$fala.position = Vector2(5, 183)
			$fala.size = Vector2(315,92)
			$bloco_de_notas/linha1.text = ""
			$bloco_de_notas/linha2.text = ""
			$bloco_de_notas/linha3.text = ""
			$bloco_de_notas/linha4.hide()
			$bloco_de_notas.show()
			$"../background/jardim/CollisionPolygon2D".disabled = true
			$"../prox_dia".disabled = false
		if global.etapa_tutorial == 4:
			pass
		if global.etapa_tutorial == 10:
			$bloco_de_notas/linha1.text = "8"
			$"../prox_dia".disabled = true
		if global.etapa_tutorial == 11:
			$"../prox_dia".disabled = false
		if global.etapa_tutorial == 14:
			$"../prox_dia".disabled = true
		if global.etapa_tutorial == 15:
			$bloco_de_notas/linha1.text += ", 11"
			$"../prox_dia".disabled = false
		if global.etapa_tutorial == 18:
			$"../prox_dia".disabled = true
			$bloco_de_notas/linha1.text += ", 14"
		if global.etapa_tutorial == 19:
			$proximo.show()
		if global.etapa_tutorial == 20:
			$bloco_de_notas/linha2.text = "a[sub][font_size=10]1[/font_size][/sub], a[sub][font_size=10]2[/font_size][/sub], a[sub][font_size=10]3[/font_size][/sub]"
		if global.etapa_tutorial == 22:
			$proximo.hide()
			$"../prox_dia".disabled = false
		if global.etapa_tutorial == 25:
			$bloco_de_notas/linha1.text += ", 17"
			$bloco_de_notas/linha2.text += ", a[sub][font_size=10]4[/font_size][/sub]"	
			$"../prox_dia".disabled = true
		if global.etapa_tutorial == 26:
			$proximo.show()
		if global.etapa_tutorial == 27:
			$bloco_de_notas/linha3.text += "[color=royal_blue]r = 3[/color]"
		if global.etapa_tutorial == 28:
			$bloco_de_notas/linha4.show()
		if global.etapa_tutorial == 29:
			$bloco_de_notas/linha4.text = "a[sub][font_size=10]5[/font_size][/sub]=20"
		if global.etapa_tutorial == 33:
			$fala.hide()
			fala_texto2 = 0
			$fala2.show()
			$fala2.text = texto2_sequencias[fala_texto2]
			fala_texto2 += 1
		if global.etapa_tutorial == 34:
			$fala2.text = texto2_sequencias[fala_texto2]
			fala_texto2 += 1
		if global.etapa_tutorial == 35:
			$fala2.text = texto2_sequencias[fala_texto2]
			fala_texto2 += 1
		if global.etapa_tutorial == 36:
			$fala2.text = texto2_sequencias[fala_texto2]
			fala_texto2 += 1
		if global.etapa_tutorial == 37:
			$fala2.text = texto2_sequencias[fala_texto2]
			fala_texto2 += 1
		if global.etapa_tutorial == 38:
			$fala2.text = texto2_sequencias[fala_texto2]
			fala_texto2 += 1
		if global.etapa_tutorial == 99:
			pass
		
		
		
		if global.etapa_tutorial == 60: #FIM
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
	if(global.game_mode == "tutorial" and global.tutorial_mode in ["como_jogar","financas"]):
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
	"Que triste a planta morreu.
Quando ela morre não é mais possível colher e você perde todo seu dinheiro.",
	"Se você ficar sem dinheiro para plantar e todas as suas plantas morrerem você perde o jogo.",
	"Outra coisa, a primavera tem 30 dias. No dia seguinte todas as plantas morrerão e o jogo termina.",
	"Tente fazer o máximo possível de dinheiro até lá.",
	"FIM DO TUTORIAL"]


var texto_financas = [ #PLANTAR MORANGO
	"Olá! Seja bem vindo ao f(e)rtil!
Um jogo onde se deve plantar para conseguir a maior quantidade de dinheiro e aprender enquanto se diverte!",
	"Bem-vindo ao tutorial de finanças",
	"Esse dinheiro que você tem é chamado de [color='dim_gray']caixa[/color].
Nesse momento temos em caixa 300G.", # Dinheiro em caixa
	"Agora veja que para plantar um nabo você precisará comprar a semente.
Esse valor será gasto por você, por isso chamamos ele de [color='red']gasto[/color] ou [color='red']custo[/color].", # Gasto
	"Plante um nabo.",
	"Plante um nabo.",
	"Veja que o seu dinheiro diminuiu.
Agora você só tem 180G",
	"Agora avance os dias para colher o nabo.",  # TODO fazer umas brincadeiras aqui?
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
	"FIM DO TUTORIAL"] # TODO Lucro variável com o morango


var texto_sequencias = [
	"Olá! Seja bem vindo ao f(e)rtil!
Um jogo onde se deve plantar para conseguir a maior quantidade de dinheiro e aprender enquanto se diverte!",
	"Bem-vindo ao tutorial de sequências, nele você aprenderá sobre padrões numéricos. ",
	"Vamos lá, plante um morango.",
	"Nosso objetivo será anotar os dias de colheita.
	
Avance para a primeira colheita.",
	"Avance os dias para a primeira colheita.",
	"Avance os dias para a primeira colheita.",
	"Avance os dias para a primeira colheita.",
	"Avance os dias para a primeira colheita.",
	"Avance os dias para a primeira colheita.",
	"Avance os dias para a primeira colheita.",
	"Chegamos na primeira colheita! Ela foi no dia 8.
Colha o morango!", #  10
	"Que dia será a próxima colheita?",
	"Que dia será a próxima colheita?",
	"Que dia será a próxima colheita?",
	"Que dia será a próxima colheita?
Nasceu!",
	"A nossa segunda colheita foi realizada no dia 11.
Vamos continuar!", # 15
	"Vamos continuar!",  
	"Vamos continuar!",
	"Dia 14, nossa terceira colheita.
Olha só, os dias da colheita! Eles formam uma sequência.",
	"A cada número da sequênica damos o nome de [b]termo[/b]. Então o dia da primeira colheita é o 1º termo da nossa sequência.",
	"Ou seja o 1º termo é 8.
O 2º termo é 11, e o 3º termo é 14.
Também podemos escrever como:
[b]a[sub][font_size=10]1[/font_size][/sub][/b] = 8, [b]a[sub][font_size=10]2[/font_size][/sub][/b] = 11 e [b]a[sub][font_size=10]3[/font_size][/sub][/b] = 14",
	"Qual dia você acha que será a próxima colheita?
Ou seja, o 4º termo da sequência, ou ainda [b]a[sub][font_size=10]4[/font_size][/sub][/b]",
	"Agora avance os dias para verificar.",  # 22
	"Um padrão que podemos verificar é que para chegar no próximo termo sempre estamos somando 3.",
	"Como o último dia de colheita foi o 14, o próximo será 14 + 3 = 17!",  
	"Olha, deu isso mesmo!!

Agora colha o morango",  # 25
	"As sequências que têm esse padrão de sempre somar um valor para obter o próximo damos o nome de Progressão Aritmética ou PA.",
	"E a esse número que estamos somando damos o nome de [color=royal_blue]razão[/color] e usamos a letra [color=royal_blue]r[/color] para indicar esse valor.",
	"Seguindo o padrão da sequência, podemos falar que a[sub][font_size=10]5[/font_size][/sub] = a[sub][font_size=10]4[/font_size][/sub] +  [color=royal_blue]r[/color].",
	"E nossa próxima colheita será dia 20
	
Não é legal?",
	"Imagina agora que você quer descobrir quando vai ser a colheita de número 20
Como podemos fazer isso?

hummm...",  # 30
	"Já sei!
Podemos pegar o a[sub][font_size=10]1[/font_size][/sub] e fazer
a[sub][font_size=10]20[/font_size][/sub] = a[sub][font_size=10]1[/font_size][/sub]+[color=royal_blue]r[/color]+[color=royal_blue]r[/color]+[color=royal_blue]r[/color]+[color=royal_blue]r[/color]+[color=royal_blue]r[/color]+[color=royal_blue]r[/color]+[color=royal_blue]r[/color]+[color=royal_blue]r[/color]+[color=royal_blue]r[/color]+[color=royal_blue]r[/color]+[color=royal_blue]r[/color]+[color=royal_blue]r[/color]+[color=royal_blue]r[/color]+[color=royal_blue]r[/color]+[color=royal_blue]r[/color]+[color=royal_blue]r[/color]+[color=royal_blue]r[/color]+[color=royal_blue]r[/color]+[color=royal_blue]r[/color] ",
"Ih, ficou confuso? Deixa eu te explicar.",  # 32
	"","","","","","","","","","","","","","","","","","","","","","",
	"FIM DO TUTORIAL"]


var texto2_sequencias = [
"Nós começamos pelo a[sub][font_size=10]1[/font_size][/sub]
E podemos encontrar os próximos fazendo:
a[sub][font_size=10]2[/font_size][/sub] = a[sub][font_size=10]1[/font_size][/sub] + [color=royal_blue]r[/color]
a[sub][font_size=10]3[/font_size][/sub] = a[sub][font_size=10]1[/font_size][/sub] + [color=royal_blue]r[/color] + [color=royal_blue]r[/color]
a[sub][font_size=10]4[/font_size][/sub] = a[sub][font_size=10]1[/font_size][/sub] + [color=royal_blue]r[/color] + [color=royal_blue]r[/color] + [color=royal_blue]r[/color]
a[sub][font_size=10]5[/font_size][/sub] = a[sub][font_size=10]1[/font_size][/sub] + [color=royal_blue]r[/color] + [color=royal_blue]r[/color] + [color=royal_blue]r[/color] + [color=royal_blue]r[/color]
a[sub][font_size=10]6[/font_size][/sub] = a[sub][font_size=10]1[/font_size][/sub] + [color=royal_blue]r[/color] + [color=royal_blue]r[/color] + [color=royal_blue]r[/color] + [color=royal_blue]r[/color] + [color=royal_blue]r[/color]",

"Nós começamos pelo a[sub][font_size=10]1[/font_size][/sub]
E podemos encontrar os próximos fazendo:
a[sub][font_size=10]2[/font_size][/sub] = a[sub][font_size=10]1[/font_size][/sub] + [color=royal_blue]r[/color] × [color=fuchsia]1[/color]
a[sub][font_size=10]3[/font_size][/sub] = a[sub][font_size=10]1[/font_size][/sub] + [color=royal_blue]r[/color] × [color=fuchsia]2[/color]
a[sub][font_size=10]4[/font_size][/sub] = a[sub][font_size=10]1[/font_size][/sub] + [color=royal_blue]r[/color] × [color=fuchsia]3[/color]
a[sub][font_size=10]5[/font_size][/sub] = a[sub][font_size=10]1[/font_size][/sub] + [color=royal_blue]r[/color] × [color=fuchsia]4[/color]
a[sub][font_size=10]6[/font_size][/sub] = a[sub][font_size=10]1[/font_size][/sub] + [color=royal_blue]r[/color] × [color=fuchsia]5[/color]",

"Nós começamos pelo a[sub][font_size=10]1[/font_size][/sub]
E podemos encontrar os próximos fazendo:
a[sub][color=yellow_green][font_size=10]2[/font_size][/color][/sub] = a[sub][font_size=10]1[/font_size][/sub] + [color=royal_blue]r[/color] × [color=fuchsia]1[/color]
a[sub][color=yellow_green][font_size=10]3[/font_size][/color][/sub] = a[sub][font_size=10]1[/font_size][/sub] + [color=royal_blue]r[/color] × [color=fuchsia]2[/color]
a[sub][color=yellow_green][font_size=10]4[/font_size][/color][/sub] = a[sub][font_size=10]1[/font_size][/sub] + [color=royal_blue]r[/color] × [color=fuchsia]3[/color]
a[sub][color=yellow_green][font_size=10]5[/font_size][/color][/sub] = a[sub][font_size=10]1[/font_size][/sub] + [color=royal_blue]r[/color] × [color=fuchsia]4[/color]
a[sub][color=yellow_green][font_size=10]6[/font_size][/color][/sub] = a[sub][font_size=10]1[/font_size][/sub] + [color=royal_blue]r[/color] × [color=fuchsia]5[/color]",

"Nós começamos pelo a[sub][font_size=10]1[/font_size][/sub]
E podemos encontrar os próximos fazendo:
a[sub][color=yellow_green][font_size=10]2[/font_size][/color][/sub] = a[sub][font_size=10]1[/font_size][/sub] + [color=royal_blue]r[/color] × [color=fuchsia]1[/color]
a[sub][color=yellow_green][font_size=10]3[/font_size][/color][/sub] = a[sub][font_size=10]1[/font_size][/sub] + [color=royal_blue]r[/color] × [color=fuchsia]2[/color]
a[sub][color=yellow_green][font_size=10]4[/font_size][/color][/sub] = a[sub][font_size=10]1[/font_size][/sub] + [color=royal_blue]r[/color] × [color=fuchsia]3[/color]
a[sub][color=yellow_green][font_size=10]5[/font_size][/color][/sub] = a[sub][font_size=10]1[/font_size][/sub] + [color=royal_blue]r[/color] × [color=fuchsia]4[/color]
a[sub][color=yellow_green][font_size=10]6[/font_size][/color][/sub] = a[sub][font_size=10]1[/font_size][/sub] + [color=royal_blue]r[/color] × [color=fuchsia]5[/color]
...
Então o a[sub][font_size=10]20[/font_size][/sub] = ...",

"Nós começamos pelo a[sub][font_size=10]1[/font_size][/sub]
E podemos encontrar os próximos fazendo:
a[sub][color=yellow_green][font_size=10]2[/font_size][/color][/sub] = a[sub][font_size=10]1[/font_size][/sub] + [color=royal_blue]r[/color] × [color=fuchsia]1[/color]
a[sub][color=yellow_green][font_size=10]3[/font_size][/color][/sub] = a[sub][font_size=10]1[/font_size][/sub] + [color=royal_blue]r[/color] × [color=fuchsia]2[/color]
a[sub][color=yellow_green][font_size=10]4[/font_size][/color][/sub] = a[sub][font_size=10]1[/font_size][/sub] + [color=royal_blue]r[/color] × [color=fuchsia]3[/color]
a[sub][color=yellow_green][font_size=10]5[/font_size][/color][/sub] = a[sub][font_size=10]1[/font_size][/sub] + [color=royal_blue]r[/color] × [color=fuchsia]4[/color]
a[sub][color=yellow_green][font_size=10]6[/font_size][/color][/sub] = a[sub][font_size=10]1[/font_size][/sub] + [color=royal_blue]r[/color] × [color=fuchsia]5[/color]
...
a[sub][color=yellow_green][font_size=10]20[/font_size][/color][/sub] = a[sub][font_size=10]1[/font_size][/sub] + [color=royal_blue]r[/color] × [color=fuchsia]19[/color]
",

"Nós começamos pelo a[sub][font_size=10]1[/font_size][/sub]
E podemos encontrar os próximos fazendo:
a[sub][color=yellow_green][font_size=10]2[/font_size][/color][/sub] = a[sub][font_size=10]1[/font_size][/sub] + [color=royal_blue]r[/color] × [color=fuchsia]1[/color]
a[sub][color=yellow_green][font_size=10]3[/font_size][/color][/sub] = a[sub][font_size=10]1[/font_size][/sub] + [color=royal_blue]r[/color] × [color=fuchsia]2[/color]
a[sub][color=yellow_green][font_size=10]4[/font_size][/color][/sub] = a[sub][font_size=10]1[/font_size][/sub] + [color=royal_blue]r[/color] × [color=fuchsia]3[/color]
a[sub][color=yellow_green][font_size=10]5[/font_size][/color][/sub] = a[sub][font_size=10]1[/font_size][/sub] + [color=royal_blue]r[/color] × [color=fuchsia]4[/color]
a[sub][color=yellow_green][font_size=10]6[/font_size][/color][/sub] = a[sub][font_size=10]1[/font_size][/sub] + [color=royal_blue]r[/color] × [color=fuchsia]5[/color]
De maneira geral podemos fazer uma fórumla:
a[sub][color=yellow_green][font_size=10]n[/font_size][/color][/sub] = a[sub][font_size=10]1[/font_size][/sub] + [color=royal_blue]r[/color] × [color=fuchsia](n-1)[/color]
",
"",
]
