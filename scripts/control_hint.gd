extends VBoxContainer
@onready var key: Label = $Key
@onready var action: Label = $Action


func init(_keyLabel : String, _action_label : String):
	key.text = _keyLabel
	action.text = _action_label
