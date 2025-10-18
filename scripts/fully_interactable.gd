@abstract
class_name fully_interactable
extends StaticBody3D

@onready var control_hint : ControlHint = get_tree().get_first_node_in_group("control_hint")

@abstract
func mouse_interaction()

@abstract
func on_mouse_exited()
