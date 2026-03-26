extends CanvasLayer

@onready var interact_label = $InteractLabel
@onready var fix_label = $FixLabel
@onready var counter_label = $CounterLabel
@onready var counter_label2 = $CounterLabel2
@onready var counter_label3 = $CounterLabel3

func _ready():
	GameManager.fixed_changed.connect(update_counter)
	
func _process(delta):
	counter_label.text = "Armadietti Sistemati: %d/10" % GameManager.armadietti
	counter_label2.text = "Porte Sistemate: %d/5" % GameManager.porte
	counter_label3.text = "Sedie Sistemate: %d/8" % GameManager.sedie
	
	
	
func update_counter():
	counter_label.text = "Armadietti Sistemati: %d/10" % GameManager.armadietti
	counter_label2.text = "Porte Sistemate: %d/5" % GameManager.porte
	counter_label3.text = "Sedie Sistemate: %d/8" % GameManager.sedie
		

func show_fix(text: String):
	fix_label.text = text
	fix_label.visible = true

func hide_fix():
	fix_label.visible = false

func show_interact(text: String):
	interact_label.text = text
	interact_label.visible = true

func hide_interact():
	interact_label.visible = false
