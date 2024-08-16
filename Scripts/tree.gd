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

# Called when the node enters the scene tree for the first time.
func _ready():
	camera.position = Vector2(0, 800)
	camera.zoom = Vector2(8,8)
	camera.limit_bottom = 625


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# For debugging purposes (press space to go to next stage)
	if Input.is_action_just_pressed("ui_accept"):
		if CUR_TREE_STAGE < MAX_TREE_STAGE:
			CUR_TREE_STAGE += 1
			next_stage(CUR_TREE_STAGE)

# Function to set variables for stage 1
func set_stage_1():
	print("stage 1")
	# Camera update here
	camera.zoom = Vector2(8,8)
	camera.limit_bottom = 620
	
	# If stage has not been set
	if current_stage == null:
		stage_1.visible = true
	else: # If stage has been set
		stage_1.visible = true
		current_stage.visible = false
		current_stage = stage_1

# Function to set variables for stage 2
func set_stage_2():
	print("stage 2")
	# Camera update here
	camera.zoom = Vector2(4.5,4.5)
	camera.limit_bottom = 625
	
	# If stage has not been set
	if current_stage == null:
		stage_2.visible = true
	else: # If stage has been set
		stage_2.visible = true
		current_stage.visible = false
		current_stage = stage_2

# Function to set variables for stage 3
func set_stage_3():
	print("stage 3")
	# Camera update here
	camera.zoom = Vector2(3,3)
	camera.limit_bottom = 630
	
	# If stage has not been set
	if current_stage == null:
		stage_3.visible = true
	else: # If stage has been set
		stage_3.visible = true
		current_stage.visible = false
		current_stage = stage_3

# Function to set variables for stage 4
func set_stage_4():
	print("stage 4")
	# Camera update here
	camera.zoom = Vector2(2.5,2.5)
	camera.limit_bottom = 630
	
	# If stage has not been set
	if current_stage == null:
		stage_4.visible = true
	else: # If stage has been set
		stage_4.visible = true
		current_stage.visible = false
		current_stage = stage_4

# Function to set variables for stage 5
func set_stage_5():
	print("stage 5")
	# Camera update here
	camera.zoom = Vector2(2,2)
	camera.limit_bottom = 635
	
	# If stage has not been set
	if current_stage == null:
		stage_5.visible = true
	else: # If stage has been set
		stage_5.visible = true
		current_stage.visible = false
		current_stage = stage_5

# Function to set variables for stage 6
func set_stage_6():
	print("stage 6")
	# Camera update here
	camera.zoom = Vector2(1.5,1.5)
	camera.limit_bottom = 640
	
	# If stage has not been set
	if current_stage == null:
		stage_6.visible = true
	else: # If stage has been set
		stage_6.visible = true
		current_stage.visible = false
		current_stage = stage_6

# Function to set variables for stage 7
func set_stage_7():
	print("stage 7")
	
	# Camera update here
	camera.zoom = Vector2(1.2,1.2)
	camera.limit_bottom = 640
	
	# If stage has not been set
	if current_stage == null:
		stage_7.visible = true
	else: # If stage has been set
		stage_7.visible = true
		current_stage.visible = false
		current_stage = stage_7

# Function to deal with stage transitions
func next_stage(current_stage_num):
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
