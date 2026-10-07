extends Node3D

@export var model: MeshInstance3D

@onready var timer = $Timer

var tree1 = preload("res://Materials/Tree1_test.tres")
var tree2 = preload("res://Materials/Tree2_test.tres")

func _ready() -> void:
	Watching.isSeen.connect(i_am_seen)
	Watching.changeTime.connect(i_will_change)

func _on_timer_timeout() -> void:
	print("I changed!")
	if model.mesh != tree2:
		model.mesh = tree2
	else:
		model.mesh = tree1

func i_am_seen():
	timer.paused = true

func i_will_change():
	timer.paused = false
