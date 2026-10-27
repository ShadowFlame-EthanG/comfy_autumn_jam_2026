extends Node

func _ready() -> void:
	Input.set_custom_mouse_cursor(load("res://Assets/2D_assets/glove0.png"))
	Input.set_custom_mouse_cursor(load("res://Assets/2D_assets/glove1.png"), Input.CURSOR_HELP)
