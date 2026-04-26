extends Control



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global.game_mode = "debug"
	global.tutorial_mode = ""
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	if global.game_mode == "placar":
		get_tree().change_scene_to_file("res://high_score.tscn")
	else:
		get_tree().change_scene_to_file("res://jogo.tscn")



func _on_option_button_item_selected(index: int) -> void:
	if index == 0:
		global.game_mode = "play"
		$"Tutorial mode".hide()
	elif index == 1:
		global.game_mode = "tutorial"
		$"Tutorial mode".show()
		$"Tutorial mode".select(0)
	elif index == 2:
		global.game_mode = "placar"
		$"Tutorial mode".hide()
	

func _on_tutorial_mode_item_selected(index: int) -> void:
	if index == 0:
		global.tutorial_mode = "como_jogar"
	elif index == 1:
		global.tutorial_mode = "financas"
	elif index == 2:
		global.tutorial_mode = "sequencias"
