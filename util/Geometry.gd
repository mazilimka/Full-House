extends Node
class_name Geometry


func get_screen_center(screen: Viewport):
	return screen.get_viewport().get_visible_rect()
