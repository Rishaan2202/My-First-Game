extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var jump_sound = $AudioStreamPlayer2D

const SPEED = 300.0
const JUMP_VELOCITY = -950.0

var is_dead: bool = false

func death_animation() -> void:
	is_dead = true
	velocity = Vector2.ZERO
	animated_sprite_2d.animation = "hit"
	await get_tree().create_timer(1.5).timeout
	queue_free()

func _physics_process(delta: float) -> void:
	
	#Return if Player is dead already
	if is_dead:
		return
	
	# Add animations
	if velocity.x > 1 or velocity.x < -1:
		animated_sprite_2d.animation = "run"
	else:
		animated_sprite_2d.animation = "idle"				
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump_sound.play()
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("left", "right")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if direction == -1:
		animated_sprite_2d.flip_h = true
	elif direction == 1:
		animated_sprite_2d.flip_h = false	
	
	move_and_slide()
