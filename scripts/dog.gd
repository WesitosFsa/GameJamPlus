extends CharacterBody3D

@export var velocidad:float
@onready var player: CharacterBody3D = $"../Player"
var persiguiendo:bool = false

func _ready():
	visible = false
	
func start_chasing():
	visible = true
	persiguiendo = true
	
func _physics_process(delta):
	if persiguiendo:
		var direccion = (player.global_transform.origin - self.global_transform.origin).normalized()
		velocity = direccion * velocidad
		move_and_slide() 
