extends Node3D

@export var mesh: MeshInstance3D
@export var outlineMaterial: Material

func _ready() -> void:
	MousePosition.highlighted.connect(highlight)
	MousePosition.gone.connect(not_highlighted)

func highlight(h_name: String) -> void:
	if h_name == name:
		mesh.material_overlay = outlineMaterial

func not_highlighted(h_name: String) -> void:
	if h_name == name:
		mesh.material_overlay = null
