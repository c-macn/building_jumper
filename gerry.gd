extends CharacterBody3D
class_name Gerry

var bullet = preload('res://pew.tscn')

@onready var bullet_spawner = $BulletSpawner

func _physics_process(delta) -> void:
	velocity.y -= 1.0;
	var h_move = Input.get_axis("move_left", "move_right")
	velocity.x = h_move * 10.0
	move_and_collide(velocity * delta)

	if Input.is_action_just_pressed('ui_accept'):
		var pew = bullet.instantiate()
		bullet_spawner.add_child(pew)

