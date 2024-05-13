extends Area3D
class_name Bullet

func _ready() -> void:
	body_entered.connect(_on_body_entered)


func _process(delta) -> void:
	position += Vector3.UP * 100.0 * delta
	print(position)


func _on_body_entered(body) -> void:
	body.queue_free()
	queue_free()
