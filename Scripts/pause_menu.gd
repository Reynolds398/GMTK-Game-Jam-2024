extends CanvasLayer

var can_toggle_pause = false  # Whether you can pause the game or not
var main_menu = null  # Main menu object

# Called when the node enters the scene tree for the first time.
func _ready():
	main_menu = get_parent().get_node("MainMenu")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Pause when escape is pressed
	if Input.is_action_just_pressed("game_pause"):
		if not get_tree().paused:
			pause()
		else:
			resume()

# Resume game
func _on_resume_button_pressed():
	resume()

# Function to pause the game only when it is allowed
func pause():
	if can_toggle_pause:
		visible = true
		get_tree().set_deferred("paused", true)

# Function to resume the game only when it is allowed
func resume():
	if can_toggle_pause:
		visible = false
		get_tree().set_deferred("paused", false)

# Set can toggle pause to true
func enable_toggle_pause():
	can_toggle_pause = true

# Set can toggle pause to false
func disable_toggle_pause():
	can_toggle_pause = false

# Quit game
func _on_quit_button_pressed():
	get_tree().quit()
