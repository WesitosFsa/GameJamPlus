extends Node3D
@onready var camera : Camera3D = get_tree().get_first_node_in_group("camera")
@onready var player : Player = get_tree().get_first_node_in_group("player")


@export var look_duration : float = 2.0     # tiempo para girar hacia el objetivo
@export var return_duration : float = 2.0   # tiempo para regresar a la rotación original
@export var wait_time : float = 1.5         # tiempo que mantiene la mirada

@onready var rooster: Vector3 = $Cuerpo.global_transform.origin

var _original_transform

func look_at_gallo():
	$RoosterPlayerDetector.queue_free()
	player.desactivate()
	_original_transform = camera.global_transform
	var final_transform = camera.global_transform.looking_at(rooster, Vector3.UP)
	var tween : Tween = create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(camera, "global_transform", final_transform, 1.0)

func _return_to_original():
	var tween : Tween = create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(camera, "global_transform", _original_transform, 1.0)
	tween.tween_callback(func(): player.activate())

func _on_rooster_player_detector_body_entered(body: Node3D) -> void:
	if body is Player:
		look_at_gallo()
