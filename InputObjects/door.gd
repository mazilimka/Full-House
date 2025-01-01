extends Area2D

@export var room_name: String


func _ready() -> void:
	assert(self is Area2D)
	assert(not room_name.is_empty(), "room_name не задан!")
	input_event.connect(_door_to_kch_input_event)


func _door_to_kch_input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and MOUSE_BUTTON_LEFT and not event.is_pressed():
		Events.room_changed.emit(room_name)
		get_viewport().set_input_as_handled()
