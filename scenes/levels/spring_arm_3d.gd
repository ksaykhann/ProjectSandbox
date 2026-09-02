extends SpringArm3D

@export var mouse_sensitivity = 0.005
@export var mouse_top_limit = deg_to_rad(75)
@export var mouse_bottom_limit = deg_to_rad(-10)


func _ready() -> void:
	# Захват фокуса для скрытия курсора
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _unhandled_input(event: InputEvent) -> void:
	camera_rotating(event)


# Вращение камеры мышкой
func camera_rotating(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		# Вращение камеры по вертикали
		rotation.x = clamp(
			(rotation.x + event.relative.y * mouse_sensitivity),
			-mouse_top_limit, 
			mouse_bottom_limit)
		# Вращение камеры по горизонтали
		rotation.y -= event.relative.x * mouse_sensitivity

func _exit_tree() -> void:
	var data: DataManager = DataManager.new()
	data.save_data(get_parent())
