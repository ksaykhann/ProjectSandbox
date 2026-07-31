extends CasualMessage

func set_size_bound() -> void:
	var x = 7 * label.text.length()
	for i in range(label.text.length()):
		x += label.get_character_bounds(i).size.x
	var y = label.get_character_bounds(0).size.y + 30
	if Vector2(x,y) < texture.custom_minimum_size:
		size = texture.custom_minimum_size
	else: 
		size = Vector2(x, y)
