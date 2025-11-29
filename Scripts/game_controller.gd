extends Node2D
var ball: PackedScene = load("res://Scenes/ball.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void: # Replace with function body.
	start_game()

func start_game():
	start_round()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func check_scores():
	if Global.P1_score == Global.max_score:
		end_game("Player 1")
	if Global.P2_score == Global.max_score:
		end_game("Player 2")

func start_round():
	check_scores()
	_spawn_ball()

func _spawn_ball():
	var new_ball = ball.instantiate()
	new_ball.global_position = get_viewport_rect().size / 2
	var direction: Vector2 = Vector2.from_angle(randf_range(-PI/4, PI/4))
	new_ball.launch(direction*sign(randf_range(-1,1)))
	get_tree().root.get_child(1).add_child(new_ball)

func end_game(winner: String):
	print(winner + " Wins!")
