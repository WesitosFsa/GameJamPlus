class_name LadderAnimator
extends Node

@onready var player : Player = get_tree().get_first_node_in_group("player")
@onready var blur: ColorRect = $"../VFX/Blur"
@onready var eyelids: Control = $"../VFX/Eyelids"

func _on_tween_callback():
	var tween2 : Tween = create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween2.tween_property(player, "rotation_degrees", Vector3(-90, player.rotation_degrees.y, player.rotation_degrees.z), 1)
	player.desactivate

	tween2.tween_callback(func(): player.position = Vector3(4.46, 1.862, -3.389); $Timer.start())

func ladder():
	$AnimationPlayer.play("ladder")
	var tween : Tween = create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_method(change_blur_offset, 0.0, 10, 2)
	tween.tween_callback(_on_tween_callback)
	

func change_blur_offset(offset):
	blur.material.set_shader_parameter("offset", offset)

func unllader():
	$AnimationPlayer.play("ladder", -1, -2, true)
	var tween : Tween = create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_method(change_blur_offset, 10.0, 0.0, 2)
	tween.tween_callback(player.activate)
	var tween2 : Tween = create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween2.tween_property(player, "rotation_degrees", Vector3(0, player.rotation_degrees.y, player.rotation_degrees.z), 1)


func _on_timer_timeout() -> void:
	unllader()
