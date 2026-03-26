extends StaticBody2D

@export var fixed: bool = false
@onready var porta_aperta = $Aperta
@onready var porta_chiusa = $Chiusa
@onready var interact_area = $InteractArea
@onready var fix_sound: AudioStreamPlayer = $FixSound


var player_inside = false

func _ready():
	interact_area.body_entered.connect(_on_body_entered)
	interact_area.body_exited.connect(_on_body_exited)
	

func _on_body_entered(body):
	if body.is_in_group("player") and not fixed:
		player_inside = true
		Hud.show_interact("Premi [E] per sistemare")

func _on_body_exited(body):
	if body.is_in_group("player"):
		player_inside = false
		Hud.hide_interact()
		
func _process(delta):
	if player_inside and not fixed and Input.is_action_just_pressed("interact"):
		fix_object()

func fix_object():
	fixed = true
	GameManager.porte += 1  
	GameManager.fixed_changed.emit()
	fix_sound.play()
	Hud.show_fix("Sistemato!")
	porta_aperta.visible = false
	porta_chiusa.visible = true  
	await get_tree().create_timer(1.0).timeout
	interact_area.monitoring = false  
	await get_tree().create_timer(2.0).timeout
	Hud.hide_fix()
