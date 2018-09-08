extends Control

signal key_change

var _is_keyboard = true
var _event


func _ready() -> void:
	set_process_input(false)


func check(enable):
	set_process_input(enable)
	$new_key.visible = enable


func change_key(action_name, keyboard = true):
	if InputMap.has_action(action_name):
		_is_keyboard = keyboard
		for event in InputMap.get_action_list(action_name):
			if _is_keyboard and event is InputEventKey:
				_event = event
				check(true)
				return
#		set_process_input(true)


func _input(event: InputEvent) -> void:
	if _is_keyboard and event is InputEventKey:
		_event.scancode = event.scancode
		emit_signal("key_change")
		check(false)
		return
			
			
			