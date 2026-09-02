extends Node
class_name TabletopDataManager

var data: TabletopPlayerInfo
var path: String = "res://mechanics/tabletop/scripts/tabletop_player_data.tres"

func _ready() -> void:
	data = load(path)

func set_nickname(value: String) -> void:
	data.nickname = value

func add_coins(value: int) -> void:
	data.coins += value

func waste_coins(value: int) -> bool:
	if data.coins < 0:
		data.coins -= value
		return true
	else:
		return false


func add_crystalls(value: int) -> void:
	data.crystalls += value


func waste_crystalls(value: int) -> bool:
	if data.crystalls < 0:
		data.crystalls -= value
		return true
	else:
		return false


func add_exp(value: int) -> void:
	if data.current_exp >= data.level_exp:
		_new_level()
	else:
		data.current_exp +=value


func _new_level() -> void:
	data.current_exp = 0
	data.level += 1
	data.level_exp = 100 * data.level
	
func load_data() -> TabletopPlayerInfo:
	data = load(path)
	return data

func save_data() -> void:
	ResourceSaver.save(data, path)
