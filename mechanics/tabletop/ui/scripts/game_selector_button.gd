extends ContextTextureButton
class_name GameSelectorButton


@onready var icon := $TextureRect
@onready var game_name := $Label
var default = Color(1, 1, 1, 1.0)
var shadow = Color(0.47, 0.47, 0.47, 1.0)


func _ready() -> void:
	make_shadow()

func set_icon(texture: CompressedTexture2D) -> void:
	icon.texture = texture

func set_game_name(new_name: String) -> void:
	game_name.text = new_name

func make_shadow() -> void:
	icon.modulate = shadow
	game_name.modulate = shadow

func unshadow() -> void:
	icon.modulate = default
	game_name.modulate = default
	
