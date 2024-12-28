extends Node2D

var sides := {
	0: preload('res://Screens/Kitchen/kch_front.tscn')
}

func _init() -> void:
	Global.CurrentRoom = self
	Events.location_changed.emit(Events.STATES.Game)
	add_screens()


func add_screens():
	var array_keys = sides.keys()
	for id in array_keys:
		var scene_instance = sides[id].instantiate()
		add_child(scene_instance, true)
		sides[id] = scene_instance
		if scene_instance != get_node('KchFront'):
			scene_instance.hide()
