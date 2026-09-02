extends Node


func _ready() -> void:
	var welcom_message = MessageManager.new()
	welcom_message.call_message(self, "Здарова Хусейн! \nТестим мультилайнинг\nНеплохо держимся", welcom_message.message.TYPE.INFO)
	welcom_message = null
	add_child(GUIManager.new())
