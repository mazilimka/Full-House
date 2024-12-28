extends Node2D


func _ready() -> void:
	$DoorToKitchen.input_event.connect(_door_to_kch_input_event)


func _door_to_kch_input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and MOUSE_BUTTON_LEFT and not event.is_pressed():
		Events.room_changed.emit('Kitchen')
		get_viewport().set_input_as_handled()
