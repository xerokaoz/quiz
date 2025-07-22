extends Node2D

func _ready():
	# When the scene is ready, update the "score" label with the player's result
	get_node("score").set_text("lograste haz conseguido "+ str(Globales.puntaje) + " Preguntas Correctas de " + str(Globales.dificultad))
