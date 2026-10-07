extends Node3D

@export var mesh: MeshInstance3D
@export var outlineMaterial: Material
@export var selectionMaterial: Material

func show_ui(location) -> void:
	var ui = location
	ui.show()


#func _on_area_3d_mouse_entered() -> void:
	#mesh.material_overlay = outlineMaterial


#func _on_area_3d_mouse_exited() -> void:
	#mesh.material_overlay = null


func _on_area_3d_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and !event.is_echo():
			if name == "Files":
				show_ui($"../../../Files UI")
				Input.mouse_mode = Input.MOUSE_MODE_CONFINED
			if name == "Newspaper":
				show_ui($"../../../NewsPaperUI")
				Input.mouse_mode = Input.MOUSE_MODE_CONFINED

	
