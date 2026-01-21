extends CharacterBody2D

# Python equivalent: Constants
const BASE_SPEED = 200.0

# State variables
var current_speed = BASE_SPEED

func _physics_process(_delta):
	# Input.get_vector handles the math for 8-way movement (normalization)
	# so you don't move faster diagonally.
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# Apply the vector to the built-in velocity variable
	velocity = direction * current_speed
	
	# Move and Slide uses the velocity variable automatically
	move_and_slide()

# This is our 'API' for the player to receive card effects
func apply_card_effect(data: CardData):
	print("Activating: " + data.card_name)
	current_speed = BASE_SPEED * data.speed_multiplier
	
	# Wait for the duration defined in the SQL-like resource
	await get_tree().create_timer(data.duration).timeout
	
	# Reset state
	current_speed = BASE_SPEED
	print("Effect expired.")
