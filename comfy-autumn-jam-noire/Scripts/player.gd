extends CharacterBody3D

@export var look_sensitivity: float = 0.001

@onready var head = $Head
@onready var camera = $Head/Camera3D

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CONFINED:
		head.rotate_y(-event.relative.x * look_sensitivity)
		camera.rotate_x(-event.relative.y * look_sensitivity)
		camera.rotation.x = clampf(camera.rotation.x, deg_to_rad(-40), deg_to_rad(40))
		head.rotation.y = clampf(head.rotation.y, deg_to_rad(-80), deg_to_rad(80))
		
	if Input.is_action_just_pressed("escape"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	if event is InputEventMouseButton and event.pressed:
		Input.mouse_mode = Input.MOUSE_MODE_CONFINED
