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
var enable_both_side = false  # Boolean to let spawner know whether to spawn on both left and right side
var max_right = 0  # Number of how many units can spawn on the right side 
var max_left = 0  # Number of how many units can spawn on the left side 
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

# Dictionary for enemy types
# 0 stands for ground melee
# 1 stands for ground range
# 2 stands for flying melee
# 3 stands for flying range
var enemy_type_dict = {
	1: 0,
	2: 1,
	3: 0,
	4: 0,
	5: 2,
	6: 3,
	7: 0,
	8: 2,
	9: 3
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

# Allow spawner to spawn on both sides
func left_and_right(left, right):
	max_left = left
	max_right = right
	enable_both_side = true

# Only allow spawner to spawn on left side
func left_only(left):
	max_left = left
	enable_both_side = false

# Set how long it takes to spawn enemies
func set_spawn_timer(time):
	spawn_timer.wait_time = time

# Spawns enemy when time out
func _on_spawn_timer_timeout():
	# Get random enemy from enemy queue using RNG
	var index = rng.randi_range(0, enemy_queue.size() - 1)
	var enemy_id = enemy_queue.pop_at(index)
	
	# Spawn the enemy
	var enemy = enemy_dict[enemy_id].instantiate()
	
	# By default enemy spawn on the left
	var direction = 0
	
	# Get random direction (0 is left, 1 is right) if both side enabled
	if enable_both_side:
		print(max_left)
		print(max_right)
		
		# If left and right still can spawn
		if max_left > 0 and max_right > 0:
			direction = rng.randi_range(0, 1)
			
			# Keep track of how many units spawned on each side
			if direction == 0:
				max_left -= 1
			else:
				max_right -= 1
		
		# If only left can spawn
		if max_left > 0 and max_right == 0:
			max_left -= 1
			direction = 0
		
		# If only right can spawn
		if max_left == 0 and max_right > 0:
			max_right -= 1
			direction = 1
	
	# Spawn accordingly based on the enemy types
	match enemy_type_dict[enemy_id]:
		0: # 0 stands for ground melee
			if direction == 0: # Spawn on the left side
				enemy.init_start_end_pos(spawn_left, end_m_left)
			else: # Spawn on the right side
				enemy.init_start_end_pos(spawn_right, end_m_right)
		1: # 1 stands for ground range
			if direction == 0: # Spawn on the left side
				enemy.init_start_end_pos(spawn_left, end_r_left)
			else: # Spawn on the right side
				enemy.init_start_end_pos(spawn_right, end_r_right)
		2: # 2 stands for flying melee
			if direction == 0: # Spawn on the left side
				enemy.init_start_end_pos(spawn_left, end_fly_m_left)
			else: # Spawn on the right side
				enemy.init_start_end_pos(spawn_right, end_fly_m_left)
		3: # 3 stands for flying range
			if direction == 0: # Spawn on the left side
				enemy.init_start_end_pos(spawn_left, end_fly_r_left)
			else: # Spawn on the right side
				enemy.init_start_end_pos(spawn_right, end_fly_r_right)
	
	if direction == 0: # Enemy face right if spawn on the left
		enemy.RIGHT = true
	else: # Enemy face left if spawn on the right
		enemy.RIGHT = false
	
	add_child(enemy)
	
