extends Node

const main_menu = preload("res://Scenes/main_menu.tscn")
const diner_scene = preload("res://Scenes/diner.tscn")
const game_over = preload("res://Scenes/game_over_screen.tscn")
const game_win = preload("res://Scenes/win_screen.tscn")
const choice_scene = preload("res://Scenes/your_choice.tscn")

func go_to_menu() -> void:
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_packed(main_menu)

func go_to_diner() -> void:
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_packed(diner_scene)
	
func go_to_choice() -> void:
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_packed(choice_scene)
	
func case_failed() -> void:
	TransitionScreen.transition()
	await  TransitionScreen.on_transition_finished
	get_tree().change_scene_to_packed(game_over)
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func case_solved() -> void:
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_packed(game_win)
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
