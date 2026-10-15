extends Node3D

@export var trees: Array[MeshInstance3D]
@export var square_lamps: Array[MeshInstance3D]
@export var circle_lamps: Array[MeshInstance3D]

@onready var tree_timer = $Timers/TreeTimer
@onready var lamp_timer = $Timers/LampTimer
@onready var cash = $Cash_v1_001
@onready var necklace = $"Clumped Necklace_v1_001"

var tree_change: int
var tree_areas
var tree_names: Array[String]

func _ready() -> void:
	tree_timer.start()
	lamp_timer.start()
	Watching.isSeen.connect(get_tree_names)
	NarrationManager.choice_made.connect(cash_or_neck)

func _on_tree_timer_timeout() -> void:
	var mesh_hide = trees.pick_random()
	var mesh_show = trees.pick_random()
	if mesh_hide.name in tree_names:
		print("I see " + mesh_hide.name)
	if mesh_show.name in tree_names:
		print("I see " + mesh_show.name)
	if mesh_hide.name not in tree_names:
		if mesh_hide.visible == true:
			#print("hid " + mesh_hide.name)
			mesh_hide.visible = false
	if mesh_show.name not in tree_names:
		if mesh_show.visible == false:
			#print("showed " + mesh_hide.name)
			mesh_show.visible = true

func get_tree_names(names) -> void:
	tree_areas = names
	var temp: Array[String]
	for tree_area in tree_areas:
		if tree_area.name not in temp:
			temp.append(tree_area.name)
	#print(temp)
	tree_names = temp

func _on_lamp_timer_timeout() -> void:
	var lamp_mesh = randi_range(0, 8)
	print(lamp_mesh)
	if square_lamps[lamp_mesh].name in tree_names:
		print("I see " + square_lamps[lamp_mesh].name)
	if square_lamps[lamp_mesh].name not in tree_names:
		if square_lamps[lamp_mesh].visible == true:
			print("changed to " + circle_lamps[lamp_mesh].name)
			square_lamps[lamp_mesh].visible = false
			circle_lamps[lamp_mesh].visible = true
		else:
			print("changed to " + square_lamps[lamp_mesh].name)
			square_lamps[lamp_mesh].visible = true
			circle_lamps[lamp_mesh].visible = false

func cash_or_neck(choice) -> void:
	if choice == "I'll take the case.":
		necklace.visible = true
	if choice == "I'll help, but I don't work for free.":
		cash.visible = true
