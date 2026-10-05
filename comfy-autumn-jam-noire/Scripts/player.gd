extends CharacterBody3D

@export var look_sensitivity: float = 0.0005

@onready var head = $Head
@onready var camera = $Head/Camera3D

@onready var Ray_cast: RayCast3D = $Head/Camera3D/RayCast3D

@onready var newspaper_overlay: CanvasLayer = $"../NewspaperUI"

@onready var newspaper: StaticBody3D = $"../props/Newspaper"

var current_item = ""
var held_item = ""

func _process(delta):
	
	if Ray_cast.is_colliding():
		var rawitem = Ray_cast.get_collider()
		current_item = rawitem.name
		print(rawitem)
	else:
		current_item = ""
		
	if held_item == "newspaper":
		newspaper.visible = false
		newspaper_overlay.visible = true
	else:
		newspaper.visible = true
		newspaper_overlay.visible = false
		
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		head.rotate_y(-event.relative.x * look_sensitivity)
		camera.rotate_x(-event.relative.y * look_sensitivity)
		camera.rotation.x = clampf(camera.rotation.x, deg_to_rad(-40), deg_to_rad(40))
		head.rotation.y = clampf(head.rotation.y, deg_to_rad(-80), deg_to_rad(80))
		
	if Input.is_action_just_pressed("escape"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	if event is InputEventMouseButton and event.pressed:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		
	if event.is_action_pressed("interact"):
		if held_item != "":
			held_item = ""
		elif held_item == "":
			held_item = current_item
			print (held_item)
