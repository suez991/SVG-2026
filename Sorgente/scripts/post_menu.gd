extends Node2D

@onready var video2: VideoStreamPlayer = $VideoStreamPlayer2
@onready var audio: AudioStreamPlayer = $Sottofondo

func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	skip()
	pass


func _on_video_stream_player_finished() -> void:
	audio.play()
	video2.play()
	await get_tree().create_timer(3.5).timeout
	Hud.counter_label.hide()
	Hud.counter_label2.hide()
	Hud.counter_label3.hide()
	Hud.show()
	Hud.show_interact("Premi INVIO per saltare")
	Hud.interact_label.show()
	await get_tree().create_timer(45.0).timeout
	Hud.hide()


func _on_video_stream_player_2_finished() -> void:
	Hud.counter_label.show()
	Hud.counter_label2.show()
	Hud.counter_label3.show()
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")

func skip():
	if Input.is_action_just_pressed("ui_accept") and !$VideoStreamPlayer.is_playing():
			_on_video_stream_player_2_finished()
