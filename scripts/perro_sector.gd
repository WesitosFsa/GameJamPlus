extends Node3D
@onready var ladrido: AudioStreamPlayer3D = $Ladrido
@export var gallo : rooster_body

func _ready() -> void:
	gallo.interact.connect(_on_gallo_interact)

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is Player:
		ladrido.play()
		$Perro_Anim_002_Actions/AnimationPlayer.play("Perro_salida", -1, 1)


func _on_area_3d_body_exited(body: Node3D) -> void:
	if body is Player:
		ladrido.stop()
		$Perro_Anim_002_Actions/AnimationPlayer.play("Perro_salida", -1, -1)

func desactivate():
	$Pared.collision_layer = 0b00
	$Area3D.collision_mask = 0b00

func activate():
	$Pared.collision_layer = 0b01
	$Area3D.collision_mask = 0b01
	

func _on_gallo_interact():
	desactivate()
