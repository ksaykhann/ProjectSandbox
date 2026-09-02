extends WindowUI
class_name TabletopLobby

@onready var quit := $ToolBar/Quit
@onready var game_btn := $Menu/ButtonMenu/ButtonContainer/Game
@onready var game_panel := $GamePanel
@onready var btn_container := $Menu/ButtonMenu/ButtonContainer
@onready var game_box := $GamePanel/GameBox
@onready var player_info := $Menu/PlayerInfo

var data_manager: TabletopDataManager
var current_panel: Control

func _ready() -> void:
	_load_player_info()
	
	quit.pressed.connect(exit)
	for child in btn_container.get_children():
		child.pressed.connect(show_panel.bind(find_child(child.name+ "Panel")))
	
	for child in game_box.get_children():
		var btn : ContextTextureButton = child.find_child("StartButton")
		btn.pressed.connect(_on_game_start.bind(child.game_path))
	
	game_btn.grab_focus()
	show_panel(game_panel) 

func _load_player_info() -> void:
	data_manager = TabletopDataManager.new()
	var data = data_manager.load_data()
	player_info.set_player_info(data)

func show_panel(panel: Control) -> void:
	if current_panel != null:
		current_panel.hide()
	panel.show()
	current_panel = panel

func _on_game_start(game_path) -> void:
	get_tree().change_scene_to_file(game_path)

func exit() -> void:
	queue_free()
