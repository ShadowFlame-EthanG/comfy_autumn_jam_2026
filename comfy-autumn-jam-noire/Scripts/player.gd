extends CharacterBody3D

class_name Player

@export var look_sensitivity: float = 0.001

@onready var Ray_cast: RayCast3D = $Head/Camera3D/RayCast3D

@onready var head = $Head
@onready var camera = $Head/Camera3D

var prev_high = ""

func show_ui(location) -> void:
	var ui = location
	ui.show()

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	Modes.mode_changed.connect(interaction)
	add_to_group("player")
	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED and Modes.current_mode == Enums.GameplayMode.DINER:
		head.rotate_y(-event.relative.x * look_sensitivity)
		camera.rotate_x(-event.relative.y * look_sensitivity)
		camera.rotation.x = clampf(camera.rotation.x, deg_to_rad(-45), deg_to_rad(40))
		head.rotation.y = clampf(head.rotation.y, deg_to_rad(-60), deg_to_rad(48))
		
		var highlight = Ray_cast.get_collider()
		if highlight != null and NarrationManager.interact == true:
			MousePosition.highlighted.emit(highlight.name)
			prev_high = highlight.name
		else:
			MousePosition.gone.emit(prev_high)
		
	if Input.is_action_just_pressed("escape"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	
	if event is InputEventMouseButton and event.pressed:
		if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		var item = Ray_cast.get_collider()
		if item and item.name == "Sister":
			NarrationManager.start_dialogue("margaret_loop")
		
		if item and (item.name == "Files" or item.name == "Newspaper" or item.name == "Notepad" or item.name == "Coffee") and NarrationManager.interact == true and Modes.current_mode == Enums.GameplayMode.DINER:
			if item.name == "Files":
				show_ui($"../Items/Files UI")
				MousePosition.files_selected()
				Input.mouse_mode = Input.MOUSE_MODE_CONFINED
			if item.name == "Newspaper":
				show_ui($"../Items/NewsPaperUI")
				MousePosition.newspaper_selected()
				Input.mouse_mode = Input.MOUSE_MODE_CONFINED
			if item.name == "Notepad":
				show_ui($"../Items/NotesUI")
				MousePosition.notes_selected()
				Input.mouse_mode = Input.MOUSE_MODE_CONFINED
			if item.name == "Coffee":
				show_ui($"../Items/Coffee")
				Input.mouse_mode = Input.MOUSE_MODE_CONFINED

func _on_vison_timer_timeout() -> void:
	var overlaps = $Head/VisonArea.get_overlapping_bodies()
	if overlaps.size() > 0:
		print(overlaps)
		Watching.i_see_you(overlaps)


func _on_interaction_timer_timeout() -> void:
	if Modes.current_mode == Enums.GameplayMode.DINER:
		NarrationManager.interact = true
	else:
		$InteractionTimer.start()

func interaction(new_mode: Enums.GameplayMode) -> void:
	if new_mode == Enums.GameplayMode.DINER:
		$InteractionTimer.start()
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
