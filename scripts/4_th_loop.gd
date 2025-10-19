extends Node
@onready var ladder_animator : LadderAnimator = get_tree().get_first_node_in_group("ladder_animator")

func _ready() -> void:
	ladder_animator.animation_executed.connect(_on_ladder_animation_finished)

func _on_ladder_animation_finished():
	var fifth_loop : Node = load("res://scenes/5_th_loop.tscn").instantiate()
	add_sibling(fifth_loop)
	queue_free()
	
