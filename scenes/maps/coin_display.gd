extends Label

func _process(_delta):
	# This is the 'Quick & Dirty' way: update every frame.
	# Later, we'll use Signals for better performance (The 'Observer' pattern).
	text = "Coins: " + str(GameState.coins)
