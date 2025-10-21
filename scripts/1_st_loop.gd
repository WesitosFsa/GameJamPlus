extends Node
@onready var ladder_animator : LadderAnimator = get_tree().get_first_node_in_group("ladder_animator")
@onready var player : Player = get_tree().get_first_node_in_group("player")

#FLAGS
var already_leaved_menu : bool = false

func _ready() -> void:
	player.desactivate()
	ladder_animator.animation_executed.connect(_on_ladder_animation_finished)

func _on_ladder_animation_finished():
	var second_loop : Node = load("res://scenes/2_nd_loop.tscn").instantiate()
	add_sibling(second_loop)
	$"../PerroSector".activate()
	GLOBAL.rooster_already_interacted = false
	queue_free()

func _input(event: InputEvent) -> void:
	if event.is_action_released("Enter"):
		$ColorRect/Key.visible = false
		$ColorRect/Intro.visible = true
		clear_music()
		$Campana.play()
		$StartTimer.start()
		
		

func clear_music():
	var tween : Tween = create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property($AudioStreamPlayer, "volume_db", -80, 1)


func _on_start_timer_timeout() -> void:
	$ColorRect.queue_free()
	player.activate()
