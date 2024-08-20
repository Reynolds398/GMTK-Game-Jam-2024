extends Node2D

@export var CUR_TREE_STAGE = 0  # Variable to keep track of which stage the tree is in
@export var MAX_TREE_STAGE = 7  # Variable that states the max stage for the tree

@onready var camera = $TreeCamera  # Camera variable
# Stages variable
@onready var stage_1 = $"Stage 1"
@onready var stage_2 = $"Stage 2"
@onready var stage_3 = $"Stage 3"
@onready var stage_4 = $"Stage 4"
@onready var stage_5 = $"Stage 5"
@onready var stage_6 = $"Stage 6"
@onready var stage_7 = $"Stage 7"

var current_stage = null  # Variable to keep track of the current stage object
var upgrade_ui = null  # Upgrade UI object
#var i = 0

# Upgrade tracker for each upgrades
var p_left = 1
var c_left = 0
var b_left = 0
var p_right = 0
var c_right = 0
var b_right = 0
var p_dmg = 0
var c_dmg = 0
var p_size = 0
var c_size = 0
var b_size = 0
var p_reload = 0
var c_reload = 0
var b_reload = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	camera.position = Vector2(0, 800)
	camera.zoom = Vector2(0.5,0.5)
	camera.limit_bottom = 625
	
	upgrade_ui = get_parent().get_node("UpgradeUI")
	reset_stage()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# For debugging purposes (press space to go to next stage)
#	if Input.is_action_just_pressed("ui_accept"):
#		if i == 0:
#			stage_1.send_enable_signal()
#		if i == 1:
#			stage_1.send_disable_signal()
#
#		i = (i + 1) % 2
	pass

# Given the stage, transition to the next stage
func set_stage(stage):
	# Turn off the previous stage (if it exists)
	if current_stage != null:
		current_stage.visible = false
		current_stage.send_disable_signal()
		current_stage.get_node("CollisionShape2D").disabled = true
	
	# Turn on the next stage
	stage.visible = true
	current_stage = stage
	#current_stage.send_enable_signal()
	current_stage.get_node("CollisionShape2D").disabled = false

# Function to set variables for stage 1
func set_stage_1():
	print("stage 1")
	CUR_TREE_STAGE = 1
	
	# Camera update here
	camera.zoom = Vector2(4,4)
	camera.limit_bottom = 620
	
	stage_1.update_stage_1()
	set_stage(stage_1)

# Function to set variables for stage 2
func set_stage_2():
	print("stage 2")
	CUR_TREE_STAGE = 2
	
	# Camera update here
	camera.zoom = Vector2(3.75,3.75)
	camera.limit_bottom = 625
	
	# Adding weapon slot upgrades to upgrades from stage 1
	upgrade_ui.append_upgrade("p_right", [1000])
	
	stage_2.update_stage_2()
	set_stage(stage_2)

# Function to set variables for stage 3
func set_stage_3():
	print("stage 3")
	CUR_TREE_STAGE = 3
	
	# Camera update here
	camera.zoom = Vector2(3,3)
	camera.limit_bottom = 630
	
	# Adding weapon slot upgrades to upgrades from stage 2
	upgrade_ui.append_upgrade("p_right", [2000])
	upgrade_ui.append_upgrade("p_left", [2000])
	
	stage_3.update_stage_3()
	set_stage(stage_3)
	
# Function to set variables for stage 4
func set_stage_4():
	print("stage 4")
	CUR_TREE_STAGE = 4
	
	# Camera update here
	camera.zoom = Vector2(2.5,2.5)
	camera.limit_bottom = 630
	# Adding weapon slot upgrades to upgrades from stage 3
	upgrade_ui.append_upgrade("c_right", [1000, 2000])
	upgrade_ui.append_upgrade("c_left", [1000, 2000])
	set_stage(stage_4)

# Function to set variables for stage 5
func set_stage_5():
	print("stage 5")
	CUR_TREE_STAGE = 5
	
	# Camera update here
	camera.zoom = Vector2(1.8,1.8)
	camera.limit_bottom = 635
	# Adding weapon slot upgrades to upgrades from stage 4
	upgrade_ui.append_upgrade("c_right", [3000, 4000, 5000, 6000, 7000])
	upgrade_ui.append_upgrade("c_left", [3000, 4000, 5000, 6000, 7000])
	upgrade_ui.append_upgrade("b_right", [3000])
	upgrade_ui.append_upgrade("b_left", [3000])
	
	set_stage(stage_5)

# Function to set variables for stage 6
func set_stage_6():
	print("stage 6")
	CUR_TREE_STAGE = 6
	
	# Camera update here
	camera.zoom = Vector2(1.3,1.3)
	camera.limit_bottom = 640
	
	set_stage(stage_6)

# Function to set variables for stage 7
func set_stage_7():
	print("stage 7")
	CUR_TREE_STAGE = 7
	
	# Camera update here
	camera.zoom = Vector2(1,1)
	camera.limit_bottom = 640
	
	set_stage(stage_7)

# Function to deal with stage transitions
func next_stage():
	CUR_TREE_STAGE += 1
	
	match CUR_TREE_STAGE:
		1:
			set_stage_1()
		2:
			set_stage_2()
		3:
			set_stage_3()
		4:
			set_stage_4()
		5:
			set_stage_5()
		6:
			set_stage_6()
		7:
			set_stage_7()
	
	refresh_upgrade_progress()

