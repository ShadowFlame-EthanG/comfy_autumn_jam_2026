extends Node3D

@export var mesh: MeshInstance3D
@export var outlineMaterial: Material
@export var selectionMaterial: Material

var selected = false

func show_ui() -> void:
	var ui = $"../../../Files UI"
	ui.show()

func _on_static_body_3d_mouse_entered() -> void:
	if not selected:
		mesh.material_overlay = outlineMaterial


func _on_static_body_3d_mouse_exited() -> void:
	if not selected:
		mesh.material_overlay = null


func _on_static_body_3d_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and !event.is_echo():
			selected = not selected
			if selected:
				if name == "Files":
					show_ui()
				selected = false
