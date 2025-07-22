extends Control

# Called when the "Comenzar" (Start) button is pressed
func _on_comenzar_pressed():
	MusicManager.start_music()                        # Start background music
	Globales.Generar_Preguntas()                     # Generate the list of questions
	get_tree().change_scene_to_file("res://escenas/juego.tscn")  # Change to the main game scene

# Called when the "Dificultad" (Difficulty) button is pressed
func _on_dificultad_pressed():
	get_tree().change_scene_to_file("res://escenas/dificultad.tscn")  # Change to difficulty selection scene

# Called when the "Créditos" (Credits) button is pressed
func _on_creditos_pressed():
	pass  # Placeholder for future credits functionality

# Called when the "Salir" (Exit) button is pressed
func _on_salir_pressed():
	get_tree().quit()  # Quit the game