# Function to make tree take damage
func take_damage(amount):
	get_parent().get_node("GameUI").decrease_health(amount)

# General upgrade function that takes in the function name
func upgrade(upgrade_name):
	match upgrade_name:
		"p_dmg":
			upgrade_p_dmg()
		"p_size":
			upgrade_p_size()
		"p_reload":
			upgrade_p_reload()
		"c_dmg":
			upgrade_c_dmg()
		"c_size":
			upgrade_c_size()
		"c_reload":
			upgrade_c_reload()
		"b_reload":
			upgrade_b_reload()
		"b_size":
			upgrade_b_size()
		"p_left":
			upgrade_p_left()
		"p_right":
			upgrade_p_right()
	
	refresh_stage()

# Refresh stage (to check if any weapons are added)
func refresh_stage():
	match CUR_TREE_STAGE:
		1:
			current_stage.update_stage_1()
		2:
			current_stage.update_stage_2()
		3:
			current_stage.update_stage_3()
		4:
			current_stage.update_stage_4()
		5:
			current_stage.update_stage_5()
		6:
			current_stage.update_stage_6()
		7:
			current_stage.update_stage_7()

# Function to deal with upgrading pea guns damage
func upgrade_p_dmg(reset = false):
	if not reset:
		p_dmg += 1
	
	# Null check
	if current_stage != null:
		match p_dmg:
			0: # Default damage
				current_stage.upgrade_p_dmg(20)
			1: # First level of upgrade
				current_stage.upgrade_p_dmg(40)

# Function to deal with upgrading pea guns size
func upgrade_p_size(reset = false):
	if not reset:
		p_size += 1
	
	# Null check
	if current_stage != null:
		match p_size:
			0: # Default size
				current_stage.upgrade_p_size(Vector2(1,1))
			1: # First level of upgrade
				current_stage.upgrade_p_size(Vector2(2,2))

# Function to deal with upgrading pea guns fire rate
func upgrade_p_reload(reset = false):
	if not reset:
		p_reload += 1
	
	# Null check
	if current_stage != null:
		match p_reload:
			0: # Default speed
				current_stage.upgrade_p_reload(1.0)
			1: # First level of upgrade
				current_stage.upgrade_p_reload(0.75)

# Function to deal with upgrading catapult damage
func upgrade_c_dmg(reset = false):
	if not reset:
		c_dmg += 1
	
	# Null check
	if current_stage != null:
		match c_dmg:
			0: # Default speed
				current_stage.upgrade_c_dmg(20)
			1: # First level of upgrade
				current_stage.upgrade_c_dmg(40)

# Function to deal with upgrading catapult fire rate
func upgrade_c_reload(reset = false):
	if not reset:
		c_reload += 1
	
	# Null check
	if current_stage != null:
		match c_reload:
			0: # Default speed
				current_stage.upgrade_c_reload(1.0)
			1: # First level of upgrade
				current_stage.upgrade_c_reload(0.75)

# Function to deal with upgrading catapult size
func upgrade_c_size(reset = false):
	if not reset:
		c_size += 1
	
	# Null check
	if current_stage != null:
		match c_size:
			0: # Default speed
				current_stage.upgrade_c_size(Vector2(1,1))
			1: # First level of upgrade
				current_stage.upgrade_c_size(Vector2(5,5))

# Function to deal with upgrading boulder fire rate
func upgrade_b_reload(reset = false):
	if not reset:
		b_reload += 1
	
	# Null check
	if current_stage != null:
		match b_reload:
			0: # Default speed
				current_stage.upgrade_b_reload(1.0)
			1: # First level of upgrade
				current_stage.upgrade_b_reload(0.75)

# Function to deal with upgrading catapult size
func upgrade_b_size(reset = false):
	if not reset:
		b_size += 1
	
	# Null check
	if current_stage != null:
		match b_size:
			0: # Default speed
				current_stage.upgrade_b_size(Vector2(1,1))
			1: # First level of upgrade
				current_stage.upgrade_b_size(Vector2(10,10))

# Add p_left count by 1
func upgrade_p_left():
	print("p_left")
	p_left += 1

# Add p_right count by 1
func upgrade_p_right():
	print("p_right")
	p_right += 1

# Function to reset variables to default
func reset_stage():
	CUR_TREE_STAGE = 0
	reset_upgrade_var()
	refresh_upgrade_progress()

# Refresh all upgrade progress (does not increase the upgrade if reset is true)
func refresh_upgrade_progress(reset = true):
	upgrade_p_dmg(reset)
	upgrade_p_size(reset)
	upgrade_p_reload(reset)
	upgrade_c_dmg(reset)
	upgrade_c_reload(reset)
	upgrade_c_size(reset)
	upgrade_b_reload(reset)
	upgrade_b_size(reset)

# Reset upgrade variable to default position
func reset_upgrade_var():
	p_left = 1
	c_left = 0
	b_left = 0
	p_right = 0
	c_right = 0
	b_right = 0
	p_dmg = 0
	c_dmg = 0
	p_size = 0
	c_size = 0
	b_size = 0
	p_reload = 0
	c_reload = 0
	b_reload = 0
