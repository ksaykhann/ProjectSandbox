extends WindowUI

@onready var exit_btn: Button = $ButtonContainer/Exit
@onready var con_btn: Button = $ButtonContainer/Continue

func _ready() -> void:
	con_btn.pressed.connect(continue_game)
	exit_btn.pressed.connect(exit)
	GlobalWindow.context_buttons[0].grab_focus()

func exit() -> void:
	get_tree().quit()
	

func continue_game() -> void:
	queue_free()
