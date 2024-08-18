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

var enemy_queue = []  # Array to queue enemy for spawning
var rng = RandomNumberGenerator.new()  # Random Number Generator
@onready var spawn_timer = $SpawnTimer  # Timer object that spawns enemy when time out

# Dictionary for enemies
var enemy_dict = {
	1: beetle_m,
	2: beetle_r,
	3: boar,
	4: fox,
	5: pelican_m,
	6: pelican_r,
	7: wolf,
	8: wood_pecker_m,
	9: wood_pecker_r
}

## Called when the node enters the scene tree for the first time.
#func _ready():
#	var test = boar.instantiate()
#	test.init_start_end_pos(Vector2(27, 610), Vector2(522, 610))
#	test.RIGHT = false
#	add_child(test)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	print(enemy_queue.size())
	# Stop spawn timer if array is empty
	if enemy_queue.size() == 0:
		spawn_timer.stop()
	else:
		# Start timer if not started
		if spawn_timer.is_stopped():
			print("Timer start")
			spawn_timer.start()

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

# Function to spawn beetle melee (beetle melee = 1)
func spawn_beetle_m(amount):
	# Append to the queue the given amount of times
	for i in amount:
		enemy_queue.append(1)
		print(enemy_queue.size())

# Function to spawn beetle range (beetle range = 2)
func spawn_beetle_r(amount):
	# Append to the queue the given amount of times
	for i in amount:
		enemy_queue.append(2)

# Function to spawn boar (boar = 3)
func spawn_boar(amount):
	# Append to the queue the given amount of times
	for i in amount:
		enemy_queue.append(3)

# Function to spawn fox (fox = 4)
func spawn_fox(amount):
	# Append to the queue the given amount of times
	for i in amount:
		enemy_queue.append(4)

# Function to spawn pelican melee (pelican melee = 5)
func spawn_pelican_m(amount):
	# Append to the queue the given amount of times
	for i in amount:
		enemy_queue.append(5)

# Function to spawn pelican range (pelican range = 6)
func spawn_pelican_r(amount):
	# Append to the queue the given amount of times
	for i in amount:
		enemy_queue.append(6)

# Function to spawn wolf (wolf = 7)
func spawn_wolf(amount):
	# Append to the queue the given amount of times
	for i in amount:
		enemy_queue.append(7)

# Function to spawn wood pecker melee (wood pecker melee = 8)
func spawn_wood_pecker_m(amount):
	# Append to the queue the given amount of times
	for i in amount:
		enemy_queue.append(8)

# Function to spawn wood pecker range (wood pecker range = 9)
func spawn_wood_pecker_r(amount):
	# Append to the queue the given amount of times
	for i in amount:
		enemy_queue.append(9)

# Spawns enemy when time out
func _on_spawn_timer_timeout():
	# Get random index using RNG
	var index = rng.randi_range(0, enemy_queue.size() - 1)
	var enemy_id = enemy_queue.pop_at(index)
	
	var enemy = enemy_dict[enemy_id].instantiate()
	enemy.init_start_end_pos(spawn_left, end_m_left)
	enemy.RIGHT = true
	add_child(enemy)
	
