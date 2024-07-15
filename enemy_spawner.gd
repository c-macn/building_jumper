class_name EnemySpawner
extends Marker2D

var enemies = preload("res://enemy.tscn")
var path = preload("res://looper_path.tscn")

var can_spawn := true

func _physics_process(_delta: float) -> void:
	if can_spawn:
		_spawn_enemy()


func _spawn_enemy() -> void:
	can_spawn = false
	var new_path := path.instantiate()
	var new_enemy := enemies.instantiate()

	# Just hoping the player is the only one
	var player_node := get_parent().find_children("Player")[0]
	new_enemy.target = player_node

	# TODO: Create a dynamic way to assign paths
	add_child(new_path)
	new_path.get_child(0).add_child(new_enemy)
	await get_tree().create_timer(2.0).timeout
	can_spawn = true
