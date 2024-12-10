class_name Enemy
extends CharacterBody2D
## Enemy node

@export var movement_type: MovementType

var bullet = preload('res://Munitions/bullet.tscn')
var target: Player

@onready var bullet_spawner: Marker2D = $BulletSpawner

func _ready() -> void:
	$ShootTimer.timeout.connect(self._shoot)


func _physics_process(delta: float) -> void:
	velocity = movement_type.get_movement_vector(100.0, delta)
	move_and_collide(velocity * delta)


func _shoot() -> void:
	var new_bullet := bullet.instantiate()
	bullet_spawner.add_child(new_bullet)
	bullet_spawner.look_at(target.global_position)
	new_bullet.transform = bullet_spawner.global_transform
	new_bullet.set_rotation(180.0)

