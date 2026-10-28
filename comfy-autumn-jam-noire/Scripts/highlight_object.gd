extends Node3D

@export var mesh: MeshInstance3D
@export var outlineMaterial: Material
@export var area: Area3D
@export var hideMaterial: Material
@export var gunMaterial: Material
@export var newDialogueMaterial: Material
@export var coffee_half: MeshInstance3D
@export var coffee_empty: MeshInstance3D


func _ready() -> void:
	MousePosition.highlighted.connect(highlight)
	MousePosition.gone.connect(not_highlighted)
	TransitionScreen.on_transition_finished.connect(see_katie_dopp)
	MousePosition.gun_choice.connect(show_hide_gun)
	NarrationManager.intro.connect(can_interact)
	MousePosition.coffee_empty.connect(empty_cup)
	MousePosition.drink_coffee.connect(half_cup)
	MousePosition.fill_coffee.connect(coffee_back)
	
func highlight(h_name: String) -> void:
	if h_name == name:
		if h_name == "Sister" and (NarrationManager.get_variable("margaret_1") or NarrationManager.get_variable("margaret_2")):
			if newDialogueMaterial:
				print("Hello sister!")
				mesh.material_overlay = null
				mesh.material_overlay = newDialogueMaterial
		if h_name == "WaitressWipe" or h_name == "WaitressSit":
			print("Hello waitress!")
		if NarrationManager.new_talking == true:
			mesh.material_overlay = newDialogueMaterial
		else:
			mesh.material_overlay = outlineMaterial
			if mesh.name == "New_Cup_v2_001":
				if coffee_half.visible:
					coffee_half.material_overlay = outlineMaterial
				if coffee_empty.visible:
					coffee_empty.material_overlay = outlineMaterial

func empty_cup() -> void:
	if mesh.name == "New_Cup_v2_001":
		mesh.visible = false
		coffee_half.visible = false
		coffee_empty.visible = true
	
func half_cup() -> void:
	if mesh.name == "New_Cup_v2_001":
		mesh.visible = false
		coffee_half.visible = true

func coffee_back() -> void:
	if mesh.name == "New_Cup_v2_001":
		coffee_empty.visible = false
		mesh.visible = true
		

func not_highlighted(h_name: String) -> void:
	if h_name == name:
		mesh.material_overlay = null
	if mesh.name == "New_Cup_v2_001":
		if coffee_half.visible:
			coffee_half.material_overlay = null
		if coffee_empty.visible:
			coffee_empty.material_overlay = null

func can_interact() -> void:
	if area:
		if area.name == "Sister" and NarrationManager.final_scene == false:
			area.collision_layer = 2
		if area.name == "WaitressSit" or area.name == "WaitressWipe" and NarrationManager.final_scene == false:
			area.collision_layer = 2
func see_katie_dopp() -> void:
	if area:
		if area.name == "Katie" or area.name == "Dopp" and NarrationManager.final_scene == true:
			area.collision_layer = 2
		if area.name == "Sister" and NarrationManager.final_scene == true:
			print("Sister change!")
			area.collision_layer = 1
		if area.name == "WaitressSit" or area.name == "WaitressWipe" and NarrationManager.final_scene == true:
			area.collision_layer = 1
		if area.name == "Newspaper" or area.name == "Files" or area.name == "Coffee" and NarrationManager.final_scene == true:
			area.collision_layer = 1
		if area.name == "Gun" and NarrationManager.final_scene == true:
			mesh.visible = true
			area.collision_layer = 2


func show_hide_gun() -> void:
	if mesh.name == "New_Gun_v1_001":
		if mesh.material_override == gunMaterial:
			mesh.material_override = hideMaterial
		else:
			mesh.material_override = gunMaterial
