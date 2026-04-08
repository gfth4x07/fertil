extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var pontos = global.score
	var nome = ""
	$alerta.hide()
	$Texto.text = "Parabéns! \n\n Voocê fez %s pontos \n\n Digite seu apelido"%pontos
	SilentWolf.configure({
		"api_key": "yESwdyObpS1sjDAj50QtVkM90T0utQl1Zi2MkDc5",
		"game_id": "fertil",
		"log_level": 1
		})

	SilentWolf.configure_scores({
		"open_scene_on_close": "res://scenes/high_score.tscn"
	})
	
	mostrar_placar()
	#global.score
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_nome_focus_entered() -> void:
	$alerta.hide()
	pass # Replace with function body.


func _on_enviar_pressed() -> void:
	if $nome.text != "":
		var score_id = await(SilentWolf.Scores.save_score($nome.text, global.score))
		global.scoreId = score_id
		print_debug("OK: "+str(score_id))
		mostrar_placar()
	
	else:
		$alerta.show()
	pass # Replace with function body.


func mostrar_placar():
	var sw_result: Dictionary = await SilentWolf.Scores.get_scores(10).sw_get_scores_complete
	print("Scores: " + str(sw_result.scores))
	
	var pos = 1
	$Leader_bord.text = ""
	for score in SilentWolf.Scores.scores:
		$Leader_bord.text += "#%s - %12s %s\n"% [pos, score.player_name,score.score]
		pos +=1
	
