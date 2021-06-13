extends Node2D

export var g_obstacle_path: String = ""
export var g_obstacle_path_2: String = ""
export var g_obstacle_path_3: String = ""
export var g_obstacle_path_4: String = ""

var g_spawn_time_ms : float = 1000.0
var g_obstacle_resource = [Resource, Resource, Resource, Resource]
var g_last_spawn_time_ms: int = 0
var g_viewport_width: float = 0
var g_velocity: float = 0.0
var compensation_dist = 100

func _ready():
	g_obstacle_resource = [load(g_obstacle_path), load(g_obstacle_path_2), load(g_obstacle_path_3), load(g_obstacle_path_4)]
	g_viewport_width = get_viewport_rect().size.x

func _process(delta: float) -> void:
	var time_diff = OS.get_system_time_msecs() - g_last_spawn_time_ms
	if time_diff > g_spawn_time_ms:
		var object : Node2D = g_obstacle_resource[randi() % 4].instance()
		get_parent().call_deferred('add_child_below_node', self, object)
		object.position = (Vector2(g_viewport_width + compensation_dist, 100 + randf() * 800))
		object.scale = Vector2(2,2)
		# The 100 is for where the object gets destroyed (see Obstacle.gd)
		object.start((g_viewport_width - 100) / -10.0 * 4)
		g_last_spawn_time_ms = OS.get_system_time_msecs()

func set_velocity(velocity: float):
	g_velocity = velocity

func set_spawn_time(spawn_time_ms: float):
	g_spawn_time_ms = spawn_time_ms
