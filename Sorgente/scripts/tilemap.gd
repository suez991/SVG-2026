extends TileMap

@onready var interact_Jroom = $InteractAreas/InteractJroom
@onready var interact_Bagni = $InteractAreas/InteractBagni
@onready var interact_Mensa = $InteractAreas/InteractMensa
@onready var interact_uff = $InteractAreas/InteractUff
@onready var interact_aa = $InteractAreas/InteractAulaA
@onready var interact_ab = $InteractAreas/InteractAulaB
@onready var interact_ac = $InteractAreas/InteractAulaC
@onready var interact_ad = $InteractAreas/InteractAulaD

var player_inside = false

func _ready() -> void:
	interact_Jroom.body_entered.connect(_on_body_entered_Jroom)
	interact_Jroom.body_exited.connect(_on_body_exited_Jroom)
	interact_Bagni.body_entered.connect(_on_body_entered_Bagni)
	interact_Bagni.body_exited.connect(_on_body_exited_Bagni)
	interact_Mensa.body_entered.connect(_on_body_entered_Mensa)
	interact_Mensa.body_exited.connect(_on_body_exited_Mensa)
	interact_Mensa.body_entered.connect(_on_body_entered_Mensa)
	interact_Mensa.body_exited.connect(_on_body_exited_Mensa)
	interact_uff.body_entered.connect(_on_body_entered_uff)
	interact_uff.body_exited.connect(_on_body_exited_uff)
	interact_aa.body_entered.connect(_on_body_entered_aa)
	interact_aa.body_exited.connect(_on_body_exited_aa)
	interact_ab.body_entered.connect(_on_body_entered_ab)
	interact_ab.body_exited.connect(_on_body_exited_ab)
	interact_ac.body_entered.connect(_on_body_entered_ac)
	interact_ac.body_exited.connect(_on_body_exited_ac)
	interact_ad.body_entered.connect(_on_body_entered_ad)
	interact_ad.body_exited.connect(_on_body_exited_ad)
	pass # Replace with function body.


func _process(delta: float) -> void:
	pass
	
func _on_body_entered_Jroom(body):
	if body.is_in_group("player"):
		player_inside = true
		Hud.show_interact("Stanza Custode")
		await get_tree().create_timer(2.0).timeout
		Hud.hide_interact()
func _on_body_exited_Jroom(body):
	if body.is_in_group("player"):
		player_inside = false
		Hud.hide_interact()
		
func _on_body_entered_Bagni(body):
	if body.is_in_group("player"):
		player_inside = true
		Hud.show_interact("Bagni")
		await get_tree().create_timer(2.0).timeout
		Hud.hide_interact()
func _on_body_exited_Bagni(body):
	if body.is_in_group("player"):
		player_inside = false
		Hud.hide_interact()
		
func _on_body_entered_Mensa(body):
	if body.is_in_group("player"):
		player_inside = true
		Hud.show_interact("Mensa")
		await get_tree().create_timer(2.0).timeout
		Hud.hide_interact()
func _on_body_exited_Mensa(body):
	if body.is_in_group("player"):
		player_inside = false
		Hud.hide_interact()

func _on_body_entered_uff(body):
	if body.is_in_group("player"):
		player_inside = true
		Hud.show_interact("Ufficio Preside")
		await get_tree().create_timer(2.0).timeout
		Hud.hide_interact()
func _on_body_exited_uff(body):
	if body.is_in_group("player"):
		player_inside = false
		Hud.hide_interact()

func _on_body_entered_aa(body):
	if body.is_in_group("player"):
		player_inside = true
		Hud.show_interact("Aula A")
		await get_tree().create_timer(2.0).timeout
		Hud.hide_interact()
func _on_body_exited_aa(body):
	if body.is_in_group("player"):
		player_inside = false
		Hud.hide_interact()

func _on_body_entered_ab(body):
	if body.is_in_group("player"):
		player_inside = true
		Hud.show_interact("Aula B")
		await get_tree().create_timer(2.0).timeout
		Hud.hide_interact()
func _on_body_exited_ab(body):
	if body.is_in_group("player"):
		player_inside = false
		Hud.hide_interact()

func _on_body_entered_ac(body):
	if body.is_in_group("player"):
		player_inside = true
		Hud.show_interact("Aula C")
		await get_tree().create_timer(2.0).timeout
		Hud.hide_interact()
func _on_body_exited_ac(body):
	if body.is_in_group("player"):
		player_inside = false
		Hud.hide_interact()

func _on_body_entered_ad(body):
	if body.is_in_group("player"):
		player_inside = true
		Hud.show_interact("Aula D")
		await get_tree().create_timer(2.0).timeout
		Hud.hide_interact()
func _on_body_exited_ad(body):
	if body.is_in_group("player"):
		player_inside = false
		Hud.hide_interact()
