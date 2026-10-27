extends TextureRect

@onready var full = $"../Page5_full2"
@onready var button = $"../Button"
@onready var rustle = $"../RustleRustling"

var seen = false

func _ready() -> void:
	if NarrationManager.final_scene == false:
		seen = false

func _on_texture_rect_pressed() -> void:
	hide()
	button.hide()
	full.show()
	rustle.play()
	if seen == false:
		seen = true
	
func _on_button_pressed() -> void:
	full.hide()
	button.show()
	show()

func _on_texture_rect_2_pressed() -> void:
	hide()
	button.hide()
	full.show()
	rustle.play()
	if seen == false:
		seen = true
