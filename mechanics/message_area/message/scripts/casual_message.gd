extends Control
class_name CasualMessage

var message: Message = Message.new()

@onready var label:Label = $TextureRect/HBoxContainer/Label
@onready var texture: TextureRect = $TextureRect
var start_pos: Vector2
var stop_pos: Vector2
var timer: Timer
var texture_path: String
var animate: bool = true

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

func set_text(text: String) -> void:
	label.text = text

func set_start_pos(pos: Vector2) -> void:
	start_pos = pos

func set_stop_pos(pos: Vector2) -> void:
	stop_pos = pos
	
func set_size_bound() -> void:
	var x = 20
	var y = label.get_character_bounds(0).size.y * label.get_line_count()
	
	for line in label.text.split("\n"):
		var tmp = 20
		for i in range(line.length()):
			tmp += label.get_character_bounds(i).size.x
		if tmp > x:
			x = tmp
		
	
	
	size = Vector2(x, y)

func set_texture(path: String) -> void:
	texture_path = path
	
func load_texture_rect() -> void:
	texture.texture = load(texture_path)

func build_message(text: String, pos: Variant):
	set_text(text)
	load_texture_rect()
	set_size_bound()
	if pos is Message.TYPE:
		match pos:
			message.POS.TOPRIGHT:
				var x = get_window().size.x - size.x - 10
				var y = 10
				set_start_pos(Vector2(x, y - size.y))
				set_stop_pos(Vector2(x, y))
			message.POS.BOTRIGHT:
				var x = get_window().size.x - size.x - 10
				var y = get_window().size.y - 10
				set_start_pos(Vector2(x, y))
				set_stop_pos(Vector2(x, y - size.y))
			message.POS.TOPLEFT:
				var x = 10
				var y = 10
				set_start_pos(Vector2(x, y - size.y))
				set_stop_pos(Vector2(x, y))
			message.POS.BOTLEFT:
				var x = 10
				var y = get_window().size.y - 10
				set_start_pos(Vector2(x, y))
				set_stop_pos(Vector2(x, y - size.y))
			message.POS.TOPCENTER:
				var x = (get_window().size.x - size.x)* 0.5
				var y = 10
				set_start_pos(Vector2(x, y - size.y))
				set_stop_pos(Vector2(x, y))
			message.POS.BOTCENTER:
				var x = (get_window().size.x - size.x) * 0.5
				var y = get_window().size.y - 10
				set_start_pos(Vector2(x, y))
				set_stop_pos(Vector2(x, y - size.y))
			
	if pos is Vector3:
		var camera := get_viewport().get_camera_3d()
		position = camera.unproject_position(pos)
		animate = false

func show_message() -> void:
	if animate:
		position = start_pos
		var tween = get_parent().create_tween()
		tween.tween_property(self, 'position', stop_pos, 0.5)
		timer = Timer.new()
		timer.process_mode = Node.PROCESS_MODE_ALWAYS
		add_child(timer)
		timer.start(5)
		timer.timeout.connect(dead)

func dead() -> void:
	if animate:
		var tween = get_parent().create_tween()
		tween.tween_property(self, 'position', start_pos, 0.4)
		await tween.finished
	queue_free()
