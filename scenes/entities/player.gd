extends CharacterBody2D

var base_speed: float = 200.0
var current_speed: float = 200.0

func _physics_process(_delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * current_speed
	move_and_slide()

func apply_card_effect(card: CardData):
	# Using 'match' (Godot's version of Python 3.10's 'match' statement)
	# This is much cleaner than nested If/Else.
	print("Triggering Card: " + card.card_name)
	
	# logic for the speed change
	current_speed = base_speed * card.speed_multiplier
	
	# Wait for the specific duration defined in the .tres file
	await get_tree().create_timer(card.duration).timeout
	
	# Reset to baseline
	current_speed = base_speed
	print("Effect worn off.")
