extends InkPlayer

signal dialogue_engaged()
signal dialogue_finished()
signal skipping()
signal picture_change(name: String)

var skipped: int = 0
var interact = true
var first = 0
var final_scene = false

var should_return_to_game: bool :
	get :
		return not(has_choices or can_continue)

func _ready() -> void:
	ink_file = load("res://Story/story.json")
	connect("loaded", _on_loaded)
	create_story()
	connect("choice_made", end_it)

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
	change_picture()
	advance()

func change_picture() -> void:
	if NarrationManager.get_current_path() == "margaret_loop.0":
		print("Margaret!")
		picture_change.emit("Margaret")
	if NarrationManager.get_current_path() == "waitress_loop.0":
		print("Waitress!")
		picture_change.emit("Waitress")

func advance():
	if can_continue:
		continue_story()
	if should_return_to_game:
		if skipped == 2:
			dialogue_finished.emit()
			Modes.change_mode(Enums.GameplayMode.DINER)
			skipped = 0

func end_it(choice) -> void:
	if choice == "Okay, I’ll do what I can." or choice == "Actually, one moment." or choice == "Actually, I'm good.":
		dialogue_finished.emit()
		Modes.change_mode(Enums.GameplayMode.DINER)
		skipped = 0
	if choice == "Yes, I know what happened to your sister.":
		dialogue_finished.emit()
		Modes.change_mode(Enums.GameplayMode.DINER)
		skipped = 0
		final_scene = true
		TransitionScreen.transition()
		
