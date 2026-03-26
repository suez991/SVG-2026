extends Control

var is_paused = false

func _ready() -> void:
	visible = false
	process_mode = Node.PROCESS_MODE_ALWAYS



func _process(delta: float) -> void:
	testEsc()
	pass

func testEsc():
	if Input.is_action_just_pressed("esc") and !get_tree().paused:
		pause()
		print("Prova 1")

	elif Input.is_action_just_pressed("esc") and get_tree().paused:
		resume()
		print("Prova 2")

func resume():
	$AnimationPlayer.play_backwards("blur")
	await $AnimationPlayer.animation_finished
	visible = false
	get_tree().paused = false
	is_paused = false

func pause():
	get_tree().paused = true
	visible = true
	$AnimationPlayer.play("blur")
	is_paused = true


func _on_button_3_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/Main Menu.tscn")


func _on_button_4_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")
