extends Node

@onready var rooster_animation_player : AnimationPlayer = $"../GalloMetalico/animacion_gallo/AnimationPlayer"
@onready var cuerpo: rooster_body = $"../GalloMetalico/Cuerpo"
@onready var player : Player = get_tree().get_first_node_in_group("player")
@onready var ladder_starter: Area3D = $"../LadderStarter"
@onready var ladder_animator : LadderAnimator = get_tree().get_first_node_in_group("ladder_animator")

func _ready() -> void:
	ladder_starter.desactivate()
	cuerpo.interact.connect(_on_rooster_interact)
	ladder_animator.animation_executed.connect(_on_ladder_animation_finished)
	

func _on_rooster_interact():
	var player_voice : AudioStreamPlayer3D = player.get_node("Voz")
	player_voice.stream = load("res://assets/audio/voice/pre-scare.mp3")
	
	player_voice.play()
	
	rooster_animation_player.play("ArmatureAction")
	ladder_starter.activate()

func _on_ladder_animation_finished():
	var forth_loop : Node = load("res://scenes/4_th_loop.tscn").instantiate()
	add_sibling(forth_loop)
	GLOBAL.rooster_already_interacted = true
	queue_free()
