extends Node2D


var sides := {
	-2: preload('res://Screens/WorkRoom/WorkRoomBack/wr_back.tscn'),
	-1: preload('res://Screens/WorkRoom/WorkRoomLeft/wr_left.tscn'),
	0: preload('res://Screens/WorkRoom/WorkRoomFront/wr_front.tscn'),
	1: preload('res://Screens/WorkRoom/WorkRoomRight/wr_right.tscn'),
	2: preload('res://Screens/WorkRoom/WorkRoomBack/wr_back.tscn')
}


func _ready() -> void:
	add_screens()
	Global.CurrentRoom = self
	Events.location_changed.emit(Events.STATES.Game)


func add_screens():
	var array_keys = sides.keys()
	for id in array_keys:
		var scene_instance = sides[id].instantiate()
		add_child(scene_instance, true)
		sides[id] = scene_instance
		if scene_instance == get_node('WrFront'):
			scene_instance.show()
			Global.CurrentSide = get_node('WrFront')
		else: scene_instance.hide()
