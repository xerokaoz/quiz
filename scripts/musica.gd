extends Node

# Array containing preloaded audio tracks for the playlist
var playlist: Array[AudioStream] = [
	preload("res://musica y sonidos/1.ogg"),
	preload("res://musica y sonidos/3.ogg"),
	preload("res://musica y sonidos/4.ogg"),
	preload("res://musica y sonidos/2.ogg"),
]

# Index to track the current song in the playlist
var current_index := 0

# Function to start the music playlist
func start_music():
	randomize()  # Randomize seed (optional here, but useful if shuffling later)
	play_current_song()  # Start playing the first song
	$AudioPlayer.finished.connect(_on_song_finished)  # Connect signal when a song finishes

# Function to play the current song
func play_current_song():
	$AudioPlayer.stream = playlist[current_index]  # Set the audio stream
	$AudioPlayer.play()  # Start playback

# Callback when the current song finishes
func _on_song_finished():
	current_index = (current_index + 1) % playlist.size()  # Go to the next song, loop back to start if needed
	play_current_song()  # Play the next song
