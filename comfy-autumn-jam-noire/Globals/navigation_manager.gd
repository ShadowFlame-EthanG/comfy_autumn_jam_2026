extends Node

const diner_scene = preload("res://Scenes/diner.tscn")

func go_to_diner() -> void:
	get_tree().change_scene_to_packed(diner_scene)
