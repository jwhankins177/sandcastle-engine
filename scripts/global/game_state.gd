extends Node

# This is your 'Global Table'. 
# Any script in the game can access this by typing 'GameState.coins'
var coins: int = 0

func add_coins(amount: int):
	coins += amount
	print("Coins Total: ", coins)
	# Later, we will add a 'Signal' here to tell the UI to update
