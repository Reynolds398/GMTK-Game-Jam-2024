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
	#start_wave_1()

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
	spawn = Vector2(350,610)
	end_m = Vector2(557,610)
	end_r = Vector2(520,610)
	fly_m = Vector2(460,610)
	fly_r = Vector2(460,610)
	
	enemy_spawner.init_variables_left(spawn, end_m, end_r, fly_m, fly_r)
	
	# Set how many enemies spawn in this wave
	beetle_m = 20
	beetle_r = 0
	boar = 0
	fox = 0
	pelican_m = 0
	pelican_r = 0
	wolf = 0
	wood_pecker_m = 0
	wood_pecker_r = 0
	
	# Spawn the enemies
	enemy_spawner.set_initial_spawn_timer(2)  # How long it takes to spawn the first enemy
	enemy_spawner.set_spawn_timer(1.0)  # How long it takes to spawn the enemies
	enemy_spawner.left_only(20)
	#enemy_spawner.left_and_right()
	spawn_enemies()
	
func start_wave_2():
	# Initializing right side
	spawn = Vector2(847,610)
	end_m = Vector2(587,610)
	end_r = Vector2(635,610)
	fly_m = Vector2(520,610)
	fly_r = Vector2(520,610)
	
	enemy_spawner.init_variables_right(spawn, end_m, end_r, fly_m, fly_r)
	
	# Initializing left side
	spawn = Vector2(390,610)
	end_m = Vector2(557,610)
	end_r = Vector2(494,610)
	fly_m = Vector2(460,610)
	fly_r = Vector2(460,610)
	
	enemy_spawner.init_variables_left(spawn, end_m, end_r, fly_m, fly_r)
	
	# Set how many enemies spawn in this wave
	beetle_m = 41
	beetle_r = 56
	boar = 0
	fox = 0
	pelican_m = 0
	pelican_r = 0
	wolf = 0
	wood_pecker_m = 0
	wood_pecker_r = 0
	
	# Spawn the enemies
	enemy_spawner.set_initial_spawn_timer(2)  # How long it takes to spawn the first enemy
	enemy_spawner.set_spawn_timer(1.0)  # How long it takes to spawn the enemies
	#enemy_spawner.left_only()
	enemy_spawner.left_and_right(20,20)
	spawn_enemies()

func start_wave_3():
	# Initializing right side
	spawn = Vector2(897,610)
	end_m = Vector2(602,610)
	end_r = Vector2(665,610)
	fly_m = Vector2(602,510)
	fly_r = Vector2(665,510)
	
	enemy_spawner.init_variables_right(spawn, end_m, end_r, fly_m, fly_r)
	
	# Initializing left side
	spawn = Vector2(330,610)
	end_m = Vector2(542,610)
	end_r = Vector2(464,610)
	fly_m = Vector2(542,510)
	fly_r = Vector2(464,510)
	
	enemy_spawner.init_variables_left(spawn, end_m, end_r, fly_m, fly_r)
	
	# Set how many enemies spawn in this wave
	beetle_m = 60
	beetle_r = 60
	boar = 0
	fox = 30
	pelican_m = 0
	pelican_r = 0
	wolf = 0
	wood_pecker_m = 0
	wood_pecker_r = 0
	
	# Spawn the enemies
	enemy_spawner.set_initial_spawn_timer(2)  # How long it takes to spawn the first enemy
	enemy_spawner.set_spawn_timer(1.0)  # How long it takes to spawn the enemies
	#enemy_spawner.left_only()
	enemy_spawner.left_and_right(25,25)
	spawn_enemies()
	
func start_wave_4():
	# Initializing right side
	spawn = Vector2(1027,610)
	end_m = Vector2(622,610)
	end_r = Vector2(685,610)
	fly_m = Vector2(697,460)
	fly_r = Vector2(725,460)
	
	enemy_spawner.init_variables_right(spawn, end_m, end_r, fly_m, fly_r)
	
	# Initializing left side
	spawn = Vector2(100,610)
	end_m = Vector2(522,610)
	end_r = Vector2(444,610)
	fly_m = Vector2(512,460)
	fly_r = Vector2(404,460)
	
	enemy_spawner.init_variables_left(spawn, end_m, end_r, fly_m, fly_r)
	
	# Set how many enemies spawn in this wave
	beetle_m = 0
	beetle_r = 0
	boar = 0
	fox = 100
	pelican_m = 0
	pelican_r = 0
	wolf = 0
	wood_pecker_m = 50
	wood_pecker_r = 50
	
	# Spawn the enemies
	enemy_spawner.set_initial_spawn_timer(2)  # How long it takes to spawn the first enemy
	enemy_spawner.set_spawn_timer(1.0)  # How long it takes to spawn the enemies
	enemy_spawner.left_only(0)
	#enemy_spawner.left_and_right()
	spawn_enemies()
	
