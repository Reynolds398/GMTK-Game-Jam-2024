extends CanvasLayer

var parent = null  # Parent object
var game_ui = null  # Game UI object

# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent()
	game_ui = parent.get_node("GameUI")

# Quit Button
func _on_quit_button_pressed():
	get_tree().quit()

# Reset game
func _on_restart_button_pressed():
	visible = false
	game_ui.reset_game()
