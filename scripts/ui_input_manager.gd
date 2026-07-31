extends Node
class_name GUIManager

var pause_ui: Control

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):

		if GlobalWindow.current_window == null:
			pause_ui = load('res://scenes/ui/pause_ui.tscn').instantiate()
			add_child(pause_ui)
			
		else:
			GlobalWindow.current_window.queue_free()
	
	if Input.is_action_just_pressed('ui_show_message'):
		var messanger: MessageManager = MessageManager.new()
		messanger.call_message(self, "Восславу архитектуры", randi()%5, randi()%6)	
