extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Conductor.start_music()
	pass # Replace with function body.
	
	
func _input(event):
	if event.is_action_pressed("ui_down"):
		var time = $Conductor.on_time()
		$Label.text = str(time)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
