extends Node2D

@onready var mat = $DesaturatorRect.material
@onready var cam_player: Camera2D = get_node("Janitor/Camera2D")


func _ready():
	Hud.show()
	GameManager.armadietti = 0
	GameManager.porte = 0
	GameManager.sedie = 0
	pass



func _process(delta: float) -> void:
	pass


func _on_janitor_hit() -> void:
	Hud.hide()
	mat.set_shader_parameter("effect_amount", 1.0)
	$Musiche/ChaseTheme.pitch_scale = 0.4
	Engine.time_scale = 0.05
	get_tree().paused
	await get_tree().create_timer(4 * Engine.time_scale).timeout
	Engine.time_scale = 1
	mat.set_shader_parameter("effect_amount", 0.0)
	get_tree().change_scene_to_file("res://Scenes/GameOver Menu.tscn")
	
