extends Node
@onready var sound = $bgSound
@onready var enemy_node: Area2D = $enemy
@onready var player = $player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sound.play()
	if enemy_node:
		enemy_node.player_died.connect(handleDie)
		

func handleDie() -> void:
	if player.has_method("death_animation"):
		player.death_animation()
	print("Player Died")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
