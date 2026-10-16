extends Node3D

@export var mesh: MeshInstance3D
@export var outlineMaterial: Material
@export var area: Area3D


func _ready() -> void:
	MousePosition.highlighted.connect(highlight)
	MousePosition.gone.connect(not_highlighted)
	TransitionScreen.on_transition_finished.connect(see_katie_dopp)

func highlight(h_name: String) -> void:
	if h_name == name:
		mesh.material_overlay = outlineMaterial

func not_highlighted(h_name: String) -> void:
	if h_name == name:
		mesh.material_overlay = null

func see_katie_dopp() -> void:
	if area:
		if area.name == "Katie" or area.name == "Dopp" and NarrationManager.final_scene == true:
			area.collision_layer = 2
		if area.name == "Sister" and NarrationManager.final_scene == true:
			print("Sister change!")
			area.collision_layer = 1
