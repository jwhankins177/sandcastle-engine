extends Node2D

func _ready():
	# This is a more manual way to grab the node. 
	# It will print a specific error if it can't find it.
	var player = get_node_or_null("Player")
	
	if player == null:
		print("CRITICAL ERROR: I am looking for a child named 'Player' but I don't see one.")
		print("My current children are: ", get_children())
		return # Stop the script so it doesn't crash
		
	print("Player found! Systems nominal.")
	
	# Rest of your logic...
	await get_tree().create_timer(3.0).timeout
	var speed_buff = load("res://resources/cards/speed_boost.tres")
	
	if speed_buff is CardData:
		player.apply_card_effect(speed_buff)
