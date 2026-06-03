extends Node2D

@onready var input_field = $"./nome"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SilentWolf.configure({
		"api_key": "yESwdyObpS1sjDAj50QtVkM90T0utQl1Zi2MkDc5",
		"game_id": "fertil",
		"log_level": 1
		})
	
	$alerta.hide()
	$Texto.text = "Parabéns! \n\n Voocê fez %s pontos \n\n Digite seu apelido"%global.score
	$nome.text = global.scoreId
	mostrar_placar()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_nome_focus_entered() -> void:
	$alerta.hide()
	# This function executes directly from a user touch event.
	# iPadOS Safari will allow the keyboard to open here.
	$nome.grab_focus() 
	
	# Fallback safety check for Web Display Server capabilities
	if DisplayServer.has_feature(DisplayServer.FEATURE_VIRTUAL_KEYBOARD):
		DisplayServer.virtual_keyboard_show($nome.text)


func _on_enviar_pressed() -> void:
	if $nome.text == "DELETAR_TUDO":
		SilentWolf.Scores.wipe_leaderboard(global.score_table)
		mostrar_placar()
		#$enviar.disabled = true
	
	elif $nome.text != "":
		global.scoreId =$nome.text
		var _sw_save: Dictionary = await SilentWolf.Scores.save_score(
			$nome.text, global.score,global.score_table).sw_save_score_complete
		#global.scoreId = sw_save
		print_debug("OK: "+str($nome.text))
		mostrar_placar()
		$enviar.disabled = true
	
	else:
		$alerta.show()
	pass # Replace with function body.

func mostrar_placar():
	var _sw_result: Dictionary = await SilentWolf.Scores.get_scores(0,global.score_table).sw_get_scores_complete
	var pos = 1
	$Leaderboard.text = ""
	for score in SilentWolf.Scores.scores:
		$Leaderboard.text += "#%s - %-12s %5d\n"% [pos, score.player_name,score.score]
		pos +=1
	


func _on_voltar_pressed() -> void:
	get_tree().change_scene_to_file("res://menu_principal.tscn")


func _on_texture_button_pressed() -> void:
	# This function executes directly from a user touch event.
	# iPadOS Safari will allow the keyboard to open here.
	input_field.grab_focus() 
	
	# Fallback safety check for Web Display Server capabilities
	if DisplayServer.has_feature(DisplayServer.FEATURE_VIRTUAL_KEYBOARD):
		DisplayServer.virtual_keyboard_show(input_field.text)
