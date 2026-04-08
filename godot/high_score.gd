extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print_debug("ON_ready")
	$alerta.hide()
	$Texto.text = "Parabéns! \n\n Voocê fez %s pontos \n\n Digite seu apelido"%global.score
	
	#SilentWolf.configure_scores({
	#	"open_scene_on_close": "res://scenes/high_score.tscn"
	#})
	print_debug("ON_ready2")
	
	
	var sw_result: Dictionary = await SilentWolf.Scores.get_scores(10).sw_get_scores_complete
	print("Scores: " + str(sw_result.scores))
	var pos = 1
	$Leader_bord.text = ""
	for score in SilentWolf.Scores.scores:
		$Leader_bord.text += "#%s - %12s %s\n"% [pos, score.player_name,score.score]
		pos +=1
	print_debug("ON_ready3")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_nome_focus_entered() -> void:
	$alerta.hide()
	pass # Replace with function body.


func _on_enviar_pressed() -> void:
	if $nome.text != "":
		var sw_save: Dictionary = await SilentWolf.Scores.save_score($nome.text, global.score).sw_save_score_complete
		#global.scoreId = sw_save
		print_debug("OK: "+str($nome.text))
		
		var sw_result: Dictionary = await SilentWolf.Scores.get_scores().sw_get_scores_complete
		print("Scores: " + str(sw_result.scores))
		var pos = 1
		$Leader_bord.text = ""
		for score in SilentWolf.Scores.scores:
			$Leader_bord.text += "#%s - %12s %s\n"% [pos, score.player_name,score.score]
			pos +=1
		print_debug("OLOLOLOLOLOLO")
		$enviar.disabled = true
	
	else:
		$alerta.show()
	pass # Replace with function body.
