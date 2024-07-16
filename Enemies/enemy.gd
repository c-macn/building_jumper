class_name Enemy
extends CharacterBody2D
## Enemy node


var bullet = preload('res://bullet.tscn')
var target: Player

@onready var movement_path: PathFollow2D = get_parent()
@onready var bullet_spawner: Marker2D = $BulletSpawner

func _ready() -> void:
	$ShootTimer.timeout.connect(self._shoot)


func _physics_process(delta) -> void:
	movement_path.set_progress(movement_path.get_progress() + 100 * delta)

	# If at the end of the path kill the enemy
	if movement_path.get_progress_ratio() == 1:
		queue_free()


func _shoot() -> void:
	var new_bullet := bullet.instantiate()
	bullet_spawner.add_child(new_bullet)
	bullet_spawner.look_at(target.global_position)
	new_bullet.transform = bullet_spawner.global_transform
	new_bullet.set_rotation(180.0)

