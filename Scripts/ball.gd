extends CharacterBody2D

const SPEED = 300
var velocity_bounce_multiplier: float = 1.1
@onready var ball_trail: Sprite2D = $BallTrail

func launch(direction):
	velocity = direction*sign(randf_range(-1,1))*SPEED

func _ready():
	print(global_position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	ball_trail.rotation = velocity.angle() + PI/4
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		if collision.get_collider().is_in_group("paddle"):
			velocity *= velocity_bounce_multiplier
