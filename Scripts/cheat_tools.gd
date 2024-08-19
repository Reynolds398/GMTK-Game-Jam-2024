extends CanvasLayer

var parent = null  # Parent object
var game_ui = null  # Game UI object
var tree = null  # Tree object

# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent()
	game_ui = parent.get_node("GameUI")
	tree = parent.get_node("Tree")

## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# Function for adding gold
func _on_add_gold_button_pressed():
	game_ui.add_currency(10000)

# Function for spending gold
func _on_spend_gold_button_pressed():
	game_ui.spend_currency(10000)

# Function for adding health
func _on_add_health_button_pressed():
	game_ui.add_health(10)

# Function for decreasing health
func _on_minus_health_button_pressed():
	game_ui.decrease_health(10)

# Function for switching to stage 1
func _on_stage_1_button_pressed():
	tree.set_stage_1()

# Function for switching to stage 2
func _on_stage_2_button_pressed():
	tree.set_stage_2()

# Function for switching to stage 3
func _on_stage_3_button_pressed():
	tree.set_stage_3()

# Function for switching to stage 4
func _on_stage_4_button_pressed():
	tree.set_stage_4()

# Function for switching to stage 5
func _on_stage_5_button_pressed():
	tree.set_stage_5()

# Function for switching to stage 6
func _on_stage_6_button_pressed():
	tree.set_stage_6()

# Function for switching to stage 7
func _on_stage_7_button_pressed():
	tree.set_stage_7()
