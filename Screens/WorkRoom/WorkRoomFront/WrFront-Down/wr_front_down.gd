extends Node2D

var is_showing := false


func _ready() -> void:
	%ListOfTenantsArea.input_event.connect(_list_of_tern_input_event)


func _list_of_tern_input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("apply") and not is_showing:
		is_showing = true
		show_list_of_ternants()


func show_list_of_ternants():
	Events.location_changed.emit(Events.STATES.InputObject)
	%Animations.play("showing_list_of_tenants")
	await %Animations.animation_finished


func hide_list_of_ternants():
	Events.location_changed.emit(Events.STATES.Check)
	%Animations.play("hidding_list_of_tenants")
	await %Animations.animation_finished
	is_showing = false


func set_default_input_object():
	hide_list_of_ternants()
	%ListOfTenants.set_default_input_object()
