extends Area3D

var label: Label3D
var control_label: CasualMessage
var interface: bool = true

func _ready() -> void:
	body_entered.connect(on_body_entered)
	body_exited.connect(on_body_exited)
	
func on_body_entered(body: Node3D) -> void:
	var message: MessageManager = MessageManager.new()
	if body is CharacterBody3D:
		if interface:
			control_label = message.call_message(get_parent(), "Взаимодействие: E")
		else:
			label = message.build_message_for_object(get_parent(), "Для взаимодействия нажмите E")
			add_child(label)

func on_body_exited(body: Node3D) -> void:
	if body is CharacterBody3D:
		if interface:
			if control_label:
				control_label.dead()
		else:
			label.free()
