extends Node2D

var is_showing := false


func _ready() -> void:
	%ListOfTenantsArea.input_event.connect(_list_of_tern_input_event)


func _list_of_tern_input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("apply") and not is_showing:
		show_list_of_ternants()
		await %Animations.animation_finished
		is_showing = true
	
	if Input.is_action_just_pressed("apply"):
		hide_list_of_ternants()
		await %Animations.animation_finished
		is_showing = false


func show_list_of_ternants():
	%Animations.play("showing_list_of_tenants")
	Events.location_changed.emit(Events.STATES.ListOfTenants)


func hide_list_of_ternants():
	%Animations.play("hidding_list_of_tenants")
	Events.location_changed.emit(Events.STATES.Game)
