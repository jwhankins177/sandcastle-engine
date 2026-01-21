extends Resource
# This line registers 'CardData' as a global class, making it a selectable data type.
class_name CardData

# @export makes these variables visible in the Godot Inspector (The GUI).
@export var card_name: String = "Speed Boost"
@export var speed_multiplier: float = 2.0
@export var duration: float = 5.0 # How long the buff lasts
