extends Area2D


func _ready() -> void:
	pass


func cursor_hover_tween():
	var x_pos = global_position.x
	var tween = create_tween()
	tween.tween_property(self, 'global_position', Vector2(x_pos, position.y -15.0), 0.25)


func cursor_exit_tween():
	var x_pos = global_position.x
	var tween = create_tween()
	tween.tween_property(self, 'global_position', Vector2(x_pos, position.y +15.0), 0.2)


func _mouse_enter() -> void:
	cursor_hover_tween()


func _mouse_exit() -> void:
	cursor_exit_tween()
