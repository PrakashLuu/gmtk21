extends Node2D

func _ready():
	var bpm: float = float($Conductor.get_bpm())
	var viewport_width: float = get_viewport_rect().size.x
	var velocity = -1.5
	var ms_per_beat = 60000.0 / bpm
	
	$Conductor.start_music()
	$ObstacleLayer/Spawner.set_velocity(velocity * 40)
	$ObstacleLayer/Spawner.set_spawn_time(ms_per_beat * 1)
	
	# There's almost certainly a better way to do a parallax, but here's my bad implementation
	$WorldLayer/HighCloud1.set_velocity(velocity * 0.5)
	$WorldLayer/HighCloud2.set_velocity(velocity * 0.5)
	$WorldLayer/LowCloud1.set_velocity(velocity * 0.66)
	$WorldLayer/LowCloud2.set_velocity(velocity * 0.66)
	$WorldLayer/Hills1.set_velocity(velocity * 0.83)
	$WorldLayer/Hills2.set_velocity(velocity * 0.83)
	$WorldLayer/Foreground1.set_velocity(velocity)
	$WorldLayer/Foreground2.set_velocity(velocity)
