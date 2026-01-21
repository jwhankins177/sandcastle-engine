extends Area2D

# This is your "Foreign Key". 
# You can drag any .tres card file into this slot in the Inspector.
@export var card_data: CardData

func _ready():
	# In SQL, this is like a Trigger. 
	# When a 'body' enters this area, run the function.
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	# Check if the thing that touched us has our 'apply' method (The Player)
	if body.has_method("apply_card_effect") and card_data != null:
		body.apply_card_effect(card_data)
		
		# Delete the loot from the world so it can't be picked up twice
		# (Godot's version of 'DELETE FROM World WHERE id = self')
		queue_free()
