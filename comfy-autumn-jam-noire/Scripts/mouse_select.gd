extends Camera3D

signal interactable

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and !event.is_echo():
			shoot_ray()
		
func _physics_process(delta: float) -> void:
	shoot_ray()
	
func shoot_ray():
	var mouse_pos = get_viewport().get_mouse_position()
	var ray_length = 1000
	var from = project_ray_origin(mouse_pos)
	var to = from + project_ray_normal(mouse_pos) * ray_length
	var space = get_world_3d().direct_space_state
	var ray_query = PhysicsRayQueryParameters3D.new()
	ray_query.from = from
	ray_query.to = to
	var raycast_result = space.intersect_ray(ray_query)
	if !raycast_result.is_empty():
		print(raycast_result["collider"])
