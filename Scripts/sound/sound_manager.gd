extends Node
# Thios Script will be SINGLETON so put in Autoload section
const SoundScript = preload("res://SCRIPTS/sound/sound.gd")

func play_sound(sound):
	
	
	var audio_stream_player = AudioStreamPlayer.new() # create new instance of AudioStream

	audio_stream_player.set_script(SoundScript) # Attach script to object
	audio_stream_player.stream = sound # Add sound
	
	#put on the stage  u don't need to use get_tree().current_scene.add_child() 'cuz this is a Sinlgeton 
	add_child(audio_stream_player)
	
	audio_stream_player.play()    #play the sound
