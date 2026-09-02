@tool
extends Control

@onready var preview := $HBoxContainer/TextureRect
@onready var game_name_label := $HBoxContainer/GameInfo/GameName
@onready var game_info_label := $HBoxContainer/GameInfo/GameInfo

# Скрытые переменные для хранения значений
var _texture: CompressedTexture2D
var _game_name: String
var _game_info: String

@export var texture: CompressedTexture2D:
	set(value):
		_texture = value
		if preview:
			preview.texture = value
	get:
		return _texture

@export var game_name: String:
	set(value):
		_game_name = value
		if game_name_label:
			game_name_label.text = value
	get:
		return _game_name

@export_multiline var game_info: String:
	set(value):
		_game_info = value
		if game_info_label:
			game_info_label.text = value
	get:
		return _game_info

@export var game_path : String
func _ready() -> void:
	# Применяем сохранённые значения к уже готовым узлам
	if preview:
		preview.texture = _texture
	if game_name_label:
		game_name_label.text = _game_name
	if game_info_label:
		game_info_label.text = _game_info
