extends AudioStreamPlayer

#var eq = AudioServer.get_bus_effect(1, 0)
#var eq_vars = ["band_db/32_hz", "band_db/100_hz", "band_db/320_hz", "band_db/1000_hz", "band_db/3200_hz", "band_db/10000_hz"]
#var eq_values = [-5, -5, -4, -8, -10, -15]
#
#var reverb = AudioServer.get_bus_effect(1, 1)
#var reverb_vars = 'mdr'
#var reverb_values = [0.2, 0.1, 0.7, 0, 0.5, 0.4]


func play_music(music: AudioStream, volume: float = 0) -> void :
	if stream == music :
		return
		
	stream = music
	volume_db = volume
	play()

func stop_music() -> void :
	stop()

func toggle_reverb_effect() -> void :
	AudioServer.set_bus_effect_enabled(1, 0, true)
	AudioServer.set_bus_effect_enabled(1, 1, true)

func test_musik() -> void :
	play_music(preload("res://assets/musics/take_over.ogg")) 
	

func _process(delta: float) -> void:
	pass
