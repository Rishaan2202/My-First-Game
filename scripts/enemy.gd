extends Area2D
@onready var enemy = $AnimatedSprite2D

signal player_died()

var direction = -1.0
var speed = 50.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	while true:
		if direction == -1:
			enemy.flip_h = false
		else:
			enemy.flip_h = true	
		await get_tree().create_timer(2.0).timeout
		direction = -direction
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += direction * speed * delta


func _on_body_entered(body: Node2D) -> void:
	print(body.name, " touched the enemy!")
	if body.is_in_group("player"):
		player_died.emit()
	else:
		return	
