extends Node

const diner_scene = preload("res://Scenes/diner.tscn")
const game_over = preload("res://Scenes/game_over_screen.tscn")

func go_to_diner() -> void:
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_packed(diner_scene)
	
func case_failed() -> void:
	TransitionScreen.transition()
	await  TransitionScreen.on_transition_finished
	get_tree().change_scene_to_packed(game_over)
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
