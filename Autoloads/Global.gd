extends Node

var CurrentRoom
var CurrentSide

var  = [0, 1, 2,3 ]

func get_component(_node: Node, _comp_name: String):
	return _node.get_node_or_null(_comp_name)


func get_lvl():
	return get_tree().current_scene
