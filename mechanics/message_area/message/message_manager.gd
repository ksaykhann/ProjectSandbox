extends RefCounted
class_name MessageManager

var mess: CasualMessage
var message: Message = Message.new()

var message_scenes_path : Dictionary ={
	message.TYPE.DEFAULT: "res://mechanics/message_area/message/scenes/casual_message.tscn",
	message.TYPE.GOOD: "res://mechanics/message_area/message/scenes/textured_message.tscn",
	message.TYPE.INFO: "res://mechanics/message_area/message/scenes/textured_message.tscn",
	message.TYPE.WARNING: "res://mechanics/message_area/message/scenes/textured_message.tscn",
	message.TYPE.BAD: "res://mechanics/message_area/message/scenes/textured_message.tscn",
}

var message_texture_path : Dictionary ={
	message.TYPE.DEFAULT: "res://mechanics/message_area/message/scenes/default.png",
	message.TYPE.GOOD: "res://mechanics/message_area/message/scenes/good.png",
	message.TYPE.INFO: "res://mechanics/message_area/message/scenes/info.png",
	message.TYPE.WARNING: "res://mechanics/message_area/message/scenes/warning.png",
	message.TYPE.BAD: "res://mechanics/message_area/message/scenes/bad.png",
}
func get_message(type: Message.TYPE) -> CasualMessage:
	var path : String
	var texture_path: String
	var message_scene: CasualMessage
	
	path = message_scenes_path[type]
	texture_path = message_texture_path[type]
	
	message_scene = load(path).instantiate()
	message_scene.set_texture(texture_path)
	return message_scene

func call_message(parent: Node, text: String, type: Message.TYPE  = message.TYPE.DEFAULT, pos: Variant = Message.POS.TOPRIGHT) -> CasualMessage:
	mess = get_message(type)
	parent.add_child(mess)
	
	if parent is StaticBody3D:
		mess.build_message(text, parent.position)
	else:
		mess.build_message(text, pos)
		
	mess.show_message()
	return mess
	
func build_message_for_object(parent: Node3D, text: String) -> Label3D:
	var new_label: Label3D = Label3D.new()
	new_label.font = load("res://assets/ui/fonts/Ankona Kursive.ttf")
	new_label.font_size = 24
	new_label.text = text
	new_label.position.y = parent.position.y
	new_label.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	return new_label
