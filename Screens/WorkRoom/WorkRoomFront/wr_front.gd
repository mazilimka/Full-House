extends Node2D

var is_moving := false
var move_up_blocked := true
var move_down_blocked := false

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("move_down") and not is_moving and not move_down_blocked:
		move_down_blocked = true
		move_up_blocked = false
		
		move_down()
		Events.location_changed.emit(Events.STATES.Check)
	
	if Input.is_action_just_pressed("move_up") and not is_moving and not move_up_blocked:
		move_up_blocked = true
		move_down_blocked = false
		move_up()
		Events.location_changed.emit(Events.STATES.Game)

func move_down():
	is_moving = true
	var prev_pos_x = $"WrFront-Down".position.x
	var prev_pos_y = $"WrFront-Down".position.y
	var tween = get_tree().create_tween()
	tween.tween_property($"WrFront-Down", 'position', Vector2(prev_pos_x, prev_pos_y - 648), 0.2).set_ease(Tween.EASE_OUT)
	await tween.finished
	is_moving = false


func move_up():
	is_moving = true
	var prev_pos_x = $"WrFront-Down".position.x
	var prev_pos_y = $"WrFront-Down".position.y
	var tween = get_tree().create_tween()
	tween.tween_property($"WrFront-Down", 'position', Vector2(prev_pos_x, prev_pos_y + 648), 0.2).set_ease(Tween.EASE_OUT)
	await tween.finished
	is_moving = false
