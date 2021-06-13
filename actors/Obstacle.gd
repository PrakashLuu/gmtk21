extends StaticBody2D

var g_velocity: float = 0.0

func _process(delta: float) -> void:
	position.x += g_velocity * delta
	# Destroy object at 100 for now
	if position.x < 100:
		get_parent().remove_child(self)
		queue_free()

func start(velocity: float) -> void:
	g_velocity = velocity
