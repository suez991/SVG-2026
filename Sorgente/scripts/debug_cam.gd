extends Camera2D

@export var move_speed = 500.0
@export var zoom_speed = 0.1
var drag_start = Vector2()
var dragging = false

func _input(event):
	# WASD movimento
	if Input.is_action_pressed("ui_w"):
		position.y -= move_speed * get_process_delta_time()
	if Input.is_action_pressed("ui_s"):
		position.y += move_speed * get_process_delta_time()
	if Input.is_action_pressed("ui_a"):
		position.x -= move_speed * get_process_delta_time()
	if Input.is_action_pressed("ui_d"):
		position.x += move_speed * get_process_delta_time()
	
	# Zoom mouse wheel
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			zoom += Vector2(zoom_speed, zoom_speed)
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			zoom -= Vector2(zoom_speed, zoom_speed)
	
	# Drag middle mouse
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_MIDDLE:
			dragging = event.pressed
			if dragging:
				drag_start = event.position
	elif event is InputEventMouseMotion and dragging:
		position -= (event.position - drag_start) / zoom
		drag_start = event.position
