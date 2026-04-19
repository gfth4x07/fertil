extends Node2D

var textos = [
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
	"Cuidado pois se você não colher sua planta morre.",
	"Cuidado pois se você não colher sua planta morre.",# TODO ou string vazia pra animação?
	"Se você ficar sem dinheiro para plantar, você perde.",
	"Além diso quando chegar dia 30 a primavera acabará e no dia seguinte o jogo acaba.",
	"Tente fazer o máximo possível de dinheiro até lá.",
	"FIM DO TUTORIAL"]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$rita.position = Vector2(229,122)
	$fala.position = Vector2(63,157)

	#global.etapa_tutorial = 0
	#$fala.text=textos[global.etapa_tutorial]




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func tutorial():
	print("OIOIOI ",global.etapa_tutorial," # ",textos[global.etapa_tutorial])
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
	if global.etapa_tutorial == 13: #Aviso não colheirta
		pass
	if global.etapa_tutorial == 14: #Animação não colheita
		pass
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
	$fala.text = textos[global.etapa_tutorial]
	$Label.text = str(global.etapa_tutorial)
	global.etapa_tutorial += 1
	print("XAUXAUXAU ",global.etapa_tutorial)

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
