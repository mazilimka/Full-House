extends Control


func _ready() -> void:
	Global.CurrentRoom = self


func _process(delta: float) -> void:
	if Input.is_anything_pressed():
		Events.room_changed.emit('WorkRoom')
