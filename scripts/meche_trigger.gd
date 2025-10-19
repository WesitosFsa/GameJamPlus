extends Area3D
@export var asesino_animator : AnimationPlayer

func _on_body_entered(body: Node3D) -> void:
	if body is Player:
		#asesino_animator.play("anim")
		print("asesinato")
		queue_free()
