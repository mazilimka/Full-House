extends Node
class_name SideManagerComponent

var room_sides_idx_array: Array
var current_side := 0
var previous_side := 0
var room

func _ready() -> void:
	room = get_parent()
	Events.side_changed.connect(changing_side)
	room_sides_idx_array = room.sides.keys()
	arrows_manager()


func arrows_manager():
	if not room_sides_idx_array.has(current_side - 1):
		GlobalHud.is_left_blocked = true
		GlobalHud.hide_arrows(-1)
		
	else:
		GlobalHud.is_left_blocked = false
		GlobalHud.show_arrows(-1)
	
	if not room_sides_idx_array.has(current_side + 1):
		GlobalHud.is_right_blocked = true
		GlobalHud.hide_arrows(+1)
	else:
		GlobalHud.is_right_blocked = false
		GlobalHud.show_arrows(+1)


func changing_side(where: int):
	previous_side = current_side
	current_side += where
	
	arrows_manager()
	room.sides[current_side].set_process_input(true)
	room.sides[current_side].show()
	room.sides[previous_side].set_process_input(false)
	room.sides[previous_side].hide()
	Global.CurrentSide = room.sides[current_side]
