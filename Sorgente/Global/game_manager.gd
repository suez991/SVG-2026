extends Node

@export var checkvarco = false
signal fixed_changed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


var armadietti = 0
var porte = 0
var sedie = 0

func object_fixed():
	
	GameManager.armadietti += 1
	GameManager.fixed_changed.emit(GameManager.armadietti)

func object_fixed2():

	GameManager.porte += 1
	GameManager.fixed_changed.emit(GameManager.porte)


func object_fixed3():

	GameManager.sedie += 1
	GameManager.fixed_changed.emit(GameManager.sedie)
