extends CharacterBody2D

@export var chase_speed = 150.0
@export var patrol_speed = 80.0
@export var detect_radius = 100.0
var player = null
var patrol_timer = 0.0
var patrol_dir = Vector2.RIGHT

@onready var sprite = $AnimatedSprite2D 
@onready var detect_area = $DetectArea
@onready var collision_shape = $DetectArea/CollisionShape2D

@onready var sfx_player: AudioStreamPlayer = $SFXPlayer

@onready var chase = $"../Musiche/MainTheme"
@onready var main = $"../Musiche/ChaseTheme"

@onready var footsteps = $SFXPlayer/FootstepsPlayer

var was_moving = false
var is_moving = false
var footsteps_playing = false
var patrol_wait_time = 0.0



var villain_sounds = [
	preload("res://Assets/Audio/Villain Talk 1.mp3"),
	preload("res://Assets/Audio/Villain laughing.wav"), 
	preload("res://Assets/Audio/Villain shout.wav")
]

var sfx_timer = 0.0
var sfx_cooldown = 3.0  

var current_anim = ""  

func _ready():
	collision_shape.shape.radius = detect_radius
	randomize()
	
func _physics_process(delta):
	var direction = Vector2.ZERO
		
	if player and detect_area.overlaps_body(player):
		direction = (player.global_position - global_position).normalized()
		velocity = direction * chase_speed
		if not footsteps_playing:
			footsteps.play()
		
	else:

		patrol_timer += delta
		
		var num = float(randi_range(7, 20))

		if patrol_timer > num: 
			patrol_dir = pick_random_dir()
			patrol_wait_time = 0.0
			num = float(randi_range(7, 20))
			patrol_timer = 0.0

		patrol_wait_time += delta
		if patrol_wait_time > 1.5:  
			direction = patrol_dir
		else:
			direction = Vector2.ZERO  

		velocity = direction * patrol_speed

	
	if player and detect_area.overlaps_body(player):
		sfx_timer += delta
		if sfx_timer > sfx_cooldown:
			play_villain_sound()
			sfx_timer = 0.0
			sfx_cooldown = randf_range(2.5, 4.5)  
	
	
	
	
	if player and detect_area.overlaps_body(player):
		if chase.playing:
			chase.stop()
		if not main.playing:
			main.play()
			
	else:
		if main.playing:
			main.stop()
		if not chase.playing:
			chase.play()
			
	
	
	move_and_slide()
	handle_footsteps(delta)
	
	var moving = velocity.length() > 5.0
	
	if moving:
		if not footsteps_playing:
			footsteps.play()
			footsteps_playing = true
	else:
		if footsteps_playing:
			footsteps.stop()
			footsteps_playing = false
	
	if moving:
		update_animation_proper(velocity.normalized())
	else:
		sprite.play("Idle")
	
func handle_footsteps(delta):

	is_moving = velocity.length() > 10.0
	
	
	if is_moving and not footsteps_playing:
		footsteps.play()
		footsteps_playing = true
	elif not is_moving and footsteps_playing:
		print("stop")
		footsteps.stop()  # STOP netto
		footsteps_playing = false 



func play_villain_sound():
	sfx_player.stream = villain_sounds[randi() % villain_sounds.size()]
	sfx_player.play()


func update_animation_proper(direction: Vector2):
	if velocity.length() < 10:
		if current_anim != "Idle":
			sprite.play("Idle")
			current_anim = "Idle"
		return
	
	if abs(velocity.x) > abs(velocity.y):  
		sprite.play("WalkRight")
		sprite.flip_h = velocity.x < 0
		sprite.flip_v = false
	elif direction.y < 0:
		sprite.play("WalkUp")
		sprite.flip_h = false
	else:
		sprite.play("WalkDown")
		sprite.flip_h = false

	
	current_anim = sprite.animation 

func pick_random_dir() -> Vector2:
	var dirs = [Vector2.RIGHT, Vector2.LEFT, Vector2.DOWN, Vector2.UP]
	return dirs[randi() % dirs.size()]

# Segnali
func _on_detect_area_body_entered(body):
	if body.is_in_group("player"):
		player = body
		print("Villain AGGRO!")

func _on_detect_area_body_exited(body):
	if body == player:
		player = null
		print("Villain CALMO")
