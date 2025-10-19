extends Area3D


func _on_body_entered(body: Node3D) -> void:
	if body is Player and GLOBAL.can_start_ladder:
		body.get_node("LadderAnimator").ladder()
