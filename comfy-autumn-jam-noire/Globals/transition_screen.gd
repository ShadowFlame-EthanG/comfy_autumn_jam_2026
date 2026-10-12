extends CanvasLayer

signal on_transition_finished

@onready var fade = $ColorRect
@onready var animation_player = $AnimationPlayer

func _ready() -> void:
	fade.visible = false
	animation_player.animation_finished.connect(_on_animation_finished)
	
func transition() -> void:
	fade.visible = true
	animation_player.play("fade_to_black")

func _on_animation_finished(anim_name) -> void:
	if anim_name == "fade_to_black":
		on_transition_finished.emit()
		animation_player.play("fade_to_normal")
	elif anim_name == "fade_to_normal":
		fade.visible = false
