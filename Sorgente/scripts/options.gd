extends Panel

@onready var res_selector: OptionButton = $OptionButton


var resolutions = [
	Vector2i(800, 600),
	Vector2i(1024, 768),
	Vector2i(1280, 720),
	Vector2i(1366, 768),
	Vector2i(1920, 1080)
]


func _ready() -> void:
	populate_resolutions()
	res_selector.item_selected.connect(_on_resolution_selected)
	

func _process(delta: float) -> void:
	pass


func populate_resolutions():
	for res in resolutions:
		res_selector.add_item(str(res.x) + "x" + str(res.y))
		
		
func _on_resolution_selected(index: int):
	var selected_res = resolutions[index]
	print("Cambiando a: ", selected_res)
	
	# Cambia finestra
	DisplayServer.window_set_size(selected_res)
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	
	# Salva
	save_resolution(selected_res)
	
func save_resolution(res: Vector2i):
	var settings = {"resolution": [res.x, res.y]}
	var file = FileAccess.open("user://settings.json", FileAccess.WRITE)
	file.store_string(JSON.stringify(settings))
