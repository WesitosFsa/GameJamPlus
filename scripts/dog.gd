extends CharacterBody3D

@export var velocidad:float
@onready var player: CharacterBody3D = $"../Player"
@onready var ladrido: AudioStreamPlayer3D =$Ladrido
@onready var muere: AudioStreamPlayer3D = $Muere
@onready var anim: AnimationPlayer = $die

var persiguiendo:bool = false

func _ready():
	visible = false
	
func start_chasing():
	visible = true
	persiguiendo = true

	
func die():
	muere.play()
	anim.play()
	await muere.finished
	self.queue_free()
	

func _physics_process(_delta):
	if persiguiendo:
		if not ladrido.playing:
			ladrido.play()
		var direccion = (player.global_transform.origin - self.global_transform.origin).normalized()
		velocity = direccion * velocidad
		move_and_slide() 
