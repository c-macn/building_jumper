class_name MovementType
extends Resource
## Base resource used to define the different types of movement enemies and bosses can use


func get_movement_vector(_speed: float, _delta: float) -> Vector2:
	print("This is the base class. please use a child")
	return Vector2.ZERO

