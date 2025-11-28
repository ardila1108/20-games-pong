extends CharacterBody2D


const SPEED = 300.0
@export var paddle_ID: Global.player_enum = Global.player_enum.Player1
var speed: int = 10
var horizontal_margin: int = 25
@onready var paddle_sprite: Sprite2D = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(str(paddle_ID))
	if paddle_ID == 1:
		paddle_sprite.texture = load("res://Sprites/Player.png")
		global_position.x = horizontal_margin
		reset()
	elif paddle_ID == 2:
		paddle_sprite.texture = load("res://Sprites/Computer.png")
		global_position.x = get_viewport_rect().size.x - horizontal_margin
		reset()
	else:
		printerr("The Paddle ID needs to be assigned to 1 or 2")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var direction := Input.get_axis("p" + str(paddle_ID) + "_up", "p" + str(paddle_ID) + "_down")
	global_position.y += direction*SPEED*_delta
	
	global_position.y = clamp(global_position.y, 62, get_viewport_rect().size.y - 62)

func reset():
	global_position.y = get_viewport_rect().size.y/2
