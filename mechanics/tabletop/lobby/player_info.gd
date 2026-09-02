extends Control

@onready var player_name := $PlayerName
@onready var level_rank := $LevelRank/Label
@onready var player_level := $LevelInfo/HBoxContainer/PlayerLevel
@onready var current_exp := $LevelInfo/ExpInfo/CurrentExp
@onready var max_exp := $LevelInfo/ExpInfo/MaxExp
@onready var coins := $PlayerMoney/Money/Value
@onready var crystalls := $PlayerMoney/Money2/Value

func set_player_info(data: TabletopPlayerInfo) -> void:
	player_name.text = data.nickname
	level_rank.text = str(data.level)
	player_level.text = str(data.level)
	current_exp.text = str(data.current_exp)
	max_exp.text = str(data.level_exp)
	coins.text = str(data.coins)
	crystalls.text = str(data.crystalls)
	
