extends Node3D
@onready var ladrido: AudioStreamPlayer3D = $Perro/Ladrido

func _on_area_3d_area_entered(area: Area3D) -> void:
	ladrido.play()
