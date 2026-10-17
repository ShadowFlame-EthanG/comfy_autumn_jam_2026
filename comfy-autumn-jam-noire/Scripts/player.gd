extends CharacterBody3D

class_name Player

@export var look_sensitivity: float = 0.001

@onready var Ray_cast: RayCast3D = $Head/Camera3D/RayCast3D

@onready var head = $Head
@onready var camera = $Head/Camera3D
@onready var gun = $Head/New_Gun_v1_001
@onready var gunshot = $GunShot

var prev_high = ""
var gun_active = false

func show_ui(location) -> void:
	var ui = location
	ui.show()

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	Modes.mode_changed.connect(interaction)
	add_to_group("player")
	
# Testing for locking camera in final scene
#func _process(_delta: float) -> void:
#	if Modes.current_mode == Enums.GameplayMode.NARRATION:
#		camera.rotation.x = deg_to_rad(-15.0)
#		head.rotation.y = deg_to_rad(-4.0)
func show_gun() -> void:
	if gun.visible == false:
		gun.visible = true
		MousePosition.make_choice()
	else:
		gun.visible = false
		MousePosition.make_choice()

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
		if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE and Modes.current_mode == Enums.GameplayMode.DINER:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		var item = Ray_cast.get_collider()
		if item and item.name == "Sister" and NarrationManager.final_scene == false:
			NarrationManager.start_dialogue("margaret_loop")
		if item and (item.name == "WaitressSit" or item.name == "WaitressWipe"):
			NarrationManager.start_dialogue("waitress_loop")
		if item and item.name == "Katie" and NarrationManager.final_scene == true and NarrationManager.interact == true:
			if !gun_active:
				NarrationManager.start_dialogue("katietalk")
			else:
				gunshot.play()
				NarrationManager.katie_dies = true
				NavigationManager.go_to_choice()
		if item and item.name == "Dopp" and NarrationManager.final_scene == true and NarrationManager.interact == true:
			if !gun_active:
				NarrationManager.start_dialogue("dopptalk")
			else:
				gunshot.play()
				NavigationManager.go_to_choice()
		if item and item.name == "Gun"and NarrationManager.final_scene == true and NarrationManager.interact == true:
			show_gun()
			if gun_active:
				gun_active = false
			else:
				gun_active = true
		
		if item and (item.name == "Files" or item.name == "Newspaper" or item.name == "Notepad" or item.name == "Coffee") and NarrationManager.interact == true and Modes.current_mode == Enums.GameplayMode.DINER:
			if NarrationManager.final_scene != true:
				if item.name == "Files":
					show_ui($"../Items/Files UI")
					MousePosition.files_selected()
					Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
				if item.name == "Newspaper":
					show_ui($"../Items/NewsPaperUI")
					MousePosition.newspaper_selected()
					Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
				if item.name == "Coffee":
					show_ui($"../Items/Coffee")
					Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			if item.name == "Notepad":
				show_ui($"../Items/NotesUI")
				MousePosition.notes_selected()
				Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			

func _on_vison_timer_timeout() -> void:
	var overlaps = $Head/VisonArea.get_overlapping_bodies()
	if overlaps.size() > 0:
		#print(overlaps)
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
