extends Node

signal mode_changed(new_mode: Enums.GameplayMode)

var current_mode: Enums.GameplayMode = Enums.GameplayMode.DINER
var previous_mode: Enums.GameplayMode = Enums.GameplayMode.NARRATION

func change_mode(new_mode: Enums.GameplayMode) -> void:
	previous_mode = current_mode
	current_mode = new_mode
	mode_changed.emit(current_mode)
