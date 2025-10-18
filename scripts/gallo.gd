extends StaticBody3D
@onready var audio_borracho: AudioStreamPlayer3D = $"Audio Borracho"
@onready var player = get_tree().get_first_node_in_group("player")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	pass

func mouse_interaction():
	if Input.is_action_just_pressed("E"):
		player.get_node("Voz").play()
