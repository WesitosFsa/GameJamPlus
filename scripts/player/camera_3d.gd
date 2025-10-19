extends Camera3D

@onready var player = $"../.."
var original_pos : Transform3D
var is_transitioning : bool = false
var is_on_destiny : bool = false

# Límites de rotación (en grados)
const X_LIMIT = 35.0
const Y_LIMIT = 20.0
const Z_LIMIT = 40.0

# --- FUNCIONES EXISTENTES ---
func transition(reference : Transform3D, duration : float = 2,  precallable : Callable = func():pass, poscallable : Callable = func():pass):
	if is_transitioning : return
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	player.desactivate()
	
	precallable.call()
	
	var tween : Tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	is_transitioning = true
	original_pos = self.global_transform
	
	tween.tween_property(self, "global_transform", reference, duration)
	tween.tween_callback(func(): 
		is_transitioning = false
		is_on_destiny = !is_on_destiny
		poscallable.call()
		)

func return_to_original_pos(duration : float = 2):
	if original_pos == null:
		printerr("Cannot return to original pos if didn't make any transition")
		return
		
	transition(original_pos, duration, func():pass, func(): player.activate(); set_shake(true))

func set_shake(value : bool):
	if value:
		$ShakerComponent3D2.play_shake()
	else:
		$ShakerComponent3D2.AutoPlay = false
		$ShakerComponent3D2.stop_shake()
