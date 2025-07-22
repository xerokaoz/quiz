extends Node

# Global variables to track game state
var dificultad = 10        # Total number of questions
var puntaje = 0            # Player's score
var pregunta_actual = 0    # Index of the current question
var ban = []               # List to store the indices of selected questions

# Preload sound effects for correct and incorrect answers
var sonido_correcto = preload("res://musica y sonidos/correct.wav")
var sonido_incorrecto = preload("res://musica y sonidos/incorrect.wav")

# Function to generate unique random questions
func Generar_Preguntas():
	randomize()  # Seed the random number generator
	while ban.size() < dificultad:
		var nueva_pregunta = randi_range(0,34)  # Pick a random question index
		if nueva_pregunta not in ban:
			ban.append(nueva_pregunta)  # Add it if it's not already in the list

# Function to evaluate the selected answer
func respuestas(opcion:String, numeroP:int):
	var bien = Cuestionario.itemData["preguntas_one_piece"][numeroP]["respuesta_correcta"]  # Get the correct answer
	if (bien == opcion):
		puntaje = puntaje + 1  # Increase score if answer is correct
		reproducir_sonido(sonido_correcto)  # Play correct sound
	else:
		reproducir_sonido(sonido_incorrecto)  # Play incorrect sound
		
	pregunta_actual = pregunta_actual + 1  # Move to the next question
	
	# Check if there are more questions
	if pregunta_actual < ban.size():
		get_tree().reload_current_scene()  # Reload current scene to show next question
	else:
		# If score is more than half, player wins; otherwise, loses
		if (puntaje > round(dificultad / 2)):
			get_tree().change_scene_to_file("res://escenas/Ganaste.tscn")
		else:
			get_tree().change_scene_to_file("res://escenas/perdiste.tscn")

# Function to play a sound effect
func reproducir_sonido(stream: AudioStream) -> void:
	var sfx = AudioStreamPlayer.new()               # Create a new audio player
	get_tree().get_root().add_child(sfx)            # Add it to the scene tree
	sfx.stream = stream                             # Assign the sound stream
	sfx.play()                                      # Play the sound
	await sfx.finished                              # Wait until the sound finishes (Godot 4.2+ only)
	sfx.queue_free()                                # Remove the player node after playback
	
		
