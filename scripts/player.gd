extends CharacterBody2D

@export var speed : float = 10.0

@onready var animated_sprite : AnimatedSprite2D = $s

# Get the gravity from the project settings to be synced with RigidBody nodes.

var animation_locked : bool = false
var direction : Vector2 = Vector2.ZERO

func _physics_process(delta):
	# Add the gravity.


	# Check if the character is pressing the jump button.
	

	# Check if the character is pressing the double jump button.
	

	# Move the character.
	direction = Input.get_vector("player_0_left", "player_0_right", "player_0_up", "player_0_down")

	if direction.x != 0 && animated_sprite.animation != "jump_end":
		velocity.x = direction.x * speed
		velocity.y = direction.y * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)

	move_and_slide()
	update_animation()
	update_facing_direction()

func update_animation():
	if not animation_locked:
			if direction.x && direction.y != 0:
				animated_sprite.play("run")
			else:
				animated_sprite.play("idle")

func update_facing_direction():
	if direction.x > 0:
		animated_sprite.flip_h = false
	elif direction.x < 0:
		animated_sprite.flip_h = true
