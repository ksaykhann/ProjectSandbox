extends StaticBody3D

@onready var area := $MessageArea
var player_near: bool = false

func _ready() -> void:
	area.body_entered.connect(_on_body_entered)
	area.body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node3D):
	if body is CharacterBody3D:
		player_near = true

func _on_body_exited(body: Node3D):
	if body is CharacterBody3D:
		player_near = false
	
func _unhandled_input(event: InputEvent) -> void:
	if player_near:
		if event is InputEventKey:
			if event.is_action_pressed("interaction"):
				Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
				add_child(load("res://mechanics/tabletop/trigger/tabletop_list.tscn").instantiate())
				get_child(get_child_count()-2).queue_free()
