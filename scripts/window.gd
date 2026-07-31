extends Control
class_name WindowUI

func _enter_tree() -> void:
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	get_tree().paused = true
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	GlobalWindow.current_window = self


func _exit_tree() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	GlobalWindow.current_window = null
	GlobalWindow.context_buttons = []
	get_tree().paused = false
	
