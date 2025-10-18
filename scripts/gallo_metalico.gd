extends Node3D
@onready var camera : Camera3D = get_tree().get_first_node_in_group("camera")
@onready var player : Player = get_tree().get_first_node_in_group("player")


@export var look_duration : float = 2.0     # tiempo para girar hacia el objetivo
@export var return_duration : float = 2.0   # tiempo para regresar a la rotación original
@export var wait_time : float = 1.5         # tiempo que mantiene la mirada

var _original_basis : Basis
var _is_looking : bool = false

func look_at_gallo():
	camera.transform.basis = -rooster.transform

func _return_to_original():
	pass

func _on_rooster_player_detector_body_entered(body: Node3D) -> void:
	pass
