extends fully_interactable
@onready var audio_borracho: AudioStreamPlayer3D = $"Audio Borracho"
@onready var player = get_tree().get_first_node_in_group("player")

var already_looked : bool = false

func mouse_interaction():
	if not GLOBAL.rooster_already_interacted and not already_looked:
		control_hint.add_hint("E", "Putear al gallo")
		already_looked = true
	if Input.is_action_just_pressed("E"):
		control_hint.remove_hint()
		GLOBAL.rooster_already_interacted = true
		player.get_node("Voz").play()
	
	

func on_mouse_exited():
	control_hint.remove_hint()
	already_looked = false
