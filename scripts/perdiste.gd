extends Node2D

# Called when the scene is ready
func _ready():
	# Display the final score in a Label node called "score"
	get_node("score").set_text("No lo haz conseguido " + str(Globales.puntaje) + " Preguntas Correctas de " + str(Globales.dificultad))

# Called when the retry or return button is pressed
func _on_button_pressed():
	Globales.ban.clear()               # Clear the list of used questions
	Globales.puntaje = 0               # Reset score
	Globales.pregunta_actual = 0       # Reset current question index
	get_tree().change_scene_to_file("res://escenas/menu.tscn")  # Go back to main menu
