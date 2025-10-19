extends Node
@onready var ladder_animator : LadderAnimator = get_tree().get_first_node_in_group("ladder_animator")

func _ready() -> void:
	ladder_animator.animation_executed.connect(_on_ladder_animation_finished)

func _on_ladder_animation_finished():
	var third_loop : Node = load("res://scenes/3_rd_loop.tscn").instantiate()
	add_sibling(third_loop)
	queue_free()
	
