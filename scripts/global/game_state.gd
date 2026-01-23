#extends Node
#
## Must be outside any func
#var coins: int = 0 
#
#func add_coins(amount: int):
	#coins += amount
	#print("Total Coins: ", coins)
extends Node

var coins: int = 10

func can_afford(amount: int) -> bool: 
	return coins >= amount
func spend_coins(amount: int): 
	coins -= amount 
	print("Spent: ", amount, " | Remaining: ", coins)
func add_coins(amount: int): 
	coins += amount 
	print("Total Coins: ", coins)
