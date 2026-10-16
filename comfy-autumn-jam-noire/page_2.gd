extends TextureRect

@onready var full = $"../Page2_full"
@onready var button = $"../Button"

func _ready() -> void:
	pass

func _on_texture_button_pressed() -> void:
	hide()
	button.hide()
	full.show()
	
func _on_button_pressed() -> void:
	full.hide()
	button.show()
	show()

func _on_texture_button_3_pressed() -> void:
	hide()
	button.hide()
	full.show()
