extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global.game_mode = "tutorial"
	global.tutorial_mode = "sequencias"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	if global.game_mode == "placar":
		get_tree().change_scene_to_file("res://high_score.tscn")
	elif global.game_mode == "arte":
		get_tree().change_scene_to_file("res://testes/arte.tscn")
	elif global.game_mode == "questionario":
		get_tree().change_scene_to_file("res://questionário.tscn")
	else:
		get_tree().change_scene_to_file("res://jogo.tscn")



func _on_option_button_item_selected(index: int) -> void:
	if index == 0:
		global.game_mode = "play"
		$"Tutorial mode".hide()
		$"Tutorial step".hide()
	elif index == 1:
		global.game_mode = "tutorial"
		global.tutorial_mode = "como_jogar"
		$"Tutorial mode".show()
		$"Tutorial mode".select(0)
		$"Tutorial step".show()
	elif index == 2:
		global.game_mode = "placar"
		$"Tutorial mode".hide()
	elif index == 3:
		global.game_mode = "arte"
		$"Tutorial mode".hide()
	elif index == 4:
		global.game_mode = "questionario"

func _on_tutorial_mode_item_selected(index: int) -> void:
	if index == 0:
		global.tutorial_mode = "como_jogar"
	elif index == 1:
		global.tutorial_mode = "financas"
	elif index == 2:
		global.tutorial_mode = "sequencias"
