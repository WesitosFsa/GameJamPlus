extends fully_interactable

@onready var ladder_animator : LadderAnimator = get_tree().get_first_node_in_group("ladder_animator")

#FLAGS
var already_looked = false

func mouse_interaction():
	if not already_looked:
		$AudioStreamPlayer3D.play()
		already_looked = true
	
	if Input.is_action_just_pressed("E"):
		ladder_animator.ladder()

func on_mouse_exited():
	already_looked = false
