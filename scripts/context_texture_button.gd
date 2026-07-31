extends TextureButton
class_name ContextTextureButton

func _enter_tree() -> void:
	GlobalWindow.context_buttons.append(self)
