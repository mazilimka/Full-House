extends Node

# просто прямоугольник на экране
# на текущий прямоугольник должна указывать метка

# доступные действия на текущем скрине, пока доступны все
var actions_array = ["go to left", "go to right", "go up", "go down"]


func _close():
	# когда один оставшийся прямоугольник мы не можем его закрыть
	# "go down" убрать текущий прямоугольник
	# передать управление предыдущему активному прямоугольнику
	pass

# поменять текущий верхний скрин на другой в иерархии
func _go_to_screen():
	# заспавнить новый прямоугольник слева или справа
	# и передать ему управление
	pass

func _add_above():
	# "go up" добавить новый прямоугольник на экране со смещение вверх и вправо
	# и передать ему активное управление
	pass
