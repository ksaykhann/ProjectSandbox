extends WindowUI
class_name TableTopList


@onready var container := $ScrollContainer/GameList
@onready var preview_texture := $TextureRect/Preview
@onready var exit_button := $TextureRect/ExitButton
@onready var start_btn := $StartGame

var player_ref: BasePlayer
var games: Array[String]
var icon_path: String = "res://mechanics/tabletop/games/icons/"
var preview_path: String = "res://mechanics/tabletop/games/preview/"
var icon_format: String = ".png"
var preview_format: String = ".jpg"
var preview_array: Array[CompressedTexture2D] = []
var current_game_index: int
var game_path: String = "res://mechanics/tabletop/games/"

func _ready() -> void:
	exit_button.pressed.connect(_on_button_pressed)
	start_btn.pressed.connect(_on_start_pressed)
	_create_game_list()
	GlobalWindow.context_buttons[2].grab_focus()

func _create_game_list() -> void:
	var parser: GameParser = GameParser.new()
	games = parser.get_game_list()
	var index: int = 0
	for game in games:
		var icon: CompressedTexture2D = load(icon_path + game + icon_format)
		var preview: CompressedTexture2D = load(preview_path + game + preview_format)
		preview_array.append(preview)
		var game_button: GameSelectorButton = load("res://mechanics/tabletop/ui/select_game_button.tscn").instantiate()
		container.add_child(game_button)
		game_button.focus_entered.connect(_on_focus_entered.bind(index))
		game_button.set_icon(icon)
		game_button.set_game_name(game)
		game_button.unshadow()
		index+=1


func _on_start_pressed() -> void:
	var data_to_save = DataManager.new()
	data_to_save.save_data(player_ref)
	get_tree().change_scene_to_file(game_path)
	

func _on_focus_entered(idx: int) -> void:
	preview_texture.texture = preview_array[idx]
	current_game_index = idx
	game_path += games[idx] + "/game.tscn"
	


func _on_button_pressed() -> void:
	queue_free()
