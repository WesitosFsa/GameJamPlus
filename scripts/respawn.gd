extends Node3D

@export var interact_key := "E"
@export var interaction_distance := 2.5

var player: Node3D = null

func _ready():
	player = get_tree().get_first_node_in_group("player")

func _process(_delta: float):
	if not player:
		return
		
	var distance = global_position.distance_to(player.global_position)
	
	if distance <= interaction_distance:
		if Input.is_action_just_pressed(interact_key):
			player.respawn()
