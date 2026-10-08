extends CharacterBody3D

class_name Player

@export var look_sensitivity: float = 0.001

@onready var Ray_cast: RayCast3D = $Head/Camera3D/RayCast3D

@onready var head = $Head
@onready var camera = $Head/Camera3D

var interact = true

func show_ui(location) -> void:
	var ui = location
	ui.show()

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	NarrationManager.dialogue_finished.connect(interaction)
	
func _process(_delta: float) -> void:
	pass
	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED and Modes.current_mode == Enums.GameplayMode.DINER:
		head.rotate_y(-event.relative.x * look_sensitivity)
		camera.rotate_x(-event.relative.y * look_sensitivity)
		camera.rotation.x = clampf(camera.rotation.x, deg_to_rad(-40), deg_to_rad(40))
		head.rotation.y = clampf(head.rotation.y, deg_to_rad(-80), deg_to_rad(80))
		
	if Input.is_action_just_pressed("escape"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	if event is InputEventMouseButton and event.pressed:
		var item = Ray_cast.get_collider()
		if item and (item.name == "Files" or item.name == "Newspaper" or item.name == "Notepad") and interact == true:
			if item.name == "Files":
				show_ui($"../Files UI")
				Input.mouse_mode = Input.MOUSE_MODE_CONFINED
				interact = false
			if item.name == "Newspaper":
				show_ui($"../NewsPaperUI")
				Input.mouse_mode = Input.MOUSE_MODE_CONFINED
				interact = false
			if item.name == "Notepad":
				show_ui($"../NotesUI")
				Input.mouse_mode = Input.MOUSE_MODE_CONFINED
				interact = false


func _on_vison_timer_timeout() -> void:
	var overlaps = $Head/VisonArea.get_overlapping_bodies()
	if overlaps.size() > 0:
		for overlap in overlaps:
			if overlap.name == "OutsideTree":
				Watching.i_see_you()
				print("I see " + overlap.name)
			else:
				Watching.i_can_change()


func _on_interaction_timer_timeout() -> void:
	interact = true

func interaction() -> void:
	$InteractionTimer.start()
	print("Here!")
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
