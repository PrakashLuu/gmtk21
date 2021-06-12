extends Node

var BPM = 140
var BARS = 4
var playing = false
const COMPENSATE_FRAMES = 2
const COMPENSATE_HZ = 60.0

func strsec(secs):
	var s = str(secs)
	if (secs < 10):
		s = "0" + s
	return s


func _process(_delta):
	if !playing or !$Player.playing:
		return

	var time = $Player.get_playback_position() + AudioServer.get_time_since_last_mix() - AudioServer.get_output_latency() + (1 / COMPENSATE_HZ) * COMPENSATE_FRAMES

	var beat = int(time * BPM / 60.0)
	var seconds = int(time)
	var seconds_total = int($Player.stream.get_length())


func play_sound():
	playing = true
	$Player.play()
	

func on_time():
	if !playing:
		return false
	
	# TODO(arjun): implement lmao
