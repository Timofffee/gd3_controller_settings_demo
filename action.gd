extends Control

export(String) var action_name = ''
export(bool) var is_keyboard = true

func _ready() -> void:
	update_key()
	$name.text = action_name
	get_parent().connect("key_change", self, 'update_key')


func _on_key_pressed() -> void:
	if InputMap.has_action(action_name):
		get_parent().change_key(action_name, is_keyboard)


func update_key():
	InputMap.load_from_globals()
	if InputMap.has_action(action_name):
		for ev in InputMap.get_action_list(action_name):
			if ev is InputEventKey:
				$key.text = OS.get_scancode_string(ev.scancode)
				return
			