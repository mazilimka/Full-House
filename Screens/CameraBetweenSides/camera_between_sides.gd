extends Camera2D


func move_left():
	var prev_pos_x = global_position.x
	var prev_pos_y = global_position.y
	var tween = get_tree().create_tween()
	tween.tween_property(self, 'global_position', Vector2(prev_pos_x - 576*2, prev_pos_y), 0.2).set_ease(Tween.EASE_OUT)


func move_right():
	var prev_pos_x = global_position.x
	var prev_pos_y = global_position.y
	var tween = get_tree().create_tween()
	tween.tween_property(self, 'global_position', Vector2(prev_pos_x + 576*2, prev_pos_y), 0.2).set_ease(Tween.EASE_OUT)
