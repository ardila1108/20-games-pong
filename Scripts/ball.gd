extends CharacterBody2D

const SPEED = 300
var velocity_bounce_multiplier: float = 1.1

func launch():
	var direction: Vector2 = Vector2.from_angle(randf_range(-PI/4, PI/4))
	velocity = direction*sign(randf_range(-1,1))*SPEED

func _ready():
	launch()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		if collision.get_collider().is_in_group("paddle"):
			velocity *= velocity_bounce_multiplier
	
