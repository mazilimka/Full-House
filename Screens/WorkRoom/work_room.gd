extends Node2D

@onready var camera_between_sides: Camera2D = %CameraBetweenSides


func _ready() -> void:
	Global.CurrentRoom = self

func side_move_left():
	camera_between_sides.move_left()


func side_move_right():
	camera_between_sides.move_right()
