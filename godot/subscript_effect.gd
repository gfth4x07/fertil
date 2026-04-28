@tool
extends RichTextEffect
class_name RichTextSubscript

var bbcode = "sub"

func _process_custom_fx(char_fx):
	char_fx.offset = Vector2(0, 3)
	return true
