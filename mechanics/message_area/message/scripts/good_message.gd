extends CasualMessage

func set_size_bound() -> void:
	var x = 20
	var y = label.get_character_bounds(0).size.y * label.get_line_count() * (label.get_line_count()/2.0)
	
	for line in label.text.split("\n"):
		var tmp = (line.length()/2.0) * line.length()
		for i in range(line.length()):
			tmp += label.get_character_bounds(i).size.x
		if tmp > x:
			x = tmp
	if y < texture.custom_minimum_size.y:
		size.y = texture.custom_minimum_size.y
	else: 
		size.y = y

	if x < texture.custom_minimum_size.x:
		size.x = texture.custom_minimum_size.x
	else: 
		size.x = x
