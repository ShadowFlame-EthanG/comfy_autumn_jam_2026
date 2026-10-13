extends Control

@onready var open = $OpenNewspaper
@onready var close = $CloseNewspaper

func _ready() -> void:
	MousePosition.open_newspaper.connect(opened)

func _on_button_pressed() -> void:
	hide()
	close.play()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	NarrationManager.set_variable("newspaper", true)

func opened() -> void:
	open.play()
