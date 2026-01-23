extends Area2D

@export var coin_value: int = 1

func _ready():
	body_entered.connect(_on_body_entered)
	
	# Idle Animation: Make the coin hover up and down slightly
	var tween = create_tween().set_loops()
	tween.tween_property($Sprite2D, "position:y", -5.0, 0.6).as_relative().set_trans(Tween.TRANS_SINE)
	tween.tween_property($Sprite2D, "position:y", 5.0, 0.6).as_relative().set_trans(Tween.TRANS_SINE)

func _on_body_entered(body):
	# 'has_method' is safer than name checks if you decide to rename your Player
	if body.has_method("apply_card_effect"):
		GameState.add_coins(coin_value)
		
		# Simple "Pickup" effect: Grow and fade out
		set_deferred("monitoring", false) # Prevent double-pickup
		var tween = create_tween()
		tween.tween_property(self, "scale", Vector2(1.5, 1.5), 0.1)
		tween.tween_property(self, "modulate:a", 0.0, 0.1)
		tween.finished.connect(queue_free)
