extends CharacterBody2D

@export var speed : float = 100.0

@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite

var direction : Vector2 = Vector2.ZERO

func _physics_process(delta):

	# Move the character.
	#look_at(get_global_mouse_position())
	direction = Input.get_vector("player_0_left", "player_0_right", "player_0_up", "player_0_down")
	velocity = direction * speed
	
	#velocity = transform.x * direction * speed
	
	move_and_slide()
	update_animation()
	update_facing_direction()

func update_animation():
	if direction.x or direction.y != 0:
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")

func update_facing_direction():
	if direction.x > 0:
		animated_sprite.flip_h = false
	elif direction.x < 0:
		animated_sprite.flip_h = true
