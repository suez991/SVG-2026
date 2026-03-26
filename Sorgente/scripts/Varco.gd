extends StaticBody2D

@export var open: bool = false
@onready var porta_aperta = $Aperta
@onready var porta_chiusa = $Chiusa
@onready var interact_area = $InteractArea
@onready var audio_player: AudioStreamPlayer = $FixSound
@onready var player = get_node("/root/Game/Janitor")
@onready var cam = $CameraVarco



var player_inside = false
var completed = false

func _ready():
	interact_area.body_entered.connect(_on_body_entered)
	interact_area.body_exited.connect(_on_body_exited)
	preload("res://Assets/Audio/Sistema Porta_m.mp3")
	

func _on_body_entered(body):
	if body.is_in_group("player") and not open:
		player_inside = true
		Hud.show_interact("La Porta è bloccata")

	if body.is_in_group("player") and open:
		Hud.hide()
		get_tree().change_scene_to_file("res://Scenes/vittoria.tscn")
		pass

func _on_body_exited(body):
	if body.is_in_group("player"):
		player_inside = false
		Hud.hide_interact()
		

func _process(delta):
	if (GameManager.armadietti == 10 and 
		GameManager.porte == 5 and 
		GameManager.sedie == 8 and not open):
		open = true  
		fix_object()

	if GameManager.checkvarco :
		GameManager.armadietti = 10
		GameManager.porte = 5
		GameManager.sedie =  8
		
		
func fix_object():
	
	player.cam_off()
	cam.enabled = true
	await get_tree().create_timer(1.0).timeout
	audio_player.play()
	porta_chiusa.visible = false  
	porta_aperta.visible = true  
	await get_tree().create_timer(2.0).timeout
	player.cam_on()
	cam.enabled = false
	open = true
		
	
