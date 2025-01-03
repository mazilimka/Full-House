extends Sprite2D


@onready var new_rect := preload('res://Screens/screen.gd')

@export var to_left: Node2D
@export var to_right: Node2D
@export var to_up: Node2D

# просто прямоугольник на экране
# на текущий прямоугольник должна указывать метка

# доступные действия на текущем скрине, пока доступны все
var actions_array = [to_left, to_right, to_up]


#func _ready() -> void:
	#_add_teture()


func _add_texture():
	texture = load('res://Assets/Simple Shapes/Square.png')
	show()
	modulate = Color.BLACK
	scale = Vector2(0.18, 0.063)
	return self


func _create_rect():
	var sprite = Sprite2D.new()
	sprite.set_script(new_rect)
	get_parent().add_child(sprite)
	return sprite


func close():
	hide_next_rect()
	hide()
	
	# когда один оставшийся прямоугольник мы не можем его закрыть
	# "go down" убрать текущий прямоугольник
	# передать управление предыдущему активному прямоугольнику
	pass

# поменять текущий верхний скрин на другой в иерархии
func go_to_screen(what: String):
	var rect
	match what:
		'left':
			rect = to_left
			rect._add_texture()
			
		'right':
			rect = to_right
			rect._add_texture()
	
	# заспавнить новый прямоугольник слева или справа
	# и передать ему управление
	return rect

func add_above():
	var rect = to_up
	#rect.global_position = global_position + Vector2(0, -90)
	rect._add_texture()
	# "go up" добавить новый прямоугольник на экране со смещение вверх и вправо
	# и передать ему активное управление
	return rect


func _add_blur_texture():
	texture = load('res://Assets/Simple Shapes/Square.png')
	show()
	modulate = Color(1, 1, 1, 0.5)
	scale = Vector2(0.18, 0.063)


func hide_next_rect():
	if to_left:
		print('left')
		to_left.hide()
		pass
	elif to_right:
		print('right')
		to_right.hide()
		pass
	elif to_up:
		print('up')
		to_up.hide()
		pass


func set_next_rect():
	if to_left:
		print('left')
		to_left._add_blur_texture()
		pass
	elif to_right:
		print('right')
		to_right._add_blur_texture()
		pass
	elif to_up:
		print('up')
		to_up._add_blur_texture()
		pass
