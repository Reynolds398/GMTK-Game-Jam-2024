extends Node2D

# Preload all mobs characters
var beetle_m = preload("res://Scenes/Mobs/Mob Characters/beetle_m.tscn")
var beetle_r = preload("res://Scenes/Mobs/Mob Characters/beetle_r.tscn")
var boar = preload("res://Scenes/Mobs/Mob Characters/boar.tscn")
var fox = preload("res://Scenes/Mobs/Mob Characters/fox.tscn")
var pelican_m = preload("res://Scenes/Mobs/Mob Characters/pelican_m.tscn")
var pelican_r = preload("res://Scenes/Mobs/Mob Characters/pelican_r.tscn")
var wolf = preload("res://Scenes/Mobs/Mob Characters/wolf.tscn")
var wood_pecker_m = preload("res://Scenes/Mobs/Mob Characters/wood_pecker_m.tscn")
var wood_pecker_r = preload("res://Scenes/Mobs/Mob Characters/wood_pecker_r.tscn")

# Right side
var spawn_right = Vector2.ZERO  # Variable to hold the spawn point of enemies
var end_m_right = Vector2.ZERO  # Variable to hold the end point of melee enemies
var end_r_right = Vector2.ZERO  # Variable to hold the end point of range enemies
var end_fly_m_right = Vector2.ZERO  # Variable to hold the end point of melee flying enemies
var end_fly_r_right = Vector2.ZERO  # Variable to hold the end point of range flying enemies

# Left side
var spawn_left = Vector2.ZERO  # Variable to hold the spawn point of enemies
var end_m_left = Vector2.ZERO  # Variable to hold the end point of melee enemies
var end_r_left = Vector2.ZERO  # Variable to hold the end point of range enemies
var end_fly_m_left = Vector2.ZERO  # Variable to hold the end point of melee flying enemies
var end_fly_r_left = Vector2.ZERO  # Variable to hold the end point of range flying enemies

## Called when the node enters the scene tree for the first time.
func _ready():
	var test = boar.instantiate()
	test.init_start_end_pos(Vector2(27, 610), Vector2(522, 610))
	test.RIGHT = true
	add_child(test)


## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# Function to initialize spawn points and end points for the right side
func init_variables_right(spawn, end_m, end_r, fly_m, fly_r):
	spawn_right = spawn
	end_m_right = end_m
	end_r_right = end_r
	end_fly_m_right = fly_m
	end_fly_r_right = fly_r

# Function to initialize spawn points and end points for the left side
func init_variables_left(spawn, end_m, end_r, fly_m, fly_r):
	spawn_left = spawn
	end_m_left = end_m
	end_r_left = end_r
	end_fly_m_left = fly_m
	end_fly_r_left = fly_r

# Function to spawn beetle melee
func spawn_beetle_m(amount):
	pass

# Function to spawn beetle range
func spawn_beetle_r(amount):
	pass

# Function to spawn boar
func spawn_boar(amount):
	pass

# Function to spawn fox
func spawn_fox(amount):
	pass

# Function to spawn pelican melee
func spawn_pelican_m(amount):
	pass

# Function to spawn pelican range
func spawn_pelican_r(amount):
	pass

# Function to spawn wolf
func spawn_wolf(amount):
	pass

# Function to spawn wood pecker melee
func spawn_wood_pecker_m(amount):
	pass

# Function to spawn wood pecker range
func spawn_wood_pecker_r(amount):
	pass
