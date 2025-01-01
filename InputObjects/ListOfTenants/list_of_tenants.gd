extends Node2D


var residents := {
	1: {
		"name": "Иванов Иван Иванович",
		"passport_series": "1234",
		"passport_number": "567890",
		"apartment_code": "A12",
		"photo_path": "res://Assets/ResidentsPhotos/4b084eb505fda17a440cddc2fd20c480--pixel-art.jpg"
	},
	2: {
		"name": "Петрова Анна Сергеевна",
		"passport_series": "4321",
		"passport_number": "098765",
		"apartment_code": "B34",
		"photo_path": "res://Assets/ResidentsPhotos/i.webp"
	},
	3: {
		"name": "Сырная Сосиска Сергеевна",
		"passport_series": "2344",
		"passport_number": "837602",
		"apartment_code": "B24",
		"photo_path": "res://Assets/ResidentsPhotos/65feed15dab707bba1f2638bc3f09389.jpg"
	},
	4: {
		"name": "Мясное Молоко Олеговна",
		"passport_series": "8202",
		"passport_number": "849529",
		"apartment_code": "Г44",
		"photo_path": "res://Assets/ResidentsPhotos/ii.webp"
	},
	5: {
		"name": "Раскольников Родион Романович",
		"passport_series": "7290",
		"passport_number": "234945",
		"apartment_code": "Р73",
		"photo_path": "res://Assets/ResidentsPhotos/58e36372a88fcccb73c4fbcf01dc2187--pixel-art-larry-page.jpg"
	},
	6: {
		"name": "Разумихин Дмитрий Порфирьевич",
		"passport_series": "5546",
		"passport_number": "355713",
		"apartment_code": "О87",
		"photo_path": "res://Assets/ResidentsPhotos/8481c5a9b5f5c76a367515bd34102c9c.png"
	},
	7: {
		"name": "Александр Сергеевич Пушкин",
		"passport_series": "6451",
		"passport_number": "290234",
		"apartment_code": "З23",
		"photo_path": "res://Assets/ResidentsPhotos/fd29567297555.5636b71b8bb63.png"
	}
}


func _ready() -> void:
	fill_in_list_of_tenants()
	for node in %Residents.get_children():
		node.gui_input.connect(_residents_list_gui_input.bind(node))


func _residents_list_gui_input(event: InputEvent, node):
	if Input.is_action_just_pressed("apply"):
		%Animations.play("list_upheavel")
		var resident_name: String
		resident_name = node.text
		for res in residents.keys():
			if resident_name == residents[res]['name']:
				set_resident(residents[res])
				return


func fill_in_list_of_tenants():
	var counter := 0
	for res in residents.keys():
		%Residents.get_child(counter).text = residents[res]["name"]
		counter += 1


func set_resident(res: Dictionary):
	%TextureRect.texture = load(res["photo_path"])
	%FullName.text = res["name"]
	%PassportSeries.text = res['passport_series']
	%PassportNumber.text = res['passport_number']
	%PassNumber.text = res["apartment_code"]


func set_default_input_object():
	%Animations.play("RESET")
