extends Area3D
@onready var player : Player = get_tree().get_first_node_in_group("player")

func _on_body_entered(body: Node3D) -> void:
	if body is Player:
		player.desactivate()
		$AudioStreamPlayer3D.play()
		$AudioStreamPlayer3D.finished.connect(func(): $BG/CenterContainer/VBoxContainer.visible = true)
		$BG.visible = true
		
