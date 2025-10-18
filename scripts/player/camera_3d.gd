extends Camera3D

@onready var player = $"../.."
var original_pos : Transform3D
var is_transitioning : bool = false
var is_on_destiny : bool = false

# --- NUEVAS VARIABLES ---
@export var drunk_frequency : float = 2.5 # tiempo (segundos) entre cambios de orientación
@export var drunk_intensity : float = 1.0 # factor para ajustar la intensidad general
var _drunk_timer : float = 0.0
var _target_rotation : Vector3 = Vector3.ZERO
var _tween : Tween

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


# --- EFECTO BORRACHO ---
func _process(delta: float) -> void:
	# Si hay transición, no hacer efecto
	if is_transitioning:
		return

	_drunk_timer -= delta
	if _drunk_timer <= 0.0:
		_drunk_timer = drunk_frequency
		_apply_new_random_rotation()

func _apply_new_random_rotation():
	# Rotación aleatoria dentro de los límites
	_target_rotation = Vector3(
		deg_to_rad(randf_range(-X_LIMIT, X_LIMIT)) * drunk_intensity,
		deg_to_rad(randf_range(-Y_LIMIT, Y_LIMIT)) * drunk_intensity,
		deg_to_rad(randf_range(-Z_LIMIT, Z_LIMIT)) * drunk_intensity
	)

	# Elimina tweens anteriores si los hay
	if _tween and _tween.is_running():
		_tween.kill()

	_tween = get_tree().create_tween()
	_tween.set_trans(Tween.TRANS_SINE)
	_tween.set_ease(Tween.EASE_IN_OUT)
	
	# Interpola suavemente hacia la nueva rotación
	_tween.tween_property(self, "rotation", _target_rotation, drunk_frequency / 2.0)
	
	# Luego vuelve a rotación 0,0,0
	_tween.tween_property(self, "rotation", Vector3.ZERO, drunk_frequency / 2.0)
