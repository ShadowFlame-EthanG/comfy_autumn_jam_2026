extends Control

func _on_texture_button_pressed() -> void:
	hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	NarrationManager.start_dialogue("intro")
