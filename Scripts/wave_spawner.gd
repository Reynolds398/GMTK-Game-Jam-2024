extends Node2D

var parent = null  # Parent object
var enemy_spawner = null  # Enemy spawner object

# Variables to hold spawn and end points of enemies (all in Vector2)
var spawn = Vector2.ZERO
var end_m = Vector2.ZERO
var end_r = Vector2.ZERO
var fly_m = Vector2.ZERO
var fly_r = Vector2.ZERO

# Numbers of total enemies in a certain wave
var beetle_m = 0
var beetle_r = 0
var boar = 0
var fox = 0
var pelican_m = 0
var pelican_r = 0
var wolf = 0
var wood_pecker_m = 0
var wood_pecker_r = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent()
	enemy_spawner = parent.get_node("EnemySpawner")
	start_wave_1()

# Function to start wave 1
func start_wave_1():
	# Initializing right side
	spawn = Vector2(600,610)
	end_m = Vector2(520,610)
	end_r = Vector2(520,610)
	fly_m = Vector2(520,610)
	fly_r = Vector2(520,610)
	
	enemy_spawner.init_variables_right(spawn, end_m, end_r, fly_m, fly_r)
	
	# Initializing left side
	spawn = Vector2(300,610)
	end_m = Vector2(460,610)
	end_r = Vector2(460,610)
	fly_m = Vector2(460,610)
	fly_r = Vector2(460,610)
	
	enemy_spawner.init_variables_left(spawn, end_m, end_r, fly_m, fly_r)
	
	# Set how many enemies spawn in this wave
	beetle_m = 2
	beetle_m = 0
	beetle_r = 0
	boar = 0
	fox = 0
	pelican_m = 0
	pelican_r = 0
	wolf = 0
	wood_pecker_m = 0
	wood_pecker_r = 0
	
	# Spawn the enemies
	spawn_enemies()

# Function to spawn enemies based on the settings
func spawn_enemies():
	enemy_spawner.spawn_beetle_m(beetle_m)
	enemy_spawner.spawn_beetle_r(beetle_r)
	enemy_spawner.spawn_boar(boar)
	enemy_spawner.spawn_fox(fox)
	enemy_spawner.spawn_pelican_m(pelican_m)
	enemy_spawner.spawn_pelican_r(pelican_r)
	enemy_spawner.spawn_wolf(wolf)
	enemy_spawner.spawn_wood_pecker_m(wood_pecker_m)
	enemy_spawner.spawn_wood_pecker_r(wood_pecker_r)
