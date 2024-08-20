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
var p_reload = 0
var c_reload = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	camera.position = Vector2(0, 800)
	camera.zoom = Vector2(0.5,0.5)
	camera.limit_bottom = 625
	
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
	current_stage.send_enable_signal()
	current_stage.get_node("CollisionShape2D").disabled = false

# Function to set variables for stage 1
func set_stage_1():
	print("stage 1")
	# Camera update here
	camera.zoom = Vector2(4,4)
	camera.limit_bottom = 620
	
	stage_1.update_stage_1()
	set_stage(stage_1)

# Function to set variables for stage 2
func set_stage_2():
	print("stage 2")
	# Camera update here
	camera.zoom = Vector2(3.75,3.75)
	camera.limit_bottom = 625
	
	set_stage(stage_2)

# Function to set variables for stage 3
func set_stage_3():
	print("stage 3")
	# Camera update here
	camera.zoom = Vector2(3,3)
	camera.limit_bottom = 630
	
	set_stage(stage_3)
	
# Function to set variables for stage 4
func set_stage_4():
	print("stage 4")
	# Camera update here
	camera.zoom = Vector2(2.5,2.5)
	camera.limit_bottom = 630
	
	set_stage(stage_4)

# Function to set variables for stage 5
func set_stage_5():
	print("stage 5")
	# Camera update here
	camera.zoom = Vector2(1.8,1.8)
	camera.limit_bottom = 635
	
	set_stage(stage_5)

# Function to set variables for stage 6
func set_stage_6():
	print("stage 6")
	# Camera update here
	camera.zoom = Vector2(1.3,1.3)
	camera.limit_bottom = 640
	
	set_stage(stage_6)

# Function to set variables for stage 7
func set_stage_7():
	print("stage 7")
	
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

# Function to make tree take damage
func take_damage(amount):
	get_parent().get_node("GameUI").decrease_health(amount)

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

func upgrade(upgrade_name):
	match upgrade_name:
		"p_dmg":
			upgrade_p_dmg()

# Function to reset variables to default
func reset_stage():
	CUR_TREE_STAGE = 0
	reset_upgrade_var()
	reset_upgrade_progress()

# Reset all upgrade progress
func reset_upgrade_progress():
	upgrade_p_dmg(true)

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
	p_reload = 0
	c_reload = 0
