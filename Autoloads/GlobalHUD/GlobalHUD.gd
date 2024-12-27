extends CanvasLayer

func _ready() -> void:
	%LeftSide.pressed.connect(left_side_pressed)
	%RightSide.pressed.connect(right_side_pressed)


func left_side_pressed():
	#Global.CurrentRoom.side_move_left()
	Events.side_changed.emit(-1)


func right_side_pressed():
	#Global.CurrentRoom.side_move_right()
	Events.side_changed.emit(1)


func hide_arrows(what: int):
	match what:
		-1: %LeftSide.hide()
		1: %RightSide.hide()


func show_arrows(what: int):
	match what:
		-1: %LeftSide.show()
		1: %RightSide.show()
