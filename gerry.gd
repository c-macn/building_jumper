extends CharacterBody3D
class_name Gerry

@onready var path_follow: PathFollow3D = get_parent();

var bullet = preload('res://pew.tscn')

@onready var bullet_spawner = $BulletSpawner

func _physics_process(delta) -> void:
	if path_follow != null:
		path_follow.set_progress(path_follow.get_progress() + 2.5 * delta)

	if Input.is_action_just_pressed('ui_accept'):
		var pew = bullet.instantiate()
		bullet_spawner.add_child(pew)

