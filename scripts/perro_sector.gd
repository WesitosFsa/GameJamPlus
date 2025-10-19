extends Node3D
@onready var ladrido: AudioStreamPlayer3D = $Ladrido
@export var gallo : Node3D

func _ready() -> void:
	gallo.interact.connect(_on_gallo_interact)

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is Player:
		ladrido.play()


func _on_area_3d_body_exited(body: Node3D) -> void:
	if body is Player:
		ladrido.stop()

func _on_gallo_interact():
	$Pared.collision_mask = 0b10
	
	
