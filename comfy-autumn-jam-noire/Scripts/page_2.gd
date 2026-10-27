extends TextureRect

@onready var full = $"../Page2_full"
@onready var button = $"../Button"
@onready var rustle = $"../RustleRustling"

var seen = false

func _ready() -> void:
	if NarrationManager.final_scene == false:
		seen = false

func _on_texture_button_pressed() -> void:
	hide()
	button.hide()
	full.show()
	if seen == false:
		seen = true
		
	
func _on_button_pressed() -> void:
	full.hide()
	button.show()
	show()
	rustle.play()


func _on_fake_text_left_pressed() -> void:
	hide()
	button.hide()
	full.show()
	rustle.play()
	if seen == false:
		seen = true
		

func _on_fake_text_right_pressed() -> void:
	hide()
	button.hide()
	full.show()
	rustle.play()
	if seen == false:
		seen = true
		
