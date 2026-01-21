extends Node2D

func _ready():
	# This script is now just a 'Level Manager'
	# Use it for things that affect the WHOLE level
	print("Welcome to the Dungeon.")
	
	# You could use this to play background music or trigger a cutscene
	# But the card pickup logic is now handled by the objects themselves!
