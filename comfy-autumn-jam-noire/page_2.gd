extends TextureRect

@onready var full = $"../Page2_full"
@onready var button = $"../Button"
@onready var rustle = $"../RustleRustling"

var seen = false
var dial_seen = true

func _ready() -> void:
	pass

func _on_texture_button_pressed() -> void:
	hide()
	button.hide()
	full.show()
	if seen == false:
		seen = true
		NarrationManager.newspaper_count += 1
		if NarrationManager.newspaper_count == 3:
			NarrationManager.set_variable("whole_news", true)
			if dial_seen == true:
				NarrationManager.talk_to_them()
				dial_seen = false
	
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
		NarrationManager.newspaper_count += 1
		if NarrationManager.newspaper_count == 3:
			NarrationManager.set_variable("whole_news", true)


func _on_fake_text_right_pressed() -> void:
	hide()
	button.hide()
	full.show()
	rustle.play()
	if seen == false:
		seen = true
		NarrationManager.newspaper_count += 1
		if NarrationManager.newspaper_count == 3:
			NarrationManager.set_variable("whole_news", true)
			if dial_seen == true:
				NarrationManager.talk_to_them()
				dial_seen = false
