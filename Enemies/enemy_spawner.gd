class_name EnemySpawner
extends Marker2D

var enemies = preload("res://Enemies/enemy.tscn")

var can_spawn := true

func _physics_process(_delta: float) -> void:
	if can_spawn:
		_spawn_enemy()


func _spawn_enemy() -> void:
	can_spawn = false
	var new_enemy := enemies.instantiate()

	# Just hoping the player is the only one
	var player_node := get_parent().find_children("Player")[0]
	new_enemy.target = player_node
	add_child(new_enemy)
	await get_tree().create_timer(2.0).timeout
	can_spawn = true
