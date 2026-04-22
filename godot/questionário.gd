extends Node2D
var pagina = 0
var enviado = false
var acertoSprite = preload("res://acerto.tscn")
var erroSprite = preload("res://erro.tscn")
func _ready() -> void:
	pagina = 1
	$Anterior.hide()
	$Pagina1.show()
	$Menu1.show()
	
func _on_anterior_pressed() -> void:
	var paginaAtual = get_node("Pagina" + str(pagina))
	paginaAtual.hide()
	pagina -= 1
	var proxPagina = get_node("Pagina" + str(pagina))
	proxPagina.show()
	if pagina == 1:
		$Anterior.hide()
		$Menu1.show()
	if pagina == 3:
		$Enviar.hide()
		$Proxima.show()
	if pagina == 4:
		$Menu2.hide()
		$Proxima.show()


func _on_proxima_pressed() -> void:
	var paginaAtual = get_node("Pagina" + str(pagina))
	paginaAtual.hide()
	pagina += 1
	var proxPagina = get_node("Pagina" + str(pagina))
	proxPagina.show()
	if pagina == 4 and not enviado:
		$Proxima.hide()
		$Enviar.show()
	if pagina == 2:
		$Menu1.hide()
		$Anterior.show()
	if pagina == 5:
		$Proxima.hide()
		$Menu2.show()

func coloca_feedback(paginaPai, resposta, feedbackSprtie) -> void:
	var feedback = feedbackSprtie.instantiate()
	feedback.position.y = resposta.position.y + 15
	feedback.position.x = resposta.position.x - 20
	paginaPai.add_child(feedback)
	
	
func _on_enviar_pressed() -> void:
	var pontos = 0
	enviado = true
	$Enviar.hide()
	if $'Pagina1/Resposta1a'.value == 240:
		pontos += 1
		coloca_feedback($Pagina1, $'Pagina1/Resposta1a', acertoSprite)
	else:
		coloca_feedback($Pagina1, $'Pagina1/Resposta1a', erroSprite)
	if $'Pagina1/Resposta1b'.value == 100:
		pontos += 1
		coloca_feedback($Pagina1, $'Pagina1/Resposta1b', acertoSprite)
	else:
		coloca_feedback($Pagina1, $'Pagina1/Resposta1b', erroSprite)
	if $'Pagina2/Resposta2a'.value == 8:
		pontos += 1
		coloca_feedback($Pagina2, $'Pagina2/Resposta2a', acertoSprite)
	else:
		coloca_feedback($Pagina2, $'Pagina2/Resposta2a', erroSprite)
	var regex = RegEx.create_from_string("[0-9]+")
	var results2 = []
	for result in regex.search_all($'Pagina2/Resposta2b'.text):
		results2.push_back(int(result.get_string()))
	var gabarito2 = [8, 11, 14, 17, 20, 23, 26, 29]
	var alldias2 = true
	var i2 = 0
	if len(results2) != 8:
		alldias2 = false
	while(i2 < 8 and alldias2):
		if gabarito2[i2] != results2[i2]:
			alldias2 = false
	if alldias2:
		pontos += 1
		coloca_feedback($Pagina2, $'Pagina2/Resposta2b', acertoSprite)
	else:
		coloca_feedback($Pagina2, $'Pagina2/Resposta2b', erroSprite)
	if $'Pagina2/Resposta2c1'.value == 860:
		pontos += 1
		coloca_feedback($Pagina2, $'Pagina2/Resposta2c1', acertoSprite)
	else:
		coloca_feedback($Pagina2, $'Pagina2/Resposta2c1', erroSprite)
	if $'Pagina2/Resposta2c2'.value == 560:
		pontos += 1
		coloca_feedback($Pagina2, $'Pagina2/Resposta2c2', acertoSprite)
	else:
		coloca_feedback($Pagina2, $'Pagina2/Resposta2c2', erroSprite)
	if $'Pagina3/Resposta3'.value == 17:
		pontos += 1
		coloca_feedback($Pagina3, $'Pagina3/Resposta3', acertoSprite)
	else:
		coloca_feedback($Pagina3, $'Pagina3/Resposta3', erroSprite)
	if $'Pagina3/Resposta4'.value == 70:
		pontos += 1
		coloca_feedback($Pagina3, $'Pagina3/Resposta4', acertoSprite)
	else:
		coloca_feedback($Pagina3, $'Pagina3/Resposta4', erroSprite)
	var results5 = []
	for result in regex.search_all($'Pagina4/Resposta5a'.text):
		results5.push_back(int(result.get_string()))
	var gabarito5 = [26, 28, 30]
	var alldias5 = true
	var i5 = 0
	if len(results5) != 3:
		alldias5 = false
	while(i2 < 3 and alldias2):
		if gabarito5[i5] != results5[i5]:
			alldias5 = false
	if alldias5:
		pontos += 1
		coloca_feedback($Pagina4, $'Pagina4/Resposta5a', acertoSprite)
	else:
		coloca_feedback($Pagina4, $'Pagina4/Resposta5a', erroSprite)
	if $'Pagina4/Resposta5b'.value == 28:
		pontos += 1
		coloca_feedback($Pagina4, $'Pagina4/Resposta5b', acertoSprite)
	else:
		coloca_feedback($Pagina4, $'Pagina4/Resposta5b', erroSprite)
	#disabilita botões pós envio
	for i in range(1,5):
		var p = get_node("Pagina" + str(i))
		for c in p.get_children():
			if c.name.begins_with("Resposta"):
				c.editable = false
	
	$Pagina5/Resultado.text = "Parabéns você acertou %d/10 Perguntas!" % pontos
	_on_proxima_pressed()
	


func _on_resposta_list_text_changed(new_text: String, source: LineEdit) -> void:
	for c in new_text:
		if c not in "0123456789,;:-_/|\\ ":
			source.text = ""


func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://menu_modos.tscn")