func start_wave_5():
	# Initializing right side
	spawn = Vector2(1027,610)
	end_m = Vector2(622,610)
	end_r = Vector2(685,610)
	fly_m = Vector2(697,460)
	fly_r = Vector2(725,460)
	
	enemy_spawner.init_variables_right(spawn, end_m, end_r, fly_m, fly_r)
	
	# Initializing left side
	spawn = Vector2(100,610)
	end_m = Vector2(522,610)
	end_r = Vector2(444,610)
	fly_m = Vector2(512,460)
	fly_r = Vector2(404,460)
	
	enemy_spawner.init_variables_left(spawn, end_m, end_r, fly_m, fly_r)
	
	# Set how many enemies spawn in this wave
	beetle_m = 0
	beetle_r = 0
	boar = 0
	fox = 0
	pelican_m = 0
	pelican_r = 0
	wolf = 100
	wood_pecker_m = 100
	wood_pecker_r = 100
	
	# Spawn the enemies
	enemy_spawner.set_initial_spawn_timer(2)  # How long it takes to spawn the first enemy
	enemy_spawner.set_spawn_timer(1.0)  # How long it takes to spawn the enemies
	enemy_spawner.left_only(0)
	#enemy_spawner.left_and_right()
	spawn_enemies()
	
func start_wave_6():
	# Initializing right side
	spawn = Vector2(1227,610)
	end_m = Vector2(687,610)
	end_r = Vector2(685,610)
	fly_m = Vector2(697,460)
	fly_r = Vector2(725,460)
	
	enemy_spawner.init_variables_right(spawn, end_m, end_r, fly_m, fly_r)
	
	# Initializing left side
	spawn = Vector2(-100,610)
	end_m = Vector2(437,610)
	end_r = Vector2(444,610)
	fly_m = Vector2(512,460)
	fly_r = Vector2(404,460)
	
	enemy_spawner.init_variables_left(spawn, end_m, end_r, fly_m, fly_r)
	
	# Set how many enemies spawn in this wave
	beetle_m = 0
	beetle_r = 0
	boar = 100
	fox = 0
	pelican_m = 50
	pelican_r = 50
	wolf = 100
	wood_pecker_m = 50
	wood_pecker_r = 50
	
	# Spawn the enemies
	enemy_spawner.set_initial_spawn_timer(2)  # How long it takes to spawn the first enemy
	enemy_spawner.set_spawn_timer(1.0)  # How long it takes to spawn the enemies
	enemy_spawner.left_only(0)
	#enemy_spawner.left_and_right()
	spawn_enemies()
	
func start_wave_7():
	# Initializing right side
	spawn = Vector2(1227,610)
	end_m = Vector2(727,610)
	end_r = Vector2(685,610)
	fly_m = Vector2(697,460)
	fly_r = Vector2(725,460)
	
	enemy_spawner.init_variables_right(spawn, end_m, end_r, fly_m, fly_r)
	
	# Initializing left side
	spawn = Vector2(-100,610)
	end_m = Vector2(397,610)
	end_r = Vector2(444,610)
	fly_m = Vector2(512,460)
	fly_r = Vector2(404,460)
	
	enemy_spawner.init_variables_left(spawn, end_m, end_r, fly_m, fly_r)
	
	# Set how many enemies spawn in this wave
	beetle_m = 0
	beetle_r = 100
	boar = 150
	fox = 50
	pelican_m = 100
	pelican_r = 100
	wolf = 150
	wood_pecker_m = 0
	wood_pecker_r = 0
	
	# Spawn the enemies
	enemy_spawner.set_initial_spawn_timer(2)  # How long it takes to spawn the first enemy
	enemy_spawner.set_spawn_timer(1.0)  # How long it takes to spawn the enemies
	enemy_spawner.left_only(0)
	#enemy_spawner.left_and_right()
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
	enemy_spawner.start_initial_spawn_timer() # Start the initial spawn timer
