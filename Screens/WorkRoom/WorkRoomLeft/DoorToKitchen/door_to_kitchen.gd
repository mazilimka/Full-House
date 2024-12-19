extends Area2D


func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and MOUSE_BUTTON_LEFT and not event.is_pressed():
		Events.room_changed.emit('Kitchen')
		get_viewport().set_input_as_handled()
