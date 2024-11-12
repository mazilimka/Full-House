extends Node

var CurrentRoom 


func get_component(_node: Node, _comp_name: String):
	return _node.get_node_or_null(_comp_name)


func get_side(_node: Node2D, _to: String):
	return _node.get_node(_to)
