extends CanvasLayer

var parent = null  # Parent object
var pause_menu = null  # Pause menu object
var game_ui = null  # Game UI object 
var cheat_tools = null  # Cheat tools object
var world = null  # World object
var wave_spawner = null  # Wave spawner object
var tree = null  # Tree object

# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent()
	pause_menu = parent.get_node("PauseMenu")
	game_ui = parent.get_node("GameUI")
	cheat_tools = parent.get_node("CheatTools")
	world = parent.get_node("World")
	wave_spawner = parent.get_node("WaveSpawner")
	tree = parent.get_node("Tree")

## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# Start the game
func _on_start_button_pressed():
	# Visibility trickery
	world.visible = true
	cheat_tools.visible = true
	game_ui.visible = true
	visible = false
	pause_menu.enable_toggle_pause()
	
	# Start wave 1
	wave_spawner.start_wave_1()
	tree.set_stage_1()

# Quit game
func _on_quit_button_pressed():
	get_tree().quit()
