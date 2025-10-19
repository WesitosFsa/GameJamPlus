extends Node
@onready var ladder_animator : LadderAnimator = get_tree().get_first_node_in_group("ladder_animator")

func _ready() -> void:
	ladder_animator.animation_executed.connect(_on_ladder_animation_finished)

func _on_ladder_animation_finished():
	var second_loop : Node = load("res://scenes/2_nd_loop.tscn").instantiate()
	add_sibling(second_loop)
	$"../PerroSector".activate()
	GLOBAL.rooster_already_interacted = false
	queue_free()
	
