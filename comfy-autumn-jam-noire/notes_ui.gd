extends Control

@onready var open = $OpenNotes
@onready var close = $CloseNotes

func _ready() -> void:
	MousePosition.open_notes.connect(notes_opened)

func _on_texture_button_pressed() -> void:
	hide()
	close.play()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func notes_opened() -> void:
	open.play()
