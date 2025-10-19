extends fully_interactable

func mouse_interaction():
	if Input.is_action_just_pressed("E"):
		$AudioStreamPlayer3D.play()

func on_mouse_exited():
	pass
