extends AudioStreamPlayer

# Pretty much all taken from
# https://github.com/LegionGames/Conductor-Example/blob/master/Scripts/Conductor.gd

const BPM = 140
const BPS = BPM / 60.0
const SPB = 1.0 / BPS
const BARS = 4
const COMPENSATE_FRAMES = 2
const COMPENSATE_HZ = 60.0
const NUM_QUIET_BEATS = 3
const BEAT_INPUT_CUTOFF = SPB / 3.0

onready var sfx = get_node("SFX")

var song_cur_pos = 0.0
var song_cur_beat = 1

var quiet_until_beat = 0

func strsec(secs):
	var s = str(secs)
	if (secs < 10):
		s = "0" + s
	return s


func _process(_delta):
	if !playing:
		return

	song_cur_pos = get_playback_position() + AudioServer.get_time_since_last_mix() - AudioServer.get_output_latency() + (1 / COMPENSATE_HZ) * COMPENSATE_FRAMES

	song_cur_beat = int(floor(song_cur_pos * BPS))
	var seconds = int(song_cur_pos)
	var seconds_total = int(stream.get_length())
	
	if you_are_dummy_bad_at_rhythm():
		volume_db = -10
	else:
		volume_db = 0


func start_music():
	playing = true
	play()
	

# Function for querying how close to a beat you are
func closest_beat(nth):
	var closest = int(round((song_cur_pos * BPS) / nth) * nth) 
	var time_off_beat = abs(closest * SPB - song_cur_pos)
	return Vector2(closest, time_off_beat)
	
	
func play_from_beat(beat, offset):
	play()
	seek(beat * SPB)
	var beats_before_start = offset
	var measure = beat % BARS
	
func you_are_dummy_bad_at_rhythm():
	return song_cur_beat < quiet_until_beat

func on_time():
	if !playing:
		return false
		
	var result = closest_beat(1)
	
	if result[1] > BEAT_INPUT_CUTOFF:
		if not you_are_dummy_bad_at_rhythm():
			sfx.play()
		quiet_until_beat = song_cur_beat + NUM_QUIET_BEATS
	
	return result[1]
	
	# TODO(arjun): implement lmao
