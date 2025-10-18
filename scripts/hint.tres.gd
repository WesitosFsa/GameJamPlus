extends CenterContainer

func add_hint(_keyLabel : String, _action_label : String):
	var hint = load("res://scenes/control_hint.tscn").instantiate()
	add_child(hint)
	hint.init(_keyLabel, _action_label)
	
func remove_hint():
	for child in get_children():
		child.queue_free()
