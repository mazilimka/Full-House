extends CanvasLayer

func _ready() -> void:
	%LeftSide.pressed.connect(left_side_pressed)
	%RightSide.pressed.connect(right_side_pressed)


func left_side_pressed():
	#Global.CurrentRoom.side_move_left()
	Events.side_changed.emit('left')


func right_side_pressed():
	#Global.CurrentRoom.side_move_right()
	Events.side_changed.emit('right')
