extends Control

var curr_scr_idx := 0

var rooms := {
	WorkRoom = load("res://Screens/WorkRoom/work_room.tscn"),
	Kitchen = load("res://Screens/Kitchen/kitchen.tscn")
}


func _ready() -> void:
	Events.room_changed.connect(room_changing)


func room_changing(room: String):
	Global.CurrentRoom.queue_free()
	match room:
		'Kitchen':
			add_child(rooms['Kitchen'].instantiate())
		'WorkRoom':
			add_child(rooms['WorkRoom'].instantiate())
