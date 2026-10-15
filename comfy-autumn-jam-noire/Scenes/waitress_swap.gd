extends Node3D

@onready var waitress_timer = $WaitressTimer
@onready var waitress_pour = $Waitress_Rig_WipingCounter
@onready var waitress_sit = $Waitress_Rig_StoolSitting
@onready var waitress_wipe = $Waitress_Rig_PouringCoffee

func _ready() -> void:
	waitress_timer.start()
	Watching.isSeen.connect(waitress_seen)

func waitress_seen(names) -> void:
	pass

func _on_waitress_timer_timeout() -> void:
	if waitress_wipe.visible == true:
		waitress_wipe.visible = false
		var choose = randi_range(0, 1)
		if choose == 1:
			waitress_pour.visible = true
		else:
			waitress_sit.visible = true
	if waitress_sit.visible == true:
		waitress_sit.visible = false
		var choose = randi_range(0, 1)
		if choose == 1:
			waitress_wipe.visible = true
		else:
			waitress_pour.visible = true
	if waitress_pour.visible == true:
		waitress_pour.visible = false
		var choose = randi_range(0, 1)
		if choose == 1:
			waitress_sit.visible = true
		else:
			waitress_wipe.visible = true
