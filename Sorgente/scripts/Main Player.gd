extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D
@export var SPEED = 300.0

@onready var footsteps = $FootstepsPlayer
@onready var cam = $Camera2D
var was_moving = false
signal hit


func _physics_process(delta):
	var movement =Vector2()

	if Input.is_action_pressed("ui_left") || Input.is_action_pressed("ui_right"):
		movement.x = Input.get_axis("ui_left", "ui_right")
		
	if Input.is_action_pressed("ui_a") || Input.is_action_pressed("ui_d"):
		movement.x = Input.get_axis("ui_a", "ui_d")
		
	if Input.is_action_pressed("ui_up") || Input.is_action_pressed("ui_down"):
		movement.y = Input.get_axis("ui_up", "ui_down")
	
	if Input.is_action_pressed("ui_w") || Input.is_action_pressed("ui_s"):
		movement.y = Input.get_axis("ui_w", "ui_s")
	
	movement = movement.normalized()
	if movement != Vector2.ZERO:
		$RayCast2D.target_position = movement * 32
	
	
	update_animation(movement)
	
	velocity = movement * SPEED
	
	var is_moving_now = movement.length() > 0.1  

	if is_moving_now and not was_moving:
		footsteps.play()  
	elif not is_moving_now and was_moving:
		footsteps.stop()  

	was_moving = is_moving_now
	
	move_and_slide()
	
func get_direction_as_string():
	var dir = $RayCast2D.target_position
	if dir.x > 0:
		sprite.scale.x = 0.2
		sprite.scale.y = 0.2
		sprite.flip_h = false
		return "Right"
	if dir.x < 0:
		sprite.scale.x = 0.2
		sprite.scale.y = 0.2
		sprite.flip_h = true
		return "Right"
	if dir.y > 0:
		sprite.scale.x = 0.2
		sprite.scale.y = 0.2
		sprite.flip_h = false
		return "Down"
	if dir.y < 0:
		sprite.flip_h = false
		sprite.scale.x = 0.25
		sprite.scale.y = 0.25
		return "Up"
	
func update_animation(movement):
	if movement != Vector2.ZERO:
		$AnimatedSprite2D.play("Walk" + get_direction_as_string())
	else:
		$AnimatedSprite2D.play("Idle" + get_direction_as_string())

		
	var collision = get_last_slide_collision()
	if collision:
		if collision.get_collider() is CharacterBody2D:
			hit.emit()
			

func cam_off():
	cam.enabled = false
	
func cam_on():
	cam.enabled = true
