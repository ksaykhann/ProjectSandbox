extends Node
class_name GameParser

func get_game_list() -> Array[String]:
	var games_path: String = "res://mechanics/tabletop/games/"
	var games: Array[String] = []
	
	var dir = DirAccess.open(games_path)
	
	dir.list_dir_begin()
	var file_name = dir.get_next()
	
	while file_name != "":
		if dir.current_is_dir():
			if file_name != "icons" and file_name != "preview":
				games.append(file_name)
		file_name = dir.get_next()
	dir.list_dir_end()
	return games
