extends Control

@onready var open = $OpenNotes
@onready var close = $CloseNotes
@onready var rustle = $RustleRustling

@onready var page_2 = $TextureRect2
@onready var page_3 = $TextureRect3
@onready var page_4 = $TextureRect4
@onready var page_5 = $TextureRect5

@onready var text_1 = $TextureRect/TextEdit

var page = 1

func _ready() -> void:
	MousePosition.open_notes.connect(notes_opened)
	NarrationManager.choice_made.connect(note_taken)

func note_taken(choice) -> void:
	if choice == "I'll take the case.":
		text_1.text = "Sister's Necklace"
	if choice == "I'll help, but I don't work for free.":
		text_1.text = "Family is Rich"

func _on_texture_button_pressed() -> void:
	hide()
	close.play()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _on_texture_button_2_pressed() -> void:
	if page < 5:
		page += 1

		page_2.hide()
		page_3.hide()
		page_4.hide()
		page_5.hide()

		match page:
			2:
				page_2.show()
			3:
				page_3.show()
			4:
				page_4.show()
			5:
				page_5.show()
				
	rustle.play()
	
func _on_texture_button_3_pressed() -> void:
	if page > 1:
		page -= 1

		page_2.hide()
		page_3.hide()
		page_4.hide()
		page_5.hide()

		match page:
			1:
				pass
			2:
				page_2.show()
			3:
				page_3.show()
			4:
				page_4.show()
			5:
				page_5.show()

		rustle.play()

func notes_opened() -> void:
	open.play()
