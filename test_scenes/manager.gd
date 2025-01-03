extends Node

var all_rects := []
var prev_layout
var current_rect:
	set(value):
		if current_rect is Node2D:
			current_rect.modulate = Color.BLACK
		current_rect = value
		if current_rect is Node2D:
			current_rect.modulate = Color.RED


func _ready() -> void:
	current_rect = get_node('../Rect')
	current_rect = current_rect._add_texture()
	all_rects.append(current_rect)
	current_rect.set_next_rect()


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("move_left") and current_rect.to_left:
		current_rect.hide_next_rect()
		current_rect = current_rect.go_to_screen('left')
		#all_rects.append(current_rect)
		current_rect.set_next_rect()
	
	if Input.is_action_just_pressed('move_right') and current_rect.to_right:
		current_rect.hide_next_rect()
		current_rect = current_rect.go_to_screen('right')
		#all_rects.append(current_rect)
		current_rect.set_next_rect()
	
	if Input.is_action_just_pressed("move_down"):
		assert(all_rects != null)
		if all_rects.size() == 1:
			return
		current_rect.close()
		all_rects.pop_back()
		current_rect = all_rects.back()
	
	if Input.is_action_just_pressed("move_up") and current_rect.to_up:
		assert(all_rects != null)
		current_rect = current_rect.add_above()
		all_rects.append(current_rect)
		current_rect.set_next_rect()
	
	if event is InputEventKey:
		$"../Label".text = str('Pressed: ' + OS.get_keycode_string(event.get_physical_keycode_with_modifiers()))
		$"../Label".global_position = Vector2(199, 259)
