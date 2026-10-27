extends Node3D

@onready var waitress_timer = $WaitressTimer
@onready var waitress_sit = $Waitress_Rig_StoolSitting
@onready var waitress_wipe = $Waitress_Rig_WipingCounter

var all_names
var waitress_names: Array[String]

func _ready() -> void:
	waitress_timer.start()
	NarrationManager.dialogue_engaged.connect(waitress_stop)
	NarrationManager.dialogue_finished.connect(waitress_start)
	Watching.isSeen.connect(get_tree_names)

func waitress_swap(names) -> void:
	if waitress_sit.name in names or waitress_wipe.name in names:
		waitress_timer.paused = true
	else:
		waitress_timer.paused = false

func waitress_stop() -> void:
	waitress_timer.paused = true
	
func waitress_start() -> void:
	waitress_timer.paused = false

func get_tree_names(names) -> void:
	all_names = names
	var temp: Array[String]
	for tree_area in all_names:
		if tree_area.name not in temp:
			temp.append(tree_area.name)
	#print(temp)
	waitress_names = temp
	waitress_swap(waitress_names)

func _on_waitress_timer_timeout() -> void:
	if waitress_wipe.visible == true:
		waitress_wipe.visible = false
		waitress_sit.visible = true
	
	if waitress_sit.visible == true:
		waitress_sit.visible = false
		waitress_wipe.visible = true

		
