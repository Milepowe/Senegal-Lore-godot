extends HSlider

# ca marche pas donc allez fix jsp
func music_slider(music_value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), music_value)
	pass
