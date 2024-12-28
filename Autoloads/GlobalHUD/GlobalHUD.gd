extends CanvasLayer

var is_left_blocked := false
var is_right_blocked := false


func _ready() -> void:
	%LeftSide.pressed.connect(left_side_pressed)
	%RightSide.pressed.connect(right_side_pressed)
	Events.location_changed.connect(location_changing)


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed('move_left') and not is_left_blocked:
		left_side_pressed()
	
	if Input.is_action_just_pressed('move_right') and not is_right_blocked:
		right_side_pressed()


func location_changing(location: Events.STATES):
	match location:
		Events.STATES.StartScreen:
			hide_arrows("all")
		Events.STATES.Game:
			show_arrows("all")
			is_right_blocked = false
			is_left_blocked = false
		Events.STATES.ListOfTenants:
			hide_arrows("all")
			is_right_blocked = true
			is_left_blocked = true


func left_side_pressed():
	Events.side_changed.emit(-1)


func right_side_pressed():
	Events.side_changed.emit(+1)


func hide_arrows(what):
	match what:
		-1: %LeftSide.hide()
		+1:  %RightSide.hide()
		"all": 
			%RightSide.hide()
			%LeftSide.hide()


func show_arrows(what):
	match what:
		-1: %LeftSide.show()
		+1: %RightSide.show()
		"all": 
			%RightSide.show()
			%LeftSide.show()
