extends CanvasLayer


var from_main_menu = false  # Boolean to know if settings is pressed from main menu
var from_pause_menu = false  # Boolean to know if settings is pressed from pause menu

var parent = null  # Parent object
var main_menu = null  # Main menu object
var pause_menu = null  # Pause menu object¥

func _ready():
	parent = get_parent()
	main_menu = parent.get_node("MainMenu")
	pause_menu = parent.get_node("PauseMenu")

# Function to call from main_menu
func come_from_main_menu():
	main_menu.visible = false
	from_main_menu = true
	visible = true

# Function to call from pause menu
func come_from_pause_menu():
	pause_menu.visible = false
	from_pause_menu = true
	visible = true

# Go back to previous menu
func _on_back_button_pressed():
	if from_main_menu:
		main_menu.visible = true
	
	if from_pause_menu:
		pause_menu.visible = true
	
	visible = false
	from_main_menu = false
	from_pause_menu = false

# Change volume of game based on slider
func _on_h_slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
