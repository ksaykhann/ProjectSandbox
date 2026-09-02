extends Node
class_name DataManager

var data: WorldPlayerData
var path: String = "res://world_player_data.tres"

func save_data(player: BasePlayer)-> void:
	data = WorldPlayerData.new()
	data.player_pos = player.global_position
	data.camera_pos = player.camera_spring_arm.global_position
	data.camera_rot = player.camera_spring_arm.rotation
	ResourceSaver.save(data, path)

func load_player_data(player: BasePlayer) -> void:
	if ResourceLoader.exists(path):
		data = ResourceLoader.load(path)
		player.global_position = data.player_pos
		player.camera_spring_arm.global_position = data.camera_pos
		player.camera_spring_arm.rotation = data.camera_rot
