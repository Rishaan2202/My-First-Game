extends Area2D
@onready var apple = $AnimatedSprite2D

signal apple_gained()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("apples")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func collected() -> void:
	apple.animation = "collected"
	await get_tree().create_timer(0.3).timeout
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	print(body.name, " collected an apple!")
	if body.is_in_group("player"):
		apple_gained.emit()
	else:
		return	
