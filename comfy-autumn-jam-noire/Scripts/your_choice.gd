extends Control


func _ready() -> void:
	$Timer.start()
	NarrationManager.dialogue_finished.connect(change_to_screen)

func _on_timer_timeout() -> void:
	if NarrationManager.katie_dies == false:
		NarrationManager.start_dialogue("katie_lives")
	if NarrationManager.katie_dies:
		NarrationManager.start_dialogue("dopp_lives")
	
func change_to_screen() -> void:
	if NarrationManager.katie_dies == false:
		NavigationManager.case_solved()
	if NarrationManager.katie_dies == true:
		NavigationManager.case_failed()
