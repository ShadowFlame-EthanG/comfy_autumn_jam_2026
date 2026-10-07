extends Control

func _on_button_pressed() -> void:
	hide()
	NarrationManager.start_dialogue("intro")
