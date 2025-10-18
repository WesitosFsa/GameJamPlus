extends StaticBody3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	pass

func mouse_interaction():
	if Input.is_action_just_pressed("E"):
		queue_free()
