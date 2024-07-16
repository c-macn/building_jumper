class_name Player
extends CharacterBody2D
## Node for the player character

var bullet = preload('res://bullet.tscn')
var can_fire := true

@onready var bullet_spawners: Array[Marker2D] = [$BulletSpawnerLeft, $BulletSpawnerRight]

func _physics_process(delta: float) -> void:
	var input_force := Input.get_vector('ui_left', 'ui_right', 'ui_up', 'ui_down')
	input_force.y = 0
	velocity = input_force * 100.0
	move_and_collide(velocity * delta)


func _input(_event: InputEvent) -> void:
	if can_fire:
		if Input.is_action_pressed('ui_accept'):
			fire_bullet()
	return


func fire_bullet() -> void:
	can_fire = false
	_spawn_bullet(bullet_spawners[0])
	await get_tree().create_timer(0.2).timeout
	_spawn_bullet(bullet_spawners[1])
	await get_tree().create_timer(0.5).timeout
	can_fire = true


func _spawn_bullet(bullet_spawner: Marker2D) -> void:
	var new_bullet = bullet.instantiate()
	owner.add_child(new_bullet)
	new_bullet.transform = bullet_spawner.global_transform
	
