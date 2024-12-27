extends Node

var CurrentRoom
var CurrentSide: String


func get_component(_node: Node, _comp_name: String):
	return _node.get_node_or_null(_comp_name)
