class_name Enemy
extends CharacterBody2D
## Enemy node

@onready var movement_path: PathFollow2D = get_parent()

func _physics_process(delta) -> void:
	movement_path.set_progress(movement_path.get_progress() + 100 * delta)

