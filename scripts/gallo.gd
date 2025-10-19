class_name rooster_body
extends fully_interactable
@onready var audio_borracho: AudioStreamPlayer3D = $"Audio Borracho"
@onready var player = get_tree().get_first_node_in_group("player")

var first_loop : bool = true

var already_looked : bool = false

signal interact

func mouse_interaction():
	if not GLOBAL.rooster_already_interacted and not already_looked:
		control_hint.add_hint("E", "Putear al gallo")
		already_looked = true
	if Input.is_action_just_pressed("E"):
		control_hint.remove_hint()
		player.get_node("Voz").play()
		if first_loop:
			player.get_node("Voz").finished.connect(_on_player_voz_finished)
		interact.emit()
		GLOBAL.rooster_already_interacted = true

func _on_player_voz_finished():
	print("Entroo")
	$".."._return_to_original()
	first_loop = false
	player.get_node("Voz").disconnect("finished", _on_player_voz_finished)

func on_mouse_exited():
	control_hint.remove_hint()
	already_looked = false
