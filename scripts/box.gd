extends StaticBody3D
@onready var sound: AudioStreamPlayer3D = $AudioStreamPlayer3D
@onready var dog: CharacterBody3D = $"../dog"

var event_activated: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(_delta: float) -> void:
	pass

func mouse_interaction():
	pass


func summon_dog():
	dog.visible = true
	dog.start_chasing()
	

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player") and !event_activated:
		event_activated = true
		sound.play()
		await sound.finished
		summon_dog()
		await get_tree().create_timer(10).timeout
		queue_free()
		
