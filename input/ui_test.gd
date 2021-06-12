extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var player = get_node("AnimatedSprite")


# Called when the node enters the scene tree for the first time.
func _ready():
	$Conductor.start_music()
	pass # Replace with function body.
	
	
func _input(event):
	if event.is_action_pressed("ui_down"):
		var result = $Conductor.on_time()
		$Label.text = str(result[1])
		
		if result[2]:
			player.play('big sad')


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimatedSprite_animation_finished():
	if player.animation == 'big sad':
		player.play('stand')
