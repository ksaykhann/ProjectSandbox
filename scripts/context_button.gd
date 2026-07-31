extends Button
class_name ContextButton

func _enter_tree() -> void:
	GlobalWindow.context_buttons.append(self)
