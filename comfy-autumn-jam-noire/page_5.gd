extends TextureRect

@onready var full = $"../Page5_full2"
@onready var button = $"../Button"

var seen = false

func _ready() -> void:
	pass

func _on_texture_rect_pressed() -> void:
	hide()
	button.hide()
	full.show()
	if seen == false:
		seen = true
		NarrationManager.newspaper_count += 1
		if NarrationManager.newspaper_count == 3:
			NarrationManager.set_variable("whole_news", true)
	
func _on_button_pressed() -> void:
	full.hide()
	button.show()
	show()

func _on_texture_rect_2_pressed() -> void:
	hide()
	button.hide()
	full.show()
	if seen == false:
		seen = true
		NarrationManager.newspaper_count += 1
		if NarrationManager.newspaper_count == 3:
			NarrationManager.set_variable("whole_news", true)
