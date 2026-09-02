extends ContextButton

func _ready() -> void:
	pressed.connect(_on_pressed)

func _on_pressed() -> void:
	GlobalWindow.current_window = null
	GlobalWindow.context_buttons = []
	get_tree().change_scene_to_file("res://scenes/levels/test_level.tscn")
