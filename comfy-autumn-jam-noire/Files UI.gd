extends Control

@onready var open = $OpenFiles
@onready var close = $CloseFiles

func _ready() -> void:
	MousePosition.open_files.connect(files_opened)

func _on_texture_button_pressed() -> void:
	hide()
	close.play()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	NarrationManager.start_dialogue("intro")

func files_opened() -> void:
	open.play()
