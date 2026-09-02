extends Node
class_name WindowManager

signal pause

var current_window: WindowUI = null
var context_buttons: Array[Variant] =[]

func _ready() -> void:
	pause.connect(_change_state)

func _change_state() -> void:
	if get_tree().paused:
		get_tree().paused = false
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	else:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		get_tree().paused = true
