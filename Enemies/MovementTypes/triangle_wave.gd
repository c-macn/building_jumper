class_name TriangleWaveMovement
extends MovementType
## Enables the enemy unit to move in a zig zag pattern using the triangle wave formula

@export var amplitude: float = 100.0
@export var period: float = 2.0


func _triangle_movement(time: float) -> float:
	return 2.0 * abs(2.0 * (time - floor(time + 0.5))) -1.0


func get_movement_vector(speed: float, delta: float) -> Vector2:
	var time := fmod(Time.get_ticks_msec() / 1000.0, period)
	var wave_value := _triangle_movement(time / period)
	return Vector2(speed * delta, amplitude * wave_value)
