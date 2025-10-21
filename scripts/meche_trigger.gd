extends Area3D
@export var asesino_animator : AnimationPlayer

@onready var animation_player: AnimationPlayer = $"../../mapa_blueprint_FINAL/Polleria_asesinaFINAL/AnimationPlayer"
@onready var animation_player_2: AnimationPlayer = $"../../mapa_blueprint_FINAL/Polleria_asesinaFINAL/AnimationPlayer2"
@onready var animation_player_3: AnimationPlayer = $"../../mapa_blueprint_FINAL/Polleria_asesinaFINAL/AnimationPlayer3"
@onready var animation_player_4: AnimationPlayer = $"../../mapa_blueprint_FINAL/Polleria_asesinaFINAL/AnimationPlayer4"

@onready var animation_players = [
	animation_player,
	animation_player_2,
	animation_player_3,
	animation_player_4
]

func _on_body_entered(body: Node3D) -> void:
	if body is Player:
		animation_player.play("Cabeza de polloAction")
		animation_player_2.play("cortaCabeza")
		animation_player_3.play("Puerta_L_001")
		animation_player_4.play("Puerta_R_001")
		queue_free()
