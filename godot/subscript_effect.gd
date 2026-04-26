@tool
extends RichTextEffect
class_name RichTextSubscript

var bbcode = "sub"

func _process_custom_fx(char_fx):
	# Shift character down and scale it
	char_fx.offset = Vector2(0, 5)
	char_fx.font
	#char_fx.transform = char_fx.transform.scaled(Vector2(0.7, 0.7))
	return true
