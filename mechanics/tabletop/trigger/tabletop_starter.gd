extends StaticBody3D

@onready var area := $MessageArea
var player_near: bool = false
var player: BasePlayer

func _ready() -> void:
	area.body_entered.connect(_on_body_entered)
	area.body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node3D):
	if body is CharacterBody3D:
		player = body
		player_near = true

func _on_body_exited(body: Node3D):
	if body is CharacterBody3D:
		player = null
		player_near = false
	
func _unhandled_input(event: InputEvent) -> void:
	if player_near:
		if event is InputEventKey:
			if event.is_action_pressed("interaction"):
				Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
				var list:TabletopLobby = load("res://mechanics/tabletop/lobby/lobby.tscn").instantiate()
				add_child(list)
