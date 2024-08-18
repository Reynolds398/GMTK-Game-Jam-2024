extends Node2D

var parent = null  # Parent object
var enemy_spawner = null  # Enemy spawner object

# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent()
	enemy_spawner = parent.get_node("EnemySpawner")

# Function to start wave 1
func start_wave_1():
	pass
