extends Control



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SilentWolf.configure({
		"api_key": "yESwdyObpS1sjDAj50QtVkM90T0utQl1Zi2MkDc5",
		"game_id": "fertil",
		"log_level": 1
		})
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://jogo.tscn")



func _on_option_button_item_selected(index: int) -> void:
	if index == 0:
		global.game_mode = "play"
	elif index == 1:
		global.game_mode = "tutorial"
