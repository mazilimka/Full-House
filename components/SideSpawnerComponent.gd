extends Node
class_name SideSpawnerComponent


func _ready() -> void:
	add_screens()


func add_screens():
	var array_keys = get_parent().sides.keys()
	var side_manager_comp = Global.get_component(get_parent(), 'SideManagerComponent')
	for id in array_keys:
		var scene_instance = get_parent().sides[id].instantiate()
		add_child(scene_instance, true)
		#side_manager_comp.sides[id] = 
