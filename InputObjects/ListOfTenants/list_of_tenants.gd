extends Node2D

var SAVEFILE := "user://residents.json"

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
	set_resident(residents[randi_range(1, 7)])


func save_residents_to_file(path: String, residents: Array):
	var file = FileAccess.open(path, FileAccess.WRITE)
	if file:
		file.store_line(JSON.stringify(residents, "\t"))
		file.close()


func set_resident(res: Dictionary):
	print(res)
	%TextureRect.texture = load(res["photo_path"])
	%FullName.text = res["name"]
	%PassportSeries.text = res['passport_series']
	%PassportNumber.text = res['passport_number']
	%PassNumber.text = res["apartment_code"]
