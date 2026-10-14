extends Node
@onready var sound = $bgSound
@onready var enemy_node: Area2D = $enemy
@onready var player = $player
@onready var apple: Area2D = $apple
@onready var apple1: Area2D = $apple1
@onready var apple2: Area2D = $apple2

var gained_apples: int = 0
signal score(points: int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sound.play()	

func handleDie() -> void:
	if player.has_method("death_animation"):
		player.death_animation()
	print("Player Died")			

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
