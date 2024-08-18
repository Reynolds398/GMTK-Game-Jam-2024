extends Node2D

var parent = null  # Parent object
var enemy_spawner = null  # Enemy spawner object

# Variables to hold spawn and end points of enemies (all in Vector2)
var spawn = Vector2.ZERO
var end_m = Vector2.ZERO
var end_r = Vector2.ZERO
var fly_m = Vector2.ZERO
var fly_r = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent()
	enemy_spawner = parent.get_node("EnemySpawner")

# Function to start wave 1
func start_wave_1():
	# Initializing right side
	spawn = Vector2.ZERO
	end_m = Vector2.ZERO
	end_r = Vector2.ZERO
	fly_m = Vector2.ZERO
	fly_r = Vector2.ZERO
	
	enemy_spawner.init_variables_right(spawn, end_m, end_r, fly_m, fly_r)
	
	# Initializing left side
	spawn = Vector2.ZERO
	end_m = Vector2.ZERO
	end_r = Vector2.ZERO
	fly_m = Vector2.ZERO
	fly_r = Vector2.ZERO
	
	enemy_spawner.init_variables_left(spawn, end_m, end_r, fly_m, fly_r)
