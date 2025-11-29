extends Area2D
@export var paddle_ID: Global.player_enum = Global.player_enum.Player1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("ball"):
		if paddle_ID == 2:
			Global.P1_score += 1
		else:
			Global.P2_score += 1
		body.queue_free()
		owner.start_round()
