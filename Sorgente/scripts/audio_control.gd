extends HSlider

@export var audio_bus_name: String
@export var audio_bus_name2: String
@export var audio_bus_name3: String = "SFX"
@export var audio_bus_name4: String = "SFX2"

var audio_bus_id
var audio_bus_id2
var audio_bus_id3
var audio_bus_id4

func _ready() -> void:
	audio_bus_id = AudioServer.get_bus_index(audio_bus_name)
	audio_bus_id2 = AudioServer.get_bus_index(audio_bus_name2)
	audio_bus_id3 = AudioServer.get_bus_index(audio_bus_name3)
	audio_bus_id4 = AudioServer.get_bus_index(audio_bus_name4)
	pass # Replace with function body.


func _process(delta: float) -> void:
	pass


func _on_value_changed(value: float) -> void:
	var db = linear_to_db(value)
	AudioServer.set_bus_volume_db(audio_bus_id, db)
	pass # Replace with function body.

func _on_audio_control_2_value_changed(value: float) -> void:
	var db = linear_to_db(value)
	AudioServer.set_bus_volume_db(audio_bus_id2, db)
	pass # Replace with function body.


func _on_audio_control_3_value_changed(value: float) -> void:
	var db = linear_to_db(value)
	AudioServer.set_bus_volume_db(audio_bus_id3, db)
	AudioServer.set_bus_volume_db(audio_bus_id4, db)
	pass # Replace with function body.
