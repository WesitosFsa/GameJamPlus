extends StaticBody3D
@onready var audio_stream_player_3d: AudioStreamPlayer3D = $AudioStreamPlayer3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	pass

func mouse_interaction():
	if Input.is_action_just_pressed("E"):
		$AudioStreamPlayer3D.play()


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		audio_stream_player_3d.play()
		
