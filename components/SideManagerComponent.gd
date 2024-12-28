extends Node
class_name SideManagerComponent

var array_keys: Array
var current_side := 0
var previous_side := 0


func _ready() -> void:
	Events.side_changed.connect(changing_side)
	array_keys = get_parent().sides.keys()
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
	get_parent().sides[current_side].show()
	get_parent().sides[previous_side].hide()
