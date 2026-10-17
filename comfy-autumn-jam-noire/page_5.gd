extends TextureRect

@onready var full = $"../Page5_full2"
@onready var button = $"../Button"

func _ready() -> void:
	pass

func _on_texture_rect_pressed() -> void:
	hide()
	button.hide()
	full.show()
	
func _on_button_pressed() -> void:
	full.hide()
	button.show()
	show()

func _on_texture_rect_2_pressed() -> void:
	hide()
	button.hide()
	full.show()
