extends Node2D


func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	skip()
	pass


func _on_video_stream_player_finished() -> void:
	get_tree().change_scene_to_file("res://Scenes/Main Menu.tscn")

func skip():
	if Input.is_action_just_pressed("ui_accept"):
			_on_video_stream_player_finished()
