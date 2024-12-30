extends Node
class_name SideManagerComponent

var array_keys: Array
var current_side := 0
var previous_side := 0
var screen

func _ready() -> void:
	screen = get_parent()
	Events.side_changed.connect(changing_side)
	array_keys = screen.sides.keys()
	arrows_manager()


func arrows_manager():
	if not array_keys.has(current_side - 1):
		GlobalHud.is_left_blocked = true
		GlobalHud.hide_arrows(-1)
		
	else:
		GlobalHud.is_left_blocked = false
		GlobalHud.show_arrows(-1)
	
	if not array_keys.has(current_side + 1):
		GlobalHud.is_right_blocked = true
		GlobalHud.hide_arrows(+1)
	else:
		GlobalHud.is_right_blocked = false
		GlobalHud.show_arrows(+1)


func changing_side(where: int):
	previous_side = current_side
	current_side += where
	arrows_manager()
	screen.sides[current_side].set_process_input(true)
	screen.sides[current_side].show()
	screen.sides[previous_side].set_process_input(false)
	screen.sides[previous_side].hide()
