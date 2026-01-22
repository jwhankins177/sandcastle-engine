extends Area2D

@export var coin_value: int = 1

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	# We check if the 'body' is the player
	if body.name == "Player":
		GameState.add_coins(coin_value)
		# Add a 'Tween' here later for a juice pop effect!
		queue_free()
