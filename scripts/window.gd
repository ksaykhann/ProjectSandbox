extends Control
class_name WindowUI

func _enter_tree() -> void:
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	GlobalWindow.current_window = self
	GlobalWindow.pause.emit()

func _exit_tree() -> void:
	GlobalWindow.current_window = null
	GlobalWindow.context_buttons = []
	GlobalWindow.pause.emit()
