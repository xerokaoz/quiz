extends Node2D

func _ready():
	# Get references to the UI elements
	var Pregunta = get_node("Pregunta")
	var Puntaje = get_node("Puntaje")
	var OpcionA = get_node("OpcionA")
	var OpcionB = get_node("OpcionB")
	var OpcionC = get_node("OpcionC")
	var OpcionD = get_node("OpcionD")
	
	# Get the index of the current question from the global list
	var pregunta_indice = Globales.ban[Globales.pregunta_actual]
	
	# Update the score and question text
	Puntaje.set_text("Puntaje: " + str(Globales.puntaje))
	Pregunta.set_text(Cuestionario.itemData["preguntas_one_piece"][pregunta_indice]["pregunta"])
	
	# Set the text for each option button
	OpcionA.set_text(Cuestionario.itemData["preguntas_one_piece"][pregunta_indice]["opciones"]["A"])
	OpcionB.set_text(Cuestionario.itemData["preguntas_one_piece"][pregunta_indice]["opciones"]["B"])
	OpcionC.set_text(Cuestionario.itemData["preguntas_one_piece"][pregunta_indice]["opciones"]["C"])
	OpcionD.set_text(Cuestionario.itemData["preguntas_one_piece"][pregunta_indice]["opciones"]["D"])

# When option A is pressed, send "A" as the answer
func _on_opcion_a_pressed():
	Globales.respuestas("A", Globales.ban[Globales.pregunta_actual])

# When option B is pressed, send "B" as the answer
func _on_opcion_b_pressed():
	Globales.respuestas("B", Globales.ban[Globales.pregunta_actual])

# When option C is pressed, send "C" as the answer
func _on_opcion_c_pressed():
	Globales.respuestas("C", Globales.ban[Globales.pregunta_actual])

# When option D is pressed, send "D" as the answer
func _on_opcion_d_pressed():
	Globales.respuestas("D", Globales.ban[Globales.pregunta_actual])
