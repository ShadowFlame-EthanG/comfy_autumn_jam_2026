extends Control

@onready var open = $OpenNewspaper
@onready var close = $CloseNewspaper
@onready var rustle = $RustleRustling

@onready var page_1 = $Page1
@onready var page_2 = $Page2
@onready var page_3 = $Page3
@onready var page_4 = $page4
@onready var page_5 = $page5
@onready var page_6 = $page6

var page = 1

func _ready() -> void:
	MousePosition.open_newspaper.connect(opened)

func _on_button_pressed() -> void:
	hide()
	close.play()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	NarrationManager.set_variable("newspaper", true)

func _on_texture_button_3_pressed() -> void:
	print("forward")
	if page < 6:
		page += 1
		print(page)

		page_1.hide()
		page_2.hide()
		page_3.hide()
		page_4.hide()
		page_5.hide()
		page_6.hide()

		match page:
			2:
				page_2.show()
			3:
				page_3.show()
			4:
				page_4.show()
			5:
				page_5.show()
			6:
				page_6.show()
				
	rustle.play()
	
func _on_texture_button_2_pressed() -> void:
	print("back")
	if page > 1:
		page -= 1
		print(page)

		page_2.hide()
		page_3.hide()
		page_4.hide()
		page_5.hide()
		page_6.hide()

		match page:
			1:
				page_1.show()
			2:
				page_2.show()
			3:
				page_3.show()
			4:
				page_4.show()
			5:
				page_5.show()
				
		rustle.play()

func opened() -> void:
	open.play()
	NarrationManager.set_variable("halloween", true)
