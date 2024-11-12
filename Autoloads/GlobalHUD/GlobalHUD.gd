extends CanvasLayer

func _ready() -> void:
	%LeftSide.pressed.connect(left_side_pressed)
	%RightSide.pressed.connect(right_side_pressed)


func left_side_pressed():
	Global.CurrentRoom.side_move_left()


func right_side_pressed():
	Global.CurrentRoom.side_move_right()
