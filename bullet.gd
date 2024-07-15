class_name Bullet
extends Area2D
## Node for the games bullet

func _ready() -> void:
	set_as_top_level(true)
	body_entered.connect(self._on_hit)


func _physics_process(delta: float) -> void:
	position -= transform.y * 100 * delta


func _on_hit(what: CharacterBody2D) -> void:
	print(what)

