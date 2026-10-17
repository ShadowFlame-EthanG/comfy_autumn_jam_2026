extends Control

@onready var open = $OpenFiles
@onready var close = $CloseFiles
@onready var rustle = $RustleRustling

@onready var page_1 = $TextureRect
@onready var page_2 = $TextureRect2
@onready var page_3 = $TextureRect3
@onready var page_4 = $TextureRect4

var page = 1
var seen = true
var dial_seen = true

func _ready() -> void:
	MousePosition.open_files.connect(files_opened)

func _on_texture_button_2_pressed() -> void:
	print("forward")
	if page < 4:
		page += 1
		print(page)

		page_1.hide()
		page_2.hide()
		page_3.hide()
		page_4.hide()

		match page:
			2:
				page_2.show()
			3:
				page_3.show()
			4:
				page_4.show()
				NarrationManager.set_variable("whole_case", true)
				NarrationManager.set_variable("margaret_1", true)
				if seen == true:
					NarrationManager.talk_to_them()
					seen = false
				if dial_seen == true and NarrationManager.get_variable("whole_news") and NarrationManager.get_variable("whole_case"):
					NarrationManager.talk_to_them()
					dial_seen = false
				
	rustle.play()
	
func _on_texture_button_3_pressed() -> void:
	print("back")
	if page > 1:
		page -= 1
		print(page)

		page_2.hide()
		page_3.hide()
		page_4.hide()

		match page:
			1:
				page_1.show()
			2:
				page_2.show()
			3:
				page_3.show()
			4:
				page_4.show()
				
		rustle.play()

func _on_texture_button_pressed() -> void:
	hide()
	close.play()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	#NarrationManager.start_dialogue("intro")

func files_opened() -> void:
	open.play()
