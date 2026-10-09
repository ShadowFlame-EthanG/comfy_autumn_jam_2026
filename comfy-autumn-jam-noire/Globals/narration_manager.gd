extends InkPlayer

signal dialogue_engaged()
signal dialogue_finished()
signal skipping()

var skipped: int = 0
var interact = true

var should_return_to_game: bool :
	get :
		return not(has_choices or can_continue)

func _ready() -> void:
	ink_file = load("res://Story/story.json")
	connect("loaded", _on_loaded)
	create_story()

func _on_loaded(_successfully: Variant) -> void:
	pass
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("more_dialogue") and not has_choices:
		skipping.emit()
		if skipped == 2:
			advance()
			skipped = 0

func start_dialogue(path: String) -> void:
	dialogue_engaged.emit()
	skipped = 0
	Modes.change_mode(Enums.GameplayMode.NARRATION)
	interact = false
	choose_path(path)
	advance()

func advance():
	if can_continue:
		continue_story()
	if should_return_to_game:
		if skipped == 2:
			dialogue_finished.emit()
			Modes.change_mode(Enums.GameplayMode.DINER)
			skipped = 0
