extends Control

# Called when the "Facil" (Easy) button is pressed
func _on_facil_pressed():
	mostrar_aviso("Dificultad: Fácil")  # Show message
	Globales.dificultad = 10           # Set global difficulty

# Called when the "Normal" button is pressed
func _on_normal_pressed():
	mostrar_aviso("Dificultad: Normal")  # Show message
	Globales.dificultad = 15             # Set global difficulty

# Called when the "Dificil" (Hard) button is pressed
func _on_dificil_pressed():
	mostrar_aviso("Dificultad: Difícil")  # Show message
	Globales.dificultad = 20              # Set global difficulty

# Called when the "Regresar" (Back) button is pressed
func _on_regresar_pressed():
	get_tree().change_scene_to_file("res://escenas/menu.tscn")  # Change to main menu scene

# Function to display a temporary message on screen
func mostrar_aviso(texto: String):
	var aviso = $aviso                 # Reference to the "aviso" UI element
	aviso.text = texto                # Set the text
	aviso.visible = true              # Make it visible
	
	await get_tree().create_timer(2.0).timeout  # Wait 2 seconds
	aviso.visible = false            # Hide the message
