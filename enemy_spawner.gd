extends Node2D

# Preload all mobs characters
var beetle_m = preload("res://Scenes/Mobs/Mob Characters/beetle_m.tscn")
var bettle_r = preload("res://Scenes/Mobs/Mob Characters/beetle_r.tscn")
var boar = preload("res://Scenes/Mobs/Mob Characters/boar.tscn")
var fox = preload("res://Scenes/Mobs/Mob Characters/fox.tscn")
var pelican_m = preload("res://Scenes/Mobs/Mob Characters/pelican_m.tscn")
var pelican_r = preload("res://Scenes/Mobs/Mob Characters/pelican_r.tscn")
var wolf = preload("res://Scenes/Mobs/Mob Characters/wolf.tscn")
var wood_pecker_m = preload("res://Scenes/Mobs/Mob Characters/wood_pecker_m.tscn")
var wood_pecker_r = preload("res://Scenes/Mobs/Mob Characters/wood_pecker_r.tscn")

var spawn_point = Vector2.ZERO  # Variable to hold the spawn point of enemies
var end_point_m = Vector2.ZERO  # Variable to hold the end point of melee enemies
var end_point_r = Vector2.ZERO  # Variable to hold the end point of range enemies
var end_point_fly_m = Vector2.ZERO  # Variable to hold the end point of melee flying enemies
var end_point_fly_r = Vector2.ZERO  # Variable to hold the end point of range flying enemies

## Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# Function to spawn beetle melee
func spawn_beetle_m():
	pass

# Function to spawn beetle range
func spawn_beetle_r():
	pass

# Function to spawn boar
func spawn_boar():
	pass

# Function to spawn fox
func spawn_fox():
	pass

# Function to spawn pelican melee
func spawn_pelican_m():
	pass

# Function to spawn pelican range
func spawn_pelican_r():
	pass

# Function to spawn wolf
func spawn_wolf():
	pass

# Function to spawn wood pecker melee
func spawn_wood_pecker_m():
	pass

# Function to spawn wood pecker range
func spawn_wood_pecker_r():
	pass
