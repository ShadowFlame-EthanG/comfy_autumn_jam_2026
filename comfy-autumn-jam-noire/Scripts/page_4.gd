extends TextureRect

@onready var full = $"../Page4_full"
@onready var button = $"../Button"
@onready var rustle = $"../RustleRustling"

var seen = false
var dial_seen = true
var change_seen = true

func _ready() -> void:
	if NarrationManager.final_scene == false:
		dial_seen = true
		seen = false
		
func _on_texture_rect_pressed() -> void:
	hide()
	button.hide()
	full.show()
	rustle.play()
	NarrationManager.set_variable("changelings", true)
	NarrationManager.set_variable("waitress_2", true)
	if change_seen == true:
			NarrationManager.talk_to_them()
			change_seen = false
	if seen == false:
		seen = true
		NarrationManager.newspaper_count += 1
		if NarrationManager.newspaper_count == 3:
			NarrationManager.set_variable("whole_news", true)
			NarrationManager.set_variable("margaret_2", true)
			if dial_seen == true and NarrationManager.get_variable("whole_news") and NarrationManager.get_variable("whole_case"):
				NarrationManager.talk_to_them()
				dial_seen = false
	
func _on_button_pressed() -> void:
	full.hide()
	button.show()
	show()

func _on_texture_rect_2_pressed() -> void:
	hide()
	button.hide()
	full.show()
	rustle.play()
	NarrationManager.set_variable("changelings", true)
	NarrationManager.set_variable("waitress_2", true)
	if change_seen == true:
		NarrationManager.talk_to_them()
		change_seen = false
	if seen == false:
		seen = true
		NarrationManager.newspaper_count += 1
		if NarrationManager.newspaper_count == 3:
			NarrationManager.set_variable("whole_news", true)
			NarrationManager.set_variable("margaret_2", true)
			if dial_seen == true and NarrationManager.get_variable("whole_news") and NarrationManager.get_variable("whole_case"):
				NarrationManager.talk_to_them()
				dial_seen = false
