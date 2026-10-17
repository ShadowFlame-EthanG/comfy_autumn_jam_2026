extends Node3D

@export var mesh: MeshInstance3D
@export var outlineMaterial: Material
@export var area: Area3D
@export var hideMaterial: Material
@export var gunMaterial: Material
@export var newDialogueMaterial: Material


func _ready() -> void:
	MousePosition.highlighted.connect(highlight)
	MousePosition.gone.connect(not_highlighted)
	TransitionScreen.on_transition_finished.connect(see_katie_dopp)
	MousePosition.gun_choice.connect(show_hide_gun)
	NarrationManager.intro.connect(can_interact)
	
func highlight(h_name: String) -> void:
	if h_name == name:
		if h_name == "Sister":
			print("Hello sister!")
		if h_name == "WaitressWipe" or h_name == "WaitressSit":
			print("Hello waitress!")
		if NarrationManager.new_talking == true:
			mesh.material_overlay = newDialogueMaterial
		else:
			mesh.material_overlay = outlineMaterial

func not_highlighted(h_name: String) -> void:
	if h_name == name:
		mesh.material_overlay = null

func can_interact() -> void:
	if area:
		if area.name == "Sister" and NarrationManager.final_scene == false:
			print("Here!")
			area.collision_layer = 2

func see_katie_dopp() -> void:
	if area:
		if area.name == "Katie" or area.name == "Dopp" and NarrationManager.final_scene == true:
			area.collision_layer = 2
		if area.name == "Sister" and NarrationManager.final_scene == true:
			print("Sister change!")
			area.collision_layer = 1
		if area.name == "Newspaper" or area.name == "Files" or area.name == "Coffee":
			area.collision_layer = 1
		if area.name == "Gun":
			mesh.visible = true
			area.collision_layer = 2


func show_hide_gun() -> void:
	if mesh.name == "Gun_v1_001":
		if mesh.material_override == gunMaterial:
			mesh.material_override = hideMaterial
		else:
			mesh.material_override = gunMaterial
